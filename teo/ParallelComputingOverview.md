# Introduccion a la computacion paralela
	<Tutorial de Parallel Computing Explained en citutor.org >

> 


### Tipos de procesos
	- **Secuenciales**: Ocurren en un orden temporal estricto.
	- **Paralelos**: Pueden ocurrir en forma simultanea.

En computacion paralelizar implicia realizar multiples calculos en forma simultanea utilizando mas de un procesador. Si el tiempo que le lleva a un procesador en realizar la tarea en cuestion es **t** entonces **n** procesdores van realizar la tarea en **t/n** unidades de tiempo.

### Tipos de paralelismo
Para paralelizar un algoritmo es necesario **descomponer** (el proceso o los datos)  en pedazos independientes que pueden ser ejecutados simultaneamente. Por lo tanto hay dos tipos de paralelismo:
	- **Paralelismo de datos**: Multiples procesadores realizan la misma tarea sobre un conjunto de datos que pueden ser fragmentados en pedazos, y finalmente se reunen todos los pedazos para formar el resultado.
	- **Paralelismo de procesos**: Ocurre cuando el algoritmo posee sub-secciones que realizan operaciones distintas e independientes. 

#### Paralelismo en computadoras:


