#include <sys/types.h>
#include <stdio.h>

main() {
	int i;

	for (i = 0; i < 10; i++) {
		if (fork() == 0) {
			fprintf(stderr, "%d ", i);
			sleep(1);
			exit(i);
		}
	}
	fprintf(stderr, "\nparent goes to sleep!\n");
	sleep(100);
	exit(0);
}
