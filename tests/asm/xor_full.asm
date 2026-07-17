.include "include/f9_bitwise_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; F9 pair r0,r0; pattern 0; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r0
    ldi16 r4, 0x4c01
    push16 r4
    pop16 r1
    xor r0, r0
    push16 r1
    push16 r0
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_000_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_000_EQ_done
.Lxor_full_000_EQ_true:
    bit_emit_char 'B'
.Lxor_full_000_EQ_done:
    brne8 .Lxor_full_000_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_000_NE_done
.Lxor_full_000_NE_true:
    bit_emit_char 'B'
.Lxor_full_000_NE_done:
    brult8 .Lxor_full_000_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_000_ULT_done
.Lxor_full_000_ULT_true:
    bit_emit_char 'B'
.Lxor_full_000_ULT_done:
    bruge8 .Lxor_full_000_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_000_UGE_done
.Lxor_full_000_UGE_true:
    bit_emit_char 'B'
.Lxor_full_000_UGE_done:
    brslt8 .Lxor_full_000_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_000_SLT_done
.Lxor_full_000_SLT_true:
    bit_emit_char 'B'
.Lxor_full_000_SLT_done:
    brsge8 .Lxor_full_000_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_000_SGE_done
.Lxor_full_000_SGE_true:
    bit_emit_char 'B'
.Lxor_full_000_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r0; pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r0
    ldi16 r4, 0x4d5b
    push16 r4
    pop16 r2
    xor r0, r0
    push16 r2
    push16 r0
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_001_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_001_EQ_done
.Lxor_full_001_EQ_true:
    bit_emit_char 'B'
.Lxor_full_001_EQ_done:
    brne8 .Lxor_full_001_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_001_NE_done
.Lxor_full_001_NE_true:
    bit_emit_char 'B'
.Lxor_full_001_NE_done:
    brult8 .Lxor_full_001_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_001_ULT_done
.Lxor_full_001_ULT_true:
    bit_emit_char 'B'
.Lxor_full_001_ULT_done:
    bruge8 .Lxor_full_001_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_001_UGE_done
.Lxor_full_001_UGE_true:
    bit_emit_char 'B'
.Lxor_full_001_UGE_done:
    brslt8 .Lxor_full_001_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_001_SLT_done
.Lxor_full_001_SLT_true:
    bit_emit_char 'B'
.Lxor_full_001_SLT_done:
    brsge8 .Lxor_full_001_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_001_SGE_done
.Lxor_full_001_SGE_true:
    bit_emit_char 'B'
.Lxor_full_001_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r0; pattern 2; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r0
    ldi16 r4, 0x4eb5
    push16 r4
    pop16 r3
    xor r0, r0
    push16 r3
    push16 r0
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_002_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_002_EQ_done
.Lxor_full_002_EQ_true:
    bit_emit_char 'B'
.Lxor_full_002_EQ_done:
    brne8 .Lxor_full_002_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_002_NE_done
.Lxor_full_002_NE_true:
    bit_emit_char 'B'
.Lxor_full_002_NE_done:
    brult8 .Lxor_full_002_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_002_ULT_done
.Lxor_full_002_ULT_true:
    bit_emit_char 'B'
.Lxor_full_002_ULT_done:
    bruge8 .Lxor_full_002_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_002_UGE_done
.Lxor_full_002_UGE_true:
    bit_emit_char 'B'
.Lxor_full_002_UGE_done:
    brslt8 .Lxor_full_002_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_002_SLT_done
.Lxor_full_002_SLT_true:
    bit_emit_char 'B'
.Lxor_full_002_SLT_done:
    brsge8 .Lxor_full_002_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_002_SGE_done
.Lxor_full_002_SGE_true:
    bit_emit_char 'B'
.Lxor_full_002_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r0; pattern 3; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x8001
    push16 r5
    pop16 r0
    ldi16 r5, 0x500f
    push16 r5
    pop16 r4
    xor r0, r0
    push16 r4
    push16 r0
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_003_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_003_EQ_done
.Lxor_full_003_EQ_true:
    bit_emit_char 'B'
.Lxor_full_003_EQ_done:
    brne8 .Lxor_full_003_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_003_NE_done
.Lxor_full_003_NE_true:
    bit_emit_char 'B'
.Lxor_full_003_NE_done:
    brult8 .Lxor_full_003_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_003_ULT_done
.Lxor_full_003_ULT_true:
    bit_emit_char 'B'
.Lxor_full_003_ULT_done:
    bruge8 .Lxor_full_003_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_003_UGE_done
.Lxor_full_003_UGE_true:
    bit_emit_char 'B'
.Lxor_full_003_UGE_done:
    brslt8 .Lxor_full_003_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_003_SLT_done
.Lxor_full_003_SLT_true:
    bit_emit_char 'B'
.Lxor_full_003_SLT_done:
    brsge8 .Lxor_full_003_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_003_SGE_done
.Lxor_full_003_SGE_true:
    bit_emit_char 'B'
.Lxor_full_003_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r1; pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r0
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r1
    ldi16 r4, 0x526a
    push16 r4
    pop16 r6
    xor r0, r1
    push16 r6
    push16 r1
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_004_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_004_EQ_done
.Lxor_full_004_EQ_true:
    bit_emit_char 'B'
.Lxor_full_004_EQ_done:
    brne8 .Lxor_full_004_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_004_NE_done
.Lxor_full_004_NE_true:
    bit_emit_char 'B'
.Lxor_full_004_NE_done:
    brult8 .Lxor_full_004_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_004_ULT_done
.Lxor_full_004_ULT_true:
    bit_emit_char 'B'
.Lxor_full_004_ULT_done:
    bruge8 .Lxor_full_004_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_004_UGE_done
.Lxor_full_004_UGE_true:
    bit_emit_char 'B'
.Lxor_full_004_UGE_done:
    brslt8 .Lxor_full_004_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_004_SLT_done
.Lxor_full_004_SLT_true:
    bit_emit_char 'B'
.Lxor_full_004_SLT_done:
    brsge8 .Lxor_full_004_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_004_SGE_done
.Lxor_full_004_SGE_true:
    bit_emit_char 'B'
.Lxor_full_004_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r1; pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r0
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r1
    ldi16 r4, 0x53c4
    push16 r4
    pop16 r7
    xor r0, r1
    push16 r7
    push16 r1
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_005_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_005_EQ_done
.Lxor_full_005_EQ_true:
    bit_emit_char 'B'
.Lxor_full_005_EQ_done:
    brne8 .Lxor_full_005_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_005_NE_done
.Lxor_full_005_NE_true:
    bit_emit_char 'B'
.Lxor_full_005_NE_done:
    brult8 .Lxor_full_005_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_005_ULT_done
.Lxor_full_005_ULT_true:
    bit_emit_char 'B'
.Lxor_full_005_ULT_done:
    bruge8 .Lxor_full_005_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_005_UGE_done
.Lxor_full_005_UGE_true:
    bit_emit_char 'B'
.Lxor_full_005_UGE_done:
    brslt8 .Lxor_full_005_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_005_SLT_done
.Lxor_full_005_SLT_true:
    bit_emit_char 'B'
.Lxor_full_005_SLT_done:
    brsge8 .Lxor_full_005_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_005_SGE_done
.Lxor_full_005_SGE_true:
    bit_emit_char 'B'
.Lxor_full_005_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r1; pattern 2; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r0
    ldi16 r4, 0x0000
    push16 r4
    pop16 r1
    ldi16 r4, 0x4f18
    push16 r4
    pop16 r2
    xor r0, r1
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_006_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_006_EQ_done
.Lxor_full_006_EQ_true:
    bit_emit_char 'B'
.Lxor_full_006_EQ_done:
    brne8 .Lxor_full_006_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_006_NE_done
.Lxor_full_006_NE_true:
    bit_emit_char 'B'
.Lxor_full_006_NE_done:
    brult8 .Lxor_full_006_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_006_ULT_done
.Lxor_full_006_ULT_true:
    bit_emit_char 'B'
.Lxor_full_006_ULT_done:
    bruge8 .Lxor_full_006_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_006_UGE_done
.Lxor_full_006_UGE_true:
    bit_emit_char 'B'
.Lxor_full_006_UGE_done:
    brslt8 .Lxor_full_006_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_006_SLT_done
.Lxor_full_006_SLT_true:
    bit_emit_char 'B'
.Lxor_full_006_SLT_done:
    brsge8 .Lxor_full_006_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_006_SGE_done
.Lxor_full_006_SGE_true:
    bit_emit_char 'B'
.Lxor_full_006_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r1; pattern 3; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r0
    ldi16 r4, 0x3333
    push16 r4
    pop16 r1
    ldi16 r4, 0x4f71
    push16 r4
    pop16 r2
    xor r0, r1
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_007_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_007_EQ_done
.Lxor_full_007_EQ_true:
    bit_emit_char 'B'
.Lxor_full_007_EQ_done:
    brne8 .Lxor_full_007_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_007_NE_done
.Lxor_full_007_NE_true:
    bit_emit_char 'B'
.Lxor_full_007_NE_done:
    brult8 .Lxor_full_007_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_007_ULT_done
.Lxor_full_007_ULT_true:
    bit_emit_char 'B'
.Lxor_full_007_ULT_done:
    bruge8 .Lxor_full_007_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_007_UGE_done
.Lxor_full_007_UGE_true:
    bit_emit_char 'B'
.Lxor_full_007_UGE_done:
    brslt8 .Lxor_full_007_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_007_SLT_done
.Lxor_full_007_SLT_true:
    bit_emit_char 'B'
.Lxor_full_007_SLT_done:
    brsge8 .Lxor_full_007_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_007_SGE_done
.Lxor_full_007_SGE_true:
    bit_emit_char 'B'
.Lxor_full_007_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r2; pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r0
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r2
    ldi16 r4, 0x50cb
    push16 r4
    pop16 r3
    xor r0, r2
    push16 r3
    push16 r2
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_008_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_008_EQ_done
.Lxor_full_008_EQ_true:
    bit_emit_char 'B'
.Lxor_full_008_EQ_done:
    brne8 .Lxor_full_008_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_008_NE_done
.Lxor_full_008_NE_true:
    bit_emit_char 'B'
.Lxor_full_008_NE_done:
    brult8 .Lxor_full_008_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_008_ULT_done
.Lxor_full_008_ULT_true:
    bit_emit_char 'B'
.Lxor_full_008_ULT_done:
    bruge8 .Lxor_full_008_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_008_UGE_done
.Lxor_full_008_UGE_true:
    bit_emit_char 'B'
.Lxor_full_008_UGE_done:
    brslt8 .Lxor_full_008_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_008_SLT_done
.Lxor_full_008_SLT_true:
    bit_emit_char 'B'
.Lxor_full_008_SLT_done:
    brsge8 .Lxor_full_008_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_008_SGE_done
.Lxor_full_008_SGE_true:
    bit_emit_char 'B'
.Lxor_full_008_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r2; pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xf00f
    push16 r5
    pop16 r0
    ldi16 r5, 0xcccc
    push16 r5
    pop16 r2
    ldi16 r5, 0x5225
    push16 r5
    pop16 r4
    xor r0, r2
    push16 r4
    push16 r2
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_009_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_009_EQ_done
.Lxor_full_009_EQ_true:
    bit_emit_char 'B'
.Lxor_full_009_EQ_done:
    brne8 .Lxor_full_009_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_009_NE_done
.Lxor_full_009_NE_true:
    bit_emit_char 'B'
.Lxor_full_009_NE_done:
    brult8 .Lxor_full_009_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_009_ULT_done
.Lxor_full_009_ULT_true:
    bit_emit_char 'B'
.Lxor_full_009_ULT_done:
    bruge8 .Lxor_full_009_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_009_UGE_done
.Lxor_full_009_UGE_true:
    bit_emit_char 'B'
.Lxor_full_009_UGE_done:
    brslt8 .Lxor_full_009_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_009_SLT_done
.Lxor_full_009_SLT_true:
    bit_emit_char 'B'
.Lxor_full_009_SLT_done:
    brsge8 .Lxor_full_009_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_009_SGE_done
.Lxor_full_009_SGE_true:
    bit_emit_char 'B'
.Lxor_full_009_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r2; pattern 2; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r0
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r2
    ldi16 r4, 0x537f
    push16 r4
    pop16 r5
    xor r0, r2
    push16 r5
    push16 r2
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_00a_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00a_EQ_done
.Lxor_full_00a_EQ_true:
    bit_emit_char 'B'
.Lxor_full_00a_EQ_done:
    brne8 .Lxor_full_00a_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00a_NE_done
.Lxor_full_00a_NE_true:
    bit_emit_char 'B'
.Lxor_full_00a_NE_done:
    brult8 .Lxor_full_00a_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00a_ULT_done
.Lxor_full_00a_ULT_true:
    bit_emit_char 'B'
.Lxor_full_00a_ULT_done:
    bruge8 .Lxor_full_00a_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00a_UGE_done
.Lxor_full_00a_UGE_true:
    bit_emit_char 'B'
.Lxor_full_00a_UGE_done:
    brslt8 .Lxor_full_00a_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00a_SLT_done
.Lxor_full_00a_SLT_true:
    bit_emit_char 'B'
.Lxor_full_00a_SLT_done:
    brsge8 .Lxor_full_00a_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00a_SGE_done
.Lxor_full_00a_SGE_true:
    bit_emit_char 'B'
.Lxor_full_00a_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r2; pattern 3; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r0
    ldi16 r4, 0xffff
    push16 r4
    pop16 r2
    ldi16 r4, 0x54d9
    push16 r4
    pop16 r6
    xor r0, r2
    push16 r6
    push16 r2
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_00b_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00b_EQ_done
.Lxor_full_00b_EQ_true:
    bit_emit_char 'B'
.Lxor_full_00b_EQ_done:
    brne8 .Lxor_full_00b_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00b_NE_done
.Lxor_full_00b_NE_true:
    bit_emit_char 'B'
.Lxor_full_00b_NE_done:
    brult8 .Lxor_full_00b_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00b_ULT_done
.Lxor_full_00b_ULT_true:
    bit_emit_char 'B'
.Lxor_full_00b_ULT_done:
    bruge8 .Lxor_full_00b_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00b_UGE_done
.Lxor_full_00b_UGE_true:
    bit_emit_char 'B'
.Lxor_full_00b_UGE_done:
    brslt8 .Lxor_full_00b_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00b_SLT_done
.Lxor_full_00b_SLT_true:
    bit_emit_char 'B'
.Lxor_full_00b_SLT_done:
    brsge8 .Lxor_full_00b_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00b_SGE_done
.Lxor_full_00b_SGE_true:
    bit_emit_char 'B'
.Lxor_full_00b_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r3; pattern 0; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r0
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r3
    ldi16 r4, 0x502d
    push16 r4
    pop16 r1
    xor r0, r3
    push16 r1
    push16 r3
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_00c_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00c_EQ_done
.Lxor_full_00c_EQ_true:
    bit_emit_char 'B'
.Lxor_full_00c_EQ_done:
    brne8 .Lxor_full_00c_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00c_NE_done
.Lxor_full_00c_NE_true:
    bit_emit_char 'B'
.Lxor_full_00c_NE_done:
    brult8 .Lxor_full_00c_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00c_ULT_done
.Lxor_full_00c_ULT_true:
    bit_emit_char 'B'
.Lxor_full_00c_ULT_done:
    bruge8 .Lxor_full_00c_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00c_UGE_done
.Lxor_full_00c_UGE_true:
    bit_emit_char 'B'
.Lxor_full_00c_UGE_done:
    brslt8 .Lxor_full_00c_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00c_SLT_done
.Lxor_full_00c_SLT_true:
    bit_emit_char 'B'
.Lxor_full_00c_SLT_done:
    brsge8 .Lxor_full_00c_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00c_SGE_done
.Lxor_full_00c_SGE_true:
    bit_emit_char 'B'
.Lxor_full_00c_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r3; pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r0
    ldi16 r4, 0x0000
    push16 r4
    pop16 r3
    ldi16 r4, 0x5086
    push16 r4
    pop16 r1
    xor r0, r3
    push16 r1
    push16 r3
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_00d_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00d_EQ_done
.Lxor_full_00d_EQ_true:
    bit_emit_char 'B'
.Lxor_full_00d_EQ_done:
    brne8 .Lxor_full_00d_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00d_NE_done
.Lxor_full_00d_NE_true:
    bit_emit_char 'B'
.Lxor_full_00d_NE_done:
    brult8 .Lxor_full_00d_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00d_ULT_done
.Lxor_full_00d_ULT_true:
    bit_emit_char 'B'
.Lxor_full_00d_ULT_done:
    bruge8 .Lxor_full_00d_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00d_UGE_done
.Lxor_full_00d_UGE_true:
    bit_emit_char 'B'
.Lxor_full_00d_UGE_done:
    brslt8 .Lxor_full_00d_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00d_SLT_done
.Lxor_full_00d_SLT_true:
    bit_emit_char 'B'
.Lxor_full_00d_SLT_done:
    brsge8 .Lxor_full_00d_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00d_SGE_done
.Lxor_full_00d_SGE_true:
    bit_emit_char 'B'
.Lxor_full_00d_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r3; pattern 2; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r0
    ldi16 r4, 0x3333
    push16 r4
    pop16 r3
    ldi16 r4, 0x51e0
    push16 r4
    pop16 r2
    xor r0, r3
    push16 r2
    push16 r3
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_00e_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00e_EQ_done
.Lxor_full_00e_EQ_true:
    bit_emit_char 'B'
.Lxor_full_00e_EQ_done:
    brne8 .Lxor_full_00e_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00e_NE_done
.Lxor_full_00e_NE_true:
    bit_emit_char 'B'
.Lxor_full_00e_NE_done:
    brult8 .Lxor_full_00e_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00e_ULT_done
.Lxor_full_00e_ULT_true:
    bit_emit_char 'B'
.Lxor_full_00e_ULT_done:
    bruge8 .Lxor_full_00e_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00e_UGE_done
.Lxor_full_00e_UGE_true:
    bit_emit_char 'B'
.Lxor_full_00e_UGE_done:
    brslt8 .Lxor_full_00e_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00e_SLT_done
.Lxor_full_00e_SLT_true:
    bit_emit_char 'B'
.Lxor_full_00e_SLT_done:
    brsge8 .Lxor_full_00e_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00e_SGE_done
.Lxor_full_00e_SGE_true:
    bit_emit_char 'B'
.Lxor_full_00e_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r3; pattern 3; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x1234
    push16 r5
    pop16 r0
    ldi16 r5, 0x00ff
    push16 r5
    pop16 r3
    ldi16 r5, 0x543b
    push16 r5
    pop16 r4
    xor r0, r3
    push16 r4
    push16 r3
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_00f_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00f_EQ_done
.Lxor_full_00f_EQ_true:
    bit_emit_char 'B'
.Lxor_full_00f_EQ_done:
    brne8 .Lxor_full_00f_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00f_NE_done
.Lxor_full_00f_NE_true:
    bit_emit_char 'B'
.Lxor_full_00f_NE_done:
    brult8 .Lxor_full_00f_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00f_ULT_done
.Lxor_full_00f_ULT_true:
    bit_emit_char 'B'
.Lxor_full_00f_ULT_done:
    bruge8 .Lxor_full_00f_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00f_UGE_done
.Lxor_full_00f_UGE_true:
    bit_emit_char 'B'
.Lxor_full_00f_UGE_done:
    brslt8 .Lxor_full_00f_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00f_SLT_done
.Lxor_full_00f_SLT_true:
    bit_emit_char 'B'
.Lxor_full_00f_SLT_done:
    brsge8 .Lxor_full_00f_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_00f_SGE_done
.Lxor_full_00f_SGE_true:
    bit_emit_char 'B'
.Lxor_full_00f_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r4; pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r6, 0xf00f
    push16 r6
    pop16 r0
    ldi16 r6, 0xcccc
    push16 r6
    pop16 r4
    ldi16 r6, 0x5595
    push16 r6
    pop16 r5
    xor r0, r4
    push16 r5
    push16 r4
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_010_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_010_EQ_done
.Lxor_full_010_EQ_true:
    bit_emit_char 'B'
.Lxor_full_010_EQ_done:
    brne8 .Lxor_full_010_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_010_NE_done
.Lxor_full_010_NE_true:
    bit_emit_char 'B'
.Lxor_full_010_NE_done:
    brult8 .Lxor_full_010_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_010_ULT_done
.Lxor_full_010_ULT_true:
    bit_emit_char 'B'
.Lxor_full_010_ULT_done:
    bruge8 .Lxor_full_010_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_010_UGE_done
.Lxor_full_010_UGE_true:
    bit_emit_char 'B'
.Lxor_full_010_UGE_done:
    brslt8 .Lxor_full_010_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_010_SLT_done
.Lxor_full_010_SLT_true:
    bit_emit_char 'B'
.Lxor_full_010_SLT_done:
    brsge8 .Lxor_full_010_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_010_SGE_done
.Lxor_full_010_SGE_true:
    bit_emit_char 'B'
.Lxor_full_010_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r4; pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x8001
    push16 r5
    pop16 r0
    ldi16 r5, 0x7ffe
    push16 r5
    pop16 r4
    ldi16 r5, 0x56ef
    push16 r5
    pop16 r6
    xor r0, r4
    push16 r6
    push16 r4
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_011_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_011_EQ_done
.Lxor_full_011_EQ_true:
    bit_emit_char 'B'
.Lxor_full_011_EQ_done:
    brne8 .Lxor_full_011_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_011_NE_done
.Lxor_full_011_NE_true:
    bit_emit_char 'B'
.Lxor_full_011_NE_done:
    brult8 .Lxor_full_011_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_011_ULT_done
.Lxor_full_011_ULT_true:
    bit_emit_char 'B'
.Lxor_full_011_ULT_done:
    bruge8 .Lxor_full_011_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_011_UGE_done
.Lxor_full_011_UGE_true:
    bit_emit_char 'B'
.Lxor_full_011_UGE_done:
    brslt8 .Lxor_full_011_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_011_SLT_done
.Lxor_full_011_SLT_true:
    bit_emit_char 'B'
.Lxor_full_011_SLT_done:
    brsge8 .Lxor_full_011_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_011_SGE_done
.Lxor_full_011_SGE_true:
    bit_emit_char 'B'
.Lxor_full_011_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r4; pattern 2; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r0
    ldi16 r5, 0xffff
    push16 r5
    pop16 r4
    ldi16 r5, 0x5849
    push16 r5
    pop16 r7
    xor r0, r4
    push16 r7
    push16 r4
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_012_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_012_EQ_done
.Lxor_full_012_EQ_true:
    bit_emit_char 'B'
.Lxor_full_012_EQ_done:
    brne8 .Lxor_full_012_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_012_NE_done
.Lxor_full_012_NE_true:
    bit_emit_char 'B'
.Lxor_full_012_NE_done:
    brult8 .Lxor_full_012_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_012_ULT_done
.Lxor_full_012_ULT_true:
    bit_emit_char 'B'
.Lxor_full_012_ULT_done:
    bruge8 .Lxor_full_012_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_012_UGE_done
.Lxor_full_012_UGE_true:
    bit_emit_char 'B'
.Lxor_full_012_UGE_done:
    brslt8 .Lxor_full_012_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_012_SLT_done
.Lxor_full_012_SLT_true:
    bit_emit_char 'B'
.Lxor_full_012_SLT_done:
    brsge8 .Lxor_full_012_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_012_SGE_done
.Lxor_full_012_SGE_true:
    bit_emit_char 'B'
.Lxor_full_012_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r4; pattern 3; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r0
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r4
    ldi16 r5, 0x529c
    push16 r5
    pop16 r1
    xor r0, r4
    push16 r1
    push16 r4
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_013_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_013_EQ_done
.Lxor_full_013_EQ_true:
    bit_emit_char 'B'
.Lxor_full_013_EQ_done:
    brne8 .Lxor_full_013_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_013_NE_done
.Lxor_full_013_NE_true:
    bit_emit_char 'B'
.Lxor_full_013_NE_done:
    brult8 .Lxor_full_013_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_013_ULT_done
.Lxor_full_013_ULT_true:
    bit_emit_char 'B'
.Lxor_full_013_ULT_done:
    bruge8 .Lxor_full_013_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_013_UGE_done
.Lxor_full_013_UGE_true:
    bit_emit_char 'B'
.Lxor_full_013_UGE_done:
    brslt8 .Lxor_full_013_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_013_SLT_done
.Lxor_full_013_SLT_true:
    bit_emit_char 'B'
.Lxor_full_013_SLT_done:
    brsge8 .Lxor_full_013_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_013_SGE_done
.Lxor_full_013_SGE_true:
    bit_emit_char 'B'
.Lxor_full_013_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r5; pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r0
    ldi16 r4, 0x0000
    push16 r4
    pop16 r5
    ldi16 r4, 0x53f6
    push16 r4
    pop16 r2
    xor r0, r5
    push16 r2
    push16 r5
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_014_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_014_EQ_done
.Lxor_full_014_EQ_true:
    bit_emit_char 'B'
.Lxor_full_014_EQ_done:
    brne8 .Lxor_full_014_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_014_NE_done
.Lxor_full_014_NE_true:
    bit_emit_char 'B'
.Lxor_full_014_NE_done:
    brult8 .Lxor_full_014_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_014_ULT_done
.Lxor_full_014_ULT_true:
    bit_emit_char 'B'
.Lxor_full_014_ULT_done:
    bruge8 .Lxor_full_014_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_014_UGE_done
.Lxor_full_014_UGE_true:
    bit_emit_char 'B'
.Lxor_full_014_UGE_done:
    brslt8 .Lxor_full_014_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_014_SLT_done
.Lxor_full_014_SLT_true:
    bit_emit_char 'B'
.Lxor_full_014_SLT_done:
    brsge8 .Lxor_full_014_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_014_SGE_done
.Lxor_full_014_SGE_true:
    bit_emit_char 'B'
.Lxor_full_014_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r5; pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r0
    ldi16 r4, 0x3333
    push16 r4
    pop16 r5
    ldi16 r4, 0x5550
    push16 r4
    pop16 r3
    xor r0, r5
    push16 r3
    push16 r5
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_015_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_015_EQ_done
.Lxor_full_015_EQ_true:
    bit_emit_char 'B'
.Lxor_full_015_EQ_done:
    brne8 .Lxor_full_015_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_015_NE_done
.Lxor_full_015_NE_true:
    bit_emit_char 'B'
.Lxor_full_015_NE_done:
    brult8 .Lxor_full_015_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_015_ULT_done
.Lxor_full_015_ULT_true:
    bit_emit_char 'B'
.Lxor_full_015_ULT_done:
    bruge8 .Lxor_full_015_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_015_UGE_done
.Lxor_full_015_UGE_true:
    bit_emit_char 'B'
.Lxor_full_015_UGE_done:
    brslt8 .Lxor_full_015_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_015_SLT_done
.Lxor_full_015_SLT_true:
    bit_emit_char 'B'
.Lxor_full_015_SLT_done:
    brsge8 .Lxor_full_015_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_015_SGE_done
.Lxor_full_015_SGE_true:
    bit_emit_char 'B'
.Lxor_full_015_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r5; pattern 2; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x1234
    push16 r6
    pop16 r0
    ldi16 r6, 0x00ff
    push16 r6
    pop16 r5
    ldi16 r6, 0x56aa
    push16 r6
    pop16 r4
    xor r0, r5
    push16 r4
    push16 r5
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_016_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_016_EQ_done
.Lxor_full_016_EQ_true:
    bit_emit_char 'B'
.Lxor_full_016_EQ_done:
    brne8 .Lxor_full_016_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_016_NE_done
.Lxor_full_016_NE_true:
    bit_emit_char 'B'
.Lxor_full_016_NE_done:
    brult8 .Lxor_full_016_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_016_ULT_done
.Lxor_full_016_ULT_true:
    bit_emit_char 'B'
.Lxor_full_016_ULT_done:
    bruge8 .Lxor_full_016_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_016_UGE_done
.Lxor_full_016_UGE_true:
    bit_emit_char 'B'
.Lxor_full_016_UGE_done:
    brslt8 .Lxor_full_016_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_016_SLT_done
.Lxor_full_016_SLT_true:
    bit_emit_char 'B'
.Lxor_full_016_SLT_done:
    brsge8 .Lxor_full_016_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_016_SGE_done
.Lxor_full_016_SGE_true:
    bit_emit_char 'B'
.Lxor_full_016_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r5; pattern 3; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r0
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r5
    ldi16 r4, 0x5905
    push16 r4
    pop16 r6
    xor r0, r5
    push16 r6
    push16 r5
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_017_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_017_EQ_done
.Lxor_full_017_EQ_true:
    bit_emit_char 'B'
