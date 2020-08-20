# Intro. a teoría de la computación

> Apuntes basados principalmente en el libro de *Michael Sipser*.


Secciones:
   1. AUTOMATA
   2. COMPUTABILIDAD
   3. COMPLEJIDAD
---

## 1. AUTOMATA


Un *Automata finito* es una 5-tupla (Q, &Sigma;, &delta;, q<sub>0</sub>, q<sub>f</sub>), donde:
   1. Q conjunto de posibles estados.
   2. &Sigma; conjunto finito de acciones *alfabeto*.
   3. &delta;: Q x &Sigma; &rarr; Q$ 
   4. q<sub>0</sub> &isinv; Q: estado inicial.
   5. q<sub>f</sub> &isinv; Q: estado final.

<p align="center"><img src="img/FA_diagram.png" height="100px"/></p>

una maquina *M* lee un conjunto de elementos del alfabeto *&omega;* &isinv; &Sigma;, los procesa siguiendo las reglas definidas por &delta; y retorna un estado final.

Decimios que *M* acepta &omega; si existe una secuencia de estados r<sub>1<sub>,..., r<sub>n</sub> en Q tal que:
   1. r0=q0
   2. &delta;(ri,&omega;<sub>i+1</sub>)=r<sub>i+1</sub>
   3. r<sub>n</sub> &isinv; q<sub>f</sub>



Definicion *lenguaje de maquina*: Sea A el conjunto de todos los strings que la máquina *M* reconoce/acepta, entonces decimos que **A es el lenguaje de M** y lo notamos: A = L(*M*)


Definición de *lenguaje regular*: Un lenguaje es **regular** si existe un automata finito que lo reconoce.


#### Operaciones regulares:
	Sean A y B lenguajes, definimos las siguientes opraciones:
	1. *union* A &xcup; B={x | x &isinv; A ó x &isinv; B}
	2. *concatenacion* A &xcap; B={x| x &isinv; A y también x &isinv; B}
	3. *star* A&star;={x1,x2,...,xk|k>0 y cada xi&isinv;A}



Teorema: La clase de lenguajes regulares es cerrado en la unión y la conecatenación.



<!--
\in &isinv;

-->
