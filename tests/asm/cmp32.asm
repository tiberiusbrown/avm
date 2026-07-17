.include "include/cold32_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; CMP32 equality: q0,q0, RRSPEC32=0x00.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x3040
    push16 r4
    ldi16 r4, 0x1020
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
    .byte 0xf0, 0x69, 0x00 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_000_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_000_EQ_done
.Lcmp32_000_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_000_EQ_done:
    brne8 .Lcmp32_000_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_000_NE_done
.Lcmp32_000_NE_true:
    cold32_emit_char 'B'
.Lcmp32_000_NE_done:
    brult8 .Lcmp32_000_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_000_ULT_done
.Lcmp32_000_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_000_ULT_done:
    bruge8 .Lcmp32_000_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_000_UGE_done
.Lcmp32_000_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_000_UGE_done:
    brslt8 .Lcmp32_000_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_000_SLT_done
.Lcmp32_000_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_000_SLT_done:
    brsge8 .Lcmp32_000_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_000_SGE_done
.Lcmp32_000_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_000_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q0,q1, RRSPEC32=0x04.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4151
    push16 r4
    ldi16 r4, 0x1020
    push16 r4
    ldi16 r4, 0x4151
    push16 r4
    ldi16 r4, 0x1020
    push16 r4
    ldi16 r4, 0x15da
    push16 r4
    ldi16 r4, 0x16fd
    push16 r4
    ldi16 r4, 0x1820
    push16 r4
    ldi16 r4, 0x1943
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x04 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_001_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_001_EQ_done
.Lcmp32_001_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_001_EQ_done:
    brne8 .Lcmp32_001_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_001_NE_done
.Lcmp32_001_NE_true:
    cold32_emit_char 'B'
.Lcmp32_001_NE_done:
    brult8 .Lcmp32_001_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_001_ULT_done
.Lcmp32_001_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_001_ULT_done:
    bruge8 .Lcmp32_001_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_001_UGE_done
.Lcmp32_001_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_001_UGE_done:
    brslt8 .Lcmp32_001_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_001_SLT_done
.Lcmp32_001_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_001_SLT_done:
    brsge8 .Lcmp32_001_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_001_SGE_done
.Lcmp32_001_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_001_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q0,q2, RRSPEC32=0x08.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x5262
    push16 r4
    ldi16 r4, 0x1020
    push16 r4
    ldi16 r4, 0x13d1
    push16 r4
    ldi16 r4, 0x14f4
    push16 r4
    ldi16 r4, 0x5262
    push16 r4
    ldi16 r4, 0x1020
    push16 r4
    ldi16 r4, 0x185d
    push16 r4
    ldi16 r4, 0x1980
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_002_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_002_EQ_done
.Lcmp32_002_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_002_EQ_done:
    brne8 .Lcmp32_002_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_002_NE_done
.Lcmp32_002_NE_true:
    cold32_emit_char 'B'
.Lcmp32_002_NE_done:
    brult8 .Lcmp32_002_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_002_ULT_done
.Lcmp32_002_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_002_ULT_done:
    bruge8 .Lcmp32_002_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_002_UGE_done
.Lcmp32_002_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_002_UGE_done:
    brslt8 .Lcmp32_002_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_002_SLT_done
.Lcmp32_002_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_002_SLT_done:
    brsge8 .Lcmp32_002_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_002_SGE_done
.Lcmp32_002_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_002_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q0,q3, RRSPEC32=0x0C.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x6373
    push16 r4
    ldi16 r4, 0x1020
    push16 r4
    ldi16 r4, 0x140e
    push16 r4
    ldi16 r4, 0x1531
    push16 r4
    ldi16 r4, 0x1654
    push16 r4
    ldi16 r4, 0x1777
    push16 r4
    ldi16 r4, 0x6373
    push16 r4
    ldi16 r4, 0x1020
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x0c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_003_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_003_EQ_done
.Lcmp32_003_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_003_EQ_done:
    brne8 .Lcmp32_003_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_003_NE_done
.Lcmp32_003_NE_true:
    cold32_emit_char 'B'
.Lcmp32_003_NE_done:
    brult8 .Lcmp32_003_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_003_ULT_done
.Lcmp32_003_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_003_ULT_done:
    bruge8 .Lcmp32_003_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_003_UGE_done
.Lcmp32_003_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_003_UGE_done:
    brslt8 .Lcmp32_003_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_003_SLT_done
.Lcmp32_003_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_003_SLT_done:
    brsge8 .Lcmp32_003_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_003_SGE_done
.Lcmp32_003_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_003_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q1,q0, RRSPEC32=0x40.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x3040
    push16 r4
    ldi16 r4, 0x2131
    push16 r4
    ldi16 r4, 0x3040
    push16 r4
    ldi16 r4, 0x2131
    push16 r4
    ldi16 r4, 0x1691
    push16 r4
    ldi16 r4, 0x17b4
    push16 r4
    ldi16 r4, 0x18d7
    push16 r4
    ldi16 r4, 0x19fa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x40 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_004_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_004_EQ_done
.Lcmp32_004_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_004_EQ_done:
    brne8 .Lcmp32_004_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_004_NE_done
.Lcmp32_004_NE_true:
    cold32_emit_char 'B'
.Lcmp32_004_NE_done:
    brult8 .Lcmp32_004_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_004_ULT_done
.Lcmp32_004_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_004_ULT_done:
    bruge8 .Lcmp32_004_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_004_UGE_done
.Lcmp32_004_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_004_UGE_done:
    brslt8 .Lcmp32_004_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_004_SLT_done
.Lcmp32_004_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_004_SLT_done:
    brsge8 .Lcmp32_004_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_004_SGE_done
.Lcmp32_004_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_004_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q1,q1, RRSPEC32=0x44.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1242
    push16 r4
    ldi16 r4, 0x1365
    push16 r4
    ldi16 r4, 0x4151
    push16 r4
    ldi16 r4, 0x2131
    push16 r4
    ldi16 r4, 0x16ce
    push16 r4
    ldi16 r4, 0x17f1
    push16 r4
    ldi16 r4, 0x1914
    push16 r4
    ldi16 r4, 0x1a37
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x44 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_005_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_005_EQ_done
.Lcmp32_005_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_005_EQ_done:
    brne8 .Lcmp32_005_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_005_NE_done
.Lcmp32_005_NE_true:
    cold32_emit_char 'B'
.Lcmp32_005_NE_done:
    brult8 .Lcmp32_005_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_005_ULT_done
.Lcmp32_005_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_005_ULT_done:
    bruge8 .Lcmp32_005_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_005_UGE_done
.Lcmp32_005_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_005_UGE_done:
    brslt8 .Lcmp32_005_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_005_SLT_done
