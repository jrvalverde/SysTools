#include <regex.h>
#include <stdio.h>

/*
 * Match string against the extended regular expression in
 * pattern, treating errors as no match.
 *
 * Return 1 for match, 0 for no match.
 */


int
match(const char *string, char *pattern)
{
    int    status;
    regex_t    re;


    if (regcomp(&re, pattern, REG_EXTENDED|REG_NOSUB) != 0) {
        return(0);      /* Report error. */
    }
    status = regexec(&re, string, (size_t) 0, NULL, 0);
    regfree(&re);
    if (status != 0) {
        return(0);      /* Report error. */
    }
    return(1);
}

int main(const int argc, const char *argv[])
{
    char line[8192];
    char *pattern;
    int    status;
    regex_t    re;

    if (argc != 2) return(0);
    
    pattern= argv[1];
    


    if (regcomp(&re, pattern, REG_EXTENDED|REG_NOSUB) != 0) {
        return(0);      /* Report error. */
    }
    while (fgets(line, 8192, stdin) != NULL)
    	if (regexec(&re, line, (size_t) 0, NULL, 0) == 0)
	    printf("%s", line);

    regfree(&re);
}
