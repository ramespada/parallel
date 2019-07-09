#!/bin/bash
#El shell, es el programa que toma entradas desde el teclado, y se las pasa al sistema operativo para que las procese.
#Casi todos las distros de Linux usan para el shell un proyecto GNU llamado bash.

prompt:  username@pcname$
	El ultimo signo indica privilegios:	($) usuario normal; (#) superuser

# NAVEGACIÓN:
pwd	#muestra directorio actual	
cd	#cambio de directorio 
ls	#muestra contenido del directorio

<tab>		#autocomplete
<ctl>+l clear   #borrar pantalla

#AYUDA:
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

#HISTORIAL:
<cursor> 	#arrriba revisa comandos anteriores , abajo revisa comandos posteriores 
history

<ctl>+r <pattern>	#busca ultimo comando en el historial con el pattern  

#DIRECTORIOS Y ARCHIVOS
mkdir <dir>		#crea directorio
rmdir <dir>		#elimina directorio

touch <arch>		#crea archivo/actualiza fecha de acceso

cp <arch> <arch1>	#copiar archivo
mv <arch> <arch1>	#mover archivo (cambiar de nombre)
rm <arch>		#borrar archivo
ln -s <arch> <link>	#crea "acceso directo"

#Std I/O

#Muchos de los programas utilizados hasta ahora generan algun output de algun tipo. 
#Estos outputs consisten en dos tipos:
#	- resultados que el programa esta diseñado a producir (stdout)
#	- mensajes de estado y error  (stderr)
#Por ejemplo en linux, ls manda sus  resultados a un archivo especial llamado stdout, y su status a otro llamado stderr. 
#Ambos estan linkeados por default con la pantalla.
#Ademas muchos programas toman sus argumentos de un stdin, por default linkeado a las entradas desde el teclado.

# La redireccion de I/O nos permite decidir hacia donde llevar los outputs y desde donde tomar inputs.
# Por default, los outputs van a la pantalla, y los inputs se toman desde el teclado

echo "Hola"		#stdin a stdout
cat "Hola"		#stdin a stdout (puede ser un archivo)
read var		#stdin a var

#Redireccion de stdout stdin
<com1> | <com2>		#'pipe': manda stdout de com1 a stdin de com2
tee <archivo>		#recibe stdin, lo guarda en 'archivo' y pasa como stdout
> <archivo>		#lleva stdout a archivo
>> <archivo>		#lleva stdout a final del archivo

echo "Hola juan carlos, como estas?" > file
cat file
cat file1 file2 file3 >> file

head			#ver primer parte
tail			#ver ultima parte
more   			#solo lectura (viejo)
less   			#version moderna de less
#Editores de texto
vim archivo1		#Editor de textos

#Permisos y usuarios
# Linux es multitask y multiuser. Muchos usuarios pueden estar utilizando la misma computadora en simultaneo.
#
#USUARIOS:
#GRUPOS:
#OWNERS:

id 		#id de usuario
users

su - user2	#ingreso a la cuenta de user2 como si fuese el
su user2	#ingreso a la cuenta de user2, pero como user actual

sudo		#ejecutar comando como superuser

#Info de archivos
file <archivo>			#te muestra tipo de archivo
stat <archivo>  		#te muestra el estado del archivo
chmod <opcion> <archivo>	#cambiar modo de archivo 
				#(<r>lectura/<w>escritura/<x>ejecucion)

#{tipo}	{user} 	 {group}    {any1} 
#  -	r w x  -  r w x  -  r w x 
#(-dl)	4 2 1 	  4 2 1     4 2 1

chown <archivo>
chgrp	<archivo>


#Procesos e Info del sistema
ps	      #muestra snapshot de procesos: -A  -s -ef
top	      #muestra procesos en tiempo real
jobs	      #muestra procesos activos
free	      #memoria libre
df	      #espacio libre en el disco rigido

bg		#manda proceso al fondo
fg		#manda proceso arriba

kill <PID>    # mata proceso (PID)  OJOOO CON ESTO!!
killall	      #mata proceso por nombre

#Busqueda:
find <patron>   	#Busca en directorio archivos con patron y los lista.
locate <patron> 	#Busca archivos por nombre en una jerarquia de directorios
xargs			#Construye y ejecuta comandos de un standard input

#COMANDOS UTILES:
# Compresor:
tar	# comprime (-c)
	# extrae   (-x)
	# muestra  (-tf)

#Expresiones regulares:
grep <patron>  #Busca patron siempre se usa junto con |

#
diff <arc1> <arch2> #muestra diferencia entre archivos

uniq	#muestra filas unicas del archivo

sort	#ordena archivos
split	#divide archivos en partes iguales
wc	#cuenta palabras del archivo/bits

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