.Lcmp32_005_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_005_SLT_done:
    brsge8 .Lcmp32_005_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_005_SGE_done
.Lcmp32_005_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_005_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q1,q2, RRSPEC32=0x48.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x127f
    push16 r4
    ldi16 r4, 0x13a2
    push16 r4
    ldi16 r4, 0x5262
    push16 r4
    ldi16 r4, 0x2131
    push16 r4
    ldi16 r4, 0x5262
    push16 r4
    ldi16 r4, 0x2131
    push16 r4
    ldi16 r4, 0x1951
    push16 r4
    ldi16 r4, 0x1a74
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x48 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_006_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_006_EQ_done
.Lcmp32_006_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_006_EQ_done:
    brne8 .Lcmp32_006_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_006_NE_done
.Lcmp32_006_NE_true:
    cold32_emit_char 'B'
.Lcmp32_006_NE_done:
    brult8 .Lcmp32_006_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_006_ULT_done
.Lcmp32_006_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_006_ULT_done:
    bruge8 .Lcmp32_006_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_006_UGE_done
.Lcmp32_006_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_006_UGE_done:
    brslt8 .Lcmp32_006_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_006_SLT_done
.Lcmp32_006_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_006_SLT_done:
    brsge8 .Lcmp32_006_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_006_SGE_done
.Lcmp32_006_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_006_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q1,q3, RRSPEC32=0x4C.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x12bc
    push16 r4
    ldi16 r4, 0x13df
    push16 r4
    ldi16 r4, 0x6373
    push16 r4
    ldi16 r4, 0x2131
    push16 r4
    ldi16 r4, 0x1748
    push16 r4
    ldi16 r4, 0x186b
    push16 r4
    ldi16 r4, 0x6373
    push16 r4
    ldi16 r4, 0x2131
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x4c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_007_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_007_EQ_done
.Lcmp32_007_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_007_EQ_done:
    brne8 .Lcmp32_007_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_007_NE_done
.Lcmp32_007_NE_true:
    cold32_emit_char 'B'
.Lcmp32_007_NE_done:
    brult8 .Lcmp32_007_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_007_ULT_done
.Lcmp32_007_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_007_ULT_done:
    bruge8 .Lcmp32_007_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_007_UGE_done
.Lcmp32_007_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_007_UGE_done:
    brslt8 .Lcmp32_007_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_007_SLT_done
.Lcmp32_007_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_007_SLT_done:
    brsge8 .Lcmp32_007_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_007_SGE_done
.Lcmp32_007_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_007_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q2,q0, RRSPEC32=0x80.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x3040
    push16 r4
    ldi16 r4, 0x3242
    push16 r4
    ldi16 r4, 0x153f
    push16 r4
    ldi16 r4, 0x1662
    push16 r4
    ldi16 r4, 0x3040
    push16 r4
    ldi16 r4, 0x3242
    push16 r4
    ldi16 r4, 0x19cb
    push16 r4
    ldi16 r4, 0x1aee
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x80 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_008_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_008_EQ_done
.Lcmp32_008_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_008_EQ_done:
    brne8 .Lcmp32_008_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_008_NE_done
.Lcmp32_008_NE_true:
    cold32_emit_char 'B'
.Lcmp32_008_NE_done:
    brult8 .Lcmp32_008_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_008_ULT_done
.Lcmp32_008_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_008_ULT_done:
    bruge8 .Lcmp32_008_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_008_UGE_done
.Lcmp32_008_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_008_UGE_done:
    brslt8 .Lcmp32_008_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_008_SLT_done
.Lcmp32_008_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_008_SLT_done:
    brsge8 .Lcmp32_008_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_008_SGE_done
.Lcmp32_008_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_008_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q2,q1, RRSPEC32=0x84.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1336
    push16 r4
    ldi16 r4, 0x1459
    push16 r4
    ldi16 r4, 0x4151
    push16 r4
    ldi16 r4, 0x3242
    push16 r4
    ldi16 r4, 0x4151
    push16 r4
    ldi16 r4, 0x3242
    push16 r4
    ldi16 r4, 0x1a08
    push16 r4
    ldi16 r4, 0x1b2b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x84 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_009_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_009_EQ_done
.Lcmp32_009_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_009_EQ_done:
    brne8 .Lcmp32_009_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_009_NE_done
.Lcmp32_009_NE_true:
    cold32_emit_char 'B'
.Lcmp32_009_NE_done:
    brult8 .Lcmp32_009_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_009_ULT_done
.Lcmp32_009_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_009_ULT_done:
    bruge8 .Lcmp32_009_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_009_UGE_done
.Lcmp32_009_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_009_UGE_done:
    brslt8 .Lcmp32_009_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_009_SLT_done
.Lcmp32_009_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_009_SLT_done:
    brsge8 .Lcmp32_009_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_009_SGE_done
.Lcmp32_009_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_009_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q2,q2, RRSPEC32=0x88.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1373
    push16 r4
    ldi16 r4, 0x1496
    push16 r4
    ldi16 r4, 0x15b9
    push16 r4
    ldi16 r4, 0x16dc
    push16 r4
    ldi16 r4, 0x5262
    push16 r4
    ldi16 r4, 0x3242
    push16 r4
    ldi16 r4, 0x1a45
    push16 r4
    ldi16 r4, 0x1b68
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x88 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_00a_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00a_EQ_done
.Lcmp32_00a_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_00a_EQ_done:
    brne8 .Lcmp32_00a_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00a_NE_done
.Lcmp32_00a_NE_true:
    cold32_emit_char 'B'
.Lcmp32_00a_NE_done:
    brult8 .Lcmp32_00a_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00a_ULT_done
.Lcmp32_00a_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_00a_ULT_done:
    bruge8 .Lcmp32_00a_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00a_UGE_done
.Lcmp32_00a_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_00a_UGE_done:
    brslt8 .Lcmp32_00a_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00a_SLT_done
.Lcmp32_00a_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_00a_SLT_done:
    brsge8 .Lcmp32_00a_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00a_SGE_done
.Lcmp32_00a_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_00a_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q2,q3, RRSPEC32=0x8C.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x13b0
    push16 r4
    ldi16 r4, 0x14d3
    push16 r4
    ldi16 r4, 0x15f6
    push16 r4
    ldi16 r4, 0x1719
    push16 r4
    ldi16 r4, 0x6373
    push16 r4
    ldi16 r4, 0x3242
    push16 r4
    ldi16 r4, 0x6373
    push16 r4
    ldi16 r4, 0x3242
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x8c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_00b_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00b_EQ_done
.Lcmp32_00b_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_00b_EQ_done:
    brne8 .Lcmp32_00b_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00b_NE_done
