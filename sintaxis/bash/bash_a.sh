# ########################################################### #
###   BÁSICO LINUX
#' Many people speak of “freedom” with regard to Linux, but I don’t think
# most people know what this freedom really means. 
#  Freedom is the power to decide what your computer does, and the only way
# to have this freedom is to know what your computer is doing. Freedom is 
# a computer that is without secrets, one where everything can be known if
# you care enough to find out. '
#					William E. Shotts, Jr.
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## ESTRUCTURA de CARPETAS
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
/ #Root
• /bin ­­  #essential user binaries 
• /boot ­­ #files required to boot  
• /dev ­­  #devices (everything from drives to displays) 
• /etc ­­  #Configuration files 
• /home ­­ #For stored user files and folders (each user has his own home)
• /lib ­­  #essential shared libraries (similar to Program Files) 
• /media #removable media devices (usb/external disks,etc.)
• /mnt	 #mount directory
• /opt   #optional software packages
• /proc  #kernel stuff (files that represent system & process information)
• /root  #the home dir of the root-user
• /run	 #place for apps to store temporal files
• /sbin ­­ #system­only binaries
• /srv   #data for services provided by the system
• /sys ­­  #contains information about the system 
• /usr   #programas instalados en usr/lib
	/usr/bin	 
	/usr/lib	
	/usr/share	
 	/usr/local  
• /var	 #variable files (is the writable conterpart to the /usr dir)
• /tmp   #temporal files
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## COMANDOS BÁSICOS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
ctrl+alt+T   #(abrir terminal)
ctrl+shift+t #(abre nueva pestaña en la terminal)
exit   	     #(cierra terminal)
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#Shell Prompt
"[username@machinename]-directory"

#Estructura típica de comandos:
<comando> -<opc> <arg1> <arg2> ... <argN>
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#Ayuda
help              # muestra comandos y sus argumentos.
<comando> --help  # Te da información sobre el comando.
# -----------------------------------------------------------#
clear   # ='ctrl+l' #limpiar pantalla (muyyy util)
# -----------------------------------------------------------#
#Moverse:
pwd 	# muestra directorio actual 
ls 	# muestra lista de archivos del directorio actual> ~ dir
cd	# cambia de directorio
# 
#Busqueda:
find <patron>   #Busca en directorio archivos con patron y los lista.
locate <patron> 

#RegExpr.:
grep <patron>  #Busca patron siempre se usa junto con |
# 
#Crear/Borrar
mkdir   # crea directorio nuevo 
rmdir	# elimina directorio 

rm      # elimina archivo del directorio actual
mv	# mover/renombrar archivo> "mv <rutaactual> <rutanueva>"
cp      # copiar archivo
ln      # linkea (ahorra memoria) ~ "acceso directo"
	# -s (simbolico) es el más comun
# -----------------------------------------------------------#
#Standard I/O 
echo 'Holaaa..' # stdout
cat 		# stdin
read variable	# Recibe input y lo guarda en $variable

| 		#'pipe': concatena comandos
tee archivo	# recibe stdin, lo guarda en 'archivo' y pasa como stdout

#Redireccionar output:
echo 'Holis' > archivo.txt	#Agarra el stdout y lo mete en 'archivo.txt'
echo 'otra vez!' >> archivo.txt	#Agarra el stdout y lo mete en 'archivo.txt' (sin sobreescribirlo)
# -----------------------------------------------------------#
#Editores:
sed      # Stream EDitor (editor al paso..)
less	 # Editor de bajo nivel
vi       # "Vee Eye" editor base: RECOMIENDO! (está casi siempre disponible) 
nano     # Otro editor (le gusta a Juli)
gedit	 # Editor muy amigable
dd	 # Convierte/copia archivos de un formato a otro.

more	#muestra contenido del archivo
head	#muestra primer parte del archivo
tail	#muestra ultima parte del archivo


diff <arc1> <arch2> #muestra diferencia entre archivos

uniq	#muestra filas unicas del archivo

sort	#ordena archivos
split	#divide archivos en partes iguales
wc	#cuenta palabras del archivo/bits
# -----------------------------------------------------------#
#Ejecutables/programas:

compgen -c 			#lista de todos los ejecutables.
compgen -c | grep <pattern>	#muestra ejecutables con nombre ~ <pattern>

which firefox			#muestra la ruta (donde está) el ejecutable
ldd <ejecutable>		#lista las dependencias del ejecutable
<programa> input		#abrir archivo con el programa.

#Compilación:
make 				#compilar un programa grande (hay que armar un makeFile)

gfortran script.f		#compilar un script de Fortran:
gcc script.h			#compilar un script de C/C++
ghc script.hs			#compilar un script de Haskell

./<ejecutable>			#forma típica de ejecución de binarios.
# -----------------------------------------------------------#
#Info:
date 	#fecha
cal	#calendario cool

uname #S.O

#Info de archivos
file <archivo>			#te muestra tipo de archivo
stat <archivo>  		#te muestra el estado del archivo
chmod <opcion> <archivo>	#cambiar modo de archivo 
				#(<r>lectura/<w>escritura/<x>ejecucion)

#Info del sistema
ps	      # muestra procesos: -A  -s -ef
kill <pID>    # mata proceso (pID)  OJOOO CON ESTO!!

df		#disk-space utilizado por file systems.
du		#Archivos y tamaño en dispositivo de almacenamiento
env		#Muestra variables de entorno
# -----------------------------------------------------------#
#VARIABLES:

MI_VAR= "mi_variable"  	 #Definir variable temporal $MI_VAR

export MI_VAR='my value' #Exportar variable a env

# Variables de entorno utiles:
 $DISPLAY	#nombre del display
 $EDITOR	#nombre del programa usado para editar texto
 $SHELL		
 $HOME	
 $LANG	
 $OLD_PWD	
 $PAGER	
 $PATH	
 $PS1		
 $PWD		
 $TERM	
 $TZ		
 $USER

# -----------------------------------------------------------#
# Compresor:
tar	# comprime (-c)
	# extrae   (-x)
	# muestra  (-tf)
# -----------------------------------------------------------#
#Boludeces:
#-- nada (HASTA EL MOMENTO!)
# ########################################################### #
﻿#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## Part I - The S H E L L
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#4- Exploring the system:
● ls   (lista contenido del directorio)
	-l formato detallado
	-a muestra todo
	-S ordenado por tamaño
	-t ordenado por fecha de modific
● file (dice que tipo de archivo es)
● less (ver contenido del archivo)


#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#5- Manejo de archivos y directorios:
● cp – Copy files and directories
	-a default
	-i interactivo
	-r recursivo
	-u no reemplace si ya existe.
	-v mensaje informativo
● mv – Move/rename files and directories
	mv item1 item2
	-i ; -v; -u
● mkdir – Create directories
● rm – Remove files and directories
  	 -i; -v; -u
● ln – Create hard and symbolic links

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#6- Trabajando con COMANDOS:
< como obtener Informacion sobre los comandos >
● type –   (tipo de comando)
● which –  (donde se ejecuta)
● man –    (Display a commands manual page)
● help
● apropos – Display a list of appropriate commands
● info – Display a commands info entry
● whatis – brief description of a command
● alias – Create an alias for a command

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#7- I/O (input/output) Redirection  
<¡¡IMPORTANTISIMO!!> manejo de inputs, outputs y errores

● ">"  guarda output en archivo: Ej: "ls > ls_output.txt" (si no existe lo crea)
● ">>"  anexa el output al documento existente
 	">2" guarda el standarderror del comando.
 	"2>&1" guarda el output y el error (va al final del comando)
● "|"   (pipe) Mete el output de un comando1 como input del otro comando2.
		"command1 | command2"
● cat - Concatenate files. Lee archivo/s y lo manda como output.
	cat < text.txt (toma como input de cat el archivo)
   Si escribo "cat" espera a que escriba un input. Termina el input apretando "Ctrl+d"
 
FILTROS:
● sort - Ordena lines of text
● uniq - Omite repeated lines
● grep - Print lines matching a pattern
● wc   - Cuenta newline, words, bytes and characters (-l ; -w;-c; -m) 
-------
● head - Output the first part of a file
● tail - Output the last part of a file
● tee - Read from standard input and write to standard output and files

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#8-  Ver el mundo como the shell lo ve.

