.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

; Test a non-aliasing accumulator operation and print the resulting A value.
.macro test_logic op, src, av, sv
    ldi16 c0, \av
    ldi16 \src, \sv
    \op a, \src
    print_reg16 c0
.endm

; r4 is A itself, so source and destination cannot be initialized separately.
.macro test_logic_alias op, value
    ldi16 c0, \value
    \op a, r4
    print_reg16 c0
.endm

; Copy an arbitrary architectural register through A before printing it.
.macro print_any16 reg
    mov16 r4, \reg
    print_reg16 c0
.endm

; Establish C=1, Z=0, S=0, execute an accumulator operation, then verify
; ULT=1, NE=1, and SGE=1. The operation must preserve architectural AVM CC.
.macro test_cc_preservation op
    ldi16 c0, 0x1234
    ldi16 r0, 0x00ff

    ldi8 c1, 1
    ldi8 c2, 0xff
    sext8 c2
    cmp16 c1, c2

    \op a, r0

    cset r1, ult
    cset r2, ne
    cset r3, sge
    print_any16 r1
    print_any16 r2
    print_any16 r3
.endm

_start:
    ; 58-5F: OR A,rS. Exercise every source-register selector.
    test_logic       or, r0, 0x1234, 0x00ff
    test_logic       or, r1, 0x8000, 0x0001
    test_logic       or, r2, 0x0f0f, 0xf0f0
    test_logic       or, r3, 0xaaaa, 0x5555
    test_logic_alias or,     0x1357
    test_logic       or, r5, 0x4004, 0x0ff0
    test_logic       or, r6, 0x1234, 0x8001
    test_logic       or, r7, 0x0000, 0xabcd

    ; 60-67: XOR A,rS. The r4 case must clear A.
    test_logic       xor, r0, 0x1234, 0x00ff
    test_logic       xor, r1, 0xffff, 0x0f0f
    test_logic       xor, r2, 0xaaaa, 0x5555
    test_logic       xor, r3, 0x8000, 0x8001
    test_logic_alias xor,     0x1357
    test_logic       xor, r5, 0x4004, 0x0ff0
    test_logic       xor, r6, 0x1234, 0x8001
    test_logic       xor, r7, 0xffff, 0xabcd

    ; 68-6F: BIC A,rS computes A &= ~rS. The r4 case must clear A.
    test_logic       bic, r0, 0xffff, 0x00ff
    test_logic       bic, r1, 0x8001, 0x8000
    test_logic       bic, r2, 0xffff, 0xf0f0
    test_logic       bic, r3, 0xaaaa, 0x5555
    test_logic_alias bic,     0x1357
    test_logic       bic, r5, 0x4ff4, 0x0ff0
    test_logic       bic, r6, 0x9235, 0x8001
    test_logic       bic, r7, 0xffff, 0xabcd

    ; All three instruction families preserve AVM C/Z/S.
    test_cc_preservation or
    test_cc_preservation xor
    test_cc_preservation bic

    sys 1

.size _start, .-_start
