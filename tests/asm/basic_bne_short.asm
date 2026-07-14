.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

; Exercise one positive BNE.S displacement in both condition states.
; The skipped region is exactly DISP bytes: one ADD plus DISP-1 one-byte MOVs.
.macro test_forward_bne disp, flag_value
    ldi8 c0, \flag_value
    tst16 c0
    ldi8 c2, 0
    ldi8 c3, 1
    bne.s \disp
    add c2, c3
    .rept \disp - 1
        mov c1, c0
    .endr
    print_reg16 c2
.endm

; Exercise one negative displacement. The first branch is taken with Z=0.
; SUB c2,c2 is the one-byte backward target; it clears c2 and sets Z, so the
; second encounter falls through rather than looping.
.macro test_backward_bne disp, fill
    ldi8 c0, 1
    ldi8 c2, 1
    tst16 c0
    jmp 2f
1:
    sub c2, c2
    .rept \fill
        mov c1, c0
    .endr
2:
    bne.s \disp
    print_reg16 c2
.endm

_start:
    ; Positive encodings +1 through +8, each taken and untaken.
    test_forward_bne 1, 1
    test_forward_bne 1, 0
    test_forward_bne 2, 1
    test_forward_bne 2, 0
    test_forward_bne 3, 1
    test_forward_bne 3, 0
    test_forward_bne 4, 1
    test_forward_bne 4, 0
    test_forward_bne 5, 1
    test_forward_bne 5, 0
    test_forward_bne 6, 1
    test_forward_bne 6, 0
    test_forward_bne 7, 1
    test_forward_bne 7, 0
    test_forward_bne 8, 1
    test_forward_bne 8, 0

    ; Negative encodings -2 through -9, each taken exactly once.
    test_backward_bne -2, 0
    test_backward_bne -3, 1
    test_backward_bne -4, 2
    test_backward_bne -5, 3
    test_backward_bne -6, 4
    test_backward_bne -7, 5
    test_backward_bne -8, 6
    test_backward_bne -9, 7

    sys 1

.size _start, .-_start