● echo  - imprime una linea de texto.
cada linea que se escribe en la terminal es interpretada por "bash"
hay caracteres (ej: "*") que tienen un significado para la terminal, esto se llama "EXPANSION"
**Expansiones:
	"*"  			pathname expansion
	"~"  			tilde expansion
	$(("+;-;*;/;**;%;"))  	arithmetic expansion 
        "Front-{}-Back" 	brace expansion (ej: text1-{A,B}-text2
	"Number_{1..10}" ó "{A..R}" vector de numeros o letras.
	$USER			Parameter expansion (printenv | less)

**Espaciado y caracteres especiales
	""  copia textual menos ($,\ y ´)
	''  copia textual (anula TODAS las expansiones)
        \  secuencia de escape (ej: \$ ó \! ó \&)
		otras: \a (hace un beep)
			\b Backspace
			\n Newline.
			\r Carriage return
			\t Tab
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#9 - Advances tricks
< atajos para usar menos el mouse y agilizar la escritura>
Cursor movement commands:
	Ctrl-a 	Move cursor to the beginning.
	Ctrl-e 	Move cursor to the end.
	Ctrl-f 	Move cursor forward one character.
	Ctrl-b 	Move cursor backward one character.
	Alt-f 	Move cursor forward one word.
	Alt-b 	Move cursor backward one word.
	Ctrl-l 	= clear

Modifying text:
	Ctrl-d Delete the character 
	Ctrl-t Transpose (exchange) the character
	Alt-t Transpose the word
	Alt-l Convert the characters to lowercase.
	Alt-u Convert the characters to uppercase.
Cut/paste (Kill/Yank):
	Ctrl-k Kill text to the end.
	Ctrl-u Kill text to the beginning.
	Alt-d Kill text  to the end of the current word.
	Alt-Backspace Kill text to the beginning of the currentword. 
	Ctrl-y Yank text.
 Competition (completa el commdo autom usando Tab)
--
● history

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#10- PERMISOS:
< Unix es multi-usuario >
● id 	 – Display user identity

-- Leer (r), escribir (w) y ejecutar (x):
cuando vemos la descripcion de un archivo usando "ls -l archivo" en la descripción aparece un codigo ("ej: -rw-rw-r--")
	El primer caracter dice el TIPO de archivo (-;d;l;c;b)
 	Los siguientes 9 char dicen el MODO del archivo

	rwx (owner) rwx(group) rwx(otros) 
● chmod  – Change a file's mode
Octal  Binary 	File Mode
0 	000 	---
1 	001 	--x
2 	010 	-w-
3 	011 	-wx
4 	100 	r--
5 	101 	r-x
6 	110 	rw-
7 	111	rwx
	ejemplo: chmod 765 text.txt
● umask  – Set the default file permissions (funciona como chmod)

-- Cambiando identidades
● su 	 – Run a shell as another user
● sudo   – Execute a command as another user
● chown  – Change a file's owner
● chgrp  – Change a file's group ownership
● passwd – Change a user's password

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
#11- PROCESOS
● ps <Report a snapshot of current processes>
	-ef
● top < Display tasks >
● jobs < List active jobs >
● bg <Place a job in the background>
● fg <Place a job in the foreground>
● kill <Send a signal to a process>
● killall >Kill processes by name>
● shutdown <Shutdown or reboot the system>

------------------------------------------------------------------
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## Part II – Configuration And The Environment
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 12 - The Environment 
<shell maintains information during our session called the environment>

Variables guardadas en el ambiente, 2 tipos:
	- Environment variables
	- Shell variables
● printenv 	– Print part or all of the environment
● set 		– Set shell options
● export 	– Export environment to subsequently executed programs
● alias 	– Create an alias for a command


# Variables utiles:
-  $DISPLAY	nombre del display
-  $EDITOR	nombre del programa usado para editar texto
-  $SHELL	nombre del 
-  $HOME	
-  $LANG	
-  $OLD_PWD	
-  $PAGER	
-  $PATH	
-  $PS1		
-  $PWD		
-  $TERM	
-  $TZ		
-  $USER	

Definir variables:
x="variable"
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 13 - Intro to VI ("vee eye") 
<editor nucleo de Unix>

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 14 - Customizing the promtp
[me@linuxbox ~]$
username@hostname$workingdirectory
echo $PS1
------------------------------------------------------------------
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## Part III – Common Tasks And Essential Tools
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 15 - Packages
   Packaging systems:
	Debian Style (.deb) => Ubuntu,Debian, Xandros, Linspire.
	RedHatStyle  (.rpm) => Fedora, Cent, SUSE, Mandriva.

  Package file.   Unidad básica de software
  Repository.     
  Dependencia.

- High&Low-level packages tools:
	Debian-Style:   dpkg (low)
		        apt-get,aptitude (high)	
	Red-Hat: 	rpm (low)
			yum (high)
- Find package in a repository
	Debian    apt-get update
		  apt-cache search search_string
	Red Hat   yum search search_string

- Install package from repository
	Debian    apt-get update
		  apt-get install package_name
	Red Hat   yum install package_name

- Install package from packagefile
	Debian 	  dpkg --install package_file
	Red Hat   rpm -i package_file

- Removing a package
	Debian 	  apt-get remove package_name
	Red Hat   yum erase package_name

- Updating Packages From A Repository
	Debian	   apt-get update; apt-get upgrade
	Red Hat    yum update

- Upgrading A Package From A Package File
	Debian    dpkg --install package_file

- Listing packages
	Debian   dpkg --list

- Determining If A Package Is Installed
	Debian dpkg --status package_name
- Displaynih info about a package installed
	Debian apt-cache show package_name
- Finding which package installed a file
	Debian   dpkg --search file_name

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 16 -  Storage Media

● mount – Mount a file system
● umount – Unmount a file system
● fsck – Check and repair a file system
● fdisk – Partition table manipulator
● mkfs – Create a file system
● fdformat – Format a floppy disk
● dd – Write block oriented data directly to a device
● genisoimage (mkisofs) – Create an ISO 9660 image file
● wodim (cdrecord) – Write data to optical storage media
● md5sum – Calculate an MD5 checksum

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 17 -  Networking

**Conceptos previos:
	IP:
	Host&Domain name:
	URI (Uniform resource identifier):
---
● ping - Send an ICMP ECHO_REQUEST to network hosts
● traceroute - Print the route packets trace to a network host
● netstat - Print network connections, routing tables, interface statistics,
masquerade connections, and multicast memberships

● ftp  - Internet file transfer program
● wget - Non-interactive network downloader
● ssh  - OpenSSH SSH client (remote login program)

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 18 -  Search files

● locate – Find files by name
● find – Search for files in a directory hierarchy
    Type:
	-type b   Block special device file
	-type c   Character special device file
	-type d   Directory
	-type f   Regular file
	-type l   Symbolic link
    Size:
	b 512 byte.
	c Bytes
	w Two byte words
	k Kilobytes (Units of 1024 bytes)
	M Megabytes (Units of 1048576 bytes)
	G Gigabytes (Units of 1073741824 bytes)

 find ~
 find ~ -type f -name "*.JPG" -size +1M | wc -l
	
Command often used with file search commands to process
the resulting list of files:
● xargs – Build and execute command lines from standard input

Commands to assist us in or exploration:
● touch – Change file times
● stat – Display file or file system status

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 19 -  Archiving and buckup

compression programs:
●  gzip —Compress or expand files.
●  bzip2 —A block sorting file compressor.
archiving programs:
●  tar —Tape-archiving utility.
●  zip —Package and compress files.
sincronization program:
●  rsync —Remote file and directory synchronization.
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 20 -  Reg expressions
Notacion para identificar patrones en textos.

● grep ("global regular expression print")
	-i No distingue entre upper- and lowercase. (ignore case)
	-v Invert match. 
	-c Print the number of matches.
	-l Print the name of each file.
	-L ~ -l option, but print files-without-match .
	-n Prefix each matching line with the number of the line within the file. 
	-h For multifile searches, suppress the output of filenames. May also be specified --no-filename .

• -- M e t a c h a r a c t e r s --
"^ $ . [ ] { } - ? * + ( ) | \ "

"*"  (The any character), representa un caracter arbitrario.
"^"  (Solo hay match si la regexpr está al comienzo.)
"$"  (Solo hay match si la regexpr está al final.)

"[]" (adentro van letras en las que ambos casos sirven) 
	xej si quiero buscar bzip o gzip uso: grep '[bg]zip'
"-" (rango)  [A-Z]  [1-5]
"^" dentro de los corchetes significa negación.

• Clases de caracteres POSIX: 
Para evitar poner dentro del corchete muchos rangos:
xej: [A-Za-z0-9] = [:alnum:]
"[:upper:]"  "[:lower:]"
"[:word:]""[:alpha:]""[:space:]""[:graph:]""[:xdigit:]"

• Cuantificadores:
"?"    hace que el caracter anterior sea opcional (pude o no estar)
"*\ "  es como ? pero para cualquier numero de apariciones. 
"+"    es como * pero para apariciones <0.
"{}"   para expresar cuantas veces debe aparecer {min,max} ó {n}
  

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 21 -  Text

● cat   — Concatenate files and print on the standard output.
● sort  — Sort lines of text files.
● uniq  — Report or omit repeated lines.
● cut   — Remove sections from each line of files.
● paste — Merge lines of files.
● join  — Join lines of two files on a common field.
● comm  — Compare two sorted files line by line.
● diff  — Compare files line by line.
● patch — Apply a diff file to an original.

Edit on the fly:
● tr    — Translate or delete characters.
● sed   — Stream editor pa filtrar y transf text.
● aspell —Interactive spell checker.


#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 22 -  Formatting Output
● nl —Number lines.
● fold —Wrap each line to a specified length.
● fmt —A simple text formatter.
● pr —Format text for printing.
● printf —Format and print data.
● groff —A document formatting system.
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 23 -  Printing

● pr —Convierte archivos de texto para imprimir.
● lpr —Print files.
● lp —Print files (System V).
● a2ps —formato de archivos para imprimir en una impresora PostScript.
● lpstat —Show printer status information.
● lpq —Show printer queue status.
● lprm —Cancel print jobs.
● cancel —Cancel print jobs (System V).

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 24 -  Compiling Programs
● make —Utility to maintain programs.

Compilar es el proceso de traducir codigo fuente (escrito por un programandor) al lenguaje nativo del procesador. 
El CPU trabaja a un nivel muy elemental, ejecutando programas en lenguaje de maquina, con muy pocas operaciones como "agregar un byte", "poner en este lugar de la memoria","copiar este byte". Estas instrucciones estan expresadas en binario.
Todo se simiplifco bastante con el lenguaje assembly, que remplazó los codigos numericos con caracteres memotecnicos como CPY(copy), MOV(move).
luego surgieron lenguajes high-level como FORTRAN (con fines cientificos) y COBOL (para business), aunque su uso hoy en día es limitado.
En la actualidad los dos principales lenguajes dominantes son C y C++.
Un proceso usado en conjuncion con compilar es "linking". Es utilizar librerias con subrutinas tipicas que realizan una funcion particular. Un programa llamado "linker" conecta el output del compilardor y las librerias que requiere el programa compilado.
El resultado final es un ejecutable listo para usar.

NO todos los programas deben ser compilados. Xej los lenguajes interpretados o scripting

#------------------------------------------------------------#
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## Part IV – S H E L L -  S C RI P T S
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
● 
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 24 -  Primer Script
Un script es un archivo con una serie de comandos. La consola lee el script y ejecuta los comandos.
- Pasos:
   i   - Escribirlo en un archivo de texto ordinario. (vim, gedit, kate, etc.)
   ii  - Hacer el script ejecutable: chmod 755 mi_script
   iii - Poner el script donde la shell pueda encontrarlo.
   iv  - Ejecutarlo: 	./mi_script
Formato:
debe comenzar con: #!/bin/bash
	#! = "shebang" le dice al sistema el nombre del interprete que serpa usado para ejecutar el script.
Luego van los comandos.

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 25 -  Comenzar un proyecto
# Hacer un generador de informes.

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 26 -  Diseño top-down
function f(){
	<commandos>
	local var_local
	return
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 27 -  Flow Control:  "IF"

if [ condition ]; then
	commands
elif [ condition ]; then
	commands
else
	commands
fi

●  test 

[[ expression ]]

(( )) 

Operadores lógicos:
    test    [[ ]] y (( ))
AND  -a 	 &&
OR   -o 	 ||
NOT  !		 !
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 28 -  R E A D I N G -  K E Y B O A R D - I N P U T

●  read
    - Options
	-a array Assign the input to array.
	-d delimiter
	-e Use Readline to handle input. 
	-n num.
	-p prompt.
	-r Raw mode. 
	-s Silent mode.
	-t seconds Timeout.
	-u fd Use input from file descriptor fd , rather than standard input.

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 29 -  Flow Control:  "WHILE" y "UNTIL"
x=-2

while [ $x -le 10 ]; do
	if [ $x == 0 ]; then
		echo "Probando comando 'WHILE'"
		echo $x
		x=$((x + 1))
	else
		echo $x
		x=$((x + 1))
	fi

done

x=-2

until [ $x -gt 10 ]; do
	if [ $x == 0 ]; then
		echo "Probando comando 'UNTIL'"
		echo $x
		x=$((x + 1))
	else
		echo $x
		x=$((x + 1))
	fi

done
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 30 -  TROUBLESHOOTING

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 31 -  Flow Control:  "CASE"
x=22
case $x in
	0)	echo "Es cero".
		exit
		;;
	1)	echo "Es uno".
		exit
		;;
	[2-6])	echo "Esta entre 2-6".
		exit
		;;
	"hola")	echo "Todo bien?".
		exit
		;;
	*)	echo "Otra cosa."
		exit
		;;
