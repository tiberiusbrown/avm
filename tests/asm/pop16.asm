.include "include/stack_test_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; POP16 r0: memory contains 0x0123.
    ldi16 c0, 0x097e
    ldi16 c1, 0x0123
    st16 [c0], c1
    setsp r4
    pop16 r0
    debug_print_r0_line_inline
    getsp r0
    debug_print_r0_line_inline

    ; POP16 r1: memory contains 0x1456.
    ldi16 c0, 0x097e
    ldi16 c1, 0x1456
    st16 [c0], c1
    setsp r4
    pop16 r1
    mov r0, r1
    debug_print_r0_line_inline
    getsp r0
    debug_print_r0_line_inline

    ; POP16 r2: memory contains 0x2789.
    ldi16 c0, 0x097e
    ldi16 c1, 0x2789
    st16 [c0], c1
    setsp r4
    pop16 r2
    mov r0, r2
    debug_print_r0_line_inline
    getsp r0
    debug_print_r0_line_inline

    ; POP16 r3: memory contains 0x3abc.
    ldi16 c0, 0x097e
    ldi16 c1, 0x3abc
    st16 [c0], c1
    setsp r4
    pop16 r3
    mov r0, r3
    debug_print_r0_line_inline
    getsp r0
    debug_print_r0_line_inline

    ; POP16 r4: memory contains 0x4def.
    ldi16 c0, 0x097e
    ldi16 c1, 0x4def
    st16 [c0], c1
    setsp r4
    pop16 r4
    mov r0, r4
    debug_print_r0_line_inline
    getsp r0
    debug_print_r0_line_inline

    ; POP16 r5: memory contains 0x5012.
    ldi16 c0, 0x097e
    ldi16 c1, 0x5012
    st16 [c0], c1
    setsp r4
    pop16 r5
    mov r0, r5
    debug_print_r0_line_inline
    getsp r0
    debug_print_r0_line_inline

    ; POP16 r6: memory contains 0x6345.
    ldi16 c0, 0x097e
    ldi16 c1, 0x6345
    st16 [c0], c1
    setsp r4
    pop16 r6
    mov r0, r6
    debug_print_r0_line_inline
    getsp r0
    debug_print_r0_line_inline

    ; POP16 r7: memory contains 0x7678.
    ldi16 c0, 0x097e
    ldi16 c1, 0x7678
    st16 [c0], c1
    setsp r4
    pop16 r7
    mov r0, r7
    debug_print_r0_line_inline
    getsp r0
    debug_print_r0_line_inline

    sys debug_break
