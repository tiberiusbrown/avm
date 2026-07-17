.include "include/unary_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; Register r0, pattern 0: sext8 r0
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x0000
    push16 r4
    pop16 r0
    ldi16 c0, 0xb101
    push16 r4
    pop16 r1
    sext8 r0
    push16 r1
    push16 r0
    unary_print_target_guard
    breq8 .Lsext8_00_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_00_EQ_done
.Lsext8_00_EQ_true:
    unary_emit_char 'B'
.Lsext8_00_EQ_done:
    brne8 .Lsext8_00_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_00_NE_done
.Lsext8_00_NE_true:
    unary_emit_char 'B'
.Lsext8_00_NE_done:
    brult8 .Lsext8_00_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_00_ULT_done
.Lsext8_00_ULT_true:
    unary_emit_char 'B'
.Lsext8_00_ULT_done:
    bruge8 .Lsext8_00_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_00_UGE_done
.Lsext8_00_UGE_true:
    unary_emit_char 'B'
.Lsext8_00_UGE_done:
    brslt8 .Lsext8_00_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_00_SLT_done
.Lsext8_00_SLT_true:
    unary_emit_char 'B'
.Lsext8_00_SLT_done:
    brsge8 .Lsext8_00_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_00_SGE_done
.Lsext8_00_SGE_true:
    unary_emit_char 'B'
.Lsext8_00_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 1: sext8 r0
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x0001
    push16 r4
    pop16 r0
    ldi16 c0, 0xb255
    push16 r4
    pop16 r2
    sext8 r0
    push16 r2
    push16 r0
    unary_print_target_guard
    breq8 .Lsext8_01_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_01_EQ_done
.Lsext8_01_EQ_true:
    unary_emit_char 'B'
.Lsext8_01_EQ_done:
    brne8 .Lsext8_01_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_01_NE_done
.Lsext8_01_NE_true:
    unary_emit_char 'B'
.Lsext8_01_NE_done:
    brult8 .Lsext8_01_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_01_ULT_done
.Lsext8_01_ULT_true:
    unary_emit_char 'B'
.Lsext8_01_ULT_done:
    bruge8 .Lsext8_01_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_01_UGE_done
.Lsext8_01_UGE_true:
    unary_emit_char 'B'
.Lsext8_01_UGE_done:
    brslt8 .Lsext8_01_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_01_SLT_done
.Lsext8_01_SLT_true:
    unary_emit_char 'B'
.Lsext8_01_SLT_done:
    brsge8 .Lsext8_01_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_01_SGE_done
.Lsext8_01_SGE_true:
    unary_emit_char 'B'
.Lsext8_01_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 2: sext8 r0
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x007f
    push16 r4
    pop16 r0
    ldi16 c0, 0xb3a9
    push16 r4
    pop16 r3
    sext8 r0
    push16 r3
    push16 r0
    unary_print_target_guard
    breq8 .Lsext8_02_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_02_EQ_done
.Lsext8_02_EQ_true:
    unary_emit_char 'B'
.Lsext8_02_EQ_done:
    brne8 .Lsext8_02_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_02_NE_done
.Lsext8_02_NE_true:
    unary_emit_char 'B'
.Lsext8_02_NE_done:
    brult8 .Lsext8_02_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_02_ULT_done
.Lsext8_02_ULT_true:
    unary_emit_char 'B'
.Lsext8_02_ULT_done:
    bruge8 .Lsext8_02_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_02_UGE_done
.Lsext8_02_UGE_true:
    unary_emit_char 'B'
.Lsext8_02_UGE_done:
    brslt8 .Lsext8_02_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_02_SLT_done
.Lsext8_02_SLT_true:
    unary_emit_char 'B'
.Lsext8_02_SLT_done:
    brsge8 .Lsext8_02_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_02_SGE_done
.Lsext8_02_SGE_true:
    unary_emit_char 'B'
.Lsext8_02_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 3: sext8 r0
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0x0080
    push16 r5
    pop16 r0
    ldi16 c1, 0xb4fd
    push16 r5
    pop16 r4
    sext8 r0
    push16 r4
    push16 r0
    unary_print_target_guard
    breq8 .Lsext8_03_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_03_EQ_done
.Lsext8_03_EQ_true:
    unary_emit_char 'B'
.Lsext8_03_EQ_done:
    brne8 .Lsext8_03_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_03_NE_done
.Lsext8_03_NE_true:
    unary_emit_char 'B'
.Lsext8_03_NE_done:
    brult8 .Lsext8_03_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_03_ULT_done
.Lsext8_03_ULT_true:
    unary_emit_char 'B'
.Lsext8_03_ULT_done:
    bruge8 .Lsext8_03_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_03_UGE_done
.Lsext8_03_UGE_true:
    unary_emit_char 'B'
.Lsext8_03_UGE_done:
    brslt8 .Lsext8_03_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_03_SLT_done
.Lsext8_03_SLT_true:
    unary_emit_char 'B'
.Lsext8_03_SLT_done:
    brsge8 .Lsext8_03_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_03_SGE_done
.Lsext8_03_SGE_true:
    unary_emit_char 'B'
.Lsext8_03_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 4: sext8 r0
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x00ff
    push16 r4
    pop16 r0
    ldi16 c0, 0xb651
    push16 r4
    pop16 r5
    sext8 r0
    push16 r5
    push16 r0
    unary_print_target_guard
    breq8 .Lsext8_04_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_04_EQ_done
.Lsext8_04_EQ_true:
    unary_emit_char 'B'
.Lsext8_04_EQ_done:
    brne8 .Lsext8_04_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_04_NE_done
.Lsext8_04_NE_true:
    unary_emit_char 'B'
.Lsext8_04_NE_done:
    brult8 .Lsext8_04_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_04_ULT_done
.Lsext8_04_ULT_true:
    unary_emit_char 'B'
.Lsext8_04_ULT_done:
    bruge8 .Lsext8_04_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_04_UGE_done
.Lsext8_04_UGE_true:
    unary_emit_char 'B'
.Lsext8_04_UGE_done:
    brslt8 .Lsext8_04_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_04_SLT_done
.Lsext8_04_SLT_true:
    unary_emit_char 'B'
.Lsext8_04_SLT_done:
    brsge8 .Lsext8_04_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_04_SGE_done
.Lsext8_04_SGE_true:
    unary_emit_char 'B'
.Lsext8_04_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 5: sext8 r0
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x0100
    push16 r4
    pop16 r0
    ldi16 c0, 0xb7a5
    push16 r4
    pop16 r6
    sext8 r0
    push16 r6
    push16 r0
    unary_print_target_guard
    breq8 .Lsext8_05_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_05_EQ_done
.Lsext8_05_EQ_true:
    unary_emit_char 'B'
.Lsext8_05_EQ_done:
    brne8 .Lsext8_05_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_05_NE_done
.Lsext8_05_NE_true:
    unary_emit_char 'B'
.Lsext8_05_NE_done:
    brult8 .Lsext8_05_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_05_ULT_done
.Lsext8_05_ULT_true:
    unary_emit_char 'B'
.Lsext8_05_ULT_done:
    bruge8 .Lsext8_05_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_05_UGE_done
.Lsext8_05_UGE_true:
    unary_emit_char 'B'
.Lsext8_05_UGE_done:
    brslt8 .Lsext8_05_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_05_SLT_done
.Lsext8_05_SLT_true:
    unary_emit_char 'B'
.Lsext8_05_SLT_done:
    brsge8 .Lsext8_05_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_05_SGE_done
.Lsext8_05_SGE_true:
    unary_emit_char 'B'
.Lsext8_05_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 6: sext8 r0
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x7fff
    push16 r4
    pop16 r0
    ldi16 c0, 0xb8f9
    push16 r4
    pop16 r7
    sext8 r0
    push16 r7
    push16 r0
    unary_print_target_guard
    breq8 .Lsext8_06_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_06_EQ_done
.Lsext8_06_EQ_true:
    unary_emit_char 'B'
.Lsext8_06_EQ_done:
    brne8 .Lsext8_06_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_06_NE_done
.Lsext8_06_NE_true:
    unary_emit_char 'B'
.Lsext8_06_NE_done:
    brult8 .Lsext8_06_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_06_ULT_done
.Lsext8_06_ULT_true:
    unary_emit_char 'B'
.Lsext8_06_ULT_done:
    bruge8 .Lsext8_06_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_06_UGE_done
.Lsext8_06_UGE_true:
    unary_emit_char 'B'
.Lsext8_06_UGE_done:
    brslt8 .Lsext8_06_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_06_SLT_done
.Lsext8_06_SLT_true:
    unary_emit_char 'B'
.Lsext8_06_SLT_done:
    brsge8 .Lsext8_06_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_06_SGE_done
.Lsext8_06_SGE_true:
    unary_emit_char 'B'
.Lsext8_06_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 7: sext8 r0
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x8000
    push16 r4
    pop16 r0
    ldi16 c0, 0xb346
    push16 r4
    pop16 r1
    sext8 r0
    push16 r1
    push16 r0
    unary_print_target_guard
    breq8 .Lsext8_07_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_07_EQ_done
.Lsext8_07_EQ_true:
    unary_emit_char 'B'
.Lsext8_07_EQ_done:
    brne8 .Lsext8_07_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_07_NE_done
.Lsext8_07_NE_true:
    unary_emit_char 'B'
.Lsext8_07_NE_done:
    brult8 .Lsext8_07_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_07_ULT_done
.Lsext8_07_ULT_true:
    unary_emit_char 'B'
.Lsext8_07_ULT_done:
    bruge8 .Lsext8_07_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_07_UGE_done
.Lsext8_07_UGE_true:
    unary_emit_char 'B'
.Lsext8_07_UGE_done:
    brslt8 .Lsext8_07_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_07_SLT_done
.Lsext8_07_SLT_true:
    unary_emit_char 'B'
.Lsext8_07_SLT_done:
    brsge8 .Lsext8_07_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_07_SGE_done
.Lsext8_07_SGE_true:
    unary_emit_char 'B'
