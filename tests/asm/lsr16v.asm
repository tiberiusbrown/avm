.include "include/fa_shift_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; d=c0, count=c0, effective count 0, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x8000
    ldi16 c1, 0x6a33
    ldi16 c2, 0x9255
    ldi16 c3, 0xba77
    lsr16v c0, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_00_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_00_EQ_done
.Llsr16v_00_EQ_true:
    fa_emit_char 'B'
.Llsr16v_00_EQ_done:
    brne8 .Llsr16v_00_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_00_NE_done
.Llsr16v_00_NE_true:
    fa_emit_char 'B'
.Llsr16v_00_NE_done:
    brult8 .Llsr16v_00_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_00_ULT_done
.Llsr16v_00_ULT_true:
    fa_emit_char 'B'
.Llsr16v_00_ULT_done:
    bruge8 .Llsr16v_00_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_00_UGE_done
.Llsr16v_00_UGE_true:
    fa_emit_char 'B'
.Llsr16v_00_UGE_done:
    brslt8 .Llsr16v_00_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_00_SLT_done
.Llsr16v_00_SLT_true:
    fa_emit_char 'B'
.Llsr16v_00_SLT_done:
    brsge8 .Llsr16v_00_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_00_SGE_done
.Llsr16v_00_SGE_true:
    fa_emit_char 'B'
.Llsr16v_00_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c0, effective count 4, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xf004
    ldi16 c1, 0x6a6a
    ldi16 c2, 0x9292
    ldi16 c3, 0xbaba
    lsr16v c0, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_01_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_01_EQ_done
.Llsr16v_01_EQ_true:
    fa_emit_char 'B'
.Llsr16v_01_EQ_done:
    brne8 .Llsr16v_01_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_01_NE_done
.Llsr16v_01_NE_true:
    fa_emit_char 'B'
.Llsr16v_01_NE_done:
    brult8 .Llsr16v_01_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_01_ULT_done
.Llsr16v_01_ULT_true:
    fa_emit_char 'B'
.Llsr16v_01_ULT_done:
    bruge8 .Llsr16v_01_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_01_UGE_done
.Llsr16v_01_UGE_true:
    fa_emit_char 'B'
.Llsr16v_01_UGE_done:
    brslt8 .Llsr16v_01_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_01_SLT_done
.Llsr16v_01_SLT_true:
    fa_emit_char 'B'
.Llsr16v_01_SLT_done:
    brsge8 .Llsr16v_01_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_01_SGE_done
.Llsr16v_01_SGE_true:
    fa_emit_char 'B'
.Llsr16v_01_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c0, effective count 8, pattern 2.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x5aa8
    ldi16 c1, 0x6aa1
    ldi16 c2, 0x92cf
    ldi16 c3, 0xbafd
    lsr16v c0, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_02_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_02_EQ_done
.Llsr16v_02_EQ_true:
    fa_emit_char 'B'
.Llsr16v_02_EQ_done:
    brne8 .Llsr16v_02_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_02_NE_done
.Llsr16v_02_NE_true:
    fa_emit_char 'B'
.Llsr16v_02_NE_done:
    brult8 .Llsr16v_02_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_02_ULT_done
.Llsr16v_02_ULT_true:
    fa_emit_char 'B'
.Llsr16v_02_ULT_done:
    bruge8 .Llsr16v_02_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_02_UGE_done
.Llsr16v_02_UGE_true:
    fa_emit_char 'B'
.Llsr16v_02_UGE_done:
    brslt8 .Llsr16v_02_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_02_SLT_done
.Llsr16v_02_SLT_true:
    fa_emit_char 'B'
.Llsr16v_02_SLT_done:
    brsge8 .Llsr16v_02_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_02_SGE_done
.Llsr16v_02_SGE_true:
    fa_emit_char 'B'
.Llsr16v_02_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c0, effective count 12, pattern 3.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xc3dc
    ldi16 c1, 0x6ad8
    ldi16 c2, 0x930c
    ldi16 c3, 0xbb40
    lsr16v c0, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_03_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_03_EQ_done
.Llsr16v_03_EQ_true:
    fa_emit_char 'B'
.Llsr16v_03_EQ_done:
    brne8 .Llsr16v_03_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_03_NE_done
.Llsr16v_03_NE_true:
    fa_emit_char 'B'
.Llsr16v_03_NE_done:
    brult8 .Llsr16v_03_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_03_ULT_done
.Llsr16v_03_ULT_true:
    fa_emit_char 'B'
.Llsr16v_03_ULT_done:
    bruge8 .Llsr16v_03_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_03_UGE_done
.Llsr16v_03_UGE_true:
    fa_emit_char 'B'
.Llsr16v_03_UGE_done:
    brslt8 .Llsr16v_03_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_03_SLT_done
.Llsr16v_03_SLT_true:
    fa_emit_char 'B'
.Llsr16v_03_SLT_done:
    brsge8 .Llsr16v_03_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_03_SGE_done
.Llsr16v_03_SGE_true:
    fa_emit_char 'B'
.Llsr16v_03_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c1, effective count 1, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x0001
    ldi16 c1, 0xa0d1
    ldi16 c2, 0x9349
    ldi16 c3, 0xbb83
    lsr16v c0, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_04_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_04_EQ_done
.Llsr16v_04_EQ_true:
    fa_emit_char 'B'
.Llsr16v_04_EQ_done:
    brne8 .Llsr16v_04_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_04_NE_done
.Llsr16v_04_NE_true:
    fa_emit_char 'B'
.Llsr16v_04_NE_done:
    brult8 .Llsr16v_04_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_04_ULT_done
.Llsr16v_04_ULT_true:
    fa_emit_char 'B'
.Llsr16v_04_ULT_done:
    bruge8 .Llsr16v_04_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_04_UGE_done
.Llsr16v_04_UGE_true:
    fa_emit_char 'B'
.Llsr16v_04_UGE_done:
    brslt8 .Llsr16v_04_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_04_SLT_done
.Llsr16v_04_SLT_true:
    fa_emit_char 'B'
.Llsr16v_04_SLT_done:
    brsge8 .Llsr16v_04_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_04_SGE_done
.Llsr16v_04_SGE_true:
    fa_emit_char 'B'
.Llsr16v_04_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c1, effective count 5, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x8000
    ldi16 c1, 0xa0c5
    ldi16 c2, 0x9386
    ldi16 c3, 0xbbc6
    lsr16v c0, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_05_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_05_EQ_done
.Llsr16v_05_EQ_true:
    fa_emit_char 'B'
.Llsr16v_05_EQ_done:
    brne8 .Llsr16v_05_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_05_NE_done
.Llsr16v_05_NE_true:
    fa_emit_char 'B'
.Llsr16v_05_NE_done:
    brult8 .Llsr16v_05_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_05_ULT_done
.Llsr16v_05_ULT_true:
    fa_emit_char 'B'
.Llsr16v_05_ULT_done:
    bruge8 .Llsr16v_05_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_05_UGE_done
.Llsr16v_05_UGE_true:
    fa_emit_char 'B'
.Llsr16v_05_UGE_done:
    brslt8 .Llsr16v_05_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_05_SLT_done
.Llsr16v_05_SLT_true:
    fa_emit_char 'B'
.Llsr16v_05_SLT_done:
    brsge8 .Llsr16v_05_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_05_SGE_done
.Llsr16v_05_SGE_true:
    fa_emit_char 'B'
.Llsr16v_05_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c1, effective count 9, pattern 2.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x5aa5
    ldi16 c1, 0xa0b9
    ldi16 c2, 0x93c3
    ldi16 c3, 0xbc09
    lsr16v c0, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_06_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_06_EQ_done
.Llsr16v_06_EQ_true:
    fa_emit_char 'B'
.Llsr16v_06_EQ_done:
    brne8 .Llsr16v_06_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_06_NE_done
.Llsr16v_06_NE_true:
    fa_emit_char 'B'
.Llsr16v_06_NE_done:
    brult8 .Llsr16v_06_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_06_ULT_done
.Llsr16v_06_ULT_true:
    fa_emit_char 'B'
.Llsr16v_06_ULT_done:
    bruge8 .Llsr16v_06_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_06_UGE_done
.Llsr16v_06_UGE_true:
    fa_emit_char 'B'
.Llsr16v_06_UGE_done:
    brslt8 .Llsr16v_06_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_06_SLT_done
.Llsr16v_06_SLT_true:
    fa_emit_char 'B'
.Llsr16v_06_SLT_done:
    brsge8 .Llsr16v_06_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_06_SGE_done
.Llsr16v_06_SGE_true:
    fa_emit_char 'B'
.Llsr16v_06_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c1, effective count 13, pattern 3.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x0100
    ldi16 c1, 0xa0ad
    ldi16 c2, 0x9400
    ldi16 c3, 0xbc4c
    lsr16v c0, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_07_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_07_EQ_done
.Llsr16v_07_EQ_true:
    fa_emit_char 'B'
.Llsr16v_07_EQ_done:
    brne8 .Llsr16v_07_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_07_NE_done
.Llsr16v_07_NE_true:
    fa_emit_char 'B'
.Llsr16v_07_NE_done:
    brult8 .Llsr16v_07_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_07_ULT_done
.Llsr16v_07_ULT_true:
    fa_emit_char 'B'
.Llsr16v_07_ULT_done:
    bruge8 .Llsr16v_07_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_07_UGE_done
.Llsr16v_07_UGE_true:
    fa_emit_char 'B'
.Llsr16v_07_UGE_done:
    brslt8 .Llsr16v_07_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_07_SLT_done
.Llsr16v_07_SLT_true:
    fa_emit_char 'B'
.Llsr16v_07_SLT_done:
    brsge8 .Llsr16v_07_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_07_SGE_done
.Llsr16v_07_SGE_true:
    fa_emit_char 'B'
.Llsr16v_07_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c2, effective count 2, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x8001
    ldi16 c1, 0x6beb
    ldi16 c2, 0xa0d2
    ldi16 c3, 0xbc8f
    lsr16v c0, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_08_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_08_EQ_done
