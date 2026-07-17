.include "include/cold_stack_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; LEASP r0,0; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb000
    push16 r4
    ldi16 r4, 0x4734
    push16 r4
    ldi16 r4, 0x4857
    push16 r4
    ldi16 r4, 0x497a
    push16 r4
    ldi16 r4, 0x4a9d
    push16 r4
    ldi16 r4, 0x4bc0
    push16 r4
    ldi16 r4, 0x4ce3
    push16 r4
    ldi16 r4, 0xd100
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r0, 0 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_000_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_000_EQ_done
.Lleasp_000_EQ_true:
    cold_emit_char 'B'
.Lleasp_000_EQ_done:
    brne8 .Lleasp_000_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_000_NE_done
.Lleasp_000_NE_true:
    cold_emit_char 'B'
.Lleasp_000_NE_done:
    brult8 .Lleasp_000_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_000_ULT_done
.Lleasp_000_ULT_true:
    cold_emit_char 'B'
.Lleasp_000_ULT_done:
    bruge8 .Lleasp_000_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_000_UGE_done
.Lleasp_000_UGE_true:
    cold_emit_char 'B'
.Lleasp_000_UGE_done:
    brslt8 .Lleasp_000_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_000_SLT_done
.Lleasp_000_SLT_true:
    cold_emit_char 'B'
.Lleasp_000_SLT_done:
    brsge8 .Lleasp_000_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_000_SGE_done
.Lleasp_000_SGE_true:
    cold_emit_char 'B'
.Lleasp_000_SGE_done:
    cold_emit_char '\n'

    ; LEASP r0,15; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb031
    push16 r4
    ldi16 r4, 0x4769
    push16 r4
    ldi16 r4, 0x488c
    push16 r4
    ldi16 r4, 0x49af
    push16 r4
    ldi16 r4, 0x4ad2
    push16 r4
    ldi16 r4, 0x4bf5
    push16 r4
    ldi16 r4, 0x4d18
    push16 r4
    ldi16 r4, 0xd143
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r0, 15 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_001_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_001_EQ_done
.Lleasp_001_EQ_true:
    cold_emit_char 'B'
.Lleasp_001_EQ_done:
    brne8 .Lleasp_001_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_001_NE_done
.Lleasp_001_NE_true:
    cold_emit_char 'B'
.Lleasp_001_NE_done:
    brult8 .Lleasp_001_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_001_ULT_done
.Lleasp_001_ULT_true:
    cold_emit_char 'B'
.Lleasp_001_ULT_done:
    bruge8 .Lleasp_001_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_001_UGE_done
.Lleasp_001_UGE_true:
    cold_emit_char 'B'
.Lleasp_001_UGE_done:
    brslt8 .Lleasp_001_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_001_SLT_done
.Lleasp_001_SLT_true:
    cold_emit_char 'B'
.Lleasp_001_SLT_done:
    brsge8 .Lleasp_001_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_001_SGE_done
.Lleasp_001_SGE_true:
    cold_emit_char 'B'
.Lleasp_001_SGE_done:
    cold_emit_char '\n'

    ; LEASP r0,16; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb062
    push16 r4
    ldi16 r4, 0x479e
    push16 r4
    ldi16 r4, 0x48c1
    push16 r4
    ldi16 r4, 0x49e4
    push16 r4
    ldi16 r4, 0x4b07
    push16 r4
    ldi16 r4, 0x4c2a
    push16 r4
    ldi16 r4, 0x4d4d
    push16 r4
    ldi16 r4, 0xd186
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r0, 16 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_002_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_002_EQ_done
.Lleasp_002_EQ_true:
    cold_emit_char 'B'
.Lleasp_002_EQ_done:
    brne8 .Lleasp_002_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_002_NE_done
.Lleasp_002_NE_true:
    cold_emit_char 'B'
.Lleasp_002_NE_done:
    brult8 .Lleasp_002_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_002_ULT_done
.Lleasp_002_ULT_true:
    cold_emit_char 'B'
.Lleasp_002_ULT_done:
    bruge8 .Lleasp_002_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_002_UGE_done
.Lleasp_002_UGE_true:
    cold_emit_char 'B'
.Lleasp_002_UGE_done:
    brslt8 .Lleasp_002_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_002_SLT_done
.Lleasp_002_SLT_true:
    cold_emit_char 'B'
.Lleasp_002_SLT_done:
    brsge8 .Lleasp_002_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_002_SGE_done
.Lleasp_002_SGE_true:
    cold_emit_char 'B'
.Lleasp_002_SGE_done:
    cold_emit_char '\n'

    ; LEASP r0,127; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb093
    push16 r4
    ldi16 r4, 0x47d3
    push16 r4
    ldi16 r4, 0x48f6
    push16 r4
    ldi16 r4, 0x4a19
    push16 r4
    ldi16 r4, 0x4b3c
    push16 r4
    ldi16 r4, 0x4c5f
    push16 r4
    ldi16 r4, 0x4d82
    push16 r4
    ldi16 r4, 0xd1c9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r0, 127 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_003_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_003_EQ_done
.Lleasp_003_EQ_true:
    cold_emit_char 'B'
.Lleasp_003_EQ_done:
    brne8 .Lleasp_003_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_003_NE_done
.Lleasp_003_NE_true:
    cold_emit_char 'B'
.Lleasp_003_NE_done:
    brult8 .Lleasp_003_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_003_ULT_done
.Lleasp_003_ULT_true:
    cold_emit_char 'B'
.Lleasp_003_ULT_done:
    bruge8 .Lleasp_003_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_003_UGE_done
.Lleasp_003_UGE_true:
    cold_emit_char 'B'
.Lleasp_003_UGE_done:
    brslt8 .Lleasp_003_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_003_SLT_done
.Lleasp_003_SLT_true:
    cold_emit_char 'B'
.Lleasp_003_SLT_done:
    brsge8 .Lleasp_003_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_003_SGE_done
.Lleasp_003_SGE_true:
    cold_emit_char 'B'
.Lleasp_003_SGE_done:
    cold_emit_char '\n'

    ; LEASP r0,128; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb0c4
    push16 r4
    ldi16 r4, 0x4808
    push16 r4
    ldi16 r4, 0x492b
    push16 r4
    ldi16 r4, 0x4a4e
    push16 r4
    ldi16 r4, 0x4b71
    push16 r4
    ldi16 r4, 0x4c94
    push16 r4
    ldi16 r4, 0x4db7
    push16 r4
    ldi16 r4, 0xd20c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r0, 128 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_004_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_004_EQ_done
.Lleasp_004_EQ_true:
    cold_emit_char 'B'
.Lleasp_004_EQ_done:
    brne8 .Lleasp_004_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_004_NE_done
.Lleasp_004_NE_true:
    cold_emit_char 'B'
.Lleasp_004_NE_done:
    brult8 .Lleasp_004_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_004_ULT_done
.Lleasp_004_ULT_true:
    cold_emit_char 'B'
.Lleasp_004_ULT_done:
    bruge8 .Lleasp_004_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_004_UGE_done
.Lleasp_004_UGE_true:
    cold_emit_char 'B'
.Lleasp_004_UGE_done:
    brslt8 .Lleasp_004_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_004_SLT_done
.Lleasp_004_SLT_true:
    cold_emit_char 'B'
.Lleasp_004_SLT_done:
    brsge8 .Lleasp_004_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_004_SGE_done
.Lleasp_004_SGE_true:
    cold_emit_char 'B'
.Lleasp_004_SGE_done:
    cold_emit_char '\n'

    ; LEASP r0,254; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb0f5
    push16 r4
    ldi16 r4, 0x483d
    push16 r4
    ldi16 r4, 0x4960
    push16 r4
    ldi16 r4, 0x4a83
    push16 r4
    ldi16 r4, 0x4ba6
    push16 r4
    ldi16 r4, 0x4cc9
    push16 r4
    ldi16 r4, 0x4dec
    push16 r4
    ldi16 r4, 0xd24f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r0, 254 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_005_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_005_EQ_done
.Lleasp_005_EQ_true:
    cold_emit_char 'B'
.Lleasp_005_EQ_done:
    brne8 .Lleasp_005_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_005_NE_done
.Lleasp_005_NE_true:
    cold_emit_char 'B'
.Lleasp_005_NE_done:
    brult8 .Lleasp_005_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_005_ULT_done
.Lleasp_005_ULT_true:
    cold_emit_char 'B'
.Lleasp_005_ULT_done:
    bruge8 .Lleasp_005_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_005_UGE_done
.Lleasp_005_UGE_true:
    cold_emit_char 'B'
.Lleasp_005_UGE_done:
    brslt8 .Lleasp_005_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_005_SLT_done
.Lleasp_005_SLT_true:
    cold_emit_char 'B'
.Lleasp_005_SLT_done:
    brsge8 .Lleasp_005_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_005_SGE_done
.Lleasp_005_SGE_true:
    cold_emit_char 'B'
.Lleasp_005_SGE_done:
    cold_emit_char '\n'

    ; LEASP r0,255; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb126
    push16 r4
    ldi16 r4, 0x4872
    push16 r4
    ldi16 r4, 0x4995
    push16 r4
    ldi16 r4, 0x4ab8
    push16 r4
    ldi16 r4, 0x4bdb
    push16 r4
    ldi16 r4, 0x4cfe
    push16 r4
    ldi16 r4, 0x4e21
    push16 r4
    ldi16 r4, 0xd292
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r0, 255 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_006_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_006_EQ_done
.Lleasp_006_EQ_true:
    cold_emit_char 'B'
.Lleasp_006_EQ_done:
    brne8 .Lleasp_006_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_006_NE_done
.Lleasp_006_NE_true:
    cold_emit_char 'B'
.Lleasp_006_NE_done:
    brult8 .Lleasp_006_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_006_ULT_done
.Lleasp_006_ULT_true:
    cold_emit_char 'B'
.Lleasp_006_ULT_done:
    bruge8 .Lleasp_006_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_006_UGE_done
.Lleasp_006_UGE_true:
    cold_emit_char 'B'
.Lleasp_006_UGE_done:
    brslt8 .Lleasp_006_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_006_SLT_done
.Lleasp_006_SLT_true:
    cold_emit_char 'B'
.Lleasp_006_SLT_done:
    brsge8 .Lleasp_006_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_006_SGE_done
.Lleasp_006_SGE_true:
    cold_emit_char 'B'
.Lleasp_006_SGE_done:
    cold_emit_char '\n'

    ; LEASP r1,0; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4784
    push16 r4
    ldi16 r4, 0xb157
    push16 r4
    ldi16 r4, 0x49ca
    push16 r4
    ldi16 r4, 0x4aed
    push16 r4
    ldi16 r4, 0x4c10
    push16 r4
    ldi16 r4, 0x4d33
    push16 r4
    ldi16 r4, 0x4e56
    push16 r4
    ldi16 r4, 0xd2d5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r1, 0 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_007_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_007_EQ_done