.Lsext8_07_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 0: sext8 r1
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x0080
    push16 r4
    pop16 r1
    ldi16 c0, 0xb49a
    push16 r4
    pop16 r2
    sext8 r1
    push16 r2
    push16 r1
    unary_print_target_guard
    breq8 .Lsext8_08_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_08_EQ_done
.Lsext8_08_EQ_true:
    unary_emit_char 'B'
.Lsext8_08_EQ_done:
    brne8 .Lsext8_08_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_08_NE_done
.Lsext8_08_NE_true:
    unary_emit_char 'B'
.Lsext8_08_NE_done:
    brult8 .Lsext8_08_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_08_ULT_done
.Lsext8_08_ULT_true:
    unary_emit_char 'B'
.Lsext8_08_ULT_done:
    bruge8 .Lsext8_08_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_08_UGE_done
.Lsext8_08_UGE_true:
    unary_emit_char 'B'
.Lsext8_08_UGE_done:
    brslt8 .Lsext8_08_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_08_SLT_done
.Lsext8_08_SLT_true:
    unary_emit_char 'B'
.Lsext8_08_SLT_done:
    brsge8 .Lsext8_08_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_08_SGE_done
.Lsext8_08_SGE_true:
    unary_emit_char 'B'
.Lsext8_08_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 1: sext8 r1
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x00ff
    push16 r4
    pop16 r1
    ldi16 c0, 0xb5ee
    push16 r4
    pop16 r3
    sext8 r1
    push16 r3
    push16 r1
    unary_print_target_guard
    breq8 .Lsext8_09_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_09_EQ_done
.Lsext8_09_EQ_true:
    unary_emit_char 'B'
.Lsext8_09_EQ_done:
    brne8 .Lsext8_09_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_09_NE_done
.Lsext8_09_NE_true:
    unary_emit_char 'B'
.Lsext8_09_NE_done:
    brult8 .Lsext8_09_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_09_ULT_done
.Lsext8_09_ULT_true:
    unary_emit_char 'B'
.Lsext8_09_ULT_done:
    bruge8 .Lsext8_09_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_09_UGE_done
.Lsext8_09_UGE_true:
    unary_emit_char 'B'
.Lsext8_09_UGE_done:
    brslt8 .Lsext8_09_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_09_SLT_done
.Lsext8_09_SLT_true:
    unary_emit_char 'B'
.Lsext8_09_SLT_done:
    brsge8 .Lsext8_09_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_09_SGE_done
.Lsext8_09_SGE_true:
    unary_emit_char 'B'
.Lsext8_09_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 2: sext8 r1
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0x0100
    push16 r5
    pop16 r1
    ldi16 c1, 0xb742
    push16 r5
    pop16 r4
    sext8 r1
    push16 r4
    push16 r1
    unary_print_target_guard
    breq8 .Lsext8_0a_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0a_EQ_done
.Lsext8_0a_EQ_true:
    unary_emit_char 'B'
.Lsext8_0a_EQ_done:
    brne8 .Lsext8_0a_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0a_NE_done
.Lsext8_0a_NE_true:
    unary_emit_char 'B'
.Lsext8_0a_NE_done:
    brult8 .Lsext8_0a_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0a_ULT_done
.Lsext8_0a_ULT_true:
    unary_emit_char 'B'
.Lsext8_0a_ULT_done:
    bruge8 .Lsext8_0a_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0a_UGE_done
.Lsext8_0a_UGE_true:
    unary_emit_char 'B'
.Lsext8_0a_UGE_done:
    brslt8 .Lsext8_0a_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0a_SLT_done
.Lsext8_0a_SLT_true:
    unary_emit_char 'B'
.Lsext8_0a_SLT_done:
    brsge8 .Lsext8_0a_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0a_SGE_done
.Lsext8_0a_SGE_true:
    unary_emit_char 'B'
.Lsext8_0a_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 3: sext8 r1
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x7fff
    push16 r4
    pop16 r1
    ldi16 c0, 0xb896
    push16 r4
    pop16 r5
    sext8 r1
    push16 r5
    push16 r1
    unary_print_target_guard
    breq8 .Lsext8_0b_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0b_EQ_done
.Lsext8_0b_EQ_true:
    unary_emit_char 'B'
.Lsext8_0b_EQ_done:
    brne8 .Lsext8_0b_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0b_NE_done
.Lsext8_0b_NE_true:
    unary_emit_char 'B'
.Lsext8_0b_NE_done:
    brult8 .Lsext8_0b_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0b_ULT_done
.Lsext8_0b_ULT_true:
    unary_emit_char 'B'
.Lsext8_0b_ULT_done:
    bruge8 .Lsext8_0b_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0b_UGE_done
.Lsext8_0b_UGE_true:
    unary_emit_char 'B'
.Lsext8_0b_UGE_done:
    brslt8 .Lsext8_0b_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0b_SLT_done
.Lsext8_0b_SLT_true:
    unary_emit_char 'B'
.Lsext8_0b_SLT_done:
    brsge8 .Lsext8_0b_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0b_SGE_done
.Lsext8_0b_SGE_true:
    unary_emit_char 'B'
.Lsext8_0b_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 4: sext8 r1
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x8000
    push16 r4
    pop16 r1
    ldi16 c0, 0xb9ea
    push16 r4
    pop16 r6
    sext8 r1
    push16 r6
    push16 r1
    unary_print_target_guard
    breq8 .Lsext8_0c_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0c_EQ_done
.Lsext8_0c_EQ_true:
    unary_emit_char 'B'
.Lsext8_0c_EQ_done:
    brne8 .Lsext8_0c_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0c_NE_done
.Lsext8_0c_NE_true:
    unary_emit_char 'B'
.Lsext8_0c_NE_done:
    brult8 .Lsext8_0c_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0c_ULT_done
.Lsext8_0c_ULT_true:
    unary_emit_char 'B'
.Lsext8_0c_ULT_done:
    bruge8 .Lsext8_0c_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0c_UGE_done
.Lsext8_0c_UGE_true:
    unary_emit_char 'B'
.Lsext8_0c_UGE_done:
    brslt8 .Lsext8_0c_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0c_SLT_done
.Lsext8_0c_SLT_true:
    unary_emit_char 'B'
.Lsext8_0c_SLT_done:
    brsge8 .Lsext8_0c_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0c_SGE_done
.Lsext8_0c_SGE_true:
    unary_emit_char 'B'
.Lsext8_0c_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 5: sext8 r1
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0xffff
    push16 r4
    pop16 r1
    ldi16 c0, 0xbb3e
    push16 r4
    pop16 r7
    sext8 r1
    push16 r7
    push16 r1
    unary_print_target_guard
    breq8 .Lsext8_0d_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0d_EQ_done
.Lsext8_0d_EQ_true:
    unary_emit_char 'B'
.Lsext8_0d_EQ_done:
    brne8 .Lsext8_0d_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0d_NE_done
.Lsext8_0d_NE_true:
    unary_emit_char 'B'
.Lsext8_0d_NE_done:
    brult8 .Lsext8_0d_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0d_ULT_done
.Lsext8_0d_ULT_true:
    unary_emit_char 'B'
.Lsext8_0d_ULT_done:
    bruge8 .Lsext8_0d_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0d_UGE_done
.Lsext8_0d_UGE_true:
    unary_emit_char 'B'
.Lsext8_0d_UGE_done:
    brslt8 .Lsext8_0d_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0d_SLT_done
.Lsext8_0d_SLT_true:
    unary_emit_char 'B'
.Lsext8_0d_SLT_done:
    brsge8 .Lsext8_0d_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0d_SGE_done
.Lsext8_0d_SGE_true:
    unary_emit_char 'B'
.Lsext8_0d_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 6: sext8 r1
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xa55a
    push16 r4
    pop16 r1
    ldi16 c0, 0xb48a
    push16 r4
    pop16 r0
    sext8 r1
    push16 r0
    push16 r1
    unary_print_target_guard
    breq8 .Lsext8_0e_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0e_EQ_done
.Lsext8_0e_EQ_true:
    unary_emit_char 'B'
.Lsext8_0e_EQ_done:
    brne8 .Lsext8_0e_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0e_NE_done
.Lsext8_0e_NE_true:
    unary_emit_char 'B'
.Lsext8_0e_NE_done:
    brult8 .Lsext8_0e_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0e_ULT_done
.Lsext8_0e_ULT_true:
    unary_emit_char 'B'
.Lsext8_0e_ULT_done:
    bruge8 .Lsext8_0e_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0e_UGE_done
.Lsext8_0e_UGE_true:
    unary_emit_char 'B'
.Lsext8_0e_UGE_done:
    brslt8 .Lsext8_0e_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0e_SLT_done
.Lsext8_0e_SLT_true:
    unary_emit_char 'B'
.Lsext8_0e_SLT_done:
    brsge8 .Lsext8_0e_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0e_SGE_done
.Lsext8_0e_SGE_true:
    unary_emit_char 'B'
.Lsext8_0e_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 7: sext8 r1
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x55aa
    push16 r4
    pop16 r1
    ldi16 c0, 0xb6df
    push16 r4
    pop16 r2
    sext8 r1
    push16 r2
    push16 r1
    unary_print_target_guard
    breq8 .Lsext8_0f_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0f_EQ_done
.Lsext8_0f_EQ_true:
    unary_emit_char 'B'
.Lsext8_0f_EQ_done:
    brne8 .Lsext8_0f_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0f_NE_done
.Lsext8_0f_NE_true:
    unary_emit_char 'B'
.Lsext8_0f_NE_done:
    brult8 .Lsext8_0f_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0f_ULT_done
.Lsext8_0f_ULT_true:
    unary_emit_char 'B'
.Lsext8_0f_ULT_done:
    bruge8 .Lsext8_0f_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0f_UGE_done
.Lsext8_0f_UGE_true:
    unary_emit_char 'B'
.Lsext8_0f_UGE_done:
    brslt8 .Lsext8_0f_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0f_SLT_done
.Lsext8_0f_SLT_true:
    unary_emit_char 'B'
.Lsext8_0f_SLT_done:
    brsge8 .Lsext8_0f_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_0f_SGE_done
.Lsext8_0f_SGE_true:
    unary_emit_char 'B'
