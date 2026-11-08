.include "include/unary_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; Register r0, pattern 0: lsl16.1 r0
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r0
    ldi16 r4, 0xb101
    push16 r4
    pop16 r1
    lsl16.1 r0
    push16 r1
    push16 r0
    unary_print_target_guard
    breq8 .Llsl16_1_00_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_00_EQ_done
.Llsl16_1_00_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_00_EQ_done:
    brne8 .Llsl16_1_00_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_00_NE_done
.Llsl16_1_00_NE_true:
    unary_emit_char 'B'
.Llsl16_1_00_NE_done:
    brult8 .Llsl16_1_00_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_00_ULT_done
.Llsl16_1_00_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_00_ULT_done:
    bruge8 .Llsl16_1_00_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_00_UGE_done
.Llsl16_1_00_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_00_UGE_done:
    brslt8 .Llsl16_1_00_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_00_SLT_done
.Llsl16_1_00_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_00_SLT_done:
    brsge8 .Llsl16_1_00_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_00_SGE_done
.Llsl16_1_00_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_00_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 1: lsl16.1 r0
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r0
    ldi16 r4, 0xb255
    push16 r4
    pop16 r2
    lsl16.1 r0
    push16 r2
    push16 r0
    unary_print_target_guard
    breq8 .Llsl16_1_01_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_01_EQ_done
.Llsl16_1_01_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_01_EQ_done:
    brne8 .Llsl16_1_01_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_01_NE_done
.Llsl16_1_01_NE_true:
    unary_emit_char 'B'
.Llsl16_1_01_NE_done:
    brult8 .Llsl16_1_01_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_01_ULT_done
.Llsl16_1_01_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_01_ULT_done:
    bruge8 .Llsl16_1_01_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_01_UGE_done
.Llsl16_1_01_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_01_UGE_done:
    brslt8 .Llsl16_1_01_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_01_SLT_done
.Llsl16_1_01_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_01_SLT_done:
    brsge8 .Llsl16_1_01_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_01_SGE_done
.Llsl16_1_01_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_01_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 2: lsl16.1 r0
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x007f
    push16 r4
    pop16 r0
    ldi16 r4, 0xb3a9
    push16 r4
    pop16 r3
    lsl16.1 r0
    push16 r3
    push16 r0
    unary_print_target_guard
    breq8 .Llsl16_1_02_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_02_EQ_done
.Llsl16_1_02_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_02_EQ_done:
    brne8 .Llsl16_1_02_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_02_NE_done
.Llsl16_1_02_NE_true:
    unary_emit_char 'B'
.Llsl16_1_02_NE_done:
    brult8 .Llsl16_1_02_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_02_ULT_done
.Llsl16_1_02_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_02_ULT_done:
    bruge8 .Llsl16_1_02_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_02_UGE_done
.Llsl16_1_02_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_02_UGE_done:
    brslt8 .Llsl16_1_02_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_02_SLT_done
.Llsl16_1_02_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_02_SLT_done:
    brsge8 .Llsl16_1_02_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_02_SGE_done
.Llsl16_1_02_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_02_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 3: lsl16.1 r0
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0080
    push16 r5
    pop16 r0
    ldi16 r5, 0xb4fd
    push16 r5
    pop16 r4
    lsl16.1 r0
    push16 r4
    push16 r0
    unary_print_target_guard
    breq8 .Llsl16_1_03_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_03_EQ_done
.Llsl16_1_03_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_03_EQ_done:
    brne8 .Llsl16_1_03_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_03_NE_done
.Llsl16_1_03_NE_true:
    unary_emit_char 'B'
.Llsl16_1_03_NE_done:
    brult8 .Llsl16_1_03_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_03_ULT_done
.Llsl16_1_03_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_03_ULT_done:
    bruge8 .Llsl16_1_03_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_03_UGE_done
.Llsl16_1_03_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_03_UGE_done:
    brslt8 .Llsl16_1_03_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_03_SLT_done
.Llsl16_1_03_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_03_SLT_done:
    brsge8 .Llsl16_1_03_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_03_SGE_done
.Llsl16_1_03_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_03_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 4: lsl16.1 r0
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r0
    ldi16 r4, 0xb651
    push16 r4
    pop16 r5
    lsl16.1 r0
    push16 r5
    push16 r0
    unary_print_target_guard
    breq8 .Llsl16_1_04_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_04_EQ_done
.Llsl16_1_04_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_04_EQ_done:
    brne8 .Llsl16_1_04_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_04_NE_done
.Llsl16_1_04_NE_true:
    unary_emit_char 'B'
.Llsl16_1_04_NE_done:
    brult8 .Llsl16_1_04_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_04_ULT_done
.Llsl16_1_04_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_04_ULT_done:
    bruge8 .Llsl16_1_04_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_04_UGE_done
.Llsl16_1_04_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_04_UGE_done:
    brslt8 .Llsl16_1_04_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_04_SLT_done
.Llsl16_1_04_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_04_SLT_done:
    brsge8 .Llsl16_1_04_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_04_SGE_done
.Llsl16_1_04_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_04_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 5: lsl16.1 r0
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r0
    ldi16 r4, 0xb7a5
    push16 r4
    pop16 r6
    lsl16.1 r0
    push16 r6
    push16 r0
    unary_print_target_guard
    breq8 .Llsl16_1_05_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_05_EQ_done
.Llsl16_1_05_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_05_EQ_done:
    brne8 .Llsl16_1_05_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_05_NE_done
.Llsl16_1_05_NE_true:
    unary_emit_char 'B'
.Llsl16_1_05_NE_done:
    brult8 .Llsl16_1_05_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_05_ULT_done
.Llsl16_1_05_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_05_ULT_done:
    bruge8 .Llsl16_1_05_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_05_UGE_done
.Llsl16_1_05_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_05_UGE_done:
    brslt8 .Llsl16_1_05_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_05_SLT_done
.Llsl16_1_05_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_05_SLT_done:
    brsge8 .Llsl16_1_05_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_05_SGE_done
.Llsl16_1_05_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_05_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 6: lsl16.1 r0
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r0
    ldi16 r4, 0xb8f9
    push16 r4
    pop16 r7
    lsl16.1 r0
    push16 r7
    push16 r0
    unary_print_target_guard
    breq8 .Llsl16_1_06_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_06_EQ_done
.Llsl16_1_06_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_06_EQ_done:
    brne8 .Llsl16_1_06_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_06_NE_done
.Llsl16_1_06_NE_true:
    unary_emit_char 'B'
.Llsl16_1_06_NE_done:
    brult8 .Llsl16_1_06_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_06_ULT_done
.Llsl16_1_06_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_06_ULT_done:
    bruge8 .Llsl16_1_06_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_06_UGE_done
.Llsl16_1_06_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_06_UGE_done:
    brslt8 .Llsl16_1_06_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_06_SLT_done
.Llsl16_1_06_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_06_SLT_done:
    brsge8 .Llsl16_1_06_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_06_SGE_done
.Llsl16_1_06_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_06_SGE_done:
    unary_emit_char '\n'

    ; Register r0, pattern 7: lsl16.1 r0
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r0
    ldi16 r4, 0xb346
    push16 r4
    pop16 r1
    lsl16.1 r0
    push16 r1
    push16 r0
    unary_print_target_guard
    breq8 .Llsl16_1_07_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_07_EQ_done
.Llsl16_1_07_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_07_EQ_done:
    brne8 .Llsl16_1_07_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_07_NE_done
.Llsl16_1_07_NE_true:
    unary_emit_char 'B'
.Llsl16_1_07_NE_done:
    brult8 .Llsl16_1_07_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_07_ULT_done
.Llsl16_1_07_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_07_ULT_done:
    bruge8 .Llsl16_1_07_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_07_UGE_done
.Llsl16_1_07_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_07_UGE_done:
    brslt8 .Llsl16_1_07_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_07_SLT_done
.Llsl16_1_07_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_07_SLT_done:
    brsge8 .Llsl16_1_07_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_07_SGE_done
.Llsl16_1_07_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_07_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 0: lsl16.1 r1
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0080
    push16 r4
    pop16 r1
    ldi16 r4, 0xb49a
    push16 r4
    pop16 r2
    lsl16.1 r1
    push16 r2
    push16 r1
    unary_print_target_guard
    breq8 .Llsl16_1_08_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_08_EQ_done
.Llsl16_1_08_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_08_EQ_done:
    brne8 .Llsl16_1_08_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_08_NE_done
.Llsl16_1_08_NE_true:
    unary_emit_char 'B'
.Llsl16_1_08_NE_done:
    brult8 .Llsl16_1_08_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_08_ULT_done
.Llsl16_1_08_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_08_ULT_done:
    bruge8 .Llsl16_1_08_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_08_UGE_done
.Llsl16_1_08_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_08_UGE_done:
    brslt8 .Llsl16_1_08_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_08_SLT_done
.Llsl16_1_08_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_08_SLT_done:
    brsge8 .Llsl16_1_08_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_08_SGE_done
.Llsl16_1_08_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_08_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 1: lsl16.1 r1
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r1
    ldi16 r4, 0xb5ee
    push16 r4
    pop16 r3
    lsl16.1 r1
    push16 r3
    push16 r1
    unary_print_target_guard
    breq8 .Llsl16_1_09_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_09_EQ_done
.Llsl16_1_09_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_09_EQ_done:
    brne8 .Llsl16_1_09_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_09_NE_done
.Llsl16_1_09_NE_true:
    unary_emit_char 'B'
.Llsl16_1_09_NE_done:
    brult8 .Llsl16_1_09_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_09_ULT_done
.Llsl16_1_09_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_09_ULT_done:
    bruge8 .Llsl16_1_09_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_09_UGE_done
.Llsl16_1_09_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_09_UGE_done:
    brslt8 .Llsl16_1_09_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_09_SLT_done
.Llsl16_1_09_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_09_SLT_done:
    brsge8 .Llsl16_1_09_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_09_SGE_done
.Llsl16_1_09_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_09_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 2: lsl16.1 r1
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0100
    push16 r5
    pop16 r1
    ldi16 r5, 0xb742
    push16 r5
    pop16 r4
    lsl16.1 r1
    push16 r4
    push16 r1
    unary_print_target_guard
    breq8 .Llsl16_1_0a_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0a_EQ_done
.Llsl16_1_0a_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_0a_EQ_done:
    brne8 .Llsl16_1_0a_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0a_NE_done
.Llsl16_1_0a_NE_true:
    unary_emit_char 'B'
.Llsl16_1_0a_NE_done:
    brult8 .Llsl16_1_0a_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0a_ULT_done
.Llsl16_1_0a_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_0a_ULT_done:
    bruge8 .Llsl16_1_0a_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0a_UGE_done
.Llsl16_1_0a_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_0a_UGE_done:
    brslt8 .Llsl16_1_0a_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0a_SLT_done
.Llsl16_1_0a_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_0a_SLT_done:
    brsge8 .Llsl16_1_0a_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0a_SGE_done
.Llsl16_1_0a_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_0a_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 3: lsl16.1 r1
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r1
    ldi16 r4, 0xb896
    push16 r4
    pop16 r5
    lsl16.1 r1
    push16 r5
    push16 r1
    unary_print_target_guard
    breq8 .Llsl16_1_0b_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0b_EQ_done
.Llsl16_1_0b_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_0b_EQ_done:
    brne8 .Llsl16_1_0b_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0b_NE_done
.Llsl16_1_0b_NE_true:
    unary_emit_char 'B'
.Llsl16_1_0b_NE_done:
    brult8 .Llsl16_1_0b_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0b_ULT_done
.Llsl16_1_0b_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_0b_ULT_done:
    bruge8 .Llsl16_1_0b_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0b_UGE_done
.Llsl16_1_0b_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_0b_UGE_done:
    brslt8 .Llsl16_1_0b_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0b_SLT_done
.Llsl16_1_0b_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_0b_SLT_done:
    brsge8 .Llsl16_1_0b_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0b_SGE_done
.Llsl16_1_0b_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_0b_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 4: lsl16.1 r1
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r1
    ldi16 r4, 0xb9ea
    push16 r4
    pop16 r6
    lsl16.1 r1
    push16 r6
    push16 r1
    unary_print_target_guard
    breq8 .Llsl16_1_0c_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0c_EQ_done
.Llsl16_1_0c_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_0c_EQ_done:
    brne8 .Llsl16_1_0c_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0c_NE_done
.Llsl16_1_0c_NE_true:
    unary_emit_char 'B'
.Llsl16_1_0c_NE_done:
    brult8 .Llsl16_1_0c_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0c_ULT_done
.Llsl16_1_0c_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_0c_ULT_done:
    bruge8 .Llsl16_1_0c_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0c_UGE_done
.Llsl16_1_0c_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_0c_UGE_done:
    brslt8 .Llsl16_1_0c_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0c_SLT_done
.Llsl16_1_0c_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_0c_SLT_done:
    brsge8 .Llsl16_1_0c_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0c_SGE_done
.Llsl16_1_0c_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_0c_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 5: lsl16.1 r1
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r1
    ldi16 r4, 0xbb3e
    push16 r4
    pop16 r7
    lsl16.1 r1
    push16 r7
    push16 r1
    unary_print_target_guard
    breq8 .Llsl16_1_0d_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0d_EQ_done
.Llsl16_1_0d_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_0d_EQ_done:
    brne8 .Llsl16_1_0d_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0d_NE_done
.Llsl16_1_0d_NE_true:
    unary_emit_char 'B'
.Llsl16_1_0d_NE_done:
    brult8 .Llsl16_1_0d_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0d_ULT_done
.Llsl16_1_0d_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_0d_ULT_done:
    bruge8 .Llsl16_1_0d_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0d_UGE_done
.Llsl16_1_0d_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_0d_UGE_done:
    brslt8 .Llsl16_1_0d_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0d_SLT_done
.Llsl16_1_0d_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_0d_SLT_done:
    brsge8 .Llsl16_1_0d_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0d_SGE_done
.Llsl16_1_0d_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_0d_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 6: lsl16.1 r1
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r1
    ldi16 r4, 0xb48a
    push16 r4
    pop16 r0
    lsl16.1 r1
    push16 r0
    push16 r1
    unary_print_target_guard
    breq8 .Llsl16_1_0e_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0e_EQ_done
.Llsl16_1_0e_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_0e_EQ_done:
    brne8 .Llsl16_1_0e_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0e_NE_done
.Llsl16_1_0e_NE_true:
    unary_emit_char 'B'
.Llsl16_1_0e_NE_done:
    brult8 .Llsl16_1_0e_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0e_ULT_done
.Llsl16_1_0e_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_0e_ULT_done:
    bruge8 .Llsl16_1_0e_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0e_UGE_done
.Llsl16_1_0e_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_0e_UGE_done:
    brslt8 .Llsl16_1_0e_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0e_SLT_done
.Llsl16_1_0e_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_0e_SLT_done:
    brsge8 .Llsl16_1_0e_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0e_SGE_done
.Llsl16_1_0e_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_0e_SGE_done:
    unary_emit_char '\n'

    ; Register r1, pattern 7: lsl16.1 r1
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x55aa
    push16 r4
    pop16 r1
    ldi16 r4, 0xb6df
    push16 r4
    pop16 r2
    lsl16.1 r1
    push16 r2
    push16 r1
    unary_print_target_guard
    breq8 .Llsl16_1_0f_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0f_EQ_done
.Llsl16_1_0f_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_0f_EQ_done:
    brne8 .Llsl16_1_0f_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0f_NE_done
.Llsl16_1_0f_NE_true:
    unary_emit_char 'B'
.Llsl16_1_0f_NE_done:
    brult8 .Llsl16_1_0f_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0f_ULT_done
.Llsl16_1_0f_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_0f_ULT_done:
    bruge8 .Llsl16_1_0f_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0f_UGE_done
.Llsl16_1_0f_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_0f_UGE_done:
    brslt8 .Llsl16_1_0f_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0f_SLT_done
.Llsl16_1_0f_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_0f_SLT_done:
    brsge8 .Llsl16_1_0f_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_0f_SGE_done
.Llsl16_1_0f_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_0f_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 0: lsl16.1 r2
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r2
    ldi16 r4, 0xb833
    push16 r4
    pop16 r3
    lsl16.1 r2
    push16 r3
    push16 r2
    unary_print_target_guard
    breq8 .Llsl16_1_10_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_10_EQ_done
