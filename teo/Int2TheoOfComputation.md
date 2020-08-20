# Introducción a Teoría de la Computación.

> Apuntes del libro de *Michael Sipser*.

Partes:
   1. AUTOMATA
   2. COMPUTABILIDAD
   3. COMPLEJIDAD

---

# Parte I: AUTOMATA

## 1. Lenguajes Regulares

### 1.1 Automata Finito (FA)

Un *Automata finito* es una 5-tupla (Q, &Sigma;, &delta;, q<sub>0</sub>, F), donde:
   1. Q conjunto de posibles estados.
   2. &Sigma; conjunto finito de acciones *alfabeto*.
   3. &delta;: Q x &Sigma; &rarr; Q 
   4. q<sub>0</sub> &isinv; Q: estado inicial.
   5. F &sube; Q: el conjunto de estados de aceptación.

<p align="center"><img src="img/FA_diagram.png" height="200px"/></p>

una maquina *M* lee un **string** ó conjunto de elementos del alfabeto *&omega;* &isinv; &Sigma;, los procesa siguiendo las reglas definidas por &delta; y retorna un estado final q<sub>f</sub>. Si q<sub>f</sub> &isinv; F, entonces decimos que la máquina **acepta** a &omega;.

Decimios que *M* acepta &omega; si existe una secuencia de estados r<sub>1</sub>,..., r<sub>n</sub> en Q tal que:
   1. r0=q0
   2. &delta;(ri,&omega;<sub>i+1</sub>)=r<sub>i+1</sub>
   3. r<sub>n</sub> &sube; F

Definicion *lenguaje de maquina*: Sea A el conjunto de todos los strings que la máquina *M* reconoce/acepta, entonces decimos que **A es el lenguaje de M** y lo notamos: A = L(*M*)


Definición de *lenguaje regular*: Un lenguaje es **regular** si existe un automata finito que lo reconoce.

#### Operaciones regulares:

Sean A y B lenguajes, definimos las siguientes opraciones:
1. *union* (A &xcup; B)={x | x &isinv; A ó x &isinv; B}
2. *concatenacion* (A &cir; B) = {xy| x &isinv; A e y &isinv; B}
3. *star* A&sstarf;={x1,x2,...,xk|k>0 y cada xi&isinv;A}

Teorema: La clase de lenguajes regulares es cerrado en la unión y conecatenación.


### 1.2 Automata Finito No-determinístico (NFA)

Un *Automata finito no determinístico (NFA)* es una 5-tupla (Q, &Sigma;, &delta;, q<sub>0</sub>, F), donde:
   1. Q conjunto de posibles estados.
   2. &Sigma; conjunto finito de acciones *alfabeto*.
   3. &delta;: Q x &Sigma; &rarr; P(Q) 
   4. q<sub>0</sub> &isinv; Q: estado inicial.
   5. F &sube; Q: el conjunto de estados de aceptación.

<p align="center"><img src="img/NFA_diagram.png" height="200px"/></p>


Teorema de equivalencia entre NFA y Automata finito (DFA): todo NFA tiene un equivalente DFA.




### 1.3 Expresiones Regulares:

Definición: Decimos que R es una **expresión regular** si:
   1. R es a &isinv; &Sigma;
   2. R es &epsilon; 
   3. R es &empty;
   4. R = (R_1 &xcup; R_2), donde R_1 y R_2 son regex
   5. R = (R_1 &cir; R_2),  donde R_1 y R_2 son regex
   6. R = R_1&sstarf;, donde R_1 es regex.



Teorema de equivalencia con automata finito: un lenguaje es regular si solo si es descrito por una expresión regular.



##### Automata Finito No-determinístico generalizado (GNFA)
Un *Automata finito no determinístico generalizado (GNFA)* es una 5-tupla (Q, &Sigma;, &delta;, q<sub>0</sub>, F), donde:
   1. Q conjunto de posibles estados.
   2. &Sigma; conjunto finito de acciones *alfabeto*.
   3. &delta;: (Q-q<sub>acept</sub>) x (Q - q<sub>0</sub>) &rarr; R 
   4. q<sub>0</sub> &isinv; Q: estado inicial.
   5. F &sube; Q: el conjunto de estados de aceptación.

