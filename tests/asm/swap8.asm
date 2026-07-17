.include "include/f1_utility_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; swap8 r0, pattern 0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x1234
    push16 r4
    ldi16 c0, 0x1357
    push16 r4
    ldi16 c0, 0x147a
    push16 r4
    ldi16 c0, 0x159d
    push16 r4
    ldi16 c0, 0x16c0
    push16 r4
    ldi16 c0, 0x17e3
    push16 r4
    ldi16 c0, 0x1906
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_000_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_000_EQ_done
.Lswap8_000_EQ_true:
    f1u_emit_char 'B'
.Lswap8_000_EQ_done:
    brne8 .Lswap8_000_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_000_NE_done
.Lswap8_000_NE_true:
    f1u_emit_char 'B'
.Lswap8_000_NE_done:
    brult8 .Lswap8_000_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_000_ULT_done
.Lswap8_000_ULT_true:
    f1u_emit_char 'B'
.Lswap8_000_ULT_done:
    bruge8 .Lswap8_000_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_000_UGE_done
.Lswap8_000_UGE_true:
    f1u_emit_char 'B'
.Lswap8_000_UGE_done:
    brslt8 .Lswap8_000_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_000_SLT_done
.Lswap8_000_SLT_true:
    f1u_emit_char 'B'
.Lswap8_000_SLT_done:
    brsge8 .Lswap8_000_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_000_SGE_done
.Lswap8_000_SGE_true:
    f1u_emit_char 'B'
.Lswap8_000_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r0, pattern 1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x1269
    push16 r4
    ldi16 c0, 0x138c
    push16 r4
    ldi16 c0, 0x14af
    push16 r4
    ldi16 c0, 0x15d2
    push16 r4
    ldi16 c0, 0x16f5
    push16 r4
    ldi16 c0, 0x1818
    push16 r4
    ldi16 c0, 0x193b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_001_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_001_EQ_done
.Lswap8_001_EQ_true:
    f1u_emit_char 'B'
.Lswap8_001_EQ_done:
    brne8 .Lswap8_001_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_001_NE_done
.Lswap8_001_NE_true:
    f1u_emit_char 'B'
.Lswap8_001_NE_done:
    brult8 .Lswap8_001_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_001_ULT_done
.Lswap8_001_ULT_true:
    f1u_emit_char 'B'
.Lswap8_001_ULT_done:
    bruge8 .Lswap8_001_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_001_UGE_done
.Lswap8_001_UGE_true:
    f1u_emit_char 'B'
.Lswap8_001_UGE_done:
    brslt8 .Lswap8_001_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_001_SLT_done
.Lswap8_001_SLT_true:
    f1u_emit_char 'B'
.Lswap8_001_SLT_done:
    brsge8 .Lswap8_001_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_001_SGE_done
.Lswap8_001_SGE_true:
    f1u_emit_char 'B'
.Lswap8_001_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r0, pattern 2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x0010
    push16 r4
    ldi16 c0, 0x129e
    push16 r4
    ldi16 c0, 0x13c1
    push16 r4
    ldi16 c0, 0x14e4
    push16 r4
    ldi16 c0, 0x1607
    push16 r4
    ldi16 c0, 0x172a
    push16 r4
    ldi16 c0, 0x184d
    push16 r4
    ldi16 c0, 0x1970
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_002_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_002_EQ_done
.Lswap8_002_EQ_true:
    f1u_emit_char 'B'
.Lswap8_002_EQ_done:
    brne8 .Lswap8_002_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_002_NE_done
.Lswap8_002_NE_true:
    f1u_emit_char 'B'
.Lswap8_002_NE_done:
    brult8 .Lswap8_002_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_002_ULT_done
.Lswap8_002_ULT_true:
    f1u_emit_char 'B'
.Lswap8_002_ULT_done:
    bruge8 .Lswap8_002_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_002_UGE_done
.Lswap8_002_UGE_true:
    f1u_emit_char 'B'
.Lswap8_002_UGE_done:
    brslt8 .Lswap8_002_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_002_SLT_done
.Lswap8_002_SLT_true:
    f1u_emit_char 'B'
.Lswap8_002_SLT_done:
    brsge8 .Lswap8_002_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_002_SGE_done
.Lswap8_002_SGE_true:
    f1u_emit_char 'B'
.Lswap8_002_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r0, pattern 3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x001f
    push16 r4
    ldi16 c0, 0x12d3
    push16 r4
    ldi16 c0, 0x13f6
    push16 r4
    ldi16 c0, 0x1519
    push16 r4
    ldi16 c0, 0x163c
    push16 r4
    ldi16 c0, 0x175f
    push16 r4
    ldi16 c0, 0x1882
    push16 r4
    ldi16 c0, 0x19a5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_003_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_003_EQ_done
.Lswap8_003_EQ_true:
    f1u_emit_char 'B'
.Lswap8_003_EQ_done:
    brne8 .Lswap8_003_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_003_NE_done
.Lswap8_003_NE_true:
    f1u_emit_char 'B'
.Lswap8_003_NE_done:
    brult8 .Lswap8_003_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_003_ULT_done
.Lswap8_003_ULT_true:
    f1u_emit_char 'B'
.Lswap8_003_ULT_done:
    bruge8 .Lswap8_003_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_003_UGE_done
.Lswap8_003_UGE_true:
    f1u_emit_char 'B'
.Lswap8_003_UGE_done:
    brslt8 .Lswap8_003_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_003_SLT_done
.Lswap8_003_SLT_true:
    f1u_emit_char 'B'
.Lswap8_003_SLT_done:
    brsge8 .Lswap8_003_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_003_SGE_done
.Lswap8_003_SGE_true:
    f1u_emit_char 'B'
.Lswap8_003_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r0, pattern 4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x12a5
    push16 r4
    ldi16 c0, 0x1308
    push16 r4
    ldi16 c0, 0x142b
    push16 r4
    ldi16 c0, 0x154e
    push16 r4
    ldi16 c0, 0x1671
    push16 r4
    ldi16 c0, 0x1794
    push16 r4
    ldi16 c0, 0x18b7
    push16 r4
    ldi16 c0, 0x19da
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_004_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_004_EQ_done
.Lswap8_004_EQ_true:
    f1u_emit_char 'B'
.Lswap8_004_EQ_done:
    brne8 .Lswap8_004_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_004_NE_done
.Lswap8_004_NE_true:
    f1u_emit_char 'B'
.Lswap8_004_NE_done:
    brult8 .Lswap8_004_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_004_ULT_done
.Lswap8_004_ULT_true:
    f1u_emit_char 'B'
.Lswap8_004_ULT_done:
    bruge8 .Lswap8_004_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_004_UGE_done
.Lswap8_004_UGE_true:
    f1u_emit_char 'B'
.Lswap8_004_UGE_done:
    brslt8 .Lswap8_004_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_004_SLT_done
.Lswap8_004_SLT_true:
    f1u_emit_char 'B'
.Lswap8_004_SLT_done:
    brsge8 .Lswap8_004_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_004_SGE_done
.Lswap8_004_SGE_true:
    f1u_emit_char 'B'
.Lswap8_004_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r0, pattern 5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x80f0
    push16 r4
    ldi16 c0, 0x133d
    push16 r4
    ldi16 c0, 0x1460
    push16 r4
    ldi16 c0, 0x1583
    push16 r4
    ldi16 c0, 0x16a6
    push16 r4
    ldi16 c0, 0x17c9
    push16 r4
    ldi16 c0, 0x18ec
    push16 r4
    ldi16 c0, 0x1a0f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_005_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_005_EQ_done
.Lswap8_005_EQ_true:
    f1u_emit_char 'B'
.Lswap8_005_EQ_done:
    brne8 .Lswap8_005_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_005_NE_done
.Lswap8_005_NE_true:
    f1u_emit_char 'B'
.Lswap8_005_NE_done:
    brult8 .Lswap8_005_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_005_ULT_done
.Lswap8_005_ULT_true:
    f1u_emit_char 'B'
.Lswap8_005_ULT_done:
    bruge8 .Lswap8_005_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_005_UGE_done
.Lswap8_005_UGE_true:
    f1u_emit_char 'B'
.Lswap8_005_UGE_done:
    brslt8 .Lswap8_005_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_005_SLT_done
.Lswap8_005_SLT_true:
    f1u_emit_char 'B'
.Lswap8_005_SLT_done:
    brsge8 .Lswap8_005_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_005_SGE_done
.Lswap8_005_SGE_true:
    f1u_emit_char 'B'
.Lswap8_005_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r0, pattern 6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0xff0f
    push16 r4
    ldi16 c0, 0x1372
    push16 r4
    ldi16 c0, 0x1495
    push16 r4
    ldi16 c0, 0x15b8
    push16 r4
    ldi16 c0, 0x16db
    push16 r4
    ldi16 c0, 0x17fe
    push16 r4
    ldi16 c0, 0x1921
    push16 r4
    ldi16 c0, 0x1a44
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_006_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_006_EQ_done
.Lswap8_006_EQ_true:
    f1u_emit_char 'B'
.Lswap8_006_EQ_done:
    brne8 .Lswap8_006_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_006_NE_done
.Lswap8_006_NE_true:
    f1u_emit_char 'B'
.Lswap8_006_NE_done:
    brult8 .Lswap8_006_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_006_ULT_done
.Lswap8_006_ULT_true:
    f1u_emit_char 'B'
.Lswap8_006_ULT_done:
    bruge8 .Lswap8_006_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_006_UGE_done
.Lswap8_006_UGE_true:
    f1u_emit_char 'B'
.Lswap8_006_UGE_done:
    brslt8 .Lswap8_006_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_006_SLT_done
.Lswap8_006_SLT_true:
    f1u_emit_char 'B'
.Lswap8_006_SLT_done:
    brsge8 .Lswap8_006_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_006_SGE_done
.Lswap8_006_SGE_true:
    f1u_emit_char 'B'
.Lswap8_006_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r0, pattern 7.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0xa55a
    push16 r4
    ldi16 c0, 0x13a7
    push16 r4
    ldi16 c0, 0x14ca
    push16 r4
    ldi16 c0, 0x15ed
    push16 r4
    ldi16 c0, 0x1710
    push16 r4
    ldi16 c0, 0x1833
    push16 r4
    ldi16 c0, 0x1956
    push16 r4
    ldi16 c0, 0x1a79
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_007_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_007_EQ_done
.Lswap8_007_EQ_true:
    f1u_emit_char 'B'
.Lswap8_007_EQ_done:
    brne8 .Lswap8_007_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_007_NE_done
.Lswap8_007_NE_true:
    f1u_emit_char 'B'
.Lswap8_007_NE_done:
    brult8 .Lswap8_007_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_007_ULT_done
.Lswap8_007_ULT_true:
    f1u_emit_char 'B'
.Lswap8_007_ULT_done:
    bruge8 .Lswap8_007_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_007_UGE_done
.Lswap8_007_UGE_true:
    f1u_emit_char 'B'
.Lswap8_007_UGE_done:
    brslt8 .Lswap8_007_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_007_SLT_done
.Lswap8_007_SLT_true:
    f1u_emit_char 'B'
.Lswap8_007_SLT_done:
    brsge8 .Lswap8_007_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_007_SGE_done
.Lswap8_007_SGE_true:
    f1u_emit_char 'B'
