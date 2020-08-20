# Intro. a teoría de la computación

> Apuntes basados principalmente en el libro de *Michael Sipser*.


Secciones:
   1. AUTOMATA
   2. COMPUTABILIDAD
   3. COMPLEJIDAD
---

## 1. AUTOMATA


Un *Automata finito* es una 5-tupla (Q, &Sigma;, &delta;, q<sub>0</sub>, F), donde:
   1. Q conjunto de posibles estados.
   2. &Sigma; conjunto finito de acciones *alfabeto*.
   3. &delta;: Q x &Sigma; &rarr; Q$ 
   4. q<sub>0</sub> &isinv; Q: estado inicial.
   5. F &isinv; Q: estado final.

<p align="center"><img src="img/FA_diagram.png" height="100px"/></p>


Definicion *lenguaje de maquina*: Sea A el conjunto de todos los strings que la máquina *M* reconoce/acepta, entonces decimos que ** A es el lenguaje de M** y lo notamos: A= L(*M*)


<!--
\in &isinv;

-->


<style>
	p{color:red;}


</style>