.Llsl16_1_10_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_10_EQ_done:
    brne8 .Llsl16_1_10_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_10_NE_done
.Llsl16_1_10_NE_true:
    unary_emit_char 'B'
.Llsl16_1_10_NE_done:
    brult8 .Llsl16_1_10_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_10_ULT_done
.Llsl16_1_10_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_10_ULT_done:
    bruge8 .Llsl16_1_10_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_10_UGE_done
.Llsl16_1_10_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_10_UGE_done:
    brslt8 .Llsl16_1_10_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_10_SLT_done
.Llsl16_1_10_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_10_SLT_done:
    brsge8 .Llsl16_1_10_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_10_SGE_done
.Llsl16_1_10_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_10_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 1: lsl16.1 r2
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x8000
    push16 r5
    pop16 r2
    ldi16 r5, 0xb987
    push16 r5
    pop16 r4
    lsl16.1 r2
    push16 r4
    push16 r2
    unary_print_target_guard
    breq8 .Llsl16_1_11_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_11_EQ_done
.Llsl16_1_11_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_11_EQ_done:
    brne8 .Llsl16_1_11_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_11_NE_done
.Llsl16_1_11_NE_true:
    unary_emit_char 'B'
.Llsl16_1_11_NE_done:
    brult8 .Llsl16_1_11_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_11_ULT_done
.Llsl16_1_11_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_11_ULT_done:
    bruge8 .Llsl16_1_11_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_11_UGE_done
.Llsl16_1_11_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_11_UGE_done:
    brslt8 .Llsl16_1_11_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_11_SLT_done
.Llsl16_1_11_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_11_SLT_done:
    brsge8 .Llsl16_1_11_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_11_SGE_done
.Llsl16_1_11_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_11_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 2: lsl16.1 r2
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r2
    ldi16 r4, 0xbadb
    push16 r4
    pop16 r5
    lsl16.1 r2
    push16 r5
    push16 r2
    unary_print_target_guard
    breq8 .Llsl16_1_12_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_12_EQ_done
.Llsl16_1_12_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_12_EQ_done:
    brne8 .Llsl16_1_12_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_12_NE_done
.Llsl16_1_12_NE_true:
    unary_emit_char 'B'
.Llsl16_1_12_NE_done:
    brult8 .Llsl16_1_12_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_12_ULT_done
.Llsl16_1_12_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_12_ULT_done:
    bruge8 .Llsl16_1_12_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_12_UGE_done
.Llsl16_1_12_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_12_UGE_done:
    brslt8 .Llsl16_1_12_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_12_SLT_done
.Llsl16_1_12_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_12_SLT_done:
    brsge8 .Llsl16_1_12_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_12_SGE_done
.Llsl16_1_12_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_12_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 3: lsl16.1 r2
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r2
    ldi16 r4, 0xbc2f
    push16 r4
    pop16 r6
    lsl16.1 r2
    push16 r6
    push16 r2
    unary_print_target_guard
    breq8 .Llsl16_1_13_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_13_EQ_done
.Llsl16_1_13_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_13_EQ_done:
    brne8 .Llsl16_1_13_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_13_NE_done
.Llsl16_1_13_NE_true:
    unary_emit_char 'B'
.Llsl16_1_13_NE_done:
    brult8 .Llsl16_1_13_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_13_ULT_done
.Llsl16_1_13_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_13_ULT_done:
    bruge8 .Llsl16_1_13_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_13_UGE_done
.Llsl16_1_13_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_13_UGE_done:
    brslt8 .Llsl16_1_13_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_13_SLT_done
.Llsl16_1_13_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_13_SLT_done:
    brsge8 .Llsl16_1_13_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_13_SGE_done
.Llsl16_1_13_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_13_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 4: lsl16.1 r2
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x55aa
    push16 r4
    pop16 r2
    ldi16 r4, 0xbd83
    push16 r4
    pop16 r7
    lsl16.1 r2
    push16 r7
    push16 r2
    unary_print_target_guard
    breq8 .Llsl16_1_14_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_14_EQ_done
.Llsl16_1_14_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_14_EQ_done:
    brne8 .Llsl16_1_14_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_14_NE_done
.Llsl16_1_14_NE_true:
    unary_emit_char 'B'
.Llsl16_1_14_NE_done:
    brult8 .Llsl16_1_14_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_14_ULT_done
.Llsl16_1_14_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_14_ULT_done:
    bruge8 .Llsl16_1_14_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_14_UGE_done
.Llsl16_1_14_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_14_UGE_done:
    brslt8 .Llsl16_1_14_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_14_SLT_done
.Llsl16_1_14_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_14_SLT_done:
    brsge8 .Llsl16_1_14_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_14_SGE_done
.Llsl16_1_14_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_14_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 5: lsl16.1 r2
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r2
    ldi16 r4, 0xb6cf
    push16 r4
    pop16 r0
    lsl16.1 r2
    push16 r0
    push16 r2
    unary_print_target_guard
    breq8 .Llsl16_1_15_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_15_EQ_done
.Llsl16_1_15_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_15_EQ_done:
    brne8 .Llsl16_1_15_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_15_NE_done
.Llsl16_1_15_NE_true:
    unary_emit_char 'B'
.Llsl16_1_15_NE_done:
    brult8 .Llsl16_1_15_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_15_ULT_done
.Llsl16_1_15_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_15_ULT_done:
    bruge8 .Llsl16_1_15_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_15_UGE_done
.Llsl16_1_15_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_15_UGE_done:
    brslt8 .Llsl16_1_15_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_15_SLT_done
.Llsl16_1_15_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_15_SLT_done:
    brsge8 .Llsl16_1_15_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_15_SGE_done
.Llsl16_1_15_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_15_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 6: lsl16.1 r2
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xfedc
    push16 r4
    pop16 r2
    ldi16 r4, 0xb823
    push16 r4
    pop16 r1
    lsl16.1 r2
    push16 r1
    push16 r2
    unary_print_target_guard
    breq8 .Llsl16_1_16_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_16_EQ_done
.Llsl16_1_16_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_16_EQ_done:
    brne8 .Llsl16_1_16_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_16_NE_done
.Llsl16_1_16_NE_true:
    unary_emit_char 'B'
.Llsl16_1_16_NE_done:
    brult8 .Llsl16_1_16_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_16_ULT_done
.Llsl16_1_16_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_16_ULT_done:
    bruge8 .Llsl16_1_16_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_16_UGE_done
.Llsl16_1_16_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_16_UGE_done:
    brslt8 .Llsl16_1_16_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_16_SLT_done
.Llsl16_1_16_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_16_SLT_done:
    brsge8 .Llsl16_1_16_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_16_SGE_done
.Llsl16_1_16_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_16_SGE_done:
    unary_emit_char '\n'

    ; Register r2, pattern 7: lsl16.1 r2
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4000
    push16 r4
    pop16 r2
    ldi16 r4, 0xba78
    push16 r4
    pop16 r3
    lsl16.1 r2
    push16 r3
    push16 r2
    unary_print_target_guard
    breq8 .Llsl16_1_17_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_17_EQ_done
.Llsl16_1_17_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_17_EQ_done:
    brne8 .Llsl16_1_17_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_17_NE_done
.Llsl16_1_17_NE_true:
    unary_emit_char 'B'
.Llsl16_1_17_NE_done:
    brult8 .Llsl16_1_17_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_17_ULT_done
.Llsl16_1_17_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_17_ULT_done:
    bruge8 .Llsl16_1_17_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_17_UGE_done
.Llsl16_1_17_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_17_UGE_done:
    brslt8 .Llsl16_1_17_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_17_SLT_done
.Llsl16_1_17_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_17_SLT_done:
    brsge8 .Llsl16_1_17_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_17_SGE_done
.Llsl16_1_17_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_17_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 0: lsl16.1 r3
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r3
    ldi16 r5, 0xbbcc
    push16 r5
    pop16 r4
    lsl16.1 r3
    push16 r4
    push16 r3
    unary_print_target_guard
    breq8 .Llsl16_1_18_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_18_EQ_done
.Llsl16_1_18_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_18_EQ_done:
    brne8 .Llsl16_1_18_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_18_NE_done
