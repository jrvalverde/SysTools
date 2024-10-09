
#define _GNU_SOURCE
#include <stdio.h>
#include <dlfcn.h>
#include <stdarg.h>

/*
 * megatron.c, Making the impossible possible!
 */

// Pointer to the original printf() call
static int (*_printf)(const char *format, ...) = NULL;

/*
 * printf, One nasty function!
 */

int printf(const char *format, ...) {

        if (_printf == NULL) {
                _printf = (int (*)(const char *format, ...)) dlsym(RTLD_NEXT, "printf");

                // Hijack the RET address and modify it to <main+66>
                __asm__ __volatile__ (
                        "movl 0x4(%ebp), %eax \n"
                        "addl $15, %eax \n"
                        "movl %eax, 0x4(%ebp)"
                );

                return 1;
        }

        // Rewind ESP and JMP into _PRINTF()
        __asm__ __volatile__ (
                "addl $12, %%esp \n"
                "jmp *%0 \n"
                : /* no output registers */
                : "g" (_printf)
                : "%esp"
                );

        /* NEVER REACH */
        return -1;
}
