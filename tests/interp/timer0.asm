.section .text,"ax",@progbits
.globl _start
_start:
    ; Never calls SYS_IDLE, SYS_BUTTONS, or any other foreground service.
    jmp8 _start
