#include <stdio.h>
#include <stdlib.h>

main(argc, argv)
int argc;
char *argv[];
{
    FILE *in, *ou;
    char buf[1024], *p1, *p2, *p3, delim;

    if ((in = fopen(argv[1], "r")) == NULL) {
	printf("Error #1\n");
	exit(1);
    }

    if ((ou = fopen(argv[2], "w")) == NULL) {
	printf("Error #2\n");
	exit(2);
    }

    while (! feof(in)) {
	fgets(buf, 1024, in);	/* process record */
	p1 = buf;
        do {
	    while (isspace(*p1)) p1++;
	    p2 = p1;
	    while ((*p2 != '@') && (*p2 != '\0')) p2++;
	    p3 = p2;
	    p2--;
	    while (isspace(*p2) && (p2 > p1)) p2--;
	    if (*p3 != '\0') {
		p2++; *p2 = '\0';
		fprintf(ou, "%s\t", p1);
		p1 = p3 + 1;
	    }
	    else {
		p2++; *p2 = '\0';
		fprintf(ou, "%s\n", p1);
		p1 = p3;
	    }
	} while (*p1);
    }
    fclose(in);
    fclose(ou);
}

/*
	do {
	    if ((*p2 == '@') || (*p2 == '\0')) {
		if (*p2 == '\0') {
		    delim = '\n';
		    p3 = p2;
		}
		else {
		    delim = '\t';
		    p3 = p2 + 1;
		}
		p2--;
		while (isspace(*p2) && (p2 > p1))
		    --p2;
		*++p2 = '\0';
		fprintf(ou, "%s%c", p1, delim);
		p1 = p3;
		while (isspace(*p1)) p1++;
		p2 = p1;
	    }
	    else
		p2++;
	} while (*p2);
	fprintf(ou, "\n");
    }
    exit(0);
}
*/