#include <ncurses.h>

int main()
{
    initscr();			/* Start curses mode              */
    printw("Hello World !!!");	/* Print Hello World              */
    refresh();			/* Print it on to the real screen */
    noecho();			/* Don't echo() while we do getch */
    getch();			/* Wait for user input */
    endwin();			/* End curses mode                */

    return 0;
}
