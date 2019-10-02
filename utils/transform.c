#include <stdio.h>

main()
{
    FILE *fpin, *fpout;
    char filein[128];
    char fileout[128];
    int ch;

    printf("TRANSFORM: Transforms texts files from Mac to Vax.\n\n");
    printf("  -- Type name of input file: ");
    gets(filein);
    printf("\n  -- Type name of output file: ");
    gets(fileout);

    if (( fpin = fopen(filein, "rwb")) == NULL) {
    	printf("\nERROR. HORROR: Cannot open %s", filein);
    	return;
    }

    if (( fpout = fopen(fileout, "w+")) == NULL) {
    	printf("\nERROR. HORROR: Cannot open %s", fileout);
    	return;
    }

    while (! feof(fpin)) {
    	ch = (char) fgetc(fpin);
    	if (ch == '\n') {
/*    	    printf("<--NL-->\n"); */
        fputc(ch, fpout);
    }
    	else if (ch == '\r') {
/*    	    printf("<--CR-->\n"); */
        fputc('\n', fpout);
    }
    else {
/*      putchar(ch); */
        fputc(ch, fpout);
    }
    }
    fclose(fpin);
    fclose(fpout);
    return;
}


