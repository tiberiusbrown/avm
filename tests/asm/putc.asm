.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi8 c0, 'P'
    sys debug_putc
    sys debug_break
