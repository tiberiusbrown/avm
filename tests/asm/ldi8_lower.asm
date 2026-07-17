.include "include/cold_stack_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; ldi8 r0, 0; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0x1357
    push16 r4
    ldi16 r4, 0x147a
    push16 r4
    ldi16 r4, 0x159d
    push16 r4
    ldi16 r4, 0x16c0
    push16 r4
    ldi16 r4, 0x17e3
    push16 r4
    ldi16 r4, 0x1906
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r0, 0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_000_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_000_EQ_done
.Lldi8_lower_000_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_000_EQ_done:
    brne8 .Lldi8_lower_000_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_000_NE_done
.Lldi8_lower_000_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_000_NE_done:
    brult8 .Lldi8_lower_000_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_000_ULT_done
.Lldi8_lower_000_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_000_ULT_done:
    bruge8 .Lldi8_lower_000_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_000_UGE_done
.Lldi8_lower_000_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_000_UGE_done:
    brslt8 .Lldi8_lower_000_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_000_SLT_done
.Lldi8_lower_000_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_000_SLT_done:
    brsge8 .Lldi8_lower_000_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_000_SGE_done
.Lldi8_lower_000_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_000_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r0, 1; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1269
    push16 r4
    ldi16 r4, 0x138c
    push16 r4
    ldi16 r4, 0x14af
    push16 r4
    ldi16 r4, 0x15d2
    push16 r4
    ldi16 r4, 0x16f5
    push16 r4
    ldi16 r4, 0x1818
    push16 r4
    ldi16 r4, 0x193b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r0, 1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_001_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_001_EQ_done
.Lldi8_lower_001_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_001_EQ_done:
    brne8 .Lldi8_lower_001_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_001_NE_done
.Lldi8_lower_001_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_001_NE_done:
    brult8 .Lldi8_lower_001_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_001_ULT_done
.Lldi8_lower_001_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_001_ULT_done:
    bruge8 .Lldi8_lower_001_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_001_UGE_done
.Lldi8_lower_001_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_001_UGE_done:
    brslt8 .Lldi8_lower_001_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_001_SLT_done
.Lldi8_lower_001_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_001_SLT_done:
    brsge8 .Lldi8_lower_001_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_001_SGE_done
.Lldi8_lower_001_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_001_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r0, 127; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x129e
    push16 r4
    ldi16 r4, 0x13c1
    push16 r4
    ldi16 r4, 0x14e4
    push16 r4
    ldi16 r4, 0x1607
    push16 r4
    ldi16 r4, 0x172a
    push16 r4
    ldi16 r4, 0x184d
    push16 r4
    ldi16 r4, 0x1970
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r0, 127 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_002_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_002_EQ_done
.Lldi8_lower_002_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_002_EQ_done:
    brne8 .Lldi8_lower_002_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_002_NE_done
.Lldi8_lower_002_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_002_NE_done:
    brult8 .Lldi8_lower_002_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_002_ULT_done
.Lldi8_lower_002_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_002_ULT_done:
    bruge8 .Lldi8_lower_002_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_002_UGE_done
.Lldi8_lower_002_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_002_UGE_done:
    brslt8 .Lldi8_lower_002_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_002_SLT_done
.Lldi8_lower_002_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_002_SLT_done:
    brsge8 .Lldi8_lower_002_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_002_SGE_done
.Lldi8_lower_002_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_002_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r0, 128; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x12d3
    push16 r4
    ldi16 r4, 0x13f6
    push16 r4
    ldi16 r4, 0x1519
    push16 r4
    ldi16 r4, 0x163c
    push16 r4
    ldi16 r4, 0x175f
    push16 r4
    ldi16 r4, 0x1882
    push16 r4
    ldi16 r4, 0x19a5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r0, 128 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_003_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_003_EQ_done
.Lldi8_lower_003_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_003_EQ_done:
    brne8 .Lldi8_lower_003_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_003_NE_done
.Lldi8_lower_003_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_003_NE_done:
    brult8 .Lldi8_lower_003_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_003_ULT_done
.Lldi8_lower_003_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_003_ULT_done:
    bruge8 .Lldi8_lower_003_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_003_UGE_done
.Lldi8_lower_003_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_003_UGE_done:
    brslt8 .Lldi8_lower_003_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_003_SLT_done
.Lldi8_lower_003_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_003_SLT_done:
    brsge8 .Lldi8_lower_003_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_003_SGE_done
