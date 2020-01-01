;--------------------------------
; Assembly (para Linux)
;--------------------------------
section .text     ;code segment
  global _start   ;must be declared for linker 
  
_start:           ;tell linker entry point

  mov eax,4       ;(sys_write)
  mov edx,len     ;message length
  mov ecx,msg     ;message to write
  mov ebx,1       ;file descriptor (stdout)
  int 0x80        ;call kernel
 
  mov eax,3       ;(sys_read)
  mov ebx,1       ;file descriptor (stdin)
  int 0x80        ;call kernel
 
  mov eax, 4
  mov ebx, 1
  mov edx,len1     ;message length
  mov ecx,msg1     ;message to write
  int 0x80
  
  
  mov ecx, 0xa  ;vaciar

   mov eax,1      ;(sys_exit)
   mov ebx,0      ;error id
   int 0x80       ;call kernel

section .bss
  respuesta: resb 255

section .data:
  msg db 'ola ameo! decime como te llamas',0xa    ;our dear string
  len equ $ - msg               ;length of our dear string
  msg1 db 'asi que tu nombre es ',respuesta    ;our dear string
  len1 equ $ - msg               ;length of our dear string