.Lleasp_007_EQ_true:
    cold_emit_char 'B'
.Lleasp_007_EQ_done:
    brne8 .Lleasp_007_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_007_NE_done
.Lleasp_007_NE_true:
    cold_emit_char 'B'
.Lleasp_007_NE_done:
    brult8 .Lleasp_007_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_007_ULT_done
.Lleasp_007_ULT_true:
    cold_emit_char 'B'
.Lleasp_007_ULT_done:
    bruge8 .Lleasp_007_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_007_UGE_done
.Lleasp_007_UGE_true:
    cold_emit_char 'B'
.Lleasp_007_UGE_done:
    brslt8 .Lleasp_007_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_007_SLT_done
.Lleasp_007_SLT_true:
    cold_emit_char 'B'
.Lleasp_007_SLT_done:
    brsge8 .Lleasp_007_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_007_SGE_done
.Lleasp_007_SGE_true:
    cold_emit_char 'B'
.Lleasp_007_SGE_done:
    cold_emit_char '\n'

    ; LEASP r1,15; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x47b9
    push16 r4
    ldi16 r4, 0xb188
    push16 r4
    ldi16 r4, 0x49ff
    push16 r4
    ldi16 r4, 0x4b22
    push16 r4
    ldi16 r4, 0x4c45
    push16 r4
    ldi16 r4, 0x4d68
    push16 r4
    ldi16 r4, 0x4e8b
    push16 r4
    ldi16 r4, 0xd318
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r1, 15 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_008_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_008_EQ_done
.Lleasp_008_EQ_true:
    cold_emit_char 'B'
.Lleasp_008_EQ_done:
    brne8 .Lleasp_008_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_008_NE_done
.Lleasp_008_NE_true:
    cold_emit_char 'B'
.Lleasp_008_NE_done:
    brult8 .Lleasp_008_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_008_ULT_done
.Lleasp_008_ULT_true:
    cold_emit_char 'B'
.Lleasp_008_ULT_done:
    bruge8 .Lleasp_008_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_008_UGE_done
.Lleasp_008_UGE_true:
    cold_emit_char 'B'
.Lleasp_008_UGE_done:
    brslt8 .Lleasp_008_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_008_SLT_done
.Lleasp_008_SLT_true:
    cold_emit_char 'B'
.Lleasp_008_SLT_done:
    brsge8 .Lleasp_008_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_008_SGE_done
.Lleasp_008_SGE_true:
    cold_emit_char 'B'
.Lleasp_008_SGE_done:
    cold_emit_char '\n'

    ; LEASP r1,16; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x47ee
    push16 r4
    ldi16 r4, 0xb1b9
    push16 r4
    ldi16 r4, 0x4a34
    push16 r4
    ldi16 r4, 0x4b57
    push16 r4
    ldi16 r4, 0x4c7a
    push16 r4
    ldi16 r4, 0x4d9d
    push16 r4
    ldi16 r4, 0x4ec0
    push16 r4
    ldi16 r4, 0xd35b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r1, 16 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_009_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_009_EQ_done
.Lleasp_009_EQ_true:
    cold_emit_char 'B'
.Lleasp_009_EQ_done:
    brne8 .Lleasp_009_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_009_NE_done
.Lleasp_009_NE_true:
    cold_emit_char 'B'
.Lleasp_009_NE_done:
    brult8 .Lleasp_009_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_009_ULT_done
.Lleasp_009_ULT_true:
    cold_emit_char 'B'
.Lleasp_009_ULT_done:
    bruge8 .Lleasp_009_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_009_UGE_done
.Lleasp_009_UGE_true:
    cold_emit_char 'B'
.Lleasp_009_UGE_done:
    brslt8 .Lleasp_009_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_009_SLT_done
.Lleasp_009_SLT_true:
    cold_emit_char 'B'
.Lleasp_009_SLT_done:
    brsge8 .Lleasp_009_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_009_SGE_done
.Lleasp_009_SGE_true:
    cold_emit_char 'B'
.Lleasp_009_SGE_done:
    cold_emit_char '\n'

    ; LEASP r1,127; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4823
    push16 r4
    ldi16 r4, 0xb1ea
    push16 r4
    ldi16 r4, 0x4a69
    push16 r4
    ldi16 r4, 0x4b8c
    push16 r4
    ldi16 r4, 0x4caf
    push16 r4
    ldi16 r4, 0x4dd2
    push16 r4
    ldi16 r4, 0x4ef5
    push16 r4
    ldi16 r4, 0xd39e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r1, 127 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_00a_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00a_EQ_done
.Lleasp_00a_EQ_true:
    cold_emit_char 'B'
.Lleasp_00a_EQ_done:
    brne8 .Lleasp_00a_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00a_NE_done
.Lleasp_00a_NE_true:
    cold_emit_char 'B'
.Lleasp_00a_NE_done:
    brult8 .Lleasp_00a_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00a_ULT_done
.Lleasp_00a_ULT_true:
    cold_emit_char 'B'
.Lleasp_00a_ULT_done:
    bruge8 .Lleasp_00a_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00a_UGE_done
.Lleasp_00a_UGE_true:
    cold_emit_char 'B'
.Lleasp_00a_UGE_done:
    brslt8 .Lleasp_00a_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00a_SLT_done
.Lleasp_00a_SLT_true:
    cold_emit_char 'B'
.Lleasp_00a_SLT_done:
    brsge8 .Lleasp_00a_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00a_SGE_done
.Lleasp_00a_SGE_true:
    cold_emit_char 'B'
.Lleasp_00a_SGE_done:
    cold_emit_char '\n'

    ; LEASP r1,128; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4858
    push16 r4
    ldi16 r4, 0xb21b
    push16 r4
    ldi16 r4, 0x4a9e
    push16 r4
    ldi16 r4, 0x4bc1
    push16 r4
    ldi16 r4, 0x4ce4
    push16 r4
    ldi16 r4, 0x4e07
    push16 r4
    ldi16 r4, 0x4f2a
    push16 r4
    ldi16 r4, 0xd3e1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r1, 128 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_00b_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00b_EQ_done
.Lleasp_00b_EQ_true:
    cold_emit_char 'B'
.Lleasp_00b_EQ_done:
    brne8 .Lleasp_00b_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00b_NE_done
.Lleasp_00b_NE_true:
    cold_emit_char 'B'
.Lleasp_00b_NE_done:
    brult8 .Lleasp_00b_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00b_ULT_done
.Lleasp_00b_ULT_true:
    cold_emit_char 'B'
.Lleasp_00b_ULT_done:
    bruge8 .Lleasp_00b_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00b_UGE_done
.Lleasp_00b_UGE_true:
    cold_emit_char 'B'
.Lleasp_00b_UGE_done:
    brslt8 .Lleasp_00b_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00b_SLT_done
.Lleasp_00b_SLT_true:
    cold_emit_char 'B'
.Lleasp_00b_SLT_done:
    brsge8 .Lleasp_00b_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00b_SGE_done
.Lleasp_00b_SGE_true:
    cold_emit_char 'B'
.Lleasp_00b_SGE_done:
    cold_emit_char '\n'

    ; LEASP r1,254; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x488d
    push16 r4
    ldi16 r4, 0xb24c
    push16 r4
    ldi16 r4, 0x4ad3
    push16 r4
    ldi16 r4, 0x4bf6
    push16 r4
    ldi16 r4, 0x4d19
    push16 r4
    ldi16 r4, 0x4e3c
    push16 r4
    ldi16 r4, 0x4f5f
    push16 r4
    ldi16 r4, 0xd424
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r1, 254 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_00c_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00c_EQ_done
.Lleasp_00c_EQ_true:
    cold_emit_char 'B'
.Lleasp_00c_EQ_done:
    brne8 .Lleasp_00c_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00c_NE_done
.Lleasp_00c_NE_true:
    cold_emit_char 'B'
.Lleasp_00c_NE_done:
    brult8 .Lleasp_00c_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00c_ULT_done
.Lleasp_00c_ULT_true:
    cold_emit_char 'B'
.Lleasp_00c_ULT_done:
    bruge8 .Lleasp_00c_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00c_UGE_done
.Lleasp_00c_UGE_true:
    cold_emit_char 'B'
.Lleasp_00c_UGE_done:
    brslt8 .Lleasp_00c_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00c_SLT_done
.Lleasp_00c_SLT_true:
    cold_emit_char 'B'
.Lleasp_00c_SLT_done:
    brsge8 .Lleasp_00c_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00c_SGE_done
.Lleasp_00c_SGE_true:
    cold_emit_char 'B'
.Lleasp_00c_SGE_done:
    cold_emit_char '\n'

    ; LEASP r1,255; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x48c2
    push16 r4
    ldi16 r4, 0xb27d
    push16 r4
    ldi16 r4, 0x4b08
    push16 r4
    ldi16 r4, 0x4c2b
    push16 r4
    ldi16 r4, 0x4d4e
    push16 r4
    ldi16 r4, 0x4e71
    push16 r4
    ldi16 r4, 0x4f94
    push16 r4
    ldi16 r4, 0xd467
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r1, 255 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_00d_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00d_EQ_done
.Lleasp_00d_EQ_true:
    cold_emit_char 'B'
.Lleasp_00d_EQ_done:
    brne8 .Lleasp_00d_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00d_NE_done
.Lleasp_00d_NE_true:
    cold_emit_char 'B'
.Lleasp_00d_NE_done:
    brult8 .Lleasp_00d_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00d_ULT_done
.Lleasp_00d_ULT_true:
    cold_emit_char 'B'
.Lleasp_00d_ULT_done:
    bruge8 .Lleasp_00d_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00d_UGE_done
.Lleasp_00d_UGE_true:
    cold_emit_char 'B'
.Lleasp_00d_UGE_done:
    brslt8 .Lleasp_00d_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00d_SLT_done
.Lleasp_00d_SLT_true:
    cold_emit_char 'B'
.Lleasp_00d_SLT_done:
    brsge8 .Lleasp_00d_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00d_SGE_done
.Lleasp_00d_SGE_true:
    cold_emit_char 'B'
.Lleasp_00d_SGE_done:
    cold_emit_char '\n'

    ; LEASP r2,0; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x48f7
    push16 r4
    ldi16 r4, 0x4a1a
    push16 r4
    ldi16 r4, 0xb2ae
    push16 r4
    ldi16 r4, 0x4c60
    push16 r4
    ldi16 r4, 0x4d83
    push16 r4
    ldi16 r4, 0x4ea6
    push16 r4
    ldi16 r4, 0x4fc9
    push16 r4
    ldi16 r4, 0xd4aa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r2, 0 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_00e_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00e_EQ_done
.Lleasp_00e_EQ_true:
    cold_emit_char 'B'