.Lcmp32_00b_NE_true:
    cold32_emit_char 'B'
.Lcmp32_00b_NE_done:
    brult8 .Lcmp32_00b_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00b_ULT_done
.Lcmp32_00b_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_00b_ULT_done:
    bruge8 .Lcmp32_00b_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00b_UGE_done
.Lcmp32_00b_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_00b_UGE_done:
    brslt8 .Lcmp32_00b_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00b_SLT_done
.Lcmp32_00b_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_00b_SLT_done:
    brsge8 .Lcmp32_00b_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00b_SGE_done
.Lcmp32_00b_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_00b_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q3,q0, RRSPEC32=0xC0.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x3040
    push16 r4
    ldi16 r4, 0x4353
    push16 r4
    ldi16 r4, 0x1633
    push16 r4
    ldi16 r4, 0x1756
    push16 r4
    ldi16 r4, 0x1879
    push16 r4
    ldi16 r4, 0x199c
    push16 r4
    ldi16 r4, 0x3040
    push16 r4
    ldi16 r4, 0x4353
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_00c_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00c_EQ_done
.Lcmp32_00c_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_00c_EQ_done:
    brne8 .Lcmp32_00c_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00c_NE_done
.Lcmp32_00c_NE_true:
    cold32_emit_char 'B'
.Lcmp32_00c_NE_done:
    brult8 .Lcmp32_00c_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00c_ULT_done
.Lcmp32_00c_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_00c_ULT_done:
    bruge8 .Lcmp32_00c_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00c_UGE_done
.Lcmp32_00c_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_00c_UGE_done:
    brslt8 .Lcmp32_00c_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00c_SLT_done
.Lcmp32_00c_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_00c_SLT_done:
    brsge8 .Lcmp32_00c_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00c_SGE_done
.Lcmp32_00c_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_00c_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q3,q1, RRSPEC32=0xC4.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x142a
    push16 r4
    ldi16 r4, 0x154d
    push16 r4
    ldi16 r4, 0x4151
    push16 r4
    ldi16 r4, 0x4353
    push16 r4
    ldi16 r4, 0x18b6
    push16 r4
    ldi16 r4, 0x19d9
    push16 r4
    ldi16 r4, 0x4151
    push16 r4
    ldi16 r4, 0x4353
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_00d_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00d_EQ_done
.Lcmp32_00d_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_00d_EQ_done:
    brne8 .Lcmp32_00d_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00d_NE_done
.Lcmp32_00d_NE_true:
    cold32_emit_char 'B'
.Lcmp32_00d_NE_done:
    brult8 .Lcmp32_00d_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00d_ULT_done
.Lcmp32_00d_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_00d_ULT_done:
    bruge8 .Lcmp32_00d_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00d_UGE_done
.Lcmp32_00d_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_00d_UGE_done:
    brslt8 .Lcmp32_00d_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00d_SLT_done
.Lcmp32_00d_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_00d_SLT_done:
    brsge8 .Lcmp32_00d_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00d_SGE_done
.Lcmp32_00d_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_00d_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q3,q2, RRSPEC32=0xC8.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1467
    push16 r4
    ldi16 r4, 0x158a
    push16 r4
    ldi16 r4, 0x16ad
    push16 r4
    ldi16 r4, 0x17d0
    push16 r4
    ldi16 r4, 0x5262
    push16 r4
    ldi16 r4, 0x4353
    push16 r4
    ldi16 r4, 0x5262
    push16 r4
    ldi16 r4, 0x4353
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc8 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_00e_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00e_EQ_done
.Lcmp32_00e_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_00e_EQ_done:
    brne8 .Lcmp32_00e_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00e_NE_done
.Lcmp32_00e_NE_true:
    cold32_emit_char 'B'
.Lcmp32_00e_NE_done:
    brult8 .Lcmp32_00e_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00e_ULT_done
.Lcmp32_00e_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_00e_ULT_done:
    bruge8 .Lcmp32_00e_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00e_UGE_done
.Lcmp32_00e_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_00e_UGE_done:
    brslt8 .Lcmp32_00e_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00e_SLT_done
.Lcmp32_00e_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_00e_SLT_done:
    brsge8 .Lcmp32_00e_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00e_SGE_done
.Lcmp32_00e_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_00e_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 equality: q3,q3, RRSPEC32=0xCC.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x14a4
    push16 r4
    ldi16 r4, 0x15c7
    push16 r4
    ldi16 r4, 0x16ea
    push16 r4
    ldi16 r4, 0x180d
    push16 r4
    ldi16 r4, 0x1930
    push16 r4
    ldi16 r4, 0x1a53
    push16 r4
    ldi16 r4, 0x6373
    push16 r4
    ldi16 r4, 0x4353
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xcc ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_00f_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00f_EQ_done
.Lcmp32_00f_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_00f_EQ_done:
    brne8 .Lcmp32_00f_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00f_NE_done
.Lcmp32_00f_NE_true:
    cold32_emit_char 'B'
.Lcmp32_00f_NE_done:
    brult8 .Lcmp32_00f_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00f_ULT_done
.Lcmp32_00f_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_00f_ULT_done:
    bruge8 .Lcmp32_00f_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00f_UGE_done
.Lcmp32_00f_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_00f_UGE_done:
    brslt8 .Lcmp32_00f_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00f_SLT_done
.Lcmp32_00f_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_00f_SLT_done:
    brsge8 .Lcmp32_00f_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_00f_SGE_done
.Lcmp32_00f_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_00f_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q0=0x00000001, q1=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x196d
    push16 r4
    ldi16 r4, 0x1a90
    push16 r4
    ldi16 r4, 0x1bb3
    push16 r4
    ldi16 r4, 0x1cd6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x04 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_010_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_010_EQ_done
.Lcmp32_010_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_010_EQ_done:
    brne8 .Lcmp32_010_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_010_NE_done
.Lcmp32_010_NE_true:
    cold32_emit_char 'B'
.Lcmp32_010_NE_done:
    brult8 .Lcmp32_010_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_010_ULT_done
.Lcmp32_010_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_010_ULT_done:
    bruge8 .Lcmp32_010_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_010_UGE_done
.Lcmp32_010_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_010_UGE_done:
    brslt8 .Lcmp32_010_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_010_SLT_done
.Lcmp32_010_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_010_SLT_done:
    brsge8 .Lcmp32_010_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_010_SGE_done
.Lcmp32_010_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_010_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q0=0x7FFFFFFF, q1=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x19aa
    push16 r4
    ldi16 r4, 0x1acd
    push16 r4
    ldi16 r4, 0x1bf0
    push16 r4
    ldi16 r4, 0x1d13
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x04 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_011_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_011_EQ_done
.Lcmp32_011_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_011_EQ_done:
    brne8 .Lcmp32_011_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_011_NE_done
