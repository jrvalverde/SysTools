/*
 * open-whom.c
 *
 *	Intercept call to open() and open64() to learn who's opening what
 *
 *	For more details see bottom.
 *
 *	(C) José R. Valverde, EMBnet/CNB, 7-Jun-2008
 *	This code is licensed under GNU GPL.
 *	$log
 */
#define _GNU_SOURCE
#include <stdio.h>
#include <dlfcn.h>
#include <stdlib.h>

#include <sys/types.h>
#include <unistd.h>
#include <dlfcn.h>

#include <string.h>

#define FILE2WATCH  "file_to_watch"

/*
 * open-whom.c, intercep open and record who opens what.
 */

// Pointer to the original open() call
static int (*_open)(const char *path, int oflag, mode_t mode) = NULL;

// Pointer to the original open64() call
static int (*_open64)(const char *path, int oflag, mode_t mode) = NULL;

/*
 * open, intercepted open call
 */

int open(const char *path, int oflag, mode_t mode) {
    char buffer[8192];

    // Initialize _open(), if needed.
    if (_open == NULL) {
        _open = (int (*)(const char *path, int oflag, mode_t mode)) dlsym(RTLD_NEXT, "open");
    }


    if (strstr(path, FILE2WATCH) == NULL) {
    	printf("File %s open by %d\n", path, getpid());
    	snprintf(buffer, 8191, "unset LD_PRELOAD; cat /proc/%d/cmdline;echo\n", getpid());
    	system(buffer);
    }
    // continue as normal open
    return _open(path, oflag, mode);

}
#ifndef NOTDEF
/*
 * open, intercepted open call
 */

int open64(const char *path, int oflag, mode_t mode) {
    char buffer[8192];

    // Initialize _open64(), if needed.
    if (_open64 == NULL) {
        _open64 = (int (*)(const char *path, int oflag, mode_t mode)) dlsym(RTLD_NEXT, "open64");
    }

    if (strstr(path, FILE2WATCH) == NULL) {
    	printf("File %s open64 by %d\n", path, getpid());
    	snprintf(buffer, 8191, "unset LD_PRELOAD; cat /proc/%d/cmdline; echo\n", getpid());
    	system(buffer);
    }
    // continue as normal open
    return _open64(path, oflag, mode);

}
#endif