.Llsr16v_08_EQ_true:
    fa_emit_char 'B'
.Llsr16v_08_EQ_done:
    brne8 .Llsr16v_08_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_08_NE_done
.Llsr16v_08_NE_true:
    fa_emit_char 'B'
.Llsr16v_08_NE_done:
    brult8 .Llsr16v_08_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_08_ULT_done
.Llsr16v_08_ULT_true:
    fa_emit_char 'B'
.Llsr16v_08_ULT_done:
    bruge8 .Llsr16v_08_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_08_UGE_done
.Llsr16v_08_UGE_true:
    fa_emit_char 'B'
.Llsr16v_08_UGE_done:
    brslt8 .Llsr16v_08_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_08_SLT_done
.Llsr16v_08_SLT_true:
    fa_emit_char 'B'
.Llsr16v_08_SLT_done:
    brsge8 .Llsr16v_08_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_08_SGE_done
.Llsr16v_08_SGE_true:
    fa_emit_char 'B'
.Llsr16v_08_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c2, effective count 6, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xffff
    ldi16 c1, 0x6c22
    ldi16 c2, 0xa0c6
    ldi16 c3, 0xbcd2
    lsr16v c0, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_09_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_09_EQ_done
.Llsr16v_09_EQ_true:
    fa_emit_char 'B'
.Llsr16v_09_EQ_done:
    brne8 .Llsr16v_09_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_09_NE_done
.Llsr16v_09_NE_true:
    fa_emit_char 'B'
.Llsr16v_09_NE_done:
    brult8 .Llsr16v_09_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_09_ULT_done
.Llsr16v_09_ULT_true:
    fa_emit_char 'B'
.Llsr16v_09_ULT_done:
    bruge8 .Llsr16v_09_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_09_UGE_done
.Llsr16v_09_UGE_true:
    fa_emit_char 'B'
.Llsr16v_09_UGE_done:
    brslt8 .Llsr16v_09_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_09_SLT_done
.Llsr16v_09_SLT_true:
    fa_emit_char 'B'
.Llsr16v_09_SLT_done:
    brsge8 .Llsr16v_09_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_09_SGE_done
.Llsr16v_09_SGE_true:
    fa_emit_char 'B'
.Llsr16v_09_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c2, effective count 10, pattern 2.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1234
    ldi16 c1, 0x6c59
    ldi16 c2, 0xa0ba
    ldi16 c3, 0xbd15
    lsr16v c0, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_0a_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0a_EQ_done
.Llsr16v_0a_EQ_true:
    fa_emit_char 'B'
.Llsr16v_0a_EQ_done:
    brne8 .Llsr16v_0a_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0a_NE_done
.Llsr16v_0a_NE_true:
    fa_emit_char 'B'
.Llsr16v_0a_NE_done:
    brult8 .Llsr16v_0a_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0a_ULT_done
.Llsr16v_0a_ULT_true:
    fa_emit_char 'B'
.Llsr16v_0a_ULT_done:
    bruge8 .Llsr16v_0a_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0a_UGE_done
.Llsr16v_0a_UGE_true:
    fa_emit_char 'B'
.Llsr16v_0a_UGE_done:
    brslt8 .Llsr16v_0a_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0a_SLT_done
.Llsr16v_0a_SLT_true:
    fa_emit_char 'B'
.Llsr16v_0a_SLT_done:
    brsge8 .Llsr16v_0a_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0a_SGE_done
.Llsr16v_0a_SGE_true:
    fa_emit_char 'B'
.Llsr16v_0a_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c2, effective count 14, pattern 3.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x00ff
    ldi16 c1, 0x6c90
    ldi16 c2, 0xa0ae
    ldi16 c3, 0xbd58
    lsr16v c0, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_0b_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0b_EQ_done
.Llsr16v_0b_EQ_true:
    fa_emit_char 'B'
.Llsr16v_0b_EQ_done:
    brne8 .Llsr16v_0b_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0b_NE_done
.Llsr16v_0b_NE_true:
    fa_emit_char 'B'
.Llsr16v_0b_NE_done:
    brult8 .Llsr16v_0b_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0b_ULT_done
.Llsr16v_0b_ULT_true:
    fa_emit_char 'B'
.Llsr16v_0b_ULT_done:
    bruge8 .Llsr16v_0b_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0b_UGE_done
.Llsr16v_0b_UGE_true:
    fa_emit_char 'B'
.Llsr16v_0b_UGE_done:
    brslt8 .Llsr16v_0b_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0b_SLT_done
.Llsr16v_0b_SLT_true:
    fa_emit_char 'B'
.Llsr16v_0b_SLT_done:
    brsge8 .Llsr16v_0b_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0b_SGE_done
.Llsr16v_0b_SGE_true:
    fa_emit_char 'B'
.Llsr16v_0b_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c3, effective count 3, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x7fff
    ldi16 c1, 0x6cc7
    ldi16 c2, 0x9531
    ldi16 c3, 0xa0d3
    lsr16v c0, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_0c_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0c_EQ_done
.Llsr16v_0c_EQ_true:
    fa_emit_char 'B'
.Llsr16v_0c_EQ_done:
    brne8 .Llsr16v_0c_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0c_NE_done
.Llsr16v_0c_NE_true:
    fa_emit_char 'B'
.Llsr16v_0c_NE_done:
    brult8 .Llsr16v_0c_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0c_ULT_done
.Llsr16v_0c_ULT_true:
    fa_emit_char 'B'
.Llsr16v_0c_ULT_done:
    bruge8 .Llsr16v_0c_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0c_UGE_done
.Llsr16v_0c_UGE_true:
    fa_emit_char 'B'
.Llsr16v_0c_UGE_done:
    brslt8 .Llsr16v_0c_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0c_SLT_done
.Llsr16v_0c_SLT_true:
    fa_emit_char 'B'
.Llsr16v_0c_SLT_done:
    brsge8 .Llsr16v_0c_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0c_SGE_done
.Llsr16v_0c_SGE_true:
    fa_emit_char 'B'
.Llsr16v_0c_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c3, effective count 7, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xa55a
    ldi16 c1, 0x6cfe
    ldi16 c2, 0x956e
    ldi16 c3, 0xa0c7
    lsr16v c0, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_0d_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0d_EQ_done
.Llsr16v_0d_EQ_true:
    fa_emit_char 'B'
.Llsr16v_0d_EQ_done:
    brne8 .Llsr16v_0d_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0d_NE_done
.Llsr16v_0d_NE_true:
    fa_emit_char 'B'
.Llsr16v_0d_NE_done:
    brult8 .Llsr16v_0d_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0d_ULT_done
.Llsr16v_0d_ULT_true:
    fa_emit_char 'B'
.Llsr16v_0d_ULT_done:
    bruge8 .Llsr16v_0d_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0d_UGE_done
.Llsr16v_0d_UGE_true:
    fa_emit_char 'B'
.Llsr16v_0d_UGE_done:
    brslt8 .Llsr16v_0d_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0d_SLT_done
.Llsr16v_0d_SLT_true:
    fa_emit_char 'B'
.Llsr16v_0d_SLT_done:
    brsge8 .Llsr16v_0d_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0d_SGE_done
.Llsr16v_0d_SGE_true:
    fa_emit_char 'B'
.Llsr16v_0d_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c3, effective count 11, pattern 2.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xfedc
    ldi16 c1, 0x6d35
    ldi16 c2, 0x95ab
    ldi16 c3, 0xa0bb
    lsr16v c0, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_0e_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0e_EQ_done
.Llsr16v_0e_EQ_true:
    fa_emit_char 'B'
.Llsr16v_0e_EQ_done:
    brne8 .Llsr16v_0e_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0e_NE_done
.Llsr16v_0e_NE_true:
    fa_emit_char 'B'
.Llsr16v_0e_NE_done:
    brult8 .Llsr16v_0e_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0e_ULT_done
.Llsr16v_0e_ULT_true:
    fa_emit_char 'B'
.Llsr16v_0e_ULT_done:
    bruge8 .Llsr16v_0e_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0e_UGE_done
.Llsr16v_0e_UGE_true:
    fa_emit_char 'B'
.Llsr16v_0e_UGE_done:
    brslt8 .Llsr16v_0e_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0e_SLT_done
.Llsr16v_0e_SLT_true:
    fa_emit_char 'B'
.Llsr16v_0e_SLT_done:
    brsge8 .Llsr16v_0e_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0e_SGE_done
.Llsr16v_0e_SGE_true:
    fa_emit_char 'B'
.Llsr16v_0e_SGE_done:
    fa_emit_char '\n'

    ; d=c0, count=c3, effective count 15, pattern 3.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x4001
    ldi16 c1, 0x6d6c
    ldi16 c2, 0x95e8
    ldi16 c3, 0xa0af
    lsr16v c0, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_0f_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0f_EQ_done
.Llsr16v_0f_EQ_true:
    fa_emit_char 'B'
.Llsr16v_0f_EQ_done:
    brne8 .Llsr16v_0f_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0f_NE_done
.Llsr16v_0f_NE_true:
    fa_emit_char 'B'
.Llsr16v_0f_NE_done:
    brult8 .Llsr16v_0f_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0f_ULT_done
.Llsr16v_0f_ULT_true:
    fa_emit_char 'B'
.Llsr16v_0f_ULT_done:
    bruge8 .Llsr16v_0f_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0f_UGE_done
.Llsr16v_0f_UGE_true:
    fa_emit_char 'B'
.Llsr16v_0f_UGE_done:
    brslt8 .Llsr16v_0f_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0f_SLT_done
.Llsr16v_0f_SLT_true:
    fa_emit_char 'B'
.Llsr16v_0f_SLT_done:
    brsge8 .Llsr16v_0f_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_0f_SGE_done
.Llsr16v_0f_SGE_true:
    fa_emit_char 'B'
