/*
 * cerberus.c, Impossible statement 
 */

#include <stdio.h>

int main(int argc, char **argv) {
    int a = 13, b = 17;

    if (a != b) {
        printf("Sorry!\n");
        return 0;
    }

    printf("On a long enough timeline, the survival rate for everyone drops to zero\n");
    exit(1);
}
