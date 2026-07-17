.include "include/full_matrix_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; Matrix index 0x00: mov r0,r0; guard r3.
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xa503
    push16 r4
    pop16 r3
    pop16 r0
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r0, r0
    push16 r3
    push16 r0
    push16 r0
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_00_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_00_EQ_done
.Lmov_full_00_EQ_true:
    fm_emit_char 'B'
.Lmov_full_00_EQ_done:
    brne8 .Lmov_full_00_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_00_NE_done
.Lmov_full_00_NE_true:
    fm_emit_char 'B'
.Lmov_full_00_NE_done:
    brult8 .Lmov_full_00_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_00_ULT_done
.Lmov_full_00_ULT_true:
    fm_emit_char 'B'
.Lmov_full_00_ULT_done:
    bruge8 .Lmov_full_00_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_00_UGE_done
.Lmov_full_00_UGE_true:
    fm_emit_char 'B'
.Lmov_full_00_UGE_done:
    brslt8 .Lmov_full_00_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_00_SLT_done
.Lmov_full_00_SLT_true:
    fm_emit_char 'B'
.Lmov_full_00_SLT_done:
    brsge8 .Lmov_full_00_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_00_SGE_done
.Lmov_full_00_SGE_true:
    fm_emit_char 'B'
.Lmov_full_00_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x01: mov r0,r1; guard r4.
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa535
    push16 r4
    pop16 r4
    pop16 r1
    pop16 r0
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r0, r1
    push16 r4
    push16 r1
    push16 r0
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_01_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_01_EQ_done
.Lmov_full_01_EQ_true:
    fm_emit_char 'B'
.Lmov_full_01_EQ_done:
    brne8 .Lmov_full_01_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_01_NE_done
.Lmov_full_01_NE_true:
    fm_emit_char 'B'
.Lmov_full_01_NE_done:
    brult8 .Lmov_full_01_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_01_ULT_done
.Lmov_full_01_ULT_true:
    fm_emit_char 'B'
.Lmov_full_01_ULT_done:
    bruge8 .Lmov_full_01_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_01_UGE_done
.Lmov_full_01_UGE_true:
    fm_emit_char 'B'
.Lmov_full_01_UGE_done:
    brslt8 .Lmov_full_01_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_01_SLT_done
.Lmov_full_01_SLT_true:
    fm_emit_char 'B'
.Lmov_full_01_SLT_done:
    brsge8 .Lmov_full_01_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_01_SGE_done
.Lmov_full_01_SGE_true:
    fm_emit_char 'B'
.Lmov_full_01_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x02: mov r0,r2; guard r5.
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa567
    push16 r4
    pop16 r5
    pop16 r2
    pop16 r0
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r0, r2
    push16 r5
    push16 r2
    push16 r0
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_02_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_02_EQ_done
.Lmov_full_02_EQ_true:
    fm_emit_char 'B'
.Lmov_full_02_EQ_done:
    brne8 .Lmov_full_02_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_02_NE_done
.Lmov_full_02_NE_true:
    fm_emit_char 'B'
.Lmov_full_02_NE_done:
    brult8 .Lmov_full_02_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_02_ULT_done
.Lmov_full_02_ULT_true:
    fm_emit_char 'B'
.Lmov_full_02_ULT_done:
    bruge8 .Lmov_full_02_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_02_UGE_done
.Lmov_full_02_UGE_true:
    fm_emit_char 'B'
.Lmov_full_02_UGE_done:
    brslt8 .Lmov_full_02_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_02_SLT_done
.Lmov_full_02_SLT_true:
    fm_emit_char 'B'
.Lmov_full_02_SLT_done:
    brsge8 .Lmov_full_02_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_02_SGE_done
.Lmov_full_02_SGE_true:
    fm_emit_char 'B'
.Lmov_full_02_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x03: mov r0,r3; guard r6.
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0xa599
    push16 r4
    pop16 r6
    pop16 r3
    pop16 r0
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r0, r3
    push16 r6
    push16 r3
    push16 r0
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_03_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_03_EQ_done
.Lmov_full_03_EQ_true:
    fm_emit_char 'B'
.Lmov_full_03_EQ_done:
    brne8 .Lmov_full_03_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_03_NE_done
.Lmov_full_03_NE_true:
    fm_emit_char 'B'
.Lmov_full_03_NE_done:
    brult8 .Lmov_full_03_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_03_ULT_done
.Lmov_full_03_ULT_true:
    fm_emit_char 'B'
.Lmov_full_03_ULT_done:
    bruge8 .Lmov_full_03_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_03_UGE_done
.Lmov_full_03_UGE_true:
    fm_emit_char 'B'
.Lmov_full_03_UGE_done:
    brslt8 .Lmov_full_03_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_03_SLT_done
.Lmov_full_03_SLT_true:
    fm_emit_char 'B'
.Lmov_full_03_SLT_done:
    brsge8 .Lmov_full_03_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_03_SGE_done
.Lmov_full_03_SGE_true:
    fm_emit_char 'B'
.Lmov_full_03_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x04: mov r0,r4; guard r7.
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa5cb
    push16 r4
    pop16 r7
    pop16 r4
    pop16 r0
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r0, r4
    push16 r7
    push16 r4
    push16 r0
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_04_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_04_EQ_done
.Lmov_full_04_EQ_true:
    fm_emit_char 'B'
.Lmov_full_04_EQ_done:
    brne8 .Lmov_full_04_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_04_NE_done
.Lmov_full_04_NE_true:
    fm_emit_char 'B'
.Lmov_full_04_NE_done:
    brult8 .Lmov_full_04_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_04_ULT_done
.Lmov_full_04_ULT_true:
    fm_emit_char 'B'
.Lmov_full_04_ULT_done:
    bruge8 .Lmov_full_04_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_04_UGE_done
.Lmov_full_04_UGE_true:
    fm_emit_char 'B'
.Lmov_full_04_UGE_done:
    brslt8 .Lmov_full_04_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_04_SLT_done
.Lmov_full_04_SLT_true:
    fm_emit_char 'B'
.Lmov_full_04_SLT_done:
    brsge8 .Lmov_full_04_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_04_SGE_done
.Lmov_full_04_SGE_true:
    fm_emit_char 'B'
.Lmov_full_04_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x05: mov r0,r5; guard r1.
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xa5f6
    push16 r4
    pop16 r1
    pop16 r5
    pop16 r0
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r0, r5
    push16 r1
    push16 r5
    push16 r0
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_05_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_05_EQ_done
.Lmov_full_05_EQ_true:
    fm_emit_char 'B'
.Lmov_full_05_EQ_done:
    brne8 .Lmov_full_05_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_05_NE_done
.Lmov_full_05_NE_true:
    fm_emit_char 'B'
.Lmov_full_05_NE_done:
    brult8 .Lmov_full_05_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_05_ULT_done
.Lmov_full_05_ULT_true:
    fm_emit_char 'B'
.Lmov_full_05_ULT_done:
    bruge8 .Lmov_full_05_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_05_UGE_done
.Lmov_full_05_UGE_true:
    fm_emit_char 'B'
.Lmov_full_05_UGE_done:
    brslt8 .Lmov_full_05_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_05_SLT_done
.Lmov_full_05_SLT_true:
    fm_emit_char 'B'
.Lmov_full_05_SLT_done:
    brsge8 .Lmov_full_05_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_05_SGE_done
.Lmov_full_05_SGE_true:
    fm_emit_char 'B'
.Lmov_full_05_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x06: mov r0,r6; guard r1.
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa627
    push16 r4
    pop16 r1
    pop16 r6
    pop16 r0
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r0, r6
    push16 r1
    push16 r6
    push16 r0
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_06_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_06_EQ_done
.Lmov_full_06_EQ_true:
    fm_emit_char 'B'
