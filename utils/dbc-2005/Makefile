.c.o:
	cc -c $<

all: dbconv clean

install: dbconv
	cp dbconv /usr/local/bin
	chmod 755 /usr/local/bin/dbconv
	cp dbconv.1 /usr/local/man/man1
	chmod 644 /usr/local/man/man1/dbconv.1

dist:
	tar -cvf DBC.tar *
	compress DBC.tar

dbconv: DBConv.o dbsetup.o dbproc.o dbconv.h
	cc -g -o dbconv DBConv.o dbsetup.o dbproc.o

clobber: clean
	@rm dbc

clean:
	@rm -f *.o
	@rm -f core
	@rm -f DBC.tar
	@rm -f DBC.tar.Z