.Lswap8_007_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r1, pattern 0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x12b9
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x14ff
    push16 r4
    ldi16 c0, 0x1622
    push16 r4
    ldi16 c0, 0x1745
    push16 r4
    ldi16 c0, 0x1868
    push16 r4
    ldi16 c0, 0x198b
    push16 r4
    ldi16 c0, 0x1aae
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_008_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_008_EQ_done
.Lswap8_008_EQ_true:
    f1u_emit_char 'B'
.Lswap8_008_EQ_done:
    brne8 .Lswap8_008_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_008_NE_done
.Lswap8_008_NE_true:
    f1u_emit_char 'B'
.Lswap8_008_NE_done:
    brult8 .Lswap8_008_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_008_ULT_done
.Lswap8_008_ULT_true:
    f1u_emit_char 'B'
.Lswap8_008_ULT_done:
    bruge8 .Lswap8_008_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_008_UGE_done
.Lswap8_008_UGE_true:
    f1u_emit_char 'B'
.Lswap8_008_UGE_done:
    brslt8 .Lswap8_008_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_008_SLT_done
.Lswap8_008_SLT_true:
    f1u_emit_char 'B'
.Lswap8_008_SLT_done:
    brsge8 .Lswap8_008_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_008_SGE_done
.Lswap8_008_SGE_true:
    f1u_emit_char 'B'
.Lswap8_008_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r1, pattern 1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x12ee
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x1534
    push16 r4
    ldi16 c0, 0x1657
    push16 r4
    ldi16 c0, 0x177a
    push16 r4
    ldi16 c0, 0x189d
    push16 r4
    ldi16 c0, 0x19c0
    push16 r4
    ldi16 c0, 0x1ae3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_009_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_009_EQ_done
.Lswap8_009_EQ_true:
    f1u_emit_char 'B'
.Lswap8_009_EQ_done:
    brne8 .Lswap8_009_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_009_NE_done
.Lswap8_009_NE_true:
    f1u_emit_char 'B'
.Lswap8_009_NE_done:
    brult8 .Lswap8_009_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_009_ULT_done
.Lswap8_009_ULT_true:
    f1u_emit_char 'B'
.Lswap8_009_ULT_done:
    bruge8 .Lswap8_009_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_009_UGE_done
.Lswap8_009_UGE_true:
    f1u_emit_char 'B'
.Lswap8_009_UGE_done:
    brslt8 .Lswap8_009_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_009_SLT_done
.Lswap8_009_SLT_true:
    f1u_emit_char 'B'
.Lswap8_009_SLT_done:
    brsge8 .Lswap8_009_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_009_SGE_done
.Lswap8_009_SGE_true:
    f1u_emit_char 'B'
.Lswap8_009_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r1, pattern 2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1323
    push16 r4
    ldi16 c0, 0x0010
    push16 r4
    ldi16 c0, 0x1569
    push16 r4
    ldi16 c0, 0x168c
    push16 r4
    ldi16 c0, 0x17af
    push16 r4
    ldi16 c0, 0x18d2
    push16 r4
    ldi16 c0, 0x19f5
    push16 r4
    ldi16 c0, 0x1b18
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_00a_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00a_EQ_done
.Lswap8_00a_EQ_true:
    f1u_emit_char 'B'
.Lswap8_00a_EQ_done:
    brne8 .Lswap8_00a_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00a_NE_done
.Lswap8_00a_NE_true:
    f1u_emit_char 'B'
.Lswap8_00a_NE_done:
    brult8 .Lswap8_00a_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00a_ULT_done
.Lswap8_00a_ULT_true:
    f1u_emit_char 'B'
.Lswap8_00a_ULT_done:
    bruge8 .Lswap8_00a_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00a_UGE_done
.Lswap8_00a_UGE_true:
    f1u_emit_char 'B'
.Lswap8_00a_UGE_done:
    brslt8 .Lswap8_00a_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00a_SLT_done
.Lswap8_00a_SLT_true:
    f1u_emit_char 'B'
.Lswap8_00a_SLT_done:
    brsge8 .Lswap8_00a_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00a_SGE_done
.Lswap8_00a_SGE_true:
    f1u_emit_char 'B'
.Lswap8_00a_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r1, pattern 3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1358
    push16 r4
    ldi16 c0, 0x001f
    push16 r4
    ldi16 c0, 0x159e
    push16 r4
    ldi16 c0, 0x16c1
    push16 r4
    ldi16 c0, 0x17e4
    push16 r4
    ldi16 c0, 0x1907
    push16 r4
    ldi16 c0, 0x1a2a
    push16 r4
    ldi16 c0, 0x1b4d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_00b_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00b_EQ_done
.Lswap8_00b_EQ_true:
    f1u_emit_char 'B'
.Lswap8_00b_EQ_done:
    brne8 .Lswap8_00b_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00b_NE_done
.Lswap8_00b_NE_true:
    f1u_emit_char 'B'
.Lswap8_00b_NE_done:
    brult8 .Lswap8_00b_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00b_ULT_done
.Lswap8_00b_ULT_true:
    f1u_emit_char 'B'
.Lswap8_00b_ULT_done:
    bruge8 .Lswap8_00b_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00b_UGE_done
.Lswap8_00b_UGE_true:
    f1u_emit_char 'B'
.Lswap8_00b_UGE_done:
    brslt8 .Lswap8_00b_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00b_SLT_done
.Lswap8_00b_SLT_true:
    f1u_emit_char 'B'
.Lswap8_00b_SLT_done:
    brsge8 .Lswap8_00b_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00b_SGE_done
.Lswap8_00b_SGE_true:
    f1u_emit_char 'B'
.Lswap8_00b_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r1, pattern 4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x138d
    push16 r4
    ldi16 c0, 0x12a5
    push16 r4
    ldi16 c0, 0x15d3
    push16 r4
    ldi16 c0, 0x16f6
    push16 r4
    ldi16 c0, 0x1819
    push16 r4
    ldi16 c0, 0x193c
    push16 r4
    ldi16 c0, 0x1a5f
    push16 r4
    ldi16 c0, 0x1b82
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_00c_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00c_EQ_done
.Lswap8_00c_EQ_true:
    f1u_emit_char 'B'
.Lswap8_00c_EQ_done:
    brne8 .Lswap8_00c_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00c_NE_done
.Lswap8_00c_NE_true:
    f1u_emit_char 'B'
.Lswap8_00c_NE_done:
    brult8 .Lswap8_00c_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00c_ULT_done
.Lswap8_00c_ULT_true:
    f1u_emit_char 'B'
.Lswap8_00c_ULT_done:
    bruge8 .Lswap8_00c_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00c_UGE_done
.Lswap8_00c_UGE_true:
    f1u_emit_char 'B'
.Lswap8_00c_UGE_done:
    brslt8 .Lswap8_00c_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00c_SLT_done
.Lswap8_00c_SLT_true:
    f1u_emit_char 'B'
.Lswap8_00c_SLT_done:
    brsge8 .Lswap8_00c_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00c_SGE_done
.Lswap8_00c_SGE_true:
    f1u_emit_char 'B'
.Lswap8_00c_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r1, pattern 5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x13c2
    push16 r4
    ldi16 c0, 0x80f0
    push16 r4
    ldi16 c0, 0x1608
    push16 r4
    ldi16 c0, 0x172b
    push16 r4
    ldi16 c0, 0x184e
    push16 r4
    ldi16 c0, 0x1971
    push16 r4
    ldi16 c0, 0x1a94
    push16 r4
    ldi16 c0, 0x1bb7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_00d_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00d_EQ_done
.Lswap8_00d_EQ_true:
    f1u_emit_char 'B'
.Lswap8_00d_EQ_done:
    brne8 .Lswap8_00d_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00d_NE_done
.Lswap8_00d_NE_true:
    f1u_emit_char 'B'
.Lswap8_00d_NE_done:
    brult8 .Lswap8_00d_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00d_ULT_done
.Lswap8_00d_ULT_true:
    f1u_emit_char 'B'
.Lswap8_00d_ULT_done:
    bruge8 .Lswap8_00d_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00d_UGE_done
.Lswap8_00d_UGE_true:
    f1u_emit_char 'B'
.Lswap8_00d_UGE_done:
    brslt8 .Lswap8_00d_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00d_SLT_done
.Lswap8_00d_SLT_true:
    f1u_emit_char 'B'
.Lswap8_00d_SLT_done:
    brsge8 .Lswap8_00d_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00d_SGE_done
.Lswap8_00d_SGE_true:
    f1u_emit_char 'B'
.Lswap8_00d_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r1, pattern 6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x13f7
    push16 r4
    ldi16 c0, 0xff0f
    push16 r4
    ldi16 c0, 0x163d
    push16 r4
    ldi16 c0, 0x1760
    push16 r4
    ldi16 c0, 0x1883
    push16 r4
    ldi16 c0, 0x19a6
    push16 r4
    ldi16 c0, 0x1ac9
    push16 r4
    ldi16 c0, 0x1bec
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_00e_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00e_EQ_done
.Lswap8_00e_EQ_true:
    f1u_emit_char 'B'
.Lswap8_00e_EQ_done:
    brne8 .Lswap8_00e_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00e_NE_done
.Lswap8_00e_NE_true:
    f1u_emit_char 'B'
.Lswap8_00e_NE_done:
    brult8 .Lswap8_00e_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00e_ULT_done
.Lswap8_00e_ULT_true:
    f1u_emit_char 'B'
.Lswap8_00e_ULT_done:
    bruge8 .Lswap8_00e_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00e_UGE_done
.Lswap8_00e_UGE_true:
    f1u_emit_char 'B'
.Lswap8_00e_UGE_done:
    brslt8 .Lswap8_00e_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00e_SLT_done
.Lswap8_00e_SLT_true:
    f1u_emit_char 'B'
.Lswap8_00e_SLT_done:
    brsge8 .Lswap8_00e_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00e_SGE_done
.Lswap8_00e_SGE_true:
    f1u_emit_char 'B'
.Lswap8_00e_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r1, pattern 7.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x142c
    push16 r4
    ldi16 c0, 0xa55a
    push16 r4
    ldi16 c0, 0x1672
    push16 r4
    ldi16 c0, 0x1795
    push16 r4
    ldi16 c0, 0x18b8
    push16 r4
    ldi16 c0, 0x19db
    push16 r4
    ldi16 c0, 0x1afe
    push16 r4
    ldi16 c0, 0x1c21
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_00f_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00f_EQ_done
.Lswap8_00f_EQ_true:
    f1u_emit_char 'B'
.Lswap8_00f_EQ_done:
    brne8 .Lswap8_00f_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00f_NE_done
.Lswap8_00f_NE_true:
    f1u_emit_char 'B'
.Lswap8_00f_NE_done:
    brult8 .Lswap8_00f_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00f_ULT_done
.Lswap8_00f_ULT_true:
    f1u_emit_char 'B'
.Lswap8_00f_ULT_done:
    bruge8 .Lswap8_00f_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00f_UGE_done
.Lswap8_00f_UGE_true:
    f1u_emit_char 'B'
.Lswap8_00f_UGE_done:
    brslt8 .Lswap8_00f_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00f_SLT_done
.Lswap8_00f_SLT_true:
    f1u_emit_char 'B'
.Lswap8_00f_SLT_done:
    brsge8 .Lswap8_00f_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_00f_SGE_done
.Lswap8_00f_SGE_true:
    f1u_emit_char 'B'
