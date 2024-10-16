/* works OK as a filter to run commands that require a pseudotty */
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <errno.h>
#include <pty.h>
#include <utmp.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/select.h>
#include <poll.h>


#define MAXPATH 8192
#define MAXLINE 8192

#define ERROR -1
#define OK 0

/**
 * void finish(int status)
 *
 *  finish the program. If status is ERROR, kill the child, wait for it
 * and output its status. If status is OK, wait for the child to die and
 * output its status.
 */
void finish(int status) {

    if (status == OK)
    	wait(&status);
    exit(status);
}

int main(int argc, char *argv[])
{
    int master_fd, child_pid;
    char slave_name[MAXPATH];

    if (argc == 1) {
	printf("usage: pty command\n");
	exit(ERROR);
    }

    child_pid = forkpty(&master_fd, slave_name, NULL, NULL);
    if (child_pid == -1) {
	fprintf(stderr, "Could not fork with a new pty\n");
	exit(ERROR);
    }
    if (child_pid == 0) {
	FILE *f;
	/* I am the child */
	/*  everything has already been set up for me (in, out, err) */
	/* exec program with arguments */
	if (execv(argv[1], &argv[1]) == -1) {
	    fprintf(stderr, "Error: could not execute %s\n", argv[1]);
	    exit(ERROR);
	}

    } else {
	/* I am the parent */
	/*  my problem is to provide a tunnel to the child without hanging on any file descriptor */
	fd_set writeset, readset, wr, rd;
	struct pollfd pfds[2];
	int status;
	int ch;


	/* test unidirectional behaviour child->user * /
	do {
	    status = read(master_fd, &ch, 1);
	    write(1, &ch, 1);
	} while (status != -1);
	close(master_fd);
	wait(&status);
	printf("\nstatus: %d\n", status);
	exit(status);
	/ * OK */

	/* test unidirectional behaviour user->child * /
	do {
	    if (feof(stdin))
		exit(OK);
	    status = read(0, &ch, 1);
	    printf(" got '%c'\n", ch);
	    write(master_fd, &ch, 1);
	} while ((status != -1) && (status != 0));
	close(master_fd);
	wait(&status);
	printf("\nstatus: %d\n", status);
	exit(status);
	/ * OK */

	/* bidirectional filter with poll */
	/*
	 * The problem is that are not able to tell when the
	 * child is waiting to read from its stdin.
	 */
	pfds[0].fd = master_fd;
	pfds[0].events = POLLIN | POLLPRI;
	pfds[1].fd = 0;
	pfds[1].events = POLLIN | POLLPRI;

	for (;;) {
	    pfds[0].revents = 0;
	    pfds[1].revents = 0;
	    status = poll(pfds, (nfds_t) 2, -1);
	    if (status == 0) { /* impossible time out! */
		perror("poll() timed out");
		finish(ERROR);
	    }
	    if (status == -1) {	/* error on poll */
		perror("poll() error");
		finish(ERROR);
	    }
	    
	    /* 
	     * status MAY be 1 or two but we'll check both anyway
	     *	with bigger sets we mught save checking only until
	     *  the number of ready fds, but there won't be much
	     *  difference here between a check for (status == 1)
	     *  and a check for pfds[1] being ready.
	     */
	    
	    /* check if the child has data that we need to send the user */
	    if (pfds[0].revents != 0) {
		if (pfds[0].revents & (POLLIN | POLLPRI)) {
		    if (read(master_fd, &ch, 1) != 1) {
		    	/* this should never happen: there SHOULD be something
			   on the master_fd (unless child has closed it) */
			/* perror("read(master_fd)"); / * for debugging */
			finish(OK);
		    }
		    //printf("Got %c from child\n", ch);
		    if (write(1, &ch, 1) != 1) {
		    	/* our stdout is closed! dump it on the bit bucket */
			continue;
		    }
		} else if (pfds[0].revents & (POLLERR | POLLHUP | POLLNVAL)) {
		    /* perror("Other end closed connection"); / * for debugging */
		    finish(OK);
		}
	    }
	    /* check if the user has something to say */
	    if (pfds[1].revents != 0) {
		if (pfds[1].revents & (POLLIN | POLLPRI)) {
		    if (read(0, &ch, 1) != 1) {
		    	/* this should only happen on EOF */
			/* although if poll() says there is something to be read... */
			/* ... maybe that something is the EOF? weird semantics */
			//perror("read(stdin)"); /* for debugging */
			continue;
		    }
		    //printf("Got %c from user\n", ch);
		    if (write(master_fd, &ch, 1) != 1) {
		    	/* the child hasn't read anything: it may have closed
			   its stdin or not expecting the input and the buffer
			   for master_fd is full. For now we'll dump it on the
			   bit bucket */
			continue;
		    }
		} else if (pfds[1].revents & (POLLERR | POLLHUP | POLLNVAL)) {
		    /* perror("User closed connection"); / * for debugging */
		    finish(OK);
		}
	    }
	}

	exit(status);
	
	close(master_fd);
	wait(&status);
	printf("\nstatus: %d\n", status);
	exit(status);
    }

#ifdef USE_SELECT_NOT_DEBUGGED

	/* check if the child is waiting for us to write something */
	FD_ZERO(&writeset);
	FD_SET(master_fd, &writeset);

	/* check if the the child has anything to say */
	FD_ZERO(&readset);
	FD_SET(master_fd, &readset);

	for (;;) {
	    wr = writeset;
	    rd = readset;
	    status = select(master_fd + 1, &rd, &wr, NULL, NULL);
	    if (status == -1) {
		if (errno = EBADF)
		    break;	/* the child is dead */

		perror("select()");
		exit(ERROR);
	    }
	    if (FD_ISSET(master_fd, &rd)) {
		/* the child has something to say */
		if (read(master_fd, &ch, 1) != 1) {
		    kill(child_pid, SIGKILL);
		    wait(&status);
		    printf("\nstatus: %d\n", status);
		    exit(status);
		}
		if (write(1, &ch, 1) != 1) {
		    kill(child_pid, SIGKILL);
		    wait(&status);
		    printf("\nstatus: %d\n", status);
		    exit(status);
		}
	    }
	    if (FD_ISSET(master_fd, &wr)) {
		/* the child is waiting for input */
		/*  block reading from user and pass any char on to child */
		if (read(0, &ch, 1) != 1) {
		    kill(child_pid, SIGKILL);
		    wait(&status);
		    printf("\nstatus: %d\n", status);
		    exit(status);
		}
		if (write(master_fd, &ch, 1) != 1) {
		    kill(child_pid, SIGKILL);
		    wait(&status);
		    printf("\nstatus: %d\n", status);
		    exit(status);
		}
	    }
	}

#endif
/*  	A simple functionality test of the forkpty routine * /
    	char line[MAXLINE+1];
	
	line[0] = '\0';
	if (read(master_fd, line, MAXLINE) != -1)
	    printf("Child says its tty is %s, I see the master pty as %d (%s)\n", line, master_fd, slave_name);
	else
	    error("Read from child failed");
	
	
/ * OK */

}
