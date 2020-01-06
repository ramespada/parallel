global _start

section .text
_start:
	mov eax, 4	
	mov ebx, 1
	mov ecx, 1
	mov edx, 1
contador:
	sub 10, ecx
	jz fin
	add ecx,1
	int 0x80
	jmp contador
fin:	
	mov eax,1
	int 0x80

