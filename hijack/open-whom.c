/*
 * open-whom.c
 *
 *	Intercept call to open() and open64() to learn who's opening what
 *
 *	For more details see bottom.
 *
 *	(C) JosÃ© R. Valverde, EMBnet/CNB, 7-Jun-2008
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
To: David García Aristegui <aristegui@cbm.uam.es>
Subject: Re: Ayuda
Date: Mon, 9 Jun 2008 09:28:18 +0200

Vale, olvídalo y vamos a por la línea dura, que es más segura.

LD_PRELOAD
----------

En los UNIX modernos (desde 1995-1997 aprox) el cargador de librerías
dinámicas puede leer esta variable de entorno: LD_PRELOAD contiene una
lista de librerías dinámicas que se cargarán ANTES que las que se
cargarían normalmente

Eso quiere decir que puedes interceptar cualquier llamada de librería
interponiendo antes tu propia versión.

dld
---

Es como se llama la "librería" de manejo de librerías dinámicas. Entre
otras cosas te permite redirigir una llamada a otra librería que se cargue
posteriormente (en realidad lo que haces es resolver el símbolo con una
librería posterior y guardarte un puntero).

libc
----
Es la librería C estándar. En la mayoría de los UNIX tú no llamas a los
servicios del sistema directamente, sino que lo haces a través de unos
"muñones" que se incluyen en la librería C.

El sistema
----------
Para creación de ficheros ofrece solo dos servicios 'creat' y 'open'. Otras
rutinas las ofrece libc sobre estos dos (por ejemplo 'fopen' normalmente
llama por debajo a 'open').

El truco
--------
Podemos aprovechar que la mayoría de programas y lenguajes interpretados
están escritos en C para interceptar las llamadas de acceso a ficheros.

En lugar de interceptarlas todas, lo más sencillo es interceptarlas al
nivel más bajo posible para interceptar las menos posibles: si interceptamos
las llamadas al sistema, todas las rutinas que las usen pasarán por nuestro
interceptor también. Para eso nos creamos una implementación alternativa, 
que haga lo que queremos nosotros y la cargamos antes con LD_PRELOAD.

En este caso, suponiendo que solo se use 'open' (lo más probable) y no
'creat', podemos hacer una rutina 'open()' nuestra que
	- nos diga lo que queremos
	- llame al 'open' de verdad

Como nuestra rutina tiene que llamarse 'open' para que el cargador dinámico
la use en lugar de la auténtica, que se llama igual, para que podamos llamar
a la auténtica necesitamos abusar de las rutinas de manejo de librerías
dinámicas (dld) directamente: pedimos a dld que resuelva el símbolo 'open'
pero no con nosotros sino con alguna de las librerías que vienen detrás,
y usamos su dirección para llamarla.

La implementación
-----------------

En el caso de Linux tenemos un 'problemilla': LINUX usa glibc que para ser
general echa mano de muchísimos trucos. Además LINUX empezó siendo de 32
bits y creció a soportar acceso de 64 bits a ficheros. Si uno descifra el
código de glibc (que no es fácil) o si -más sencillo- usa 'ptrace' en varios
ejecutables para ver qué llaman al final, se vé que hay dos implementaciones
de las rutinas de acceso a ficheros: una de 32 y otra de 64 bits, así que
hay que interceptar ambas (open y open64). En otros UNIX no tiene por qué
ser así (p. ej. en BSD o Solaris basta con open).

Finalmente, para poder precargar tu código éste tiene que linkarse como
una librería dinámica, así que hay que usar un "encantamiento" especial.

Tu parte
--------

Te envío unos cuantos ficheros de ejemplo con su Makefile. El que te
interesa es 'open-whom.c'

Como no sé qué quieres detectar, lo más fácil es que 

	1) hagas un 'make open-whom'

	2) pruebes el comando con un par de ejecutables, p. ej.

	LD_PRELOAD="./open-whom.so" cat myfile
	LD_PRELOAD="./open-whom.so" loquesea

	3) tal como está cada vez que se abre un fichero lista en
standard output quién lo ha creado y la línea de comandos (sin espacios,
lo siento). Con eso a lo mejor te basta, pero si se abren muchos 
ficheros puede salirte un listado horroroso. Aunque un "grep" de la
salida puede bastar, a lo mejor quieres ser más específico. En ese caso 
tendrás que modificar el código C de 'open' y 'open64' (las dos por igual):

	#include <string.h>
	....
	open(..) {

		if (strcmp(filename, "ELFICHEROQUEBUSCO") == 0) {
			// hacer el printf
		}
	}

	4) Si eso no funciona, a lo mejor el puñetero está llamando a
'creat()' y tienes que interceptarlo también.

Porqué me sé esto
-----------------

No es ningún misterio. Empecé con UNIX que no tenían librerías dinámicas,
y las ví aparecer. Justo cuando me venía al CNB los de IRIX añadieron el
soporte para LD_PRELOAD de tal forma que era trivial explotarlo para abusar
del sistema y salió la noticia en todos los foros de seguridad.

Aún hoy se puede explotar, y se sigue discutiendo si los ejecutables del
sistema deben linkarse estáticamente, ignorar LD_PRELOAD, ser un caso
especial o qué...

Por cierto, en MacOS X la variable de entorno tiene un nombre distinto:
DYLD_INSERT_LIBRARIES
				j


On Fri, 6 Jun 2008 12:17:32 +0200
David García Aristegui <aristegui@cbm.uam.es> wrote:
> Joder, eres un crack, voy a probar todo esto y te digo.
> 
> En el segundo ejemplo, cuando hablas de "El programa no podrá borrarlo y 
> tendrá que dar un mensaje de error", ¿donde encontraría ese mensaje de error?
> ¿queda reflejado en algún log del sistema?
> 
> ¡¡¡Gracias!!!
> 
> On Friday 06 June 2008 12:18, you wrote:  
> > On Fri, 6 Jun 2008 11:46:22 +0200
> >
> > David García Aristegui <aristegui@cbm.uam.es> wrote:  
> > > A ver, hay un GUI que genera un fichero en un determinado directorio. Ese
> > > GUI lo único que hace es llamar a determinados scripts en perl y bash.
> > >
> > > Se genera un fichero en un directorio, pero no consigo "cazar" que script
> > > o programa lo genrera... ¿como harías tú para hacerlo?
> > >
> > > No consigo "pillarlo" ni a través de ps -auxf ni no lsof. ¿Ideas?
> > > ¡¡¡Muchas gracias!!!  
> >
> > Puedes probar a crear un pipe con el nombre del fichero antes de que éste
> > se crée.
> >
> > 	mknod fichero p
> >
> > Si el programa que lo crea lo que hace es abrir para escritura (lo más
> > simple) entonces se encontrará el fichero existente, lo abrirá y
> > escribirá en él. Como es un pipe y no hay nadie al otro lado para
> > leer se quedará bloqueado a espera de que alguien lea... esa es tu
> > oportunidad: lsof y lo has cazado.
> >
> > Si el programa comprueba si existe y lo borra antes de crear uno nuevo
> > entonces el truco es sencillo: que el fichero lo cree root antes. El
> > programa no podrá borrarlo y tendrá que dar un mensaje de error. Pillado.
> > Esto puede requerir que el directorio pertenezca a root también.
> >
> > Si el programa lo abre pero no escribe, entonces no se colgará en un
> > pipe, y habrá que inventar otra cosa más compleja, pero no nos pongamos
> > en lo peor antes de tiempo.
> >
> > 				j  


-- 
	These opinions are mine and only mine. Hey man, I saw them first!

			    José R. Valverde

	De nada sirve la Inteligencia Artificial cuando falta la Natural

*/
