.include "include/secondary_memory_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi16 r4, 0x0600
    ldi8 r5, 0x20
    st8 [r4], r5
    ldi16 r4, 0x0601
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x0603
    ldi8 r5, 0xd0
    st8 [r4], r5

    ; MIXED pointer r4, data r0, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x9100
    push16 r5
    pop16 r0
    ldi16 r5, 0x5301
    push16 r5
    pop16 r1
    ldi16 r4, 0x0601
    ld16 r0, [r4]
    push16 r0
    push16 r4
    push16 r1
    ldi16 r4, 0x0600
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0602
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_000_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_000_EQ_done
.Lld16_full_000_EQ_true:
    mem_emit_char 'B'
.Lld16_full_000_EQ_done:
    brne8 .Lld16_full_000_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_000_NE_done
.Lld16_full_000_NE_true:
    mem_emit_char 'B'
.Lld16_full_000_NE_done:
    brult8 .Lld16_full_000_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_000_ULT_done
.Lld16_full_000_ULT_true:
    mem_emit_char 'B'
.Lld16_full_000_ULT_done:
    bruge8 .Lld16_full_000_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_000_UGE_done
.Lld16_full_000_UGE_true:
    mem_emit_char 'B'
.Lld16_full_000_UGE_done:
    brslt8 .Lld16_full_000_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_000_SLT_done
.Lld16_full_000_SLT_true:
    mem_emit_char 'B'
.Lld16_full_000_SLT_done:
    brsge8 .Lld16_full_000_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_000_SGE_done
.Lld16_full_000_SGE_true:
    mem_emit_char 'B'
.Lld16_full_000_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0604
    ldi8 r5, 0x27
    st8 [r4], r5
    ldi16 r4, 0x0605
    ldi16 r5, 0x00ff
    st16 [r4], r5
    ldi16 r4, 0x0607
    ldi8 r5, 0xd5
    st8 [r4], r5

    ; MIXED pointer r4, data r0, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x9137
    push16 r5
    pop16 r0
    ldi16 r5, 0x5445
    push16 r5
    pop16 r2
    ldi16 r4, 0x0605
    ld16 r0, [r4]
    push16 r0
    push16 r4
    push16 r2
    ldi16 r4, 0x0604
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0606
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_001_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_001_EQ_done
.Lld16_full_001_EQ_true:
    mem_emit_char 'B'
.Lld16_full_001_EQ_done:
    brne8 .Lld16_full_001_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_001_NE_done
.Lld16_full_001_NE_true:
    mem_emit_char 'B'
.Lld16_full_001_NE_done:
    brult8 .Lld16_full_001_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_001_ULT_done
.Lld16_full_001_ULT_true:
    mem_emit_char 'B'
.Lld16_full_001_ULT_done:
    bruge8 .Lld16_full_001_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_001_UGE_done
.Lld16_full_001_UGE_true:
    mem_emit_char 'B'
.Lld16_full_001_UGE_done:
    brslt8 .Lld16_full_001_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_001_SLT_done
.Lld16_full_001_SLT_true:
    mem_emit_char 'B'
.Lld16_full_001_SLT_done:
    brsge8 .Lld16_full_001_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_001_SGE_done
.Lld16_full_001_SGE_true:
    mem_emit_char 'B'
.Lld16_full_001_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0608
    ldi8 r5, 0x2e
    st8 [r4], r5
    ldi16 r4, 0x0609
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x060b
    ldi8 r5, 0xdb
    st8 [r4], r5

    ; MIXED pointer r4, data r1, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x916f
    push16 r5
    pop16 r1
    ldi16 r5, 0x5589
    push16 r5
    pop16 r3
    ldi16 r4, 0x0609
    ld16 r1, [r4]
    push16 r1
    push16 r4
    push16 r3
    ldi16 r4, 0x0608
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x060a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_002_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_002_EQ_done
.Lld16_full_002_EQ_true:
    mem_emit_char 'B'
.Lld16_full_002_EQ_done:
    brne8 .Lld16_full_002_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_002_NE_done
.Lld16_full_002_NE_true:
    mem_emit_char 'B'
.Lld16_full_002_NE_done:
    brult8 .Lld16_full_002_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_002_ULT_done
.Lld16_full_002_ULT_true:
    mem_emit_char 'B'
.Lld16_full_002_ULT_done:
    bruge8 .Lld16_full_002_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_002_UGE_done
.Lld16_full_002_UGE_true:
    mem_emit_char 'B'
.Lld16_full_002_UGE_done:
    brslt8 .Lld16_full_002_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_002_SLT_done
.Lld16_full_002_SLT_true:
    mem_emit_char 'B'
.Lld16_full_002_SLT_done:
    brsge8 .Lld16_full_002_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_002_SGE_done
.Lld16_full_002_SGE_true:
    mem_emit_char 'B'
.Lld16_full_002_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x060c
    ldi8 r5, 0x35
    st8 [r4], r5
    ldi16 r4, 0x060d
    ldi16 r5, 0x8000
    st16 [r4], r5
    ldi16 r4, 0x060f
    ldi8 r5, 0xe0
    st8 [r4], r5

    ; MIXED pointer r4, data r1, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r5, 0x91a6
    push16 r5
    pop16 r1
    ldi16 r5, 0x52c9
    push16 r5
    pop16 r0
    ldi16 r4, 0x060d
    ld16 r1, [r4]
    push16 r1
    push16 r4
    push16 r0
    ldi16 r4, 0x060c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x060e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_003_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_003_EQ_done
.Lld16_full_003_EQ_true:
    mem_emit_char 'B'
.Lld16_full_003_EQ_done:
    brne8 .Lld16_full_003_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_003_NE_done
.Lld16_full_003_NE_true:
    mem_emit_char 'B'
.Lld16_full_003_NE_done:
    brult8 .Lld16_full_003_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_003_ULT_done
.Lld16_full_003_ULT_true:
    mem_emit_char 'B'
.Lld16_full_003_ULT_done:
    bruge8 .Lld16_full_003_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_003_UGE_done
.Lld16_full_003_UGE_true:
    mem_emit_char 'B'
.Lld16_full_003_UGE_done:
    brslt8 .Lld16_full_003_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_003_SLT_done
.Lld16_full_003_SLT_true:
    mem_emit_char 'B'
.Lld16_full_003_SLT_done:
    brsge8 .Lld16_full_003_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_003_SGE_done
.Lld16_full_003_SGE_true:
    mem_emit_char 'B'
