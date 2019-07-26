# 07 - Arrays

> Declarar, y trabajar con arrays.

Los arrays son una forma de almacenar multiples valores en una sola variable.  

## Declaración
---
La declaración de arrays, es igual a la de cualquier variable, sólo es necesario añadir el rango (ó dimensión) y el número de elementos por cada dimensión.

```fortran
   implicit none
   character(len=20), dimension(5) :: lista
   integer, dimension(6) :: n 		!Vector entero
   real  	  :: v(6)	     !Vector 
   real 	  :: A(3,3)    !Matriz 3x3

```
Por default cada dimension se indexa empezando desde 1, pero eso puede ser modificado al definir el array, por ejemplo: `integer :: n(8:12), m(-5:2), o(0:3)`. 

## Iniciación
---
La iniciacion de arrays puede ser un poco mas tediosa, muchas veces involucran loops, pero existen algunos atajos para simplificar la notacion, ademas muchas veces los arrays los vamos a levantar desde algun archivo o  utilizando alguna libreria especifica, asi que no es tan grave ni tan importante.

Hay muchas formas de iniciar un array, algunas de las más comúnes:
```fortran
  lista(1) = 'Manzana'		!Directo
  lista(2) = 'Banana'
  lista(4) = 'Kiwi'

  n=(/ 4, 3, 8, 7,-1, 0 /)	!Directo en una linea

  do i=0,10,2			!Loop
	n(i)=i
  end do

  n=(/ (i,i=0,10,2) /)		!Loop implicito
  
  v=(/ (i,i=1, 6,1)  /)*0.45
  v=(/ (i*0.45,i=1, 6,1)  /)

  A= 0.				!Todos los elementos igual a zero

  A(1,:)=(/ 1.0, 0.0, 0.0 /)	!Por filas/columnas
  A(2,:)=(/ 0.0, 1.0, 0.0 /)
  A(3,:)=(/ 0.0, 0.0, 1.0 /)

  A = reshape((/(i*0.25,i=1,size(A))/),shape(A)) !usando reshape
```

Algunas operaciones que nos dan información sobre los arrays son:
  - `size()` devuelve el *numero de elementos total*
  - `shape()` devuelve un array con el numero de elementos por dimension
  - `lbound()` `ubound()`, devuelve el min/max indice de cada dimension (recuerden: no siempre empiezan en 1) 

## Acceso y asignación
---
Se puede acceder a los elementos de los arrays de la siguiente forma:

```fortran
    A(3,1)	    !Acceso elemento [fila:3, columna:1]
    A(:,1)	    !Acceso columna 1
    A(2,2:3)	  !Acceso fila 2, columnas del 2 a 3
    A(1:6:2,:)  !Acceso a filas del 1 al 6, cada 2 filas
	
    A(3,1)=5.1	!asignar valores a un elemento
    A(3:5,1)=(/ 1.4, 2.0, 8.7 /)	!asignar valores a un conjunto de elementos
```

### Algunas operaciones
---

Algunas operaciones basicas que pueden realizarse con arrays:
```fortran
    !Aritmética
    A+A*2    	 !operan elemento por elemento

    sum(A)    	!suma todos los elementos de A
    product(A) 	!producto de todos los elementos de A

    all(A>0)     !Todos los elementos de  A > 0?    (.true./.false.)
    any(A<0)     !Algún elemento de A es < 0 ? 	    (.true./.false.) 
    count(A>0.2) !Cuantos elementos cumplen A>0.2 ? 
```

