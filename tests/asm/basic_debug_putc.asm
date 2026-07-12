.section .text,"ax",@progbits

.globl _start
.type _start, @function
.p2align 1

_start:
    ldi8 c0, 'P'
    sys  0          ; debug_putc
    sys  1          ; debug_break

.size _start, .-_start