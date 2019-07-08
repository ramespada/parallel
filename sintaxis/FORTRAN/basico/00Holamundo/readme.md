# 00 - Hola mundo

> Escribir, compilar y correr un programa en fortran.

### Compilador/Instalación
Para poder usar fortran necesitamos un **compilador**, usualmente hay un compilador de fortran instalado en la computadora. En caso de no tenerlo se puede descargar de https://gcc.gnu.org/wiki/GFortran


### Escritura
Para escribir un programa creamos un archivo de texto cuyo nombre debe terminar en **.f90** (por ejemplo: 00holamundo.f90). Lo abrimos con algun editor de textos, y dentro de él escribimos las instrucciones.

Por ejemplo, un programa que imprima en pantalla la frase *Hola mundo!* se escribiría:

```fortran
  program nombre_del_programa
      print*,"Hola mundo!"
  end program 
```
 El comando `print*,'Un mensaje'` simplemente muestra el mensaje en pantalla.

**Observaciones:**
- Todos los programas comienzan con **`program algun_nombre`** y terminan en **`end program`**. 
- Fortran no distingue entre mayúsculas y mínusculas para los comandos.


### Compilación
Fortran es un lenguaje que requiere ser compilado manualmente cada vez que se desee ejecutar nuevo codigo.

Para la compilacion entramos a una terminal, vamos al directorio donde se encuentra el archivo creado, y escribimos:
```
 gfortran holamundo.f90 
```
Un compilador es un programa que traduce el lenguaje programado (entendible por humanos) a lenguaje de maquina (entendible por la maquina), *gfortran* es el nombre de uno de los compiladores fortran pero hay muchos otros, por ejemplo: `ifort`, `gcc`, `pgi`,etc.. Si la compilacion es exitosa y el compilador no detecto ningun error, se va a crear un archivo con nombre **a.out**, este archivo es un *binario/ejecutable*.

 Si queremos que el binario tenga otro nombre, para compilar escribiriamos:
```
 gfortran -o otro_nombre.exe holamundo.f90 
```

### Ejecución
 Para ejecutar el binario escribimos en la terminal:
``` 
./a.out  
```
Donde *a.out* es el nombre del binario generado en la compilación. Para este programa, debería aparecer en la terminal la frase *Hola mundo!*.