.Lxor_full_017_EQ_done:
    brne8 .Lxor_full_017_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_017_NE_done
.Lxor_full_017_NE_true:
    bit_emit_char 'B'
.Lxor_full_017_NE_done:
    brult8 .Lxor_full_017_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_017_ULT_done
.Lxor_full_017_ULT_true:
    bit_emit_char 'B'
.Lxor_full_017_ULT_done:
    bruge8 .Lxor_full_017_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_017_UGE_done
.Lxor_full_017_UGE_true:
    bit_emit_char 'B'
.Lxor_full_017_UGE_done:
    brslt8 .Lxor_full_017_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_017_SLT_done
.Lxor_full_017_SLT_true:
    bit_emit_char 'B'
.Lxor_full_017_SLT_done:
    brsge8 .Lxor_full_017_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_017_SGE_done
.Lxor_full_017_SGE_true:
    bit_emit_char 'B'
.Lxor_full_017_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r6; pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r0
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r6
    ldi16 r4, 0x5a5f
    push16 r4
    pop16 r7
    xor r0, r6
    push16 r7
    push16 r6
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_018_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_018_EQ_done
.Lxor_full_018_EQ_true:
    bit_emit_char 'B'
.Lxor_full_018_EQ_done:
    brne8 .Lxor_full_018_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_018_NE_done
.Lxor_full_018_NE_true:
    bit_emit_char 'B'
.Lxor_full_018_NE_done:
    brult8 .Lxor_full_018_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_018_ULT_done
.Lxor_full_018_ULT_true:
    bit_emit_char 'B'
.Lxor_full_018_ULT_done:
    bruge8 .Lxor_full_018_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_018_UGE_done
.Lxor_full_018_UGE_true:
    bit_emit_char 'B'
.Lxor_full_018_UGE_done:
    brslt8 .Lxor_full_018_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_018_SLT_done
.Lxor_full_018_SLT_true:
    bit_emit_char 'B'
.Lxor_full_018_SLT_done:
    brsge8 .Lxor_full_018_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_018_SGE_done
.Lxor_full_018_SGE_true:
    bit_emit_char 'B'
.Lxor_full_018_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r6; pattern 1; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r0
    ldi16 r4, 0xffff
    push16 r4
    pop16 r6
    ldi16 r4, 0x54b2
    push16 r4
    pop16 r1
    xor r0, r6
    push16 r1
    push16 r6
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_019_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_019_EQ_done
.Lxor_full_019_EQ_true:
    bit_emit_char 'B'
.Lxor_full_019_EQ_done:
    brne8 .Lxor_full_019_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_019_NE_done
.Lxor_full_019_NE_true:
    bit_emit_char 'B'
.Lxor_full_019_NE_done:
    brult8 .Lxor_full_019_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_019_ULT_done
.Lxor_full_019_ULT_true:
    bit_emit_char 'B'
.Lxor_full_019_ULT_done:
    bruge8 .Lxor_full_019_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_019_UGE_done
.Lxor_full_019_UGE_true:
    bit_emit_char 'B'
.Lxor_full_019_UGE_done:
    brslt8 .Lxor_full_019_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_019_SLT_done
.Lxor_full_019_SLT_true:
    bit_emit_char 'B'
.Lxor_full_019_SLT_done:
    brsge8 .Lxor_full_019_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_019_SGE_done
.Lxor_full_019_SGE_true:
    bit_emit_char 'B'
.Lxor_full_019_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r6; pattern 2; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r0
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r6
    ldi16 r4, 0x550b
    push16 r4
    pop16 r1
    xor r0, r6
    push16 r1
    push16 r6
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_01a_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01a_EQ_done
.Lxor_full_01a_EQ_true:
    bit_emit_char 'B'
.Lxor_full_01a_EQ_done:
    brne8 .Lxor_full_01a_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01a_NE_done
.Lxor_full_01a_NE_true:
    bit_emit_char 'B'
.Lxor_full_01a_NE_done:
    brult8 .Lxor_full_01a_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01a_ULT_done
.Lxor_full_01a_ULT_true:
    bit_emit_char 'B'
.Lxor_full_01a_ULT_done:
    bruge8 .Lxor_full_01a_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01a_UGE_done
.Lxor_full_01a_UGE_true:
    bit_emit_char 'B'
.Lxor_full_01a_UGE_done:
    brslt8 .Lxor_full_01a_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01a_SLT_done
.Lxor_full_01a_SLT_true:
    bit_emit_char 'B'
.Lxor_full_01a_SLT_done:
    brsge8 .Lxor_full_01a_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01a_SGE_done
.Lxor_full_01a_SGE_true:
    bit_emit_char 'B'
.Lxor_full_01a_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r6; pattern 3; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r0
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r6
    ldi16 r4, 0x5665
    push16 r4
    pop16 r2
    xor r0, r6
    push16 r2
    push16 r6
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_01b_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01b_EQ_done
.Lxor_full_01b_EQ_true:
    bit_emit_char 'B'
.Lxor_full_01b_EQ_done:
    brne8 .Lxor_full_01b_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01b_NE_done
.Lxor_full_01b_NE_true:
    bit_emit_char 'B'
.Lxor_full_01b_NE_done:
    brult8 .Lxor_full_01b_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01b_ULT_done
.Lxor_full_01b_ULT_true:
    bit_emit_char 'B'
.Lxor_full_01b_ULT_done:
    bruge8 .Lxor_full_01b_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01b_UGE_done
.Lxor_full_01b_UGE_true:
    bit_emit_char 'B'
.Lxor_full_01b_UGE_done:
    brslt8 .Lxor_full_01b_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01b_SLT_done
.Lxor_full_01b_SLT_true:
    bit_emit_char 'B'
.Lxor_full_01b_SLT_done:
    brsge8 .Lxor_full_01b_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01b_SGE_done
.Lxor_full_01b_SGE_true:
    bit_emit_char 'B'
.Lxor_full_01b_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r7; pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0ff0
    push16 r5
    pop16 r0
    ldi16 r5, 0x3333
    push16 r5
    pop16 r7
    ldi16 r5, 0x58c0
    push16 r5
    pop16 r4
    xor r0, r7
    push16 r4
    push16 r7
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_01c_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01c_EQ_done
.Lxor_full_01c_EQ_true:
    bit_emit_char 'B'
.Lxor_full_01c_EQ_done:
    brne8 .Lxor_full_01c_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01c_NE_done
.Lxor_full_01c_NE_true:
    bit_emit_char 'B'
.Lxor_full_01c_NE_done:
    brult8 .Lxor_full_01c_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01c_ULT_done
.Lxor_full_01c_ULT_true:
    bit_emit_char 'B'
.Lxor_full_01c_ULT_done:
    bruge8 .Lxor_full_01c_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01c_UGE_done
.Lxor_full_01c_UGE_true:
    bit_emit_char 'B'
.Lxor_full_01c_UGE_done:
    brslt8 .Lxor_full_01c_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01c_SLT_done
.Lxor_full_01c_SLT_true:
    bit_emit_char 'B'
.Lxor_full_01c_SLT_done:
    brsge8 .Lxor_full_01c_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01c_SGE_done
.Lxor_full_01c_SGE_true:
    bit_emit_char 'B'
.Lxor_full_01c_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r7; pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r0
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r7
    ldi16 r4, 0x5a1a
    push16 r4
    pop16 r5
    xor r0, r7
    push16 r5
    push16 r7
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_01d_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01d_EQ_done
.Lxor_full_01d_EQ_true:
    bit_emit_char 'B'
.Lxor_full_01d_EQ_done:
    brne8 .Lxor_full_01d_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01d_NE_done
.Lxor_full_01d_NE_true:
    bit_emit_char 'B'
.Lxor_full_01d_NE_done:
    brult8 .Lxor_full_01d_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01d_ULT_done
.Lxor_full_01d_ULT_true:
    bit_emit_char 'B'
.Lxor_full_01d_ULT_done:
    bruge8 .Lxor_full_01d_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01d_UGE_done
.Lxor_full_01d_UGE_true:
    bit_emit_char 'B'
.Lxor_full_01d_UGE_done:
    brslt8 .Lxor_full_01d_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01d_SLT_done
.Lxor_full_01d_SLT_true:
    bit_emit_char 'B'
.Lxor_full_01d_SLT_done:
    brsge8 .Lxor_full_01d_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01d_SGE_done
.Lxor_full_01d_SGE_true:
    bit_emit_char 'B'
.Lxor_full_01d_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r7; pattern 2; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r0
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r7
    ldi16 r4, 0x5b74
    push16 r4
    pop16 r6
    xor r0, r7
    push16 r6
    push16 r7
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_01e_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01e_EQ_done
.Lxor_full_01e_EQ_true:
    bit_emit_char 'B'
.Lxor_full_01e_EQ_done:
    brne8 .Lxor_full_01e_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01e_NE_done
.Lxor_full_01e_NE_true:
    bit_emit_char 'B'
.Lxor_full_01e_NE_done:
    brult8 .Lxor_full_01e_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01e_ULT_done
.Lxor_full_01e_ULT_true:
    bit_emit_char 'B'
.Lxor_full_01e_ULT_done:
    bruge8 .Lxor_full_01e_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01e_UGE_done
.Lxor_full_01e_UGE_true:
    bit_emit_char 'B'
.Lxor_full_01e_UGE_done:
    brslt8 .Lxor_full_01e_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01e_SLT_done
.Lxor_full_01e_SLT_true:
    bit_emit_char 'B'
.Lxor_full_01e_SLT_done:
    brsge8 .Lxor_full_01e_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01e_SGE_done
.Lxor_full_01e_SGE_true:
    bit_emit_char 'B'
.Lxor_full_01e_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r0,r7; pattern 3; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r0
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    ldi16 r4, 0x56c8
    push16 r4
    pop16 r1
    xor r0, r7
    push16 r1
    push16 r7
    push16 r0
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_01f_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01f_EQ_done
.Lxor_full_01f_EQ_true:
    bit_emit_char 'B'
.Lxor_full_01f_EQ_done:
    brne8 .Lxor_full_01f_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01f_NE_done
.Lxor_full_01f_NE_true:
    bit_emit_char 'B'
.Lxor_full_01f_NE_done:
    brult8 .Lxor_full_01f_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01f_ULT_done
.Lxor_full_01f_ULT_true:
    bit_emit_char 'B'
.Lxor_full_01f_ULT_done:
    bruge8 .Lxor_full_01f_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01f_UGE_done
.Lxor_full_01f_UGE_true:
    bit_emit_char 'B'
.Lxor_full_01f_UGE_done:
    brslt8 .Lxor_full_01f_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01f_SLT_done
.Lxor_full_01f_SLT_true:
    bit_emit_char 'B'
.Lxor_full_01f_SLT_done:
    brsge8 .Lxor_full_01f_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_01f_SGE_done
.Lxor_full_01f_SGE_true:
    bit_emit_char 'B'
.Lxor_full_01f_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r0; pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r1
    ldi16 r4, 0x3333
    push16 r4
    pop16 r0
    ldi16 r4, 0x5822
    push16 r4
    pop16 r2
    xor r1, r0
    push16 r2
    push16 r0
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_020_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_020_EQ_done
.Lxor_full_020_EQ_true:
    bit_emit_char 'B'
.Lxor_full_020_EQ_done:
    brne8 .Lxor_full_020_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_020_NE_done
.Lxor_full_020_NE_true:
    bit_emit_char 'B'
.Lxor_full_020_NE_done:
    brult8 .Lxor_full_020_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_020_ULT_done
.Lxor_full_020_ULT_true:
    bit_emit_char 'B'
.Lxor_full_020_ULT_done:
    bruge8 .Lxor_full_020_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_020_UGE_done
.Lxor_full_020_UGE_true:
    bit_emit_char 'B'
.Lxor_full_020_UGE_done:
    brslt8 .Lxor_full_020_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_020_SLT_done
.Lxor_full_020_SLT_true:
    bit_emit_char 'B'
.Lxor_full_020_SLT_done:
    brsge8 .Lxor_full_020_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_020_SGE_done
.Lxor_full_020_SGE_true:
    bit_emit_char 'B'
.Lxor_full_020_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r0; pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r1
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r0
    ldi16 r4, 0x597c
    push16 r4
    pop16 r3
    xor r1, r0
    push16 r3
    push16 r0
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_021_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_021_EQ_done
.Lxor_full_021_EQ_true:
    bit_emit_char 'B'
.Lxor_full_021_EQ_done:
    brne8 .Lxor_full_021_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_021_NE_done
.Lxor_full_021_NE_true:
    bit_emit_char 'B'
.Lxor_full_021_NE_done:
    brult8 .Lxor_full_021_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_021_ULT_done
.Lxor_full_021_ULT_true:
    bit_emit_char 'B'
.Lxor_full_021_ULT_done:
    bruge8 .Lxor_full_021_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_021_UGE_done
.Lxor_full_021_UGE_true:
    bit_emit_char 'B'
.Lxor_full_021_UGE_done:
    brslt8 .Lxor_full_021_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_021_SLT_done
.Lxor_full_021_SLT_true:
    bit_emit_char 'B'
.Lxor_full_021_SLT_done:
    brsge8 .Lxor_full_021_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_021_SGE_done
.Lxor_full_021_SGE_true:
    bit_emit_char 'B'
.Lxor_full_021_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r0; pattern 2; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xdead
    push16 r5
    pop16 r1
    ldi16 r5, 0xbeef
    push16 r5
    pop16 r0
    ldi16 r5, 0x5ad6
    push16 r5
    pop16 r4
    xor r1, r0
    push16 r4
    push16 r0
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_022_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_022_EQ_done
.Lxor_full_022_EQ_true:
    bit_emit_char 'B'
.Lxor_full_022_EQ_done:
    brne8 .Lxor_full_022_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_022_NE_done
.Lxor_full_022_NE_true:
    bit_emit_char 'B'
.Lxor_full_022_NE_done:
    brult8 .Lxor_full_022_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_022_ULT_done
.Lxor_full_022_ULT_true:
    bit_emit_char 'B'
.Lxor_full_022_ULT_done:
    bruge8 .Lxor_full_022_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_022_UGE_done
.Lxor_full_022_UGE_true:
    bit_emit_char 'B'
.Lxor_full_022_UGE_done:
    brslt8 .Lxor_full_022_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_022_SLT_done
.Lxor_full_022_SLT_true:
    bit_emit_char 'B'
.Lxor_full_022_SLT_done:
    brsge8 .Lxor_full_022_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_022_SGE_done
.Lxor_full_022_SGE_true:
    bit_emit_char 'B'
.Lxor_full_022_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r0; pattern 3; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r1
    ldi16 r4, 0x0000
    push16 r4
    pop16 r0
    ldi16 r4, 0x5c30
    push16 r4
    pop16 r5
    xor r1, r0
    push16 r5
    push16 r0
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_023_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_023_EQ_done
.Lxor_full_023_EQ_true:
    bit_emit_char 'B'
.Lxor_full_023_EQ_done:
    brne8 .Lxor_full_023_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_023_NE_done
.Lxor_full_023_NE_true:
    bit_emit_char 'B'
.Lxor_full_023_NE_done:
    brult8 .Lxor_full_023_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_023_ULT_done
.Lxor_full_023_ULT_true:
    bit_emit_char 'B'
.Lxor_full_023_ULT_done:
    bruge8 .Lxor_full_023_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_023_UGE_done
.Lxor_full_023_UGE_true:
    bit_emit_char 'B'
.Lxor_full_023_UGE_done:
    brslt8 .Lxor_full_023_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_023_SLT_done
.Lxor_full_023_SLT_true:
    bit_emit_char 'B'
.Lxor_full_023_SLT_done:
    brsge8 .Lxor_full_023_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_023_SGE_done
.Lxor_full_023_SGE_true:
    bit_emit_char 'B'
.Lxor_full_023_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r1; pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r1
    ldi16 r4, 0x5e8b
    push16 r4
    pop16 r7
    xor r1, r1
    push16 r7
    push16 r1
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_024_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_024_EQ_done
.Lxor_full_024_EQ_true:
    bit_emit_char 'B'
.Lxor_full_024_EQ_done:
    brne8 .Lxor_full_024_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_024_NE_done
.Lxor_full_024_NE_true:
    bit_emit_char 'B'
.Lxor_full_024_NE_done:
    brult8 .Lxor_full_024_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_024_ULT_done
.Lxor_full_024_ULT_true:
    bit_emit_char 'B'
.Lxor_full_024_ULT_done:
    bruge8 .Lxor_full_024_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_024_UGE_done
.Lxor_full_024_UGE_true:
    bit_emit_char 'B'
.Lxor_full_024_UGE_done:
    brslt8 .Lxor_full_024_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_024_SLT_done
.Lxor_full_024_SLT_true:
    bit_emit_char 'B'
.Lxor_full_024_SLT_done:
    brsge8 .Lxor_full_024_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_024_SGE_done
.Lxor_full_024_SGE_true:
    bit_emit_char 'B'
.Lxor_full_024_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r1; pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r1
    ldi16 r4, 0x57dd
    push16 r4
    pop16 r0
    xor r1, r1
    push16 r0
    push16 r1
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_025_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_025_EQ_done
.Lxor_full_025_EQ_true:
    bit_emit_char 'B'
.Lxor_full_025_EQ_done:
    brne8 .Lxor_full_025_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_025_NE_done
.Lxor_full_025_NE_true:
    bit_emit_char 'B'
.Lxor_full_025_NE_done:
    brult8 .Lxor_full_025_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_025_ULT_done
.Lxor_full_025_ULT_true:
    bit_emit_char 'B'
.Lxor_full_025_ULT_done:
    bruge8 .Lxor_full_025_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_025_UGE_done
.Lxor_full_025_UGE_true:
    bit_emit_char 'B'
.Lxor_full_025_UGE_done:
    brslt8 .Lxor_full_025_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_025_SLT_done
.Lxor_full_025_SLT_true:
    bit_emit_char 'B'
.Lxor_full_025_SLT_done:
    brsge8 .Lxor_full_025_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_025_SGE_done
.Lxor_full_025_SGE_true:
    bit_emit_char 'B'
.Lxor_full_025_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r1; pattern 2; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r1
    ldi16 r4, 0x5a38
    push16 r4
    pop16 r2
    xor r1, r1
    push16 r2
    push16 r1
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_026_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_026_EQ_done
.Lxor_full_026_EQ_true:
    bit_emit_char 'B'
.Lxor_full_026_EQ_done:
    brne8 .Lxor_full_026_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_026_NE_done
.Lxor_full_026_NE_true:
    bit_emit_char 'B'
.Lxor_full_026_NE_done:
    brult8 .Lxor_full_026_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_026_ULT_done
.Lxor_full_026_ULT_true:
    bit_emit_char 'B'
.Lxor_full_026_ULT_done:
    bruge8 .Lxor_full_026_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_026_UGE_done
.Lxor_full_026_UGE_true:
    bit_emit_char 'B'
.Lxor_full_026_UGE_done:
    brslt8 .Lxor_full_026_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_026_SLT_done
.Lxor_full_026_SLT_true:
    bit_emit_char 'B'
.Lxor_full_026_SLT_done:
    brsge8 .Lxor_full_026_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_026_SGE_done
.Lxor_full_026_SGE_true:
    bit_emit_char 'B'
.Lxor_full_026_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r1; pattern 3; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r1
    ldi16 r4, 0x5a91
    push16 r4
    pop16 r2
    xor r1, r1
    push16 r2
    push16 r1
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_027_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_027_EQ_done
.Lxor_full_027_EQ_true:
    bit_emit_char 'B'
.Lxor_full_027_EQ_done:
    brne8 .Lxor_full_027_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_027_NE_done
.Lxor_full_027_NE_true:
    bit_emit_char 'B'
.Lxor_full_027_NE_done:
    brult8 .Lxor_full_027_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_027_ULT_done
.Lxor_full_027_ULT_true:
    bit_emit_char 'B'
.Lxor_full_027_ULT_done:
    bruge8 .Lxor_full_027_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_027_UGE_done
.Lxor_full_027_UGE_true:
    bit_emit_char 'B'
.Lxor_full_027_UGE_done:
    brslt8 .Lxor_full_027_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_027_SLT_done
.Lxor_full_027_SLT_true:
    bit_emit_char 'B'
.Lxor_full_027_SLT_done:
    brsge8 .Lxor_full_027_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_027_SGE_done
.Lxor_full_027_SGE_true:
    bit_emit_char 'B'
.Lxor_full_027_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r2; pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x1234
    push16 r5
    pop16 r1
    ldi16 r5, 0x00ff
    push16 r5
    pop16 r2
    ldi16 r5, 0x5cec
    push16 r5
    pop16 r4
    xor r1, r2
    push16 r4
    push16 r2
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_028_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_028_EQ_done
.Lxor_full_028_EQ_true:
    bit_emit_char 'B'
.Lxor_full_028_EQ_done:
    brne8 .Lxor_full_028_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_028_NE_done
.Lxor_full_028_NE_true:
    bit_emit_char 'B'
.Lxor_full_028_NE_done:
    brult8 .Lxor_full_028_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_028_ULT_done
.Lxor_full_028_ULT_true:
    bit_emit_char 'B'
.Lxor_full_028_ULT_done:
    bruge8 .Lxor_full_028_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_028_UGE_done
.Lxor_full_028_UGE_true:
    bit_emit_char 'B'
.Lxor_full_028_UGE_done:
    brslt8 .Lxor_full_028_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_028_SLT_done
.Lxor_full_028_SLT_true:
    bit_emit_char 'B'
.Lxor_full_028_SLT_done:
    brsge8 .Lxor_full_028_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_028_SGE_done
.Lxor_full_028_SGE_true:
    bit_emit_char 'B'
.Lxor_full_028_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r2; pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r1
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r2
    ldi16 r4, 0x5e46
    push16 r4
    pop16 r5
    xor r1, r2
    push16 r5
    push16 r2
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_029_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_029_EQ_done
.Lxor_full_029_EQ_true:
    bit_emit_char 'B'
.Lxor_full_029_EQ_done:
    brne8 .Lxor_full_029_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_029_NE_done
.Lxor_full_029_NE_true:
    bit_emit_char 'B'
.Lxor_full_029_NE_done:
    brult8 .Lxor_full_029_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_029_ULT_done
.Lxor_full_029_ULT_true:
    bit_emit_char 'B'
.Lxor_full_029_ULT_done:
    bruge8 .Lxor_full_029_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_029_UGE_done
.Lxor_full_029_UGE_true:
    bit_emit_char 'B'
.Lxor_full_029_UGE_done:
    brslt8 .Lxor_full_029_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_029_SLT_done
.Lxor_full_029_SLT_true:
    bit_emit_char 'B'
.Lxor_full_029_SLT_done:
    brsge8 .Lxor_full_029_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_029_SGE_done
.Lxor_full_029_SGE_true:
    bit_emit_char 'B'
.Lxor_full_029_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r2; pattern 2; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r1
    ldi16 r4, 0x0000
    push16 r4
    pop16 r2
    ldi16 r4, 0x5fa0
    push16 r4
    pop16 r6
    xor r1, r2
    push16 r6
    push16 r2
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_02a_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02a_EQ_done
.Lxor_full_02a_EQ_true:
    bit_emit_char 'B'
.Lxor_full_02a_EQ_done:
    brne8 .Lxor_full_02a_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02a_NE_done
.Lxor_full_02a_NE_true:
    bit_emit_char 'B'
.Lxor_full_02a_NE_done:
    brult8 .Lxor_full_02a_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02a_ULT_done
.Lxor_full_02a_ULT_true:
    bit_emit_char 'B'
.Lxor_full_02a_ULT_done:
    bruge8 .Lxor_full_02a_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02a_UGE_done
.Lxor_full_02a_UGE_true:
    bit_emit_char 'B'
.Lxor_full_02a_UGE_done:
    brslt8 .Lxor_full_02a_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02a_SLT_done
.Lxor_full_02a_SLT_true:
    bit_emit_char 'B'
.Lxor_full_02a_SLT_done:
    brsge8 .Lxor_full_02a_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02a_SGE_done
.Lxor_full_02a_SGE_true:
    bit_emit_char 'B'
.Lxor_full_02a_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r2; pattern 3; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r1
    ldi16 r4, 0x3333
    push16 r4
    pop16 r2
    ldi16 r4, 0x60fa
    push16 r4
    pop16 r7
    xor r1, r2
    push16 r7
    push16 r2
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_02b_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02b_EQ_done
.Lxor_full_02b_EQ_true:
    bit_emit_char 'B'
.Lxor_full_02b_EQ_done:
    brne8 .Lxor_full_02b_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02b_NE_done
.Lxor_full_02b_NE_true:
    bit_emit_char 'B'
.Lxor_full_02b_NE_done:
    brult8 .Lxor_full_02b_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02b_ULT_done
.Lxor_full_02b_ULT_true:
    bit_emit_char 'B'
.Lxor_full_02b_ULT_done:
    bruge8 .Lxor_full_02b_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02b_UGE_done
.Lxor_full_02b_UGE_true:
    bit_emit_char 'B'
.Lxor_full_02b_UGE_done:
    brslt8 .Lxor_full_02b_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02b_SLT_done
.Lxor_full_02b_SLT_true:
    bit_emit_char 'B'
.Lxor_full_02b_SLT_done:
    brsge8 .Lxor_full_02b_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02b_SGE_done
.Lxor_full_02b_SGE_true:
    bit_emit_char 'B'
.Lxor_full_02b_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r3; pattern 0; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r1
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r3
    ldi16 r4, 0x5c4e
    push16 r4
    pop16 r2
    xor r1, r3
    push16 r2
    push16 r3
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_02c_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02c_EQ_done
.Lxor_full_02c_EQ_true:
    bit_emit_char 'B'
.Lxor_full_02c_EQ_done:
    brne8 .Lxor_full_02c_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02c_NE_done
.Lxor_full_02c_NE_true:
    bit_emit_char 'B'
.Lxor_full_02c_NE_done:
    brult8 .Lxor_full_02c_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02c_ULT_done
.Lxor_full_02c_ULT_true:
    bit_emit_char 'B'
.Lxor_full_02c_ULT_done:
    bruge8 .Lxor_full_02c_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02c_UGE_done
.Lxor_full_02c_UGE_true:
    bit_emit_char 'B'
.Lxor_full_02c_UGE_done:
    brslt8 .Lxor_full_02c_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02c_SLT_done
.Lxor_full_02c_SLT_true:
    bit_emit_char 'B'
.Lxor_full_02c_SLT_done:
    brsge8 .Lxor_full_02c_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02c_SGE_done
.Lxor_full_02c_SGE_true:
    bit_emit_char 'B'
.Lxor_full_02c_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r3; pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r1
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r3
    ldi16 r4, 0x5ca7
    push16 r4
    pop16 r2
    xor r1, r3
    push16 r2
    push16 r3
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_02d_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02d_EQ_done
.Lxor_full_02d_EQ_true:
    bit_emit_char 'B'
.Lxor_full_02d_EQ_done:
    brne8 .Lxor_full_02d_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02d_NE_done
.Lxor_full_02d_NE_true:
    bit_emit_char 'B'
.Lxor_full_02d_NE_done:
    brult8 .Lxor_full_02d_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02d_ULT_done
.Lxor_full_02d_ULT_true:
    bit_emit_char 'B'
.Lxor_full_02d_ULT_done:
    bruge8 .Lxor_full_02d_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02d_UGE_done
.Lxor_full_02d_UGE_true:
    bit_emit_char 'B'
.Lxor_full_02d_UGE_done:
    brslt8 .Lxor_full_02d_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02d_SLT_done
.Lxor_full_02d_SLT_true:
    bit_emit_char 'B'
.Lxor_full_02d_SLT_done:
    brsge8 .Lxor_full_02d_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02d_SGE_done
.Lxor_full_02d_SGE_true:
    bit_emit_char 'B'
.Lxor_full_02d_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r3; pattern 2; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x8001
    push16 r5
    pop16 r1
    ldi16 r5, 0x7ffe
    push16 r5
    pop16 r3
    ldi16 r5, 0x5f02
    push16 r5
    pop16 r4
    xor r1, r3
    push16 r4
    push16 r3
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_02e_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02e_EQ_done
.Lxor_full_02e_EQ_true:
    bit_emit_char 'B'
.Lxor_full_02e_EQ_done:
    brne8 .Lxor_full_02e_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02e_NE_done
.Lxor_full_02e_NE_true:
    bit_emit_char 'B'
.Lxor_full_02e_NE_done:
    brult8 .Lxor_full_02e_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02e_ULT_done
.Lxor_full_02e_ULT_true:
    bit_emit_char 'B'
.Lxor_full_02e_ULT_done:
    bruge8 .Lxor_full_02e_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02e_UGE_done
.Lxor_full_02e_UGE_true:
    bit_emit_char 'B'