.Llsr16v_0f_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c0, effective count 4, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xa0d4
    ldi16 c1, 0x8000
    ldi16 c2, 0x9625
    ldi16 c3, 0xbea7
    lsr16v c1, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_10_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_10_EQ_done
.Llsr16v_10_EQ_true:
    fa_emit_char 'B'
.Llsr16v_10_EQ_done:
    brne8 .Llsr16v_10_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_10_NE_done
.Llsr16v_10_NE_true:
    fa_emit_char 'B'
.Llsr16v_10_NE_done:
    brult8 .Llsr16v_10_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_10_ULT_done
.Llsr16v_10_ULT_true:
    fa_emit_char 'B'
.Llsr16v_10_ULT_done:
    bruge8 .Llsr16v_10_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_10_UGE_done
.Llsr16v_10_UGE_true:
    fa_emit_char 'B'
.Llsr16v_10_UGE_done:
    brslt8 .Llsr16v_10_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_10_SLT_done
.Llsr16v_10_SLT_true:
    fa_emit_char 'B'
.Llsr16v_10_SLT_done:
    brsge8 .Llsr16v_10_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_10_SGE_done
.Llsr16v_10_SGE_true:
    fa_emit_char 'B'
.Llsr16v_10_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c0, effective count 8, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0xa0c8
    ldi16 c1, 0x5aa5
    ldi16 c2, 0x9662
    ldi16 c3, 0xbeea
    lsr16v c1, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_11_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_11_EQ_done
.Llsr16v_11_EQ_true:
    fa_emit_char 'B'
.Llsr16v_11_EQ_done:
    brne8 .Llsr16v_11_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_11_NE_done
.Llsr16v_11_NE_true:
    fa_emit_char 'B'
.Llsr16v_11_NE_done:
    brult8 .Llsr16v_11_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_11_ULT_done
.Llsr16v_11_ULT_true:
    fa_emit_char 'B'
.Llsr16v_11_ULT_done:
    bruge8 .Llsr16v_11_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_11_UGE_done
.Llsr16v_11_UGE_true:
    fa_emit_char 'B'
.Llsr16v_11_UGE_done:
    brslt8 .Llsr16v_11_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_11_SLT_done
.Llsr16v_11_SLT_true:
    fa_emit_char 'B'
.Llsr16v_11_SLT_done:
    brsge8 .Llsr16v_11_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_11_SGE_done
.Llsr16v_11_SGE_true:
    fa_emit_char 'B'
.Llsr16v_11_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c0, effective count 12, pattern 2.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xa0bc
    ldi16 c1, 0x0100
    ldi16 c2, 0x969f
    ldi16 c3, 0xbf2d
    lsr16v c1, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_12_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_12_EQ_done
.Llsr16v_12_EQ_true:
    fa_emit_char 'B'
.Llsr16v_12_EQ_done:
    brne8 .Llsr16v_12_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_12_NE_done
.Llsr16v_12_NE_true:
    fa_emit_char 'B'
.Llsr16v_12_NE_done:
    brult8 .Llsr16v_12_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_12_ULT_done
.Llsr16v_12_ULT_true:
    fa_emit_char 'B'
.Llsr16v_12_ULT_done:
    bruge8 .Llsr16v_12_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_12_UGE_done
.Llsr16v_12_UGE_true:
    fa_emit_char 'B'
.Llsr16v_12_UGE_done:
    brslt8 .Llsr16v_12_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_12_SLT_done
.Llsr16v_12_SLT_true:
    fa_emit_char 'B'
.Llsr16v_12_SLT_done:
    brsge8 .Llsr16v_12_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_12_SGE_done
.Llsr16v_12_SGE_true:
    fa_emit_char 'B'
.Llsr16v_12_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c0, effective count 0, pattern 3.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xa0a0
    ldi16 c1, 0xc001
    ldi16 c2, 0x96dc
    ldi16 c3, 0xbf70
    lsr16v c1, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_13_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_13_EQ_done
.Llsr16v_13_EQ_true:
    fa_emit_char 'B'
.Llsr16v_13_EQ_done:
    brne8 .Llsr16v_13_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_13_NE_done
.Llsr16v_13_NE_true:
    fa_emit_char 'B'
.Llsr16v_13_NE_done:
    brult8 .Llsr16v_13_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_13_ULT_done
.Llsr16v_13_ULT_true:
    fa_emit_char 'B'
.Llsr16v_13_ULT_done:
    bruge8 .Llsr16v_13_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_13_UGE_done
.Llsr16v_13_UGE_true:
    fa_emit_char 'B'
.Llsr16v_13_UGE_done:
    brslt8 .Llsr16v_13_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_13_SLT_done
.Llsr16v_13_SLT_true:
    fa_emit_char 'B'
.Llsr16v_13_SLT_done:
    brsge8 .Llsr16v_13_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_13_SGE_done
.Llsr16v_13_SGE_true:
    fa_emit_char 'B'
.Llsr16v_13_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c1, effective count 5, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x45e5
    ldi16 c1, 0xf005
    ldi16 c2, 0x9719
    ldi16 c3, 0xbfb3
    lsr16v c1, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_14_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_14_EQ_done
.Llsr16v_14_EQ_true:
    fa_emit_char 'B'
.Llsr16v_14_EQ_done:
    brne8 .Llsr16v_14_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_14_NE_done
.Llsr16v_14_NE_true:
    fa_emit_char 'B'
.Llsr16v_14_NE_done:
    brult8 .Llsr16v_14_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_14_ULT_done
.Llsr16v_14_ULT_true:
    fa_emit_char 'B'
.Llsr16v_14_ULT_done:
    bruge8 .Llsr16v_14_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_14_UGE_done
.Llsr16v_14_UGE_true:
    fa_emit_char 'B'
.Llsr16v_14_UGE_done:
    brslt8 .Llsr16v_14_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_14_SLT_done
.Llsr16v_14_SLT_true:
    fa_emit_char 'B'
.Llsr16v_14_SLT_done:
    brsge8 .Llsr16v_14_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_14_SGE_done
.Llsr16v_14_SGE_true:
    fa_emit_char 'B'
.Llsr16v_14_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c1, effective count 9, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x4616
    ldi16 c1, 0x5aa9
    ldi16 c2, 0x9756
    ldi16 c3, 0xbff6
    lsr16v c1, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_15_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_15_EQ_done
.Llsr16v_15_EQ_true:
    fa_emit_char 'B'
.Llsr16v_15_EQ_done:
    brne8 .Llsr16v_15_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_15_NE_done
.Llsr16v_15_NE_true:
    fa_emit_char 'B'
.Llsr16v_15_NE_done:
    brult8 .Llsr16v_15_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_15_ULT_done
.Llsr16v_15_ULT_true:
    fa_emit_char 'B'
.Llsr16v_15_ULT_done:
    bruge8 .Llsr16v_15_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_15_UGE_done
.Llsr16v_15_UGE_true:
    fa_emit_char 'B'
.Llsr16v_15_UGE_done:
    brslt8 .Llsr16v_15_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_15_SLT_done
.Llsr16v_15_SLT_true:
    fa_emit_char 'B'
.Llsr16v_15_SLT_done:
    brsge8 .Llsr16v_15_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_15_SGE_done
.Llsr16v_15_SGE_true:
    fa_emit_char 'B'
.Llsr16v_15_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c1, effective count 13, pattern 2.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x4647
    ldi16 c1, 0xc3dd
    ldi16 c2, 0x9793
    ldi16 c3, 0xc039
    lsr16v c1, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_16_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_16_EQ_done
.Llsr16v_16_EQ_true:
    fa_emit_char 'B'
.Llsr16v_16_EQ_done:
    brne8 .Llsr16v_16_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_16_NE_done
.Llsr16v_16_NE_true:
    fa_emit_char 'B'
.Llsr16v_16_NE_done:
    brult8 .Llsr16v_16_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_16_ULT_done
.Llsr16v_16_ULT_true:
    fa_emit_char 'B'
.Llsr16v_16_ULT_done:
    bruge8 .Llsr16v_16_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_16_UGE_done
.Llsr16v_16_UGE_true:
    fa_emit_char 'B'
.Llsr16v_16_UGE_done:
    brslt8 .Llsr16v_16_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_16_SLT_done
.Llsr16v_16_SLT_true:
    fa_emit_char 'B'
.Llsr16v_16_SLT_done:
    brsge8 .Llsr16v_16_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_16_SGE_done
.Llsr16v_16_SGE_true:
    fa_emit_char 'B'
.Llsr16v_16_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c1, effective count 1, pattern 3.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x4678
    ldi16 c1, 0x8001
    ldi16 c2, 0x97d0
    ldi16 c3, 0xc07c
    lsr16v c1, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_17_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_17_EQ_done
.Llsr16v_17_EQ_true:
    fa_emit_char 'B'
.Llsr16v_17_EQ_done:
    brne8 .Llsr16v_17_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_17_NE_done
.Llsr16v_17_NE_true:
    fa_emit_char 'B'
.Llsr16v_17_NE_done:
    brult8 .Llsr16v_17_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_17_ULT_done
.Llsr16v_17_ULT_true:
    fa_emit_char 'B'
.Llsr16v_17_ULT_done:
    bruge8 .Llsr16v_17_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_17_UGE_done
.Llsr16v_17_UGE_true:
    fa_emit_char 'B'
.Llsr16v_17_UGE_done:
    brslt8 .Llsr16v_17_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_17_SLT_done
.Llsr16v_17_SLT_true:
    fa_emit_char 'B'
.Llsr16v_17_SLT_done:
    brsge8 .Llsr16v_17_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_17_SGE_done
.Llsr16v_17_SGE_true:
    fa_emit_char 'B'
.Llsr16v_17_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c2, effective count 6, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x46a9
    ldi16 c1, 0xa55a
    ldi16 c2, 0xa0d6
    ldi16 c3, 0xc0bf
    lsr16v c1, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_18_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_18_EQ_done