.Lld16_full_003_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0610
    ldi8 r5, 0x3c
    st8 [r4], r5
    ldi16 r4, 0x0611
    ldi16 r5, 0xffff
    st16 [r4], r5
    ldi16 r4, 0x0613
    ldi8 r5, 0xe6
    st8 [r4], r5

    ; MIXED pointer r4, data r2, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x91de
    push16 r5
    pop16 r2
    ldi16 r5, 0x540d
    push16 r5
    pop16 r1
    ldi16 r4, 0x0611
    ld16 r2, [r4]
    push16 r2
    push16 r4
    push16 r1
    ldi16 r4, 0x0610
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0612
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_004_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_004_EQ_done
.Lld16_full_004_EQ_true:
    mem_emit_char 'B'
.Lld16_full_004_EQ_done:
    brne8 .Lld16_full_004_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_004_NE_done
.Lld16_full_004_NE_true:
    mem_emit_char 'B'
.Lld16_full_004_NE_done:
    brult8 .Lld16_full_004_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_004_ULT_done
.Lld16_full_004_ULT_true:
    mem_emit_char 'B'
.Lld16_full_004_ULT_done:
    bruge8 .Lld16_full_004_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_004_UGE_done
.Lld16_full_004_UGE_true:
    mem_emit_char 'B'
.Lld16_full_004_UGE_done:
    brslt8 .Lld16_full_004_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_004_SLT_done
.Lld16_full_004_SLT_true:
    mem_emit_char 'B'
.Lld16_full_004_SLT_done:
    brsge8 .Lld16_full_004_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_004_SGE_done
.Lld16_full_004_SGE_true:
    mem_emit_char 'B'
.Lld16_full_004_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0614
    ldi8 r5, 0x43
    st8 [r4], r5
    ldi16 r4, 0x0615
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x0617
    ldi8 r5, 0xeb
    st8 [r4], r5

    ; MIXED pointer r4, data r2, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r5, 0x9215
    push16 r5
    pop16 r2
    ldi16 r5, 0x5652
    push16 r5
    pop16 r3
    ldi16 r4, 0x0615
    ld16 r2, [r4]
    push16 r2
    push16 r4
    push16 r3
    ldi16 r4, 0x0614
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0616
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_005_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_005_EQ_done
.Lld16_full_005_EQ_true:
    mem_emit_char 'B'
.Lld16_full_005_EQ_done:
    brne8 .Lld16_full_005_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_005_NE_done
.Lld16_full_005_NE_true:
    mem_emit_char 'B'
.Lld16_full_005_NE_done:
    brult8 .Lld16_full_005_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_005_ULT_done
.Lld16_full_005_ULT_true:
    mem_emit_char 'B'
.Lld16_full_005_ULT_done:
    bruge8 .Lld16_full_005_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_005_UGE_done
.Lld16_full_005_UGE_true:
    mem_emit_char 'B'
.Lld16_full_005_UGE_done:
    brslt8 .Lld16_full_005_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_005_SLT_done
.Lld16_full_005_SLT_true:
    mem_emit_char 'B'
.Lld16_full_005_SLT_done:
    brsge8 .Lld16_full_005_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_005_SGE_done
.Lld16_full_005_SGE_true:
    mem_emit_char 'B'
.Lld16_full_005_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0618
    ldi8 r5, 0x4a
    st8 [r4], r5
    ldi16 r4, 0x0619
    ldi16 r5, 0x0001
    st16 [r4], r5
    ldi16 r4, 0x061b
    ldi8 r5, 0xf1
    st8 [r4], r5

    ; MIXED pointer r4, data r3, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r5, 0x924d
    push16 r5
    pop16 r3
    ldi16 r5, 0x5392
    push16 r5
    pop16 r0
    ldi16 r4, 0x0619
    ld16 r3, [r4]
    push16 r3
    push16 r4
    push16 r0
    ldi16 r4, 0x0618
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x061a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_006_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_006_EQ_done
.Lld16_full_006_EQ_true:
    mem_emit_char 'B'
.Lld16_full_006_EQ_done:
    brne8 .Lld16_full_006_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_006_NE_done
.Lld16_full_006_NE_true:
    mem_emit_char 'B'
.Lld16_full_006_NE_done:
    brult8 .Lld16_full_006_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_006_ULT_done
.Lld16_full_006_ULT_true:
    mem_emit_char 'B'
.Lld16_full_006_ULT_done:
    bruge8 .Lld16_full_006_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_006_UGE_done
.Lld16_full_006_UGE_true:
    mem_emit_char 'B'
.Lld16_full_006_UGE_done:
    brslt8 .Lld16_full_006_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_006_SLT_done
.Lld16_full_006_SLT_true:
    mem_emit_char 'B'
.Lld16_full_006_SLT_done:
    brsge8 .Lld16_full_006_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_006_SGE_done
.Lld16_full_006_SGE_true:
    mem_emit_char 'B'
.Lld16_full_006_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x061c
    ldi8 r5, 0x51
    st8 [r4], r5
    ldi16 r4, 0x061d
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x061f
    ldi8 r5, 0xf6
    st8 [r4], r5

    ; MIXED pointer r4, data r3, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r5, 0x9284
    push16 r5
    pop16 r3
    ldi16 r5, 0x53d5
    push16 r5
    pop16 r0
    ldi16 r4, 0x061d
    ld16 r3, [r4]
    push16 r3
    push16 r4
    push16 r0
    ldi16 r4, 0x061c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x061e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_007_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_007_EQ_done
.Lld16_full_007_EQ_true:
    mem_emit_char 'B'
.Lld16_full_007_EQ_done:
    brne8 .Lld16_full_007_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_007_NE_done
.Lld16_full_007_NE_true:
    mem_emit_char 'B'
.Lld16_full_007_NE_done:
    brult8 .Lld16_full_007_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_007_ULT_done
.Lld16_full_007_ULT_true:
    mem_emit_char 'B'
.Lld16_full_007_ULT_done:
    bruge8 .Lld16_full_007_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_007_UGE_done
.Lld16_full_007_UGE_true:
    mem_emit_char 'B'
.Lld16_full_007_UGE_done:
    brslt8 .Lld16_full_007_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_007_SLT_done
.Lld16_full_007_SLT_true:
    mem_emit_char 'B'
.Lld16_full_007_SLT_done:
    brsge8 .Lld16_full_007_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_007_SGE_done
.Lld16_full_007_SGE_true:
    mem_emit_char 'B'
