.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

_start:
    ; Exhaust the RRSPEC destination/source matrix, including aliasing.
    test_and c0, c0, 0xf0, 0x0f
    test_and c0, c1, 0xf0, 0x33
    test_and c0, c2, 0xf0, 0x55
    test_and c0, c3, 0xf0, 0xa5
    test_and c1, c0, 0xcc, 0x0f
    test_and c1, c1, 0xcc, 0x33
    test_and c1, c2, 0xcc, 0x55
    test_and c1, c3, 0xcc, 0xa5
    test_and c2, c0, 0xaa, 0x0f
    test_and c2, c1, 0xaa, 0x33
    test_and c2, c2, 0xaa, 0x55
    test_and c2, c3, 0xaa, 0xa5
    test_and c3, c0, 0x5a, 0x0f
    test_and c3, c1, 0x5a, 0x33
    test_and c3, c2, 0x5a, 0x55
    test_and c3, c3, 0x5a, 0xa5
    test_swap c0, 0x12
    test_swap c1, 0xab
    test_swap c2, 0xf0
    test_swap c3, 0x05
    sys 1

.size _start, .-_start