.Llsr16v_18_EQ_true:
    fa_emit_char 'B'
.Llsr16v_18_EQ_done:
    brne8 .Llsr16v_18_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_18_NE_done
.Llsr16v_18_NE_true:
    fa_emit_char 'B'
.Llsr16v_18_NE_done:
    brult8 .Llsr16v_18_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_18_ULT_done
.Llsr16v_18_ULT_true:
    fa_emit_char 'B'
.Llsr16v_18_ULT_done:
    bruge8 .Llsr16v_18_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_18_UGE_done
.Llsr16v_18_UGE_true:
    fa_emit_char 'B'
.Llsr16v_18_UGE_done:
    brslt8 .Llsr16v_18_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_18_SLT_done
.Llsr16v_18_SLT_true:
    fa_emit_char 'B'
.Llsr16v_18_SLT_done:
    brsge8 .Llsr16v_18_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_18_SGE_done
.Llsr16v_18_SGE_true:
    fa_emit_char 'B'
.Llsr16v_18_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c2, effective count 10, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x46da
    ldi16 c1, 0xfedc
    ldi16 c2, 0xa0ca
    ldi16 c3, 0xc102
    lsr16v c1, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_19_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_19_EQ_done
.Llsr16v_19_EQ_true:
    fa_emit_char 'B'
.Llsr16v_19_EQ_done:
    brne8 .Llsr16v_19_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_19_NE_done
.Llsr16v_19_NE_true:
    fa_emit_char 'B'
.Llsr16v_19_NE_done:
    brult8 .Llsr16v_19_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_19_ULT_done
.Llsr16v_19_ULT_true:
    fa_emit_char 'B'
.Llsr16v_19_ULT_done:
    bruge8 .Llsr16v_19_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_19_UGE_done
.Llsr16v_19_UGE_true:
    fa_emit_char 'B'
.Llsr16v_19_UGE_done:
    brslt8 .Llsr16v_19_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_19_SLT_done
.Llsr16v_19_SLT_true:
    fa_emit_char 'B'
.Llsr16v_19_SLT_done:
    brsge8 .Llsr16v_19_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_19_SGE_done
.Llsr16v_19_SGE_true:
    fa_emit_char 'B'
.Llsr16v_19_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c2, effective count 14, pattern 2.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x470b
    ldi16 c1, 0x4001
    ldi16 c2, 0xa0be
    ldi16 c3, 0xc145
    lsr16v c1, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_1a_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1a_EQ_done
.Llsr16v_1a_EQ_true:
    fa_emit_char 'B'
.Llsr16v_1a_EQ_done:
    brne8 .Llsr16v_1a_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1a_NE_done
.Llsr16v_1a_NE_true:
    fa_emit_char 'B'
.Llsr16v_1a_NE_done:
    brult8 .Llsr16v_1a_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1a_ULT_done
.Llsr16v_1a_ULT_true:
    fa_emit_char 'B'
.Llsr16v_1a_ULT_done:
    bruge8 .Llsr16v_1a_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1a_UGE_done
.Llsr16v_1a_UGE_true:
    fa_emit_char 'B'
.Llsr16v_1a_UGE_done:
    brslt8 .Llsr16v_1a_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1a_SLT_done
.Llsr16v_1a_SLT_true:
    fa_emit_char 'B'
.Llsr16v_1a_SLT_done:
    brsge8 .Llsr16v_1a_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1a_SGE_done
.Llsr16v_1a_SGE_true:
    fa_emit_char 'B'
.Llsr16v_1a_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c2, effective count 2, pattern 3.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x473c
    ldi16 c1, 0x7f01
    ldi16 c2, 0xa0a2
    ldi16 c3, 0xc188
    lsr16v c1, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_1b_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1b_EQ_done
.Llsr16v_1b_EQ_true:
    fa_emit_char 'B'
.Llsr16v_1b_EQ_done:
    brne8 .Llsr16v_1b_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1b_NE_done
.Llsr16v_1b_NE_true:
    fa_emit_char 'B'
.Llsr16v_1b_NE_done:
    brult8 .Llsr16v_1b_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1b_ULT_done
.Llsr16v_1b_ULT_true:
    fa_emit_char 'B'
.Llsr16v_1b_ULT_done:
    bruge8 .Llsr16v_1b_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1b_UGE_done
.Llsr16v_1b_UGE_true:
    fa_emit_char 'B'
.Llsr16v_1b_UGE_done:
    brslt8 .Llsr16v_1b_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1b_SLT_done
.Llsr16v_1b_SLT_true:
    fa_emit_char 'B'
.Llsr16v_1b_SLT_done:
    brsge8 .Llsr16v_1b_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1b_SGE_done
.Llsr16v_1b_SGE_true:
    fa_emit_char 'B'
.Llsr16v_1b_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c3, effective count 7, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x476d
    ldi16 c1, 0x5aa5
    ldi16 c2, 0x9901
    ldi16 c3, 0xa0d7
    lsr16v c1, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_1c_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1c_EQ_done
.Llsr16v_1c_EQ_true:
    fa_emit_char 'B'
.Llsr16v_1c_EQ_done:
    brne8 .Llsr16v_1c_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1c_NE_done
.Llsr16v_1c_NE_true:
    fa_emit_char 'B'
.Llsr16v_1c_NE_done:
    brult8 .Llsr16v_1c_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1c_ULT_done
.Llsr16v_1c_ULT_true:
    fa_emit_char 'B'
.Llsr16v_1c_ULT_done:
    bruge8 .Llsr16v_1c_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1c_UGE_done
.Llsr16v_1c_UGE_true:
    fa_emit_char 'B'
.Llsr16v_1c_UGE_done:
    brslt8 .Llsr16v_1c_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1c_SLT_done
.Llsr16v_1c_SLT_true:
    fa_emit_char 'B'
.Llsr16v_1c_SLT_done:
    brsge8 .Llsr16v_1c_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1c_SGE_done
.Llsr16v_1c_SGE_true:
    fa_emit_char 'B'
.Llsr16v_1c_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c3, effective count 11, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x479e
    ldi16 c1, 0x0100
    ldi16 c2, 0x993e
    ldi16 c3, 0xa0cb
    lsr16v c1, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_1d_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1d_EQ_done
.Llsr16v_1d_EQ_true:
    fa_emit_char 'B'
.Llsr16v_1d_EQ_done:
    brne8 .Llsr16v_1d_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1d_NE_done
.Llsr16v_1d_NE_true:
    fa_emit_char 'B'
.Llsr16v_1d_NE_done:
    brult8 .Llsr16v_1d_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1d_ULT_done
.Llsr16v_1d_ULT_true:
    fa_emit_char 'B'
.Llsr16v_1d_ULT_done:
    bruge8 .Llsr16v_1d_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1d_UGE_done
.Llsr16v_1d_UGE_true:
    fa_emit_char 'B'
.Llsr16v_1d_UGE_done:
    brslt8 .Llsr16v_1d_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1d_SLT_done
.Llsr16v_1d_SLT_true:
    fa_emit_char 'B'
.Llsr16v_1d_SLT_done:
    brsge8 .Llsr16v_1d_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1d_SGE_done
.Llsr16v_1d_SGE_true:
    fa_emit_char 'B'
.Llsr16v_1d_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c3, effective count 15, pattern 2.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x47cf
    ldi16 c1, 0xc001
    ldi16 c2, 0x997b
    ldi16 c3, 0xa0bf
    lsr16v c1, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_1e_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1e_EQ_done
.Llsr16v_1e_EQ_true:
    fa_emit_char 'B'
.Llsr16v_1e_EQ_done:
    brne8 .Llsr16v_1e_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1e_NE_done
.Llsr16v_1e_NE_true:
    fa_emit_char 'B'
.Llsr16v_1e_NE_done:
    brult8 .Llsr16v_1e_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1e_ULT_done
.Llsr16v_1e_ULT_true:
    fa_emit_char 'B'
.Llsr16v_1e_ULT_done:
    bruge8 .Llsr16v_1e_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1e_UGE_done
.Llsr16v_1e_UGE_true:
    fa_emit_char 'B'
.Llsr16v_1e_UGE_done:
    brslt8 .Llsr16v_1e_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1e_SLT_done
.Llsr16v_1e_SLT_true:
    fa_emit_char 'B'
.Llsr16v_1e_SLT_done:
    brsge8 .Llsr16v_1e_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1e_SGE_done
.Llsr16v_1e_SGE_true:
    fa_emit_char 'B'
.Llsr16v_1e_SGE_done:
    fa_emit_char '\n'

    ; d=c1, count=c3, effective count 3, pattern 3.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x4800
    ldi16 c1, 0x0000
    ldi16 c2, 0x99b8
    ldi16 c3, 0xa0a3
    lsr16v c1, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_1f_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1f_EQ_done
.Llsr16v_1f_EQ_true:
    fa_emit_char 'B'
.Llsr16v_1f_EQ_done:
    brne8 .Llsr16v_1f_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1f_NE_done
.Llsr16v_1f_NE_true:
    fa_emit_char 'B'
.Llsr16v_1f_NE_done:
    brult8 .Llsr16v_1f_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1f_ULT_done
.Llsr16v_1f_ULT_true:
    fa_emit_char 'B'
.Llsr16v_1f_ULT_done:
    bruge8 .Llsr16v_1f_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1f_UGE_done
.Llsr16v_1f_UGE_true:
    fa_emit_char 'B'
.Llsr16v_1f_UGE_done:
    brslt8 .Llsr16v_1f_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1f_SLT_done
.Llsr16v_1f_SLT_true:
    fa_emit_char 'B'
.Llsr16v_1f_SLT_done:
    brsge8 .Llsr16v_1f_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_1f_SGE_done
.Llsr16v_1f_SGE_true:
    fa_emit_char 'B'
.Llsr16v_1f_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c0, effective count 8, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0xa0d8
    ldi16 c1, 0x7113
    ldi16 c2, 0x1234
    ldi16 c3, 0xc2d7
    lsr16v c2, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_20_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_20_EQ_done
