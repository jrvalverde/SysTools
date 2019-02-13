#define _GNU_SOURCE
#include <stdio.h>
#include <dlfcn.h>

#include <sys/types.h>
#include <unistd.h>

/*
 * open-whom.c, intercep open and record who opens what.
 */

// Pointer to the original open() call
static FILE * (*_fopen)(const char *path, const char *mode) = NULL;

/*
 * open, intercepted open call
 */

FILE *fopen(const char *filename, char *modes) {

    // Initialize _open(), if needed.
    if (_fopen == NULL) {
        _fopen = (FILE *(*)(const char *path, const char *mode)) dlsym(RTLD_NEXT, "fopen");
    }

    printf("File %s fopen by %d\n", filename, getpid());
    // continue as normal open
    return _fopen(filename, modes);

}
