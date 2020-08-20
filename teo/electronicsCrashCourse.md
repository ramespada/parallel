# Fundamentos eléctricos de computadoras

> Apuntes tomados de "CrashCourse on computer science (PBS studios)" y el libro "CODE" de Petzold.


## Introduccion (historia)
Tecnologías para comptar basadas en:
- *Relays*: Puentes de corriente inducidos por bobinas electromagnéticos.
- *Valvulas de vacío*: Por efecto electro-térmico (al calentarse emitian electrones que permitianel paso de corriente).
- *Transistores*: Por uso de materiales semiconducotres (aveces actuan como resistencias y otras veces como conductores).

##Sistema binario
Sistema de dos estados (e.g. {0, 1}).
¿Por que no usar sistemas de mas de un estado? Dificil de diferenciar entre estados intermedios y ademas que ya existia un cuerpo teorico basado en logica binaria (Algebra booleana)


##Booleanos
Operaciones fundamentales: NOT (!) AND (v)  OR (u)

- *NOT* (!)
Con transistores:

|INPUT  | OUTPUT
|---    |---    
|T	| F
|F	| T

- *AND* (v)

|INP1 	|INP2	|OUTPUT
|---    |---    |---
|T	|T	|T
|T	|F	|F
|F	|T	|F
|F	|F	|F

Se puede construir con dos transitores en serie.
	
- *OR* (u)

|INP1	|INP2	|OUT
|---    |---    |---
|T	|T	|T
|T	|F	|T
|F	|T	|T
|F	|F	|F

Se puede construir con dos transistores en paralelo.

#### Operaciones derivadas: XOR (w)

### XOR

|INP1	|INP2	|OUT
|---    |---    |---
|T	|T	|F
|T	|F	|T
|F	|T	|T
|F	|F	|F


##Gates/Celdas


###Datos binarios

Medidas de informacion

+ 1 bit  = T/F		
+ 8 bits = 1 byte	


Representacion de numeros:
	- Enteros: (signo, numero en binario)
	- Floating points: (signo, exponente, mantiza)

Representacion de letras:
	ASCII (codigo de 7 bit)
	UNICODE (16 bits)
	UTF

### ALU (arithmetic-logical unit) 

- Arithmetic unit: (ADD, SUB)
  + Half adder: SUM & CARRIER (echo con XOR y AND gates)
  + ADD 
  + ADD with carrier
  + SUB	
  + SUB with borrow
  + INC (increment by 1)
  + DEC (decrement by 1)
  + PASS (pass throug)

	* overflow: cuando el resultado de la operacion da un resultado mayor 

- Logic Unit:


ALUs: Toma dos inputs (8bits), 1 operation code (4bits), devuelven un output (8bits) y flags (overflow,zero, negative)


### Registros y Memoria
Latches
Multiplexers

#### RAM (random access memory)

#### Persistent Memory
### ROM



### CPU
- Control unit
- RAM/Memoria
- ALU
- Clock
- ROM



### Instrucciones elementales:
MOV (LOAD, WRITE)
ADD (add 2 numbers)
SUB (sub 2 numbers)
INC (increment by 1)
DEC (decrement by 1)
JMP
JN	(jump if negative flag is true)
JZ	(jump if zero flag is true)
JG	(jump if greater)
JL	(jump if lower)
JEQ	(jump if equal)
HALT