.Lswap8_00f_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r2, pattern 0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1461
    push16 r4
    ldi16 c0, 0x1584
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x17ca
    push16 r4
    ldi16 c0, 0x18ed
    push16 r4
    ldi16 c0, 0x1a10
    push16 r4
    ldi16 c0, 0x1b33
    push16 r4
    ldi16 c0, 0x1c56
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_010_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_010_EQ_done
.Lswap8_010_EQ_true:
    f1u_emit_char 'B'
.Lswap8_010_EQ_done:
    brne8 .Lswap8_010_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_010_NE_done
.Lswap8_010_NE_true:
    f1u_emit_char 'B'
.Lswap8_010_NE_done:
    brult8 .Lswap8_010_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_010_ULT_done
.Lswap8_010_ULT_true:
    f1u_emit_char 'B'
.Lswap8_010_ULT_done:
    bruge8 .Lswap8_010_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_010_UGE_done
.Lswap8_010_UGE_true:
    f1u_emit_char 'B'
.Lswap8_010_UGE_done:
    brslt8 .Lswap8_010_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_010_SLT_done
.Lswap8_010_SLT_true:
    f1u_emit_char 'B'
.Lswap8_010_SLT_done:
    brsge8 .Lswap8_010_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_010_SGE_done
.Lswap8_010_SGE_true:
    f1u_emit_char 'B'
.Lswap8_010_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r2, pattern 1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1496
    push16 r4
    ldi16 c0, 0x15b9
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x17ff
    push16 r4
    ldi16 c0, 0x1922
    push16 r4
    ldi16 c0, 0x1a45
    push16 r4
    ldi16 c0, 0x1b68
    push16 r4
    ldi16 c0, 0x1c8b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_011_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_011_EQ_done
.Lswap8_011_EQ_true:
    f1u_emit_char 'B'
.Lswap8_011_EQ_done:
    brne8 .Lswap8_011_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_011_NE_done
.Lswap8_011_NE_true:
    f1u_emit_char 'B'
.Lswap8_011_NE_done:
    brult8 .Lswap8_011_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_011_ULT_done
.Lswap8_011_ULT_true:
    f1u_emit_char 'B'
.Lswap8_011_ULT_done:
    bruge8 .Lswap8_011_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_011_UGE_done
.Lswap8_011_UGE_true:
    f1u_emit_char 'B'
.Lswap8_011_UGE_done:
    brslt8 .Lswap8_011_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_011_SLT_done
.Lswap8_011_SLT_true:
    f1u_emit_char 'B'
.Lswap8_011_SLT_done:
    brsge8 .Lswap8_011_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_011_SGE_done
.Lswap8_011_SGE_true:
    f1u_emit_char 'B'
.Lswap8_011_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r2, pattern 2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x14cb
    push16 r4
    ldi16 c0, 0x15ee
    push16 r4
    ldi16 c0, 0x0010
    push16 r4
    ldi16 c0, 0x1834
    push16 r4
    ldi16 c0, 0x1957
    push16 r4
    ldi16 c0, 0x1a7a
    push16 r4
    ldi16 c0, 0x1b9d
    push16 r4
    ldi16 c0, 0x1cc0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_012_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_012_EQ_done
.Lswap8_012_EQ_true:
    f1u_emit_char 'B'
.Lswap8_012_EQ_done:
    brne8 .Lswap8_012_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_012_NE_done
.Lswap8_012_NE_true:
    f1u_emit_char 'B'
.Lswap8_012_NE_done:
    brult8 .Lswap8_012_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_012_ULT_done
.Lswap8_012_ULT_true:
    f1u_emit_char 'B'
.Lswap8_012_ULT_done:
    bruge8 .Lswap8_012_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_012_UGE_done
.Lswap8_012_UGE_true:
    f1u_emit_char 'B'
.Lswap8_012_UGE_done:
    brslt8 .Lswap8_012_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_012_SLT_done
.Lswap8_012_SLT_true:
    f1u_emit_char 'B'
.Lswap8_012_SLT_done:
    brsge8 .Lswap8_012_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_012_SGE_done
.Lswap8_012_SGE_true:
    f1u_emit_char 'B'
.Lswap8_012_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r2, pattern 3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1500
    push16 r4
    ldi16 c0, 0x1623
    push16 r4
    ldi16 c0, 0x001f
    push16 r4
    ldi16 c0, 0x1869
    push16 r4
    ldi16 c0, 0x198c
    push16 r4
    ldi16 c0, 0x1aaf
    push16 r4
    ldi16 c0, 0x1bd2
    push16 r4
    ldi16 c0, 0x1cf5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_013_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_013_EQ_done
.Lswap8_013_EQ_true:
    f1u_emit_char 'B'
.Lswap8_013_EQ_done:
    brne8 .Lswap8_013_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_013_NE_done
.Lswap8_013_NE_true:
    f1u_emit_char 'B'
.Lswap8_013_NE_done:
    brult8 .Lswap8_013_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_013_ULT_done
.Lswap8_013_ULT_true:
    f1u_emit_char 'B'
.Lswap8_013_ULT_done:
    bruge8 .Lswap8_013_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_013_UGE_done
.Lswap8_013_UGE_true:
    f1u_emit_char 'B'
.Lswap8_013_UGE_done:
    brslt8 .Lswap8_013_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_013_SLT_done
.Lswap8_013_SLT_true:
    f1u_emit_char 'B'
.Lswap8_013_SLT_done:
    brsge8 .Lswap8_013_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_013_SGE_done
.Lswap8_013_SGE_true:
    f1u_emit_char 'B'
.Lswap8_013_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r2, pattern 4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1535
    push16 r4
    ldi16 c0, 0x1658
    push16 r4
    ldi16 c0, 0x12a5
    push16 r4
    ldi16 c0, 0x189e
    push16 r4
    ldi16 c0, 0x19c1
    push16 r4
    ldi16 c0, 0x1ae4
    push16 r4
    ldi16 c0, 0x1c07
    push16 r4
    ldi16 c0, 0x1d2a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_014_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_014_EQ_done
.Lswap8_014_EQ_true:
    f1u_emit_char 'B'
.Lswap8_014_EQ_done:
    brne8 .Lswap8_014_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_014_NE_done
.Lswap8_014_NE_true:
    f1u_emit_char 'B'
.Lswap8_014_NE_done:
    brult8 .Lswap8_014_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_014_ULT_done
.Lswap8_014_ULT_true:
    f1u_emit_char 'B'
.Lswap8_014_ULT_done:
    bruge8 .Lswap8_014_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_014_UGE_done
.Lswap8_014_UGE_true:
    f1u_emit_char 'B'
.Lswap8_014_UGE_done:
    brslt8 .Lswap8_014_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_014_SLT_done
.Lswap8_014_SLT_true:
    f1u_emit_char 'B'
.Lswap8_014_SLT_done:
    brsge8 .Lswap8_014_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_014_SGE_done
.Lswap8_014_SGE_true:
    f1u_emit_char 'B'
.Lswap8_014_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r2, pattern 5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x156a
    push16 r4
    ldi16 c0, 0x168d
    push16 r4
    ldi16 c0, 0x80f0
    push16 r4
    ldi16 c0, 0x18d3
    push16 r4
    ldi16 c0, 0x19f6
    push16 r4
    ldi16 c0, 0x1b19
    push16 r4
    ldi16 c0, 0x1c3c
    push16 r4
    ldi16 c0, 0x1d5f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_015_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_015_EQ_done
.Lswap8_015_EQ_true:
    f1u_emit_char 'B'
.Lswap8_015_EQ_done:
    brne8 .Lswap8_015_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_015_NE_done
.Lswap8_015_NE_true:
    f1u_emit_char 'B'
.Lswap8_015_NE_done:
    brult8 .Lswap8_015_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_015_ULT_done
.Lswap8_015_ULT_true:
    f1u_emit_char 'B'
.Lswap8_015_ULT_done:
    bruge8 .Lswap8_015_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_015_UGE_done
.Lswap8_015_UGE_true:
    f1u_emit_char 'B'
.Lswap8_015_UGE_done:
    brslt8 .Lswap8_015_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_015_SLT_done
.Lswap8_015_SLT_true:
    f1u_emit_char 'B'
.Lswap8_015_SLT_done:
    brsge8 .Lswap8_015_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_015_SGE_done
.Lswap8_015_SGE_true:
    f1u_emit_char 'B'
.Lswap8_015_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r2, pattern 6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x159f
    push16 r4
    ldi16 c0, 0x16c2
    push16 r4
    ldi16 c0, 0xff0f
    push16 r4
    ldi16 c0, 0x1908
    push16 r4
    ldi16 c0, 0x1a2b
    push16 r4
    ldi16 c0, 0x1b4e
    push16 r4
    ldi16 c0, 0x1c71
    push16 r4
    ldi16 c0, 0x1d94
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_016_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_016_EQ_done
.Lswap8_016_EQ_true:
    f1u_emit_char 'B'
.Lswap8_016_EQ_done:
    brne8 .Lswap8_016_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_016_NE_done
.Lswap8_016_NE_true:
    f1u_emit_char 'B'
.Lswap8_016_NE_done:
    brult8 .Lswap8_016_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_016_ULT_done
.Lswap8_016_ULT_true:
    f1u_emit_char 'B'
.Lswap8_016_ULT_done:
    bruge8 .Lswap8_016_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_016_UGE_done
.Lswap8_016_UGE_true:
    f1u_emit_char 'B'
.Lswap8_016_UGE_done:
    brslt8 .Lswap8_016_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_016_SLT_done
.Lswap8_016_SLT_true:
    f1u_emit_char 'B'
.Lswap8_016_SLT_done:
    brsge8 .Lswap8_016_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_016_SGE_done
.Lswap8_016_SGE_true:
    f1u_emit_char 'B'
.Lswap8_016_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r2, pattern 7.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x15d4
    push16 r4
    ldi16 c0, 0x16f7
    push16 r4
    ldi16 c0, 0xa55a
    push16 r4
    ldi16 c0, 0x193d
    push16 r4
    ldi16 c0, 0x1a60
    push16 r4
    ldi16 c0, 0x1b83
    push16 r4
    ldi16 c0, 0x1ca6
    push16 r4
    ldi16 c0, 0x1dc9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_017_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_017_EQ_done
.Lswap8_017_EQ_true:
    f1u_emit_char 'B'
.Lswap8_017_EQ_done:
    brne8 .Lswap8_017_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_017_NE_done
.Lswap8_017_NE_true:
    f1u_emit_char 'B'
.Lswap8_017_NE_done:
    brult8 .Lswap8_017_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_017_ULT_done
.Lswap8_017_ULT_true:
    f1u_emit_char 'B'
.Lswap8_017_ULT_done:
    bruge8 .Lswap8_017_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_017_UGE_done
.Lswap8_017_UGE_true:
    f1u_emit_char 'B'
.Lswap8_017_UGE_done:
    brslt8 .Lswap8_017_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_017_SLT_done
.Lswap8_017_SLT_true:
    f1u_emit_char 'B'
.Lswap8_017_SLT_done:
    brsge8 .Lswap8_017_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_017_SGE_done
.Lswap8_017_SGE_true:
    f1u_emit_char 'B'
.Lswap8_017_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r3, pattern 0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1609
    push16 r4
    ldi16 c0, 0x172c
    push16 r4
    ldi16 c0, 0x184f
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x1a95
    push16 r4
    ldi16 c0, 0x1bb8
    push16 r4
    ldi16 c0, 0x1cdb
    push16 r4
    ldi16 c0, 0x1dfe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r3
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_018_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_018_EQ_done
.Lswap8_018_EQ_true:
    f1u_emit_char 'B'
