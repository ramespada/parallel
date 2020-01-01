;------------------------------
; Assembly (for Linux kernel)
;------------------------------

;Comandos principales:
;MOV <var>, <value>   
;JMP
;POP
;INT
;PUSH

;Subrutinas:
;CALL
;RET


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


;---------------------------------------------------------
;Estructura

;TEXT:
section .text       ;code segment
  global _start     ;must be declared for linker 
  
_start:            ;tell linker entry point


;BBS:
section .bbs:


;DATA:
section .data:


