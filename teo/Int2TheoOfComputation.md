# Intro. a teoría de la computación

> Apuntes basados principalmente en el libro de *Michael Sipser*.


Secciones:
   1. AUTOMATA
   2. COMPUTABILIDAD
   3. COMPLEJIDAD
---

## 1. AUTOMATA


Un *Automata finito* es una 5-tupla (Q,\Sigma, \delta, q_{i},F), donde:
	1. $Q$ conjunto de posibles estados.
	2. $\Sigma$ conjunto finito de acciones *alfabeto*.
	3. $\delta: Q \times \Sigma \rightarrow Q$ 
	4. $q_{i} \in Q$: estado inicial.
	5. $F \in Q$: estado final.

[Esquema de automata finito](FA_diagram.png)
