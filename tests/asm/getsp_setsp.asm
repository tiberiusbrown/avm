.include "include/f1_utility_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; getsp r0, pattern 0; expected SP 0x0920; marker r1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0xb000
    push16 r4
    ldi16 c0, 0x4e01
    push16 r4
    ldi16 c0, 0x7d57
    push16 r4
    ldi16 c0, 0x7e7a
    push16 r4
    ldi16 c0, 0x7f9d
    push16 r4
    ldi16 c0, 0x80c0
    push16 r4
    ldi16 c0, 0x81e3
    push16 r4
    ldi16 c0, 0x8306
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -96
    getsp r0
    push16 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x091e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_000_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_000_EQ_done
.Lgetsp_000_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_000_EQ_done:
    brne8 .Lgetsp_000_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_000_NE_done
.Lgetsp_000_NE_true:
    f1u_emit_char 'B'
.Lgetsp_000_NE_done:
    brult8 .Lgetsp_000_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_000_ULT_done
.Lgetsp_000_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_000_ULT_done:
    bruge8 .Lgetsp_000_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_000_UGE_done
.Lgetsp_000_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_000_UGE_done:
    brslt8 .Lgetsp_000_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_000_SLT_done
.Lgetsp_000_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_000_SLT_done:
    brsge8 .Lgetsp_000_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_000_SGE_done
.Lgetsp_000_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_000_SGE_done:
    f1u_emit_char '\n'

    ; getsp r0, pattern 1; expected SP 0x0928; marker r2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0xb02d
    push16 r4
    ldi16 c0, 0x7c69
    push16 r4
    ldi16 c0, 0x4f49
    push16 r4
    ldi16 c0, 0x7eaf
    push16 r4
    ldi16 c0, 0x7fd2
    push16 r4
    ldi16 c0, 0x80f5
    push16 r4
    ldi16 c0, 0x8218
    push16 r4
    ldi16 c0, 0x833b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -88
    getsp r0
    push16 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0926
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_001_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_001_EQ_done
.Lgetsp_001_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_001_EQ_done:
    brne8 .Lgetsp_001_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_001_NE_done
.Lgetsp_001_NE_true:
    f1u_emit_char 'B'
.Lgetsp_001_NE_done:
    brult8 .Lgetsp_001_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_001_ULT_done
.Lgetsp_001_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_001_ULT_done:
    bruge8 .Lgetsp_001_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_001_UGE_done
.Lgetsp_001_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_001_UGE_done:
    brslt8 .Lgetsp_001_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_001_SLT_done
.Lgetsp_001_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_001_SLT_done:
    brsge8 .Lgetsp_001_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_001_SGE_done
.Lgetsp_001_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_001_SGE_done:
    f1u_emit_char '\n'

    ; getsp r1, pattern 0; expected SP 0x0930; marker r4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x7b7b
    push16 r4
    ldi16 c0, 0xb05b
    push16 r4
    ldi16 c0, 0x7dc1
    push16 r4
    ldi16 c0, 0x7ee4
    push16 r4
    ldi16 c0, 0x5192
    push16 r4
    ldi16 c0, 0x812a
    push16 r4
    ldi16 c0, 0x824d
    push16 r4
    ldi16 c0, 0x8370
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -80
    getsp r1
    push16 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x092e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_002_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_002_EQ_done
.Lgetsp_002_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_002_EQ_done:
    brne8 .Lgetsp_002_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_002_NE_done
.Lgetsp_002_NE_true:
    f1u_emit_char 'B'
.Lgetsp_002_NE_done:
    brult8 .Lgetsp_002_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_002_ULT_done
.Lgetsp_002_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_002_ULT_done:
    bruge8 .Lgetsp_002_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_002_UGE_done
.Lgetsp_002_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_002_UGE_done:
    brslt8 .Lgetsp_002_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_002_SLT_done
.Lgetsp_002_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_002_SLT_done:
    brsge8 .Lgetsp_002_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_002_SGE_done
.Lgetsp_002_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_002_SGE_done:
    f1u_emit_char '\n'

    ; getsp r1, pattern 1; expected SP 0x0938; marker r5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x7bb0
    push16 r4
    ldi16 c0, 0xb088
    push16 r4
    ldi16 c0, 0x7df6
    push16 r4
    ldi16 c0, 0x7f19
    push16 r4
    ldi16 c0, 0x803c
    push16 r4
    ldi16 c0, 0x52da
    push16 r4
    ldi16 c0, 0x8282
    push16 r4
    ldi16 c0, 0x83a5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -72
    getsp r1
    push16 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0936
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_003_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_003_EQ_done
.Lgetsp_003_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_003_EQ_done:
    brne8 .Lgetsp_003_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_003_NE_done
.Lgetsp_003_NE_true:
    f1u_emit_char 'B'
.Lgetsp_003_NE_done:
    brult8 .Lgetsp_003_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_003_ULT_done
.Lgetsp_003_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_003_ULT_done:
    bruge8 .Lgetsp_003_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_003_UGE_done
.Lgetsp_003_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_003_UGE_done:
    brslt8 .Lgetsp_003_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_003_SLT_done
.Lgetsp_003_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_003_SLT_done:
    brsge8 .Lgetsp_003_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_003_SGE_done