.Lcmp32_011_NE_true:
    cold32_emit_char 'B'
.Lcmp32_011_NE_done:
    brult8 .Lcmp32_011_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_011_ULT_done
.Lcmp32_011_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_011_ULT_done:
    bruge8 .Lcmp32_011_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_011_UGE_done
.Lcmp32_011_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_011_UGE_done:
    brslt8 .Lcmp32_011_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_011_SLT_done
.Lcmp32_011_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_011_SLT_done:
    brsge8 .Lcmp32_011_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_011_SGE_done
.Lcmp32_011_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_011_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q0=0x80000000, q1=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x19e7
    push16 r4
    ldi16 r4, 0x1b0a
    push16 r4
    ldi16 r4, 0x1c2d
    push16 r4
    ldi16 r4, 0x1d50
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x04 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_012_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_012_EQ_done
.Lcmp32_012_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_012_EQ_done:
    brne8 .Lcmp32_012_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_012_NE_done
.Lcmp32_012_NE_true:
    cold32_emit_char 'B'
.Lcmp32_012_NE_done:
    brult8 .Lcmp32_012_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_012_ULT_done
.Lcmp32_012_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_012_ULT_done:
    bruge8 .Lcmp32_012_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_012_UGE_done
.Lcmp32_012_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_012_UGE_done:
    brslt8 .Lcmp32_012_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_012_SLT_done
.Lcmp32_012_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_012_SLT_done:
    brsge8 .Lcmp32_012_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_012_SGE_done
.Lcmp32_012_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_012_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q0=0x00000001, q2=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x17de
    push16 r4
    ldi16 r4, 0x1901
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x1c6a
    push16 r4
    ldi16 r4, 0x1d8d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_013_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_013_EQ_done
.Lcmp32_013_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_013_EQ_done:
    brne8 .Lcmp32_013_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_013_NE_done
.Lcmp32_013_NE_true:
    cold32_emit_char 'B'
.Lcmp32_013_NE_done:
    brult8 .Lcmp32_013_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_013_ULT_done
.Lcmp32_013_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_013_ULT_done:
    bruge8 .Lcmp32_013_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_013_UGE_done
.Lcmp32_013_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_013_UGE_done:
    brslt8 .Lcmp32_013_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_013_SLT_done
.Lcmp32_013_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_013_SLT_done:
    brsge8 .Lcmp32_013_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_013_SGE_done
.Lcmp32_013_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_013_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q0=0x7FFFFFFF, q2=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x181b
    push16 r4
    ldi16 r4, 0x193e
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x1ca7
    push16 r4
    ldi16 r4, 0x1dca
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_014_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_014_EQ_done
.Lcmp32_014_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_014_EQ_done:
    brne8 .Lcmp32_014_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_014_NE_done
.Lcmp32_014_NE_true:
    cold32_emit_char 'B'
.Lcmp32_014_NE_done:
    brult8 .Lcmp32_014_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_014_ULT_done
.Lcmp32_014_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_014_ULT_done:
    bruge8 .Lcmp32_014_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_014_UGE_done
.Lcmp32_014_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_014_UGE_done:
    brslt8 .Lcmp32_014_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_014_SLT_done
.Lcmp32_014_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_014_SLT_done:
    brsge8 .Lcmp32_014_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_014_SGE_done
.Lcmp32_014_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_014_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q0=0x80000000, q2=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x1858
    push16 r4
    ldi16 r4, 0x197b
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x1ce4
    push16 r4
    ldi16 r4, 0x1e07
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x08 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_015_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_015_EQ_done
.Lcmp32_015_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_015_EQ_done:
    brne8 .Lcmp32_015_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_015_NE_done
.Lcmp32_015_NE_true:
    cold32_emit_char 'B'
.Lcmp32_015_NE_done:
    brult8 .Lcmp32_015_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_015_ULT_done
.Lcmp32_015_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_015_ULT_done:
    bruge8 .Lcmp32_015_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_015_UGE_done
.Lcmp32_015_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_015_UGE_done:
    brslt8 .Lcmp32_015_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_015_SLT_done
.Lcmp32_015_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_015_SLT_done:
    brsge8 .Lcmp32_015_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_015_SGE_done
.Lcmp32_015_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_015_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q0=0x00000001, q3=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x1895
    push16 r4
    ldi16 r4, 0x19b8
    push16 r4
    ldi16 r4, 0x1adb
    push16 r4
    ldi16 r4, 0x1bfe
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x0c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_016_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_016_EQ_done
.Lcmp32_016_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_016_EQ_done:
    brne8 .Lcmp32_016_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_016_NE_done
.Lcmp32_016_NE_true:
    cold32_emit_char 'B'
.Lcmp32_016_NE_done:
    brult8 .Lcmp32_016_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_016_ULT_done
.Lcmp32_016_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_016_ULT_done:
    bruge8 .Lcmp32_016_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_016_UGE_done
.Lcmp32_016_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_016_UGE_done:
    brslt8 .Lcmp32_016_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_016_SLT_done
.Lcmp32_016_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_016_SLT_done:
    brsge8 .Lcmp32_016_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_016_SGE_done
.Lcmp32_016_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_016_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q0=0x7FFFFFFF, q3=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x18d2
    push16 r4
    ldi16 r4, 0x19f5
    push16 r4
    ldi16 r4, 0x1b18
    push16 r4
    ldi16 r4, 0x1c3b
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x0c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_017_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_017_EQ_done
.Lcmp32_017_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_017_EQ_done:
    brne8 .Lcmp32_017_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_017_NE_done
.Lcmp32_017_NE_true:
    cold32_emit_char 'B'
.Lcmp32_017_NE_done:
    brult8 .Lcmp32_017_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_017_ULT_done
.Lcmp32_017_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_017_ULT_done:
    bruge8 .Lcmp32_017_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_017_UGE_done
.Lcmp32_017_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_017_UGE_done:
    brslt8 .Lcmp32_017_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_017_SLT_done
.Lcmp32_017_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_017_SLT_done:
    brsge8 .Lcmp32_017_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_017_SGE_done
.Lcmp32_017_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_017_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q0=0x80000000, q3=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x190f
    push16 r4
    ldi16 r4, 0x1a32
    push16 r4
    ldi16 r4, 0x1b55
    push16 r4
    ldi16 r4, 0x1c78
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x0c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_018_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_018_EQ_done
.Lcmp32_018_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_018_EQ_done:
    brne8 .Lcmp32_018_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_018_NE_done
