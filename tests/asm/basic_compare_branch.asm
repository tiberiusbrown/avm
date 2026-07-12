.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

_start:
    clr c0
    clr c1
    clr c2
    clr c3
    tst16 c0
    cmp16 c0, c1
    cmp16 c0, c2
    cmp16 c0, c3
    cmp16 c1, c0
    tst16 c1
    cmp16 c1, c2
    cmp16 c1, c3
    cmp16 c2, c0
    cmp16 c2, c1
    tst16 c2
    cmp16 c2, c3
    cmp16 c3, c0
    cmp16 c3, c1
    cmp16 c3, c2
    tst16 c3
    tst8 c0
    cmp8 c0, c1
    cmp8 c0, c2
    cmp8 c0, c3
    cmp8 c1, c0
    tst8 c1
    cmp8 c1, c2
    cmp8 c1, c3
    cmp8 c2, c0
    cmp8 c2, c1
    tst8 c2
    cmp8 c2, c3
    cmp8 c3, c0
    cmp8 c3, c1
    cmp8 c3, c2
    tst8 c3
    ldi8 c0, 'C'
    sys 0

    tst16 c0
    breq equal_not_taken
    ldi8 c0, 'X'
    sys 0
equal_not_taken:
    clr c0
    tst16 c0
    brne not_equal_not_taken
    ldi8 c0, 'Y'
    sys 0
not_equal_not_taken:
    ldi8 c0, 'C'
    sys 0
    sys 1

.size _start, .-_start
