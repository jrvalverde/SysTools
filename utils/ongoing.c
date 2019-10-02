/*
 * ongoing.c
 *
 *		ongoing
 *		ongoing "Entry to add explaining a project that is in progress"
 *		ongoing -r #
 *		ongoing -l
 *
 *	Ongoing allows to visualize/add/remove ongoing projects that are
 *	currently in progress:
 *		ongoing			--> show in progress projects
 *		ongoing "Entry"	--> Add "Entry" to list of projects in progress
 *		ongoing -r #	--> remove entry number # from list of projects
 *		ongoing -l		--> show log file.
 *	Added entries are stamped with the UID/USER environment variable of
 *	the person that called the program (should be UID/EUID, I know) and
 *	the date/time in which the entry was added. Will fail if USER isn't
 *	defined as an environment variable.
 *	Entries are *NOT* removed from the log file, allowing to keep track
 *	of what has been done and when.
 *
 *	The program tries to avoid deadlocks and interferences (like some
 *	signals).
 *
 *	This program is inspired on a small shell previously written by
 *	R. J. White (EBI).
 *
 *	Author:
 *		José R. Valverde.	E.B.I.	oct-1994	(v 1.0)
 *	
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <pwd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/errno.h>
#include <signal.h>
#include <time.h>

#ifndef TRUE
#define TRUE 1
#define FALSE 0
#endif

#define MAXUSERNAME	64
#define MAXLINE		256
#define MAXDATE		25		/* Day Mon 00:00:00 ####\n */

/* NOTE: both files must be on the same file system */
#define IN_PROGRESS_FILE	"/u/txomsy/ongoing.projects"
#define TMP_FILE			"/u/txomsy/ongoing.projects.tmp"
#define LOG_FILE			"/u/txomsy/ongoing.projects.log"
/* NOTE: change this into 0660 for group work or 0666 for general work */
#define PERMS				0600

/* NOTE: I'm using a POSIX [IEEE 1988] specific lock trick! See below... */

void usage();
int show_in_progress();
int remove_entry(int, uid_t);
int add_entry(char *, uid_t);
void terminate();

int lock_held = FALSE;

main(argc, argv)
int argc;
char *argv[];
{
	if (argc > 3) {
		usage();
		exit(0);
	}
	if (argc == 1) {
		if (! show_in_progress())
			exit(1);
		else
			exit(0);
	}

	/* The following code uses a lock file. We don't want the
	process stopped with the lock file open. hence we'll catch
	signals so as to be able to remove the lock file if something
	unexpected occurs */
	
#ifdef NOTDEF
	/* What the hell? I don't know where did I get the following
	signal() call sequences, I suppose it was VMS. This used to
	work on old compilers since the extra parameter would be
	ignored, and it certainly worked on DEC OSF/1 circa 1975 */
	signal(SIGINT, terminate, -1);
	signal(SIGQUIT, terminate, -1);
	signal(SIGTERM, terminate, -1);
#else
	signal(SIGINT, terminate);
	signal(SIGQUIT, terminate);
	signal(SIGTERM, terminate);
#endif
	
	if ((argv[1][0] == '-') && (argv[1][1] == 'r')) {
		if (argc != 3) {
			usage();
			exit(0);
		}
		/* argv [2] contains the msg# to delete */
		if (!remove_entry(atoi(argv[2]), getuid())) {
			fprintf(stderr, "Entry not deleted\n");
			exit(1);
		} else
			exit(0);
	}

	if ((argv[1][0] == '-') && (argv[1][1] == 'l')) {
		if (argc != 2) {
			usage();
			exit(0);
		}
		if (! show_log_file())
			exit(1);
		else
			exit(0);
	}

	if (argc == 2) {
		if (!add_entry(argv[1], getuid())) {
			fprintf(stderr, "Entry not added\n");
			exit(1);
		} else
			exit(0);
	}
	
	usage();
	exit(0);
}

void usage()
{
	fprintf(stderr, "Error: Usage is:\n\
	in_progress       -- to see currently ongoing projects\n\
	in_progress \"Msg\" -- to add a message about an ongoing project\n\
	in_progress -r #  -- ro remove message number #\n");
}

