#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <netinet/in.h>

/* ======== */
/* PG, 2004 */
/* ======== */

#define	INITPC		0x100
#define	NONE		(-1)
#define	CODEMASK	0x1f
#define	CODESHIFT	(32 - 5)
#define	INDEXBIT	0x04000000
#define	ADDRMASK	0x03ffffff
#define ADDRSIGN	0x02000000
#define	MAXCODE		0x12
#define	IREG		0x03ffffff
#define	OREG		0x03fffffe
#define CREG		0x03fffffd
#define	DEF_MEMSIZE	0x8000		// 32K

unsigned long *memory = NULL;
unsigned long PC, MPC, EA1, EA2, memsize = 0;
int	IFD, OFD, CFG, FAILURE = 0;
FILE	*DFS;
long long INSC;

typedef	void (*opfun)();

struct	opcode {
	opfun	code;
	int	argc, jtype;
	char	name [5];
};

void	do_mov (), do_add (), do_sub (), do_mul (), do_div (), do_rem (),
	do_cmp (), do_jmp (), do_hlt (), do_sea (), do_ocs (), do_lnd (),
	do_lor (), do_lxr (), do_lsh ();

void	failure (const char*);

unsigned long	getmem (unsigned long);

struct	opcode	CODES [] = {
	{ do_mov, 2,  0, "MOVE" },
	{ do_add, 2,  0, "ADD " },
	{ do_sub, 2,  0, "SUB " },
	{ do_mul, 2,  0, "MUL " },
	{ do_div, 2,  0, "DIV " },
	{ do_rem, 2,  0, "REM " },
	{ do_cmp, 2,  3, "CMP " },
	{ do_jmp, 1, -1, "JLT " },
	{ do_jmp, 1,  0, "JEQ " },
	{ do_jmp, 1,  1, "JGT " },
	{ do_jmp, 1,  2, "JMP " },
	{ do_hlt, 1,  2, "HLT " },
	{ do_sea, 2,  0, "SEA " },
	{ do_ocs, 2,  0, "OCS " },
	{ do_lnd, 2,  0, "LND " },
	{ do_lor, 2,  1, "LOR " },
	{ do_lxr, 2,  2, "LXR " },
	{ do_lsh, 2,  3, "LSH " }
};

struct opcode *CODE;

unsigned long sigext (unsigned long a) {

	if (a & ADDRSIGN)
		a |= ~ADDRMASK;

	return a;
}

void wrcns (unsigned int w) {

	char c;

	c = (char) w;
	write (1, &c, 1);
}

unsigned int rdcns () {

	char c;

	if (read (0, &c, 1) <= 0)
		return 0xffffffff;

	return (unsigned long) c;
}

int readb (int fd, unsigned long *wd, int wc, int im) {

	unsigned long tmp;
	int t, rd;

	rd = 0;

	while (wc > 0) {

		t = read (fd, &tmp, 4);
		if (t < 4) {
			if (t < 0) {
				if (im) {
					perror ("Cannot read image file");
					exit (99);
				}
				failure ("INPUT FILE READ ERROR");
				return rd;
			}
			if (im) {
				return rd;
			}
			failure ("END OF INPUT FILE");
			return rd;
		}

		*wd = ntohl (tmp);

		wd++;
		rd++;
		wc--;
	}

	return rd;
}

void writeb (int fd, const unsigned long *wd, int wc) {

	unsigned long tmp;

	while (wc > 0) {

		tmp = htonl (*wd);

		if (write (fd, &tmp, 4) < 4) {

			failure ("OUTPUT FILE WRITE ERROR");
			return;
		}

		wd++;
		wc--;
	}
}

