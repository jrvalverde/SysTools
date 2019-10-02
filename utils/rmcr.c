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
	puts("rmcr: remove \\r (carriage returns) from a #$%&!! MeSh-DOS file");
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
	if (ch != '\r')	/* CarriageReturn */
	    putc(ch, fp2);
    }

    fclose(fp1);
    fclose(fp2);
    exit(0);
}