.Lleasp_00e_EQ_done:
    brne8 .Lleasp_00e_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00e_NE_done
.Lleasp_00e_NE_true:
    cold_emit_char 'B'
.Lleasp_00e_NE_done:
    brult8 .Lleasp_00e_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00e_ULT_done
.Lleasp_00e_ULT_true:
    cold_emit_char 'B'
.Lleasp_00e_ULT_done:
    bruge8 .Lleasp_00e_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00e_UGE_done
.Lleasp_00e_UGE_true:
    cold_emit_char 'B'
.Lleasp_00e_UGE_done:
    brslt8 .Lleasp_00e_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00e_SLT_done
.Lleasp_00e_SLT_true:
    cold_emit_char 'B'
.Lleasp_00e_SLT_done:
    brsge8 .Lleasp_00e_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00e_SGE_done
.Lleasp_00e_SGE_true:
    cold_emit_char 'B'
.Lleasp_00e_SGE_done:
    cold_emit_char '\n'

    ; LEASP r2,15; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x492c
    push16 r4
    ldi16 r4, 0x4a4f
    push16 r4
    ldi16 r4, 0xb2df
    push16 r4
    ldi16 r4, 0x4c95
    push16 r4
    ldi16 r4, 0x4db8
    push16 r4
    ldi16 r4, 0x4edb
    push16 r4
    ldi16 r4, 0x4ffe
    push16 r4
    ldi16 r4, 0xd4ed
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r2, 15 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_00f_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00f_EQ_done
.Lleasp_00f_EQ_true:
    cold_emit_char 'B'
.Lleasp_00f_EQ_done:
    brne8 .Lleasp_00f_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00f_NE_done
.Lleasp_00f_NE_true:
    cold_emit_char 'B'
.Lleasp_00f_NE_done:
    brult8 .Lleasp_00f_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00f_ULT_done
.Lleasp_00f_ULT_true:
    cold_emit_char 'B'
.Lleasp_00f_ULT_done:
    bruge8 .Lleasp_00f_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00f_UGE_done
.Lleasp_00f_UGE_true:
    cold_emit_char 'B'
.Lleasp_00f_UGE_done:
    brslt8 .Lleasp_00f_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00f_SLT_done
.Lleasp_00f_SLT_true:
    cold_emit_char 'B'
.Lleasp_00f_SLT_done:
    brsge8 .Lleasp_00f_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_00f_SGE_done
.Lleasp_00f_SGE_true:
    cold_emit_char 'B'
.Lleasp_00f_SGE_done:
    cold_emit_char '\n'

    ; LEASP r2,16; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4961
    push16 r4
    ldi16 r4, 0x4a84
    push16 r4
    ldi16 r4, 0xb310
    push16 r4
    ldi16 r4, 0x4cca
    push16 r4
    ldi16 r4, 0x4ded
    push16 r4
    ldi16 r4, 0x4f10
    push16 r4
    ldi16 r4, 0x5033
    push16 r4
    ldi16 r4, 0xd530
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r2, 16 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_010_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_010_EQ_done
.Lleasp_010_EQ_true:
    cold_emit_char 'B'
.Lleasp_010_EQ_done:
    brne8 .Lleasp_010_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_010_NE_done
.Lleasp_010_NE_true:
    cold_emit_char 'B'
.Lleasp_010_NE_done:
    brult8 .Lleasp_010_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_010_ULT_done
.Lleasp_010_ULT_true:
    cold_emit_char 'B'
.Lleasp_010_ULT_done:
    bruge8 .Lleasp_010_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_010_UGE_done
.Lleasp_010_UGE_true:
    cold_emit_char 'B'
.Lleasp_010_UGE_done:
    brslt8 .Lleasp_010_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_010_SLT_done
.Lleasp_010_SLT_true:
    cold_emit_char 'B'
.Lleasp_010_SLT_done:
    brsge8 .Lleasp_010_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_010_SGE_done
.Lleasp_010_SGE_true:
    cold_emit_char 'B'
.Lleasp_010_SGE_done:
    cold_emit_char '\n'

    ; LEASP r2,127; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4996
    push16 r4
    ldi16 r4, 0x4ab9
    push16 r4
    ldi16 r4, 0xb341
    push16 r4
    ldi16 r4, 0x4cff
    push16 r4
    ldi16 r4, 0x4e22
    push16 r4
    ldi16 r4, 0x4f45
    push16 r4
    ldi16 r4, 0x5068
    push16 r4
    ldi16 r4, 0xd573
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r2, 127 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_011_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_011_EQ_done
.Lleasp_011_EQ_true:
    cold_emit_char 'B'
.Lleasp_011_EQ_done:
    brne8 .Lleasp_011_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_011_NE_done
.Lleasp_011_NE_true:
    cold_emit_char 'B'
.Lleasp_011_NE_done:
    brult8 .Lleasp_011_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_011_ULT_done
.Lleasp_011_ULT_true:
    cold_emit_char 'B'
.Lleasp_011_ULT_done:
    bruge8 .Lleasp_011_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_011_UGE_done
.Lleasp_011_UGE_true:
    cold_emit_char 'B'
.Lleasp_011_UGE_done:
    brslt8 .Lleasp_011_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_011_SLT_done
.Lleasp_011_SLT_true:
    cold_emit_char 'B'
.Lleasp_011_SLT_done:
    brsge8 .Lleasp_011_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_011_SGE_done
.Lleasp_011_SGE_true:
    cold_emit_char 'B'
.Lleasp_011_SGE_done:
    cold_emit_char '\n'

    ; LEASP r2,128; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x49cb
    push16 r4
    ldi16 r4, 0x4aee
    push16 r4
    ldi16 r4, 0xb372
    push16 r4
    ldi16 r4, 0x4d34
    push16 r4
    ldi16 r4, 0x4e57
    push16 r4
    ldi16 r4, 0x4f7a
    push16 r4
    ldi16 r4, 0x509d
    push16 r4
    ldi16 r4, 0xd5b6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r2, 128 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_012_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_012_EQ_done
.Lleasp_012_EQ_true:
    cold_emit_char 'B'
.Lleasp_012_EQ_done:
    brne8 .Lleasp_012_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_012_NE_done
.Lleasp_012_NE_true:
    cold_emit_char 'B'
.Lleasp_012_NE_done:
    brult8 .Lleasp_012_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_012_ULT_done
.Lleasp_012_ULT_true:
    cold_emit_char 'B'
.Lleasp_012_ULT_done:
    bruge8 .Lleasp_012_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_012_UGE_done
.Lleasp_012_UGE_true:
    cold_emit_char 'B'
.Lleasp_012_UGE_done:
    brslt8 .Lleasp_012_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_012_SLT_done
.Lleasp_012_SLT_true:
    cold_emit_char 'B'
.Lleasp_012_SLT_done:
    brsge8 .Lleasp_012_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_012_SGE_done
.Lleasp_012_SGE_true:
    cold_emit_char 'B'
.Lleasp_012_SGE_done:
    cold_emit_char '\n'

    ; LEASP r2,254; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4a00
    push16 r4
    ldi16 r4, 0x4b23
    push16 r4
    ldi16 r4, 0xb3a3
    push16 r4
    ldi16 r4, 0x4d69
    push16 r4
    ldi16 r4, 0x4e8c
    push16 r4
    ldi16 r4, 0x4faf
    push16 r4
    ldi16 r4, 0x50d2
    push16 r4
    ldi16 r4, 0xd5f9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r2, 254 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_013_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_013_EQ_done
.Lleasp_013_EQ_true:
    cold_emit_char 'B'
.Lleasp_013_EQ_done:
    brne8 .Lleasp_013_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_013_NE_done
.Lleasp_013_NE_true:
    cold_emit_char 'B'
.Lleasp_013_NE_done:
    brult8 .Lleasp_013_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_013_ULT_done
.Lleasp_013_ULT_true:
    cold_emit_char 'B'
.Lleasp_013_ULT_done:
    bruge8 .Lleasp_013_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_013_UGE_done
.Lleasp_013_UGE_true:
    cold_emit_char 'B'
.Lleasp_013_UGE_done:
    brslt8 .Lleasp_013_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_013_SLT_done
.Lleasp_013_SLT_true:
    cold_emit_char 'B'
.Lleasp_013_SLT_done:
    brsge8 .Lleasp_013_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_013_SGE_done
.Lleasp_013_SGE_true:
    cold_emit_char 'B'
.Lleasp_013_SGE_done:
    cold_emit_char '\n'

    ; LEASP r2,255; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4a35
    push16 r4
    ldi16 r4, 0x4b58
    push16 r4
    ldi16 r4, 0xb3d4
    push16 r4
    ldi16 r4, 0x4d9e
    push16 r4
    ldi16 r4, 0x4ec1
    push16 r4
    ldi16 r4, 0x4fe4
    push16 r4
    ldi16 r4, 0x5107
    push16 r4
    ldi16 r4, 0xd63c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r2, 255 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_014_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_014_EQ_done
.Lleasp_014_EQ_true:
    cold_emit_char 'B'
.Lleasp_014_EQ_done:
    brne8 .Lleasp_014_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_014_NE_done
.Lleasp_014_NE_true:
    cold_emit_char 'B'
.Lleasp_014_NE_done:
    brult8 .Lleasp_014_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_014_ULT_done
.Lleasp_014_ULT_true:
    cold_emit_char 'B'
.Lleasp_014_ULT_done:
    bruge8 .Lleasp_014_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_014_UGE_done
.Lleasp_014_UGE_true:
    cold_emit_char 'B'
.Lleasp_014_UGE_done:
    brslt8 .Lleasp_014_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_014_SLT_done
.Lleasp_014_SLT_true:
    cold_emit_char 'B'
.Lleasp_014_SLT_done:
    brsge8 .Lleasp_014_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_014_SGE_done
.Lleasp_014_SGE_true:
    cold_emit_char 'B'
.Lleasp_014_SGE_done:
    cold_emit_char '\n'

    ; LEASP r3,0; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4a6a
    push16 r4
    ldi16 r4, 0x4b8d
    push16 r4
    ldi16 r4, 0x4cb0
    push16 r4
    ldi16 r4, 0xb405
    push16 r4
    ldi16 r4, 0x4ef6
    push16 r4
    ldi16 r4, 0x5019
    push16 r4
    ldi16 r4, 0x513c
    push16 r4
    ldi16 r4, 0xd67f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r3, 0 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_015_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_015_EQ_done
.Lleasp_015_EQ_true:
    cold_emit_char 'B'
.Lleasp_015_EQ_done:
    brne8 .Lleasp_015_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_015_NE_done
.Lleasp_015_NE_true:
    cold_emit_char 'B'
.Lleasp_015_NE_done:
    brult8 .Lleasp_015_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_015_ULT_done
.Lleasp_015_ULT_true:
    cold_emit_char 'B'
