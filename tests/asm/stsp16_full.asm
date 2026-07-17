.include "include/cold_stack_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; STSP16 r0, offset 0; F0 secondary 0x38.
    ldi16 r4, 0x0300
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x0301
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x0302
    ldi8 r5, 0xa7
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8001
    push16 r4
    ldi16 r4, 0xb134
    push16 r4
    ldi16 r4, 0xb257
    push16 r4
    ldi16 r4, 0xb37a
    push16 r4
    ldi16 r4, 0xb49d
    push16 r4
    ldi16 r4, 0xb5c0
    push16 r4
    ldi16 r4, 0xb6e3
    push16 r4
    ldi16 r4, 0xd500
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x38, 0x00 ; TEST
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
    ldi16 r4, 0x0300
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0301
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_000_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_000_EQ_done
.Lstsp16_full_000_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_000_EQ_done:
    brne8 .Lstsp16_full_000_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_000_NE_done
.Lstsp16_full_000_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_000_NE_done:
    brult8 .Lstsp16_full_000_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_000_ULT_done
.Lstsp16_full_000_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_000_ULT_done:
    bruge8 .Lstsp16_full_000_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_000_UGE_done
.Lstsp16_full_000_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_000_UGE_done:
    brslt8 .Lstsp16_full_000_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_000_SLT_done
.Lstsp16_full_000_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_000_SLT_done:
    brsge8 .Lstsp16_full_000_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_000_SGE_done
.Lstsp16_full_000_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_000_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r0, offset 15; F0 secondary 0x38.
    ldi16 r4, 0x030e
    ldi8 r5, 0x34
    st8 [r4], r5
    ldi16 r4, 0x030f
    ldi8 r5, 0x24
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x02
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0xac
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8138
    push16 r4
    ldi16 r4, 0xb169
    push16 r4
    ldi16 r4, 0xb28c
    push16 r4
    ldi16 r4, 0xb3af
    push16 r4
    ldi16 r4, 0xb4d2
    push16 r4
    ldi16 r4, 0xb5f5
    push16 r4
    ldi16 r4, 0xb718
    push16 r4
    ldi16 r4, 0xd547
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x38, 0x0f ; TEST
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
    ldi16 r4, 0x030e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0310
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_001_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_001_EQ_done
.Lstsp16_full_001_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_001_EQ_done:
    brne8 .Lstsp16_full_001_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_001_NE_done
.Lstsp16_full_001_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_001_NE_done:
    brult8 .Lstsp16_full_001_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_001_ULT_done
.Lstsp16_full_001_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_001_ULT_done:
    bruge8 .Lstsp16_full_001_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_001_UGE_done
.Lstsp16_full_001_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_001_UGE_done:
    brslt8 .Lstsp16_full_001_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_001_SLT_done
.Lstsp16_full_001_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_001_SLT_done:
    brsge8 .Lstsp16_full_001_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_001_SGE_done
.Lstsp16_full_001_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_001_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r0, offset 16; F0 secondary 0x38.
    ldi16 r4, 0x030f
    ldi8 r5, 0x37
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x47
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x03
    st8 [r4], r5
    ldi16 r4, 0x0312
    ldi8 r5, 0xb1
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x826f
    push16 r4
    ldi16 r4, 0xb19e
    push16 r4
    ldi16 r4, 0xb2c1
    push16 r4
    ldi16 r4, 0xb3e4
    push16 r4
    ldi16 r4, 0xb507
    push16 r4
    ldi16 r4, 0xb62a
    push16 r4
    ldi16 r4, 0xb74d
    push16 r4
    ldi16 r4, 0xd58e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x38, 0x10 ; TEST
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
    ldi16 r4, 0x030f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0311
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_002_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_002_EQ_done
.Lstsp16_full_002_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_002_EQ_done:
    brne8 .Lstsp16_full_002_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_002_NE_done
.Lstsp16_full_002_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_002_NE_done:
    brult8 .Lstsp16_full_002_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_002_ULT_done
.Lstsp16_full_002_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_002_ULT_done:
    bruge8 .Lstsp16_full_002_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_002_UGE_done
.Lstsp16_full_002_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_002_UGE_done:
    brslt8 .Lstsp16_full_002_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_002_SLT_done
.Lstsp16_full_002_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_002_SLT_done:
    brsge8 .Lstsp16_full_002_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_002_SGE_done
.Lstsp16_full_002_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_002_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r0, offset 127; F0 secondary 0x38.
    ldi16 r4, 0x037e
    ldi8 r5, 0x3a
    st8 [r4], r5
    ldi16 r4, 0x037f
    ldi8 r5, 0x6a
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x04
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0xb6
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x83a6
    push16 r4
    ldi16 r4, 0xb1d3
    push16 r4
    ldi16 r4, 0xb2f6
    push16 r4
    ldi16 r4, 0xb419
    push16 r4
    ldi16 r4, 0xb53c
    push16 r4
    ldi16 r4, 0xb65f
    push16 r4
    ldi16 r4, 0xb782
    push16 r4
    ldi16 r4, 0xd5d5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x38, 0x7f ; TEST
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
    ldi16 r4, 0x037e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0380
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_003_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_003_EQ_done
.Lstsp16_full_003_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_003_EQ_done:
    brne8 .Lstsp16_full_003_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_003_NE_done
.Lstsp16_full_003_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_003_NE_done:
    brult8 .Lstsp16_full_003_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_003_ULT_done
.Lstsp16_full_003_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_003_ULT_done:
    bruge8 .Lstsp16_full_003_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_003_UGE_done
.Lstsp16_full_003_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_003_UGE_done:
    brslt8 .Lstsp16_full_003_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_003_SLT_done
.Lstsp16_full_003_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_003_SLT_done:
    brsge8 .Lstsp16_full_003_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_003_SGE_done
.Lstsp16_full_003_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_003_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r0, offset 128; F0 secondary 0x38.
    ldi16 r4, 0x037f
    ldi8 r5, 0x3d
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x8d
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x05
    st8 [r4], r5
    ldi16 r4, 0x0382
    ldi8 r5, 0xbb
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x84dd
    push16 r4
    ldi16 r4, 0xb208
    push16 r4
    ldi16 r4, 0xb32b
    push16 r4
    ldi16 r4, 0xb44e
    push16 r4
    ldi16 r4, 0xb571
    push16 r4
    ldi16 r4, 0xb694
    push16 r4
    ldi16 r4, 0xb7b7
    push16 r4
    ldi16 r4, 0xd61c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x38, 0x80 ; TEST
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
    ldi16 r4, 0x037f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0381
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_004_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_004_EQ_done
.Lstsp16_full_004_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_004_EQ_done:
    brne8 .Lstsp16_full_004_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_004_NE_done
.Lstsp16_full_004_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_004_NE_done:
    brult8 .Lstsp16_full_004_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_004_ULT_done
.Lstsp16_full_004_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_004_ULT_done:
    bruge8 .Lstsp16_full_004_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_004_UGE_done
.Lstsp16_full_004_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_004_UGE_done:
    brslt8 .Lstsp16_full_004_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_004_SLT_done
.Lstsp16_full_004_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_004_SLT_done:
    brsge8 .Lstsp16_full_004_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_004_SGE_done
.Lstsp16_full_004_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_004_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r0, offset 254; F0 secondary 0x38.
    ldi16 r4, 0x03fd
    ldi8 r5, 0x40
    st8 [r4], r5
    ldi16 r4, 0x03fe
    ldi8 r5, 0xb0
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0x06
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0xc0
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x8614
    push16 r4
    ldi16 r4, 0xb23d
    push16 r4
    ldi16 r4, 0xb360
    push16 r4
    ldi16 r4, 0xb483
    push16 r4
    ldi16 r4, 0xb5a6
    push16 r4
    ldi16 r4, 0xb6c9
    push16 r4
    ldi16 r4, 0xb7ec
    push16 r4
    ldi16 r4, 0xd663
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x38, 0xfe ; TEST
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
    ldi16 r4, 0x03fd
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x03ff
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_005_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_005_EQ_done
.Lstsp16_full_005_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_005_EQ_done:
    brne8 .Lstsp16_full_005_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_005_NE_done
.Lstsp16_full_005_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_005_NE_done:
    brult8 .Lstsp16_full_005_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_005_ULT_done
.Lstsp16_full_005_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_005_ULT_done:
    bruge8 .Lstsp16_full_005_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_005_UGE_done
.Lstsp16_full_005_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_005_UGE_done:
    brslt8 .Lstsp16_full_005_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_005_SLT_done
.Lstsp16_full_005_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_005_SLT_done:
    brsge8 .Lstsp16_full_005_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_005_SGE_done
.Lstsp16_full_005_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_005_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r0, offset 255; F0 secondary 0x38.
    ldi16 r4, 0x03fe
    ldi8 r5, 0x43
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0xd3
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x07
    st8 [r4], r5
    ldi16 r4, 0x0401
    ldi8 r5, 0xc5
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x874b
    push16 r4
    ldi16 r4, 0xb272
    push16 r4
    ldi16 r4, 0xb395
    push16 r4
    ldi16 r4, 0xb4b8
    push16 r4
    ldi16 r4, 0xb5db
    push16 r4
    ldi16 r4, 0xb6fe
    push16 r4
    ldi16 r4, 0xb821
    push16 r4
    ldi16 r4, 0xd6aa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x38, 0xff ; TEST
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
    ldi16 r4, 0x03fe
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0400
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_006_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_006_EQ_done
.Lstsp16_full_006_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_006_EQ_done:
    brne8 .Lstsp16_full_006_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_006_NE_done
.Lstsp16_full_006_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_006_NE_done:
    brult8 .Lstsp16_full_006_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_006_ULT_done
.Lstsp16_full_006_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_006_ULT_done:
    bruge8 .Lstsp16_full_006_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_006_UGE_done
.Lstsp16_full_006_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_006_UGE_done:
    brslt8 .Lstsp16_full_006_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_006_SLT_done
.Lstsp16_full_006_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_006_SLT_done:
    brsge8 .Lstsp16_full_006_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_006_SGE_done