.Lmov_full_06_EQ_done:
    brne8 .Lmov_full_06_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_06_NE_done
.Lmov_full_06_NE_true:
    fm_emit_char 'B'
.Lmov_full_06_NE_done:
    brult8 .Lmov_full_06_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_06_ULT_done
.Lmov_full_06_ULT_true:
    fm_emit_char 'B'
.Lmov_full_06_ULT_done:
    bruge8 .Lmov_full_06_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_06_UGE_done
.Lmov_full_06_UGE_true:
    fm_emit_char 'B'
.Lmov_full_06_UGE_done:
    brslt8 .Lmov_full_06_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_06_SLT_done
.Lmov_full_06_SLT_true:
    fm_emit_char 'B'
.Lmov_full_06_SLT_done:
    brsge8 .Lmov_full_06_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_06_SGE_done
.Lmov_full_06_SGE_true:
    fm_emit_char 'B'
.Lmov_full_06_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x07: mov r0,r7; guard r2.
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0xfedc
    push16 r4
    ldi16 r4, 0xa659
    push16 r4
    pop16 r2
    pop16 r7
    pop16 r0
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r0, r7
    push16 r2
    push16 r7
    push16 r0
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_07_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_07_EQ_done
.Lmov_full_07_EQ_true:
    fm_emit_char 'B'
.Lmov_full_07_EQ_done:
    brne8 .Lmov_full_07_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_07_NE_done
.Lmov_full_07_NE_true:
    fm_emit_char 'B'
.Lmov_full_07_NE_done:
    brult8 .Lmov_full_07_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_07_ULT_done
.Lmov_full_07_ULT_true:
    fm_emit_char 'B'
.Lmov_full_07_ULT_done:
    bruge8 .Lmov_full_07_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_07_UGE_done
.Lmov_full_07_UGE_true:
    fm_emit_char 'B'
.Lmov_full_07_UGE_done:
    brslt8 .Lmov_full_07_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_07_SLT_done
.Lmov_full_07_SLT_true:
    fm_emit_char 'B'
.Lmov_full_07_SLT_done:
    brsge8 .Lmov_full_07_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_07_SGE_done
.Lmov_full_07_SGE_true:
    fm_emit_char 'B'
.Lmov_full_07_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x08: mov r1,r0; guard r3.
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xa68b
    push16 r4
    pop16 r3
    pop16 r0
    pop16 r1
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r1, r0
    push16 r3
    push16 r0
    push16 r1
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_08_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_08_EQ_done
.Lmov_full_08_EQ_true:
    fm_emit_char 'B'
.Lmov_full_08_EQ_done:
    brne8 .Lmov_full_08_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_08_NE_done
.Lmov_full_08_NE_true:
    fm_emit_char 'B'
.Lmov_full_08_NE_done:
    brult8 .Lmov_full_08_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_08_ULT_done
.Lmov_full_08_ULT_true:
    fm_emit_char 'B'
.Lmov_full_08_ULT_done:
    bruge8 .Lmov_full_08_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_08_UGE_done
.Lmov_full_08_UGE_true:
    fm_emit_char 'B'
.Lmov_full_08_UGE_done:
    brslt8 .Lmov_full_08_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_08_SLT_done
.Lmov_full_08_SLT_true:
    fm_emit_char 'B'
.Lmov_full_08_SLT_done:
    brsge8 .Lmov_full_08_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_08_SGE_done
.Lmov_full_08_SGE_true:
    fm_emit_char 'B'
.Lmov_full_08_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x09: mov r1,r1; guard r4.
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa6bd
    push16 r4
    pop16 r4
    pop16 r1
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r1, r1
    push16 r4
    push16 r1
    push16 r1
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_09_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_09_EQ_done
.Lmov_full_09_EQ_true:
    fm_emit_char 'B'
.Lmov_full_09_EQ_done:
    brne8 .Lmov_full_09_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_09_NE_done
.Lmov_full_09_NE_true:
    fm_emit_char 'B'
.Lmov_full_09_NE_done:
    brult8 .Lmov_full_09_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_09_ULT_done
.Lmov_full_09_ULT_true:
    fm_emit_char 'B'
.Lmov_full_09_ULT_done:
    bruge8 .Lmov_full_09_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_09_UGE_done
.Lmov_full_09_UGE_true:
    fm_emit_char 'B'
.Lmov_full_09_UGE_done:
    brslt8 .Lmov_full_09_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_09_SLT_done
.Lmov_full_09_SLT_true:
    fm_emit_char 'B'
.Lmov_full_09_SLT_done:
    brsge8 .Lmov_full_09_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_09_SGE_done
.Lmov_full_09_SGE_true:
    fm_emit_char 'B'
.Lmov_full_09_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x0A: mov r1,r2; guard r5.
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa6ef
    push16 r4
    pop16 r5
    pop16 r2
    pop16 r1
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r1, r2
    push16 r5
    push16 r2
    push16 r1
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_0a_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0a_EQ_done
.Lmov_full_0a_EQ_true:
    fm_emit_char 'B'
.Lmov_full_0a_EQ_done:
    brne8 .Lmov_full_0a_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0a_NE_done
.Lmov_full_0a_NE_true:
    fm_emit_char 'B'
.Lmov_full_0a_NE_done:
    brult8 .Lmov_full_0a_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0a_ULT_done
.Lmov_full_0a_ULT_true:
    fm_emit_char 'B'
.Lmov_full_0a_ULT_done:
    bruge8 .Lmov_full_0a_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0a_UGE_done
.Lmov_full_0a_UGE_true:
    fm_emit_char 'B'
.Lmov_full_0a_UGE_done:
    brslt8 .Lmov_full_0a_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0a_SLT_done
.Lmov_full_0a_SLT_true:
    fm_emit_char 'B'
.Lmov_full_0a_SLT_done:
    brsge8 .Lmov_full_0a_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0a_SGE_done
.Lmov_full_0a_SGE_true:
    fm_emit_char 'B'
.Lmov_full_0a_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x0B: mov r1,r3; guard r6.
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0xa721
    push16 r4
    pop16 r6
    pop16 r3
    pop16 r1
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r1, r3
    push16 r6
    push16 r3
    push16 r1
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_0b_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0b_EQ_done
.Lmov_full_0b_EQ_true:
    fm_emit_char 'B'
.Lmov_full_0b_EQ_done:
    brne8 .Lmov_full_0b_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0b_NE_done
.Lmov_full_0b_NE_true:
    fm_emit_char 'B'
.Lmov_full_0b_NE_done:
    brult8 .Lmov_full_0b_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0b_ULT_done
.Lmov_full_0b_ULT_true:
    fm_emit_char 'B'
.Lmov_full_0b_ULT_done:
    bruge8 .Lmov_full_0b_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0b_UGE_done
.Lmov_full_0b_UGE_true:
    fm_emit_char 'B'
.Lmov_full_0b_UGE_done:
    brslt8 .Lmov_full_0b_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0b_SLT_done
.Lmov_full_0b_SLT_true:
    fm_emit_char 'B'
.Lmov_full_0b_SLT_done:
    brsge8 .Lmov_full_0b_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0b_SGE_done
.Lmov_full_0b_SGE_true:
    fm_emit_char 'B'
.Lmov_full_0b_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x0C: mov r1,r4; guard r7.
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa753
    push16 r4
    pop16 r7
    pop16 r4
    pop16 r1
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r1, r4
    push16 r7
    push16 r4
    push16 r1
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_0c_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0c_EQ_done
.Lmov_full_0c_EQ_true:
    fm_emit_char 'B'