.Lleasp_015_ULT_done:
    bruge8 .Lleasp_015_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_015_UGE_done
.Lleasp_015_UGE_true:
    cold_emit_char 'B'
.Lleasp_015_UGE_done:
    brslt8 .Lleasp_015_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_015_SLT_done
.Lleasp_015_SLT_true:
    cold_emit_char 'B'
.Lleasp_015_SLT_done:
    brsge8 .Lleasp_015_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_015_SGE_done
.Lleasp_015_SGE_true:
    cold_emit_char 'B'
.Lleasp_015_SGE_done:
    cold_emit_char '\n'

    ; LEASP r3,15; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4a9f
    push16 r4
    ldi16 r4, 0x4bc2
    push16 r4
    ldi16 r4, 0x4ce5
    push16 r4
    ldi16 r4, 0xb436
    push16 r4
    ldi16 r4, 0x4f2b
    push16 r4
    ldi16 r4, 0x504e
    push16 r4
    ldi16 r4, 0x5171
    push16 r4
    ldi16 r4, 0xd6c2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r3, 15 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_016_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_016_EQ_done
.Lleasp_016_EQ_true:
    cold_emit_char 'B'
.Lleasp_016_EQ_done:
    brne8 .Lleasp_016_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_016_NE_done
.Lleasp_016_NE_true:
    cold_emit_char 'B'
.Lleasp_016_NE_done:
    brult8 .Lleasp_016_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_016_ULT_done
.Lleasp_016_ULT_true:
    cold_emit_char 'B'
.Lleasp_016_ULT_done:
    bruge8 .Lleasp_016_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_016_UGE_done
.Lleasp_016_UGE_true:
    cold_emit_char 'B'
.Lleasp_016_UGE_done:
    brslt8 .Lleasp_016_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_016_SLT_done
.Lleasp_016_SLT_true:
    cold_emit_char 'B'
.Lleasp_016_SLT_done:
    brsge8 .Lleasp_016_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_016_SGE_done
.Lleasp_016_SGE_true:
    cold_emit_char 'B'
.Lleasp_016_SGE_done:
    cold_emit_char '\n'

    ; LEASP r3,16; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4ad4
    push16 r4
    ldi16 r4, 0x4bf7
    push16 r4
    ldi16 r4, 0x4d1a
    push16 r4
    ldi16 r4, 0xb467
    push16 r4
    ldi16 r4, 0x4f60
    push16 r4
    ldi16 r4, 0x5083
    push16 r4
    ldi16 r4, 0x51a6
    push16 r4
    ldi16 r4, 0xd705
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r3, 16 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_017_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_017_EQ_done
.Lleasp_017_EQ_true:
    cold_emit_char 'B'
.Lleasp_017_EQ_done:
    brne8 .Lleasp_017_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_017_NE_done
.Lleasp_017_NE_true:
    cold_emit_char 'B'
.Lleasp_017_NE_done:
    brult8 .Lleasp_017_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_017_ULT_done
.Lleasp_017_ULT_true:
    cold_emit_char 'B'
.Lleasp_017_ULT_done:
    bruge8 .Lleasp_017_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_017_UGE_done
.Lleasp_017_UGE_true:
    cold_emit_char 'B'
.Lleasp_017_UGE_done:
    brslt8 .Lleasp_017_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_017_SLT_done
.Lleasp_017_SLT_true:
    cold_emit_char 'B'
.Lleasp_017_SLT_done:
    brsge8 .Lleasp_017_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_017_SGE_done
.Lleasp_017_SGE_true:
    cold_emit_char 'B'
.Lleasp_017_SGE_done:
    cold_emit_char '\n'

    ; LEASP r3,127; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4b09
    push16 r4
    ldi16 r4, 0x4c2c
    push16 r4
    ldi16 r4, 0x4d4f
    push16 r4
    ldi16 r4, 0xb498
    push16 r4
    ldi16 r4, 0x4f95
    push16 r4
    ldi16 r4, 0x50b8
    push16 r4
    ldi16 r4, 0x51db
    push16 r4
    ldi16 r4, 0xd748
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r3, 127 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_018_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_018_EQ_done
.Lleasp_018_EQ_true:
    cold_emit_char 'B'
.Lleasp_018_EQ_done:
    brne8 .Lleasp_018_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_018_NE_done
.Lleasp_018_NE_true:
    cold_emit_char 'B'
.Lleasp_018_NE_done:
    brult8 .Lleasp_018_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_018_ULT_done
.Lleasp_018_ULT_true:
    cold_emit_char 'B'
.Lleasp_018_ULT_done:
    bruge8 .Lleasp_018_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_018_UGE_done
.Lleasp_018_UGE_true:
    cold_emit_char 'B'
.Lleasp_018_UGE_done:
    brslt8 .Lleasp_018_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_018_SLT_done
.Lleasp_018_SLT_true:
    cold_emit_char 'B'
.Lleasp_018_SLT_done:
    brsge8 .Lleasp_018_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_018_SGE_done
.Lleasp_018_SGE_true:
    cold_emit_char 'B'
.Lleasp_018_SGE_done:
    cold_emit_char '\n'

    ; LEASP r3,128; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4b3e
    push16 r4
    ldi16 r4, 0x4c61
    push16 r4
    ldi16 r4, 0x4d84
    push16 r4
    ldi16 r4, 0xb4c9
    push16 r4
    ldi16 r4, 0x4fca
    push16 r4
    ldi16 r4, 0x50ed
    push16 r4
    ldi16 r4, 0x5210
    push16 r4
    ldi16 r4, 0xd78b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r3, 128 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_019_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_019_EQ_done
.Lleasp_019_EQ_true:
    cold_emit_char 'B'
.Lleasp_019_EQ_done:
    brne8 .Lleasp_019_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_019_NE_done
.Lleasp_019_NE_true:
    cold_emit_char 'B'
.Lleasp_019_NE_done:
    brult8 .Lleasp_019_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_019_ULT_done
.Lleasp_019_ULT_true:
    cold_emit_char 'B'
.Lleasp_019_ULT_done:
    bruge8 .Lleasp_019_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_019_UGE_done
.Lleasp_019_UGE_true:
    cold_emit_char 'B'
.Lleasp_019_UGE_done:
    brslt8 .Lleasp_019_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_019_SLT_done
.Lleasp_019_SLT_true:
    cold_emit_char 'B'
.Lleasp_019_SLT_done:
    brsge8 .Lleasp_019_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_019_SGE_done
.Lleasp_019_SGE_true:
    cold_emit_char 'B'
.Lleasp_019_SGE_done:
    cold_emit_char '\n'

    ; LEASP r3,254; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4b73
    push16 r4
    ldi16 r4, 0x4c96
    push16 r4
    ldi16 r4, 0x4db9
    push16 r4
    ldi16 r4, 0xb4fa
    push16 r4
    ldi16 r4, 0x4fff
    push16 r4
    ldi16 r4, 0x5122
    push16 r4
    ldi16 r4, 0x5245
    push16 r4
    ldi16 r4, 0xd7ce
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r3, 254 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_01a_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01a_EQ_done
.Lleasp_01a_EQ_true:
    cold_emit_char 'B'
.Lleasp_01a_EQ_done:
    brne8 .Lleasp_01a_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01a_NE_done
.Lleasp_01a_NE_true:
    cold_emit_char 'B'
.Lleasp_01a_NE_done:
    brult8 .Lleasp_01a_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01a_ULT_done
.Lleasp_01a_ULT_true:
    cold_emit_char 'B'
.Lleasp_01a_ULT_done:
    bruge8 .Lleasp_01a_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01a_UGE_done
.Lleasp_01a_UGE_true:
    cold_emit_char 'B'
.Lleasp_01a_UGE_done:
    brslt8 .Lleasp_01a_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01a_SLT_done
.Lleasp_01a_SLT_true:
    cold_emit_char 'B'
.Lleasp_01a_SLT_done:
    brsge8 .Lleasp_01a_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01a_SGE_done
.Lleasp_01a_SGE_true:
    cold_emit_char 'B'
.Lleasp_01a_SGE_done:
    cold_emit_char '\n'

    ; LEASP r3,255; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4ba8
    push16 r4
    ldi16 r4, 0x4ccb
    push16 r4
    ldi16 r4, 0x4dee
    push16 r4
    ldi16 r4, 0xb52b
    push16 r4
    ldi16 r4, 0x5034
    push16 r4
    ldi16 r4, 0x5157
    push16 r4
    ldi16 r4, 0x527a
    push16 r4
    ldi16 r4, 0xd811
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r3, 255 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_01b_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01b_EQ_done
.Lleasp_01b_EQ_true:
    cold_emit_char 'B'
.Lleasp_01b_EQ_done:
    brne8 .Lleasp_01b_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01b_NE_done
.Lleasp_01b_NE_true:
    cold_emit_char 'B'
.Lleasp_01b_NE_done:
    brult8 .Lleasp_01b_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01b_ULT_done
.Lleasp_01b_ULT_true:
    cold_emit_char 'B'
.Lleasp_01b_ULT_done:
    bruge8 .Lleasp_01b_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01b_UGE_done
.Lleasp_01b_UGE_true:
    cold_emit_char 'B'
.Lleasp_01b_UGE_done:
    brslt8 .Lleasp_01b_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01b_SLT_done
.Lleasp_01b_SLT_true:
    cold_emit_char 'B'
.Lleasp_01b_SLT_done:
    brsge8 .Lleasp_01b_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01b_SGE_done
.Lleasp_01b_SGE_true:
    cold_emit_char 'B'
.Lleasp_01b_SGE_done:
    cold_emit_char '\n'

    ; LEASP r4,0; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4bdd
    push16 r4
    ldi16 r4, 0x4d00
    push16 r4
    ldi16 r4, 0x4e23
    push16 r4
    ldi16 r4, 0x4f46
    push16 r4
    ldi16 r4, 0xb55c
    push16 r4
    ldi16 r4, 0x518c
    push16 r4
    ldi16 r4, 0x52af
    push16 r4
    ldi16 r4, 0xd854
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r4, 0 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_01c_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01c_EQ_done
.Lleasp_01c_EQ_true:
    cold_emit_char 'B'
.Lleasp_01c_EQ_done:
    brne8 .Lleasp_01c_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01c_NE_done
.Lleasp_01c_NE_true:
    cold_emit_char 'B'
.Lleasp_01c_NE_done:
    brult8 .Lleasp_01c_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01c_ULT_done
.Lleasp_01c_ULT_true:
    cold_emit_char 'B'
.Lleasp_01c_ULT_done:
    bruge8 .Lleasp_01c_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01c_UGE_done
.Lleasp_01c_UGE_true:
    cold_emit_char 'B'
.Lleasp_01c_UGE_done:
    brslt8 .Lleasp_01c_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01c_SLT_done
