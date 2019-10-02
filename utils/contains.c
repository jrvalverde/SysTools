#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    
    if (argc != 3) {
    	fprintf(stderr, "Error: `contains' needs two arguments\n");
    	exit(-1);
    }
    if (strstr(getenv("SHELL"), "csh") != NULL) {
    	/*
    	 * we are being called from a 'csh-like' shell (csh | tcsh):
    	 * true is '1' and false is '0'
    	 */
	if (strstr(argv[1], argv[2]) == NULL) {
	    printf("0\n");
	    exit(0);
	} else {
	    printf("1\n");
	    exit(1);
	}
    }
    /* else, behave for an 'sh-like' shell: true is '0' and false is '1' */
    if (strstr(argv[1], argv[2]) == NULL)
    	exit(1);
    else
    	exit(0);
}
