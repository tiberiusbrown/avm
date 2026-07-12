.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

_start:
    ldi8 c0, 0x11
    ldi8 c1, 0x22
    ldi8 c2, 0x33
    ldi8 c3, 0x44
    mov c0, c1
    mov c0, c2
    mov c0, c3
    mov c1, c0
    mov c1, c2
    mov c1, c3
    mov c2, c0
    mov c2, c1
    mov c2, c3
    mov c3, c0
    mov c3, c1
    mov c3, c2
    clr c0
    clr c1
    clr c2
    clr c3
    ldi8 c3, 'M'
    mov c0, c3
    sys 0
    sys 1

.size _start, .-_start
