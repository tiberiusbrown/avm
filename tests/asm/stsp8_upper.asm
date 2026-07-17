.include "include/f1_utility_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; STACK64 entry 0x00: stsp8 [sp+0], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0700
    ldi8 r5, 0x40
    st8 [c0], r5
    ldi16 c0, 0x0701
    ldi8 r5, 0x90
    st8 [c0], r5
    ldi16 c0, 0x0702
    ldi8 r5, 0xd0
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1101
    ldi16 r5, 0x3302
    ldi16 r6, 0x5503
    ldi16 r7, 0x7704
    stsp8 [sp+0], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0700
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0701
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_000_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_000_EQ_done
.Lstsp8_000_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_000_EQ_done:
    brne8 .Lstsp8_000_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_000_NE_done
.Lstsp8_000_NE_true:
    f1u_emit_char 'B'
.Lstsp8_000_NE_done:
    brult8 .Lstsp8_000_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_000_ULT_done
.Lstsp8_000_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_000_ULT_done:
    bruge8 .Lstsp8_000_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_000_UGE_done
.Lstsp8_000_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_000_UGE_done:
    brslt8 .Lstsp8_000_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_000_SLT_done
.Lstsp8_000_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_000_SLT_done:
    brsge8 .Lstsp8_000_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_000_SGE_done
.Lstsp8_000_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_000_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x01: stsp8 [sp+0], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0700
    ldi8 r5, 0x48
    st8 [c0], r5
    ldi16 c0, 0x0701
    ldi8 r5, 0x95
    st8 [c0], r5
    ldi16 c0, 0x0702
    ldi8 r5, 0xd4
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1132
    ldi16 r5, 0x3337
    ldi16 r6, 0x553c
    ldi16 r7, 0x7741
    stsp8 [sp+0], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0700
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0701
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_001_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_001_EQ_done
.Lstsp8_001_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_001_EQ_done:
    brne8 .Lstsp8_001_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_001_NE_done
.Lstsp8_001_NE_true:
    f1u_emit_char 'B'
.Lstsp8_001_NE_done:
    brult8 .Lstsp8_001_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_001_ULT_done
.Lstsp8_001_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_001_ULT_done:
    bruge8 .Lstsp8_001_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_001_UGE_done
.Lstsp8_001_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_001_UGE_done:
    brslt8 .Lstsp8_001_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_001_SLT_done
.Lstsp8_001_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_001_SLT_done:
    brsge8 .Lstsp8_001_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_001_SGE_done
.Lstsp8_001_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_001_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x02: stsp8 [sp+0], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0700
    ldi8 r5, 0x50
    st8 [c0], r5
    ldi16 c0, 0x0701
    ldi8 r5, 0x9a
    st8 [c0], r5
    ldi16 c0, 0x0702
    ldi8 r5, 0xd8
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1163
    ldi16 r5, 0x336c
    ldi16 r6, 0x5575
    ldi16 r7, 0x777e
    stsp8 [sp+0], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0700
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0701
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_002_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_002_EQ_done
.Lstsp8_002_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_002_EQ_done:
    brne8 .Lstsp8_002_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_002_NE_done
.Lstsp8_002_NE_true:
    f1u_emit_char 'B'
.Lstsp8_002_NE_done:
    brult8 .Lstsp8_002_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_002_ULT_done
.Lstsp8_002_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_002_ULT_done:
    bruge8 .Lstsp8_002_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_002_UGE_done
.Lstsp8_002_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_002_UGE_done:
    brslt8 .Lstsp8_002_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_002_SLT_done
.Lstsp8_002_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_002_SLT_done:
    brsge8 .Lstsp8_002_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_002_SGE_done
.Lstsp8_002_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_002_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x03: stsp8 [sp+0], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0700
    ldi8 r5, 0x58
    st8 [c0], r5
    ldi16 c0, 0x0701
    ldi8 r5, 0x9f
    st8 [c0], r5
    ldi16 c0, 0x0702
    ldi8 r5, 0xdc
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1194
    ldi16 r5, 0x33a1
    ldi16 r6, 0x55ae
    ldi16 r7, 0x77bb
    stsp8 [sp+0], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0700
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0701
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_003_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_003_EQ_done
.Lstsp8_003_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_003_EQ_done:
    brne8 .Lstsp8_003_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_003_NE_done
.Lstsp8_003_NE_true:
    f1u_emit_char 'B'
.Lstsp8_003_NE_done:
    brult8 .Lstsp8_003_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_003_ULT_done
.Lstsp8_003_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_003_ULT_done:
    bruge8 .Lstsp8_003_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_003_UGE_done
.Lstsp8_003_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_003_UGE_done:
    brslt8 .Lstsp8_003_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_003_SLT_done
.Lstsp8_003_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_003_SLT_done:
    brsge8 .Lstsp8_003_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_003_SGE_done
.Lstsp8_003_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_003_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x04: stsp8 [sp+1], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0701
    ldi8 r5, 0x5c
    st8 [c0], r5
    ldi16 c0, 0x0702
    ldi8 r5, 0xa5
    st8 [c0], r5
    ldi16 c0, 0x0703
    ldi8 r5, 0xdc
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x11c5
    ldi16 r5, 0x33d6
    ldi16 r6, 0x55e7
    ldi16 r7, 0x77f8
    stsp8 [sp+1], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0701
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0702
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_004_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_004_EQ_done
.Lstsp8_004_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_004_EQ_done:
    brne8 .Lstsp8_004_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_004_NE_done
.Lstsp8_004_NE_true:
    f1u_emit_char 'B'
.Lstsp8_004_NE_done:
    brult8 .Lstsp8_004_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_004_ULT_done
.Lstsp8_004_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_004_ULT_done:
    bruge8 .Lstsp8_004_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_004_UGE_done
.Lstsp8_004_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_004_UGE_done:
    brslt8 .Lstsp8_004_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_004_SLT_done
.Lstsp8_004_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_004_SLT_done:
    brsge8 .Lstsp8_004_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_004_SGE_done
.Lstsp8_004_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_004_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x05: stsp8 [sp+1], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0701
    ldi8 r5, 0x64
    st8 [c0], r5
    ldi16 c0, 0x0702
    ldi8 r5, 0xaa
    st8 [c0], r5
    ldi16 c0, 0x0703
    ldi8 r5, 0xe0
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x11f6
    ldi16 r5, 0x340b
    ldi16 r6, 0x5620
    ldi16 r7, 0x7835
    stsp8 [sp+1], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0701
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0702
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_005_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_005_EQ_done
.Lstsp8_005_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_005_EQ_done:
    brne8 .Lstsp8_005_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_005_NE_done
.Lstsp8_005_NE_true:
    f1u_emit_char 'B'
.Lstsp8_005_NE_done:
    brult8 .Lstsp8_005_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_005_ULT_done
.Lstsp8_005_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_005_ULT_done:
    bruge8 .Lstsp8_005_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_005_UGE_done
.Lstsp8_005_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_005_UGE_done:
    brslt8 .Lstsp8_005_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_005_SLT_done
.Lstsp8_005_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_005_SLT_done:
    brsge8 .Lstsp8_005_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_005_SGE_done
.Lstsp8_005_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_005_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x06: stsp8 [sp+1], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0701
    ldi8 r5, 0x6c
    st8 [c0], r5
    ldi16 c0, 0x0702
    ldi8 r5, 0xaf
    st8 [c0], r5
    ldi16 c0, 0x0703
    ldi8 r5, 0xe4
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1227
    ldi16 r5, 0x3440
    ldi16 r6, 0x5659
    ldi16 r7, 0x7872
    stsp8 [sp+1], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0701
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0702
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_006_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_006_EQ_done
.Lstsp8_006_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_006_EQ_done:
    brne8 .Lstsp8_006_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_006_NE_done
.Lstsp8_006_NE_true:
    f1u_emit_char 'B'
.Lstsp8_006_NE_done:
    brult8 .Lstsp8_006_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_006_ULT_done
.Lstsp8_006_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_006_ULT_done:
    bruge8 .Lstsp8_006_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_006_UGE_done
.Lstsp8_006_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_006_UGE_done:
    brslt8 .Lstsp8_006_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_006_SLT_done
.Lstsp8_006_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_006_SLT_done:
    brsge8 .Lstsp8_006_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_006_SGE_done
.Lstsp8_006_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_006_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x07: stsp8 [sp+1], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0701
    ldi8 r5, 0x74
    st8 [c0], r5
    ldi16 c0, 0x0702
    ldi8 r5, 0xb4
    st8 [c0], r5
    ldi16 c0, 0x0703
    ldi8 r5, 0xe8
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1258
    ldi16 r5, 0x3475
    ldi16 r6, 0x5692
    ldi16 r7, 0x78af
    stsp8 [sp+1], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0701
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0702
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_007_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_007_EQ_done
.Lstsp8_007_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_007_EQ_done:
    brne8 .Lstsp8_007_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_007_NE_done
.Lstsp8_007_NE_true:
    f1u_emit_char 'B'
.Lstsp8_007_NE_done:
    brult8 .Lstsp8_007_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_007_ULT_done
.Lstsp8_007_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_007_ULT_done:
    bruge8 .Lstsp8_007_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_007_UGE_done
.Lstsp8_007_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_007_UGE_done:
    brslt8 .Lstsp8_007_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_007_SLT_done
.Lstsp8_007_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_007_SLT_done:
    brsge8 .Lstsp8_007_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_007_SGE_done
