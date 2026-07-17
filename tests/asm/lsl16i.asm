.include "include/fa_shift_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; Secondary encoding destination r4, count 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    ldi16 r5, 0x3333
    ldi16 r6, 0x5555
    ldi16 r7, 0x7777
    lsl16i r4, 0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_00_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_00_EQ_done
.Llsl16i_00_EQ_true:
    fa_emit_char 'B'
.Llsl16i_00_EQ_done:
    brne8 .Llsl16i_00_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_00_NE_done
.Llsl16i_00_NE_true:
    fa_emit_char 'B'
.Llsl16i_00_NE_done:
    brult8 .Llsl16i_00_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_00_ULT_done
.Llsl16i_00_ULT_true:
    fa_emit_char 'B'
.Llsl16i_00_ULT_done:
    bruge8 .Llsl16i_00_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_00_UGE_done
.Llsl16i_00_UGE_true:
    fa_emit_char 'B'
.Llsl16i_00_UGE_done:
    brslt8 .Llsl16i_00_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_00_SLT_done
.Llsl16i_00_SLT_true:
    fa_emit_char 'B'
.Llsl16i_00_SLT_done:
    brsge8 .Llsl16i_00_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_00_SGE_done
.Llsl16i_00_SGE_true:
    fa_emit_char 'B'
.Llsl16i_00_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0001
    ldi16 r5, 0x336a
    ldi16 r6, 0x5592
    ldi16 r7, 0x77ba
    lsl16i r4, 1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_01_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_01_EQ_done
.Llsl16i_01_EQ_true:
    fa_emit_char 'B'
.Llsl16i_01_EQ_done:
    brne8 .Llsl16i_01_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_01_NE_done
.Llsl16i_01_NE_true:
    fa_emit_char 'B'
.Llsl16i_01_NE_done:
    brult8 .Llsl16i_01_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_01_ULT_done
.Llsl16i_01_ULT_true:
    fa_emit_char 'B'
.Llsl16i_01_ULT_done:
    bruge8 .Llsl16i_01_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_01_UGE_done
.Llsl16i_01_UGE_true:
    fa_emit_char 'B'
.Llsl16i_01_UGE_done:
    brslt8 .Llsl16i_01_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_01_SLT_done
.Llsl16i_01_SLT_true:
    fa_emit_char 'B'
.Llsl16i_01_SLT_done:
    brsge8 .Llsl16i_01_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_01_SGE_done
.Llsl16i_01_SGE_true:
    fa_emit_char 'B'
.Llsl16i_01_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8001
    ldi16 r5, 0x33a1
    ldi16 r6, 0x55cf
    ldi16 r7, 0x77fd
    lsl16i r4, 2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_02_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_02_EQ_done
.Llsl16i_02_EQ_true:
    fa_emit_char 'B'
.Llsl16i_02_EQ_done:
    brne8 .Llsl16i_02_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_02_NE_done
.Llsl16i_02_NE_true:
    fa_emit_char 'B'
.Llsl16i_02_NE_done:
    brult8 .Llsl16i_02_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_02_ULT_done
.Llsl16i_02_ULT_true:
    fa_emit_char 'B'
.Llsl16i_02_ULT_done:
    bruge8 .Llsl16i_02_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_02_UGE_done
.Llsl16i_02_UGE_true:
    fa_emit_char 'B'
.Llsl16i_02_UGE_done:
    brslt8 .Llsl16i_02_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_02_SLT_done
.Llsl16i_02_SLT_true:
    fa_emit_char 'B'
.Llsl16i_02_SLT_done:
    brsge8 .Llsl16i_02_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_02_SGE_done
.Llsl16i_02_SGE_true:
    fa_emit_char 'B'
.Llsl16i_02_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7fff
    ldi16 r5, 0x33d8
    ldi16 r6, 0x560c
    ldi16 r7, 0x7840
    lsl16i r4, 3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_03_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_03_EQ_done
.Llsl16i_03_EQ_true:
    fa_emit_char 'B'
.Llsl16i_03_EQ_done:
    brne8 .Llsl16i_03_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_03_NE_done
.Llsl16i_03_NE_true:
    fa_emit_char 'B'
.Llsl16i_03_NE_done:
    brult8 .Llsl16i_03_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_03_ULT_done
.Llsl16i_03_ULT_true:
    fa_emit_char 'B'
.Llsl16i_03_ULT_done:
    bruge8 .Llsl16i_03_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_03_UGE_done
.Llsl16i_03_UGE_true:
    fa_emit_char 'B'
.Llsl16i_03_UGE_done:
    brslt8 .Llsl16i_03_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_03_SLT_done
.Llsl16i_03_SLT_true:
    fa_emit_char 'B'
.Llsl16i_03_SLT_done:
    brsge8 .Llsl16i_03_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_03_SGE_done
.Llsl16i_03_SGE_true:
    fa_emit_char 'B'
.Llsl16i_03_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 4.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8000
    ldi16 r5, 0x340f
    ldi16 r6, 0x5649
    ldi16 r7, 0x7883
    lsl16i r4, 4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_04_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_04_EQ_done
.Llsl16i_04_EQ_true:
    fa_emit_char 'B'
.Llsl16i_04_EQ_done:
    brne8 .Llsl16i_04_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_04_NE_done
.Llsl16i_04_NE_true:
    fa_emit_char 'B'
.Llsl16i_04_NE_done:
    brult8 .Llsl16i_04_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_04_ULT_done
.Llsl16i_04_ULT_true:
    fa_emit_char 'B'
.Llsl16i_04_ULT_done:
    bruge8 .Llsl16i_04_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_04_UGE_done
.Llsl16i_04_UGE_true:
    fa_emit_char 'B'
.Llsl16i_04_UGE_done:
    brslt8 .Llsl16i_04_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_04_SLT_done
.Llsl16i_04_SLT_true:
    fa_emit_char 'B'
.Llsl16i_04_SLT_done:
    brsge8 .Llsl16i_04_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_04_SGE_done
.Llsl16i_04_SGE_true:
    fa_emit_char 'B'
.Llsl16i_04_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 5.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xffff
    ldi16 r5, 0x3446
    ldi16 r6, 0x5686
    ldi16 r7, 0x78c6
    lsl16i r4, 5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_05_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_05_EQ_done
.Llsl16i_05_EQ_true:
    fa_emit_char 'B'
.Llsl16i_05_EQ_done:
    brne8 .Llsl16i_05_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_05_NE_done
.Llsl16i_05_NE_true:
    fa_emit_char 'B'
.Llsl16i_05_NE_done:
    brult8 .Llsl16i_05_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_05_ULT_done
.Llsl16i_05_ULT_true:
    fa_emit_char 'B'
.Llsl16i_05_ULT_done:
    bruge8 .Llsl16i_05_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_05_UGE_done
.Llsl16i_05_UGE_true:
    fa_emit_char 'B'
.Llsl16i_05_UGE_done:
    brslt8 .Llsl16i_05_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_05_SLT_done
.Llsl16i_05_SLT_true:
    fa_emit_char 'B'
.Llsl16i_05_SLT_done:
    brsge8 .Llsl16i_05_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_05_SGE_done
.Llsl16i_05_SGE_true:
    fa_emit_char 'B'
.Llsl16i_05_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa55a
    ldi16 r5, 0x347d
    ldi16 r6, 0x56c3
    ldi16 r7, 0x7909
    lsl16i r4, 6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_06_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_06_EQ_done
.Llsl16i_06_EQ_true:
    fa_emit_char 'B'
.Llsl16i_06_EQ_done:
    brne8 .Llsl16i_06_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_06_NE_done
.Llsl16i_06_NE_true:
    fa_emit_char 'B'
.Llsl16i_06_NE_done:
    brult8 .Llsl16i_06_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_06_ULT_done
.Llsl16i_06_ULT_true:
    fa_emit_char 'B'
.Llsl16i_06_ULT_done:
    bruge8 .Llsl16i_06_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_06_UGE_done
.Llsl16i_06_UGE_true:
    fa_emit_char 'B'
.Llsl16i_06_UGE_done:
    brslt8 .Llsl16i_06_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_06_SLT_done
.Llsl16i_06_SLT_true:
    fa_emit_char 'B'
.Llsl16i_06_SLT_done:
    brsge8 .Llsl16i_06_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_06_SGE_done
.Llsl16i_06_SGE_true:
    fa_emit_char 'B'
.Llsl16i_06_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5aa5
    ldi16 r5, 0x34b4
    ldi16 r6, 0x5700
    ldi16 r7, 0x794c
    lsl16i r4, 7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_07_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_07_EQ_done
.Llsl16i_07_EQ_true:
    fa_emit_char 'B'
.Llsl16i_07_EQ_done:
    brne8 .Llsl16i_07_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_07_NE_done
.Llsl16i_07_NE_true:
    fa_emit_char 'B'
.Llsl16i_07_NE_done:
    brult8 .Llsl16i_07_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_07_ULT_done
.Llsl16i_07_ULT_true:
    fa_emit_char 'B'
.Llsl16i_07_ULT_done:
    bruge8 .Llsl16i_07_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_07_UGE_done
.Llsl16i_07_UGE_true:
    fa_emit_char 'B'
.Llsl16i_07_UGE_done:
    brslt8 .Llsl16i_07_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_07_SLT_done
.Llsl16i_07_SLT_true:
    fa_emit_char 'B'
.Llsl16i_07_SLT_done:
    brsge8 .Llsl16i_07_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_07_SGE_done
.Llsl16i_07_SGE_true:
    fa_emit_char 'B'