.Llsl16_1_18_NE_true:
    unary_emit_char 'B'
.Llsl16_1_18_NE_done:
    brult8 .Llsl16_1_18_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_18_ULT_done
.Llsl16_1_18_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_18_ULT_done:
    bruge8 .Llsl16_1_18_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_18_UGE_done
.Llsl16_1_18_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_18_UGE_done:
    brslt8 .Llsl16_1_18_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_18_SLT_done
.Llsl16_1_18_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_18_SLT_done:
    brsge8 .Llsl16_1_18_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_18_SGE_done
.Llsl16_1_18_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_18_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 1: lsl16.1 r3
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x55aa
    push16 r4
    pop16 r3
    ldi16 r4, 0xbd20
    push16 r4
    pop16 r5
    lsl16.1 r3
    push16 r5
    push16 r3
    unary_print_target_guard
    breq8 .Llsl16_1_19_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_19_EQ_done
.Llsl16_1_19_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_19_EQ_done:
    brne8 .Llsl16_1_19_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_19_NE_done
.Llsl16_1_19_NE_true:
    unary_emit_char 'B'
.Llsl16_1_19_NE_done:
    brult8 .Llsl16_1_19_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_19_ULT_done
.Llsl16_1_19_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_19_ULT_done:
    bruge8 .Llsl16_1_19_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_19_UGE_done
.Llsl16_1_19_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_19_UGE_done:
    brslt8 .Llsl16_1_19_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_19_SLT_done
.Llsl16_1_19_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_19_SLT_done:
    brsge8 .Llsl16_1_19_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_19_SGE_done
.Llsl16_1_19_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_19_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 2: lsl16.1 r3
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r3
    ldi16 r4, 0xbe74
    push16 r4
    pop16 r6
    lsl16.1 r3
    push16 r6
    push16 r3
    unary_print_target_guard
    breq8 .Llsl16_1_1a_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1a_EQ_done
.Llsl16_1_1a_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_1a_EQ_done:
    brne8 .Llsl16_1_1a_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1a_NE_done
.Llsl16_1_1a_NE_true:
    unary_emit_char 'B'
.Llsl16_1_1a_NE_done:
    brult8 .Llsl16_1_1a_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1a_ULT_done
.Llsl16_1_1a_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_1a_ULT_done:
    bruge8 .Llsl16_1_1a_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1a_UGE_done
.Llsl16_1_1a_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_1a_UGE_done:
    brslt8 .Llsl16_1_1a_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1a_SLT_done
.Llsl16_1_1a_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_1a_SLT_done:
    brsge8 .Llsl16_1_1a_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1a_SGE_done
.Llsl16_1_1a_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_1a_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 3: lsl16.1 r3
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xfedc
    push16 r4
    pop16 r3
    ldi16 r4, 0xbfc8
    push16 r4
    pop16 r7
    lsl16.1 r3
    push16 r7
    push16 r3
    unary_print_target_guard
    breq8 .Llsl16_1_1b_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1b_EQ_done
.Llsl16_1_1b_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_1b_EQ_done:
    brne8 .Llsl16_1_1b_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1b_NE_done
.Llsl16_1_1b_NE_true:
    unary_emit_char 'B'
.Llsl16_1_1b_NE_done:
    brult8 .Llsl16_1_1b_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1b_ULT_done
.Llsl16_1_1b_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_1b_ULT_done:
    bruge8 .Llsl16_1_1b_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1b_UGE_done
.Llsl16_1_1b_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_1b_UGE_done:
    brslt8 .Llsl16_1_1b_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1b_SLT_done
.Llsl16_1_1b_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_1b_SLT_done:
    brsge8 .Llsl16_1_1b_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1b_SGE_done
.Llsl16_1_1b_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_1b_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 4: lsl16.1 r3
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4000
    push16 r4
    pop16 r3
    ldi16 r4, 0xb914
    push16 r4
    pop16 r0
    lsl16.1 r3
    push16 r0
    push16 r3
    unary_print_target_guard
    breq8 .Llsl16_1_1c_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1c_EQ_done
.Llsl16_1_1c_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_1c_EQ_done:
    brne8 .Llsl16_1_1c_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1c_NE_done
.Llsl16_1_1c_NE_true:
    unary_emit_char 'B'
.Llsl16_1_1c_NE_done:
    brult8 .Llsl16_1_1c_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1c_ULT_done
.Llsl16_1_1c_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_1c_ULT_done:
    bruge8 .Llsl16_1_1c_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1c_UGE_done
.Llsl16_1_1c_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_1c_UGE_done:
    brslt8 .Llsl16_1_1c_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1c_SLT_done
.Llsl16_1_1c_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_1c_SLT_done:
    brsge8 .Llsl16_1_1c_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1c_SGE_done
.Llsl16_1_1c_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_1c_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 5: lsl16.1 r3
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xc000
    push16 r4
    pop16 r3
    ldi16 r4, 0xba68
    push16 r4
    pop16 r1
    lsl16.1 r3
    push16 r1
    push16 r3
    unary_print_target_guard
    breq8 .Llsl16_1_1d_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1d_EQ_done
.Llsl16_1_1d_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_1d_EQ_done:
    brne8 .Llsl16_1_1d_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1d_NE_done
.Llsl16_1_1d_NE_true:
    unary_emit_char 'B'
.Llsl16_1_1d_NE_done:
    brult8 .Llsl16_1_1d_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1d_ULT_done
.Llsl16_1_1d_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_1d_ULT_done:
    bruge8 .Llsl16_1_1d_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1d_UGE_done
.Llsl16_1_1d_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_1d_UGE_done:
    brslt8 .Llsl16_1_1d_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1d_SLT_done
.Llsl16_1_1d_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_1d_SLT_done:
    brsge8 .Llsl16_1_1d_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1d_SGE_done
.Llsl16_1_1d_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_1d_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 6: lsl16.1 r3
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r3
    ldi16 r4, 0xbbbc
    push16 r4
    pop16 r2
    lsl16.1 r3
    push16 r2
    push16 r3
    unary_print_target_guard
    breq8 .Llsl16_1_1e_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1e_EQ_done
.Llsl16_1_1e_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_1e_EQ_done:
    brne8 .Llsl16_1_1e_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1e_NE_done
.Llsl16_1_1e_NE_true:
    unary_emit_char 'B'
.Llsl16_1_1e_NE_done:
    brult8 .Llsl16_1_1e_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1e_ULT_done
.Llsl16_1_1e_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_1e_ULT_done:
    bruge8 .Llsl16_1_1e_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1e_UGE_done
.Llsl16_1_1e_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_1e_UGE_done:
    brslt8 .Llsl16_1_1e_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1e_SLT_done
.Llsl16_1_1e_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_1e_SLT_done:
    brsge8 .Llsl16_1_1e_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1e_SGE_done
.Llsl16_1_1e_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_1e_SGE_done:
    unary_emit_char '\n'

    ; Register r3, pattern 7: lsl16.1 r3
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r3
    ldi16 r5, 0xbe11
    push16 r5
    pop16 r4
    lsl16.1 r3
    push16 r4
    push16 r3
    unary_print_target_guard
    breq8 .Llsl16_1_1f_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1f_EQ_done
.Llsl16_1_1f_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_1f_EQ_done:
    brne8 .Llsl16_1_1f_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1f_NE_done
.Llsl16_1_1f_NE_true:
    unary_emit_char 'B'
.Llsl16_1_1f_NE_done:
    brult8 .Llsl16_1_1f_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1f_ULT_done
.Llsl16_1_1f_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_1f_ULT_done:
    bruge8 .Llsl16_1_1f_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1f_UGE_done
.Llsl16_1_1f_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_1f_UGE_done:
    brslt8 .Llsl16_1_1f_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1f_SLT_done
.Llsl16_1_1f_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_1f_SLT_done:
    brsge8 .Llsl16_1_1f_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_1f_SGE_done
.Llsl16_1_1f_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_1f_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 0: lsl16.1 r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r6, 0xfedc
    push16 r6
    pop16 r4
    ldi16 r6, 0xbf65
    push16 r6
    pop16 r5
    lsl16.1 r4
    push16 r5
    push16 r4
    unary_print_target_guard
    breq8 .Llsl16_1_20_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_20_EQ_done