.Lstsp8_007_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_007_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x08: stsp8 [sp+2], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0702
    ldi8 r5, 0x78
    st8 [c0], r5
    ldi16 c0, 0x0703
    ldi8 r5, 0xba
    st8 [c0], r5
    ldi16 c0, 0x0704
    ldi8 r5, 0xe8
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1289
    ldi16 r5, 0x34aa
    ldi16 r6, 0x56cb
    ldi16 r7, 0x78ec
    stsp8 [sp+2], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0702
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0703
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_008_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_008_EQ_done
.Lstsp8_008_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_008_EQ_done:
    brne8 .Lstsp8_008_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_008_NE_done
.Lstsp8_008_NE_true:
    f1u_emit_char 'B'
.Lstsp8_008_NE_done:
    brult8 .Lstsp8_008_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_008_ULT_done
.Lstsp8_008_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_008_ULT_done:
    bruge8 .Lstsp8_008_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_008_UGE_done
.Lstsp8_008_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_008_UGE_done:
    brslt8 .Lstsp8_008_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_008_SLT_done
.Lstsp8_008_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_008_SLT_done:
    brsge8 .Lstsp8_008_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_008_SGE_done
.Lstsp8_008_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_008_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x09: stsp8 [sp+2], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0702
    ldi8 r5, 0x80
    st8 [c0], r5
    ldi16 c0, 0x0703
    ldi8 r5, 0xbf
    st8 [c0], r5
    ldi16 c0, 0x0704
    ldi8 r5, 0xec
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x12ba
    ldi16 r5, 0x34df
    ldi16 r6, 0x5704
    ldi16 r7, 0x7929
    stsp8 [sp+2], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0702
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0703
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_009_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_009_EQ_done
.Lstsp8_009_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_009_EQ_done:
    brne8 .Lstsp8_009_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_009_NE_done
.Lstsp8_009_NE_true:
    f1u_emit_char 'B'
.Lstsp8_009_NE_done:
    brult8 .Lstsp8_009_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_009_ULT_done
.Lstsp8_009_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_009_ULT_done:
    bruge8 .Lstsp8_009_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_009_UGE_done
.Lstsp8_009_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_009_UGE_done:
    brslt8 .Lstsp8_009_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_009_SLT_done
.Lstsp8_009_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_009_SLT_done:
    brsge8 .Lstsp8_009_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_009_SGE_done
.Lstsp8_009_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_009_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x0A: stsp8 [sp+2], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0702
    ldi8 r5, 0x88
    st8 [c0], r5
    ldi16 c0, 0x0703
    ldi8 r5, 0xc4
    st8 [c0], r5
    ldi16 c0, 0x0704
    ldi8 r5, 0xf0
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x12eb
    ldi16 r5, 0x3514
    ldi16 r6, 0x573d
    ldi16 r7, 0x7966
    stsp8 [sp+2], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0702
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0703
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_00a_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00a_EQ_done
.Lstsp8_00a_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_00a_EQ_done:
    brne8 .Lstsp8_00a_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00a_NE_done
.Lstsp8_00a_NE_true:
    f1u_emit_char 'B'
.Lstsp8_00a_NE_done:
    brult8 .Lstsp8_00a_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00a_ULT_done
.Lstsp8_00a_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_00a_ULT_done:
    bruge8 .Lstsp8_00a_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00a_UGE_done
.Lstsp8_00a_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_00a_UGE_done:
    brslt8 .Lstsp8_00a_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00a_SLT_done
.Lstsp8_00a_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_00a_SLT_done:
    brsge8 .Lstsp8_00a_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00a_SGE_done
.Lstsp8_00a_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_00a_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x0B: stsp8 [sp+2], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0702
    ldi8 r5, 0x90
    st8 [c0], r5
    ldi16 c0, 0x0703
    ldi8 r5, 0xc9
    st8 [c0], r5
    ldi16 c0, 0x0704
    ldi8 r5, 0xf4
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x131c
    ldi16 r5, 0x3549
    ldi16 r6, 0x5776
    ldi16 r7, 0x79a3
    stsp8 [sp+2], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0702
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0703
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_00b_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00b_EQ_done
.Lstsp8_00b_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_00b_EQ_done:
    brne8 .Lstsp8_00b_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00b_NE_done
.Lstsp8_00b_NE_true:
    f1u_emit_char 'B'
.Lstsp8_00b_NE_done:
    brult8 .Lstsp8_00b_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00b_ULT_done
.Lstsp8_00b_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_00b_ULT_done:
    bruge8 .Lstsp8_00b_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00b_UGE_done
.Lstsp8_00b_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_00b_UGE_done:
    brslt8 .Lstsp8_00b_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00b_SLT_done
.Lstsp8_00b_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_00b_SLT_done:
    brsge8 .Lstsp8_00b_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00b_SGE_done
.Lstsp8_00b_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_00b_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x0C: stsp8 [sp+3], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0703
    ldi8 r5, 0x94
    st8 [c0], r5
    ldi16 c0, 0x0704
    ldi8 r5, 0xcf
    st8 [c0], r5
    ldi16 c0, 0x0705
    ldi8 r5, 0xf4
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x134d
    ldi16 r5, 0x357e
    ldi16 r6, 0x57af
    ldi16 r7, 0x79e0
    stsp8 [sp+3], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0703
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0704
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_00c_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00c_EQ_done
.Lstsp8_00c_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_00c_EQ_done:
    brne8 .Lstsp8_00c_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00c_NE_done
.Lstsp8_00c_NE_true:
    f1u_emit_char 'B'
.Lstsp8_00c_NE_done:
    brult8 .Lstsp8_00c_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00c_ULT_done
.Lstsp8_00c_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_00c_ULT_done:
    bruge8 .Lstsp8_00c_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00c_UGE_done
.Lstsp8_00c_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_00c_UGE_done:
    brslt8 .Lstsp8_00c_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00c_SLT_done
.Lstsp8_00c_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_00c_SLT_done:
    brsge8 .Lstsp8_00c_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00c_SGE_done
.Lstsp8_00c_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_00c_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x0D: stsp8 [sp+3], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0703
    ldi8 r5, 0x9c
    st8 [c0], r5
    ldi16 c0, 0x0704
    ldi8 r5, 0xd4
    st8 [c0], r5
    ldi16 c0, 0x0705
    ldi8 r5, 0xf8
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x137e
    ldi16 r5, 0x35b3
    ldi16 r6, 0x57e8
    ldi16 r7, 0x7a1d
    stsp8 [sp+3], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0703
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0704
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_00d_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00d_EQ_done
.Lstsp8_00d_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_00d_EQ_done:
    brne8 .Lstsp8_00d_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00d_NE_done
.Lstsp8_00d_NE_true:
    f1u_emit_char 'B'
.Lstsp8_00d_NE_done:
    brult8 .Lstsp8_00d_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00d_ULT_done
.Lstsp8_00d_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_00d_ULT_done:
    bruge8 .Lstsp8_00d_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00d_UGE_done
.Lstsp8_00d_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_00d_UGE_done:
    brslt8 .Lstsp8_00d_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00d_SLT_done
.Lstsp8_00d_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_00d_SLT_done:
    brsge8 .Lstsp8_00d_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00d_SGE_done
.Lstsp8_00d_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_00d_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x0E: stsp8 [sp+3], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0703
    ldi8 r5, 0xa4
    st8 [c0], r5
    ldi16 c0, 0x0704
    ldi8 r5, 0xd9
    st8 [c0], r5
    ldi16 c0, 0x0705
    ldi8 r5, 0xfc
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x13af
    ldi16 r5, 0x35e8
    ldi16 r6, 0x5821
    ldi16 r7, 0x7a5a
    stsp8 [sp+3], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0703
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0704
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_00e_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00e_EQ_done
.Lstsp8_00e_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_00e_EQ_done:
    brne8 .Lstsp8_00e_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00e_NE_done
.Lstsp8_00e_NE_true:
    f1u_emit_char 'B'
.Lstsp8_00e_NE_done:
    brult8 .Lstsp8_00e_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00e_ULT_done
.Lstsp8_00e_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_00e_ULT_done:
    bruge8 .Lstsp8_00e_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00e_UGE_done
.Lstsp8_00e_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_00e_UGE_done:
    brslt8 .Lstsp8_00e_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00e_SLT_done
.Lstsp8_00e_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_00e_SLT_done:
    brsge8 .Lstsp8_00e_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00e_SGE_done
.Lstsp8_00e_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_00e_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x0F: stsp8 [sp+3], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0703
    ldi8 r5, 0xac
    st8 [c0], r5
    ldi16 c0, 0x0704
    ldi8 r5, 0xde
    st8 [c0], r5
    ldi16 c0, 0x0705
    ldi8 r5, 0x00
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x13e0
    ldi16 r5, 0x361d
    ldi16 r6, 0x585a
    ldi16 r7, 0x7a97
    stsp8 [sp+3], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0703
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0704
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_00f_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00f_EQ_done
.Lstsp8_00f_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_00f_EQ_done:
    brne8 .Lstsp8_00f_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00f_NE_done
.Lstsp8_00f_NE_true:
    f1u_emit_char 'B'
.Lstsp8_00f_NE_done:
    brult8 .Lstsp8_00f_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00f_ULT_done
.Lstsp8_00f_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_00f_ULT_done:
    bruge8 .Lstsp8_00f_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00f_UGE_done
.Lstsp8_00f_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_00f_UGE_done:
    brslt8 .Lstsp8_00f_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00f_SLT_done
.Lstsp8_00f_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_00f_SLT_done:
    brsge8 .Lstsp8_00f_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_00f_SGE_done