.Lcmp32_018_NE_true:
    cold32_emit_char 'B'
.Lcmp32_018_NE_done:
    brult8 .Lcmp32_018_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_018_ULT_done
.Lcmp32_018_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_018_ULT_done:
    bruge8 .Lcmp32_018_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_018_UGE_done
.Lcmp32_018_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_018_UGE_done:
    brslt8 .Lcmp32_018_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_018_SLT_done
.Lcmp32_018_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_018_SLT_done:
    brsge8 .Lcmp32_018_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_018_SGE_done
.Lcmp32_018_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_018_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q1=0x00000001, q0=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x1b92
    push16 r4
    ldi16 r4, 0x1cb5
    push16 r4
    ldi16 r4, 0x1dd8
    push16 r4
    ldi16 r4, 0x1efb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x40 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_019_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_019_EQ_done
.Lcmp32_019_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_019_EQ_done:
    brne8 .Lcmp32_019_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_019_NE_done
.Lcmp32_019_NE_true:
    cold32_emit_char 'B'
.Lcmp32_019_NE_done:
    brult8 .Lcmp32_019_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_019_ULT_done
.Lcmp32_019_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_019_ULT_done:
    bruge8 .Lcmp32_019_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_019_UGE_done
.Lcmp32_019_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_019_UGE_done:
    brslt8 .Lcmp32_019_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_019_SLT_done
.Lcmp32_019_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_019_SLT_done:
    brsge8 .Lcmp32_019_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_019_SGE_done
.Lcmp32_019_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_019_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q1=0x7FFFFFFF, q0=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x1bcf
    push16 r4
    ldi16 r4, 0x1cf2
    push16 r4
    ldi16 r4, 0x1e15
    push16 r4
    ldi16 r4, 0x1f38
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x40 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_01a_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01a_EQ_done
.Lcmp32_01a_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_01a_EQ_done:
    brne8 .Lcmp32_01a_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01a_NE_done
.Lcmp32_01a_NE_true:
    cold32_emit_char 'B'
.Lcmp32_01a_NE_done:
    brult8 .Lcmp32_01a_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01a_ULT_done
.Lcmp32_01a_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_01a_ULT_done:
    bruge8 .Lcmp32_01a_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01a_UGE_done
.Lcmp32_01a_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_01a_UGE_done:
    brslt8 .Lcmp32_01a_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01a_SLT_done
.Lcmp32_01a_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_01a_SLT_done:
    brsge8 .Lcmp32_01a_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01a_SGE_done
.Lcmp32_01a_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_01a_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q1=0x80000000, q0=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x1c0c
    push16 r4
    ldi16 r4, 0x1d2f
    push16 r4
    ldi16 r4, 0x1e52
    push16 r4
    ldi16 r4, 0x1f75
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x40 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_01b_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01b_EQ_done
.Lcmp32_01b_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_01b_EQ_done:
    brne8 .Lcmp32_01b_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01b_NE_done
.Lcmp32_01b_NE_true:
    cold32_emit_char 'B'
.Lcmp32_01b_NE_done:
    brult8 .Lcmp32_01b_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01b_ULT_done
.Lcmp32_01b_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_01b_ULT_done:
    bruge8 .Lcmp32_01b_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01b_UGE_done
.Lcmp32_01b_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_01b_UGE_done:
    brslt8 .Lcmp32_01b_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01b_SLT_done
.Lcmp32_01b_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_01b_SLT_done:
    brsge8 .Lcmp32_01b_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01b_SGE_done
.Lcmp32_01b_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_01b_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q1=0x00000001, q2=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x17bd
    push16 r4
    ldi16 r4, 0x18e0
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x1e8f
    push16 r4
    ldi16 r4, 0x1fb2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x48 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_01c_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01c_EQ_done
.Lcmp32_01c_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_01c_EQ_done:
    brne8 .Lcmp32_01c_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01c_NE_done
.Lcmp32_01c_NE_true:
    cold32_emit_char 'B'
.Lcmp32_01c_NE_done:
    brult8 .Lcmp32_01c_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01c_ULT_done
.Lcmp32_01c_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_01c_ULT_done:
    bruge8 .Lcmp32_01c_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01c_UGE_done
.Lcmp32_01c_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_01c_UGE_done:
    brslt8 .Lcmp32_01c_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01c_SLT_done
.Lcmp32_01c_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_01c_SLT_done:
    brsge8 .Lcmp32_01c_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01c_SGE_done
.Lcmp32_01c_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_01c_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q1=0x7FFFFFFF, q2=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x17fa
    push16 r4
    ldi16 r4, 0x191d
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x1ecc
    push16 r4
    ldi16 r4, 0x1fef
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x48 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_01d_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01d_EQ_done
.Lcmp32_01d_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_01d_EQ_done:
    brne8 .Lcmp32_01d_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01d_NE_done
.Lcmp32_01d_NE_true:
    cold32_emit_char 'B'
.Lcmp32_01d_NE_done:
    brult8 .Lcmp32_01d_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01d_ULT_done
.Lcmp32_01d_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_01d_ULT_done:
    bruge8 .Lcmp32_01d_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01d_UGE_done
.Lcmp32_01d_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_01d_UGE_done:
    brslt8 .Lcmp32_01d_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01d_SLT_done
.Lcmp32_01d_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_01d_SLT_done:
    brsge8 .Lcmp32_01d_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01d_SGE_done
.Lcmp32_01d_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_01d_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q1=0x80000000, q2=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1837
    push16 r4
    ldi16 r4, 0x195a
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x1f09
    push16 r4
    ldi16 r4, 0x202c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x48 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_01e_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01e_EQ_done
.Lcmp32_01e_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_01e_EQ_done:
    brne8 .Lcmp32_01e_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01e_NE_done
.Lcmp32_01e_NE_true:
    cold32_emit_char 'B'
.Lcmp32_01e_NE_done:
    brult8 .Lcmp32_01e_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01e_ULT_done
.Lcmp32_01e_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_01e_ULT_done:
    bruge8 .Lcmp32_01e_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01e_UGE_done
.Lcmp32_01e_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_01e_UGE_done:
    brslt8 .Lcmp32_01e_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01e_SLT_done
.Lcmp32_01e_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_01e_SLT_done:
    brsge8 .Lcmp32_01e_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01e_SGE_done
.Lcmp32_01e_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_01e_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q1=0x00000001, q3=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1874
    push16 r4
    ldi16 r4, 0x1997
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x1d00
    push16 r4
    ldi16 r4, 0x1e23
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x4c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_01f_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01f_EQ_done
.Lcmp32_01f_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_01f_EQ_done:
    brne8 .Lcmp32_01f_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01f_NE_done
