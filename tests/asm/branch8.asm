.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; breq8: forward/backward, taken/not taken.
    ldi16 r4, 0x1234
    ldi16 r5, 0x1234
    cmp r4, r5
    breq8 .L8_eq_forward_taken
    ldi8 r4, 'A'
    sys debug_putc
.L8_eq_forward_taken:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0x1234
    ldi16 r5, 0x5678
    cmp r4, r5
    breq8 .L8_eq_forward_not
    ldi8 r4, 'A'
    sys debug_putc
.L8_eq_forward_not:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0x1234
    ldi16 r5, 0x1234
    jmp8 .L8_eq_back_taken_check
.L8_eq_back_taken_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0x1234
    ldi16 r5, 0x5678
.L8_eq_back_taken_check:
    cmp r4, r5
    breq8 .L8_eq_back_taken_target
    ldi8 r4, 'D'
    sys debug_putc

    ldi16 r4, 0x1234
    ldi16 r5, 0x5678
    jmp8 .L8_eq_back_not_check
.L8_eq_back_not_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0x1234
    ldi16 r5, 0x5678
.L8_eq_back_not_check:
    cmp r4, r5
    breq8 .L8_eq_back_not_target
    ldi8 r4, 'D'
    sys debug_putc
    debug_emit_newline

    ; brne8: forward/backward, taken/not taken.
    ldi16 r4, 0x1234
    ldi16 r5, 0x5678
    cmp r4, r5
    brne8 .L8_ne_forward_taken
    ldi8 r4, 'A'
    sys debug_putc
.L8_ne_forward_taken:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0x1234
    ldi16 r5, 0x1234
    cmp r4, r5
    brne8 .L8_ne_forward_not
    ldi8 r4, 'A'
    sys debug_putc
.L8_ne_forward_not:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0x1234
    ldi16 r5, 0x5678
    jmp8 .L8_ne_back_taken_check
.L8_ne_back_taken_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0x1234
    ldi16 r5, 0x1234
.L8_ne_back_taken_check:
    cmp r4, r5
    brne8 .L8_ne_back_taken_target
    ldi8 r4, 'D'
    sys debug_putc

    ldi16 r4, 0x1234
    ldi16 r5, 0x1234
    jmp8 .L8_ne_back_not_check
.L8_ne_back_not_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0x1234
    ldi16 r5, 0x1234
.L8_ne_back_not_check:
    cmp r4, r5
    brne8 .L8_ne_back_not_target
    ldi8 r4, 'D'
    sys debug_putc
    debug_emit_newline

    ; brult8: forward/backward, taken/not taken.
    ldi16 r4, 0x0001
    ldi16 r5, 0x0002
    cmp r4, r5
    brult8 .L8_ult_forward_taken
    ldi8 r4, 'A'
    sys debug_putc
.L8_ult_forward_taken:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0x0002
    ldi16 r5, 0x0001
    cmp r4, r5
    brult8 .L8_ult_forward_not
    ldi8 r4, 'A'
    sys debug_putc
.L8_ult_forward_not:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0x0001
    ldi16 r5, 0x0002
    jmp8 .L8_ult_back_taken_check
.L8_ult_back_taken_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0x0002
    ldi16 r5, 0x0001
.L8_ult_back_taken_check:
    cmp r4, r5
    brult8 .L8_ult_back_taken_target
    ldi8 r4, 'D'
    sys debug_putc

    ldi16 r4, 0x0002
    ldi16 r5, 0x0001
    jmp8 .L8_ult_back_not_check
.L8_ult_back_not_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0x0002
    ldi16 r5, 0x0001
.L8_ult_back_not_check:
    cmp r4, r5
    brult8 .L8_ult_back_not_target
    ldi8 r4, 'D'
    sys debug_putc
    debug_emit_newline

    ; bruge8: forward/backward, taken/not taken.
    ldi16 r4, 0x0002
    ldi16 r5, 0x0001
    cmp r4, r5
    bruge8 .L8_uge_forward_taken
    ldi8 r4, 'A'
    sys debug_putc
