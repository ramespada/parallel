# Programación paralela

>

## ¿ Qué es ?

  + **Computación serial**: Tradicionalmente el software se escribía para computación *en serie*. Esto quiere decir que un problema se descomponía en una secuencia de instrucciones, y cada una de estas era ejecutada secuencialmente (una después de la otra) en un sólo procesador, y por lo tanto en cada instante de tiempo una sola instrucción era ejecutada.

  + **Computación paralela**: Es el uso *simultanteo* de recursos computacionales para resolver un problema. El problema se descompone en partes discretas que pueden ser resueltas concurrentemente. Cada parte es descompuesta en una serie de instrucciones, y cada una de ellas puede ser ejecutada en diferentes procesadores al mismo tiempo. Para ello se require un controlador global que coordine y una todos los procesos que se llevan a cabo de forma separada.

Para resolver un problema en forma paralela, este debe ser capaz de ser descompuesto en partes que se resuelvan simultaneamente. Los recursos computacionales usados pueden ser computadoras con multiples procesadores (*cores/núcleos*) ó varias computadoras en red.

## Arquitectura de Von Neuman

Para entender la computación paralela es necesrio tener algunos conocimientos básicos de como funciona una computadora. 
La mayoría de las computadoras electrónicas siguen la arquitectura de *John Von Neuman* también conocida como *computadora de almacenamiento de programas*, en ella tanto los programas, las instrucciones y los datos se guardan en una memoria electronica.

Los componentes de estas computadoras son:
  + **Memoria**
    + *RAM* (Random Access Memory) Es una memoria en la que el accesso a cualquier porción de información en ella demora el mismo tiempo (es una idealización).
    + *cache* es la parte de la memoria de accesso más inmediato para un procesador.
    + Cada espacio en la memoria tiene una dirección identificador llamado *memory adress*.
  
  + **Unidad de Control**

  + **Unidad Lógica/Aritmética** (ejecuta operaciones lógicas y aritméticas)

  + Dispositivo de **Input/Output**

## Definiciones y conceptos:


  + *Task*, Sección lógica discreta de un trabajo computacional. Es tipicamente un subprograma que es ejecutado por un precesador. Un programa paralelo consiste en multiples tasks corriendo en multiples procesadores.
  
  + *Core/CPU/Procesador*, Son las unidades básicas de procesamiento que ejecutan una sola tarea. A veces cuando una CPU tiene varios núcleos se la llama *socket*.

  + *Nodo*, básicamente una computadora. Generalmente está compuesto de varias CPUs, y tiene memoria propia.

  + *Cluster*, conjunto de nodos interconectados entre sí en red formando una *supercomputadora*. 

  + *Pipelining*, (Tipo de computación paralela)
  
  + *Granularidad*, Relación entre tiempo de computación y comunicación.
    + Fina: Poco trabajo computacional destinado a comunicación de eventos.
    + Gruesa: Alto tiempo destinado a comunicar nodos.
  
  + *Overhead*, El tiempo requrido en coordinar tasks en lugar de estar haciendo trabajo útil. La coordinación puede incluir: iniciar tasks, sincronización, comunicación, uso de librerías especificas para paralelizar, y terminación.
  
  + *Escalabilidad*, Habilidad de mostrar un incremento proporcional en la velocidad con el incremento de recursos computacionales.


## Tipos de paralelismo (*taxonomía de Flynn*)
Flynn clasificó las computadoras en base a dos características: el *paralelismo de procesos*  y *paralelismo de datos*.

+ **SISD** *(Single Instruction, Single Data)*
Es básicamente una computadora serial. Sólo se ejecuta una instrucción a la vez, y por lo tanto sólo una ruta de acceso a los datos es necesaria.

+ **SIMD**  *(Single Instruction, Multiple Data)*
Todos los procesos ejecutan la misma instrucción en cada ciclo temporal. Y cada unidad de procesamiento puede operar en distintos datos.
Sirven para problemas caracterizados por alto grado de regularidad (por ejemplo en procesamiento de imagenes y computación gráfica).