.Lcmp32_01f_NE_true:
    cold32_emit_char 'B'
.Lcmp32_01f_NE_done:
    brult8 .Lcmp32_01f_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01f_ULT_done
.Lcmp32_01f_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_01f_ULT_done:
    bruge8 .Lcmp32_01f_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01f_UGE_done
.Lcmp32_01f_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_01f_UGE_done:
    brslt8 .Lcmp32_01f_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01f_SLT_done
.Lcmp32_01f_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_01f_SLT_done:
    brsge8 .Lcmp32_01f_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_01f_SGE_done
.Lcmp32_01f_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_01f_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q1=0x7FFFFFFF, q3=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x18b1
    push16 r4
    ldi16 r4, 0x19d4
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x1d3d
    push16 r4
    ldi16 r4, 0x1e60
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x4c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_020_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_020_EQ_done
.Lcmp32_020_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_020_EQ_done:
    brne8 .Lcmp32_020_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_020_NE_done
.Lcmp32_020_NE_true:
    cold32_emit_char 'B'
.Lcmp32_020_NE_done:
    brult8 .Lcmp32_020_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_020_ULT_done
.Lcmp32_020_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_020_ULT_done:
    bruge8 .Lcmp32_020_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_020_UGE_done
.Lcmp32_020_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_020_UGE_done:
    brslt8 .Lcmp32_020_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_020_SLT_done
.Lcmp32_020_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_020_SLT_done:
    brsge8 .Lcmp32_020_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_020_SGE_done
.Lcmp32_020_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_020_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q1=0x80000000, q3=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x18ee
    push16 r4
    ldi16 r4, 0x1a11
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x1d7a
    push16 r4
    ldi16 r4, 0x1e9d
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x4c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_021_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_021_EQ_done
.Lcmp32_021_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_021_EQ_done:
    brne8 .Lcmp32_021_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_021_NE_done
.Lcmp32_021_NE_true:
    cold32_emit_char 'B'
.Lcmp32_021_NE_done:
    brult8 .Lcmp32_021_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_021_ULT_done
.Lcmp32_021_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_021_ULT_done:
    bruge8 .Lcmp32_021_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_021_UGE_done
.Lcmp32_021_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_021_UGE_done:
    brslt8 .Lcmp32_021_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_021_SLT_done
.Lcmp32_021_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_021_SLT_done:
    brsge8 .Lcmp32_021_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_021_SGE_done
.Lcmp32_021_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_021_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q2=0x00000001, q0=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x1b71
    push16 r4
    ldi16 r4, 0x1c94
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x1ffd
    push16 r4
    ldi16 r4, 0x2120
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x80 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_022_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_022_EQ_done
.Lcmp32_022_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_022_EQ_done:
    brne8 .Lcmp32_022_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_022_NE_done
.Lcmp32_022_NE_true:
    cold32_emit_char 'B'
.Lcmp32_022_NE_done:
    brult8 .Lcmp32_022_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_022_ULT_done
.Lcmp32_022_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_022_ULT_done:
    bruge8 .Lcmp32_022_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_022_UGE_done
.Lcmp32_022_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_022_UGE_done:
    brslt8 .Lcmp32_022_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_022_SLT_done
.Lcmp32_022_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_022_SLT_done:
    brsge8 .Lcmp32_022_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_022_SGE_done
.Lcmp32_022_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_022_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q2=0x7FFFFFFF, q0=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x1bae
    push16 r4
    ldi16 r4, 0x1cd1
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x203a
    push16 r4
    ldi16 r4, 0x215d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x80 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_023_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_023_EQ_done
.Lcmp32_023_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_023_EQ_done:
    brne8 .Lcmp32_023_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_023_NE_done
.Lcmp32_023_NE_true:
    cold32_emit_char 'B'
.Lcmp32_023_NE_done:
    brult8 .Lcmp32_023_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_023_ULT_done
.Lcmp32_023_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_023_ULT_done:
    bruge8 .Lcmp32_023_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_023_UGE_done
.Lcmp32_023_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_023_UGE_done:
    brslt8 .Lcmp32_023_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_023_SLT_done
.Lcmp32_023_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_023_SLT_done:
    brsge8 .Lcmp32_023_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_023_SGE_done
.Lcmp32_023_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_023_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q2=0x80000000, q0=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x1beb
    push16 r4
    ldi16 r4, 0x1d0e
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x2077
    push16 r4
    ldi16 r4, 0x219a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x80 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_024_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_024_EQ_done
.Lcmp32_024_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_024_EQ_done:
    brne8 .Lcmp32_024_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_024_NE_done
.Lcmp32_024_NE_true:
    cold32_emit_char 'B'
.Lcmp32_024_NE_done:
    brult8 .Lcmp32_024_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_024_ULT_done
.Lcmp32_024_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_024_ULT_done:
    bruge8 .Lcmp32_024_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_024_UGE_done
.Lcmp32_024_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_024_UGE_done:
    brslt8 .Lcmp32_024_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_024_SLT_done
.Lcmp32_024_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_024_SLT_done:
    brsge8 .Lcmp32_024_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_024_SGE_done
.Lcmp32_024_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_024_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q2=0x00000001, q1=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x19e2
    push16 r4
    ldi16 r4, 0x1b05
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x20b4
    push16 r4
    ldi16 r4, 0x21d7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x84 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_025_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_025_EQ_done
.Lcmp32_025_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_025_EQ_done:
    brne8 .Lcmp32_025_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_025_NE_done
.Lcmp32_025_NE_true:
    cold32_emit_char 'B'
.Lcmp32_025_NE_done:
    brult8 .Lcmp32_025_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_025_ULT_done
.Lcmp32_025_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_025_ULT_done:
    bruge8 .Lcmp32_025_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_025_UGE_done
.Lcmp32_025_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_025_UGE_done:
    brslt8 .Lcmp32_025_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_025_SLT_done
.Lcmp32_025_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_025_SLT_done:
    brsge8 .Lcmp32_025_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_025_SGE_done
.Lcmp32_025_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_025_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q2=0x7FFFFFFF, q1=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1a1f
    push16 r4
    ldi16 r4, 0x1b42
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x20f1
    push16 r4
    ldi16 r4, 0x2214
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x84 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_026_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_026_EQ_done
.Lcmp32_026_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_026_EQ_done:
    brne8 .Lcmp32_026_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_026_NE_done
.Lcmp32_026_NE_true:
    cold32_emit_char 'B'
.Lcmp32_026_NE_done:
    brult8 .Lcmp32_026_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_026_ULT_done
.Lcmp32_026_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_026_ULT_done:
    bruge8 .Lcmp32_026_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_026_UGE_done