.Lldi8_lower_003_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_003_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r0, 255; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1308
    push16 r4
    ldi16 r4, 0x142b
    push16 r4
    ldi16 r4, 0x154e
    push16 r4
    ldi16 r4, 0x1671
    push16 r4
    ldi16 r4, 0x1794
    push16 r4
    ldi16 r4, 0x18b7
    push16 r4
    ldi16 r4, 0x19da
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r0, 255 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_004_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_004_EQ_done
.Lldi8_lower_004_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_004_EQ_done:
    brne8 .Lldi8_lower_004_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_004_NE_done
.Lldi8_lower_004_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_004_NE_done:
    brult8 .Lldi8_lower_004_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_004_ULT_done
.Lldi8_lower_004_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_004_ULT_done:
    bruge8 .Lldi8_lower_004_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_004_UGE_done
.Lldi8_lower_004_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_004_UGE_done:
    brslt8 .Lldi8_lower_004_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_004_SLT_done
.Lldi8_lower_004_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_004_SLT_done:
    brsge8 .Lldi8_lower_004_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_004_SGE_done
.Lldi8_lower_004_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_004_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r0, 85; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x133d
    push16 r4
    ldi16 r4, 0x1460
    push16 r4
    ldi16 r4, 0x1583
    push16 r4
    ldi16 r4, 0x16a6
    push16 r4
    ldi16 r4, 0x17c9
    push16 r4
    ldi16 r4, 0x18ec
    push16 r4
    ldi16 r4, 0x1a0f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r0, 85 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_005_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_005_EQ_done
.Lldi8_lower_005_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_005_EQ_done:
    brne8 .Lldi8_lower_005_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_005_NE_done
.Lldi8_lower_005_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_005_NE_done:
    brult8 .Lldi8_lower_005_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_005_ULT_done
.Lldi8_lower_005_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_005_ULT_done:
    bruge8 .Lldi8_lower_005_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_005_UGE_done
.Lldi8_lower_005_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_005_UGE_done:
    brslt8 .Lldi8_lower_005_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_005_SLT_done
.Lldi8_lower_005_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_005_SLT_done:
    brsge8 .Lldi8_lower_005_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_005_SGE_done
.Lldi8_lower_005_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_005_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r1, 0; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x124f
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1495
    push16 r4
    ldi16 r4, 0x15b8
    push16 r4
    ldi16 r4, 0x16db
    push16 r4
    ldi16 r4, 0x17fe
    push16 r4
    ldi16 r4, 0x1921
    push16 r4
    ldi16 r4, 0x1a44
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r1, 0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_006_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_006_EQ_done
.Lldi8_lower_006_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_006_EQ_done:
    brne8 .Lldi8_lower_006_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_006_NE_done
.Lldi8_lower_006_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_006_NE_done:
    brult8 .Lldi8_lower_006_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_006_ULT_done
.Lldi8_lower_006_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_006_ULT_done:
    bruge8 .Lldi8_lower_006_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_006_UGE_done
.Lldi8_lower_006_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_006_UGE_done:
    brslt8 .Lldi8_lower_006_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_006_SLT_done
.Lldi8_lower_006_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_006_SLT_done:
    brsge8 .Lldi8_lower_006_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_006_SGE_done
.Lldi8_lower_006_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_006_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r1, 1; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1284
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x14ca
    push16 r4
    ldi16 r4, 0x15ed
    push16 r4
    ldi16 r4, 0x1710
    push16 r4
    ldi16 r4, 0x1833
    push16 r4
    ldi16 r4, 0x1956
    push16 r4
    ldi16 r4, 0x1a79
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r1, 1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_007_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_007_EQ_done
.Lldi8_lower_007_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_007_EQ_done:
    brne8 .Lldi8_lower_007_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_007_NE_done
.Lldi8_lower_007_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_007_NE_done:
    brult8 .Lldi8_lower_007_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_007_ULT_done
.Lldi8_lower_007_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_007_ULT_done:
    bruge8 .Lldi8_lower_007_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_007_UGE_done
.Lldi8_lower_007_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_007_UGE_done:
    brslt8 .Lldi8_lower_007_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_007_SLT_done
.Lldi8_lower_007_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_007_SLT_done:
    brsge8 .Lldi8_lower_007_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_007_SGE_done