.Lmov_full_0c_EQ_done:
    brne8 .Lmov_full_0c_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0c_NE_done
.Lmov_full_0c_NE_true:
    fm_emit_char 'B'
.Lmov_full_0c_NE_done:
    brult8 .Lmov_full_0c_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0c_ULT_done
.Lmov_full_0c_ULT_true:
    fm_emit_char 'B'
.Lmov_full_0c_ULT_done:
    bruge8 .Lmov_full_0c_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0c_UGE_done
.Lmov_full_0c_UGE_true:
    fm_emit_char 'B'
.Lmov_full_0c_UGE_done:
    brslt8 .Lmov_full_0c_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0c_SLT_done
.Lmov_full_0c_SLT_true:
    fm_emit_char 'B'
.Lmov_full_0c_SLT_done:
    brsge8 .Lmov_full_0c_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0c_SGE_done
.Lmov_full_0c_SGE_true:
    fm_emit_char 'B'
.Lmov_full_0c_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x0D: mov r1,r5; guard r0.
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xa77d
    push16 r4
    pop16 r0
    pop16 r5
    pop16 r1
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r1, r5
    push16 r0
    push16 r5
    push16 r1
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_0d_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0d_EQ_done
.Lmov_full_0d_EQ_true:
    fm_emit_char 'B'
.Lmov_full_0d_EQ_done:
    brne8 .Lmov_full_0d_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0d_NE_done
.Lmov_full_0d_NE_true:
    fm_emit_char 'B'
.Lmov_full_0d_NE_done:
    brult8 .Lmov_full_0d_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0d_ULT_done
.Lmov_full_0d_ULT_true:
    fm_emit_char 'B'
.Lmov_full_0d_ULT_done:
    bruge8 .Lmov_full_0d_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0d_UGE_done
.Lmov_full_0d_UGE_true:
    fm_emit_char 'B'
.Lmov_full_0d_UGE_done:
    brslt8 .Lmov_full_0d_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0d_SLT_done
.Lmov_full_0d_SLT_true:
    fm_emit_char 'B'
.Lmov_full_0d_SLT_done:
    brsge8 .Lmov_full_0d_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0d_SGE_done
.Lmov_full_0d_SGE_true:
    fm_emit_char 'B'
.Lmov_full_0d_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x0E: mov r1,r6; guard r2.
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa7b0
    push16 r4
    pop16 r2
    pop16 r6
    pop16 r1
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r1, r6
    push16 r2
    push16 r6
    push16 r1
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_0e_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0e_EQ_done
.Lmov_full_0e_EQ_true:
    fm_emit_char 'B'
.Lmov_full_0e_EQ_done:
    brne8 .Lmov_full_0e_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0e_NE_done
.Lmov_full_0e_NE_true:
    fm_emit_char 'B'
.Lmov_full_0e_NE_done:
    brult8 .Lmov_full_0e_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0e_ULT_done
.Lmov_full_0e_ULT_true:
    fm_emit_char 'B'
.Lmov_full_0e_ULT_done:
    bruge8 .Lmov_full_0e_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0e_UGE_done
.Lmov_full_0e_UGE_true:
    fm_emit_char 'B'
.Lmov_full_0e_UGE_done:
    brslt8 .Lmov_full_0e_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0e_SLT_done
.Lmov_full_0e_SLT_true:
    fm_emit_char 'B'
.Lmov_full_0e_SLT_done:
    brsge8 .Lmov_full_0e_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0e_SGE_done
.Lmov_full_0e_SGE_true:
    fm_emit_char 'B'
.Lmov_full_0e_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x0F: mov r1,r7; guard r2.
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0xfedc
    push16 r4
    ldi16 r4, 0xa7e1
    push16 r4
    pop16 r2
    pop16 r7
    pop16 r1
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r1, r7
    push16 r2
    push16 r7
    push16 r1
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_0f_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0f_EQ_done
.Lmov_full_0f_EQ_true:
    fm_emit_char 'B'
.Lmov_full_0f_EQ_done:
    brne8 .Lmov_full_0f_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0f_NE_done
.Lmov_full_0f_NE_true:
    fm_emit_char 'B'
.Lmov_full_0f_NE_done:
    brult8 .Lmov_full_0f_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0f_ULT_done
.Lmov_full_0f_ULT_true:
    fm_emit_char 'B'
.Lmov_full_0f_ULT_done:
    bruge8 .Lmov_full_0f_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0f_UGE_done
.Lmov_full_0f_UGE_true:
    fm_emit_char 'B'
.Lmov_full_0f_UGE_done:
    brslt8 .Lmov_full_0f_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0f_SLT_done
.Lmov_full_0f_SLT_true:
    fm_emit_char 'B'
.Lmov_full_0f_SLT_done:
    brsge8 .Lmov_full_0f_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_0f_SGE_done
.Lmov_full_0f_SGE_true:
    fm_emit_char 'B'
.Lmov_full_0f_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x10: mov r2,r0; guard r3.
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xa813
    push16 r4
    pop16 r3
    pop16 r0
    pop16 r2
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r2, r0
    push16 r3
    push16 r0
    push16 r2
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_10_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_10_EQ_done
.Lmov_full_10_EQ_true:
    fm_emit_char 'B'
.Lmov_full_10_EQ_done:
    brne8 .Lmov_full_10_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_10_NE_done
.Lmov_full_10_NE_true:
    fm_emit_char 'B'
.Lmov_full_10_NE_done:
    brult8 .Lmov_full_10_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_10_ULT_done
.Lmov_full_10_ULT_true:
    fm_emit_char 'B'
.Lmov_full_10_ULT_done:
    bruge8 .Lmov_full_10_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_10_UGE_done
.Lmov_full_10_UGE_true:
    fm_emit_char 'B'
.Lmov_full_10_UGE_done:
    brslt8 .Lmov_full_10_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_10_SLT_done
.Lmov_full_10_SLT_true:
    fm_emit_char 'B'
.Lmov_full_10_SLT_done:
    brsge8 .Lmov_full_10_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_10_SGE_done
.Lmov_full_10_SGE_true:
    fm_emit_char 'B'
.Lmov_full_10_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x11: mov r2,r1; guard r4.
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa845
    push16 r4
    pop16 r4
    pop16 r1
    pop16 r2
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r2, r1
    push16 r4
    push16 r1
    push16 r2
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_11_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_11_EQ_done
.Lmov_full_11_EQ_true:
    fm_emit_char 'B'
.Lmov_full_11_EQ_done:
    brne8 .Lmov_full_11_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_11_NE_done
.Lmov_full_11_NE_true:
    fm_emit_char 'B'
.Lmov_full_11_NE_done:
    brult8 .Lmov_full_11_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_11_ULT_done
.Lmov_full_11_ULT_true:
    fm_emit_char 'B'
.Lmov_full_11_ULT_done:
    bruge8 .Lmov_full_11_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_11_UGE_done
.Lmov_full_11_UGE_true:
    fm_emit_char 'B'
.Lmov_full_11_UGE_done:
    brslt8 .Lmov_full_11_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_11_SLT_done
.Lmov_full_11_SLT_true:
    fm_emit_char 'B'
.Lmov_full_11_SLT_done:
    brsge8 .Lmov_full_11_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_11_SGE_done
.Lmov_full_11_SGE_true:
    fm_emit_char 'B'
.Lmov_full_11_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x12: mov r2,r2; guard r5.
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0xa877
    push16 r4
    pop16 r5
    pop16 r2
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r2, r2
    push16 r5
    push16 r2
    push16 r2
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_12_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_12_EQ_done
.Lmov_full_12_EQ_true:
    fm_emit_char 'B'