.Llsl16_1_20_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_20_EQ_done:
    brne8 .Llsl16_1_20_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_20_NE_done
.Llsl16_1_20_NE_true:
    unary_emit_char 'B'
.Llsl16_1_20_NE_done:
    brult8 .Llsl16_1_20_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_20_ULT_done
.Llsl16_1_20_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_20_ULT_done:
    bruge8 .Llsl16_1_20_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_20_UGE_done
.Llsl16_1_20_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_20_UGE_done:
    brslt8 .Llsl16_1_20_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_20_SLT_done
.Llsl16_1_20_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_20_SLT_done:
    brsge8 .Llsl16_1_20_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_20_SGE_done
.Llsl16_1_20_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_20_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 1: lsl16.1 r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x4000
    push16 r5
    pop16 r4
    ldi16 r5, 0xc0b9
    push16 r5
    pop16 r6
    lsl16.1 r4
    push16 r6
    push16 r4
    unary_print_target_guard
    breq8 .Llsl16_1_21_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_21_EQ_done
.Llsl16_1_21_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_21_EQ_done:
    brne8 .Llsl16_1_21_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_21_NE_done
.Llsl16_1_21_NE_true:
    unary_emit_char 'B'
.Llsl16_1_21_NE_done:
    brult8 .Llsl16_1_21_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_21_ULT_done
.Llsl16_1_21_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_21_ULT_done:
    bruge8 .Llsl16_1_21_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_21_UGE_done
.Llsl16_1_21_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_21_UGE_done:
    brslt8 .Llsl16_1_21_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_21_SLT_done
.Llsl16_1_21_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_21_SLT_done:
    brsge8 .Llsl16_1_21_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_21_SGE_done
.Llsl16_1_21_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_21_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 2: lsl16.1 r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xc000
    push16 r5
    pop16 r4
    ldi16 r5, 0xc20d
    push16 r5
    pop16 r7
    lsl16.1 r4
    push16 r7
    push16 r4
    unary_print_target_guard
    breq8 .Llsl16_1_22_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_22_EQ_done
.Llsl16_1_22_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_22_EQ_done:
    brne8 .Llsl16_1_22_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_22_NE_done
.Llsl16_1_22_NE_true:
    unary_emit_char 'B'
.Llsl16_1_22_NE_done:
    brult8 .Llsl16_1_22_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_22_ULT_done
.Llsl16_1_22_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_22_ULT_done:
    bruge8 .Llsl16_1_22_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_22_UGE_done
.Llsl16_1_22_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_22_UGE_done:
    brslt8 .Llsl16_1_22_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_22_SLT_done
.Llsl16_1_22_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_22_SLT_done:
    brsge8 .Llsl16_1_22_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_22_SGE_done
.Llsl16_1_22_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_22_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 3: lsl16.1 r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x8001
    push16 r5
    pop16 r4
    ldi16 r5, 0xbb59
    push16 r5
    pop16 r0
    lsl16.1 r4
    push16 r0
    push16 r4
    unary_print_target_guard
    breq8 .Llsl16_1_23_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_23_EQ_done
.Llsl16_1_23_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_23_EQ_done:
    brne8 .Llsl16_1_23_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_23_NE_done
.Llsl16_1_23_NE_true:
    unary_emit_char 'B'
.Llsl16_1_23_NE_done:
    brult8 .Llsl16_1_23_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_23_ULT_done
.Llsl16_1_23_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_23_ULT_done:
    bruge8 .Llsl16_1_23_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_23_UGE_done
.Llsl16_1_23_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_23_UGE_done:
    brslt8 .Llsl16_1_23_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_23_SLT_done
.Llsl16_1_23_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_23_SLT_done:
    brsge8 .Llsl16_1_23_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_23_SGE_done
.Llsl16_1_23_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_23_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 4: lsl16.1 r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r4
    ldi16 r5, 0xbcad
    push16 r5
    pop16 r1
    lsl16.1 r4
    push16 r1
    push16 r4
    unary_print_target_guard
    breq8 .Llsl16_1_24_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_24_EQ_done
.Llsl16_1_24_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_24_EQ_done:
    brne8 .Llsl16_1_24_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_24_NE_done
.Llsl16_1_24_NE_true:
    unary_emit_char 'B'
.Llsl16_1_24_NE_done:
    brult8 .Llsl16_1_24_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_24_ULT_done
.Llsl16_1_24_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_24_ULT_done:
    bruge8 .Llsl16_1_24_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_24_UGE_done
.Llsl16_1_24_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_24_UGE_done:
    brslt8 .Llsl16_1_24_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_24_SLT_done
.Llsl16_1_24_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_24_SLT_done:
    brsge8 .Llsl16_1_24_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_24_SGE_done
.Llsl16_1_24_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_24_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 5: lsl16.1 r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x0001
    push16 r5
    pop16 r4
    ldi16 r5, 0xbe01
    push16 r5
    pop16 r2
    lsl16.1 r4
    push16 r2
    push16 r4
    unary_print_target_guard
    breq8 .Llsl16_1_25_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_25_EQ_done
.Llsl16_1_25_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_25_EQ_done:
    brne8 .Llsl16_1_25_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_25_NE_done
.Llsl16_1_25_NE_true:
    unary_emit_char 'B'
.Llsl16_1_25_NE_done:
    brult8 .Llsl16_1_25_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_25_ULT_done
.Llsl16_1_25_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_25_ULT_done:
    bruge8 .Llsl16_1_25_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_25_UGE_done
.Llsl16_1_25_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_25_UGE_done:
    brslt8 .Llsl16_1_25_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_25_SLT_done
.Llsl16_1_25_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_25_SLT_done:
    brsge8 .Llsl16_1_25_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_25_SGE_done
.Llsl16_1_25_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_25_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 6: lsl16.1 r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x007f
    push16 r5
    pop16 r4
    ldi16 r5, 0xbf55
    push16 r5
    pop16 r3
    lsl16.1 r4
    push16 r3
    push16 r4
    unary_print_target_guard
    breq8 .Llsl16_1_26_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_26_EQ_done
.Llsl16_1_26_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_26_EQ_done:
    brne8 .Llsl16_1_26_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_26_NE_done
.Llsl16_1_26_NE_true:
    unary_emit_char 'B'
.Llsl16_1_26_NE_done:
    brult8 .Llsl16_1_26_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_26_ULT_done
.Llsl16_1_26_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_26_ULT_done:
    bruge8 .Llsl16_1_26_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_26_UGE_done
.Llsl16_1_26_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_26_UGE_done:
    brslt8 .Llsl16_1_26_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_26_SLT_done
.Llsl16_1_26_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_26_SLT_done:
    brsge8 .Llsl16_1_26_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_26_SGE_done
.Llsl16_1_26_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_26_SGE_done:
    unary_emit_char '\n'

    ; Register r4, pattern 7: lsl16.1 r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x0080
    push16 r6
    pop16 r4
    ldi16 r6, 0xc1aa
    push16 r6
    pop16 r5
    lsl16.1 r4
    push16 r5
    push16 r4
    unary_print_target_guard
    breq8 .Llsl16_1_27_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_27_EQ_done
.Llsl16_1_27_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_27_EQ_done:
    brne8 .Llsl16_1_27_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_27_NE_done
.Llsl16_1_27_NE_true:
    unary_emit_char 'B'
.Llsl16_1_27_NE_done:
    brult8 .Llsl16_1_27_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_27_ULT_done
.Llsl16_1_27_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_27_ULT_done:
    bruge8 .Llsl16_1_27_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_27_UGE_done
.Llsl16_1_27_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_27_UGE_done:
    brslt8 .Llsl16_1_27_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_27_SLT_done
.Llsl16_1_27_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_27_SLT_done:
    brsge8 .Llsl16_1_27_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_27_SGE_done
.Llsl16_1_27_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_27_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 0: lsl16.1 r5
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r5
    ldi16 r4, 0xc2fe
    push16 r4
    pop16 r6
    lsl16.1 r5
    push16 r6
    push16 r5
    unary_print_target_guard
    breq8 .Llsl16_1_28_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_28_EQ_done
.Llsl16_1_28_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_28_EQ_done:
    brne8 .Llsl16_1_28_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_28_NE_done