.Lswap8_018_EQ_done:
    brne8 .Lswap8_018_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_018_NE_done
.Lswap8_018_NE_true:
    f1u_emit_char 'B'
.Lswap8_018_NE_done:
    brult8 .Lswap8_018_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_018_ULT_done
.Lswap8_018_ULT_true:
    f1u_emit_char 'B'
.Lswap8_018_ULT_done:
    bruge8 .Lswap8_018_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_018_UGE_done
.Lswap8_018_UGE_true:
    f1u_emit_char 'B'
.Lswap8_018_UGE_done:
    brslt8 .Lswap8_018_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_018_SLT_done
.Lswap8_018_SLT_true:
    f1u_emit_char 'B'
.Lswap8_018_SLT_done:
    brsge8 .Lswap8_018_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_018_SGE_done
.Lswap8_018_SGE_true:
    f1u_emit_char 'B'
.Lswap8_018_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r3, pattern 1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x163e
    push16 r4
    ldi16 c0, 0x1761
    push16 r4
    ldi16 c0, 0x1884
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x1aca
    push16 r4
    ldi16 c0, 0x1bed
    push16 r4
    ldi16 c0, 0x1d10
    push16 r4
    ldi16 c0, 0x1e33
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r3
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_019_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_019_EQ_done
.Lswap8_019_EQ_true:
    f1u_emit_char 'B'
.Lswap8_019_EQ_done:
    brne8 .Lswap8_019_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_019_NE_done
.Lswap8_019_NE_true:
    f1u_emit_char 'B'
.Lswap8_019_NE_done:
    brult8 .Lswap8_019_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_019_ULT_done
.Lswap8_019_ULT_true:
    f1u_emit_char 'B'
.Lswap8_019_ULT_done:
    bruge8 .Lswap8_019_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_019_UGE_done
.Lswap8_019_UGE_true:
    f1u_emit_char 'B'
.Lswap8_019_UGE_done:
    brslt8 .Lswap8_019_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_019_SLT_done
.Lswap8_019_SLT_true:
    f1u_emit_char 'B'
.Lswap8_019_SLT_done:
    brsge8 .Lswap8_019_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_019_SGE_done
.Lswap8_019_SGE_true:
    f1u_emit_char 'B'
.Lswap8_019_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r3, pattern 2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1673
    push16 r4
    ldi16 c0, 0x1796
    push16 r4
    ldi16 c0, 0x18b9
    push16 r4
    ldi16 c0, 0x0010
    push16 r4
    ldi16 c0, 0x1aff
    push16 r4
    ldi16 c0, 0x1c22
    push16 r4
    ldi16 c0, 0x1d45
    push16 r4
    ldi16 c0, 0x1e68
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r3
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_01a_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01a_EQ_done
.Lswap8_01a_EQ_true:
    f1u_emit_char 'B'
.Lswap8_01a_EQ_done:
    brne8 .Lswap8_01a_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01a_NE_done
.Lswap8_01a_NE_true:
    f1u_emit_char 'B'
.Lswap8_01a_NE_done:
    brult8 .Lswap8_01a_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01a_ULT_done
.Lswap8_01a_ULT_true:
    f1u_emit_char 'B'
.Lswap8_01a_ULT_done:
    bruge8 .Lswap8_01a_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01a_UGE_done
.Lswap8_01a_UGE_true:
    f1u_emit_char 'B'
.Lswap8_01a_UGE_done:
    brslt8 .Lswap8_01a_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01a_SLT_done
.Lswap8_01a_SLT_true:
    f1u_emit_char 'B'
.Lswap8_01a_SLT_done:
    brsge8 .Lswap8_01a_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01a_SGE_done
.Lswap8_01a_SGE_true:
    f1u_emit_char 'B'
.Lswap8_01a_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r3, pattern 3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x16a8
    push16 r4
    ldi16 c0, 0x17cb
    push16 r4
    ldi16 c0, 0x18ee
    push16 r4
    ldi16 c0, 0x001f
    push16 r4
    ldi16 c0, 0x1b34
    push16 r4
    ldi16 c0, 0x1c57
    push16 r4
    ldi16 c0, 0x1d7a
    push16 r4
    ldi16 c0, 0x1e9d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r3
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_01b_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01b_EQ_done
.Lswap8_01b_EQ_true:
    f1u_emit_char 'B'
.Lswap8_01b_EQ_done:
    brne8 .Lswap8_01b_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01b_NE_done
.Lswap8_01b_NE_true:
    f1u_emit_char 'B'
.Lswap8_01b_NE_done:
    brult8 .Lswap8_01b_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01b_ULT_done
.Lswap8_01b_ULT_true:
    f1u_emit_char 'B'
.Lswap8_01b_ULT_done:
    bruge8 .Lswap8_01b_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01b_UGE_done
.Lswap8_01b_UGE_true:
    f1u_emit_char 'B'
.Lswap8_01b_UGE_done:
    brslt8 .Lswap8_01b_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01b_SLT_done
.Lswap8_01b_SLT_true:
    f1u_emit_char 'B'
.Lswap8_01b_SLT_done:
    brsge8 .Lswap8_01b_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01b_SGE_done
.Lswap8_01b_SGE_true:
    f1u_emit_char 'B'
.Lswap8_01b_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r3, pattern 4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x16dd
    push16 r4
    ldi16 c0, 0x1800
    push16 r4
    ldi16 c0, 0x1923
    push16 r4
    ldi16 c0, 0x12a5
    push16 r4
    ldi16 c0, 0x1b69
    push16 r4
    ldi16 c0, 0x1c8c
    push16 r4
    ldi16 c0, 0x1daf
    push16 r4
    ldi16 c0, 0x1ed2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r3
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_01c_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01c_EQ_done
.Lswap8_01c_EQ_true:
    f1u_emit_char 'B'
.Lswap8_01c_EQ_done:
    brne8 .Lswap8_01c_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01c_NE_done
.Lswap8_01c_NE_true:
    f1u_emit_char 'B'
.Lswap8_01c_NE_done:
    brult8 .Lswap8_01c_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01c_ULT_done
.Lswap8_01c_ULT_true:
    f1u_emit_char 'B'
.Lswap8_01c_ULT_done:
    bruge8 .Lswap8_01c_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01c_UGE_done
.Lswap8_01c_UGE_true:
    f1u_emit_char 'B'
.Lswap8_01c_UGE_done:
    brslt8 .Lswap8_01c_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01c_SLT_done
.Lswap8_01c_SLT_true:
    f1u_emit_char 'B'
.Lswap8_01c_SLT_done:
    brsge8 .Lswap8_01c_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01c_SGE_done
.Lswap8_01c_SGE_true:
    f1u_emit_char 'B'
.Lswap8_01c_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r3, pattern 5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1712
    push16 r4
    ldi16 c0, 0x1835
    push16 r4
    ldi16 c0, 0x1958
    push16 r4
    ldi16 c0, 0x80f0
    push16 r4
    ldi16 c0, 0x1b9e
    push16 r4
    ldi16 c0, 0x1cc1
    push16 r4
    ldi16 c0, 0x1de4
    push16 r4
    ldi16 c0, 0x1f07
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r3
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_01d_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01d_EQ_done
.Lswap8_01d_EQ_true:
    f1u_emit_char 'B'
.Lswap8_01d_EQ_done:
    brne8 .Lswap8_01d_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01d_NE_done
.Lswap8_01d_NE_true:
    f1u_emit_char 'B'
.Lswap8_01d_NE_done:
    brult8 .Lswap8_01d_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01d_ULT_done
.Lswap8_01d_ULT_true:
    f1u_emit_char 'B'
.Lswap8_01d_ULT_done:
    bruge8 .Lswap8_01d_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01d_UGE_done
.Lswap8_01d_UGE_true:
    f1u_emit_char 'B'
.Lswap8_01d_UGE_done:
    brslt8 .Lswap8_01d_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01d_SLT_done
.Lswap8_01d_SLT_true:
    f1u_emit_char 'B'
.Lswap8_01d_SLT_done:
    brsge8 .Lswap8_01d_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01d_SGE_done
.Lswap8_01d_SGE_true:
    f1u_emit_char 'B'
.Lswap8_01d_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r3, pattern 6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1747
    push16 r4
    ldi16 c0, 0x186a
    push16 r4
    ldi16 c0, 0x198d
    push16 r4
    ldi16 c0, 0xff0f
    push16 r4
    ldi16 c0, 0x1bd3
    push16 r4
    ldi16 c0, 0x1cf6
    push16 r4
    ldi16 c0, 0x1e19
    push16 r4
    ldi16 c0, 0x1f3c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r3
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_01e_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01e_EQ_done
.Lswap8_01e_EQ_true:
    f1u_emit_char 'B'
.Lswap8_01e_EQ_done:
    brne8 .Lswap8_01e_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01e_NE_done
.Lswap8_01e_NE_true:
    f1u_emit_char 'B'
.Lswap8_01e_NE_done:
    brult8 .Lswap8_01e_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01e_ULT_done
.Lswap8_01e_ULT_true:
    f1u_emit_char 'B'
.Lswap8_01e_ULT_done:
    bruge8 .Lswap8_01e_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01e_UGE_done
.Lswap8_01e_UGE_true:
    f1u_emit_char 'B'
.Lswap8_01e_UGE_done:
    brslt8 .Lswap8_01e_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01e_SLT_done
.Lswap8_01e_SLT_true:
    f1u_emit_char 'B'
.Lswap8_01e_SLT_done:
    brsge8 .Lswap8_01e_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01e_SGE_done
.Lswap8_01e_SGE_true:
    f1u_emit_char 'B'
.Lswap8_01e_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r3, pattern 7.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x177c
    push16 r4
    ldi16 c0, 0x189f
    push16 r4
    ldi16 c0, 0x19c2
    push16 r4
    ldi16 c0, 0xa55a
    push16 r4
    ldi16 c0, 0x1c08
    push16 r4
    ldi16 c0, 0x1d2b
    push16 r4
    ldi16 c0, 0x1e4e
    push16 r4
    ldi16 c0, 0x1f71
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r3
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_01f_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01f_EQ_done
.Lswap8_01f_EQ_true:
    f1u_emit_char 'B'
.Lswap8_01f_EQ_done:
    brne8 .Lswap8_01f_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01f_NE_done
.Lswap8_01f_NE_true:
    f1u_emit_char 'B'
.Lswap8_01f_NE_done:
    brult8 .Lswap8_01f_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01f_ULT_done
.Lswap8_01f_ULT_true:
    f1u_emit_char 'B'
.Lswap8_01f_ULT_done:
    bruge8 .Lswap8_01f_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01f_UGE_done
.Lswap8_01f_UGE_true:
    f1u_emit_char 'B'
.Lswap8_01f_UGE_done:
    brslt8 .Lswap8_01f_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01f_SLT_done
.Lswap8_01f_SLT_true:
    f1u_emit_char 'B'
.Lswap8_01f_SLT_done:
    brsge8 .Lswap8_01f_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_01f_SGE_done
.Lswap8_01f_SGE_true:
    f1u_emit_char 'B'