.Lstsp8_00f_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_00f_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x10: stsp8 [sp+4], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0704
    ldi8 r5, 0xb0
    st8 [c0], r5
    ldi16 c0, 0x0705
    ldi8 r5, 0xe4
    st8 [c0], r5
    ldi16 c0, 0x0706
    ldi8 r5, 0x00
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1411
    ldi16 r5, 0x3652
    ldi16 r6, 0x5893
    ldi16 r7, 0x7ad4
    stsp8 [sp+4], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0704
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0705
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_010_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_010_EQ_done
.Lstsp8_010_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_010_EQ_done:
    brne8 .Lstsp8_010_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_010_NE_done
.Lstsp8_010_NE_true:
    f1u_emit_char 'B'
.Lstsp8_010_NE_done:
    brult8 .Lstsp8_010_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_010_ULT_done
.Lstsp8_010_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_010_ULT_done:
    bruge8 .Lstsp8_010_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_010_UGE_done
.Lstsp8_010_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_010_UGE_done:
    brslt8 .Lstsp8_010_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_010_SLT_done
.Lstsp8_010_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_010_SLT_done:
    brsge8 .Lstsp8_010_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_010_SGE_done
.Lstsp8_010_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_010_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x11: stsp8 [sp+4], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0704
    ldi8 r5, 0xb8
    st8 [c0], r5
    ldi16 c0, 0x0705
    ldi8 r5, 0xe9
    st8 [c0], r5
    ldi16 c0, 0x0706
    ldi8 r5, 0x04
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1442
    ldi16 r5, 0x3687
    ldi16 r6, 0x58cc
    ldi16 r7, 0x7b11
    stsp8 [sp+4], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0704
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0705
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_011_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_011_EQ_done
.Lstsp8_011_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_011_EQ_done:
    brne8 .Lstsp8_011_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_011_NE_done
.Lstsp8_011_NE_true:
    f1u_emit_char 'B'
.Lstsp8_011_NE_done:
    brult8 .Lstsp8_011_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_011_ULT_done
.Lstsp8_011_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_011_ULT_done:
    bruge8 .Lstsp8_011_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_011_UGE_done
.Lstsp8_011_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_011_UGE_done:
    brslt8 .Lstsp8_011_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_011_SLT_done
.Lstsp8_011_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_011_SLT_done:
    brsge8 .Lstsp8_011_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_011_SGE_done
.Lstsp8_011_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_011_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x12: stsp8 [sp+4], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0704
    ldi8 r5, 0xc0
    st8 [c0], r5
    ldi16 c0, 0x0705
    ldi8 r5, 0xee
    st8 [c0], r5
    ldi16 c0, 0x0706
    ldi8 r5, 0x08
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1473
    ldi16 r5, 0x36bc
    ldi16 r6, 0x5905
    ldi16 r7, 0x7b4e
    stsp8 [sp+4], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0704
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0705
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_012_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_012_EQ_done
.Lstsp8_012_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_012_EQ_done:
    brne8 .Lstsp8_012_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_012_NE_done
.Lstsp8_012_NE_true:
    f1u_emit_char 'B'
.Lstsp8_012_NE_done:
    brult8 .Lstsp8_012_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_012_ULT_done
.Lstsp8_012_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_012_ULT_done:
    bruge8 .Lstsp8_012_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_012_UGE_done
.Lstsp8_012_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_012_UGE_done:
    brslt8 .Lstsp8_012_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_012_SLT_done
.Lstsp8_012_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_012_SLT_done:
    brsge8 .Lstsp8_012_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_012_SGE_done
.Lstsp8_012_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_012_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x13: stsp8 [sp+4], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0704
    ldi8 r5, 0xc8
    st8 [c0], r5
    ldi16 c0, 0x0705
    ldi8 r5, 0xf3
    st8 [c0], r5
    ldi16 c0, 0x0706
    ldi8 r5, 0x0c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x14a4
    ldi16 r5, 0x36f1
    ldi16 r6, 0x593e
    ldi16 r7, 0x7b8b
    stsp8 [sp+4], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0704
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0705
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_013_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_013_EQ_done
.Lstsp8_013_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_013_EQ_done:
    brne8 .Lstsp8_013_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_013_NE_done
.Lstsp8_013_NE_true:
    f1u_emit_char 'B'
.Lstsp8_013_NE_done:
    brult8 .Lstsp8_013_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_013_ULT_done
.Lstsp8_013_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_013_ULT_done:
    bruge8 .Lstsp8_013_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_013_UGE_done
.Lstsp8_013_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_013_UGE_done:
    brslt8 .Lstsp8_013_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_013_SLT_done
.Lstsp8_013_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_013_SLT_done:
    brsge8 .Lstsp8_013_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_013_SGE_done
.Lstsp8_013_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_013_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x14: stsp8 [sp+5], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0705
    ldi8 r5, 0xcc
    st8 [c0], r5
    ldi16 c0, 0x0706
    ldi8 r5, 0xf9
    st8 [c0], r5
    ldi16 c0, 0x0707
    ldi8 r5, 0x0c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x14d5
    ldi16 r5, 0x3726
    ldi16 r6, 0x5977
    ldi16 r7, 0x7bc8
    stsp8 [sp+5], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0705
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0706
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_014_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_014_EQ_done
.Lstsp8_014_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_014_EQ_done:
    brne8 .Lstsp8_014_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_014_NE_done
.Lstsp8_014_NE_true:
    f1u_emit_char 'B'
.Lstsp8_014_NE_done:
    brult8 .Lstsp8_014_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_014_ULT_done
.Lstsp8_014_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_014_ULT_done:
    bruge8 .Lstsp8_014_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_014_UGE_done
.Lstsp8_014_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_014_UGE_done:
    brslt8 .Lstsp8_014_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_014_SLT_done
.Lstsp8_014_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_014_SLT_done:
    brsge8 .Lstsp8_014_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_014_SGE_done
.Lstsp8_014_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_014_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x15: stsp8 [sp+5], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0705
    ldi8 r5, 0xd4
    st8 [c0], r5
    ldi16 c0, 0x0706
    ldi8 r5, 0xfe
    st8 [c0], r5
    ldi16 c0, 0x0707
    ldi8 r5, 0x10
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1506
    ldi16 r5, 0x375b
    ldi16 r6, 0x59b0
    ldi16 r7, 0x7c05
    stsp8 [sp+5], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0705
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0706
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_015_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_015_EQ_done
.Lstsp8_015_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_015_EQ_done:
    brne8 .Lstsp8_015_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_015_NE_done
.Lstsp8_015_NE_true:
    f1u_emit_char 'B'
.Lstsp8_015_NE_done:
    brult8 .Lstsp8_015_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_015_ULT_done
.Lstsp8_015_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_015_ULT_done:
    bruge8 .Lstsp8_015_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_015_UGE_done
.Lstsp8_015_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_015_UGE_done:
    brslt8 .Lstsp8_015_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_015_SLT_done
.Lstsp8_015_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_015_SLT_done:
    brsge8 .Lstsp8_015_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_015_SGE_done
.Lstsp8_015_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_015_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x16: stsp8 [sp+5], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0705
    ldi8 r5, 0xdc
    st8 [c0], r5
    ldi16 c0, 0x0706
    ldi8 r5, 0x03
    st8 [c0], r5
    ldi16 c0, 0x0707
    ldi8 r5, 0x14
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1537
    ldi16 r5, 0x3790
    ldi16 r6, 0x59e9
    ldi16 r7, 0x7c42
    stsp8 [sp+5], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0705
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0706
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_016_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_016_EQ_done
.Lstsp8_016_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_016_EQ_done:
    brne8 .Lstsp8_016_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_016_NE_done
.Lstsp8_016_NE_true:
    f1u_emit_char 'B'
.Lstsp8_016_NE_done:
    brult8 .Lstsp8_016_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_016_ULT_done
.Lstsp8_016_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_016_ULT_done:
    bruge8 .Lstsp8_016_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_016_UGE_done
.Lstsp8_016_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_016_UGE_done:
    brslt8 .Lstsp8_016_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_016_SLT_done
.Lstsp8_016_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_016_SLT_done:
    brsge8 .Lstsp8_016_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_016_SGE_done
.Lstsp8_016_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_016_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x17: stsp8 [sp+5], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0705
    ldi8 r5, 0xe4
    st8 [c0], r5
    ldi16 c0, 0x0706
    ldi8 r5, 0x08
    st8 [c0], r5
    ldi16 c0, 0x0707
    ldi8 r5, 0x18
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1568
    ldi16 r5, 0x37c5
    ldi16 r6, 0x5a22
    ldi16 r7, 0x7c7f
    stsp8 [sp+5], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0705
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0706
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_017_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_017_EQ_done
.Lstsp8_017_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_017_EQ_done:
    brne8 .Lstsp8_017_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_017_NE_done
.Lstsp8_017_NE_true:
    f1u_emit_char 'B'
.Lstsp8_017_NE_done:
    brult8 .Lstsp8_017_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_017_ULT_done
.Lstsp8_017_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_017_ULT_done:
    bruge8 .Lstsp8_017_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_017_UGE_done
.Lstsp8_017_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_017_UGE_done:
    brslt8 .Lstsp8_017_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_017_SLT_done
.Lstsp8_017_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_017_SLT_done:
    brsge8 .Lstsp8_017_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_017_SGE_done
.Lstsp8_017_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_017_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x18: stsp8 [sp+6], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0706
    ldi8 r5, 0xe8
    st8 [c0], r5
    ldi16 c0, 0x0707
    ldi8 r5, 0x0e
    st8 [c0], r5
    ldi16 c0, 0x0708
    ldi8 r5, 0x18
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1599
    ldi16 r5, 0x37fa
    ldi16 r6, 0x5a5b
    ldi16 r7, 0x7cbc
    stsp8 [sp+6], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0706
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0707
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_018_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_018_EQ_done
.Lstsp8_018_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_018_EQ_done:
    brne8 .Lstsp8_018_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_018_NE_done