.Llsl16i_07_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 8.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1234
    ldi16 r5, 0x34eb
    ldi16 r6, 0x573d
    ldi16 r7, 0x798f
    lsl16i r4, 8
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_08_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_08_EQ_done
.Llsl16i_08_EQ_true:
    fa_emit_char 'B'
.Llsl16i_08_EQ_done:
    brne8 .Llsl16i_08_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_08_NE_done
.Llsl16i_08_NE_true:
    fa_emit_char 'B'
.Llsl16i_08_NE_done:
    brult8 .Llsl16i_08_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_08_ULT_done
.Llsl16i_08_ULT_true:
    fa_emit_char 'B'
.Llsl16i_08_ULT_done:
    bruge8 .Llsl16i_08_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_08_UGE_done
.Llsl16i_08_UGE_true:
    fa_emit_char 'B'
.Llsl16i_08_UGE_done:
    brslt8 .Llsl16i_08_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_08_SLT_done
.Llsl16i_08_SLT_true:
    fa_emit_char 'B'
.Llsl16i_08_SLT_done:
    brsge8 .Llsl16i_08_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_08_SGE_done
.Llsl16i_08_SGE_true:
    fa_emit_char 'B'
.Llsl16i_08_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 9.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xfedc
    ldi16 r5, 0x3522
    ldi16 r6, 0x577a
    ldi16 r7, 0x79d2
    lsl16i r4, 9
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_09_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_09_EQ_done
.Llsl16i_09_EQ_true:
    fa_emit_char 'B'
.Llsl16i_09_EQ_done:
    brne8 .Llsl16i_09_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_09_NE_done
.Llsl16i_09_NE_true:
    fa_emit_char 'B'
.Llsl16i_09_NE_done:
    brult8 .Llsl16i_09_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_09_ULT_done
.Llsl16i_09_ULT_true:
    fa_emit_char 'B'
.Llsl16i_09_ULT_done:
    bruge8 .Llsl16i_09_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_09_UGE_done
.Llsl16i_09_UGE_true:
    fa_emit_char 'B'
.Llsl16i_09_UGE_done:
    brslt8 .Llsl16i_09_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_09_SLT_done
.Llsl16i_09_SLT_true:
    fa_emit_char 'B'
.Llsl16i_09_SLT_done:
    brsge8 .Llsl16i_09_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_09_SGE_done
.Llsl16i_09_SGE_true:
    fa_emit_char 'B'
.Llsl16i_09_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 10.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0100
    ldi16 r5, 0x3559
    ldi16 r6, 0x57b7
    ldi16 r7, 0x7a15
    lsl16i r4, 10
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_0a_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0a_EQ_done
.Llsl16i_0a_EQ_true:
    fa_emit_char 'B'
.Llsl16i_0a_EQ_done:
    brne8 .Llsl16i_0a_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0a_NE_done
.Llsl16i_0a_NE_true:
    fa_emit_char 'B'
.Llsl16i_0a_NE_done:
    brult8 .Llsl16i_0a_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0a_ULT_done
.Llsl16i_0a_ULT_true:
    fa_emit_char 'B'
.Llsl16i_0a_ULT_done:
    bruge8 .Llsl16i_0a_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0a_UGE_done
.Llsl16i_0a_UGE_true:
    fa_emit_char 'B'
.Llsl16i_0a_UGE_done:
    brslt8 .Llsl16i_0a_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0a_SLT_done
.Llsl16i_0a_SLT_true:
    fa_emit_char 'B'
.Llsl16i_0a_SLT_done:
    brsge8 .Llsl16i_0a_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0a_SGE_done
.Llsl16i_0a_SGE_true:
    fa_emit_char 'B'
.Llsl16i_0a_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 11.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x00ff
    ldi16 r5, 0x3590
    ldi16 r6, 0x57f4
    ldi16 r7, 0x7a58
    lsl16i r4, 11
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_0b_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0b_EQ_done
.Llsl16i_0b_EQ_true:
    fa_emit_char 'B'
.Llsl16i_0b_EQ_done:
    brne8 .Llsl16i_0b_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0b_NE_done
.Llsl16i_0b_NE_true:
    fa_emit_char 'B'
.Llsl16i_0b_NE_done:
    brult8 .Llsl16i_0b_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0b_ULT_done
.Llsl16i_0b_ULT_true:
    fa_emit_char 'B'
.Llsl16i_0b_ULT_done:
    bruge8 .Llsl16i_0b_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0b_UGE_done
.Llsl16i_0b_UGE_true:
    fa_emit_char 'B'
.Llsl16i_0b_UGE_done:
    brslt8 .Llsl16i_0b_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0b_SLT_done
.Llsl16i_0b_SLT_true:
    fa_emit_char 'B'
.Llsl16i_0b_SLT_done:
    brsge8 .Llsl16i_0b_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0b_SGE_done
.Llsl16i_0b_SGE_true:
    fa_emit_char 'B'
.Llsl16i_0b_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 12.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4001
    ldi16 r5, 0x35c7
    ldi16 r6, 0x5831
    ldi16 r7, 0x7a9b
    lsl16i r4, 12
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_0c_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0c_EQ_done
.Llsl16i_0c_EQ_true:
    fa_emit_char 'B'
.Llsl16i_0c_EQ_done:
    brne8 .Llsl16i_0c_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0c_NE_done
.Llsl16i_0c_NE_true:
    fa_emit_char 'B'
.Llsl16i_0c_NE_done:
    brult8 .Llsl16i_0c_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0c_ULT_done
.Llsl16i_0c_ULT_true:
    fa_emit_char 'B'
.Llsl16i_0c_ULT_done:
    bruge8 .Llsl16i_0c_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0c_UGE_done
.Llsl16i_0c_UGE_true:
    fa_emit_char 'B'
.Llsl16i_0c_UGE_done:
    brslt8 .Llsl16i_0c_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0c_SLT_done
.Llsl16i_0c_SLT_true:
    fa_emit_char 'B'
.Llsl16i_0c_SLT_done:
    brsge8 .Llsl16i_0c_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0c_SGE_done
.Llsl16i_0c_SGE_true:
    fa_emit_char 'B'
.Llsl16i_0c_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 13.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xc001
    ldi16 r5, 0x35fe
    ldi16 r6, 0x586e
    ldi16 r7, 0x7ade
    lsl16i r4, 13
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_0d_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0d_EQ_done
.Llsl16i_0d_EQ_true:
    fa_emit_char 'B'
.Llsl16i_0d_EQ_done:
    brne8 .Llsl16i_0d_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0d_NE_done
.Llsl16i_0d_NE_true:
    fa_emit_char 'B'
.Llsl16i_0d_NE_done:
    brult8 .Llsl16i_0d_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0d_ULT_done
.Llsl16i_0d_ULT_true:
    fa_emit_char 'B'
.Llsl16i_0d_ULT_done:
    bruge8 .Llsl16i_0d_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0d_UGE_done
.Llsl16i_0d_UGE_true:
    fa_emit_char 'B'
.Llsl16i_0d_UGE_done:
    brslt8 .Llsl16i_0d_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0d_SLT_done
.Llsl16i_0d_SLT_true:
    fa_emit_char 'B'
.Llsl16i_0d_SLT_done:
    brsge8 .Llsl16i_0d_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0d_SGE_done
.Llsl16i_0d_SGE_true:
    fa_emit_char 'B'
.Llsl16i_0d_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 14.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8080
    ldi16 r5, 0x3635
    ldi16 r6, 0x58ab
    ldi16 r7, 0x7b21
    lsl16i r4, 14
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_0e_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0e_EQ_done
.Llsl16i_0e_EQ_true:
    fa_emit_char 'B'
.Llsl16i_0e_EQ_done:
    brne8 .Llsl16i_0e_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0e_NE_done
.Llsl16i_0e_NE_true:
    fa_emit_char 'B'
.Llsl16i_0e_NE_done:
    brult8 .Llsl16i_0e_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0e_ULT_done
.Llsl16i_0e_ULT_true:
    fa_emit_char 'B'
.Llsl16i_0e_ULT_done:
    bruge8 .Llsl16i_0e_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0e_UGE_done
.Llsl16i_0e_UGE_true:
    fa_emit_char 'B'
.Llsl16i_0e_UGE_done:
    brslt8 .Llsl16i_0e_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0e_SLT_done
.Llsl16i_0e_SLT_true:
    fa_emit_char 'B'
.Llsl16i_0e_SLT_done:
    brsge8 .Llsl16i_0e_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0e_SGE_done
.Llsl16i_0e_SGE_true:
    fa_emit_char 'B'
.Llsl16i_0e_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r4, count 15.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7f01
    ldi16 r5, 0x366c
    ldi16 r6, 0x58e8
    ldi16 r7, 0x7b64
    lsl16i r4, 15
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_0f_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0f_EQ_done
.Llsl16i_0f_EQ_true:
    fa_emit_char 'B'
.Llsl16i_0f_EQ_done:
    brne8 .Llsl16i_0f_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0f_NE_done
.Llsl16i_0f_NE_true:
    fa_emit_char 'B'
.Llsl16i_0f_NE_done:
    brult8 .Llsl16i_0f_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0f_ULT_done
.Llsl16i_0f_ULT_true:
    fa_emit_char 'B'
.Llsl16i_0f_ULT_done:
    bruge8 .Llsl16i_0f_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0f_UGE_done
.Llsl16i_0f_UGE_true:
    fa_emit_char 'B'
.Llsl16i_0f_UGE_done:
    brslt8 .Llsl16i_0f_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0f_SLT_done
.Llsl16i_0f_SLT_true:
    fa_emit_char 'B'
.Llsl16i_0f_SLT_done:
    brsge8 .Llsl16i_0f_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_0f_SGE_done
.Llsl16i_0f_SGE_true:
    fa_emit_char 'B'