void dumpinst (char *dump) {

	char jf, ea1 [9], ea2 [9], mea1 [9], mea2 [9];

	if (CODE == NULL) {
		sprintf (dump, "%07x XXXX -------- --------\n", PC);
		return;
	}

	if (EA1 == (unsigned long) NONE) {
		strcpy (ea1,  "-------");
		strcpy (mea1, "--------");
	} else {
		sprintf (ea1, "%07x", EA1);
		if (CODE->argc > 1) {
			if (EA1 == IREG) {
				strcpy (mea1, "-INPREG-");
			} else if (EA1 == OREG) {
				strcpy (mea1, "-OUTREG-");
			} else if (EA1 == CREG) {
				strcpy (mea1, "-CONREG-");
			} else if (EA1 >= memsize) {
				strcpy (mea1, "-OFFRNG-");
			} else {
				sprintf (mea1, "%08x", memory [EA1]);
			}
		}
	}
		
	if (CODE->argc == 1) {
		jf = '+';
		if (CODE->jtype < 2 && CFG != CODE->jtype)
			jf = '-';
		sprintf (dump, "%07x %s %s <%c>\n", PC, CODE->name, ea1, jf);
		return;
	}

	if (EA2 == (unsigned long) NONE) {
		strcpy (ea2,  "-------");
		strcpy (mea2, "--------");
	} else {
		sprintf (ea2, "%07x", EA2);
		if (EA2 == IREG) {
			strcpy (mea2, "-INPREG-");
		} else if (EA2 == OREG) {
			strcpy (mea2, "-OUTREG-");
		} else if (EA2 == CREG) {
			strcpy (mea2, "-CONREG-");
		} else if (EA2 >= memsize) {
			strcpy (mea2, "-OFFRNG-");
		} else {
			sprintf (mea2, "%08x", memory [EA2]);
		}
	}

	if (CODE->jtype == 3) {
		sprintf (dump, "%07x %s %s %s [%s %s] '%c'\n", PC, CODE->name,
			ea1, ea2, mea1, mea2, (CFG<0?'<':(CFG>0?'>':'=')));
	} else {
		sprintf (dump, "%07x %s %s %s [%s %s]\n", PC, CODE->name,
			ea1, ea2, mea1, mea2);
	}
}

void trace () {

	char debug [80];

	if (DFS != NULL) {
		dumpinst (debug);
		fprintf (DFS, debug);
	}
}
		
void failure (const char *err) {

	char debug [80];

	FAILURE = 1;
	fprintf (stderr, "%s\n", err);
	dumpinst (debug);
	if (DFS != NULL) {
		fprintf (DFS, "%s\n", err);
		fprintf (DFS, debug);
	}
	fprintf (stderr, debug);
	fprintf (stderr, "ABORTED AT %08x AFTER %ld INSTRUCTIONS\n", PC, INSC);
}

opfun getcode () {

	long wd;

	if (MPC > memsize) {
		failure ("PC OUTSIDE MEMORY");
		return;
	}

	wd = (long) getmem (MPC);
	if (FAILURE)
		return;

	wd = (wd >> CODESHIFT) & CODEMASK;

	if (wd == 0 || wd > MAXCODE) {
		failure ("ILLEGAL OPERATION CODE");
		return;
	}

	CODE = &(CODES [wd - 1]);
}

unsigned long getmem (unsigned long ea) {

	unsigned long wd;

	if (ea & ADDRSIGN) {
		if (ea == OREG) {
			failure ("ATTEMPT TO READ FROM OUTPUT REGISTER");
			return;
		} else if (ea == IREG) {
			wd = 0;
			readb (IFD, &wd, 1, 0);
			return wd;
		} else if (ea == CREG) {
			return rdcns ();
		}
	}
	if (ea >= memsize) {
		failure ("FETCH OUTSIDE MEMORY");
		return;
	}

	return memory [ea];
}

void putmem (unsigned long ea, unsigned long wd) {

	if (ea & ADDRSIGN) {
		if (ea == IREG) {
			failure ("ATTEMPT TO WRITE INTO INPUT REGISTER");
			return;
		} else if (ea == OREG) {
			writeb (OFD, &wd, 1);
			return;
		} else if (ea == CREG) {
			wrcns (wd);
			return;
		}
	}
	if (ea >= memsize) {
		failure ("STORE OUTSIDE MEMORY");
		return;
	}

	memory [ea] = wd;
}

