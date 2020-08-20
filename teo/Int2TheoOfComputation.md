# Introducción a Teoría de la Computación.

> Apuntes del libro de *Michael Sipser*.

Secciones:
   1. AUTOMATA
   2. COMPUTABILIDAD
   3. COMPLEJIDAD

---

## 1. AUTOMATA

###a. Automata Finito (FA)
Un *Automata finito* es una 5-tupla (Q, &Sigma;, &delta;, q<sub>0</sub>, F), donde:
   1. Q conjunto de posibles estados.
   2. &Sigma; conjunto finito de acciones *alfabeto*.
   3. &delta;: Q x &Sigma; &rarr; Q 
   4. q<sub>0</sub> &isinv; Q: estado inicial.
   5. F &sube; Q: el conjunto de estados de aceptación.

<p align="center"><img src="img/FA_diagram.png" height="100px"/></p>

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
3. *star* A&star;={x1,x2,...,xk|k>0 y cada xi&isinv;A}

Teorema: La clase de lenguajes regulares es cerrado en la unión y la conecatenación.


### b.Automata Finito No-determinístico (NFA)
Un *Automata finito no determinístico (NFA)* es una 5-tupla (Q, &Sigma;, &delta;, q<sub>0</sub>, F), donde:
   1. Q conjunto de posibles estados.
   2. &Sigma; conjunto finito de acciones *alfabeto*.
   3. &delta;: Q x &Sigma; &rarr; P(Q) 
   4. q<sub>0</sub> &isinv; Q: estado inicial.
   5. F &sube; Q: el conjunto de estados de aceptación.

<p align="center"><img src="img/NFA_diagram.png" height="100px"/></p>


Teorema: Equivalencia entre NFA y Automata finito (DFA), todo NFA tiene un equivalente DFA.




### c.Expresiones Regulares:

Definición: Decimos que R es una **expresión regular** si:
   1. R es a &isinv; &Sigma;
   2. R es &epsilon; 
   3. R es &void;
   4. R = (R_1 &xcup; R_2), donde R_1 y R_2 son regex
   5. R = (R_1 &cir; R_2),  donde R_1 y R_2 son regex
   6. R = R_1&star;, donde R_1 es regex.



Teorema: Equivalencia con automata finito, un lenguaje es regular si solo si es descrito por una expresión regular.



##### Automata Finito No-determinístico generalizado (GNFA)
Un *Automata finito no determinístico generalizado (GNFA)* es una 5-tupla (Q, &Sigma;, &delta;, q<sub>0</sub>, F), donde:
   1. Q conjunto de posibles estados.
   2. &Sigma; conjunto finito de acciones *alfabeto*.
   3. &delta;: (Q-q<sub>acept</sub>) x (Q - q<sub>0</sub>) &rarr; R 
   4. q<sub>0</sub> &isinv; Q: estado inicial.
   5. F &sube; Q: el conjunto de estados de aceptación.

<p align="center"><img src="img/GNFA_diagram.png" height="100px"/></p>




### d.Lenguajes no-regulares
Todos los lenguajes regulares tienen la siguiente propiedad:

**Teorema del bombeo**: Sea L un lenguaje regular. Entonces existe un entero p&geq;1 ("longitud de bombeo") tal que cualquier cadena w&isinv;L, de longitud &geq;p, puede ser escrita como w = xyz (p. ej. dividiendo w en tres sub-strings), de forma que se satisfacen las siguientes condiciones:
1. |y| &geq; 1 
2. |xy| &leq; p 
3. &forall; i&geq;0: xy^iz&isinv;L 

donde **y** es el sub-string que puede ser "bombeada" (borrada o repetida un número i de veces como se indica en (3), y el substring resultante seguirá perteneciendo a L. (1) significa que el string y que se bombea debe tener como mínimo longitud uno. (2) significa que y debe estar dentro de los p primeros caracteres. No hay restricciones acerca de x ó z. 

Una forma de encontrar lenguajes no regulares es buscando que no cumplan las propiedades del teorema del bombeo, por ejemplo:

A={0^n1^n| n&geq;0}

<!--
\in &isinv;

-->
