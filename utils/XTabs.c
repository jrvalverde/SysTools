#include <stdio.h>
#include <stdlib.h>

#define	MAXPATHLEN  256

#define	MAXLINE	    256

main(argc, argv)
int argc;
char *argv[];
{
    char infile[ MAXPATHLEN ],
	 outfile[ MAXPATHLEN ],
	 in_line[ MAXLINE ],
	 outline[ MAXLINE ];

    FILE *ifp, *ofp;

    int ipos, olpos, orpos, pad;

    if (argc == 3) {
	puts("Convert a file from 4 sp TABs to 8 sp TABs");
	puts("===========================================");
	puts("	(C) José Ramón Valverde Carrillo, 1989");

	if ((ifp = fopen(argv[1], "r")) == NULL) {
	    printf("\nName of input file: ");
	    gets(infile);
	    if ((ifp = fopen(infile, "r")) == NULL) {
		fputs("\nCannot open input file\n", stderr);
 		exit( 0 );
	    }
	}
	if ((ofp = fopen(argv[2], "w+")) == NULL) {
	    printf("\nName of output file: ");
	    gets(outfile);
	    if ((ofp = fopen(outfile, "w+")) == NULL) {
		fputs("\nCannot open output file\n", stderr);
		exit( 0 );
	    }
	}
    }
    else {
	ifp = stdin;
	ofp = stdout;
    }

    do {
	if (fgets(in_line, MAXLINE, ifp) == NULL)
	    break;
	for (olpos = 0; olpos < MAXLINE; ++olpos)
	    outline[olpos] = ' ';
	for (ipos = olpos = orpos = 0;
	     in_line[ipos] != '\0';
	     ipos++) {
	    if (in_line[ipos] == '\n')
		break;
	    if (ipos == MAXLINE)
		break;
	    if (in_line[ipos] != '\t') {
		outline[olpos] = in_line[ipos];
		olpos++, orpos++;
	    }
	    else { /* It is a TAB */
		/* Compute real position */
		pad = (4 - (orpos % 4));
		orpos += pad;
		/* if we are at a 8-multiple position */
		if ((orpos % 8) == 0) {
		    /* let stay the TAB */
		    outline[olpos] = '\t';
		    olpos++;
		}
		else {	/* we are at a 4-multiple position */
		    /* Is there another tab after this? */
		    if (in_line[ipos + 1] == '\t')
			continue;   /* next loop will let it OK */
		    else {
			/* we have to pad with spaces */
			for ( ; pad; pad--)
			    outline[olpos++] = ' ';
			}
		}
	    }
	}   /* end for */
	outline[olpos] = '\n';
	outline[++olpos] = '\0';
	fputs(outline, ofp);
    } while (! feof(ifp));

    fclose(ifp);
    fclose(ofp);

    exit( 1 );
}


