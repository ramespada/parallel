# 08 - Memoria y portabilidad

> Uso uso de memoria.

### Variables estáticas: Tamaño y forma fija. 

Hasta ahora siempre trabajamos con variables de tamaño fijo, pero si queremos trabajar con variables cuyo tamaño cambie a lo largo de la ejecucion del programa vamos a necesitar definir *variables dinámicas*.

### Variables dinámicas
---
Cualquier variable que definimos ocupa un espacio en la memoria el cual se le es asignado mediante un identificador (**adress**). Las variables dinámicas son variables cuyo adress se determina cuando el programa esta corriendo.

#### Declaración:
En fortran, para definir una variable dinamica escribimos:

```fortran
    real, allocatable   ::  var(:)
```
Notar que agregamos la sentencia **`allocatable`**, y además reemplazamos el número de elementos de cada dimensión por el simbolo **`:`**, esto deja el tamaño de la variable indefinido. Sin embargo, cuando quiera hacer uso de la variable voy a tener que especificar su tamaño, esto se hace:

```fortran
   ALLOCATE(name(bounds) ) ! Asignar memoria
```
donde *bounds* es `shape` deseado para la variable.

Cuando querramos liberar memoria podemos *desalocatar* a la variable, así:

```fortran
   DEALLOCATE(name)        ! Liberar memoria
```

#### Fugas de memoria:
   El manejo de la memoria recae sobre nosotros cuando usamos variables dinámicas.
   La memoria alocatada solo se libera cuando:
  - usamos deallocate
  - se termina el programa

 Las variables *LOCALES* (dentro de subrutinas y funciones) tienen que ser desalocatadas al final del procedimiento!!
Con `ALLOCATED(a)` preguntamos si está allocatado.

## Precision y portabilidad: **`KIND`**

Los posibles estados de las unidades basicas que conforman la memoria de una computadora son 2 (llamemosle 0 y 1), por lo tanto cualquier dataype que querramos representar con la computadora va a construirse con un conjunto de 0s y 1s (que comparten un mismo adress, un mismo espacio en la memoria). A la unidad de informacion que puede se almacenada en una de estas unidades de memoria se lo conoce como **bit**.

Ocurre aveces que en distintas maquinas o en distintos compiladores que el numero de bits usado para representar a los distintos datatypes puede ser distinta. Esto trae problemas de compatibilidad entre equipos y compiladores. 

FORTRAN para evitar estos problemas permite definir la memoria asignada para representar cualquier datatype mediante la asignacion de un valor entero conocido como **`kind`**. Este representa el espacio de memoria que va a ocupar la variable (en bits).

Para representar numeros enteros **`INTEGER`** se utiliza 1 bit para definir al signo (+/-) y el resto de bits para construir el numero enteroen base 2 o binaria. 

|bits|**`kind`**|nombre | rango (sin signo)		    | rango (con signo)			                                                |
|:---|--------- |:------|:---------------------------------:  |:--------------------------------------------------------- |
|1   |	-       |bit	  |2<sup>1 </sup>=2		                  |+/-				    			                                      |
|8   |	1       |byte   |2<sup>8 </sup>=256 		              |+/- 2<sup>7 </sup>=(-128;127) 	    			                  |
|16  |	2       |half   |2<sup>16</sup>=65536 		            |+/- 2<sup>15</sup>=(-32768;32767) 		   		                |
|32  |	4       |single |2<sup>32</sup>=4294967296	          |+/- 2<sup>31</sup>=(-2147483648;2147489647)	 	            |
|64  |	8       |double |2<sup>64</sup>=18446744073709551616  |+/- 2<sup>63</sup>=(-9223372036854775808;922372036854775807) |

La sintaxis es simplemente:
```fortran
	implicit none
	integer(kind=1)	:: i8
	integer(kind=2)	:: i16
	integer(kind=4)	:: i32
	integer(kind=8)	:: i64
```
Lamentablemente, tambien ocurre que el codigo de `kind` significa distintas cosas en distintos compiladores. Para resolver definitivamente esto inventaron una funcion `SELECTED_INT_KIND(R)` que devuelve el kind necesario para representar numeros en el intervalo (10<sup>-R</sup> ; 10<sup>R</sup>).

Los puntos flotante (**`REAL`**) consisten en el signo **s**, la mantisa **m** (o precision) y el exponente **e** (o rango).x=<b>s</b> <b>m</b>10<sup><b>e</b></sup>. Segun el formato estandarizado en la IEEE, la asignacion de bits para cada cada uno es:

|punto flotante|signo|exponente|mantisa|
|:-------------|:---:|:-------:|:-----:|
|32 bits       |1    | 8       | 23    | 
|64 bits       |1    | 11      | 52    |

Esto tiene algunas consecuencias de redondeo que harian que querramos usar otro sistema. FORTRAN permite definirlo utilizando el comando `SELECTED_REAL_KIND(m,e)`. donde **m**=mantisa y **e**=exponente.

```fortran
   integer, parameter  :: mi_kind = SLECTED_REAL_KIND(30,10)
   real(kind=mi_kind)  :: x
```

Para numeros complejos **`COMPLEX`** la idea es la misma, solo que el tamaño real será del doble del `kind` asignado ya que almacena un punto flotante para la parte real y otro para la parte imaginaria.

Los strings o **`CHARACTER`** tambien se representan con numeros enteros. Cada simbolo tiene asignado un numero natural. Hay distintos estandares, el mas conocido “ASCII”  (*American Standard Code for Information Interchange*) que es el que utiliza FORTAN por default. Para elegir otro sistema se utiliza el comando `SELECT_CHAR_KIND("OTRO_SYSTEMA")`, por ejemplo:

```fortran
  implicit none
  integer, parameter :: ucs4  = selected_char_kind ('ISO_10646')
  character(kind=ucs4, len=26) :: mensaje
```