.Lstsp8_018_NE_true:
    f1u_emit_char 'B'
.Lstsp8_018_NE_done:
    brult8 .Lstsp8_018_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_018_ULT_done
.Lstsp8_018_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_018_ULT_done:
    bruge8 .Lstsp8_018_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_018_UGE_done
.Lstsp8_018_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_018_UGE_done:
    brslt8 .Lstsp8_018_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_018_SLT_done
.Lstsp8_018_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_018_SLT_done:
    brsge8 .Lstsp8_018_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_018_SGE_done
.Lstsp8_018_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_018_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x19: stsp8 [sp+6], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0706
    ldi8 r5, 0xf0
    st8 [c0], r5
    ldi16 c0, 0x0707
    ldi8 r5, 0x13
    st8 [c0], r5
    ldi16 c0, 0x0708
    ldi8 r5, 0x1c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x15ca
    ldi16 r5, 0x382f
    ldi16 r6, 0x5a94
    ldi16 r7, 0x7cf9
    stsp8 [sp+6], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0706
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0707
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_019_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_019_EQ_done
.Lstsp8_019_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_019_EQ_done:
    brne8 .Lstsp8_019_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_019_NE_done
.Lstsp8_019_NE_true:
    f1u_emit_char 'B'
.Lstsp8_019_NE_done:
    brult8 .Lstsp8_019_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_019_ULT_done
.Lstsp8_019_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_019_ULT_done:
    bruge8 .Lstsp8_019_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_019_UGE_done
.Lstsp8_019_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_019_UGE_done:
    brslt8 .Lstsp8_019_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_019_SLT_done
.Lstsp8_019_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_019_SLT_done:
    brsge8 .Lstsp8_019_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_019_SGE_done
.Lstsp8_019_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_019_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x1A: stsp8 [sp+6], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0706
    ldi8 r5, 0xf8
    st8 [c0], r5
    ldi16 c0, 0x0707
    ldi8 r5, 0x18
    st8 [c0], r5
    ldi16 c0, 0x0708
    ldi8 r5, 0x20
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x15fb
    ldi16 r5, 0x3864
    ldi16 r6, 0x5acd
    ldi16 r7, 0x7d36
    stsp8 [sp+6], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0706
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0707
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_01a_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01a_EQ_done
.Lstsp8_01a_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_01a_EQ_done:
    brne8 .Lstsp8_01a_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01a_NE_done
.Lstsp8_01a_NE_true:
    f1u_emit_char 'B'
.Lstsp8_01a_NE_done:
    brult8 .Lstsp8_01a_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01a_ULT_done
.Lstsp8_01a_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_01a_ULT_done:
    bruge8 .Lstsp8_01a_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01a_UGE_done
.Lstsp8_01a_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_01a_UGE_done:
    brslt8 .Lstsp8_01a_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01a_SLT_done
.Lstsp8_01a_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_01a_SLT_done:
    brsge8 .Lstsp8_01a_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01a_SGE_done
.Lstsp8_01a_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_01a_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x1B: stsp8 [sp+6], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0706
    ldi8 r5, 0x00
    st8 [c0], r5
    ldi16 c0, 0x0707
    ldi8 r5, 0x1d
    st8 [c0], r5
    ldi16 c0, 0x0708
    ldi8 r5, 0x24
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x162c
    ldi16 r5, 0x3899
    ldi16 r6, 0x5b06
    ldi16 r7, 0x7d73
    stsp8 [sp+6], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0706
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0707
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_01b_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01b_EQ_done
.Lstsp8_01b_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_01b_EQ_done:
    brne8 .Lstsp8_01b_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01b_NE_done
.Lstsp8_01b_NE_true:
    f1u_emit_char 'B'
.Lstsp8_01b_NE_done:
    brult8 .Lstsp8_01b_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01b_ULT_done
.Lstsp8_01b_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_01b_ULT_done:
    bruge8 .Lstsp8_01b_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01b_UGE_done
.Lstsp8_01b_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_01b_UGE_done:
    brslt8 .Lstsp8_01b_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01b_SLT_done
.Lstsp8_01b_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_01b_SLT_done:
    brsge8 .Lstsp8_01b_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01b_SGE_done
.Lstsp8_01b_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_01b_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x1C: stsp8 [sp+7], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0707
    ldi8 r5, 0x04
    st8 [c0], r5
    ldi16 c0, 0x0708
    ldi8 r5, 0x23
    st8 [c0], r5
    ldi16 c0, 0x0709
    ldi8 r5, 0x24
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x165d
    ldi16 r5, 0x38ce
    ldi16 r6, 0x5b3f
    ldi16 r7, 0x7db0
    stsp8 [sp+7], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0707
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0708
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_01c_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01c_EQ_done
.Lstsp8_01c_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_01c_EQ_done:
    brne8 .Lstsp8_01c_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01c_NE_done
.Lstsp8_01c_NE_true:
    f1u_emit_char 'B'
.Lstsp8_01c_NE_done:
    brult8 .Lstsp8_01c_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01c_ULT_done
.Lstsp8_01c_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_01c_ULT_done:
    bruge8 .Lstsp8_01c_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01c_UGE_done
.Lstsp8_01c_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_01c_UGE_done:
    brslt8 .Lstsp8_01c_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01c_SLT_done
.Lstsp8_01c_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_01c_SLT_done:
    brsge8 .Lstsp8_01c_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01c_SGE_done
.Lstsp8_01c_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_01c_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x1D: stsp8 [sp+7], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0707
    ldi8 r5, 0x0c
    st8 [c0], r5
    ldi16 c0, 0x0708
    ldi8 r5, 0x28
    st8 [c0], r5
    ldi16 c0, 0x0709
    ldi8 r5, 0x28
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x168e
    ldi16 r5, 0x3903
    ldi16 r6, 0x5b78
    ldi16 r7, 0x7ded
    stsp8 [sp+7], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0707
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0708
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_01d_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01d_EQ_done
.Lstsp8_01d_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_01d_EQ_done:
    brne8 .Lstsp8_01d_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01d_NE_done
.Lstsp8_01d_NE_true:
    f1u_emit_char 'B'
.Lstsp8_01d_NE_done:
    brult8 .Lstsp8_01d_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01d_ULT_done
.Lstsp8_01d_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_01d_ULT_done:
    bruge8 .Lstsp8_01d_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01d_UGE_done
.Lstsp8_01d_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_01d_UGE_done:
    brslt8 .Lstsp8_01d_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01d_SLT_done
.Lstsp8_01d_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_01d_SLT_done:
    brsge8 .Lstsp8_01d_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01d_SGE_done
.Lstsp8_01d_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_01d_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x1E: stsp8 [sp+7], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0707
    ldi8 r5, 0x14
    st8 [c0], r5
    ldi16 c0, 0x0708
    ldi8 r5, 0x2d
    st8 [c0], r5
    ldi16 c0, 0x0709
    ldi8 r5, 0x2c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x16bf
    ldi16 r5, 0x3938
    ldi16 r6, 0x5bb1
    ldi16 r7, 0x7e2a
    stsp8 [sp+7], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0707
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0708
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_01e_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01e_EQ_done
.Lstsp8_01e_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_01e_EQ_done:
    brne8 .Lstsp8_01e_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01e_NE_done
.Lstsp8_01e_NE_true:
    f1u_emit_char 'B'
.Lstsp8_01e_NE_done:
    brult8 .Lstsp8_01e_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01e_ULT_done
.Lstsp8_01e_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_01e_ULT_done:
    bruge8 .Lstsp8_01e_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01e_UGE_done
.Lstsp8_01e_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_01e_UGE_done:
    brslt8 .Lstsp8_01e_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01e_SLT_done
.Lstsp8_01e_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_01e_SLT_done:
    brsge8 .Lstsp8_01e_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01e_SGE_done
.Lstsp8_01e_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_01e_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x1F: stsp8 [sp+7], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0707
    ldi8 r5, 0x1c
    st8 [c0], r5
    ldi16 c0, 0x0708
    ldi8 r5, 0x32
    st8 [c0], r5
    ldi16 c0, 0x0709
    ldi8 r5, 0x30
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x16f0
    ldi16 r5, 0x396d
    ldi16 r6, 0x5bea
    ldi16 r7, 0x7e67
    stsp8 [sp+7], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0707
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0708
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_01f_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01f_EQ_done
.Lstsp8_01f_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_01f_EQ_done:
    brne8 .Lstsp8_01f_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01f_NE_done
.Lstsp8_01f_NE_true:
    f1u_emit_char 'B'
.Lstsp8_01f_NE_done:
    brult8 .Lstsp8_01f_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01f_ULT_done
.Lstsp8_01f_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_01f_ULT_done:
    bruge8 .Lstsp8_01f_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01f_UGE_done
.Lstsp8_01f_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_01f_UGE_done:
    brslt8 .Lstsp8_01f_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01f_SLT_done
.Lstsp8_01f_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_01f_SLT_done:
    brsge8 .Lstsp8_01f_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_01f_SGE_done
.Lstsp8_01f_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_01f_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x20: stsp8 [sp+8], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0708
    ldi8 r5, 0x20
    st8 [c0], r5
    ldi16 c0, 0x0709
    ldi8 r5, 0x38
    st8 [c0], r5
    ldi16 c0, 0x070a
    ldi8 r5, 0x30
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1721
    ldi16 r5, 0x39a2
    ldi16 r6, 0x5c23
    ldi16 r7, 0x7ea4
    stsp8 [sp+8], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0708
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0709
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_020_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_020_EQ_done
.Lstsp8_020_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_020_EQ_done:
    brne8 .Lstsp8_020_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_020_NE_done
