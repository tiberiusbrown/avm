.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

_start:
    push16 r0
    push16 r1
    push16 r2
    push16 r3
    push16 r4
    push16 r5
    push16 r6
    push16 r7
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 c0, 'S'
    push16 c0
    clr c0
    pop16 c0
    sys 0
    sys 1

.size _start, .-_start
