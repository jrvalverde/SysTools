/*
* keyboard.c - read commands
*
*
* Entry points:
*
*	k_donext(cmd)
*	char *cmd;
*		Arrange that cmd will be done next.
*
*	k_finish()
*		Close down the keyboard manager.
*
*	int k_getch()
*		Return the next character of the current command.
*
*	k_init()
*		Initialize the keyboard manager.
*
*	char k_lastcmd()
*		Return the first letter in the last command.
*
*	k_newcmd()
*		Prepare for reading a new command.
*
*	k_redo()
*		Redo the last buffer-change command.
*
*
* External procedure calls:
*
*	int b_changed()					.. file Bman.c
*		Tell if the buffer was changed by the last command.
*
*	b_newcmd(bit)					.. file Bman.c
*	int bit;
*		Inform the buffer module that a new command is starting and tell
*		whether it is from the keyboard (bit = 1) or not (bit = 0).
*
*	s_keyboard(bit)					.. file Sman.c
*	int bit;
*		Inform the screen module whether the next input character is
*		from the keyboard (bit = 1) or not (bit = 0).
*
*	s_savemsg(msg, count)				.. file Sman.c
*	char *msg;
*	int count;
*		Format msg and save it for the next screen refreshing.
*/
#include "s.h"
#define CMD_MAX 500		/* longest command that can be redone */

static char
	change[CMD_MAX+2],	/* most recent buffer-change command */
	cmd_last,		/* first letter in the last command */
	command[CMD_MAX+2],	/* accumulates the current command */
	*cmd_ptr = command,	/* next location in command */
	pushed[CMD_MAX],	/* pushed-back command */
	*push_ptr = pushed;	/* next location in pushed */

/* k_donext - push a command back on the input stream */
k_donext(cmd)
char *cmd;
{
	int cmd_size;
	char *s;

	cmd_size = strlen(cmd);
	if (push_ptr - pushed + cmd_size > CMD_MAX) {
		s_savemsg("Pushed commands are too long.", 0);
		UNKNOWN;
	} else if (cmd_size > 0) {
		/* copy cmd to pushed[] in reverse order */
		for (s = cmd + cmd_size - 1; s >= cmd; --s)
			*push_ptr++ = *s;
		s_keyboard(0);
	}
}

/* k_finish - close down the keyboard manager */
k_finish()
{
	k_flip();
}

/* k_getch - get a character of the command */
int k_getch()
{
	int ch;

	/* get pushed character (preferably) or read keyboard */
	/* use logical AND operation with octal 0177 to strip the parity bit */
	ch = (push_ptr > pushed) ? *(--push_ptr) : getchar() & 0177;
	/* remember character if there is room */
	if (cmd_ptr <= command + CMD_MAX)
		*cmd_ptr++ = ch;
	s_keyboard(push_ptr == pushed);
	return(ch);
}

/* k_init - initialize the keyboard manager */
k_init()
{
	k_flip();
}

/* k_lastcmd - get first letter of the last command */
char k_lastcmd()
{
	return(cmd_last);
}

/* k_newcmd - start a new command */
k_newcmd()
{
	char *s;

	*cmd_ptr = '\0';
	/* remember first letter of the old command */
	for (s = command; *s != '\0' && !isalpha(*s); ++s)
		;
	cmd_last = *s;
	/* if the old command changed the buffer, remember it */
	if (b_changed())
		strcpy(change, command);
	cmd_ptr = command;		/* prepare to collect the new command */
	b_newcmd(push_ptr == pushed);	/* mark buffer "unchanged" */
}

/* k_redo - redo the last buffer-change command */
k_redo()
{
	if (strlen(change) > CMD_MAX) {
		s_savemsg("Cannot redo commands longer than %d characters.",
			CMD_MAX);
		change[0] = '\0';
	}
	if (change[0] == '\0')
		UNKNOWN;
	else
		k_donext(change);
}

/*	
* k_flip  - toggle keyboard input to and from noecho-raw mode  (UNIX)
* Normally:
*	1. typed characters are echoed back to the terminal and
*	2. input characters are buffered until a complete line
*	   has been received.
* Flipping to noecho-raw mode suspends all such input processing.
*/