.Lsext8_0f_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 0: sext8 r2
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x7fff
    push16 r4
    pop16 r2
    ldi16 c0, 0xb833
    push16 r4
    pop16 r3
    sext8 r2
    push16 r3
    push16 r2
    unary_print_target_guard
    breq8 .Lsext8_10_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_10_EQ_done
.Lsext8_10_EQ_true:
    unary_emit_char 'B'
.Lsext8_10_EQ_done:
    brne8 .Lsext8_10_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_10_NE_done
.Lsext8_10_NE_true:
    unary_emit_char 'B'
.Lsext8_10_NE_done:
    brult8 .Lsext8_10_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_10_ULT_done
.Lsext8_10_ULT_true:
    unary_emit_char 'B'
.Lsext8_10_ULT_done:
    bruge8 .Lsext8_10_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_10_UGE_done
.Lsext8_10_UGE_true:
    unary_emit_char 'B'
.Lsext8_10_UGE_done:
    brslt8 .Lsext8_10_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_10_SLT_done
.Lsext8_10_SLT_true:
    unary_emit_char 'B'
.Lsext8_10_SLT_done:
    brsge8 .Lsext8_10_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_10_SGE_done
.Lsext8_10_SGE_true:
    unary_emit_char 'B'
.Lsext8_10_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 1: sext8 r2
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0x8000
    push16 r5
    pop16 r2
    ldi16 c1, 0xb987
    push16 r5
    pop16 r4
    sext8 r2
    push16 r4
    push16 r2
    unary_print_target_guard
    breq8 .Lsext8_11_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_11_EQ_done
.Lsext8_11_EQ_true:
    unary_emit_char 'B'
.Lsext8_11_EQ_done:
    brne8 .Lsext8_11_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_11_NE_done
.Lsext8_11_NE_true:
    unary_emit_char 'B'
.Lsext8_11_NE_done:
    brult8 .Lsext8_11_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_11_ULT_done
.Lsext8_11_ULT_true:
    unary_emit_char 'B'
.Lsext8_11_ULT_done:
    bruge8 .Lsext8_11_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_11_UGE_done
.Lsext8_11_UGE_true:
    unary_emit_char 'B'
.Lsext8_11_UGE_done:
    brslt8 .Lsext8_11_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_11_SLT_done
.Lsext8_11_SLT_true:
    unary_emit_char 'B'
.Lsext8_11_SLT_done:
    brsge8 .Lsext8_11_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_11_SGE_done
.Lsext8_11_SGE_true:
    unary_emit_char 'B'
.Lsext8_11_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 2: sext8 r2
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xffff
    push16 r4
    pop16 r2
    ldi16 c0, 0xbadb
    push16 r4
    pop16 r5
    sext8 r2
    push16 r5
    push16 r2
    unary_print_target_guard
    breq8 .Lsext8_12_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_12_EQ_done
.Lsext8_12_EQ_true:
    unary_emit_char 'B'
.Lsext8_12_EQ_done:
    brne8 .Lsext8_12_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_12_NE_done
.Lsext8_12_NE_true:
    unary_emit_char 'B'
.Lsext8_12_NE_done:
    brult8 .Lsext8_12_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_12_ULT_done
.Lsext8_12_ULT_true:
    unary_emit_char 'B'
.Lsext8_12_ULT_done:
    bruge8 .Lsext8_12_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_12_UGE_done
.Lsext8_12_UGE_true:
    unary_emit_char 'B'
.Lsext8_12_UGE_done:
    brslt8 .Lsext8_12_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_12_SLT_done
.Lsext8_12_SLT_true:
    unary_emit_char 'B'
.Lsext8_12_SLT_done:
    brsge8 .Lsext8_12_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_12_SGE_done
.Lsext8_12_SGE_true:
    unary_emit_char 'B'
.Lsext8_12_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 3: sext8 r2
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xa55a
    push16 r4
    pop16 r2
    ldi16 c0, 0xbc2f
    push16 r4
    pop16 r6
    sext8 r2
    push16 r6
    push16 r2
    unary_print_target_guard
    breq8 .Lsext8_13_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_13_EQ_done
.Lsext8_13_EQ_true:
    unary_emit_char 'B'
.Lsext8_13_EQ_done:
    brne8 .Lsext8_13_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_13_NE_done
.Lsext8_13_NE_true:
    unary_emit_char 'B'
.Lsext8_13_NE_done:
    brult8 .Lsext8_13_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_13_ULT_done
.Lsext8_13_ULT_true:
    unary_emit_char 'B'
.Lsext8_13_ULT_done:
    bruge8 .Lsext8_13_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_13_UGE_done
.Lsext8_13_UGE_true:
    unary_emit_char 'B'
.Lsext8_13_UGE_done:
    brslt8 .Lsext8_13_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_13_SLT_done
.Lsext8_13_SLT_true:
    unary_emit_char 'B'
.Lsext8_13_SLT_done:
    brsge8 .Lsext8_13_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_13_SGE_done
.Lsext8_13_SGE_true:
    unary_emit_char 'B'
.Lsext8_13_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 4: sext8 r2
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x55aa
    push16 r4
    pop16 r2
    ldi16 c0, 0xbd83
    push16 r4
    pop16 r7
    sext8 r2
    push16 r7
    push16 r2
    unary_print_target_guard
    breq8 .Lsext8_14_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_14_EQ_done
.Lsext8_14_EQ_true:
    unary_emit_char 'B'
.Lsext8_14_EQ_done:
    brne8 .Lsext8_14_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_14_NE_done
.Lsext8_14_NE_true:
    unary_emit_char 'B'
.Lsext8_14_NE_done:
    brult8 .Lsext8_14_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_14_ULT_done
.Lsext8_14_ULT_true:
    unary_emit_char 'B'
.Lsext8_14_ULT_done:
    bruge8 .Lsext8_14_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_14_UGE_done
.Lsext8_14_UGE_true:
    unary_emit_char 'B'
.Lsext8_14_UGE_done:
    brslt8 .Lsext8_14_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_14_SLT_done
.Lsext8_14_SLT_true:
    unary_emit_char 'B'
.Lsext8_14_SLT_done:
    brsge8 .Lsext8_14_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_14_SGE_done
.Lsext8_14_SGE_true:
    unary_emit_char 'B'
.Lsext8_14_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 5: sext8 r2
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1234
    push16 r4
    pop16 r2
    ldi16 c0, 0xb6cf
    push16 r4
    pop16 r0
    sext8 r2
    push16 r0
    push16 r2
    unary_print_target_guard
    breq8 .Lsext8_15_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_15_EQ_done
.Lsext8_15_EQ_true:
    unary_emit_char 'B'
.Lsext8_15_EQ_done:
    brne8 .Lsext8_15_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_15_NE_done
.Lsext8_15_NE_true:
    unary_emit_char 'B'
.Lsext8_15_NE_done:
    brult8 .Lsext8_15_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_15_ULT_done
.Lsext8_15_ULT_true:
    unary_emit_char 'B'
.Lsext8_15_ULT_done:
    bruge8 .Lsext8_15_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_15_UGE_done
.Lsext8_15_UGE_true:
    unary_emit_char 'B'
.Lsext8_15_UGE_done:
    brslt8 .Lsext8_15_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_15_SLT_done
.Lsext8_15_SLT_true:
    unary_emit_char 'B'
.Lsext8_15_SLT_done:
    brsge8 .Lsext8_15_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_15_SGE_done
.Lsext8_15_SGE_true:
    unary_emit_char 'B'
.Lsext8_15_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 6: sext8 r2
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xfedc
    push16 r4
    pop16 r2
    ldi16 c0, 0xb823
    push16 r4
    pop16 r1
    sext8 r2
    push16 r1
    push16 r2
    unary_print_target_guard
    breq8 .Lsext8_16_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_16_EQ_done
.Lsext8_16_EQ_true:
    unary_emit_char 'B'
.Lsext8_16_EQ_done:
    brne8 .Lsext8_16_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_16_NE_done
.Lsext8_16_NE_true:
    unary_emit_char 'B'
.Lsext8_16_NE_done:
    brult8 .Lsext8_16_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_16_ULT_done
.Lsext8_16_ULT_true:
    unary_emit_char 'B'
.Lsext8_16_ULT_done:
    bruge8 .Lsext8_16_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_16_UGE_done
.Lsext8_16_UGE_true:
    unary_emit_char 'B'
.Lsext8_16_UGE_done:
    brslt8 .Lsext8_16_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_16_SLT_done
.Lsext8_16_SLT_true:
    unary_emit_char 'B'
.Lsext8_16_SLT_done:
    brsge8 .Lsext8_16_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_16_SGE_done
.Lsext8_16_SGE_true:
    unary_emit_char 'B'
.Lsext8_16_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 7: sext8 r2
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x4000
    push16 r4
    pop16 r2
    ldi16 c0, 0xba78
    push16 r4
    pop16 r3
    sext8 r2
    push16 r3
    push16 r2
    unary_print_target_guard
    breq8 .Lsext8_17_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_17_EQ_done
.Lsext8_17_EQ_true:
    unary_emit_char 'B'
.Lsext8_17_EQ_done:
    brne8 .Lsext8_17_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_17_NE_done
.Lsext8_17_NE_true:
    unary_emit_char 'B'
.Lsext8_17_NE_done:
    brult8 .Lsext8_17_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_17_ULT_done
.Lsext8_17_ULT_true:
    unary_emit_char 'B'
.Lsext8_17_ULT_done:
    bruge8 .Lsext8_17_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_17_UGE_done
.Lsext8_17_UGE_true:
    unary_emit_char 'B'
.Lsext8_17_UGE_done:
    brslt8 .Lsext8_17_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_17_SLT_done
.Lsext8_17_SLT_true:
    unary_emit_char 'B'
.Lsext8_17_SLT_done:
    brsge8 .Lsext8_17_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_17_SGE_done
.Lsext8_17_SGE_true:
    unary_emit_char 'B'
.Lsext8_17_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 0: sext8 r3
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0xa55a
    push16 r5
    pop16 r3
    ldi16 c1, 0xbbcc
    push16 r5
    pop16 r4
    sext8 r3
    push16 r4
    push16 r3
    unary_print_target_guard
    breq8 .Lsext8_18_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_18_EQ_done
