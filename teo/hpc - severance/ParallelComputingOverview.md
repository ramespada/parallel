# Introduccion a la computacion paralela

> Resumen de HPC basados en articulos de "Tutorial de Parallel Computing Explained" (citutor.org)  y libro de Severance. 


### Tipos de procesos
	- **Secuenciales**: Ocurren en un orden temporal estricto.
	- **Paralelos**: Pueden ocurrir en forma simultanea.

En computacion paralelizar implicia realizar multiples calculos en forma simultanea utilizando mas de un procesador. Si el tiempo que le lleva a un procesador en realizar la tarea en cuestion es **t** entonces **n** procesdores van realizar la tarea en **t/n** unidades de tiempo.

### Tipos de paralelismo
Para paralelizar un algoritmo es necesario **descomponer** (el proceso o los datos)  en pedazos independientes que pueden ser ejecutados simultaneamente. Por lo tanto hay dos tipos de paralelismo:
	- **Paralelismo de datos**: Multiples procesadores realizan la misma tarea sobre un conjunto de datos que pueden ser fragmentados en pedazos, y finalmente se reunen todos los pedazos para formar el resultado.
	- **Paralelismo de procesos**: Ocurre cuando el algoritmo posee sub-secciones que realizan operaciones distintas e independientes. 

#### Paralelismo en computadoras:



---

# High Performance Computing (HPC)
## 1 Modern Computer Architectures
### 1.1 Memory
Pese a que la velocidad de los procesadores se incrementan exponencialmente, la performance de la memoria mejora a una tasa mucho menor, y mucho de los probelmas en HPC usan grandes cantidades de memoria.
El problema es que a medida que queremos resolver problemas a altas velocidades el sistema de memoria requerido es grande y a su vez de rapido acceso.
Algunos approaches incluyen:
- Cada componente de memoria puede ser suficientemente rápido individualmente para responder a cada pedido de acceso.
- La memoria lenta puede accederse en un tipo "round-robin" para dar elefecto de memoria rápida.
- El diseño de memoria puede ser amplio para que cada transferencia incluya más bytes.
- El sistema puede ser dividio en particiones rapidas y lentas y arreglado de forma tal que las rapidas se usan más frecuentemente que  las lentas.


#### 1.1.2 Tecnología de memoria
Casi todas las memorias rápidas utilizadas hoy en día son basadas en semiconductores. Vienen en dos sabores:

- **DRAM** (Dynamic Random Access Memory). Basadas en cargas guardas en capacitores. La carga puede debilitarse, por eso la memoria tiene que ser acutalizada continuamente para que no haya perdida de información. Son más baratas, y suelen tener mayor densidad de celdas de memorias por chip (menor costo, menor espacio, menor energía, menor calor).

- **SRAM** (Static Random Access Memory) Basadas a gates donde cada bit esta guardado entre 4-6 transistrores. Estas retienen la información mientras estén conectadas. Son mas caras pero para aplicaciones que requieren mayor velocidad (como cache ó memoria de video) es más apropiada.

**Tiempo de acceso**: es el tiempo  requerido para leer ó escribir una locación de memoria. Un parámetro relacionado es el **tiempo de ciclado de memoria** que dice cuan frecuente se puede acceder a la memoria.

### 1.1.3 Registros
Los registros son la capa superior en la jerarquia de la memoria, y funcionan tan rapido como el resto del procesador. Por lo tanto, el objetivo es mantener los operandos en el registro lo más que se pueda. Esto es especialmente para valores intermedios utilizados en una operación larga. Los compiladores por lo general estan preparados para detectar y optimizar el uso de registros.

#### 1.1.4 Caches
La siguiente capa en memoria por debajo de los registros es el **caché**. Estos son pequeños pedazos de STAM que guardan un subset de contenidos de la memoria. El ideal es que el cahche tenga el correcto subset de memoria en el momento correcto.

Generalmente hay distintos niveles de caches con distintos tiempos de acceso.

|---------------------- |----- |
|Registros		|2   ns|
|LI caché (on-chip)	|4   ns|
|L2 cache (on chip)	|5   ns|
|L3 cache (off-chip)	|30  ns|
|Memoria		|220 ns|

Tabla. Velocidad de acceso a memoria en DEC 21164 Alpha.

En CPUs multi-core los datos del cache y registros tienen que volver a la memoria central para que el resto de los procesadores puedan verla y actualicen sus listas. Decimos que mantienen *coherencia* entre caches. 

Los caches son efectivos por que los programas usualmente exhiben caracteristicas que ayudan a mantener alto nivel de acceso. Estas caracteristicas son la cercanía de referencia *espacial* y* temporal*.

Los caches trabajan mejor cuando un programa lee secuencialmente atravez de la memoria. El primer llamado puede tardar, pero luego los siguientes elementos se acceden rapido debido al cache. Esto se conoce como unidad de paso (*unit stride*) porque el adress de cada elemento en un array se incrementa de uno en uno.

Por ejemplo, este loop es de paso unitario:
```fortran
  DO (i=1,10000); 
     SUM = SUM + A(i)
  END DO
```
mientras que este no:
```fortran
  DO (i=1,10000,8); 
     SUM = SUM + A(i)
  END DO
```
y por lo tanto la performance se ve afectada.

Otro ejemplo, en fortran los elementos de arrays de dos dimensiones se almacenan consecutivamente en el sentido de las columnas, por si para acceder a los elementos lo hacemos en el sentido de las filas, vamos a romper el paso unitario,por ejemplo:

```fortran
   REAL A(200,200)
   DO I = 1 200
   	DO J = 1,200
   		SUM= SUM + A(I,J)
   	END DO
   END DO
```

mientras que lo más eficiente sería:
```fortran
   REAL A(200,200)
   DO J = 1 200
   	DO I = 1,200
   		SUM= SUM + A(I,J)
   	END DO
   END DO
```

Otro caso de ineficiencia en el uso de memoria es en loops como el siguiente
```C
	whilte ( ptr != NULL ) ptr = ptr->next;
```
En este caso el pointer da vueltas por toda la memoria sin un patron en particular, esto se llama *pointer chasing*, y no hay formas de mejorar la performance del codigo.


Un tercer caso muy común es el llamado  gather (o scatter) y ocurre en loops tales como
```fortran
	SUM = SUM + ARR( IND(I))
```
donde IND es un array que contiene ubicaciones de elementows de ARR. Esto tambien recorre una ruta en memoria que no es conocida y no permite la optimización del uso del cache.

#### 1.1.5 Organización de cache
El proceso de parear ubicaciones de la memoria con las lineas del cache se llama "mapeo". Cada linea del cache tiene un registro de la direccion de memoria que representa (llamado *tag*) y quizas la ultima vez que fue usado. El *tag* es usado para trackear que area de la memoria es guardada en una linea en particular.



##### Cache directamente mapeado
Los caches se posicionan equidistantes en la memoria, dividiendola en pedazos de la longitud del cache. El conjunto de fragmentos separados por 1 longitud de cache forman una *linea de cache*.

Cuando durante la corrida se consultan alternadamente partes de memoria que estan en la misma linea de cache mapeado directamente entonces cada referencia borra la anterior para reemplazarla causando mucho *overhead*, esto es conocido como *trhashing*.

##### Cache totalmente asociativa
El otro extremo de mapeo sería mapear cualquier locación de memoria con cualquier linea de cache, independientemente del adress. Su nombre viene de la memoria asociativaque es una especie de memoria normal pero que cada celda sabe algo sobre los datos que contiene.
Cuando el procesador busca un dato, va a las lineas de cache preguntando si alguno lo tiene, aquel que lo contenga lo guía a la memoria. 

Es dificil que ocurra *thrashing* en este tipo de mapeo.


##### Cache asociativa en conjunto
Es una mezcla de los dos mapeos anteriores.

##### Cache instrucción


#### 1.1.6 Memoria virtual

#### 1.1.7 Mejora de performance de memoria




### 1.2 Floating-Point Numbers

## 2 Programming and Tuning Software
### 2.1 What a Compiler Does
### 2.2 Timing and Profiling
### 2.3 Eliminating Clutter
### 2.4 Loop Optimizations

## 3 Shared-Memory Parallel Processors
### 3.1 Understanding Parallelism
### 3.2 Shared-Memory Multiprocessors
### 3.3 Programming Shared-Memory Multiprocessors 

## 4 Scalable Parallel Processing
### 4.1 Language Support for Performance
### 4.2 Message-Passing Environments

## 5 Appendixes
### 5.1 Appendix C: High Performance Microprocessors 
### 5.2 Appendix B: Looking at Assembly Language
