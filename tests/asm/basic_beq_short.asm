.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

; Exercise one positive BEQ.S displacement in both condition states.
; The skipped region is exactly DISP bytes: one ADD plus DISP-1 one-byte MOVs.
.macro test_forward_beq disp, flag_value
    ldi8 c0, \flag_value
    tst16 c0
    ldi8 c2, 0
    ldi8 c3, 1
    beq.s \disp
    add c2, c3
    .rept \disp - 1
        mov c1, c0
    .endr
    print_reg16 c2
.endm

; Exercise one negative displacement. The backward target is exactly
; -DISP bytes before nextPC:
;
;   ADD (1 byte) + FILL one-byte MOVs + BEQ.S (1 byte)
;
; The first branch is taken with Z=1. ADD changes c2 from zero to one and
; clears Z, so the second encounter falls through rather than looping.
.macro test_backward_beq disp, fill
    ldi8 c0, 0
    ldi8 c2, 0
    ldi8 c3, 1
    tst16 c0
    jmp 2f
1:
    add c2, c3
    .rept \fill
        mov c1, c0
    .endr
2:
    beq.s \disp
    print_reg16 c2
.endm

_start:
    ; Positive encodings +1 through +8, each taken and untaken.
    test_forward_beq 1, 0
    test_forward_beq 1, 1
    test_forward_beq 2, 0
    test_forward_beq 2, 1
    test_forward_beq 3, 0
    test_forward_beq 3, 1
    test_forward_beq 4, 0
    test_forward_beq 4, 1
    test_forward_beq 5, 0
    test_forward_beq 5, 1
    test_forward_beq 6, 0
    test_forward_beq 6, 1
    test_forward_beq 7, 0
    test_forward_beq 7, 1
    test_forward_beq 8, 0
    test_forward_beq 8, 1

    ; Negative encodings -2 through -9, each taken exactly once.
    test_backward_beq -2, 0
    test_backward_beq -3, 1
    test_backward_beq -4, 2
    test_backward_beq -5, 3
    test_backward_beq -6, 4
    test_backward_beq -7, 5
    test_backward_beq -8, 6
    test_backward_beq -9, 7

    sys 1

.size _start, .-_start
