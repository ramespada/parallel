#!/bin/bash
pwd	#muestra directorio actual	
cd	#cambio de directorio 
ls	#muestra contenido del directorio

<tab>	(autocomplete)

#Estructura típica de comandos:
#	<comando> -<op> <arg1> <arg2> ... <argN>

help
#<comando>--help

which grep

whatis grep

apropos copy

man grep
history

mkdir <dir>	#crea directorio
rmdir <dir>	#elimina directorio

touch <arch>	#crea archivo/actualiza fecha de acceso

cp <arch> <arch1>	#copiar archivo
mv <arch> <arch1>	#mover archivo (cambiar de nombre)
rm <arch>		#borrar archivo
ln <arch> <link>	#crea "acceso directo"

cat <arch> 		#lee contenido de archivo

cat >> archivo1
Hola! Mi nombre es Ramiro. Bash esta re piola! <ctrl>d

cat archivo1

more   
less   #q
vim archivo1

#Flujo
| 		#'pipe': concatena comandos
tee archivo	# recibe stdin, lo guarda en 'archivo' y pasa como stdout
>
>>


#Users
sudo

su - user2	#ingreso a la cuenta de user2 como si fuese el
su user2	#ingreso a la cuenta de user2, pero como user actual

users
id

#Info de archivos
file <archivo>			#te muestra tipo de archivo
stat <archivo>  		#te muestra el estado del archivo
chmod <opcion> <archivo>	#cambiar modo de archivo 
				#(<r>lectura/<w>escritura/<x>ejecucion)
		#	{user} 	 {group}    {any1} 
		#	r w x  -  r w x  -  r w x 
		#	4 2 1 	  4 2 1     4 2 1
			
#Info del sistema
ps	      # muestra procesos: -A  -s -ef
kill <pID>    # mata proceso (pID)  OJOOO CON ESTO!!

#I/O
echo "Hola mundo!" #stout
read var	   #stdin

read variable	# Recibe input y lo guarda en $variable


#Busqueda:
find <patron>   #Busca en directorio archivos con patron y los lista.
locate <patron> 

#RegExpr.:
grep <patron>  #Busca patron siempre se usa junto con |
# 
# -----------------------------------------------------------#





	#echo 'Holis' > archivo.txt		#Agarra el stdout y lo mete en 'archivo.txt'
	#echo 'otra vez!' >> archivo.txt	#Agarra el stdout y lo mete en 'archivo.txt' (sin sobreescribirlo)
# -----------------------------------------------------------#
#Editores:

more	#muestra contenido del archivo
less	#editor de bajo nivel

head	#muestra primer parte del archivo
tail	#muestra ultima parte del archivo


diff <arc1> <arch2> #muestra diferencia entre archivos

uniq	#muestra filas unicas del archivo

sort	#ordena archivos
split	#divide archivos en partes iguales
wc	#cuenta palabras del archivo/bits
# -----------------------------------------------------------#
#Ejecutables/programas:

which firefox			#muestra la ruta (donde está) el ejecutable
ldd <ejecutable>		#lista las dependencias del ejecutable
<programa> input		#abrir archivo con el programa.

./<ejecutable>			#forma típica de ejecución de binarios.
# -----------------------------------------------------------#
#Info:
date 	#fecha
cal	#calendario cool

uname #S.O











# -----------------------------------------------------------#
#VARIABLES:
env		#Muestra variables de entorno

VAR= "mi_variable"  	 #Definir variable temporal $MI_VAR

export VAR='my value' #Exportar variable a env

# -----------------------------------------------------------#
# Compresor:
tar	# comprime (-c)
	# extrae   (-x)
	# muestra  (-tf)
# -----------------------------------------------------------#
#Permisos:

# -----------------------------------------------------------#
#Misc
clear   # ='ctrl+l' #limpiar pantalla (muyyy util)
