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

    while ((ch = getc(fp1)) != EOF) {
	putc(ch, fp2);
	if (ch == 0x0A)	/* EndOfLine */
	    putc(0x0D, fp2);
    }

    fclose(fp1);
    fclose(fp2);
    exit(0);
}