.Lswap8_01f_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r4, pattern 0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x17b1
    push16 r4
    ldi16 c0, 0x18d4
    push16 r4
    ldi16 c0, 0x19f7
    push16 r4
    ldi16 c0, 0x1b1a
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x1d60
    push16 r4
    ldi16 c0, 0x1e83
    push16 r4
    ldi16 c0, 0x1fa6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_020_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_020_EQ_done
.Lswap8_020_EQ_true:
    f1u_emit_char 'B'
.Lswap8_020_EQ_done:
    brne8 .Lswap8_020_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_020_NE_done
.Lswap8_020_NE_true:
    f1u_emit_char 'B'
.Lswap8_020_NE_done:
    brult8 .Lswap8_020_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_020_ULT_done
.Lswap8_020_ULT_true:
    f1u_emit_char 'B'
.Lswap8_020_ULT_done:
    bruge8 .Lswap8_020_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_020_UGE_done
.Lswap8_020_UGE_true:
    f1u_emit_char 'B'
.Lswap8_020_UGE_done:
    brslt8 .Lswap8_020_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_020_SLT_done
.Lswap8_020_SLT_true:
    f1u_emit_char 'B'
.Lswap8_020_SLT_done:
    brsge8 .Lswap8_020_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_020_SGE_done
.Lswap8_020_SGE_true:
    f1u_emit_char 'B'
.Lswap8_020_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r4, pattern 1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x17e6
    push16 r4
    ldi16 c0, 0x1909
    push16 r4
    ldi16 c0, 0x1a2c
    push16 r4
    ldi16 c0, 0x1b4f
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x1d95
    push16 r4
    ldi16 c0, 0x1eb8
    push16 r4
    ldi16 c0, 0x1fdb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_021_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_021_EQ_done
.Lswap8_021_EQ_true:
    f1u_emit_char 'B'
.Lswap8_021_EQ_done:
    brne8 .Lswap8_021_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_021_NE_done
.Lswap8_021_NE_true:
    f1u_emit_char 'B'
.Lswap8_021_NE_done:
    brult8 .Lswap8_021_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_021_ULT_done
.Lswap8_021_ULT_true:
    f1u_emit_char 'B'
.Lswap8_021_ULT_done:
    bruge8 .Lswap8_021_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_021_UGE_done
.Lswap8_021_UGE_true:
    f1u_emit_char 'B'
.Lswap8_021_UGE_done:
    brslt8 .Lswap8_021_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_021_SLT_done
.Lswap8_021_SLT_true:
    f1u_emit_char 'B'
.Lswap8_021_SLT_done:
    brsge8 .Lswap8_021_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_021_SGE_done
.Lswap8_021_SGE_true:
    f1u_emit_char 'B'
.Lswap8_021_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r4, pattern 2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x181b
    push16 r4
    ldi16 c0, 0x193e
    push16 r4
    ldi16 c0, 0x1a61
    push16 r4
    ldi16 c0, 0x1b84
    push16 r4
    ldi16 c0, 0x0010
    push16 r4
    ldi16 c0, 0x1dca
    push16 r4
    ldi16 c0, 0x1eed
    push16 r4
    ldi16 c0, 0x2010
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_022_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_022_EQ_done
.Lswap8_022_EQ_true:
    f1u_emit_char 'B'
.Lswap8_022_EQ_done:
    brne8 .Lswap8_022_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_022_NE_done
.Lswap8_022_NE_true:
    f1u_emit_char 'B'
.Lswap8_022_NE_done:
    brult8 .Lswap8_022_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_022_ULT_done
.Lswap8_022_ULT_true:
    f1u_emit_char 'B'
.Lswap8_022_ULT_done:
    bruge8 .Lswap8_022_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_022_UGE_done
.Lswap8_022_UGE_true:
    f1u_emit_char 'B'
.Lswap8_022_UGE_done:
    brslt8 .Lswap8_022_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_022_SLT_done
.Lswap8_022_SLT_true:
    f1u_emit_char 'B'
.Lswap8_022_SLT_done:
    brsge8 .Lswap8_022_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_022_SGE_done
.Lswap8_022_SGE_true:
    f1u_emit_char 'B'
.Lswap8_022_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r4, pattern 3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1850
    push16 r4
    ldi16 c0, 0x1973
    push16 r4
    ldi16 c0, 0x1a96
    push16 r4
    ldi16 c0, 0x1bb9
    push16 r4
    ldi16 c0, 0x001f
    push16 r4
    ldi16 c0, 0x1dff
    push16 r4
    ldi16 c0, 0x1f22
    push16 r4
    ldi16 c0, 0x2045
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_023_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_023_EQ_done
.Lswap8_023_EQ_true:
    f1u_emit_char 'B'
.Lswap8_023_EQ_done:
    brne8 .Lswap8_023_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_023_NE_done
.Lswap8_023_NE_true:
    f1u_emit_char 'B'
.Lswap8_023_NE_done:
    brult8 .Lswap8_023_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_023_ULT_done
.Lswap8_023_ULT_true:
    f1u_emit_char 'B'
.Lswap8_023_ULT_done:
    bruge8 .Lswap8_023_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_023_UGE_done
.Lswap8_023_UGE_true:
    f1u_emit_char 'B'
.Lswap8_023_UGE_done:
    brslt8 .Lswap8_023_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_023_SLT_done
.Lswap8_023_SLT_true:
    f1u_emit_char 'B'
.Lswap8_023_SLT_done:
    brsge8 .Lswap8_023_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_023_SGE_done
.Lswap8_023_SGE_true:
    f1u_emit_char 'B'
.Lswap8_023_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r4, pattern 4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1885
    push16 r4
    ldi16 c0, 0x19a8
    push16 r4
    ldi16 c0, 0x1acb
    push16 r4
    ldi16 c0, 0x1bee
    push16 r4
    ldi16 c0, 0x12a5
    push16 r4
    ldi16 c0, 0x1e34
    push16 r4
    ldi16 c0, 0x1f57
    push16 r4
    ldi16 c0, 0x207a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_024_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_024_EQ_done
.Lswap8_024_EQ_true:
    f1u_emit_char 'B'
.Lswap8_024_EQ_done:
    brne8 .Lswap8_024_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_024_NE_done
.Lswap8_024_NE_true:
    f1u_emit_char 'B'
.Lswap8_024_NE_done:
    brult8 .Lswap8_024_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_024_ULT_done
.Lswap8_024_ULT_true:
    f1u_emit_char 'B'
.Lswap8_024_ULT_done:
    bruge8 .Lswap8_024_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_024_UGE_done
.Lswap8_024_UGE_true:
    f1u_emit_char 'B'
.Lswap8_024_UGE_done:
    brslt8 .Lswap8_024_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_024_SLT_done
.Lswap8_024_SLT_true:
    f1u_emit_char 'B'
.Lswap8_024_SLT_done:
    brsge8 .Lswap8_024_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_024_SGE_done
.Lswap8_024_SGE_true:
    f1u_emit_char 'B'
.Lswap8_024_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r4, pattern 5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x18ba
    push16 r4
    ldi16 c0, 0x19dd
    push16 r4
    ldi16 c0, 0x1b00
    push16 r4
    ldi16 c0, 0x1c23
    push16 r4
    ldi16 c0, 0x80f0
    push16 r4
    ldi16 c0, 0x1e69
    push16 r4
    ldi16 c0, 0x1f8c
    push16 r4
    ldi16 c0, 0x20af
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_025_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_025_EQ_done
.Lswap8_025_EQ_true:
    f1u_emit_char 'B'
.Lswap8_025_EQ_done:
    brne8 .Lswap8_025_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_025_NE_done
.Lswap8_025_NE_true:
    f1u_emit_char 'B'
.Lswap8_025_NE_done:
    brult8 .Lswap8_025_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_025_ULT_done
.Lswap8_025_ULT_true:
    f1u_emit_char 'B'
.Lswap8_025_ULT_done:
    bruge8 .Lswap8_025_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_025_UGE_done
.Lswap8_025_UGE_true:
    f1u_emit_char 'B'
.Lswap8_025_UGE_done:
    brslt8 .Lswap8_025_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_025_SLT_done
.Lswap8_025_SLT_true:
    f1u_emit_char 'B'
.Lswap8_025_SLT_done:
    brsge8 .Lswap8_025_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_025_SGE_done
.Lswap8_025_SGE_true:
    f1u_emit_char 'B'
.Lswap8_025_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r4, pattern 6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x18ef
    push16 r4
    ldi16 c0, 0x1a12
    push16 r4
    ldi16 c0, 0x1b35
    push16 r4
    ldi16 c0, 0x1c58
    push16 r4
    ldi16 c0, 0xff0f
    push16 r4
    ldi16 c0, 0x1e9e
    push16 r4
    ldi16 c0, 0x1fc1
    push16 r4
    ldi16 c0, 0x20e4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_026_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_026_EQ_done
.Lswap8_026_EQ_true:
    f1u_emit_char 'B'
.Lswap8_026_EQ_done:
    brne8 .Lswap8_026_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_026_NE_done
.Lswap8_026_NE_true:
    f1u_emit_char 'B'
.Lswap8_026_NE_done:
    brult8 .Lswap8_026_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_026_ULT_done
.Lswap8_026_ULT_true:
    f1u_emit_char 'B'
.Lswap8_026_ULT_done:
    bruge8 .Lswap8_026_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_026_UGE_done
.Lswap8_026_UGE_true:
    f1u_emit_char 'B'
.Lswap8_026_UGE_done:
    brslt8 .Lswap8_026_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_026_SLT_done
.Lswap8_026_SLT_true:
    f1u_emit_char 'B'
.Lswap8_026_SLT_done:
    brsge8 .Lswap8_026_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_026_SGE_done
.Lswap8_026_SGE_true:
    f1u_emit_char 'B'
.Lswap8_026_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r4, pattern 7.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1924
    push16 r4
    ldi16 c0, 0x1a47
    push16 r4
    ldi16 c0, 0x1b6a
    push16 r4
    ldi16 c0, 0x1c8d
    push16 r4
    ldi16 c0, 0xa55a
    push16 r4
    ldi16 c0, 0x1ed3
    push16 r4
    ldi16 c0, 0x1ff6
    push16 r4
    ldi16 c0, 0x2119
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_027_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_027_EQ_done
.Lswap8_027_EQ_true:
    f1u_emit_char 'B'
.Lswap8_027_EQ_done:
    brne8 .Lswap8_027_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_027_NE_done
.Lswap8_027_NE_true:
    f1u_emit_char 'B'
.Lswap8_027_NE_done:
    brult8 .Lswap8_027_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_027_ULT_done
.Lswap8_027_ULT_true:
    f1u_emit_char 'B'
.Lswap8_027_ULT_done:
    bruge8 .Lswap8_027_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_027_UGE_done
.Lswap8_027_UGE_true:
    f1u_emit_char 'B'
.Lswap8_027_UGE_done:
    brslt8 .Lswap8_027_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_027_SLT_done
.Lswap8_027_SLT_true:
    f1u_emit_char 'B'
.Lswap8_027_SLT_done:
    brsge8 .Lswap8_027_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_027_SGE_done
.Lswap8_027_SGE_true:
    f1u_emit_char 'B'
.Lswap8_027_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r5, pattern 0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1959
    push16 r4
    ldi16 c0, 0x1a7c
    push16 r4
    ldi16 c0, 0x1b9f
    push16 r4
    ldi16 c0, 0x1cc2
    push16 r4
    ldi16 c0, 0x1de5
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x202b
    push16 r4
    ldi16 c0, 0x214e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_028_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_028_EQ_done
.Lswap8_028_EQ_true:
    f1u_emit_char 'B'
.Lswap8_028_EQ_done:
    brne8 .Lswap8_028_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_028_NE_done
.Lswap8_028_NE_true:
    f1u_emit_char 'B'
.Lswap8_028_NE_done:
    brult8 .Lswap8_028_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_028_ULT_done
.Lswap8_028_ULT_true:
    f1u_emit_char 'B'
.Lswap8_028_ULT_done:
    bruge8 .Lswap8_028_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_028_UGE_done
.Lswap8_028_UGE_true:
    f1u_emit_char 'B'
.Lswap8_028_UGE_done:
    brslt8 .Lswap8_028_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_028_SLT_done
.Lswap8_028_SLT_true:
    f1u_emit_char 'B'
.Lswap8_028_SLT_done:
    brsge8 .Lswap8_028_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_028_SGE_done
.Lswap8_028_SGE_true:
    f1u_emit_char 'B'
.Lswap8_028_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r5, pattern 1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x198e
    push16 r4
    ldi16 c0, 0x1ab1
    push16 r4
    ldi16 c0, 0x1bd4
    push16 r4
    ldi16 c0, 0x1cf7
    push16 r4
    ldi16 c0, 0x1e1a
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x2060
    push16 r4
    ldi16 c0, 0x2183
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_029_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_029_EQ_done
.Lswap8_029_EQ_true:
    f1u_emit_char 'B'
.Lswap8_029_EQ_done:
    brne8 .Lswap8_029_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_029_NE_done
.Lswap8_029_NE_true:
    f1u_emit_char 'B'
.Lswap8_029_NE_done:
    brult8 .Lswap8_029_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_029_ULT_done
.Lswap8_029_ULT_true:
    f1u_emit_char 'B'
.Lswap8_029_ULT_done:
    bruge8 .Lswap8_029_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_029_UGE_done
.Lswap8_029_UGE_true:
    f1u_emit_char 'B'
.Lswap8_029_UGE_done:
    brslt8 .Lswap8_029_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_029_SLT_done
.Lswap8_029_SLT_true:
    f1u_emit_char 'B'
.Lswap8_029_SLT_done:
    brsge8 .Lswap8_029_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_029_SGE_done
.Lswap8_029_SGE_true:
    f1u_emit_char 'B'
.Lswap8_029_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r5, pattern 2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x19c3
    push16 r4
    ldi16 c0, 0x1ae6
    push16 r4
    ldi16 c0, 0x1c09
    push16 r4
    ldi16 c0, 0x1d2c
    push16 r4
    ldi16 c0, 0x1e4f
    push16 r4
    ldi16 c0, 0x0010
    push16 r4
    ldi16 c0, 0x2095
    push16 r4
    ldi16 c0, 0x21b8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_02a_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02a_EQ_done
.Lswap8_02a_EQ_true:
    f1u_emit_char 'B'
.Lswap8_02a_EQ_done:
    brne8 .Lswap8_02a_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02a_NE_done
.Lswap8_02a_NE_true:
    f1u_emit_char 'B'
.Lswap8_02a_NE_done:
    brult8 .Lswap8_02a_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02a_ULT_done
.Lswap8_02a_ULT_true:
    f1u_emit_char 'B'
.Lswap8_02a_ULT_done:
    bruge8 .Lswap8_02a_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02a_UGE_done
.Lswap8_02a_UGE_true:
    f1u_emit_char 'B'
.Lswap8_02a_UGE_done:
    brslt8 .Lswap8_02a_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02a_SLT_done
.Lswap8_02a_SLT_true:
    f1u_emit_char 'B'
.Lswap8_02a_SLT_done:
    brsge8 .Lswap8_02a_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02a_SGE_done
.Lswap8_02a_SGE_true:
    f1u_emit_char 'B'
.Lswap8_02a_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r5, pattern 3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x19f8
    push16 r4
    ldi16 c0, 0x1b1b
    push16 r4
    ldi16 c0, 0x1c3e
    push16 r4
    ldi16 c0, 0x1d61
    push16 r4
    ldi16 c0, 0x1e84
    push16 r4
    ldi16 c0, 0x001f
    push16 r4
    ldi16 c0, 0x20ca
    push16 r4
    ldi16 c0, 0x21ed
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_02b_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02b_EQ_done
.Lswap8_02b_EQ_true:
    f1u_emit_char 'B'
.Lswap8_02b_EQ_done:
    brne8 .Lswap8_02b_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02b_NE_done
.Lswap8_02b_NE_true:
    f1u_emit_char 'B'
.Lswap8_02b_NE_done:
    brult8 .Lswap8_02b_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02b_ULT_done
.Lswap8_02b_ULT_true:
    f1u_emit_char 'B'
.Lswap8_02b_ULT_done:
    bruge8 .Lswap8_02b_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02b_UGE_done
.Lswap8_02b_UGE_true:
    f1u_emit_char 'B'
.Lswap8_02b_UGE_done:
    brslt8 .Lswap8_02b_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02b_SLT_done
.Lswap8_02b_SLT_true:
    f1u_emit_char 'B'
.Lswap8_02b_SLT_done:
    brsge8 .Lswap8_02b_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02b_SGE_done
.Lswap8_02b_SGE_true:
    f1u_emit_char 'B'
.Lswap8_02b_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r5, pattern 4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1a2d
    push16 r4
    ldi16 c0, 0x1b50
    push16 r4
    ldi16 c0, 0x1c73
    push16 r4
    ldi16 c0, 0x1d96
    push16 r4
    ldi16 c0, 0x1eb9
    push16 r4
    ldi16 c0, 0x12a5
    push16 r4
    ldi16 c0, 0x20ff
    push16 r4
    ldi16 c0, 0x2222
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_02c_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02c_EQ_done
.Lswap8_02c_EQ_true:
    f1u_emit_char 'B'
.Lswap8_02c_EQ_done:
    brne8 .Lswap8_02c_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02c_NE_done
.Lswap8_02c_NE_true:
    f1u_emit_char 'B'
.Lswap8_02c_NE_done:
    brult8 .Lswap8_02c_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02c_ULT_done
.Lswap8_02c_ULT_true:
    f1u_emit_char 'B'
.Lswap8_02c_ULT_done:
    bruge8 .Lswap8_02c_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02c_UGE_done
.Lswap8_02c_UGE_true:
    f1u_emit_char 'B'
.Lswap8_02c_UGE_done:
    brslt8 .Lswap8_02c_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02c_SLT_done
.Lswap8_02c_SLT_true:
    f1u_emit_char 'B'
.Lswap8_02c_SLT_done:
    brsge8 .Lswap8_02c_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02c_SGE_done
.Lswap8_02c_SGE_true:
    f1u_emit_char 'B'
.Lswap8_02c_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r5, pattern 5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1a62
    push16 r4
    ldi16 c0, 0x1b85
    push16 r4
    ldi16 c0, 0x1ca8
    push16 r4
    ldi16 c0, 0x1dcb
    push16 r4
    ldi16 c0, 0x1eee
    push16 r4
    ldi16 c0, 0x80f0
    push16 r4
    ldi16 c0, 0x2134
    push16 r4
    ldi16 c0, 0x2257
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_02d_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02d_EQ_done
.Lswap8_02d_EQ_true:
    f1u_emit_char 'B'
.Lswap8_02d_EQ_done:
    brne8 .Lswap8_02d_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02d_NE_done
.Lswap8_02d_NE_true:
    f1u_emit_char 'B'
.Lswap8_02d_NE_done:
    brult8 .Lswap8_02d_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02d_ULT_done
.Lswap8_02d_ULT_true:
    f1u_emit_char 'B'
.Lswap8_02d_ULT_done:
    bruge8 .Lswap8_02d_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02d_UGE_done
.Lswap8_02d_UGE_true:
    f1u_emit_char 'B'
.Lswap8_02d_UGE_done:
    brslt8 .Lswap8_02d_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02d_SLT_done
.Lswap8_02d_SLT_true:
    f1u_emit_char 'B'
.Lswap8_02d_SLT_done:
    brsge8 .Lswap8_02d_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02d_SGE_done
.Lswap8_02d_SGE_true:
    f1u_emit_char 'B'
.Lswap8_02d_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r5, pattern 6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1a97
    push16 r4
    ldi16 c0, 0x1bba
    push16 r4
    ldi16 c0, 0x1cdd
    push16 r4
    ldi16 c0, 0x1e00
    push16 r4
    ldi16 c0, 0x1f23
    push16 r4
    ldi16 c0, 0xff0f
    push16 r4
    ldi16 c0, 0x2169
    push16 r4
    ldi16 c0, 0x228c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_02e_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02e_EQ_done
.Lswap8_02e_EQ_true:
    f1u_emit_char 'B'
.Lswap8_02e_EQ_done:
    brne8 .Lswap8_02e_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02e_NE_done
.Lswap8_02e_NE_true:
    f1u_emit_char 'B'
.Lswap8_02e_NE_done:
    brult8 .Lswap8_02e_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02e_ULT_done
.Lswap8_02e_ULT_true:
    f1u_emit_char 'B'
.Lswap8_02e_ULT_done:
    bruge8 .Lswap8_02e_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02e_UGE_done
.Lswap8_02e_UGE_true:
    f1u_emit_char 'B'
.Lswap8_02e_UGE_done:
    brslt8 .Lswap8_02e_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02e_SLT_done
.Lswap8_02e_SLT_true:
    f1u_emit_char 'B'
.Lswap8_02e_SLT_done:
    brsge8 .Lswap8_02e_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02e_SGE_done
.Lswap8_02e_SGE_true:
    f1u_emit_char 'B'
.Lswap8_02e_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r5, pattern 7.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1acc
    push16 r4
    ldi16 c0, 0x1bef
    push16 r4
    ldi16 c0, 0x1d12
    push16 r4
    ldi16 c0, 0x1e35
    push16 r4
    ldi16 c0, 0x1f58
    push16 r4
    ldi16 c0, 0xa55a
    push16 r4
    ldi16 c0, 0x219e
    push16 r4
    ldi16 c0, 0x22c1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_02f_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02f_EQ_done
.Lswap8_02f_EQ_true:
    f1u_emit_char 'B'
.Lswap8_02f_EQ_done:
    brne8 .Lswap8_02f_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02f_NE_done
.Lswap8_02f_NE_true:
    f1u_emit_char 'B'
.Lswap8_02f_NE_done:
    brult8 .Lswap8_02f_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02f_ULT_done
.Lswap8_02f_ULT_true:
    f1u_emit_char 'B'
.Lswap8_02f_ULT_done:
    bruge8 .Lswap8_02f_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02f_UGE_done
.Lswap8_02f_UGE_true:
    f1u_emit_char 'B'
.Lswap8_02f_UGE_done:
    brslt8 .Lswap8_02f_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02f_SLT_done
.Lswap8_02f_SLT_true:
    f1u_emit_char 'B'
.Lswap8_02f_SLT_done:
    brsge8 .Lswap8_02f_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_02f_SGE_done
.Lswap8_02f_SGE_true:
    f1u_emit_char 'B'
.Lswap8_02f_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r6, pattern 0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1b01
    push16 r4
    ldi16 c0, 0x1c24
    push16 r4
    ldi16 c0, 0x1d47
    push16 r4
    ldi16 c0, 0x1e6a
    push16 r4
    ldi16 c0, 0x1f8d
    push16 r4
    ldi16 c0, 0x20b0
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    ldi16 c0, 0x22f6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_030_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_030_EQ_done
.Lswap8_030_EQ_true:
    f1u_emit_char 'B'
.Lswap8_030_EQ_done:
    brne8 .Lswap8_030_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_030_NE_done
.Lswap8_030_NE_true:
    f1u_emit_char 'B'
.Lswap8_030_NE_done:
    brult8 .Lswap8_030_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_030_ULT_done
.Lswap8_030_ULT_true:
    f1u_emit_char 'B'
.Lswap8_030_ULT_done:
    bruge8 .Lswap8_030_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_030_UGE_done
.Lswap8_030_UGE_true:
    f1u_emit_char 'B'
.Lswap8_030_UGE_done:
    brslt8 .Lswap8_030_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_030_SLT_done
.Lswap8_030_SLT_true:
    f1u_emit_char 'B'
.Lswap8_030_SLT_done:
    brsge8 .Lswap8_030_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_030_SGE_done
.Lswap8_030_SGE_true:
    f1u_emit_char 'B'
.Lswap8_030_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r6, pattern 1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1b36
    push16 r4
    ldi16 c0, 0x1c59
    push16 r4
    ldi16 c0, 0x1d7c
    push16 r4
    ldi16 c0, 0x1e9f
    push16 r4
    ldi16 c0, 0x1fc2
    push16 r4
    ldi16 c0, 0x20e5
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    ldi16 c0, 0x232b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_031_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_031_EQ_done
.Lswap8_031_EQ_true:
    f1u_emit_char 'B'
.Lswap8_031_EQ_done:
    brne8 .Lswap8_031_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_031_NE_done
.Lswap8_031_NE_true:
    f1u_emit_char 'B'
.Lswap8_031_NE_done:
    brult8 .Lswap8_031_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_031_ULT_done
.Lswap8_031_ULT_true:
    f1u_emit_char 'B'
.Lswap8_031_ULT_done:
    bruge8 .Lswap8_031_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_031_UGE_done
.Lswap8_031_UGE_true:
    f1u_emit_char 'B'
.Lswap8_031_UGE_done:
    brslt8 .Lswap8_031_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_031_SLT_done
.Lswap8_031_SLT_true:
    f1u_emit_char 'B'
.Lswap8_031_SLT_done:
    brsge8 .Lswap8_031_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_031_SGE_done
.Lswap8_031_SGE_true:
    f1u_emit_char 'B'
.Lswap8_031_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r6, pattern 2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1b6b
    push16 r4
    ldi16 c0, 0x1c8e
    push16 r4
    ldi16 c0, 0x1db1
    push16 r4
    ldi16 c0, 0x1ed4
    push16 r4
    ldi16 c0, 0x1ff7
    push16 r4
    ldi16 c0, 0x211a
    push16 r4
    ldi16 c0, 0x0010
    push16 r4
    ldi16 c0, 0x2360
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_032_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_032_EQ_done
.Lswap8_032_EQ_true:
    f1u_emit_char 'B'
.Lswap8_032_EQ_done:
    brne8 .Lswap8_032_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_032_NE_done
.Lswap8_032_NE_true:
    f1u_emit_char 'B'
.Lswap8_032_NE_done:
    brult8 .Lswap8_032_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_032_ULT_done
.Lswap8_032_ULT_true:
    f1u_emit_char 'B'
.Lswap8_032_ULT_done:
    bruge8 .Lswap8_032_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_032_UGE_done
.Lswap8_032_UGE_true:
    f1u_emit_char 'B'
.Lswap8_032_UGE_done:
    brslt8 .Lswap8_032_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_032_SLT_done
.Lswap8_032_SLT_true:
    f1u_emit_char 'B'
.Lswap8_032_SLT_done:
    brsge8 .Lswap8_032_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_032_SGE_done
.Lswap8_032_SGE_true:
    f1u_emit_char 'B'
.Lswap8_032_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r6, pattern 3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1ba0
    push16 r4
    ldi16 c0, 0x1cc3
    push16 r4
    ldi16 c0, 0x1de6
    push16 r4
    ldi16 c0, 0x1f09
    push16 r4
    ldi16 c0, 0x202c
    push16 r4
    ldi16 c0, 0x214f
    push16 r4
    ldi16 c0, 0x001f
    push16 r4
    ldi16 c0, 0x2395
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_033_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_033_EQ_done
.Lswap8_033_EQ_true:
    f1u_emit_char 'B'
.Lswap8_033_EQ_done:
    brne8 .Lswap8_033_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_033_NE_done
.Lswap8_033_NE_true:
    f1u_emit_char 'B'
.Lswap8_033_NE_done:
    brult8 .Lswap8_033_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_033_ULT_done
.Lswap8_033_ULT_true:
    f1u_emit_char 'B'
.Lswap8_033_ULT_done:
    bruge8 .Lswap8_033_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_033_UGE_done
.Lswap8_033_UGE_true:
    f1u_emit_char 'B'
.Lswap8_033_UGE_done:
    brslt8 .Lswap8_033_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_033_SLT_done
.Lswap8_033_SLT_true:
    f1u_emit_char 'B'
.Lswap8_033_SLT_done:
    brsge8 .Lswap8_033_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_033_SGE_done
.Lswap8_033_SGE_true:
    f1u_emit_char 'B'
.Lswap8_033_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r6, pattern 4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1bd5
    push16 r4
    ldi16 c0, 0x1cf8
    push16 r4
    ldi16 c0, 0x1e1b
    push16 r4
    ldi16 c0, 0x1f3e
    push16 r4
    ldi16 c0, 0x2061
    push16 r4
    ldi16 c0, 0x2184
    push16 r4
    ldi16 c0, 0x12a5
    push16 r4
    ldi16 c0, 0x23ca
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_034_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_034_EQ_done
.Lswap8_034_EQ_true:
    f1u_emit_char 'B'
.Lswap8_034_EQ_done:
    brne8 .Lswap8_034_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_034_NE_done
.Lswap8_034_NE_true:
    f1u_emit_char 'B'
.Lswap8_034_NE_done:
    brult8 .Lswap8_034_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_034_ULT_done
.Lswap8_034_ULT_true:
    f1u_emit_char 'B'
.Lswap8_034_ULT_done:
    bruge8 .Lswap8_034_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_034_UGE_done
.Lswap8_034_UGE_true:
    f1u_emit_char 'B'
.Lswap8_034_UGE_done:
    brslt8 .Lswap8_034_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_034_SLT_done
.Lswap8_034_SLT_true:
    f1u_emit_char 'B'
.Lswap8_034_SLT_done:
    brsge8 .Lswap8_034_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_034_SGE_done
.Lswap8_034_SGE_true:
    f1u_emit_char 'B'
.Lswap8_034_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r6, pattern 5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1c0a
    push16 r4
    ldi16 c0, 0x1d2d
    push16 r4
    ldi16 c0, 0x1e50
    push16 r4
    ldi16 c0, 0x1f73
    push16 r4
    ldi16 c0, 0x2096
    push16 r4
    ldi16 c0, 0x21b9
    push16 r4
    ldi16 c0, 0x80f0
    push16 r4
    ldi16 c0, 0x23ff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_035_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_035_EQ_done
.Lswap8_035_EQ_true:
    f1u_emit_char 'B'
.Lswap8_035_EQ_done:
    brne8 .Lswap8_035_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_035_NE_done
.Lswap8_035_NE_true:
    f1u_emit_char 'B'
.Lswap8_035_NE_done:
    brult8 .Lswap8_035_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_035_ULT_done
.Lswap8_035_ULT_true:
    f1u_emit_char 'B'
.Lswap8_035_ULT_done:
    bruge8 .Lswap8_035_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_035_UGE_done
.Lswap8_035_UGE_true:
    f1u_emit_char 'B'
.Lswap8_035_UGE_done:
    brslt8 .Lswap8_035_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_035_SLT_done
.Lswap8_035_SLT_true:
    f1u_emit_char 'B'
.Lswap8_035_SLT_done:
    brsge8 .Lswap8_035_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_035_SGE_done
.Lswap8_035_SGE_true:
    f1u_emit_char 'B'
.Lswap8_035_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r6, pattern 6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1c3f
    push16 r4
    ldi16 c0, 0x1d62
    push16 r4
    ldi16 c0, 0x1e85
    push16 r4
    ldi16 c0, 0x1fa8
    push16 r4
    ldi16 c0, 0x20cb
    push16 r4
    ldi16 c0, 0x21ee
    push16 r4
    ldi16 c0, 0xff0f
    push16 r4
    ldi16 c0, 0x2434
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_036_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_036_EQ_done
.Lswap8_036_EQ_true:
    f1u_emit_char 'B'
.Lswap8_036_EQ_done:
    brne8 .Lswap8_036_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_036_NE_done
.Lswap8_036_NE_true:
    f1u_emit_char 'B'
.Lswap8_036_NE_done:
    brult8 .Lswap8_036_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_036_ULT_done
.Lswap8_036_ULT_true:
    f1u_emit_char 'B'
.Lswap8_036_ULT_done:
    bruge8 .Lswap8_036_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_036_UGE_done
.Lswap8_036_UGE_true:
    f1u_emit_char 'B'
.Lswap8_036_UGE_done:
    brslt8 .Lswap8_036_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_036_SLT_done
.Lswap8_036_SLT_true:
    f1u_emit_char 'B'
.Lswap8_036_SLT_done:
    brsge8 .Lswap8_036_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_036_SGE_done
.Lswap8_036_SGE_true:
    f1u_emit_char 'B'
.Lswap8_036_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r6, pattern 7.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1c74
    push16 r4
    ldi16 c0, 0x1d97
    push16 r4
    ldi16 c0, 0x1eba
    push16 r4
    ldi16 c0, 0x1fdd
    push16 r4
    ldi16 c0, 0x2100
    push16 r4
    ldi16 c0, 0x2223
    push16 r4
    ldi16 c0, 0xa55a
    push16 r4
    ldi16 c0, 0x2469
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_037_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_037_EQ_done
.Lswap8_037_EQ_true:
    f1u_emit_char 'B'
.Lswap8_037_EQ_done:
    brne8 .Lswap8_037_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_037_NE_done
.Lswap8_037_NE_true:
    f1u_emit_char 'B'
.Lswap8_037_NE_done:
    brult8 .Lswap8_037_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_037_ULT_done
.Lswap8_037_ULT_true:
    f1u_emit_char 'B'
.Lswap8_037_ULT_done:
    bruge8 .Lswap8_037_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_037_UGE_done
.Lswap8_037_UGE_true:
    f1u_emit_char 'B'
.Lswap8_037_UGE_done:
    brslt8 .Lswap8_037_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_037_SLT_done
.Lswap8_037_SLT_true:
    f1u_emit_char 'B'
.Lswap8_037_SLT_done:
    brsge8 .Lswap8_037_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_037_SGE_done
.Lswap8_037_SGE_true:
    f1u_emit_char 'B'
.Lswap8_037_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r7, pattern 0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1ca9
    push16 r4
    ldi16 c0, 0x1dcc
    push16 r4
    ldi16 c0, 0x1eef
    push16 r4
    ldi16 c0, 0x2012
    push16 r4
    ldi16 c0, 0x2135
    push16 r4
    ldi16 c0, 0x2258
    push16 r4
    ldi16 c0, 0x237b
    push16 r4
    ldi16 c0, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_038_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_038_EQ_done
