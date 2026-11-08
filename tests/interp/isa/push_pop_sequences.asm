.include "include/stack_test_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi16 r7, 0x0980
    setsp r7

    ; Initialize r0-r3 through r4/r4 because the F0 page is not required.
    ldi16 r4, 0x0123
    mov r0, r4
    ldi16 r4, 0x2345
    mov r1, r4
    ldi16 r4, 0x4567
    mov r2, r4
    ldi16 r4, 0x6789
    mov r3, r4

    ; Initialize the upper/full aliases r4-r7 directly.
    ldi16 r4, 0x89ab
    ldi16 r5, 0xabcd
    ldi16 r6, 0xcdef
    ldi16 r7, 0xef01

    push16 r0
    push16 r1
    push16 r2
    push16 r3
    push16 r4
    push16 r5
    push16 r6
    push16 r7

    ; Eight pushes consume 16 bytes: 0x0980 -> 0x0970.
    getsp r0
    debug_print_r0_line_inline

    pop16 r7
    mov r0, r7
    debug_print_r0_line_inline

    pop16 r6
    mov r0, r6
    debug_print_r0_line_inline

    pop16 r5
    mov r0, r5
    debug_print_r0_line_inline

    pop16 r4
    mov r0, r4
    debug_print_r0_line_inline

    pop16 r3
    mov r0, r3
    debug_print_r0_line_inline

    pop16 r2
    mov r0, r2
    debug_print_r0_line_inline

    pop16 r1
    mov r0, r1
    debug_print_r0_line_inline

    pop16 r0
    debug_print_r0_line_inline

    ; Eight matching pops restore SP exactly.
    getsp r0
    debug_print_r0_line_inline

    sys debug_break