int show_in_progress()
{
	FILE *in_progress;
	char line[MAXLINE];
/*	int count; */

	if ((in_progress = fopen(IN_PROGRESS_FILE, "r")) == NULL) {
		fprintf(stderr, "\nCan't open %s file\n", IN_PROGRESS_FILE);
		return (0);
	}
	while (fgets(line, MAXLINE, in_progress) != NULL) {
		fputs(line, stdout);
	}
	return (1);
}

int show_log_file()
{
	FILE *in_progress;
	char line[MAXLINE];

	if ((in_progress = fopen(LOG_FILE, "r")) == NULL) {
		fprintf(stderr, "\nCan't open %s file\n", IN_PROGRESS_FILE);
		return (0);
	}
	while (fgets(line, MAXLINE, in_progress) != NULL) {
		fputs(line, stdout);
	}
	return (1);
}

int remove_entry(entry_no, my_uid)
int entry_no;
uid_t my_uid;
{
	FILE *in_progress, *tmpfile;
	char line[MAXLINE];
	struct passwd *me;
	char my_name[MAXUSERNAME];
	char curname[MAXUSERNAME], *pch;
	int curno, tempfd;
	extern int errno;

	/*
	 * Note: here we should test prior existence to avoid races!
	 * (i.e. the TMP_FILE acts as a lock file to prevent simultaneous access).
	 * Exclusive *creation* is a POSIX specific trick supported on modern
	 * systems only. YOU could need an additional ancillary lock file.
	 */
	curno = 0;
	while ((tempfd = open(TMP_FILE, O_RDWR|O_CREAT|O_EXCL, PERMS)) < 0) {
		if ((errno != EEXIST) || (++curno > 5)) {
			fprintf(stderr, "\nCan't open temporal file!\n");
			return (0);
		}
		else {
			fprintf(stdout, "File is currently in use. Please wait...\n");
			sleep(1);
		}
	}
	lock_held = TRUE;

	if ((in_progress = fopen(IN_PROGRESS_FILE, "r")) == NULL) {
		fprintf(stderr, "\nCan't open in.progress file\n");
		close(tempfd);
		unlink(TMP_FILE);
		lock_held = FALSE;
		return (0);
	}

	/* We want to access this file in an easier way */
	if ((tmpfile = fdopen(tempfd, "rw+")) == NULL) {
		fprintf(stderr, "\nCan't reopen temporal file!\n\n");
		fclose(in_progress);
		close(tempfd);
		unlink(TMP_FILE);
		lock_held = FALSE;
		return (0);
	}

	/* get user name */
	me = getpwuid(my_uid);
	strncpy(my_name, me->pw_name, MAXUSERNAME);
	strncat(my_name, "/", MAXUSERNAME - strlen(my_name));
	strncat(my_name, getenv("USER"), MAXUSERNAME - strlen(my_name));


	/* look for the entry. User name and uid must coincide */
	while (fgets(line, MAXLINE, in_progress) != NULL) {
		sscanf(line, "%d: %s ", &curno, curname);
		if (curno == entry_no) {
			if (strcmp(my_name, curname) == 0) {
				continue;			/* not saving the line is like deleting */
			}
			else {
				fprintf(stderr, "You are %s, not %s!\nEntry not deleted\n",
						my_name, curname);
			}
		}
		if (fputs(line, tmpfile) == EOF) {
			fprintf(stderr, "Error writing the new file!\n");
			fclose(in_progress);
			close(tempfd);
			unlink(TMP_FILE);	/* release lock */
			lock_held = FALSE;
			return (0);
		}
		fflush(tmpfile);
	}
	fclose(in_progress);
	close(tempfd);
	if (rename(TMP_FILE, IN_PROGRESS_FILE) != 0) {
		fprintf(stderr, "Could not rename temporary file to %s\n",
			IN_PROGRESS_FILE);
		unlink(TMP_FILE);		/* release lock */
		lock_held = FALSE;
		return(0);
	}
	lock_held = FALSE;
	return (1);
}

