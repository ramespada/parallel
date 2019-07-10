# SHELL

> El shell o terminal, es el programa que nos permite interactuar con el sistema operativo atraves de entradas que damos desde el teclado. Casi todos las distros de Linux la sintaxis para los comandos de terminal se basan en un proyecto GNU llamado **bash**. La sintaxis de sistemas Mac es identica, y Windows la esta empezando a adpotar.

## PROMPT
Cuando abras la terminal (con ``<ctrl>+T``) te vas a encontar con algo asi:
```bash
	username@pcname:workdir$
```

Esto se conoce como **promt**, va a anteceder siempre al cursor, y nos da alguna informacion de cual es nuestro estado.
Lo primero que dice nuestro prompt es quien es el usuario que va a ejecutar las instrucciones (username), luego del **@** dice desde que computadora (pcname), seguido de **:** dice el directorio en el que estamos ubicados dentro de pcname, y por ultimo un signo que indica los privilegios del usuario (**$**: usuario normal, **#**:superuser)

## NAVEGACIÓN:	
Veamos como navegar en LINUX, esto es ir de una carpeta a otra y revisar el contenido.

Para conocer la ubicacion absoluta en la que estamos (la del prompt es relativa a la carpeta principal del usuario) utilizamos:
```bash
pwd
```

Si queremos ver el contenido de la carpeta entonces escribimos:
```bash
ls	#muestra contenido del directorio, probar con opciones: -a -l
```

Para cambiar de directorio:
```bash
cd	#cambio de directorio 
cd ..	#cambio de directorio (ir directorio madre)
```

Para borrar la pantalla de comandos escribimos:
```bash
	clear	#limpia pantalla (tambien se puede con <ctl>+l )
```

## DIRECTORIOS Y ARCHIVOS
Veamos como crear/borrar directorios y archivos:

Para crear/borrar una carpeta existen los siguientes comandos:
```bash
mkdir carpeta		#crea directorio
rmdir carpeta		#elimina directorio
rm -r carpeta		#elimina directorio y todo su contenido (OJO!!)
```

Para crear/borrar un archivo:
```bash
touch archivo		#crea archivo/actualiza fecha de acceso
rm archivo		#borrar archivo
```

Otras acciones que podemos hacer con directorios y archivos son:
```bash
cp archivo archivo_copiado	#copiar archivo 
mv archivo archivo_movido	#mover archivo (tambien sirve para renombrar)
ln -s archivo link_archivo	#crea "acceso directo"
```

## I/O
Muchos de los comandos utilizados hasta ahora generan un output de algun tipo. Estos outputs consisten en dos tipos:
	- resultados que el programa esta diseñado a producir (*stdout*)
	- mensajes de estado y error  (*stderr*)
Por ejemplo en linux, ls manda sus  resultados a un archivo especial llamado stdout, y su status a otro llamado stderr. Ambos estan linkeados por default con la pantalla.
Ademas muchos programas toman sus argumentos de un *stdin*, por default linkeado a las entradas desde el teclado.

## Redireccion de stdout stdin
Las salidas de los comandos por default generalmente van a la pantalla, y los inputs se toman desde el teclado.
Sin embargo podemos decidir donde llevar los stdin/stdout utilizamos comandos de redireccion:

```bash
echo "Hola"				#stdin   a stdout
read var				#stdin   a var
cat > archivo 				#stdin 	 a archivo
cat archivo >> archivo 			#archivo a archivo (lo agrega)
cat animales | sort			#comando a comando		(pipe)
echo "Hola" | tee archivo		#stdin 	 a archivo y stdout	(tee )
echo "Algo" | xargs mkdir		#xargs: ejecuta comandos de un standard input (los pasa a argumentos de comandos)
```
## Archivos de texto:
Para ver el contenido de un archivo de texto tenemos varias opciones:
```bash
cat archivo		#muestra todo el contenido como stdout
head archivo		#ver primer parte
tail archivo		#ver ultima parte
more archivo		#solo lectura (viejo)
less archivo  			#version moderna de less
```

### Editores de texto
Si buscamos un editor de texto con mas funciones, algunos de los mas conocidos son:

```bash
vim archivo		#Editor de textos
nano archivo		#Editor de textos
emacs archivo		#Editor de textos
```
### Editores *al vuelo*
Un editor *on the fly* muy utilizado es:

```bash
sed 's/ioeu/a/g' archivo	#Stream Editor
```

### Expresiones regulares
Las expresiones regulares son formulas abstractas que representan patrones de texto que tienen cierta estructura. Son muy utiles para buscar (y modificar) secuencias de texto dentro de un archivo que siga determinado patron.

Hay distintos comandos para trabajar con expresiones regulares, el mas conocido es ``grep``:
```bash
	ls | grep *.txt
```

##PERMISOS y USUARIOS
 Linux es un sistema operativo *multiusuario*, esto significa que muchos usuarios pueden estar utilizando la misma computadora en simultaneo.

Cada usuario tiene un id, y tiene ciertos privilegios.
```bash
id 			#id de usuario
users			#ver users
```

Para utilizar la terminal como otro usuario :
```bash
su - user2		#ingreso a la cuenta de user2 como si fuese el
su user2		#ingreso a la cuenta de user2, pero como user actual
```

Para realizar operaciones como *super-user*:
```bash
sudo			#ejecutar comando como superuser
```

## Informacion de archivos
file <archivo>			#te muestra tipo de archivo
stat <archivo>  		#te muestra el estado del archivo
```bash
ls -l
```

```bash
chmod <opcion> <archivo>	#cambiar modo de archivo 
```
	#{tipo}	{user} 	 {group}    {any1} 
	#  -	r w x  -  r w x  -  r w x   <r>lectura/<w>escritura/<x>ejecucion
	#(-dl)	4 2 1 	  4 2 1     4 2 1
```bash
chmod +x script.sh
chown archivo
chgrp archivo
```

## PROCESOS
Los sistemas operativos basados en linux son *multi-task*, esto quiere decir que la secuencia de ejecucion de programas la realizan de tal forma que pareciera que se estan realizando multiples tareas en simultaneo (esto es estrictamente asi cuando la computadora posee varias unidades de procesamiento, que hoy en dia es lo mas comun):

Hay distintos comandos que nos dan informacion de los procesos que se estan ejecutando en la computadora:
```bash
ps	      #muestra snapshot de procesos: -A  -s -ef
top	      #muestra procesos en tiempo real
jobs	      #muestra procesos activos
free	      #memoria libre
df	      #espacio libre en el disco rigido
```

Para dar/quitar prioridad a un proceso por el resto de los otros:
```bash
bg		#manda proceso al fondo
fg		#manda proceso arriba
```
Para terminar un proceso:
```bash
kill <PID>    # mata proceso (PID)  OJOOO CON ESTO!!
killall	      #mata proceso por nombre
```

## BUSQUEDA DE ARCHIVOS:
Hay dos comandos principales para buscar archivos:

El primero es ``locate``, busca archivos por su nombre:
```bash
locate <patron> 	#Busca archivos por nombre en una jerarquia de directorios
```
El comando ``find`` incorpora otras variables para la busqueda:
```bash
find <patron>   	#Busca en directorio archivos con patron y los lista.
find <patron> -type d/f/l -size b/c/w/k/M/G -name "pattern"
find <patron> \(-type d \) -and/-or/-not  \(-size M  \)
find <patron> -type d/f/l -size b/c/w/k/M/G -name "pattern"
find <patron> -delete/-ls/-print/-quit

find <patron> -delete/-ls/-print/-quit -exec ls -l '{}' ';'
```

## COMANDOS UTILES:
### HISTORIAL DE COMANDOS
Con las flechas de direccion (arriba y abajo) podemos revisar comandos ejecutados anteriormente. Una forma de ver todo lo que fue ejecutado es con el comando:``history``.
Podemos buscar lineas ejecutadas anteriormente aprentando ```<ctl>+r ``  

## AYUDA:	
help
<comando> --help
help grep	#informacion sobre uso del comando

whatis grep	#te dice que es es el comando
type grep	#te dice que tipo de comando es
which grep	#te dice donde se ubica el comando
apropos copy	#busca una funcion apropiada para "copy"

man grep
info grep

## COMPRESOR DE ARCHIVOS:
Para comprimir se puede utilizar el programa ``tar``, cuyas opciones principales son ``-c`` para comprimir y ``-x`` para descomprimir. 
```bash 
tar -cvf comprimido.tar.gz carpeta 
tar -xzvf comprimido.tar.gz
```

## OTROS:
```bash
uniq	#muestra filas unicas del archivo
sort	#ordena archivos
split	#divide archivos en partes iguales
wc	#cuenta palabras del archivo/bits

diff archivo1 archivo2	#muestra diferencias entre archivos
```
##Manejo de paquetes
```bash
apt-get --install <programa>	#instalar programa
	--update		#actualizar sistema
	--upgrade		#
``` 
##Ejecutables/programas:
```bash
ldd <ejecutable>		#lista las dependencias del ejecutable
./<ejecutable>			#forma típica de ejecución de binarios.
```
## Informacion del sistema
```bash date 	#fecha
cal	#calendario cool
uname 	#datos del sistema operativo
env	#variables de ambiente
```
