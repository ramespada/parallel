# 03 - Controladores de flujo

> Sintaxis de los controladores más importantes en fortran (*loops* y *condicionales*). 

La funcion de los *controladores* es alterar la secuencia de instrucciones a ser ejecutadas.

## Condicionales
---
Los condicionales ejecutan un segmento de código cuando se cumple alguna condición.

### `IF`
  El **`if`** revisa si se cumple una condición (generalmente expresada en una operación relacional), en caso afirmativo ejecuta una porción de código, y en caso negativo sigue de largo hasta encontrarse con otro condicional, su sintaxis en fortran es así:
```fortran
    if(x > 0) then
        print*,"x es positivo."
    else if (x < 0) then
        print*,"x es negativo."
    else
        print*,"x es cero."
    end if
```

### `CASE`
 El controlador **`case`** propone una serie de escenarios para el valor de una variable, y de acuerdo a cual se cumpla ejecuta un procedimiento distinto. Por ejemplo:

```fortran
  select case (x)
    case(1:)
      print*,"x es positivo."
    case (:-1)
      print*,"x es negativo."
    case default
      print*,"x es cero."
  end select
``` 

## Loops
---
  Los loops (o *bucles*) ejecutan una secuencia de código repetitivamente (*iterativamente* decimos) un número determinado de veces (ó hasta/mientras que se satisfaga una condición).

### `DO`

El principal *loop* es el **`do`** (equivalente al **`for`** de otros lenguajes)

Este controlador utiliza un `INTEGER` como *contador* (ó indice), el cual va tomando distintos valores, y las instrucciones contenidas en el bloque `do` se repiten para cada valor del contador. La sitaxis en fortran es:
```fortran
    do i=1,10,2    	!i toma valores del 1 al 10, y avanza de a 2     
        print*,i   
    end do
```
El programa anterior mostrará secuencialmente en pantalla los numeros del 1 al 10. 

### `DO WHILE`
Este controlador es una mezcla de los dos anteriores, funciona repitiendo una serie de instrucciones, pero chequiando en cada repetición si una condición se cumple, en caso que deje de cumplirse termina de *iterar*. Su sintaxis es:
```fortran
    do while (i<10)  !ejecutar mientras i sea menor a 10
        print*,i
        i=i+2
    end do
```
Este código hace exactamente lo mismo que el `do` anterior.


---
  Algunos comandos útiles para utilizar dentro de controladores son:
- **`STOP`** termina la ejecución del programa.
- **`EXIT`** sale del bloque controlador.
- **`CONTINUE`** no hace absolutamente nada (pero aveces queda prolijo).
- **`CYCLE`** pasa a la siguiente iteración (en loops).