/*
From: "Jose R. Valverde" <jrvalverde@cnb.csic.es>
To: David Garc�a Aristegui <aristegui@cbm.uam.es>
Subject: Re: Ayuda
Date: Mon, 9 Jun 2008 09:28:18 +0200

Vale, olv�dalo y vamos a por la l�nea dura, que es m�s segura.

LD_PRELOAD
----------

En los UNIX modernos (desde 1995-1997 aprox) el cargador de librer�as
din�micas puede leer esta variable de entorno: LD_PRELOAD contiene una
lista de librer�as din�micas que se cargar�n ANTES que las que se
cargar�an normalmente

Eso quiere decir que puedes interceptar cualquier llamada de librer�a
interponiendo antes tu propia versi�n.

dld
---

Es como se llama la "librer�a" de manejo de librer�as din�micas. Entre
otras cosas te permite redirigir una llamada a otra librer�a que se cargue
posteriormente (en realidad lo que haces es resolver el s�mbolo con una
librer�a posterior y guardarte un puntero).

libc
----
Es la librer�a C est�ndar. En la mayor�a de los UNIX t� no llamas a los
servicios del sistema directamente, sino que lo haces a trav�s de unos
"mu�ones" que se incluyen en la librer�a C.

El sistema
----------
Para creaci�n de ficheros ofrece solo dos servicios 'creat' y 'open'. Otras
rutinas las ofrece libc sobre estos dos (por ejemplo 'fopen' normalmente
llama por debajo a 'open').

El truco
--------
Podemos aprovechar que la mayor�a de programas y lenguajes interpretados
est�n escritos en C para interceptar las llamadas de acceso a ficheros.

En lugar de interceptarlas todas, lo m�s sencillo es interceptarlas al
nivel m�s bajo posible para interceptar las menos posibles: si interceptamos
las llamadas al sistema, todas las rutinas que las usen pasar�n por nuestro
interceptor tambi�n. Para eso nos creamos una implementaci�n alternativa, 
que haga lo que queremos nosotros y la cargamos antes con LD_PRELOAD.

En este caso, suponiendo que solo se use 'open' (lo m�s probable) y no
'creat', podemos hacer una rutina 'open()' nuestra que
	- nos diga lo que queremos
	- llame al 'open' de verdad

Como nuestra rutina tiene que llamarse 'open' para que el cargador din�mico
la use en lugar de la aut�ntica, que se llama igual, para que podamos llamar
a la aut�ntica necesitamos abusar de las rutinas de manejo de librer�as
din�micas (dld) directamente: pedimos a dld que resuelva el s�mbolo 'open'
pero no con nosotros sino con alguna de las librer�as que vienen detr�s,
y usamos su direcci�n para llamarla.

La implementaci�n
-----------------

En el caso de Linux tenemos un 'problemilla': LINUX usa glibc que para ser
general echa mano de much�simos trucos. Adem�s LINUX empez� siendo de 32
bits y creci� a soportar acceso de 64 bits a ficheros. Si uno descifra el
c�digo de glibc (que no es f�cil) o si -m�s sencillo- usa 'ptrace' en varios
ejecutables para ver qu� llaman al final, se v� que hay dos implementaciones
de las rutinas de acceso a ficheros: una de 32 y otra de 64 bits, as� que
hay que interceptar ambas (open y open64). En otros UNIX no tiene por qu�
ser as� (p. ej. en BSD o Solaris basta con open).

Finalmente, para poder precargar tu c�digo �ste tiene que linkarse como
una librer�a din�mica, as� que hay que usar un "encantamiento" especial.

Tu parte
--------

Te env�o unos cuantos ficheros de ejemplo con su Makefile. El que te
interesa es 'open-whom.c'

Como no s� qu� quieres detectar, lo m�s f�cil es que 

	1) hagas un 'make open-whom'

	2) pruebes el comando con un par de ejecutables, p. ej.

	LD_PRELOAD="./open-whom.so" cat myfile
	LD_PRELOAD="./open-whom.so" loquesea

	3) tal como est� cada vez que se abre un fichero lista en
standard output qui�n lo ha creado y la l�nea de comandos (sin espacios,
lo siento). Con eso a lo mejor te basta, pero si se abren muchos 
ficheros puede salirte un listado horroroso. Aunque un "grep" de la
salida puede bastar, a lo mejor quieres ser m�s espec�fico. En ese caso 
tendr�s que modificar el c�digo C de 'open' y 'open64' (las dos por igual):

	#include <string.h>
	....
	open(..) {

		if (strcmp(filename, "ELFICHEROQUEBUSCO") == 0) {
			// hacer el printf
		}
	}

	4) Si eso no funciona, a lo mejor el pu�etero est� llamando a
'creat()' y tienes que interceptarlo tambi�n.

Porqu� me s� esto
-----------------

No es ning�n misterio. Empec� con UNIX que no ten�an librer�as din�micas,
y las v� aparecer. Justo cuando me ven�a al CNB los de IRIX a�adieron el
soporte para LD_PRELOAD de tal forma que era trivial explotarlo para abusar
del sistema y sali� la noticia en todos los foros de seguridad.

A�n hoy se puede explotar, y se sigue discutiendo si los ejecutables del
sistema deben linkarse est�ticamente, ignorar LD_PRELOAD, ser un caso
especial o qu�...

Por cierto, en MacOS X la variable de entorno tiene un nombre distinto:
DYLD_INSERT_LIBRARIES
				j


On Fri, 6 Jun 2008 12:17:32 +0200
David Garc�a Aristegui <aristegui@cbm.uam.es> wrote:
> Joder, eres un crack, voy a probar todo esto y te digo.
> 
> En el segundo ejemplo, cuando hablas de "El programa no podr� borrarlo y 
> tendr� que dar un mensaje de error", �donde encontrar�a ese mensaje de error?
> �queda reflejado en alg�n log del sistema?
> 
> ���Gracias!!!
> 
> On Friday 06 June 2008 12:18, you wrote:  
> > On Fri, 6 Jun 2008 11:46:22 +0200
> >
> > David Garc�a Aristegui <aristegui@cbm.uam.es> wrote:  
> > > A ver, hay un GUI que genera un fichero en un determinado directorio. Ese
> > > GUI lo �nico que hace es llamar a determinados scripts en perl y bash.
> > >
> > > Se genera un fichero en un directorio, pero no consigo "cazar" que script
> > > o programa lo genrera... �como har�as t� para hacerlo?
> > >
> > > No consigo "pillarlo" ni a trav�s de ps -auxf ni no lsof. �Ideas?
> > > ���Muchas gracias!!!  
> >
> > Puedes probar a crear un pipe con el nombre del fichero antes de que �ste
> > se cr�e.
> >
> > 	mknod fichero p
> >
> > Si el programa que lo crea lo que hace es abrir para escritura (lo m�s
> > simple) entonces se encontrar� el fichero existente, lo abrir� y
> > escribir� en �l. Como es un pipe y no hay nadie al otro lado para
> > leer se quedar� bloqueado a espera de que alguien lea... esa es tu
> > oportunidad: lsof y lo has cazado.
> >
> > Si el programa comprueba si existe y lo borra antes de crear uno nuevo
> > entonces el truco es sencillo: que el fichero lo cree root antes. El
> > programa no podr� borrarlo y tendr� que dar un mensaje de error. Pillado.
> > Esto puede requerir que el directorio pertenezca a root tambi�n.
> >
> > Si el programa lo abre pero no escribe, entonces no se colgar� en un
> > pipe, y habr� que inventar otra cosa m�s compleja, pero no nos pongamos
> > en lo peor antes de tiempo.
> >
> > 				j  


-- 
	These opinions are mine and only mine. Hey man, I saw them first!

			    Jos� R. Valverde

	De nada sirve la Inteligencia Artificial cuando falta la Natural

*/
