section .data
	text1 db "Introduzca su nombre:"
	text2 db "Hola, !"

section .bss 
	name resb 16

section .text
	global _start
_start:
	call _printText1
	call _getName
	call _printText2
	call _printName

	mov rax, 60
	mov rdi, 0
	syscall

_printText1:
	mov rax,1
	mov rdi,1
	mov rsi,text1
	mov rdx,19
	syscall
	ret
_getName:

_printText2:
	mov rax,1
	mov rdi,1
	mov rsi,name
	mov rdx,16
	syscall
	ret