.Lstsp8_020_NE_true:
    f1u_emit_char 'B'
.Lstsp8_020_NE_done:
    brult8 .Lstsp8_020_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_020_ULT_done
.Lstsp8_020_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_020_ULT_done:
    bruge8 .Lstsp8_020_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_020_UGE_done
.Lstsp8_020_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_020_UGE_done:
    brslt8 .Lstsp8_020_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_020_SLT_done
.Lstsp8_020_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_020_SLT_done:
    brsge8 .Lstsp8_020_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_020_SGE_done
.Lstsp8_020_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_020_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x21: stsp8 [sp+8], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0708
    ldi8 r5, 0x28
    st8 [c0], r5
    ldi16 c0, 0x0709
    ldi8 r5, 0x3d
    st8 [c0], r5
    ldi16 c0, 0x070a
    ldi8 r5, 0x34
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1752
    ldi16 r5, 0x39d7
    ldi16 r6, 0x5c5c
    ldi16 r7, 0x7ee1
    stsp8 [sp+8], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0708
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0709
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_021_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_021_EQ_done
.Lstsp8_021_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_021_EQ_done:
    brne8 .Lstsp8_021_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_021_NE_done
.Lstsp8_021_NE_true:
    f1u_emit_char 'B'
.Lstsp8_021_NE_done:
    brult8 .Lstsp8_021_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_021_ULT_done
.Lstsp8_021_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_021_ULT_done:
    bruge8 .Lstsp8_021_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_021_UGE_done
.Lstsp8_021_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_021_UGE_done:
    brslt8 .Lstsp8_021_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_021_SLT_done
.Lstsp8_021_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_021_SLT_done:
    brsge8 .Lstsp8_021_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_021_SGE_done
.Lstsp8_021_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_021_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x22: stsp8 [sp+8], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0708
    ldi8 r5, 0x30
    st8 [c0], r5
    ldi16 c0, 0x0709
    ldi8 r5, 0x42
    st8 [c0], r5
    ldi16 c0, 0x070a
    ldi8 r5, 0x38
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1783
    ldi16 r5, 0x3a0c
    ldi16 r6, 0x5c95
    ldi16 r7, 0x7f1e
    stsp8 [sp+8], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0708
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0709
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_022_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_022_EQ_done
.Lstsp8_022_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_022_EQ_done:
    brne8 .Lstsp8_022_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_022_NE_done
.Lstsp8_022_NE_true:
    f1u_emit_char 'B'
.Lstsp8_022_NE_done:
    brult8 .Lstsp8_022_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_022_ULT_done
.Lstsp8_022_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_022_ULT_done:
    bruge8 .Lstsp8_022_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_022_UGE_done
.Lstsp8_022_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_022_UGE_done:
    brslt8 .Lstsp8_022_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_022_SLT_done
.Lstsp8_022_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_022_SLT_done:
    brsge8 .Lstsp8_022_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_022_SGE_done
.Lstsp8_022_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_022_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x23: stsp8 [sp+8], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0708
    ldi8 r5, 0x38
    st8 [c0], r5
    ldi16 c0, 0x0709
    ldi8 r5, 0x47
    st8 [c0], r5
    ldi16 c0, 0x070a
    ldi8 r5, 0x3c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x17b4
    ldi16 r5, 0x3a41
    ldi16 r6, 0x5cce
    ldi16 r7, 0x7f5b
    stsp8 [sp+8], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0708
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0709
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_023_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_023_EQ_done
.Lstsp8_023_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_023_EQ_done:
    brne8 .Lstsp8_023_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_023_NE_done
.Lstsp8_023_NE_true:
    f1u_emit_char 'B'
.Lstsp8_023_NE_done:
    brult8 .Lstsp8_023_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_023_ULT_done
.Lstsp8_023_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_023_ULT_done:
    bruge8 .Lstsp8_023_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_023_UGE_done
.Lstsp8_023_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_023_UGE_done:
    brslt8 .Lstsp8_023_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_023_SLT_done
.Lstsp8_023_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_023_SLT_done:
    brsge8 .Lstsp8_023_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_023_SGE_done
.Lstsp8_023_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_023_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x24: stsp8 [sp+9], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0709
    ldi8 r5, 0x3c
    st8 [c0], r5
    ldi16 c0, 0x070a
    ldi8 r5, 0x4d
    st8 [c0], r5
    ldi16 c0, 0x070b
    ldi8 r5, 0x3c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x17e5
    ldi16 r5, 0x3a76
    ldi16 r6, 0x5d07
    ldi16 r7, 0x7f98
    stsp8 [sp+9], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0709
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070a
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_024_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_024_EQ_done
.Lstsp8_024_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_024_EQ_done:
    brne8 .Lstsp8_024_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_024_NE_done
.Lstsp8_024_NE_true:
    f1u_emit_char 'B'
.Lstsp8_024_NE_done:
    brult8 .Lstsp8_024_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_024_ULT_done
.Lstsp8_024_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_024_ULT_done:
    bruge8 .Lstsp8_024_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_024_UGE_done
.Lstsp8_024_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_024_UGE_done:
    brslt8 .Lstsp8_024_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_024_SLT_done
.Lstsp8_024_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_024_SLT_done:
    brsge8 .Lstsp8_024_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_024_SGE_done
.Lstsp8_024_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_024_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x25: stsp8 [sp+9], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0709
    ldi8 r5, 0x44
    st8 [c0], r5
    ldi16 c0, 0x070a
    ldi8 r5, 0x52
    st8 [c0], r5
    ldi16 c0, 0x070b
    ldi8 r5, 0x40
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1816
    ldi16 r5, 0x3aab
    ldi16 r6, 0x5d40
    ldi16 r7, 0x7fd5
    stsp8 [sp+9], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0709
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070a
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_025_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_025_EQ_done
.Lstsp8_025_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_025_EQ_done:
    brne8 .Lstsp8_025_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_025_NE_done
.Lstsp8_025_NE_true:
    f1u_emit_char 'B'
.Lstsp8_025_NE_done:
    brult8 .Lstsp8_025_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_025_ULT_done
.Lstsp8_025_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_025_ULT_done:
    bruge8 .Lstsp8_025_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_025_UGE_done
.Lstsp8_025_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_025_UGE_done:
    brslt8 .Lstsp8_025_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_025_SLT_done
.Lstsp8_025_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_025_SLT_done:
    brsge8 .Lstsp8_025_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_025_SGE_done
.Lstsp8_025_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_025_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x26: stsp8 [sp+9], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x0709
    ldi8 r5, 0x4c
    st8 [c0], r5
    ldi16 c0, 0x070a
    ldi8 r5, 0x57
    st8 [c0], r5
    ldi16 c0, 0x070b
    ldi8 r5, 0x44
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1847
    ldi16 r5, 0x3ae0
    ldi16 r6, 0x5d79
    ldi16 r7, 0x8012
    stsp8 [sp+9], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0709
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070a
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_026_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_026_EQ_done
.Lstsp8_026_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_026_EQ_done:
    brne8 .Lstsp8_026_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_026_NE_done
.Lstsp8_026_NE_true:
    f1u_emit_char 'B'
.Lstsp8_026_NE_done:
    brult8 .Lstsp8_026_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_026_ULT_done
.Lstsp8_026_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_026_ULT_done:
    bruge8 .Lstsp8_026_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_026_UGE_done
.Lstsp8_026_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_026_UGE_done:
    brslt8 .Lstsp8_026_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_026_SLT_done
.Lstsp8_026_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_026_SLT_done:
    brsge8 .Lstsp8_026_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_026_SGE_done
.Lstsp8_026_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_026_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x27: stsp8 [sp+9], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x0709
    ldi8 r5, 0x54
    st8 [c0], r5
    ldi16 c0, 0x070a
    ldi8 r5, 0x5c
    st8 [c0], r5
    ldi16 c0, 0x070b
    ldi8 r5, 0x48
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1878
    ldi16 r5, 0x3b15
    ldi16 r6, 0x5db2
    ldi16 r7, 0x804f
    stsp8 [sp+9], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x0709
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070a
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_027_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_027_EQ_done
.Lstsp8_027_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_027_EQ_done:
    brne8 .Lstsp8_027_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_027_NE_done
.Lstsp8_027_NE_true:
    f1u_emit_char 'B'
.Lstsp8_027_NE_done:
    brult8 .Lstsp8_027_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_027_ULT_done
.Lstsp8_027_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_027_ULT_done:
    bruge8 .Lstsp8_027_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_027_UGE_done
.Lstsp8_027_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_027_UGE_done:
    brslt8 .Lstsp8_027_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_027_SLT_done
.Lstsp8_027_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_027_SLT_done:
    brsge8 .Lstsp8_027_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_027_SGE_done
.Lstsp8_027_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_027_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x28: stsp8 [sp+10], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070a
    ldi8 r5, 0x58
    st8 [c0], r5
    ldi16 c0, 0x070b
    ldi8 r5, 0x62
    st8 [c0], r5
    ldi16 c0, 0x070c
    ldi8 r5, 0x48
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x18a9
    ldi16 r5, 0x3b4a
    ldi16 r6, 0x5deb
    ldi16 r7, 0x808c
    stsp8 [sp+10], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070a
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070b
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_028_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_028_EQ_done
.Lstsp8_028_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_028_EQ_done:
    brne8 .Lstsp8_028_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_028_NE_done
.Lstsp8_028_NE_true:
    f1u_emit_char 'B'
.Lstsp8_028_NE_done:
    brult8 .Lstsp8_028_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_028_ULT_done
