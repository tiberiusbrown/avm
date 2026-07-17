.include "include/stack_test_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; PUSH16 r0: value 0x1234.
    ldi16 r7, 0x0980
    setsp r7
    ldi16 r4, 0x1234
    mov r0, r4
    push16 r0

    ; Capture the post-push SP and both bytes before printing.
    getsp r1
    mov r7, r1
    ld8u r2, [r7]
    addi.s8 r7, 1
    ld8u r3, [r7]

    mov r0, r2
    debug_print_r0_line_inline
    mov r0, r3
    debug_print_r0_line_inline
    mov r0, r1
    debug_print_r0_line_inline

    adjsp 2
    getsp r0
    debug_print_r0_line_inline

    ; PUSH16 r1: value 0x2567.
    ldi16 r7, 0x0980
    setsp r7
    ldi16 r4, 0x2567
    mov r1, r4
    push16 r1

    ; Capture the post-push SP and both bytes before printing.
    getsp r1
    mov r7, r1
    ld8u r2, [r7]
    addi.s8 r7, 1
    ld8u r3, [r7]

    mov r0, r2
    debug_print_r0_line_inline
    mov r0, r3
    debug_print_r0_line_inline
    mov r0, r1
    debug_print_r0_line_inline

    adjsp 2
    getsp r0
    debug_print_r0_line_inline

    ; PUSH16 r2: value 0x389a.
    ldi16 r7, 0x0980
    setsp r7
    ldi16 r4, 0x389a
    mov r2, r4
    push16 r2

    ; Capture the post-push SP and both bytes before printing.
    getsp r1
    mov r7, r1
    ld8u r2, [r7]
    addi.s8 r7, 1
    ld8u r3, [r7]

    mov r0, r2
    debug_print_r0_line_inline
    mov r0, r3
    debug_print_r0_line_inline
    mov r0, r1
    debug_print_r0_line_inline

    adjsp 2
    getsp r0
    debug_print_r0_line_inline

    ; PUSH16 r3: value 0x4bcd.
    ldi16 r7, 0x0980
    setsp r7
    ldi16 r4, 0x4bcd
    mov r3, r4
    push16 r3

    ; Capture the post-push SP and both bytes before printing.
    getsp r1
    mov r7, r1
    ld8u r2, [r7]
    addi.s8 r7, 1
    ld8u r3, [r7]

    mov r0, r2
    debug_print_r0_line_inline
    mov r0, r3
    debug_print_r0_line_inline
    mov r0, r1
    debug_print_r0_line_inline

    adjsp 2
    getsp r0
    debug_print_r0_line_inline

    ; PUSH16 r4: value 0x5ef0.
    ldi16 r7, 0x0980
    setsp r7
    ldi16 r4, 0x5ef0
    push16 r4

    ; Capture the post-push SP and both bytes before printing.
    getsp r1
    mov r7, r1
    ld8u r2, [r7]
    addi.s8 r7, 1
    ld8u r3, [r7]

    mov r0, r2
    debug_print_r0_line_inline
    mov r0, r3
    debug_print_r0_line_inline
    mov r0, r1
    debug_print_r0_line_inline

    adjsp 2
    getsp r0
    debug_print_r0_line_inline

    ; PUSH16 r5: value 0x6123.
    ldi16 r7, 0x0980
    setsp r7
    ldi16 r5, 0x6123
    push16 r5

    ; Capture the post-push SP and both bytes before printing.
    getsp r1
    mov r7, r1
    ld8u r2, [r7]
    addi.s8 r7, 1
    ld8u r3, [r7]

    mov r0, r2
    debug_print_r0_line_inline
    mov r0, r3
    debug_print_r0_line_inline
    mov r0, r1
    debug_print_r0_line_inline

    adjsp 2
    getsp r0
    debug_print_r0_line_inline

    ; PUSH16 r6: value 0x7456.
    ldi16 r7, 0x0980
    setsp r7
    ldi16 r6, 0x7456
    push16 r6

    ; Capture the post-push SP and both bytes before printing.
    getsp r1
    mov r7, r1
    ld8u r2, [r7]
    addi.s8 r7, 1
    ld8u r3, [r7]

    mov r0, r2
    debug_print_r0_line_inline
    mov r0, r3
    debug_print_r0_line_inline
    mov r0, r1
    debug_print_r0_line_inline

    adjsp 2
    getsp r0
    debug_print_r0_line_inline

    ; PUSH16 r7: value 0x8789.
    ldi16 r7, 0x0980
    setsp r7
    ldi16 r7, 0x8789
    push16 r7

    ; Capture the post-push SP and both bytes before printing.
    getsp r1
    mov r7, r1
    ld8u r2, [r7]
    addi.s8 r7, 1
    ld8u r3, [r7]

    mov r0, r2
    debug_print_r0_line_inline
    mov r0, r3
    debug_print_r0_line_inline
    mov r0, r1
    debug_print_r0_line_inline

    adjsp 2
    getsp r0
    debug_print_r0_line_inline

    sys debug_break
