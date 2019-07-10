#!/bin/bash
pwd
ls
ls -a
ls -l
clear
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
rm archivo2
cp archivo2 /home/ram/archivo2
ls
cd ..
ls
cd carpeta1
mv archivo3 archivo2
ls
mv archivo2 ../.
ls
ln -s archivo1 archivo1
echo "Holaa"
cat
Hola, todo bien?
echo "Hola, todo bien?"
cat > archivo2
Hola, Como va?
Que lindo es usar la shell
ls
diff archivo1 archivo2
cat archivo2
cat archivo2 >> archivo1
head archivo1
tail archivo2
more archivo1
less archivo1
vim archivo1
sed archivo1 s/Hola/Chau/g
ls ../*  | grep Do
cd ..
ls -l
chmod +x script.sh
./script.sh