.Lmov_full_12_EQ_done:
    brne8 .Lmov_full_12_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_12_NE_done
.Lmov_full_12_NE_true:
    fm_emit_char 'B'
.Lmov_full_12_NE_done:
    brult8 .Lmov_full_12_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_12_ULT_done
.Lmov_full_12_ULT_true:
    fm_emit_char 'B'
.Lmov_full_12_ULT_done:
    bruge8 .Lmov_full_12_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_12_UGE_done
.Lmov_full_12_UGE_true:
    fm_emit_char 'B'
.Lmov_full_12_UGE_done:
    brslt8 .Lmov_full_12_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_12_SLT_done
.Lmov_full_12_SLT_true:
    fm_emit_char 'B'
.Lmov_full_12_SLT_done:
    brsge8 .Lmov_full_12_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_12_SGE_done
.Lmov_full_12_SGE_true:
    fm_emit_char 'B'
.Lmov_full_12_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x13: mov r2,r3; guard r6.
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0xa8a9
    push16 r4
    pop16 r6
    pop16 r3
    pop16 r2
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r2, r3
    push16 r6
    push16 r3
    push16 r2
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_13_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_13_EQ_done
.Lmov_full_13_EQ_true:
    fm_emit_char 'B'
.Lmov_full_13_EQ_done:
    brne8 .Lmov_full_13_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_13_NE_done
.Lmov_full_13_NE_true:
    fm_emit_char 'B'
.Lmov_full_13_NE_done:
    brult8 .Lmov_full_13_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_13_ULT_done
.Lmov_full_13_ULT_true:
    fm_emit_char 'B'
.Lmov_full_13_ULT_done:
    bruge8 .Lmov_full_13_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_13_UGE_done
.Lmov_full_13_UGE_true:
    fm_emit_char 'B'
.Lmov_full_13_UGE_done:
    brslt8 .Lmov_full_13_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_13_SLT_done
.Lmov_full_13_SLT_true:
    fm_emit_char 'B'
.Lmov_full_13_SLT_done:
    brsge8 .Lmov_full_13_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_13_SGE_done
.Lmov_full_13_SGE_true:
    fm_emit_char 'B'
.Lmov_full_13_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x14: mov r2,r4; guard r7.
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa8db
    push16 r4
    pop16 r7
    pop16 r4
    pop16 r2
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r2, r4
    push16 r7
    push16 r4
    push16 r2
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_14_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_14_EQ_done
.Lmov_full_14_EQ_true:
    fm_emit_char 'B'
.Lmov_full_14_EQ_done:
    brne8 .Lmov_full_14_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_14_NE_done
.Lmov_full_14_NE_true:
    fm_emit_char 'B'
.Lmov_full_14_NE_done:
    brult8 .Lmov_full_14_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_14_ULT_done
.Lmov_full_14_ULT_true:
    fm_emit_char 'B'
.Lmov_full_14_ULT_done:
    bruge8 .Lmov_full_14_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_14_UGE_done
.Lmov_full_14_UGE_true:
    fm_emit_char 'B'
.Lmov_full_14_UGE_done:
    brslt8 .Lmov_full_14_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_14_SLT_done
.Lmov_full_14_SLT_true:
    fm_emit_char 'B'
.Lmov_full_14_SLT_done:
    brsge8 .Lmov_full_14_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_14_SGE_done
.Lmov_full_14_SGE_true:
    fm_emit_char 'B'
.Lmov_full_14_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x15: mov r2,r5; guard r0.
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xa905
    push16 r4
    pop16 r0
    pop16 r5
    pop16 r2
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r2, r5
    push16 r0
    push16 r5
    push16 r2
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_15_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_15_EQ_done
.Lmov_full_15_EQ_true:
    fm_emit_char 'B'
.Lmov_full_15_EQ_done:
    brne8 .Lmov_full_15_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_15_NE_done
.Lmov_full_15_NE_true:
    fm_emit_char 'B'
.Lmov_full_15_NE_done:
    brult8 .Lmov_full_15_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_15_ULT_done
.Lmov_full_15_ULT_true:
    fm_emit_char 'B'
.Lmov_full_15_ULT_done:
    bruge8 .Lmov_full_15_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_15_UGE_done
.Lmov_full_15_UGE_true:
    fm_emit_char 'B'
.Lmov_full_15_UGE_done:
    brslt8 .Lmov_full_15_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_15_SLT_done
.Lmov_full_15_SLT_true:
    fm_emit_char 'B'
.Lmov_full_15_SLT_done:
    brsge8 .Lmov_full_15_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_15_SGE_done
.Lmov_full_15_SGE_true:
    fm_emit_char 'B'
.Lmov_full_15_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x16: mov r2,r6; guard r1.
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa937
    push16 r4
    pop16 r1
    pop16 r6
    pop16 r2
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r2, r6
    push16 r1
    push16 r6
    push16 r2
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_16_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_16_EQ_done
.Lmov_full_16_EQ_true:
    fm_emit_char 'B'
.Lmov_full_16_EQ_done:
    brne8 .Lmov_full_16_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_16_NE_done
.Lmov_full_16_NE_true:
    fm_emit_char 'B'
.Lmov_full_16_NE_done:
    brult8 .Lmov_full_16_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_16_ULT_done
.Lmov_full_16_ULT_true:
    fm_emit_char 'B'
.Lmov_full_16_ULT_done:
    bruge8 .Lmov_full_16_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_16_UGE_done
.Lmov_full_16_UGE_true:
    fm_emit_char 'B'
.Lmov_full_16_UGE_done:
    brslt8 .Lmov_full_16_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_16_SLT_done
.Lmov_full_16_SLT_true:
    fm_emit_char 'B'
.Lmov_full_16_SLT_done:
    brsge8 .Lmov_full_16_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_16_SGE_done
.Lmov_full_16_SGE_true:
    fm_emit_char 'B'
.Lmov_full_16_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x17: mov r2,r7; guard r3.
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0xfedc
    push16 r4
    ldi16 r4, 0xa96a
    push16 r4
    pop16 r3
    pop16 r7
    pop16 r2
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r2, r7
    push16 r3
    push16 r7
    push16 r2
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_17_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_17_EQ_done
.Lmov_full_17_EQ_true:
    fm_emit_char 'B'
.Lmov_full_17_EQ_done:
    brne8 .Lmov_full_17_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_17_NE_done
.Lmov_full_17_NE_true:
    fm_emit_char 'B'
.Lmov_full_17_NE_done:
    brult8 .Lmov_full_17_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_17_ULT_done
.Lmov_full_17_ULT_true:
    fm_emit_char 'B'
.Lmov_full_17_ULT_done:
    bruge8 .Lmov_full_17_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_17_UGE_done
.Lmov_full_17_UGE_true:
    fm_emit_char 'B'
.Lmov_full_17_UGE_done:
    brslt8 .Lmov_full_17_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_17_SLT_done
.Lmov_full_17_SLT_true:
    fm_emit_char 'B'
.Lmov_full_17_SLT_done:
    brsge8 .Lmov_full_17_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_17_SGE_done
.Lmov_full_17_SGE_true:
    fm_emit_char 'B'
.Lmov_full_17_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x18: mov r3,r0; guard r4.
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xa99c
    push16 r4
    pop16 r4
    pop16 r0
    pop16 r3
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r3, r0
    push16 r4
    push16 r0
    push16 r3
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_18_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_18_EQ_done
.Lmov_full_18_EQ_true:
    fm_emit_char 'B'