.Lcmp32_026_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_026_UGE_done:
    brslt8 .Lcmp32_026_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_026_SLT_done
.Lcmp32_026_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_026_SLT_done:
    brsge8 .Lcmp32_026_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_026_SGE_done
.Lcmp32_026_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_026_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q2=0x80000000, q1=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1a5c
    push16 r4
    ldi16 r4, 0x1b7f
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x212e
    push16 r4
    ldi16 r4, 0x2251
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x84 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_027_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_027_EQ_done
.Lcmp32_027_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_027_EQ_done:
    brne8 .Lcmp32_027_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_027_NE_done
.Lcmp32_027_NE_true:
    cold32_emit_char 'B'
.Lcmp32_027_NE_done:
    brult8 .Lcmp32_027_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_027_ULT_done
.Lcmp32_027_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_027_ULT_done:
    bruge8 .Lcmp32_027_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_027_UGE_done
.Lcmp32_027_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_027_UGE_done:
    brslt8 .Lcmp32_027_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_027_SLT_done
.Lcmp32_027_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_027_SLT_done:
    brsge8 .Lcmp32_027_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_027_SGE_done
.Lcmp32_027_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_027_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q2=0x00000001, q3=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1a99
    push16 r4
    ldi16 r4, 0x1bbc
    push16 r4
    ldi16 r4, 0x1cdf
    push16 r4
    ldi16 r4, 0x1e02
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x8c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_028_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_028_EQ_done
.Lcmp32_028_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_028_EQ_done:
    brne8 .Lcmp32_028_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_028_NE_done
.Lcmp32_028_NE_true:
    cold32_emit_char 'B'
.Lcmp32_028_NE_done:
    brult8 .Lcmp32_028_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_028_ULT_done
.Lcmp32_028_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_028_ULT_done:
    bruge8 .Lcmp32_028_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_028_UGE_done
.Lcmp32_028_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_028_UGE_done:
    brslt8 .Lcmp32_028_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_028_SLT_done
.Lcmp32_028_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_028_SLT_done:
    brsge8 .Lcmp32_028_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_028_SGE_done
.Lcmp32_028_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_028_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q2=0x7FFFFFFF, q3=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1ad6
    push16 r4
    ldi16 r4, 0x1bf9
    push16 r4
    ldi16 r4, 0x1d1c
    push16 r4
    ldi16 r4, 0x1e3f
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x8c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_029_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_029_EQ_done
.Lcmp32_029_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_029_EQ_done:
    brne8 .Lcmp32_029_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_029_NE_done
.Lcmp32_029_NE_true:
    cold32_emit_char 'B'
.Lcmp32_029_NE_done:
    brult8 .Lcmp32_029_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_029_ULT_done
.Lcmp32_029_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_029_ULT_done:
    bruge8 .Lcmp32_029_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_029_UGE_done
.Lcmp32_029_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_029_UGE_done:
    brslt8 .Lcmp32_029_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_029_SLT_done
.Lcmp32_029_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_029_SLT_done:
    brsge8 .Lcmp32_029_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_029_SGE_done
.Lcmp32_029_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_029_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q2=0x80000000, q3=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1b13
    push16 r4
    ldi16 r4, 0x1c36
    push16 r4
    ldi16 r4, 0x1d59
    push16 r4
    ldi16 r4, 0x1e7c
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0x8c ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_02a_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02a_EQ_done
.Lcmp32_02a_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_02a_EQ_done:
    brne8 .Lcmp32_02a_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02a_NE_done
.Lcmp32_02a_NE_true:
    cold32_emit_char 'B'
.Lcmp32_02a_NE_done:
    brult8 .Lcmp32_02a_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02a_ULT_done
.Lcmp32_02a_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_02a_ULT_done:
    bruge8 .Lcmp32_02a_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02a_UGE_done
.Lcmp32_02a_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_02a_UGE_done:
    brslt8 .Lcmp32_02a_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02a_SLT_done
.Lcmp32_02a_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_02a_SLT_done:
    brsge8 .Lcmp32_02a_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02a_SGE_done
.Lcmp32_02a_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_02a_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q3=0x00000001, q0=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x1d96
    push16 r4
    ldi16 r4, 0x1eb9
    push16 r4
    ldi16 r4, 0x1fdc
    push16 r4
    ldi16 r4, 0x20ff
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_02b_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02b_EQ_done
.Lcmp32_02b_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_02b_EQ_done:
    brne8 .Lcmp32_02b_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02b_NE_done
.Lcmp32_02b_NE_true:
    cold32_emit_char 'B'
.Lcmp32_02b_NE_done:
    brult8 .Lcmp32_02b_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02b_ULT_done
.Lcmp32_02b_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_02b_ULT_done:
    bruge8 .Lcmp32_02b_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02b_UGE_done
.Lcmp32_02b_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_02b_UGE_done:
    brslt8 .Lcmp32_02b_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02b_SLT_done
.Lcmp32_02b_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_02b_SLT_done:
    brsge8 .Lcmp32_02b_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02b_SGE_done
.Lcmp32_02b_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_02b_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q3=0x7FFFFFFF, q0=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x1dd3
    push16 r4
    ldi16 r4, 0x1ef6
    push16 r4
    ldi16 r4, 0x2019
    push16 r4
    ldi16 r4, 0x213c
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_02c_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02c_EQ_done
.Lcmp32_02c_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_02c_EQ_done:
    brne8 .Lcmp32_02c_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02c_NE_done
.Lcmp32_02c_NE_true:
    cold32_emit_char 'B'
.Lcmp32_02c_NE_done:
    brult8 .Lcmp32_02c_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02c_ULT_done
.Lcmp32_02c_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_02c_ULT_done:
    bruge8 .Lcmp32_02c_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02c_UGE_done
.Lcmp32_02c_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_02c_UGE_done:
    brslt8 .Lcmp32_02c_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02c_SLT_done
.Lcmp32_02c_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_02c_SLT_done:
    brsge8 .Lcmp32_02c_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02c_SGE_done
.Lcmp32_02c_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_02c_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q3=0x80000000, q0=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x1e10
    push16 r4
    ldi16 r4, 0x1f33
    push16 r4
    ldi16 r4, 0x2056
    push16 r4
    ldi16 r4, 0x2179
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_02d_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02d_EQ_done
.Lcmp32_02d_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_02d_EQ_done:
    brne8 .Lcmp32_02d_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02d_NE_done
.Lcmp32_02d_NE_true:
    cold32_emit_char 'B'
.Lcmp32_02d_NE_done:
    brult8 .Lcmp32_02d_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02d_ULT_done
.Lcmp32_02d_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_02d_ULT_done:
    bruge8 .Lcmp32_02d_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02d_UGE_done