+ **MISD** *(Multiple Instruction, Single Data)* 
Cada unidad de procesamiento actua de forma independiente por distintas vías de instrucciones. Pero hay un solo canal de datos que alimenta a las unidades de procesamiento. (Esta arquitectura no es muy común).

+ **MIMD** *(Multiple Instruction, Multiple Data)*
Cada procesador puede trabajar en una vía de instrucciones distinta, y el acceso a los datos puede ser diferente para cada uno. Es el tipo más común de computadoras paralelas.

## Límites y costos de la computación paralela

### Ley de Amdahl

Establece que la velocidad de un programa paralelo viene dada por:
[! $v = (1- p)^{-1}$ ]()
donde p: fracción de código paralelizable. 


Considerando el número de procesadores:

[! $v = ( p/n + s)^{-1}$ ]()
donde n: nuemero de procesadores, s:fración serial.

Esto muestra que por más que nos forcemos en paralelizar al máximo un programa, este siempre tendrá un asíntota con respecto al numero de procesadores que usemos. Por ejemplo para un código que se puede paralelizar al 95\% nunca vamos a alcanzar una velocidad mayor a 20 veces la velocidad en serial.


## Arquitecturas de Memoria

Hay dos tipos básicos de arquitecturas de computadoras paralelas (*clusters*):
  1. Clusters de memoria distribuida.
  2. Clusters de memoria compartida.

#### *Distributed Memory*
En estas los procesadores tienen su propia memoria local. En ellas no existe el concepto de *global address space* a lo largo de todos los procesadores.
Como cada procesador tiene su propia memoria local, opera de forma independiente. Por lo tanto tampoco aplica el concepto de *cache* cherency.

#### *Shared Memory*

En teoría estas arquitecturas permiten que los procesadores accedan a cualquier porción de la memoria libremente. Aunque los procesadores operen independientemente todos comparten los mismos recursos de memoria.

Dentro de las arquitecturas de memoria compartida existen dos tipos básicos:
  
  + **Uniform Memory Access (UMA)** Los procesadores son idénticos, y todos tienen igual acceso y en el mismo tiempo a la memoria. 

  + **Non-Uniform Memory Access (NUMA)** Comumente formados por varios UMA interconectados. El acceso a memoria no es equitativo entre procesadores, aunque todos tengan acceso. 


## Modelos de programación paralela

Existen varios modelos de programación paralela en uso:
  + *Shared memory* (sin threads)
    + Es el modelo más sencillo.
    + Todos los tasks comparten un mismo *adress space* donde pueden leer y escribir asincronicamente.
    + Varios mecanismos como *locks* y *semaforos* son utilizados para controlar el acceso a la memoria compartida.
    + Ejemplos: **SHMEM**

  + *Threads*
    + Es un tipo de programación de memoria compartida.
    + Un proceso principal (usualmente conocido como *master thread*) tiene multiples procesos secundarios (*slave threads*)
    + El *master thread* es la rama principal del proceso completo (por momentos se puede ejecutar serial).
    + Ejemplos: **openMP**, **POSIX**
 
 + *Messege Passing* (de memoria distribuida)
    + Un conjunto de tasks usan su porpia memoria local y varios de ellos pueden ó no residir en la misma maquina. 
    + El intercambio de datos entre tasks se realiza vía envio y recepción de mensajes.
    + La transferencia de datos requiere operaciones coperativas que son realizadas por cada proceso.
    + Ejemplos: **MPI**

  + *Paralelización de datos*
    + También conocido como **PGAS** (*Partitioned Global Address space*)
    + El *adress space* es tratado globalmente.
    + La mayoria del trabajo paralelo se focaliza en realizar operaciones en un conjunto de datos.
    + Los datos generalmente se organizan en una estructura común como arrays o cubos.
    + Ejemplos: **Coarray** (Fortran)
  