.Lstsp8_028_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_028_ULT_done:
    bruge8 .Lstsp8_028_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_028_UGE_done
.Lstsp8_028_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_028_UGE_done:
    brslt8 .Lstsp8_028_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_028_SLT_done
.Lstsp8_028_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_028_SLT_done:
    brsge8 .Lstsp8_028_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_028_SGE_done
.Lstsp8_028_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_028_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x29: stsp8 [sp+10], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070a
    ldi8 r5, 0x60
    st8 [c0], r5
    ldi16 c0, 0x070b
    ldi8 r5, 0x67
    st8 [c0], r5
    ldi16 c0, 0x070c
    ldi8 r5, 0x4c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x18da
    ldi16 r5, 0x3b7f
    ldi16 r6, 0x5e24
    ldi16 r7, 0x80c9
    stsp8 [sp+10], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070a
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070b
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_029_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_029_EQ_done
.Lstsp8_029_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_029_EQ_done:
    brne8 .Lstsp8_029_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_029_NE_done
.Lstsp8_029_NE_true:
    f1u_emit_char 'B'
.Lstsp8_029_NE_done:
    brult8 .Lstsp8_029_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_029_ULT_done
.Lstsp8_029_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_029_ULT_done:
    bruge8 .Lstsp8_029_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_029_UGE_done
.Lstsp8_029_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_029_UGE_done:
    brslt8 .Lstsp8_029_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_029_SLT_done
.Lstsp8_029_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_029_SLT_done:
    brsge8 .Lstsp8_029_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_029_SGE_done
.Lstsp8_029_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_029_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x2A: stsp8 [sp+10], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070a
    ldi8 r5, 0x68
    st8 [c0], r5
    ldi16 c0, 0x070b
    ldi8 r5, 0x6c
    st8 [c0], r5
    ldi16 c0, 0x070c
    ldi8 r5, 0x50
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x190b
    ldi16 r5, 0x3bb4
    ldi16 r6, 0x5e5d
    ldi16 r7, 0x8106
    stsp8 [sp+10], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070a
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070b
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_02a_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02a_EQ_done
.Lstsp8_02a_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_02a_EQ_done:
    brne8 .Lstsp8_02a_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02a_NE_done
.Lstsp8_02a_NE_true:
    f1u_emit_char 'B'
.Lstsp8_02a_NE_done:
    brult8 .Lstsp8_02a_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02a_ULT_done
.Lstsp8_02a_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_02a_ULT_done:
    bruge8 .Lstsp8_02a_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02a_UGE_done
.Lstsp8_02a_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_02a_UGE_done:
    brslt8 .Lstsp8_02a_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02a_SLT_done
.Lstsp8_02a_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_02a_SLT_done:
    brsge8 .Lstsp8_02a_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02a_SGE_done
.Lstsp8_02a_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_02a_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x2B: stsp8 [sp+10], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070a
    ldi8 r5, 0x70
    st8 [c0], r5
    ldi16 c0, 0x070b
    ldi8 r5, 0x71
    st8 [c0], r5
    ldi16 c0, 0x070c
    ldi8 r5, 0x54
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x193c
    ldi16 r5, 0x3be9
    ldi16 r6, 0x5e96
    ldi16 r7, 0x8143
    stsp8 [sp+10], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070a
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070b
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_02b_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02b_EQ_done
.Lstsp8_02b_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_02b_EQ_done:
    brne8 .Lstsp8_02b_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02b_NE_done
.Lstsp8_02b_NE_true:
    f1u_emit_char 'B'
.Lstsp8_02b_NE_done:
    brult8 .Lstsp8_02b_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02b_ULT_done
.Lstsp8_02b_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_02b_ULT_done:
    bruge8 .Lstsp8_02b_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02b_UGE_done
.Lstsp8_02b_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_02b_UGE_done:
    brslt8 .Lstsp8_02b_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02b_SLT_done
.Lstsp8_02b_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_02b_SLT_done:
    brsge8 .Lstsp8_02b_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02b_SGE_done
.Lstsp8_02b_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_02b_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x2C: stsp8 [sp+11], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070b
    ldi8 r5, 0x74
    st8 [c0], r5
    ldi16 c0, 0x070c
    ldi8 r5, 0x77
    st8 [c0], r5
    ldi16 c0, 0x070d
    ldi8 r5, 0x54
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x196d
    ldi16 r5, 0x3c1e
    ldi16 r6, 0x5ecf
    ldi16 r7, 0x8180
    stsp8 [sp+11], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070b
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070c
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_02c_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02c_EQ_done
.Lstsp8_02c_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_02c_EQ_done:
    brne8 .Lstsp8_02c_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02c_NE_done
.Lstsp8_02c_NE_true:
    f1u_emit_char 'B'
.Lstsp8_02c_NE_done:
    brult8 .Lstsp8_02c_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02c_ULT_done
.Lstsp8_02c_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_02c_ULT_done:
    bruge8 .Lstsp8_02c_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02c_UGE_done
.Lstsp8_02c_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_02c_UGE_done:
    brslt8 .Lstsp8_02c_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02c_SLT_done
.Lstsp8_02c_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_02c_SLT_done:
    brsge8 .Lstsp8_02c_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02c_SGE_done
.Lstsp8_02c_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_02c_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x2D: stsp8 [sp+11], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070b
    ldi8 r5, 0x7c
    st8 [c0], r5
    ldi16 c0, 0x070c
    ldi8 r5, 0x7c
    st8 [c0], r5
    ldi16 c0, 0x070d
    ldi8 r5, 0x58
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x199e
    ldi16 r5, 0x3c53
    ldi16 r6, 0x5f08
    ldi16 r7, 0x81bd
    stsp8 [sp+11], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070b
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070c
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_02d_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02d_EQ_done
.Lstsp8_02d_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_02d_EQ_done:
    brne8 .Lstsp8_02d_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02d_NE_done
.Lstsp8_02d_NE_true:
    f1u_emit_char 'B'
.Lstsp8_02d_NE_done:
    brult8 .Lstsp8_02d_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02d_ULT_done
.Lstsp8_02d_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_02d_ULT_done:
    bruge8 .Lstsp8_02d_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02d_UGE_done
.Lstsp8_02d_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_02d_UGE_done:
    brslt8 .Lstsp8_02d_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02d_SLT_done
.Lstsp8_02d_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_02d_SLT_done:
    brsge8 .Lstsp8_02d_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02d_SGE_done
.Lstsp8_02d_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_02d_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x2E: stsp8 [sp+11], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070b
    ldi8 r5, 0x84
    st8 [c0], r5
    ldi16 c0, 0x070c
    ldi8 r5, 0x81
    st8 [c0], r5
    ldi16 c0, 0x070d
    ldi8 r5, 0x5c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x19cf
    ldi16 r5, 0x3c88
    ldi16 r6, 0x5f41
    ldi16 r7, 0x81fa
    stsp8 [sp+11], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070b
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070c
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_02e_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02e_EQ_done
.Lstsp8_02e_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_02e_EQ_done:
    brne8 .Lstsp8_02e_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02e_NE_done
.Lstsp8_02e_NE_true:
    f1u_emit_char 'B'
.Lstsp8_02e_NE_done:
    brult8 .Lstsp8_02e_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02e_ULT_done
.Lstsp8_02e_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_02e_ULT_done:
    bruge8 .Lstsp8_02e_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02e_UGE_done
.Lstsp8_02e_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_02e_UGE_done:
    brslt8 .Lstsp8_02e_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02e_SLT_done
.Lstsp8_02e_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_02e_SLT_done:
    brsge8 .Lstsp8_02e_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02e_SGE_done
.Lstsp8_02e_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_02e_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x2F: stsp8 [sp+11], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070b
    ldi8 r5, 0x8c
    st8 [c0], r5
    ldi16 c0, 0x070c
    ldi8 r5, 0x86
    st8 [c0], r5
    ldi16 c0, 0x070d
    ldi8 r5, 0x60
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1a00
    ldi16 r5, 0x3cbd
    ldi16 r6, 0x5f7a
    ldi16 r7, 0x8237
    stsp8 [sp+11], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070b
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070c
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_02f_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02f_EQ_done
.Lstsp8_02f_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_02f_EQ_done:
    brne8 .Lstsp8_02f_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02f_NE_done
.Lstsp8_02f_NE_true:
    f1u_emit_char 'B'
.Lstsp8_02f_NE_done:
    brult8 .Lstsp8_02f_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02f_ULT_done
.Lstsp8_02f_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_02f_ULT_done:
    bruge8 .Lstsp8_02f_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02f_UGE_done
.Lstsp8_02f_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_02f_UGE_done:
    brslt8 .Lstsp8_02f_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02f_SLT_done
.Lstsp8_02f_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_02f_SLT_done:
    brsge8 .Lstsp8_02f_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_02f_SGE_done
.Lstsp8_02f_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_02f_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x30: stsp8 [sp+12], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070c
    ldi8 r5, 0x90
    st8 [c0], r5
    ldi16 c0, 0x070d
    ldi8 r5, 0x8c
    st8 [c0], r5
    ldi16 c0, 0x070e
    ldi8 r5, 0x60
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1a31
    ldi16 r5, 0x3cf2
    ldi16 r6, 0x5fb3
    ldi16 r7, 0x8274
    stsp8 [sp+12], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070c
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070d
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_030_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_030_EQ_done
.Lstsp8_030_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_030_EQ_done:
    brne8 .Lstsp8_030_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_030_NE_done
.Lstsp8_030_NE_true:
    f1u_emit_char 'B'
.Lstsp8_030_NE_done:
    brult8 .Lstsp8_030_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_030_ULT_done
