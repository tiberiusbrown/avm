.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

_start:
    clr c0
    clr c1
    clr c2
    clr c3
    add c0, c0
    add c0, c1
    add c0, c2
    add c0, c3
    add c1, c0
    add c1, c1
    add c1, c2
    add c1, c3
    add c2, c0
    add c2, c1
    add c2, c2
    add c2, c3
    add c3, c0
    add c3, c1
    add c3, c2
    add c3, c3
    sub c0, c0
    sub c0, c1
    sub c0, c2
    sub c0, c3
    sub c1, c0
    sub c1, c1
    sub c1, c2
    sub c1, c3
    sub c2, c0
    sub c2, c1
    sub c2, c2
    sub c2, c3
    sub c3, c0
    sub c3, c1
    sub c3, c2
    sub c3, c3
    ldi8 c0, 'A'
    ldi8 c1, 1
    add c0, c1
    sys 0
    ldi8 c1, 1
    sub c0, c1
    sys 0
    sys 1

.size _start, .-_start
