/*
         1         2         3         4         5         6         7         8
12345678901234567890123456789012345678901234567890123456789012345678901234567890
*/
/*
 * join.c
 *
 * JRValverde 1993
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_FLD_SIZE		512
#define MAX_IREC_SIZE		15000
#define MAX_OREC_SIZE		MAX_IREC_SIZE * 2
#define MAX_OFLD_SIZE		5120
#define MAX_FIELDS		30
#define FIELD_DELIMITER		'\t'
#define WORD_DELIMITER		','
#define TRUE			1
#define FALSE			0

char nullstr[] = "";
void join_files(FILE *if1, FILE *if2, FILE *of);
void empty_orecord(char *r[MAX_FIELDS]);
int  get_record(FILE *inf, char *r[MAX_FIELDS], char buf[MAX_IREC_SIZE]);
void append_record(char *src[MAX_FIELDS], 
	char *dest[MAX_FIELDS], int offset, int nf);
void save_record(FILE *of, char *r[MAX_FIELDS], int nf);

main(argc, argv)
int argc;
char *argv[];
{
    FILE *if1, *if2, *of;

    if ((if1 = fopen(argv[1], "r")) == NULL) {
	printf("\nError: could not open input file #1\n");
	exit(1);
    }

    if ((if2 = fopen(argv[2], "r")) == NULL) {
	printf("\nError: could not open input file #2\n");
	exit(1);
    }

    if ((of = fopen(argv[3], "a")) == NULL) {
	printf("\nError: could not open output file\n");
	exit(1);
    }

    join_files(if1, if2, of);
    fclose(if1); fclose(if2); fclose(of);
    exit(0);
}

void join_files(if1, if2, of)
FILE *if1, *if2, *of;
{
    char *r1[MAX_FIELDS],
	 *r2[MAX_FIELDS],
	 *or[MAX_FIELDS];
    char buf1[MAX_IREC_SIZE],
	 buf2[MAX_IREC_SIZE];
    char last_k[MAX_FLD_SIZE];
    int i, i1, i2;
    int nf1, nf2;
    int eof1, eof2;

    for (i = 0; i < MAX_FIELDS; i++)
	if ((or[i] = malloc(MAX_FLD_SIZE *2)) == NULL) {
	    fprintf(stderr, "Not enough memory to run safely\n");
	    exit(1);
	}
    empty_orecord(or);
    last_k[0] = '\0';

    nf1 = get_record(if1, r1, buf1);
    if (nf1 == 0) eof1 = TRUE;
    nf2 = get_record(if2, r2, buf2);
    if (nf2 == 0) eof2 = TRUE;
    i1 = i2 = 1;

    while ((! eof1) && (! eof2)) {
/*      if (r1[0][0] == '\0') { / * DO NOT APPEND TOGETHER FIRST RECORDS WITHOUT KEY * /
	    save_record(of, or, nf1 + nf2);
	    empty_orecord(or);
	    append_record(r1, or, 1, nf1);
	    i = get_record(if1, r1, buf1); i1++;
	    if (i == 0) eof1 = TRUE;
	    else if (i != nf1) {
		fprintf(stderr, "Bad number of fields at record %d in file 1\n", i1);
		fprintf(stderr, "%d records found, %d expected\n", i, nf1);
		fprintf(stderr, "At most %d fields will be used\n", nf1);
	    }
	    continue;
	}
*/
	if (strcmp(r1[0], last_k) < 0) {
	    fprintf(stderr, "Input file is not sorted by key!!!\n");
	    fprintf(stderr, "Record # %d key is minor than previous one\n", i1);
	    fprintf(stderr, "Record # %d, %s, not saved\n", i1, r1[0]);
	    i = get_record(if1, r1, buf1); i1++;
	    if (i == 0) eof1 = TRUE;
	    else if (i != nf1) {
		fprintf(stderr, "Bad number of fields at record %d in file 1\n", i1);
         	fprintf(stderr, "%d records found, %d expected\n", i, nf1);
		fprintf(stderr, "At most %d fields will be used\n", nf1);
	    }
	    continue;
	}
	if (strcmp(r1[0], last_k) == 0) {
	    append_record(r1, or, 1, nf1);
	    i = get_record(if1, r1, buf1); i1++;
	    if (i == 0) eof1 = TRUE;
	    else if (i != nf1) {
		fprintf(stderr, "Bad number of fields at record %d in file 1\n", i1);
         	fprintf(stderr, "%d records found, %d expected\n", i, nf1);
		fprintf(stderr, "At most %d fields will be used\n", nf1);
	    }
	    continue;
	}
	if (strcmp(r1[0], last_k) > 0) {
	    save_record(of, or, nf1 + nf2);
	    strcpy(last_k, r1[0]);
	    empty_orecord(or);
	    while (! eof2) {
		if (strcmp(r2[0], last_k) < 0) {
		    append_record(r2, or, nf1, nf2);
		    empty_orecord(or);
		    i = get_record(if2, r2, buf2); i2++;
		    if (i == 0) eof2 = TRUE;
		    else if (i != nf2) {
			fprintf(stderr, "Bad number of fields at record %d in file 2\n", i2);
        	 	fprintf(stderr, "%d records found, %d expected\n", i, nf2);
			fprintf(stderr, "At most %d fields will be used\n", nf2);
		    }
		    continue;
		}
		if (strcmp(r2[0], last_k) == 0) {
		    append_record(r2, or, nf1, nf2);
		    i = get_record(if2, r2, buf2); i2++;
		    if (i == 0) eof2 = TRUE;
		    else if (i != nf2) {
			fprintf(stderr, "Bad number of fields at record %d in file 2\n", i2);
         		fprintf(stderr, "%d records found, %d expected\n", i, nf2);
			fprintf(stderr, "At most %d fields will be used\n", nf2);
		    }
		    continue;
		}
		if (strcmp(r2[0], last_k) > 0)
		    break;
	    }
	    append_record(r1, or, 1, nf1);
	    i = get_record(if1, r1, buf1); i1++;
	    if (i == 0) eof1 = TRUE;
	    else if (i != nf1) {
		fprintf(stderr, "Bad number of fields at record %d in file 1\n", i1);
         	fprintf(stderr, "%d records found, %d expected\n", i, nf1);
		fprintf(stderr, "At most %d fields will be used\n", nf1);
	    }
	    continue;
	}
    }

    save_record(of, or, nf1+nf2);
    empty_orecord(or);
    if (! eof1)
	while (get_record(if1, r1, buf1) != 0) {
	    append_record(r1, or, 1, nf1);
	    save_record(of, or, nf1+nf2);
	    empty_orecord(or);
	}
    if (! eof2)
	while (get_record(if2, r2, buf2) != 0) {
	    append_record(r2, or, nf1, nf2);
	    save_record(of, or, nf1+nf2);
	    empty_orecord(or);
	}
}

