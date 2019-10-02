/*
 * sshid.c
 *
 *	Show hidden characters in a file.
 *
 *	Useful to understand the format of unknown files.
 *
 *  NOTE: I know, I know, but this is intended only as a help aid
 *	for personal use and not as a tool. Just a Q&D no brainer, 
 *	'one-liner', written in olden times of yonder.
 *
 *	(C) José R. Valverde (April, 1991)
 *	JRamon@uamed.uam.es
 *
 *	(C) José R. Valverde (July, 2005)
 *	jrvalverde@acm.org
 *
 *  LICENSE
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * $Id: shhid.c,v 1.1 2005/08/03 08:02:32 root Exp $
 * $Log: shhid.c,v $
 * Revision 1.1  2005/08/03 08:02:32  root
 * Initial revision
 *
 */
#include <stdio.h>

void main()
{
    int ch, *p;
    char fnam[128];
    FILE *fp;

#ifdef INTERACTIVE
    printf("Name of file: ");
    fgets(fnam, 128, stdin);
    for (p = fnam; *p; p++)
    	if (*p == '\n')
		*p = '\0';
    if ((fp = fopen(fnam, "r")) == NULL)
	exit(4);
#else
    fp = stdin;
#endif

    while (!feof(fp)) {
	ch = fgetc(fp);
	switch (ch) {
	case '\0':		/* null */
	    printf("<NUL>");
	    break;
	case '\001':		/* start of header */
	    printf("<SOH>");
	    break;
	case '\002':
	    printf("<STX>");	/* start of text */
	    break;
	case '\003':
	    printf("<ETX>");	/* end of text */
	    break;
	case '\004':
	    printf("<EOT>");	/* end of transmission */
	    break;
	case '\005':
	    printf("<ENQ>");	/* enquire */
	    break;
	case '\006':
	    printf("<ACK>");	/* acknowledge */
	    break;
	case '\007':
	    printf("<BEL>\a");	/* bell */
	    break;
	case '\010':
	    printf("<BS>\b");	/* back space */
	    break;
	case '\t':
	    printf("<HT>\t");	/* horizontal tab */
	    break;
	case '\n':
	    printf("<LF>\n");	/* line feed */
	    break;
	case '\13':
	    printf("<VT>\v");	/* vertical tab */
	    break;
	case '\014':
	    printf("<FF>\f");	/* form feed */
	    break;
	case '\r':
	    printf("<CR>\n");	/* carriage return */
	    break;
	case '\016':
	    printf("<SO>");	/* shift out */
	    break;
	case '\017':
	    printf("<SI>");	/* shift in */
	    break;
	case '\020':
	    printf("<DLE>");	/* data link escape */
	    break;
	case '\21':
	    printf("<DC1>");	/* device control 1 */
	    break;
	case '\022':
	    printf("<DC2>");	/* device control 2 */
	    break;
	case '\023':
	    printf("<DC3>");	/* device control 3 */
	    break;
	case '\024':
	    printf("<DC4>");	/* device control 4 */
	    break;
	case '\025':
	    printf("<NAK>");	/* negative acknowledge */
	    break;
	case '\026':
	    printf("<SYN>");	/* synchronize */
	    break;
	case '\027':
	    printf("<ETB>");	/* end of transmission block */
	    break;
	case '\030':
	    printf("<CAN>");	/* cancel */
	    break;
	case '\031':
	    printf("<EM>");	/* end of media */
	    break;
	case '\032':
	    printf("<SUB>");	/* substitute */
	    break;
	case '\033':
	    printf("<ESC>");	/* escape */
	    break;
	case '\034':
	    printf("<FS>");	/* field separator */
	    break;
	case '\035':
	    printf("<GS>");	/* group separator */
	    break;
	case '\036':
	    printf("<RS>");	/* record separator */
	    break;
	case '\037':
	    printf("<US>");	/* unit separator */
	    break;
	case EOF:
	    printf("<EOF>\n");
	    break;
	default:
	    printf("%c", ch);
	    break;
	}
    }

    fclose(fp);
    return;
}
