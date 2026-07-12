.section .text,"ax",@progbits

.equ SYS_DEBUG_PUTC, 0
.equ SYS_DEBUG_BREAK, 1

.globl _start
.type _start, @function
.p2align 1

_start:
    ldi8   c0, 'P'
    sys    SYS_DEBUG_PUTC
    sys    SYS_DEBUG_BREAK

.size _start, .-_start