.Lxor_full_02e_UGE_done:
    brslt8 .Lxor_full_02e_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02e_SLT_done
.Lxor_full_02e_SLT_true:
    bit_emit_char 'B'
.Lxor_full_02e_SLT_done:
    brsge8 .Lxor_full_02e_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02e_SGE_done
.Lxor_full_02e_SGE_true:
    bit_emit_char 'B'
.Lxor_full_02e_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r3; pattern 3; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r1
    ldi16 r5, 0xffff
    push16 r5
    pop16 r3
    ldi16 r5, 0x5f5b
    push16 r5
    pop16 r4
    xor r1, r3
    push16 r4
    push16 r3
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_02f_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02f_EQ_done
.Lxor_full_02f_EQ_true:
    bit_emit_char 'B'
.Lxor_full_02f_EQ_done:
    brne8 .Lxor_full_02f_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02f_NE_done
.Lxor_full_02f_NE_true:
    bit_emit_char 'B'
.Lxor_full_02f_NE_done:
    brult8 .Lxor_full_02f_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02f_ULT_done
.Lxor_full_02f_ULT_true:
    bit_emit_char 'B'
.Lxor_full_02f_ULT_done:
    bruge8 .Lxor_full_02f_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02f_UGE_done
.Lxor_full_02f_UGE_true:
    bit_emit_char 'B'
.Lxor_full_02f_UGE_done:
    brslt8 .Lxor_full_02f_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02f_SLT_done
.Lxor_full_02f_SLT_true:
    bit_emit_char 'B'
.Lxor_full_02f_SLT_done:
    brsge8 .Lxor_full_02f_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_02f_SGE_done
.Lxor_full_02f_SGE_true:
    bit_emit_char 'B'
.Lxor_full_02f_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r4; pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0xdead
    push16 r5
    pop16 r1
    ldi16 r5, 0xbeef
    push16 r5
    pop16 r4
    ldi16 r5, 0x61b6
    push16 r5
    pop16 r6
    xor r1, r4
    push16 r6
    push16 r4
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_030_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_030_EQ_done
.Lxor_full_030_EQ_true:
    bit_emit_char 'B'
.Lxor_full_030_EQ_done:
    brne8 .Lxor_full_030_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_030_NE_done
.Lxor_full_030_NE_true:
    bit_emit_char 'B'
.Lxor_full_030_NE_done:
    brult8 .Lxor_full_030_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_030_ULT_done
.Lxor_full_030_ULT_true:
    bit_emit_char 'B'
.Lxor_full_030_ULT_done:
    bruge8 .Lxor_full_030_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_030_UGE_done
.Lxor_full_030_UGE_true:
    bit_emit_char 'B'
.Lxor_full_030_UGE_done:
    brslt8 .Lxor_full_030_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_030_SLT_done
.Lxor_full_030_SLT_true:
    bit_emit_char 'B'
.Lxor_full_030_SLT_done:
    brsge8 .Lxor_full_030_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_030_SGE_done
.Lxor_full_030_SGE_true:
    bit_emit_char 'B'
.Lxor_full_030_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r4; pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r1
    ldi16 r5, 0x0000
    push16 r5
    pop16 r4
    ldi16 r5, 0x6310
    push16 r5
    pop16 r7
    xor r1, r4
    push16 r7
    push16 r4
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_031_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_031_EQ_done
.Lxor_full_031_EQ_true:
    bit_emit_char 'B'
.Lxor_full_031_EQ_done:
    brne8 .Lxor_full_031_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_031_NE_done
.Lxor_full_031_NE_true:
    bit_emit_char 'B'
.Lxor_full_031_NE_done:
    brult8 .Lxor_full_031_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_031_ULT_done
.Lxor_full_031_ULT_true:
    bit_emit_char 'B'
.Lxor_full_031_ULT_done:
    bruge8 .Lxor_full_031_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_031_UGE_done
.Lxor_full_031_UGE_true:
    bit_emit_char 'B'
.Lxor_full_031_UGE_done:
    brslt8 .Lxor_full_031_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_031_SLT_done
.Lxor_full_031_SLT_true:
    bit_emit_char 'B'
.Lxor_full_031_SLT_done:
    brsge8 .Lxor_full_031_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_031_SGE_done
.Lxor_full_031_SGE_true:
    bit_emit_char 'B'
.Lxor_full_031_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r4; pattern 2; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0ff0
    push16 r5
    pop16 r1
    ldi16 r5, 0x3333
    push16 r5
    pop16 r4
    ldi16 r5, 0x5c62
    push16 r5
    pop16 r0
    xor r1, r4
    push16 r0
    push16 r4
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_032_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_032_EQ_done
.Lxor_full_032_EQ_true:
    bit_emit_char 'B'
.Lxor_full_032_EQ_done:
    brne8 .Lxor_full_032_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_032_NE_done
.Lxor_full_032_NE_true:
    bit_emit_char 'B'
.Lxor_full_032_NE_done:
    brult8 .Lxor_full_032_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_032_ULT_done
.Lxor_full_032_ULT_true:
    bit_emit_char 'B'
.Lxor_full_032_ULT_done:
    bruge8 .Lxor_full_032_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_032_UGE_done
.Lxor_full_032_UGE_true:
    bit_emit_char 'B'
.Lxor_full_032_UGE_done:
    brslt8 .Lxor_full_032_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_032_SLT_done
.Lxor_full_032_SLT_true:
    bit_emit_char 'B'
.Lxor_full_032_SLT_done:
    brsge8 .Lxor_full_032_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_032_SGE_done
.Lxor_full_032_SGE_true:
    bit_emit_char 'B'
.Lxor_full_032_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r4; pattern 3; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x1234
    push16 r5
    pop16 r1
    ldi16 r5, 0x00ff
    push16 r5
    pop16 r4
    ldi16 r5, 0x5ebd
    push16 r5
    pop16 r2
    xor r1, r4
    push16 r2
    push16 r4
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_033_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_033_EQ_done
.Lxor_full_033_EQ_true:
    bit_emit_char 'B'
.Lxor_full_033_EQ_done:
    brne8 .Lxor_full_033_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_033_NE_done
.Lxor_full_033_NE_true:
    bit_emit_char 'B'
.Lxor_full_033_NE_done:
    brult8 .Lxor_full_033_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_033_ULT_done
.Lxor_full_033_ULT_true:
    bit_emit_char 'B'
.Lxor_full_033_ULT_done:
    bruge8 .Lxor_full_033_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_033_UGE_done
.Lxor_full_033_UGE_true:
    bit_emit_char 'B'
.Lxor_full_033_UGE_done:
    brslt8 .Lxor_full_033_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_033_SLT_done
.Lxor_full_033_SLT_true:
    bit_emit_char 'B'
.Lxor_full_033_SLT_done:
    brsge8 .Lxor_full_033_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_033_SGE_done
.Lxor_full_033_SGE_true:
    bit_emit_char 'B'
.Lxor_full_033_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r5; pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r1
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r5
    ldi16 r4, 0x6017
    push16 r4
    pop16 r3
    xor r1, r5
    push16 r3
    push16 r5
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_034_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_034_EQ_done
.Lxor_full_034_EQ_true:
    bit_emit_char 'B'
.Lxor_full_034_EQ_done:
    brne8 .Lxor_full_034_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_034_NE_done
.Lxor_full_034_NE_true:
    bit_emit_char 'B'
.Lxor_full_034_NE_done:
    brult8 .Lxor_full_034_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_034_ULT_done
.Lxor_full_034_ULT_true:
    bit_emit_char 'B'
.Lxor_full_034_ULT_done:
    bruge8 .Lxor_full_034_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_034_UGE_done
.Lxor_full_034_UGE_true:
    bit_emit_char 'B'
.Lxor_full_034_UGE_done:
    brslt8 .Lxor_full_034_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_034_SLT_done
.Lxor_full_034_SLT_true:
    bit_emit_char 'B'
.Lxor_full_034_SLT_done:
    brsge8 .Lxor_full_034_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_034_SGE_done
.Lxor_full_034_SGE_true:
    bit_emit_char 'B'
.Lxor_full_034_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r5; pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x8001
    push16 r6
    pop16 r1
    ldi16 r6, 0x7ffe
    push16 r6
    pop16 r5
    ldi16 r6, 0x6171
    push16 r6
    pop16 r4
    xor r1, r5
    push16 r4
    push16 r5
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_035_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_035_EQ_done
.Lxor_full_035_EQ_true:
    bit_emit_char 'B'
.Lxor_full_035_EQ_done:
    brne8 .Lxor_full_035_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_035_NE_done
.Lxor_full_035_NE_true:
    bit_emit_char 'B'
.Lxor_full_035_NE_done:
    brult8 .Lxor_full_035_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_035_ULT_done
.Lxor_full_035_ULT_true:
    bit_emit_char 'B'
.Lxor_full_035_ULT_done:
    bruge8 .Lxor_full_035_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_035_UGE_done
.Lxor_full_035_UGE_true:
    bit_emit_char 'B'
.Lxor_full_035_UGE_done:
    brslt8 .Lxor_full_035_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_035_SLT_done
.Lxor_full_035_SLT_true:
    bit_emit_char 'B'
.Lxor_full_035_SLT_done:
    brsge8 .Lxor_full_035_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_035_SGE_done
.Lxor_full_035_SGE_true:
    bit_emit_char 'B'
.Lxor_full_035_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r5; pattern 2; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r1
    ldi16 r4, 0xffff
    push16 r4
    pop16 r5
    ldi16 r4, 0x63cc
    push16 r4
    pop16 r6
    xor r1, r5
    push16 r6
    push16 r5
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_036_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_036_EQ_done
.Lxor_full_036_EQ_true:
    bit_emit_char 'B'
.Lxor_full_036_EQ_done:
    brne8 .Lxor_full_036_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_036_NE_done
.Lxor_full_036_NE_true:
    bit_emit_char 'B'
.Lxor_full_036_NE_done:
    brult8 .Lxor_full_036_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_036_ULT_done
.Lxor_full_036_ULT_true:
    bit_emit_char 'B'
.Lxor_full_036_ULT_done:
    bruge8 .Lxor_full_036_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_036_UGE_done
.Lxor_full_036_UGE_true:
    bit_emit_char 'B'
.Lxor_full_036_UGE_done:
    brslt8 .Lxor_full_036_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_036_SLT_done
.Lxor_full_036_SLT_true:
    bit_emit_char 'B'
.Lxor_full_036_SLT_done:
    brsge8 .Lxor_full_036_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_036_SGE_done
.Lxor_full_036_SGE_true:
    bit_emit_char 'B'
.Lxor_full_036_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r5; pattern 3; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r1
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r5
    ldi16 r4, 0x6425
    push16 r4
    pop16 r6
    xor r1, r5
    push16 r6
    push16 r5
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_037_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_037_EQ_done
.Lxor_full_037_EQ_true:
    bit_emit_char 'B'
.Lxor_full_037_EQ_done:
    brne8 .Lxor_full_037_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_037_NE_done
.Lxor_full_037_NE_true:
    bit_emit_char 'B'
.Lxor_full_037_NE_done:
    brult8 .Lxor_full_037_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_037_ULT_done
.Lxor_full_037_ULT_true:
    bit_emit_char 'B'
.Lxor_full_037_ULT_done:
    bruge8 .Lxor_full_037_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_037_UGE_done
.Lxor_full_037_UGE_true:
    bit_emit_char 'B'
.Lxor_full_037_UGE_done:
    brslt8 .Lxor_full_037_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_037_SLT_done
.Lxor_full_037_SLT_true:
    bit_emit_char 'B'
.Lxor_full_037_SLT_done:
    brsge8 .Lxor_full_037_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_037_SGE_done
.Lxor_full_037_SGE_true:
    bit_emit_char 'B'
.Lxor_full_037_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r6; pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r1
    ldi16 r4, 0x0000
    push16 r4
    pop16 r6
    ldi16 r4, 0x5e78
    push16 r4
    pop16 r0
    xor r1, r6
    push16 r0
    push16 r6
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_038_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_038_EQ_done
.Lxor_full_038_EQ_true:
    bit_emit_char 'B'
.Lxor_full_038_EQ_done:
    brne8 .Lxor_full_038_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_038_NE_done
.Lxor_full_038_NE_true:
    bit_emit_char 'B'
.Lxor_full_038_NE_done:
    brult8 .Lxor_full_038_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_038_ULT_done
.Lxor_full_038_ULT_true:
    bit_emit_char 'B'
.Lxor_full_038_ULT_done:
    bruge8 .Lxor_full_038_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_038_UGE_done
.Lxor_full_038_UGE_true:
    bit_emit_char 'B'
.Lxor_full_038_UGE_done:
    brslt8 .Lxor_full_038_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_038_SLT_done
.Lxor_full_038_SLT_true:
    bit_emit_char 'B'
.Lxor_full_038_SLT_done:
    brsge8 .Lxor_full_038_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_038_SGE_done
.Lxor_full_038_SGE_true:
    bit_emit_char 'B'
.Lxor_full_038_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r6; pattern 1; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r1
    ldi16 r4, 0x3333
    push16 r4
    pop16 r6
    ldi16 r4, 0x60d3
    push16 r4
    pop16 r2
    xor r1, r6
    push16 r2
    push16 r6
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_039_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_039_EQ_done
.Lxor_full_039_EQ_true:
    bit_emit_char 'B'
.Lxor_full_039_EQ_done:
    brne8 .Lxor_full_039_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_039_NE_done
.Lxor_full_039_NE_true:
    bit_emit_char 'B'
.Lxor_full_039_NE_done:
    brult8 .Lxor_full_039_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_039_ULT_done
.Lxor_full_039_ULT_true:
    bit_emit_char 'B'
.Lxor_full_039_ULT_done:
    bruge8 .Lxor_full_039_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_039_UGE_done
.Lxor_full_039_UGE_true:
    bit_emit_char 'B'
.Lxor_full_039_UGE_done:
    brslt8 .Lxor_full_039_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_039_SLT_done
.Lxor_full_039_SLT_true:
    bit_emit_char 'B'
.Lxor_full_039_SLT_done:
    brsge8 .Lxor_full_039_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_039_SGE_done
.Lxor_full_039_SGE_true:
    bit_emit_char 'B'
.Lxor_full_039_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r6; pattern 2; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r1
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r6
    ldi16 r4, 0x612c
    push16 r4
    pop16 r2
    xor r1, r6
    push16 r2
    push16 r6
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_03a_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03a_EQ_done
.Lxor_full_03a_EQ_true:
    bit_emit_char 'B'
.Lxor_full_03a_EQ_done:
    brne8 .Lxor_full_03a_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03a_NE_done
.Lxor_full_03a_NE_true:
    bit_emit_char 'B'
.Lxor_full_03a_NE_done:
    brult8 .Lxor_full_03a_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03a_ULT_done
.Lxor_full_03a_ULT_true:
    bit_emit_char 'B'
.Lxor_full_03a_ULT_done:
    bruge8 .Lxor_full_03a_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03a_UGE_done
.Lxor_full_03a_UGE_true:
    bit_emit_char 'B'
.Lxor_full_03a_UGE_done:
    brslt8 .Lxor_full_03a_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03a_SLT_done
.Lxor_full_03a_SLT_true:
    bit_emit_char 'B'
.Lxor_full_03a_SLT_done:
    brsge8 .Lxor_full_03a_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03a_SGE_done
.Lxor_full_03a_SGE_true:
    bit_emit_char 'B'
.Lxor_full_03a_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r6; pattern 3; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r1
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r6
    ldi16 r4, 0x6286
    push16 r4
    pop16 r3
    xor r1, r6
    push16 r3
    push16 r6
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_03b_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03b_EQ_done
.Lxor_full_03b_EQ_true:
    bit_emit_char 'B'
.Lxor_full_03b_EQ_done:
    brne8 .Lxor_full_03b_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03b_NE_done
.Lxor_full_03b_NE_true:
    bit_emit_char 'B'
.Lxor_full_03b_NE_done:
    brult8 .Lxor_full_03b_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03b_ULT_done
.Lxor_full_03b_ULT_true:
    bit_emit_char 'B'
.Lxor_full_03b_ULT_done:
    bruge8 .Lxor_full_03b_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03b_UGE_done
.Lxor_full_03b_UGE_true:
    bit_emit_char 'B'
.Lxor_full_03b_UGE_done:
    brslt8 .Lxor_full_03b_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03b_SLT_done
.Lxor_full_03b_SLT_true:
    bit_emit_char 'B'
.Lxor_full_03b_SLT_done:
    brsge8 .Lxor_full_03b_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03b_SGE_done
.Lxor_full_03b_SGE_true:
    bit_emit_char 'B'
.Lxor_full_03b_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r7; pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r1
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r7
    ldi16 r4, 0x64e1
    push16 r4
    pop16 r5
    xor r1, r7
    push16 r5
    push16 r7
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_03c_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03c_EQ_done
.Lxor_full_03c_EQ_true:
    bit_emit_char 'B'
.Lxor_full_03c_EQ_done:
    brne8 .Lxor_full_03c_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03c_NE_done
.Lxor_full_03c_NE_true:
    bit_emit_char 'B'
.Lxor_full_03c_NE_done:
    brult8 .Lxor_full_03c_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03c_ULT_done
.Lxor_full_03c_ULT_true:
    bit_emit_char 'B'
.Lxor_full_03c_ULT_done:
    bruge8 .Lxor_full_03c_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03c_UGE_done
.Lxor_full_03c_UGE_true:
    bit_emit_char 'B'
.Lxor_full_03c_UGE_done:
    brslt8 .Lxor_full_03c_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03c_SLT_done
.Lxor_full_03c_SLT_true:
    bit_emit_char 'B'
.Lxor_full_03c_SLT_done:
    brsge8 .Lxor_full_03c_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03c_SGE_done
.Lxor_full_03c_SGE_true:
    bit_emit_char 'B'
.Lxor_full_03c_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r7; pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r1
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    ldi16 r4, 0x663b
    push16 r4
    pop16 r6
    xor r1, r7
    push16 r6
    push16 r7
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_03d_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03d_EQ_done
.Lxor_full_03d_EQ_true:
    bit_emit_char 'B'
.Lxor_full_03d_EQ_done:
    brne8 .Lxor_full_03d_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03d_NE_done
.Lxor_full_03d_NE_true:
    bit_emit_char 'B'
.Lxor_full_03d_NE_done:
    brult8 .Lxor_full_03d_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03d_ULT_done
.Lxor_full_03d_ULT_true:
    bit_emit_char 'B'
.Lxor_full_03d_ULT_done:
    bruge8 .Lxor_full_03d_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03d_UGE_done
.Lxor_full_03d_UGE_true:
    bit_emit_char 'B'
.Lxor_full_03d_UGE_done:
    brslt8 .Lxor_full_03d_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03d_SLT_done
.Lxor_full_03d_SLT_true:
    bit_emit_char 'B'
.Lxor_full_03d_SLT_done:
    brsge8 .Lxor_full_03d_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03d_SGE_done
.Lxor_full_03d_SGE_true:
    bit_emit_char 'B'
.Lxor_full_03d_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r7; pattern 2; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r1
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r7
    ldi16 r4, 0x608e
    push16 r4
    pop16 r0
    xor r1, r7
    push16 r0
    push16 r7
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_03e_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03e_EQ_done
.Lxor_full_03e_EQ_true:
    bit_emit_char 'B'
.Lxor_full_03e_EQ_done:
    brne8 .Lxor_full_03e_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03e_NE_done
.Lxor_full_03e_NE_true:
    bit_emit_char 'B'
.Lxor_full_03e_NE_done:
    brult8 .Lxor_full_03e_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03e_ULT_done
.Lxor_full_03e_ULT_true:
    bit_emit_char 'B'
.Lxor_full_03e_ULT_done:
    bruge8 .Lxor_full_03e_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03e_UGE_done
.Lxor_full_03e_UGE_true:
    bit_emit_char 'B'
.Lxor_full_03e_UGE_done:
    brslt8 .Lxor_full_03e_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03e_SLT_done
.Lxor_full_03e_SLT_true:
    bit_emit_char 'B'
.Lxor_full_03e_SLT_done:
    brsge8 .Lxor_full_03e_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03e_SGE_done
.Lxor_full_03e_SGE_true:
    bit_emit_char 'B'
.Lxor_full_03e_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r1,r7; pattern 3; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r1
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r7
    ldi16 r4, 0x60e7
    push16 r4
    pop16 r0
    xor r1, r7
    push16 r0
    push16 r7
    push16 r1
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_03f_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03f_EQ_done
.Lxor_full_03f_EQ_true:
    bit_emit_char 'B'
.Lxor_full_03f_EQ_done:
    brne8 .Lxor_full_03f_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03f_NE_done
.Lxor_full_03f_NE_true:
    bit_emit_char 'B'
.Lxor_full_03f_NE_done:
    brult8 .Lxor_full_03f_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03f_ULT_done
.Lxor_full_03f_ULT_true:
    bit_emit_char 'B'
.Lxor_full_03f_ULT_done:
    bruge8 .Lxor_full_03f_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03f_UGE_done
.Lxor_full_03f_UGE_true:
    bit_emit_char 'B'
.Lxor_full_03f_UGE_done:
    brslt8 .Lxor_full_03f_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03f_SLT_done
.Lxor_full_03f_SLT_true:
    bit_emit_char 'B'
.Lxor_full_03f_SLT_done:
    brsge8 .Lxor_full_03f_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_03f_SGE_done
.Lxor_full_03f_SGE_true:
    bit_emit_char 'B'
.Lxor_full_03f_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r0; pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r2
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r0
    ldi16 r4, 0x6443
    push16 r4
    pop16 r3
    xor r2, r0
    push16 r3
    push16 r0
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_040_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_040_EQ_done
.Lxor_full_040_EQ_true:
    bit_emit_char 'B'
.Lxor_full_040_EQ_done:
    brne8 .Lxor_full_040_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_040_NE_done
.Lxor_full_040_NE_true:
    bit_emit_char 'B'
.Lxor_full_040_NE_done:
    brult8 .Lxor_full_040_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_040_ULT_done
.Lxor_full_040_ULT_true:
    bit_emit_char 'B'
.Lxor_full_040_ULT_done:
    bruge8 .Lxor_full_040_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_040_UGE_done
.Lxor_full_040_UGE_true:
    bit_emit_char 'B'
.Lxor_full_040_UGE_done:
    brslt8 .Lxor_full_040_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_040_SLT_done
.Lxor_full_040_SLT_true:
    bit_emit_char 'B'
.Lxor_full_040_SLT_done:
    brsge8 .Lxor_full_040_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_040_SGE_done
.Lxor_full_040_SGE_true:
    bit_emit_char 'B'
.Lxor_full_040_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r0; pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r2
    ldi16 r5, 0xffff
    push16 r5
    pop16 r0
    ldi16 r5, 0x659d
    push16 r5
    pop16 r4
    xor r2, r0
    push16 r4
    push16 r0
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_041_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_041_EQ_done
.Lxor_full_041_EQ_true:
    bit_emit_char 'B'
.Lxor_full_041_EQ_done:
    brne8 .Lxor_full_041_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_041_NE_done
.Lxor_full_041_NE_true:
    bit_emit_char 'B'
.Lxor_full_041_NE_done:
    brult8 .Lxor_full_041_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_041_ULT_done
.Lxor_full_041_ULT_true:
    bit_emit_char 'B'
.Lxor_full_041_ULT_done:
    bruge8 .Lxor_full_041_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_041_UGE_done
.Lxor_full_041_UGE_true:
    bit_emit_char 'B'
.Lxor_full_041_UGE_done:
    brslt8 .Lxor_full_041_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_041_SLT_done
.Lxor_full_041_SLT_true:
    bit_emit_char 'B'
.Lxor_full_041_SLT_done:
    brsge8 .Lxor_full_041_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_041_SGE_done
.Lxor_full_041_SGE_true:
    bit_emit_char 'B'
.Lxor_full_041_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r0; pattern 2; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r2
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r0
    ldi16 r4, 0x66f7
    push16 r4
    pop16 r5
    xor r2, r0
    push16 r5
    push16 r0
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_042_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_042_EQ_done
.Lxor_full_042_EQ_true:
    bit_emit_char 'B'
.Lxor_full_042_EQ_done:
    brne8 .Lxor_full_042_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_042_NE_done
.Lxor_full_042_NE_true:
    bit_emit_char 'B'
.Lxor_full_042_NE_done:
    brult8 .Lxor_full_042_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_042_ULT_done
.Lxor_full_042_ULT_true:
    bit_emit_char 'B'
.Lxor_full_042_ULT_done:
    bruge8 .Lxor_full_042_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_042_UGE_done
.Lxor_full_042_UGE_true:
    bit_emit_char 'B'
.Lxor_full_042_UGE_done:
    brslt8 .Lxor_full_042_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_042_SLT_done
.Lxor_full_042_SLT_true:
    bit_emit_char 'B'
.Lxor_full_042_SLT_done:
    brsge8 .Lxor_full_042_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_042_SGE_done
.Lxor_full_042_SGE_true:
    bit_emit_char 'B'
.Lxor_full_042_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r0; pattern 3; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r2
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r0
    ldi16 r4, 0x6851
    push16 r4
    pop16 r6
    xor r2, r0
    push16 r6
    push16 r0
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_043_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_043_EQ_done
.Lxor_full_043_EQ_true:
    bit_emit_char 'B'
.Lxor_full_043_EQ_done:
    brne8 .Lxor_full_043_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_043_NE_done
.Lxor_full_043_NE_true:
    bit_emit_char 'B'
.Lxor_full_043_NE_done:
    brult8 .Lxor_full_043_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_043_ULT_done
.Lxor_full_043_ULT_true:
    bit_emit_char 'B'
.Lxor_full_043_ULT_done:
    bruge8 .Lxor_full_043_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_043_UGE_done
.Lxor_full_043_UGE_true:
    bit_emit_char 'B'
.Lxor_full_043_UGE_done:
    brslt8 .Lxor_full_043_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_043_SLT_done
.Lxor_full_043_SLT_true:
    bit_emit_char 'B'
.Lxor_full_043_SLT_done:
    brsge8 .Lxor_full_043_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_043_SGE_done
.Lxor_full_043_SGE_true:
    bit_emit_char 'B'
.Lxor_full_043_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r1; pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r2
    ldi16 r4, 0x3333
    push16 r4
    pop16 r1
    ldi16 r4, 0x62a4
    push16 r4
    pop16 r0
    xor r2, r1
    push16 r0
    push16 r1
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_044_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_044_EQ_done
.Lxor_full_044_EQ_true:
    bit_emit_char 'B'
.Lxor_full_044_EQ_done:
    brne8 .Lxor_full_044_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_044_NE_done
.Lxor_full_044_NE_true:
    bit_emit_char 'B'
.Lxor_full_044_NE_done:
    brult8 .Lxor_full_044_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_044_ULT_done
.Lxor_full_044_ULT_true:
    bit_emit_char 'B'
.Lxor_full_044_ULT_done:
    bruge8 .Lxor_full_044_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_044_UGE_done
.Lxor_full_044_UGE_true:
    bit_emit_char 'B'
.Lxor_full_044_UGE_done:
    brslt8 .Lxor_full_044_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_044_SLT_done
.Lxor_full_044_SLT_true:
    bit_emit_char 'B'
.Lxor_full_044_SLT_done:
    brsge8 .Lxor_full_044_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_044_SGE_done
.Lxor_full_044_SGE_true:
    bit_emit_char 'B'
.Lxor_full_044_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r1; pattern 1; guard r3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r2
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r1
    ldi16 r4, 0x6600
    push16 r4
    pop16 r3
    xor r2, r1
    push16 r3
    push16 r1
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_045_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_045_EQ_done
.Lxor_full_045_EQ_true:
    bit_emit_char 'B'
.Lxor_full_045_EQ_done:
    brne8 .Lxor_full_045_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_045_NE_done
.Lxor_full_045_NE_true:
    bit_emit_char 'B'
.Lxor_full_045_NE_done:
    brult8 .Lxor_full_045_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_045_ULT_done
.Lxor_full_045_ULT_true:
    bit_emit_char 'B'
.Lxor_full_045_ULT_done:
    bruge8 .Lxor_full_045_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_045_UGE_done
.Lxor_full_045_UGE_true:
    bit_emit_char 'B'
.Lxor_full_045_UGE_done:
    brslt8 .Lxor_full_045_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_045_SLT_done
.Lxor_full_045_SLT_true:
    bit_emit_char 'B'
.Lxor_full_045_SLT_done:
    brsge8 .Lxor_full_045_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_045_SGE_done
.Lxor_full_045_SGE_true:
    bit_emit_char 'B'