.Lsext8_18_EQ_true:
    unary_emit_char 'B'
.Lsext8_18_EQ_done:
    brne8 .Lsext8_18_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_18_NE_done
.Lsext8_18_NE_true:
    unary_emit_char 'B'
.Lsext8_18_NE_done:
    brult8 .Lsext8_18_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_18_ULT_done
.Lsext8_18_ULT_true:
    unary_emit_char 'B'
.Lsext8_18_ULT_done:
    bruge8 .Lsext8_18_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_18_UGE_done
.Lsext8_18_UGE_true:
    unary_emit_char 'B'
.Lsext8_18_UGE_done:
    brslt8 .Lsext8_18_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_18_SLT_done
.Lsext8_18_SLT_true:
    unary_emit_char 'B'
.Lsext8_18_SLT_done:
    brsge8 .Lsext8_18_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_18_SGE_done
.Lsext8_18_SGE_true:
    unary_emit_char 'B'
.Lsext8_18_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 1: sext8 r3
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x55aa
    push16 r4
    pop16 r3
    ldi16 c0, 0xbd20
    push16 r4
    pop16 r5
    sext8 r3
    push16 r5
    push16 r3
    unary_print_target_guard
    breq8 .Lsext8_19_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_19_EQ_done
.Lsext8_19_EQ_true:
    unary_emit_char 'B'
.Lsext8_19_EQ_done:
    brne8 .Lsext8_19_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_19_NE_done
.Lsext8_19_NE_true:
    unary_emit_char 'B'
.Lsext8_19_NE_done:
    brult8 .Lsext8_19_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_19_ULT_done
.Lsext8_19_ULT_true:
    unary_emit_char 'B'
.Lsext8_19_ULT_done:
    bruge8 .Lsext8_19_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_19_UGE_done
.Lsext8_19_UGE_true:
    unary_emit_char 'B'
.Lsext8_19_UGE_done:
    brslt8 .Lsext8_19_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_19_SLT_done
.Lsext8_19_SLT_true:
    unary_emit_char 'B'
.Lsext8_19_SLT_done:
    brsge8 .Lsext8_19_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_19_SGE_done
.Lsext8_19_SGE_true:
    unary_emit_char 'B'
.Lsext8_19_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 2: sext8 r3
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1234
    push16 r4
    pop16 r3
    ldi16 c0, 0xbe74
    push16 r4
    pop16 r6
    sext8 r3
    push16 r6
    push16 r3
    unary_print_target_guard
    breq8 .Lsext8_1a_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1a_EQ_done
.Lsext8_1a_EQ_true:
    unary_emit_char 'B'
.Lsext8_1a_EQ_done:
    brne8 .Lsext8_1a_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1a_NE_done
.Lsext8_1a_NE_true:
    unary_emit_char 'B'
.Lsext8_1a_NE_done:
    brult8 .Lsext8_1a_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1a_ULT_done
.Lsext8_1a_ULT_true:
    unary_emit_char 'B'
.Lsext8_1a_ULT_done:
    bruge8 .Lsext8_1a_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1a_UGE_done
.Lsext8_1a_UGE_true:
    unary_emit_char 'B'
.Lsext8_1a_UGE_done:
    brslt8 .Lsext8_1a_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1a_SLT_done
.Lsext8_1a_SLT_true:
    unary_emit_char 'B'
.Lsext8_1a_SLT_done:
    brsge8 .Lsext8_1a_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1a_SGE_done
.Lsext8_1a_SGE_true:
    unary_emit_char 'B'
.Lsext8_1a_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 3: sext8 r3
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0xfedc
    push16 r4
    pop16 r3
    ldi16 c0, 0xbfc8
    push16 r4
    pop16 r7
    sext8 r3
    push16 r7
    push16 r3
    unary_print_target_guard
    breq8 .Lsext8_1b_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1b_EQ_done
.Lsext8_1b_EQ_true:
    unary_emit_char 'B'
.Lsext8_1b_EQ_done:
    brne8 .Lsext8_1b_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1b_NE_done
.Lsext8_1b_NE_true:
    unary_emit_char 'B'
.Lsext8_1b_NE_done:
    brult8 .Lsext8_1b_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1b_ULT_done
.Lsext8_1b_ULT_true:
    unary_emit_char 'B'
.Lsext8_1b_ULT_done:
    bruge8 .Lsext8_1b_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1b_UGE_done
.Lsext8_1b_UGE_true:
    unary_emit_char 'B'
.Lsext8_1b_UGE_done:
    brslt8 .Lsext8_1b_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1b_SLT_done
.Lsext8_1b_SLT_true:
    unary_emit_char 'B'
.Lsext8_1b_SLT_done:
    brsge8 .Lsext8_1b_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1b_SGE_done
.Lsext8_1b_SGE_true:
    unary_emit_char 'B'
.Lsext8_1b_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 4: sext8 r3
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x4000
    push16 r4
    pop16 r3
    ldi16 c0, 0xb914
    push16 r4
    pop16 r0
    sext8 r3
    push16 r0
    push16 r3
    unary_print_target_guard
    breq8 .Lsext8_1c_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1c_EQ_done
.Lsext8_1c_EQ_true:
    unary_emit_char 'B'
.Lsext8_1c_EQ_done:
    brne8 .Lsext8_1c_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1c_NE_done
.Lsext8_1c_NE_true:
    unary_emit_char 'B'
.Lsext8_1c_NE_done:
    brult8 .Lsext8_1c_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1c_ULT_done
.Lsext8_1c_ULT_true:
    unary_emit_char 'B'
.Lsext8_1c_ULT_done:
    bruge8 .Lsext8_1c_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1c_UGE_done
.Lsext8_1c_UGE_true:
    unary_emit_char 'B'
.Lsext8_1c_UGE_done:
    brslt8 .Lsext8_1c_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1c_SLT_done
.Lsext8_1c_SLT_true:
    unary_emit_char 'B'
.Lsext8_1c_SLT_done:
    brsge8 .Lsext8_1c_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1c_SGE_done
.Lsext8_1c_SGE_true:
    unary_emit_char 'B'
.Lsext8_1c_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 5: sext8 r3
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xc000
    push16 r4
    pop16 r3
    ldi16 c0, 0xba68
    push16 r4
    pop16 r1
    sext8 r3
    push16 r1
    push16 r3
    unary_print_target_guard
    breq8 .Lsext8_1d_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1d_EQ_done
.Lsext8_1d_EQ_true:
    unary_emit_char 'B'
.Lsext8_1d_EQ_done:
    brne8 .Lsext8_1d_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1d_NE_done
.Lsext8_1d_NE_true:
    unary_emit_char 'B'
.Lsext8_1d_NE_done:
    brult8 .Lsext8_1d_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1d_ULT_done
.Lsext8_1d_ULT_true:
    unary_emit_char 'B'
.Lsext8_1d_ULT_done:
    bruge8 .Lsext8_1d_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1d_UGE_done
.Lsext8_1d_UGE_true:
    unary_emit_char 'B'
.Lsext8_1d_UGE_done:
    brslt8 .Lsext8_1d_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1d_SLT_done
.Lsext8_1d_SLT_true:
    unary_emit_char 'B'
.Lsext8_1d_SLT_done:
    brsge8 .Lsext8_1d_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1d_SGE_done
.Lsext8_1d_SGE_true:
    unary_emit_char 'B'
.Lsext8_1d_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 6: sext8 r3
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x8001
    push16 r4
    pop16 r3
    ldi16 c0, 0xbbbc
    push16 r4
    pop16 r2
    sext8 r3
    push16 r2
    push16 r3
    unary_print_target_guard
    breq8 .Lsext8_1e_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1e_EQ_done
.Lsext8_1e_EQ_true:
    unary_emit_char 'B'
.Lsext8_1e_EQ_done:
    brne8 .Lsext8_1e_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1e_NE_done
.Lsext8_1e_NE_true:
    unary_emit_char 'B'
.Lsext8_1e_NE_done:
    brult8 .Lsext8_1e_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1e_ULT_done
.Lsext8_1e_ULT_true:
    unary_emit_char 'B'
.Lsext8_1e_ULT_done:
    bruge8 .Lsext8_1e_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1e_UGE_done
.Lsext8_1e_UGE_true:
    unary_emit_char 'B'
.Lsext8_1e_UGE_done:
    brslt8 .Lsext8_1e_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1e_SLT_done
.Lsext8_1e_SLT_true:
    unary_emit_char 'B'
.Lsext8_1e_SLT_done:
    brsge8 .Lsext8_1e_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1e_SGE_done
.Lsext8_1e_SGE_true:
    unary_emit_char 'B'
.Lsext8_1e_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 7: sext8 r3
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c1, 0x0000
    push16 r5
    pop16 r3
    ldi16 c1, 0xbe11
    push16 r5
    pop16 r4
    sext8 r3
    push16 r4
    push16 r3
    unary_print_target_guard
    breq8 .Lsext8_1f_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1f_EQ_done
.Lsext8_1f_EQ_true:
    unary_emit_char 'B'
.Lsext8_1f_EQ_done:
    brne8 .Lsext8_1f_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1f_NE_done
.Lsext8_1f_NE_true:
    unary_emit_char 'B'
.Lsext8_1f_NE_done:
    brult8 .Lsext8_1f_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1f_ULT_done
.Lsext8_1f_ULT_true:
    unary_emit_char 'B'
.Lsext8_1f_ULT_done:
    bruge8 .Lsext8_1f_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1f_UGE_done
.Lsext8_1f_UGE_true:
    unary_emit_char 'B'
.Lsext8_1f_UGE_done:
    brslt8 .Lsext8_1f_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1f_SLT_done
.Lsext8_1f_SLT_true:
    unary_emit_char 'B'
.Lsext8_1f_SLT_done:
    brsge8 .Lsext8_1f_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_1f_SGE_done
.Lsext8_1f_SGE_true:
    unary_emit_char 'B'