.Lstsp8_030_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_030_ULT_done:
    bruge8 .Lstsp8_030_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_030_UGE_done
.Lstsp8_030_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_030_UGE_done:
    brslt8 .Lstsp8_030_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_030_SLT_done
.Lstsp8_030_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_030_SLT_done:
    brsge8 .Lstsp8_030_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_030_SGE_done
.Lstsp8_030_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_030_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x31: stsp8 [sp+12], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070c
    ldi8 r5, 0x98
    st8 [c0], r5
    ldi16 c0, 0x070d
    ldi8 r5, 0x91
    st8 [c0], r5
    ldi16 c0, 0x070e
    ldi8 r5, 0x64
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1a62
    ldi16 r5, 0x3d27
    ldi16 r6, 0x5fec
    ldi16 r7, 0x82b1
    stsp8 [sp+12], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070c
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070d
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_031_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_031_EQ_done
.Lstsp8_031_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_031_EQ_done:
    brne8 .Lstsp8_031_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_031_NE_done
.Lstsp8_031_NE_true:
    f1u_emit_char 'B'
.Lstsp8_031_NE_done:
    brult8 .Lstsp8_031_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_031_ULT_done
.Lstsp8_031_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_031_ULT_done:
    bruge8 .Lstsp8_031_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_031_UGE_done
.Lstsp8_031_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_031_UGE_done:
    brslt8 .Lstsp8_031_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_031_SLT_done
.Lstsp8_031_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_031_SLT_done:
    brsge8 .Lstsp8_031_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_031_SGE_done
.Lstsp8_031_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_031_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x32: stsp8 [sp+12], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070c
    ldi8 r5, 0xa0
    st8 [c0], r5
    ldi16 c0, 0x070d
    ldi8 r5, 0x96
    st8 [c0], r5
    ldi16 c0, 0x070e
    ldi8 r5, 0x68
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1a93
    ldi16 r5, 0x3d5c
    ldi16 r6, 0x6025
    ldi16 r7, 0x82ee
    stsp8 [sp+12], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070c
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070d
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_032_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_032_EQ_done
.Lstsp8_032_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_032_EQ_done:
    brne8 .Lstsp8_032_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_032_NE_done
.Lstsp8_032_NE_true:
    f1u_emit_char 'B'
.Lstsp8_032_NE_done:
    brult8 .Lstsp8_032_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_032_ULT_done
.Lstsp8_032_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_032_ULT_done:
    bruge8 .Lstsp8_032_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_032_UGE_done
.Lstsp8_032_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_032_UGE_done:
    brslt8 .Lstsp8_032_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_032_SLT_done
.Lstsp8_032_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_032_SLT_done:
    brsge8 .Lstsp8_032_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_032_SGE_done
.Lstsp8_032_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_032_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x33: stsp8 [sp+12], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070c
    ldi8 r5, 0xa8
    st8 [c0], r5
    ldi16 c0, 0x070d
    ldi8 r5, 0x9b
    st8 [c0], r5
    ldi16 c0, 0x070e
    ldi8 r5, 0x6c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1ac4
    ldi16 r5, 0x3d91
    ldi16 r6, 0x605e
    ldi16 r7, 0x832b
    stsp8 [sp+12], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070c
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070d
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_033_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_033_EQ_done
.Lstsp8_033_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_033_EQ_done:
    brne8 .Lstsp8_033_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_033_NE_done
.Lstsp8_033_NE_true:
    f1u_emit_char 'B'
.Lstsp8_033_NE_done:
    brult8 .Lstsp8_033_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_033_ULT_done
.Lstsp8_033_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_033_ULT_done:
    bruge8 .Lstsp8_033_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_033_UGE_done
.Lstsp8_033_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_033_UGE_done:
    brslt8 .Lstsp8_033_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_033_SLT_done
.Lstsp8_033_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_033_SLT_done:
    brsge8 .Lstsp8_033_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_033_SGE_done
.Lstsp8_033_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_033_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x34: stsp8 [sp+13], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070d
    ldi8 r5, 0xac
    st8 [c0], r5
    ldi16 c0, 0x070e
    ldi8 r5, 0xa1
    st8 [c0], r5
    ldi16 c0, 0x070f
    ldi8 r5, 0x6c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1af5
    ldi16 r5, 0x3dc6
    ldi16 r6, 0x6097
    ldi16 r7, 0x8368
    stsp8 [sp+13], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070d
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070e
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_034_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_034_EQ_done
.Lstsp8_034_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_034_EQ_done:
    brne8 .Lstsp8_034_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_034_NE_done
.Lstsp8_034_NE_true:
    f1u_emit_char 'B'
.Lstsp8_034_NE_done:
    brult8 .Lstsp8_034_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_034_ULT_done
.Lstsp8_034_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_034_ULT_done:
    bruge8 .Lstsp8_034_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_034_UGE_done
.Lstsp8_034_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_034_UGE_done:
    brslt8 .Lstsp8_034_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_034_SLT_done
.Lstsp8_034_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_034_SLT_done:
    brsge8 .Lstsp8_034_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_034_SGE_done
.Lstsp8_034_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_034_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x35: stsp8 [sp+13], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070d
    ldi8 r5, 0xb4
    st8 [c0], r5
    ldi16 c0, 0x070e
    ldi8 r5, 0xa6
    st8 [c0], r5
    ldi16 c0, 0x070f
    ldi8 r5, 0x70
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1b26
    ldi16 r5, 0x3dfb
    ldi16 r6, 0x60d0
    ldi16 r7, 0x83a5
    stsp8 [sp+13], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070d
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070e
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_035_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_035_EQ_done
.Lstsp8_035_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_035_EQ_done:
    brne8 .Lstsp8_035_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_035_NE_done
.Lstsp8_035_NE_true:
    f1u_emit_char 'B'
.Lstsp8_035_NE_done:
    brult8 .Lstsp8_035_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_035_ULT_done
.Lstsp8_035_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_035_ULT_done:
    bruge8 .Lstsp8_035_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_035_UGE_done
.Lstsp8_035_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_035_UGE_done:
    brslt8 .Lstsp8_035_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_035_SLT_done
.Lstsp8_035_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_035_SLT_done:
    brsge8 .Lstsp8_035_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_035_SGE_done
.Lstsp8_035_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_035_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x36: stsp8 [sp+13], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070d
    ldi8 r5, 0xbc
    st8 [c0], r5
    ldi16 c0, 0x070e
    ldi8 r5, 0xab
    st8 [c0], r5
    ldi16 c0, 0x070f
    ldi8 r5, 0x74
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1b57
    ldi16 r5, 0x3e30
    ldi16 r6, 0x6109
    ldi16 r7, 0x83e2
    stsp8 [sp+13], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070d
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070e
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_036_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_036_EQ_done
.Lstsp8_036_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_036_EQ_done:
    brne8 .Lstsp8_036_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_036_NE_done
.Lstsp8_036_NE_true:
    f1u_emit_char 'B'
.Lstsp8_036_NE_done:
    brult8 .Lstsp8_036_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_036_ULT_done
.Lstsp8_036_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_036_ULT_done:
    bruge8 .Lstsp8_036_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_036_UGE_done
.Lstsp8_036_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_036_UGE_done:
    brslt8 .Lstsp8_036_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_036_SLT_done
.Lstsp8_036_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_036_SLT_done:
    brsge8 .Lstsp8_036_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_036_SGE_done
.Lstsp8_036_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_036_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x37: stsp8 [sp+13], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070d
    ldi8 r5, 0xc4
    st8 [c0], r5
    ldi16 c0, 0x070e
    ldi8 r5, 0xb0
    st8 [c0], r5
    ldi16 c0, 0x070f
    ldi8 r5, 0x78
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1b88
    ldi16 r5, 0x3e65
    ldi16 r6, 0x6142
    ldi16 r7, 0x841f
    stsp8 [sp+13], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070d
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070e
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_037_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_037_EQ_done
.Lstsp8_037_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_037_EQ_done:
    brne8 .Lstsp8_037_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_037_NE_done
.Lstsp8_037_NE_true:
    f1u_emit_char 'B'
.Lstsp8_037_NE_done:
    brult8 .Lstsp8_037_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_037_ULT_done
.Lstsp8_037_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_037_ULT_done:
    bruge8 .Lstsp8_037_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_037_UGE_done
.Lstsp8_037_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_037_UGE_done:
    brslt8 .Lstsp8_037_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_037_SLT_done
.Lstsp8_037_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_037_SLT_done:
    brsge8 .Lstsp8_037_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_037_SGE_done
.Lstsp8_037_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_037_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x38: stsp8 [sp+14], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070e
    ldi8 r5, 0xc8
    st8 [c0], r5
    ldi16 c0, 0x070f
    ldi8 r5, 0xb6
    st8 [c0], r5
    ldi16 c0, 0x0710
    ldi8 r5, 0x78
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1bb9
    ldi16 r5, 0x3e9a
    ldi16 r6, 0x617b
    ldi16 r7, 0x845c
    stsp8 [sp+14], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070e
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070f
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_038_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_038_EQ_done
.Lstsp8_038_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_038_EQ_done:
    brne8 .Lstsp8_038_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_038_NE_done
.Lstsp8_038_NE_true:
    f1u_emit_char 'B'
.Lstsp8_038_NE_done:
    brult8 .Lstsp8_038_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_038_ULT_done
.Lstsp8_038_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_038_ULT_done:
    bruge8 .Lstsp8_038_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_038_UGE_done
.Lstsp8_038_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_038_UGE_done:
    brslt8 .Lstsp8_038_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_038_SLT_done