.Lxor_full_045_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r1; pattern 2; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r2
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r1
    ldi16 r4, 0x6659
    push16 r4
    pop16 r3
    xor r2, r1
    push16 r3
    push16 r1
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_046_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_046_EQ_done
.Lxor_full_046_EQ_true:
    bit_emit_char 'B'
.Lxor_full_046_EQ_done:
    brne8 .Lxor_full_046_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_046_NE_done
.Lxor_full_046_NE_true:
    bit_emit_char 'B'
.Lxor_full_046_NE_done:
    brult8 .Lxor_full_046_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_046_ULT_done
.Lxor_full_046_ULT_true:
    bit_emit_char 'B'
.Lxor_full_046_ULT_done:
    bruge8 .Lxor_full_046_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_046_UGE_done
.Lxor_full_046_UGE_true:
    bit_emit_char 'B'
.Lxor_full_046_UGE_done:
    brslt8 .Lxor_full_046_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_046_SLT_done
.Lxor_full_046_SLT_true:
    bit_emit_char 'B'
.Lxor_full_046_SLT_done:
    brsge8 .Lxor_full_046_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_046_SGE_done
.Lxor_full_046_SGE_true:
    bit_emit_char 'B'
.Lxor_full_046_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r1; pattern 3; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r2
    ldi16 r4, 0x0000
    push16 r4
    pop16 r1
    ldi16 r4, 0x66b2
    push16 r4
    pop16 r3
    xor r2, r1
    push16 r3
    push16 r1
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_047_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_047_EQ_done
.Lxor_full_047_EQ_true:
    bit_emit_char 'B'
.Lxor_full_047_EQ_done:
    brne8 .Lxor_full_047_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_047_NE_done
.Lxor_full_047_NE_true:
    bit_emit_char 'B'
.Lxor_full_047_NE_done:
    brult8 .Lxor_full_047_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_047_ULT_done
.Lxor_full_047_ULT_true:
    bit_emit_char 'B'
.Lxor_full_047_ULT_done:
    bruge8 .Lxor_full_047_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_047_UGE_done
.Lxor_full_047_UGE_true:
    bit_emit_char 'B'
.Lxor_full_047_UGE_done:
    brslt8 .Lxor_full_047_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_047_SLT_done
.Lxor_full_047_SLT_true:
    bit_emit_char 'B'
.Lxor_full_047_SLT_done:
    brsge8 .Lxor_full_047_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_047_SGE_done
.Lxor_full_047_SGE_true:
    bit_emit_char 'B'
.Lxor_full_047_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r2; pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r2
    ldi16 r4, 0x690d
    push16 r4
    pop16 r5
    xor r2, r2
    push16 r5
    push16 r2
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_048_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_048_EQ_done
.Lxor_full_048_EQ_true:
    bit_emit_char 'B'
.Lxor_full_048_EQ_done:
    brne8 .Lxor_full_048_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_048_NE_done
.Lxor_full_048_NE_true:
    bit_emit_char 'B'
.Lxor_full_048_NE_done:
    brult8 .Lxor_full_048_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_048_ULT_done
.Lxor_full_048_ULT_true:
    bit_emit_char 'B'
.Lxor_full_048_ULT_done:
    bruge8 .Lxor_full_048_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_048_UGE_done
.Lxor_full_048_UGE_true:
    bit_emit_char 'B'
.Lxor_full_048_UGE_done:
    brslt8 .Lxor_full_048_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_048_SLT_done
.Lxor_full_048_SLT_true:
    bit_emit_char 'B'
.Lxor_full_048_SLT_done:
    brsge8 .Lxor_full_048_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_048_SGE_done
.Lxor_full_048_SGE_true:
    bit_emit_char 'B'
.Lxor_full_048_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r2; pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r2
    ldi16 r4, 0x6a67
    push16 r4
    pop16 r6
    xor r2, r2
    push16 r6
    push16 r2
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_049_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_049_EQ_done
.Lxor_full_049_EQ_true:
    bit_emit_char 'B'
.Lxor_full_049_EQ_done:
    brne8 .Lxor_full_049_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_049_NE_done
.Lxor_full_049_NE_true:
    bit_emit_char 'B'
.Lxor_full_049_NE_done:
    brult8 .Lxor_full_049_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_049_ULT_done
.Lxor_full_049_ULT_true:
    bit_emit_char 'B'
.Lxor_full_049_ULT_done:
    bruge8 .Lxor_full_049_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_049_UGE_done
.Lxor_full_049_UGE_true:
    bit_emit_char 'B'
.Lxor_full_049_UGE_done:
    brslt8 .Lxor_full_049_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_049_SLT_done
.Lxor_full_049_SLT_true:
    bit_emit_char 'B'
.Lxor_full_049_SLT_done:
    brsge8 .Lxor_full_049_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_049_SGE_done
.Lxor_full_049_SGE_true:
    bit_emit_char 'B'
.Lxor_full_049_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r2; pattern 2; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r2
    ldi16 r4, 0x6bc1
    push16 r4
    pop16 r7
    xor r2, r2
    push16 r7
    push16 r2
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_04a_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04a_EQ_done
.Lxor_full_04a_EQ_true:
    bit_emit_char 'B'
.Lxor_full_04a_EQ_done:
    brne8 .Lxor_full_04a_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04a_NE_done
.Lxor_full_04a_NE_true:
    bit_emit_char 'B'
.Lxor_full_04a_NE_done:
    brult8 .Lxor_full_04a_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04a_ULT_done
.Lxor_full_04a_ULT_true:
    bit_emit_char 'B'
.Lxor_full_04a_ULT_done:
    bruge8 .Lxor_full_04a_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04a_UGE_done
.Lxor_full_04a_UGE_true:
    bit_emit_char 'B'
.Lxor_full_04a_UGE_done:
    brslt8 .Lxor_full_04a_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04a_SLT_done
.Lxor_full_04a_SLT_true:
    bit_emit_char 'B'
.Lxor_full_04a_SLT_done:
    brsge8 .Lxor_full_04a_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04a_SGE_done
.Lxor_full_04a_SGE_true:
    bit_emit_char 'B'
.Lxor_full_04a_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r2; pattern 3; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r2
    ldi16 r4, 0x6513
    push16 r4
    pop16 r0
    xor r2, r2
    push16 r0
    push16 r2
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_04b_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04b_EQ_done
.Lxor_full_04b_EQ_true:
    bit_emit_char 'B'
.Lxor_full_04b_EQ_done:
    brne8 .Lxor_full_04b_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04b_NE_done
.Lxor_full_04b_NE_true:
    bit_emit_char 'B'
.Lxor_full_04b_NE_done:
    brult8 .Lxor_full_04b_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04b_ULT_done
.Lxor_full_04b_ULT_true:
    bit_emit_char 'B'
.Lxor_full_04b_ULT_done:
    bruge8 .Lxor_full_04b_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04b_UGE_done
.Lxor_full_04b_UGE_true:
    bit_emit_char 'B'
.Lxor_full_04b_UGE_done:
    brslt8 .Lxor_full_04b_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04b_SLT_done
.Lxor_full_04b_SLT_true:
    bit_emit_char 'B'
.Lxor_full_04b_SLT_done:
    brsge8 .Lxor_full_04b_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04b_SGE_done
.Lxor_full_04b_SGE_true:
    bit_emit_char 'B'
.Lxor_full_04b_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r3; pattern 0; guard r4.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x1234
    push16 r5
    pop16 r2
    ldi16 r5, 0x00ff
    push16 r5
    pop16 r3
    ldi16 r5, 0x6970
    push16 r5
    pop16 r4
    xor r2, r3
    push16 r4
    push16 r3
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_04c_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04c_EQ_done
.Lxor_full_04c_EQ_true:
    bit_emit_char 'B'
.Lxor_full_04c_EQ_done:
    brne8 .Lxor_full_04c_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04c_NE_done
.Lxor_full_04c_NE_true:
    bit_emit_char 'B'
.Lxor_full_04c_NE_done:
    brult8 .Lxor_full_04c_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04c_ULT_done
.Lxor_full_04c_ULT_true:
    bit_emit_char 'B'
.Lxor_full_04c_ULT_done:
    bruge8 .Lxor_full_04c_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04c_UGE_done
.Lxor_full_04c_UGE_true:
    bit_emit_char 'B'
.Lxor_full_04c_UGE_done:
    brslt8 .Lxor_full_04c_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04c_SLT_done
.Lxor_full_04c_SLT_true:
    bit_emit_char 'B'
.Lxor_full_04c_SLT_done:
    brsge8 .Lxor_full_04c_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04c_SGE_done
.Lxor_full_04c_SGE_true:
    bit_emit_char 'B'
.Lxor_full_04c_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r3; pattern 1; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xdead
    push16 r5
    pop16 r2
    ldi16 r5, 0xbeef
    push16 r5
    pop16 r3
    ldi16 r5, 0x69c9
    push16 r5
    pop16 r4
    xor r2, r3
    push16 r4
    push16 r3
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_04d_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04d_EQ_done
.Lxor_full_04d_EQ_true:
    bit_emit_char 'B'
.Lxor_full_04d_EQ_done:
    brne8 .Lxor_full_04d_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04d_NE_done
.Lxor_full_04d_NE_true:
    bit_emit_char 'B'
.Lxor_full_04d_NE_done:
    brult8 .Lxor_full_04d_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04d_ULT_done
.Lxor_full_04d_ULT_true:
    bit_emit_char 'B'
.Lxor_full_04d_ULT_done:
    bruge8 .Lxor_full_04d_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04d_UGE_done
.Lxor_full_04d_UGE_true:
    bit_emit_char 'B'
.Lxor_full_04d_UGE_done:
    brslt8 .Lxor_full_04d_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04d_SLT_done
.Lxor_full_04d_SLT_true:
    bit_emit_char 'B'
.Lxor_full_04d_SLT_done:
    brsge8 .Lxor_full_04d_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04d_SGE_done
.Lxor_full_04d_SGE_true:
    bit_emit_char 'B'
.Lxor_full_04d_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r3; pattern 2; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r2
    ldi16 r5, 0x0000
    push16 r5
    pop16 r3
    ldi16 r5, 0x6a22
    push16 r5
    pop16 r4
    xor r2, r3
    push16 r4
    push16 r3
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_04e_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04e_EQ_done
.Lxor_full_04e_EQ_true:
    bit_emit_char 'B'
.Lxor_full_04e_EQ_done:
    brne8 .Lxor_full_04e_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04e_NE_done
.Lxor_full_04e_NE_true:
    bit_emit_char 'B'
.Lxor_full_04e_NE_done:
    brult8 .Lxor_full_04e_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04e_ULT_done
.Lxor_full_04e_ULT_true:
    bit_emit_char 'B'
.Lxor_full_04e_ULT_done:
    bruge8 .Lxor_full_04e_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04e_UGE_done
.Lxor_full_04e_UGE_true:
    bit_emit_char 'B'
.Lxor_full_04e_UGE_done:
    brslt8 .Lxor_full_04e_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04e_SLT_done
.Lxor_full_04e_SLT_true:
    bit_emit_char 'B'
.Lxor_full_04e_SLT_done:
    brsge8 .Lxor_full_04e_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04e_SGE_done
.Lxor_full_04e_SGE_true:
    bit_emit_char 'B'
.Lxor_full_04e_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r3; pattern 3; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r2
    ldi16 r4, 0x3333
    push16 r4
    pop16 r3
    ldi16 r4, 0x6b7c
    push16 r4
    pop16 r5
    xor r2, r3
    push16 r5
    push16 r3
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_04f_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04f_EQ_done
.Lxor_full_04f_EQ_true:
    bit_emit_char 'B'
.Lxor_full_04f_EQ_done:
    brne8 .Lxor_full_04f_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04f_NE_done
.Lxor_full_04f_NE_true:
    bit_emit_char 'B'
.Lxor_full_04f_NE_done:
    brult8 .Lxor_full_04f_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04f_ULT_done
.Lxor_full_04f_ULT_true:
    bit_emit_char 'B'
.Lxor_full_04f_ULT_done:
    bruge8 .Lxor_full_04f_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04f_UGE_done
.Lxor_full_04f_UGE_true:
    bit_emit_char 'B'
.Lxor_full_04f_UGE_done:
    brslt8 .Lxor_full_04f_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04f_SLT_done
.Lxor_full_04f_SLT_true:
    bit_emit_char 'B'
.Lxor_full_04f_SLT_done:
    brsge8 .Lxor_full_04f_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_04f_SGE_done
.Lxor_full_04f_SGE_true:
    bit_emit_char 'B'
.Lxor_full_04f_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r4; pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r2
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r4
    ldi16 r5, 0x6dd7
    push16 r5
    pop16 r7
    xor r2, r4
    push16 r7
    push16 r4
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_050_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_050_EQ_done
.Lxor_full_050_EQ_true:
    bit_emit_char 'B'
.Lxor_full_050_EQ_done:
    brne8 .Lxor_full_050_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_050_NE_done
.Lxor_full_050_NE_true:
    bit_emit_char 'B'
.Lxor_full_050_NE_done:
    brult8 .Lxor_full_050_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_050_ULT_done
.Lxor_full_050_ULT_true:
    bit_emit_char 'B'
.Lxor_full_050_ULT_done:
    bruge8 .Lxor_full_050_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_050_UGE_done
.Lxor_full_050_UGE_true:
    bit_emit_char 'B'
.Lxor_full_050_UGE_done:
    brslt8 .Lxor_full_050_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_050_SLT_done
.Lxor_full_050_SLT_true:
    bit_emit_char 'B'
.Lxor_full_050_SLT_done:
    brsge8 .Lxor_full_050_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_050_SGE_done
.Lxor_full_050_SGE_true:
    bit_emit_char 'B'
.Lxor_full_050_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r4; pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xf00f
    push16 r5
    pop16 r2
    ldi16 r5, 0xcccc
    push16 r5
    pop16 r4
    ldi16 r5, 0x6729
    push16 r5
    pop16 r0
    xor r2, r4
    push16 r0
    push16 r4
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_051_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_051_EQ_done
.Lxor_full_051_EQ_true:
    bit_emit_char 'B'
.Lxor_full_051_EQ_done:
    brne8 .Lxor_full_051_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_051_NE_done
.Lxor_full_051_NE_true:
    bit_emit_char 'B'
.Lxor_full_051_NE_done:
    brult8 .Lxor_full_051_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_051_ULT_done
.Lxor_full_051_ULT_true:
    bit_emit_char 'B'
.Lxor_full_051_ULT_done:
    bruge8 .Lxor_full_051_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_051_UGE_done
.Lxor_full_051_UGE_true:
    bit_emit_char 'B'
.Lxor_full_051_UGE_done:
    brslt8 .Lxor_full_051_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_051_SLT_done
.Lxor_full_051_SLT_true:
    bit_emit_char 'B'
.Lxor_full_051_SLT_done:
    brsge8 .Lxor_full_051_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_051_SGE_done
.Lxor_full_051_SGE_true:
    bit_emit_char 'B'
.Lxor_full_051_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r4; pattern 2; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x8001
    push16 r5
    pop16 r2
    ldi16 r5, 0x7ffe
    push16 r5
    pop16 r4
    ldi16 r5, 0x6883
    push16 r5
    pop16 r1
    xor r2, r4
    push16 r1
    push16 r4
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_052_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_052_EQ_done
.Lxor_full_052_EQ_true:
    bit_emit_char 'B'
.Lxor_full_052_EQ_done:
    brne8 .Lxor_full_052_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_052_NE_done
.Lxor_full_052_NE_true:
    bit_emit_char 'B'
.Lxor_full_052_NE_done:
    brult8 .Lxor_full_052_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_052_ULT_done
.Lxor_full_052_ULT_true:
    bit_emit_char 'B'
.Lxor_full_052_ULT_done:
    bruge8 .Lxor_full_052_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_052_UGE_done
.Lxor_full_052_UGE_true:
    bit_emit_char 'B'
.Lxor_full_052_UGE_done:
    brslt8 .Lxor_full_052_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_052_SLT_done
.Lxor_full_052_SLT_true:
    bit_emit_char 'B'
.Lxor_full_052_SLT_done:
    brsge8 .Lxor_full_052_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_052_SGE_done
.Lxor_full_052_SGE_true:
    bit_emit_char 'B'
.Lxor_full_052_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r4; pattern 3; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r2
    ldi16 r5, 0xffff
    push16 r5
    pop16 r4
    ldi16 r5, 0x6ade
    push16 r5
    pop16 r3
    xor r2, r4
    push16 r3
    push16 r4
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_053_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_053_EQ_done
.Lxor_full_053_EQ_true:
    bit_emit_char 'B'
.Lxor_full_053_EQ_done:
    brne8 .Lxor_full_053_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_053_NE_done
.Lxor_full_053_NE_true:
    bit_emit_char 'B'
.Lxor_full_053_NE_done:
    brult8 .Lxor_full_053_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_053_ULT_done
.Lxor_full_053_ULT_true:
    bit_emit_char 'B'
.Lxor_full_053_ULT_done:
    bruge8 .Lxor_full_053_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_053_UGE_done
.Lxor_full_053_UGE_true:
    bit_emit_char 'B'
.Lxor_full_053_UGE_done:
    brslt8 .Lxor_full_053_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_053_SLT_done
.Lxor_full_053_SLT_true:
    bit_emit_char 'B'
.Lxor_full_053_SLT_done:
    brsge8 .Lxor_full_053_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_053_SGE_done
.Lxor_full_053_SGE_true:
    bit_emit_char 'B'
.Lxor_full_053_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r5; pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0xdead
    push16 r6
    pop16 r2
    ldi16 r6, 0xbeef
    push16 r6
    pop16 r5
    ldi16 r6, 0x6c38
    push16 r6
    pop16 r4
    xor r2, r5
    push16 r4
    push16 r5
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_054_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_054_EQ_done
.Lxor_full_054_EQ_true:
    bit_emit_char 'B'
.Lxor_full_054_EQ_done:
    brne8 .Lxor_full_054_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_054_NE_done
.Lxor_full_054_NE_true:
    bit_emit_char 'B'
.Lxor_full_054_NE_done:
    brult8 .Lxor_full_054_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_054_ULT_done
.Lxor_full_054_ULT_true:
    bit_emit_char 'B'
.Lxor_full_054_ULT_done:
    bruge8 .Lxor_full_054_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_054_UGE_done
.Lxor_full_054_UGE_true:
    bit_emit_char 'B'
.Lxor_full_054_UGE_done:
    brslt8 .Lxor_full_054_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_054_SLT_done
.Lxor_full_054_SLT_true:
    bit_emit_char 'B'
.Lxor_full_054_SLT_done:
    brsge8 .Lxor_full_054_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_054_SGE_done
.Lxor_full_054_SGE_true:
    bit_emit_char 'B'
.Lxor_full_054_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r5; pattern 1; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r2
    ldi16 r4, 0x0000
    push16 r4
    pop16 r5
    ldi16 r4, 0x6e93
    push16 r4
    pop16 r6
    xor r2, r5
    push16 r6
    push16 r5
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_055_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_055_EQ_done
.Lxor_full_055_EQ_true:
    bit_emit_char 'B'
.Lxor_full_055_EQ_done:
    brne8 .Lxor_full_055_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_055_NE_done
.Lxor_full_055_NE_true:
    bit_emit_char 'B'
.Lxor_full_055_NE_done:
    brult8 .Lxor_full_055_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_055_ULT_done
.Lxor_full_055_ULT_true:
    bit_emit_char 'B'
.Lxor_full_055_ULT_done:
    bruge8 .Lxor_full_055_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_055_UGE_done
.Lxor_full_055_UGE_true:
    bit_emit_char 'B'
.Lxor_full_055_UGE_done:
    brslt8 .Lxor_full_055_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_055_SLT_done
.Lxor_full_055_SLT_true:
    bit_emit_char 'B'
.Lxor_full_055_SLT_done:
    brsge8 .Lxor_full_055_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_055_SGE_done
.Lxor_full_055_SGE_true:
    bit_emit_char 'B'
.Lxor_full_055_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r5; pattern 2; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r2
    ldi16 r4, 0x3333
    push16 r4
    pop16 r5
    ldi16 r4, 0x6eec
    push16 r4
    pop16 r6
    xor r2, r5
    push16 r6
    push16 r5
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_056_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_056_EQ_done
.Lxor_full_056_EQ_true:
    bit_emit_char 'B'
.Lxor_full_056_EQ_done:
    brne8 .Lxor_full_056_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_056_NE_done
.Lxor_full_056_NE_true:
    bit_emit_char 'B'
.Lxor_full_056_NE_done:
    brult8 .Lxor_full_056_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_056_ULT_done
.Lxor_full_056_ULT_true:
    bit_emit_char 'B'
.Lxor_full_056_ULT_done:
    bruge8 .Lxor_full_056_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_056_UGE_done
.Lxor_full_056_UGE_true:
    bit_emit_char 'B'
.Lxor_full_056_UGE_done:
    brslt8 .Lxor_full_056_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_056_SLT_done
.Lxor_full_056_SLT_true:
    bit_emit_char 'B'
.Lxor_full_056_SLT_done:
    brsge8 .Lxor_full_056_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_056_SGE_done
.Lxor_full_056_SGE_true:
    bit_emit_char 'B'
.Lxor_full_056_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r5; pattern 3; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r2
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r5
    ldi16 r4, 0x7046
    push16 r4
    pop16 r7
    xor r2, r5
    push16 r7
    push16 r5
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_057_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_057_EQ_done
.Lxor_full_057_EQ_true:
    bit_emit_char 'B'
.Lxor_full_057_EQ_done:
    brne8 .Lxor_full_057_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_057_NE_done
.Lxor_full_057_NE_true:
    bit_emit_char 'B'
.Lxor_full_057_NE_done:
    brult8 .Lxor_full_057_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_057_ULT_done
.Lxor_full_057_ULT_true:
    bit_emit_char 'B'
.Lxor_full_057_ULT_done:
    bruge8 .Lxor_full_057_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_057_UGE_done
.Lxor_full_057_UGE_true:
    bit_emit_char 'B'
.Lxor_full_057_UGE_done:
    brslt8 .Lxor_full_057_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_057_SLT_done
.Lxor_full_057_SLT_true:
    bit_emit_char 'B'
.Lxor_full_057_SLT_done:
    brsge8 .Lxor_full_057_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_057_SGE_done
.Lxor_full_057_SGE_true:
    bit_emit_char 'B'
.Lxor_full_057_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r6; pattern 0; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r2
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r6
    ldi16 r4, 0x6a99
    push16 r4
    pop16 r1
    xor r2, r6
    push16 r1
    push16 r6
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_058_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_058_EQ_done
.Lxor_full_058_EQ_true:
    bit_emit_char 'B'
.Lxor_full_058_EQ_done:
    brne8 .Lxor_full_058_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_058_NE_done
.Lxor_full_058_NE_true:
    bit_emit_char 'B'
.Lxor_full_058_NE_done:
    brult8 .Lxor_full_058_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_058_ULT_done
.Lxor_full_058_ULT_true:
    bit_emit_char 'B'
.Lxor_full_058_ULT_done:
    bruge8 .Lxor_full_058_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_058_UGE_done
.Lxor_full_058_UGE_true:
    bit_emit_char 'B'
.Lxor_full_058_UGE_done:
    brslt8 .Lxor_full_058_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_058_SLT_done
.Lxor_full_058_SLT_true:
    bit_emit_char 'B'
.Lxor_full_058_SLT_done:
    brsge8 .Lxor_full_058_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_058_SGE_done
.Lxor_full_058_SGE_true:
    bit_emit_char 'B'
.Lxor_full_058_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r6; pattern 1; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r2
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r6
    ldi16 r4, 0x6cf4
    push16 r4
    pop16 r3
    xor r2, r6
    push16 r3
    push16 r6
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_059_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_059_EQ_done
.Lxor_full_059_EQ_true:
    bit_emit_char 'B'
.Lxor_full_059_EQ_done:
    brne8 .Lxor_full_059_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_059_NE_done
.Lxor_full_059_NE_true:
    bit_emit_char 'B'
.Lxor_full_059_NE_done:
    brult8 .Lxor_full_059_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_059_ULT_done
.Lxor_full_059_ULT_true:
    bit_emit_char 'B'
.Lxor_full_059_ULT_done:
    bruge8 .Lxor_full_059_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_059_UGE_done
.Lxor_full_059_UGE_true:
    bit_emit_char 'B'
.Lxor_full_059_UGE_done:
    brslt8 .Lxor_full_059_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_059_SLT_done
.Lxor_full_059_SLT_true:
    bit_emit_char 'B'
.Lxor_full_059_SLT_done:
    brsge8 .Lxor_full_059_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_059_SGE_done
.Lxor_full_059_SGE_true:
    bit_emit_char 'B'
.Lxor_full_059_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r6; pattern 2; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r2
    ldi16 r4, 0xffff
    push16 r4
    pop16 r6
    ldi16 r4, 0x6d4d
    push16 r4
    pop16 r3
    xor r2, r6
    push16 r3
    push16 r6
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_05a_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05a_EQ_done
.Lxor_full_05a_EQ_true:
    bit_emit_char 'B'
.Lxor_full_05a_EQ_done:
    brne8 .Lxor_full_05a_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05a_NE_done
.Lxor_full_05a_NE_true:
    bit_emit_char 'B'
.Lxor_full_05a_NE_done:
    brult8 .Lxor_full_05a_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05a_ULT_done
.Lxor_full_05a_ULT_true:
    bit_emit_char 'B'
.Lxor_full_05a_ULT_done:
    bruge8 .Lxor_full_05a_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05a_UGE_done
.Lxor_full_05a_UGE_true:
    bit_emit_char 'B'
.Lxor_full_05a_UGE_done:
    brslt8 .Lxor_full_05a_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05a_SLT_done
.Lxor_full_05a_SLT_true:
    bit_emit_char 'B'
.Lxor_full_05a_SLT_done:
    brsge8 .Lxor_full_05a_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05a_SGE_done
.Lxor_full_05a_SGE_true:
    bit_emit_char 'B'
.Lxor_full_05a_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r6; pattern 3; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r2
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r6
    ldi16 r5, 0x6ea7
    push16 r5
    pop16 r4
    xor r2, r6
    push16 r4
    push16 r6
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_05b_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05b_EQ_done
.Lxor_full_05b_EQ_true:
    bit_emit_char 'B'
.Lxor_full_05b_EQ_done:
    brne8 .Lxor_full_05b_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05b_NE_done
.Lxor_full_05b_NE_true:
    bit_emit_char 'B'
.Lxor_full_05b_NE_done:
    brult8 .Lxor_full_05b_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05b_ULT_done
.Lxor_full_05b_ULT_true:
    bit_emit_char 'B'
.Lxor_full_05b_ULT_done:
    bruge8 .Lxor_full_05b_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05b_UGE_done
.Lxor_full_05b_UGE_true:
    bit_emit_char 'B'
.Lxor_full_05b_UGE_done:
    brslt8 .Lxor_full_05b_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05b_SLT_done
.Lxor_full_05b_SLT_true:
    bit_emit_char 'B'
.Lxor_full_05b_SLT_done:
    brsge8 .Lxor_full_05b_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05b_SGE_done
.Lxor_full_05b_SGE_true:
    bit_emit_char 'B'
.Lxor_full_05b_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r7; pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r2
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    ldi16 r4, 0x7102
    push16 r4
    pop16 r6
    xor r2, r7
    push16 r6
    push16 r7
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_05c_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05c_EQ_done
.Lxor_full_05c_EQ_true:
    bit_emit_char 'B'
.Lxor_full_05c_EQ_done:
    brne8 .Lxor_full_05c_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05c_NE_done
.Lxor_full_05c_NE_true:
    bit_emit_char 'B'
.Lxor_full_05c_NE_done:
    brult8 .Lxor_full_05c_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05c_ULT_done
.Lxor_full_05c_ULT_true:
    bit_emit_char 'B'
.Lxor_full_05c_ULT_done:
    bruge8 .Lxor_full_05c_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05c_UGE_done
.Lxor_full_05c_UGE_true:
    bit_emit_char 'B'
.Lxor_full_05c_UGE_done:
    brslt8 .Lxor_full_05c_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05c_SLT_done
.Lxor_full_05c_SLT_true:
    bit_emit_char 'B'
.Lxor_full_05c_SLT_done:
    brsge8 .Lxor_full_05c_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05c_SGE_done
.Lxor_full_05c_SGE_true:
    bit_emit_char 'B'
.Lxor_full_05c_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r7; pattern 1; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r2
    ldi16 r4, 0x3333
    push16 r4
    pop16 r7
    ldi16 r4, 0x6b55
    push16 r4
    pop16 r0
    xor r2, r7
    push16 r0
    push16 r7
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_05d_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05d_EQ_done
.Lxor_full_05d_EQ_true:
    bit_emit_char 'B'