.Lstsp16_full_006_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_006_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r1, offset 0; F0 secondary 0x39.
    ldi16 r4, 0x0300
    ldi8 r5, 0x07
    st8 [r4], r5
    ldi16 r4, 0x0301
    ldi8 r5, 0x1a
    st8 [r4], r5
    ldi16 r4, 0x0302
    ldi8 r5, 0xca
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb184
    push16 r4
    ldi16 r4, 0x8993
    push16 r4
    ldi16 r4, 0xb3ca
    push16 r4
    ldi16 r4, 0xb4ed
    push16 r4
    ldi16 r4, 0xb610
    push16 r4
    ldi16 r4, 0xb733
    push16 r4
    ldi16 r4, 0xb856
    push16 r4
    ldi16 r4, 0xd6f1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x39, 0x00 ; TEST
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
    ldi16 r4, 0x0300
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0301
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_007_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_007_EQ_done
.Lstsp16_full_007_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_007_EQ_done:
    brne8 .Lstsp16_full_007_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_007_NE_done
.Lstsp16_full_007_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_007_NE_done:
    brult8 .Lstsp16_full_007_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_007_ULT_done
.Lstsp16_full_007_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_007_ULT_done:
    bruge8 .Lstsp16_full_007_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_007_UGE_done
.Lstsp16_full_007_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_007_UGE_done:
    brslt8 .Lstsp16_full_007_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_007_SLT_done
.Lstsp16_full_007_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_007_SLT_done:
    brsge8 .Lstsp16_full_007_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_007_SGE_done
.Lstsp16_full_007_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_007_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r1, offset 15; F0 secondary 0x39.
    ldi16 r4, 0x030e
    ldi8 r5, 0x49
    st8 [r4], r5
    ldi16 r4, 0x030f
    ldi8 r5, 0x2a
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x1b
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0xcf
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb1b9
    push16 r4
    ldi16 r4, 0x8aca
    push16 r4
    ldi16 r4, 0xb3ff
    push16 r4
    ldi16 r4, 0xb522
    push16 r4
    ldi16 r4, 0xb645
    push16 r4
    ldi16 r4, 0xb768
    push16 r4
    ldi16 r4, 0xb88b
    push16 r4
    ldi16 r4, 0xd738
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x39, 0x0f ; TEST
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
    ldi16 r4, 0x030e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0310
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_008_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_008_EQ_done
.Lstsp16_full_008_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_008_EQ_done:
    brne8 .Lstsp16_full_008_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_008_NE_done
.Lstsp16_full_008_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_008_NE_done:
    brult8 .Lstsp16_full_008_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_008_ULT_done
.Lstsp16_full_008_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_008_ULT_done:
    bruge8 .Lstsp16_full_008_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_008_UGE_done
.Lstsp16_full_008_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_008_UGE_done:
    brslt8 .Lstsp16_full_008_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_008_SLT_done
.Lstsp16_full_008_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_008_SLT_done:
    brsge8 .Lstsp16_full_008_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_008_SGE_done
.Lstsp16_full_008_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_008_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r1, offset 16; F0 secondary 0x39.
    ldi16 r4, 0x030f
    ldi8 r5, 0x4c
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x4d
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x1c
    st8 [r4], r5
    ldi16 r4, 0x0312
    ldi8 r5, 0xd4
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb1ee
    push16 r4
    ldi16 r4, 0x8c01
    push16 r4
    ldi16 r4, 0xb434
    push16 r4
    ldi16 r4, 0xb557
    push16 r4
    ldi16 r4, 0xb67a
    push16 r4
    ldi16 r4, 0xb79d
    push16 r4
    ldi16 r4, 0xb8c0
    push16 r4
    ldi16 r4, 0xd77f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x39, 0x10 ; TEST
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
    ldi16 r4, 0x030f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0311
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_009_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_009_EQ_done
.Lstsp16_full_009_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_009_EQ_done:
    brne8 .Lstsp16_full_009_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_009_NE_done
.Lstsp16_full_009_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_009_NE_done:
    brult8 .Lstsp16_full_009_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_009_ULT_done
.Lstsp16_full_009_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_009_ULT_done:
    bruge8 .Lstsp16_full_009_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_009_UGE_done
.Lstsp16_full_009_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_009_UGE_done:
    brslt8 .Lstsp16_full_009_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_009_SLT_done
.Lstsp16_full_009_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_009_SLT_done:
    brsge8 .Lstsp16_full_009_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_009_SGE_done
.Lstsp16_full_009_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_009_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r1, offset 127; F0 secondary 0x39.
    ldi16 r4, 0x037e
    ldi8 r5, 0x4f
    st8 [r4], r5
    ldi16 r4, 0x037f
    ldi8 r5, 0x70
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x1d
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0xd9
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb223
    push16 r4
    ldi16 r4, 0x8d38
    push16 r4
    ldi16 r4, 0xb469
    push16 r4
    ldi16 r4, 0xb58c
    push16 r4
    ldi16 r4, 0xb6af
    push16 r4
    ldi16 r4, 0xb7d2
    push16 r4
    ldi16 r4, 0xb8f5
    push16 r4
    ldi16 r4, 0xd7c6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x39, 0x7f ; TEST
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
    ldi16 r4, 0x037e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0380
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_00a_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00a_EQ_done
.Lstsp16_full_00a_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_00a_EQ_done:
    brne8 .Lstsp16_full_00a_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00a_NE_done
.Lstsp16_full_00a_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_00a_NE_done:
    brult8 .Lstsp16_full_00a_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00a_ULT_done
.Lstsp16_full_00a_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_00a_ULT_done:
    bruge8 .Lstsp16_full_00a_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00a_UGE_done
.Lstsp16_full_00a_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00a_UGE_done:
    brslt8 .Lstsp16_full_00a_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00a_SLT_done
.Lstsp16_full_00a_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_00a_SLT_done:
    brsge8 .Lstsp16_full_00a_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00a_SGE_done
.Lstsp16_full_00a_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00a_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r1, offset 128; F0 secondary 0x39.
    ldi16 r4, 0x037f
    ldi8 r5, 0x52
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x93
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x1e
    st8 [r4], r5
    ldi16 r4, 0x0382
    ldi8 r5, 0xde
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb258
    push16 r4
    ldi16 r4, 0x8e6f
    push16 r4
    ldi16 r4, 0xb49e
    push16 r4
    ldi16 r4, 0xb5c1
    push16 r4
    ldi16 r4, 0xb6e4
    push16 r4
    ldi16 r4, 0xb807
    push16 r4
    ldi16 r4, 0xb92a
    push16 r4
    ldi16 r4, 0xd80d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x39, 0x80 ; TEST
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
    ldi16 r4, 0x037f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0381
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_00b_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00b_EQ_done
.Lstsp16_full_00b_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_00b_EQ_done:
    brne8 .Lstsp16_full_00b_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00b_NE_done
.Lstsp16_full_00b_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_00b_NE_done:
    brult8 .Lstsp16_full_00b_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00b_ULT_done
.Lstsp16_full_00b_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_00b_ULT_done:
    bruge8 .Lstsp16_full_00b_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00b_UGE_done
.Lstsp16_full_00b_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00b_UGE_done:
    brslt8 .Lstsp16_full_00b_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00b_SLT_done
.Lstsp16_full_00b_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_00b_SLT_done:
    brsge8 .Lstsp16_full_00b_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00b_SGE_done
.Lstsp16_full_00b_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00b_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r1, offset 254; F0 secondary 0x39.
    ldi16 r4, 0x03fd
    ldi8 r5, 0x55
    st8 [r4], r5
    ldi16 r4, 0x03fe
    ldi8 r5, 0xb6
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0x1f
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0xe3
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb28d
    push16 r4
    ldi16 r4, 0x8fa6
    push16 r4
    ldi16 r4, 0xb4d3
    push16 r4
    ldi16 r4, 0xb5f6
    push16 r4
    ldi16 r4, 0xb719
    push16 r4
    ldi16 r4, 0xb83c
    push16 r4
    ldi16 r4, 0xb95f
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
    .byte 0xf0, 0x39, 0xfe ; TEST
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
    ldi16 r4, 0x03fd
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x03ff
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_00c_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00c_EQ_done
.Lstsp16_full_00c_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_00c_EQ_done:
    brne8 .Lstsp16_full_00c_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00c_NE_done
.Lstsp16_full_00c_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_00c_NE_done:
    brult8 .Lstsp16_full_00c_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00c_ULT_done
.Lstsp16_full_00c_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_00c_ULT_done:
    bruge8 .Lstsp16_full_00c_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00c_UGE_done
.Lstsp16_full_00c_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00c_UGE_done:
    brslt8 .Lstsp16_full_00c_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00c_SLT_done
.Lstsp16_full_00c_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_00c_SLT_done:
    brsge8 .Lstsp16_full_00c_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00c_SGE_done
.Lstsp16_full_00c_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00c_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r1, offset 255; F0 secondary 0x39.
    ldi16 r4, 0x03fe
    ldi8 r5, 0x58
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0xd9
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x20
    st8 [r4], r5
    ldi16 r4, 0x0401
    ldi8 r5, 0xe8
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb2c2
    push16 r4
    ldi16 r4, 0x90dd
    push16 r4
    ldi16 r4, 0xb508
    push16 r4
    ldi16 r4, 0xb62b
    push16 r4
    ldi16 r4, 0xb74e
    push16 r4
    ldi16 r4, 0xb871
    push16 r4
    ldi16 r4, 0xb994
    push16 r4
    ldi16 r4, 0xd89b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x39, 0xff ; TEST
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
    ldi16 r4, 0x03fe
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0400
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_00d_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00d_EQ_done
.Lstsp16_full_00d_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_00d_EQ_done:
    brne8 .Lstsp16_full_00d_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00d_NE_done
.Lstsp16_full_00d_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_00d_NE_done:
    brult8 .Lstsp16_full_00d_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00d_ULT_done
.Lstsp16_full_00d_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_00d_ULT_done:
    bruge8 .Lstsp16_full_00d_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00d_UGE_done
.Lstsp16_full_00d_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00d_UGE_done:
    brslt8 .Lstsp16_full_00d_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00d_SLT_done
.Lstsp16_full_00d_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_00d_SLT_done:
    brsge8 .Lstsp16_full_00d_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00d_SGE_done
.Lstsp16_full_00d_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00d_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r2, offset 0; F0 secondary 0x3A.
    ldi16 r4, 0x0300
    ldi8 r5, 0x0d
    st8 [r4], r5
    ldi16 r4, 0x0301
    ldi8 r5, 0x33
    st8 [r4], r5
    ldi16 r4, 0x0302
    ldi8 r5, 0xed
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb2f7
    push16 r4
    ldi16 r4, 0xb41a
    push16 r4
    ldi16 r4, 0x9325
    push16 r4
    ldi16 r4, 0xb660
    push16 r4
    ldi16 r4, 0xb783
    push16 r4
    ldi16 r4, 0xb8a6
    push16 r4
    ldi16 r4, 0xb9c9
    push16 r4
    ldi16 r4, 0xd8e2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3a, 0x00 ; TEST
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
    ldi16 r4, 0x0300
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0301
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_00e_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00e_EQ_done
.Lstsp16_full_00e_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_00e_EQ_done:
    brne8 .Lstsp16_full_00e_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00e_NE_done
