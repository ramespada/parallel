# 01 - Estructura de un programa en fortran

> Estructura general de un programa en FORTRAN.

Ya vimos todos los programas comienzan en `program nombre_del_programa`, y finalizan en `end program`, dentro de estas dos instrucciones vamos a escribir las intrucciones del programa.

#### *Comentarios*
 Los *comentarios* son partes del código que **no** se ejecutan, sirven simplemente para dejar mensajes a quienes lean el código en el futuro, y facilitar la comprensión del mismo. En FORTRAN los comentarios se realizan con el símbolo de exclamación (**!**), por ejemplo:

```fortran
        !Esto es un comentario
```

## Variables y declaración de variables
 Las *variables* son los objetos en los que guardamos información (números, palabras, etc.). El primer paso en todo programa es definir cuáles son las variables (como se llaman) que serán utilizadas por el programa y cual es su *tipo* .

#### *implicit none*
 Antes de declarar las variables vamos a colocar la sentencia **`implicit none`**. Esto lo que hace es obligarnos a definir explicitamente todas las variables que serán utiliadas por el programa (caso contrario fortran las define por nosotros en base al nombre que les pongamos, utilizando un criterio qua es confuso y por lo tanto nadie usa).

  En la declaración de una variable, primero especificamos de qué *tipo* de variable se trata (más adelante veremos que tipos existen), y su nombre, separados por **::**. Por ejemplo:
```fortran
          implicit none
          integer :: n    !defino un entero llamado "n"
          real    :: x,y  !defino dos reales llamados "x" e "y"
```

se pueden declarar multiples variables en una linea (separandolas por *','*) y los nombres pueden ser letras ó palabras (recuerden que fortran no distingue entre mayúscula y minúscula!)

## Iniciar variables
A las variables podemos asignarles valores, esto se realiza con el signo **`=`**. Por ejemplo podemos asignarle a **n** un valor entero (`n=3`). Esta asignación se puede realizar cuando se definen las variables, ó luego, en el cuerpo del programa.

## Cuerpo del programa
Luego de definir las variables podemos realizar acciones con ellas. Por ejemplo, hagamos un programa que pida el nombre del usuario, lo guarde en una variable y luego lo muestre en pantalla, se escribiria:

```fortran
      program nombre_del_programa

        !Definición de variables:
          implicit none
          character(len=10) :: nombre

        !Cuerpo del progrma:
          print*,"Cuál es tu nombre?"
          read*, nombre     ! READ guarda lo que escribas adentro de la variable nombre  
          print*,"Hola ", nombre,", todo tranqui?"

      end program
```               