.Lleasp_01c_SLT_true:
    cold_emit_char 'B'
.Lleasp_01c_SLT_done:
    brsge8 .Lleasp_01c_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01c_SGE_done
.Lleasp_01c_SGE_true:
    cold_emit_char 'B'
.Lleasp_01c_SGE_done:
    cold_emit_char '\n'

    ; LEASP r4,15; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4c12
    push16 r4
    ldi16 r4, 0x4d35
    push16 r4
    ldi16 r4, 0x4e58
    push16 r4
    ldi16 r4, 0x4f7b
    push16 r4
    ldi16 r4, 0xb58d
    push16 r4
    ldi16 r4, 0x51c1
    push16 r4
    ldi16 r4, 0x52e4
    push16 r4
    ldi16 r4, 0xd897
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r4, 15 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_01d_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01d_EQ_done
.Lleasp_01d_EQ_true:
    cold_emit_char 'B'
.Lleasp_01d_EQ_done:
    brne8 .Lleasp_01d_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01d_NE_done
.Lleasp_01d_NE_true:
    cold_emit_char 'B'
.Lleasp_01d_NE_done:
    brult8 .Lleasp_01d_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01d_ULT_done
.Lleasp_01d_ULT_true:
    cold_emit_char 'B'
.Lleasp_01d_ULT_done:
    bruge8 .Lleasp_01d_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01d_UGE_done
.Lleasp_01d_UGE_true:
    cold_emit_char 'B'
.Lleasp_01d_UGE_done:
    brslt8 .Lleasp_01d_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01d_SLT_done
.Lleasp_01d_SLT_true:
    cold_emit_char 'B'
.Lleasp_01d_SLT_done:
    brsge8 .Lleasp_01d_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01d_SGE_done
.Lleasp_01d_SGE_true:
    cold_emit_char 'B'
.Lleasp_01d_SGE_done:
    cold_emit_char '\n'

    ; LEASP r4,16; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4c47
    push16 r4
    ldi16 r4, 0x4d6a
    push16 r4
    ldi16 r4, 0x4e8d
    push16 r4
    ldi16 r4, 0x4fb0
    push16 r4
    ldi16 r4, 0xb5be
    push16 r4
    ldi16 r4, 0x51f6
    push16 r4
    ldi16 r4, 0x5319
    push16 r4
    ldi16 r4, 0xd8da
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r4, 16 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_01e_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01e_EQ_done
.Lleasp_01e_EQ_true:
    cold_emit_char 'B'
.Lleasp_01e_EQ_done:
    brne8 .Lleasp_01e_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01e_NE_done
.Lleasp_01e_NE_true:
    cold_emit_char 'B'
.Lleasp_01e_NE_done:
    brult8 .Lleasp_01e_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01e_ULT_done
.Lleasp_01e_ULT_true:
    cold_emit_char 'B'
.Lleasp_01e_ULT_done:
    bruge8 .Lleasp_01e_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01e_UGE_done
.Lleasp_01e_UGE_true:
    cold_emit_char 'B'
.Lleasp_01e_UGE_done:
    brslt8 .Lleasp_01e_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01e_SLT_done
.Lleasp_01e_SLT_true:
    cold_emit_char 'B'
.Lleasp_01e_SLT_done:
    brsge8 .Lleasp_01e_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01e_SGE_done
.Lleasp_01e_SGE_true:
    cold_emit_char 'B'
.Lleasp_01e_SGE_done:
    cold_emit_char '\n'

    ; LEASP r4,127; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4c7c
    push16 r4
    ldi16 r4, 0x4d9f
    push16 r4
    ldi16 r4, 0x4ec2
    push16 r4
    ldi16 r4, 0x4fe5
    push16 r4
    ldi16 r4, 0xb5ef
    push16 r4
    ldi16 r4, 0x522b
    push16 r4
    ldi16 r4, 0x534e
    push16 r4
    ldi16 r4, 0xd91d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r4, 127 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_01f_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01f_EQ_done
.Lleasp_01f_EQ_true:
    cold_emit_char 'B'
.Lleasp_01f_EQ_done:
    brne8 .Lleasp_01f_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01f_NE_done
.Lleasp_01f_NE_true:
    cold_emit_char 'B'
.Lleasp_01f_NE_done:
    brult8 .Lleasp_01f_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01f_ULT_done
.Lleasp_01f_ULT_true:
    cold_emit_char 'B'
.Lleasp_01f_ULT_done:
    bruge8 .Lleasp_01f_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01f_UGE_done
.Lleasp_01f_UGE_true:
    cold_emit_char 'B'
.Lleasp_01f_UGE_done:
    brslt8 .Lleasp_01f_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01f_SLT_done
.Lleasp_01f_SLT_true:
    cold_emit_char 'B'
.Lleasp_01f_SLT_done:
    brsge8 .Lleasp_01f_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_01f_SGE_done
.Lleasp_01f_SGE_true:
    cold_emit_char 'B'
.Lleasp_01f_SGE_done:
    cold_emit_char '\n'

    ; LEASP r4,128; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4cb1
    push16 r4
    ldi16 r4, 0x4dd4
    push16 r4
    ldi16 r4, 0x4ef7
    push16 r4
    ldi16 r4, 0x501a
    push16 r4
    ldi16 r4, 0xb620
    push16 r4
    ldi16 r4, 0x5260
    push16 r4
    ldi16 r4, 0x5383
    push16 r4
    ldi16 r4, 0xd960
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r4, 128 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_020_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_020_EQ_done
.Lleasp_020_EQ_true:
    cold_emit_char 'B'
.Lleasp_020_EQ_done:
    brne8 .Lleasp_020_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_020_NE_done
.Lleasp_020_NE_true:
    cold_emit_char 'B'
.Lleasp_020_NE_done:
    brult8 .Lleasp_020_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_020_ULT_done
.Lleasp_020_ULT_true:
    cold_emit_char 'B'
.Lleasp_020_ULT_done:
    bruge8 .Lleasp_020_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_020_UGE_done
.Lleasp_020_UGE_true:
    cold_emit_char 'B'
.Lleasp_020_UGE_done:
    brslt8 .Lleasp_020_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_020_SLT_done
.Lleasp_020_SLT_true:
    cold_emit_char 'B'
.Lleasp_020_SLT_done:
    brsge8 .Lleasp_020_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_020_SGE_done
.Lleasp_020_SGE_true:
    cold_emit_char 'B'
.Lleasp_020_SGE_done:
    cold_emit_char '\n'

    ; LEASP r4,254; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4ce6
    push16 r4
    ldi16 r4, 0x4e09
    push16 r4
    ldi16 r4, 0x4f2c
    push16 r4
    ldi16 r4, 0x504f
    push16 r4
    ldi16 r4, 0xb651
    push16 r4
    ldi16 r4, 0x5295
    push16 r4
    ldi16 r4, 0x53b8
    push16 r4
    ldi16 r4, 0xd9a3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r4, 254 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_021_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_021_EQ_done
.Lleasp_021_EQ_true:
    cold_emit_char 'B'
.Lleasp_021_EQ_done:
    brne8 .Lleasp_021_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_021_NE_done
.Lleasp_021_NE_true:
    cold_emit_char 'B'
.Lleasp_021_NE_done:
    brult8 .Lleasp_021_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_021_ULT_done
.Lleasp_021_ULT_true:
    cold_emit_char 'B'
.Lleasp_021_ULT_done:
    bruge8 .Lleasp_021_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_021_UGE_done
.Lleasp_021_UGE_true:
    cold_emit_char 'B'
.Lleasp_021_UGE_done:
    brslt8 .Lleasp_021_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_021_SLT_done
.Lleasp_021_SLT_true:
    cold_emit_char 'B'
.Lleasp_021_SLT_done:
    brsge8 .Lleasp_021_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_021_SGE_done
.Lleasp_021_SGE_true:
    cold_emit_char 'B'
.Lleasp_021_SGE_done:
    cold_emit_char '\n'

    ; LEASP r4,255; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4d1b
    push16 r4
    ldi16 r4, 0x4e3e
    push16 r4
    ldi16 r4, 0x4f61
    push16 r4
    ldi16 r4, 0x5084
    push16 r4
    ldi16 r4, 0xb682
    push16 r4
    ldi16 r4, 0x52ca
    push16 r4
    ldi16 r4, 0x53ed
    push16 r4
    ldi16 r4, 0xd9e6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r4, 255 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_022_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_022_EQ_done
.Lleasp_022_EQ_true:
    cold_emit_char 'B'
.Lleasp_022_EQ_done:
    brne8 .Lleasp_022_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_022_NE_done
.Lleasp_022_NE_true:
    cold_emit_char 'B'
.Lleasp_022_NE_done:
    brult8 .Lleasp_022_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_022_ULT_done
.Lleasp_022_ULT_true:
    cold_emit_char 'B'
.Lleasp_022_ULT_done:
    bruge8 .Lleasp_022_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_022_UGE_done
.Lleasp_022_UGE_true:
    cold_emit_char 'B'
.Lleasp_022_UGE_done:
    brslt8 .Lleasp_022_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_022_SLT_done
.Lleasp_022_SLT_true:
    cold_emit_char 'B'
.Lleasp_022_SLT_done:
    brsge8 .Lleasp_022_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_022_SGE_done
.Lleasp_022_SGE_true:
    cold_emit_char 'B'
.Lleasp_022_SGE_done:
    cold_emit_char '\n'

    ; LEASP r5,0; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4d50
    push16 r4
    ldi16 r4, 0x4e73
    push16 r4
    ldi16 r4, 0x4f96
    push16 r4
    ldi16 r4, 0x50b9
    push16 r4
    ldi16 r4, 0x51dc
    push16 r4
    ldi16 r4, 0xb6b3
    push16 r4
    ldi16 r4, 0x5422
    push16 r4
    ldi16 r4, 0xda29
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r5, 0 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_023_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_023_EQ_done
.Lleasp_023_EQ_true:
    cold_emit_char 'B'
.Lleasp_023_EQ_done:
    brne8 .Lleasp_023_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_023_NE_done
.Lleasp_023_NE_true:
    cold_emit_char 'B'
.Lleasp_023_NE_done:
    brult8 .Lleasp_023_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_023_ULT_done
.Lleasp_023_ULT_true:
    cold_emit_char 'B'
.Lleasp_023_ULT_done:
    bruge8 .Lleasp_023_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_023_UGE_done
.Lleasp_023_UGE_true:
    cold_emit_char 'B'
.Lleasp_023_UGE_done:
    brslt8 .Lleasp_023_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_023_SLT_done
.Lleasp_023_SLT_true:
    cold_emit_char 'B'
.Lleasp_023_SLT_done:
    brsge8 .Lleasp_023_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_023_SGE_done
.Lleasp_023_SGE_true:
    cold_emit_char 'B'