.Lstsp16_full_00e_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_00e_NE_done:
    brult8 .Lstsp16_full_00e_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00e_ULT_done
.Lstsp16_full_00e_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_00e_ULT_done:
    bruge8 .Lstsp16_full_00e_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00e_UGE_done
.Lstsp16_full_00e_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00e_UGE_done:
    brslt8 .Lstsp16_full_00e_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00e_SLT_done
.Lstsp16_full_00e_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_00e_SLT_done:
    brsge8 .Lstsp16_full_00e_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00e_SGE_done
.Lstsp16_full_00e_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00e_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r2, offset 15; F0 secondary 0x3A.
    ldi16 r4, 0x030e
    ldi8 r5, 0x5e
    st8 [r4], r5
    ldi16 r4, 0x030f
    ldi8 r5, 0x30
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x34
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0xf2
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb32c
    push16 r4
    ldi16 r4, 0xb44f
    push16 r4
    ldi16 r4, 0x945c
    push16 r4
    ldi16 r4, 0xb695
    push16 r4
    ldi16 r4, 0xb7b8
    push16 r4
    ldi16 r4, 0xb8db
    push16 r4
    ldi16 r4, 0xb9fe
    push16 r4
    ldi16 r4, 0xd929
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3a, 0x0f ; TEST
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
    ldi16 r4, 0x030e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0310
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_00f_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00f_EQ_done
.Lstsp16_full_00f_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_00f_EQ_done:
    brne8 .Lstsp16_full_00f_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00f_NE_done
.Lstsp16_full_00f_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_00f_NE_done:
    brult8 .Lstsp16_full_00f_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00f_ULT_done
.Lstsp16_full_00f_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_00f_ULT_done:
    bruge8 .Lstsp16_full_00f_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00f_UGE_done
.Lstsp16_full_00f_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00f_UGE_done:
    brslt8 .Lstsp16_full_00f_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00f_SLT_done
.Lstsp16_full_00f_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_00f_SLT_done:
    brsge8 .Lstsp16_full_00f_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_00f_SGE_done
.Lstsp16_full_00f_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_00f_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r2, offset 16; F0 secondary 0x3A.
    ldi16 r4, 0x030f
    ldi8 r5, 0x61
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x53
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x35
    st8 [r4], r5
    ldi16 r4, 0x0312
    ldi8 r5, 0xf7
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb361
    push16 r4
    ldi16 r4, 0xb484
    push16 r4
    ldi16 r4, 0x9593
    push16 r4
    ldi16 r4, 0xb6ca
    push16 r4
    ldi16 r4, 0xb7ed
    push16 r4
    ldi16 r4, 0xb910
    push16 r4
    ldi16 r4, 0xba33
    push16 r4
    ldi16 r4, 0xd970
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3a, 0x10 ; TEST
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
    ldi16 r4, 0x030f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0311
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_010_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_010_EQ_done
.Lstsp16_full_010_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_010_EQ_done:
    brne8 .Lstsp16_full_010_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_010_NE_done
.Lstsp16_full_010_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_010_NE_done:
    brult8 .Lstsp16_full_010_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_010_ULT_done
.Lstsp16_full_010_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_010_ULT_done:
    bruge8 .Lstsp16_full_010_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_010_UGE_done
.Lstsp16_full_010_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_010_UGE_done:
    brslt8 .Lstsp16_full_010_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_010_SLT_done
.Lstsp16_full_010_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_010_SLT_done:
    brsge8 .Lstsp16_full_010_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_010_SGE_done
.Lstsp16_full_010_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_010_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r2, offset 127; F0 secondary 0x3A.
    ldi16 r4, 0x037e
    ldi8 r5, 0x64
    st8 [r4], r5
    ldi16 r4, 0x037f
    ldi8 r5, 0x76
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x36
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0xfc
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb396
    push16 r4
    ldi16 r4, 0xb4b9
    push16 r4
    ldi16 r4, 0x96ca
    push16 r4
    ldi16 r4, 0xb6ff
    push16 r4
    ldi16 r4, 0xb822
    push16 r4
    ldi16 r4, 0xb945
    push16 r4
    ldi16 r4, 0xba68
    push16 r4
    ldi16 r4, 0xd9b7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3a, 0x7f ; TEST
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
    ldi16 r4, 0x037e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0380
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_011_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_011_EQ_done
.Lstsp16_full_011_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_011_EQ_done:
    brne8 .Lstsp16_full_011_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_011_NE_done
.Lstsp16_full_011_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_011_NE_done:
    brult8 .Lstsp16_full_011_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_011_ULT_done
.Lstsp16_full_011_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_011_ULT_done:
    bruge8 .Lstsp16_full_011_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_011_UGE_done
.Lstsp16_full_011_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_011_UGE_done:
    brslt8 .Lstsp16_full_011_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_011_SLT_done
.Lstsp16_full_011_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_011_SLT_done:
    brsge8 .Lstsp16_full_011_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_011_SGE_done
.Lstsp16_full_011_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_011_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r2, offset 128; F0 secondary 0x3A.
    ldi16 r4, 0x037f
    ldi8 r5, 0x67
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x99
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x37
    st8 [r4], r5
    ldi16 r4, 0x0382
    ldi8 r5, 0x01
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb3cb
    push16 r4
    ldi16 r4, 0xb4ee
    push16 r4
    ldi16 r4, 0x9801
    push16 r4
    ldi16 r4, 0xb734
    push16 r4
    ldi16 r4, 0xb857
    push16 r4
    ldi16 r4, 0xb97a
    push16 r4
    ldi16 r4, 0xba9d
    push16 r4
    ldi16 r4, 0xd9fe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3a, 0x80 ; TEST
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
    ldi16 r4, 0x037f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0381
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_012_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_012_EQ_done
.Lstsp16_full_012_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_012_EQ_done:
    brne8 .Lstsp16_full_012_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_012_NE_done
.Lstsp16_full_012_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_012_NE_done:
    brult8 .Lstsp16_full_012_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_012_ULT_done
.Lstsp16_full_012_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_012_ULT_done:
    bruge8 .Lstsp16_full_012_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_012_UGE_done
.Lstsp16_full_012_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_012_UGE_done:
    brslt8 .Lstsp16_full_012_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_012_SLT_done
.Lstsp16_full_012_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_012_SLT_done:
    brsge8 .Lstsp16_full_012_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_012_SGE_done
.Lstsp16_full_012_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_012_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r2, offset 254; F0 secondary 0x3A.
    ldi16 r4, 0x03fd
    ldi8 r5, 0x6a
    st8 [r4], r5
    ldi16 r4, 0x03fe
    ldi8 r5, 0xbc
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0x38
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x06
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb400
    push16 r4
    ldi16 r4, 0xb523
    push16 r4
    ldi16 r4, 0x9938
    push16 r4
    ldi16 r4, 0xb769
    push16 r4
    ldi16 r4, 0xb88c
    push16 r4
    ldi16 r4, 0xb9af
    push16 r4
    ldi16 r4, 0xbad2
    push16 r4
    ldi16 r4, 0xda45
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3a, 0xfe ; TEST
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
    ldi16 r4, 0x03fd
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x03ff
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_013_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_013_EQ_done
.Lstsp16_full_013_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_013_EQ_done:
    brne8 .Lstsp16_full_013_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_013_NE_done
.Lstsp16_full_013_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_013_NE_done:
    brult8 .Lstsp16_full_013_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_013_ULT_done
.Lstsp16_full_013_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_013_ULT_done:
    bruge8 .Lstsp16_full_013_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_013_UGE_done
.Lstsp16_full_013_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_013_UGE_done:
    brslt8 .Lstsp16_full_013_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_013_SLT_done
.Lstsp16_full_013_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_013_SLT_done:
    brsge8 .Lstsp16_full_013_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_013_SGE_done
.Lstsp16_full_013_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_013_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r2, offset 255; F0 secondary 0x3A.
    ldi16 r4, 0x03fe
    ldi8 r5, 0x6d
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0xdf
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x39
    st8 [r4], r5
    ldi16 r4, 0x0401
    ldi8 r5, 0x0b
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb435
    push16 r4
    ldi16 r4, 0xb558
    push16 r4
    ldi16 r4, 0x9a6f
    push16 r4
    ldi16 r4, 0xb79e
    push16 r4
    ldi16 r4, 0xb8c1
    push16 r4
    ldi16 r4, 0xb9e4
    push16 r4
    ldi16 r4, 0xbb07
    push16 r4
    ldi16 r4, 0xda8c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3a, 0xff ; TEST
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
    ldi16 r4, 0x03fe
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0400
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_014_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_014_EQ_done
.Lstsp16_full_014_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_014_EQ_done:
    brne8 .Lstsp16_full_014_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_014_NE_done
.Lstsp16_full_014_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_014_NE_done:
    brult8 .Lstsp16_full_014_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_014_ULT_done
.Lstsp16_full_014_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_014_ULT_done:
    bruge8 .Lstsp16_full_014_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_014_UGE_done
.Lstsp16_full_014_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_014_UGE_done:
    brslt8 .Lstsp16_full_014_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_014_SLT_done
.Lstsp16_full_014_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_014_SLT_done:
    brsge8 .Lstsp16_full_014_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_014_SGE_done
.Lstsp16_full_014_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_014_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r3, offset 0; F0 secondary 0x3B.
    ldi16 r4, 0x0300
    ldi8 r5, 0x13
    st8 [r4], r5
    ldi16 r4, 0x0301
    ldi8 r5, 0x4c
    st8 [r4], r5
    ldi16 r4, 0x0302
    ldi8 r5, 0x10
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb46a
    push16 r4
    ldi16 r4, 0xb58d
    push16 r4
    ldi16 r4, 0xb6b0
    push16 r4
    ldi16 r4, 0x9cb7
    push16 r4
    ldi16 r4, 0xb8f6
    push16 r4
    ldi16 r4, 0xba19
    push16 r4
    ldi16 r4, 0xbb3c
    push16 r4
    ldi16 r4, 0xdad3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3b, 0x00 ; TEST
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
    ldi16 r4, 0x0300
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0301
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_015_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_015_EQ_done
.Lstsp16_full_015_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_015_EQ_done:
    brne8 .Lstsp16_full_015_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_015_NE_done
.Lstsp16_full_015_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_015_NE_done:
    brult8 .Lstsp16_full_015_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_015_ULT_done
.Lstsp16_full_015_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_015_ULT_done:
    bruge8 .Lstsp16_full_015_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_015_UGE_done
.Lstsp16_full_015_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_015_UGE_done:
    brslt8 .Lstsp16_full_015_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_015_SLT_done
.Lstsp16_full_015_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_015_SLT_done:
    brsge8 .Lstsp16_full_015_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_015_SGE_done
.Lstsp16_full_015_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_015_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r3, offset 15; F0 secondary 0x3B.
    ldi16 r4, 0x030e
    ldi8 r5, 0x73
    st8 [r4], r5
    ldi16 r4, 0x030f
    ldi8 r5, 0x36
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x4d
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x15
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb49f
    push16 r4
    ldi16 r4, 0xb5c2
    push16 r4
    ldi16 r4, 0xb6e5
    push16 r4
    ldi16 r4, 0x9dee
    push16 r4
    ldi16 r4, 0xb92b
    push16 r4
    ldi16 r4, 0xba4e
    push16 r4
    ldi16 r4, 0xbb71
    push16 r4
    ldi16 r4, 0xdb1a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3b, 0x0f ; TEST
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
    ldi16 r4, 0x030e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0310
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_016_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_016_EQ_done
.Lstsp16_full_016_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_016_EQ_done:
    brne8 .Lstsp16_full_016_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_016_NE_done
.Lstsp16_full_016_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_016_NE_done:
    brult8 .Lstsp16_full_016_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_016_ULT_done
.Lstsp16_full_016_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_016_ULT_done:
    bruge8 .Lstsp16_full_016_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_016_UGE_done
.Lstsp16_full_016_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_016_UGE_done:
    brslt8 .Lstsp16_full_016_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_016_SLT_done
.Lstsp16_full_016_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_016_SLT_done:
    brsge8 .Lstsp16_full_016_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_016_SGE_done
.Lstsp16_full_016_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_016_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r3, offset 16; F0 secondary 0x3B.
    ldi16 r4, 0x030f
    ldi8 r5, 0x76
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x59
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x4e
    st8 [r4], r5
    ldi16 r4, 0x0312
    ldi8 r5, 0x1a
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb4d4
    push16 r4
    ldi16 r4, 0xb5f7
    push16 r4
    ldi16 r4, 0xb71a
    push16 r4
    ldi16 r4, 0x9f25
    push16 r4
    ldi16 r4, 0xb960
    push16 r4
    ldi16 r4, 0xba83
    push16 r4
    ldi16 r4, 0xbba6
    push16 r4
    ldi16 r4, 0xdb61
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3b, 0x10 ; TEST
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
    ldi16 r4, 0x030f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0311
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_017_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_017_EQ_done
.Lstsp16_full_017_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_017_EQ_done:
    brne8 .Lstsp16_full_017_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_017_NE_done
.Lstsp16_full_017_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_017_NE_done:
    brult8 .Lstsp16_full_017_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_017_ULT_done
.Lstsp16_full_017_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_017_ULT_done:
    bruge8 .Lstsp16_full_017_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_017_UGE_done
.Lstsp16_full_017_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_017_UGE_done:
    brslt8 .Lstsp16_full_017_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_017_SLT_done
.Lstsp16_full_017_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_017_SLT_done:
    brsge8 .Lstsp16_full_017_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_017_SGE_done
.Lstsp16_full_017_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_017_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r3, offset 127; F0 secondary 0x3B.
    ldi16 r4, 0x037e
    ldi8 r5, 0x79
    st8 [r4], r5
    ldi16 r4, 0x037f
    ldi8 r5, 0x7c
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x4f
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x1f
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb509
    push16 r4
    ldi16 r4, 0xb62c
    push16 r4
    ldi16 r4, 0xb74f
    push16 r4
    ldi16 r4, 0xa05c
    push16 r4
    ldi16 r4, 0xb995
    push16 r4
    ldi16 r4, 0xbab8
    push16 r4
    ldi16 r4, 0xbbdb
    push16 r4
    ldi16 r4, 0xdba8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3b, 0x7f ; TEST
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
    ldi16 r4, 0x037e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0380
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_018_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_018_EQ_done
.Lstsp16_full_018_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_018_EQ_done:
    brne8 .Lstsp16_full_018_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_018_NE_done
.Lstsp16_full_018_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_018_NE_done:
    brult8 .Lstsp16_full_018_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_018_ULT_done
.Lstsp16_full_018_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_018_ULT_done:
    bruge8 .Lstsp16_full_018_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_018_UGE_done
.Lstsp16_full_018_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_018_UGE_done:
    brslt8 .Lstsp16_full_018_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_018_SLT_done
.Lstsp16_full_018_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_018_SLT_done:
    brsge8 .Lstsp16_full_018_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_018_SGE_done
.Lstsp16_full_018_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_018_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r3, offset 128; F0 secondary 0x3B.
    ldi16 r4, 0x037f
    ldi8 r5, 0x7c
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x9f
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x50
    st8 [r4], r5
    ldi16 r4, 0x0382
    ldi8 r5, 0x24
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb53e
    push16 r4
    ldi16 r4, 0xb661
    push16 r4
    ldi16 r4, 0xb784
    push16 r4
    ldi16 r4, 0xa193
    push16 r4
    ldi16 r4, 0xb9ca
    push16 r4
    ldi16 r4, 0xbaed
    push16 r4
    ldi16 r4, 0xbc10
    push16 r4
    ldi16 r4, 0xdbef
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3b, 0x80 ; TEST
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
    ldi16 r4, 0x037f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0381
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_019_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_019_EQ_done
.Lstsp16_full_019_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_019_EQ_done:
    brne8 .Lstsp16_full_019_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_019_NE_done
.Lstsp16_full_019_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_019_NE_done:
    brult8 .Lstsp16_full_019_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_019_ULT_done
.Lstsp16_full_019_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_019_ULT_done:
    bruge8 .Lstsp16_full_019_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_019_UGE_done
.Lstsp16_full_019_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_019_UGE_done:
    brslt8 .Lstsp16_full_019_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_019_SLT_done
.Lstsp16_full_019_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_019_SLT_done:
    brsge8 .Lstsp16_full_019_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_019_SGE_done
.Lstsp16_full_019_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_019_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r3, offset 254; F0 secondary 0x3B.
    ldi16 r4, 0x03fd
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x03fe
    ldi8 r5, 0xc2
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0x51
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x29
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb573
    push16 r4
    ldi16 r4, 0xb696
    push16 r4
    ldi16 r4, 0xb7b9
    push16 r4
    ldi16 r4, 0xa2ca
    push16 r4
    ldi16 r4, 0xb9ff
    push16 r4
    ldi16 r4, 0xbb22
    push16 r4
    ldi16 r4, 0xbc45
    push16 r4
    ldi16 r4, 0xdc36
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3b, 0xfe ; TEST
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
    ldi16 r4, 0x03fd
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x03ff
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_01a_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01a_EQ_done
.Lstsp16_full_01a_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_01a_EQ_done:
    brne8 .Lstsp16_full_01a_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01a_NE_done
.Lstsp16_full_01a_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_01a_NE_done:
    brult8 .Lstsp16_full_01a_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01a_ULT_done
.Lstsp16_full_01a_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_01a_ULT_done:
    bruge8 .Lstsp16_full_01a_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01a_UGE_done
.Lstsp16_full_01a_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01a_UGE_done:
    brslt8 .Lstsp16_full_01a_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01a_SLT_done
.Lstsp16_full_01a_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_01a_SLT_done:
    brsge8 .Lstsp16_full_01a_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01a_SGE_done
.Lstsp16_full_01a_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01a_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r3, offset 255; F0 secondary 0x3B.
    ldi16 r4, 0x03fe
    ldi8 r5, 0x82
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0xe5
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x52
    st8 [r4], r5
    ldi16 r4, 0x0401
    ldi8 r5, 0x2e
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb5a8
    push16 r4
    ldi16 r4, 0xb6cb
    push16 r4
    ldi16 r4, 0xb7ee
    push16 r4
    ldi16 r4, 0xa401
    push16 r4
    ldi16 r4, 0xba34
    push16 r4
    ldi16 r4, 0xbb57
    push16 r4
    ldi16 r4, 0xbc7a
    push16 r4
    ldi16 r4, 0xdc7d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3b, 0xff ; TEST
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
    ldi16 r4, 0x03fe
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0400
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_01b_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01b_EQ_done
.Lstsp16_full_01b_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_01b_EQ_done:
    brne8 .Lstsp16_full_01b_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01b_NE_done
.Lstsp16_full_01b_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_01b_NE_done:
    brult8 .Lstsp16_full_01b_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01b_ULT_done
.Lstsp16_full_01b_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_01b_ULT_done:
    bruge8 .Lstsp16_full_01b_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01b_UGE_done
.Lstsp16_full_01b_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01b_UGE_done:
    brslt8 .Lstsp16_full_01b_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01b_SLT_done
.Lstsp16_full_01b_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_01b_SLT_done:
    brsge8 .Lstsp16_full_01b_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01b_SGE_done
.Lstsp16_full_01b_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01b_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r4, offset 0; F0 secondary 0x3C.
    ldi16 r4, 0x0300
    ldi8 r5, 0x19
    st8 [r4], r5
    ldi16 r4, 0x0301
    ldi8 r5, 0x65
    st8 [r4], r5
    ldi16 r4, 0x0302
    ldi8 r5, 0x33
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb5dd
    push16 r4
    ldi16 r4, 0xb700
    push16 r4
    ldi16 r4, 0xb823
    push16 r4
    ldi16 r4, 0xb946
    push16 r4
    ldi16 r4, 0xa649
    push16 r4
    ldi16 r4, 0xbb8c
    push16 r4
    ldi16 r4, 0xbcaf
    push16 r4
    ldi16 r4, 0xdcc4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3c, 0x00 ; TEST
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
    ldi16 r4, 0x0300
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0301
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_01c_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01c_EQ_done
.Lstsp16_full_01c_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_01c_EQ_done:
    brne8 .Lstsp16_full_01c_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01c_NE_done
.Lstsp16_full_01c_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_01c_NE_done:
    brult8 .Lstsp16_full_01c_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01c_ULT_done
.Lstsp16_full_01c_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_01c_ULT_done:
    bruge8 .Lstsp16_full_01c_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01c_UGE_done
.Lstsp16_full_01c_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01c_UGE_done:
    brslt8 .Lstsp16_full_01c_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01c_SLT_done
.Lstsp16_full_01c_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_01c_SLT_done:
    brsge8 .Lstsp16_full_01c_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01c_SGE_done
.Lstsp16_full_01c_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01c_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r4, offset 15; F0 secondary 0x3C.
    ldi16 r4, 0x030e
    ldi8 r5, 0x88
    st8 [r4], r5
    ldi16 r4, 0x030f
    ldi8 r5, 0x3c
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x66
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x38
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb612
    push16 r4
    ldi16 r4, 0xb735
    push16 r4
    ldi16 r4, 0xb858
    push16 r4
    ldi16 r4, 0xb97b
    push16 r4
    ldi16 r4, 0xa780
    push16 r4
    ldi16 r4, 0xbbc1
    push16 r4
    ldi16 r4, 0xbce4
    push16 r4
    ldi16 r4, 0xdd0b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3c, 0x0f ; TEST
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
    ldi16 r4, 0x030e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0310
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_01d_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01d_EQ_done
.Lstsp16_full_01d_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_01d_EQ_done:
    brne8 .Lstsp16_full_01d_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01d_NE_done
.Lstsp16_full_01d_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_01d_NE_done:
    brult8 .Lstsp16_full_01d_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01d_ULT_done
.Lstsp16_full_01d_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_01d_ULT_done:
    bruge8 .Lstsp16_full_01d_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01d_UGE_done
.Lstsp16_full_01d_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01d_UGE_done:
    brslt8 .Lstsp16_full_01d_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01d_SLT_done
.Lstsp16_full_01d_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_01d_SLT_done:
    brsge8 .Lstsp16_full_01d_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01d_SGE_done
.Lstsp16_full_01d_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01d_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r4, offset 16; F0 secondary 0x3C.
    ldi16 r4, 0x030f
    ldi8 r5, 0x8b
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x5f
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x67
    st8 [r4], r5
    ldi16 r4, 0x0312
    ldi8 r5, 0x3d
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb647
    push16 r4
    ldi16 r4, 0xb76a
    push16 r4
    ldi16 r4, 0xb88d
    push16 r4
    ldi16 r4, 0xb9b0
    push16 r4
    ldi16 r4, 0xa8b7
    push16 r4
    ldi16 r4, 0xbbf6
    push16 r4
    ldi16 r4, 0xbd19
    push16 r4
    ldi16 r4, 0xdd52
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3c, 0x10 ; TEST
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
    ldi16 r4, 0x030f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0311
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_01e_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01e_EQ_done
.Lstsp16_full_01e_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_01e_EQ_done:
    brne8 .Lstsp16_full_01e_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01e_NE_done
.Lstsp16_full_01e_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_01e_NE_done:
    brult8 .Lstsp16_full_01e_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01e_ULT_done
.Lstsp16_full_01e_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_01e_ULT_done:
    bruge8 .Lstsp16_full_01e_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01e_UGE_done
.Lstsp16_full_01e_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01e_UGE_done:
    brslt8 .Lstsp16_full_01e_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01e_SLT_done
.Lstsp16_full_01e_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_01e_SLT_done:
    brsge8 .Lstsp16_full_01e_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01e_SGE_done
.Lstsp16_full_01e_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01e_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r4, offset 127; F0 secondary 0x3C.
    ldi16 r4, 0x037e
    ldi8 r5, 0x8e
    st8 [r4], r5
    ldi16 r4, 0x037f
    ldi8 r5, 0x82
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x68
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x42
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb67c
    push16 r4
    ldi16 r4, 0xb79f
    push16 r4
    ldi16 r4, 0xb8c2
    push16 r4
    ldi16 r4, 0xb9e5
    push16 r4
    ldi16 r4, 0xa9ee
    push16 r4
    ldi16 r4, 0xbc2b
    push16 r4
    ldi16 r4, 0xbd4e
    push16 r4
    ldi16 r4, 0xdd99
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3c, 0x7f ; TEST
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
    ldi16 r4, 0x037e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0380
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_01f_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01f_EQ_done
.Lstsp16_full_01f_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_01f_EQ_done:
    brne8 .Lstsp16_full_01f_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01f_NE_done
.Lstsp16_full_01f_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_01f_NE_done:
    brult8 .Lstsp16_full_01f_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01f_ULT_done
.Lstsp16_full_01f_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_01f_ULT_done:
    bruge8 .Lstsp16_full_01f_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01f_UGE_done
.Lstsp16_full_01f_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01f_UGE_done:
    brslt8 .Lstsp16_full_01f_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01f_SLT_done
.Lstsp16_full_01f_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_01f_SLT_done:
    brsge8 .Lstsp16_full_01f_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_01f_SGE_done
.Lstsp16_full_01f_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_01f_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r4, offset 128; F0 secondary 0x3C.
    ldi16 r4, 0x037f
    ldi8 r5, 0x91
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0xa5
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x69
    st8 [r4], r5
    ldi16 r4, 0x0382
    ldi8 r5, 0x47
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb6b1
    push16 r4
    ldi16 r4, 0xb7d4
    push16 r4
    ldi16 r4, 0xb8f7
    push16 r4
    ldi16 r4, 0xba1a
    push16 r4
    ldi16 r4, 0xab25
    push16 r4
    ldi16 r4, 0xbc60
    push16 r4
    ldi16 r4, 0xbd83
    push16 r4
    ldi16 r4, 0xdde0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3c, 0x80 ; TEST
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
    ldi16 r4, 0x037f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0381
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_020_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_020_EQ_done
.Lstsp16_full_020_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_020_EQ_done:
    brne8 .Lstsp16_full_020_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_020_NE_done
.Lstsp16_full_020_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_020_NE_done:
    brult8 .Lstsp16_full_020_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_020_ULT_done
.Lstsp16_full_020_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_020_ULT_done:
    bruge8 .Lstsp16_full_020_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_020_UGE_done
.Lstsp16_full_020_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_020_UGE_done:
    brslt8 .Lstsp16_full_020_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_020_SLT_done
.Lstsp16_full_020_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_020_SLT_done:
    brsge8 .Lstsp16_full_020_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_020_SGE_done
.Lstsp16_full_020_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_020_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r4, offset 254; F0 secondary 0x3C.
    ldi16 r4, 0x03fd
    ldi8 r5, 0x94
    st8 [r4], r5
    ldi16 r4, 0x03fe
    ldi8 r5, 0xc8
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0x6a
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x4c
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb6e6
    push16 r4
    ldi16 r4, 0xb809
    push16 r4
    ldi16 r4, 0xb92c
    push16 r4
    ldi16 r4, 0xba4f
    push16 r4
    ldi16 r4, 0xac5c
    push16 r4
    ldi16 r4, 0xbc95
    push16 r4
    ldi16 r4, 0xbdb8
    push16 r4
    ldi16 r4, 0xde27
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3c, 0xfe ; TEST
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
    ldi16 r4, 0x03fd
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x03ff
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_021_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_021_EQ_done
.Lstsp16_full_021_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_021_EQ_done:
    brne8 .Lstsp16_full_021_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_021_NE_done
.Lstsp16_full_021_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_021_NE_done:
    brult8 .Lstsp16_full_021_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_021_ULT_done
.Lstsp16_full_021_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_021_ULT_done:
    bruge8 .Lstsp16_full_021_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_021_UGE_done
.Lstsp16_full_021_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_021_UGE_done:
    brslt8 .Lstsp16_full_021_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_021_SLT_done
.Lstsp16_full_021_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_021_SLT_done:
    brsge8 .Lstsp16_full_021_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_021_SGE_done
.Lstsp16_full_021_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_021_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r4, offset 255; F0 secondary 0x3C.
    ldi16 r4, 0x03fe
    ldi8 r5, 0x97
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0xeb
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x6b
    st8 [r4], r5
    ldi16 r4, 0x0401
    ldi8 r5, 0x51
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb71b
    push16 r4
    ldi16 r4, 0xb83e
    push16 r4
    ldi16 r4, 0xb961
    push16 r4
    ldi16 r4, 0xba84
    push16 r4
    ldi16 r4, 0xad93
    push16 r4
    ldi16 r4, 0xbcca
    push16 r4
    ldi16 r4, 0xbded
    push16 r4
    ldi16 r4, 0xde6e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3c, 0xff ; TEST
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
    ldi16 r4, 0x03fe
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0400
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_022_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_022_EQ_done
.Lstsp16_full_022_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_022_EQ_done:
    brne8 .Lstsp16_full_022_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_022_NE_done
.Lstsp16_full_022_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_022_NE_done:
    brult8 .Lstsp16_full_022_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_022_ULT_done
.Lstsp16_full_022_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_022_ULT_done:
    bruge8 .Lstsp16_full_022_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_022_UGE_done
.Lstsp16_full_022_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_022_UGE_done:
    brslt8 .Lstsp16_full_022_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_022_SLT_done
.Lstsp16_full_022_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_022_SLT_done:
    brsge8 .Lstsp16_full_022_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_022_SGE_done
.Lstsp16_full_022_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_022_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r5, offset 0; F0 secondary 0x3D.
    ldi16 r4, 0x0300
    ldi8 r5, 0x1f
    st8 [r4], r5
    ldi16 r4, 0x0301
    ldi8 r5, 0x7e
    st8 [r4], r5
    ldi16 r4, 0x0302
    ldi8 r5, 0x56
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb750
    push16 r4
    ldi16 r4, 0xb873
    push16 r4
    ldi16 r4, 0xb996
    push16 r4
    ldi16 r4, 0xbab9
    push16 r4
    ldi16 r4, 0xbbdc
    push16 r4
    ldi16 r4, 0xafdb
    push16 r4
    ldi16 r4, 0xbe22
    push16 r4
    ldi16 r4, 0xdeb5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3d, 0x00 ; TEST
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
    ldi16 r4, 0x0300
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0301
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_023_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_023_EQ_done
.Lstsp16_full_023_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_023_EQ_done:
    brne8 .Lstsp16_full_023_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_023_NE_done
.Lstsp16_full_023_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_023_NE_done:
    brult8 .Lstsp16_full_023_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_023_ULT_done