.Lgetsp_003_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_003_SGE_done:
    f1u_emit_char '\n'

    ; getsp r2, pattern 0; expected SP 0x0940; marker r7.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x7be5
    push16 r4
    ldi16 c0, 0x7d08
    push16 r4
    ldi16 c0, 0xb0b6
    push16 r4
    ldi16 c0, 0x7f4e
    push16 r4
    ldi16 c0, 0x8071
    push16 r4
    ldi16 c0, 0x8194
    push16 r4
    ldi16 c0, 0x82b7
    push16 r4
    ldi16 c0, 0x5523
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -64
    getsp r2
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x093e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_004_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_004_EQ_done
.Lgetsp_004_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_004_EQ_done:
    brne8 .Lgetsp_004_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_004_NE_done
.Lgetsp_004_NE_true:
    f1u_emit_char 'B'
.Lgetsp_004_NE_done:
    brult8 .Lgetsp_004_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_004_ULT_done
.Lgetsp_004_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_004_ULT_done:
    bruge8 .Lgetsp_004_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_004_UGE_done
.Lgetsp_004_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_004_UGE_done:
    brslt8 .Lgetsp_004_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_004_SLT_done
.Lgetsp_004_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_004_SLT_done:
    brsge8 .Lgetsp_004_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_004_SGE_done
.Lgetsp_004_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_004_SGE_done:
    f1u_emit_char '\n'

    ; getsp r2, pattern 1; expected SP 0x0948; marker r0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x4e63
    push16 r4
    ldi16 c0, 0x7d3d
    push16 r4
    ldi16 c0, 0xb0e3
    push16 r4
    ldi16 c0, 0x7f83
    push16 r4
    ldi16 c0, 0x80a6
    push16 r4
    ldi16 c0, 0x81c9
    push16 r4
    ldi16 c0, 0x82ec
    push16 r4
    ldi16 c0, 0x840f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -56
    getsp r2
    push16 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0946
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_005_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_005_EQ_done
.Lgetsp_005_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_005_EQ_done:
    brne8 .Lgetsp_005_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_005_NE_done
.Lgetsp_005_NE_true:
    f1u_emit_char 'B'
.Lgetsp_005_NE_done:
    brult8 .Lgetsp_005_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_005_ULT_done
.Lgetsp_005_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_005_ULT_done:
    bruge8 .Lgetsp_005_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_005_UGE_done
.Lgetsp_005_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_005_UGE_done:
    brslt8 .Lgetsp_005_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_005_SLT_done
.Lgetsp_005_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_005_SLT_done:
    brsge8 .Lgetsp_005_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_005_SGE_done
.Lgetsp_005_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_005_SGE_done:
    f1u_emit_char '\n'

    ; getsp r3, pattern 0; expected SP 0x0950; marker r2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x7c4f
    push16 r4
    ldi16 c0, 0x7d72
    push16 r4
    ldi16 c0, 0x50ac
    push16 r4
    ldi16 c0, 0xb111
    push16 r4
    ldi16 c0, 0x80db
    push16 r4
    ldi16 c0, 0x81fe
    push16 r4
    ldi16 c0, 0x8321
    push16 r4
    ldi16 c0, 0x8444
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -48
    getsp r3
    push16 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x094e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_006_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_006_EQ_done
.Lgetsp_006_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_006_EQ_done:
    brne8 .Lgetsp_006_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_006_NE_done
.Lgetsp_006_NE_true:
    f1u_emit_char 'B'
.Lgetsp_006_NE_done:
    brult8 .Lgetsp_006_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_006_ULT_done
.Lgetsp_006_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_006_ULT_done:
    bruge8 .Lgetsp_006_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_006_UGE_done
.Lgetsp_006_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_006_UGE_done:
    brslt8 .Lgetsp_006_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_006_SLT_done
.Lgetsp_006_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_006_SLT_done:
    brsge8 .Lgetsp_006_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_006_SGE_done
.Lgetsp_006_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_006_SGE_done:
    f1u_emit_char '\n'

    ; getsp r3, pattern 1; expected SP 0x0958; marker r4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x7c84
    push16 r4
    ldi16 c0, 0x7da7
    push16 r4
    ldi16 c0, 0x7eca
    push16 r4
    ldi16 c0, 0xb13e
    push16 r4
    ldi16 c0, 0x52f5
    push16 r4
    ldi16 c0, 0x8233
    push16 r4
    ldi16 c0, 0x8356
    push16 r4
    ldi16 c0, 0x8479
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -40
    getsp r3
    push16 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0956
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_007_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_007_EQ_done
.Lgetsp_007_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_007_EQ_done:
    brne8 .Lgetsp_007_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_007_NE_done
.Lgetsp_007_NE_true:
    f1u_emit_char 'B'
.Lgetsp_007_NE_done:
    brult8 .Lgetsp_007_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_007_ULT_done
.Lgetsp_007_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_007_ULT_done:
    bruge8 .Lgetsp_007_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_007_UGE_done
.Lgetsp_007_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_007_UGE_done:
    brslt8 .Lgetsp_007_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_007_SLT_done
.Lgetsp_007_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_007_SLT_done:
    brsge8 .Lgetsp_007_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_007_SGE_done
.Lgetsp_007_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_007_SGE_done:
    f1u_emit_char '\n'

    ; getsp r4, pattern 0; expected SP 0x0960; marker r5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x7cb9
    push16 r4
    ldi16 c0, 0x7ddc
    push16 r4
    ldi16 c0, 0x7eff
    push16 r4
    ldi16 c0, 0x8022
    push16 r4
    ldi16 c0, 0xb16c
    push16 r4
    ldi16 c0, 0x543d
    push16 r4
    ldi16 c0, 0x838b
    push16 r4
    ldi16 c0, 0x84ae
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -32
    getsp r4
    push16 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x095e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_008_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_008_EQ_done
.Lgetsp_008_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_008_EQ_done:
    brne8 .Lgetsp_008_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_008_NE_done
.Lgetsp_008_NE_true:
    f1u_emit_char 'B'
.Lgetsp_008_NE_done:
    brult8 .Lgetsp_008_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_008_ULT_done
.Lgetsp_008_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_008_ULT_done:
    bruge8 .Lgetsp_008_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_008_UGE_done
.Lgetsp_008_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_008_UGE_done:
    brslt8 .Lgetsp_008_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_008_SLT_done
.Lgetsp_008_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_008_SLT_done:
    brsge8 .Lgetsp_008_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_008_SGE_done
.Lgetsp_008_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_008_SGE_done:
    f1u_emit_char '\n'

    ; getsp r4, pattern 1; expected SP 0x0968; marker r6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x7cee
    push16 r4
    ldi16 c0, 0x7e11
    push16 r4
    ldi16 c0, 0x7f34
    push16 r4
    ldi16 c0, 0x8057
    push16 r4
    ldi16 c0, 0xb199
    push16 r4
    ldi16 c0, 0x829d
    push16 r4
    ldi16 c0, 0x5585
    push16 r4
    ldi16 c0, 0x84e3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -24
    getsp r4
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0966
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_009_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_009_EQ_done
.Lgetsp_009_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_009_EQ_done:
    brne8 .Lgetsp_009_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_009_NE_done
.Lgetsp_009_NE_true:
    f1u_emit_char 'B'
.Lgetsp_009_NE_done:
    brult8 .Lgetsp_009_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_009_ULT_done
.Lgetsp_009_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_009_ULT_done:
    bruge8 .Lgetsp_009_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_009_UGE_done
.Lgetsp_009_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_009_UGE_done:
    brslt8 .Lgetsp_009_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_009_SLT_done
.Lgetsp_009_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_009_SLT_done:
    brsge8 .Lgetsp_009_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_009_SGE_done
.Lgetsp_009_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_009_SGE_done:
    f1u_emit_char '\n'

    ; getsp r5, pattern 0; expected SP 0x0970; marker r0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x4fc6
    push16 r4
    ldi16 c0, 0x7e46
    push16 r4
    ldi16 c0, 0x7f69
    push16 r4
    ldi16 c0, 0x808c
    push16 r4
    ldi16 c0, 0x81af
    push16 r4
    ldi16 c0, 0xb1c7
    push16 r4
    ldi16 c0, 0x83f5
    push16 r4
    ldi16 c0, 0x8518
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -16
    getsp r5
    push16 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x096e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_00a_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00a_EQ_done
.Lgetsp_00a_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_00a_EQ_done:
    brne8 .Lgetsp_00a_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00a_NE_done
.Lgetsp_00a_NE_true:
    f1u_emit_char 'B'
.Lgetsp_00a_NE_done:
    brult8 .Lgetsp_00a_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00a_ULT_done
.Lgetsp_00a_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_00a_ULT_done:
    bruge8 .Lgetsp_00a_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00a_UGE_done
.Lgetsp_00a_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_00a_UGE_done:
    brslt8 .Lgetsp_00a_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00a_SLT_done
.Lgetsp_00a_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_00a_SLT_done:
    brsge8 .Lgetsp_00a_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00a_SGE_done
.Lgetsp_00a_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_00a_SGE_done:
    f1u_emit_char '\n'

    ; getsp r5, pattern 1; expected SP 0x0978; marker r1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x7d58
    push16 r4
    ldi16 c0, 0x510e
    push16 r4
    ldi16 c0, 0x7f9e
    push16 r4
    ldi16 c0, 0x80c1
    push16 r4
    ldi16 c0, 0x81e4
    push16 r4
    ldi16 c0, 0xb1f4
    push16 r4
    ldi16 c0, 0x842a
    push16 r4
    ldi16 c0, 0x854d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp -8
    getsp r5
    push16 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0976
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_00b_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00b_EQ_done
.Lgetsp_00b_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_00b_EQ_done:
    brne8 .Lgetsp_00b_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00b_NE_done
.Lgetsp_00b_NE_true:
    f1u_emit_char 'B'
.Lgetsp_00b_NE_done:
    brult8 .Lgetsp_00b_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00b_ULT_done
.Lgetsp_00b_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_00b_ULT_done:
    bruge8 .Lgetsp_00b_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00b_UGE_done
.Lgetsp_00b_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_00b_UGE_done:
    brslt8 .Lgetsp_00b_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00b_SLT_done
.Lgetsp_00b_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_00b_SLT_done:
    brsge8 .Lgetsp_00b_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00b_SGE_done
.Lgetsp_00b_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_00b_SGE_done:
    f1u_emit_char '\n'

    ; getsp r6, pattern 0; expected SP 0x0980; marker r3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x7d8d
    push16 r4
    ldi16 c0, 0x7eb0
    push16 r4
    ldi16 c0, 0x7fd3
    push16 r4
    ldi16 c0, 0x5357
    push16 r4
    ldi16 c0, 0x8219
    push16 r4
    ldi16 c0, 0x833c
    push16 r4
    ldi16 c0, 0xb222
    push16 r4
    ldi16 c0, 0x8582
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp 0
    getsp r6
    push16 r3
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x097e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_00c_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00c_EQ_done
.Lgetsp_00c_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_00c_EQ_done:
    brne8 .Lgetsp_00c_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00c_NE_done
.Lgetsp_00c_NE_true:
    f1u_emit_char 'B'
.Lgetsp_00c_NE_done:
    brult8 .Lgetsp_00c_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00c_ULT_done
.Lgetsp_00c_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_00c_ULT_done:
    bruge8 .Lgetsp_00c_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00c_UGE_done
.Lgetsp_00c_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_00c_UGE_done:
    brslt8 .Lgetsp_00c_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00c_SLT_done
.Lgetsp_00c_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_00c_SLT_done:
    brsge8 .Lgetsp_00c_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00c_SGE_done
.Lgetsp_00c_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_00c_SGE_done:
    f1u_emit_char '\n'

    ; getsp r6, pattern 1; expected SP 0x0988; marker r4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x7dc2
    push16 r4
    ldi16 c0, 0x7ee5
    push16 r4
    ldi16 c0, 0x8008
    push16 r4
    ldi16 c0, 0x812b
    push16 r4
    ldi16 c0, 0x549f
    push16 r4
    ldi16 c0, 0x8371
    push16 r4
    ldi16 c0, 0xb24f
    push16 r4
    ldi16 c0, 0x85b7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp 8
    getsp r6
    push16 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0986
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_00d_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00d_EQ_done
.Lgetsp_00d_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_00d_EQ_done:
    brne8 .Lgetsp_00d_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00d_NE_done
.Lgetsp_00d_NE_true:
    f1u_emit_char 'B'
.Lgetsp_00d_NE_done:
    brult8 .Lgetsp_00d_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00d_ULT_done
.Lgetsp_00d_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_00d_ULT_done:
    bruge8 .Lgetsp_00d_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00d_UGE_done
.Lgetsp_00d_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_00d_UGE_done:
    brslt8 .Lgetsp_00d_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00d_SLT_done
.Lgetsp_00d_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_00d_SLT_done:
    brsge8 .Lgetsp_00d_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00d_SGE_done
.Lgetsp_00d_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_00d_SGE_done:
    f1u_emit_char '\n'

    ; getsp r7, pattern 0; expected SP 0x0990; marker r6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x7df7
    push16 r4
    ldi16 c0, 0x7f1a
    push16 r4
    ldi16 c0, 0x803d
    push16 r4
    ldi16 c0, 0x8160
    push16 r4
    ldi16 c0, 0x8283
    push16 r4
    ldi16 c0, 0x83a6
    push16 r4
    ldi16 c0, 0x56e8
    push16 r4
    ldi16 c0, 0xb27d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp 16
    getsp r7
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x098e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_00e_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00e_EQ_done
.Lgetsp_00e_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_00e_EQ_done:
    brne8 .Lgetsp_00e_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00e_NE_done
.Lgetsp_00e_NE_true:
    f1u_emit_char 'B'
.Lgetsp_00e_NE_done:
    brult8 .Lgetsp_00e_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00e_ULT_done
.Lgetsp_00e_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_00e_ULT_done:
    bruge8 .Lgetsp_00e_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00e_UGE_done
.Lgetsp_00e_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_00e_UGE_done:
    brslt8 .Lgetsp_00e_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00e_SLT_done
.Lgetsp_00e_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_00e_SLT_done:
    brsge8 .Lgetsp_00e_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00e_SGE_done
.Lgetsp_00e_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_00e_SGE_done:
    f1u_emit_char '\n'

    ; getsp r7, pattern 1; expected SP 0x0998; marker r0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x5129
    push16 r4
    ldi16 c0, 0x7f4f
    push16 r4
    ldi16 c0, 0x8072
    push16 r4
    ldi16 c0, 0x8195
    push16 r4
    ldi16 c0, 0x82b8
    push16 r4
    ldi16 c0, 0x83db
    push16 r4
    ldi16 c0, 0x84fe
    push16 r4
    ldi16 c0, 0xb2aa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    adjsp 24
    getsp r7
    push16 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0996
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lgetsp_00f_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00f_EQ_done
.Lgetsp_00f_EQ_true:
    f1u_emit_char 'B'
.Lgetsp_00f_EQ_done:
    brne8 .Lgetsp_00f_NE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00f_NE_done
.Lgetsp_00f_NE_true:
    f1u_emit_char 'B'
.Lgetsp_00f_NE_done:
    brult8 .Lgetsp_00f_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00f_ULT_done
.Lgetsp_00f_ULT_true:
    f1u_emit_char 'B'
.Lgetsp_00f_ULT_done:
    bruge8 .Lgetsp_00f_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00f_UGE_done
.Lgetsp_00f_UGE_true:
    f1u_emit_char 'B'
.Lgetsp_00f_UGE_done:
    brslt8 .Lgetsp_00f_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00f_SLT_done
.Lgetsp_00f_SLT_true:
    f1u_emit_char 'B'
.Lgetsp_00f_SLT_done:
    brsge8 .Lgetsp_00f_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lgetsp_00f_SGE_done
.Lgetsp_00f_SGE_true:
    f1u_emit_char 'B'
.Lgetsp_00f_SGE_done:
    f1u_emit_char '\n'

    ; setsp r0, pattern 0; expected SP 0x0920; marker r1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x0920
    push16 r4
    ldi16 c0, 0x5271
    push16 r4
    ldi16 c0, 0x80a7
    push16 r4
    ldi16 c0, 0x81ca
    push16 r4
    ldi16 c0, 0x82ed
    push16 r4
    ldi16 c0, 0x8410
    push16 r4
    ldi16 c0, 0x8533
    push16 r4
    ldi16 c0, 0x8656
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r0
    push16 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x091e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_010_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_010_EQ_done
.Lsetsp_010_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_010_EQ_done:
    brne8 .Lsetsp_010_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_010_NE_done
.Lsetsp_010_NE_true:
    f1u_emit_char 'B'
.Lsetsp_010_NE_done:
    brult8 .Lsetsp_010_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_010_ULT_done
.Lsetsp_010_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_010_ULT_done:
    bruge8 .Lsetsp_010_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_010_UGE_done
.Lsetsp_010_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_010_UGE_done:
    brslt8 .Lsetsp_010_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_010_SLT_done
.Lsetsp_010_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_010_SLT_done:
    brsge8 .Lsetsp_010_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_010_SGE_done
.Lsetsp_010_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_010_SGE_done:
    f1u_emit_char '\n'

    ; setsp r0, pattern 1; expected SP 0x0928; marker r2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x0928
    push16 r4
    ldi16 c0, 0x7fb9
    push16 r4
    ldi16 c0, 0x53b9
    push16 r4
    ldi16 c0, 0x81ff
    push16 r4
    ldi16 c0, 0x8322
    push16 r4
    ldi16 c0, 0x8445
    push16 r4
    ldi16 c0, 0x8568
    push16 r4
    ldi16 c0, 0x868b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r0
    push16 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0926
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_011_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_011_EQ_done
.Lsetsp_011_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_011_EQ_done:
    brne8 .Lsetsp_011_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_011_NE_done
.Lsetsp_011_NE_true:
    f1u_emit_char 'B'
.Lsetsp_011_NE_done:
    brult8 .Lsetsp_011_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_011_ULT_done
.Lsetsp_011_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_011_ULT_done:
    bruge8 .Lsetsp_011_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_011_UGE_done
.Lsetsp_011_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_011_UGE_done:
    brslt8 .Lsetsp_011_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_011_SLT_done
.Lsetsp_011_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_011_SLT_done:
    brsge8 .Lsetsp_011_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_011_SGE_done
.Lsetsp_011_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_011_SGE_done:
    f1u_emit_char '\n'

    ; setsp r1, pattern 0; expected SP 0x0930; marker r4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x7ecb
    push16 r4
    ldi16 c0, 0x0930
    push16 r4
    ldi16 c0, 0x8111
    push16 r4
    ldi16 c0, 0x8234
    push16 r4
    ldi16 c0, 0x5602
    push16 r4
    ldi16 c0, 0x847a
    push16 r4
    ldi16 c0, 0x859d
    push16 r4
    ldi16 c0, 0x86c0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r1
    push16 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x092e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_012_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_012_EQ_done
.Lsetsp_012_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_012_EQ_done:
    brne8 .Lsetsp_012_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_012_NE_done
.Lsetsp_012_NE_true:
    f1u_emit_char 'B'
.Lsetsp_012_NE_done:
    brult8 .Lsetsp_012_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_012_ULT_done
.Lsetsp_012_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_012_ULT_done:
    bruge8 .Lsetsp_012_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_012_UGE_done
.Lsetsp_012_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_012_UGE_done:
    brslt8 .Lsetsp_012_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_012_SLT_done
.Lsetsp_012_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_012_SLT_done:
    brsge8 .Lsetsp_012_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_012_SGE_done
.Lsetsp_012_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_012_SGE_done:
    f1u_emit_char '\n'

    ; setsp r1, pattern 1; expected SP 0x0938; marker r5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x7f00
    push16 r4
    ldi16 c0, 0x0938
    push16 r4
    ldi16 c0, 0x8146
    push16 r4
    ldi16 c0, 0x8269
    push16 r4
    ldi16 c0, 0x838c
    push16 r4
    ldi16 c0, 0x574a
    push16 r4
    ldi16 c0, 0x85d2
    push16 r4
    ldi16 c0, 0x86f5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r1
    push16 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0936
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_013_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_013_EQ_done
.Lsetsp_013_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_013_EQ_done:
    brne8 .Lsetsp_013_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_013_NE_done
.Lsetsp_013_NE_true:
    f1u_emit_char 'B'
.Lsetsp_013_NE_done:
    brult8 .Lsetsp_013_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_013_ULT_done
.Lsetsp_013_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_013_ULT_done:
    bruge8 .Lsetsp_013_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_013_UGE_done
.Lsetsp_013_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_013_UGE_done:
    brslt8 .Lsetsp_013_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_013_SLT_done
.Lsetsp_013_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_013_SLT_done:
    brsge8 .Lsetsp_013_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_013_SGE_done
.Lsetsp_013_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_013_SGE_done:
    f1u_emit_char '\n'

    ; setsp r2, pattern 0; expected SP 0x0940; marker r7.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x7f35
    push16 r4
    ldi16 c0, 0x8058
    push16 r4
    ldi16 c0, 0x0940
    push16 r4
    ldi16 c0, 0x829e
    push16 r4
    ldi16 c0, 0x83c1
    push16 r4
    ldi16 c0, 0x84e4
    push16 r4
    ldi16 c0, 0x8607
    push16 r4
    ldi16 c0, 0x5993
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r2
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x093e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_014_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_014_EQ_done
.Lsetsp_014_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_014_EQ_done:
    brne8 .Lsetsp_014_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_014_NE_done
.Lsetsp_014_NE_true:
    f1u_emit_char 'B'
.Lsetsp_014_NE_done:
    brult8 .Lsetsp_014_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_014_ULT_done
.Lsetsp_014_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_014_ULT_done:
    bruge8 .Lsetsp_014_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_014_UGE_done
.Lsetsp_014_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_014_UGE_done:
    brslt8 .Lsetsp_014_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_014_SLT_done
.Lsetsp_014_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_014_SLT_done:
    brsge8 .Lsetsp_014_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_014_SGE_done
.Lsetsp_014_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_014_SGE_done:
    f1u_emit_char '\n'

    ; setsp r2, pattern 1; expected SP 0x0948; marker r0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x52d3
    push16 r4
    ldi16 c0, 0x808d
    push16 r4
    ldi16 c0, 0x0948
    push16 r4
    ldi16 c0, 0x82d3
    push16 r4
    ldi16 c0, 0x83f6
    push16 r4
    ldi16 c0, 0x8519
    push16 r4
    ldi16 c0, 0x863c
    push16 r4
    ldi16 c0, 0x875f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r2
    push16 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0946
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_015_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_015_EQ_done
.Lsetsp_015_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_015_EQ_done:
    brne8 .Lsetsp_015_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_015_NE_done
.Lsetsp_015_NE_true:
    f1u_emit_char 'B'
.Lsetsp_015_NE_done:
    brult8 .Lsetsp_015_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_015_ULT_done
.Lsetsp_015_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_015_ULT_done:
    bruge8 .Lsetsp_015_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_015_UGE_done
.Lsetsp_015_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_015_UGE_done:
    brslt8 .Lsetsp_015_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_015_SLT_done
.Lsetsp_015_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_015_SLT_done:
    brsge8 .Lsetsp_015_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_015_SGE_done
.Lsetsp_015_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_015_SGE_done:
    f1u_emit_char '\n'

    ; setsp r3, pattern 0; expected SP 0x0950; marker r2.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x7f9f
    push16 r4
    ldi16 c0, 0x80c2
    push16 r4
    ldi16 c0, 0x551c
    push16 r4
    ldi16 c0, 0x0950
    push16 r4
    ldi16 c0, 0x842b
    push16 r4
    ldi16 c0, 0x854e
    push16 r4
    ldi16 c0, 0x8671
    push16 r4
    ldi16 c0, 0x8794
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r3
    push16 r2
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x094e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_016_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_016_EQ_done
.Lsetsp_016_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_016_EQ_done:
    brne8 .Lsetsp_016_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_016_NE_done
.Lsetsp_016_NE_true:
    f1u_emit_char 'B'
.Lsetsp_016_NE_done:
    brult8 .Lsetsp_016_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_016_ULT_done
.Lsetsp_016_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_016_ULT_done:
    bruge8 .Lsetsp_016_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_016_UGE_done
.Lsetsp_016_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_016_UGE_done:
    brslt8 .Lsetsp_016_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_016_SLT_done
.Lsetsp_016_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_016_SLT_done:
    brsge8 .Lsetsp_016_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_016_SGE_done
.Lsetsp_016_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_016_SGE_done:
    f1u_emit_char '\n'

    ; setsp r3, pattern 1; expected SP 0x0958; marker r4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x7fd4
    push16 r4
    ldi16 c0, 0x80f7
    push16 r4
    ldi16 c0, 0x821a
    push16 r4
    ldi16 c0, 0x0958
    push16 r4
    ldi16 c0, 0x5765
    push16 r4
    ldi16 c0, 0x8583
    push16 r4
    ldi16 c0, 0x86a6
    push16 r4
    ldi16 c0, 0x87c9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r3
    push16 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0956
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_017_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_017_EQ_done
.Lsetsp_017_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_017_EQ_done:
    brne8 .Lsetsp_017_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_017_NE_done
.Lsetsp_017_NE_true:
    f1u_emit_char 'B'
.Lsetsp_017_NE_done:
    brult8 .Lsetsp_017_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_017_ULT_done
.Lsetsp_017_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_017_ULT_done:
    bruge8 .Lsetsp_017_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_017_UGE_done
.Lsetsp_017_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_017_UGE_done:
    brslt8 .Lsetsp_017_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_017_SLT_done
.Lsetsp_017_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_017_SLT_done:
    brsge8 .Lsetsp_017_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_017_SGE_done
.Lsetsp_017_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_017_SGE_done:
    f1u_emit_char '\n'

    ; setsp r4, pattern 0; expected SP 0x0960; marker r5.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x8009
    push16 r4
    ldi16 c0, 0x812c
    push16 r4
    ldi16 c0, 0x824f
    push16 r4
    ldi16 c0, 0x8372
    push16 r4
    ldi16 c0, 0x0960
    push16 r4
    ldi16 c0, 0x58ad
    push16 r4
    ldi16 c0, 0x86db
    push16 r4
    ldi16 c0, 0x87fe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r4
    push16 r5
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x095e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_018_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_018_EQ_done
.Lsetsp_018_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_018_EQ_done:
    brne8 .Lsetsp_018_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_018_NE_done
.Lsetsp_018_NE_true:
    f1u_emit_char 'B'
.Lsetsp_018_NE_done:
    brult8 .Lsetsp_018_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_018_ULT_done
.Lsetsp_018_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_018_ULT_done:
    bruge8 .Lsetsp_018_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_018_UGE_done
.Lsetsp_018_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_018_UGE_done:
    brslt8 .Lsetsp_018_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_018_SLT_done
.Lsetsp_018_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_018_SLT_done:
    brsge8 .Lsetsp_018_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_018_SGE_done
.Lsetsp_018_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_018_SGE_done:
    f1u_emit_char '\n'

    ; setsp r4, pattern 1; expected SP 0x0968; marker r6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x803e
    push16 r4
    ldi16 c0, 0x8161
    push16 r4
    ldi16 c0, 0x8284
    push16 r4
    ldi16 c0, 0x83a7
    push16 r4
    ldi16 c0, 0x0968
    push16 r4
    ldi16 c0, 0x85ed
    push16 r4
    ldi16 c0, 0x59f5
    push16 r4
    ldi16 c0, 0x8833
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r4
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0966
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_019_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_019_EQ_done
.Lsetsp_019_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_019_EQ_done:
    brne8 .Lsetsp_019_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_019_NE_done
.Lsetsp_019_NE_true:
    f1u_emit_char 'B'
.Lsetsp_019_NE_done:
    brult8 .Lsetsp_019_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_019_ULT_done
.Lsetsp_019_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_019_ULT_done:
    bruge8 .Lsetsp_019_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_019_UGE_done
.Lsetsp_019_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_019_UGE_done:
    brslt8 .Lsetsp_019_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_019_SLT_done
.Lsetsp_019_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_019_SLT_done:
    brsge8 .Lsetsp_019_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_019_SGE_done
.Lsetsp_019_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_019_SGE_done:
    f1u_emit_char '\n'

    ; setsp r5, pattern 0; expected SP 0x0970; marker r0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x5436
    push16 r4
    ldi16 c0, 0x8196
    push16 r4
    ldi16 c0, 0x82b9
    push16 r4
    ldi16 c0, 0x83dc
    push16 r4
    ldi16 c0, 0x84ff
    push16 r4
    ldi16 c0, 0x0970
    push16 r4
    ldi16 c0, 0x8745
    push16 r4
    ldi16 c0, 0x8868
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r5
    push16 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x096e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_01a_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01a_EQ_done
.Lsetsp_01a_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_01a_EQ_done:
    brne8 .Lsetsp_01a_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01a_NE_done
.Lsetsp_01a_NE_true:
    f1u_emit_char 'B'
.Lsetsp_01a_NE_done:
    brult8 .Lsetsp_01a_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01a_ULT_done
.Lsetsp_01a_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_01a_ULT_done:
    bruge8 .Lsetsp_01a_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01a_UGE_done
.Lsetsp_01a_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_01a_UGE_done:
    brslt8 .Lsetsp_01a_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01a_SLT_done
.Lsetsp_01a_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_01a_SLT_done:
    brsge8 .Lsetsp_01a_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01a_SGE_done
.Lsetsp_01a_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_01a_SGE_done:
    f1u_emit_char '\n'

    ; setsp r5, pattern 1; expected SP 0x0978; marker r1.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x1357
    ldi16 c3, 0x1357
    cmp c2, c3
    ldi16 c0, 0x80a8
    push16 r4
    ldi16 c0, 0x557e
    push16 r4
    ldi16 c0, 0x82ee
    push16 r4
    ldi16 c0, 0x8411
    push16 r4
    ldi16 c0, 0x8534
    push16 r4
    ldi16 c0, 0x0978
    push16 r4
    ldi16 c0, 0x877a
    push16 r4
    ldi16 c0, 0x889d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r5
    push16 r1
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0976
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_01b_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01b_EQ_done
.Lsetsp_01b_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_01b_EQ_done:
    brne8 .Lsetsp_01b_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01b_NE_done
.Lsetsp_01b_NE_true:
    f1u_emit_char 'B'
.Lsetsp_01b_NE_done:
    brult8 .Lsetsp_01b_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01b_ULT_done
.Lsetsp_01b_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_01b_ULT_done:
    bruge8 .Lsetsp_01b_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01b_UGE_done
.Lsetsp_01b_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_01b_UGE_done:
    brslt8 .Lsetsp_01b_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01b_SLT_done
.Lsetsp_01b_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_01b_SLT_done:
    brsge8 .Lsetsp_01b_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01b_SGE_done
.Lsetsp_01b_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_01b_SGE_done:
    f1u_emit_char '\n'

    ; setsp r6, pattern 0; expected SP 0x0980; marker r3.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x80dd
    push16 r4
    ldi16 c0, 0x8200
    push16 r4
    ldi16 c0, 0x8323
    push16 r4
    ldi16 c0, 0x57c7
    push16 r4
    ldi16 c0, 0x8569
    push16 r4
    ldi16 c0, 0x868c
    push16 r4
    ldi16 c0, 0x0980
    push16 r4
    ldi16 c0, 0x88d2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r6
    push16 r3
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x097e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_01c_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01c_EQ_done
.Lsetsp_01c_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_01c_EQ_done:
    brne8 .Lsetsp_01c_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01c_NE_done
.Lsetsp_01c_NE_true:
    f1u_emit_char 'B'
.Lsetsp_01c_NE_done:
    brult8 .Lsetsp_01c_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01c_ULT_done