.Lleasp_023_SGE_done:
    cold_emit_char '\n'

    ; LEASP r5,15; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4d85
    push16 r4
    ldi16 r4, 0x4ea8
    push16 r4
    ldi16 r4, 0x4fcb
    push16 r4
    ldi16 r4, 0x50ee
    push16 r4
    ldi16 r4, 0x5211
    push16 r4
    ldi16 r4, 0xb6e4
    push16 r4
    ldi16 r4, 0x5457
    push16 r4
    ldi16 r4, 0xda6c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r5, 15 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_024_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_024_EQ_done
.Lleasp_024_EQ_true:
    cold_emit_char 'B'
.Lleasp_024_EQ_done:
    brne8 .Lleasp_024_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_024_NE_done
.Lleasp_024_NE_true:
    cold_emit_char 'B'
.Lleasp_024_NE_done:
    brult8 .Lleasp_024_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_024_ULT_done
.Lleasp_024_ULT_true:
    cold_emit_char 'B'
.Lleasp_024_ULT_done:
    bruge8 .Lleasp_024_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_024_UGE_done
.Lleasp_024_UGE_true:
    cold_emit_char 'B'
.Lleasp_024_UGE_done:
    brslt8 .Lleasp_024_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_024_SLT_done
.Lleasp_024_SLT_true:
    cold_emit_char 'B'
.Lleasp_024_SLT_done:
    brsge8 .Lleasp_024_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_024_SGE_done
.Lleasp_024_SGE_true:
    cold_emit_char 'B'
.Lleasp_024_SGE_done:
    cold_emit_char '\n'

    ; LEASP r5,16; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4dba
    push16 r4
    ldi16 r4, 0x4edd
    push16 r4
    ldi16 r4, 0x5000
    push16 r4
    ldi16 r4, 0x5123
    push16 r4
    ldi16 r4, 0x5246
    push16 r4
    ldi16 r4, 0xb715
    push16 r4
    ldi16 r4, 0x548c
    push16 r4
    ldi16 r4, 0xdaaf
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r5, 16 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_025_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_025_EQ_done
.Lleasp_025_EQ_true:
    cold_emit_char 'B'
.Lleasp_025_EQ_done:
    brne8 .Lleasp_025_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_025_NE_done
.Lleasp_025_NE_true:
    cold_emit_char 'B'
.Lleasp_025_NE_done:
    brult8 .Lleasp_025_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_025_ULT_done
.Lleasp_025_ULT_true:
    cold_emit_char 'B'
.Lleasp_025_ULT_done:
    bruge8 .Lleasp_025_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_025_UGE_done
.Lleasp_025_UGE_true:
    cold_emit_char 'B'
.Lleasp_025_UGE_done:
    brslt8 .Lleasp_025_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_025_SLT_done
.Lleasp_025_SLT_true:
    cold_emit_char 'B'
.Lleasp_025_SLT_done:
    brsge8 .Lleasp_025_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_025_SGE_done
.Lleasp_025_SGE_true:
    cold_emit_char 'B'
.Lleasp_025_SGE_done:
    cold_emit_char '\n'

    ; LEASP r5,127; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4def
    push16 r4
    ldi16 r4, 0x4f12
    push16 r4
    ldi16 r4, 0x5035
    push16 r4
    ldi16 r4, 0x5158
    push16 r4
    ldi16 r4, 0x527b
    push16 r4
    ldi16 r4, 0xb746
    push16 r4
    ldi16 r4, 0x54c1
    push16 r4
    ldi16 r4, 0xdaf2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r5, 127 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_026_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_026_EQ_done
.Lleasp_026_EQ_true:
    cold_emit_char 'B'
.Lleasp_026_EQ_done:
    brne8 .Lleasp_026_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_026_NE_done
.Lleasp_026_NE_true:
    cold_emit_char 'B'
.Lleasp_026_NE_done:
    brult8 .Lleasp_026_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_026_ULT_done
.Lleasp_026_ULT_true:
    cold_emit_char 'B'
.Lleasp_026_ULT_done:
    bruge8 .Lleasp_026_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_026_UGE_done
.Lleasp_026_UGE_true:
    cold_emit_char 'B'
.Lleasp_026_UGE_done:
    brslt8 .Lleasp_026_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_026_SLT_done
.Lleasp_026_SLT_true:
    cold_emit_char 'B'
.Lleasp_026_SLT_done:
    brsge8 .Lleasp_026_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_026_SGE_done
.Lleasp_026_SGE_true:
    cold_emit_char 'B'
.Lleasp_026_SGE_done:
    cold_emit_char '\n'

    ; LEASP r5,128; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4e24
    push16 r4
    ldi16 r4, 0x4f47
    push16 r4
    ldi16 r4, 0x506a
    push16 r4
    ldi16 r4, 0x518d
    push16 r4
    ldi16 r4, 0x52b0
    push16 r4
    ldi16 r4, 0xb777
    push16 r4
    ldi16 r4, 0x54f6
    push16 r4
    ldi16 r4, 0xdb35
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r5, 128 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_027_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_027_EQ_done
.Lleasp_027_EQ_true:
    cold_emit_char 'B'
.Lleasp_027_EQ_done:
    brne8 .Lleasp_027_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_027_NE_done
.Lleasp_027_NE_true:
    cold_emit_char 'B'
.Lleasp_027_NE_done:
    brult8 .Lleasp_027_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_027_ULT_done
.Lleasp_027_ULT_true:
    cold_emit_char 'B'
.Lleasp_027_ULT_done:
    bruge8 .Lleasp_027_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_027_UGE_done
.Lleasp_027_UGE_true:
    cold_emit_char 'B'
.Lleasp_027_UGE_done:
    brslt8 .Lleasp_027_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_027_SLT_done
.Lleasp_027_SLT_true:
    cold_emit_char 'B'
.Lleasp_027_SLT_done:
    brsge8 .Lleasp_027_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_027_SGE_done
.Lleasp_027_SGE_true:
    cold_emit_char 'B'
.Lleasp_027_SGE_done:
    cold_emit_char '\n'

    ; LEASP r5,254; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4e59
    push16 r4
    ldi16 r4, 0x4f7c
    push16 r4
    ldi16 r4, 0x509f
    push16 r4
    ldi16 r4, 0x51c2
    push16 r4
    ldi16 r4, 0x52e5
    push16 r4
    ldi16 r4, 0xb7a8
    push16 r4
    ldi16 r4, 0x552b
    push16 r4
    ldi16 r4, 0xdb78
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r5, 254 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_028_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_028_EQ_done
.Lleasp_028_EQ_true:
    cold_emit_char 'B'
.Lleasp_028_EQ_done:
    brne8 .Lleasp_028_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_028_NE_done
.Lleasp_028_NE_true:
    cold_emit_char 'B'
.Lleasp_028_NE_done:
    brult8 .Lleasp_028_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_028_ULT_done
.Lleasp_028_ULT_true:
    cold_emit_char 'B'
.Lleasp_028_ULT_done:
    bruge8 .Lleasp_028_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_028_UGE_done
.Lleasp_028_UGE_true:
    cold_emit_char 'B'
.Lleasp_028_UGE_done:
    brslt8 .Lleasp_028_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_028_SLT_done
.Lleasp_028_SLT_true:
    cold_emit_char 'B'
.Lleasp_028_SLT_done:
    brsge8 .Lleasp_028_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_028_SGE_done
.Lleasp_028_SGE_true:
    cold_emit_char 'B'
.Lleasp_028_SGE_done:
    cold_emit_char '\n'

    ; LEASP r5,255; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4e8e
    push16 r4
    ldi16 r4, 0x4fb1
    push16 r4
    ldi16 r4, 0x50d4
    push16 r4
    ldi16 r4, 0x51f7
    push16 r4
    ldi16 r4, 0x531a
    push16 r4
    ldi16 r4, 0xb7d9
    push16 r4
    ldi16 r4, 0x5560
    push16 r4
    ldi16 r4, 0xdbbb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r5, 255 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_029_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_029_EQ_done
.Lleasp_029_EQ_true:
    cold_emit_char 'B'
.Lleasp_029_EQ_done:
    brne8 .Lleasp_029_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_029_NE_done
.Lleasp_029_NE_true:
    cold_emit_char 'B'
.Lleasp_029_NE_done:
    brult8 .Lleasp_029_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_029_ULT_done
.Lleasp_029_ULT_true:
    cold_emit_char 'B'
.Lleasp_029_ULT_done:
    bruge8 .Lleasp_029_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_029_UGE_done
.Lleasp_029_UGE_true:
    cold_emit_char 'B'
.Lleasp_029_UGE_done:
    brslt8 .Lleasp_029_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_029_SLT_done
.Lleasp_029_SLT_true:
    cold_emit_char 'B'
.Lleasp_029_SLT_done:
    brsge8 .Lleasp_029_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_029_SGE_done
.Lleasp_029_SGE_true:
    cold_emit_char 'B'
.Lleasp_029_SGE_done:
    cold_emit_char '\n'

    ; LEASP r6,0; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4ec3
    push16 r4
    ldi16 r4, 0x4fe6
    push16 r4
    ldi16 r4, 0x5109
    push16 r4
    ldi16 r4, 0x522c
    push16 r4
    ldi16 r4, 0x534f
    push16 r4
    ldi16 r4, 0x5472
    push16 r4
    ldi16 r4, 0xb80a
    push16 r4
    ldi16 r4, 0xdbfe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r6, 0 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_02a_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02a_EQ_done
.Lleasp_02a_EQ_true:
    cold_emit_char 'B'
.Lleasp_02a_EQ_done:
    brne8 .Lleasp_02a_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02a_NE_done
.Lleasp_02a_NE_true:
    cold_emit_char 'B'
.Lleasp_02a_NE_done:
    brult8 .Lleasp_02a_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02a_ULT_done
.Lleasp_02a_ULT_true:
    cold_emit_char 'B'
.Lleasp_02a_ULT_done:
    bruge8 .Lleasp_02a_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02a_UGE_done
.Lleasp_02a_UGE_true:
    cold_emit_char 'B'
.Lleasp_02a_UGE_done:
    brslt8 .Lleasp_02a_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02a_SLT_done
.Lleasp_02a_SLT_true:
    cold_emit_char 'B'
.Lleasp_02a_SLT_done:
    brsge8 .Lleasp_02a_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02a_SGE_done
.Lleasp_02a_SGE_true:
    cold_emit_char 'B'
.Lleasp_02a_SGE_done:
    cold_emit_char '\n'

    ; LEASP r6,15; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4ef8
    push16 r4
    ldi16 r4, 0x501b
    push16 r4
    ldi16 r4, 0x513e
    push16 r4
    ldi16 r4, 0x5261
    push16 r4
    ldi16 r4, 0x5384
    push16 r4
    ldi16 r4, 0x54a7
    push16 r4
    ldi16 r4, 0xb83b
    push16 r4
    ldi16 r4, 0xdc41
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r6, 15 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_02b_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02b_EQ_done
.Lleasp_02b_EQ_true:
    cold_emit_char 'B'