.Lsext8_1f_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 0: sext8 r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c2, 0xfedc
    push16 r6
    pop16 r4
    ldi16 c2, 0xbf65
    push16 r6
    pop16 r5
    sext8 r4
    push16 r5
    push16 r4
    unary_print_target_guard
    breq8 .Lsext8_20_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_20_EQ_done
.Lsext8_20_EQ_true:
    unary_emit_char 'B'
.Lsext8_20_EQ_done:
    brne8 .Lsext8_20_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_20_NE_done
.Lsext8_20_NE_true:
    unary_emit_char 'B'
.Lsext8_20_NE_done:
    brult8 .Lsext8_20_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_20_ULT_done
.Lsext8_20_ULT_true:
    unary_emit_char 'B'
.Lsext8_20_ULT_done:
    bruge8 .Lsext8_20_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_20_UGE_done
.Lsext8_20_UGE_true:
    unary_emit_char 'B'
.Lsext8_20_UGE_done:
    brslt8 .Lsext8_20_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_20_SLT_done
.Lsext8_20_SLT_true:
    unary_emit_char 'B'
.Lsext8_20_SLT_done:
    brsge8 .Lsext8_20_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_20_SGE_done
.Lsext8_20_SGE_true:
    unary_emit_char 'B'
.Lsext8_20_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 1: sext8 r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c1, 0x4000
    push16 r5
    pop16 r4
    ldi16 c1, 0xc0b9
    push16 r5
    pop16 r6
    sext8 r4
    push16 r6
    push16 r4
    unary_print_target_guard
    breq8 .Lsext8_21_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_21_EQ_done
.Lsext8_21_EQ_true:
    unary_emit_char 'B'
.Lsext8_21_EQ_done:
    brne8 .Lsext8_21_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_21_NE_done
.Lsext8_21_NE_true:
    unary_emit_char 'B'
.Lsext8_21_NE_done:
    brult8 .Lsext8_21_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_21_ULT_done
.Lsext8_21_ULT_true:
    unary_emit_char 'B'
.Lsext8_21_ULT_done:
    bruge8 .Lsext8_21_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_21_UGE_done
.Lsext8_21_UGE_true:
    unary_emit_char 'B'
.Lsext8_21_UGE_done:
    brslt8 .Lsext8_21_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_21_SLT_done
.Lsext8_21_SLT_true:
    unary_emit_char 'B'
.Lsext8_21_SLT_done:
    brsge8 .Lsext8_21_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_21_SGE_done
.Lsext8_21_SGE_true:
    unary_emit_char 'B'
.Lsext8_21_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 2: sext8 r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c1, 0xc000
    push16 r5
    pop16 r4
    ldi16 c1, 0xc20d
    push16 r5
    pop16 r7
    sext8 r4
    push16 r7
    push16 r4
    unary_print_target_guard
    breq8 .Lsext8_22_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_22_EQ_done
.Lsext8_22_EQ_true:
    unary_emit_char 'B'
.Lsext8_22_EQ_done:
    brne8 .Lsext8_22_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_22_NE_done
.Lsext8_22_NE_true:
    unary_emit_char 'B'
.Lsext8_22_NE_done:
    brult8 .Lsext8_22_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_22_ULT_done
.Lsext8_22_ULT_true:
    unary_emit_char 'B'
.Lsext8_22_ULT_done:
    bruge8 .Lsext8_22_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_22_UGE_done
.Lsext8_22_UGE_true:
    unary_emit_char 'B'
.Lsext8_22_UGE_done:
    brslt8 .Lsext8_22_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_22_SLT_done
.Lsext8_22_SLT_true:
    unary_emit_char 'B'
.Lsext8_22_SLT_done:
    brsge8 .Lsext8_22_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_22_SGE_done
.Lsext8_22_SGE_true:
    unary_emit_char 'B'
.Lsext8_22_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 3: sext8 r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0x8001
    push16 r5
    pop16 r4
    ldi16 c1, 0xbb59
    push16 r5
    pop16 r0
    sext8 r4
    push16 r0
    push16 r4
    unary_print_target_guard
    breq8 .Lsext8_23_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_23_EQ_done
.Lsext8_23_EQ_true:
    unary_emit_char 'B'
.Lsext8_23_EQ_done:
    brne8 .Lsext8_23_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_23_NE_done
.Lsext8_23_NE_true:
    unary_emit_char 'B'
.Lsext8_23_NE_done:
    brult8 .Lsext8_23_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_23_ULT_done
.Lsext8_23_ULT_true:
    unary_emit_char 'B'
.Lsext8_23_ULT_done:
    bruge8 .Lsext8_23_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_23_UGE_done
.Lsext8_23_UGE_true:
    unary_emit_char 'B'
.Lsext8_23_UGE_done:
    brslt8 .Lsext8_23_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_23_SLT_done
.Lsext8_23_SLT_true:
    unary_emit_char 'B'
.Lsext8_23_SLT_done:
    brsge8 .Lsext8_23_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_23_SGE_done
.Lsext8_23_SGE_true:
    unary_emit_char 'B'
.Lsext8_23_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 4: sext8 r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c1, 0x0000
    push16 r5
    pop16 r4
    ldi16 c1, 0xbcad
    push16 r5
    pop16 r1
    sext8 r4
    push16 r1
    push16 r4
    unary_print_target_guard
    breq8 .Lsext8_24_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_24_EQ_done
.Lsext8_24_EQ_true:
    unary_emit_char 'B'
.Lsext8_24_EQ_done:
    brne8 .Lsext8_24_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_24_NE_done
.Lsext8_24_NE_true:
    unary_emit_char 'B'
.Lsext8_24_NE_done:
    brult8 .Lsext8_24_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_24_ULT_done
.Lsext8_24_ULT_true:
    unary_emit_char 'B'
.Lsext8_24_ULT_done:
    bruge8 .Lsext8_24_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_24_UGE_done
.Lsext8_24_UGE_true:
    unary_emit_char 'B'
.Lsext8_24_UGE_done:
    brslt8 .Lsext8_24_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_24_SLT_done
.Lsext8_24_SLT_true:
    unary_emit_char 'B'
.Lsext8_24_SLT_done:
    brsge8 .Lsext8_24_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_24_SGE_done
.Lsext8_24_SGE_true:
    unary_emit_char 'B'
.Lsext8_24_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 5: sext8 r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c1, 0x0001
    push16 r5
    pop16 r4
    ldi16 c1, 0xbe01
    push16 r5
    pop16 r2
    sext8 r4
    push16 r2
    push16 r4
    unary_print_target_guard
    breq8 .Lsext8_25_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_25_EQ_done
.Lsext8_25_EQ_true:
    unary_emit_char 'B'
.Lsext8_25_EQ_done:
    brne8 .Lsext8_25_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_25_NE_done
.Lsext8_25_NE_true:
    unary_emit_char 'B'
.Lsext8_25_NE_done:
    brult8 .Lsext8_25_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_25_ULT_done
.Lsext8_25_ULT_true:
    unary_emit_char 'B'
.Lsext8_25_ULT_done:
    bruge8 .Lsext8_25_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_25_UGE_done
.Lsext8_25_UGE_true:
    unary_emit_char 'B'
.Lsext8_25_UGE_done:
    brslt8 .Lsext8_25_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_25_SLT_done
.Lsext8_25_SLT_true:
    unary_emit_char 'B'
.Lsext8_25_SLT_done:
    brsge8 .Lsext8_25_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_25_SGE_done
.Lsext8_25_SGE_true:
    unary_emit_char 'B'
.Lsext8_25_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 6: sext8 r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c1, 0x007f
    push16 r5
    pop16 r4
    ldi16 c1, 0xbf55
    push16 r5
    pop16 r3
    sext8 r4
    push16 r3
    push16 r4
    unary_print_target_guard
    breq8 .Lsext8_26_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_26_EQ_done
.Lsext8_26_EQ_true:
    unary_emit_char 'B'
.Lsext8_26_EQ_done:
    brne8 .Lsext8_26_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_26_NE_done
.Lsext8_26_NE_true:
    unary_emit_char 'B'
.Lsext8_26_NE_done:
    brult8 .Lsext8_26_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_26_ULT_done
.Lsext8_26_ULT_true:
    unary_emit_char 'B'
.Lsext8_26_ULT_done:
    bruge8 .Lsext8_26_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_26_UGE_done
.Lsext8_26_UGE_true:
    unary_emit_char 'B'
.Lsext8_26_UGE_done:
    brslt8 .Lsext8_26_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_26_SLT_done
.Lsext8_26_SLT_true:
    unary_emit_char 'B'
.Lsext8_26_SLT_done:
    brsge8 .Lsext8_26_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_26_SGE_done
.Lsext8_26_SGE_true:
    unary_emit_char 'B'
.Lsext8_26_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 7: sext8 r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c2, 0x0080
    push16 r6
    pop16 r4
    ldi16 c2, 0xc1aa
    push16 r6
    pop16 r5
    sext8 r4
    push16 r5
    push16 r4
    unary_print_target_guard
    breq8 .Lsext8_27_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_27_EQ_done
.Lsext8_27_EQ_true:
    unary_emit_char 'B'
.Lsext8_27_EQ_done:
    brne8 .Lsext8_27_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_27_NE_done
.Lsext8_27_NE_true:
    unary_emit_char 'B'
.Lsext8_27_NE_done:
    brult8 .Lsext8_27_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_27_ULT_done
.Lsext8_27_ULT_true:
    unary_emit_char 'B'
.Lsext8_27_ULT_done:
    bruge8 .Lsext8_27_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_27_UGE_done
.Lsext8_27_UGE_true:
    unary_emit_char 'B'
.Lsext8_27_UGE_done:
    brslt8 .Lsext8_27_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_27_SLT_done
.Lsext8_27_SLT_true:
    unary_emit_char 'B'
.Lsext8_27_SLT_done:
    brsge8 .Lsext8_27_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_27_SGE_done
.Lsext8_27_SGE_true:
    unary_emit_char 'B'
.Lsext8_27_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 0: sext8 r5
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x8001
    push16 r4
    pop16 r5
    ldi16 c0, 0xc2fe
    push16 r4
    pop16 r6
    sext8 r5
    push16 r6
    push16 r5
    unary_print_target_guard
    breq8 .Lsext8_28_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_28_EQ_done