.Llsl16_1_28_NE_true:
    unary_emit_char 'B'
.Llsl16_1_28_NE_done:
    brult8 .Llsl16_1_28_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_28_ULT_done
.Llsl16_1_28_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_28_ULT_done:
    bruge8 .Llsl16_1_28_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_28_UGE_done
.Llsl16_1_28_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_28_UGE_done:
    brslt8 .Llsl16_1_28_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_28_SLT_done
.Llsl16_1_28_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_28_SLT_done:
    brsge8 .Llsl16_1_28_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_28_SGE_done
.Llsl16_1_28_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_28_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 1: lsl16.1 r5
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r5
    ldi16 r4, 0xc452
    push16 r4
    pop16 r7
    lsl16.1 r5
    push16 r7
    push16 r5
    unary_print_target_guard
    breq8 .Llsl16_1_29_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_29_EQ_done
.Llsl16_1_29_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_29_EQ_done:
    brne8 .Llsl16_1_29_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_29_NE_done
.Llsl16_1_29_NE_true:
    unary_emit_char 'B'
.Llsl16_1_29_NE_done:
    brult8 .Llsl16_1_29_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_29_ULT_done
.Llsl16_1_29_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_29_ULT_done:
    bruge8 .Llsl16_1_29_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_29_UGE_done
.Llsl16_1_29_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_29_UGE_done:
    brslt8 .Llsl16_1_29_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_29_SLT_done
.Llsl16_1_29_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_29_SLT_done:
    brsge8 .Llsl16_1_29_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_29_SGE_done
.Llsl16_1_29_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_29_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 2: lsl16.1 r5
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    pop16 r5
    ldi16 r4, 0xbd9e
    push16 r4
    pop16 r0
    lsl16.1 r5
    push16 r0
    push16 r5
    unary_print_target_guard
    breq8 .Llsl16_1_2a_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2a_EQ_done
.Llsl16_1_2a_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_2a_EQ_done:
    brne8 .Llsl16_1_2a_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2a_NE_done
.Llsl16_1_2a_NE_true:
    unary_emit_char 'B'
.Llsl16_1_2a_NE_done:
    brult8 .Llsl16_1_2a_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2a_ULT_done
.Llsl16_1_2a_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_2a_ULT_done:
    bruge8 .Llsl16_1_2a_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2a_UGE_done
.Llsl16_1_2a_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_2a_UGE_done:
    brslt8 .Llsl16_1_2a_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2a_SLT_done
.Llsl16_1_2a_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_2a_SLT_done:
    brsge8 .Llsl16_1_2a_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2a_SGE_done
.Llsl16_1_2a_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_2a_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 3: lsl16.1 r5
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x007f
    push16 r4
    pop16 r5
    ldi16 r4, 0xbef2
    push16 r4
    pop16 r1
    lsl16.1 r5
    push16 r1
    push16 r5
    unary_print_target_guard
    breq8 .Llsl16_1_2b_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2b_EQ_done
.Llsl16_1_2b_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_2b_EQ_done:
    brne8 .Llsl16_1_2b_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2b_NE_done
.Llsl16_1_2b_NE_true:
    unary_emit_char 'B'
.Llsl16_1_2b_NE_done:
    brult8 .Llsl16_1_2b_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2b_ULT_done
.Llsl16_1_2b_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_2b_ULT_done:
    bruge8 .Llsl16_1_2b_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2b_UGE_done
.Llsl16_1_2b_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_2b_UGE_done:
    brslt8 .Llsl16_1_2b_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2b_SLT_done
.Llsl16_1_2b_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_2b_SLT_done:
    brsge8 .Llsl16_1_2b_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2b_SGE_done
.Llsl16_1_2b_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_2b_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 4: lsl16.1 r5
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0080
    push16 r4
    pop16 r5
    ldi16 r4, 0xc046
    push16 r4
    pop16 r2
    lsl16.1 r5
    push16 r2
    push16 r5
    unary_print_target_guard
    breq8 .Llsl16_1_2c_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2c_EQ_done
.Llsl16_1_2c_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_2c_EQ_done:
    brne8 .Llsl16_1_2c_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2c_NE_done
.Llsl16_1_2c_NE_true:
    unary_emit_char 'B'
.Llsl16_1_2c_NE_done:
    brult8 .Llsl16_1_2c_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2c_ULT_done
.Llsl16_1_2c_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_2c_ULT_done:
    bruge8 .Llsl16_1_2c_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2c_UGE_done
.Llsl16_1_2c_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_2c_UGE_done:
    brslt8 .Llsl16_1_2c_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2c_SLT_done
.Llsl16_1_2c_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_2c_SLT_done:
    brsge8 .Llsl16_1_2c_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2c_SGE_done
.Llsl16_1_2c_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_2c_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 5: lsl16.1 r5
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r5
    ldi16 r4, 0xc19a
    push16 r4
    pop16 r3
    lsl16.1 r5
    push16 r3
    push16 r5
    unary_print_target_guard
    breq8 .Llsl16_1_2d_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2d_EQ_done
.Llsl16_1_2d_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_2d_EQ_done:
    brne8 .Llsl16_1_2d_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2d_NE_done
.Llsl16_1_2d_NE_true:
    unary_emit_char 'B'
.Llsl16_1_2d_NE_done:
    brult8 .Llsl16_1_2d_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2d_ULT_done
.Llsl16_1_2d_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_2d_ULT_done:
    bruge8 .Llsl16_1_2d_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2d_UGE_done
.Llsl16_1_2d_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_2d_UGE_done:
    brslt8 .Llsl16_1_2d_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2d_SLT_done
.Llsl16_1_2d_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_2d_SLT_done:
    brsge8 .Llsl16_1_2d_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2d_SGE_done
.Llsl16_1_2d_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_2d_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 6: lsl16.1 r5
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x0100
    push16 r6
    pop16 r5
    ldi16 r6, 0xc2ee
    push16 r6
    pop16 r4
    lsl16.1 r5
    push16 r4
    push16 r5
    unary_print_target_guard
    breq8 .Llsl16_1_2e_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2e_EQ_done
.Llsl16_1_2e_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_2e_EQ_done:
    brne8 .Llsl16_1_2e_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2e_NE_done
.Llsl16_1_2e_NE_true:
    unary_emit_char 'B'
.Llsl16_1_2e_NE_done:
    brult8 .Llsl16_1_2e_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2e_ULT_done
.Llsl16_1_2e_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_2e_ULT_done:
    bruge8 .Llsl16_1_2e_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2e_UGE_done
.Llsl16_1_2e_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_2e_UGE_done:
    brslt8 .Llsl16_1_2e_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2e_SLT_done
.Llsl16_1_2e_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_2e_SLT_done:
    brsge8 .Llsl16_1_2e_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2e_SGE_done
.Llsl16_1_2e_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_2e_SGE_done:
    unary_emit_char '\n'

    ; Register r5, pattern 7: lsl16.1 r5
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r5
    ldi16 r4, 0xc543
    push16 r4
    pop16 r6
    lsl16.1 r5
    push16 r6
    push16 r5
    unary_print_target_guard
    breq8 .Llsl16_1_2f_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2f_EQ_done
.Llsl16_1_2f_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_2f_EQ_done:
    brne8 .Llsl16_1_2f_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2f_NE_done
.Llsl16_1_2f_NE_true:
    unary_emit_char 'B'
.Llsl16_1_2f_NE_done:
    brult8 .Llsl16_1_2f_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2f_ULT_done
.Llsl16_1_2f_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_2f_ULT_done:
    bruge8 .Llsl16_1_2f_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2f_UGE_done
.Llsl16_1_2f_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_2f_UGE_done:
    brslt8 .Llsl16_1_2f_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2f_SLT_done
.Llsl16_1_2f_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_2f_SLT_done:
    brsge8 .Llsl16_1_2f_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_2f_SGE_done
.Llsl16_1_2f_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_2f_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 0: lsl16.1 r6
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x007f
    push16 r4
    pop16 r6
    ldi16 r4, 0xc697
    push16 r4
    pop16 r7
    lsl16.1 r6
    push16 r7
    push16 r6
    unary_print_target_guard
    breq8 .Llsl16_1_30_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_30_EQ_done
