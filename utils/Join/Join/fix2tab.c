#include <stdio.h>
#include <stdlib.h>

main(argc, argv)
int argc;
char *argv[];
{
    FILE *in, *ou;
    char buf[1024];
    int i, blen;

    if ((in = fopen(argv[1], "r")) == NULL) {
	printf("Error #1\n");
	exit(1);
    }

    if ((ou = fopen(argv[2], "w")) == NULL) {
	printf("Error #2\n");
	exit(2);
    }

    while (! feof(in)) {
	fgets(buf, 1024, in);
	blen = strlen(buf);
	buf[7] = '\0'; buf[67] = '\0';
	for (i = 66; i >7; i--)
	    if (buf[i] != ' ') break;
	    else buf[i] = '\0';
	for (i = blen -3; i > 67; i--)
	    if (buf[i] != ' ') break;
	    else buf[i] = '\0';

	fprintf(ou, "%s\t%s\t%s\n", &buf[0], &buf[8], &buf[68]);
    }
    exit(0);
}