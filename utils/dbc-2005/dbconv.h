/*
 *	DBconv.h
 *
 *		Header file for DBconv.c
 *
 *	Author:
 *		Jose R. Valverde	(July, 27th, 2005)
 *		jrvalverde@acm.org
 *
 *		J. R. Valverde		(April, 19th, 1991)
 *		Biomedical Research Institute, Madrid. SPAIN
 *
 *		JRamon@uamed.uam.es
 *		JRamon@ccuam1.uam.es
 *		JRamon@cnbvx1.uam.es
 *
 *		JRamon@EMDUAM51.Bitnet
 *
 *	License:
 *   This file is part of dbconv.
 *
 *   dbconv is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   dbconv is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Foobar; if not, write to the Free Software
 *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * $Id: dbconv.h,v 1.1 2005/08/03 08:02:32 root Exp $
 * $Log: dbconv.h,v $
 * Revision 1.1  2005/08/03 08:02:32  root
 * Initial revision
 *
 */

#define MAXFIELDS		64
#define FLD_DEF_SIZE	512
#define FLD_INC_SIZE	512
#define MAXLINE			512
#define MAXPATHLEN		64

#define TRUE	1
#define FALSE	0

#define YES				TRUE
#define NO				FALSE

#ifdef VMS
#define VMS_WARNING	(0 | 0x8000000 | 0x10000000)
#define VMS_SUCCESS	(1 | 0x8000000 | 0x10000000)
#define VMS_ERROR	(2 | 0x8000000 | 0x10000000)
#define VMS_INFO	(3 | 0x8000000 | 0x10000000)
#define VMS_FATAL	(4 | 0x8000000 | 0x10000000)

#define EXIT_OK			VMS_SUCCESS

#define NO_FIELDS_GIVEN	VMS_ERROR
#define NO_REC_DELIM	VMS_ERROR
#define FILE_NOT_FOUND	VMS_ERROR
#define FIELD_OVERFLOW	VMS_FATAL
#define MEMORY_OVERFLOW	VMS_FATAL
#define OUT_FILE_ERROR	VMS_FATAL

#else
/* sh convention (under csh OK would be 1) */
#define EXIT_OK     	0
#define NO_FIELDS_GIVEN	1
#define NO_REC_DELIM	1
#define FILE_NOT_FOUND	1
#define FIELD_OVERFLOW	2
#define MEMORY_OVERFLOW	2
#define OUT_FILE_ERROR	2

#endif

typedef struct {
    int fld_nmbr;		/* Actual number of fields */
    char *fld_name[MAXFIELDS];	/* Field names */
    char *fld_text[MAXFIELDS];	/* Field contents */
    int fld_size[MAXFIELDS];	/* Field sizes */
    char *rec_dlmt;		/* End of record delimiter */
} record_t;

#define flag unsigned char
#define bool int