## Diseño de programas paralelos

Sin duda, el primer paso a desarrollar un programa paralelo es entender en primer lugar el problema que se quiere resolver en paralelo. 

Y analizar antes si el problema es realmente paralelizable.

Identificar *hotspots*

Identificar *cuellos de botella* del programa

Identificar inhibidores al paralelismo (el más común es la dependencia de datos).

Investigar otros algoritmos posibles.


### Paralelismo automatico
Muchos compiladores cuando analizan el código identifican oportunidades para paralelizar, particularmente en loops. En tal caso uno podría analizar el código e identificar inhibidores e intentar eliminarlos de forma tal que el compilador pueda identificarlo y paralelizar.
 
De todas formas lo más común es que la paralelización se realice manualmente en base a directivas realizadas por el programador.

### Partición

El primer paso en todo programa paralelo es descomponer el problema en pedazos discretos de trabajo que puede ser distribuido a distintos taks.

Hay dos formas básicas de particionar:
  + *Descomposición del dominio*: Esta asociado a descomponer los datos asociados al problema, y hacer que cada task trabaje en una porción de los datos. Por ejemplo se puede descomponer los datos en *bloques* ó *ciclicamente*.

    
  + *Descomposición funcional*: Este se focaliza en el rol que cumple cada pedazo de código en la resolución de problema global. Por ejemplo en el modelado de la atmósfera se descomponen las rutinas en: dinámica, física (turbulencia, convección, radiación, nubes, etc.), química, océano, etc.
 
### Comunicación
La comunicación sólo es necesaria cuando los tasks comparten datos. Si el problema a tratar se puede descomponer en muchos pedazos autónomos, entonces no es necesario hacer eso de ella.
Algunos facotres a considerar:

+ Evitar *sobre-comunicación* (*overhead*)
+ *Latencia vs Ancho de banda*
  + Latencia: tiempo que demora enviar un mensaje de 0bytes entre dos tasks (seg).
  + Ancho de banda: cantidad de información que puede enviarse por unidad de tiempo (bytes/seg).
+ Visibilidad de comunicaciones. Es deseable tener información sobre la comunicación entre tasks.
+ Comunicación sincrónica vs asincrónica
+ Estrategia de comunicación:
  + *Punto a punto*
  + *Colectiva*
+ Eficiencia de comunicación
+ Sobrecarga y complejidad

### Sincronización

Tipos de sincronización:
  + *Barrier* /Barrera: Todos los tasks están involucrados. Cuando el último task llega a la barrera entonces se sincronizan los taks.

  + *Lock*/Semáforo: Puede involucrar cualquier numero de taks. Se usan para serializar/proteger acceso a datos globales. Sólo un task a la vez puede usar el lock.

  + Sincrónica


### Dependencia
Hay *dependencia entre instrucciones* cuando el orden de ejecución de estos afecta el resultado del programa. También existe la *dependencia de datos* resulta del uso múltiple de la misma locación de datos por distintos tasks.
La dependencia es importante ya que **es el principal inhibidor de paralelismo**.


### Balance de carga
El balance de carga (*load balancing*) se refiera a la forma en que se distribuye la cantidad de trabajo entre taks de forma tal de reducir la capacidad osciosa.

las estrategias posibles son:
  + *Distribución equitativa*

  + *Asignación dinámica*
### Granularidad
Como ya se dijo, la granularidad hace referencia a la relación entre computación y comunicación.
  + Granularidad fina
    + Periodos cortos de computación intercaldos con eventos de comunicación.
    + Facilita balance de carga. 
  * Granularidad gruesa 
    + Periodos largos de computos seguidos por sincornización.
    + Mayor oportunnidad de incrementar performance.
    + Dificil de balancear la carga.


### Input/Output
Las operaciones I/O son generalmente inhibidores de paralelismo. sin embargo existen sistemas de archivos adaptados a paralelización, por ejemplo: *GPFS*, *Lustre*, *HDF*
