#Assembly 

> Sintaxis para núcleo Linux en procesadores intel x86 (32-bits).

*Caracteristicas de assembly:*
	- Bajo nivel de abstraccion.
	- Mayor control 
	- Mas codigo
	- Poco portable (depende de la arquitectura de la cpu)
## Estructura

```assembly
section .text	;seccion de instrucciones
global _start 	;
_start:       	;funcion principal


section .bss	;seccion para reservar espacio para variables.


section .data	;seccion para definir static-data.

```

*Comandos:*
La sintaxis general es:
```assembly
[label]   COM   [operandos]   ;comentario
```
donde `COM` es el comando a ser ejecutado.

*Compilacion:*
```
sudo apt install nasm
nasm -f elf test.asm
ld test.o -o test
```


## Registros: 
Son pequeños fragmentos de memoria en la cpu.

### Registros de Proposito General 
 - De datos: (32/16-bits):
	En estos se puede almacenar valores de variables.
  + `EAX`/`AX`	(acumulador) 
  + `EBX`/`BX`	(base)	      	
  + `ECX`/`CX`	(contador)
  + `EDX`/`DX`	(data)
 A su vez los registros de 16-bits se dividen en dos registros de 8-bits *xL* y *XH*.
 Los nombres son historicos, cualquiera de ellos puede utilizarse para cualquier función.

 - De punteros:
  + `ESP`/`SP`:	(Stack pointer)
  + `EBP`/`BP`:	(Base pointer)
  + `EIP`:	(Instruction pointer)

 - De indices
  + `ESI`/`SI`	(Source Index)
  + `EDI`/`DI`	(Destination Index)

### Registros de Control
Luego de cada operación estos registros son actualizados y brindan información util para el flujo del programa.
  `**OF**` (*overflow*). 
  `**DF**` (*direction*).
  `**IF**` (*interrupt*).
  `**TF**` (*trap*).
  `**SG**` (*sign*).
  `**ZF**` (*zero*).
  `**PF**` (*parity*).
  `**CF**` (*carry*).

### Registros de Segmentos:
  **`.text`** (`CS`, code segment)	
  **`.data`** (`DS`, data segment)
  **`.bss `**  (`SS`, stack segment)


## STACK
Es un array en memoria de acceso random, tiene estructura de datos tipo "LIFO".



### Comandos principales:
**``MOV``** <var>, <value>   

**``JMP``**


**``PUSH``**

**``POP*``**

;Subrutinas:
;CALL
;RET



### SYSTEM CALLs:
 Operaciones de sistema:

Algunas operaciones en linux son:

|id|operacion  	 |eax |ebx                   |ecx            |edx        |esi|edi|def			         |
|--|------------ |----|--------------------- |-------------- |---------- |---|---|------------------------------ |
|0 |`sys_restart`|0x00|                      |-              |           |   |   |`kernel/signal.c:2058		`|		
|1 |`sys_exit   `|0x01|int error_code        |-              |           |   |   |`kernel/exit.c:1046		`|
|2 |`sys_fork   `|0x02|struct pt_regs *      |-              |           |   |   |`arch/alpha/kernel/entry.S:716`|
|3 |`sys_read   `|0x03|unsigned int fd       |char           |size_t     |   |   |`fs/read_write.c:391   	`|
|4 |`sys_write  `|0x04|unsigned int fd       |const char     |size_t     |   |   |`fs/read_write.c:408		`|
|5 |`sys_open   `|0x05|const char <filename> |int flags      |int mode   |   |   |`fs/open.c:900		`|
|6 |`sys_close  `|0x06|unsigned int fd       |-              |           |   |   |`fs/open.c:969		`|
|7 |`sys_waitpid`|0x07|pid_t pid             |int <stat_addr>|int options|   |   |`kernel/exit.c:1771     	`|	
|8 |`sys_creat  `|0x08|const char <pathname> |int mode       |           |   |   |`fs/open.c:933   		`|	
|9 |`sys_link   `|0x09|const char <oldname>  |const <newname>|           |   |   |`fs/namei.c:2520		`|	

;La llamada se ejecuta con: 
**``INT 0x80``**



















###Adressing modes


- Register addressing

- Immediate addressing

- Memory addressing