int add_entry(msg, my_uid)
char *msg;
uid_t my_uid;
{
	/* We could just open IN_PROGRESS/LOG_FILE for append, but then
	we could have race conditions. So, we'll have to create the
	lock file as well */
	FILE *in_progress, *logfile;
	char line[MAXLINE];
	struct passwd *me;
	char my_name[MAXUSERNAME];
	char curdate[MAXDATE], *pch;
	int curno, tempfd, maxno;
	time_t curtime;
	extern int errno;

	/*
	 * The TMP_FILE acts as a lock file to prevent simultaneous access.
	 * We only try to create it. To reduce overhead, IN_PROGRESS_FILE
	 * is open in read+ (update) mode.
	 */
	curno = 0;
	while ((tempfd = open(TMP_FILE, O_RDWR|O_CREAT|O_EXCL, PERMS)) < 0) {
		if ((errno != EEXIST) || (++curno > 5)) {
			fprintf(stderr, "\nCan't open temporal file!\n");
			return (0);
		}
		else {
			fprintf(stdout, "File is currently in use. Please wait...\n");
			sleep(1);
		}
	}
	lock_held = TRUE;

	if ((in_progress = fopen(IN_PROGRESS_FILE, "r+")) == NULL) {
		if (errno == ENOENT) {
			if ((in_progress = fopen(IN_PROGRESS_FILE, "a+")) == NULL) {
				fprintf(stderr, "\nCan't open %s file\n", IN_PROGRESS_FILE);
				close(tempfd);
				unlink(TMP_FILE);
				lock_held = FALSE;
				return (0);
			}
		} else {
			fprintf(stderr, "\nCan't open %s file\n", IN_PROGRESS_FILE);
			close(tempfd);
			unlink(TMP_FILE);
			lock_held = FALSE;
			return (0);
		}
	}
	if ((logfile = fopen(LOG_FILE, "r+")) == NULL) {
		if (errno == ENOENT) {
			if ((logfile = fopen(LOG_FILE, "a+")) == NULL) {
				fprintf(stderr, "\nCan't open %s file\n", IN_PROGRESS_FILE);
				fclose(in_progress);
				close(tempfd);
				unlink(TMP_FILE);
				lock_held = FALSE;
				return (0);
			}
		} else {
			fprintf(stderr, "\nCan't open %s file\n", IN_PROGRESS_FILE);
			fclose(in_progress);
			close(tempfd);
			unlink(TMP_FILE);
			lock_held = FALSE;
			return (0);
		}
	}

	curno = maxno = 0;
	while (fgets(line, MAXLINE, logfile) != NULL) {
		sscanf(line, "%d:", &curno);
		if (curno > maxno)
			maxno = curno;
	}

	/* We are at EOF now: append the new line */
	maxno++;
	/* get user name */
	me = getpwuid(my_uid);
	strncpy(my_name, me->pw_name, MAXUSERNAME);
	strncat(my_name, "/", MAXUSERNAME - strlen(my_name));
	strncat(my_name, getenv("USER"), MAXUSERNAME - strlen(my_name));

	/* get date and time */
	time(&curtime);
	strncpy(curdate, ctime(&curtime), MAXDATE);
	if ((pch = index(curdate, '\n')) != NULL)
		*pch = '\0';

	/* Output line */
	fseek(in_progress, 0, SEEK_END);
	fseek(logfile, 0, SEEK_END);
	if (fprintf(in_progress, "%6d: %s (%s): %s\n", 
				maxno, my_name, curdate, msg) < 0) {
		fprintf(stderr, "\nError: Can't write into %s\n", IN_PROGRESS_FILE);
		fclose(in_progress); fclose(logfile);
		close(tempfd);
		unlink(TMP_FILE);
		lock_held = FALSE;
		return (0);
	}
	if (fprintf(logfile, "%6d: %s (%s): %s\n", 
				maxno, my_name, curdate, msg) < 0) {
		fprintf(stderr, "\nError: Can't write into %s\n", LOG_FILE);
		fclose(in_progress); fclose(logfile);
		close(tempfd);
		unlink(TMP_FILE);
		lock_held = FALSE;
		return (0);
	}

	fclose(in_progress); fclose(logfile);
	close(tempfd);			/* release lock */
	unlink(TMP_FILE);
	lock_held = FALSE;
	return (1);
}

void terminate()
{
	if (lock_held)
		unlink(TMP_FILE);
	fprintf(stderr, "\nPremature termination requested.\n%s not changed\n",
		IN_PROGRESS_FILE);
	exit(1);
}