.Lstsp16_full_023_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_023_ULT_done:
    bruge8 .Lstsp16_full_023_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_023_UGE_done
.Lstsp16_full_023_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_023_UGE_done:
    brslt8 .Lstsp16_full_023_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_023_SLT_done
.Lstsp16_full_023_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_023_SLT_done:
    brsge8 .Lstsp16_full_023_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_023_SGE_done
.Lstsp16_full_023_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_023_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r5, offset 15; F0 secondary 0x3D.
    ldi16 r4, 0x030e
    ldi8 r5, 0x9d
    st8 [r4], r5
    ldi16 r4, 0x030f
    ldi8 r5, 0x42
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x7f
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x5b
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb785
    push16 r4
    ldi16 r4, 0xb8a8
    push16 r4
    ldi16 r4, 0xb9cb
    push16 r4
    ldi16 r4, 0xbaee
    push16 r4
    ldi16 r4, 0xbc11
    push16 r4
    ldi16 r4, 0xb112
    push16 r4
    ldi16 r4, 0xbe57
    push16 r4
    ldi16 r4, 0xdefc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3d, 0x0f ; TEST
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
    ldi16 r4, 0x030e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0310
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_024_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_024_EQ_done
.Lstsp16_full_024_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_024_EQ_done:
    brne8 .Lstsp16_full_024_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_024_NE_done
.Lstsp16_full_024_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_024_NE_done:
    brult8 .Lstsp16_full_024_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_024_ULT_done
.Lstsp16_full_024_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_024_ULT_done:
    bruge8 .Lstsp16_full_024_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_024_UGE_done
.Lstsp16_full_024_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_024_UGE_done:
    brslt8 .Lstsp16_full_024_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_024_SLT_done
.Lstsp16_full_024_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_024_SLT_done:
    brsge8 .Lstsp16_full_024_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_024_SGE_done
.Lstsp16_full_024_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_024_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r5, offset 16; F0 secondary 0x3D.
    ldi16 r4, 0x030f
    ldi8 r5, 0xa0
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x65
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x80
    st8 [r4], r5
    ldi16 r4, 0x0312
    ldi8 r5, 0x60
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb7ba
    push16 r4
    ldi16 r4, 0xb8dd
    push16 r4
    ldi16 r4, 0xba00
    push16 r4
    ldi16 r4, 0xbb23
    push16 r4
    ldi16 r4, 0xbc46
    push16 r4
    ldi16 r4, 0xb249
    push16 r4
    ldi16 r4, 0xbe8c
    push16 r4
    ldi16 r4, 0xdf43
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3d, 0x10 ; TEST
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
    ldi16 r4, 0x030f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0311
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_025_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_025_EQ_done
.Lstsp16_full_025_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_025_EQ_done:
    brne8 .Lstsp16_full_025_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_025_NE_done
.Lstsp16_full_025_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_025_NE_done:
    brult8 .Lstsp16_full_025_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_025_ULT_done
.Lstsp16_full_025_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_025_ULT_done:
    bruge8 .Lstsp16_full_025_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_025_UGE_done
.Lstsp16_full_025_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_025_UGE_done:
    brslt8 .Lstsp16_full_025_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_025_SLT_done
.Lstsp16_full_025_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_025_SLT_done:
    brsge8 .Lstsp16_full_025_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_025_SGE_done
.Lstsp16_full_025_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_025_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r5, offset 127; F0 secondary 0x3D.
    ldi16 r4, 0x037e
    ldi8 r5, 0xa3
    st8 [r4], r5
    ldi16 r4, 0x037f
    ldi8 r5, 0x88
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x81
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x65
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb7ef
    push16 r4
    ldi16 r4, 0xb912
    push16 r4
    ldi16 r4, 0xba35
    push16 r4
    ldi16 r4, 0xbb58
    push16 r4
    ldi16 r4, 0xbc7b
    push16 r4
    ldi16 r4, 0xb380
    push16 r4
    ldi16 r4, 0xbec1
    push16 r4
    ldi16 r4, 0xdf8a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3d, 0x7f ; TEST
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
    ldi16 r4, 0x037e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0380
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_026_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_026_EQ_done
.Lstsp16_full_026_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_026_EQ_done:
    brne8 .Lstsp16_full_026_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_026_NE_done
.Lstsp16_full_026_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_026_NE_done:
    brult8 .Lstsp16_full_026_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_026_ULT_done
.Lstsp16_full_026_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_026_ULT_done:
    bruge8 .Lstsp16_full_026_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_026_UGE_done
.Lstsp16_full_026_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_026_UGE_done:
    brslt8 .Lstsp16_full_026_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_026_SLT_done
.Lstsp16_full_026_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_026_SLT_done:
    brsge8 .Lstsp16_full_026_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_026_SGE_done
.Lstsp16_full_026_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_026_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r5, offset 128; F0 secondary 0x3D.
    ldi16 r4, 0x037f
    ldi8 r5, 0xa6
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0xab
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x82
    st8 [r4], r5
    ldi16 r4, 0x0382
    ldi8 r5, 0x6a
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb824
    push16 r4
    ldi16 r4, 0xb947
    push16 r4
    ldi16 r4, 0xba6a
    push16 r4
    ldi16 r4, 0xbb8d
    push16 r4
    ldi16 r4, 0xbcb0
    push16 r4
    ldi16 r4, 0xb4b7
    push16 r4
    ldi16 r4, 0xbef6
    push16 r4
    ldi16 r4, 0xdfd1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3d, 0x80 ; TEST
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
    ldi16 r4, 0x037f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0381
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_027_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_027_EQ_done
.Lstsp16_full_027_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_027_EQ_done:
    brne8 .Lstsp16_full_027_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_027_NE_done
.Lstsp16_full_027_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_027_NE_done:
    brult8 .Lstsp16_full_027_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_027_ULT_done
.Lstsp16_full_027_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_027_ULT_done:
    bruge8 .Lstsp16_full_027_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_027_UGE_done
.Lstsp16_full_027_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_027_UGE_done:
    brslt8 .Lstsp16_full_027_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_027_SLT_done
.Lstsp16_full_027_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_027_SLT_done:
    brsge8 .Lstsp16_full_027_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_027_SGE_done
.Lstsp16_full_027_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_027_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r5, offset 254; F0 secondary 0x3D.
    ldi16 r4, 0x03fd
    ldi8 r5, 0xa9
    st8 [r4], r5
    ldi16 r4, 0x03fe
    ldi8 r5, 0xce
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0x83
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x6f
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb859
    push16 r4
    ldi16 r4, 0xb97c
    push16 r4
    ldi16 r4, 0xba9f
    push16 r4
    ldi16 r4, 0xbbc2
    push16 r4
    ldi16 r4, 0xbce5
    push16 r4
    ldi16 r4, 0xb5ee
    push16 r4
    ldi16 r4, 0xbf2b
    push16 r4
    ldi16 r4, 0xe018
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3d, 0xfe ; TEST
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
    ldi16 r4, 0x03fd
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x03ff
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_028_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_028_EQ_done
.Lstsp16_full_028_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_028_EQ_done:
    brne8 .Lstsp16_full_028_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_028_NE_done
.Lstsp16_full_028_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_028_NE_done:
    brult8 .Lstsp16_full_028_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_028_ULT_done
.Lstsp16_full_028_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_028_ULT_done:
    bruge8 .Lstsp16_full_028_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_028_UGE_done
.Lstsp16_full_028_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_028_UGE_done:
    brslt8 .Lstsp16_full_028_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_028_SLT_done
.Lstsp16_full_028_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_028_SLT_done:
    brsge8 .Lstsp16_full_028_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_028_SGE_done
.Lstsp16_full_028_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_028_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r5, offset 255; F0 secondary 0x3D.
    ldi16 r4, 0x03fe
    ldi8 r5, 0xac
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0xf1
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x84
    st8 [r4], r5
    ldi16 r4, 0x0401
    ldi8 r5, 0x74
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb88e
    push16 r4
    ldi16 r4, 0xb9b1
    push16 r4
    ldi16 r4, 0xbad4
    push16 r4
    ldi16 r4, 0xbbf7
    push16 r4
    ldi16 r4, 0xbd1a
    push16 r4
    ldi16 r4, 0xb725
    push16 r4
    ldi16 r4, 0xbf60
    push16 r4
    ldi16 r4, 0xe05f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3d, 0xff ; TEST
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
    ldi16 r4, 0x03fe
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0400
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_029_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_029_EQ_done
.Lstsp16_full_029_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_029_EQ_done:
    brne8 .Lstsp16_full_029_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_029_NE_done
.Lstsp16_full_029_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_029_NE_done:
    brult8 .Lstsp16_full_029_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_029_ULT_done
.Lstsp16_full_029_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_029_ULT_done:
    bruge8 .Lstsp16_full_029_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_029_UGE_done
.Lstsp16_full_029_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_029_UGE_done:
    brslt8 .Lstsp16_full_029_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_029_SLT_done
.Lstsp16_full_029_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_029_SLT_done:
    brsge8 .Lstsp16_full_029_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_029_SGE_done
.Lstsp16_full_029_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_029_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r6, offset 0; F0 secondary 0x3E.
    ldi16 r4, 0x0300
    ldi8 r5, 0x25
    st8 [r4], r5
    ldi16 r4, 0x0301
    ldi8 r5, 0x97
    st8 [r4], r5
    ldi16 r4, 0x0302
    ldi8 r5, 0x79
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb8c3
    push16 r4
    ldi16 r4, 0xb9e6
    push16 r4
    ldi16 r4, 0xbb09
    push16 r4
    ldi16 r4, 0xbc2c
    push16 r4
    ldi16 r4, 0xbd4f
    push16 r4
    ldi16 r4, 0xbe72
    push16 r4
    ldi16 r4, 0xb96d
    push16 r4
    ldi16 r4, 0xe0a6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3e, 0x00 ; TEST
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
    ldi16 r4, 0x0300
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0301
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_02a_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02a_EQ_done
.Lstsp16_full_02a_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_02a_EQ_done:
    brne8 .Lstsp16_full_02a_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02a_NE_done
.Lstsp16_full_02a_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_02a_NE_done:
    brult8 .Lstsp16_full_02a_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02a_ULT_done
.Lstsp16_full_02a_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_02a_ULT_done:
    bruge8 .Lstsp16_full_02a_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02a_UGE_done