.Llsl16_1_30_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_30_EQ_done:
    brne8 .Llsl16_1_30_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_30_NE_done
.Llsl16_1_30_NE_true:
    unary_emit_char 'B'
.Llsl16_1_30_NE_done:
    brult8 .Llsl16_1_30_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_30_ULT_done
.Llsl16_1_30_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_30_ULT_done:
    bruge8 .Llsl16_1_30_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_30_UGE_done
.Llsl16_1_30_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_30_UGE_done:
    brslt8 .Llsl16_1_30_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_30_SLT_done
.Llsl16_1_30_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_30_SLT_done:
    brsge8 .Llsl16_1_30_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_30_SGE_done
.Llsl16_1_30_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_30_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 1: lsl16.1 r6
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0080
    push16 r4
    pop16 r6
    ldi16 r4, 0xbfe3
    push16 r4
    pop16 r0
    lsl16.1 r6
    push16 r0
    push16 r6
    unary_print_target_guard
    breq8 .Llsl16_1_31_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_31_EQ_done
.Llsl16_1_31_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_31_EQ_done:
    brne8 .Llsl16_1_31_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_31_NE_done
.Llsl16_1_31_NE_true:
    unary_emit_char 'B'
.Llsl16_1_31_NE_done:
    brult8 .Llsl16_1_31_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_31_ULT_done
.Llsl16_1_31_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_31_ULT_done:
    bruge8 .Llsl16_1_31_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_31_UGE_done
.Llsl16_1_31_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_31_UGE_done:
    brslt8 .Llsl16_1_31_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_31_SLT_done
.Llsl16_1_31_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_31_SLT_done:
    brsge8 .Llsl16_1_31_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_31_SGE_done
.Llsl16_1_31_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_31_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 2: lsl16.1 r6
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r6
    ldi16 r4, 0xc137
    push16 r4
    pop16 r1
    lsl16.1 r6
    push16 r1
    push16 r6
    unary_print_target_guard
    breq8 .Llsl16_1_32_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_32_EQ_done
.Llsl16_1_32_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_32_EQ_done:
    brne8 .Llsl16_1_32_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_32_NE_done
.Llsl16_1_32_NE_true:
    unary_emit_char 'B'
.Llsl16_1_32_NE_done:
    brult8 .Llsl16_1_32_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_32_ULT_done
.Llsl16_1_32_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_32_ULT_done:
    bruge8 .Llsl16_1_32_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_32_UGE_done
.Llsl16_1_32_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_32_UGE_done:
    brslt8 .Llsl16_1_32_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_32_SLT_done
.Llsl16_1_32_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_32_SLT_done:
    brsge8 .Llsl16_1_32_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_32_SGE_done
.Llsl16_1_32_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_32_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 3: lsl16.1 r6
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r6
    ldi16 r4, 0xc28b
    push16 r4
    pop16 r2
    lsl16.1 r6
    push16 r2
    push16 r6
    unary_print_target_guard
    breq8 .Llsl16_1_33_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_33_EQ_done
.Llsl16_1_33_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_33_EQ_done:
    brne8 .Llsl16_1_33_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_33_NE_done
.Llsl16_1_33_NE_true:
    unary_emit_char 'B'
.Llsl16_1_33_NE_done:
    brult8 .Llsl16_1_33_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_33_ULT_done
.Llsl16_1_33_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_33_ULT_done:
    bruge8 .Llsl16_1_33_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_33_UGE_done
.Llsl16_1_33_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_33_UGE_done:
    brslt8 .Llsl16_1_33_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_33_SLT_done
.Llsl16_1_33_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_33_SLT_done:
    brsge8 .Llsl16_1_33_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_33_SGE_done
.Llsl16_1_33_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_33_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 4: lsl16.1 r6
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r6
    ldi16 r4, 0xc3df
    push16 r4
    pop16 r3
    lsl16.1 r6
    push16 r3
    push16 r6
    unary_print_target_guard
    breq8 .Llsl16_1_34_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_34_EQ_done
.Llsl16_1_34_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_34_EQ_done:
    brne8 .Llsl16_1_34_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_34_NE_done
.Llsl16_1_34_NE_true:
    unary_emit_char 'B'
.Llsl16_1_34_NE_done:
    brult8 .Llsl16_1_34_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_34_ULT_done
.Llsl16_1_34_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_34_ULT_done:
    bruge8 .Llsl16_1_34_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_34_UGE_done
.Llsl16_1_34_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_34_UGE_done:
    brslt8 .Llsl16_1_34_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_34_SLT_done
.Llsl16_1_34_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_34_SLT_done:
    brsge8 .Llsl16_1_34_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_34_SGE_done
.Llsl16_1_34_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_34_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 5: lsl16.1 r6
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x8000
    push16 r5
    pop16 r6
    ldi16 r5, 0xc533
    push16 r5
    pop16 r4
    lsl16.1 r6
    push16 r4
    push16 r6
    unary_print_target_guard
    breq8 .Llsl16_1_35_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_35_EQ_done
.Llsl16_1_35_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_35_EQ_done:
    brne8 .Llsl16_1_35_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_35_NE_done
.Llsl16_1_35_NE_true:
    unary_emit_char 'B'
.Llsl16_1_35_NE_done:
    brult8 .Llsl16_1_35_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_35_ULT_done
.Llsl16_1_35_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_35_ULT_done:
    bruge8 .Llsl16_1_35_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_35_UGE_done
.Llsl16_1_35_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_35_UGE_done:
    brslt8 .Llsl16_1_35_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_35_SLT_done
.Llsl16_1_35_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_35_SLT_done:
    brsge8 .Llsl16_1_35_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_35_SGE_done
.Llsl16_1_35_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_35_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 6: lsl16.1 r6
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r6
    ldi16 r4, 0xc687
    push16 r4
    pop16 r5
    lsl16.1 r6
    push16 r5
    push16 r6
    unary_print_target_guard
    breq8 .Llsl16_1_36_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_36_EQ_done
.Llsl16_1_36_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_36_EQ_done:
    brne8 .Llsl16_1_36_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_36_NE_done
.Llsl16_1_36_NE_true:
    unary_emit_char 'B'
.Llsl16_1_36_NE_done:
    brult8 .Llsl16_1_36_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_36_ULT_done
.Llsl16_1_36_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_36_ULT_done:
    bruge8 .Llsl16_1_36_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_36_UGE_done
.Llsl16_1_36_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_36_UGE_done:
    brslt8 .Llsl16_1_36_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_36_SLT_done
.Llsl16_1_36_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_36_SLT_done:
    brsge8 .Llsl16_1_36_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_36_SGE_done
.Llsl16_1_36_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_36_SGE_done:
    unary_emit_char '\n'

    ; Register r6, pattern 7: lsl16.1 r6
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r6
    ldi16 r4, 0xc8dc
    push16 r4
    pop16 r7
    lsl16.1 r6
    push16 r7
    push16 r6
    unary_print_target_guard
    breq8 .Llsl16_1_37_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_37_EQ_done
.Llsl16_1_37_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_37_EQ_done:
    brne8 .Llsl16_1_37_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_37_NE_done
.Llsl16_1_37_NE_true:
    unary_emit_char 'B'
.Llsl16_1_37_NE_done:
    brult8 .Llsl16_1_37_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_37_ULT_done
.Llsl16_1_37_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_37_ULT_done:
    bruge8 .Llsl16_1_37_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_37_UGE_done
.Llsl16_1_37_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_37_UGE_done:
    brslt8 .Llsl16_1_37_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_37_SLT_done
.Llsl16_1_37_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_37_SLT_done:
    brsge8 .Llsl16_1_37_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_37_SGE_done
.Llsl16_1_37_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_37_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 0: lsl16.1 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0100
    push16 r4
    pop16 r7
    ldi16 r4, 0xc228
    push16 r4
    pop16 r0
    lsl16.1 r7
    push16 r0
    push16 r7
    unary_print_target_guard
    breq8 .Llsl16_1_38_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_38_EQ_done
.Llsl16_1_38_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_38_EQ_done:
    brne8 .Llsl16_1_38_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_38_NE_done
.Llsl16_1_38_NE_true:
    unary_emit_char 'B'