.Lxor_full_05d_EQ_done:
    brne8 .Lxor_full_05d_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05d_NE_done
.Lxor_full_05d_NE_true:
    bit_emit_char 'B'
.Lxor_full_05d_NE_done:
    brult8 .Lxor_full_05d_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05d_ULT_done
.Lxor_full_05d_ULT_true:
    bit_emit_char 'B'
.Lxor_full_05d_ULT_done:
    bruge8 .Lxor_full_05d_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05d_UGE_done
.Lxor_full_05d_UGE_true:
    bit_emit_char 'B'
.Lxor_full_05d_UGE_done:
    brslt8 .Lxor_full_05d_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05d_SLT_done
.Lxor_full_05d_SLT_true:
    bit_emit_char 'B'
.Lxor_full_05d_SLT_done:
    brsge8 .Lxor_full_05d_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05d_SGE_done
.Lxor_full_05d_SGE_true:
    bit_emit_char 'B'
.Lxor_full_05d_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r7; pattern 2; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r2
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r7
    ldi16 r4, 0x6bae
    push16 r4
    pop16 r0
    xor r2, r7
    push16 r0
    push16 r7
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_05e_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05e_EQ_done
.Lxor_full_05e_EQ_true:
    bit_emit_char 'B'
.Lxor_full_05e_EQ_done:
    brne8 .Lxor_full_05e_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05e_NE_done
.Lxor_full_05e_NE_true:
    bit_emit_char 'B'
.Lxor_full_05e_NE_done:
    brult8 .Lxor_full_05e_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05e_ULT_done
.Lxor_full_05e_ULT_true:
    bit_emit_char 'B'
.Lxor_full_05e_ULT_done:
    bruge8 .Lxor_full_05e_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05e_UGE_done
.Lxor_full_05e_UGE_true:
    bit_emit_char 'B'
.Lxor_full_05e_UGE_done:
    brslt8 .Lxor_full_05e_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05e_SLT_done
.Lxor_full_05e_SLT_true:
    bit_emit_char 'B'
.Lxor_full_05e_SLT_done:
    brsge8 .Lxor_full_05e_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05e_SGE_done
.Lxor_full_05e_SGE_true:
    bit_emit_char 'B'
.Lxor_full_05e_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r2,r7; pattern 3; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r2
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r7
    ldi16 r4, 0x6d08
    push16 r4
    pop16 r1
    xor r2, r7
    push16 r1
    push16 r7
    push16 r2
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_05f_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05f_EQ_done
.Lxor_full_05f_EQ_true:
    bit_emit_char 'B'
.Lxor_full_05f_EQ_done:
    brne8 .Lxor_full_05f_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05f_NE_done
.Lxor_full_05f_NE_true:
    bit_emit_char 'B'
.Lxor_full_05f_NE_done:
    brult8 .Lxor_full_05f_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05f_ULT_done
.Lxor_full_05f_ULT_true:
    bit_emit_char 'B'
.Lxor_full_05f_ULT_done:
    bruge8 .Lxor_full_05f_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05f_UGE_done
.Lxor_full_05f_UGE_true:
    bit_emit_char 'B'
.Lxor_full_05f_UGE_done:
    brslt8 .Lxor_full_05f_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05f_SLT_done
.Lxor_full_05f_SLT_true:
    bit_emit_char 'B'
.Lxor_full_05f_SLT_done:
    brsge8 .Lxor_full_05f_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_05f_SGE_done
.Lxor_full_05f_SGE_true:
    bit_emit_char 'B'
.Lxor_full_05f_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r0; pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r3
    ldi16 r5, 0x0000
    push16 r5
    pop16 r0
    ldi16 r5, 0x7064
    push16 r5
    pop16 r4
    xor r3, r0
    push16 r4
    push16 r0
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_060_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_060_EQ_done
.Lxor_full_060_EQ_true:
    bit_emit_char 'B'
.Lxor_full_060_EQ_done:
    brne8 .Lxor_full_060_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_060_NE_done
.Lxor_full_060_NE_true:
    bit_emit_char 'B'
.Lxor_full_060_NE_done:
    brult8 .Lxor_full_060_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_060_ULT_done
.Lxor_full_060_ULT_true:
    bit_emit_char 'B'
.Lxor_full_060_ULT_done:
    bruge8 .Lxor_full_060_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_060_UGE_done
.Lxor_full_060_UGE_true:
    bit_emit_char 'B'
.Lxor_full_060_UGE_done:
    brslt8 .Lxor_full_060_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_060_SLT_done
.Lxor_full_060_SLT_true:
    bit_emit_char 'B'
.Lxor_full_060_SLT_done:
    brsge8 .Lxor_full_060_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_060_SGE_done
.Lxor_full_060_SGE_true:
    bit_emit_char 'B'
.Lxor_full_060_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r0; pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r3
    ldi16 r4, 0x3333
    push16 r4
    pop16 r0
    ldi16 r4, 0x71be
    push16 r4
    pop16 r5
    xor r3, r0
    push16 r5
    push16 r0
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_061_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_061_EQ_done
.Lxor_full_061_EQ_true:
    bit_emit_char 'B'
.Lxor_full_061_EQ_done:
    brne8 .Lxor_full_061_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_061_NE_done
.Lxor_full_061_NE_true:
    bit_emit_char 'B'
.Lxor_full_061_NE_done:
    brult8 .Lxor_full_061_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_061_ULT_done
.Lxor_full_061_ULT_true:
    bit_emit_char 'B'
.Lxor_full_061_ULT_done:
    bruge8 .Lxor_full_061_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_061_UGE_done
.Lxor_full_061_UGE_true:
    bit_emit_char 'B'
.Lxor_full_061_UGE_done:
    brslt8 .Lxor_full_061_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_061_SLT_done
.Lxor_full_061_SLT_true:
    bit_emit_char 'B'
.Lxor_full_061_SLT_done:
    brsge8 .Lxor_full_061_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_061_SGE_done
.Lxor_full_061_SGE_true:
    bit_emit_char 'B'
.Lxor_full_061_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r0; pattern 2; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r3
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r0
    ldi16 r4, 0x7318
    push16 r4
    pop16 r6
    xor r3, r0
    push16 r6
    push16 r0
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_062_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_062_EQ_done
.Lxor_full_062_EQ_true:
    bit_emit_char 'B'
.Lxor_full_062_EQ_done:
    brne8 .Lxor_full_062_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_062_NE_done
.Lxor_full_062_NE_true:
    bit_emit_char 'B'
.Lxor_full_062_NE_done:
    brult8 .Lxor_full_062_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_062_ULT_done
.Lxor_full_062_ULT_true:
    bit_emit_char 'B'
.Lxor_full_062_ULT_done:
    bruge8 .Lxor_full_062_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_062_UGE_done
.Lxor_full_062_UGE_true:
    bit_emit_char 'B'
.Lxor_full_062_UGE_done:
    brslt8 .Lxor_full_062_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_062_SLT_done
.Lxor_full_062_SLT_true:
    bit_emit_char 'B'
.Lxor_full_062_SLT_done:
    brsge8 .Lxor_full_062_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_062_SGE_done
.Lxor_full_062_SGE_true:
    bit_emit_char 'B'
.Lxor_full_062_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r0; pattern 3; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r3
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r0
    ldi16 r4, 0x7472
    push16 r4
    pop16 r7
    xor r3, r0
    push16 r7
    push16 r0
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_063_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_063_EQ_done
.Lxor_full_063_EQ_true:
    bit_emit_char 'B'
.Lxor_full_063_EQ_done:
    brne8 .Lxor_full_063_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_063_NE_done
.Lxor_full_063_NE_true:
    bit_emit_char 'B'
.Lxor_full_063_NE_done:
    brult8 .Lxor_full_063_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_063_ULT_done
.Lxor_full_063_ULT_true:
    bit_emit_char 'B'
.Lxor_full_063_ULT_done:
    bruge8 .Lxor_full_063_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_063_UGE_done
.Lxor_full_063_UGE_true:
    bit_emit_char 'B'
.Lxor_full_063_UGE_done:
    brslt8 .Lxor_full_063_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_063_SLT_done
.Lxor_full_063_SLT_true:
    bit_emit_char 'B'
.Lxor_full_063_SLT_done:
    brsge8 .Lxor_full_063_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_063_SGE_done
.Lxor_full_063_SGE_true:
    bit_emit_char 'B'
.Lxor_full_063_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r1; pattern 0; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r3
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r1
    ldi16 r4, 0x6fc6
    push16 r4
    pop16 r2
    xor r3, r1
    push16 r2
    push16 r1
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_064_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_064_EQ_done
.Lxor_full_064_EQ_true:
    bit_emit_char 'B'
.Lxor_full_064_EQ_done:
    brne8 .Lxor_full_064_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_064_NE_done
.Lxor_full_064_NE_true:
    bit_emit_char 'B'
.Lxor_full_064_NE_done:
    brult8 .Lxor_full_064_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_064_ULT_done
.Lxor_full_064_ULT_true:
    bit_emit_char 'B'
.Lxor_full_064_ULT_done:
    bruge8 .Lxor_full_064_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_064_UGE_done
.Lxor_full_064_UGE_true:
    bit_emit_char 'B'
.Lxor_full_064_UGE_done:
    brslt8 .Lxor_full_064_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_064_SLT_done
.Lxor_full_064_SLT_true:
    bit_emit_char 'B'
.Lxor_full_064_SLT_done:
    brsge8 .Lxor_full_064_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_064_SGE_done
.Lxor_full_064_SGE_true:
    bit_emit_char 'B'
.Lxor_full_064_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r1; pattern 1; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r3
    ldi16 r4, 0xffff
    push16 r4
    pop16 r1
    ldi16 r4, 0x701f
    push16 r4
    pop16 r2
    xor r3, r1
    push16 r2
    push16 r1
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_065_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_065_EQ_done
.Lxor_full_065_EQ_true:
    bit_emit_char 'B'
.Lxor_full_065_EQ_done:
    brne8 .Lxor_full_065_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_065_NE_done
.Lxor_full_065_NE_true:
    bit_emit_char 'B'
.Lxor_full_065_NE_done:
    brult8 .Lxor_full_065_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_065_ULT_done
.Lxor_full_065_ULT_true:
    bit_emit_char 'B'
.Lxor_full_065_ULT_done:
    bruge8 .Lxor_full_065_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_065_UGE_done
.Lxor_full_065_UGE_true:
    bit_emit_char 'B'
.Lxor_full_065_UGE_done:
    brslt8 .Lxor_full_065_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_065_SLT_done
.Lxor_full_065_SLT_true:
    bit_emit_char 'B'
.Lxor_full_065_SLT_done:
    brsge8 .Lxor_full_065_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_065_SGE_done
.Lxor_full_065_SGE_true:
    bit_emit_char 'B'
.Lxor_full_065_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r1; pattern 2; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r3
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r1
    ldi16 r5, 0x727a
    push16 r5
    pop16 r4
    xor r3, r1
    push16 r4
    push16 r1
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_066_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_066_EQ_done
.Lxor_full_066_EQ_true:
    bit_emit_char 'B'
.Lxor_full_066_EQ_done:
    brne8 .Lxor_full_066_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_066_NE_done
.Lxor_full_066_NE_true:
    bit_emit_char 'B'
.Lxor_full_066_NE_done:
    brult8 .Lxor_full_066_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_066_ULT_done
.Lxor_full_066_ULT_true:
    bit_emit_char 'B'
.Lxor_full_066_ULT_done:
    bruge8 .Lxor_full_066_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_066_UGE_done
.Lxor_full_066_UGE_true:
    bit_emit_char 'B'
.Lxor_full_066_UGE_done:
    brslt8 .Lxor_full_066_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_066_SLT_done
.Lxor_full_066_SLT_true:
    bit_emit_char 'B'
.Lxor_full_066_SLT_done:
    brsge8 .Lxor_full_066_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_066_SGE_done
.Lxor_full_066_SGE_true:
    bit_emit_char 'B'
.Lxor_full_066_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r1; pattern 3; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xf00f
    push16 r5
    pop16 r3
    ldi16 r5, 0xcccc
    push16 r5
    pop16 r1
    ldi16 r5, 0x72d3
    push16 r5
    pop16 r4
    xor r3, r1
    push16 r4
    push16 r1
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_067_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_067_EQ_done
.Lxor_full_067_EQ_true:
    bit_emit_char 'B'
.Lxor_full_067_EQ_done:
    brne8 .Lxor_full_067_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_067_NE_done
.Lxor_full_067_NE_true:
    bit_emit_char 'B'
.Lxor_full_067_NE_done:
    brult8 .Lxor_full_067_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_067_ULT_done
.Lxor_full_067_ULT_true:
    bit_emit_char 'B'
.Lxor_full_067_ULT_done:
    bruge8 .Lxor_full_067_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_067_UGE_done
.Lxor_full_067_UGE_true:
    bit_emit_char 'B'
.Lxor_full_067_UGE_done:
    brslt8 .Lxor_full_067_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_067_SLT_done
.Lxor_full_067_SLT_true:
    bit_emit_char 'B'
.Lxor_full_067_SLT_done:
    brsge8 .Lxor_full_067_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_067_SGE_done
.Lxor_full_067_SGE_true:
    bit_emit_char 'B'
.Lxor_full_067_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r2; pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r3
    ldi16 r4, 0x3333
    push16 r4
    pop16 r2
    ldi16 r4, 0x752e
    push16 r4
    pop16 r6
    xor r3, r2
    push16 r6
    push16 r2
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_068_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_068_EQ_done
.Lxor_full_068_EQ_true:
    bit_emit_char 'B'
.Lxor_full_068_EQ_done:
    brne8 .Lxor_full_068_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_068_NE_done
.Lxor_full_068_NE_true:
    bit_emit_char 'B'
.Lxor_full_068_NE_done:
    brult8 .Lxor_full_068_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_068_ULT_done
.Lxor_full_068_ULT_true:
    bit_emit_char 'B'
.Lxor_full_068_ULT_done:
    bruge8 .Lxor_full_068_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_068_UGE_done
.Lxor_full_068_UGE_true:
    bit_emit_char 'B'
.Lxor_full_068_UGE_done:
    brslt8 .Lxor_full_068_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_068_SLT_done
.Lxor_full_068_SLT_true:
    bit_emit_char 'B'
.Lxor_full_068_SLT_done:
    brsge8 .Lxor_full_068_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_068_SGE_done
.Lxor_full_068_SGE_true:
    bit_emit_char 'B'
.Lxor_full_068_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r2; pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r3
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r2
    ldi16 r4, 0x7688
    push16 r4
    pop16 r7
    xor r3, r2
    push16 r7
    push16 r2
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_069_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_069_EQ_done
.Lxor_full_069_EQ_true:
    bit_emit_char 'B'
.Lxor_full_069_EQ_done:
    brne8 .Lxor_full_069_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_069_NE_done
.Lxor_full_069_NE_true:
    bit_emit_char 'B'
.Lxor_full_069_NE_done:
    brult8 .Lxor_full_069_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_069_ULT_done
.Lxor_full_069_ULT_true:
    bit_emit_char 'B'
.Lxor_full_069_ULT_done:
    bruge8 .Lxor_full_069_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_069_UGE_done
.Lxor_full_069_UGE_true:
    bit_emit_char 'B'
.Lxor_full_069_UGE_done:
    brslt8 .Lxor_full_069_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_069_SLT_done
.Lxor_full_069_SLT_true:
    bit_emit_char 'B'
.Lxor_full_069_SLT_done:
    brsge8 .Lxor_full_069_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_069_SGE_done
.Lxor_full_069_SGE_true:
    bit_emit_char 'B'
.Lxor_full_069_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r2; pattern 2; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r3
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r2
    ldi16 r4, 0x6fda
    push16 r4
    pop16 r0
    xor r3, r2
    push16 r0
    push16 r2
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_06a_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06a_EQ_done
.Lxor_full_06a_EQ_true:
    bit_emit_char 'B'
.Lxor_full_06a_EQ_done:
    brne8 .Lxor_full_06a_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06a_NE_done
.Lxor_full_06a_NE_true:
    bit_emit_char 'B'
.Lxor_full_06a_NE_done:
    brult8 .Lxor_full_06a_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06a_ULT_done
.Lxor_full_06a_ULT_true:
    bit_emit_char 'B'
.Lxor_full_06a_ULT_done:
    bruge8 .Lxor_full_06a_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06a_UGE_done
.Lxor_full_06a_UGE_true:
    bit_emit_char 'B'
.Lxor_full_06a_UGE_done:
    brslt8 .Lxor_full_06a_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06a_SLT_done
.Lxor_full_06a_SLT_true:
    bit_emit_char 'B'
.Lxor_full_06a_SLT_done:
    brsge8 .Lxor_full_06a_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06a_SGE_done
.Lxor_full_06a_SGE_true:
    bit_emit_char 'B'
.Lxor_full_06a_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r2; pattern 3; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r3
    ldi16 r4, 0x0000
    push16 r4
    pop16 r2
    ldi16 r4, 0x7134
    push16 r4
    pop16 r1
    xor r3, r2
    push16 r1
    push16 r2
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_06b_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06b_EQ_done
.Lxor_full_06b_EQ_true:
    bit_emit_char 'B'
.Lxor_full_06b_EQ_done:
    brne8 .Lxor_full_06b_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06b_NE_done
.Lxor_full_06b_NE_true:
    bit_emit_char 'B'
.Lxor_full_06b_NE_done:
    brult8 .Lxor_full_06b_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06b_ULT_done
.Lxor_full_06b_ULT_true:
    bit_emit_char 'B'
.Lxor_full_06b_ULT_done:
    bruge8 .Lxor_full_06b_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06b_UGE_done
.Lxor_full_06b_UGE_true:
    bit_emit_char 'B'
.Lxor_full_06b_UGE_done:
    brslt8 .Lxor_full_06b_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06b_SLT_done
.Lxor_full_06b_SLT_true:
    bit_emit_char 'B'
.Lxor_full_06b_SLT_done:
    brsge8 .Lxor_full_06b_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06b_SGE_done
.Lxor_full_06b_SGE_true:
    bit_emit_char 'B'
.Lxor_full_06b_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r3; pattern 0; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r3
    ldi16 r5, 0x7490
    push16 r5
    pop16 r4
    xor r3, r3
    push16 r4
    push16 r3
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_06c_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06c_EQ_done
.Lxor_full_06c_EQ_true:
    bit_emit_char 'B'
.Lxor_full_06c_EQ_done:
    brne8 .Lxor_full_06c_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06c_NE_done
.Lxor_full_06c_NE_true:
    bit_emit_char 'B'
.Lxor_full_06c_NE_done:
    brult8 .Lxor_full_06c_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06c_ULT_done
.Lxor_full_06c_ULT_true:
    bit_emit_char 'B'
.Lxor_full_06c_ULT_done:
    bruge8 .Lxor_full_06c_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06c_UGE_done
.Lxor_full_06c_UGE_true:
    bit_emit_char 'B'
.Lxor_full_06c_UGE_done:
    brslt8 .Lxor_full_06c_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06c_SLT_done
.Lxor_full_06c_SLT_true:
    bit_emit_char 'B'
.Lxor_full_06c_SLT_done:
    brsge8 .Lxor_full_06c_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06c_SGE_done
.Lxor_full_06c_SGE_true:
    bit_emit_char 'B'
.Lxor_full_06c_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r3; pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r3
    ldi16 r5, 0x74e9
    push16 r5
    pop16 r4
    xor r3, r3
    push16 r4
    push16 r3
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_06d_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06d_EQ_done
.Lxor_full_06d_EQ_true:
    bit_emit_char 'B'
.Lxor_full_06d_EQ_done:
    brne8 .Lxor_full_06d_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06d_NE_done
.Lxor_full_06d_NE_true:
    bit_emit_char 'B'
.Lxor_full_06d_NE_done:
    brult8 .Lxor_full_06d_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06d_ULT_done
.Lxor_full_06d_ULT_true:
    bit_emit_char 'B'
.Lxor_full_06d_ULT_done:
    bruge8 .Lxor_full_06d_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06d_UGE_done
.Lxor_full_06d_UGE_true:
    bit_emit_char 'B'
.Lxor_full_06d_UGE_done:
    brslt8 .Lxor_full_06d_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06d_SLT_done
.Lxor_full_06d_SLT_true:
    bit_emit_char 'B'
.Lxor_full_06d_SLT_done:
    brsge8 .Lxor_full_06d_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06d_SGE_done
.Lxor_full_06d_SGE_true:
    bit_emit_char 'B'
.Lxor_full_06d_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r3; pattern 2; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r3
    ldi16 r4, 0x7643
    push16 r4
    pop16 r5
    xor r3, r3
    push16 r5
    push16 r3
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_06e_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06e_EQ_done
.Lxor_full_06e_EQ_true:
    bit_emit_char 'B'
.Lxor_full_06e_EQ_done:
    brne8 .Lxor_full_06e_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06e_NE_done
.Lxor_full_06e_NE_true:
    bit_emit_char 'B'
.Lxor_full_06e_NE_done:
    brult8 .Lxor_full_06e_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06e_ULT_done
.Lxor_full_06e_ULT_true:
    bit_emit_char 'B'
.Lxor_full_06e_ULT_done:
    bruge8 .Lxor_full_06e_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06e_UGE_done
.Lxor_full_06e_UGE_true:
    bit_emit_char 'B'
.Lxor_full_06e_UGE_done:
    brslt8 .Lxor_full_06e_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06e_SLT_done
.Lxor_full_06e_SLT_true:
    bit_emit_char 'B'
.Lxor_full_06e_SLT_done:
    brsge8 .Lxor_full_06e_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06e_SGE_done
.Lxor_full_06e_SGE_true:
    bit_emit_char 'B'
.Lxor_full_06e_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r3; pattern 3; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r3
    ldi16 r4, 0x779d
    push16 r4
    pop16 r6
    xor r3, r3
    push16 r6
    push16 r3
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_06f_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06f_EQ_done
.Lxor_full_06f_EQ_true:
    bit_emit_char 'B'
.Lxor_full_06f_EQ_done:
    brne8 .Lxor_full_06f_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06f_NE_done
.Lxor_full_06f_NE_true:
    bit_emit_char 'B'
.Lxor_full_06f_NE_done:
    brult8 .Lxor_full_06f_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06f_ULT_done
.Lxor_full_06f_ULT_true:
    bit_emit_char 'B'
.Lxor_full_06f_ULT_done:
    bruge8 .Lxor_full_06f_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06f_UGE_done
.Lxor_full_06f_UGE_true:
    bit_emit_char 'B'
.Lxor_full_06f_UGE_done:
    brslt8 .Lxor_full_06f_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06f_SLT_done
.Lxor_full_06f_SLT_true:
    bit_emit_char 'B'
.Lxor_full_06f_SLT_done:
    brsge8 .Lxor_full_06f_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_06f_SGE_done
.Lxor_full_06f_SGE_true:
    bit_emit_char 'B'
.Lxor_full_06f_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r4; pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x1234
    push16 r5
    pop16 r3
    ldi16 r5, 0x00ff
    push16 r5
    pop16 r4
    ldi16 r5, 0x71f0
    push16 r5
    pop16 r0
    xor r3, r4
    push16 r0
    push16 r4
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_070_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_070_EQ_done
.Lxor_full_070_EQ_true:
    bit_emit_char 'B'
.Lxor_full_070_EQ_done:
    brne8 .Lxor_full_070_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_070_NE_done
.Lxor_full_070_NE_true:
    bit_emit_char 'B'
.Lxor_full_070_NE_done:
    brult8 .Lxor_full_070_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_070_ULT_done
.Lxor_full_070_ULT_true:
    bit_emit_char 'B'
.Lxor_full_070_ULT_done:
    bruge8 .Lxor_full_070_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_070_UGE_done
.Lxor_full_070_UGE_true:
    bit_emit_char 'B'
.Lxor_full_070_UGE_done:
    brslt8 .Lxor_full_070_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_070_SLT_done
.Lxor_full_070_SLT_true:
    bit_emit_char 'B'
.Lxor_full_070_SLT_done:
    brsge8 .Lxor_full_070_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_070_SGE_done
.Lxor_full_070_SGE_true:
    bit_emit_char 'B'
.Lxor_full_070_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r4; pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0xdead
    push16 r5
    pop16 r3
    ldi16 r5, 0xbeef
    push16 r5
    pop16 r4
    ldi16 r5, 0x734a
    push16 r5
    pop16 r1
    xor r3, r4
    push16 r1
    push16 r4
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_071_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_071_EQ_done
.Lxor_full_071_EQ_true:
    bit_emit_char 'B'
.Lxor_full_071_EQ_done:
    brne8 .Lxor_full_071_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_071_NE_done
.Lxor_full_071_NE_true:
    bit_emit_char 'B'
.Lxor_full_071_NE_done:
    brult8 .Lxor_full_071_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_071_ULT_done
.Lxor_full_071_ULT_true:
    bit_emit_char 'B'
.Lxor_full_071_ULT_done:
    bruge8 .Lxor_full_071_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_071_UGE_done
.Lxor_full_071_UGE_true:
    bit_emit_char 'B'
.Lxor_full_071_UGE_done:
    brslt8 .Lxor_full_071_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_071_SLT_done
.Lxor_full_071_SLT_true:
    bit_emit_char 'B'
.Lxor_full_071_SLT_done:
    brsge8 .Lxor_full_071_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_071_SGE_done
.Lxor_full_071_SGE_true:
    bit_emit_char 'B'
.Lxor_full_071_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r4; pattern 2; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r3
    ldi16 r5, 0x0000
    push16 r5
    pop16 r4
    ldi16 r5, 0x74a4
    push16 r5
    pop16 r2
    xor r3, r4
    push16 r2
    push16 r4
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_072_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_072_EQ_done
.Lxor_full_072_EQ_true:
    bit_emit_char 'B'
.Lxor_full_072_EQ_done:
    brne8 .Lxor_full_072_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_072_NE_done
.Lxor_full_072_NE_true:
    bit_emit_char 'B'
.Lxor_full_072_NE_done:
    brult8 .Lxor_full_072_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_072_ULT_done
.Lxor_full_072_ULT_true:
    bit_emit_char 'B'
.Lxor_full_072_ULT_done:
    bruge8 .Lxor_full_072_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_072_UGE_done
.Lxor_full_072_UGE_true:
    bit_emit_char 'B'
.Lxor_full_072_UGE_done:
    brslt8 .Lxor_full_072_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_072_SLT_done
.Lxor_full_072_SLT_true:
    bit_emit_char 'B'
.Lxor_full_072_SLT_done:
    brsge8 .Lxor_full_072_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_072_SGE_done
.Lxor_full_072_SGE_true:
    bit_emit_char 'B'
.Lxor_full_072_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r4; pattern 3; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r6, 0x0ff0
    push16 r6
    pop16 r3
    ldi16 r6, 0x3333
    push16 r6
    pop16 r4
    ldi16 r6, 0x7800
    push16 r6
    pop16 r5
    xor r3, r4
    push16 r5
    push16 r4
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_073_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_073_EQ_done
.Lxor_full_073_EQ_true:
    bit_emit_char 'B'
.Lxor_full_073_EQ_done:
    brne8 .Lxor_full_073_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_073_NE_done
.Lxor_full_073_NE_true:
    bit_emit_char 'B'
.Lxor_full_073_NE_done:
    brult8 .Lxor_full_073_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_073_ULT_done
.Lxor_full_073_ULT_true:
    bit_emit_char 'B'
.Lxor_full_073_ULT_done:
    bruge8 .Lxor_full_073_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_073_UGE_done
.Lxor_full_073_UGE_true:
    bit_emit_char 'B'
.Lxor_full_073_UGE_done:
    brslt8 .Lxor_full_073_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_073_SLT_done
.Lxor_full_073_SLT_true:
    bit_emit_char 'B'
.Lxor_full_073_SLT_done:
    brsge8 .Lxor_full_073_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_073_SGE_done
.Lxor_full_073_SGE_true:
    bit_emit_char 'B'
.Lxor_full_073_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r5; pattern 0; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r3
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r5
    ldi16 r4, 0x795a
    push16 r4
    pop16 r6
    xor r3, r5
    push16 r6
    push16 r5
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_074_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_074_EQ_done
.Lxor_full_074_EQ_true:
    bit_emit_char 'B'
.Lxor_full_074_EQ_done:
    brne8 .Lxor_full_074_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_074_NE_done
.Lxor_full_074_NE_true:
    bit_emit_char 'B'
.Lxor_full_074_NE_done:
    brult8 .Lxor_full_074_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_074_ULT_done
.Lxor_full_074_ULT_true:
    bit_emit_char 'B'
.Lxor_full_074_ULT_done:
    bruge8 .Lxor_full_074_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_074_UGE_done