.Llsl16i_0f_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1421
    ldi16 r5, 0xffff
    ldi16 r6, 0x5925
    ldi16 r7, 0x7ba7
    lsl16i r5, 0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_10_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_10_EQ_done
.Llsl16i_10_EQ_true:
    fa_emit_char 'B'
.Llsl16i_10_EQ_done:
    brne8 .Llsl16i_10_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_10_NE_done
.Llsl16i_10_NE_true:
    fa_emit_char 'B'
.Llsl16i_10_NE_done:
    brult8 .Llsl16i_10_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_10_ULT_done
.Llsl16i_10_ULT_true:
    fa_emit_char 'B'
.Llsl16i_10_ULT_done:
    bruge8 .Llsl16i_10_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_10_UGE_done
.Llsl16i_10_UGE_true:
    fa_emit_char 'B'
.Llsl16i_10_UGE_done:
    brslt8 .Llsl16i_10_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_10_SLT_done
.Llsl16i_10_SLT_true:
    fa_emit_char 'B'
.Llsl16i_10_SLT_done:
    brsge8 .Llsl16i_10_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_10_SGE_done
.Llsl16i_10_SGE_true:
    fa_emit_char 'B'
.Llsl16i_10_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1452
    ldi16 r5, 0xa55a
    ldi16 r6, 0x5962
    ldi16 r7, 0x7bea
    lsl16i r5, 1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_11_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_11_EQ_done
.Llsl16i_11_EQ_true:
    fa_emit_char 'B'
.Llsl16i_11_EQ_done:
    brne8 .Llsl16i_11_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_11_NE_done
.Llsl16i_11_NE_true:
    fa_emit_char 'B'
.Llsl16i_11_NE_done:
    brult8 .Llsl16i_11_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_11_ULT_done
.Llsl16i_11_ULT_true:
    fa_emit_char 'B'
.Llsl16i_11_ULT_done:
    bruge8 .Llsl16i_11_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_11_UGE_done
.Llsl16i_11_UGE_true:
    fa_emit_char 'B'
.Llsl16i_11_UGE_done:
    brslt8 .Llsl16i_11_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_11_SLT_done
.Llsl16i_11_SLT_true:
    fa_emit_char 'B'
.Llsl16i_11_SLT_done:
    brsge8 .Llsl16i_11_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_11_SGE_done
.Llsl16i_11_SGE_true:
    fa_emit_char 'B'
.Llsl16i_11_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1483
    ldi16 r5, 0x5aa5
    ldi16 r6, 0x599f
    ldi16 r7, 0x7c2d
    lsl16i r5, 2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_12_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_12_EQ_done
.Llsl16i_12_EQ_true:
    fa_emit_char 'B'
.Llsl16i_12_EQ_done:
    brne8 .Llsl16i_12_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_12_NE_done
.Llsl16i_12_NE_true:
    fa_emit_char 'B'
.Llsl16i_12_NE_done:
    brult8 .Llsl16i_12_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_12_ULT_done
.Llsl16i_12_ULT_true:
    fa_emit_char 'B'
.Llsl16i_12_ULT_done:
    bruge8 .Llsl16i_12_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_12_UGE_done
.Llsl16i_12_UGE_true:
    fa_emit_char 'B'
.Llsl16i_12_UGE_done:
    brslt8 .Llsl16i_12_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_12_SLT_done
.Llsl16i_12_SLT_true:
    fa_emit_char 'B'
.Llsl16i_12_SLT_done:
    brsge8 .Llsl16i_12_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_12_SGE_done
.Llsl16i_12_SGE_true:
    fa_emit_char 'B'
.Llsl16i_12_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x14b4
    ldi16 r5, 0x1234
    ldi16 r6, 0x59dc
    ldi16 r7, 0x7c70
    lsl16i r5, 3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_13_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_13_EQ_done
.Llsl16i_13_EQ_true:
    fa_emit_char 'B'
.Llsl16i_13_EQ_done:
    brne8 .Llsl16i_13_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_13_NE_done
.Llsl16i_13_NE_true:
    fa_emit_char 'B'
.Llsl16i_13_NE_done:
    brult8 .Llsl16i_13_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_13_ULT_done
.Llsl16i_13_ULT_true:
    fa_emit_char 'B'
.Llsl16i_13_ULT_done:
    bruge8 .Llsl16i_13_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_13_UGE_done
.Llsl16i_13_UGE_true:
    fa_emit_char 'B'
.Llsl16i_13_UGE_done:
    brslt8 .Llsl16i_13_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_13_SLT_done
.Llsl16i_13_SLT_true:
    fa_emit_char 'B'
.Llsl16i_13_SLT_done:
    brsge8 .Llsl16i_13_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_13_SGE_done
.Llsl16i_13_SGE_true:
    fa_emit_char 'B'
.Llsl16i_13_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 4.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x14e5
    ldi16 r5, 0xfedc
    ldi16 r6, 0x5a19
    ldi16 r7, 0x7cb3
    lsl16i r5, 4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_14_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_14_EQ_done
.Llsl16i_14_EQ_true:
    fa_emit_char 'B'
.Llsl16i_14_EQ_done:
    brne8 .Llsl16i_14_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_14_NE_done
.Llsl16i_14_NE_true:
    fa_emit_char 'B'
.Llsl16i_14_NE_done:
    brult8 .Llsl16i_14_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_14_ULT_done
.Llsl16i_14_ULT_true:
    fa_emit_char 'B'
.Llsl16i_14_ULT_done:
    bruge8 .Llsl16i_14_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_14_UGE_done
.Llsl16i_14_UGE_true:
    fa_emit_char 'B'
.Llsl16i_14_UGE_done:
    brslt8 .Llsl16i_14_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_14_SLT_done
.Llsl16i_14_SLT_true:
    fa_emit_char 'B'
.Llsl16i_14_SLT_done:
    brsge8 .Llsl16i_14_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_14_SGE_done
.Llsl16i_14_SGE_true:
    fa_emit_char 'B'
.Llsl16i_14_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1516
    ldi16 r5, 0x0100
    ldi16 r6, 0x5a56
    ldi16 r7, 0x7cf6
    lsl16i r5, 5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_15_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_15_EQ_done
.Llsl16i_15_EQ_true:
    fa_emit_char 'B'
.Llsl16i_15_EQ_done:
    brne8 .Llsl16i_15_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_15_NE_done
.Llsl16i_15_NE_true:
    fa_emit_char 'B'
.Llsl16i_15_NE_done:
    brult8 .Llsl16i_15_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_15_ULT_done
.Llsl16i_15_ULT_true:
    fa_emit_char 'B'
.Llsl16i_15_ULT_done:
    bruge8 .Llsl16i_15_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_15_UGE_done
.Llsl16i_15_UGE_true:
    fa_emit_char 'B'
.Llsl16i_15_UGE_done:
    brslt8 .Llsl16i_15_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_15_SLT_done
.Llsl16i_15_SLT_true:
    fa_emit_char 'B'
.Llsl16i_15_SLT_done:
    brsge8 .Llsl16i_15_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_15_SGE_done
.Llsl16i_15_SGE_true:
    fa_emit_char 'B'
.Llsl16i_15_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1547
    ldi16 r5, 0x00ff
    ldi16 r6, 0x5a93
    ldi16 r7, 0x7d39
    lsl16i r5, 6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_16_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_16_EQ_done
.Llsl16i_16_EQ_true:
    fa_emit_char 'B'
.Llsl16i_16_EQ_done:
    brne8 .Llsl16i_16_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_16_NE_done
.Llsl16i_16_NE_true:
    fa_emit_char 'B'
.Llsl16i_16_NE_done:
    brult8 .Llsl16i_16_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_16_ULT_done
.Llsl16i_16_ULT_true:
    fa_emit_char 'B'
.Llsl16i_16_ULT_done:
    bruge8 .Llsl16i_16_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_16_UGE_done
.Llsl16i_16_UGE_true:
    fa_emit_char 'B'
.Llsl16i_16_UGE_done:
    brslt8 .Llsl16i_16_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_16_SLT_done
.Llsl16i_16_SLT_true:
    fa_emit_char 'B'
.Llsl16i_16_SLT_done:
    brsge8 .Llsl16i_16_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_16_SGE_done
.Llsl16i_16_SGE_true:
    fa_emit_char 'B'
.Llsl16i_16_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 7.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1578
    ldi16 r5, 0x4001
    ldi16 r6, 0x5ad0
    ldi16 r7, 0x7d7c
    lsl16i r5, 7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_17_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_17_EQ_done
.Llsl16i_17_EQ_true:
    fa_emit_char 'B'
.Llsl16i_17_EQ_done:
    brne8 .Llsl16i_17_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_17_NE_done
.Llsl16i_17_NE_true:
    fa_emit_char 'B'
.Llsl16i_17_NE_done:
    brult8 .Llsl16i_17_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_17_ULT_done
.Llsl16i_17_ULT_true:
    fa_emit_char 'B'
.Llsl16i_17_ULT_done:
    bruge8 .Llsl16i_17_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_17_UGE_done
.Llsl16i_17_UGE_true:
    fa_emit_char 'B'
.Llsl16i_17_UGE_done:
    brslt8 .Llsl16i_17_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_17_SLT_done
.Llsl16i_17_SLT_true:
    fa_emit_char 'B'
.Llsl16i_17_SLT_done:
    brsge8 .Llsl16i_17_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_17_SGE_done
.Llsl16i_17_SGE_true:
    fa_emit_char 'B'
.Llsl16i_17_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 8.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x15a9
    ldi16 r5, 0xc001
    ldi16 r6, 0x5b0d
    ldi16 r7, 0x7dbf
    lsl16i r5, 8
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_18_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_18_EQ_done
.Llsl16i_18_EQ_true:
    fa_emit_char 'B'
