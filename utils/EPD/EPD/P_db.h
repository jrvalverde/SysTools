/*
 *  P_DBANK.H
 *
 *	Header file with the definitions pertaining to module
 *  P_DBank.C. It is usually #included via P_Extern.H
 *
 *	Requires PORTABLE.H for definition of type status.
 *
 *	Designed by:
 *	    J. R. Valverde	8  - apr - 1990
 */

typedef void *db_t;

/*
 *  DB access functions
 */

extern db_t db_open(char *, int);

extern status db_next_protein(db_t, protein_t *);

extern status db_seek_protein(db_t, index_t *, protein_t *);

extern void db_name(db_t, char *);

extern void db_close(db_t);

extern int db_type(db_t);

extern status idx_open(char *);

extern status idx_close();

extern status idx_name(char *);

extern status get_index(index_t *);

/*
 *  Bank is closed now
 */