.Lcmp32_02d_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_02d_UGE_done:
    brslt8 .Lcmp32_02d_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02d_SLT_done
.Lcmp32_02d_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_02d_SLT_done:
    brsge8 .Lcmp32_02d_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02d_SGE_done
.Lcmp32_02d_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_02d_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q3=0x00000001, q1=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1c07
    push16 r4
    ldi16 r4, 0x1d2a
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x2093
    push16 r4
    ldi16 r4, 0x21b6
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_02e_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02e_EQ_done
.Lcmp32_02e_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_02e_EQ_done:
    brne8 .Lcmp32_02e_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02e_NE_done
.Lcmp32_02e_NE_true:
    cold32_emit_char 'B'
.Lcmp32_02e_NE_done:
    brult8 .Lcmp32_02e_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02e_ULT_done
.Lcmp32_02e_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_02e_ULT_done:
    bruge8 .Lcmp32_02e_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02e_UGE_done
.Lcmp32_02e_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_02e_UGE_done:
    brslt8 .Lcmp32_02e_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02e_SLT_done
.Lcmp32_02e_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_02e_SLT_done:
    brsge8 .Lcmp32_02e_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02e_SGE_done
.Lcmp32_02e_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_02e_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q3=0x7FFFFFFF, q1=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1c44
    push16 r4
    ldi16 r4, 0x1d67
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x20d0
    push16 r4
    ldi16 r4, 0x21f3
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_02f_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02f_EQ_done
.Lcmp32_02f_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_02f_EQ_done:
    brne8 .Lcmp32_02f_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02f_NE_done
.Lcmp32_02f_NE_true:
    cold32_emit_char 'B'
.Lcmp32_02f_NE_done:
    brult8 .Lcmp32_02f_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02f_ULT_done
.Lcmp32_02f_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_02f_ULT_done:
    bruge8 .Lcmp32_02f_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02f_UGE_done
.Lcmp32_02f_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_02f_UGE_done:
    brslt8 .Lcmp32_02f_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02f_SLT_done
.Lcmp32_02f_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_02f_SLT_done:
    brsge8 .Lcmp32_02f_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_02f_SGE_done
.Lcmp32_02f_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_02f_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q3=0x80000000, q1=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1c81
    push16 r4
    ldi16 r4, 0x1da4
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x210d
    push16 r4
    ldi16 r4, 0x2230
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_030_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_030_EQ_done
.Lcmp32_030_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_030_EQ_done:
    brne8 .Lcmp32_030_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_030_NE_done
.Lcmp32_030_NE_true:
    cold32_emit_char 'B'
.Lcmp32_030_NE_done:
    brult8 .Lcmp32_030_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_030_ULT_done
.Lcmp32_030_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_030_ULT_done:
    bruge8 .Lcmp32_030_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_030_UGE_done
.Lcmp32_030_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_030_UGE_done:
    brslt8 .Lcmp32_030_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_030_SLT_done
.Lcmp32_030_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_030_SLT_done:
    brsge8 .Lcmp32_030_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_030_SGE_done
.Lcmp32_030_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_030_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q3=0x00000001, q2=0x00000002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1cbe
    push16 r4
    ldi16 r4, 0x1de1
    push16 r4
    ldi16 r4, 0x1f04
    push16 r4
    ldi16 r4, 0x2027
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc8 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_031_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_031_EQ_done
.Lcmp32_031_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_031_EQ_done:
    brne8 .Lcmp32_031_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_031_NE_done
.Lcmp32_031_NE_true:
    cold32_emit_char 'B'
.Lcmp32_031_NE_done:
    brult8 .Lcmp32_031_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_031_ULT_done
.Lcmp32_031_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_031_ULT_done:
    bruge8 .Lcmp32_031_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_031_UGE_done
.Lcmp32_031_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_031_UGE_done:
    brslt8 .Lcmp32_031_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_031_SLT_done
.Lcmp32_031_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_031_SLT_done:
    brsge8 .Lcmp32_031_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_031_SGE_done
.Lcmp32_031_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_031_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q3=0x7FFFFFFF, q2=0x80000000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1cfb
    push16 r4
    ldi16 r4, 0x1e1e
    push16 r4
    ldi16 r4, 0x1f41
    push16 r4
    ldi16 r4, 0x2064
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc8 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_032_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_032_EQ_done
.Lcmp32_032_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_032_EQ_done:
    brne8 .Lcmp32_032_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_032_NE_done
.Lcmp32_032_NE_true:
    cold32_emit_char 'B'
.Lcmp32_032_NE_done:
    brult8 .Lcmp32_032_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_032_ULT_done
.Lcmp32_032_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_032_ULT_done:
    bruge8 .Lcmp32_032_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_032_UGE_done
.Lcmp32_032_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_032_UGE_done:
    brslt8 .Lcmp32_032_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_032_SLT_done
.Lcmp32_032_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_032_SLT_done:
    brsge8 .Lcmp32_032_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_032_SGE_done
.Lcmp32_032_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_032_SGE_done:
    cold32_emit_char '\n'

    ; CMP32 ordering: q3=0x80000000, q2=0x7FFFFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1d38
    push16 r4
    ldi16 r4, 0x1e5b
    push16 r4
    ldi16 r4, 0x1f7e
    push16 r4
    ldi16 r4, 0x20a1
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x69, 0xc8 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    pop16 r0
    call cold32_print_r0_line
    breq8 .Lcmp32_033_EQ_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_033_EQ_done
.Lcmp32_033_EQ_true:
    cold32_emit_char 'B'
.Lcmp32_033_EQ_done:
    brne8 .Lcmp32_033_NE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_033_NE_done
.Lcmp32_033_NE_true:
    cold32_emit_char 'B'
.Lcmp32_033_NE_done:
    brult8 .Lcmp32_033_ULT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_033_ULT_done
.Lcmp32_033_ULT_true:
    cold32_emit_char 'B'
.Lcmp32_033_ULT_done:
    bruge8 .Lcmp32_033_UGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_033_UGE_done
.Lcmp32_033_UGE_true:
    cold32_emit_char 'B'
.Lcmp32_033_UGE_done:
    brslt8 .Lcmp32_033_SLT_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_033_SLT_done
.Lcmp32_033_SLT_true:
    cold32_emit_char 'B'
.Lcmp32_033_SLT_done:
    brsge8 .Lcmp32_033_SGE_true
    cold32_emit_char 'A'
    jmp8 .Lcmp32_033_SGE_done
.Lcmp32_033_SGE_true:
    cold32_emit_char 'B'
.Lcmp32_033_SGE_done:
    cold32_emit_char '\n'

    sys debug_break