.Lldi8_lower_007_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_007_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r1, 127; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x12b9
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x14ff
    push16 r4
    ldi16 r4, 0x1622
    push16 r4
    ldi16 r4, 0x1745
    push16 r4
    ldi16 r4, 0x1868
    push16 r4
    ldi16 r4, 0x198b
    push16 r4
    ldi16 r4, 0x1aae
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r1, 127 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_008_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_008_EQ_done
.Lldi8_lower_008_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_008_EQ_done:
    brne8 .Lldi8_lower_008_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_008_NE_done
.Lldi8_lower_008_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_008_NE_done:
    brult8 .Lldi8_lower_008_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_008_ULT_done
.Lldi8_lower_008_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_008_ULT_done:
    bruge8 .Lldi8_lower_008_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_008_UGE_done
.Lldi8_lower_008_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_008_UGE_done:
    brslt8 .Lldi8_lower_008_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_008_SLT_done
.Lldi8_lower_008_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_008_SLT_done:
    brsge8 .Lldi8_lower_008_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_008_SGE_done
.Lldi8_lower_008_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_008_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r1, 128; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x12ee
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1534
    push16 r4
    ldi16 r4, 0x1657
    push16 r4
    ldi16 r4, 0x177a
    push16 r4
    ldi16 r4, 0x189d
    push16 r4
    ldi16 r4, 0x19c0
    push16 r4
    ldi16 r4, 0x1ae3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r1, 128 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_009_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_009_EQ_done
.Lldi8_lower_009_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_009_EQ_done:
    brne8 .Lldi8_lower_009_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_009_NE_done
.Lldi8_lower_009_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_009_NE_done:
    brult8 .Lldi8_lower_009_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_009_ULT_done
.Lldi8_lower_009_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_009_ULT_done:
    bruge8 .Lldi8_lower_009_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_009_UGE_done
.Lldi8_lower_009_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_009_UGE_done:
    brslt8 .Lldi8_lower_009_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_009_SLT_done
.Lldi8_lower_009_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_009_SLT_done:
    brsge8 .Lldi8_lower_009_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_009_SGE_done
.Lldi8_lower_009_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_009_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r1, 255; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1323
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1569
    push16 r4
    ldi16 r4, 0x168c
    push16 r4
    ldi16 r4, 0x17af
    push16 r4
    ldi16 r4, 0x18d2
    push16 r4
    ldi16 r4, 0x19f5
    push16 r4
    ldi16 r4, 0x1b18
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r1, 255 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_00a_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00a_EQ_done
.Lldi8_lower_00a_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_00a_EQ_done:
    brne8 .Lldi8_lower_00a_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00a_NE_done
.Lldi8_lower_00a_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_00a_NE_done:
    brult8 .Lldi8_lower_00a_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00a_ULT_done
.Lldi8_lower_00a_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_00a_ULT_done:
    bruge8 .Lldi8_lower_00a_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00a_UGE_done
.Lldi8_lower_00a_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00a_UGE_done:
    brslt8 .Lldi8_lower_00a_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00a_SLT_done
.Lldi8_lower_00a_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_00a_SLT_done:
    brsge8 .Lldi8_lower_00a_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00a_SGE_done
.Lldi8_lower_00a_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00a_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r1, 85; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1358
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x159e
    push16 r4
    ldi16 r4, 0x16c1
    push16 r4
    ldi16 r4, 0x17e4
    push16 r4
    ldi16 r4, 0x1907
    push16 r4
    ldi16 r4, 0x1a2a
    push16 r4
    ldi16 r4, 0x1b4d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r1, 85 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_00b_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00b_EQ_done
.Lldi8_lower_00b_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_00b_EQ_done:
    brne8 .Lldi8_lower_00b_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00b_NE_done
.Lldi8_lower_00b_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_00b_NE_done:
    brult8 .Lldi8_lower_00b_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00b_ULT_done
.Lldi8_lower_00b_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_00b_ULT_done:
    bruge8 .Lldi8_lower_00b_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00b_UGE_done
.Lldi8_lower_00b_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00b_UGE_done:
    brslt8 .Lldi8_lower_00b_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00b_SLT_done
.Lldi8_lower_00b_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_00b_SLT_done:
    brsge8 .Lldi8_lower_00b_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00b_SGE_done
.Lldi8_lower_00b_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00b_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r2, 0; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x138d
    push16 r4
    ldi16 r4, 0x14b0
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x16f6
    push16 r4
    ldi16 r4, 0x1819
    push16 r4
    ldi16 r4, 0x193c
    push16 r4
    ldi16 r4, 0x1a5f
    push16 r4
    ldi16 r4, 0x1b82
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r2, 0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_00c_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00c_EQ_done
.Lldi8_lower_00c_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_00c_EQ_done:
    brne8 .Lldi8_lower_00c_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00c_NE_done