unsigned long getea () {

	unsigned long wd, ea;

	if (MPC >= memsize) {
		failure ("SECOND OPERAND OUTSIDE MEMORY");
		return 0;
	}

	wd = getmem (MPC++);
	if (FAILURE)
		return 0;

	ea = wd & ADDRMASK;

	if (wd & INDEXBIT) {
		wd = getmem (MPC++) & ADDRMASK;
		if (FAILURE)
			return 0;
		wd = getmem (wd);
		if (FAILURE)
			return 0;
		ea = (ea + wd) & ADDRMASK;
	}

	return ea;
}

void execute () {

	MPC = PC;
	CODE = NULL;
	EA1 = (unsigned long) NONE;
	EA2 = (unsigned long) NONE;
	FAILURE = 0;

	getcode ();
	if (FAILURE)
		return;

	EA1 = getea ();
	if (FAILURE)
		return;

	if (CODE->argc == 2) {
		EA2 = getea ();
		if (FAILURE)
			return;
	}

	(*(CODE->code)) ();
}

void do_mov () {

	unsigned long wd;

	wd = getmem (EA2);
	if (FAILURE)
		return;

	putmem (EA1, wd);
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}

void do_sea () {

	unsigned long wd;

	wd = sigext (EA2);

	putmem (EA1, wd);
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}

void do_add () {

	unsigned long wd1, wd2;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	putmem (EA1, wd1 + wd2);
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}

void do_sub () {

	unsigned long wd1, wd2;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	putmem (EA1, wd1 - wd2);
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}
	
void do_mul () {

	unsigned long wd1, wd2;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	putmem (EA1, (unsigned long) ((long) wd1 * (long) wd2));
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}
	
void do_div () {

	unsigned long wd1, wd2;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	if (wd2 == 0) {
		failure ("DIVISION BY ZERO");
		return;
	}

	putmem (EA1, (unsigned long) ((long) wd1 / (long) wd2));
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}
	
void do_rem () {

	unsigned long wd1, wd2;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	if (wd2 == 0) {
		failure ("DIVISION BY ZERO");
		return;
	}

	putmem (EA1, (unsigned long) ((long) wd1 % (long) wd2));
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}
	
void do_ocs () {

	unsigned long wd1, wd2;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	putmem (EA1, wd2);
	if (FAILURE)
		return;

	putmem (EA2, wd1);
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}

void do_lnd () {

	unsigned long wd1, wd2;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	putmem (EA1, wd1 & wd2);
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}

void do_lor () {

	unsigned long wd1, wd2;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	putmem (EA1, wd1 | wd2);
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}

void do_lxr () {

	unsigned long wd1, wd2;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	putmem (EA1, wd1 ^ wd2);
	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}

void do_lsh () {

	unsigned long wd1, wd2, wm;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	wd2 &= 0x1f;

	wm = 0xffffffff << wd2;

	wd1 = ((wd1 >> (32 - wd2)) & (~wm)) | (wd1 << wd2);

	putmem (EA1, wd1);

	if (FAILURE)
		return;

	trace ();

	PC = MPC;
}

void do_cmp () {

	unsigned long wd1, wd2;

	wd1 = getmem (EA1);
	if (FAILURE)
		return;

	wd2 = getmem (EA2);
	if (FAILURE)
		return;

	if ((long) wd1 < (long) wd2) {
		CFG = -1;
	} else if ((long) wd1 == (long) wd2) {
		CFG = 0;
	} else {
		CFG = 1;
	}

	trace ();

	PC = MPC;
}

void do_jmp () {

	trace ();

	if (CODE->jtype > 1 || CFG == CODE->jtype)
		PC = EA1;
	else
		PC = MPC;
}
	
void do_hlt () {

	fprintf (stderr, "HALTED AT %08x AFTER %ld INSTRUCTIONS\n", PC, INSC);
	FAILURE = 1;
}

void badusage () {

	fprintf (stderr,
		"Usage: eniac -m mem -x bin [-i inp] [-o out] [-t deb|-]\n");
	exit (99);
}

