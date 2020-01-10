;------------------------------
; Assembly (for Linux kernel en procesadores intel x86)
;------------------------------

###Caracteristicas:
	- Bajo nivel de abstraccion.
	- Mayor control 
	- Mas codigo
	- Poco portable (depende de la arquitectura de la cpu)
### Compilacion:

```
sudo apt install nasm
nasm -f elf test.asm
ld test.o -o test
```

## Registros: 
Son pequeñós fragmentos de memoria en la cpu.

### Registros Generales 
 	- De datos: (32-bits)
 		+ EAX/AX	(acumulator) Se divide en AL(0-7), AH(8-15)
 		+ EBX/BX	(base)	      	
 		+ ECX/CX	(counter)
 		+ EDX/DX	(data)
 	- De punteros
        	+ EIP	(Instruction pointer)
        	+ ESP	(Stack pointer)
        	+ EBP	(Base pointer)
  	- De indices
 		+ ESI	(Source Index)
 		+ EDI	(Destination Index)

### Registros de Control
	OF: overflow
	DF: direction
	IF: interrupt
	TF: trap
	SG: sign
	ZF: zero
	PF: parity
	CF: carry

### Registros de Segmentos:
	.text
	.data
	.bss


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
;eax (OPCODE, operation code)
;             |eax |ebx                   |ecx            |edx         esi edi|def
;0:sys_restart|0x00|                      |-              |                   |kernel/signal.c:2058
;1:sys_exit   |0x01|int error_code        |-              |                   |kernel/exit.c:1046
;2:sys_fork   |0x02|struct pt_regs *      |-              |                   |arch/alpha/kernel/entry.S:716
;3:sys_read   |0x03|unsigned int fd       |char           |size_t             |fs/read_write.c:391   
;4:sys_write  |0x04|unsigned int fd       |const char     |size_t             |fs/read_write.c:408
;5:sys_open   |0x05|const char <filename> |int flags      |int mode           |fs/open.c:900
;6:sys_close  |0x06|unsigned int fd       |-              |                   |fs/open.c:969
;7:sys_waitpid|0x07|pid_t pid             |int <stat_addr>|int options        |kernel/exit.c:1771     
;8:sys_creat  |0x08|const char <pathname> |int mode       |                   |fs/open.c:933   
;9:sys_link   |0x09|const char <oldname>  |const <newname>|                   |fs/namei.c:2520

;La llamada se ejecuta con: 
**``INT 0x80``**

## Estructura

### **``section .text``**
```assembly
 global _start     ;must be declared for linker 
_start:            ;tell linker entry point
```

### **`section .bss`**:


### **`.section .data`**:


;Instruction pointer


