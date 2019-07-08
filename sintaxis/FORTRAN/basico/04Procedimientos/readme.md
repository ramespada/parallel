# 04 - Procedimientos

> Crear *funciones* y *subrutinas*.

  Los procedimientos (**funciones** y **subrutinas**) sirven para *encapsular* un conjunto de instrucciones que cumplen alguna función ó que se utilizan reiteradas veces a lo largo del código.
  Construir procedimientos nos va a ahorrar muchas lineas de código y va a hacer nuestro programa mucho más entendible. 
 Los procedimientos se colocan al final del cuerpo del programa, y van precedidos de la sentencia: **`contains`**.

## `FUNCTION`
Las funciones toman una serie de argumentos (valores de entrada o *inputs*), hacen algun procedimiento con ellos y retornan un único resultado (valor de salida o *output*).

Por ejemplo, una funcion que suma dos reales se escribe:
```fortran
        function suma(x,y)   result(z)
          implicit none
          real, intent(in) :: x,y
          real :: z
    
          z= x+y
         end function suma
```
  Las variables definidas adentro de la función no tienen por que existir afuera de esta, por esto se las conoce como **dummy arguments** y simplemente linkean las variables externas (que entran como argumentos a la funcion y sí están definidas en el programa) con las variables internas del procedimiento.

  Es recomendable definir la variable de salida (**`result`**), dentro de la funcion, si no se define explicitamente va a tomar el nombre de la funcion.

  Con **`intent`** decidimos si queremos que la variable externa sea modificada ó no, a lo largo del procedimiento.
  - *`intent(in)`*  significa que la variable se define como *solo lectura*
  - *`intent(inout)`* lectura y escritura (*default*).
  - *`intent(out)`*  la variable queda como sólo escritura (no se para que sirve).

Una vez definida una función se la invoca en el programa como: `mi_funcion(arg1,arg2)`

## `SUBROUTINE`
  Las subrutinas a diferencia de las funciones no retornan ningún resultado, aunque sí pueden modificar variables preexistenes del programa (mediante `intent(inout)`).

  La sintaxis de una subrutina es:
```fortran
      subroutine suma(arg1,arg2,arg3)
        implicit none
	
	real, intent(in)    :: arg1,arg2
	real, intent(inout) :: arg3

	arg3= arg1 + arg2

      end subroutine

```

La subrutinas se invocan escribiendo: ` call mi_subrutina(arg1,arg2,...) `