esac
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 32 -  Parámetros posicionales

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 33 -  Flow Control: "FOR"
for i in {F..I} ; do
	for j in {1..4}; do
		echo $i$j;
	done
done
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 34 -  Strings y Numbers

- Expansiones:
	- Param básicos:
		a="hola"
		echo {$a }  #(los {} son opcionales)

	- Expansiones de variables vacias.
		${param:-"substituto"} # Imprime subst si param no está definida
		${param:="default"} # Da valor default si param no está definida.
		${param:?"está definida?"} # Booleano para saber si está o no definida.
	
	- Expansiones que retornan nombre de variables.
		${!prefix*}	
		${!prefix@}

## - Operaciones en Strings.
	${#foo}  = # caracteres del string.
	${foo:i:j} devuelve del car i-esimo hasta el j-estimo.
	${foo#*PATH} corta el string hasta el primer PATH
	${foo##*PATH} corta el string hasta el ultimo PATH
	${foo%*PATH} como "#" pero empezando desde el final.
	${foo%%*PATH} mo "##" pero empezando desde el final
	# Reemplazo
	${foo/PATH/REEMPLAZO}
	${foo//PATH/REEMPLAZO}
	${foo/#PATH/REEMPLAZO}
	${foo/%PATH/REEMPLAZO}


## -  Expansiones Aritméticas.
	$(( expresion ))

	- Bases: $((base#numero)) 
		
	- Operadores:
		Operator Description
		+ 	Addition
		- 	Subtraction
		* 	Multiplication
		/ 	Integer division
		** 	Exponentiation
		% 	Resto


	- Operadores de asignación:
p = val		Asignación simple.
p=+ val		Addición (vale sustracc, mult y div tamb)



- Operadores de bits
~ 	negacion
<<	left shift
>>	right shift
&	AND
|	OR
^	XOR

- Comparasión
<= Less than or equal to
>= Greater than or equal to
< Less than
> Greater than
== Equal to
= Not equal to
&& Logical AND
|| Logical OR
expr1?expr2:expr3 Comparison (ternary) operator. If expression expr1 evaluates to be non-zero (arithmetic true) then expr2 , else expr3 .

- "Calculadora":
● bc

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 35 -  Arrays

name=(value1 value2 ...)

name[subscript]=value

- Operaciones con arrays:

	${array[@]}  # ver sus elementos.
	${#a[@]} # number of array elements

	foo+=(d e f) # agregar elementos a array.
	unset "foo[i]" # sacar el elemento i-esimo.

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 36 -  E X O T I C A 