.Lsext8_28_EQ_true:
    unary_emit_char 'B'
.Lsext8_28_EQ_done:
    brne8 .Lsext8_28_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_28_NE_done
.Lsext8_28_NE_true:
    unary_emit_char 'B'
.Lsext8_28_NE_done:
    brult8 .Lsext8_28_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_28_ULT_done
.Lsext8_28_ULT_true:
    unary_emit_char 'B'
.Lsext8_28_ULT_done:
    bruge8 .Lsext8_28_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_28_UGE_done
.Lsext8_28_UGE_true:
    unary_emit_char 'B'
.Lsext8_28_UGE_done:
    brslt8 .Lsext8_28_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_28_SLT_done
.Lsext8_28_SLT_true:
    unary_emit_char 'B'
.Lsext8_28_SLT_done:
    brsge8 .Lsext8_28_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_28_SGE_done
.Lsext8_28_SGE_true:
    unary_emit_char 'B'
.Lsext8_28_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 1: sext8 r5
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x0000
    push16 r4
    pop16 r5
    ldi16 c0, 0xc452
    push16 r4
    pop16 r7
    sext8 r5
    push16 r7
    push16 r5
    unary_print_target_guard
    breq8 .Lsext8_29_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_29_EQ_done
.Lsext8_29_EQ_true:
    unary_emit_char 'B'
.Lsext8_29_EQ_done:
    brne8 .Lsext8_29_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_29_NE_done
.Lsext8_29_NE_true:
    unary_emit_char 'B'
.Lsext8_29_NE_done:
    brult8 .Lsext8_29_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_29_ULT_done
.Lsext8_29_ULT_true:
    unary_emit_char 'B'
.Lsext8_29_ULT_done:
    bruge8 .Lsext8_29_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_29_UGE_done
.Lsext8_29_UGE_true:
    unary_emit_char 'B'
.Lsext8_29_UGE_done:
    brslt8 .Lsext8_29_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_29_SLT_done
.Lsext8_29_SLT_true:
    unary_emit_char 'B'
.Lsext8_29_SLT_done:
    brsge8 .Lsext8_29_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_29_SGE_done
.Lsext8_29_SGE_true:
    unary_emit_char 'B'
.Lsext8_29_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 2: sext8 r5
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x0001
    push16 r4
    pop16 r5
    ldi16 c0, 0xbd9e
    push16 r4
    pop16 r0
    sext8 r5
    push16 r0
    push16 r5
    unary_print_target_guard
    breq8 .Lsext8_2a_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2a_EQ_done
.Lsext8_2a_EQ_true:
    unary_emit_char 'B'
.Lsext8_2a_EQ_done:
    brne8 .Lsext8_2a_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2a_NE_done
.Lsext8_2a_NE_true:
    unary_emit_char 'B'
.Lsext8_2a_NE_done:
    brult8 .Lsext8_2a_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2a_ULT_done
.Lsext8_2a_ULT_true:
    unary_emit_char 'B'
.Lsext8_2a_ULT_done:
    bruge8 .Lsext8_2a_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2a_UGE_done
.Lsext8_2a_UGE_true:
    unary_emit_char 'B'
.Lsext8_2a_UGE_done:
    brslt8 .Lsext8_2a_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2a_SLT_done
.Lsext8_2a_SLT_true:
    unary_emit_char 'B'
.Lsext8_2a_SLT_done:
    brsge8 .Lsext8_2a_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2a_SGE_done
.Lsext8_2a_SGE_true:
    unary_emit_char 'B'
.Lsext8_2a_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 3: sext8 r5
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x007f
    push16 r4
    pop16 r5
    ldi16 c0, 0xbef2
    push16 r4
    pop16 r1
    sext8 r5
    push16 r1
    push16 r5
    unary_print_target_guard
    breq8 .Lsext8_2b_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2b_EQ_done
.Lsext8_2b_EQ_true:
    unary_emit_char 'B'
.Lsext8_2b_EQ_done:
    brne8 .Lsext8_2b_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2b_NE_done
.Lsext8_2b_NE_true:
    unary_emit_char 'B'
.Lsext8_2b_NE_done:
    brult8 .Lsext8_2b_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2b_ULT_done
.Lsext8_2b_ULT_true:
    unary_emit_char 'B'
.Lsext8_2b_ULT_done:
    bruge8 .Lsext8_2b_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2b_UGE_done
.Lsext8_2b_UGE_true:
    unary_emit_char 'B'
.Lsext8_2b_UGE_done:
    brslt8 .Lsext8_2b_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2b_SLT_done
.Lsext8_2b_SLT_true:
    unary_emit_char 'B'
.Lsext8_2b_SLT_done:
    brsge8 .Lsext8_2b_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2b_SGE_done
.Lsext8_2b_SGE_true:
    unary_emit_char 'B'
.Lsext8_2b_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 4: sext8 r5
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x0080
    push16 r4
    pop16 r5
    ldi16 c0, 0xc046
    push16 r4
    pop16 r2
    sext8 r5
    push16 r2
    push16 r5
    unary_print_target_guard
    breq8 .Lsext8_2c_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2c_EQ_done
.Lsext8_2c_EQ_true:
    unary_emit_char 'B'
.Lsext8_2c_EQ_done:
    brne8 .Lsext8_2c_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2c_NE_done
.Lsext8_2c_NE_true:
    unary_emit_char 'B'
.Lsext8_2c_NE_done:
    brult8 .Lsext8_2c_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2c_ULT_done
.Lsext8_2c_ULT_true:
    unary_emit_char 'B'
.Lsext8_2c_ULT_done:
    bruge8 .Lsext8_2c_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2c_UGE_done
.Lsext8_2c_UGE_true:
    unary_emit_char 'B'
.Lsext8_2c_UGE_done:
    brslt8 .Lsext8_2c_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2c_SLT_done
.Lsext8_2c_SLT_true:
    unary_emit_char 'B'
.Lsext8_2c_SLT_done:
    brsge8 .Lsext8_2c_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2c_SGE_done
.Lsext8_2c_SGE_true:
    unary_emit_char 'B'
.Lsext8_2c_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 5: sext8 r5
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x00ff
    push16 r4
    pop16 r5
    ldi16 c0, 0xc19a
    push16 r4
    pop16 r3
    sext8 r5
    push16 r3
    push16 r5
    unary_print_target_guard
    breq8 .Lsext8_2d_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2d_EQ_done
.Lsext8_2d_EQ_true:
    unary_emit_char 'B'
.Lsext8_2d_EQ_done:
    brne8 .Lsext8_2d_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2d_NE_done
.Lsext8_2d_NE_true:
    unary_emit_char 'B'
.Lsext8_2d_NE_done:
    brult8 .Lsext8_2d_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2d_ULT_done
.Lsext8_2d_ULT_true:
    unary_emit_char 'B'
.Lsext8_2d_ULT_done:
    bruge8 .Lsext8_2d_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2d_UGE_done
.Lsext8_2d_UGE_true:
    unary_emit_char 'B'
.Lsext8_2d_UGE_done:
    brslt8 .Lsext8_2d_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2d_SLT_done
.Lsext8_2d_SLT_true:
    unary_emit_char 'B'
.Lsext8_2d_SLT_done:
    brsge8 .Lsext8_2d_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2d_SGE_done
.Lsext8_2d_SGE_true:
    unary_emit_char 'B'
.Lsext8_2d_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 6: sext8 r5
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c2, 0x0100
    push16 r6
    pop16 r5
    ldi16 c2, 0xc2ee
    push16 r6
    pop16 r4
    sext8 r5
    push16 r4
    push16 r5
    unary_print_target_guard
    breq8 .Lsext8_2e_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2e_EQ_done
.Lsext8_2e_EQ_true:
    unary_emit_char 'B'
.Lsext8_2e_EQ_done:
    brne8 .Lsext8_2e_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2e_NE_done
.Lsext8_2e_NE_true:
    unary_emit_char 'B'
.Lsext8_2e_NE_done:
    brult8 .Lsext8_2e_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2e_ULT_done
.Lsext8_2e_ULT_true:
    unary_emit_char 'B'
.Lsext8_2e_ULT_done:
    bruge8 .Lsext8_2e_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2e_UGE_done
.Lsext8_2e_UGE_true:
    unary_emit_char 'B'
.Lsext8_2e_UGE_done:
    brslt8 .Lsext8_2e_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2e_SLT_done
.Lsext8_2e_SLT_true:
    unary_emit_char 'B'
.Lsext8_2e_SLT_done:
    brsge8 .Lsext8_2e_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2e_SGE_done
.Lsext8_2e_SGE_true:
    unary_emit_char 'B'
.Lsext8_2e_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 7: sext8 r5
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x7fff
    push16 r4
    pop16 r5
    ldi16 c0, 0xc543
    push16 r4
    pop16 r6
    sext8 r5
    push16 r6
    push16 r5
    unary_print_target_guard
    breq8 .Lsext8_2f_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2f_EQ_done
.Lsext8_2f_EQ_true:
    unary_emit_char 'B'
.Lsext8_2f_EQ_done:
    brne8 .Lsext8_2f_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2f_NE_done
.Lsext8_2f_NE_true:
    unary_emit_char 'B'
.Lsext8_2f_NE_done:
    brult8 .Lsext8_2f_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2f_ULT_done
.Lsext8_2f_ULT_true:
    unary_emit_char 'B'
.Lsext8_2f_ULT_done:
    bruge8 .Lsext8_2f_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2f_UGE_done
.Lsext8_2f_UGE_true:
    unary_emit_char 'B'
.Lsext8_2f_UGE_done:
    brslt8 .Lsext8_2f_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2f_SLT_done
.Lsext8_2f_SLT_true:
    unary_emit_char 'B'
.Lsext8_2f_SLT_done:
    brsge8 .Lsext8_2f_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_2f_SGE_done
.Lsext8_2f_SGE_true:
    unary_emit_char 'B'