.Lxor_full_074_UGE_true:
    bit_emit_char 'B'
.Lxor_full_074_UGE_done:
    brslt8 .Lxor_full_074_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_074_SLT_done
.Lxor_full_074_SLT_true:
    bit_emit_char 'B'
.Lxor_full_074_SLT_done:
    brsge8 .Lxor_full_074_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_074_SGE_done
.Lxor_full_074_SGE_true:
    bit_emit_char 'B'
.Lxor_full_074_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r5; pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r3
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r5
    ldi16 r4, 0x79b3
    push16 r4
    pop16 r6
    xor r3, r5
    push16 r6
    push16 r5
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_075_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_075_EQ_done
.Lxor_full_075_EQ_true:
    bit_emit_char 'B'
.Lxor_full_075_EQ_done:
    brne8 .Lxor_full_075_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_075_NE_done
.Lxor_full_075_NE_true:
    bit_emit_char 'B'
.Lxor_full_075_NE_done:
    brult8 .Lxor_full_075_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_075_ULT_done
.Lxor_full_075_ULT_true:
    bit_emit_char 'B'
.Lxor_full_075_ULT_done:
    bruge8 .Lxor_full_075_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_075_UGE_done
.Lxor_full_075_UGE_true:
    bit_emit_char 'B'
.Lxor_full_075_UGE_done:
    brslt8 .Lxor_full_075_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_075_SLT_done
.Lxor_full_075_SLT_true:
    bit_emit_char 'B'
.Lxor_full_075_SLT_done:
    brsge8 .Lxor_full_075_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_075_SGE_done
.Lxor_full_075_SGE_true:
    bit_emit_char 'B'
.Lxor_full_075_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r5; pattern 2; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r3
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r5
    ldi16 r4, 0x7b0d
    push16 r4
    pop16 r7
    xor r3, r5
    push16 r7
    push16 r5
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_076_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_076_EQ_done
.Lxor_full_076_EQ_true:
    bit_emit_char 'B'
.Lxor_full_076_EQ_done:
    brne8 .Lxor_full_076_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_076_NE_done
.Lxor_full_076_NE_true:
    bit_emit_char 'B'
.Lxor_full_076_NE_done:
    brult8 .Lxor_full_076_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_076_ULT_done
.Lxor_full_076_ULT_true:
    bit_emit_char 'B'
.Lxor_full_076_ULT_done:
    bruge8 .Lxor_full_076_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_076_UGE_done
.Lxor_full_076_UGE_true:
    bit_emit_char 'B'
.Lxor_full_076_UGE_done:
    brslt8 .Lxor_full_076_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_076_SLT_done
.Lxor_full_076_SLT_true:
    bit_emit_char 'B'
.Lxor_full_076_SLT_done:
    brsge8 .Lxor_full_076_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_076_SGE_done
.Lxor_full_076_SGE_true:
    bit_emit_char 'B'
.Lxor_full_076_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r5; pattern 3; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r3
    ldi16 r4, 0xffff
    push16 r4
    pop16 r5
    ldi16 r4, 0x745f
    push16 r4
    pop16 r0
    xor r3, r5
    push16 r0
    push16 r5
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_077_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_077_EQ_done
.Lxor_full_077_EQ_true:
    bit_emit_char 'B'
.Lxor_full_077_EQ_done:
    brne8 .Lxor_full_077_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_077_NE_done
.Lxor_full_077_NE_true:
    bit_emit_char 'B'
.Lxor_full_077_NE_done:
    brult8 .Lxor_full_077_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_077_ULT_done
.Lxor_full_077_ULT_true:
    bit_emit_char 'B'
.Lxor_full_077_ULT_done:
    bruge8 .Lxor_full_077_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_077_UGE_done
.Lxor_full_077_UGE_true:
    bit_emit_char 'B'
.Lxor_full_077_UGE_done:
    brslt8 .Lxor_full_077_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_077_SLT_done
.Lxor_full_077_SLT_true:
    bit_emit_char 'B'
.Lxor_full_077_SLT_done:
    brsge8 .Lxor_full_077_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_077_SGE_done
.Lxor_full_077_SGE_true:
    bit_emit_char 'B'
.Lxor_full_077_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r6; pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r3
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r6
    ldi16 r4, 0x76ba
    push16 r4
    pop16 r2
    xor r3, r6
    push16 r2
    push16 r6
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_078_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_078_EQ_done
.Lxor_full_078_EQ_true:
    bit_emit_char 'B'
.Lxor_full_078_EQ_done:
    brne8 .Lxor_full_078_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_078_NE_done
.Lxor_full_078_NE_true:
    bit_emit_char 'B'
.Lxor_full_078_NE_done:
    brult8 .Lxor_full_078_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_078_ULT_done
.Lxor_full_078_ULT_true:
    bit_emit_char 'B'
.Lxor_full_078_ULT_done:
    bruge8 .Lxor_full_078_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_078_UGE_done
.Lxor_full_078_UGE_true:
    bit_emit_char 'B'
.Lxor_full_078_UGE_done:
    brslt8 .Lxor_full_078_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_078_SLT_done
.Lxor_full_078_SLT_true:
    bit_emit_char 'B'
.Lxor_full_078_SLT_done:
    brsge8 .Lxor_full_078_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_078_SGE_done
.Lxor_full_078_SGE_true:
    bit_emit_char 'B'
.Lxor_full_078_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r6; pattern 1; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r3
    ldi16 r5, 0x0000
    push16 r5
    pop16 r6
    ldi16 r5, 0x7915
    push16 r5
    pop16 r4
    xor r3, r6
    push16 r4
    push16 r6
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_079_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_079_EQ_done
.Lxor_full_079_EQ_true:
    bit_emit_char 'B'
.Lxor_full_079_EQ_done:
    brne8 .Lxor_full_079_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_079_NE_done
.Lxor_full_079_NE_true:
    bit_emit_char 'B'
.Lxor_full_079_NE_done:
    brult8 .Lxor_full_079_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_079_ULT_done
.Lxor_full_079_ULT_true:
    bit_emit_char 'B'
.Lxor_full_079_ULT_done:
    bruge8 .Lxor_full_079_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_079_UGE_done
.Lxor_full_079_UGE_true:
    bit_emit_char 'B'
.Lxor_full_079_UGE_done:
    brslt8 .Lxor_full_079_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_079_SLT_done
.Lxor_full_079_SLT_true:
    bit_emit_char 'B'
.Lxor_full_079_SLT_done:
    brsge8 .Lxor_full_079_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_079_SGE_done
.Lxor_full_079_SGE_true:
    bit_emit_char 'B'
.Lxor_full_079_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r6; pattern 2; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0ff0
    push16 r5
    pop16 r3
    ldi16 r5, 0x3333
    push16 r5
    pop16 r6
    ldi16 r5, 0x796e
    push16 r5
    pop16 r4
    xor r3, r6
    push16 r4
    push16 r6
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_07a_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07a_EQ_done
.Lxor_full_07a_EQ_true:
    bit_emit_char 'B'
.Lxor_full_07a_EQ_done:
    brne8 .Lxor_full_07a_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07a_NE_done
.Lxor_full_07a_NE_true:
    bit_emit_char 'B'
.Lxor_full_07a_NE_done:
    brult8 .Lxor_full_07a_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07a_ULT_done
.Lxor_full_07a_ULT_true:
    bit_emit_char 'B'
.Lxor_full_07a_ULT_done:
    bruge8 .Lxor_full_07a_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07a_UGE_done
.Lxor_full_07a_UGE_true:
    bit_emit_char 'B'
.Lxor_full_07a_UGE_done:
    brslt8 .Lxor_full_07a_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07a_SLT_done
.Lxor_full_07a_SLT_true:
    bit_emit_char 'B'
.Lxor_full_07a_SLT_done:
    brsge8 .Lxor_full_07a_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07a_SGE_done
.Lxor_full_07a_SGE_true:
    bit_emit_char 'B'
.Lxor_full_07a_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r6; pattern 3; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r3
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r6
    ldi16 r4, 0x7ac8
    push16 r4
    pop16 r5
    xor r3, r6
    push16 r5
    push16 r6
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_07b_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07b_EQ_done
.Lxor_full_07b_EQ_true:
    bit_emit_char 'B'
.Lxor_full_07b_EQ_done:
    brne8 .Lxor_full_07b_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07b_NE_done
.Lxor_full_07b_NE_true:
    bit_emit_char 'B'
.Lxor_full_07b_NE_done:
    brult8 .Lxor_full_07b_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07b_ULT_done
.Lxor_full_07b_ULT_true:
    bit_emit_char 'B'
.Lxor_full_07b_ULT_done:
    bruge8 .Lxor_full_07b_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07b_UGE_done
.Lxor_full_07b_UGE_true:
    bit_emit_char 'B'
.Lxor_full_07b_UGE_done:
    brslt8 .Lxor_full_07b_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07b_SLT_done
.Lxor_full_07b_SLT_true:
    bit_emit_char 'B'
.Lxor_full_07b_SLT_done:
    brsge8 .Lxor_full_07b_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07b_SGE_done
.Lxor_full_07b_SGE_true:
    bit_emit_char 'B'
.Lxor_full_07b_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r7; pattern 0; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r3
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r7
    ldi16 r4, 0x761c
    push16 r4
    pop16 r0
    xor r3, r7
    push16 r0
    push16 r7
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_07c_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07c_EQ_done
.Lxor_full_07c_EQ_true:
    bit_emit_char 'B'
.Lxor_full_07c_EQ_done:
    brne8 .Lxor_full_07c_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07c_NE_done
.Lxor_full_07c_NE_true:
    bit_emit_char 'B'
.Lxor_full_07c_NE_done:
    brult8 .Lxor_full_07c_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07c_ULT_done
.Lxor_full_07c_ULT_true:
    bit_emit_char 'B'
.Lxor_full_07c_ULT_done:
    bruge8 .Lxor_full_07c_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07c_UGE_done
.Lxor_full_07c_UGE_true:
    bit_emit_char 'B'
.Lxor_full_07c_UGE_done:
    brslt8 .Lxor_full_07c_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07c_SLT_done
.Lxor_full_07c_SLT_true:
    bit_emit_char 'B'
.Lxor_full_07c_SLT_done:
    brsge8 .Lxor_full_07c_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07c_SGE_done
.Lxor_full_07c_SGE_true:
    bit_emit_char 'B'
.Lxor_full_07c_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r7; pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r3
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r7
    ldi16 r4, 0x7675
    push16 r4
    pop16 r0
    xor r3, r7
    push16 r0
    push16 r7
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_07d_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07d_EQ_done
.Lxor_full_07d_EQ_true:
    bit_emit_char 'B'
.Lxor_full_07d_EQ_done:
    brne8 .Lxor_full_07d_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07d_NE_done
.Lxor_full_07d_NE_true:
    bit_emit_char 'B'
.Lxor_full_07d_NE_done:
    brult8 .Lxor_full_07d_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07d_ULT_done
.Lxor_full_07d_ULT_true:
    bit_emit_char 'B'
.Lxor_full_07d_ULT_done:
    bruge8 .Lxor_full_07d_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07d_UGE_done
.Lxor_full_07d_UGE_true:
    bit_emit_char 'B'
.Lxor_full_07d_UGE_done:
    brslt8 .Lxor_full_07d_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07d_SLT_done
.Lxor_full_07d_SLT_true:
    bit_emit_char 'B'
.Lxor_full_07d_SLT_done:
    brsge8 .Lxor_full_07d_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07d_SGE_done
.Lxor_full_07d_SGE_true:
    bit_emit_char 'B'
.Lxor_full_07d_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r7; pattern 2; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r3
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    ldi16 r4, 0x77cf
    push16 r4
    pop16 r1
    xor r3, r7
    push16 r1
    push16 r7
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_07e_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07e_EQ_done
.Lxor_full_07e_EQ_true:
    bit_emit_char 'B'
.Lxor_full_07e_EQ_done:
    brne8 .Lxor_full_07e_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07e_NE_done
.Lxor_full_07e_NE_true:
    bit_emit_char 'B'
.Lxor_full_07e_NE_done:
    brult8 .Lxor_full_07e_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07e_ULT_done
.Lxor_full_07e_ULT_true:
    bit_emit_char 'B'
.Lxor_full_07e_ULT_done:
    bruge8 .Lxor_full_07e_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07e_UGE_done
.Lxor_full_07e_UGE_true:
    bit_emit_char 'B'
.Lxor_full_07e_UGE_done:
    brslt8 .Lxor_full_07e_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07e_SLT_done
.Lxor_full_07e_SLT_true:
    bit_emit_char 'B'
.Lxor_full_07e_SLT_done:
    brsge8 .Lxor_full_07e_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07e_SGE_done
.Lxor_full_07e_SGE_true:
    bit_emit_char 'B'
.Lxor_full_07e_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r3,r7; pattern 3; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r3
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r7
    ldi16 r4, 0x7929
    push16 r4
    pop16 r2
    xor r3, r7
    push16 r2
    push16 r7
    push16 r3
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_07f_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07f_EQ_done
.Lxor_full_07f_EQ_true:
    bit_emit_char 'B'
.Lxor_full_07f_EQ_done:
    brne8 .Lxor_full_07f_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07f_NE_done
.Lxor_full_07f_NE_true:
    bit_emit_char 'B'
.Lxor_full_07f_NE_done:
    brult8 .Lxor_full_07f_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07f_ULT_done
.Lxor_full_07f_ULT_true:
    bit_emit_char 'B'
.Lxor_full_07f_ULT_done:
    bruge8 .Lxor_full_07f_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07f_UGE_done
.Lxor_full_07f_UGE_true:
    bit_emit_char 'B'
.Lxor_full_07f_UGE_done:
    brslt8 .Lxor_full_07f_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07f_SLT_done
.Lxor_full_07f_SLT_true:
    bit_emit_char 'B'
.Lxor_full_07f_SLT_done:
    brsge8 .Lxor_full_07f_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_07f_SGE_done
.Lxor_full_07f_SGE_true:
    bit_emit_char 'B'
.Lxor_full_07f_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r0; pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r6, 0xf00f
    push16 r6
    pop16 r4
    ldi16 r6, 0xcccc
    push16 r6
    pop16 r0
    ldi16 r6, 0x7c85
    push16 r6
    pop16 r5
    xor r4, r0
    push16 r5
    push16 r0
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_080_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_080_EQ_done
.Lxor_full_080_EQ_true:
    bit_emit_char 'B'
.Lxor_full_080_EQ_done:
    brne8 .Lxor_full_080_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_080_NE_done
.Lxor_full_080_NE_true:
    bit_emit_char 'B'
.Lxor_full_080_NE_done:
    brult8 .Lxor_full_080_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_080_ULT_done
.Lxor_full_080_ULT_true:
    bit_emit_char 'B'
.Lxor_full_080_ULT_done:
    bruge8 .Lxor_full_080_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_080_UGE_done
.Lxor_full_080_UGE_true:
    bit_emit_char 'B'
.Lxor_full_080_UGE_done:
    brslt8 .Lxor_full_080_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_080_SLT_done
.Lxor_full_080_SLT_true:
    bit_emit_char 'B'
.Lxor_full_080_SLT_done:
    brsge8 .Lxor_full_080_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_080_SGE_done
.Lxor_full_080_SGE_true:
    bit_emit_char 'B'
.Lxor_full_080_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r0; pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x8001
    push16 r5
    pop16 r4
    ldi16 r5, 0x7ffe
    push16 r5
    pop16 r0
    ldi16 r5, 0x7ddf
    push16 r5
    pop16 r6
    xor r4, r0
    push16 r6
    push16 r0
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_081_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_081_EQ_done
.Lxor_full_081_EQ_true:
    bit_emit_char 'B'
.Lxor_full_081_EQ_done:
    brne8 .Lxor_full_081_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_081_NE_done
.Lxor_full_081_NE_true:
    bit_emit_char 'B'
.Lxor_full_081_NE_done:
    brult8 .Lxor_full_081_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_081_ULT_done
.Lxor_full_081_ULT_true:
    bit_emit_char 'B'
.Lxor_full_081_ULT_done:
    bruge8 .Lxor_full_081_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_081_UGE_done
.Lxor_full_081_UGE_true:
    bit_emit_char 'B'
.Lxor_full_081_UGE_done:
    brslt8 .Lxor_full_081_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_081_SLT_done
.Lxor_full_081_SLT_true:
    bit_emit_char 'B'
.Lxor_full_081_SLT_done:
    brsge8 .Lxor_full_081_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_081_SGE_done
.Lxor_full_081_SGE_true:
    bit_emit_char 'B'
.Lxor_full_081_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r0; pattern 2; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r4
    ldi16 r5, 0xffff
    push16 r5
    pop16 r0
    ldi16 r5, 0x7f39
    push16 r5
    pop16 r7
    xor r4, r0
    push16 r7
    push16 r0
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_082_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_082_EQ_done
.Lxor_full_082_EQ_true:
    bit_emit_char 'B'
.Lxor_full_082_EQ_done:
    brne8 .Lxor_full_082_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_082_NE_done
.Lxor_full_082_NE_true:
    bit_emit_char 'B'
.Lxor_full_082_NE_done:
    brult8 .Lxor_full_082_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_082_ULT_done
.Lxor_full_082_ULT_true:
    bit_emit_char 'B'
.Lxor_full_082_ULT_done:
    bruge8 .Lxor_full_082_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_082_UGE_done
.Lxor_full_082_UGE_true:
    bit_emit_char 'B'
.Lxor_full_082_UGE_done:
    brslt8 .Lxor_full_082_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_082_SLT_done
.Lxor_full_082_SLT_true:
    bit_emit_char 'B'
.Lxor_full_082_SLT_done:
    brsge8 .Lxor_full_082_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_082_SGE_done
.Lxor_full_082_SGE_true:
    bit_emit_char 'B'
.Lxor_full_082_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r0; pattern 3; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r4
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r0
    ldi16 r5, 0x798c
    push16 r5
    pop16 r1
    xor r4, r0
    push16 r1
    push16 r0
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_083_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_083_EQ_done
.Lxor_full_083_EQ_true:
    bit_emit_char 'B'
.Lxor_full_083_EQ_done:
    brne8 .Lxor_full_083_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_083_NE_done
.Lxor_full_083_NE_true:
    bit_emit_char 'B'
.Lxor_full_083_NE_done:
    brult8 .Lxor_full_083_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_083_ULT_done
.Lxor_full_083_ULT_true:
    bit_emit_char 'B'
.Lxor_full_083_ULT_done:
    bruge8 .Lxor_full_083_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_083_UGE_done
.Lxor_full_083_UGE_true:
    bit_emit_char 'B'
.Lxor_full_083_UGE_done:
    brslt8 .Lxor_full_083_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_083_SLT_done
.Lxor_full_083_SLT_true:
    bit_emit_char 'B'
.Lxor_full_083_SLT_done:
    brsge8 .Lxor_full_083_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_083_SGE_done
.Lxor_full_083_SGE_true:
    bit_emit_char 'B'
.Lxor_full_083_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r1; pattern 0; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r4
    ldi16 r5, 0x0000
    push16 r5
    pop16 r1
    ldi16 r5, 0x7ae6
    push16 r5
    pop16 r2
    xor r4, r1
    push16 r2
    push16 r1
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_084_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_084_EQ_done
.Lxor_full_084_EQ_true:
    bit_emit_char 'B'
.Lxor_full_084_EQ_done:
    brne8 .Lxor_full_084_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_084_NE_done
.Lxor_full_084_NE_true:
    bit_emit_char 'B'
.Lxor_full_084_NE_done:
    brult8 .Lxor_full_084_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_084_ULT_done
.Lxor_full_084_ULT_true:
    bit_emit_char 'B'
.Lxor_full_084_ULT_done:
    bruge8 .Lxor_full_084_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_084_UGE_done
.Lxor_full_084_UGE_true:
    bit_emit_char 'B'
.Lxor_full_084_UGE_done:
    brslt8 .Lxor_full_084_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_084_SLT_done
.Lxor_full_084_SLT_true:
    bit_emit_char 'B'
.Lxor_full_084_SLT_done:
    brsge8 .Lxor_full_084_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_084_SGE_done
.Lxor_full_084_SGE_true:
    bit_emit_char 'B'
.Lxor_full_084_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r1; pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x0ff0
    push16 r5
    pop16 r4
    ldi16 r5, 0x3333
    push16 r5
    pop16 r1
    ldi16 r5, 0x7c40
    push16 r5
    pop16 r3
    xor r4, r1
    push16 r3
    push16 r1
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_085_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_085_EQ_done
.Lxor_full_085_EQ_true:
    bit_emit_char 'B'
.Lxor_full_085_EQ_done:
    brne8 .Lxor_full_085_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_085_NE_done
.Lxor_full_085_NE_true:
    bit_emit_char 'B'
.Lxor_full_085_NE_done:
    brult8 .Lxor_full_085_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_085_ULT_done
.Lxor_full_085_ULT_true:
    bit_emit_char 'B'
.Lxor_full_085_ULT_done:
    bruge8 .Lxor_full_085_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_085_UGE_done
.Lxor_full_085_UGE_true:
    bit_emit_char 'B'
.Lxor_full_085_UGE_done:
    brslt8 .Lxor_full_085_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_085_SLT_done
.Lxor_full_085_SLT_true:
    bit_emit_char 'B'
.Lxor_full_085_SLT_done:
    brsge8 .Lxor_full_085_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_085_SGE_done
.Lxor_full_085_SGE_true:
    bit_emit_char 'B'
.Lxor_full_085_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r1; pattern 2; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x1234
    push16 r6
    pop16 r4
    ldi16 r6, 0x00ff
    push16 r6
    pop16 r1
    ldi16 r6, 0x7e9b
    push16 r6
    pop16 r5
    xor r4, r1
    push16 r5
    push16 r1
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_086_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_086_EQ_done
.Lxor_full_086_EQ_true:
    bit_emit_char 'B'
.Lxor_full_086_EQ_done:
    brne8 .Lxor_full_086_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_086_NE_done
.Lxor_full_086_NE_true:
    bit_emit_char 'B'
.Lxor_full_086_NE_done:
    brult8 .Lxor_full_086_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_086_ULT_done
.Lxor_full_086_ULT_true:
    bit_emit_char 'B'
.Lxor_full_086_ULT_done:
    bruge8 .Lxor_full_086_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_086_UGE_done
.Lxor_full_086_UGE_true:
    bit_emit_char 'B'
.Lxor_full_086_UGE_done:
    brslt8 .Lxor_full_086_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_086_SLT_done
.Lxor_full_086_SLT_true:
    bit_emit_char 'B'
.Lxor_full_086_SLT_done:
    brsge8 .Lxor_full_086_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_086_SGE_done
.Lxor_full_086_SGE_true:
    bit_emit_char 'B'
.Lxor_full_086_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r1; pattern 3; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r6, 0xdead
    push16 r6
    pop16 r4
    ldi16 r6, 0xbeef
    push16 r6
    pop16 r1
    ldi16 r6, 0x7ef4
    push16 r6
    pop16 r5
    xor r4, r1
    push16 r5
    push16 r1
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_087_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_087_EQ_done
.Lxor_full_087_EQ_true:
    bit_emit_char 'B'
.Lxor_full_087_EQ_done:
    brne8 .Lxor_full_087_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_087_NE_done
.Lxor_full_087_NE_true:
    bit_emit_char 'B'
.Lxor_full_087_NE_done:
    brult8 .Lxor_full_087_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_087_ULT_done
.Lxor_full_087_ULT_true:
    bit_emit_char 'B'
.Lxor_full_087_ULT_done:
    bruge8 .Lxor_full_087_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_087_UGE_done
.Lxor_full_087_UGE_true:
    bit_emit_char 'B'
.Lxor_full_087_UGE_done:
    brslt8 .Lxor_full_087_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_087_SLT_done
.Lxor_full_087_SLT_true:
    bit_emit_char 'B'
.Lxor_full_087_SLT_done:
    brsge8 .Lxor_full_087_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_087_SGE_done
.Lxor_full_087_SGE_true:
    bit_emit_char 'B'
.Lxor_full_087_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r2; pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x8001
    push16 r5
    pop16 r4
    ldi16 r5, 0x7ffe
    push16 r5
    pop16 r2
    ldi16 r5, 0x814f
    push16 r5
    pop16 r7
    xor r4, r2
    push16 r7
    push16 r2
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_088_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_088_EQ_done
.Lxor_full_088_EQ_true:
    bit_emit_char 'B'
.Lxor_full_088_EQ_done:
    brne8 .Lxor_full_088_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_088_NE_done
.Lxor_full_088_NE_true:
    bit_emit_char 'B'
.Lxor_full_088_NE_done:
    brult8 .Lxor_full_088_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_088_ULT_done
.Lxor_full_088_ULT_true:
    bit_emit_char 'B'
.Lxor_full_088_ULT_done:
    bruge8 .Lxor_full_088_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_088_UGE_done
.Lxor_full_088_UGE_true:
    bit_emit_char 'B'
.Lxor_full_088_UGE_done:
    brslt8 .Lxor_full_088_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_088_SLT_done
.Lxor_full_088_SLT_true:
    bit_emit_char 'B'
.Lxor_full_088_SLT_done:
    brsge8 .Lxor_full_088_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_088_SGE_done
.Lxor_full_088_SGE_true:
    bit_emit_char 'B'
.Lxor_full_088_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r2; pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0000
    push16 r5
    pop16 r4
    ldi16 r5, 0xffff
    push16 r5
    pop16 r2
    ldi16 r5, 0x7aa1
    push16 r5
    pop16 r0
    xor r4, r2
    push16 r0
    push16 r2
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_089_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_089_EQ_done
.Lxor_full_089_EQ_true:
    bit_emit_char 'B'
.Lxor_full_089_EQ_done:
    brne8 .Lxor_full_089_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_089_NE_done
.Lxor_full_089_NE_true:
    bit_emit_char 'B'
.Lxor_full_089_NE_done:
    brult8 .Lxor_full_089_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_089_ULT_done
.Lxor_full_089_ULT_true:
    bit_emit_char 'B'
.Lxor_full_089_ULT_done:
    bruge8 .Lxor_full_089_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_089_UGE_done
.Lxor_full_089_UGE_true:
    bit_emit_char 'B'
.Lxor_full_089_UGE_done:
    brslt8 .Lxor_full_089_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_089_SLT_done
.Lxor_full_089_SLT_true:
    bit_emit_char 'B'
.Lxor_full_089_SLT_done:
    brsge8 .Lxor_full_089_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_089_SGE_done
.Lxor_full_089_SGE_true:
    bit_emit_char 'B'
.Lxor_full_089_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r2; pattern 2; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r4
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r2
    ldi16 r5, 0x7bfb
    push16 r5
    pop16 r1
    xor r4, r2
    push16 r1
    push16 r2
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_08a_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08a_EQ_done
.Lxor_full_08a_EQ_true:
    bit_emit_char 'B'
.Lxor_full_08a_EQ_done:
    brne8 .Lxor_full_08a_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08a_NE_done
.Lxor_full_08a_NE_true:
    bit_emit_char 'B'
.Lxor_full_08a_NE_done:
    brult8 .Lxor_full_08a_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08a_ULT_done
.Lxor_full_08a_ULT_true:
    bit_emit_char 'B'
.Lxor_full_08a_ULT_done:
    bruge8 .Lxor_full_08a_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08a_UGE_done
.Lxor_full_08a_UGE_true:
    bit_emit_char 'B'
.Lxor_full_08a_UGE_done:
    brslt8 .Lxor_full_08a_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08a_SLT_done
.Lxor_full_08a_SLT_true:
    bit_emit_char 'B'
.Lxor_full_08a_SLT_done:
    brsge8 .Lxor_full_08a_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08a_SGE_done
.Lxor_full_08a_SGE_true:
    bit_emit_char 'B'
.Lxor_full_08a_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r2; pattern 3; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0xf00f
    push16 r5
    pop16 r4
    ldi16 r5, 0xcccc
    push16 r5
    pop16 r2
    ldi16 r5, 0x7e56
    push16 r5
    pop16 r3
    xor r4, r2
    push16 r3
    push16 r2
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_08b_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08b_EQ_done
.Lxor_full_08b_EQ_true:
    bit_emit_char 'B'
.Lxor_full_08b_EQ_done:
    brne8 .Lxor_full_08b_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08b_NE_done
.Lxor_full_08b_NE_true:
    bit_emit_char 'B'
.Lxor_full_08b_NE_done:
    brult8 .Lxor_full_08b_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08b_ULT_done
.Lxor_full_08b_ULT_true:
    bit_emit_char 'B'
.Lxor_full_08b_ULT_done:
    bruge8 .Lxor_full_08b_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08b_UGE_done
.Lxor_full_08b_UGE_true:
    bit_emit_char 'B'
