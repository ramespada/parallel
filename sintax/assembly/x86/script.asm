section .bss
	name: resb 2 

section .text
	global _start

_start:
	mov eax,1
	mov ebx,1
	and eax,ebx
	jz _PrintIsFalse

	call _exit

_PrintIsFalse:
	mov name, 'F'   
	mov ecx, name
	mov edx,4
	mov eax,4
	mov ebx,1
	int 0x80
	ret

_exit:
	mov eax,1
	;mov ebx,0
	int 0x80