.Lld16_full_007_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0620
    ldi8 r5, 0x59
    st8 [r4], r5
    ldi16 r4, 0x0621
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x0623
    ldi8 r5, 0xf8
    st8 [r4], r5

    ; MIXED pointer r5, data r0, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x92b8
    push16 r4
    pop16 r0
    ldi16 r4, 0x5519
    push16 r4
    pop16 r1
    ldi16 r5, 0x0621
    ld16 r0, [r5]
    push16 r0
    push16 r5
    push16 r1
    ldi16 r4, 0x0620
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0622
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_008_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_008_EQ_done
.Lld16_full_008_EQ_true:
    mem_emit_char 'B'
.Lld16_full_008_EQ_done:
    brne8 .Lld16_full_008_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_008_NE_done
.Lld16_full_008_NE_true:
    mem_emit_char 'B'
.Lld16_full_008_NE_done:
    brult8 .Lld16_full_008_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_008_ULT_done
.Lld16_full_008_ULT_true:
    mem_emit_char 'B'
.Lld16_full_008_ULT_done:
    bruge8 .Lld16_full_008_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_008_UGE_done
.Lld16_full_008_UGE_true:
    mem_emit_char 'B'
.Lld16_full_008_UGE_done:
    brslt8 .Lld16_full_008_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_008_SLT_done
.Lld16_full_008_SLT_true:
    mem_emit_char 'B'
.Lld16_full_008_SLT_done:
    brsge8 .Lld16_full_008_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_008_SGE_done
.Lld16_full_008_SGE_true:
    mem_emit_char 'B'
.Lld16_full_008_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0624
    ldi8 r5, 0x60
    st8 [r4], r5
    ldi16 r4, 0x0625
    ldi16 r5, 0x00ff
    st16 [r4], r5
    ldi16 r4, 0x0627
    ldi8 r5, 0xfd
    st8 [r4], r5

    ; MIXED pointer r5, data r0, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x92ef
    push16 r4
    pop16 r0
    ldi16 r4, 0x565d
    push16 r4
    pop16 r2
    ldi16 r5, 0x0625
    ld16 r0, [r5]
    push16 r0
    push16 r5
    push16 r2
    ldi16 r4, 0x0624
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0626
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_009_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_009_EQ_done
.Lld16_full_009_EQ_true:
    mem_emit_char 'B'
.Lld16_full_009_EQ_done:
    brne8 .Lld16_full_009_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_009_NE_done
.Lld16_full_009_NE_true:
    mem_emit_char 'B'
.Lld16_full_009_NE_done:
    brult8 .Lld16_full_009_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_009_ULT_done
.Lld16_full_009_ULT_true:
    mem_emit_char 'B'
.Lld16_full_009_ULT_done:
    bruge8 .Lld16_full_009_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_009_UGE_done
.Lld16_full_009_UGE_true:
    mem_emit_char 'B'
.Lld16_full_009_UGE_done:
    brslt8 .Lld16_full_009_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_009_SLT_done
.Lld16_full_009_SLT_true:
    mem_emit_char 'B'
.Lld16_full_009_SLT_done:
    brsge8 .Lld16_full_009_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_009_SGE_done
.Lld16_full_009_SGE_true:
    mem_emit_char 'B'
.Lld16_full_009_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0628
    ldi8 r5, 0x67
    st8 [r4], r5
    ldi16 r4, 0x0629
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x062b
    ldi8 r5, 0x03
    st8 [r4], r5

    ; MIXED pointer r5, data r1, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x9327
    push16 r4
    pop16 r1
    ldi16 r4, 0x57a1
    push16 r4
    pop16 r3
    ldi16 r5, 0x0629
    ld16 r1, [r5]
    push16 r1
    push16 r5
    push16 r3
    ldi16 r4, 0x0628
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x062a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_00a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00a_EQ_done
.Lld16_full_00a_EQ_true:
    mem_emit_char 'B'
.Lld16_full_00a_EQ_done:
    brne8 .Lld16_full_00a_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00a_NE_done
.Lld16_full_00a_NE_true:
    mem_emit_char 'B'
.Lld16_full_00a_NE_done:
    brult8 .Lld16_full_00a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00a_ULT_done
.Lld16_full_00a_ULT_true:
    mem_emit_char 'B'
.Lld16_full_00a_ULT_done:
    bruge8 .Lld16_full_00a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00a_UGE_done
.Lld16_full_00a_UGE_true:
    mem_emit_char 'B'
.Lld16_full_00a_UGE_done:
    brslt8 .Lld16_full_00a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00a_SLT_done
.Lld16_full_00a_SLT_true:
    mem_emit_char 'B'
.Lld16_full_00a_SLT_done:
    brsge8 .Lld16_full_00a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00a_SGE_done
.Lld16_full_00a_SGE_true:
    mem_emit_char 'B'
.Lld16_full_00a_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x062c
    ldi8 r5, 0x6e
    st8 [r4], r5
    ldi16 r4, 0x062d
    ldi16 r5, 0x8000
    st16 [r4], r5
    ldi16 r4, 0x062f
    ldi8 r5, 0x08
    st8 [r4], r5

    ; MIXED pointer r5, data r1, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x935e
    push16 r4
    pop16 r1
    ldi16 r4, 0x54e1
    push16 r4
    pop16 r0
    ldi16 r5, 0x062d
    ld16 r1, [r5]
    push16 r1
    push16 r5
    push16 r0
    ldi16 r4, 0x062c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x062e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_00b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00b_EQ_done
.Lld16_full_00b_EQ_true:
    mem_emit_char 'B'
.Lld16_full_00b_EQ_done:
    brne8 .Lld16_full_00b_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00b_NE_done
.Lld16_full_00b_NE_true:
    mem_emit_char 'B'
.Lld16_full_00b_NE_done:
    brult8 .Lld16_full_00b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00b_ULT_done
.Lld16_full_00b_ULT_true:
    mem_emit_char 'B'
.Lld16_full_00b_ULT_done:
    bruge8 .Lld16_full_00b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00b_UGE_done
.Lld16_full_00b_UGE_true:
    mem_emit_char 'B'
.Lld16_full_00b_UGE_done:
    brslt8 .Lld16_full_00b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00b_SLT_done
.Lld16_full_00b_SLT_true:
    mem_emit_char 'B'
.Lld16_full_00b_SLT_done:
    brsge8 .Lld16_full_00b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00b_SGE_done
.Lld16_full_00b_SGE_true:
    mem_emit_char 'B'