.Lleasp_02b_EQ_done:
    brne8 .Lleasp_02b_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02b_NE_done
.Lleasp_02b_NE_true:
    cold_emit_char 'B'
.Lleasp_02b_NE_done:
    brult8 .Lleasp_02b_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02b_ULT_done
.Lleasp_02b_ULT_true:
    cold_emit_char 'B'
.Lleasp_02b_ULT_done:
    bruge8 .Lleasp_02b_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02b_UGE_done
.Lleasp_02b_UGE_true:
    cold_emit_char 'B'
.Lleasp_02b_UGE_done:
    brslt8 .Lleasp_02b_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02b_SLT_done
.Lleasp_02b_SLT_true:
    cold_emit_char 'B'
.Lleasp_02b_SLT_done:
    brsge8 .Lleasp_02b_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02b_SGE_done
.Lleasp_02b_SGE_true:
    cold_emit_char 'B'
.Lleasp_02b_SGE_done:
    cold_emit_char '\n'

    ; LEASP r6,16; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4f2d
    push16 r4
    ldi16 r4, 0x5050
    push16 r4
    ldi16 r4, 0x5173
    push16 r4
    ldi16 r4, 0x5296
    push16 r4
    ldi16 r4, 0x53b9
    push16 r4
    ldi16 r4, 0x54dc
    push16 r4
    ldi16 r4, 0xb86c
    push16 r4
    ldi16 r4, 0xdc84
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r6, 16 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_02c_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02c_EQ_done
.Lleasp_02c_EQ_true:
    cold_emit_char 'B'
.Lleasp_02c_EQ_done:
    brne8 .Lleasp_02c_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02c_NE_done
.Lleasp_02c_NE_true:
    cold_emit_char 'B'
.Lleasp_02c_NE_done:
    brult8 .Lleasp_02c_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02c_ULT_done
.Lleasp_02c_ULT_true:
    cold_emit_char 'B'
.Lleasp_02c_ULT_done:
    bruge8 .Lleasp_02c_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02c_UGE_done
.Lleasp_02c_UGE_true:
    cold_emit_char 'B'
.Lleasp_02c_UGE_done:
    brslt8 .Lleasp_02c_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02c_SLT_done
.Lleasp_02c_SLT_true:
    cold_emit_char 'B'
.Lleasp_02c_SLT_done:
    brsge8 .Lleasp_02c_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02c_SGE_done
.Lleasp_02c_SGE_true:
    cold_emit_char 'B'
.Lleasp_02c_SGE_done:
    cold_emit_char '\n'

    ; LEASP r6,127; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4f62
    push16 r4
    ldi16 r4, 0x5085
    push16 r4
    ldi16 r4, 0x51a8
    push16 r4
    ldi16 r4, 0x52cb
    push16 r4
    ldi16 r4, 0x53ee
    push16 r4
    ldi16 r4, 0x5511
    push16 r4
    ldi16 r4, 0xb89d
    push16 r4
    ldi16 r4, 0xdcc7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r6, 127 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_02d_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02d_EQ_done
.Lleasp_02d_EQ_true:
    cold_emit_char 'B'
.Lleasp_02d_EQ_done:
    brne8 .Lleasp_02d_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02d_NE_done
.Lleasp_02d_NE_true:
    cold_emit_char 'B'
.Lleasp_02d_NE_done:
    brult8 .Lleasp_02d_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02d_ULT_done
.Lleasp_02d_ULT_true:
    cold_emit_char 'B'
.Lleasp_02d_ULT_done:
    bruge8 .Lleasp_02d_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02d_UGE_done
.Lleasp_02d_UGE_true:
    cold_emit_char 'B'
.Lleasp_02d_UGE_done:
    brslt8 .Lleasp_02d_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02d_SLT_done
.Lleasp_02d_SLT_true:
    cold_emit_char 'B'
.Lleasp_02d_SLT_done:
    brsge8 .Lleasp_02d_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02d_SGE_done
.Lleasp_02d_SGE_true:
    cold_emit_char 'B'
.Lleasp_02d_SGE_done:
    cold_emit_char '\n'

    ; LEASP r6,128; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4f97
    push16 r4
    ldi16 r4, 0x50ba
    push16 r4
    ldi16 r4, 0x51dd
    push16 r4
    ldi16 r4, 0x5300
    push16 r4
    ldi16 r4, 0x5423
    push16 r4
    ldi16 r4, 0x5546
    push16 r4
    ldi16 r4, 0xb8ce
    push16 r4
    ldi16 r4, 0xdd0a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r6, 128 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_02e_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02e_EQ_done
.Lleasp_02e_EQ_true:
    cold_emit_char 'B'
.Lleasp_02e_EQ_done:
    brne8 .Lleasp_02e_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02e_NE_done
.Lleasp_02e_NE_true:
    cold_emit_char 'B'
.Lleasp_02e_NE_done:
    brult8 .Lleasp_02e_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02e_ULT_done
.Lleasp_02e_ULT_true:
    cold_emit_char 'B'
.Lleasp_02e_ULT_done:
    bruge8 .Lleasp_02e_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02e_UGE_done
.Lleasp_02e_UGE_true:
    cold_emit_char 'B'
.Lleasp_02e_UGE_done:
    brslt8 .Lleasp_02e_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02e_SLT_done
.Lleasp_02e_SLT_true:
    cold_emit_char 'B'
.Lleasp_02e_SLT_done:
    brsge8 .Lleasp_02e_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02e_SGE_done
.Lleasp_02e_SGE_true:
    cold_emit_char 'B'
.Lleasp_02e_SGE_done:
    cold_emit_char '\n'

    ; LEASP r6,254; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4fcc
    push16 r4
    ldi16 r4, 0x50ef
    push16 r4
    ldi16 r4, 0x5212
    push16 r4
    ldi16 r4, 0x5335
    push16 r4
    ldi16 r4, 0x5458
    push16 r4
    ldi16 r4, 0x557b
    push16 r4
    ldi16 r4, 0xb8ff
    push16 r4
    ldi16 r4, 0xdd4d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r6, 254 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_02f_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02f_EQ_done
.Lleasp_02f_EQ_true:
    cold_emit_char 'B'
.Lleasp_02f_EQ_done:
    brne8 .Lleasp_02f_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02f_NE_done
.Lleasp_02f_NE_true:
    cold_emit_char 'B'
.Lleasp_02f_NE_done:
    brult8 .Lleasp_02f_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02f_ULT_done
.Lleasp_02f_ULT_true:
    cold_emit_char 'B'
.Lleasp_02f_ULT_done:
    bruge8 .Lleasp_02f_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02f_UGE_done
.Lleasp_02f_UGE_true:
    cold_emit_char 'B'
.Lleasp_02f_UGE_done:
    brslt8 .Lleasp_02f_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02f_SLT_done
.Lleasp_02f_SLT_true:
    cold_emit_char 'B'
.Lleasp_02f_SLT_done:
    brsge8 .Lleasp_02f_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_02f_SGE_done
.Lleasp_02f_SGE_true:
    cold_emit_char 'B'
.Lleasp_02f_SGE_done:
    cold_emit_char '\n'

    ; LEASP r6,255; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5001
    push16 r4
    ldi16 r4, 0x5124
    push16 r4
    ldi16 r4, 0x5247
    push16 r4
    ldi16 r4, 0x536a
    push16 r4
    ldi16 r4, 0x548d
    push16 r4
    ldi16 r4, 0x55b0
    push16 r4
    ldi16 r4, 0xb930
    push16 r4
    ldi16 r4, 0xdd90
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r6, 255 ; TEST
    push16 r7
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_030_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_030_EQ_done
.Lleasp_030_EQ_true:
    cold_emit_char 'B'
.Lleasp_030_EQ_done:
    brne8 .Lleasp_030_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_030_NE_done
.Lleasp_030_NE_true:
    cold_emit_char 'B'
.Lleasp_030_NE_done:
    brult8 .Lleasp_030_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_030_ULT_done
.Lleasp_030_ULT_true:
    cold_emit_char 'B'
.Lleasp_030_ULT_done:
    bruge8 .Lleasp_030_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_030_UGE_done
.Lleasp_030_UGE_true:
    cold_emit_char 'B'
.Lleasp_030_UGE_done:
    brslt8 .Lleasp_030_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_030_SLT_done
.Lleasp_030_SLT_true:
    cold_emit_char 'B'
.Lleasp_030_SLT_done:
    brsge8 .Lleasp_030_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_030_SGE_done
.Lleasp_030_SGE_true:
    cold_emit_char 'B'
.Lleasp_030_SGE_done:
    cold_emit_char '\n'

    ; LEASP r7,0; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x5036
    push16 r4
    ldi16 r4, 0x5159
    push16 r4
    ldi16 r4, 0x527c
    push16 r4
    ldi16 r4, 0x539f
    push16 r4
    ldi16 r4, 0x54c2
    push16 r4
    ldi16 r4, 0x55e5
    push16 r4
    ldi16 r4, 0xddd3
    push16 r4
    ldi16 r4, 0xb961
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r7, 0 ; TEST
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_031_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_031_EQ_done
.Lleasp_031_EQ_true:
    cold_emit_char 'B'
.Lleasp_031_EQ_done:
    brne8 .Lleasp_031_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_031_NE_done
.Lleasp_031_NE_true:
    cold_emit_char 'B'
.Lleasp_031_NE_done:
    brult8 .Lleasp_031_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_031_ULT_done
.Lleasp_031_ULT_true:
    cold_emit_char 'B'
.Lleasp_031_ULT_done:
    bruge8 .Lleasp_031_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_031_UGE_done
.Lleasp_031_UGE_true:
    cold_emit_char 'B'
.Lleasp_031_UGE_done:
    brslt8 .Lleasp_031_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_031_SLT_done
.Lleasp_031_SLT_true:
    cold_emit_char 'B'
.Lleasp_031_SLT_done:
    brsge8 .Lleasp_031_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_031_SGE_done
.Lleasp_031_SGE_true:
    cold_emit_char 'B'
.Lleasp_031_SGE_done:
    cold_emit_char '\n'

    ; LEASP r7,15; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x506b
    push16 r4
    ldi16 r4, 0x518e
    push16 r4
    ldi16 r4, 0x52b1
    push16 r4
    ldi16 r4, 0x53d4
    push16 r4
    ldi16 r4, 0x54f7
    push16 r4
    ldi16 r4, 0x561a
    push16 r4
    ldi16 r4, 0xde16
    push16 r4
    ldi16 r4, 0xb992
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r7, 15 ; TEST
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_032_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_032_EQ_done
.Lleasp_032_EQ_true:
    cold_emit_char 'B'