.Llsr16v_20_EQ_true:
    fa_emit_char 'B'
.Llsr16v_20_EQ_done:
    brne8 .Llsr16v_20_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_20_NE_done
.Llsr16v_20_NE_true:
    fa_emit_char 'B'
.Llsr16v_20_NE_done:
    brult8 .Llsr16v_20_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_20_ULT_done
.Llsr16v_20_ULT_true:
    fa_emit_char 'B'
.Llsr16v_20_ULT_done:
    bruge8 .Llsr16v_20_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_20_UGE_done
.Llsr16v_20_UGE_true:
    fa_emit_char 'B'
.Llsr16v_20_UGE_done:
    brslt8 .Llsr16v_20_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_20_SLT_done
.Llsr16v_20_SLT_true:
    fa_emit_char 'B'
.Llsr16v_20_SLT_done:
    brsge8 .Llsr16v_20_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_20_SGE_done
.Llsr16v_20_SGE_true:
    fa_emit_char 'B'
.Llsr16v_20_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c0, effective count 12, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xa0cc
    ldi16 c1, 0x714a
    ldi16 c2, 0x00ff
    ldi16 c3, 0xc31a
    lsr16v c2, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_21_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_21_EQ_done
.Llsr16v_21_EQ_true:
    fa_emit_char 'B'
.Llsr16v_21_EQ_done:
    brne8 .Llsr16v_21_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_21_NE_done
.Llsr16v_21_NE_true:
    fa_emit_char 'B'
.Llsr16v_21_NE_done:
    brult8 .Llsr16v_21_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_21_ULT_done
.Llsr16v_21_ULT_true:
    fa_emit_char 'B'
.Llsr16v_21_ULT_done:
    bruge8 .Llsr16v_21_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_21_UGE_done
.Llsr16v_21_UGE_true:
    fa_emit_char 'B'
.Llsr16v_21_UGE_done:
    brslt8 .Llsr16v_21_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_21_SLT_done
.Llsr16v_21_SLT_true:
    fa_emit_char 'B'
.Llsr16v_21_SLT_done:
    brsge8 .Llsr16v_21_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_21_SGE_done
.Llsr16v_21_SGE_true:
    fa_emit_char 'B'
.Llsr16v_21_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c0, effective count 0, pattern 2.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xa0b0
    ldi16 c1, 0x7181
    ldi16 c2, 0x8080
    ldi16 c3, 0xc35d
    lsr16v c2, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_22_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_22_EQ_done
.Llsr16v_22_EQ_true:
    fa_emit_char 'B'
.Llsr16v_22_EQ_done:
    brne8 .Llsr16v_22_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_22_NE_done
.Llsr16v_22_NE_true:
    fa_emit_char 'B'
.Llsr16v_22_NE_done:
    brult8 .Llsr16v_22_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_22_ULT_done
.Llsr16v_22_ULT_true:
    fa_emit_char 'B'
.Llsr16v_22_ULT_done:
    bruge8 .Llsr16v_22_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_22_UGE_done
.Llsr16v_22_UGE_true:
    fa_emit_char 'B'
.Llsr16v_22_UGE_done:
    brslt8 .Llsr16v_22_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_22_SLT_done
.Llsr16v_22_SLT_true:
    fa_emit_char 'B'
.Llsr16v_22_SLT_done:
    brsge8 .Llsr16v_22_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_22_SGE_done
.Llsr16v_22_SGE_true:
    fa_emit_char 'B'
.Llsr16v_22_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c0, effective count 4, pattern 3.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xa0a4
    ldi16 c1, 0x71b8
    ldi16 c2, 0x0001
    ldi16 c3, 0xc3a0
    lsr16v c2, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_23_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_23_EQ_done
.Llsr16v_23_EQ_true:
    fa_emit_char 'B'
.Llsr16v_23_EQ_done:
    brne8 .Llsr16v_23_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_23_NE_done
.Llsr16v_23_NE_true:
    fa_emit_char 'B'
.Llsr16v_23_NE_done:
    brult8 .Llsr16v_23_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_23_ULT_done
.Llsr16v_23_ULT_true:
    fa_emit_char 'B'
.Llsr16v_23_ULT_done:
    bruge8 .Llsr16v_23_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_23_UGE_done
.Llsr16v_23_UGE_true:
    fa_emit_char 'B'
.Llsr16v_23_UGE_done:
    brslt8 .Llsr16v_23_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_23_SLT_done
.Llsr16v_23_SLT_true:
    fa_emit_char 'B'
.Llsr16v_23_SLT_done:
    brsge8 .Llsr16v_23_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_23_SGE_done
.Llsr16v_23_SGE_true:
    fa_emit_char 'B'
.Llsr16v_23_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c1, effective count 9, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x48f5
    ldi16 c1, 0xa0d9
    ldi16 c2, 0xfedc
    ldi16 c3, 0xc3e3
    lsr16v c2, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_24_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_24_EQ_done
.Llsr16v_24_EQ_true:
    fa_emit_char 'B'
.Llsr16v_24_EQ_done:
    brne8 .Llsr16v_24_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_24_NE_done
.Llsr16v_24_NE_true:
    fa_emit_char 'B'
.Llsr16v_24_NE_done:
    brult8 .Llsr16v_24_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_24_ULT_done
.Llsr16v_24_ULT_true:
    fa_emit_char 'B'
.Llsr16v_24_ULT_done:
    bruge8 .Llsr16v_24_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_24_UGE_done
.Llsr16v_24_UGE_true:
    fa_emit_char 'B'
.Llsr16v_24_UGE_done:
    brslt8 .Llsr16v_24_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_24_SLT_done
.Llsr16v_24_SLT_true:
    fa_emit_char 'B'
.Llsr16v_24_SLT_done:
    brsge8 .Llsr16v_24_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_24_SGE_done
.Llsr16v_24_SGE_true:
    fa_emit_char 'B'
.Llsr16v_24_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c1, effective count 13, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x4926
    ldi16 c1, 0xa0cd
    ldi16 c2, 0x4001
    ldi16 c3, 0xc426
    lsr16v c2, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_25_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_25_EQ_done
.Llsr16v_25_EQ_true:
    fa_emit_char 'B'
.Llsr16v_25_EQ_done:
    brne8 .Llsr16v_25_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_25_NE_done
.Llsr16v_25_NE_true:
    fa_emit_char 'B'
.Llsr16v_25_NE_done:
    brult8 .Llsr16v_25_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_25_ULT_done
.Llsr16v_25_ULT_true:
    fa_emit_char 'B'
.Llsr16v_25_ULT_done:
    bruge8 .Llsr16v_25_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_25_UGE_done
.Llsr16v_25_UGE_true:
    fa_emit_char 'B'
.Llsr16v_25_UGE_done:
    brslt8 .Llsr16v_25_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_25_SLT_done
.Llsr16v_25_SLT_true:
    fa_emit_char 'B'
.Llsr16v_25_SLT_done:
    brsge8 .Llsr16v_25_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_25_SGE_done
.Llsr16v_25_SGE_true:
    fa_emit_char 'B'
.Llsr16v_25_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c1, effective count 1, pattern 2.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x4957
    ldi16 c1, 0xa0b1
    ldi16 c2, 0x7f01
    ldi16 c3, 0xc469
    lsr16v c2, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_26_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_26_EQ_done
.Llsr16v_26_EQ_true:
    fa_emit_char 'B'
.Llsr16v_26_EQ_done:
    brne8 .Llsr16v_26_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_26_NE_done
.Llsr16v_26_NE_true:
    fa_emit_char 'B'
.Llsr16v_26_NE_done:
    brult8 .Llsr16v_26_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_26_ULT_done
.Llsr16v_26_ULT_true:
    fa_emit_char 'B'
.Llsr16v_26_ULT_done:
    bruge8 .Llsr16v_26_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_26_UGE_done
.Llsr16v_26_UGE_true:
    fa_emit_char 'B'
.Llsr16v_26_UGE_done:
    brslt8 .Llsr16v_26_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_26_SLT_done
.Llsr16v_26_SLT_true:
    fa_emit_char 'B'
.Llsr16v_26_SLT_done:
    brsge8 .Llsr16v_26_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_26_SGE_done
.Llsr16v_26_SGE_true:
    fa_emit_char 'B'
.Llsr16v_26_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c1, effective count 5, pattern 3.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x4988
    ldi16 c1, 0xa0a5
    ldi16 c2, 0x8001
    ldi16 c3, 0xc4ac
    lsr16v c2, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_27_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_27_EQ_done
.Llsr16v_27_EQ_true:
    fa_emit_char 'B'
.Llsr16v_27_EQ_done:
    brne8 .Llsr16v_27_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_27_NE_done
.Llsr16v_27_NE_true:
    fa_emit_char 'B'
.Llsr16v_27_NE_done:
    brult8 .Llsr16v_27_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_27_ULT_done
.Llsr16v_27_ULT_true:
    fa_emit_char 'B'
.Llsr16v_27_ULT_done:
    bruge8 .Llsr16v_27_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_27_UGE_done
.Llsr16v_27_UGE_true:
    fa_emit_char 'B'
.Llsr16v_27_UGE_done:
    brslt8 .Llsr16v_27_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_27_SLT_done
.Llsr16v_27_SLT_true:
    fa_emit_char 'B'
.Llsr16v_27_SLT_done:
    brsge8 .Llsr16v_27_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_27_SGE_done
.Llsr16v_27_SGE_true:
    fa_emit_char 'B'
.Llsr16v_27_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c2, effective count 10, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x49b9
    ldi16 c1, 0x72cb
    ldi16 c2, 0x5aaa
    ldi16 c3, 0xc4ef
    lsr16v c2, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_28_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_28_EQ_done
.Llsr16v_28_EQ_true:
    fa_emit_char 'B'
.Llsr16v_28_EQ_done:
    brne8 .Llsr16v_28_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_28_NE_done