void empty_orecord(r)
char *r[MAX_FIELDS];
{
    int i;

    for (i = 0; i < MAX_FIELDS; i++)
	r[i][0] = '\0';
}

int get_record(inf, r, buf)
FILE *inf;
char *r[MAX_FIELDS];
char buf[MAX_IREC_SIZE];
{
    char *p;
    int i;

    for (i = 0; i < MAX_FIELDS; i++) r[i] = nullstr;
    buf[0] = '\0';
    if (fgets(buf, MAX_IREC_SIZE, inf) == NULL)
	return 0;
    i = 1; p = buf; r[0] = buf;
    while (*p) {
	if (i == MAX_FIELDS -1) break;
	if (*p == '\n') *p = ' ';
        if (*p == FIELD_DELIMITER) {
	    *p = '\0'; p++;
	    r[i] = p;
	    i++;
	}
	else p++;
    }
/*    i++; */
    return i;
}


void append_record(src, dest, offset, nf)
char *src[MAX_FIELDS];
char *dest[MAX_FIELDS];
int offset, nf;
{
    int i, j;

    if (nf > (MAX_FIELDS)) {
	fprintf(stderr, "Too many fields to append!!!\n");
	return;
    }

    strcpy(dest[0], src[0]);	/* key */

    for (i = 1, j = 0; i < nf; i++, j++) {
	if (src[i][0] != '\0') {
	    if (dest[offset + j][0] != '\0')
		strcat(dest[offset + j], ", ");
	    strcat(dest[offset + j], src[i]);
	}
    }
}

void save_record(of, r, nf)
FILE *of;
char *r[MAX_FIELDS];
int nf;
{
    int i;

    if (nf > MAX_FIELDS) {
	fprintf(stderr, "Too many fields to save!!!\n");
	return;
    }

    /* for (i = 1???; */
    for (i = 0; i < (nf - 1); i++)
	if (fprintf(of, "%s\t", r[i]) < 0)
	    fprintf(stderr, "Error writing output file\n");

    if (fprintf(of, "%s\n", r[nf - 1]) < 0)
	fprintf(stderr, "Error writing output file\n");
}