.Lxor_full_08b_UGE_done:
    brslt8 .Lxor_full_08b_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08b_SLT_done
.Lxor_full_08b_SLT_true:
    bit_emit_char 'B'
.Lxor_full_08b_SLT_done:
    brsge8 .Lxor_full_08b_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08b_SGE_done
.Lxor_full_08b_SGE_true:
    bit_emit_char 'B'
.Lxor_full_08b_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r3; pattern 0; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x0ff0
    push16 r6
    pop16 r4
    ldi16 r6, 0x3333
    push16 r6
    pop16 r3
    ldi16 r6, 0x80b1
    push16 r6
    pop16 r5
    xor r4, r3
    push16 r5
    push16 r3
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_08c_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08c_EQ_done
.Lxor_full_08c_EQ_true:
    bit_emit_char 'B'
.Lxor_full_08c_EQ_done:
    brne8 .Lxor_full_08c_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08c_NE_done
.Lxor_full_08c_NE_true:
    bit_emit_char 'B'
.Lxor_full_08c_NE_done:
    brult8 .Lxor_full_08c_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08c_ULT_done
.Lxor_full_08c_ULT_true:
    bit_emit_char 'B'
.Lxor_full_08c_ULT_done:
    bruge8 .Lxor_full_08c_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08c_UGE_done
.Lxor_full_08c_UGE_true:
    bit_emit_char 'B'
.Lxor_full_08c_UGE_done:
    brslt8 .Lxor_full_08c_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08c_SLT_done
.Lxor_full_08c_SLT_true:
    bit_emit_char 'B'
.Lxor_full_08c_SLT_done:
    brsge8 .Lxor_full_08c_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08c_SGE_done
.Lxor_full_08c_SGE_true:
    bit_emit_char 'B'
.Lxor_full_08c_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r3; pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r6, 0x1234
    push16 r6
    pop16 r4
    ldi16 r6, 0x00ff
    push16 r6
    pop16 r3
    ldi16 r6, 0x810a
    push16 r6
    pop16 r5
    xor r4, r3
    push16 r5
    push16 r3
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_08d_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08d_EQ_done
.Lxor_full_08d_EQ_true:
    bit_emit_char 'B'
.Lxor_full_08d_EQ_done:
    brne8 .Lxor_full_08d_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08d_NE_done
.Lxor_full_08d_NE_true:
    bit_emit_char 'B'
.Lxor_full_08d_NE_done:
    brult8 .Lxor_full_08d_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08d_ULT_done
.Lxor_full_08d_ULT_true:
    bit_emit_char 'B'
.Lxor_full_08d_ULT_done:
    bruge8 .Lxor_full_08d_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08d_UGE_done
.Lxor_full_08d_UGE_true:
    bit_emit_char 'B'
.Lxor_full_08d_UGE_done:
    brslt8 .Lxor_full_08d_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08d_SLT_done
.Lxor_full_08d_SLT_true:
    bit_emit_char 'B'
.Lxor_full_08d_SLT_done:
    brsge8 .Lxor_full_08d_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08d_SGE_done
.Lxor_full_08d_SGE_true:
    bit_emit_char 'B'
.Lxor_full_08d_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r3; pattern 2; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0xdead
    push16 r5
    pop16 r4
    ldi16 r5, 0xbeef
    push16 r5
    pop16 r3
    ldi16 r5, 0x8264
    push16 r5
    pop16 r6
    xor r4, r3
    push16 r6
    push16 r3
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_08e_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08e_EQ_done
.Lxor_full_08e_EQ_true:
    bit_emit_char 'B'
.Lxor_full_08e_EQ_done:
    brne8 .Lxor_full_08e_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08e_NE_done
.Lxor_full_08e_NE_true:
    bit_emit_char 'B'
.Lxor_full_08e_NE_done:
    brult8 .Lxor_full_08e_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08e_ULT_done
.Lxor_full_08e_ULT_true:
    bit_emit_char 'B'
.Lxor_full_08e_ULT_done:
    bruge8 .Lxor_full_08e_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08e_UGE_done
.Lxor_full_08e_UGE_true:
    bit_emit_char 'B'
.Lxor_full_08e_UGE_done:
    brslt8 .Lxor_full_08e_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08e_SLT_done
.Lxor_full_08e_SLT_true:
    bit_emit_char 'B'
.Lxor_full_08e_SLT_done:
    brsge8 .Lxor_full_08e_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08e_SGE_done
.Lxor_full_08e_SGE_true:
    bit_emit_char 'B'
.Lxor_full_08e_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r4,r3; pattern 3; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0xffff
    push16 r5
    pop16 r4
    ldi16 r5, 0x0000
    push16 r5
    pop16 r3
    ldi16 r5, 0x83be
    push16 r5
    pop16 r7
    xor r4, r3
    push16 r7
    push16 r3
    push16 r4
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_08f_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08f_EQ_done
.Lxor_full_08f_EQ_true:
    bit_emit_char 'B'
.Lxor_full_08f_EQ_done:
    brne8 .Lxor_full_08f_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08f_NE_done
.Lxor_full_08f_NE_true:
    bit_emit_char 'B'
.Lxor_full_08f_NE_done:
    brult8 .Lxor_full_08f_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08f_ULT_done
.Lxor_full_08f_ULT_true:
    bit_emit_char 'B'
.Lxor_full_08f_ULT_done:
    bruge8 .Lxor_full_08f_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08f_UGE_done
.Lxor_full_08f_UGE_true:
    bit_emit_char 'B'
.Lxor_full_08f_UGE_done:
    brslt8 .Lxor_full_08f_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08f_SLT_done
.Lxor_full_08f_SLT_true:
    bit_emit_char 'B'
.Lxor_full_08f_SLT_done:
    brsge8 .Lxor_full_08f_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_08f_SGE_done
.Lxor_full_08f_SGE_true:
    bit_emit_char 'B'
.Lxor_full_08f_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r0; pattern 0; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r5
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r0
    ldi16 r4, 0x8316
    push16 r4
    pop16 r6
    xor r5, r0
    push16 r6
    push16 r0
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_090_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_090_EQ_done
.Lxor_full_090_EQ_true:
    bit_emit_char 'B'
.Lxor_full_090_EQ_done:
    brne8 .Lxor_full_090_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_090_NE_done
.Lxor_full_090_NE_true:
    bit_emit_char 'B'
.Lxor_full_090_NE_done:
    brult8 .Lxor_full_090_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_090_ULT_done
.Lxor_full_090_ULT_true:
    bit_emit_char 'B'
.Lxor_full_090_ULT_done:
    bruge8 .Lxor_full_090_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_090_UGE_done
.Lxor_full_090_UGE_true:
    bit_emit_char 'B'
.Lxor_full_090_UGE_done:
    brslt8 .Lxor_full_090_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_090_SLT_done
.Lxor_full_090_SLT_true:
    bit_emit_char 'B'
.Lxor_full_090_SLT_done:
    brsge8 .Lxor_full_090_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_090_SGE_done
.Lxor_full_090_SGE_true:
    bit_emit_char 'B'
.Lxor_full_090_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r0; pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r5
    ldi16 r4, 0x0000
    push16 r4
    pop16 r0
    ldi16 r4, 0x8470
    push16 r4
    pop16 r7
    xor r5, r0
    push16 r7
    push16 r0
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_091_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_091_EQ_done
.Lxor_full_091_EQ_true:
    bit_emit_char 'B'
.Lxor_full_091_EQ_done:
    brne8 .Lxor_full_091_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_091_NE_done
.Lxor_full_091_NE_true:
    bit_emit_char 'B'
.Lxor_full_091_NE_done:
    brult8 .Lxor_full_091_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_091_ULT_done
.Lxor_full_091_ULT_true:
    bit_emit_char 'B'
.Lxor_full_091_ULT_done:
    bruge8 .Lxor_full_091_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_091_UGE_done
.Lxor_full_091_UGE_true:
    bit_emit_char 'B'
.Lxor_full_091_UGE_done:
    brslt8 .Lxor_full_091_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_091_SLT_done
.Lxor_full_091_SLT_true:
    bit_emit_char 'B'
.Lxor_full_091_SLT_done:
    brsge8 .Lxor_full_091_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_091_SGE_done
.Lxor_full_091_SGE_true:
    bit_emit_char 'B'
.Lxor_full_091_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r0; pattern 2; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r5
    ldi16 r4, 0x3333
    push16 r4
    pop16 r0
    ldi16 r4, 0x7ec3
    push16 r4
    pop16 r1
    xor r5, r0
    push16 r1
    push16 r0
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_092_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_092_EQ_done
.Lxor_full_092_EQ_true:
    bit_emit_char 'B'
.Lxor_full_092_EQ_done:
    brne8 .Lxor_full_092_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_092_NE_done
.Lxor_full_092_NE_true:
    bit_emit_char 'B'
.Lxor_full_092_NE_done:
    brult8 .Lxor_full_092_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_092_ULT_done
.Lxor_full_092_ULT_true:
    bit_emit_char 'B'
.Lxor_full_092_ULT_done:
    bruge8 .Lxor_full_092_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_092_UGE_done
.Lxor_full_092_UGE_true:
    bit_emit_char 'B'
.Lxor_full_092_UGE_done:
    brslt8 .Lxor_full_092_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_092_SLT_done
.Lxor_full_092_SLT_true:
    bit_emit_char 'B'
.Lxor_full_092_SLT_done:
    brsge8 .Lxor_full_092_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_092_SGE_done
.Lxor_full_092_SGE_true:
    bit_emit_char 'B'
.Lxor_full_092_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r0; pattern 3; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r5
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r0
    ldi16 r4, 0x7f1c
    push16 r4
    pop16 r1
    xor r5, r0
    push16 r1
    push16 r0
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_093_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_093_EQ_done
.Lxor_full_093_EQ_true:
    bit_emit_char 'B'
.Lxor_full_093_EQ_done:
    brne8 .Lxor_full_093_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_093_NE_done
.Lxor_full_093_NE_true:
    bit_emit_char 'B'
.Lxor_full_093_NE_done:
    brult8 .Lxor_full_093_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_093_ULT_done
.Lxor_full_093_ULT_true:
    bit_emit_char 'B'
.Lxor_full_093_ULT_done:
    bruge8 .Lxor_full_093_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_093_UGE_done
.Lxor_full_093_UGE_true:
    bit_emit_char 'B'
.Lxor_full_093_UGE_done:
    brslt8 .Lxor_full_093_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_093_SLT_done
.Lxor_full_093_SLT_true:
    bit_emit_char 'B'
.Lxor_full_093_SLT_done:
    brsge8 .Lxor_full_093_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_093_SGE_done
.Lxor_full_093_SGE_true:
    bit_emit_char 'B'
.Lxor_full_093_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r1; pattern 0; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r5
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r1
    ldi16 r4, 0x8177
    push16 r4
    pop16 r3
    xor r5, r1
    push16 r3
    push16 r1
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_094_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_094_EQ_done
.Lxor_full_094_EQ_true:
    bit_emit_char 'B'
.Lxor_full_094_EQ_done:
    brne8 .Lxor_full_094_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_094_NE_done
.Lxor_full_094_NE_true:
    bit_emit_char 'B'
.Lxor_full_094_NE_done:
    brult8 .Lxor_full_094_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_094_ULT_done
.Lxor_full_094_ULT_true:
    bit_emit_char 'B'
.Lxor_full_094_ULT_done:
    bruge8 .Lxor_full_094_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_094_UGE_done
.Lxor_full_094_UGE_true:
    bit_emit_char 'B'
.Lxor_full_094_UGE_done:
    brslt8 .Lxor_full_094_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_094_SLT_done
.Lxor_full_094_SLT_true:
    bit_emit_char 'B'
.Lxor_full_094_SLT_done:
    brsge8 .Lxor_full_094_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_094_SGE_done
.Lxor_full_094_SGE_true:
    bit_emit_char 'B'
.Lxor_full_094_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r1; pattern 1; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r6, 0x8001
    push16 r6
    pop16 r5
    ldi16 r6, 0x7ffe
    push16 r6
    pop16 r1
    ldi16 r6, 0x82d1
    push16 r6
    pop16 r4
    xor r5, r1
    push16 r4
    push16 r1
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_095_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_095_EQ_done
.Lxor_full_095_EQ_true:
    bit_emit_char 'B'
.Lxor_full_095_EQ_done:
    brne8 .Lxor_full_095_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_095_NE_done
.Lxor_full_095_NE_true:
    bit_emit_char 'B'
.Lxor_full_095_NE_done:
    brult8 .Lxor_full_095_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_095_ULT_done
.Lxor_full_095_ULT_true:
    bit_emit_char 'B'
.Lxor_full_095_ULT_done:
    bruge8 .Lxor_full_095_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_095_UGE_done
.Lxor_full_095_UGE_true:
    bit_emit_char 'B'
.Lxor_full_095_UGE_done:
    brslt8 .Lxor_full_095_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_095_SLT_done
.Lxor_full_095_SLT_true:
    bit_emit_char 'B'
.Lxor_full_095_SLT_done:
    brsge8 .Lxor_full_095_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_095_SGE_done
.Lxor_full_095_SGE_true:
    bit_emit_char 'B'
.Lxor_full_095_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r1; pattern 2; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r5
    ldi16 r4, 0xffff
    push16 r4
    pop16 r1
    ldi16 r4, 0x852c
    push16 r4
    pop16 r6
    xor r5, r1
    push16 r6
    push16 r1
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_096_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_096_EQ_done
.Lxor_full_096_EQ_true:
    bit_emit_char 'B'
.Lxor_full_096_EQ_done:
    brne8 .Lxor_full_096_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_096_NE_done
.Lxor_full_096_NE_true:
    bit_emit_char 'B'
.Lxor_full_096_NE_done:
    brult8 .Lxor_full_096_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_096_ULT_done
.Lxor_full_096_ULT_true:
    bit_emit_char 'B'
.Lxor_full_096_ULT_done:
    bruge8 .Lxor_full_096_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_096_UGE_done
.Lxor_full_096_UGE_true:
    bit_emit_char 'B'
.Lxor_full_096_UGE_done:
    brslt8 .Lxor_full_096_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_096_SLT_done
.Lxor_full_096_SLT_true:
    bit_emit_char 'B'
.Lxor_full_096_SLT_done:
    brsge8 .Lxor_full_096_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_096_SGE_done
.Lxor_full_096_SGE_true:
    bit_emit_char 'B'
.Lxor_full_096_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r1; pattern 3; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r5
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r1
    ldi16 r4, 0x8585
    push16 r4
    pop16 r6
    xor r5, r1
    push16 r6
    push16 r1
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_097_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_097_EQ_done
.Lxor_full_097_EQ_true:
    bit_emit_char 'B'
.Lxor_full_097_EQ_done:
    brne8 .Lxor_full_097_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_097_NE_done
.Lxor_full_097_NE_true:
    bit_emit_char 'B'
.Lxor_full_097_NE_done:
    brult8 .Lxor_full_097_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_097_ULT_done
.Lxor_full_097_ULT_true:
    bit_emit_char 'B'
.Lxor_full_097_ULT_done:
    bruge8 .Lxor_full_097_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_097_UGE_done
.Lxor_full_097_UGE_true:
    bit_emit_char 'B'
.Lxor_full_097_UGE_done:
    brslt8 .Lxor_full_097_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_097_SLT_done
.Lxor_full_097_SLT_true:
    bit_emit_char 'B'
.Lxor_full_097_SLT_done:
    brsge8 .Lxor_full_097_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_097_SGE_done
.Lxor_full_097_SGE_true:
    bit_emit_char 'B'
.Lxor_full_097_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r2; pattern 0; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r5
    ldi16 r4, 0x0000
    push16 r4
    pop16 r2
    ldi16 r4, 0x7fd8
    push16 r4
    pop16 r0
    xor r5, r2
    push16 r0
    push16 r2
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_098_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_098_EQ_done
.Lxor_full_098_EQ_true:
    bit_emit_char 'B'
.Lxor_full_098_EQ_done:
    brne8 .Lxor_full_098_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_098_NE_done
.Lxor_full_098_NE_true:
    bit_emit_char 'B'
.Lxor_full_098_NE_done:
    brult8 .Lxor_full_098_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_098_ULT_done
.Lxor_full_098_ULT_true:
    bit_emit_char 'B'
.Lxor_full_098_ULT_done:
    bruge8 .Lxor_full_098_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_098_UGE_done
.Lxor_full_098_UGE_true:
    bit_emit_char 'B'
.Lxor_full_098_UGE_done:
    brslt8 .Lxor_full_098_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_098_SLT_done
.Lxor_full_098_SLT_true:
    bit_emit_char 'B'
.Lxor_full_098_SLT_done:
    brsge8 .Lxor_full_098_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_098_SGE_done
.Lxor_full_098_SGE_true:
    bit_emit_char 'B'
.Lxor_full_098_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r2; pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r5
    ldi16 r4, 0x3333
    push16 r4
    pop16 r2
    ldi16 r4, 0x8132
    push16 r4
    pop16 r1
    xor r5, r2
    push16 r1
    push16 r2
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_099_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_099_EQ_done
.Lxor_full_099_EQ_true:
    bit_emit_char 'B'
.Lxor_full_099_EQ_done:
    brne8 .Lxor_full_099_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_099_NE_done
.Lxor_full_099_NE_true:
    bit_emit_char 'B'
.Lxor_full_099_NE_done:
    brult8 .Lxor_full_099_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_099_ULT_done
.Lxor_full_099_ULT_true:
    bit_emit_char 'B'
.Lxor_full_099_ULT_done:
    bruge8 .Lxor_full_099_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_099_UGE_done
.Lxor_full_099_UGE_true:
    bit_emit_char 'B'
.Lxor_full_099_UGE_done:
    brslt8 .Lxor_full_099_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_099_SLT_done
.Lxor_full_099_SLT_true:
    bit_emit_char 'B'
.Lxor_full_099_SLT_done:
    brsge8 .Lxor_full_099_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_099_SGE_done
.Lxor_full_099_SGE_true:
    bit_emit_char 'B'
.Lxor_full_099_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r2; pattern 2; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r5
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r2
    ldi16 r4, 0x838d
    push16 r4
    pop16 r3
    xor r5, r2
    push16 r3
    push16 r2
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_09a_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09a_EQ_done
.Lxor_full_09a_EQ_true:
    bit_emit_char 'B'
.Lxor_full_09a_EQ_done:
    brne8 .Lxor_full_09a_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09a_NE_done
.Lxor_full_09a_NE_true:
    bit_emit_char 'B'
.Lxor_full_09a_NE_done:
    brult8 .Lxor_full_09a_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09a_ULT_done
.Lxor_full_09a_ULT_true:
    bit_emit_char 'B'
.Lxor_full_09a_ULT_done:
    bruge8 .Lxor_full_09a_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09a_UGE_done
.Lxor_full_09a_UGE_true:
    bit_emit_char 'B'
.Lxor_full_09a_UGE_done:
    brslt8 .Lxor_full_09a_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09a_SLT_done
.Lxor_full_09a_SLT_true:
    bit_emit_char 'B'
.Lxor_full_09a_SLT_done:
    brsge8 .Lxor_full_09a_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09a_SGE_done
.Lxor_full_09a_SGE_true:
    bit_emit_char 'B'
.Lxor_full_09a_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r2; pattern 3; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r5
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r2
    ldi16 r4, 0x83e6
    push16 r4
    pop16 r3
    xor r5, r2
    push16 r3
    push16 r2
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_09b_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09b_EQ_done
.Lxor_full_09b_EQ_true:
    bit_emit_char 'B'
.Lxor_full_09b_EQ_done:
    brne8 .Lxor_full_09b_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09b_NE_done
.Lxor_full_09b_NE_true:
    bit_emit_char 'B'
.Lxor_full_09b_NE_done:
    brult8 .Lxor_full_09b_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09b_ULT_done
.Lxor_full_09b_ULT_true:
    bit_emit_char 'B'
.Lxor_full_09b_ULT_done:
    bruge8 .Lxor_full_09b_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09b_UGE_done
.Lxor_full_09b_UGE_true:
    bit_emit_char 'B'
.Lxor_full_09b_UGE_done:
    brslt8 .Lxor_full_09b_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09b_SLT_done
.Lxor_full_09b_SLT_true:
    bit_emit_char 'B'
.Lxor_full_09b_SLT_done:
    brsge8 .Lxor_full_09b_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09b_SGE_done
.Lxor_full_09b_SGE_true:
    bit_emit_char 'B'
.Lxor_full_09b_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r3; pattern 0; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r5
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r3
    ldi16 r4, 0x8742
    push16 r4
    pop16 r6
    xor r5, r3
    push16 r6
    push16 r3
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_09c_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09c_EQ_done
.Lxor_full_09c_EQ_true:
    bit_emit_char 'B'
.Lxor_full_09c_EQ_done:
    brne8 .Lxor_full_09c_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09c_NE_done
.Lxor_full_09c_NE_true:
    bit_emit_char 'B'
.Lxor_full_09c_NE_done:
    brult8 .Lxor_full_09c_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09c_ULT_done
.Lxor_full_09c_ULT_true:
    bit_emit_char 'B'
.Lxor_full_09c_ULT_done:
    bruge8 .Lxor_full_09c_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09c_UGE_done
.Lxor_full_09c_UGE_true:
    bit_emit_char 'B'
.Lxor_full_09c_UGE_done:
    brslt8 .Lxor_full_09c_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09c_SLT_done
.Lxor_full_09c_SLT_true:
    bit_emit_char 'B'
.Lxor_full_09c_SLT_done:
    brsge8 .Lxor_full_09c_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09c_SGE_done
.Lxor_full_09c_SGE_true:
    bit_emit_char 'B'
.Lxor_full_09c_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r3; pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r5
    ldi16 r4, 0xffff
    push16 r4
    pop16 r3
    ldi16 r4, 0x879b
    push16 r4
    pop16 r6
    xor r5, r3
    push16 r6
    push16 r3
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_09d_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09d_EQ_done
.Lxor_full_09d_EQ_true:
    bit_emit_char 'B'
.Lxor_full_09d_EQ_done:
    brne8 .Lxor_full_09d_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09d_NE_done
.Lxor_full_09d_NE_true:
    bit_emit_char 'B'
.Lxor_full_09d_NE_done:
    brult8 .Lxor_full_09d_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09d_ULT_done
.Lxor_full_09d_ULT_true:
    bit_emit_char 'B'
.Lxor_full_09d_ULT_done:
    bruge8 .Lxor_full_09d_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09d_UGE_done
.Lxor_full_09d_UGE_true:
    bit_emit_char 'B'
.Lxor_full_09d_UGE_done:
    brslt8 .Lxor_full_09d_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09d_SLT_done
.Lxor_full_09d_SLT_true:
    bit_emit_char 'B'
.Lxor_full_09d_SLT_done:
    brsge8 .Lxor_full_09d_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09d_SGE_done
.Lxor_full_09d_SGE_true:
    bit_emit_char 'B'
.Lxor_full_09d_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r3; pattern 2; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r5
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r3
    ldi16 r4, 0x88f5
    push16 r4
    pop16 r7
    xor r5, r3
    push16 r7
    push16 r3
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_09e_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09e_EQ_done
.Lxor_full_09e_EQ_true:
    bit_emit_char 'B'
.Lxor_full_09e_EQ_done:
    brne8 .Lxor_full_09e_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09e_NE_done
.Lxor_full_09e_NE_true:
    bit_emit_char 'B'
.Lxor_full_09e_NE_done:
    brult8 .Lxor_full_09e_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09e_ULT_done
.Lxor_full_09e_ULT_true:
    bit_emit_char 'B'
.Lxor_full_09e_ULT_done:
    bruge8 .Lxor_full_09e_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09e_UGE_done
.Lxor_full_09e_UGE_true:
    bit_emit_char 'B'
.Lxor_full_09e_UGE_done:
    brslt8 .Lxor_full_09e_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09e_SLT_done
.Lxor_full_09e_SLT_true:
    bit_emit_char 'B'
.Lxor_full_09e_SLT_done:
    brsge8 .Lxor_full_09e_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09e_SGE_done
.Lxor_full_09e_SGE_true:
    bit_emit_char 'B'
.Lxor_full_09e_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r5,r3; pattern 3; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r5
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r3
    ldi16 r4, 0x8247
    push16 r4
    pop16 r0
    xor r5, r3
    push16 r0
    push16 r3
    push16 r5
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_09f_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09f_EQ_done
.Lxor_full_09f_EQ_true:
    bit_emit_char 'B'
.Lxor_full_09f_EQ_done:
    brne8 .Lxor_full_09f_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09f_NE_done
.Lxor_full_09f_NE_true:
    bit_emit_char 'B'
.Lxor_full_09f_NE_done:
    brult8 .Lxor_full_09f_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09f_ULT_done
.Lxor_full_09f_ULT_true:
    bit_emit_char 'B'
.Lxor_full_09f_ULT_done:
    bruge8 .Lxor_full_09f_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09f_UGE_done
.Lxor_full_09f_UGE_true:
    bit_emit_char 'B'
.Lxor_full_09f_UGE_done:
    brslt8 .Lxor_full_09f_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09f_SLT_done
.Lxor_full_09f_SLT_true:
    bit_emit_char 'B'
.Lxor_full_09f_SLT_done:
    brsge8 .Lxor_full_09f_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_09f_SGE_done
.Lxor_full_09f_SGE_true:
    bit_emit_char 'B'
.Lxor_full_09f_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r0; pattern 0; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r6
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r0
    ldi16 r4, 0x89a7
    push16 r4
    pop16 r7
    xor r6, r0
    push16 r7
    push16 r0
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0a0_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a0_EQ_done
.Lxor_full_0a0_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0a0_EQ_done:
    brne8 .Lxor_full_0a0_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a0_NE_done
.Lxor_full_0a0_NE_true:
    bit_emit_char 'B'
.Lxor_full_0a0_NE_done:
    brult8 .Lxor_full_0a0_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a0_ULT_done
.Lxor_full_0a0_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0a0_ULT_done:
    bruge8 .Lxor_full_0a0_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a0_UGE_done
.Lxor_full_0a0_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0a0_UGE_done:
    brslt8 .Lxor_full_0a0_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a0_SLT_done
.Lxor_full_0a0_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0a0_SLT_done:
    brsge8 .Lxor_full_0a0_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a0_SGE_done
.Lxor_full_0a0_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0a0_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r0; pattern 1; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r6
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r0
    ldi16 r4, 0x83fa
    push16 r4
    pop16 r1
    xor r6, r0
    push16 r1
    push16 r0
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0a1_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a1_EQ_done
.Lxor_full_0a1_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0a1_EQ_done:
    brne8 .Lxor_full_0a1_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a1_NE_done
.Lxor_full_0a1_NE_true:
    bit_emit_char 'B'
.Lxor_full_0a1_NE_done:
    brult8 .Lxor_full_0a1_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a1_ULT_done
.Lxor_full_0a1_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0a1_ULT_done:
    bruge8 .Lxor_full_0a1_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a1_UGE_done
.Lxor_full_0a1_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0a1_UGE_done:
    brslt8 .Lxor_full_0a1_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a1_SLT_done
.Lxor_full_0a1_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0a1_SLT_done:
    brsge8 .Lxor_full_0a1_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a1_SGE_done
.Lxor_full_0a1_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0a1_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r0; pattern 2; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r6
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r0
    ldi16 r4, 0x8453
    push16 r4
    pop16 r1
    xor r6, r0
    push16 r1
    push16 r0
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0a2_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a2_EQ_done
.Lxor_full_0a2_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0a2_EQ_done:
    brne8 .Lxor_full_0a2_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a2_NE_done
.Lxor_full_0a2_NE_true:
    bit_emit_char 'B'
.Lxor_full_0a2_NE_done:
    brult8 .Lxor_full_0a2_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a2_ULT_done
.Lxor_full_0a2_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0a2_ULT_done:
    bruge8 .Lxor_full_0a2_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a2_UGE_done
.Lxor_full_0a2_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0a2_UGE_done:
    brslt8 .Lxor_full_0a2_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a2_SLT_done
.Lxor_full_0a2_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0a2_SLT_done:
    brsge8 .Lxor_full_0a2_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a2_SGE_done
.Lxor_full_0a2_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0a2_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r0; pattern 3; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r6
    ldi16 r4, 0xffff
    push16 r4
    pop16 r0
    ldi16 r4, 0x85ad
    push16 r4
    pop16 r2
    xor r6, r0
    push16 r2
    push16 r0
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0a3_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a3_EQ_done
.Lxor_full_0a3_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0a3_EQ_done:
    brne8 .Lxor_full_0a3_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a3_NE_done
.Lxor_full_0a3_NE_true:
    bit_emit_char 'B'