.Llsl16i_18_EQ_done:
    brne8 .Llsl16i_18_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_18_NE_done
.Llsl16i_18_NE_true:
    fa_emit_char 'B'
.Llsl16i_18_NE_done:
    brult8 .Llsl16i_18_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_18_ULT_done
.Llsl16i_18_ULT_true:
    fa_emit_char 'B'
.Llsl16i_18_ULT_done:
    bruge8 .Llsl16i_18_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_18_UGE_done
.Llsl16i_18_UGE_true:
    fa_emit_char 'B'
.Llsl16i_18_UGE_done:
    brslt8 .Llsl16i_18_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_18_SLT_done
.Llsl16i_18_SLT_true:
    fa_emit_char 'B'
.Llsl16i_18_SLT_done:
    brsge8 .Llsl16i_18_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_18_SGE_done
.Llsl16i_18_SGE_true:
    fa_emit_char 'B'
.Llsl16i_18_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 9.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x15da
    ldi16 r5, 0x8080
    ldi16 r6, 0x5b4a
    ldi16 r7, 0x7e02
    lsl16i r5, 9
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_19_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_19_EQ_done
.Llsl16i_19_EQ_true:
    fa_emit_char 'B'
.Llsl16i_19_EQ_done:
    brne8 .Llsl16i_19_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_19_NE_done
.Llsl16i_19_NE_true:
    fa_emit_char 'B'
.Llsl16i_19_NE_done:
    brult8 .Llsl16i_19_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_19_ULT_done
.Llsl16i_19_ULT_true:
    fa_emit_char 'B'
.Llsl16i_19_ULT_done:
    bruge8 .Llsl16i_19_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_19_UGE_done
.Llsl16i_19_UGE_true:
    fa_emit_char 'B'
.Llsl16i_19_UGE_done:
    brslt8 .Llsl16i_19_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_19_SLT_done
.Llsl16i_19_SLT_true:
    fa_emit_char 'B'
.Llsl16i_19_SLT_done:
    brsge8 .Llsl16i_19_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_19_SGE_done
.Llsl16i_19_SGE_true:
    fa_emit_char 'B'
.Llsl16i_19_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 10.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x160b
    ldi16 r5, 0x7f01
    ldi16 r6, 0x5b87
    ldi16 r7, 0x7e45
    lsl16i r5, 10
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_1a_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1a_EQ_done
.Llsl16i_1a_EQ_true:
    fa_emit_char 'B'
.Llsl16i_1a_EQ_done:
    brne8 .Llsl16i_1a_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1a_NE_done
.Llsl16i_1a_NE_true:
    fa_emit_char 'B'
.Llsl16i_1a_NE_done:
    brult8 .Llsl16i_1a_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1a_ULT_done
.Llsl16i_1a_ULT_true:
    fa_emit_char 'B'
.Llsl16i_1a_ULT_done:
    bruge8 .Llsl16i_1a_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1a_UGE_done
.Llsl16i_1a_UGE_true:
    fa_emit_char 'B'
.Llsl16i_1a_UGE_done:
    brslt8 .Llsl16i_1a_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1a_SLT_done
.Llsl16i_1a_SLT_true:
    fa_emit_char 'B'
.Llsl16i_1a_SLT_done:
    brsge8 .Llsl16i_1a_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1a_SGE_done
.Llsl16i_1a_SGE_true:
    fa_emit_char 'B'
.Llsl16i_1a_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 11.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x163c
    ldi16 r5, 0x0000
    ldi16 r6, 0x5bc4
    ldi16 r7, 0x7e88
    lsl16i r5, 11
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_1b_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1b_EQ_done
.Llsl16i_1b_EQ_true:
    fa_emit_char 'B'
.Llsl16i_1b_EQ_done:
    brne8 .Llsl16i_1b_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1b_NE_done
.Llsl16i_1b_NE_true:
    fa_emit_char 'B'
.Llsl16i_1b_NE_done:
    brult8 .Llsl16i_1b_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1b_ULT_done
.Llsl16i_1b_ULT_true:
    fa_emit_char 'B'
.Llsl16i_1b_ULT_done:
    bruge8 .Llsl16i_1b_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1b_UGE_done
.Llsl16i_1b_UGE_true:
    fa_emit_char 'B'
.Llsl16i_1b_UGE_done:
    brslt8 .Llsl16i_1b_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1b_SLT_done
.Llsl16i_1b_SLT_true:
    fa_emit_char 'B'
.Llsl16i_1b_SLT_done:
    brsge8 .Llsl16i_1b_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1b_SGE_done
.Llsl16i_1b_SGE_true:
    fa_emit_char 'B'
.Llsl16i_1b_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 12.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x166d
    ldi16 r5, 0x0001
    ldi16 r6, 0x5c01
    ldi16 r7, 0x7ecb
    lsl16i r5, 12
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_1c_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1c_EQ_done
.Llsl16i_1c_EQ_true:
    fa_emit_char 'B'
.Llsl16i_1c_EQ_done:
    brne8 .Llsl16i_1c_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1c_NE_done
.Llsl16i_1c_NE_true:
    fa_emit_char 'B'
.Llsl16i_1c_NE_done:
    brult8 .Llsl16i_1c_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1c_ULT_done
.Llsl16i_1c_ULT_true:
    fa_emit_char 'B'
.Llsl16i_1c_ULT_done:
    bruge8 .Llsl16i_1c_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1c_UGE_done
.Llsl16i_1c_UGE_true:
    fa_emit_char 'B'
.Llsl16i_1c_UGE_done:
    brslt8 .Llsl16i_1c_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1c_SLT_done
.Llsl16i_1c_SLT_true:
    fa_emit_char 'B'
.Llsl16i_1c_SLT_done:
    brsge8 .Llsl16i_1c_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1c_SGE_done
.Llsl16i_1c_SGE_true:
    fa_emit_char 'B'
.Llsl16i_1c_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 13.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x169e
    ldi16 r5, 0x8001
    ldi16 r6, 0x5c3e
    ldi16 r7, 0x7f0e
    lsl16i r5, 13
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_1d_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1d_EQ_done
.Llsl16i_1d_EQ_true:
    fa_emit_char 'B'
.Llsl16i_1d_EQ_done:
    brne8 .Llsl16i_1d_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1d_NE_done
.Llsl16i_1d_NE_true:
    fa_emit_char 'B'
.Llsl16i_1d_NE_done:
    brult8 .Llsl16i_1d_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1d_ULT_done
.Llsl16i_1d_ULT_true:
    fa_emit_char 'B'
.Llsl16i_1d_ULT_done:
    bruge8 .Llsl16i_1d_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1d_UGE_done
.Llsl16i_1d_UGE_true:
    fa_emit_char 'B'
.Llsl16i_1d_UGE_done:
    brslt8 .Llsl16i_1d_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1d_SLT_done
.Llsl16i_1d_SLT_true:
    fa_emit_char 'B'
.Llsl16i_1d_SLT_done:
    brsge8 .Llsl16i_1d_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1d_SGE_done
.Llsl16i_1d_SGE_true:
    fa_emit_char 'B'
.Llsl16i_1d_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 14.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x16cf
    ldi16 r5, 0x7fff
    ldi16 r6, 0x5c7b
    ldi16 r7, 0x7f51
    lsl16i r5, 14
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_1e_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1e_EQ_done
.Llsl16i_1e_EQ_true:
    fa_emit_char 'B'
.Llsl16i_1e_EQ_done:
    brne8 .Llsl16i_1e_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1e_NE_done
.Llsl16i_1e_NE_true:
    fa_emit_char 'B'
.Llsl16i_1e_NE_done:
    brult8 .Llsl16i_1e_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1e_ULT_done
.Llsl16i_1e_ULT_true:
    fa_emit_char 'B'
.Llsl16i_1e_ULT_done:
    bruge8 .Llsl16i_1e_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1e_UGE_done
.Llsl16i_1e_UGE_true:
    fa_emit_char 'B'
.Llsl16i_1e_UGE_done:
    brslt8 .Llsl16i_1e_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1e_SLT_done
.Llsl16i_1e_SLT_true:
    fa_emit_char 'B'
.Llsl16i_1e_SLT_done:
    brsge8 .Llsl16i_1e_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1e_SGE_done
.Llsl16i_1e_SGE_true:
    fa_emit_char 'B'
.Llsl16i_1e_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r5, count 15.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1700
    ldi16 r5, 0x8000
    ldi16 r6, 0x5cb8
    ldi16 r7, 0x7f94
    lsl16i r5, 15
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_1f_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1f_EQ_done
.Llsl16i_1f_EQ_true:
    fa_emit_char 'B'
.Llsl16i_1f_EQ_done:
    brne8 .Llsl16i_1f_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1f_NE_done
.Llsl16i_1f_NE_true:
    fa_emit_char 'B'
.Llsl16i_1f_NE_done:
    brult8 .Llsl16i_1f_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1f_ULT_done
.Llsl16i_1f_ULT_true:
    fa_emit_char 'B'
.Llsl16i_1f_ULT_done:
    bruge8 .Llsl16i_1f_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1f_UGE_done
.Llsl16i_1f_UGE_true:
    fa_emit_char 'B'
.Llsl16i_1f_UGE_done:
    brslt8 .Llsl16i_1f_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1f_SLT_done
.Llsl16i_1f_SLT_true:
    fa_emit_char 'B'
.Llsl16i_1f_SLT_done:
    brsge8 .Llsl16i_1f_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_1f_SGE_done
.Llsl16i_1f_SGE_true:
    fa_emit_char 'B'