int main (int argc, char *argv []) {

	char	*sfnam = NULL, *ifnam = NULL, *ofnam = NULL, *dfnam = NULL;
	int	bf, chunk, t;
	unsigned long	maxaddr, nwords, loc, cnt, lwa;

	while (1) {
		argc--;
		argv++;
		if (argc <= 0)
			break;
		if (argc < 2)
			badusage ();
		argc--;
		if (strcmp (*argv, "-m") == 0) {
			/* Memory spec */
			if (memsize != 0)
				badusage ();
			memsize = atoi (*++argv);
			if (memsize == 0)
				badusage ();
			continue;
		}
		if (strcmp (*argv, "-x") == 0) {
			if (sfnam != NULL)
				badusage ();
			sfnam = *++argv;
			continue;
		}
		if (strcmp (*argv, "-i") == 0) {
			if (ifnam != NULL)
				badusage ();
			ifnam = *++argv;
			continue;
		}
		if (strcmp (*argv, "-o") == 0) {
			if (ofnam != NULL)
				badusage ();
			ofnam = *++argv;
			continue;
		}
		if (strcmp (*argv, "-t") == 0) {
			if (dfnam != NULL)
				badusage ();
			dfnam = *++argv;
			continue;
		}
		badusage ();
	}

	if (sfnam == NULL)
		badusage ();

	if ((bf = open (sfnam, O_RDONLY)) < 0) {
		perror ("Cannot open image file");
		exit (99);
	}

	if (memsize == 0)
		memsize = DEF_MEMSIZE;

	memory = (unsigned long*) malloc (memsize * sizeof (unsigned long));
	if (memory == NULL) {
		fprintf (stderr, "Cannot get %x (%d) memory words\n", memsize,
				memsize);
		exit (99);
	}
	bzero (memory, memsize * sizeof (unsigned long));

	chunk = 0;
	maxaddr = 0;
	nwords = 0;

	while (1) {
		if (readb (bf, &loc, 1, 1) < 1)
			break;
		if (readb (bf, &cnt, 1, 1) < 1) {
			fprintf (stderr,
				"Incomplete image file, chunk %1d\n",
					chunk);
			exit (99);
		}
		if (cnt == 0)
			continue;
		lwa = loc + cnt;
		if (lwa > memsize || lwa <= loc) {
			fprintf (stderr,
				"Memory overflow while loading chunk %1d\n",
					chunk);
			fprintf (stderr,
				"Loc = %08x, Cnt = %08x (%1d)\n",
					loc, cnt, cnt);
			exit (99);
		}
		if (lwa > maxaddr)
			maxaddr = lwa;
		t = readb (bf, memory + loc, cnt, 1);
		if (t < cnt) {
			fprintf (stderr, "Image ends prematurely, chunk %1d\n",
				chunk);
			fprintf (stderr,
			      "Loc = %08x, Cnt = %08x (%1d), was %08x (%1d)\n",
					loc, cnt, t);
			exit (99);
		}
		chunk++;
		nwords += cnt;
	}

	close (bf);

	if (maxaddr == 0) {
		fprintf (stderr, "Empty program, no run\n");
		exit (0);
	}

	fprintf (stderr, "%1d words loaded, lwa+1 = %08x\n", nwords, maxaddr);

	if (ifnam != NULL) {
		if ((IFD = open (ifnam, O_RDONLY)) < 0) {
			perror ("Cannot open input file");
			exit (99);
		}
	} else {
		IFD = 0;
	}

	if (ofnam != NULL) {
		if ((OFD = open (ofnam, O_WRONLY | O_TRUNC | O_CREAT, 0644))
		    < 0) {
			perror ("Cannot open output file");
			exit (99);
		}
	} else {
		OFD = 1;
	}

	DFS = NULL;

	if (dfnam != NULL) {
		if (strcmp (dfnam, "-") == 0) {
			DFS = stdout;
		} else {
			DFS = fopen (dfnam, "w");
			if (DFS == NULL) {
				perror ("Cannot open trace file");
				exit (99);
			}
		}
	}
	

	PC = INITPC;
	CFG = 0;
	INSC = 0;

	while (!FAILURE) {
		execute ();
		INSC++;
	}
}
