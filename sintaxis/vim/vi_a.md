===================
=     V I M       =
===================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ENTRAR/SALIR DE VIM
	Entrar a VIM:  		vim archivo.txt <ENTER>
	Salir de VIM:  		:q! <ENTER> 	(en modo Normal)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
MODOS:
	- Modo normal   	(modo default), se ingresa apretando <ESC>
	- Modo edición		se ingresa aprendando alguno de las siguientes teclas: i/I/a/A/r/R/o/O
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
MOVER EL CURSOR: (en modo normal)
	     ^
	     k		    
       < h	 l >	
	     j		
	     v
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERCIÓN:
	i		Ingresa a modo EDICION desde la posicion del cursor. (insert)
	I		Ingresa a modo EDICION desde el principio de linea.
	a		Ingresa a modo EDICION desde la posicion siguiente al cursor. (append)
	A		Ingresa a modo EDICION desde el final de la linea.
	o		Ingresa a modo EDICION desde inicio de fila anterior.
	O		Ingresa a modo EDICION desde inicio de fila posterior.		

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DELECIÓN:
	En modo edición:
		<supr> 
		<del>

	En modo normal:
		x			Borra caracter actual.
		X			Borra caracter anterior.
		d <dirección>		Borra caracter.
		D			Borra hasta el final de la linea. Igual que d$
		dd			Borra linea.
		dw			Borra hasta final de palabra.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
UNDO:
		u			UNDO
		<ctrl>r			REDO
		U			UNDO en toda la linea
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GUARDAR:

	Guardar y salir:	:wq <ENTER>
	Guardar sin salir:	:w  <ENTER>	
	Guardar en archivo:	:w <archivo> <ENTER>
	Guardar pedazo:		:li,lf w <archivo> <ENTER>  li=linea inicial lf=linea final 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NAVEGACION:
	gg	Ir a primer linea.
	G	Ir a ultima linea.
	nG	Ir a la linea n
	n%	Ir al la linea n-porciento 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
FORMATO DE COMANDOS:
	En modo normal el formato de comandos es:
	[numero] comando objeto

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NUMEROS:
	Presionando un numero (n) antes de un comando indicamos que tal comando sea repetido n veces.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
OBJETOS:
    w 	- hasta final de palabra (incluye espacio final).
    e   - hasta final de palabra (no incluye espacio final).
    $ 	- hasta final de linea.
    0	- hasta principio de linea
    ^	- hasta siguiente caracter no vacio
	Hay expeciones, por ejemplo:
		dd
		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
COPY/PASTE:
	y	copiar 
	Y	copiar linea
	p	pegar a continuación
	P	pegar antes de cursor

	** (en realidad dd es una forma de CORTAR)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
REMPLAZAR:
	r	remplazar caracter.
	R	entrar en modo REMPLAZO.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CAMBIAR:
	cw	cambiar caracteres hasta el final de palabra (los borra y entra a insert/mode)
	c[N]w	cambiar N palabras siguientes.
	C	cambiar hasta final de la linea (igual que c$)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
LOCALIZACION Y ESTADO
	<ctrl> g 	muestra posicion relativa del cursor en el archivo.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
BUSQUEDA
	/<patron><ENTER>	busca el patron en el archivo (hacia adelante)
	?<patron><ENTER>	busca el patron en el archivo (hacia atras)
	n			va al siguiente acierto		
	N			va al anterior  acierto
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
MATCHEO de PARENTESIS
	%			te lleva donde esta el par que corresponde con el (,[,{,),],}		
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
BUSCAR Y REEMPLAZAR:

	:s/<old>/<new> 		subsituye 'new' por 'old' en la primer aparicion en linea actual
	:s/<old>/<new>/g 	subsituye 'new' por 'old' en la linea actual
	:%s/<old>/<new>/g	subsituye 'new' por 'old' en todo el documento
	:%s/<old>/<new>/gc 	subsituye 'new' por 'old' en todo el documento (pide confirmacion en cada reemplazo)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
COMANDOS EXTERNOS

   :!<comando><ENTER>		ejecuta un comando externo
	Ejemplos:
		:!pwd
		:!ls
		:!rm <archivo>

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CONCATENAR ARCHIVOS
	:r <archivo>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
HELP COMMANDS

	- press the <HELP> key (if you have one)
	- press the <F1> key (if you have one)
	- type   :help <ENTER>

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE SCRIPT

  1. Start editing the "vimrc" file, this depends on your system:
	:edit ~/.vimrc			for Unix
	:edit $VIM/_vimrc		for MS-Windows

  2. Now read the example "vimrc" file text:

	:read $VIMRUNTIME/vimrc_example.vim

  3. Write the file with:

	:write

  The next time you start Vim it will use syntax highlighting.
  You can add all your preferred settings to this "vimrc" file.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
