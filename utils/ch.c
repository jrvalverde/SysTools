#include <stdio.h>
#include <stdlib.h>

main(argc, argv)
int argc;
char *argv[];
{
    int ch;
    char *file1, *file2;
    FILE *fp1, *fp2;

    if (argc == 3) {
	puts("VaxToC: Convert format of files from CR/LF to Stream_LF");
	puts("        by José Ramón Valverde Carrillo\n");

	if ((fp1 = fopen(argv[1], "r")) == NULL) {
	    puts("ERROR - HORROR: Cannot open input file");
	    exit(0);
	}
    
	if ((fp2 = fopen(argv[2], "w+")) == NULL) {
	    puts("ERROR - HORROR: Cannot open output file");
	    exit(0);
	}
    }
    else {
	fp1 = stdin;
	fp2 = stdout;
    }

#ifdef __VAXC__
    while ((ch = getc(fp1)) != EOF) putc(ch, fp2);
#else	/* ULTRIX */
    while ((ch = getc(fp1)) != EOF) {
	if ((ch == 0x8D) || (ch == 0x01))	/* EndOfLine or EndOfVaxRecord */
	    continue;
	putc(ch, fp2);
    }
#endif

    fclose(fp1);
    fclose(fp2);
    exit(0);
}


