
## Day 1


### Intro to HPC

Por que usar computadoras en ciencia?
- Usar teorias complejas sin una solución analítica cerrada.
- Hacer experimentos "imposibles"
- Calibrar correctitud de modelos ó teorías

Que es HPC?
> "...es cuando importa cuan rápido obtengo una respuesta."

Estación de trabajo paralela
- procesadores multi-core
- sistema operativo tipo unix
- todos los procesadores tienen acceso a toda la memoria
	+ UMA (*uniform memory access*)
	+ NUMA (*non-uniform memory access*)

Un cluster necesita:
	- multiples computadores.
	- una network
	- software que orequestre la comunicación entre procesos paralelos en los nodos (e.g MPI)
	- software que reserve recursos a usuarios individuales

#### Grid-computing
- Acomplamiento de recursos computacionales, conceidos para procesar grandes cantidades de datos.
- Necesita "middleware" para acceso tranparent para recursos inhomogeneos.

#### Cloud computing
- Es un tipo simplificado de grid computing
- Grid: usa job description para match pedido de calculo a un host, usa nombre para identificar univocamente a los usuarios, manejo de recursos oportunista.
- Cloud: provee un server virtual o container en recursos compartidos a medida que se necesite con OS custom, comercialiacion, y locación fisica flexible.


¿Cómo medimos performance?
- Para operaciones numéricas **FLOP**/s  = FLoating-Point OPerations per Second.
- Pico de performance teórica = clock-rate x number of double precision operation por clock
- Pico de performance real (depende de la aplicación, muchos usan como benchmark el **Linkpack** 


Tipos de paralelismo:
- Paralelismo *funcional*: distintas operaciones en simultaneo.
- Paralelismo de *datos*: la misma operación en distintos objetos en simultaneo.

