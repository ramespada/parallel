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