.Lswap8_038_EQ_true:
    f1u_emit_char 'B'
.Lswap8_038_EQ_done:
    brne8 .Lswap8_038_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_038_NE_done
.Lswap8_038_NE_true:
    f1u_emit_char 'B'
.Lswap8_038_NE_done:
    brult8 .Lswap8_038_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_038_ULT_done
.Lswap8_038_ULT_true:
    f1u_emit_char 'B'
.Lswap8_038_ULT_done:
    bruge8 .Lswap8_038_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_038_UGE_done
.Lswap8_038_UGE_true:
    f1u_emit_char 'B'
.Lswap8_038_UGE_done:
    brslt8 .Lswap8_038_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_038_SLT_done
.Lswap8_038_SLT_true:
    f1u_emit_char 'B'
.Lswap8_038_SLT_done:
    brsge8 .Lswap8_038_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_038_SGE_done
.Lswap8_038_SGE_true:
    f1u_emit_char 'B'
.Lswap8_038_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r7, pattern 1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1cde
    push16 r4
    ldi16 c0, 0x1e01
    push16 r4
    ldi16 c0, 0x1f24
    push16 r4
    ldi16 c0, 0x2047
    push16 r4
    ldi16 c0, 0x216a
    push16 r4
    ldi16 c0, 0x228d
    push16 r4
    ldi16 c0, 0x23b0
    push16 r4
    ldi16 c0, 0x0001
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_039_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_039_EQ_done
.Lswap8_039_EQ_true:
    f1u_emit_char 'B'
.Lswap8_039_EQ_done:
    brne8 .Lswap8_039_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_039_NE_done
.Lswap8_039_NE_true:
    f1u_emit_char 'B'
.Lswap8_039_NE_done:
    brult8 .Lswap8_039_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_039_ULT_done
.Lswap8_039_ULT_true:
    f1u_emit_char 'B'
.Lswap8_039_ULT_done:
    bruge8 .Lswap8_039_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_039_UGE_done
.Lswap8_039_UGE_true:
    f1u_emit_char 'B'
.Lswap8_039_UGE_done:
    brslt8 .Lswap8_039_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_039_SLT_done
.Lswap8_039_SLT_true:
    f1u_emit_char 'B'
.Lswap8_039_SLT_done:
    brsge8 .Lswap8_039_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_039_SGE_done
.Lswap8_039_SGE_true:
    f1u_emit_char 'B'
.Lswap8_039_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r7, pattern 2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1d13
    push16 r4
    ldi16 c0, 0x1e36
    push16 r4
    ldi16 c0, 0x1f59
    push16 r4
    ldi16 c0, 0x207c
    push16 r4
    ldi16 c0, 0x219f
    push16 r4
    ldi16 c0, 0x22c2
    push16 r4
    ldi16 c0, 0x23e5
    push16 r4
    ldi16 c0, 0x0010
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_03a_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03a_EQ_done
.Lswap8_03a_EQ_true:
    f1u_emit_char 'B'
.Lswap8_03a_EQ_done:
    brne8 .Lswap8_03a_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03a_NE_done
.Lswap8_03a_NE_true:
    f1u_emit_char 'B'
.Lswap8_03a_NE_done:
    brult8 .Lswap8_03a_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03a_ULT_done
.Lswap8_03a_ULT_true:
    f1u_emit_char 'B'
.Lswap8_03a_ULT_done:
    bruge8 .Lswap8_03a_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03a_UGE_done
.Lswap8_03a_UGE_true:
    f1u_emit_char 'B'
.Lswap8_03a_UGE_done:
    brslt8 .Lswap8_03a_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03a_SLT_done
.Lswap8_03a_SLT_true:
    f1u_emit_char 'B'
.Lswap8_03a_SLT_done:
    brsge8 .Lswap8_03a_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03a_SGE_done
.Lswap8_03a_SGE_true:
    f1u_emit_char 'B'
.Lswap8_03a_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r7, pattern 3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1d48
    push16 r4
    ldi16 c0, 0x1e6b
    push16 r4
    ldi16 c0, 0x1f8e
    push16 r4
    ldi16 c0, 0x20b1
    push16 r4
    ldi16 c0, 0x21d4
    push16 r4
    ldi16 c0, 0x22f7
    push16 r4
    ldi16 c0, 0x241a
    push16 r4
    ldi16 c0, 0x001f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_03b_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03b_EQ_done
.Lswap8_03b_EQ_true:
    f1u_emit_char 'B'
.Lswap8_03b_EQ_done:
    brne8 .Lswap8_03b_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03b_NE_done
.Lswap8_03b_NE_true:
    f1u_emit_char 'B'
.Lswap8_03b_NE_done:
    brult8 .Lswap8_03b_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03b_ULT_done
.Lswap8_03b_ULT_true:
    f1u_emit_char 'B'
.Lswap8_03b_ULT_done:
    bruge8 .Lswap8_03b_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03b_UGE_done
.Lswap8_03b_UGE_true:
    f1u_emit_char 'B'
.Lswap8_03b_UGE_done:
    brslt8 .Lswap8_03b_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03b_SLT_done
.Lswap8_03b_SLT_true:
    f1u_emit_char 'B'
.Lswap8_03b_SLT_done:
    brsge8 .Lswap8_03b_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03b_SGE_done
.Lswap8_03b_SGE_true:
    f1u_emit_char 'B'
.Lswap8_03b_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r7, pattern 4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x1d7d
    push16 r4
    ldi16 c0, 0x1ea0
    push16 r4
    ldi16 c0, 0x1fc3
    push16 r4
    ldi16 c0, 0x20e6
    push16 r4
    ldi16 c0, 0x2209
    push16 r4
    ldi16 c0, 0x232c
    push16 r4
    ldi16 c0, 0x244f
    push16 r4
    ldi16 c0, 0x12a5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_03c_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03c_EQ_done
.Lswap8_03c_EQ_true:
    f1u_emit_char 'B'
.Lswap8_03c_EQ_done:
    brne8 .Lswap8_03c_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03c_NE_done
.Lswap8_03c_NE_true:
    f1u_emit_char 'B'
.Lswap8_03c_NE_done:
    brult8 .Lswap8_03c_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03c_ULT_done
.Lswap8_03c_ULT_true:
    f1u_emit_char 'B'
.Lswap8_03c_ULT_done:
    bruge8 .Lswap8_03c_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03c_UGE_done
.Lswap8_03c_UGE_true:
    f1u_emit_char 'B'
.Lswap8_03c_UGE_done:
    brslt8 .Lswap8_03c_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03c_SLT_done
.Lswap8_03c_SLT_true:
    f1u_emit_char 'B'
.Lswap8_03c_SLT_done:
    brsge8 .Lswap8_03c_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03c_SGE_done
.Lswap8_03c_SGE_true:
    f1u_emit_char 'B'
.Lswap8_03c_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r7, pattern 5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x1db2
    push16 r4
    ldi16 c0, 0x1ed5
    push16 r4
    ldi16 c0, 0x1ff8
    push16 r4
    ldi16 c0, 0x211b
    push16 r4
    ldi16 c0, 0x223e
    push16 r4
    ldi16 c0, 0x2361
    push16 r4
    ldi16 c0, 0x2484
    push16 r4
    ldi16 c0, 0x80f0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_03d_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03d_EQ_done
.Lswap8_03d_EQ_true:
    f1u_emit_char 'B'
.Lswap8_03d_EQ_done:
    brne8 .Lswap8_03d_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03d_NE_done
.Lswap8_03d_NE_true:
    f1u_emit_char 'B'
.Lswap8_03d_NE_done:
    brult8 .Lswap8_03d_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03d_ULT_done
.Lswap8_03d_ULT_true:
    f1u_emit_char 'B'
.Lswap8_03d_ULT_done:
    bruge8 .Lswap8_03d_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03d_UGE_done
.Lswap8_03d_UGE_true:
    f1u_emit_char 'B'
.Lswap8_03d_UGE_done:
    brslt8 .Lswap8_03d_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03d_SLT_done
.Lswap8_03d_SLT_true:
    f1u_emit_char 'B'
.Lswap8_03d_SLT_done:
    brsge8 .Lswap8_03d_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03d_SGE_done
.Lswap8_03d_SGE_true:
    f1u_emit_char 'B'
.Lswap8_03d_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r7, pattern 6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x1de7
    push16 r4
    ldi16 c0, 0x1f0a
    push16 r4
    ldi16 c0, 0x202d
    push16 r4
    ldi16 c0, 0x2150
    push16 r4
    ldi16 c0, 0x2273
    push16 r4
    ldi16 c0, 0x2396
    push16 r4
    ldi16 c0, 0x24b9
    push16 r4
    ldi16 c0, 0xff0f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_03e_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03e_EQ_done
.Lswap8_03e_EQ_true:
    f1u_emit_char 'B'
.Lswap8_03e_EQ_done:
    brne8 .Lswap8_03e_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03e_NE_done
.Lswap8_03e_NE_true:
    f1u_emit_char 'B'
.Lswap8_03e_NE_done:
    brult8 .Lswap8_03e_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03e_ULT_done
.Lswap8_03e_ULT_true:
    f1u_emit_char 'B'
.Lswap8_03e_ULT_done:
    bruge8 .Lswap8_03e_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03e_UGE_done
.Lswap8_03e_UGE_true:
    f1u_emit_char 'B'
.Lswap8_03e_UGE_done:
    brslt8 .Lswap8_03e_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03e_SLT_done
.Lswap8_03e_SLT_true:
    f1u_emit_char 'B'
.Lswap8_03e_SLT_done:
    brsge8 .Lswap8_03e_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03e_SGE_done
.Lswap8_03e_SGE_true:
    f1u_emit_char 'B'
.Lswap8_03e_SGE_done:
    f1u_emit_char '\n'

    ; swap8 r7, pattern 7.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x1e1c
    push16 r4
    ldi16 c0, 0x1f3f
    push16 r4
    ldi16 c0, 0x2062
    push16 r4
    ldi16 c0, 0x2185
    push16 r4
    ldi16 c0, 0x22a8
    push16 r4
    ldi16 c0, 0x23cb
    push16 r4
    ldi16 c0, 0x24ee
    push16 r4
    ldi16 c0, 0xa55a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    swap8 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lswap8_03f_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03f_EQ_done
.Lswap8_03f_EQ_true:
    f1u_emit_char 'B'
.Lswap8_03f_EQ_done:
    brne8 .Lswap8_03f_NE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03f_NE_done
.Lswap8_03f_NE_true:
    f1u_emit_char 'B'
.Lswap8_03f_NE_done:
    brult8 .Lswap8_03f_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03f_ULT_done
.Lswap8_03f_ULT_true:
    f1u_emit_char 'B'
.Lswap8_03f_ULT_done:
    bruge8 .Lswap8_03f_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03f_UGE_done
.Lswap8_03f_UGE_true:
    f1u_emit_char 'B'
.Lswap8_03f_UGE_done:
    brslt8 .Lswap8_03f_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03f_SLT_done
.Lswap8_03f_SLT_true:
    f1u_emit_char 'B'
.Lswap8_03f_SLT_done:
    brsge8 .Lswap8_03f_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lswap8_03f_SGE_done
.Lswap8_03f_SGE_true:
    f1u_emit_char 'B'
.Lswap8_03f_SGE_done:
    f1u_emit_char '\n'

    sys debug_break
