#!/bin/bash

#==  NAVEGACION  ==
pwd
ls
ls -a
ls -l

clear

cd Desktop
cd ..
cd ../..
ls

#==  DIRs / FILES  ==
mkdir carpeta1
mkdir carpeta2
ls
rmdir carpeta2
ls
cd carpeta1
ls
touch archivo1
touch archivo2
touch archivo3
ls
rm archivo3
ls
mkdir carpeta
ls
cp archivo2 carpeta/archivo2
ls carpeta
mv archivo2 carpeta/archivo2
ls 
ls carpeta
mv archivo1 archivo
ls
ln -s archivo archivo
rm carpeta
rm -r carpeta

#==   I/O   ===
echo "Holaa"
cat
Hola, todo bien?
#	Redireccion
cat > archivo_animales
	perro
	gato
	elefante
	jirafa
	mariposa
	topo
	conejo
	cangrejo
	pez

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

echo "archivo" | rm

echo "archivo" | xargs rm

head archivo_animales2
tail archivo_animales2

more ../archivo_largo
less ../archivo_largo

#	Editor de texto
vim ../archivo_largo

#	Editor al vuelo:
sed ../archivo_largo s/Hola/Chau/g

#	Expresiones regulares
cat ../archivo_largo | grep 

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
