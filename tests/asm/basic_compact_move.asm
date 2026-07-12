.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

_start:
    ; The four diagonal encodings are CLR; all other compact MOV encodings
    ; are independently initialized and recorded.
    test_clr c0, 0x11
    test_mov c0, c1, 0x10, 0x22
    test_mov c0, c2, 0x10, 0x33
    test_mov c0, c3, 0x10, 0x44
    test_mov c1, c0, 0x20, 0x11
    test_clr c1, 0x22
    test_mov c1, c2, 0x20, 0x33
    test_mov c1, c3, 0x20, 0x44
    test_mov c2, c0, 0x30, 0x11
    test_mov c2, c1, 0x30, 0x22
    test_clr c2, 0x33
    test_mov c2, c3, 0x30, 0x44
    test_mov c3, c0, 0x40, 0x11
    test_mov c3, c1, 0x40, 0x22
    test_mov c3, c2, 0x40, 0x33
    test_clr c3, 0x44
    sys 1

.size _start, .-_start
