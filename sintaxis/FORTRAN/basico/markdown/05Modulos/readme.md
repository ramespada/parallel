# 05 - Modulos

> Crear modulos internos y externos. Uso de interfaces.

  Los módulos son bloques de código que guardan informacion, subrutinas y funciones. Van a hacer que nuestro programa sea más entendible y manejable. Sobre todo cuando hagamos un proyecto grande.

### Módulos internos:
---

Un módulo interno se escribe en el mismo archivo que el programa principal y antes que este. Funciona y tiene la misma estructura que un programa normal, la sintaxis sería:

```fortran
   module mi_modulo
     implicit none
     !Declaración de parametros

      contains
      !Definición de Subrutinas y Funciones
    
   end module

   program main 
	use mi_modulo

	... 		!aca va el programa principal

   end program main
```

Para utilizar el modulo en el programa principal lo llamamos con: **`use mi_modulo`** ó si sólo queremos usar algunas subrutinas contenidas en el mismo lo llamamos: **`use modulo, only : rutina1,rutina8`**

### Módulos externos:
---

Un módulo externo va a ser exactamente lo mismo pero copiado en un archivo aparte, la única diferencia va a estar en su compilación:

```
  gfortran -c modulo.f main.f
  gfortran modulo.o main.o
```
En la compilacion siempre el orden de los archivos va a de menor a mayor jerarquia, el ultimo archivo es el programa principal.

Cuando el programa se vuelva complejo y tenga muchos modulos llamandose entre si vamos a tener que usar para compilar _**Makefiles**_ .

### Variables públicas y privadas
---
Podemos decidir si las variables generadas en los módulos van a estar disponibles, ó no, fuera de este.

Eso se realiza poniendo antes de la declaración de cada variable la sentencia **`public`** ó  **`private`** según corresponda.


### Interfaces:
---

Las interfaces tienen varios usos, pero uno de ellos es generalizar procedimientos dandole flexibilidad a las variables de entrada y/o salida de una funcion.

Por ejemplo, si queremos definir una funcion que calcule el cuadrado de un numero, pero el numero de entrada puede ser tanto `real` como `complex`. Luego tenemos que definir una funcion para cada caso, aunque mediante la interfaz podemos unificarla en una sola funcion mas grande:

```fortran
    interface RaizCuadrada
        procedure  RaizCuadradaR, RaizCuadradaC
    end interface RaizCuadrada

    contains

    function RaizCuadradaR(x)	result(x_cuadrado)
		real :: x, x_cuadrado
    		x_cuadrado=x*x
    end function RaizCuadradaR

    function RaizCuadradaC(z)	result(z_cuadrado)
		complex :: z, z_cuadrado
    		z_cuadrado=z*z
    end function RaizCuadradaC
```
Cuando usemos `RaizCuadrada(x)` nos va a devolver el resultado de aquella funcion que sea compatible con `x`. Este proceso de asociar el nombre de una funcion con varias funciones se lo conoce como **overloading**.


