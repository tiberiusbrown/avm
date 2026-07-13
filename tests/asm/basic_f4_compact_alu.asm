.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

; Initialize and execute one compact binary operation, then print the result.
; For dst == src, the source value is loaded once and the aliasing behavior is
; tested directly.
.macro test_binary op, dst, src, dv, sv
    .ifc \dst,\src
        ldi16 \dst, \sv
    .else
        ldi16 \dst, \dv
        ldi16 \src, \sv
    .endif
    \op \dst, \src
    print_reg16 \dst
.endm

; Copy a noncompact result through A before using the common print helper.
.macro print_any16 reg
    mov16 c0, \reg
    print_reg16 c0
.endm

; Establish C=1, Z=0, S=0, execute one flag-preserving F4 operation, then
; materialize ULT, NE, and SGE before the print helper can disturb native SREG.
.macro test_cc_preservation op
    ldi16 c1, 0x1234
    ldi16 c2, 0x00ff

    ldi16 c0, 0x0001
    ldi16 c3, 0xffff
    cmp16 c0, c3

    \op c1, c2

    cset r0, ult
    cset r1, ne
    cset r2, sge
    print_any16 r0
    print_any16 r1
    print_any16 r2
.endm

_start:
    ; F4 1ddss: ADD.NF. Cover all compact destination/source selectors,
    ; including an aliasing operation.
    test_binary add.nf, c0, c1, 0x1234, 0x0102
    test_binary add.nf, c1, c2, 0x00ff, 0x0001
    test_binary add.nf, c2, c3, 0xffff, 0x0001
    test_binary add.nf, c3, c3, 0x0000, 0x4001

    ; F4 2ddss: SUB.NF.
    test_binary sub.nf, c0, c3, 0x1234, 0x0102
    test_binary sub.nf, c1, c0, 0x0000, 0x0001
    test_binary sub.nf, c2, c1, 0x8000, 0x0001
    test_binary sub.nf, c3, c3, 0x0000, 0x4001

    ; F4 3ddss: AND. c0 destinations are intentionally absent because those
    ; encodings are reserved; A/c0 uses the one-byte accumulator instruction.
    ; The cases below cover destinations c1-c3, all four source selectors, and
    ; one destination/source alias.
    test_binary and, c1, c0, 0xa55a, 0x0ff0
    test_binary and, c2, c1, 0x1234, 0xf0f0
    test_binary and, c3, c2, 0xffff, 0x00ff
    test_binary and, c2, c3, 0xaaaa, 0x5555
    test_binary and, c1, c1, 0x0000, 0x1357

    ; F4 4ddss: OR.
    test_binary or, c1, c0, 0xa005, 0x0ff0
    test_binary or, c2, c1, 0x1234, 0x8001
    test_binary or, c3, c2, 0x0000, 0xabcd
    test_binary or, c2, c3, 0x4004, 0x0ff0
    test_binary or, c1, c1, 0x0000, 0x1357

    ; F4 5ddss: XOR.
    test_binary xor, c1, c0, 0x55aa, 0x0ff0
    test_binary xor, c2, c1, 0x1234, 0x8001
    test_binary xor, c3, c2, 0xffff, 0xabcd
    test_binary xor, c2, c3, 0x8000, 0x8001
    test_binary xor, c1, c1, 0x0000, 0x1357

    ; F4 6ddss: BIC computes dst &= ~src.
    test_binary bic, c1, c0, 0xffff, 0x00ff
    test_binary bic, c2, c1, 0x8001, 0x8000
    test_binary bic, c3, c2, 0xffff, 0xf0f0
    test_binary bic, c2, c3, 0xaaaa, 0x5555
    test_binary bic, c1, c1, 0x0000, 0x1357

    ; Every implemented F4 arithmetic/logical family preserves AVM C/Z/S.
    test_cc_preservation add.nf
    test_cc_preservation sub.nf
    test_cc_preservation and
    test_cc_preservation or
    test_cc_preservation xor
    test_cc_preservation bic

    sys 1

.size _start, .-_start