.Lld16_full_00b_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0630
    ldi8 r5, 0x75
    st8 [r4], r5
    ldi16 r4, 0x0631
    ldi16 r5, 0xffff
    st16 [r4], r5
    ldi16 r4, 0x0633
    ldi8 r5, 0x0e
    st8 [r4], r5

    ; MIXED pointer r5, data r2, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x9396
    push16 r4
    pop16 r2
    ldi16 r4, 0x5625
    push16 r4
    pop16 r1
    ldi16 r5, 0x0631
    ld16 r2, [r5]
    push16 r2
    push16 r5
    push16 r1
    ldi16 r4, 0x0630
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0632
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_00c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00c_EQ_done
.Lld16_full_00c_EQ_true:
    mem_emit_char 'B'
.Lld16_full_00c_EQ_done:
    brne8 .Lld16_full_00c_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00c_NE_done
.Lld16_full_00c_NE_true:
    mem_emit_char 'B'
.Lld16_full_00c_NE_done:
    brult8 .Lld16_full_00c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00c_ULT_done
.Lld16_full_00c_ULT_true:
    mem_emit_char 'B'
.Lld16_full_00c_ULT_done:
    bruge8 .Lld16_full_00c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00c_UGE_done
.Lld16_full_00c_UGE_true:
    mem_emit_char 'B'
.Lld16_full_00c_UGE_done:
    brslt8 .Lld16_full_00c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00c_SLT_done
.Lld16_full_00c_SLT_true:
    mem_emit_char 'B'
.Lld16_full_00c_SLT_done:
    brsge8 .Lld16_full_00c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00c_SGE_done
.Lld16_full_00c_SGE_true:
    mem_emit_char 'B'
.Lld16_full_00c_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0634
    ldi8 r5, 0x7c
    st8 [r4], r5
    ldi16 r4, 0x0635
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x0637
    ldi8 r5, 0x13
    st8 [r4], r5

    ; MIXED pointer r5, data r2, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x93cd
    push16 r4
    pop16 r2
    ldi16 r4, 0x586a
    push16 r4
    pop16 r3
    ldi16 r5, 0x0635
    ld16 r2, [r5]
    push16 r2
    push16 r5
    push16 r3
    ldi16 r4, 0x0634
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0636
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_00d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00d_EQ_done
.Lld16_full_00d_EQ_true:
    mem_emit_char 'B'
.Lld16_full_00d_EQ_done:
    brne8 .Lld16_full_00d_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00d_NE_done
.Lld16_full_00d_NE_true:
    mem_emit_char 'B'
.Lld16_full_00d_NE_done:
    brult8 .Lld16_full_00d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00d_ULT_done
.Lld16_full_00d_ULT_true:
    mem_emit_char 'B'
.Lld16_full_00d_ULT_done:
    bruge8 .Lld16_full_00d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00d_UGE_done
.Lld16_full_00d_UGE_true:
    mem_emit_char 'B'
.Lld16_full_00d_UGE_done:
    brslt8 .Lld16_full_00d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00d_SLT_done
.Lld16_full_00d_SLT_true:
    mem_emit_char 'B'
.Lld16_full_00d_SLT_done:
    brsge8 .Lld16_full_00d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00d_SGE_done
.Lld16_full_00d_SGE_true:
    mem_emit_char 'B'
.Lld16_full_00d_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0638
    ldi8 r5, 0x83
    st8 [r4], r5
    ldi16 r4, 0x0639
    ldi16 r5, 0x0001
    st16 [r4], r5
    ldi16 r4, 0x063b
    ldi8 r5, 0x19
    st8 [r4], r5

    ; MIXED pointer r5, data r3, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x9405
    push16 r4
    pop16 r3
    ldi16 r4, 0x55aa
    push16 r4
    pop16 r0
    ldi16 r5, 0x0639
    ld16 r3, [r5]
    push16 r3
    push16 r5
    push16 r0
    ldi16 r4, 0x0638
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x063a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_00e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00e_EQ_done
.Lld16_full_00e_EQ_true:
    mem_emit_char 'B'
.Lld16_full_00e_EQ_done:
    brne8 .Lld16_full_00e_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00e_NE_done
.Lld16_full_00e_NE_true:
    mem_emit_char 'B'
.Lld16_full_00e_NE_done:
    brult8 .Lld16_full_00e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00e_ULT_done
.Lld16_full_00e_ULT_true:
    mem_emit_char 'B'
.Lld16_full_00e_ULT_done:
    bruge8 .Lld16_full_00e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00e_UGE_done
.Lld16_full_00e_UGE_true:
    mem_emit_char 'B'
.Lld16_full_00e_UGE_done:
    brslt8 .Lld16_full_00e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00e_SLT_done
.Lld16_full_00e_SLT_true:
    mem_emit_char 'B'
.Lld16_full_00e_SLT_done:
    brsge8 .Lld16_full_00e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00e_SGE_done
.Lld16_full_00e_SGE_true:
    mem_emit_char 'B'
.Lld16_full_00e_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x063c
    ldi8 r5, 0x8a
    st8 [r4], r5
    ldi16 r4, 0x063d
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x063f
    ldi8 r5, 0x1e
    st8 [r4], r5

    ; MIXED pointer r5, data r3, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x943c
    push16 r4
    pop16 r3
    ldi16 r4, 0x55ed
    push16 r4
    pop16 r0
    ldi16 r5, 0x063d
    ld16 r3, [r5]
    push16 r3
    push16 r5
    push16 r0
    ldi16 r4, 0x063c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x063e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_00f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00f_EQ_done
.Lld16_full_00f_EQ_true:
    mem_emit_char 'B'
.Lld16_full_00f_EQ_done:
    brne8 .Lld16_full_00f_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00f_NE_done
.Lld16_full_00f_NE_true:
    mem_emit_char 'B'
.Lld16_full_00f_NE_done:
    brult8 .Lld16_full_00f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00f_ULT_done
.Lld16_full_00f_ULT_true:
    mem_emit_char 'B'
.Lld16_full_00f_ULT_done:
    bruge8 .Lld16_full_00f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00f_UGE_done
.Lld16_full_00f_UGE_true:
    mem_emit_char 'B'
.Lld16_full_00f_UGE_done:
    brslt8 .Lld16_full_00f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00f_SLT_done
.Lld16_full_00f_SLT_true:
    mem_emit_char 'B'
.Lld16_full_00f_SLT_done:
    brsge8 .Lld16_full_00f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_00f_SGE_done
.Lld16_full_00f_SGE_true:
    mem_emit_char 'B'
.Lld16_full_00f_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0640
    ldi8 r5, 0x92
    st8 [r4], r5
    ldi16 r4, 0x0641
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x0643
    ldi8 r5, 0x20
    st8 [r4], r5

    ; MIXED pointer r6, data r0, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x9470
    push16 r4
    pop16 r0
    ldi16 r4, 0x5731
    push16 r4
    pop16 r1
    ldi16 r6, 0x0641
    ld16 r0, [r6]
    push16 r0
    push16 r6
    push16 r1
    ldi16 r4, 0x0640
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0642
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_010_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_010_EQ_done
.Lld16_full_010_EQ_true:
    mem_emit_char 'B'