.Llsl16_1_38_NE_done:
    brult8 .Llsl16_1_38_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_38_ULT_done
.Llsl16_1_38_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_38_ULT_done:
    bruge8 .Llsl16_1_38_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_38_UGE_done
.Llsl16_1_38_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_38_UGE_done:
    brslt8 .Llsl16_1_38_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_38_SLT_done
.Llsl16_1_38_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_38_SLT_done:
    brsge8 .Llsl16_1_38_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_38_SGE_done
.Llsl16_1_38_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_38_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 1: lsl16.1 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    ldi16 r4, 0xc37c
    push16 r4
    pop16 r1
    lsl16.1 r7
    push16 r1
    push16 r7
    unary_print_target_guard
    breq8 .Llsl16_1_39_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_39_EQ_done
.Llsl16_1_39_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_39_EQ_done:
    brne8 .Llsl16_1_39_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_39_NE_done
.Llsl16_1_39_NE_true:
    unary_emit_char 'B'
.Llsl16_1_39_NE_done:
    brult8 .Llsl16_1_39_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_39_ULT_done
.Llsl16_1_39_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_39_ULT_done:
    bruge8 .Llsl16_1_39_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_39_UGE_done
.Llsl16_1_39_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_39_UGE_done:
    brslt8 .Llsl16_1_39_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_39_SLT_done
.Llsl16_1_39_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_39_SLT_done:
    brsge8 .Llsl16_1_39_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_39_SGE_done
.Llsl16_1_39_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_39_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 2: lsl16.1 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    pop16 r7
    ldi16 r4, 0xc4d0
    push16 r4
    pop16 r2
    lsl16.1 r7
    push16 r2
    push16 r7
    unary_print_target_guard
    breq8 .Llsl16_1_3a_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3a_EQ_done
.Llsl16_1_3a_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_3a_EQ_done:
    brne8 .Llsl16_1_3a_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3a_NE_done
.Llsl16_1_3a_NE_true:
    unary_emit_char 'B'
.Llsl16_1_3a_NE_done:
    brult8 .Llsl16_1_3a_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3a_ULT_done
.Llsl16_1_3a_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_3a_ULT_done:
    bruge8 .Llsl16_1_3a_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3a_UGE_done
.Llsl16_1_3a_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_3a_UGE_done:
    brslt8 .Llsl16_1_3a_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3a_SLT_done
.Llsl16_1_3a_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_3a_SLT_done:
    brsge8 .Llsl16_1_3a_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3a_SGE_done
.Llsl16_1_3a_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_3a_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 3: lsl16.1 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    ldi16 r4, 0xc624
    push16 r4
    pop16 r3
    lsl16.1 r7
    push16 r3
    push16 r7
    unary_print_target_guard
    breq8 .Llsl16_1_3b_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3b_EQ_done
.Llsl16_1_3b_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_3b_EQ_done:
    brne8 .Llsl16_1_3b_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3b_NE_done
.Llsl16_1_3b_NE_true:
    unary_emit_char 'B'
.Llsl16_1_3b_NE_done:
    brult8 .Llsl16_1_3b_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3b_ULT_done
.Llsl16_1_3b_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_3b_ULT_done:
    bruge8 .Llsl16_1_3b_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3b_UGE_done
.Llsl16_1_3b_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_3b_UGE_done:
    brslt8 .Llsl16_1_3b_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3b_SLT_done
.Llsl16_1_3b_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_3b_SLT_done:
    brsge8 .Llsl16_1_3b_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3b_SGE_done
.Llsl16_1_3b_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_3b_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 4: lsl16.1 r7
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r7
    ldi16 r5, 0xc778
    push16 r5
    pop16 r4
    lsl16.1 r7
    push16 r4
    push16 r7
    unary_print_target_guard
    breq8 .Llsl16_1_3c_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3c_EQ_done
.Llsl16_1_3c_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_3c_EQ_done:
    brne8 .Llsl16_1_3c_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3c_NE_done
.Llsl16_1_3c_NE_true:
    unary_emit_char 'B'
.Llsl16_1_3c_NE_done:
    brult8 .Llsl16_1_3c_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3c_ULT_done
.Llsl16_1_3c_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_3c_ULT_done:
    bruge8 .Llsl16_1_3c_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3c_UGE_done
.Llsl16_1_3c_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_3c_UGE_done:
    brslt8 .Llsl16_1_3c_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3c_SLT_done
.Llsl16_1_3c_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_3c_SLT_done:
    brsge8 .Llsl16_1_3c_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3c_SGE_done
.Llsl16_1_3c_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_3c_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 5: lsl16.1 r7
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x55aa
    push16 r4
    pop16 r7
    ldi16 r4, 0xc8cc
    push16 r4
    pop16 r5
    lsl16.1 r7
    push16 r5
    push16 r7
    unary_print_target_guard
    breq8 .Llsl16_1_3d_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3d_EQ_done
.Llsl16_1_3d_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_3d_EQ_done:
    brne8 .Llsl16_1_3d_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3d_NE_done
.Llsl16_1_3d_NE_true:
    unary_emit_char 'B'
.Llsl16_1_3d_NE_done:
    brult8 .Llsl16_1_3d_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3d_ULT_done
.Llsl16_1_3d_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_3d_ULT_done:
    bruge8 .Llsl16_1_3d_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3d_UGE_done
.Llsl16_1_3d_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_3d_UGE_done:
    brslt8 .Llsl16_1_3d_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3d_SLT_done
.Llsl16_1_3d_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_3d_SLT_done:
    brsge8 .Llsl16_1_3d_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3d_SGE_done
.Llsl16_1_3d_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_3d_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 6: lsl16.1 r7
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r7
    ldi16 r4, 0xca20
    push16 r4
    pop16 r6
    lsl16.1 r7
    push16 r6
    push16 r7
    unary_print_target_guard
    breq8 .Llsl16_1_3e_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3e_EQ_done
.Llsl16_1_3e_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_3e_EQ_done:
    brne8 .Llsl16_1_3e_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3e_NE_done
.Llsl16_1_3e_NE_true:
    unary_emit_char 'B'
.Llsl16_1_3e_NE_done:
    brult8 .Llsl16_1_3e_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3e_ULT_done
.Llsl16_1_3e_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_3e_ULT_done:
    bruge8 .Llsl16_1_3e_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3e_UGE_done
.Llsl16_1_3e_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_3e_UGE_done:
    brslt8 .Llsl16_1_3e_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3e_SLT_done
.Llsl16_1_3e_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_3e_SLT_done:
    brsge8 .Llsl16_1_3e_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3e_SGE_done
.Llsl16_1_3e_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_3e_SGE_done:
    unary_emit_char '\n'

    ; Register r7, pattern 7: lsl16.1 r7
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xfedc
    push16 r4
    pop16 r7
    ldi16 r4, 0xc46d
    push16 r4
    pop16 r0
    lsl16.1 r7
    push16 r0
    push16 r7
    unary_print_target_guard
    breq8 .Llsl16_1_3f_EQ_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3f_EQ_done
.Llsl16_1_3f_EQ_true:
    unary_emit_char 'B'
.Llsl16_1_3f_EQ_done:
    brne8 .Llsl16_1_3f_NE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3f_NE_done
.Llsl16_1_3f_NE_true:
    unary_emit_char 'B'
.Llsl16_1_3f_NE_done:
    brult8 .Llsl16_1_3f_ULT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3f_ULT_done
.Llsl16_1_3f_ULT_true:
    unary_emit_char 'B'
.Llsl16_1_3f_ULT_done:
    bruge8 .Llsl16_1_3f_UGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3f_UGE_done
.Llsl16_1_3f_UGE_true:
    unary_emit_char 'B'
.Llsl16_1_3f_UGE_done:
    brslt8 .Llsl16_1_3f_SLT_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3f_SLT_done
.Llsl16_1_3f_SLT_true:
    unary_emit_char 'B'
.Llsl16_1_3f_SLT_done:
    brsge8 .Llsl16_1_3f_SGE_true
    unary_emit_char 'A'
    jmp8 .Llsl16_1_3f_SGE_done
.Llsl16_1_3f_SGE_true:
    unary_emit_char 'B'
.Llsl16_1_3f_SGE_done:
    unary_emit_char '\n'

    sys debug_break