.Lsext8_2f_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 0: sext8 r6
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x007f
    push16 r4
    pop16 r6
    ldi16 c0, 0xc697
    push16 r4
    pop16 r7
    sext8 r6
    push16 r7
    push16 r6
    unary_print_target_guard
    breq8 .Lsext8_30_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_30_EQ_done
.Lsext8_30_EQ_true:
    unary_emit_char 'B'
.Lsext8_30_EQ_done:
    brne8 .Lsext8_30_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_30_NE_done
.Lsext8_30_NE_true:
    unary_emit_char 'B'
.Lsext8_30_NE_done:
    brult8 .Lsext8_30_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_30_ULT_done
.Lsext8_30_ULT_true:
    unary_emit_char 'B'
.Lsext8_30_ULT_done:
    bruge8 .Lsext8_30_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_30_UGE_done
.Lsext8_30_UGE_true:
    unary_emit_char 'B'
.Lsext8_30_UGE_done:
    brslt8 .Lsext8_30_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_30_SLT_done
.Lsext8_30_SLT_true:
    unary_emit_char 'B'
.Lsext8_30_SLT_done:
    brsge8 .Lsext8_30_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_30_SGE_done
.Lsext8_30_SGE_true:
    unary_emit_char 'B'
.Lsext8_30_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 1: sext8 r6
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x0080
    push16 r4
    pop16 r6
    ldi16 c0, 0xbfe3
    push16 r4
    pop16 r0
    sext8 r6
    push16 r0
    push16 r6
    unary_print_target_guard
    breq8 .Lsext8_31_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_31_EQ_done
.Lsext8_31_EQ_true:
    unary_emit_char 'B'
.Lsext8_31_EQ_done:
    brne8 .Lsext8_31_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_31_NE_done
.Lsext8_31_NE_true:
    unary_emit_char 'B'
.Lsext8_31_NE_done:
    brult8 .Lsext8_31_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_31_ULT_done
.Lsext8_31_ULT_true:
    unary_emit_char 'B'
.Lsext8_31_ULT_done:
    bruge8 .Lsext8_31_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_31_UGE_done
.Lsext8_31_UGE_true:
    unary_emit_char 'B'
.Lsext8_31_UGE_done:
    brslt8 .Lsext8_31_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_31_SLT_done
.Lsext8_31_SLT_true:
    unary_emit_char 'B'
.Lsext8_31_SLT_done:
    brsge8 .Lsext8_31_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_31_SGE_done
.Lsext8_31_SGE_true:
    unary_emit_char 'B'
.Lsext8_31_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 2: sext8 r6
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x00ff
    push16 r4
    pop16 r6
    ldi16 c0, 0xc137
    push16 r4
    pop16 r1
    sext8 r6
    push16 r1
    push16 r6
    unary_print_target_guard
    breq8 .Lsext8_32_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_32_EQ_done
.Lsext8_32_EQ_true:
    unary_emit_char 'B'
.Lsext8_32_EQ_done:
    brne8 .Lsext8_32_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_32_NE_done
.Lsext8_32_NE_true:
    unary_emit_char 'B'
.Lsext8_32_NE_done:
    brult8 .Lsext8_32_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_32_ULT_done
.Lsext8_32_ULT_true:
    unary_emit_char 'B'
.Lsext8_32_ULT_done:
    bruge8 .Lsext8_32_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_32_UGE_done
.Lsext8_32_UGE_true:
    unary_emit_char 'B'
.Lsext8_32_UGE_done:
    brslt8 .Lsext8_32_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_32_SLT_done
.Lsext8_32_SLT_true:
    unary_emit_char 'B'
.Lsext8_32_SLT_done:
    brsge8 .Lsext8_32_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_32_SGE_done
.Lsext8_32_SGE_true:
    unary_emit_char 'B'
.Lsext8_32_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 3: sext8 r6
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x0100
    push16 r4
    pop16 r6
    ldi16 c0, 0xc28b
    push16 r4
    pop16 r2
    sext8 r6
    push16 r2
    push16 r6
    unary_print_target_guard
    breq8 .Lsext8_33_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_33_EQ_done
.Lsext8_33_EQ_true:
    unary_emit_char 'B'
.Lsext8_33_EQ_done:
    brne8 .Lsext8_33_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_33_NE_done
.Lsext8_33_NE_true:
    unary_emit_char 'B'
.Lsext8_33_NE_done:
    brult8 .Lsext8_33_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_33_ULT_done
.Lsext8_33_ULT_true:
    unary_emit_char 'B'
.Lsext8_33_ULT_done:
    bruge8 .Lsext8_33_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_33_UGE_done
.Lsext8_33_UGE_true:
    unary_emit_char 'B'
.Lsext8_33_UGE_done:
    brslt8 .Lsext8_33_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_33_SLT_done
.Lsext8_33_SLT_true:
    unary_emit_char 'B'
.Lsext8_33_SLT_done:
    brsge8 .Lsext8_33_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_33_SGE_done
.Lsext8_33_SGE_true:
    unary_emit_char 'B'
.Lsext8_33_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 4: sext8 r6
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x7fff
    push16 r4
    pop16 r6
    ldi16 c0, 0xc3df
    push16 r4
    pop16 r3
    sext8 r6
    push16 r3
    push16 r6
    unary_print_target_guard
    breq8 .Lsext8_34_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_34_EQ_done
.Lsext8_34_EQ_true:
    unary_emit_char 'B'
.Lsext8_34_EQ_done:
    brne8 .Lsext8_34_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_34_NE_done
.Lsext8_34_NE_true:
    unary_emit_char 'B'
.Lsext8_34_NE_done:
    brult8 .Lsext8_34_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_34_ULT_done
.Lsext8_34_ULT_true:
    unary_emit_char 'B'
.Lsext8_34_ULT_done:
    bruge8 .Lsext8_34_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_34_UGE_done
.Lsext8_34_UGE_true:
    unary_emit_char 'B'
.Lsext8_34_UGE_done:
    brslt8 .Lsext8_34_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_34_SLT_done
.Lsext8_34_SLT_true:
    unary_emit_char 'B'
.Lsext8_34_SLT_done:
    brsge8 .Lsext8_34_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_34_SGE_done
.Lsext8_34_SGE_true:
    unary_emit_char 'B'
.Lsext8_34_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 5: sext8 r6
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0x8000
    push16 r5
    pop16 r6
    ldi16 c1, 0xc533
    push16 r5
    pop16 r4
    sext8 r6
    push16 r4
    push16 r6
    unary_print_target_guard
    breq8 .Lsext8_35_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_35_EQ_done
.Lsext8_35_EQ_true:
    unary_emit_char 'B'
.Lsext8_35_EQ_done:
    brne8 .Lsext8_35_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_35_NE_done
.Lsext8_35_NE_true:
    unary_emit_char 'B'
.Lsext8_35_NE_done:
    brult8 .Lsext8_35_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_35_ULT_done
.Lsext8_35_ULT_true:
    unary_emit_char 'B'
.Lsext8_35_ULT_done:
    bruge8 .Lsext8_35_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_35_UGE_done
.Lsext8_35_UGE_true:
    unary_emit_char 'B'
.Lsext8_35_UGE_done:
    brslt8 .Lsext8_35_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_35_SLT_done
.Lsext8_35_SLT_true:
    unary_emit_char 'B'
.Lsext8_35_SLT_done:
    brsge8 .Lsext8_35_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_35_SGE_done
.Lsext8_35_SGE_true:
    unary_emit_char 'B'
.Lsext8_35_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 6: sext8 r6
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xffff
    push16 r4
    pop16 r6
    ldi16 c0, 0xc687
    push16 r4
    pop16 r5
    sext8 r6
    push16 r5
    push16 r6
    unary_print_target_guard
    breq8 .Lsext8_36_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_36_EQ_done
.Lsext8_36_EQ_true:
    unary_emit_char 'B'
.Lsext8_36_EQ_done:
    brne8 .Lsext8_36_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_36_NE_done
.Lsext8_36_NE_true:
    unary_emit_char 'B'
.Lsext8_36_NE_done:
    brult8 .Lsext8_36_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_36_ULT_done
.Lsext8_36_ULT_true:
    unary_emit_char 'B'
.Lsext8_36_ULT_done:
    bruge8 .Lsext8_36_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_36_UGE_done
.Lsext8_36_UGE_true:
    unary_emit_char 'B'
.Lsext8_36_UGE_done:
    brslt8 .Lsext8_36_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_36_SLT_done
.Lsext8_36_SLT_true:
    unary_emit_char 'B'
.Lsext8_36_SLT_done:
    brsge8 .Lsext8_36_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_36_SGE_done
.Lsext8_36_SGE_true:
    unary_emit_char 'B'
.Lsext8_36_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 7: sext8 r6
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xa55a
    push16 r4
    pop16 r6
    ldi16 c0, 0xc8dc
    push16 r4
    pop16 r7
    sext8 r6
    push16 r7
    push16 r6
    unary_print_target_guard
    breq8 .Lsext8_37_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_37_EQ_done
.Lsext8_37_EQ_true:
    unary_emit_char 'B'
.Lsext8_37_EQ_done:
    brne8 .Lsext8_37_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_37_NE_done
.Lsext8_37_NE_true:
    unary_emit_char 'B'
.Lsext8_37_NE_done:
    brult8 .Lsext8_37_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_37_ULT_done
.Lsext8_37_ULT_true:
    unary_emit_char 'B'
.Lsext8_37_ULT_done:
    bruge8 .Lsext8_37_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_37_UGE_done
.Lsext8_37_UGE_true:
    unary_emit_char 'B'
.Lsext8_37_UGE_done:
    brslt8 .Lsext8_37_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_37_SLT_done
.Lsext8_37_SLT_true:
    unary_emit_char 'B'
.Lsext8_37_SLT_done:
    brsge8 .Lsext8_37_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_37_SGE_done
.Lsext8_37_SGE_true:
    unary_emit_char 'B'
.Lsext8_37_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 0: sext8 r7
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x0100
    push16 r4
    pop16 r7
    ldi16 c0, 0xc228
    push16 r4
    pop16 r0
    sext8 r7
    push16 r0
    push16 r7
    unary_print_target_guard
    breq8 .Lsext8_38_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_38_EQ_done