.Lstsp16_full_02a_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02a_UGE_done:
    brslt8 .Lstsp16_full_02a_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02a_SLT_done
.Lstsp16_full_02a_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_02a_SLT_done:
    brsge8 .Lstsp16_full_02a_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02a_SGE_done
.Lstsp16_full_02a_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02a_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r6, offset 15; F0 secondary 0x3E.
    ldi16 r4, 0x030e
    ldi8 r5, 0xb2
    st8 [r4], r5
    ldi16 r4, 0x030f
    ldi8 r5, 0x48
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x98
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x7e
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb8f8
    push16 r4
    ldi16 r4, 0xba1b
    push16 r4
    ldi16 r4, 0xbb3e
    push16 r4
    ldi16 r4, 0xbc61
    push16 r4
    ldi16 r4, 0xbd84
    push16 r4
    ldi16 r4, 0xbea7
    push16 r4
    ldi16 r4, 0xbaa4
    push16 r4
    ldi16 r4, 0xe0ed
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3e, 0x0f ; TEST
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
    ldi16 r4, 0x030e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0310
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_02b_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02b_EQ_done
.Lstsp16_full_02b_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_02b_EQ_done:
    brne8 .Lstsp16_full_02b_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02b_NE_done
.Lstsp16_full_02b_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_02b_NE_done:
    brult8 .Lstsp16_full_02b_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02b_ULT_done
.Lstsp16_full_02b_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_02b_ULT_done:
    bruge8 .Lstsp16_full_02b_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02b_UGE_done
.Lstsp16_full_02b_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02b_UGE_done:
    brslt8 .Lstsp16_full_02b_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02b_SLT_done
.Lstsp16_full_02b_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_02b_SLT_done:
    brsge8 .Lstsp16_full_02b_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02b_SGE_done
.Lstsp16_full_02b_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02b_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r6, offset 16; F0 secondary 0x3E.
    ldi16 r4, 0x030f
    ldi8 r5, 0xb5
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x6b
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0x99
    st8 [r4], r5
    ldi16 r4, 0x0312
    ldi8 r5, 0x83
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb92d
    push16 r4
    ldi16 r4, 0xba50
    push16 r4
    ldi16 r4, 0xbb73
    push16 r4
    ldi16 r4, 0xbc96
    push16 r4
    ldi16 r4, 0xbdb9
    push16 r4
    ldi16 r4, 0xbedc
    push16 r4
    ldi16 r4, 0xbbdb
    push16 r4
    ldi16 r4, 0xe134
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3e, 0x10 ; TEST
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
    ldi16 r4, 0x030f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0311
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_02c_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02c_EQ_done
.Lstsp16_full_02c_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_02c_EQ_done:
    brne8 .Lstsp16_full_02c_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02c_NE_done
.Lstsp16_full_02c_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_02c_NE_done:
    brult8 .Lstsp16_full_02c_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02c_ULT_done
.Lstsp16_full_02c_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_02c_ULT_done:
    bruge8 .Lstsp16_full_02c_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02c_UGE_done
.Lstsp16_full_02c_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02c_UGE_done:
    brslt8 .Lstsp16_full_02c_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02c_SLT_done
.Lstsp16_full_02c_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_02c_SLT_done:
    brsge8 .Lstsp16_full_02c_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02c_SGE_done
.Lstsp16_full_02c_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02c_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r6, offset 127; F0 secondary 0x3E.
    ldi16 r4, 0x037e
    ldi8 r5, 0xb8
    st8 [r4], r5
    ldi16 r4, 0x037f
    ldi8 r5, 0x8e
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0x9a
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x88
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb962
    push16 r4
    ldi16 r4, 0xba85
    push16 r4
    ldi16 r4, 0xbba8
    push16 r4
    ldi16 r4, 0xbccb
    push16 r4
    ldi16 r4, 0xbdee
    push16 r4
    ldi16 r4, 0xbf11
    push16 r4
    ldi16 r4, 0xbd12
    push16 r4
    ldi16 r4, 0xe17b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3e, 0x7f ; TEST
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
    ldi16 r4, 0x037e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0380
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_02d_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02d_EQ_done
.Lstsp16_full_02d_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_02d_EQ_done:
    brne8 .Lstsp16_full_02d_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02d_NE_done
.Lstsp16_full_02d_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_02d_NE_done:
    brult8 .Lstsp16_full_02d_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02d_ULT_done
.Lstsp16_full_02d_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_02d_ULT_done:
    bruge8 .Lstsp16_full_02d_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02d_UGE_done
.Lstsp16_full_02d_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02d_UGE_done:
    brslt8 .Lstsp16_full_02d_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02d_SLT_done
.Lstsp16_full_02d_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_02d_SLT_done:
    brsge8 .Lstsp16_full_02d_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02d_SGE_done
.Lstsp16_full_02d_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02d_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r6, offset 128; F0 secondary 0x3E.
    ldi16 r4, 0x037f
    ldi8 r5, 0xbb
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0xb1
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0x9b
    st8 [r4], r5
    ldi16 r4, 0x0382
    ldi8 r5, 0x8d
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xb997
    push16 r4
    ldi16 r4, 0xbaba
    push16 r4
    ldi16 r4, 0xbbdd
    push16 r4
    ldi16 r4, 0xbd00
    push16 r4
    ldi16 r4, 0xbe23
    push16 r4
    ldi16 r4, 0xbf46
    push16 r4
    ldi16 r4, 0xbe49
    push16 r4
    ldi16 r4, 0xe1c2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3e, 0x80 ; TEST
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
    ldi16 r4, 0x037f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0381
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_02e_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02e_EQ_done
.Lstsp16_full_02e_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_02e_EQ_done:
    brne8 .Lstsp16_full_02e_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02e_NE_done
.Lstsp16_full_02e_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_02e_NE_done:
    brult8 .Lstsp16_full_02e_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02e_ULT_done
.Lstsp16_full_02e_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_02e_ULT_done:
    bruge8 .Lstsp16_full_02e_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02e_UGE_done
.Lstsp16_full_02e_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02e_UGE_done:
    brslt8 .Lstsp16_full_02e_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02e_SLT_done
.Lstsp16_full_02e_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_02e_SLT_done:
    brsge8 .Lstsp16_full_02e_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02e_SGE_done
.Lstsp16_full_02e_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02e_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r6, offset 254; F0 secondary 0x3E.
    ldi16 r4, 0x03fd
    ldi8 r5, 0xbe
    st8 [r4], r5
    ldi16 r4, 0x03fe
    ldi8 r5, 0xd4
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0x9c
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x92
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xb9cc
    push16 r4
    ldi16 r4, 0xbaef
    push16 r4
    ldi16 r4, 0xbc12
    push16 r4
    ldi16 r4, 0xbd35
    push16 r4
    ldi16 r4, 0xbe58
    push16 r4
    ldi16 r4, 0xbf7b
    push16 r4
    ldi16 r4, 0xbf80
    push16 r4
    ldi16 r4, 0xe209
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3e, 0xfe ; TEST
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
    ldi16 r4, 0x03fd
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x03ff
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_02f_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02f_EQ_done
.Lstsp16_full_02f_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_02f_EQ_done:
    brne8 .Lstsp16_full_02f_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02f_NE_done
.Lstsp16_full_02f_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_02f_NE_done:
    brult8 .Lstsp16_full_02f_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02f_ULT_done
.Lstsp16_full_02f_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_02f_ULT_done:
    bruge8 .Lstsp16_full_02f_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02f_UGE_done
.Lstsp16_full_02f_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02f_UGE_done:
    brslt8 .Lstsp16_full_02f_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02f_SLT_done
.Lstsp16_full_02f_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_02f_SLT_done:
    brsge8 .Lstsp16_full_02f_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_02f_SGE_done
.Lstsp16_full_02f_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_02f_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r6, offset 255; F0 secondary 0x3E.
    ldi16 r4, 0x03fe
    ldi8 r5, 0xc1
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0xf7
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0x9d
    st8 [r4], r5
    ldi16 r4, 0x0401
    ldi8 r5, 0x97
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xba01
    push16 r4
    ldi16 r4, 0xbb24
    push16 r4
    ldi16 r4, 0xbc47
    push16 r4
    ldi16 r4, 0xbd6a
    push16 r4
    ldi16 r4, 0xbe8d
    push16 r4
    ldi16 r4, 0xbfb0
    push16 r4
    ldi16 r4, 0xc0b7
    push16 r4
    ldi16 r4, 0xe250
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3e, 0xff ; TEST
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
    ldi16 r4, 0x03fe
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0400
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_030_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_030_EQ_done
.Lstsp16_full_030_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_030_EQ_done:
    brne8 .Lstsp16_full_030_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_030_NE_done
.Lstsp16_full_030_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_030_NE_done:
    brult8 .Lstsp16_full_030_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_030_ULT_done
.Lstsp16_full_030_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_030_ULT_done:
    bruge8 .Lstsp16_full_030_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_030_UGE_done
.Lstsp16_full_030_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_030_UGE_done:
    brslt8 .Lstsp16_full_030_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_030_SLT_done
.Lstsp16_full_030_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_030_SLT_done:
    brsge8 .Lstsp16_full_030_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_030_SGE_done
.Lstsp16_full_030_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_030_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r7, offset 0; F0 secondary 0x3F.
    ldi16 r4, 0x0300
    ldi8 r5, 0x2b
    st8 [r4], r5
    ldi16 r4, 0x0301
    ldi8 r5, 0xb0
    st8 [r4], r5
    ldi16 r4, 0x0302
    ldi8 r5, 0x9c
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xba36
    push16 r4
    ldi16 r4, 0xbb59
    push16 r4
    ldi16 r4, 0xbc7c
    push16 r4
    ldi16 r4, 0xbd9f
    push16 r4
    ldi16 r4, 0xbec2
    push16 r4
    ldi16 r4, 0xbfe5
    push16 r4
    ldi16 r4, 0xe297
    push16 r4
    ldi16 r4, 0xc2ff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3f, 0x00 ; TEST
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
    ldi16 r4, 0x0300
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0301
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_031_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_031_EQ_done
.Lstsp16_full_031_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_031_EQ_done:
    brne8 .Lstsp16_full_031_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_031_NE_done
.Lstsp16_full_031_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_031_NE_done:
    brult8 .Lstsp16_full_031_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_031_ULT_done
.Lstsp16_full_031_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_031_ULT_done:
    bruge8 .Lstsp16_full_031_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_031_UGE_done