.Llsl16i_1f_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1731
    ldi16 r5, 0x3a13
    ldi16 r6, 0x0100
    ldi16 r7, 0x7fd7
    lsl16i r6, 0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_20_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_20_EQ_done
.Llsl16i_20_EQ_true:
    fa_emit_char 'B'
.Llsl16i_20_EQ_done:
    brne8 .Llsl16i_20_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_20_NE_done
.Llsl16i_20_NE_true:
    fa_emit_char 'B'
.Llsl16i_20_NE_done:
    brult8 .Llsl16i_20_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_20_ULT_done
.Llsl16i_20_ULT_true:
    fa_emit_char 'B'
.Llsl16i_20_ULT_done:
    bruge8 .Llsl16i_20_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_20_UGE_done
.Llsl16i_20_UGE_true:
    fa_emit_char 'B'
.Llsl16i_20_UGE_done:
    brslt8 .Llsl16i_20_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_20_SLT_done
.Llsl16i_20_SLT_true:
    fa_emit_char 'B'
.Llsl16i_20_SLT_done:
    brsge8 .Llsl16i_20_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_20_SGE_done
.Llsl16i_20_SGE_true:
    fa_emit_char 'B'
.Llsl16i_20_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1762
    ldi16 r5, 0x3a4a
    ldi16 r6, 0x00ff
    ldi16 r7, 0x801a
    lsl16i r6, 1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_21_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_21_EQ_done
.Llsl16i_21_EQ_true:
    fa_emit_char 'B'
.Llsl16i_21_EQ_done:
    brne8 .Llsl16i_21_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_21_NE_done
.Llsl16i_21_NE_true:
    fa_emit_char 'B'
.Llsl16i_21_NE_done:
    brult8 .Llsl16i_21_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_21_ULT_done
.Llsl16i_21_ULT_true:
    fa_emit_char 'B'
.Llsl16i_21_ULT_done:
    bruge8 .Llsl16i_21_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_21_UGE_done
.Llsl16i_21_UGE_true:
    fa_emit_char 'B'
.Llsl16i_21_UGE_done:
    brslt8 .Llsl16i_21_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_21_SLT_done
.Llsl16i_21_SLT_true:
    fa_emit_char 'B'
.Llsl16i_21_SLT_done:
    brsge8 .Llsl16i_21_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_21_SGE_done
.Llsl16i_21_SGE_true:
    fa_emit_char 'B'
.Llsl16i_21_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1793
    ldi16 r5, 0x3a81
    ldi16 r6, 0x4001
    ldi16 r7, 0x805d
    lsl16i r6, 2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_22_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_22_EQ_done
.Llsl16i_22_EQ_true:
    fa_emit_char 'B'
.Llsl16i_22_EQ_done:
    brne8 .Llsl16i_22_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_22_NE_done
.Llsl16i_22_NE_true:
    fa_emit_char 'B'
.Llsl16i_22_NE_done:
    brult8 .Llsl16i_22_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_22_ULT_done
.Llsl16i_22_ULT_true:
    fa_emit_char 'B'
.Llsl16i_22_ULT_done:
    bruge8 .Llsl16i_22_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_22_UGE_done
.Llsl16i_22_UGE_true:
    fa_emit_char 'B'
.Llsl16i_22_UGE_done:
    brslt8 .Llsl16i_22_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_22_SLT_done
.Llsl16i_22_SLT_true:
    fa_emit_char 'B'
.Llsl16i_22_SLT_done:
    brsge8 .Llsl16i_22_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_22_SGE_done
.Llsl16i_22_SGE_true:
    fa_emit_char 'B'
.Llsl16i_22_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x17c4
    ldi16 r5, 0x3ab8
    ldi16 r6, 0xc001
    ldi16 r7, 0x80a0
    lsl16i r6, 3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_23_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_23_EQ_done
.Llsl16i_23_EQ_true:
    fa_emit_char 'B'
.Llsl16i_23_EQ_done:
    brne8 .Llsl16i_23_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_23_NE_done
.Llsl16i_23_NE_true:
    fa_emit_char 'B'
.Llsl16i_23_NE_done:
    brult8 .Llsl16i_23_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_23_ULT_done
.Llsl16i_23_ULT_true:
    fa_emit_char 'B'
.Llsl16i_23_ULT_done:
    bruge8 .Llsl16i_23_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_23_UGE_done
.Llsl16i_23_UGE_true:
    fa_emit_char 'B'
.Llsl16i_23_UGE_done:
    brslt8 .Llsl16i_23_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_23_SLT_done
.Llsl16i_23_SLT_true:
    fa_emit_char 'B'
.Llsl16i_23_SLT_done:
    brsge8 .Llsl16i_23_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_23_SGE_done
.Llsl16i_23_SGE_true:
    fa_emit_char 'B'
.Llsl16i_23_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x17f5
    ldi16 r5, 0x3aef
    ldi16 r6, 0x8080
    ldi16 r7, 0x80e3
    lsl16i r6, 4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_24_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_24_EQ_done
.Llsl16i_24_EQ_true:
    fa_emit_char 'B'
.Llsl16i_24_EQ_done:
    brne8 .Llsl16i_24_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_24_NE_done
.Llsl16i_24_NE_true:
    fa_emit_char 'B'
.Llsl16i_24_NE_done:
    brult8 .Llsl16i_24_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_24_ULT_done
.Llsl16i_24_ULT_true:
    fa_emit_char 'B'
.Llsl16i_24_ULT_done:
    bruge8 .Llsl16i_24_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_24_UGE_done
.Llsl16i_24_UGE_true:
    fa_emit_char 'B'
.Llsl16i_24_UGE_done:
    brslt8 .Llsl16i_24_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_24_SLT_done
.Llsl16i_24_SLT_true:
    fa_emit_char 'B'
.Llsl16i_24_SLT_done:
    brsge8 .Llsl16i_24_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_24_SGE_done
.Llsl16i_24_SGE_true:
    fa_emit_char 'B'
.Llsl16i_24_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1826
    ldi16 r5, 0x3b26
    ldi16 r6, 0x7f01
    ldi16 r7, 0x8126
    lsl16i r6, 5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_25_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_25_EQ_done
.Llsl16i_25_EQ_true:
    fa_emit_char 'B'
.Llsl16i_25_EQ_done:
    brne8 .Llsl16i_25_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_25_NE_done
.Llsl16i_25_NE_true:
    fa_emit_char 'B'
.Llsl16i_25_NE_done:
    brult8 .Llsl16i_25_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_25_ULT_done
.Llsl16i_25_ULT_true:
    fa_emit_char 'B'
.Llsl16i_25_ULT_done:
    bruge8 .Llsl16i_25_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_25_UGE_done
.Llsl16i_25_UGE_true:
    fa_emit_char 'B'
.Llsl16i_25_UGE_done:
    brslt8 .Llsl16i_25_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_25_SLT_done
.Llsl16i_25_SLT_true:
    fa_emit_char 'B'
.Llsl16i_25_SLT_done:
    brsge8 .Llsl16i_25_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_25_SGE_done
.Llsl16i_25_SGE_true:
    fa_emit_char 'B'
.Llsl16i_25_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1857
    ldi16 r5, 0x3b5d
    ldi16 r6, 0x0000
    ldi16 r7, 0x8169
    lsl16i r6, 6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_26_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_26_EQ_done
.Llsl16i_26_EQ_true:
    fa_emit_char 'B'
.Llsl16i_26_EQ_done:
    brne8 .Llsl16i_26_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_26_NE_done
.Llsl16i_26_NE_true:
    fa_emit_char 'B'
.Llsl16i_26_NE_done:
    brult8 .Llsl16i_26_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_26_ULT_done
.Llsl16i_26_ULT_true:
    fa_emit_char 'B'
.Llsl16i_26_ULT_done:
    bruge8 .Llsl16i_26_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_26_UGE_done
.Llsl16i_26_UGE_true:
    fa_emit_char 'B'
.Llsl16i_26_UGE_done:
    brslt8 .Llsl16i_26_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_26_SLT_done
.Llsl16i_26_SLT_true:
    fa_emit_char 'B'
.Llsl16i_26_SLT_done:
    brsge8 .Llsl16i_26_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_26_SGE_done
.Llsl16i_26_SGE_true:
    fa_emit_char 'B'
.Llsl16i_26_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 7.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1888
    ldi16 r5, 0x3b94
    ldi16 r6, 0x0001
    ldi16 r7, 0x81ac
    lsl16i r6, 7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_27_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_27_EQ_done
.Llsl16i_27_EQ_true:
    fa_emit_char 'B'
.Llsl16i_27_EQ_done:
    brne8 .Llsl16i_27_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_27_NE_done
.Llsl16i_27_NE_true:
    fa_emit_char 'B'
.Llsl16i_27_NE_done:
    brult8 .Llsl16i_27_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_27_ULT_done
.Llsl16i_27_ULT_true:
    fa_emit_char 'B'
.Llsl16i_27_ULT_done:
    bruge8 .Llsl16i_27_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_27_UGE_done
.Llsl16i_27_UGE_true:
    fa_emit_char 'B'
.Llsl16i_27_UGE_done:
    brslt8 .Llsl16i_27_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_27_SLT_done
.Llsl16i_27_SLT_true:
    fa_emit_char 'B'
.Llsl16i_27_SLT_done:
    brsge8 .Llsl16i_27_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_27_SGE_done
.Llsl16i_27_SGE_true:
    fa_emit_char 'B'
.Llsl16i_27_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 8.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x18b9
    ldi16 r5, 0x3bcb
    ldi16 r6, 0x8001
    ldi16 r7, 0x81ef
    lsl16i r6, 8
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_28_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_28_EQ_done
.Llsl16i_28_EQ_true:
    fa_emit_char 'B'