.Lmov_full_18_EQ_done:
    brne8 .Lmov_full_18_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_18_NE_done
.Lmov_full_18_NE_true:
    fm_emit_char 'B'
.Lmov_full_18_NE_done:
    brult8 .Lmov_full_18_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_18_ULT_done
.Lmov_full_18_ULT_true:
    fm_emit_char 'B'
.Lmov_full_18_ULT_done:
    bruge8 .Lmov_full_18_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_18_UGE_done
.Lmov_full_18_UGE_true:
    fm_emit_char 'B'
.Lmov_full_18_UGE_done:
    brslt8 .Lmov_full_18_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_18_SLT_done
.Lmov_full_18_SLT_true:
    fm_emit_char 'B'
.Lmov_full_18_SLT_done:
    brsge8 .Lmov_full_18_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_18_SGE_done
.Lmov_full_18_SGE_true:
    fm_emit_char 'B'
.Lmov_full_18_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x19: mov r3,r1; guard r4.
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa9cd
    push16 r4
    pop16 r4
    pop16 r1
    pop16 r3
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r3, r1
    push16 r4
    push16 r1
    push16 r3
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_19_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_19_EQ_done
.Lmov_full_19_EQ_true:
    fm_emit_char 'B'
.Lmov_full_19_EQ_done:
    brne8 .Lmov_full_19_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_19_NE_done
.Lmov_full_19_NE_true:
    fm_emit_char 'B'
.Lmov_full_19_NE_done:
    brult8 .Lmov_full_19_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_19_ULT_done
.Lmov_full_19_ULT_true:
    fm_emit_char 'B'
.Lmov_full_19_ULT_done:
    bruge8 .Lmov_full_19_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_19_UGE_done
.Lmov_full_19_UGE_true:
    fm_emit_char 'B'
.Lmov_full_19_UGE_done:
    brslt8 .Lmov_full_19_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_19_SLT_done
.Lmov_full_19_SLT_true:
    fm_emit_char 'B'
.Lmov_full_19_SLT_done:
    brsge8 .Lmov_full_19_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_19_SGE_done
.Lmov_full_19_SGE_true:
    fm_emit_char 'B'
.Lmov_full_19_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x1A: mov r3,r2; guard r5.
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xa9ff
    push16 r4
    pop16 r5
    pop16 r2
    pop16 r3
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r3, r2
    push16 r5
    push16 r2
    push16 r3
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_1a_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1a_EQ_done
.Lmov_full_1a_EQ_true:
    fm_emit_char 'B'
.Lmov_full_1a_EQ_done:
    brne8 .Lmov_full_1a_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1a_NE_done
.Lmov_full_1a_NE_true:
    fm_emit_char 'B'
.Lmov_full_1a_NE_done:
    brult8 .Lmov_full_1a_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1a_ULT_done
.Lmov_full_1a_ULT_true:
    fm_emit_char 'B'
.Lmov_full_1a_ULT_done:
    bruge8 .Lmov_full_1a_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1a_UGE_done
.Lmov_full_1a_UGE_true:
    fm_emit_char 'B'
.Lmov_full_1a_UGE_done:
    brslt8 .Lmov_full_1a_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1a_SLT_done
.Lmov_full_1a_SLT_true:
    fm_emit_char 'B'
.Lmov_full_1a_SLT_done:
    brsge8 .Lmov_full_1a_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1a_SGE_done
.Lmov_full_1a_SGE_true:
    fm_emit_char 'B'
.Lmov_full_1a_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x1B: mov r3,r3; guard r6.
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0xaa31
    push16 r4
    pop16 r6
    pop16 r3
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r3, r3
    push16 r6
    push16 r3
    push16 r3
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_1b_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1b_EQ_done
.Lmov_full_1b_EQ_true:
    fm_emit_char 'B'
.Lmov_full_1b_EQ_done:
    brne8 .Lmov_full_1b_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1b_NE_done
.Lmov_full_1b_NE_true:
    fm_emit_char 'B'
.Lmov_full_1b_NE_done:
    brult8 .Lmov_full_1b_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1b_ULT_done
.Lmov_full_1b_ULT_true:
    fm_emit_char 'B'
.Lmov_full_1b_ULT_done:
    bruge8 .Lmov_full_1b_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1b_UGE_done
.Lmov_full_1b_UGE_true:
    fm_emit_char 'B'
.Lmov_full_1b_UGE_done:
    brslt8 .Lmov_full_1b_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1b_SLT_done
.Lmov_full_1b_SLT_true:
    fm_emit_char 'B'
.Lmov_full_1b_SLT_done:
    brsge8 .Lmov_full_1b_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1b_SGE_done
.Lmov_full_1b_SGE_true:
    fm_emit_char 'B'
.Lmov_full_1b_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x1C: mov r3,r4; guard r7.
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xaa63
    push16 r4
    pop16 r7
    pop16 r4
    pop16 r3
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r3, r4
    push16 r7
    push16 r4
    push16 r3
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_1c_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1c_EQ_done
.Lmov_full_1c_EQ_true:
    fm_emit_char 'B'
.Lmov_full_1c_EQ_done:
    brne8 .Lmov_full_1c_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1c_NE_done
.Lmov_full_1c_NE_true:
    fm_emit_char 'B'
.Lmov_full_1c_NE_done:
    brult8 .Lmov_full_1c_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1c_ULT_done
.Lmov_full_1c_ULT_true:
    fm_emit_char 'B'
.Lmov_full_1c_ULT_done:
    bruge8 .Lmov_full_1c_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1c_UGE_done
.Lmov_full_1c_UGE_true:
    fm_emit_char 'B'
.Lmov_full_1c_UGE_done:
    brslt8 .Lmov_full_1c_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1c_SLT_done
.Lmov_full_1c_SLT_true:
    fm_emit_char 'B'
.Lmov_full_1c_SLT_done:
    brsge8 .Lmov_full_1c_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1c_SGE_done
.Lmov_full_1c_SGE_true:
    fm_emit_char 'B'
.Lmov_full_1c_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x1D: mov r3,r5; guard r0.
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xaa8d
    push16 r4
    pop16 r0
    pop16 r5
    pop16 r3
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r3, r5
    push16 r0
    push16 r5
    push16 r3
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_1d_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1d_EQ_done
.Lmov_full_1d_EQ_true:
    fm_emit_char 'B'
.Lmov_full_1d_EQ_done:
    brne8 .Lmov_full_1d_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1d_NE_done
.Lmov_full_1d_NE_true:
    fm_emit_char 'B'
.Lmov_full_1d_NE_done:
    brult8 .Lmov_full_1d_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1d_ULT_done
.Lmov_full_1d_ULT_true:
    fm_emit_char 'B'
.Lmov_full_1d_ULT_done:
    bruge8 .Lmov_full_1d_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1d_UGE_done
.Lmov_full_1d_UGE_true:
    fm_emit_char 'B'
.Lmov_full_1d_UGE_done:
    brslt8 .Lmov_full_1d_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1d_SLT_done
.Lmov_full_1d_SLT_true:
    fm_emit_char 'B'
.Lmov_full_1d_SLT_done:
    brsge8 .Lmov_full_1d_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1d_SGE_done
.Lmov_full_1d_SGE_true:
    fm_emit_char 'B'
.Lmov_full_1d_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x1E: mov r3,r6; guard r1.
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xaabf
    push16 r4
    pop16 r1
    pop16 r6
    pop16 r3
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r3, r6
    push16 r1
    push16 r6
    push16 r3
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_1e_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1e_EQ_done
.Lmov_full_1e_EQ_true:
    fm_emit_char 'B'
