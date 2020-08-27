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
```assembly
MOV (LOAD, WRITE)
ADD  (add 2 numbers)
SUB  (sub 2 numbers)
INC  (increment by 1)
DEC  (decrement by 1)
JMP
JN   (jump if negative flag is true)
JZ   (jump if zero flag is true)
JG   (jump if greater)
JL   (jump if lower)
JEQ  (jump if equal)
HALT
```





<!-- 
# CODE (Petzold)

## 1. Código

Definiciones:
- Sistema de señales usado para representar letras ó numeros en transmisión de mensajes.
- Sistema de simbolos, letras, palabras con cierto significado arbitrario, usado para tranmitir mensajes que requieren confidencialidad ó brevedad.
- Sistema de simbolos y reglas usado para representar instrucciones a una computadora.

### Código Morse
Conjunto de *puntos* y *guiones* que mapeaen el alfabeto.

## 2. Códigos y combinatoria

numero de codigos  =  2<sup>numero de simbolos</sup>

## 3. Braile y Binario

## 4. Anatomía de un flash

## 5. Mirando alrededor de las esquinas

## 6. Telegrafos y Relays

## 7. Nuestros 10 dígitos

## 8. Alternativas a 10

## 9. Bit por bit por bit

## 10. Logica y switches 
## 11. Compuertas (Gates)
## 12. Una maquina de adición binaria
## 13. Substracción
## 14. Feedback y Flip-flops
## 15. Bites y Hex
## 16. Ensabmblaje de memoria 
## 17. Automata
## 18. Del Abaco a Chips
## 19. Dos microprocesadores clásicos

### Intel 8080
### MC6800

## 20. ASCII
## 21. RAM y otros componentes
## 22. Sistema Operativo
## 23. Punto flotante y fijo
## 24. Lenguajes
## 25. Revolución Gráfica

-->