.Llsl16i_28_EQ_done:
    brne8 .Llsl16i_28_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_28_NE_done
.Llsl16i_28_NE_true:
    fa_emit_char 'B'
.Llsl16i_28_NE_done:
    brult8 .Llsl16i_28_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_28_ULT_done
.Llsl16i_28_ULT_true:
    fa_emit_char 'B'
.Llsl16i_28_ULT_done:
    bruge8 .Llsl16i_28_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_28_UGE_done
.Llsl16i_28_UGE_true:
    fa_emit_char 'B'
.Llsl16i_28_UGE_done:
    brslt8 .Llsl16i_28_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_28_SLT_done
.Llsl16i_28_SLT_true:
    fa_emit_char 'B'
.Llsl16i_28_SLT_done:
    brsge8 .Llsl16i_28_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_28_SGE_done
.Llsl16i_28_SGE_true:
    fa_emit_char 'B'
.Llsl16i_28_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 9.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x18ea
    ldi16 r5, 0x3c02
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8232
    lsl16i r6, 9
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_29_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_29_EQ_done
.Llsl16i_29_EQ_true:
    fa_emit_char 'B'
.Llsl16i_29_EQ_done:
    brne8 .Llsl16i_29_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_29_NE_done
.Llsl16i_29_NE_true:
    fa_emit_char 'B'
.Llsl16i_29_NE_done:
    brult8 .Llsl16i_29_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_29_ULT_done
.Llsl16i_29_ULT_true:
    fa_emit_char 'B'
.Llsl16i_29_ULT_done:
    bruge8 .Llsl16i_29_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_29_UGE_done
.Llsl16i_29_UGE_true:
    fa_emit_char 'B'
.Llsl16i_29_UGE_done:
    brslt8 .Llsl16i_29_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_29_SLT_done
.Llsl16i_29_SLT_true:
    fa_emit_char 'B'
.Llsl16i_29_SLT_done:
    brsge8 .Llsl16i_29_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_29_SGE_done
.Llsl16i_29_SGE_true:
    fa_emit_char 'B'
.Llsl16i_29_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 10.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x191b
    ldi16 r5, 0x3c39
    ldi16 r6, 0x8000
    ldi16 r7, 0x8275
    lsl16i r6, 10
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_2a_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2a_EQ_done
.Llsl16i_2a_EQ_true:
    fa_emit_char 'B'
.Llsl16i_2a_EQ_done:
    brne8 .Llsl16i_2a_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2a_NE_done
.Llsl16i_2a_NE_true:
    fa_emit_char 'B'
.Llsl16i_2a_NE_done:
    brult8 .Llsl16i_2a_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2a_ULT_done
.Llsl16i_2a_ULT_true:
    fa_emit_char 'B'
.Llsl16i_2a_ULT_done:
    bruge8 .Llsl16i_2a_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2a_UGE_done
.Llsl16i_2a_UGE_true:
    fa_emit_char 'B'
.Llsl16i_2a_UGE_done:
    brslt8 .Llsl16i_2a_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2a_SLT_done
.Llsl16i_2a_SLT_true:
    fa_emit_char 'B'
.Llsl16i_2a_SLT_done:
    brsge8 .Llsl16i_2a_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2a_SGE_done
.Llsl16i_2a_SGE_true:
    fa_emit_char 'B'
.Llsl16i_2a_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 11.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x194c
    ldi16 r5, 0x3c70
    ldi16 r6, 0xffff
    ldi16 r7, 0x82b8
    lsl16i r6, 11
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_2b_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2b_EQ_done
.Llsl16i_2b_EQ_true:
    fa_emit_char 'B'
.Llsl16i_2b_EQ_done:
    brne8 .Llsl16i_2b_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2b_NE_done
.Llsl16i_2b_NE_true:
    fa_emit_char 'B'
.Llsl16i_2b_NE_done:
    brult8 .Llsl16i_2b_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2b_ULT_done
.Llsl16i_2b_ULT_true:
    fa_emit_char 'B'
.Llsl16i_2b_ULT_done:
    bruge8 .Llsl16i_2b_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2b_UGE_done
.Llsl16i_2b_UGE_true:
    fa_emit_char 'B'
.Llsl16i_2b_UGE_done:
    brslt8 .Llsl16i_2b_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2b_SLT_done
.Llsl16i_2b_SLT_true:
    fa_emit_char 'B'
.Llsl16i_2b_SLT_done:
    brsge8 .Llsl16i_2b_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2b_SGE_done
.Llsl16i_2b_SGE_true:
    fa_emit_char 'B'
.Llsl16i_2b_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 12.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x197d
    ldi16 r5, 0x3ca7
    ldi16 r6, 0xa55a
    ldi16 r7, 0x82fb
    lsl16i r6, 12
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_2c_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2c_EQ_done
.Llsl16i_2c_EQ_true:
    fa_emit_char 'B'
.Llsl16i_2c_EQ_done:
    brne8 .Llsl16i_2c_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2c_NE_done
.Llsl16i_2c_NE_true:
    fa_emit_char 'B'
.Llsl16i_2c_NE_done:
    brult8 .Llsl16i_2c_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2c_ULT_done
.Llsl16i_2c_ULT_true:
    fa_emit_char 'B'
.Llsl16i_2c_ULT_done:
    bruge8 .Llsl16i_2c_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2c_UGE_done
.Llsl16i_2c_UGE_true:
    fa_emit_char 'B'
.Llsl16i_2c_UGE_done:
    brslt8 .Llsl16i_2c_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2c_SLT_done
.Llsl16i_2c_SLT_true:
    fa_emit_char 'B'
.Llsl16i_2c_SLT_done:
    brsge8 .Llsl16i_2c_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2c_SGE_done
.Llsl16i_2c_SGE_true:
    fa_emit_char 'B'
.Llsl16i_2c_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 13.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x19ae
    ldi16 r5, 0x3cde
    ldi16 r6, 0x5aa5
    ldi16 r7, 0x833e
    lsl16i r6, 13
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_2d_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2d_EQ_done
.Llsl16i_2d_EQ_true:
    fa_emit_char 'B'
.Llsl16i_2d_EQ_done:
    brne8 .Llsl16i_2d_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2d_NE_done
.Llsl16i_2d_NE_true:
    fa_emit_char 'B'
.Llsl16i_2d_NE_done:
    brult8 .Llsl16i_2d_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2d_ULT_done
.Llsl16i_2d_ULT_true:
    fa_emit_char 'B'
.Llsl16i_2d_ULT_done:
    bruge8 .Llsl16i_2d_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2d_UGE_done
.Llsl16i_2d_UGE_true:
    fa_emit_char 'B'
.Llsl16i_2d_UGE_done:
    brslt8 .Llsl16i_2d_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2d_SLT_done
.Llsl16i_2d_SLT_true:
    fa_emit_char 'B'
.Llsl16i_2d_SLT_done:
    brsge8 .Llsl16i_2d_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2d_SGE_done
.Llsl16i_2d_SGE_true:
    fa_emit_char 'B'
.Llsl16i_2d_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 14.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x19df
    ldi16 r5, 0x3d15
    ldi16 r6, 0x1234
    ldi16 r7, 0x8381
    lsl16i r6, 14
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_2e_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2e_EQ_done
.Llsl16i_2e_EQ_true:
    fa_emit_char 'B'
.Llsl16i_2e_EQ_done:
    brne8 .Llsl16i_2e_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2e_NE_done
.Llsl16i_2e_NE_true:
    fa_emit_char 'B'
.Llsl16i_2e_NE_done:
    brult8 .Llsl16i_2e_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2e_ULT_done
.Llsl16i_2e_ULT_true:
    fa_emit_char 'B'
.Llsl16i_2e_ULT_done:
    bruge8 .Llsl16i_2e_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2e_UGE_done
.Llsl16i_2e_UGE_true:
    fa_emit_char 'B'
.Llsl16i_2e_UGE_done:
    brslt8 .Llsl16i_2e_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2e_SLT_done
.Llsl16i_2e_SLT_true:
    fa_emit_char 'B'
.Llsl16i_2e_SLT_done:
    brsge8 .Llsl16i_2e_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2e_SGE_done
.Llsl16i_2e_SGE_true:
    fa_emit_char 'B'
.Llsl16i_2e_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r6, count 15.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1a10
    ldi16 r5, 0x3d4c
    ldi16 r6, 0xfedc
    ldi16 r7, 0x83c4
    lsl16i r6, 15
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_2f_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2f_EQ_done
.Llsl16i_2f_EQ_true:
    fa_emit_char 'B'
.Llsl16i_2f_EQ_done:
    brne8 .Llsl16i_2f_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2f_NE_done
.Llsl16i_2f_NE_true:
    fa_emit_char 'B'
.Llsl16i_2f_NE_done:
    brult8 .Llsl16i_2f_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2f_ULT_done
.Llsl16i_2f_ULT_true:
    fa_emit_char 'B'
.Llsl16i_2f_ULT_done:
    bruge8 .Llsl16i_2f_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2f_UGE_done
.Llsl16i_2f_UGE_true:
    fa_emit_char 'B'
.Llsl16i_2f_UGE_done:
    brslt8 .Llsl16i_2f_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2f_SLT_done
.Llsl16i_2f_SLT_true:
    fa_emit_char 'B'
.Llsl16i_2f_SLT_done:
    brsge8 .Llsl16i_2f_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_2f_SGE_done
.Llsl16i_2f_SGE_true:
    fa_emit_char 'B'
.Llsl16i_2f_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1a41
    ldi16 r5, 0x3d83
    ldi16 r6, 0x60c5
    ldi16 r7, 0x7f01
    lsl16i r7, 0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_30_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_30_EQ_done