.Lmov_full_1e_EQ_done:
    brne8 .Lmov_full_1e_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1e_NE_done
.Lmov_full_1e_NE_true:
    fm_emit_char 'B'
.Lmov_full_1e_NE_done:
    brult8 .Lmov_full_1e_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1e_ULT_done
.Lmov_full_1e_ULT_true:
    fm_emit_char 'B'
.Lmov_full_1e_ULT_done:
    bruge8 .Lmov_full_1e_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1e_UGE_done
.Lmov_full_1e_UGE_true:
    fm_emit_char 'B'
.Lmov_full_1e_UGE_done:
    brslt8 .Lmov_full_1e_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1e_SLT_done
.Lmov_full_1e_SLT_true:
    fm_emit_char 'B'
.Lmov_full_1e_SLT_done:
    brsge8 .Lmov_full_1e_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1e_SGE_done
.Lmov_full_1e_SGE_true:
    fm_emit_char 'B'
.Lmov_full_1e_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x1F: mov r3,r7; guard r2.
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0xfedc
    push16 r4
    ldi16 r4, 0xaaf1
    push16 r4
    pop16 r2
    pop16 r7
    pop16 r3
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r3, r7
    push16 r2
    push16 r7
    push16 r3
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_1f_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1f_EQ_done
.Lmov_full_1f_EQ_true:
    fm_emit_char 'B'
.Lmov_full_1f_EQ_done:
    brne8 .Lmov_full_1f_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1f_NE_done
.Lmov_full_1f_NE_true:
    fm_emit_char 'B'
.Lmov_full_1f_NE_done:
    brult8 .Lmov_full_1f_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1f_ULT_done
.Lmov_full_1f_ULT_true:
    fm_emit_char 'B'
.Lmov_full_1f_ULT_done:
    bruge8 .Lmov_full_1f_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1f_UGE_done
.Lmov_full_1f_UGE_true:
    fm_emit_char 'B'
.Lmov_full_1f_UGE_done:
    brslt8 .Lmov_full_1f_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1f_SLT_done
.Lmov_full_1f_SLT_true:
    fm_emit_char 'B'
.Lmov_full_1f_SLT_done:
    brsge8 .Lmov_full_1f_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_1f_SGE_done
.Lmov_full_1f_SGE_true:
    fm_emit_char 'B'
.Lmov_full_1f_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x20: mov r4,r0; guard r3.
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xab23
    push16 r4
    pop16 r3
    pop16 r0
    pop16 r4
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r4, r0
    push16 r3
    push16 r0
    push16 r4
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_20_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_20_EQ_done
.Lmov_full_20_EQ_true:
    fm_emit_char 'B'
.Lmov_full_20_EQ_done:
    brne8 .Lmov_full_20_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_20_NE_done
.Lmov_full_20_NE_true:
    fm_emit_char 'B'
.Lmov_full_20_NE_done:
    brult8 .Lmov_full_20_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_20_ULT_done
.Lmov_full_20_ULT_true:
    fm_emit_char 'B'
.Lmov_full_20_ULT_done:
    bruge8 .Lmov_full_20_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_20_UGE_done
.Lmov_full_20_UGE_true:
    fm_emit_char 'B'
.Lmov_full_20_UGE_done:
    brslt8 .Lmov_full_20_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_20_SLT_done
.Lmov_full_20_SLT_true:
    fm_emit_char 'B'
.Lmov_full_20_SLT_done:
    brsge8 .Lmov_full_20_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_20_SGE_done
.Lmov_full_20_SGE_true:
    fm_emit_char 'B'
.Lmov_full_20_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x21: mov r4,r1; guard r5.
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xab56
    push16 r4
    pop16 r5
    pop16 r1
    pop16 r4
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r4, r1
    push16 r5
    push16 r1
    push16 r4
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_21_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_21_EQ_done
.Lmov_full_21_EQ_true:
    fm_emit_char 'B'
.Lmov_full_21_EQ_done:
    brne8 .Lmov_full_21_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_21_NE_done
.Lmov_full_21_NE_true:
    fm_emit_char 'B'
.Lmov_full_21_NE_done:
    brult8 .Lmov_full_21_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_21_ULT_done
.Lmov_full_21_ULT_true:
    fm_emit_char 'B'
.Lmov_full_21_ULT_done:
    bruge8 .Lmov_full_21_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_21_UGE_done
.Lmov_full_21_UGE_true:
    fm_emit_char 'B'
.Lmov_full_21_UGE_done:
    brslt8 .Lmov_full_21_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_21_SLT_done
.Lmov_full_21_SLT_true:
    fm_emit_char 'B'
.Lmov_full_21_SLT_done:
    brsge8 .Lmov_full_21_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_21_SGE_done
.Lmov_full_21_SGE_true:
    fm_emit_char 'B'
.Lmov_full_21_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x22: mov r4,r2; guard r5.
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xab87
    push16 r4
    pop16 r5
    pop16 r2
    pop16 r4
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r4, r2
    push16 r5
    push16 r2
    push16 r4
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_22_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_22_EQ_done
.Lmov_full_22_EQ_true:
    fm_emit_char 'B'
.Lmov_full_22_EQ_done:
    brne8 .Lmov_full_22_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_22_NE_done
.Lmov_full_22_NE_true:
    fm_emit_char 'B'
.Lmov_full_22_NE_done:
    brult8 .Lmov_full_22_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_22_ULT_done
.Lmov_full_22_ULT_true:
    fm_emit_char 'B'
.Lmov_full_22_ULT_done:
    bruge8 .Lmov_full_22_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_22_UGE_done
.Lmov_full_22_UGE_true:
    fm_emit_char 'B'
.Lmov_full_22_UGE_done:
    brslt8 .Lmov_full_22_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_22_SLT_done
.Lmov_full_22_SLT_true:
    fm_emit_char 'B'
.Lmov_full_22_SLT_done:
    brsge8 .Lmov_full_22_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_22_SGE_done
.Lmov_full_22_SGE_true:
    fm_emit_char 'B'
.Lmov_full_22_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x23: mov r4,r3; guard r6.
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0xabb9
    push16 r4
    pop16 r6
    pop16 r3
    pop16 r4
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r4, r3
    push16 r6
    push16 r3
    push16 r4
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_23_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_23_EQ_done
.Lmov_full_23_EQ_true:
    fm_emit_char 'B'
.Lmov_full_23_EQ_done:
    brne8 .Lmov_full_23_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_23_NE_done
.Lmov_full_23_NE_true:
    fm_emit_char 'B'
.Lmov_full_23_NE_done:
    brult8 .Lmov_full_23_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_23_ULT_done
.Lmov_full_23_ULT_true:
    fm_emit_char 'B'
.Lmov_full_23_ULT_done:
    bruge8 .Lmov_full_23_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_23_UGE_done
.Lmov_full_23_UGE_true:
    fm_emit_char 'B'
.Lmov_full_23_UGE_done:
    brslt8 .Lmov_full_23_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_23_SLT_done
.Lmov_full_23_SLT_true:
    fm_emit_char 'B'
.Lmov_full_23_SLT_done:
    brsge8 .Lmov_full_23_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_23_SGE_done
.Lmov_full_23_SGE_true:
    fm_emit_char 'B'
.Lmov_full_23_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x24: mov r5,r0; guard r7.
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xabeb
    push16 r4
    pop16 r7
    pop16 r0
    pop16 r5
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r5, r0
    push16 r7
    push16 r0
    push16 r5
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_24_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_24_EQ_done
.Lmov_full_24_EQ_true:
    fm_emit_char 'B'
.Lmov_full_24_EQ_done:
    brne8 .Lmov_full_24_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_24_NE_done
