.include "include/debug_output.inc"

.section .text,"ax",@progbits

.macro reset_compact_regs
    ; These values print as ABCD, EFGH, IJKL, and MNOP.
    ldi16 c0, 0x0123
    ldi16 c1, 0x4567
    ldi16 c2, 0x89ab
    ldi16 c3, 0xcdef
.endm

.globl _start
.type _start, @function
_start:
    ; Destination c0, every source.
    reset_compact_regs
    mov c0, c0
    call debug_print_compact_regs

    reset_compact_regs
    mov c0, c1
    call debug_print_compact_regs

    reset_compact_regs
    mov c0, c2
    call debug_print_compact_regs

    reset_compact_regs
    mov c0, c3
    call debug_print_compact_regs

    ; Destination c1, every source.
    reset_compact_regs
    mov c1, c0
    call debug_print_compact_regs

    reset_compact_regs
    mov c1, c1
    call debug_print_compact_regs

    reset_compact_regs
    mov c1, c2
    call debug_print_compact_regs

    reset_compact_regs
    mov c1, c3
    call debug_print_compact_regs

    ; Destination c2, every source.
    reset_compact_regs
    mov c2, c0
    call debug_print_compact_regs

    reset_compact_regs
    mov c2, c1
    call debug_print_compact_regs

    reset_compact_regs
    mov c2, c2
    call debug_print_compact_regs

    reset_compact_regs
    mov c2, c3
    call debug_print_compact_regs

    ; Destination c3, every source.
    reset_compact_regs
    mov c3, c0
    call debug_print_compact_regs

    reset_compact_regs
    mov c3, c1
    call debug_print_compact_regs

    reset_compact_regs
    mov c3, c2
    call debug_print_compact_regs

    reset_compact_regs
    mov c3, c3
    call debug_print_compact_regs

    sys debug_break