.Lleasp_032_EQ_done:
    brne8 .Lleasp_032_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_032_NE_done
.Lleasp_032_NE_true:
    cold_emit_char 'B'
.Lleasp_032_NE_done:
    brult8 .Lleasp_032_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_032_ULT_done
.Lleasp_032_ULT_true:
    cold_emit_char 'B'
.Lleasp_032_ULT_done:
    bruge8 .Lleasp_032_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_032_UGE_done
.Lleasp_032_UGE_true:
    cold_emit_char 'B'
.Lleasp_032_UGE_done:
    brslt8 .Lleasp_032_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_032_SLT_done
.Lleasp_032_SLT_true:
    cold_emit_char 'B'
.Lleasp_032_SLT_done:
    brsge8 .Lleasp_032_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_032_SGE_done
.Lleasp_032_SGE_true:
    cold_emit_char 'B'
.Lleasp_032_SGE_done:
    cold_emit_char '\n'

    ; LEASP r7,16; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x50a0
    push16 r4
    ldi16 r4, 0x51c3
    push16 r4
    ldi16 r4, 0x52e6
    push16 r4
    ldi16 r4, 0x5409
    push16 r4
    ldi16 r4, 0x552c
    push16 r4
    ldi16 r4, 0x564f
    push16 r4
    ldi16 r4, 0xde59
    push16 r4
    ldi16 r4, 0xb9c3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r7, 16 ; TEST
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_033_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_033_EQ_done
.Lleasp_033_EQ_true:
    cold_emit_char 'B'
.Lleasp_033_EQ_done:
    brne8 .Lleasp_033_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_033_NE_done
.Lleasp_033_NE_true:
    cold_emit_char 'B'
.Lleasp_033_NE_done:
    brult8 .Lleasp_033_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_033_ULT_done
.Lleasp_033_ULT_true:
    cold_emit_char 'B'
.Lleasp_033_ULT_done:
    bruge8 .Lleasp_033_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_033_UGE_done
.Lleasp_033_UGE_true:
    cold_emit_char 'B'
.Lleasp_033_UGE_done:
    brslt8 .Lleasp_033_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_033_SLT_done
.Lleasp_033_SLT_true:
    cold_emit_char 'B'
.Lleasp_033_SLT_done:
    brsge8 .Lleasp_033_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_033_SGE_done
.Lleasp_033_SGE_true:
    cold_emit_char 'B'
.Lleasp_033_SGE_done:
    cold_emit_char '\n'

    ; LEASP r7,127; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x50d5
    push16 r4
    ldi16 r4, 0x51f8
    push16 r4
    ldi16 r4, 0x531b
    push16 r4
    ldi16 r4, 0x543e
    push16 r4
    ldi16 r4, 0x5561
    push16 r4
    ldi16 r4, 0x5684
    push16 r4
    ldi16 r4, 0xde9c
    push16 r4
    ldi16 r4, 0xb9f4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r7, 127 ; TEST
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_034_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_034_EQ_done
.Lleasp_034_EQ_true:
    cold_emit_char 'B'
.Lleasp_034_EQ_done:
    brne8 .Lleasp_034_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_034_NE_done
.Lleasp_034_NE_true:
    cold_emit_char 'B'
.Lleasp_034_NE_done:
    brult8 .Lleasp_034_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_034_ULT_done
.Lleasp_034_ULT_true:
    cold_emit_char 'B'
.Lleasp_034_ULT_done:
    bruge8 .Lleasp_034_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_034_UGE_done
.Lleasp_034_UGE_true:
    cold_emit_char 'B'
.Lleasp_034_UGE_done:
    brslt8 .Lleasp_034_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_034_SLT_done
.Lleasp_034_SLT_true:
    cold_emit_char 'B'
.Lleasp_034_SLT_done:
    brsge8 .Lleasp_034_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_034_SGE_done
.Lleasp_034_SGE_true:
    cold_emit_char 'B'
.Lleasp_034_SGE_done:
    cold_emit_char '\n'

    ; LEASP r7,128; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x510a
    push16 r4
    ldi16 r4, 0x522d
    push16 r4
    ldi16 r4, 0x5350
    push16 r4
    ldi16 r4, 0x5473
    push16 r4
    ldi16 r4, 0x5596
    push16 r4
    ldi16 r4, 0x56b9
    push16 r4
    ldi16 r4, 0xdedf
    push16 r4
    ldi16 r4, 0xba25
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r7, 128 ; TEST
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_035_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_035_EQ_done
.Lleasp_035_EQ_true:
    cold_emit_char 'B'
.Lleasp_035_EQ_done:
    brne8 .Lleasp_035_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_035_NE_done
.Lleasp_035_NE_true:
    cold_emit_char 'B'
.Lleasp_035_NE_done:
    brult8 .Lleasp_035_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_035_ULT_done
.Lleasp_035_ULT_true:
    cold_emit_char 'B'
.Lleasp_035_ULT_done:
    bruge8 .Lleasp_035_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_035_UGE_done
.Lleasp_035_UGE_true:
    cold_emit_char 'B'
.Lleasp_035_UGE_done:
    brslt8 .Lleasp_035_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_035_SLT_done
.Lleasp_035_SLT_true:
    cold_emit_char 'B'
.Lleasp_035_SLT_done:
    brsge8 .Lleasp_035_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_035_SGE_done
.Lleasp_035_SGE_true:
    cold_emit_char 'B'
.Lleasp_035_SGE_done:
    cold_emit_char '\n'

    ; LEASP r7,254; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x513f
    push16 r4
    ldi16 r4, 0x5262
    push16 r4
    ldi16 r4, 0x5385
    push16 r4
    ldi16 r4, 0x54a8
    push16 r4
    ldi16 r4, 0x55cb
    push16 r4
    ldi16 r4, 0x56ee
    push16 r4
    ldi16 r4, 0xdf22
    push16 r4
    ldi16 r4, 0xba56
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r7, 254 ; TEST
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_036_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_036_EQ_done
.Lleasp_036_EQ_true:
    cold_emit_char 'B'
.Lleasp_036_EQ_done:
    brne8 .Lleasp_036_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_036_NE_done
.Lleasp_036_NE_true:
    cold_emit_char 'B'
.Lleasp_036_NE_done:
    brult8 .Lleasp_036_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_036_ULT_done
.Lleasp_036_ULT_true:
    cold_emit_char 'B'
.Lleasp_036_ULT_done:
    bruge8 .Lleasp_036_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_036_UGE_done
.Lleasp_036_UGE_true:
    cold_emit_char 'B'
.Lleasp_036_UGE_done:
    brslt8 .Lleasp_036_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_036_SLT_done
.Lleasp_036_SLT_true:
    cold_emit_char 'B'
.Lleasp_036_SLT_done:
    brsge8 .Lleasp_036_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_036_SGE_done
.Lleasp_036_SGE_true:
    cold_emit_char 'B'
.Lleasp_036_SGE_done:
    cold_emit_char '\n'

    ; LEASP r7,255; full register and SP preservation.
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5174
    push16 r4
    ldi16 r4, 0x5297
    push16 r4
    ldi16 r4, 0x53ba
    push16 r4
    ldi16 r4, 0x54dd
    push16 r4
    ldi16 r4, 0x5600
    push16 r4
    ldi16 r4, 0x5723
    push16 r4
    ldi16 r4, 0xdf65
    push16 r4
    ldi16 r4, 0xba87
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    leasp r7, 255 ; TEST
    push16 r6
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    ldi16 r4, 0x02fe
    ld16 r5, [r4]
    mov r0, r5
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
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_037_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_037_EQ_done
.Lleasp_037_EQ_true:
    cold_emit_char 'B'
.Lleasp_037_EQ_done:
    brne8 .Lleasp_037_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_037_NE_done
.Lleasp_037_NE_true:
    cold_emit_char 'B'
.Lleasp_037_NE_done:
    brult8 .Lleasp_037_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_037_ULT_done
.Lleasp_037_ULT_true:
    cold_emit_char 'B'
.Lleasp_037_ULT_done:
    bruge8 .Lleasp_037_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_037_UGE_done
.Lleasp_037_UGE_true:
    cold_emit_char 'B'
.Lleasp_037_UGE_done:
    brslt8 .Lleasp_037_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_037_SLT_done
.Lleasp_037_SLT_true:
    cold_emit_char 'B'
.Lleasp_037_SLT_done:
    brsge8 .Lleasp_037_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_037_SGE_done
.Lleasp_037_SGE_true:
    cold_emit_char 'B'
.Lleasp_037_SGE_done:
    cold_emit_char '\n'

    ; Explicit wrap: 0xfff0 + 0x20 = 0x0010.
    ldi16 r4, 0x0900
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xbeef
    push16 r4
    ldi16 r4, 0xcafe
    push16 r4
    ldi16 r4, 0x8657
    push16 r4
    ldi16 r4, 0x877a
    push16 r4
    ldi16 r4, 0x889d
    push16 r4
    ldi16 r4, 0x89c0
    push16 r4
    ldi16 r4, 0x8ae3
    push16 r4
    ldi16 r4, 0x8c06
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    ldi16 r4, 0xfff0
    setsp r4
    leasp r0, 32 ; TEST
    getsp r2
    ldi16 r4, 0x0900
    setsp r4
    push16 r2
    push16 r1
    push16 r0
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    pop16 r0
    call cold_print_r0_line
    breq8 .Lleasp_wrap_EQ_true
    cold_emit_char 'A'
    jmp8 .Lleasp_wrap_EQ_done
.Lleasp_wrap_EQ_true:
    cold_emit_char 'B'
.Lleasp_wrap_EQ_done:
    brne8 .Lleasp_wrap_NE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_wrap_NE_done
.Lleasp_wrap_NE_true:
    cold_emit_char 'B'
.Lleasp_wrap_NE_done:
    brult8 .Lleasp_wrap_ULT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_wrap_ULT_done
.Lleasp_wrap_ULT_true:
    cold_emit_char 'B'
.Lleasp_wrap_ULT_done:
    bruge8 .Lleasp_wrap_UGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_wrap_UGE_done
.Lleasp_wrap_UGE_true:
    cold_emit_char 'B'
.Lleasp_wrap_UGE_done:
    brslt8 .Lleasp_wrap_SLT_true
    cold_emit_char 'A'
    jmp8 .Lleasp_wrap_SLT_done
.Lleasp_wrap_SLT_true:
    cold_emit_char 'B'
.Lleasp_wrap_SLT_done:
    brsge8 .Lleasp_wrap_SGE_true
    cold_emit_char 'A'
    jmp8 .Lleasp_wrap_SGE_done
.Lleasp_wrap_SGE_true:
    cold_emit_char 'B'
.Lleasp_wrap_SGE_done:
    cold_emit_char '\n'

    sys debug_break