.Lldi8_lower_00c_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_00c_NE_done:
    brult8 .Lldi8_lower_00c_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00c_ULT_done
.Lldi8_lower_00c_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_00c_ULT_done:
    bruge8 .Lldi8_lower_00c_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00c_UGE_done
.Lldi8_lower_00c_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00c_UGE_done:
    brslt8 .Lldi8_lower_00c_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00c_SLT_done
.Lldi8_lower_00c_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_00c_SLT_done:
    brsge8 .Lldi8_lower_00c_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00c_SGE_done
.Lldi8_lower_00c_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00c_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r2, 1; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x13c2
    push16 r4
    ldi16 r4, 0x14e5
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x172b
    push16 r4
    ldi16 r4, 0x184e
    push16 r4
    ldi16 r4, 0x1971
    push16 r4
    ldi16 r4, 0x1a94
    push16 r4
    ldi16 r4, 0x1bb7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r2, 1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_00d_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00d_EQ_done
.Lldi8_lower_00d_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_00d_EQ_done:
    brne8 .Lldi8_lower_00d_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00d_NE_done
.Lldi8_lower_00d_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_00d_NE_done:
    brult8 .Lldi8_lower_00d_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00d_ULT_done
.Lldi8_lower_00d_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_00d_ULT_done:
    bruge8 .Lldi8_lower_00d_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00d_UGE_done
.Lldi8_lower_00d_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00d_UGE_done:
    brslt8 .Lldi8_lower_00d_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00d_SLT_done
.Lldi8_lower_00d_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_00d_SLT_done:
    brsge8 .Lldi8_lower_00d_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00d_SGE_done
.Lldi8_lower_00d_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00d_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r2, 127; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x13f7
    push16 r4
    ldi16 r4, 0x151a
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1760
    push16 r4
    ldi16 r4, 0x1883
    push16 r4
    ldi16 r4, 0x19a6
    push16 r4
    ldi16 r4, 0x1ac9
    push16 r4
    ldi16 r4, 0x1bec
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r2, 127 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_00e_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00e_EQ_done
.Lldi8_lower_00e_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_00e_EQ_done:
    brne8 .Lldi8_lower_00e_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00e_NE_done
.Lldi8_lower_00e_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_00e_NE_done:
    brult8 .Lldi8_lower_00e_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00e_ULT_done
.Lldi8_lower_00e_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_00e_ULT_done:
    bruge8 .Lldi8_lower_00e_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00e_UGE_done
.Lldi8_lower_00e_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00e_UGE_done:
    brslt8 .Lldi8_lower_00e_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00e_SLT_done
.Lldi8_lower_00e_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_00e_SLT_done:
    brsge8 .Lldi8_lower_00e_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00e_SGE_done
.Lldi8_lower_00e_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00e_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r2, 128; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x142c
    push16 r4
    ldi16 r4, 0x154f
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1795
    push16 r4
    ldi16 r4, 0x18b8
    push16 r4
    ldi16 r4, 0x19db
    push16 r4
    ldi16 r4, 0x1afe
    push16 r4
    ldi16 r4, 0x1c21
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r2, 128 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_00f_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00f_EQ_done
.Lldi8_lower_00f_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_00f_EQ_done:
    brne8 .Lldi8_lower_00f_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00f_NE_done
.Lldi8_lower_00f_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_00f_NE_done:
    brult8 .Lldi8_lower_00f_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00f_ULT_done
.Lldi8_lower_00f_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_00f_ULT_done:
    bruge8 .Lldi8_lower_00f_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00f_UGE_done
.Lldi8_lower_00f_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00f_UGE_done:
    brslt8 .Lldi8_lower_00f_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00f_SLT_done
.Lldi8_lower_00f_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_00f_SLT_done:
    brsge8 .Lldi8_lower_00f_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_00f_SGE_done
.Lldi8_lower_00f_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_00f_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r2, 255; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1461
    push16 r4
    ldi16 r4, 0x1584
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x17ca
    push16 r4
    ldi16 r4, 0x18ed
    push16 r4
    ldi16 r4, 0x1a10
    push16 r4
    ldi16 r4, 0x1b33
    push16 r4
    ldi16 r4, 0x1c56
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r2, 255 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_010_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_010_EQ_done
.Lldi8_lower_010_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_010_EQ_done:
    brne8 .Lldi8_lower_010_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_010_NE_done
