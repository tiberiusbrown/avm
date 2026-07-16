.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; breq16: forward/backward, taken/not taken.
    ldi16 c0, 0x1234
    ldi16 c1, 0x1234
    cmp c0, c1
    breq16 .L16_eq_forward_taken
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_eq_forward_taken:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0x1234
    ldi16 c1, 0x5678
    cmp c0, c1
    breq16 .L16_eq_forward_not
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_eq_forward_not:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0x1234
    ldi16 c1, 0x1234
    jmp16 .L16_eq_back_taken_check
.L16_eq_back_taken_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0x1234
    ldi16 c1, 0x5678
    .zero 130
.L16_eq_back_taken_check:
    cmp c0, c1
    breq16 .L16_eq_back_taken_target
    ldi8 c0, 'D'
    sys debug_putc

    ldi16 c0, 0x1234
    ldi16 c1, 0x5678
    jmp16 .L16_eq_back_not_check
.L16_eq_back_not_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0x1234
    ldi16 c1, 0x5678
    .zero 130
.L16_eq_back_not_check:
    cmp c0, c1
    breq16 .L16_eq_back_not_target
    ldi8 c0, 'D'
    sys debug_putc
    debug_emit_newline

    ; brne16: forward/backward, taken/not taken.
    ldi16 c0, 0x1234
    ldi16 c1, 0x5678
    cmp c0, c1
    brne16 .L16_ne_forward_taken
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_ne_forward_taken:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0x1234
    ldi16 c1, 0x1234
    cmp c0, c1
    brne16 .L16_ne_forward_not
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_ne_forward_not:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0x1234
    ldi16 c1, 0x5678
    jmp16 .L16_ne_back_taken_check
.L16_ne_back_taken_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0x1234
    ldi16 c1, 0x1234
    .zero 130
.L16_ne_back_taken_check:
    cmp c0, c1
    brne16 .L16_ne_back_taken_target
    ldi8 c0, 'D'
    sys debug_putc

    ldi16 c0, 0x1234
    ldi16 c1, 0x1234
    jmp16 .L16_ne_back_not_check
.L16_ne_back_not_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0x1234
    ldi16 c1, 0x1234
    .zero 130
.L16_ne_back_not_check:
    cmp c0, c1
    brne16 .L16_ne_back_not_target
    ldi8 c0, 'D'
    sys debug_putc
    debug_emit_newline

    ; brult16: forward/backward, taken/not taken.
    ldi16 c0, 0x0001
    ldi16 c1, 0x0002
    cmp c0, c1
    brult16 .L16_ult_forward_taken
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_ult_forward_taken:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0x0002
    ldi16 c1, 0x0001
    cmp c0, c1
    brult16 .L16_ult_forward_not
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_ult_forward_not:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0x0001
    ldi16 c1, 0x0002
    jmp16 .L16_ult_back_taken_check
.L16_ult_back_taken_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0x0002
    ldi16 c1, 0x0001
    .zero 130
.L16_ult_back_taken_check:
    cmp c0, c1
    brult16 .L16_ult_back_taken_target
    ldi8 c0, 'D'
    sys debug_putc

    ldi16 c0, 0x0002
    ldi16 c1, 0x0001
    jmp16 .L16_ult_back_not_check
.L16_ult_back_not_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0x0002
    ldi16 c1, 0x0001
    .zero 130
.L16_ult_back_not_check:
    cmp c0, c1
    brult16 .L16_ult_back_not_target
    ldi8 c0, 'D'
    sys debug_putc
    debug_emit_newline

    ; bruge16: forward/backward, taken/not taken.
    ldi16 c0, 0x0002
    ldi16 c1, 0x0001
    cmp c0, c1
    bruge16 .L16_uge_forward_taken
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_uge_forward_taken:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0x0001
    ldi16 c1, 0x0002
    cmp c0, c1
    bruge16 .L16_uge_forward_not
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_uge_forward_not:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0x0002
    ldi16 c1, 0x0001
    jmp16 .L16_uge_back_taken_check
.L16_uge_back_taken_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0x0001
    ldi16 c1, 0x0002
    .zero 130
.L16_uge_back_taken_check:
    cmp c0, c1
    bruge16 .L16_uge_back_taken_target
    ldi8 c0, 'D'
    sys debug_putc

    ldi16 c0, 0x0001
    ldi16 c1, 0x0002
    jmp16 .L16_uge_back_not_check
.L16_uge_back_not_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0x0001
    ldi16 c1, 0x0002
    .zero 130
.L16_uge_back_not_check:
    cmp c0, c1
    bruge16 .L16_uge_back_not_target
    ldi8 c0, 'D'
    sys debug_putc
    debug_emit_newline

    ; brslt16: forward/backward, taken/not taken.
    ldi16 c0, 0xffff
    ldi16 c1, 0x0001
    cmp c0, c1
    brslt16 .L16_slt_forward_taken
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_slt_forward_taken:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0x0001
    ldi16 c1, 0xffff
    cmp c0, c1
    brslt16 .L16_slt_forward_not
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_slt_forward_not:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0xffff
    ldi16 c1, 0x0001
    jmp16 .L16_slt_back_taken_check
.L16_slt_back_taken_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0x0001
    ldi16 c1, 0xffff
    .zero 130
.L16_slt_back_taken_check:
    cmp c0, c1
    brslt16 .L16_slt_back_taken_target
    ldi8 c0, 'D'
    sys debug_putc

    ldi16 c0, 0x0001
    ldi16 c1, 0xffff
    jmp16 .L16_slt_back_not_check
.L16_slt_back_not_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0x0001
    ldi16 c1, 0xffff
    .zero 130
.L16_slt_back_not_check:
    cmp c0, c1
    brslt16 .L16_slt_back_not_target
    ldi8 c0, 'D'
    sys debug_putc
    debug_emit_newline

    ; brsge16: forward/backward, taken/not taken.
    ldi16 c0, 0x0001
    ldi16 c1, 0xffff
    cmp c0, c1
    brsge16 .L16_sge_forward_taken
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_sge_forward_taken:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0xffff
    ldi16 c1, 0x0001
    cmp c0, c1
    brsge16 .L16_sge_forward_not
    ldi8 c0, 'A'
    sys debug_putc
    .zero 130
.L16_sge_forward_not:
    ldi8 c0, 'B'
    sys debug_putc

    ldi16 c0, 0x0001
    ldi16 c1, 0xffff
    jmp16 .L16_sge_back_taken_check
.L16_sge_back_taken_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0xffff
    ldi16 c1, 0x0001
    .zero 130
.L16_sge_back_taken_check:
    cmp c0, c1
    brsge16 .L16_sge_back_taken_target
    ldi8 c0, 'D'
    sys debug_putc

    ldi16 c0, 0xffff
    ldi16 c1, 0x0001
    jmp16 .L16_sge_back_not_check
.L16_sge_back_not_target:
    ldi8 c0, 'C'
    sys debug_putc
    ldi16 c0, 0xffff
    ldi16 c1, 0x0001
    .zero 130
.L16_sge_back_not_check:
    cmp c0, c1
    brsge16 .L16_sge_back_not_target
    ldi8 c0, 'D'
    sys debug_putc
    debug_emit_newline

    sys debug_break