.Lmov_full_24_NE_true:
    fm_emit_char 'B'
.Lmov_full_24_NE_done:
    brult8 .Lmov_full_24_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_24_ULT_done
.Lmov_full_24_ULT_true:
    fm_emit_char 'B'
.Lmov_full_24_ULT_done:
    bruge8 .Lmov_full_24_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_24_UGE_done
.Lmov_full_24_UGE_true:
    fm_emit_char 'B'
.Lmov_full_24_UGE_done:
    brslt8 .Lmov_full_24_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_24_SLT_done
.Lmov_full_24_SLT_true:
    fm_emit_char 'B'
.Lmov_full_24_SLT_done:
    brsge8 .Lmov_full_24_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_24_SGE_done
.Lmov_full_24_SGE_true:
    fm_emit_char 'B'
.Lmov_full_24_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x25: mov r5,r1; guard r0.
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xac15
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r5
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r5, r1
    push16 r0
    push16 r1
    push16 r5
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_25_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_25_EQ_done
.Lmov_full_25_EQ_true:
    fm_emit_char 'B'
.Lmov_full_25_EQ_done:
    brne8 .Lmov_full_25_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_25_NE_done
.Lmov_full_25_NE_true:
    fm_emit_char 'B'
.Lmov_full_25_NE_done:
    brult8 .Lmov_full_25_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_25_ULT_done
.Lmov_full_25_ULT_true:
    fm_emit_char 'B'
.Lmov_full_25_ULT_done:
    bruge8 .Lmov_full_25_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_25_UGE_done
.Lmov_full_25_UGE_true:
    fm_emit_char 'B'
.Lmov_full_25_UGE_done:
    brslt8 .Lmov_full_25_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_25_SLT_done
.Lmov_full_25_SLT_true:
    fm_emit_char 'B'
.Lmov_full_25_SLT_done:
    brsge8 .Lmov_full_25_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_25_SGE_done
.Lmov_full_25_SGE_true:
    fm_emit_char 'B'
.Lmov_full_25_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x26: mov r5,r2; guard r1.
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xac47
    push16 r4
    pop16 r1
    pop16 r2
    pop16 r5
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r5, r2
    push16 r1
    push16 r2
    push16 r5
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_26_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_26_EQ_done
.Lmov_full_26_EQ_true:
    fm_emit_char 'B'
.Lmov_full_26_EQ_done:
    brne8 .Lmov_full_26_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_26_NE_done
.Lmov_full_26_NE_true:
    fm_emit_char 'B'
.Lmov_full_26_NE_done:
    brult8 .Lmov_full_26_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_26_ULT_done
.Lmov_full_26_ULT_true:
    fm_emit_char 'B'
.Lmov_full_26_ULT_done:
    bruge8 .Lmov_full_26_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_26_UGE_done
.Lmov_full_26_UGE_true:
    fm_emit_char 'B'
.Lmov_full_26_UGE_done:
    brslt8 .Lmov_full_26_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_26_SLT_done
.Lmov_full_26_SLT_true:
    fm_emit_char 'B'
.Lmov_full_26_SLT_done:
    brsge8 .Lmov_full_26_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_26_SGE_done
.Lmov_full_26_SGE_true:
    fm_emit_char 'B'
.Lmov_full_26_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x27: mov r5,r3; guard r2.
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0xfedc
    push16 r4
    ldi16 r4, 0xac79
    push16 r4
    pop16 r2
    pop16 r3
    pop16 r5
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r5, r3
    push16 r2
    push16 r3
    push16 r5
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_27_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_27_EQ_done
.Lmov_full_27_EQ_true:
    fm_emit_char 'B'
.Lmov_full_27_EQ_done:
    brne8 .Lmov_full_27_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_27_NE_done
.Lmov_full_27_NE_true:
    fm_emit_char 'B'
.Lmov_full_27_NE_done:
    brult8 .Lmov_full_27_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_27_ULT_done
.Lmov_full_27_ULT_true:
    fm_emit_char 'B'
.Lmov_full_27_ULT_done:
    bruge8 .Lmov_full_27_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_27_UGE_done
.Lmov_full_27_UGE_true:
    fm_emit_char 'B'
.Lmov_full_27_UGE_done:
    brslt8 .Lmov_full_27_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_27_SLT_done
.Lmov_full_27_SLT_true:
    fm_emit_char 'B'
.Lmov_full_27_SLT_done:
    brsge8 .Lmov_full_27_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_27_SGE_done
.Lmov_full_27_SGE_true:
    fm_emit_char 'B'
.Lmov_full_27_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x28: mov r6,r0; guard r3.
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xacab
    push16 r4
    pop16 r3
    pop16 r0
    pop16 r6
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r6, r0
    push16 r3
    push16 r0
    push16 r6
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_28_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_28_EQ_done
.Lmov_full_28_EQ_true:
    fm_emit_char 'B'
.Lmov_full_28_EQ_done:
    brne8 .Lmov_full_28_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_28_NE_done
.Lmov_full_28_NE_true:
    fm_emit_char 'B'
.Lmov_full_28_NE_done:
    brult8 .Lmov_full_28_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_28_ULT_done
.Lmov_full_28_ULT_true:
    fm_emit_char 'B'
.Lmov_full_28_ULT_done:
    bruge8 .Lmov_full_28_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_28_UGE_done
.Lmov_full_28_UGE_true:
    fm_emit_char 'B'
.Lmov_full_28_UGE_done:
    brslt8 .Lmov_full_28_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_28_SLT_done
.Lmov_full_28_SLT_true:
    fm_emit_char 'B'
.Lmov_full_28_SLT_done:
    brsge8 .Lmov_full_28_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_28_SGE_done
.Lmov_full_28_SGE_true:
    fm_emit_char 'B'
.Lmov_full_28_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x29: mov r6,r1; guard r4.
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xacdd
    push16 r4
    pop16 r4
    pop16 r1
    pop16 r6
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r6, r1
    push16 r4
    push16 r1
    push16 r6
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_29_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_29_EQ_done
.Lmov_full_29_EQ_true:
    fm_emit_char 'B'
.Lmov_full_29_EQ_done:
    brne8 .Lmov_full_29_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_29_NE_done
.Lmov_full_29_NE_true:
    fm_emit_char 'B'
.Lmov_full_29_NE_done:
    brult8 .Lmov_full_29_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_29_ULT_done
.Lmov_full_29_ULT_true:
    fm_emit_char 'B'
.Lmov_full_29_ULT_done:
    bruge8 .Lmov_full_29_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_29_UGE_done
.Lmov_full_29_UGE_true:
    fm_emit_char 'B'
.Lmov_full_29_UGE_done:
    brslt8 .Lmov_full_29_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_29_SLT_done
.Lmov_full_29_SLT_true:
    fm_emit_char 'B'
.Lmov_full_29_SLT_done:
    brsge8 .Lmov_full_29_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_29_SGE_done
.Lmov_full_29_SGE_true:
    fm_emit_char 'B'
.Lmov_full_29_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x2A: mov r6,r2; guard r5.
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xad0f
    push16 r4
    pop16 r5
    pop16 r2
    pop16 r6
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r6, r2
    push16 r5
    push16 r2
    push16 r6
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_2a_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2a_EQ_done
.Lmov_full_2a_EQ_true:
    fm_emit_char 'B'
.Lmov_full_2a_EQ_done:
    brne8 .Lmov_full_2a_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2a_NE_done
.Lmov_full_2a_NE_true:
    fm_emit_char 'B'
.Lmov_full_2a_NE_done:
    brult8 .Lmov_full_2a_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2a_ULT_done