.Lldi8_lower_010_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_010_NE_done:
    brult8 .Lldi8_lower_010_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_010_ULT_done
.Lldi8_lower_010_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_010_ULT_done:
    bruge8 .Lldi8_lower_010_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_010_UGE_done
.Lldi8_lower_010_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_010_UGE_done:
    brslt8 .Lldi8_lower_010_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_010_SLT_done
.Lldi8_lower_010_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_010_SLT_done:
    brsge8 .Lldi8_lower_010_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_010_SGE_done
.Lldi8_lower_010_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_010_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r2, 85; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1496
    push16 r4
    ldi16 r4, 0x15b9
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x17ff
    push16 r4
    ldi16 r4, 0x1922
    push16 r4
    ldi16 r4, 0x1a45
    push16 r4
    ldi16 r4, 0x1b68
    push16 r4
    ldi16 r4, 0x1c8b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r2, 85 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_011_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_011_EQ_done
.Lldi8_lower_011_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_011_EQ_done:
    brne8 .Lldi8_lower_011_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_011_NE_done
.Lldi8_lower_011_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_011_NE_done:
    brult8 .Lldi8_lower_011_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_011_ULT_done
.Lldi8_lower_011_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_011_ULT_done:
    bruge8 .Lldi8_lower_011_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_011_UGE_done
.Lldi8_lower_011_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_011_UGE_done:
    brslt8 .Lldi8_lower_011_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_011_SLT_done
.Lldi8_lower_011_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_011_SLT_done:
    brsge8 .Lldi8_lower_011_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_011_SGE_done
.Lldi8_lower_011_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_011_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r3, 0; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x14cb
    push16 r4
    ldi16 r4, 0x15ee
    push16 r4
    ldi16 r4, 0x1711
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1957
    push16 r4
    ldi16 r4, 0x1a7a
    push16 r4
    ldi16 r4, 0x1b9d
    push16 r4
    ldi16 r4, 0x1cc0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r3, 0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_012_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_012_EQ_done
.Lldi8_lower_012_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_012_EQ_done:
    brne8 .Lldi8_lower_012_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_012_NE_done
.Lldi8_lower_012_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_012_NE_done:
    brult8 .Lldi8_lower_012_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_012_ULT_done
.Lldi8_lower_012_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_012_ULT_done:
    bruge8 .Lldi8_lower_012_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_012_UGE_done
.Lldi8_lower_012_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_012_UGE_done:
    brslt8 .Lldi8_lower_012_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_012_SLT_done
.Lldi8_lower_012_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_012_SLT_done:
    brsge8 .Lldi8_lower_012_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_012_SGE_done
.Lldi8_lower_012_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_012_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r3, 1; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1500
    push16 r4
    ldi16 r4, 0x1623
    push16 r4
    ldi16 r4, 0x1746
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x198c
    push16 r4
    ldi16 r4, 0x1aaf
    push16 r4
    ldi16 r4, 0x1bd2
    push16 r4
    ldi16 r4, 0x1cf5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r3, 1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_013_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_013_EQ_done
.Lldi8_lower_013_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_013_EQ_done:
    brne8 .Lldi8_lower_013_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_013_NE_done
.Lldi8_lower_013_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_013_NE_done:
    brult8 .Lldi8_lower_013_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_013_ULT_done
.Lldi8_lower_013_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_013_ULT_done:
    bruge8 .Lldi8_lower_013_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_013_UGE_done
.Lldi8_lower_013_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_013_UGE_done:
    brslt8 .Lldi8_lower_013_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_013_SLT_done
.Lldi8_lower_013_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_013_SLT_done:
    brsge8 .Lldi8_lower_013_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_013_SGE_done
.Lldi8_lower_013_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_013_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r3, 127; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1535
    push16 r4
    ldi16 r4, 0x1658
    push16 r4
    ldi16 r4, 0x177b
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x19c1
    push16 r4
    ldi16 r4, 0x1ae4
    push16 r4
    ldi16 r4, 0x1c07
    push16 r4
    ldi16 r4, 0x1d2a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r3, 127 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_014_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_014_EQ_done
.Lldi8_lower_014_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_014_EQ_done:
    brne8 .Lldi8_lower_014_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_014_NE_done
.Lldi8_lower_014_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_014_NE_done:
    brult8 .Lldi8_lower_014_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_014_ULT_done
