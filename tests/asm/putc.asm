.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi8 r4, 'P'
    sys debug_putc
    sys debug_break