.Llsr16v_28_NE_true:
    fa_emit_char 'B'
.Llsr16v_28_NE_done:
    brult8 .Llsr16v_28_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_28_ULT_done
.Llsr16v_28_ULT_true:
    fa_emit_char 'B'
.Llsr16v_28_ULT_done:
    bruge8 .Llsr16v_28_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_28_UGE_done
.Llsr16v_28_UGE_true:
    fa_emit_char 'B'
.Llsr16v_28_UGE_done:
    brslt8 .Llsr16v_28_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_28_SLT_done
.Llsr16v_28_SLT_true:
    fa_emit_char 'B'
.Llsr16v_28_SLT_done:
    brsge8 .Llsr16v_28_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_28_SGE_done
.Llsr16v_28_SGE_true:
    fa_emit_char 'B'
.Llsr16v_28_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c2, effective count 14, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x49ea
    ldi16 c1, 0x7302
    ldi16 c2, 0xc3de
    ldi16 c3, 0xc532
    lsr16v c2, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_29_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_29_EQ_done
.Llsr16v_29_EQ_true:
    fa_emit_char 'B'
.Llsr16v_29_EQ_done:
    brne8 .Llsr16v_29_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_29_NE_done
.Llsr16v_29_NE_true:
    fa_emit_char 'B'
.Llsr16v_29_NE_done:
    brult8 .Llsr16v_29_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_29_ULT_done
.Llsr16v_29_ULT_true:
    fa_emit_char 'B'
.Llsr16v_29_ULT_done:
    bruge8 .Llsr16v_29_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_29_UGE_done
.Llsr16v_29_UGE_true:
    fa_emit_char 'B'
.Llsr16v_29_UGE_done:
    brslt8 .Llsr16v_29_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_29_SLT_done
.Llsr16v_29_SLT_true:
    fa_emit_char 'B'
.Llsr16v_29_SLT_done:
    brsge8 .Llsr16v_29_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_29_SGE_done
.Llsr16v_29_SGE_true:
    fa_emit_char 'B'
.Llsr16v_29_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c2, effective count 2, pattern 2.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x4a1b
    ldi16 c1, 0x7339
    ldi16 c2, 0x8002
    ldi16 c3, 0xc575
    lsr16v c2, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_2a_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2a_EQ_done
.Llsr16v_2a_EQ_true:
    fa_emit_char 'B'
.Llsr16v_2a_EQ_done:
    brne8 .Llsr16v_2a_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2a_NE_done
.Llsr16v_2a_NE_true:
    fa_emit_char 'B'
.Llsr16v_2a_NE_done:
    brult8 .Llsr16v_2a_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2a_ULT_done
.Llsr16v_2a_ULT_true:
    fa_emit_char 'B'
.Llsr16v_2a_ULT_done:
    bruge8 .Llsr16v_2a_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2a_UGE_done
.Llsr16v_2a_UGE_true:
    fa_emit_char 'B'
.Llsr16v_2a_UGE_done:
    brslt8 .Llsr16v_2a_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2a_SLT_done
.Llsr16v_2a_SLT_true:
    fa_emit_char 'B'
.Llsr16v_2a_SLT_done:
    brsge8 .Llsr16v_2a_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2a_SGE_done
.Llsr16v_2a_SGE_true:
    fa_emit_char 'B'
.Llsr16v_2a_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c2, effective count 6, pattern 3.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x4a4c
    ldi16 c1, 0x7370
    ldi16 c2, 0xf006
    ldi16 c3, 0xc5b8
    lsr16v c2, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_2b_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2b_EQ_done
.Llsr16v_2b_EQ_true:
    fa_emit_char 'B'
.Llsr16v_2b_EQ_done:
    brne8 .Llsr16v_2b_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2b_NE_done
.Llsr16v_2b_NE_true:
    fa_emit_char 'B'
.Llsr16v_2b_NE_done:
    brult8 .Llsr16v_2b_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2b_ULT_done
.Llsr16v_2b_ULT_true:
    fa_emit_char 'B'
.Llsr16v_2b_ULT_done:
    bruge8 .Llsr16v_2b_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2b_UGE_done
.Llsr16v_2b_UGE_true:
    fa_emit_char 'B'
.Llsr16v_2b_UGE_done:
    brslt8 .Llsr16v_2b_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2b_SLT_done
.Llsr16v_2b_SLT_true:
    fa_emit_char 'B'
.Llsr16v_2b_SLT_done:
    brsge8 .Llsr16v_2b_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2b_SGE_done
.Llsr16v_2b_SGE_true:
    fa_emit_char 'B'
.Llsr16v_2b_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c3, effective count 11, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x4a7d
    ldi16 c1, 0x73a7
    ldi16 c2, 0x00ff
    ldi16 c3, 0xa0db
    lsr16v c2, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_2c_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2c_EQ_done
.Llsr16v_2c_EQ_true:
    fa_emit_char 'B'
.Llsr16v_2c_EQ_done:
    brne8 .Llsr16v_2c_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2c_NE_done
.Llsr16v_2c_NE_true:
    fa_emit_char 'B'
.Llsr16v_2c_NE_done:
    brult8 .Llsr16v_2c_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2c_ULT_done
.Llsr16v_2c_ULT_true:
    fa_emit_char 'B'
.Llsr16v_2c_ULT_done:
    bruge8 .Llsr16v_2c_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2c_UGE_done
.Llsr16v_2c_UGE_true:
    fa_emit_char 'B'
.Llsr16v_2c_UGE_done:
    brslt8 .Llsr16v_2c_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2c_SLT_done
.Llsr16v_2c_SLT_true:
    fa_emit_char 'B'
.Llsr16v_2c_SLT_done:
    brsge8 .Llsr16v_2c_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2c_SGE_done
.Llsr16v_2c_SGE_true:
    fa_emit_char 'B'
.Llsr16v_2c_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c3, effective count 15, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x4aae
    ldi16 c1, 0x73de
    ldi16 c2, 0x8080
    ldi16 c3, 0xa0cf
    lsr16v c2, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_2d_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2d_EQ_done
.Llsr16v_2d_EQ_true:
    fa_emit_char 'B'
.Llsr16v_2d_EQ_done:
    brne8 .Llsr16v_2d_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2d_NE_done
.Llsr16v_2d_NE_true:
    fa_emit_char 'B'
.Llsr16v_2d_NE_done:
    brult8 .Llsr16v_2d_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2d_ULT_done
.Llsr16v_2d_ULT_true:
    fa_emit_char 'B'
.Llsr16v_2d_ULT_done:
    bruge8 .Llsr16v_2d_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2d_UGE_done
.Llsr16v_2d_UGE_true:
    fa_emit_char 'B'
.Llsr16v_2d_UGE_done:
    brslt8 .Llsr16v_2d_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2d_SLT_done
.Llsr16v_2d_SLT_true:
    fa_emit_char 'B'
.Llsr16v_2d_SLT_done:
    brsge8 .Llsr16v_2d_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2d_SGE_done
.Llsr16v_2d_SGE_true:
    fa_emit_char 'B'
.Llsr16v_2d_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c3, effective count 3, pattern 2.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x4adf
    ldi16 c1, 0x7415
    ldi16 c2, 0x0001
    ldi16 c3, 0xa0b3
    lsr16v c2, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_2e_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2e_EQ_done
.Llsr16v_2e_EQ_true:
    fa_emit_char 'B'
.Llsr16v_2e_EQ_done:
    brne8 .Llsr16v_2e_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2e_NE_done
.Llsr16v_2e_NE_true:
    fa_emit_char 'B'
.Llsr16v_2e_NE_done:
    brult8 .Llsr16v_2e_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2e_ULT_done
.Llsr16v_2e_ULT_true:
    fa_emit_char 'B'
.Llsr16v_2e_ULT_done:
    bruge8 .Llsr16v_2e_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2e_UGE_done
.Llsr16v_2e_UGE_true:
    fa_emit_char 'B'
.Llsr16v_2e_UGE_done:
    brslt8 .Llsr16v_2e_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2e_SLT_done
.Llsr16v_2e_SLT_true:
    fa_emit_char 'B'
.Llsr16v_2e_SLT_done:
    brsge8 .Llsr16v_2e_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2e_SGE_done
.Llsr16v_2e_SGE_true:
    fa_emit_char 'B'
.Llsr16v_2e_SGE_done:
    fa_emit_char '\n'

    ; d=c2, count=c3, effective count 7, pattern 3.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x4b10
    ldi16 c1, 0x744c
    ldi16 c2, 0x8000
    ldi16 c3, 0xa0a7
    lsr16v c2, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_2f_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2f_EQ_done
.Llsr16v_2f_EQ_true:
    fa_emit_char 'B'
.Llsr16v_2f_EQ_done:
    brne8 .Llsr16v_2f_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2f_NE_done
.Llsr16v_2f_NE_true:
    fa_emit_char 'B'
.Llsr16v_2f_NE_done:
    brult8 .Llsr16v_2f_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2f_ULT_done
.Llsr16v_2f_ULT_true:
    fa_emit_char 'B'
.Llsr16v_2f_ULT_done:
    bruge8 .Llsr16v_2f_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2f_UGE_done
.Llsr16v_2f_UGE_true:
    fa_emit_char 'B'
.Llsr16v_2f_UGE_done:
    brslt8 .Llsr16v_2f_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2f_SLT_done
.Llsr16v_2f_SLT_true:
    fa_emit_char 'B'
.Llsr16v_2f_SLT_done:
    brsge8 .Llsr16v_2f_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_2f_SGE_done
.Llsr16v_2f_SGE_true:
    fa_emit_char 'B'
.Llsr16v_2f_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c0, effective count 12, pattern 0.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xa0dc
    ldi16 c1, 0x7483
    ldi16 c2, 0x9dc5
    ldi16 c3, 0x4001
    lsr16v c3, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_30_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_30_EQ_done
.Llsr16v_30_EQ_true:
    fa_emit_char 'B'