.Llsl16i_30_EQ_true:
    fa_emit_char 'B'
.Llsl16i_30_EQ_done:
    brne8 .Llsl16i_30_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_30_NE_done
.Llsl16i_30_NE_true:
    fa_emit_char 'B'
.Llsl16i_30_NE_done:
    brult8 .Llsl16i_30_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_30_ULT_done
.Llsl16i_30_ULT_true:
    fa_emit_char 'B'
.Llsl16i_30_ULT_done:
    bruge8 .Llsl16i_30_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_30_UGE_done
.Llsl16i_30_UGE_true:
    fa_emit_char 'B'
.Llsl16i_30_UGE_done:
    brslt8 .Llsl16i_30_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_30_SLT_done
.Llsl16i_30_SLT_true:
    fa_emit_char 'B'
.Llsl16i_30_SLT_done:
    brsge8 .Llsl16i_30_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_30_SGE_done
.Llsl16i_30_SGE_true:
    fa_emit_char 'B'
.Llsl16i_30_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1a72
    ldi16 r5, 0x3dba
    ldi16 r6, 0x6102
    ldi16 r7, 0x0000
    lsl16i r7, 1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_31_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_31_EQ_done
.Llsl16i_31_EQ_true:
    fa_emit_char 'B'
.Llsl16i_31_EQ_done:
    brne8 .Llsl16i_31_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_31_NE_done
.Llsl16i_31_NE_true:
    fa_emit_char 'B'
.Llsl16i_31_NE_done:
    brult8 .Llsl16i_31_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_31_ULT_done
.Llsl16i_31_ULT_true:
    fa_emit_char 'B'
.Llsl16i_31_ULT_done:
    bruge8 .Llsl16i_31_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_31_UGE_done
.Llsl16i_31_UGE_true:
    fa_emit_char 'B'
.Llsl16i_31_UGE_done:
    brslt8 .Llsl16i_31_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_31_SLT_done
.Llsl16i_31_SLT_true:
    fa_emit_char 'B'
.Llsl16i_31_SLT_done:
    brsge8 .Llsl16i_31_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_31_SGE_done
.Llsl16i_31_SGE_true:
    fa_emit_char 'B'
.Llsl16i_31_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1aa3
    ldi16 r5, 0x3df1
    ldi16 r6, 0x613f
    ldi16 r7, 0x0001
    lsl16i r7, 2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_32_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_32_EQ_done
.Llsl16i_32_EQ_true:
    fa_emit_char 'B'
.Llsl16i_32_EQ_done:
    brne8 .Llsl16i_32_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_32_NE_done
.Llsl16i_32_NE_true:
    fa_emit_char 'B'
.Llsl16i_32_NE_done:
    brult8 .Llsl16i_32_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_32_ULT_done
.Llsl16i_32_ULT_true:
    fa_emit_char 'B'
.Llsl16i_32_ULT_done:
    bruge8 .Llsl16i_32_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_32_UGE_done
.Llsl16i_32_UGE_true:
    fa_emit_char 'B'
.Llsl16i_32_UGE_done:
    brslt8 .Llsl16i_32_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_32_SLT_done
.Llsl16i_32_SLT_true:
    fa_emit_char 'B'
.Llsl16i_32_SLT_done:
    brsge8 .Llsl16i_32_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_32_SGE_done
.Llsl16i_32_SGE_true:
    fa_emit_char 'B'
.Llsl16i_32_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1ad4
    ldi16 r5, 0x3e28
    ldi16 r6, 0x617c
    ldi16 r7, 0x8001
    lsl16i r7, 3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_33_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_33_EQ_done
.Llsl16i_33_EQ_true:
    fa_emit_char 'B'
.Llsl16i_33_EQ_done:
    brne8 .Llsl16i_33_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_33_NE_done
.Llsl16i_33_NE_true:
    fa_emit_char 'B'
.Llsl16i_33_NE_done:
    brult8 .Llsl16i_33_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_33_ULT_done
.Llsl16i_33_ULT_true:
    fa_emit_char 'B'
.Llsl16i_33_ULT_done:
    bruge8 .Llsl16i_33_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_33_UGE_done
.Llsl16i_33_UGE_true:
    fa_emit_char 'B'
.Llsl16i_33_UGE_done:
    brslt8 .Llsl16i_33_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_33_SLT_done
.Llsl16i_33_SLT_true:
    fa_emit_char 'B'
.Llsl16i_33_SLT_done:
    brsge8 .Llsl16i_33_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_33_SGE_done
.Llsl16i_33_SGE_true:
    fa_emit_char 'B'
.Llsl16i_33_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1b05
    ldi16 r5, 0x3e5f
    ldi16 r6, 0x61b9
    ldi16 r7, 0x7fff
    lsl16i r7, 4
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_34_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_34_EQ_done
.Llsl16i_34_EQ_true:
    fa_emit_char 'B'
.Llsl16i_34_EQ_done:
    brne8 .Llsl16i_34_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_34_NE_done
.Llsl16i_34_NE_true:
    fa_emit_char 'B'
.Llsl16i_34_NE_done:
    brult8 .Llsl16i_34_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_34_ULT_done
.Llsl16i_34_ULT_true:
    fa_emit_char 'B'
.Llsl16i_34_ULT_done:
    bruge8 .Llsl16i_34_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_34_UGE_done
.Llsl16i_34_UGE_true:
    fa_emit_char 'B'
.Llsl16i_34_UGE_done:
    brslt8 .Llsl16i_34_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_34_SLT_done
.Llsl16i_34_SLT_true:
    fa_emit_char 'B'
.Llsl16i_34_SLT_done:
    brsge8 .Llsl16i_34_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_34_SGE_done
.Llsl16i_34_SGE_true:
    fa_emit_char 'B'
.Llsl16i_34_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1b36
    ldi16 r5, 0x3e96
    ldi16 r6, 0x61f6
    ldi16 r7, 0x8000
    lsl16i r7, 5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_35_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_35_EQ_done
.Llsl16i_35_EQ_true:
    fa_emit_char 'B'
.Llsl16i_35_EQ_done:
    brne8 .Llsl16i_35_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_35_NE_done
.Llsl16i_35_NE_true:
    fa_emit_char 'B'
.Llsl16i_35_NE_done:
    brult8 .Llsl16i_35_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_35_ULT_done
.Llsl16i_35_ULT_true:
    fa_emit_char 'B'
.Llsl16i_35_ULT_done:
    bruge8 .Llsl16i_35_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_35_UGE_done
.Llsl16i_35_UGE_true:
    fa_emit_char 'B'
.Llsl16i_35_UGE_done:
    brslt8 .Llsl16i_35_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_35_SLT_done
.Llsl16i_35_SLT_true:
    fa_emit_char 'B'
.Llsl16i_35_SLT_done:
    brsge8 .Llsl16i_35_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_35_SGE_done
.Llsl16i_35_SGE_true:
    fa_emit_char 'B'
.Llsl16i_35_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1b67
    ldi16 r5, 0x3ecd
    ldi16 r6, 0x6233
    ldi16 r7, 0xffff
    lsl16i r7, 6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_36_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_36_EQ_done
.Llsl16i_36_EQ_true:
    fa_emit_char 'B'
.Llsl16i_36_EQ_done:
    brne8 .Llsl16i_36_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_36_NE_done
.Llsl16i_36_NE_true:
    fa_emit_char 'B'
.Llsl16i_36_NE_done:
    brult8 .Llsl16i_36_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_36_ULT_done
.Llsl16i_36_ULT_true:
    fa_emit_char 'B'
.Llsl16i_36_ULT_done:
    bruge8 .Llsl16i_36_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_36_UGE_done
.Llsl16i_36_UGE_true:
    fa_emit_char 'B'
.Llsl16i_36_UGE_done:
    brslt8 .Llsl16i_36_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_36_SLT_done
.Llsl16i_36_SLT_true:
    fa_emit_char 'B'
.Llsl16i_36_SLT_done:
    brsge8 .Llsl16i_36_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_36_SGE_done
.Llsl16i_36_SGE_true:
    fa_emit_char 'B'
.Llsl16i_36_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1b98
    ldi16 r5, 0x3f04
    ldi16 r6, 0x6270
    ldi16 r7, 0xa55a
    lsl16i r7, 7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_37_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_37_EQ_done
.Llsl16i_37_EQ_true:
    fa_emit_char 'B'
.Llsl16i_37_EQ_done:
    brne8 .Llsl16i_37_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_37_NE_done
.Llsl16i_37_NE_true:
    fa_emit_char 'B'
.Llsl16i_37_NE_done:
    brult8 .Llsl16i_37_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_37_ULT_done
.Llsl16i_37_ULT_true:
    fa_emit_char 'B'
.Llsl16i_37_ULT_done:
    bruge8 .Llsl16i_37_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_37_UGE_done
.Llsl16i_37_UGE_true:
    fa_emit_char 'B'
.Llsl16i_37_UGE_done:
    brslt8 .Llsl16i_37_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_37_SLT_done
.Llsl16i_37_SLT_true:
    fa_emit_char 'B'
.Llsl16i_37_SLT_done:
    brsge8 .Llsl16i_37_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_37_SGE_done
.Llsl16i_37_SGE_true:
    fa_emit_char 'B'
.Llsl16i_37_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 8.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1bc9
    ldi16 r5, 0x3f3b
    ldi16 r6, 0x62ad
    ldi16 r7, 0x5aa5
    lsl16i r7, 8
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_38_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_38_EQ_done
.Llsl16i_38_EQ_true:
    fa_emit_char 'B'