<p align="center"><img src="img/GNFA_diagram.png" height="200px"/></p>


### 1.4 Lenguajes no-regulares
Todos los lenguajes regulares tienen la siguiente propiedad:

**Teorema del bombeo**: Sea L un lenguaje regular. Entonces existe un entero p&geq;1 ("longitud de bombeo") tal que cualquier cadena w&isinv;L, de longitud &geq;p, puede ser escrita como w = xyz (p. ej. dividiendo w en tres sub-strings), de forma que se satisfacen las siguientes condiciones:
1. |y| &geq; 1 
2. |xy| &leq; p 
3. &forall; i&geq;0: xy<sup>i</sup>z&isinv;L 

donde **y** es el sub-string que puede ser "bombeada" (borrada o repetida un número i de veces como se indica en (3), y el substring resultante seguirá perteneciendo a L. (1) significa que el string y que se bombea debe tener como mínimo longitud uno. (2) significa que y debe estar dentro de los p primeros caracteres. No hay restricciones acerca de x ó z. 

Una forma de encontrar lenguajes no regulares es buscando que no cumplan las propiedades del teorema del bombeo, por ejemplo:
A = { 0<sup>n</sup>1<sup>n</sup> | n&geq;0}

---
## 2. Lenguajes de contexto libre

### 2.1 Gramática de contexto libre

Una gramática consiste en una colección de **reglas de sustitución** (también llamadas **producciones*). Cada regla aparece como una linea en la gramática, por ejemplo:
<p style="text-align:center">
A&rarr; 0A1<br>
A&rarr; B  <br>
B&rarr; #
</p>

Una gramática de contexto libre (CFG, **context-free grammar**) es una 4-tupla( V, &Sigma;, R, S):
   1. V es un conjunto finito de *variables*.
   2. &Sigma; es un conjunto finito disjunto de V, llamados *terminales*
   3. R es un conjunto de reglas las cuales contienen Variables y Terminales.
   4. S&isinv;V es una variable de inicio.



##### Ambiguedad
Aveces una gramática puede generar el mismo string de formas distintas, cuando esto pasa decimos que la gramática es **ambigua**.


#### Forma normal de Chomsky:
Un CFG está en la **forma normal de Chmosky** si cada regla tiene la forma:
A &rarr;BC
A &rarr;a

donde a es un terminal, y A, B y C son variables.

### 2.2. Push-Down Automata (PDA) 

Son parecidos a automatas no deterministicos, pero agregan un componente llamado *stack*, que provee memoria adicional. Esto hace posible que reconozca algunos lenguajes que no son regulares.

Definición: Un PDA es una 6-tupla (Q, &Sigma;, &Gamma;, &delta;, q<sub>0</sub>,F) donde:
   1. Q es el conjunto finito de estados.
   2. &Sigma; es un conjunto finito de inputs (alfabeto).
   3. &Gamma; es un conjunto finito de alphabetos, llamado *stack*.
   4. &delta;: Q x &Sigma;<sub>&epsilon;</sub> x &Gamma;<sub>&epsilon;</sub> &rarr; P(Q x &Gamma;<sub>&epsilon;</sub>) es la función de transición.
   5. q<sub>0</sub> &isinv; Q es el estado inicial.
   6. F &sube; Q es el conjunto de estados de aceptación.


<p align="center"><img src="img/PDA_diagram.png" height="200px"/></p>


Teorema de equivalencia: Un lenguaje es libre de contexto si y solo si existe un PDA que lo reconozca.


### 2.3 Lenguajes no-libres de contexto






### 2.4 Lenguajes libres de contexto deterministicos









--- 
# Parte II: COMPUTABILIDAD


---
## 3. La tesis de Church-Turing



### 3.1 Máquinas de Turnig (MT)

Son modelos de computo similares a los automatas, pero de capacidad ilimitada de memoria. Una máquina de Turing hace todo lo que una computadora puede.

Una MT usa una cinta infinita como memoria, y constiene un "cabezal" sobre la cinta que es capaz de leer, moverese y escribir sobre ella.

La cinta tiene el string de entrada escrita y luego todos espacios vaciós (&blank;) alrededor. El cabezal comienza leyendo el primer elemento del string, y siguiendo las reglas definidas de transición puede: no modificar nada/borrar/escribir otro caractér en su lugar y luego moverse al siguiente caracter de la derecha (R) ó izquierda (L). Luego continúa leyendo el proximo caractér y así sucesivamente. 


Definición formal: Una Máquina de Turing es una 7-tupla (Q,&Sigma;,&Gamma;, &delta;,q<sub>0</sub>, q<sub>acept</sub>,q<sub>reject</sub>) donde:
   1. Q es un conjunto de estados. 
   2. &Sigma; es el alfabeto de entradas (no incluye el simbolo &blank; blanco/vacío).
   3. &Gamma; es el alfabeto de la cinta donde &blank; &isinv;&Gamma; y &Sigma; &sube; &Gamma;
   4. &delta;: Q x &Sigma; &rarr; Q x &Sigma; x {L,R} es la función de transición.
   5. q<sub>0</sub>&isinv;Q es el estado inicial.
   6. q<sub>acept</sub>&isinv;Q es el estado de aceptación.
   7. q<sub>reject</sub>&isinv;Q es el estado de rechazo (no puede ser igual a q<sub>acept</sub>).


Decimos que un lenguaje es **Turnig-reconocible** si alguna MT puede reconocerlo.

Cuando una maquina de turing se ejecuta un string de entrada, los resultados posibles pueden ser: **aceptarlo** (si entra al estado q<sub>acept</sub>), **rechazarlo** (si entra al estado q<sub>reject</sub>), **loppear infinitamente** nunca llega a un estado final. 

Llamamos **decididores** a las MT que siempre llegan a un estado final (*halt*), es decir que no loopean infinitamente para ningún input. Cuando una MT decididora reconoce un lenguaje decimos que **decide sobre el lenguaje**.

Definicion: un lenguaje es **Turing-decidible** si existe una MT que lo decide.


### 3.2. Variantes de Máquinas de Turing
Se han propuesto MT con distintas características tales como *MT multi-cinta* ó *MT no deterministas* y todas estas resultaron tener la misma capacidad de computo que la MT simple. 

Teorema de equivalencia: Para toda MT multi-cinta existe una MT equivalente.

Teorema de equivalencia: Para toda MT no determinista existe una MT equivalente.


Llamamos *enumeradores* a MT que además incorporan un "dispositivo de salida". Si el enumerador decide, entonces el string de salida decimos que es enumerado por el enumerador.

Teorema: Un lenguaje es Turin-reconocible si y solo si algún enumerador lo enumera.


### 3.3. Definición de algorítmo

Informalmente hablando, un **algoritmo** (también llamados **procedimientos** ó **recetas**) es una colección de instrucciones que llevan a cabo una tarea. 

La *tesis de Church-Turing* da una definición formal a la idea de algorítmo basada en el sistema de notación **&lambda;-calculus** que resultó equivalente a la definición de Máquina de Turing. Por lo tanto, un algortímo es lo mismo que un algorítmo en el contexto de las máquinas de Turing.






---
## 4. Decidibilidad


### 4.1. Lenguajes decidibles



### 4.2. Indecidibilidad



---
## 5. Reducibilidad

### 5.1. Problemas indecidibles de teoría del lenguaje



### 5.2. Un problema indecidible simple


### 5.3. Mapeando reducidibilidad





---
## 6. Temas avanzados en computabilidad


### 6.1. Teorema de recursión



### 6.2. Decidibilidad de teorías logicas



### 6.3. Definición de información





---
# Parte III: COMPLEJIDAD

---
## 7. Complejidad temporal







---
## 8. Complejidad espacial






---
## 9. Intratabilidad