.Lld16_full_010_EQ_done:
    brne8 .Lld16_full_010_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_010_NE_done
.Lld16_full_010_NE_true:
    mem_emit_char 'B'
.Lld16_full_010_NE_done:
    brult8 .Lld16_full_010_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_010_ULT_done
.Lld16_full_010_ULT_true:
    mem_emit_char 'B'
.Lld16_full_010_ULT_done:
    bruge8 .Lld16_full_010_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_010_UGE_done
.Lld16_full_010_UGE_true:
    mem_emit_char 'B'
.Lld16_full_010_UGE_done:
    brslt8 .Lld16_full_010_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_010_SLT_done
.Lld16_full_010_SLT_true:
    mem_emit_char 'B'
.Lld16_full_010_SLT_done:
    brsge8 .Lld16_full_010_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_010_SGE_done
.Lld16_full_010_SGE_true:
    mem_emit_char 'B'
.Lld16_full_010_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0644
    ldi8 r5, 0x99
    st8 [r4], r5
    ldi16 r4, 0x0645
    ldi16 r5, 0x00ff
    st16 [r4], r5
    ldi16 r4, 0x0647
    ldi8 r5, 0x25
    st8 [r4], r5

    ; MIXED pointer r6, data r0, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x94a7
    push16 r4
    pop16 r0
    ldi16 r4, 0x5875
    push16 r4
    pop16 r2
    ldi16 r6, 0x0645
    ld16 r0, [r6]
    push16 r0
    push16 r6
    push16 r2
    ldi16 r4, 0x0644
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0646
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_011_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_011_EQ_done
.Lld16_full_011_EQ_true:
    mem_emit_char 'B'
.Lld16_full_011_EQ_done:
    brne8 .Lld16_full_011_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_011_NE_done
.Lld16_full_011_NE_true:
    mem_emit_char 'B'
.Lld16_full_011_NE_done:
    brult8 .Lld16_full_011_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_011_ULT_done
.Lld16_full_011_ULT_true:
    mem_emit_char 'B'
.Lld16_full_011_ULT_done:
    bruge8 .Lld16_full_011_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_011_UGE_done
.Lld16_full_011_UGE_true:
    mem_emit_char 'B'
.Lld16_full_011_UGE_done:
    brslt8 .Lld16_full_011_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_011_SLT_done
.Lld16_full_011_SLT_true:
    mem_emit_char 'B'
.Lld16_full_011_SLT_done:
    brsge8 .Lld16_full_011_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_011_SGE_done
.Lld16_full_011_SGE_true:
    mem_emit_char 'B'
.Lld16_full_011_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0648
    ldi8 r5, 0xa0
    st8 [r4], r5
    ldi16 r4, 0x0649
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x064b
    ldi8 r5, 0x2b
    st8 [r4], r5

    ; MIXED pointer r6, data r1, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x94df
    push16 r4
    pop16 r1
    ldi16 r4, 0x59b9
    push16 r4
    pop16 r3
    ldi16 r6, 0x0649
    ld16 r1, [r6]
    push16 r1
    push16 r6
    push16 r3
    ldi16 r4, 0x0648
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x064a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_012_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_012_EQ_done
.Lld16_full_012_EQ_true:
    mem_emit_char 'B'
.Lld16_full_012_EQ_done:
    brne8 .Lld16_full_012_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_012_NE_done
.Lld16_full_012_NE_true:
    mem_emit_char 'B'
.Lld16_full_012_NE_done:
    brult8 .Lld16_full_012_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_012_ULT_done
.Lld16_full_012_ULT_true:
    mem_emit_char 'B'
.Lld16_full_012_ULT_done:
    bruge8 .Lld16_full_012_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_012_UGE_done
.Lld16_full_012_UGE_true:
    mem_emit_char 'B'
.Lld16_full_012_UGE_done:
    brslt8 .Lld16_full_012_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_012_SLT_done
.Lld16_full_012_SLT_true:
    mem_emit_char 'B'
.Lld16_full_012_SLT_done:
    brsge8 .Lld16_full_012_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_012_SGE_done
.Lld16_full_012_SGE_true:
    mem_emit_char 'B'
.Lld16_full_012_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x064c
    ldi8 r5, 0xa7
    st8 [r4], r5
    ldi16 r4, 0x064d
    ldi16 r5, 0x8000
    st16 [r4], r5
    ldi16 r4, 0x064f
    ldi8 r5, 0x30
    st8 [r4], r5

    ; MIXED pointer r6, data r1, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x9516
    push16 r4
    pop16 r1
    ldi16 r4, 0x56f9
    push16 r4
    pop16 r0
    ldi16 r6, 0x064d
    ld16 r1, [r6]
    push16 r1
    push16 r6
    push16 r0
    ldi16 r4, 0x064c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x064e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_013_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_013_EQ_done
.Lld16_full_013_EQ_true:
    mem_emit_char 'B'
.Lld16_full_013_EQ_done:
    brne8 .Lld16_full_013_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_013_NE_done
.Lld16_full_013_NE_true:
    mem_emit_char 'B'
.Lld16_full_013_NE_done:
    brult8 .Lld16_full_013_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_013_ULT_done
.Lld16_full_013_ULT_true:
    mem_emit_char 'B'
.Lld16_full_013_ULT_done:
    bruge8 .Lld16_full_013_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_013_UGE_done
.Lld16_full_013_UGE_true:
    mem_emit_char 'B'
.Lld16_full_013_UGE_done:
    brslt8 .Lld16_full_013_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_013_SLT_done
.Lld16_full_013_SLT_true:
    mem_emit_char 'B'
.Lld16_full_013_SLT_done:
    brsge8 .Lld16_full_013_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_013_SGE_done
.Lld16_full_013_SGE_true:
    mem_emit_char 'B'
.Lld16_full_013_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0650
    ldi8 r5, 0xae
    st8 [r4], r5
    ldi16 r4, 0x0651
    ldi16 r5, 0xffff
    st16 [r4], r5
    ldi16 r4, 0x0653
    ldi8 r5, 0x36
    st8 [r4], r5

    ; MIXED pointer r6, data r2, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x954e
    push16 r4
    pop16 r2
    ldi16 r4, 0x583d
    push16 r4
    pop16 r1
    ldi16 r6, 0x0651
    ld16 r2, [r6]
    push16 r2
    push16 r6
    push16 r1
    ldi16 r4, 0x0650
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0652
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_014_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_014_EQ_done
.Lld16_full_014_EQ_true:
    mem_emit_char 'B'