.Llsr16v_30_EQ_done:
    brne8 .Llsr16v_30_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_30_NE_done
.Llsr16v_30_NE_true:
    fa_emit_char 'B'
.Llsr16v_30_NE_done:
    brult8 .Llsr16v_30_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_30_ULT_done
.Llsr16v_30_ULT_true:
    fa_emit_char 'B'
.Llsr16v_30_ULT_done:
    bruge8 .Llsr16v_30_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_30_UGE_done
.Llsr16v_30_UGE_true:
    fa_emit_char 'B'
.Llsr16v_30_UGE_done:
    brslt8 .Llsr16v_30_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_30_SLT_done
.Llsr16v_30_SLT_true:
    fa_emit_char 'B'
.Llsr16v_30_SLT_done:
    brsge8 .Llsr16v_30_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_30_SGE_done
.Llsr16v_30_SGE_true:
    fa_emit_char 'B'
.Llsr16v_30_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c0, effective count 0, pattern 1.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xa0c0
    ldi16 c1, 0x74ba
    ldi16 c2, 0x9e02
    ldi16 c3, 0x7f01
    lsr16v c3, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_31_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_31_EQ_done
.Llsr16v_31_EQ_true:
    fa_emit_char 'B'
.Llsr16v_31_EQ_done:
    brne8 .Llsr16v_31_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_31_NE_done
.Llsr16v_31_NE_true:
    fa_emit_char 'B'
.Llsr16v_31_NE_done:
    brult8 .Llsr16v_31_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_31_ULT_done
.Llsr16v_31_ULT_true:
    fa_emit_char 'B'
.Llsr16v_31_ULT_done:
    bruge8 .Llsr16v_31_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_31_UGE_done
.Llsr16v_31_UGE_true:
    fa_emit_char 'B'
.Llsr16v_31_UGE_done:
    brslt8 .Llsr16v_31_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_31_SLT_done
.Llsr16v_31_SLT_true:
    fa_emit_char 'B'
.Llsr16v_31_SLT_done:
    brsge8 .Llsr16v_31_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_31_SGE_done
.Llsr16v_31_SGE_true:
    fa_emit_char 'B'
.Llsr16v_31_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c0, effective count 4, pattern 2.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xa0b4
    ldi16 c1, 0x74f1
    ldi16 c2, 0x9e3f
    ldi16 c3, 0x8001
    lsr16v c3, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_32_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_32_EQ_done
.Llsr16v_32_EQ_true:
    fa_emit_char 'B'
.Llsr16v_32_EQ_done:
    brne8 .Llsr16v_32_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_32_NE_done
.Llsr16v_32_NE_true:
    fa_emit_char 'B'
.Llsr16v_32_NE_done:
    brult8 .Llsr16v_32_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_32_ULT_done
.Llsr16v_32_ULT_true:
    fa_emit_char 'B'
.Llsr16v_32_ULT_done:
    bruge8 .Llsr16v_32_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_32_UGE_done
.Llsr16v_32_UGE_true:
    fa_emit_char 'B'
.Llsr16v_32_UGE_done:
    brslt8 .Llsr16v_32_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_32_SLT_done
.Llsr16v_32_SLT_true:
    fa_emit_char 'B'
.Llsr16v_32_SLT_done:
    brsge8 .Llsr16v_32_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_32_SGE_done
.Llsr16v_32_SGE_true:
    fa_emit_char 'B'
.Llsr16v_32_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c0, effective count 8, pattern 3.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0xa0a8
    ldi16 c1, 0x7528
    ldi16 c2, 0x9e7c
    ldi16 c3, 0xffff
    lsr16v c3, c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_33_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_33_EQ_done
.Llsr16v_33_EQ_true:
    fa_emit_char 'B'
.Llsr16v_33_EQ_done:
    brne8 .Llsr16v_33_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_33_NE_done
.Llsr16v_33_NE_true:
    fa_emit_char 'B'
.Llsr16v_33_NE_done:
    brult8 .Llsr16v_33_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_33_ULT_done
.Llsr16v_33_ULT_true:
    fa_emit_char 'B'
.Llsr16v_33_ULT_done:
    bruge8 .Llsr16v_33_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_33_UGE_done
.Llsr16v_33_UGE_true:
    fa_emit_char 'B'
.Llsr16v_33_UGE_done:
    brslt8 .Llsr16v_33_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_33_SLT_done
.Llsr16v_33_SLT_true:
    fa_emit_char 'B'
.Llsr16v_33_SLT_done:
    brsge8 .Llsr16v_33_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_33_SGE_done
.Llsr16v_33_SGE_true:
    fa_emit_char 'B'
.Llsr16v_33_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c1, effective count 13, pattern 0.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x4c05
    ldi16 c1, 0xa0dd
    ldi16 c2, 0x9eb9
    ldi16 c3, 0xc001
    lsr16v c3, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_34_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_34_EQ_done
.Llsr16v_34_EQ_true:
    fa_emit_char 'B'
.Llsr16v_34_EQ_done:
    brne8 .Llsr16v_34_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_34_NE_done
.Llsr16v_34_NE_true:
    fa_emit_char 'B'
.Llsr16v_34_NE_done:
    brult8 .Llsr16v_34_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_34_ULT_done
.Llsr16v_34_ULT_true:
    fa_emit_char 'B'
.Llsr16v_34_ULT_done:
    bruge8 .Llsr16v_34_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_34_UGE_done
.Llsr16v_34_UGE_true:
    fa_emit_char 'B'
.Llsr16v_34_UGE_done:
    brslt8 .Llsr16v_34_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_34_SLT_done
.Llsr16v_34_SLT_true:
    fa_emit_char 'B'
.Llsr16v_34_SLT_done:
    brsge8 .Llsr16v_34_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_34_SGE_done
.Llsr16v_34_SGE_true:
    fa_emit_char 'B'
.Llsr16v_34_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c1, effective count 1, pattern 1.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x4c36
    ldi16 c1, 0xa0c1
    ldi16 c2, 0x9ef6
    ldi16 c3, 0x0000
    lsr16v c3, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_35_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_35_EQ_done
.Llsr16v_35_EQ_true:
    fa_emit_char 'B'
.Llsr16v_35_EQ_done:
    brne8 .Llsr16v_35_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_35_NE_done
.Llsr16v_35_NE_true:
    fa_emit_char 'B'
.Llsr16v_35_NE_done:
    brult8 .Llsr16v_35_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_35_ULT_done
.Llsr16v_35_ULT_true:
    fa_emit_char 'B'
.Llsr16v_35_ULT_done:
    bruge8 .Llsr16v_35_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_35_UGE_done
.Llsr16v_35_UGE_true:
    fa_emit_char 'B'
.Llsr16v_35_UGE_done:
    brslt8 .Llsr16v_35_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_35_SLT_done
.Llsr16v_35_SLT_true:
    fa_emit_char 'B'
.Llsr16v_35_SLT_done:
    brsge8 .Llsr16v_35_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_35_SGE_done
.Llsr16v_35_SGE_true:
    fa_emit_char 'B'
.Llsr16v_35_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c1, effective count 5, pattern 2.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x4c67
    ldi16 c1, 0xa0b5
    ldi16 c2, 0x9f33
    ldi16 c3, 0x7fff
    lsr16v c3, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_36_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_36_EQ_done
.Llsr16v_36_EQ_true:
    fa_emit_char 'B'
.Llsr16v_36_EQ_done:
    brne8 .Llsr16v_36_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_36_NE_done
.Llsr16v_36_NE_true:
    fa_emit_char 'B'
.Llsr16v_36_NE_done:
    brult8 .Llsr16v_36_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_36_ULT_done
.Llsr16v_36_ULT_true:
    fa_emit_char 'B'
.Llsr16v_36_ULT_done:
    bruge8 .Llsr16v_36_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_36_UGE_done
.Llsr16v_36_UGE_true:
    fa_emit_char 'B'
.Llsr16v_36_UGE_done:
    brslt8 .Llsr16v_36_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_36_SLT_done
.Llsr16v_36_SLT_true:
    fa_emit_char 'B'
.Llsr16v_36_SLT_done:
    brsge8 .Llsr16v_36_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_36_SGE_done
.Llsr16v_36_SGE_true:
    fa_emit_char 'B'
.Llsr16v_36_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c1, effective count 9, pattern 3.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x4c98
    ldi16 c1, 0xa0a9
    ldi16 c2, 0x9f70
    ldi16 c3, 0xa55a
    lsr16v c3, c1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_37_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_37_EQ_done
.Llsr16v_37_EQ_true:
    fa_emit_char 'B'
.Llsr16v_37_EQ_done:
    brne8 .Llsr16v_37_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_37_NE_done
.Llsr16v_37_NE_true:
    fa_emit_char 'B'
.Llsr16v_37_NE_done:
    brult8 .Llsr16v_37_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_37_ULT_done
.Llsr16v_37_ULT_true:
    fa_emit_char 'B'
.Llsr16v_37_ULT_done:
    bruge8 .Llsr16v_37_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_37_UGE_done
.Llsr16v_37_UGE_true:
    fa_emit_char 'B'
.Llsr16v_37_UGE_done:
    brslt8 .Llsr16v_37_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_37_SLT_done
.Llsr16v_37_SLT_true:
    fa_emit_char 'B'
.Llsr16v_37_SLT_done:
    brsge8 .Llsr16v_37_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_37_SGE_done
.Llsr16v_37_SGE_true:
    fa_emit_char 'B'
.Llsr16v_37_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c2, effective count 14, pattern 0.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x4cc9
    ldi16 c1, 0x763b
    ldi16 c2, 0xa0de
    ldi16 c3, 0x8080
    lsr16v c3, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_38_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_38_EQ_done
.Llsr16v_38_EQ_true:
    fa_emit_char 'B'
.Llsr16v_38_EQ_done:
    brne8 .Llsr16v_38_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_38_NE_done
