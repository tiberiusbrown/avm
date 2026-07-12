.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

_start:
    ; Generic ALU RRSPEC was removed. Exercise every implemented compact
    ; source of the revised one-byte AND A,rS family, including A aliasing
    ; itself. Spell the opcode directly until MC accepts accumulator syntax.
    test_and_a c0, 0x54, 0xf0, 0x0f
    test_and_a c0, 0x54, 0xcc, 0x33
    test_and_a c0, 0x54, 0xaa, 0x55
    test_and_a c0, 0x54, 0x5a, 0xa5
    test_and_a c1, 0x55, 0xf0, 0x33
    test_and_a c1, 0x55, 0xcc, 0x33
    test_and_a c1, 0x55, 0xaa, 0x33
    test_and_a c1, 0x55, 0x5a, 0x33
    test_and_a c2, 0x56, 0xf0, 0x55
    test_and_a c2, 0x56, 0xcc, 0x55
    test_and_a c2, 0x56, 0xaa, 0x55
    test_and_a c2, 0x56, 0x5a, 0x55
    test_and_a c3, 0x57, 0xf0, 0xa5
    test_and_a c3, 0x57, 0xcc, 0xa5
    test_and_a c3, 0x57, 0xaa, 0xa5
    test_and_a c3, 0x57, 0x5a, 0xa5
    test_swap c0, 0x12
    test_swap c1, 0xab
    test_swap c2, 0xf0
    test_swap c3, 0x05
    sys 1

.size _start, .-_start
