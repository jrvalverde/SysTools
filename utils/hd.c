/*  Copyright (c) 1982 by Manx Software Systems    */
/*  Copyright (c) 1982 by Jim Goodnow ||    */

/*
    hd - dump a file in hex and ascii

    hd file1 [file2] ...
*/

char digit[] = "0123456789ABCDEF";
char buf[512];
char *index();

main(argc, argv)
int argc;
char **argv;
{
    register int infil;
    register long tot;
    register int j, i, k;
    register int c, d;
    char str[82];
    register char *cp;
    register long offset;
    long atol(), atoh();

    long count;
    char control;
    unsigned char tty = 0;

    if (argc < 2) {
	printf( "Usage: hd [+n[.]] file1 [file2] ...\n");
	exit(0);
    }

    if (isatty(1)) tty = 1; count = 0;

    offset = 0;
    while (--argc) {
	tot = 0;
	++argv;
	if (**argv == '+') {
	    cp = *argv + 1;
	    if (cp[strlen(cp)-1] == '.')
		offset = atol(cp);
	    else
		offset = atoh(cp);
	    offset &= ~7;
	    continue;
	}
	infil = open(*argv, 0);
	if (infil < 0) {
	    printf("Can't open file %s\n", *argv);
	    continue;
	}
	lseek(infil, offset, 0);
	tot = offset;
	for (;;) {
	    i = read(infil, buf, 16);
	    if (i == 0)
		break;
	    count++;
	    if ( ((count % 20) == 0) && tty)
		if ((control = getchar()) == 'q') exit(0);
	    strcpy(str, "                                        ");
	    strcat(str, "                                        \n");
	    htoa(str, tot);
	    for(k=6, j=0; j<i; ++j) {
		c = buf[j]&0x0f;
		d = (buf[j] >> 4) & 0x0f;
		str[k++] = digit[d];
		str[k++] = digit[c];
		++k;
	    }
	    for (k=16*3+7, j=0; j<i; j++)
		if (buf[j] >= ' ' && buf[j] < 0x7f)
		    str[k++] = buf[j];
		else
		    str[k++] = '.';
	    write(1, str, 80);
	    puts("");
	    tot += i;
	}
	close(infil);
    }
}

char hx[] = "0123456789ABCDEF";

long
atoh(s)
register char *s;
{
    register long val = 0;
    register char *cp;

    while (cp = index(hx, toupper(*s++))) {
	val <<= 4;
	val += cp - hx;
    }
    return (val);
}

htoa(cp, val)
register char *cp;
register long val;
{
    register char *str;

    str = cp + 5;
    while (str > cp) {
	*--str = hx[val&0x0f];
	val >>= 4;
    }
}

puts(str)
register char *str;
{
    write(1, str, strlen(str));
}

char *
index(str, c)
register char *str;
int c;
{
    while (*str)
	if (*str++ == c)
	    return (str-1);
    return(0);
}