.Lld16_full_014_EQ_done:
    brne8 .Lld16_full_014_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_014_NE_done
.Lld16_full_014_NE_true:
    mem_emit_char 'B'
.Lld16_full_014_NE_done:
    brult8 .Lld16_full_014_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_014_ULT_done
.Lld16_full_014_ULT_true:
    mem_emit_char 'B'
.Lld16_full_014_ULT_done:
    bruge8 .Lld16_full_014_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_014_UGE_done
.Lld16_full_014_UGE_true:
    mem_emit_char 'B'
.Lld16_full_014_UGE_done:
    brslt8 .Lld16_full_014_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_014_SLT_done
.Lld16_full_014_SLT_true:
    mem_emit_char 'B'
.Lld16_full_014_SLT_done:
    brsge8 .Lld16_full_014_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_014_SGE_done
.Lld16_full_014_SGE_true:
    mem_emit_char 'B'
.Lld16_full_014_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0654
    ldi8 r5, 0xb5
    st8 [r4], r5
    ldi16 r4, 0x0655
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x0657
    ldi8 r5, 0x3b
    st8 [r4], r5

    ; MIXED pointer r6, data r2, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x9585
    push16 r4
    pop16 r2
    ldi16 r4, 0x5a82
    push16 r4
    pop16 r3
    ldi16 r6, 0x0655
    ld16 r2, [r6]
    push16 r2
    push16 r6
    push16 r3
    ldi16 r4, 0x0654
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0656
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_015_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_015_EQ_done
.Lld16_full_015_EQ_true:
    mem_emit_char 'B'
.Lld16_full_015_EQ_done:
    brne8 .Lld16_full_015_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_015_NE_done
.Lld16_full_015_NE_true:
    mem_emit_char 'B'
.Lld16_full_015_NE_done:
    brult8 .Lld16_full_015_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_015_ULT_done
.Lld16_full_015_ULT_true:
    mem_emit_char 'B'
.Lld16_full_015_ULT_done:
    bruge8 .Lld16_full_015_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_015_UGE_done
.Lld16_full_015_UGE_true:
    mem_emit_char 'B'
.Lld16_full_015_UGE_done:
    brslt8 .Lld16_full_015_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_015_SLT_done
.Lld16_full_015_SLT_true:
    mem_emit_char 'B'
.Lld16_full_015_SLT_done:
    brsge8 .Lld16_full_015_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_015_SGE_done
.Lld16_full_015_SGE_true:
    mem_emit_char 'B'
.Lld16_full_015_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0658
    ldi8 r5, 0xbc
    st8 [r4], r5
    ldi16 r4, 0x0659
    ldi16 r5, 0x0001
    st16 [r4], r5
    ldi16 r4, 0x065b
    ldi8 r5, 0x41
    st8 [r4], r5

    ; MIXED pointer r6, data r3, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x95bd
    push16 r4
    pop16 r3
    ldi16 r4, 0x57c2
    push16 r4
    pop16 r0
    ldi16 r6, 0x0659
    ld16 r3, [r6]
    push16 r3
    push16 r6
    push16 r0
    ldi16 r4, 0x0658
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x065a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_016_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_016_EQ_done
.Lld16_full_016_EQ_true:
    mem_emit_char 'B'
.Lld16_full_016_EQ_done:
    brne8 .Lld16_full_016_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_016_NE_done
.Lld16_full_016_NE_true:
    mem_emit_char 'B'
.Lld16_full_016_NE_done:
    brult8 .Lld16_full_016_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_016_ULT_done
.Lld16_full_016_ULT_true:
    mem_emit_char 'B'
.Lld16_full_016_ULT_done:
    bruge8 .Lld16_full_016_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_016_UGE_done
.Lld16_full_016_UGE_true:
    mem_emit_char 'B'
.Lld16_full_016_UGE_done:
    brslt8 .Lld16_full_016_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_016_SLT_done
.Lld16_full_016_SLT_true:
    mem_emit_char 'B'
.Lld16_full_016_SLT_done:
    brsge8 .Lld16_full_016_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_016_SGE_done
.Lld16_full_016_SGE_true:
    mem_emit_char 'B'
.Lld16_full_016_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x065c
    ldi8 r5, 0xc3
    st8 [r4], r5
    ldi16 r4, 0x065d
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x065f
    ldi8 r5, 0x46
    st8 [r4], r5

    ; MIXED pointer r6, data r3, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x95f4
    push16 r4
    pop16 r3
    ldi16 r4, 0x5805
    push16 r4
    pop16 r0
    ldi16 r6, 0x065d
    ld16 r3, [r6]
    push16 r3
    push16 r6
    push16 r0
    ldi16 r4, 0x065c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x065e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_017_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_017_EQ_done
.Lld16_full_017_EQ_true:
    mem_emit_char 'B'
.Lld16_full_017_EQ_done:
    brne8 .Lld16_full_017_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_017_NE_done
.Lld16_full_017_NE_true:
    mem_emit_char 'B'
.Lld16_full_017_NE_done:
    brult8 .Lld16_full_017_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_017_ULT_done
.Lld16_full_017_ULT_true:
    mem_emit_char 'B'
.Lld16_full_017_ULT_done:
    bruge8 .Lld16_full_017_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_017_UGE_done
.Lld16_full_017_UGE_true:
    mem_emit_char 'B'
.Lld16_full_017_UGE_done:
    brslt8 .Lld16_full_017_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_017_SLT_done
.Lld16_full_017_SLT_true:
    mem_emit_char 'B'
.Lld16_full_017_SLT_done:
    brsge8 .Lld16_full_017_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_017_SGE_done
.Lld16_full_017_SGE_true:
    mem_emit_char 'B'
.Lld16_full_017_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0660
    ldi8 r5, 0xcb
    st8 [r4], r5
    ldi16 r4, 0x0661
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x0663
    ldi8 r5, 0x48
    st8 [r4], r5

    ; MIXED pointer r7, data r0, pattern 0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x9628
    push16 r4
    pop16 r0
    ldi16 r4, 0x5949
    push16 r4
    pop16 r1
    ldi16 r7, 0x0661
    ld16 r0, [r7]
    push16 r0
    push16 r7
    push16 r1
    ldi16 r4, 0x0660
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0662
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_018_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_018_EQ_done
.Lld16_full_018_EQ_true:
    mem_emit_char 'B'
