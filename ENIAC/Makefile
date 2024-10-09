#
eniac:	eniac.c
	gcc -o eniac eniac.c

primes:	primes.eas eniac
	./eas primes.eas primes.bin primes.lis
	echo "enter a number and then ^D"
	./i2bin | ./eniac -x primes.bin | ./bin2i | more