.Lxor_full_0a3_NE_done:
    brult8 .Lxor_full_0a3_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a3_ULT_done
.Lxor_full_0a3_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0a3_ULT_done:
    bruge8 .Lxor_full_0a3_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a3_UGE_done
.Lxor_full_0a3_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0a3_UGE_done:
    brslt8 .Lxor_full_0a3_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a3_SLT_done
.Lxor_full_0a3_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0a3_SLT_done:
    brsge8 .Lxor_full_0a3_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a3_SGE_done
.Lxor_full_0a3_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0a3_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r1; pattern 0; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xdead
    push16 r5
    pop16 r6
    ldi16 r5, 0xbeef
    push16 r5
    pop16 r1
    ldi16 r5, 0x8808
    push16 r5
    pop16 r4
    xor r6, r1
    push16 r4
    push16 r1
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0a4_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a4_EQ_done
.Lxor_full_0a4_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0a4_EQ_done:
    brne8 .Lxor_full_0a4_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a4_NE_done
.Lxor_full_0a4_NE_true:
    bit_emit_char 'B'
.Lxor_full_0a4_NE_done:
    brult8 .Lxor_full_0a4_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a4_ULT_done
.Lxor_full_0a4_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0a4_ULT_done:
    bruge8 .Lxor_full_0a4_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a4_UGE_done
.Lxor_full_0a4_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0a4_UGE_done:
    brslt8 .Lxor_full_0a4_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a4_SLT_done
.Lxor_full_0a4_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0a4_SLT_done:
    brsge8 .Lxor_full_0a4_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a4_SGE_done
.Lxor_full_0a4_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0a4_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r1; pattern 1; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r6
    ldi16 r4, 0x0000
    push16 r4
    pop16 r1
    ldi16 r4, 0x8962
    push16 r4
    pop16 r5
    xor r6, r1
    push16 r5
    push16 r1
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0a5_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a5_EQ_done
.Lxor_full_0a5_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0a5_EQ_done:
    brne8 .Lxor_full_0a5_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a5_NE_done
.Lxor_full_0a5_NE_true:
    bit_emit_char 'B'
.Lxor_full_0a5_NE_done:
    brult8 .Lxor_full_0a5_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a5_ULT_done
.Lxor_full_0a5_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0a5_ULT_done:
    bruge8 .Lxor_full_0a5_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a5_UGE_done
.Lxor_full_0a5_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0a5_UGE_done:
    brslt8 .Lxor_full_0a5_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a5_SLT_done
.Lxor_full_0a5_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0a5_SLT_done:
    brsge8 .Lxor_full_0a5_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a5_SGE_done
.Lxor_full_0a5_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0a5_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r1; pattern 2; guard r7.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r6
    ldi16 r4, 0x3333
    push16 r4
    pop16 r1
    ldi16 r4, 0x8bbd
    push16 r4
    pop16 r7
    xor r6, r1
    push16 r7
    push16 r1
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0a6_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a6_EQ_done
.Lxor_full_0a6_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0a6_EQ_done:
    brne8 .Lxor_full_0a6_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a6_NE_done
.Lxor_full_0a6_NE_true:
    bit_emit_char 'B'
.Lxor_full_0a6_NE_done:
    brult8 .Lxor_full_0a6_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a6_ULT_done
.Lxor_full_0a6_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0a6_ULT_done:
    bruge8 .Lxor_full_0a6_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a6_UGE_done
.Lxor_full_0a6_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0a6_UGE_done:
    brslt8 .Lxor_full_0a6_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a6_SLT_done
.Lxor_full_0a6_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0a6_SLT_done:
    brsge8 .Lxor_full_0a6_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a6_SGE_done
.Lxor_full_0a6_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0a6_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r1; pattern 3; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r6
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r1
    ldi16 r4, 0x8c16
    push16 r4
    pop16 r7
    xor r6, r1
    push16 r7
    push16 r1
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0a7_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a7_EQ_done
.Lxor_full_0a7_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0a7_EQ_done:
    brne8 .Lxor_full_0a7_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a7_NE_done
.Lxor_full_0a7_NE_true:
    bit_emit_char 'B'
.Lxor_full_0a7_NE_done:
    brult8 .Lxor_full_0a7_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a7_ULT_done
.Lxor_full_0a7_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0a7_ULT_done:
    bruge8 .Lxor_full_0a7_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a7_UGE_done
.Lxor_full_0a7_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0a7_UGE_done:
    brslt8 .Lxor_full_0a7_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a7_SLT_done
.Lxor_full_0a7_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0a7_SLT_done:
    brsge8 .Lxor_full_0a7_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a7_SGE_done
.Lxor_full_0a7_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0a7_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r2; pattern 0; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r6
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r2
    ldi16 r4, 0x8669
    push16 r4
    pop16 r1
    xor r6, r2
    push16 r1
    push16 r2
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0a8_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a8_EQ_done
.Lxor_full_0a8_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0a8_EQ_done:
    brne8 .Lxor_full_0a8_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a8_NE_done
.Lxor_full_0a8_NE_true:
    bit_emit_char 'B'
.Lxor_full_0a8_NE_done:
    brult8 .Lxor_full_0a8_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a8_ULT_done
.Lxor_full_0a8_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0a8_ULT_done:
    bruge8 .Lxor_full_0a8_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a8_UGE_done
.Lxor_full_0a8_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0a8_UGE_done:
    brslt8 .Lxor_full_0a8_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a8_SLT_done
.Lxor_full_0a8_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0a8_SLT_done:
    brsge8 .Lxor_full_0a8_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a8_SGE_done
.Lxor_full_0a8_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0a8_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r2; pattern 1; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r6
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r2
    ldi16 r4, 0x88c4
    push16 r4
    pop16 r3
    xor r6, r2
    push16 r3
    push16 r2
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0a9_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a9_EQ_done
.Lxor_full_0a9_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0a9_EQ_done:
    brne8 .Lxor_full_0a9_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a9_NE_done
.Lxor_full_0a9_NE_true:
    bit_emit_char 'B'
.Lxor_full_0a9_NE_done:
    brult8 .Lxor_full_0a9_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a9_ULT_done
.Lxor_full_0a9_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0a9_ULT_done:
    bruge8 .Lxor_full_0a9_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a9_UGE_done
.Lxor_full_0a9_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0a9_UGE_done:
    brslt8 .Lxor_full_0a9_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a9_SLT_done
.Lxor_full_0a9_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0a9_SLT_done:
    brsge8 .Lxor_full_0a9_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0a9_SGE_done
.Lxor_full_0a9_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0a9_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r2; pattern 2; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r6
    ldi16 r4, 0xffff
    push16 r4
    pop16 r2
    ldi16 r4, 0x891d
    push16 r4
    pop16 r3
    xor r6, r2
    push16 r3
    push16 r2
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0aa_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0aa_EQ_done
.Lxor_full_0aa_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0aa_EQ_done:
    brne8 .Lxor_full_0aa_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0aa_NE_done
.Lxor_full_0aa_NE_true:
    bit_emit_char 'B'
.Lxor_full_0aa_NE_done:
    brult8 .Lxor_full_0aa_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0aa_ULT_done
.Lxor_full_0aa_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0aa_ULT_done:
    bruge8 .Lxor_full_0aa_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0aa_UGE_done
.Lxor_full_0aa_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0aa_UGE_done:
    brslt8 .Lxor_full_0aa_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0aa_SLT_done
.Lxor_full_0aa_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0aa_SLT_done:
    brsge8 .Lxor_full_0aa_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0aa_SGE_done
.Lxor_full_0aa_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0aa_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r2; pattern 3; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0xa55a
    push16 r5
    pop16 r6
    ldi16 r5, 0x5aa5
    push16 r5
    pop16 r2
    ldi16 r5, 0x8a77
    push16 r5
    pop16 r4
    xor r6, r2
    push16 r4
    push16 r2
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0ab_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ab_EQ_done
.Lxor_full_0ab_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0ab_EQ_done:
    brne8 .Lxor_full_0ab_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ab_NE_done
.Lxor_full_0ab_NE_true:
    bit_emit_char 'B'
.Lxor_full_0ab_NE_done:
    brult8 .Lxor_full_0ab_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ab_ULT_done
.Lxor_full_0ab_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0ab_ULT_done:
    bruge8 .Lxor_full_0ab_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ab_UGE_done
.Lxor_full_0ab_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0ab_UGE_done:
    brslt8 .Lxor_full_0ab_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ab_SLT_done
.Lxor_full_0ab_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0ab_SLT_done:
    brsge8 .Lxor_full_0ab_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ab_SGE_done
.Lxor_full_0ab_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0ab_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r3; pattern 0; guard r7.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r6
    ldi16 r4, 0x0000
    push16 r4
    pop16 r3
    ldi16 r4, 0x8dd3
    push16 r4
    pop16 r7
    xor r6, r3
    push16 r7
    push16 r3
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0ac_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ac_EQ_done
.Lxor_full_0ac_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0ac_EQ_done:
    brne8 .Lxor_full_0ac_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ac_NE_done
.Lxor_full_0ac_NE_true:
    bit_emit_char 'B'
.Lxor_full_0ac_NE_done:
    brult8 .Lxor_full_0ac_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ac_ULT_done
.Lxor_full_0ac_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0ac_ULT_done:
    bruge8 .Lxor_full_0ac_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ac_UGE_done
.Lxor_full_0ac_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0ac_UGE_done:
    brslt8 .Lxor_full_0ac_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ac_SLT_done
.Lxor_full_0ac_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0ac_SLT_done:
    brsge8 .Lxor_full_0ac_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ac_SGE_done
.Lxor_full_0ac_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0ac_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r3; pattern 1; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r6
    ldi16 r4, 0x3333
    push16 r4
    pop16 r3
    ldi16 r4, 0x8e2c
    push16 r4
    pop16 r7
    xor r6, r3
    push16 r7
    push16 r3
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0ad_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ad_EQ_done
.Lxor_full_0ad_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0ad_EQ_done:
    brne8 .Lxor_full_0ad_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ad_NE_done
.Lxor_full_0ad_NE_true:
    bit_emit_char 'B'
.Lxor_full_0ad_NE_done:
    brult8 .Lxor_full_0ad_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ad_ULT_done
.Lxor_full_0ad_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0ad_ULT_done:
    bruge8 .Lxor_full_0ad_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ad_UGE_done
.Lxor_full_0ad_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0ad_UGE_done:
    brslt8 .Lxor_full_0ad_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ad_SLT_done
.Lxor_full_0ad_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0ad_SLT_done:
    brsge8 .Lxor_full_0ad_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ad_SGE_done
.Lxor_full_0ad_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0ad_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r3; pattern 2; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r6
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r3
    ldi16 r4, 0x877e
    push16 r4
    pop16 r0
    xor r6, r3
    push16 r0
    push16 r3
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0ae_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ae_EQ_done
.Lxor_full_0ae_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0ae_EQ_done:
    brne8 .Lxor_full_0ae_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ae_NE_done
.Lxor_full_0ae_NE_true:
    bit_emit_char 'B'
.Lxor_full_0ae_NE_done:
    brult8 .Lxor_full_0ae_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ae_ULT_done
.Lxor_full_0ae_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0ae_ULT_done:
    bruge8 .Lxor_full_0ae_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ae_UGE_done
.Lxor_full_0ae_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0ae_UGE_done:
    brslt8 .Lxor_full_0ae_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ae_SLT_done
.Lxor_full_0ae_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0ae_SLT_done:
    brsge8 .Lxor_full_0ae_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ae_SGE_done
.Lxor_full_0ae_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0ae_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r6,r3; pattern 3; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r6
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r3
    ldi16 r4, 0x88d8
    push16 r4
    pop16 r1
    xor r6, r3
    push16 r1
    push16 r3
    push16 r6
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0af_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0af_EQ_done
.Lxor_full_0af_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0af_EQ_done:
    brne8 .Lxor_full_0af_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0af_NE_done
.Lxor_full_0af_NE_true:
    bit_emit_char 'B'
.Lxor_full_0af_NE_done:
    brult8 .Lxor_full_0af_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0af_ULT_done
.Lxor_full_0af_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0af_ULT_done:
    bruge8 .Lxor_full_0af_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0af_UGE_done
.Lxor_full_0af_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0af_UGE_done:
    brslt8 .Lxor_full_0af_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0af_SLT_done
.Lxor_full_0af_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0af_SLT_done:
    brsge8 .Lxor_full_0af_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0af_SGE_done
.Lxor_full_0af_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0af_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r0; pattern 0; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r0
    ldi16 r4, 0x8931
    push16 r4
    pop16 r1
    xor r7, r0
    push16 r1
    push16 r0
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0b0_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b0_EQ_done
.Lxor_full_0b0_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0b0_EQ_done:
    brne8 .Lxor_full_0b0_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b0_NE_done
.Lxor_full_0b0_NE_true:
    bit_emit_char 'B'
.Lxor_full_0b0_NE_done:
    brult8 .Lxor_full_0b0_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b0_ULT_done
.Lxor_full_0b0_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0b0_ULT_done:
    bruge8 .Lxor_full_0b0_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b0_UGE_done
.Lxor_full_0b0_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0b0_UGE_done:
    brslt8 .Lxor_full_0b0_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b0_SLT_done
.Lxor_full_0b0_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0b0_SLT_done:
    brsge8 .Lxor_full_0b0_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b0_SGE_done
.Lxor_full_0b0_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0b0_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r0; pattern 1; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r7
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r0
    ldi16 r4, 0x898a
    push16 r4
    pop16 r1
    xor r7, r0
    push16 r1
    push16 r0
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0b1_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b1_EQ_done
.Lxor_full_0b1_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0b1_EQ_done:
    brne8 .Lxor_full_0b1_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b1_NE_done
.Lxor_full_0b1_NE_true:
    bit_emit_char 'B'
.Lxor_full_0b1_NE_done:
    brult8 .Lxor_full_0b1_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b1_ULT_done
.Lxor_full_0b1_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0b1_ULT_done:
    bruge8 .Lxor_full_0b1_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b1_UGE_done
.Lxor_full_0b1_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0b1_UGE_done:
    brslt8 .Lxor_full_0b1_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b1_SLT_done
.Lxor_full_0b1_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0b1_SLT_done:
    brsge8 .Lxor_full_0b1_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b1_SGE_done
.Lxor_full_0b1_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0b1_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r0; pattern 2; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r0
    ldi16 r4, 0x8ae4
    push16 r4
    pop16 r2
    xor r7, r0
    push16 r2
    push16 r0
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0b2_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b2_EQ_done
.Lxor_full_0b2_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0b2_EQ_done:
    brne8 .Lxor_full_0b2_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b2_NE_done
.Lxor_full_0b2_NE_true:
    bit_emit_char 'B'
.Lxor_full_0b2_NE_done:
    brult8 .Lxor_full_0b2_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b2_ULT_done
.Lxor_full_0b2_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0b2_ULT_done:
    bruge8 .Lxor_full_0b2_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b2_UGE_done
.Lxor_full_0b2_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0b2_UGE_done:
    brslt8 .Lxor_full_0b2_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b2_SLT_done
.Lxor_full_0b2_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0b2_SLT_done:
    brsge8 .Lxor_full_0b2_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b2_SGE_done
.Lxor_full_0b2_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0b2_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r0; pattern 3; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0ff0
    push16 r4
    pop16 r7
    ldi16 r4, 0x3333
    push16 r4
    pop16 r0
    ldi16 r4, 0x8c3e
    push16 r4
    pop16 r3
    xor r7, r0
    push16 r3
    push16 r0
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0b3_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b3_EQ_done
.Lxor_full_0b3_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0b3_EQ_done:
    brne8 .Lxor_full_0b3_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b3_NE_done
.Lxor_full_0b3_NE_true:
    bit_emit_char 'B'
.Lxor_full_0b3_NE_done:
    brult8 .Lxor_full_0b3_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b3_ULT_done
.Lxor_full_0b3_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0b3_ULT_done:
    bruge8 .Lxor_full_0b3_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b3_UGE_done
.Lxor_full_0b3_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0b3_UGE_done:
    brslt8 .Lxor_full_0b3_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b3_SLT_done
.Lxor_full_0b3_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0b3_SLT_done:
    brsge8 .Lxor_full_0b3_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b3_SGE_done
.Lxor_full_0b3_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0b3_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r1; pattern 0; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r7
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r1
    ldi16 r4, 0x8e99
    push16 r4
    pop16 r5
    xor r7, r1
    push16 r5
    push16 r1
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0b4_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b4_EQ_done
.Lxor_full_0b4_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0b4_EQ_done:
    brne8 .Lxor_full_0b4_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b4_NE_done
.Lxor_full_0b4_NE_true:
    bit_emit_char 'B'
.Lxor_full_0b4_NE_done:
    brult8 .Lxor_full_0b4_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b4_ULT_done
.Lxor_full_0b4_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0b4_ULT_done:
    bruge8 .Lxor_full_0b4_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b4_UGE_done
.Lxor_full_0b4_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0b4_UGE_done:
    brslt8 .Lxor_full_0b4_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b4_SLT_done
.Lxor_full_0b4_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0b4_SLT_done:
    brsge8 .Lxor_full_0b4_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b4_SGE_done
.Lxor_full_0b4_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0b4_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r1; pattern 1; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r7
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r1
    ldi16 r4, 0x8ff3
    push16 r4
    pop16 r6
    xor r7, r1
    push16 r6
    push16 r1
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0b5_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b5_EQ_done
.Lxor_full_0b5_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0b5_EQ_done:
    brne8 .Lxor_full_0b5_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b5_NE_done
.Lxor_full_0b5_NE_true:
    bit_emit_char 'B'
.Lxor_full_0b5_NE_done:
    brult8 .Lxor_full_0b5_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b5_ULT_done
.Lxor_full_0b5_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0b5_ULT_done:
    bruge8 .Lxor_full_0b5_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b5_UGE_done
.Lxor_full_0b5_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0b5_UGE_done:
    brslt8 .Lxor_full_0b5_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b5_SLT_done
.Lxor_full_0b5_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0b5_SLT_done:
    brsge8 .Lxor_full_0b5_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b5_SGE_done
.Lxor_full_0b5_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0b5_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r1; pattern 2; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r7
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r1
    ldi16 r4, 0x8a46
    push16 r4
    pop16 r0
    xor r7, r1
    push16 r0
    push16 r1
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0b6_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b6_EQ_done
.Lxor_full_0b6_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0b6_EQ_done:
    brne8 .Lxor_full_0b6_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b6_NE_done
.Lxor_full_0b6_NE_true:
    bit_emit_char 'B'
.Lxor_full_0b6_NE_done:
    brult8 .Lxor_full_0b6_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b6_ULT_done
.Lxor_full_0b6_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0b6_ULT_done:
    bruge8 .Lxor_full_0b6_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b6_UGE_done
.Lxor_full_0b6_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0b6_UGE_done:
    brslt8 .Lxor_full_0b6_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b6_SLT_done
.Lxor_full_0b6_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0b6_SLT_done:
    brsge8 .Lxor_full_0b6_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b6_SGE_done
.Lxor_full_0b6_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0b6_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r1; pattern 3; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r1
    ldi16 r4, 0x8a9f
    push16 r4
    pop16 r0
    xor r7, r1
    push16 r0
    push16 r1
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0b7_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b7_EQ_done
.Lxor_full_0b7_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0b7_EQ_done:
    brne8 .Lxor_full_0b7_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b7_NE_done
.Lxor_full_0b7_NE_true:
    bit_emit_char 'B'
.Lxor_full_0b7_NE_done:
    brult8 .Lxor_full_0b7_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b7_ULT_done
.Lxor_full_0b7_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0b7_ULT_done:
    bruge8 .Lxor_full_0b7_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b7_UGE_done
.Lxor_full_0b7_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0b7_UGE_done:
    brslt8 .Lxor_full_0b7_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b7_SLT_done
.Lxor_full_0b7_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0b7_SLT_done:
    brsge8 .Lxor_full_0b7_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b7_SGE_done
.Lxor_full_0b7_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0b7_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r2; pattern 0; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xdead
    push16 r4
    pop16 r7
    ldi16 r4, 0xbeef
    push16 r4
    pop16 r2
    ldi16 r4, 0x8dfb
    push16 r4
    pop16 r3
    xor r7, r2
    push16 r3
    push16 r2
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0b8_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b8_EQ_done
.Lxor_full_0b8_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0b8_EQ_done:
    brne8 .Lxor_full_0b8_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b8_NE_done
.Lxor_full_0b8_NE_true:
    bit_emit_char 'B'
.Lxor_full_0b8_NE_done:
    brult8 .Lxor_full_0b8_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b8_ULT_done
.Lxor_full_0b8_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0b8_ULT_done:
    bruge8 .Lxor_full_0b8_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b8_UGE_done
.Lxor_full_0b8_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0b8_UGE_done:
    brslt8 .Lxor_full_0b8_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b8_SLT_done
.Lxor_full_0b8_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0b8_SLT_done:
    brsge8 .Lxor_full_0b8_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b8_SGE_done
.Lxor_full_0b8_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0b8_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r2; pattern 1; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r2
    ldi16 r4, 0x8e54
    push16 r4
    pop16 r3
    xor r7, r2
    push16 r3
    push16 r2
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0b9_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b9_EQ_done
.Lxor_full_0b9_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0b9_EQ_done:
    brne8 .Lxor_full_0b9_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b9_NE_done
.Lxor_full_0b9_NE_true:
    bit_emit_char 'B'
.Lxor_full_0b9_NE_done:
    brult8 .Lxor_full_0b9_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b9_ULT_done
.Lxor_full_0b9_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0b9_ULT_done:
    bruge8 .Lxor_full_0b9_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b9_UGE_done
.Lxor_full_0b9_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0b9_UGE_done:
    brslt8 .Lxor_full_0b9_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b9_SLT_done
.Lxor_full_0b9_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0b9_SLT_done:
    brsge8 .Lxor_full_0b9_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0b9_SGE_done
.Lxor_full_0b9_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0b9_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r2; pattern 2; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x0ff0
    push16 r5
    pop16 r7
    ldi16 r5, 0x3333
    push16 r5
    pop16 r2
    ldi16 r5, 0x8fae
    push16 r5
    pop16 r4
    xor r7, r2
    push16 r4
    push16 r2
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0ba_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ba_EQ_done
.Lxor_full_0ba_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0ba_EQ_done:
    brne8 .Lxor_full_0ba_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ba_NE_done
.Lxor_full_0ba_NE_true:
    bit_emit_char 'B'
.Lxor_full_0ba_NE_done:
    brult8 .Lxor_full_0ba_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ba_ULT_done
.Lxor_full_0ba_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0ba_ULT_done:
    bruge8 .Lxor_full_0ba_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ba_UGE_done
.Lxor_full_0ba_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0ba_UGE_done:
    brslt8 .Lxor_full_0ba_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ba_SLT_done
.Lxor_full_0ba_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0ba_SLT_done:
    brsge8 .Lxor_full_0ba_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0ba_SGE_done
.Lxor_full_0ba_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0ba_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r2; pattern 3; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    pop16 r7
    ldi16 r4, 0x00ff
    push16 r4
    pop16 r2
    ldi16 r4, 0x9108
    push16 r4
    pop16 r5
    xor r7, r2
    push16 r5
    push16 r2
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0bb_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bb_EQ_done
.Lxor_full_0bb_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0bb_EQ_done:
    brne8 .Lxor_full_0bb_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bb_NE_done
.Lxor_full_0bb_NE_true:
    bit_emit_char 'B'
.Lxor_full_0bb_NE_done:
    brult8 .Lxor_full_0bb_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bb_ULT_done
.Lxor_full_0bb_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0bb_ULT_done:
    bruge8 .Lxor_full_0bb_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bb_UGE_done
.Lxor_full_0bb_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0bb_UGE_done:
    brslt8 .Lxor_full_0bb_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bb_SLT_done
.Lxor_full_0bb_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0bb_SLT_done:
    brsge8 .Lxor_full_0bb_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bb_SGE_done
.Lxor_full_0bb_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0bb_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r3; pattern 0; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xf00f
    push16 r4
    pop16 r7
    ldi16 r4, 0xcccc
    push16 r4
    pop16 r3
    ldi16 r4, 0x8c5c
    push16 r4
    pop16 r0
    xor r7, r3
    push16 r0
    push16 r3
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0bc_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bc_EQ_done
.Lxor_full_0bc_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0bc_EQ_done:
    brne8 .Lxor_full_0bc_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bc_NE_done
.Lxor_full_0bc_NE_true:
    bit_emit_char 'B'
.Lxor_full_0bc_NE_done:
    brult8 .Lxor_full_0bc_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bc_ULT_done
.Lxor_full_0bc_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0bc_ULT_done:
    bruge8 .Lxor_full_0bc_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bc_UGE_done
.Lxor_full_0bc_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0bc_UGE_done:
    brslt8 .Lxor_full_0bc_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bc_SLT_done
.Lxor_full_0bc_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0bc_SLT_done:
    brsge8 .Lxor_full_0bc_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bc_SGE_done
.Lxor_full_0bc_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0bc_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r3; pattern 1; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    pop16 r7
    ldi16 r4, 0x7ffe
    push16 r4
    pop16 r3
    ldi16 r4, 0x8cb5
    push16 r4
    pop16 r0
    xor r7, r3
    push16 r0
    push16 r3
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0bd_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bd_EQ_done
.Lxor_full_0bd_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0bd_EQ_done:
    brne8 .Lxor_full_0bd_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bd_NE_done
.Lxor_full_0bd_NE_true:
    bit_emit_char 'B'
.Lxor_full_0bd_NE_done:
    brult8 .Lxor_full_0bd_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bd_ULT_done
.Lxor_full_0bd_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0bd_ULT_done:
    bruge8 .Lxor_full_0bd_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bd_UGE_done
.Lxor_full_0bd_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0bd_UGE_done:
    brslt8 .Lxor_full_0bd_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bd_SLT_done
.Lxor_full_0bd_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0bd_SLT_done:
    brsge8 .Lxor_full_0bd_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bd_SGE_done
.Lxor_full_0bd_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0bd_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r3; pattern 2; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    ldi16 r4, 0xffff
    push16 r4
    pop16 r3
    ldi16 r4, 0x8e0f
    push16 r4
    pop16 r1
    xor r7, r3
    push16 r1
    push16 r3
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0be_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0be_EQ_done
.Lxor_full_0be_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0be_EQ_done:
    brne8 .Lxor_full_0be_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0be_NE_done
.Lxor_full_0be_NE_true:
    bit_emit_char 'B'
.Lxor_full_0be_NE_done:
    brult8 .Lxor_full_0be_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0be_ULT_done
.Lxor_full_0be_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0be_ULT_done:
    bruge8 .Lxor_full_0be_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0be_UGE_done
.Lxor_full_0be_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0be_UGE_done:
    brslt8 .Lxor_full_0be_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0be_SLT_done
.Lxor_full_0be_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0be_SLT_done:
    brsge8 .Lxor_full_0be_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0be_SGE_done
.Lxor_full_0be_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0be_SGE_done:
    bit_emit_char '\n'

    ; F9 pair r7,r3; pattern 3; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    pop16 r7
    ldi16 r4, 0x5aa5
    push16 r4
    pop16 r3
    ldi16 r4, 0x8f69
    push16 r4
    pop16 r2
    xor r7, r3
    push16 r2
    push16 r3
    push16 r7
    pop16 r0
    pop16 r1
    pop16 r2
    bit_print_r0_r2
    breq8 .Lxor_full_0bf_EQ_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bf_EQ_done
.Lxor_full_0bf_EQ_true:
    bit_emit_char 'B'
.Lxor_full_0bf_EQ_done:
    brne8 .Lxor_full_0bf_NE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bf_NE_done
.Lxor_full_0bf_NE_true:
    bit_emit_char 'B'
.Lxor_full_0bf_NE_done:
    brult8 .Lxor_full_0bf_ULT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bf_ULT_done
.Lxor_full_0bf_ULT_true:
    bit_emit_char 'B'
.Lxor_full_0bf_ULT_done:
    bruge8 .Lxor_full_0bf_UGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bf_UGE_done
.Lxor_full_0bf_UGE_true:
    bit_emit_char 'B'
.Lxor_full_0bf_UGE_done:
    brslt8 .Lxor_full_0bf_SLT_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bf_SLT_done
.Lxor_full_0bf_SLT_true:
    bit_emit_char 'B'
.Lxor_full_0bf_SLT_done:
    brsge8 .Lxor_full_0bf_SGE_true
    bit_emit_char 'A'
    jmp8 .Lxor_full_0bf_SGE_done
.Lxor_full_0bf_SGE_true:
    bit_emit_char 'B'
.Lxor_full_0bf_SGE_done:
    bit_emit_char '\n'

    sys debug_break
