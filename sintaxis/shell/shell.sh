#!/bin/bash
#El shell, es el programa que toma entradas desde el teclado, y se las pasa al sistema operativo para que las procese.
#Casi todos las distros de Linux usan para el shell un proyecto GNU llamado bash,tambien Mac y Windows (lo esta incorporando).

#PROMPT
username@pcname:workdir$
	# El ultimo signo indica privilegios:	($) usuario normal; (#) superuser

# NAVEGACIÓN:	--------------------------------------------------------------------------------#
#	Vamos a ver como navegar en LINUX.

pwd	#muestra directorio actual	
ls	#muestra contenido del directorio probar: -a -l
cd	#cambio de directorio 

	clear	#limpia pantalla

	#<tab>		#autocomplete
	#<ctl>+l 	#lo mismo que clear

#DIRECTORIOS Y ARCHIVOS	------------------------------------------------------------------------#
mkdir <dir>		#crea directorio
rmdir <dir>		#elimina directorio

touch <arch>		#crea archivo/actualiza fecha de acceso
rm <arch>		#borrar archivo

cp <arch> <arch1>	#copiar archivo
mv <arch> <arch1>	#mover archivo (cambiar de nombre)
ln -s <arch> <link>	#crea "acceso directo"

#I/O			------------------------------------------------------------------------#
#	Muchos de los programas utilizados hasta ahora generan algun output de algun tipo. 
#	Estos outputs consisten en dos tipos:
#		- resultados que el programa esta diseñado a producir (stdout)
#		- mensajes de estado y error  (stderr)
#	Por ejemplo en linux, ls manda sus  resultados a un archivo especial llamado stdout, y su status a otro llamado stderr. 
#	Ambos estan linkeados por default con la pantalla.
#	Ademas muchos programas toman sus argumentos de un stdin, por default linkeado a las entradas desde el teclado.

echo "Hola"		#stdin a stdout
cat "Hola"		#stdin a stdout (puede ser un archivo)
read var		#stdin a var

#Redireccion de stdout stdin
# 	La redireccion de I/O nos permite decidir hacia donde llevar los outputs y desde donde tomar inputs.
# 	Por default, los outputs van a la pantalla, y los inputs se toman desde el teclado
 
<com1> | <com2>			#'pipe': manda stdout de com1 a stdin de com2
echo "algo" | tee <archivo>	#recibe stdin, lo guarda en 'archivo' y pasa como stdout
cat > <archivo>			#lleva stdout a archivo
cat >> <archivo>		#lleva stdout a final del archivo

echo "Hola juan carlos, como estas?" > file
cat file
cat file1 file2 file3 >> file

head			#ver primer parte
tail			#ver ultima parte
more   			#solo lectura (viejo)
less   			#version moderna de less
#Editores de texto
#	Hay muchos editores de textos, nano, emacs, vi
vim archivo1		#Editor de textos

#Expresiones regulares
grep

#PERMISOS y USUARIOS 	                  	 --------------------------------------------------------#
# Linux es multitask y multiuser. Muchos usuarios pueden estar utilizando la misma computadora en simultaneo.
id 			#id de usuario
users			#users

su - user2		#ingreso a la cuenta de user2 como si fuese el
su user2		#ingreso a la cuenta de user2, pero como user actual

sudo			#ejecutar comando como superuser

#Info de archivos
file <archivo>			#te muestra tipo de archivo
stat <archivo>  		#te muestra el estado del archivo
chmod <opcion> <archivo>	#cambiar modo de archivo 
	#{tipo}	{user} 	 {group}    {any1} 
	#  -	r w x  -  r w x  -  r w x   <r>lectura/<w>escritura/<x>ejecucion
	#(-dl)	4 2 1 	  4 2 1     4 2 1

chown <archivo>
chgrp	<archivo>

#PROCESOS	---------------------------------------------------------------------------------#
ps	      #muestra snapshot de procesos: -A  -s -ef
top	      #muestra procesos en tiempo real
jobs	      #muestra procesos activos
free	      #memoria libre
df	      #espacio libre en el disco rigido

bg		#manda proceso al fondo
fg		#manda proceso arriba

kill <PID>    # mata proceso (PID)  OJOOO CON ESTO!!
killall	      #mata proceso por nombre

#BUSQUEDA DE ARCHIVOS:	------------------------------------------------------------------------#
locate <patron> 	#Busca archivos por nombre en una jerarquia de directorios

find <patron>   	#Busca en directorio archivos con patron y los lista.
find <patron> -type d/f/l -size b/c/w/k/M/G -name "pattern"
find <patron> \(-type d \) -and/-or/-not  \(-size M  \)
find <patron> -type d/f/l -size b/c/w/k/M/G -name "pattern"
find <patron> -delete/-ls/-print/-quit

find <patron> -delete/-ls/-print/-quit -exec ls -l '{}' ';'

xargs			#Construye y ejecuta comandos de un standard input

#COMANDOS UTILES:
#HISTORIAL:	--------------------------------------------------------------------------------#
#	Para revisar comandos anteriores.	
<cursor> 	#arrriba revisa comandos anteriores , abajo revisa comandos posteriores 
history

<ctl>+r <pattern>	#busca ultimo comando en el historial con el pattern  
#AYUDA:		--------------------------------------------------------------------------------#
help
#COMANDOS:
# <comando> -<opcion> <arg1> <arg2> ... <argN>
# <comando> --<opcionLarga> <arg1> <arg2> ... <argN>

#<comando> --help
help grep	#informacion sobre uso del comando

whatis grep	#te dice que es es el comando
type grep	#te dice que tipo de comando es
which grep	#te dice donde se ubica el comando
apropos copy	#busca una funcion apropiada para "copy"

man grep
info grep

#COMPRESOR DE ARCHIVOS:
tar	# comprime (-c)
	# extrae   (-x)
	# muestra  (-tf)

#OTROS:
uniq	#muestra filas unicas del archivo
sort	#ordena archivos
split	#divide archivos en partes iguales
wc	#cuenta palabras del archivo/bits

diff
sed

#MANEJO DE PACKAGES
apt-get --install <programa>	#instalar programa
	--update		#actualizar sistema
	--upgrade		#
# -----------------------------------------------------------#
#Ejecutables/programas:
ldd <ejecutable>		#lista las dependencias del ejecutable
./<ejecutable>			#forma típica de ejecución de binarios.
# -----------------------------------------------------------#
#Info:
date 	#fecha
cal	#calendario cool

uname #S.O
# -----------------------------------------------------------#