.Lsetsp_01c_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_01c_ULT_done:
    bruge8 .Lsetsp_01c_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01c_UGE_done
.Lsetsp_01c_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_01c_UGE_done:
    brslt8 .Lsetsp_01c_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01c_SLT_done
.Lsetsp_01c_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_01c_SLT_done:
    brsge8 .Lsetsp_01c_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01c_SGE_done
.Lsetsp_01c_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_01c_SGE_done:
    f1u_emit_char '\n'

    ; setsp r6, pattern 1; expected SP 0x0988; marker r4.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x7fff
    ldi16 c3, 0x8000
    cmp c2, c3
    ldi16 c0, 0x8112
    push16 r4
    ldi16 c0, 0x8235
    push16 r4
    ldi16 c0, 0x8358
    push16 r4
    ldi16 c0, 0x847b
    push16 r4
    ldi16 c0, 0x590f
    push16 r4
    ldi16 c0, 0x86c1
    push16 r4
    ldi16 c0, 0x0988
    push16 r4
    ldi16 c0, 0x8907
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r6
    push16 r4
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0986
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_01d_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01d_EQ_done
.Lsetsp_01d_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_01d_EQ_done:
    brne8 .Lsetsp_01d_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01d_NE_done
.Lsetsp_01d_NE_true:
    f1u_emit_char 'B'
.Lsetsp_01d_NE_done:
    brult8 .Lsetsp_01d_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01d_ULT_done
.Lsetsp_01d_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_01d_ULT_done:
    bruge8 .Lsetsp_01d_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01d_UGE_done
.Lsetsp_01d_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_01d_UGE_done:
    brslt8 .Lsetsp_01d_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01d_SLT_done
.Lsetsp_01d_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_01d_SLT_done:
    brsge8 .Lsetsp_01d_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01d_SGE_done
.Lsetsp_01d_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_01d_SGE_done:
    f1u_emit_char '\n'

    ; setsp r7, pattern 0; expected SP 0x0990; marker r6.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x0001
    ldi16 c3, 0x0002
    cmp c2, c3
    ldi16 c0, 0x8147
    push16 r4
    ldi16 c0, 0x826a
    push16 r4
    ldi16 c0, 0x838d
    push16 r4
    ldi16 c0, 0x84b0
    push16 r4
    ldi16 c0, 0x85d3
    push16 r4
    ldi16 c0, 0x86f6
    push16 r4
    ldi16 c0, 0x5b58
    push16 r4
    ldi16 c0, 0x0990
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r7
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x098e
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_01e_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01e_EQ_done
.Lsetsp_01e_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_01e_EQ_done:
    brne8 .Lsetsp_01e_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01e_NE_done
.Lsetsp_01e_NE_true:
    f1u_emit_char 'B'
.Lsetsp_01e_NE_done:
    brult8 .Lsetsp_01e_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01e_ULT_done
.Lsetsp_01e_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_01e_ULT_done:
    bruge8 .Lsetsp_01e_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01e_UGE_done
.Lsetsp_01e_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_01e_UGE_done:
    brslt8 .Lsetsp_01e_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01e_SLT_done
.Lsetsp_01e_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_01e_SLT_done:
    brsge8 .Lsetsp_01e_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01e_SGE_done
.Lsetsp_01e_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_01e_SGE_done:
    f1u_emit_char '\n'

    ; setsp r7, pattern 1; expected SP 0x0998; marker r0.
    ldi16 c0, 0x0980
    setsp r4
    ldi16 c2, 0x8000
    ldi16 c3, 0x7fff
    cmp c2, c3
    ldi16 c0, 0x5599
    push16 r4
    ldi16 c0, 0x829f
    push16 r4
    ldi16 c0, 0x83c2
    push16 r4
    ldi16 c0, 0x84e5
    push16 r4
    ldi16 c0, 0x8608
    push16 r4
    ldi16 c0, 0x872b
    push16 r4
    ldi16 c0, 0x884e
    push16 r4
    ldi16 c0, 0x0998
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    setsp r7
    push16 r0
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 c0, 0x0996
    ld16 c1, [c0]
    mov r0, r5
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
    pop16 r0
    call f1u_print_r0_line
    breq8 .Lsetsp_01f_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01f_EQ_done
.Lsetsp_01f_EQ_true:
    f1u_emit_char 'B'
.Lsetsp_01f_EQ_done:
    brne8 .Lsetsp_01f_NE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01f_NE_done
.Lsetsp_01f_NE_true:
    f1u_emit_char 'B'
.Lsetsp_01f_NE_done:
    brult8 .Lsetsp_01f_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01f_ULT_done
.Lsetsp_01f_ULT_true:
    f1u_emit_char 'B'
.Lsetsp_01f_ULT_done:
    bruge8 .Lsetsp_01f_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01f_UGE_done
.Lsetsp_01f_UGE_true:
    f1u_emit_char 'B'
.Lsetsp_01f_UGE_done:
    brslt8 .Lsetsp_01f_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01f_SLT_done
.Lsetsp_01f_SLT_true:
    f1u_emit_char 'B'
.Lsetsp_01f_SLT_done:
    brsge8 .Lsetsp_01f_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lsetsp_01f_SGE_done
.Lsetsp_01f_SGE_true:
    f1u_emit_char 'B'
.Lsetsp_01f_SGE_done:
    f1u_emit_char '\n'

    sys debug_break