.Lldi8_lower_014_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_014_ULT_done:
    bruge8 .Lldi8_lower_014_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_014_UGE_done
.Lldi8_lower_014_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_014_UGE_done:
    brslt8 .Lldi8_lower_014_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_014_SLT_done
.Lldi8_lower_014_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_014_SLT_done:
    brsge8 .Lldi8_lower_014_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_014_SGE_done
.Lldi8_lower_014_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_014_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r3, 128; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x156a
    push16 r4
    ldi16 r4, 0x168d
    push16 r4
    ldi16 r4, 0x17b0
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x19f6
    push16 r4
    ldi16 r4, 0x1b19
    push16 r4
    ldi16 r4, 0x1c3c
    push16 r4
    ldi16 r4, 0x1d5f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r3, 128 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_015_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_015_EQ_done
.Lldi8_lower_015_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_015_EQ_done:
    brne8 .Lldi8_lower_015_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_015_NE_done
.Lldi8_lower_015_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_015_NE_done:
    brult8 .Lldi8_lower_015_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_015_ULT_done
.Lldi8_lower_015_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_015_ULT_done:
    bruge8 .Lldi8_lower_015_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_015_UGE_done
.Lldi8_lower_015_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_015_UGE_done:
    brslt8 .Lldi8_lower_015_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_015_SLT_done
.Lldi8_lower_015_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_015_SLT_done:
    brsge8 .Lldi8_lower_015_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_015_SGE_done
.Lldi8_lower_015_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_015_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r3, 255; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x159f
    push16 r4
    ldi16 r4, 0x16c2
    push16 r4
    ldi16 r4, 0x17e5
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1a2b
    push16 r4
    ldi16 r4, 0x1b4e
    push16 r4
    ldi16 r4, 0x1c71
    push16 r4
    ldi16 r4, 0x1d94
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r3, 255 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_016_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_016_EQ_done
.Lldi8_lower_016_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_016_EQ_done:
    brne8 .Lldi8_lower_016_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_016_NE_done
.Lldi8_lower_016_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_016_NE_done:
    brult8 .Lldi8_lower_016_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_016_ULT_done
.Lldi8_lower_016_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_016_ULT_done:
    bruge8 .Lldi8_lower_016_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_016_UGE_done
.Lldi8_lower_016_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_016_UGE_done:
    brslt8 .Lldi8_lower_016_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_016_SLT_done
.Lldi8_lower_016_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_016_SLT_done:
    brsge8 .Lldi8_lower_016_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_016_SGE_done
.Lldi8_lower_016_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_016_SGE_done:
    cold_emit_char '\n'

    ; ldi8 r3, 85; initial=0xA55A.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x15d4
    push16 r4
    ldi16 r4, 0x16f7
    push16 r4
    ldi16 r4, 0x181a
    push16 r4
    ldi16 r4, 0xa55a
    push16 r4
    ldi16 r4, 0x1a60
    push16 r4
    ldi16 r4, 0x1b83
    push16 r4
    ldi16 r4, 0x1ca6
    push16 r4
    ldi16 r4, 0x1dc9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi8 r3, 85 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lldi8_lower_017_EQ_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_017_EQ_done
.Lldi8_lower_017_EQ_true:
    cold_emit_char 'B'
.Lldi8_lower_017_EQ_done:
    brne8 .Lldi8_lower_017_NE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_017_NE_done
.Lldi8_lower_017_NE_true:
    cold_emit_char 'B'
.Lldi8_lower_017_NE_done:
    brult8 .Lldi8_lower_017_ULT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_017_ULT_done
.Lldi8_lower_017_ULT_true:
    cold_emit_char 'B'
.Lldi8_lower_017_ULT_done:
    bruge8 .Lldi8_lower_017_UGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_017_UGE_done
.Lldi8_lower_017_UGE_true:
    cold_emit_char 'B'
.Lldi8_lower_017_UGE_done:
    brslt8 .Lldi8_lower_017_SLT_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_017_SLT_done
.Lldi8_lower_017_SLT_true:
    cold_emit_char 'B'
.Lldi8_lower_017_SLT_done:
    brsge8 .Lldi8_lower_017_SGE_true
    cold_emit_char 'A'
    jmp8 .Lldi8_lower_017_SGE_done
.Lldi8_lower_017_SGE_true:
    cold_emit_char 'B'
.Lldi8_lower_017_SGE_done:
    cold_emit_char '\n'

    sys debug_break
