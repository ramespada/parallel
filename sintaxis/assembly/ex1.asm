global _start
start:
	mov eax, 1
	mov ebx, 42
	int 0x80

	mov ebx, 132	; ebx=132
	mov eax, ebx	; eax=ebx
	add ebx, ecx	;ebx+=ecx
	sub ebx, edx	;ebx-=edx
	mul ebx		;eax*=ebx
	div edx		;eax/=edx