.Lld16_full_018_EQ_done:
    brne8 .Lld16_full_018_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_018_NE_done
.Lld16_full_018_NE_true:
    mem_emit_char 'B'
.Lld16_full_018_NE_done:
    brult8 .Lld16_full_018_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_018_ULT_done
.Lld16_full_018_ULT_true:
    mem_emit_char 'B'
.Lld16_full_018_ULT_done:
    bruge8 .Lld16_full_018_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_018_UGE_done
.Lld16_full_018_UGE_true:
    mem_emit_char 'B'
.Lld16_full_018_UGE_done:
    brslt8 .Lld16_full_018_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_018_SLT_done
.Lld16_full_018_SLT_true:
    mem_emit_char 'B'
.Lld16_full_018_SLT_done:
    brsge8 .Lld16_full_018_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_018_SGE_done
.Lld16_full_018_SGE_true:
    mem_emit_char 'B'
.Lld16_full_018_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0664
    ldi8 r5, 0xd2
    st8 [r4], r5
    ldi16 r4, 0x0665
    ldi16 r5, 0x00ff
    st16 [r4], r5
    ldi16 r4, 0x0667
    ldi8 r5, 0x4d
    st8 [r4], r5

    ; MIXED pointer r7, data r0, pattern 1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x965f
    push16 r4
    pop16 r0
    ldi16 r4, 0x5a8d
    push16 r4
    pop16 r2
    ldi16 r7, 0x0665
    ld16 r0, [r7]
    push16 r0
    push16 r7
    push16 r2
    ldi16 r4, 0x0664
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0666
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_019_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_019_EQ_done
.Lld16_full_019_EQ_true:
    mem_emit_char 'B'
.Lld16_full_019_EQ_done:
    brne8 .Lld16_full_019_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_019_NE_done
.Lld16_full_019_NE_true:
    mem_emit_char 'B'
.Lld16_full_019_NE_done:
    brult8 .Lld16_full_019_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_019_ULT_done
.Lld16_full_019_ULT_true:
    mem_emit_char 'B'
.Lld16_full_019_ULT_done:
    bruge8 .Lld16_full_019_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_019_UGE_done
.Lld16_full_019_UGE_true:
    mem_emit_char 'B'
.Lld16_full_019_UGE_done:
    brslt8 .Lld16_full_019_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_019_SLT_done
.Lld16_full_019_SLT_true:
    mem_emit_char 'B'
.Lld16_full_019_SLT_done:
    brsge8 .Lld16_full_019_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_019_SGE_done
.Lld16_full_019_SGE_true:
    mem_emit_char 'B'
.Lld16_full_019_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0668
    ldi8 r5, 0xd9
    st8 [r4], r5
    ldi16 r4, 0x0669
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x066b
    ldi8 r5, 0x53
    st8 [r4], r5

    ; MIXED pointer r7, data r1, pattern 0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x9697
    push16 r4
    pop16 r1
    ldi16 r4, 0x5bd1
    push16 r4
    pop16 r3
    ldi16 r7, 0x0669
    ld16 r1, [r7]
    push16 r1
    push16 r7
    push16 r3
    ldi16 r4, 0x0668
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x066a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_01a_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01a_EQ_done
.Lld16_full_01a_EQ_true:
    mem_emit_char 'B'
.Lld16_full_01a_EQ_done:
    brne8 .Lld16_full_01a_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01a_NE_done
.Lld16_full_01a_NE_true:
    mem_emit_char 'B'
.Lld16_full_01a_NE_done:
    brult8 .Lld16_full_01a_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01a_ULT_done
.Lld16_full_01a_ULT_true:
    mem_emit_char 'B'
.Lld16_full_01a_ULT_done:
    bruge8 .Lld16_full_01a_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01a_UGE_done
.Lld16_full_01a_UGE_true:
    mem_emit_char 'B'
.Lld16_full_01a_UGE_done:
    brslt8 .Lld16_full_01a_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01a_SLT_done
.Lld16_full_01a_SLT_true:
    mem_emit_char 'B'
.Lld16_full_01a_SLT_done:
    brsge8 .Lld16_full_01a_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01a_SGE_done
.Lld16_full_01a_SGE_true:
    mem_emit_char 'B'
.Lld16_full_01a_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x066c
    ldi8 r5, 0xe0
    st8 [r4], r5
    ldi16 r4, 0x066d
    ldi16 r5, 0x8000
    st16 [r4], r5
    ldi16 r4, 0x066f
    ldi8 r5, 0x58
    st8 [r4], r5

    ; MIXED pointer r7, data r1, pattern 1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x96ce
    push16 r4
    pop16 r1
    ldi16 r4, 0x5911
    push16 r4
    pop16 r0
    ldi16 r7, 0x066d
    ld16 r1, [r7]
    push16 r1
    push16 r7
    push16 r0
    ldi16 r4, 0x066c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x066e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_01b_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01b_EQ_done
.Lld16_full_01b_EQ_true:
    mem_emit_char 'B'
.Lld16_full_01b_EQ_done:
    brne8 .Lld16_full_01b_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01b_NE_done
.Lld16_full_01b_NE_true:
    mem_emit_char 'B'
.Lld16_full_01b_NE_done:
    brult8 .Lld16_full_01b_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01b_ULT_done
.Lld16_full_01b_ULT_true:
    mem_emit_char 'B'
.Lld16_full_01b_ULT_done:
    bruge8 .Lld16_full_01b_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01b_UGE_done
.Lld16_full_01b_UGE_true:
    mem_emit_char 'B'
.Lld16_full_01b_UGE_done:
    brslt8 .Lld16_full_01b_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01b_SLT_done
.Lld16_full_01b_SLT_true:
    mem_emit_char 'B'
.Lld16_full_01b_SLT_done:
    brsge8 .Lld16_full_01b_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01b_SGE_done
.Lld16_full_01b_SGE_true:
    mem_emit_char 'B'
.Lld16_full_01b_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0670
    ldi8 r5, 0xe7
    st8 [r4], r5
    ldi16 r4, 0x0671
    ldi16 r5, 0xffff
    st16 [r4], r5
    ldi16 r4, 0x0673
    ldi8 r5, 0x5e
    st8 [r4], r5

    ; MIXED pointer r7, data r2, pattern 0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x9706
    push16 r4
    pop16 r2
    ldi16 r4, 0x5a55
    push16 r4
    pop16 r1
    ldi16 r7, 0x0671
    ld16 r2, [r7]
    push16 r2
    push16 r7
    push16 r1
    ldi16 r4, 0x0670
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0672
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_01c_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01c_EQ_done
.Lld16_full_01c_EQ_true:
    mem_emit_char 'B'
