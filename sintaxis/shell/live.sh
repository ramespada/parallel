#!/bin/bash
#La terminal es un programa que nos permite interactuar con el sistema operativo en tiempo real atraves de comandos que escribimos con el teclado en la pantalla.
#PROMPT
# username@pcname:dir$

#ctl + T
date
cal

clear
#==  NAVEGACION  ==
pwd
ls
ls Desktop
ls -l
ls -a


cd Desktop
cd ..
cd ../..
ls
cd usr/ram










#==  DIRs / FILES  ==
mkdir carpeta1
mkdir carpeta2
ls
rmdir carpeta2
ls
cd carpeta1
ls
mkdir carpeta
touch archivo1
touch archivo2
touch archivo3
ls
rm archivo3
ls
cp archivo2 carpeta/archivo2
ls carpeta
mv archivo2 carpeta/archivo2
ls 
ls carpeta
mv archivo1 archivo
ls
rm carpeta	#Error!
rm -r carpeta
ls









#==   I/O   ===
#Todos los comandos toman un input, y devuelven un output.
#Vamos a llamar a los inputs que damos con el teclado stdin y a los outputs que se muestran en pantalla stdout
echo "Holaa"
cat
Hola, todo bien?
#	Redireccion
cat > archivo_animales
	topo
	pez
#ctrl + C/D
cat archivo_animales
cat archivo_animales > archivo_animales2
cat >> archivo_animales2
	oso
	leon
cat archivo_animales2
diff archivo_animales1 archivo_animales2

cat archivo_animales | sort
echo "Hola, como va?" | tee archivo
cat archivo

echo "archivo" | rm 	#Error!
echo "archivo" | xargs rm

#Ver contenido de archivo de texto
cat archivo_animales2
head archivo_animales2
tail archivo_animales2

more ../archivo_largo
less ../archivo_largo

##==	Editor de texto ==
vim archivo    
nano archivo

#	Editor al vuelo:
sed ../archivo_largo s/Hola/Chau/g

#	Expresiones regulares
grep PURPOSE src/aermod/*

#Links 
ln archivo linkDuro
ln -s archivo linkSimbolico
vim archivo     #escribir algo
vim linkDuro
vim linkSimbolico #escribir algo
rm archivo
cat linkDuro
cat linkSimbolico















#==  BUSQUEDA   ==
locate LinuxCommand

find ~ -name *LinuxCom*
find ~ -type d -name *carp*
find ~ -size +10b -type d -name *carp*

#==  PERMISOS   ==
cd .. 
ls -l
chmod +x script.sh
./script.sh






















#==  PROCESOS   ==
#	procesos:
ps
ps -a
ps -aux		#
top

#	jobs:
xlogo
xlogo &
ps
jobs
fg PID
#stop job: ctrl+z
bg PID

kill PID
killall proceso 
#ctl+C si esta en el fg
#	memoria:
free
df












#==  AYUDA   ==
ls /bin
ls /usr/bin

type echo
which echo
whatis echo
man echo
info echo
help ls

apropos "viewer"
























#== misc ==



#Instalar programas:
apt-get install PACKAGE

#Comprimir / Descomprimir
tar -cvf carpeta.tar carpeta
tar -xvf carpeta.tar
