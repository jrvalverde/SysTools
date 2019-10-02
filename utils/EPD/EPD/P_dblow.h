/*
 *  P_DBLOW.H
 *	Type definitions common to all low level database
 *  access operations.
 *
 *  The following type definition is made only for use by low 
 *  level database access modules. It should never be used nor
 *  seen on any other modules in the program. ALL DB ACCESS
 *  MUST BE DONE THROUGH THE FUNCTIONS PROVIDED BY P_DBANK.C
 *
 *  Designed by:
 *	J. R. Valverde	    JRAMON@emduam51.BitNet
 */

typedef struct db_st {
    FILE *db_fp;
    int  db_fd;
    char db_name[MAXPATH];
    char db_buffer[MAXLINE];
    int  db_linelen;
    long db_pos;
    int  db_type;
    status (*db_next_protein)();
} *db_t;