.Lld16_full_01c_EQ_done:
    brne8 .Lld16_full_01c_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01c_NE_done
.Lld16_full_01c_NE_true:
    mem_emit_char 'B'
.Lld16_full_01c_NE_done:
    brult8 .Lld16_full_01c_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01c_ULT_done
.Lld16_full_01c_ULT_true:
    mem_emit_char 'B'
.Lld16_full_01c_ULT_done:
    bruge8 .Lld16_full_01c_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01c_UGE_done
.Lld16_full_01c_UGE_true:
    mem_emit_char 'B'
.Lld16_full_01c_UGE_done:
    brslt8 .Lld16_full_01c_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01c_SLT_done
.Lld16_full_01c_SLT_true:
    mem_emit_char 'B'
.Lld16_full_01c_SLT_done:
    brsge8 .Lld16_full_01c_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01c_SGE_done
.Lld16_full_01c_SGE_true:
    mem_emit_char 'B'
.Lld16_full_01c_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0674
    ldi8 r5, 0xee
    st8 [r4], r5
    ldi16 r4, 0x0675
    ldi16 r5, 0x0000
    st16 [r4], r5
    ldi16 r4, 0x0677
    ldi8 r5, 0x63
    st8 [r4], r5

    ; MIXED pointer r7, data r2, pattern 1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x973d
    push16 r4
    pop16 r2
    ldi16 r4, 0x5c9a
    push16 r4
    pop16 r3
    ldi16 r7, 0x0675
    ld16 r2, [r7]
    push16 r2
    push16 r7
    push16 r3
    ldi16 r4, 0x0674
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x0676
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_01d_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01d_EQ_done
.Lld16_full_01d_EQ_true:
    mem_emit_char 'B'
.Lld16_full_01d_EQ_done:
    brne8 .Lld16_full_01d_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01d_NE_done
.Lld16_full_01d_NE_true:
    mem_emit_char 'B'
.Lld16_full_01d_NE_done:
    brult8 .Lld16_full_01d_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01d_ULT_done
.Lld16_full_01d_ULT_true:
    mem_emit_char 'B'
.Lld16_full_01d_ULT_done:
    bruge8 .Lld16_full_01d_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01d_UGE_done
.Lld16_full_01d_UGE_true:
    mem_emit_char 'B'
.Lld16_full_01d_UGE_done:
    brslt8 .Lld16_full_01d_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01d_SLT_done
.Lld16_full_01d_SLT_true:
    mem_emit_char 'B'
.Lld16_full_01d_SLT_done:
    brsge8 .Lld16_full_01d_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01d_SGE_done
.Lld16_full_01d_SGE_true:
    mem_emit_char 'B'
.Lld16_full_01d_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x0678
    ldi8 r5, 0xf5
    st8 [r4], r5
    ldi16 r4, 0x0679
    ldi16 r5, 0x0001
    st16 [r4], r5
    ldi16 r4, 0x067b
    ldi8 r5, 0x69
    st8 [r4], r5

    ; MIXED pointer r7, data r3, pattern 0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x9775
    push16 r4
    pop16 r3
    ldi16 r4, 0x59da
    push16 r4
    pop16 r0
    ldi16 r7, 0x0679
    ld16 r3, [r7]
    push16 r3
    push16 r7
    push16 r0
    ldi16 r4, 0x0678
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x067a
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_01e_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01e_EQ_done
.Lld16_full_01e_EQ_true:
    mem_emit_char 'B'
.Lld16_full_01e_EQ_done:
    brne8 .Lld16_full_01e_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01e_NE_done
.Lld16_full_01e_NE_true:
    mem_emit_char 'B'
.Lld16_full_01e_NE_done:
    brult8 .Lld16_full_01e_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01e_ULT_done
.Lld16_full_01e_ULT_true:
    mem_emit_char 'B'
.Lld16_full_01e_ULT_done:
    bruge8 .Lld16_full_01e_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01e_UGE_done
.Lld16_full_01e_UGE_true:
    mem_emit_char 'B'
.Lld16_full_01e_UGE_done:
    brslt8 .Lld16_full_01e_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01e_SLT_done
.Lld16_full_01e_SLT_true:
    mem_emit_char 'B'
.Lld16_full_01e_SLT_done:
    brsge8 .Lld16_full_01e_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01e_SGE_done
.Lld16_full_01e_SGE_true:
    mem_emit_char 'B'
.Lld16_full_01e_SGE_done:
    mem_emit_char '\n'
    ldi16 r4, 0x067c
    ldi8 r5, 0xfc
    st8 [r4], r5
    ldi16 r4, 0x067d
    ldi16 r5, 0x0100
    st16 [r4], r5
    ldi16 r4, 0x067f
    ldi8 r5, 0x6e
    st8 [r4], r5

    ; MIXED pointer r7, data r3, pattern 1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x97ac
    push16 r4
    pop16 r3
    ldi16 r4, 0x5a1d
    push16 r4
    pop16 r0
    ldi16 r7, 0x067d
    ld16 r3, [r7]
    push16 r3
    push16 r7
    push16 r0
    ldi16 r4, 0x067c
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    ldi16 r4, 0x067e
    ld16 r5, [r4]
    mov r0, r5
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    pop16 r0
    call mem_print_r0_line
    breq8 .Lld16_full_01f_EQ_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01f_EQ_done
.Lld16_full_01f_EQ_true:
    mem_emit_char 'B'
.Lld16_full_01f_EQ_done:
    brne8 .Lld16_full_01f_NE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01f_NE_done
.Lld16_full_01f_NE_true:
    mem_emit_char 'B'
.Lld16_full_01f_NE_done:
    brult8 .Lld16_full_01f_ULT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01f_ULT_done
.Lld16_full_01f_ULT_true:
    mem_emit_char 'B'
.Lld16_full_01f_ULT_done:
    bruge8 .Lld16_full_01f_UGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01f_UGE_done
.Lld16_full_01f_UGE_true:
    mem_emit_char 'B'
.Lld16_full_01f_UGE_done:
    brslt8 .Lld16_full_01f_SLT_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01f_SLT_done
.Lld16_full_01f_SLT_true:
    mem_emit_char 'B'
.Lld16_full_01f_SLT_done:
    brsge8 .Lld16_full_01f_SGE_true
    mem_emit_char 'A'
    jmp8 .Lld16_full_01f_SGE_done
.Lld16_full_01f_SGE_true:
    mem_emit_char 'B'
.Lld16_full_01f_SGE_done:
    mem_emit_char '\n'

    sys debug_break