.Llsl16i_38_EQ_done:
    brne8 .Llsl16i_38_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_38_NE_done
.Llsl16i_38_NE_true:
    fa_emit_char 'B'
.Llsl16i_38_NE_done:
    brult8 .Llsl16i_38_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_38_ULT_done
.Llsl16i_38_ULT_true:
    fa_emit_char 'B'
.Llsl16i_38_ULT_done:
    bruge8 .Llsl16i_38_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_38_UGE_done
.Llsl16i_38_UGE_true:
    fa_emit_char 'B'
.Llsl16i_38_UGE_done:
    brslt8 .Llsl16i_38_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_38_SLT_done
.Llsl16i_38_SLT_true:
    fa_emit_char 'B'
.Llsl16i_38_SLT_done:
    brsge8 .Llsl16i_38_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_38_SGE_done
.Llsl16i_38_SGE_true:
    fa_emit_char 'B'
.Llsl16i_38_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 9.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1bfa
    ldi16 r5, 0x3f72
    ldi16 r6, 0x62ea
    ldi16 r7, 0x1234
    lsl16i r7, 9
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_39_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_39_EQ_done
.Llsl16i_39_EQ_true:
    fa_emit_char 'B'
.Llsl16i_39_EQ_done:
    brne8 .Llsl16i_39_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_39_NE_done
.Llsl16i_39_NE_true:
    fa_emit_char 'B'
.Llsl16i_39_NE_done:
    brult8 .Llsl16i_39_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_39_ULT_done
.Llsl16i_39_ULT_true:
    fa_emit_char 'B'
.Llsl16i_39_ULT_done:
    bruge8 .Llsl16i_39_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_39_UGE_done
.Llsl16i_39_UGE_true:
    fa_emit_char 'B'
.Llsl16i_39_UGE_done:
    brslt8 .Llsl16i_39_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_39_SLT_done
.Llsl16i_39_SLT_true:
    fa_emit_char 'B'
.Llsl16i_39_SLT_done:
    brsge8 .Llsl16i_39_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_39_SGE_done
.Llsl16i_39_SGE_true:
    fa_emit_char 'B'
.Llsl16i_39_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 10.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1c2b
    ldi16 r5, 0x3fa9
    ldi16 r6, 0x6327
    ldi16 r7, 0xfedc
    lsl16i r7, 10
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_3a_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3a_EQ_done
.Llsl16i_3a_EQ_true:
    fa_emit_char 'B'
.Llsl16i_3a_EQ_done:
    brne8 .Llsl16i_3a_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3a_NE_done
.Llsl16i_3a_NE_true:
    fa_emit_char 'B'
.Llsl16i_3a_NE_done:
    brult8 .Llsl16i_3a_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3a_ULT_done
.Llsl16i_3a_ULT_true:
    fa_emit_char 'B'
.Llsl16i_3a_ULT_done:
    bruge8 .Llsl16i_3a_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3a_UGE_done
.Llsl16i_3a_UGE_true:
    fa_emit_char 'B'
.Llsl16i_3a_UGE_done:
    brslt8 .Llsl16i_3a_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3a_SLT_done
.Llsl16i_3a_SLT_true:
    fa_emit_char 'B'
.Llsl16i_3a_SLT_done:
    brsge8 .Llsl16i_3a_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3a_SGE_done
.Llsl16i_3a_SGE_true:
    fa_emit_char 'B'
.Llsl16i_3a_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 11.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1c5c
    ldi16 r5, 0x3fe0
    ldi16 r6, 0x6364
    ldi16 r7, 0x0100
    lsl16i r7, 11
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_3b_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3b_EQ_done
.Llsl16i_3b_EQ_true:
    fa_emit_char 'B'
.Llsl16i_3b_EQ_done:
    brne8 .Llsl16i_3b_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3b_NE_done
.Llsl16i_3b_NE_true:
    fa_emit_char 'B'
.Llsl16i_3b_NE_done:
    brult8 .Llsl16i_3b_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3b_ULT_done
.Llsl16i_3b_ULT_true:
    fa_emit_char 'B'
.Llsl16i_3b_ULT_done:
    bruge8 .Llsl16i_3b_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3b_UGE_done
.Llsl16i_3b_UGE_true:
    fa_emit_char 'B'
.Llsl16i_3b_UGE_done:
    brslt8 .Llsl16i_3b_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3b_SLT_done
.Llsl16i_3b_SLT_true:
    fa_emit_char 'B'
.Llsl16i_3b_SLT_done:
    brsge8 .Llsl16i_3b_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3b_SGE_done
.Llsl16i_3b_SGE_true:
    fa_emit_char 'B'
.Llsl16i_3b_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 12.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1c8d
    ldi16 r5, 0x4017
    ldi16 r6, 0x63a1
    ldi16 r7, 0x00ff
    lsl16i r7, 12
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_3c_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3c_EQ_done
.Llsl16i_3c_EQ_true:
    fa_emit_char 'B'
.Llsl16i_3c_EQ_done:
    brne8 .Llsl16i_3c_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3c_NE_done
.Llsl16i_3c_NE_true:
    fa_emit_char 'B'
.Llsl16i_3c_NE_done:
    brult8 .Llsl16i_3c_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3c_ULT_done
.Llsl16i_3c_ULT_true:
    fa_emit_char 'B'
.Llsl16i_3c_ULT_done:
    bruge8 .Llsl16i_3c_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3c_UGE_done
.Llsl16i_3c_UGE_true:
    fa_emit_char 'B'
.Llsl16i_3c_UGE_done:
    brslt8 .Llsl16i_3c_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3c_SLT_done
.Llsl16i_3c_SLT_true:
    fa_emit_char 'B'
.Llsl16i_3c_SLT_done:
    brsge8 .Llsl16i_3c_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3c_SGE_done
.Llsl16i_3c_SGE_true:
    fa_emit_char 'B'
.Llsl16i_3c_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 13.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1cbe
    ldi16 r5, 0x404e
    ldi16 r6, 0x63de
    ldi16 r7, 0x4001
    lsl16i r7, 13
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_3d_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3d_EQ_done
.Llsl16i_3d_EQ_true:
    fa_emit_char 'B'
.Llsl16i_3d_EQ_done:
    brne8 .Llsl16i_3d_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3d_NE_done
.Llsl16i_3d_NE_true:
    fa_emit_char 'B'
.Llsl16i_3d_NE_done:
    brult8 .Llsl16i_3d_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3d_ULT_done
.Llsl16i_3d_ULT_true:
    fa_emit_char 'B'
.Llsl16i_3d_ULT_done:
    bruge8 .Llsl16i_3d_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3d_UGE_done
.Llsl16i_3d_UGE_true:
    fa_emit_char 'B'
.Llsl16i_3d_UGE_done:
    brslt8 .Llsl16i_3d_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3d_SLT_done
.Llsl16i_3d_SLT_true:
    fa_emit_char 'B'
.Llsl16i_3d_SLT_done:
    brsge8 .Llsl16i_3d_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3d_SGE_done
.Llsl16i_3d_SGE_true:
    fa_emit_char 'B'
.Llsl16i_3d_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 14.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1cef
    ldi16 r5, 0x4085
    ldi16 r6, 0x641b
    ldi16 r7, 0xc001
    lsl16i r7, 14
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_3e_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3e_EQ_done
.Llsl16i_3e_EQ_true:
    fa_emit_char 'B'
.Llsl16i_3e_EQ_done:
    brne8 .Llsl16i_3e_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3e_NE_done
.Llsl16i_3e_NE_true:
    fa_emit_char 'B'
.Llsl16i_3e_NE_done:
    brult8 .Llsl16i_3e_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3e_ULT_done
.Llsl16i_3e_ULT_true:
    fa_emit_char 'B'
.Llsl16i_3e_ULT_done:
    bruge8 .Llsl16i_3e_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3e_UGE_done
.Llsl16i_3e_UGE_true:
    fa_emit_char 'B'
.Llsl16i_3e_UGE_done:
    brslt8 .Llsl16i_3e_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3e_SLT_done
.Llsl16i_3e_SLT_true:
    fa_emit_char 'B'
.Llsl16i_3e_SLT_done:
    brsge8 .Llsl16i_3e_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3e_SGE_done
.Llsl16i_3e_SGE_true:
    fa_emit_char 'B'
.Llsl16i_3e_SGE_done:
    fa_emit_char '\n'

    ; Secondary encoding destination r7, count 15.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1d20
    ldi16 r5, 0x40bc
    ldi16 r6, 0x6458
    ldi16 r7, 0x8080
    lsl16i r7, 15
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsl16i_3f_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3f_EQ_done
.Llsl16i_3f_EQ_true:
    fa_emit_char 'B'
.Llsl16i_3f_EQ_done:
    brne8 .Llsl16i_3f_NE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3f_NE_done
.Llsl16i_3f_NE_true:
    fa_emit_char 'B'
.Llsl16i_3f_NE_done:
    brult8 .Llsl16i_3f_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3f_ULT_done
.Llsl16i_3f_ULT_true:
    fa_emit_char 'B'
.Llsl16i_3f_ULT_done:
    bruge8 .Llsl16i_3f_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3f_UGE_done
.Llsl16i_3f_UGE_true:
    fa_emit_char 'B'
.Llsl16i_3f_UGE_done:
    brslt8 .Llsl16i_3f_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3f_SLT_done
.Llsl16i_3f_SLT_true:
    fa_emit_char 'B'
.Llsl16i_3f_SLT_done:
    brsge8 .Llsl16i_3f_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsl16i_3f_SGE_done
.Llsl16i_3f_SGE_true:
    fa_emit_char 'B'
.Llsl16i_3f_SGE_done:
    fa_emit_char '\n'

    sys debug_break
