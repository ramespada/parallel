# 06 - Input/Output

> Leer y escribir información..

## Standard I/O
  Los standard input/output (abreviados: *stdin*/*stdout*), son las formas más símples de transferencia de información entre la computadora y el usuario.

  El *stdin* es el que está vinculado a las entradas que damos desde la consola con nuestro teclado. En FORTRAN el ingreso de *stdinput* se reclama con la función **`read`**:
 ```fortran
    read(*,*),variable
```

La forma mas simple de retornar informacion es el *stout*, que serian los mensajes que aparecen en consola. Para mandar cosas al *stout* podemos usar:
```fortran
    write(*,*),'mensaje' 
    print*,'mensaje' 	!esta es la forma abreviada
```
Comentario: Una forma de pensar al stdout es como un archivo almacenado en algun lugar de la computadora (en linux generalmente esta en */dev/fd/2*). Cada vez que un cambio se produce en este archivo la terminal lo muestra en pantalla.

De los dos asteriscos que aparecen en `read(*,*)` y `write(*,*)`, el primero está vinculado al **numero de unidad logica** (*logical unit number*) `UNIT`, y el segundo con el formáto del input/output (`FMT`).

## Unidad Lógica
La unidad lógica está vinculado al *canal* por el que viajan los inputs y ouputs. A medida que el preograma se ejecuta la información puede moverse en múltiples rutas (por ejemplo ir a distintos archivos) para distinguirlas es conveniente *etquietar* las unidades lógicas, en FORTRAN usamos un `INTEGER` para tal fin. Si la unidad logica es el *stdin/stdout* entonces `UNIT=*`. Cuando veamos como trabajar con archivos vamos a profundizar en esto.

## Formato
El formato `FMT` es un `CHARACTER` en el cual se especifica la forma del output ó input (siempre que sepamos, caso contario `FMT=*`).

Las códigos utilizados para definir el formáto de las variables de fortran son:

|**FMT** |    tipo     | descripcion   		                |
| ------ |:-----------:| --------------------------------------:|
| Fn.m   | `REAL`      | punto flotante en forma decimal. 	|
| En.m   | `REAL`      | punto flotante en forma exponencial.   |
| Dn.m   | `DOUBLE PRECISION`      | punto flotante de doble precision.   |
| In     | `INTEGER`   | numero entero		       		|
| An     | `CHARACTER` | caracter alfanumerico	        	|
| Ln     | `LOGICAL`   | variable logica	        	|

donde : **`n`** = numero de espacios/digitos totales de la variable (considerar que el signo la coma y el signo de exponente ocupan un espacio); **`m`**= decimales (mantisa para la forma exponencial).

#### Otros símbolos que podemos usar en FMT:

Los simbolos que describen como es el formato se denominan especificadores de formato (*format specifiers*), algunos bastante utiles:

|**FMT** | descripcion         		                      |
| ------ | --------------------------------------------:|
| n(...) | Repetir lo que esta entre (...) n-veces	    |
| "..."  | Literal (lo que esta dentro de "")    	      |
| nX  	 | Espacio horizontal/skip        	  	        |
| /      | Espacio vertical/nueva linea	       		      |
| SP	   | Mostrar signo 		 		                        |


## Manejo de archivos
Otra forma de transferir informacion es mediante el uso de archivos.

### **`OPEN`**/**`CLOSE`**
Si queremos abrir un archivo en FORTRAN, tenemos que usar el siguiente comando:

```fortran
    open(UNIT=1, FILE='archivo.txt') 	!abrir archivo			   
    
	!(aca hariamos algo con el archivo...	)

    close(UNIT=1)			!cerrar archivo
```
Los unicos argumentos obligatorios son `UNIT` y `FILE`. Pero hay otros argumentos opcionales que pueden ser utiles:

| Keyword   |  Valor/Tipo   |    Comentarios                 |
|:--------- |:--------------|:-------------------------------|
| `UNIT`    | (`INTEGER`)   | Número de unidad lógica (LUN)  |
| `FILE`    | (`CHARACTER`) | Nombre de archivo a usar       |
| `STATUS`  | 'OLD'         | Para archivo preexistente      |
|           | 'NEW'         | Para nuevo archivo             |  
| `ACCESS`  | 'SEQUENTIAL'  | Lectura linea por linea        |
|           | 'DIRECT'      | Lectura de acceso 'random'     |
| `FORM`    | 'FORMATTED'   | Para archivo alfanumérico      |
|           | 'UNFORMATTED' | Para archivos binarios         |
| `ACTION`  | 'READ'        | Solo lectura                   |
| 	        | 'WRITE'       | Solo escritura                 |
| 	        | 'READWRITE'   | Lectura y escritura            |
| 	        | 'UNDEFINED'   | Indefinido                     |
| `IOSTAT`  | (`INTEGER`)   | Guarda el estado del proceso   |


Recuerden que `UNIT` es la unidad logica, es un numero entero que nos va a servir para referenciar el archivo siempre que invoquemos alguna funcion que necesite hacer eso del archivo. 

Un argumento muy util es `IOSTAT`, esta es una variable `INTEGER` (que debemos crear previamente) y sirve para saber si fue exitosa la lectura. En base a este podemos planificar un mensaje de error y asi poder ubicar el lugar donde se produjo el error en el codigo. `IOSTAT` se inicializa en 0, cuando termina la lectura cambia a:                                                          
	- (-1), cuando termina de leer el registro.
	- (-2), si la lectura se estanca.
	- numero positivo, si hay un error fatal.


### **`READ`**/**`WRITE`**

Una vez que tenemos un archivo abierto podemos leer o escribir informacion en el utilizando los mismos comandos que antes, esta vez especificando la `UNIT` correspondiente al archivo en cuestion, si queremos escribir algo:

```fortran
	OPEN(UNIT=1, FILE="archivo.txt",STATUS="NEW",ACTION="WRITE")
        WRITE(UNIT=1, FMT='(a30)') 'aca dejo un mensaje'
	CLOSE(UNIT=1)
```
y para leer contenido de un archivo:
```fortran
	OPEN(UNIT=1, FILE="archivo.txt",STATUS"OLD",ACTION="READ")
        READ(UNIT=1,FMT='(a30)') mensaje_leido
	CLOSE(UNIT=1)
```

## **`NAMELIST`**
Los namelist son una forma muy comoda de inicializar un conjunto de variables desde un archivo externo.

Dentro de un namelist es un archivo externo que contiene el nombre de un grupo de variables y sus valores, por ejemplo asi:
```
&mi_namelist
	var1= 1,
	var3='hola', v4=6.54	!no importan los espacios
	var2= 2.12321, 		!no hace falta que esten ordenados
	...
	varN=.true.,
/
```
*mi_namelist* es un identificador del namelist, ya que puedo tener varios, incluso en el mismo archivo. Se utilizan los simbolos **&** y **/** para delimitar cada namelist.

Dentro del codigo tenemos que definir el nombre del namelist (en este caso *mi_namelist*), y todas las variables contenidas en el. La sintaxis seria:
```fortran
	namelist/mi_lista/var1,var2,var3,...,varN   	!defino namelist
```

Finalmente para leer el namelist usamos la funcion open/close y read de la siguiente forma:
```fortran
	open(7,file='mi_namelist.inp')			!abro namelist
    	read(7,mi_lista)				!leo los valores
	close(7)					!cierro namelist
```

Advertencia: como siempre todas las variables dentro del namelist deben ser definidas antes de definir el namelist y de ser leidas.