#ifdef POSIX
#include	<termios.h>
#include	<unistd.h>

static struct termios	term, saved_term;
static int				ttysavefd = -1;
static enum { RESET, RAW, CBREAK }	ttystate = RESET;

int
sttyraw(void) 
{
  int i;

  i = tcgetattr (STDIN_FILENO, &term);
  if (i < 0) 
  {
    printf("tcgetattr() returned %d for fildes=%d\n",i,STDIN_FILENO); 
    perror ("");
    return -1;
  }
  saved_term = term;

  term.c_lflag &= ~(ECHO | ICANON | IEXTEN | ISIG);
  term.c_iflag &= ~(BRKINT | ICRNL | INPCK | ISTRIP | IXON);
  term.c_cflag &= ~(CSIZE | PARENB);
  term.c_cflag |= CS8;
  term.c_oflag &= ~(OPOST);
   
  term.c_cc[VMIN] = 1;
  term.c_cc[VTIME] = 0;

  i = tcsetattr (STDIN_FILENO, TCSANOW, &term);
  if (i < 0) 
  {
    printf("tcsetattr() returned %d for fildes=%d\n",i,STDIN_FILENO); 
    perror("");
    return -1;
  }
   
  ttystate = RAW;
  ttysavefd = STDIN_FILENO;

  return 0;
}

int
sttyreset(int fd)		/* restore terminal's mode */
{
	if (ttystate != CBREAK && ttystate != RAW)
		return(0);

	if (tcsetattr(fd, TCSAFLUSH, &saved_term) < 0)
		return(-1);
	ttystate = RESET;
	return(0);
}

void
sttyatexit(void)		/* can be set up by atexit(tty_atexit) */
{
	if (ttysavefd >= 0)
		sttyreset(ttysavefd);
}

/* ***************************************************************************
 *
 * kb_getc(), if there's a typed character waiting to be read,
 *   return it; else return 0.
 *************************************************************************** */
unsigned char
kb_getc(void) 
{
  int i;
  unsigned char ch;
  ssize_t size;
/*  termattr.c_cc[VMIN] = 0; */ /* uncomment if needed */
  i = tcsetattr (STDIN_FILENO, TCSANOW, &term);
  size = read (STDIN_FILENO, &ch, 1);
/*  termattr.c_cc[VMIN] = 1; */ /* uncomment if needed */
  i = tcsetattr (STDIN_FILENO, TCSANOW, &term);
  if (size == 0)
  {
    return 0;
  }
  else
  {
    return ch;
  }
}

/* ***************************************************************************
 * kb_getc_w(), wait for a character to be typed and return it.
 *************************************************************************** */
unsigned char
kb_getc_w(void) 
{
  unsigned char ch;
  size_t size;

  while (1)
  {

    usleep(20000);        /* should use select instead of a busy wait loop */

    size = read (STDIN_FILENO, &ch, 1);
    if (size > 0)
    {
      break;
    }
  }
  return ch;
}



static k_flip()
{
    if (ttystate == RAW)
    	sttyreset(0);
    else
    	sttyraw();    
}
#endif
#ifdef V7
#include <sgtty.h>
static k_flip()
{
	struct sgttyb ttyb;

	ioctl(0, TIOCGETP, &ttyb);
	ttyb.sg_flags ^= ECHO | RAW;
	ioctl(0, TIOCSETP, &ttyb);
}
#endif
#ifdef V6
#include <sgtty.h>
static k_flip()
{
    struct {
        int     speeds;
        char    pad1, pad2;             /***/
        char    kill, erase;            /***/
        int     tflags;
    } ttyb;
    gtty(0, &ttyb);

    /* sflags = ttyb.tflags; */
    /* ttyb.tflags =& ~ ECHO; */

    ttyb.tflags ^= ECHO;
    stty(0, &ttyb);

    /* ttyb.tflags = sflags; */
    /* stty(0, &ttyb); */
}
#endif
