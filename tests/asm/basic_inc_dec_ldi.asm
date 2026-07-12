.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

_start:
    inc16 r0
    inc16 r1
    inc16 r2
    inc16 r3
    inc16 r4
    inc16 r5
    inc16 r6
    inc16 r7
    dec16 r0
    dec16 r1
    dec16 r2
    dec16 r3
    dec16 r4
    dec16 r5
    dec16 r6
    dec16 r7
    ldi8 c0, '0'
    ldi8 c1, '1'
    ldi8 c2, '2'
    ldi8 c3, '3'
    ldi8 c0, 'A'
    inc16 c0
    sys 0
    dec16 c0
    sys 0
    ldi8 c0, 'L'
    ldi8 c1, 1
    add c0, c1
    sys 0
    sys 1

.size _start, .-_start