.Lstsp16_full_031_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_031_UGE_done:
    brslt8 .Lstsp16_full_031_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_031_SLT_done
.Lstsp16_full_031_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_031_SLT_done:
    brsge8 .Lstsp16_full_031_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_031_SGE_done
.Lstsp16_full_031_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_031_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r7, offset 15; F0 secondary 0x3F.
    ldi16 r4, 0x030e
    ldi8 r5, 0xc7
    st8 [r4], r5
    ldi16 r4, 0x030f
    ldi8 r5, 0x4e
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0xb1
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0xa1
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xba6b
    push16 r4
    ldi16 r4, 0xbb8e
    push16 r4
    ldi16 r4, 0xbcb1
    push16 r4
    ldi16 r4, 0xbdd4
    push16 r4
    ldi16 r4, 0xbef7
    push16 r4
    ldi16 r4, 0xc01a
    push16 r4
    ldi16 r4, 0xe2de
    push16 r4
    ldi16 r4, 0xc436
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3f, 0x0f ; TEST
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
    ldi16 r4, 0x030e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0310
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_032_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_032_EQ_done
.Lstsp16_full_032_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_032_EQ_done:
    brne8 .Lstsp16_full_032_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_032_NE_done
.Lstsp16_full_032_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_032_NE_done:
    brult8 .Lstsp16_full_032_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_032_ULT_done
.Lstsp16_full_032_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_032_ULT_done:
    bruge8 .Lstsp16_full_032_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_032_UGE_done
.Lstsp16_full_032_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_032_UGE_done:
    brslt8 .Lstsp16_full_032_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_032_SLT_done
.Lstsp16_full_032_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_032_SLT_done:
    brsge8 .Lstsp16_full_032_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_032_SGE_done
.Lstsp16_full_032_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_032_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r7, offset 16; F0 secondary 0x3F.
    ldi16 r4, 0x030f
    ldi8 r5, 0xca
    st8 [r4], r5
    ldi16 r4, 0x0310
    ldi8 r5, 0x71
    st8 [r4], r5
    ldi16 r4, 0x0311
    ldi8 r5, 0xb2
    st8 [r4], r5
    ldi16 r4, 0x0312
    ldi8 r5, 0xa6
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xbaa0
    push16 r4
    ldi16 r4, 0xbbc3
    push16 r4
    ldi16 r4, 0xbce6
    push16 r4
    ldi16 r4, 0xbe09
    push16 r4
    ldi16 r4, 0xbf2c
    push16 r4
    ldi16 r4, 0xc04f
    push16 r4
    ldi16 r4, 0xe325
    push16 r4
    ldi16 r4, 0xc56d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3f, 0x10 ; TEST
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
    ldi16 r4, 0x030f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0311
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_033_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_033_EQ_done
.Lstsp16_full_033_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_033_EQ_done:
    brne8 .Lstsp16_full_033_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_033_NE_done
.Lstsp16_full_033_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_033_NE_done:
    brult8 .Lstsp16_full_033_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_033_ULT_done
.Lstsp16_full_033_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_033_ULT_done:
    bruge8 .Lstsp16_full_033_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_033_UGE_done
.Lstsp16_full_033_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_033_UGE_done:
    brslt8 .Lstsp16_full_033_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_033_SLT_done
.Lstsp16_full_033_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_033_SLT_done:
    brsge8 .Lstsp16_full_033_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_033_SGE_done
.Lstsp16_full_033_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_033_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r7, offset 127; F0 secondary 0x3F.
    ldi16 r4, 0x037e
    ldi8 r5, 0xcd
    st8 [r4], r5
    ldi16 r4, 0x037f
    ldi8 r5, 0x94
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0xb3
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0xab
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xbad5
    push16 r4
    ldi16 r4, 0xbbf8
    push16 r4
    ldi16 r4, 0xbd1b
    push16 r4
    ldi16 r4, 0xbe3e
    push16 r4
    ldi16 r4, 0xbf61
    push16 r4
    ldi16 r4, 0xc084
    push16 r4
    ldi16 r4, 0xe36c
    push16 r4
    ldi16 r4, 0xc6a4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3f, 0x7f ; TEST
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
    ldi16 r4, 0x037e
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0380
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_034_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_034_EQ_done
.Lstsp16_full_034_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_034_EQ_done:
    brne8 .Lstsp16_full_034_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_034_NE_done
.Lstsp16_full_034_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_034_NE_done:
    brult8 .Lstsp16_full_034_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_034_ULT_done
.Lstsp16_full_034_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_034_ULT_done:
    bruge8 .Lstsp16_full_034_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_034_UGE_done
.Lstsp16_full_034_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_034_UGE_done:
    brslt8 .Lstsp16_full_034_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_034_SLT_done
.Lstsp16_full_034_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_034_SLT_done:
    brsge8 .Lstsp16_full_034_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_034_SGE_done
.Lstsp16_full_034_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_034_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r7, offset 128; F0 secondary 0x3F.
    ldi16 r4, 0x037f
    ldi8 r5, 0xd0
    st8 [r4], r5
    ldi16 r4, 0x0380
    ldi8 r5, 0xb7
    st8 [r4], r5
    ldi16 r4, 0x0381
    ldi8 r5, 0xb4
    st8 [r4], r5
    ldi16 r4, 0x0382
    ldi8 r5, 0xb0
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xbb0a
    push16 r4
    ldi16 r4, 0xbc2d
    push16 r4
    ldi16 r4, 0xbd50
    push16 r4
    ldi16 r4, 0xbe73
    push16 r4
    ldi16 r4, 0xbf96
    push16 r4
    ldi16 r4, 0xc0b9
    push16 r4
    ldi16 r4, 0xe3b3
    push16 r4
    ldi16 r4, 0xc7db
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3f, 0x80 ; TEST
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
    ldi16 r4, 0x037f
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0381
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_035_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_035_EQ_done
.Lstsp16_full_035_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_035_EQ_done:
    brne8 .Lstsp16_full_035_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_035_NE_done
.Lstsp16_full_035_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_035_NE_done:
    brult8 .Lstsp16_full_035_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_035_ULT_done
.Lstsp16_full_035_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_035_ULT_done:
    bruge8 .Lstsp16_full_035_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_035_UGE_done
.Lstsp16_full_035_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_035_UGE_done:
    brslt8 .Lstsp16_full_035_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_035_SLT_done
.Lstsp16_full_035_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_035_SLT_done:
    brsge8 .Lstsp16_full_035_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_035_SGE_done
.Lstsp16_full_035_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_035_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r7, offset 254; F0 secondary 0x3F.
    ldi16 r4, 0x03fd
    ldi8 r5, 0xd3
    st8 [r4], r5
    ldi16 r4, 0x03fe
    ldi8 r5, 0xda
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0xb5
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0xb5
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xbb3f
    push16 r4
    ldi16 r4, 0xbc62
    push16 r4
    ldi16 r4, 0xbd85
    push16 r4
    ldi16 r4, 0xbea8
    push16 r4
    ldi16 r4, 0xbfcb
    push16 r4
    ldi16 r4, 0xc0ee
    push16 r4
    ldi16 r4, 0xe3fa
    push16 r4
    ldi16 r4, 0xc912
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3f, 0xfe ; TEST
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
    ldi16 r4, 0x03fd
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x03ff
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_036_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_036_EQ_done
.Lstsp16_full_036_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_036_EQ_done:
    brne8 .Lstsp16_full_036_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_036_NE_done
.Lstsp16_full_036_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_036_NE_done:
    brult8 .Lstsp16_full_036_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_036_ULT_done
.Lstsp16_full_036_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_036_ULT_done:
    bruge8 .Lstsp16_full_036_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_036_UGE_done
.Lstsp16_full_036_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_036_UGE_done:
    brslt8 .Lstsp16_full_036_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_036_SLT_done
.Lstsp16_full_036_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_036_SLT_done:
    brsge8 .Lstsp16_full_036_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_036_SGE_done
.Lstsp16_full_036_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_036_SGE_done:
    cold_emit_char '\n'

    ; STSP16 r7, offset 255; F0 secondary 0x3F.
    ldi16 r4, 0x03fe
    ldi8 r5, 0xd6
    st8 [r4], r5
    ldi16 r4, 0x03ff
    ldi8 r5, 0xfd
    st8 [r4], r5
    ldi16 r4, 0x0400
    ldi8 r5, 0xb6
    st8 [r4], r5
    ldi16 r4, 0x0401
    ldi8 r5, 0xba
    st8 [r4], r5
    ldi16 r4, 0x0300
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xbb74
    push16 r4
    ldi16 r4, 0xbc97
    push16 r4
    ldi16 r4, 0xbdba
    push16 r4
    ldi16 r4, 0xbedd
    push16 r4
    ldi16 r4, 0xc000
    push16 r4
    ldi16 r4, 0xc123
    push16 r4
    ldi16 r4, 0xe441
    push16 r4
    ldi16 r4, 0xca49
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    .byte 0xf0, 0x3f, 0xff ; TEST
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
    ldi16 r4, 0x03fe
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    ldi16 r4, 0x0400
    ld16 r5, [r4]
    mov r0, r5
    call cold_print_r0_line
    breq8 .Lstsp16_full_037_EQ_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_037_EQ_done
.Lstsp16_full_037_EQ_true:
    cold_emit_char 'B'
.Lstsp16_full_037_EQ_done:
    brne8 .Lstsp16_full_037_NE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_037_NE_done
.Lstsp16_full_037_NE_true:
    cold_emit_char 'B'
.Lstsp16_full_037_NE_done:
    brult8 .Lstsp16_full_037_ULT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_037_ULT_done
.Lstsp16_full_037_ULT_true:
    cold_emit_char 'B'
.Lstsp16_full_037_ULT_done:
    bruge8 .Lstsp16_full_037_UGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_037_UGE_done
.Lstsp16_full_037_UGE_true:
    cold_emit_char 'B'
.Lstsp16_full_037_UGE_done:
    brslt8 .Lstsp16_full_037_SLT_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_037_SLT_done
.Lstsp16_full_037_SLT_true:
    cold_emit_char 'B'
.Lstsp16_full_037_SLT_done:
    brsge8 .Lstsp16_full_037_SGE_true
    cold_emit_char 'A'
    jmp8 .Lstsp16_full_037_SGE_done
.Lstsp16_full_037_SGE_true:
    cold_emit_char 'B'
.Lstsp16_full_037_SGE_done:
    cold_emit_char '\n'

    sys debug_break