.Lstsp8_038_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_038_SLT_done:
    brsge8 .Lstsp8_038_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_038_SGE_done
.Lstsp8_038_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_038_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x39: stsp8 [sp+14], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070e
    ldi8 r5, 0xd0
    st8 [c0], r5
    ldi16 c0, 0x070f
    ldi8 r5, 0xbb
    st8 [c0], r5
    ldi16 c0, 0x0710
    ldi8 r5, 0x7c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1bea
    ldi16 r5, 0x3ecf
    ldi16 r6, 0x61b4
    ldi16 r7, 0x8499
    stsp8 [sp+14], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070e
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070f
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_039_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_039_EQ_done
.Lstsp8_039_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_039_EQ_done:
    brne8 .Lstsp8_039_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_039_NE_done
.Lstsp8_039_NE_true:
    f1u_emit_char 'B'
.Lstsp8_039_NE_done:
    brult8 .Lstsp8_039_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_039_ULT_done
.Lstsp8_039_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_039_ULT_done:
    bruge8 .Lstsp8_039_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_039_UGE_done
.Lstsp8_039_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_039_UGE_done:
    brslt8 .Lstsp8_039_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_039_SLT_done
.Lstsp8_039_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_039_SLT_done:
    brsge8 .Lstsp8_039_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_039_SGE_done
.Lstsp8_039_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_039_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x3A: stsp8 [sp+14], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070e
    ldi8 r5, 0xd8
    st8 [c0], r5
    ldi16 c0, 0x070f
    ldi8 r5, 0xc0
    st8 [c0], r5
    ldi16 c0, 0x0710
    ldi8 r5, 0x80
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1c1b
    ldi16 r5, 0x3f04
    ldi16 r6, 0x61ed
    ldi16 r7, 0x84d6
    stsp8 [sp+14], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070e
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070f
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_03a_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03a_EQ_done
.Lstsp8_03a_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_03a_EQ_done:
    brne8 .Lstsp8_03a_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03a_NE_done
.Lstsp8_03a_NE_true:
    f1u_emit_char 'B'
.Lstsp8_03a_NE_done:
    brult8 .Lstsp8_03a_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03a_ULT_done
.Lstsp8_03a_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_03a_ULT_done:
    bruge8 .Lstsp8_03a_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03a_UGE_done
.Lstsp8_03a_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_03a_UGE_done:
    brslt8 .Lstsp8_03a_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03a_SLT_done
.Lstsp8_03a_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_03a_SLT_done:
    brsge8 .Lstsp8_03a_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03a_SGE_done
.Lstsp8_03a_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_03a_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x3B: stsp8 [sp+14], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070e
    ldi8 r5, 0xe0
    st8 [c0], r5
    ldi16 c0, 0x070f
    ldi8 r5, 0xc5
    st8 [c0], r5
    ldi16 c0, 0x0710
    ldi8 r5, 0x84
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1c4c
    ldi16 r5, 0x3f39
    ldi16 r6, 0x6226
    ldi16 r7, 0x8513
    stsp8 [sp+14], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070e
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x070f
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_03b_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03b_EQ_done
.Lstsp8_03b_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_03b_EQ_done:
    brne8 .Lstsp8_03b_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03b_NE_done
.Lstsp8_03b_NE_true:
    f1u_emit_char 'B'
.Lstsp8_03b_NE_done:
    brult8 .Lstsp8_03b_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03b_ULT_done
.Lstsp8_03b_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_03b_ULT_done:
    bruge8 .Lstsp8_03b_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03b_UGE_done
.Lstsp8_03b_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_03b_UGE_done:
    brslt8 .Lstsp8_03b_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03b_SLT_done
.Lstsp8_03b_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_03b_SLT_done:
    brsge8 .Lstsp8_03b_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03b_SGE_done
.Lstsp8_03b_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_03b_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x3C: stsp8 [sp+15], c0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070f
    ldi8 r5, 0xe4
    st8 [c0], r5
    ldi16 c0, 0x0710
    ldi8 r5, 0xcb
    st8 [c0], r5
    ldi16 c0, 0x0711
    ldi8 r5, 0x84
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1c7d
    ldi16 r5, 0x3f6e
    ldi16 r6, 0x625f
    ldi16 r7, 0x8550
    stsp8 [sp+15], c0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070f
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0710
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_03c_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03c_EQ_done
.Lstsp8_03c_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_03c_EQ_done:
    brne8 .Lstsp8_03c_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03c_NE_done
.Lstsp8_03c_NE_true:
    f1u_emit_char 'B'
.Lstsp8_03c_NE_done:
    brult8 .Lstsp8_03c_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03c_ULT_done
.Lstsp8_03c_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_03c_ULT_done:
    bruge8 .Lstsp8_03c_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03c_UGE_done
.Lstsp8_03c_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_03c_UGE_done:
    brslt8 .Lstsp8_03c_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03c_SLT_done
.Lstsp8_03c_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_03c_SLT_done:
    brsge8 .Lstsp8_03c_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03c_SGE_done
.Lstsp8_03c_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_03c_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x3D: stsp8 [sp+15], r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070f
    ldi8 r5, 0xec
    st8 [c0], r5
    ldi16 c0, 0x0710
    ldi8 r5, 0xd0
    st8 [c0], r5
    ldi16 c0, 0x0711
    ldi8 r5, 0x88
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1cae
    ldi16 r5, 0x3fa3
    ldi16 r6, 0x6298
    ldi16 r7, 0x858d
    stsp8 [sp+15], r5
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070f
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0710
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_03d_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03d_EQ_done
.Lstsp8_03d_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_03d_EQ_done:
    brne8 .Lstsp8_03d_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03d_NE_done
.Lstsp8_03d_NE_true:
    f1u_emit_char 'B'
.Lstsp8_03d_NE_done:
    brult8 .Lstsp8_03d_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03d_ULT_done
.Lstsp8_03d_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_03d_ULT_done:
    bruge8 .Lstsp8_03d_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03d_UGE_done
.Lstsp8_03d_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_03d_UGE_done:
    brslt8 .Lstsp8_03d_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03d_SLT_done
.Lstsp8_03d_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_03d_SLT_done:
    brsge8 .Lstsp8_03d_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03d_SGE_done
.Lstsp8_03d_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_03d_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x3E: stsp8 [sp+15], r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 c0, 0x070f
    ldi8 r5, 0xf4
    st8 [c0], r5
    ldi16 c0, 0x0710
    ldi8 r5, 0xd5
    st8 [c0], r5
    ldi16 c0, 0x0711
    ldi8 r5, 0x8c
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1cdf
    ldi16 r5, 0x3fd8
    ldi16 r6, 0x62d1
    ldi16 r7, 0x85ca
    stsp8 [sp+15], r6
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070f
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0710
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_03e_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03e_EQ_done
.Lstsp8_03e_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_03e_EQ_done:
    brne8 .Lstsp8_03e_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03e_NE_done
.Lstsp8_03e_NE_true:
    f1u_emit_char 'B'
.Lstsp8_03e_NE_done:
    brult8 .Lstsp8_03e_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03e_ULT_done
.Lstsp8_03e_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_03e_ULT_done:
    bruge8 .Lstsp8_03e_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03e_UGE_done
.Lstsp8_03e_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_03e_UGE_done:
    brslt8 .Lstsp8_03e_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03e_SLT_done
.Lstsp8_03e_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_03e_SLT_done:
    brsge8 .Lstsp8_03e_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03e_SGE_done
.Lstsp8_03e_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_03e_SGE_done:
    f1u_emit_char '\n'

    ; STACK64 entry 0x3F: stsp8 [sp+15], r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 c0, 0x070f
    ldi8 r5, 0xfc
    st8 [c0], r5
    ldi16 c0, 0x0710
    ldi8 r5, 0xda
    st8 [c0], r5
    ldi16 c0, 0x0711
    ldi8 r5, 0x90
    st8 [c0], r5
    ldi16 c0, 0x0700
    setsp r4
    ldi16 c0, 0x1d10
    ldi16 r5, 0x400d
    ldi16 r6, 0x630a
    ldi16 r7, 0x8607
    stsp8 [sp+15], r7
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, r7
    getsp r7
    ldi16 c0, 0x070f
    ld16 r5, [c0]
    mov r6, r5
    ldi16 c0, 0x0710
    ld16 r5, [c0]
    push16 r5
    push16 r6
    push16 r7
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
    breq8 .Lstsp8_03f_EQ_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03f_EQ_done
.Lstsp8_03f_EQ_true:
    f1u_emit_char 'B'
.Lstsp8_03f_EQ_done:
    brne8 .Lstsp8_03f_NE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03f_NE_done
.Lstsp8_03f_NE_true:
    f1u_emit_char 'B'
.Lstsp8_03f_NE_done:
    brult8 .Lstsp8_03f_ULT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03f_ULT_done
.Lstsp8_03f_ULT_true:
    f1u_emit_char 'B'
.Lstsp8_03f_ULT_done:
    bruge8 .Lstsp8_03f_UGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03f_UGE_done
.Lstsp8_03f_UGE_true:
    f1u_emit_char 'B'
.Lstsp8_03f_UGE_done:
    brslt8 .Lstsp8_03f_SLT_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03f_SLT_done
.Lstsp8_03f_SLT_true:
    f1u_emit_char 'B'
.Lstsp8_03f_SLT_done:
    brsge8 .Lstsp8_03f_SGE_true
    f1u_emit_char 'A'
    jmp8 .Lstsp8_03f_SGE_done
.Lstsp8_03f_SGE_true:
    f1u_emit_char 'B'
.Lstsp8_03f_SGE_done:
    f1u_emit_char '\n'

    sys debug_break