.Lmov_full_2a_ULT_true:
    fm_emit_char 'B'
.Lmov_full_2a_ULT_done:
    bruge8 .Lmov_full_2a_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2a_UGE_done
.Lmov_full_2a_UGE_true:
    fm_emit_char 'B'
.Lmov_full_2a_UGE_done:
    brslt8 .Lmov_full_2a_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2a_SLT_done
.Lmov_full_2a_SLT_true:
    fm_emit_char 'B'
.Lmov_full_2a_SLT_done:
    brsge8 .Lmov_full_2a_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2a_SGE_done
.Lmov_full_2a_SGE_true:
    fm_emit_char 'B'
.Lmov_full_2a_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x2B: mov r6,r3; guard r7.
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0xad42
    push16 r4
    pop16 r7
    pop16 r3
    pop16 r6
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r6, r3
    push16 r7
    push16 r3
    push16 r6
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_2b_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2b_EQ_done
.Lmov_full_2b_EQ_true:
    fm_emit_char 'B'
.Lmov_full_2b_EQ_done:
    brne8 .Lmov_full_2b_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2b_NE_done
.Lmov_full_2b_NE_true:
    fm_emit_char 'B'
.Lmov_full_2b_NE_done:
    brult8 .Lmov_full_2b_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2b_ULT_done
.Lmov_full_2b_ULT_true:
    fm_emit_char 'B'
.Lmov_full_2b_ULT_done:
    bruge8 .Lmov_full_2b_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2b_UGE_done
.Lmov_full_2b_UGE_true:
    fm_emit_char 'B'
.Lmov_full_2b_UGE_done:
    brslt8 .Lmov_full_2b_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2b_SLT_done
.Lmov_full_2b_SLT_true:
    fm_emit_char 'B'
.Lmov_full_2b_SLT_done:
    brsge8 .Lmov_full_2b_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2b_SGE_done
.Lmov_full_2b_SGE_true:
    fm_emit_char 'B'
.Lmov_full_2b_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x2C: mov r7,r0; guard r1.
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xad6d
    push16 r4
    pop16 r1
    pop16 r0
    pop16 r7
    push16 r6
    push16 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r7, r0
    push16 r1
    push16 r0
    push16 r7
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_2c_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2c_EQ_done
.Lmov_full_2c_EQ_true:
    fm_emit_char 'B'
.Lmov_full_2c_EQ_done:
    brne8 .Lmov_full_2c_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2c_NE_done
.Lmov_full_2c_NE_true:
    fm_emit_char 'B'
.Lmov_full_2c_NE_done:
    brult8 .Lmov_full_2c_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2c_ULT_done
.Lmov_full_2c_ULT_true:
    fm_emit_char 'B'
.Lmov_full_2c_ULT_done:
    bruge8 .Lmov_full_2c_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2c_UGE_done
.Lmov_full_2c_UGE_true:
    fm_emit_char 'B'
.Lmov_full_2c_UGE_done:
    brslt8 .Lmov_full_2c_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2c_SLT_done
.Lmov_full_2c_SLT_true:
    fm_emit_char 'B'
.Lmov_full_2c_SLT_done:
    brsge8 .Lmov_full_2c_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2c_SGE_done
.Lmov_full_2c_SGE_true:
    fm_emit_char 'B'
.Lmov_full_2c_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x2D: mov r7,r1; guard r0.
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xad9d
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r7
    push16 r6
    push16 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r7, r1
    push16 r0
    push16 r1
    push16 r7
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_2d_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2d_EQ_done
.Lmov_full_2d_EQ_true:
    fm_emit_char 'B'
.Lmov_full_2d_EQ_done:
    brne8 .Lmov_full_2d_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2d_NE_done
.Lmov_full_2d_NE_true:
    fm_emit_char 'B'
.Lmov_full_2d_NE_done:
    brult8 .Lmov_full_2d_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2d_ULT_done
.Lmov_full_2d_ULT_true:
    fm_emit_char 'B'
.Lmov_full_2d_ULT_done:
    bruge8 .Lmov_full_2d_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2d_UGE_done
.Lmov_full_2d_UGE_true:
    fm_emit_char 'B'
.Lmov_full_2d_UGE_done:
    brslt8 .Lmov_full_2d_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2d_SLT_done
.Lmov_full_2d_SLT_true:
    fm_emit_char 'B'
.Lmov_full_2d_SLT_done:
    brsge8 .Lmov_full_2d_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2d_SGE_done
.Lmov_full_2d_SGE_true:
    fm_emit_char 'B'
.Lmov_full_2d_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x2E: mov r7,r2; guard r1.
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xadcf
    push16 r4
    pop16 r1
    pop16 r2
    pop16 r7
    push16 r6
    push16 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r7, r2
    push16 r1
    push16 r2
    push16 r7
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_2e_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2e_EQ_done
.Lmov_full_2e_EQ_true:
    fm_emit_char 'B'
.Lmov_full_2e_EQ_done:
    brne8 .Lmov_full_2e_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2e_NE_done
.Lmov_full_2e_NE_true:
    fm_emit_char 'B'
.Lmov_full_2e_NE_done:
    brult8 .Lmov_full_2e_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2e_ULT_done
.Lmov_full_2e_ULT_true:
    fm_emit_char 'B'
.Lmov_full_2e_ULT_done:
    bruge8 .Lmov_full_2e_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2e_UGE_done
.Lmov_full_2e_UGE_true:
    fm_emit_char 'B'
.Lmov_full_2e_UGE_done:
    brslt8 .Lmov_full_2e_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2e_SLT_done
.Lmov_full_2e_SLT_true:
    fm_emit_char 'B'
.Lmov_full_2e_SLT_done:
    brsge8 .Lmov_full_2e_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2e_SGE_done
.Lmov_full_2e_SGE_true:
    fm_emit_char 'B'
.Lmov_full_2e_SGE_done:
    fm_emit_char '\n'

    ; Matrix index 0x2F: mov r7,r3; guard r2.
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0xfedc
    push16 r4
    ldi16 r4, 0xae01
    push16 r4
    pop16 r2
    pop16 r3
    pop16 r7
    push16 r6
    push16 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    pop16 r7
    pop16 r6
    mov r7, r3
    push16 r2
    push16 r3
    push16 r7
    fm_print_stack_word
    fm_print_stack_word
    fm_print_stack_word
    breq8 .Lmov_full_2f_EQ_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2f_EQ_done
.Lmov_full_2f_EQ_true:
    fm_emit_char 'B'
.Lmov_full_2f_EQ_done:
    brne8 .Lmov_full_2f_NE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2f_NE_done
.Lmov_full_2f_NE_true:
    fm_emit_char 'B'
.Lmov_full_2f_NE_done:
    brult8 .Lmov_full_2f_ULT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2f_ULT_done
.Lmov_full_2f_ULT_true:
    fm_emit_char 'B'
.Lmov_full_2f_ULT_done:
    bruge8 .Lmov_full_2f_UGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2f_UGE_done
.Lmov_full_2f_UGE_true:
    fm_emit_char 'B'
.Lmov_full_2f_UGE_done:
    brslt8 .Lmov_full_2f_SLT_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2f_SLT_done
.Lmov_full_2f_SLT_true:
    fm_emit_char 'B'
.Lmov_full_2f_SLT_done:
    brsge8 .Lmov_full_2f_SGE_true
    fm_emit_char 'A'
    jmp8 .Lmov_full_2f_SGE_done
.Lmov_full_2f_SGE_true:
    fm_emit_char 'B'
.Lmov_full_2f_SGE_done:
    fm_emit_char '\n'

    sys debug_break