.Lsext8_38_EQ_true:
    unary_emit_char 'B'
.Lsext8_38_EQ_done:
    brne8 .Lsext8_38_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_38_NE_done
.Lsext8_38_NE_true:
    unary_emit_char 'B'
.Lsext8_38_NE_done:
    brult8 .Lsext8_38_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_38_ULT_done
.Lsext8_38_ULT_true:
    unary_emit_char 'B'
.Lsext8_38_ULT_done:
    bruge8 .Lsext8_38_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_38_UGE_done
.Lsext8_38_UGE_true:
    unary_emit_char 'B'
.Lsext8_38_UGE_done:
    brslt8 .Lsext8_38_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_38_SLT_done
.Lsext8_38_SLT_true:
    unary_emit_char 'B'
.Lsext8_38_SLT_done:
    brsge8 .Lsext8_38_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_38_SGE_done
.Lsext8_38_SGE_true:
    unary_emit_char 'B'
.Lsext8_38_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 1: sext8 r7
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x7fff
    push16 r4
    pop16 r7
    ldi16 c0, 0xc37c
    push16 r4
    pop16 r1
    sext8 r7
    push16 r1
    push16 r7
    unary_print_target_guard
    breq8 .Lsext8_39_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_39_EQ_done
.Lsext8_39_EQ_true:
    unary_emit_char 'B'
.Lsext8_39_EQ_done:
    brne8 .Lsext8_39_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_39_NE_done
.Lsext8_39_NE_true:
    unary_emit_char 'B'
.Lsext8_39_NE_done:
    brult8 .Lsext8_39_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_39_ULT_done
.Lsext8_39_ULT_true:
    unary_emit_char 'B'
.Lsext8_39_ULT_done:
    bruge8 .Lsext8_39_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_39_UGE_done
.Lsext8_39_UGE_true:
    unary_emit_char 'B'
.Lsext8_39_UGE_done:
    brslt8 .Lsext8_39_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_39_SLT_done
.Lsext8_39_SLT_true:
    unary_emit_char 'B'
.Lsext8_39_SLT_done:
    brsge8 .Lsext8_39_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_39_SGE_done
.Lsext8_39_SGE_true:
    unary_emit_char 'B'
.Lsext8_39_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 2: sext8 r7
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x8000
    push16 r4
    pop16 r7
    ldi16 c0, 0xc4d0
    push16 r4
    pop16 r2
    sext8 r7
    push16 r2
    push16 r7
    unary_print_target_guard
    breq8 .Lsext8_3a_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3a_EQ_done
.Lsext8_3a_EQ_true:
    unary_emit_char 'B'
.Lsext8_3a_EQ_done:
    brne8 .Lsext8_3a_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3a_NE_done
.Lsext8_3a_NE_true:
    unary_emit_char 'B'
.Lsext8_3a_NE_done:
    brult8 .Lsext8_3a_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3a_ULT_done
.Lsext8_3a_ULT_true:
    unary_emit_char 'B'
.Lsext8_3a_ULT_done:
    bruge8 .Lsext8_3a_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3a_UGE_done
.Lsext8_3a_UGE_true:
    unary_emit_char 'B'
.Lsext8_3a_UGE_done:
    brslt8 .Lsext8_3a_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3a_SLT_done
.Lsext8_3a_SLT_true:
    unary_emit_char 'B'
.Lsext8_3a_SLT_done:
    brsge8 .Lsext8_3a_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3a_SGE_done
.Lsext8_3a_SGE_true:
    unary_emit_char 'B'
.Lsext8_3a_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 3: sext8 r7
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0xffff
    push16 r4
    pop16 r7
    ldi16 c0, 0xc624
    push16 r4
    pop16 r3
    sext8 r7
    push16 r3
    push16 r7
    unary_print_target_guard
    breq8 .Lsext8_3b_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3b_EQ_done
.Lsext8_3b_EQ_true:
    unary_emit_char 'B'
.Lsext8_3b_EQ_done:
    brne8 .Lsext8_3b_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3b_NE_done
.Lsext8_3b_NE_true:
    unary_emit_char 'B'
.Lsext8_3b_NE_done:
    brult8 .Lsext8_3b_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3b_ULT_done
.Lsext8_3b_ULT_true:
    unary_emit_char 'B'
.Lsext8_3b_ULT_done:
    bruge8 .Lsext8_3b_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3b_UGE_done
.Lsext8_3b_UGE_true:
    unary_emit_char 'B'
.Lsext8_3b_UGE_done:
    brslt8 .Lsext8_3b_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3b_SLT_done
.Lsext8_3b_SLT_true:
    unary_emit_char 'B'
.Lsext8_3b_SLT_done:
    brsge8 .Lsext8_3b_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3b_SGE_done
.Lsext8_3b_SGE_true:
    unary_emit_char 'B'
.Lsext8_3b_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 4: sext8 r7
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c1, 0xa55a
    push16 r5
    pop16 r7
    ldi16 c1, 0xc778
    push16 r5
    pop16 r4
    sext8 r7
    push16 r4
    push16 r7
    unary_print_target_guard
    breq8 .Lsext8_3c_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3c_EQ_done
.Lsext8_3c_EQ_true:
    unary_emit_char 'B'
.Lsext8_3c_EQ_done:
    brne8 .Lsext8_3c_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3c_NE_done
.Lsext8_3c_NE_true:
    unary_emit_char 'B'
.Lsext8_3c_NE_done:
    brult8 .Lsext8_3c_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3c_ULT_done
.Lsext8_3c_ULT_true:
    unary_emit_char 'B'
.Lsext8_3c_ULT_done:
    bruge8 .Lsext8_3c_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3c_UGE_done
.Lsext8_3c_UGE_true:
    unary_emit_char 'B'
.Lsext8_3c_UGE_done:
    brslt8 .Lsext8_3c_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3c_SLT_done
.Lsext8_3c_SLT_true:
    unary_emit_char 'B'
.Lsext8_3c_SLT_done:
    brsge8 .Lsext8_3c_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3c_SGE_done
.Lsext8_3c_SGE_true:
    unary_emit_char 'B'
.Lsext8_3c_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 5: sext8 r7
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x55aa
    push16 r4
    pop16 r7
    ldi16 c0, 0xc8cc
    push16 r4
    pop16 r5
    sext8 r7
    push16 r5
    push16 r7
    unary_print_target_guard
    breq8 .Lsext8_3d_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3d_EQ_done
.Lsext8_3d_EQ_true:
    unary_emit_char 'B'
.Lsext8_3d_EQ_done:
    brne8 .Lsext8_3d_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3d_NE_done
.Lsext8_3d_NE_true:
    unary_emit_char 'B'
.Lsext8_3d_NE_done:
    brult8 .Lsext8_3d_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3d_ULT_done
.Lsext8_3d_ULT_true:
    unary_emit_char 'B'
.Lsext8_3d_ULT_done:
    bruge8 .Lsext8_3d_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3d_UGE_done
.Lsext8_3d_UGE_true:
    unary_emit_char 'B'
.Lsext8_3d_UGE_done:
    brslt8 .Lsext8_3d_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3d_SLT_done
.Lsext8_3d_SLT_true:
    unary_emit_char 'B'
.Lsext8_3d_SLT_done:
    brsge8 .Lsext8_3d_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3d_SGE_done
.Lsext8_3d_SGE_true:
    unary_emit_char 'B'
.Lsext8_3d_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 6: sext8 r7
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1234
    push16 r4
    pop16 r7
    ldi16 c0, 0xca20
    push16 r4
    pop16 r6
    sext8 r7
    push16 r6
    push16 r7
    unary_print_target_guard
    breq8 .Lsext8_3e_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3e_EQ_done
.Lsext8_3e_EQ_true:
    unary_emit_char 'B'
.Lsext8_3e_EQ_done:
    brne8 .Lsext8_3e_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3e_NE_done
.Lsext8_3e_NE_true:
    unary_emit_char 'B'
.Lsext8_3e_NE_done:
    brult8 .Lsext8_3e_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3e_ULT_done
.Lsext8_3e_ULT_true:
    unary_emit_char 'B'
.Lsext8_3e_ULT_done:
    bruge8 .Lsext8_3e_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3e_UGE_done
.Lsext8_3e_UGE_true:
    unary_emit_char 'B'
.Lsext8_3e_UGE_done:
    brslt8 .Lsext8_3e_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3e_SLT_done
.Lsext8_3e_SLT_true:
    unary_emit_char 'B'
.Lsext8_3e_SLT_done:
    brsge8 .Lsext8_3e_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3e_SGE_done
.Lsext8_3e_SGE_true:
    unary_emit_char 'B'
.Lsext8_3e_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 7: sext8 r7
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0xfedc
    push16 r4
    pop16 r7
    ldi16 c0, 0xc46d
    push16 r4
    pop16 r0
    sext8 r7
    push16 r0
    push16 r7
    unary_print_target_guard
    breq8 .Lsext8_3f_EQ_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3f_EQ_done
.Lsext8_3f_EQ_true:
    unary_emit_char 'B'
.Lsext8_3f_EQ_done:
    brne8 .Lsext8_3f_NE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3f_NE_done
.Lsext8_3f_NE_true:
    unary_emit_char 'B'
.Lsext8_3f_NE_done:
    brult8 .Lsext8_3f_ULT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3f_ULT_done
.Lsext8_3f_ULT_true:
    unary_emit_char 'B'
.Lsext8_3f_ULT_done:
    bruge8 .Lsext8_3f_UGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3f_UGE_done
.Lsext8_3f_UGE_true:
    unary_emit_char 'B'
.Lsext8_3f_UGE_done:
    brslt8 .Lsext8_3f_SLT_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3f_SLT_done
.Lsext8_3f_SLT_true:
    unary_emit_char 'B'
.Lsext8_3f_SLT_done:
    brsge8 .Lsext8_3f_SGE_true
    unary_emit_char 'A'
    jmp8 .Lsext8_3f_SGE_done
.Lsext8_3f_SGE_true:
    unary_emit_char 'B'
.Lsext8_3f_SGE_done:
    unary_emit_char '\n'

    sys debug_break