.Llsr16v_38_NE_true:
    fa_emit_char 'B'
.Llsr16v_38_NE_done:
    brult8 .Llsr16v_38_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_38_ULT_done
.Llsr16v_38_ULT_true:
    fa_emit_char 'B'
.Llsr16v_38_ULT_done:
    bruge8 .Llsr16v_38_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_38_UGE_done
.Llsr16v_38_UGE_true:
    fa_emit_char 'B'
.Llsr16v_38_UGE_done:
    brslt8 .Llsr16v_38_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_38_SLT_done
.Llsr16v_38_SLT_true:
    fa_emit_char 'B'
.Llsr16v_38_SLT_done:
    brsge8 .Llsr16v_38_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_38_SGE_done
.Llsr16v_38_SGE_true:
    fa_emit_char 'B'
.Llsr16v_38_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c2, effective count 2, pattern 1.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x4cfa
    ldi16 c1, 0x7672
    ldi16 c2, 0xa0c2
    ldi16 c3, 0x0001
    lsr16v c3, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_39_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_39_EQ_done
.Llsr16v_39_EQ_true:
    fa_emit_char 'B'
.Llsr16v_39_EQ_done:
    brne8 .Llsr16v_39_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_39_NE_done
.Llsr16v_39_NE_true:
    fa_emit_char 'B'
.Llsr16v_39_NE_done:
    brult8 .Llsr16v_39_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_39_ULT_done
.Llsr16v_39_ULT_true:
    fa_emit_char 'B'
.Llsr16v_39_ULT_done:
    bruge8 .Llsr16v_39_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_39_UGE_done
.Llsr16v_39_UGE_true:
    fa_emit_char 'B'
.Llsr16v_39_UGE_done:
    brslt8 .Llsr16v_39_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_39_SLT_done
.Llsr16v_39_SLT_true:
    fa_emit_char 'B'
.Llsr16v_39_SLT_done:
    brsge8 .Llsr16v_39_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_39_SGE_done
.Llsr16v_39_SGE_true:
    fa_emit_char 'B'
.Llsr16v_39_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c2, effective count 6, pattern 2.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x4d2b
    ldi16 c1, 0x76a9
    ldi16 c2, 0xa0b6
    ldi16 c3, 0x8000
    lsr16v c3, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_3a_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3a_EQ_done
.Llsr16v_3a_EQ_true:
    fa_emit_char 'B'
.Llsr16v_3a_EQ_done:
    brne8 .Llsr16v_3a_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3a_NE_done
.Llsr16v_3a_NE_true:
    fa_emit_char 'B'
.Llsr16v_3a_NE_done:
    brult8 .Llsr16v_3a_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3a_ULT_done
.Llsr16v_3a_ULT_true:
    fa_emit_char 'B'
.Llsr16v_3a_ULT_done:
    bruge8 .Llsr16v_3a_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3a_UGE_done
.Llsr16v_3a_UGE_true:
    fa_emit_char 'B'
.Llsr16v_3a_UGE_done:
    brslt8 .Llsr16v_3a_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3a_SLT_done
.Llsr16v_3a_SLT_true:
    fa_emit_char 'B'
.Llsr16v_3a_SLT_done:
    brsge8 .Llsr16v_3a_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3a_SGE_done
.Llsr16v_3a_SGE_true:
    fa_emit_char 'B'
.Llsr16v_3a_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c2, effective count 10, pattern 3.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x4d5c
    ldi16 c1, 0x76e0
    ldi16 c2, 0xa0aa
    ldi16 c3, 0x5aa5
    lsr16v c3, c2
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_3b_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3b_EQ_done
.Llsr16v_3b_EQ_true:
    fa_emit_char 'B'
.Llsr16v_3b_EQ_done:
    brne8 .Llsr16v_3b_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3b_NE_done
.Llsr16v_3b_NE_true:
    fa_emit_char 'B'
.Llsr16v_3b_NE_done:
    brult8 .Llsr16v_3b_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3b_ULT_done
.Llsr16v_3b_ULT_true:
    fa_emit_char 'B'
.Llsr16v_3b_ULT_done:
    bruge8 .Llsr16v_3b_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3b_UGE_done
.Llsr16v_3b_UGE_true:
    fa_emit_char 'B'
.Llsr16v_3b_UGE_done:
    brslt8 .Llsr16v_3b_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3b_SLT_done
.Llsr16v_3b_SLT_true:
    fa_emit_char 'B'
.Llsr16v_3b_SLT_done:
    brsge8 .Llsr16v_3b_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3b_SGE_done
.Llsr16v_3b_SGE_true:
    fa_emit_char 'B'
.Llsr16v_3b_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c3, effective count 15, pattern 0.
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x4d8d
    ldi16 c1, 0x7717
    ldi16 c2, 0xa0a1
    ldi16 c3, 0xc3df
    lsr16v c3, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_3c_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3c_EQ_done
.Llsr16v_3c_EQ_true:
    fa_emit_char 'B'
.Llsr16v_3c_EQ_done:
    brne8 .Llsr16v_3c_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3c_NE_done
.Llsr16v_3c_NE_true:
    fa_emit_char 'B'
.Llsr16v_3c_NE_done:
    brult8 .Llsr16v_3c_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3c_ULT_done
.Llsr16v_3c_ULT_true:
    fa_emit_char 'B'
.Llsr16v_3c_ULT_done:
    bruge8 .Llsr16v_3c_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3c_UGE_done
.Llsr16v_3c_UGE_true:
    fa_emit_char 'B'
.Llsr16v_3c_UGE_done:
    brslt8 .Llsr16v_3c_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3c_SLT_done
.Llsr16v_3c_SLT_true:
    fa_emit_char 'B'
.Llsr16v_3c_SLT_done:
    brsge8 .Llsr16v_3c_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3c_SGE_done
.Llsr16v_3c_SGE_true:
    fa_emit_char 'B'
.Llsr16v_3c_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c3, effective count 3, pattern 1.
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x4dbe
    ldi16 c1, 0x774e
    ldi16 c2, 0xa0de
    ldi16 c3, 0x8003
    lsr16v c3, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_3d_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3d_EQ_done
.Llsr16v_3d_EQ_true:
    fa_emit_char 'B'
.Llsr16v_3d_EQ_done:
    brne8 .Llsr16v_3d_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3d_NE_done
.Llsr16v_3d_NE_true:
    fa_emit_char 'B'
.Llsr16v_3d_NE_done:
    brult8 .Llsr16v_3d_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3d_ULT_done
.Llsr16v_3d_ULT_true:
    fa_emit_char 'B'
.Llsr16v_3d_ULT_done:
    bruge8 .Llsr16v_3d_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3d_UGE_done
.Llsr16v_3d_UGE_true:
    fa_emit_char 'B'
.Llsr16v_3d_UGE_done:
    brslt8 .Llsr16v_3d_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3d_SLT_done
.Llsr16v_3d_SLT_true:
    fa_emit_char 'B'
.Llsr16v_3d_SLT_done:
    brsge8 .Llsr16v_3d_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3d_SGE_done
.Llsr16v_3d_SGE_true:
    fa_emit_char 'B'
.Llsr16v_3d_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c3, effective count 7, pattern 2.
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x4def
    ldi16 c1, 0x7785
    ldi16 c2, 0xa11b
    ldi16 c3, 0xf007
    lsr16v c3, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_3e_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3e_EQ_done
.Llsr16v_3e_EQ_true:
    fa_emit_char 'B'
.Llsr16v_3e_EQ_done:
    brne8 .Llsr16v_3e_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3e_NE_done
.Llsr16v_3e_NE_true:
    fa_emit_char 'B'
.Llsr16v_3e_NE_done:
    brult8 .Llsr16v_3e_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3e_ULT_done
.Llsr16v_3e_ULT_true:
    fa_emit_char 'B'
.Llsr16v_3e_ULT_done:
    bruge8 .Llsr16v_3e_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3e_UGE_done
.Llsr16v_3e_UGE_true:
    fa_emit_char 'B'
.Llsr16v_3e_UGE_done:
    brslt8 .Llsr16v_3e_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3e_SLT_done
.Llsr16v_3e_SLT_true:
    fa_emit_char 'B'
.Llsr16v_3e_SLT_done:
    brsge8 .Llsr16v_3e_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3e_SGE_done
.Llsr16v_3e_SGE_true:
    fa_emit_char 'B'
.Llsr16v_3e_SGE_done:
    fa_emit_char '\n'

    ; d=c3, count=c3, effective count 11, pattern 3.
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x4e20
    ldi16 c1, 0x77bc
    ldi16 c2, 0xa158
    ldi16 c3, 0x5aab
    lsr16v c3, c3
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    fa_print_r0_r3
    breq8 .Llsr16v_3f_EQ_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3f_EQ_done
.Llsr16v_3f_EQ_true:
    fa_emit_char 'B'
.Llsr16v_3f_EQ_done:
    brne8 .Llsr16v_3f_NE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3f_NE_done
.Llsr16v_3f_NE_true:
    fa_emit_char 'B'
.Llsr16v_3f_NE_done:
    brult8 .Llsr16v_3f_ULT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3f_ULT_done
.Llsr16v_3f_ULT_true:
    fa_emit_char 'B'
.Llsr16v_3f_ULT_done:
    bruge8 .Llsr16v_3f_UGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3f_UGE_done
.Llsr16v_3f_UGE_true:
    fa_emit_char 'B'
.Llsr16v_3f_UGE_done:
    brslt8 .Llsr16v_3f_SLT_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3f_SLT_done
.Llsr16v_3f_SLT_true:
    fa_emit_char 'B'
.Llsr16v_3f_SLT_done:
    brsge8 .Llsr16v_3f_SGE_true
    fa_emit_char 'A'
    jmp8 .Llsr16v_3f_SGE_done
.Llsr16v_3f_SGE_true:
    fa_emit_char 'B'
.Llsr16v_3f_SGE_done:
    fa_emit_char '\n'

    sys debug_break