.L8_uge_forward_taken:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0x0001
    ldi16 r5, 0x0002
    cmp r4, r5
    bruge8 .L8_uge_forward_not
    ldi8 r4, 'A'
    sys debug_putc
.L8_uge_forward_not:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0x0002
    ldi16 r5, 0x0001
    jmp8 .L8_uge_back_taken_check
.L8_uge_back_taken_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0x0001
    ldi16 r5, 0x0002
.L8_uge_back_taken_check:
    cmp r4, r5
    bruge8 .L8_uge_back_taken_target
    ldi8 r4, 'D'
    sys debug_putc

    ldi16 r4, 0x0001
    ldi16 r5, 0x0002
    jmp8 .L8_uge_back_not_check
.L8_uge_back_not_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0x0001
    ldi16 r5, 0x0002
.L8_uge_back_not_check:
    cmp r4, r5
    bruge8 .L8_uge_back_not_target
    ldi8 r4, 'D'
    sys debug_putc
    debug_emit_newline

    ; brslt8: forward/backward, taken/not taken.
    ldi16 r4, 0xffff
    ldi16 r5, 0x0001
    cmp r4, r5
    brslt8 .L8_slt_forward_taken
    ldi8 r4, 'A'
    sys debug_putc
.L8_slt_forward_taken:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0x0001
    ldi16 r5, 0xffff
    cmp r4, r5
    brslt8 .L8_slt_forward_not
    ldi8 r4, 'A'
    sys debug_putc
.L8_slt_forward_not:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0xffff
    ldi16 r5, 0x0001
    jmp8 .L8_slt_back_taken_check
.L8_slt_back_taken_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0x0001
    ldi16 r5, 0xffff
.L8_slt_back_taken_check:
    cmp r4, r5
    brslt8 .L8_slt_back_taken_target
    ldi8 r4, 'D'
    sys debug_putc

    ldi16 r4, 0x0001
    ldi16 r5, 0xffff
    jmp8 .L8_slt_back_not_check
.L8_slt_back_not_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0x0001
    ldi16 r5, 0xffff
.L8_slt_back_not_check:
    cmp r4, r5
    brslt8 .L8_slt_back_not_target
    ldi8 r4, 'D'
    sys debug_putc
    debug_emit_newline

    ; brsge8: forward/backward, taken/not taken.
    ldi16 r4, 0x0001
    ldi16 r5, 0xffff
    cmp r4, r5
    brsge8 .L8_sge_forward_taken
    ldi8 r4, 'A'
    sys debug_putc
.L8_sge_forward_taken:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0xffff
    ldi16 r5, 0x0001
    cmp r4, r5
    brsge8 .L8_sge_forward_not
    ldi8 r4, 'A'
    sys debug_putc
.L8_sge_forward_not:
    ldi8 r4, 'B'
    sys debug_putc

    ldi16 r4, 0x0001
    ldi16 r5, 0xffff
    jmp8 .L8_sge_back_taken_check
.L8_sge_back_taken_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0xffff
    ldi16 r5, 0x0001
.L8_sge_back_taken_check:
    cmp r4, r5
    brsge8 .L8_sge_back_taken_target
    ldi8 r4, 'D'
    sys debug_putc

    ldi16 r4, 0xffff
    ldi16 r5, 0x0001
    jmp8 .L8_sge_back_not_check
.L8_sge_back_not_target:
    ldi8 r4, 'C'
    sys debug_putc
    ldi16 r4, 0xffff
    ldi16 r5, 0x0001
.L8_sge_back_not_check:
    cmp r4, r5
    brsge8 .L8_sge_back_not_target
    ldi8 r4, 'D'
    sys debug_putc
    debug_emit_newline

    sys debug_break
