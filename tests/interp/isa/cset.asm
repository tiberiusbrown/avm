.include "include/conditional_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; cset.eq r0; path false; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0xa000
    push16 r4
    ldi16 r4, 0x5b01
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
    cset.eq r0
    push16 r1
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_000_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_000_EQ_done
.Lcset_000_EQ_true:
    cond_emit_char 'B'
.Lcset_000_EQ_done:
    brne8 .Lcset_000_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_000_NE_done
.Lcset_000_NE_true:
    cond_emit_char 'B'
.Lcset_000_NE_done:
    brult8 .Lcset_000_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_000_ULT_done
.Lcset_000_ULT_true:
    cond_emit_char 'B'
.Lcset_000_ULT_done:
    bruge8 .Lcset_000_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_000_UGE_done
.Lcset_000_UGE_true:
    cond_emit_char 'B'
.Lcset_000_UGE_done:
    brslt8 .Lcset_000_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_000_SLT_done
.Lcset_000_SLT_true:
    cond_emit_char 'B'
.Lcset_000_SLT_done:
    brsge8 .Lcset_000_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_000_SGE_done
.Lcset_000_SGE_true:
    cond_emit_char 'B'
.Lcset_000_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r0; path true; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa02d
    push16 r4
    ldi16 r4, 0x126b
    push16 r4
    ldi16 r4, 0x5c4b
    push16 r4
    ldi16 r4, 0x14b1
    push16 r4
    ldi16 r4, 0x15d4
    push16 r4
    ldi16 r4, 0x16f7
    push16 r4
    ldi16 r4, 0x181a
    push16 r4
    ldi16 r4, 0x193d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r0
    push16 r2
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_001_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_001_EQ_done
.Lcset_001_EQ_true:
    cond_emit_char 'B'
.Lcset_001_EQ_done:
    brne8 .Lcset_001_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_001_NE_done
.Lcset_001_NE_true:
    cond_emit_char 'B'
.Lcset_001_NE_done:
    brult8 .Lcset_001_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_001_ULT_done
.Lcset_001_ULT_true:
    cond_emit_char 'B'
.Lcset_001_ULT_done:
    bruge8 .Lcset_001_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_001_UGE_done
.Lcset_001_UGE_true:
    cond_emit_char 'B'
.Lcset_001_UGE_done:
    brslt8 .Lcset_001_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_001_SLT_done
.Lcset_001_SLT_true:
    cond_emit_char 'B'
.Lcset_001_SLT_done:
    brsge8 .Lcset_001_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_001_SGE_done
.Lcset_001_SGE_true:
    cond_emit_char 'B'
.Lcset_001_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r1; path false; guard r3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x117f
    push16 r4
    ldi16 r4, 0xa05b
    push16 r4
    ldi16 r4, 0x13c5
    push16 r4
    ldi16 r4, 0x5d95
    push16 r4
    ldi16 r4, 0x160b
    push16 r4
    ldi16 r4, 0x172e
    push16 r4
    ldi16 r4, 0x1851
    push16 r4
    ldi16 r4, 0x1974
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r1
    push16 r3
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_002_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_002_EQ_done
.Lcset_002_EQ_true:
    cond_emit_char 'B'
.Lcset_002_EQ_done:
    brne8 .Lcset_002_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_002_NE_done
.Lcset_002_NE_true:
    cond_emit_char 'B'
.Lcset_002_NE_done:
    brult8 .Lcset_002_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_002_ULT_done
.Lcset_002_ULT_true:
    cond_emit_char 'B'
.Lcset_002_ULT_done:
    bruge8 .Lcset_002_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_002_UGE_done
.Lcset_002_UGE_true:
    cond_emit_char 'B'
.Lcset_002_UGE_done:
    brslt8 .Lcset_002_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_002_SLT_done
.Lcset_002_SLT_true:
    cond_emit_char 'B'
.Lcset_002_SLT_done:
    brsge8 .Lcset_002_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_002_SGE_done
.Lcset_002_SGE_true:
    cond_emit_char 'B'
.Lcset_002_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r1; path true; guard r4.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x11b6
    push16 r4
    ldi16 r4, 0xa088
    push16 r4
    ldi16 r4, 0x13fc
    push16 r4
    ldi16 r4, 0x151f
    push16 r4
    ldi16 r4, 0x5edf
    push16 r4
    ldi16 r4, 0x1765
    push16 r4
    ldi16 r4, 0x1888
    push16 r4
    ldi16 r4, 0x19ab
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r1
    push16 r4
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_003_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_003_EQ_done
.Lcset_003_EQ_true:
    cond_emit_char 'B'
.Lcset_003_EQ_done:
    brne8 .Lcset_003_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_003_NE_done
.Lcset_003_NE_true:
    cond_emit_char 'B'
.Lcset_003_NE_done:
    brult8 .Lcset_003_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_003_ULT_done
.Lcset_003_ULT_true:
    cond_emit_char 'B'
.Lcset_003_ULT_done:
    bruge8 .Lcset_003_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_003_UGE_done
.Lcset_003_UGE_true:
    cond_emit_char 'B'
.Lcset_003_UGE_done:
    brslt8 .Lcset_003_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_003_SLT_done
.Lcset_003_SLT_true:
    cond_emit_char 'B'
.Lcset_003_SLT_done:
    brsge8 .Lcset_003_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_003_SGE_done
.Lcset_003_SGE_true:
    cond_emit_char 'B'
.Lcset_003_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r2; path false; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x11ed
    push16 r4
    ldi16 r4, 0x1310
    push16 r4
    ldi16 r4, 0xa0b6
    push16 r4
    ldi16 r4, 0x1556
    push16 r4
    ldi16 r4, 0x1679
    push16 r4
    ldi16 r4, 0x6029
    push16 r4
    ldi16 r4, 0x18bf
    push16 r4
    ldi16 r4, 0x19e2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r2
    push16 r5
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_004_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_004_EQ_done
.Lcset_004_EQ_true:
    cond_emit_char 'B'
.Lcset_004_EQ_done:
    brne8 .Lcset_004_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_004_NE_done
.Lcset_004_NE_true:
    cond_emit_char 'B'
.Lcset_004_NE_done:
    brult8 .Lcset_004_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_004_ULT_done
.Lcset_004_ULT_true:
    cond_emit_char 'B'
.Lcset_004_ULT_done:
    bruge8 .Lcset_004_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_004_UGE_done
.Lcset_004_UGE_true:
    cond_emit_char 'B'
.Lcset_004_UGE_done:
    brslt8 .Lcset_004_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_004_SLT_done
.Lcset_004_SLT_true:
    cond_emit_char 'B'
.Lcset_004_SLT_done:
    brsge8 .Lcset_004_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_004_SGE_done
.Lcset_004_SGE_true:
    cond_emit_char 'B'
.Lcset_004_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r2; path true; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1224
    push16 r4
    ldi16 r4, 0x1347
    push16 r4
    ldi16 r4, 0xa0e3
    push16 r4
    ldi16 r4, 0x158d
    push16 r4
    ldi16 r4, 0x16b0
    push16 r4
    ldi16 r4, 0x17d3
    push16 r4
    ldi16 r4, 0x6173
    push16 r4
    ldi16 r4, 0x1a19
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r2
    push16 r6
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_005_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_005_EQ_done
.Lcset_005_EQ_true:
    cond_emit_char 'B'
.Lcset_005_EQ_done:
    brne8 .Lcset_005_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_005_NE_done
.Lcset_005_NE_true:
    cond_emit_char 'B'
.Lcset_005_NE_done:
    brult8 .Lcset_005_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_005_ULT_done
.Lcset_005_ULT_true:
    cond_emit_char 'B'
.Lcset_005_ULT_done:
    bruge8 .Lcset_005_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_005_UGE_done
.Lcset_005_UGE_true:
    cond_emit_char 'B'
.Lcset_005_UGE_done:
    brslt8 .Lcset_005_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_005_SLT_done
.Lcset_005_SLT_true:
    cond_emit_char 'B'
.Lcset_005_SLT_done:
    brsge8 .Lcset_005_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_005_SGE_done
.Lcset_005_SGE_true:
    cond_emit_char 'B'
.Lcset_005_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r3; path false; guard r7.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x125b
    push16 r4
    ldi16 r4, 0x137e
    push16 r4
    ldi16 r4, 0x14a1
    push16 r4
    ldi16 r4, 0xa111
    push16 r4
    ldi16 r4, 0x16e7
    push16 r4
    ldi16 r4, 0x180a
    push16 r4
    ldi16 r4, 0x192d
    push16 r4
    ldi16 r4, 0x62bd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r3
    push16 r7
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_006_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_006_EQ_done
.Lcset_006_EQ_true:
    cond_emit_char 'B'
.Lcset_006_EQ_done:
    brne8 .Lcset_006_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_006_NE_done
.Lcset_006_NE_true:
    cond_emit_char 'B'
.Lcset_006_NE_done:
    brult8 .Lcset_006_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_006_ULT_done
.Lcset_006_ULT_true:
    cond_emit_char 'B'
.Lcset_006_ULT_done:
    bruge8 .Lcset_006_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_006_UGE_done
.Lcset_006_UGE_true:
    cond_emit_char 'B'
.Lcset_006_UGE_done:
    brslt8 .Lcset_006_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_006_SLT_done
.Lcset_006_SLT_true:
    cond_emit_char 'B'
.Lcset_006_SLT_done:
    brsge8 .Lcset_006_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_006_SGE_done
.Lcset_006_SGE_true:
    cond_emit_char 'B'
.Lcset_006_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r3; path true; guard r0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x5bff
    push16 r4
    ldi16 r4, 0x13b5
    push16 r4
    ldi16 r4, 0x14d8
    push16 r4
    ldi16 r4, 0xa13e
    push16 r4
    ldi16 r4, 0x171e
    push16 r4
    ldi16 r4, 0x1841
    push16 r4
    ldi16 r4, 0x1964
    push16 r4
    ldi16 r4, 0x1a87
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r3
    push16 r0
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_007_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_007_EQ_done
.Lcset_007_EQ_true:
    cond_emit_char 'B'
.Lcset_007_EQ_done:
    brne8 .Lcset_007_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_007_NE_done
.Lcset_007_NE_true:
    cond_emit_char 'B'
.Lcset_007_NE_done:
    brult8 .Lcset_007_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_007_ULT_done
.Lcset_007_ULT_true:
    cond_emit_char 'B'
.Lcset_007_ULT_done:
    bruge8 .Lcset_007_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_007_UGE_done
.Lcset_007_UGE_true:
    cond_emit_char 'B'
.Lcset_007_UGE_done:
    brslt8 .Lcset_007_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_007_SLT_done
.Lcset_007_SLT_true:
    cond_emit_char 'B'
.Lcset_007_SLT_done:
    brsge8 .Lcset_007_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_007_SGE_done
.Lcset_007_SGE_true:
    cond_emit_char 'B'
.Lcset_007_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r4; path false; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x12c9
    push16 r4
    ldi16 r4, 0x5d49
    push16 r4
    ldi16 r4, 0x150f
    push16 r4
    ldi16 r4, 0x1632
    push16 r4
    ldi16 r4, 0xa16c
    push16 r4
    ldi16 r4, 0x1878
    push16 r4
    ldi16 r4, 0x199b
    push16 r4
    ldi16 r4, 0x1abe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r4
    push16 r1
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_008_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_008_EQ_done
.Lcset_008_EQ_true:
    cond_emit_char 'B'
.Lcset_008_EQ_done:
    brne8 .Lcset_008_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_008_NE_done
.Lcset_008_NE_true:
    cond_emit_char 'B'
.Lcset_008_NE_done:
    brult8 .Lcset_008_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_008_ULT_done
.Lcset_008_ULT_true:
    cond_emit_char 'B'
.Lcset_008_ULT_done:
    bruge8 .Lcset_008_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_008_UGE_done
.Lcset_008_UGE_true:
    cond_emit_char 'B'
.Lcset_008_UGE_done:
    brslt8 .Lcset_008_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_008_SLT_done
.Lcset_008_SLT_true:
    cond_emit_char 'B'
.Lcset_008_SLT_done:
    brsge8 .Lcset_008_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_008_SGE_done
.Lcset_008_SGE_true:
    cond_emit_char 'B'
.Lcset_008_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r4; path true; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1300
    push16 r4
    ldi16 r4, 0x1423
    push16 r4
    ldi16 r4, 0x5e93
    push16 r4
    ldi16 r4, 0x1669
    push16 r4
    ldi16 r4, 0xa199
    push16 r4
    ldi16 r4, 0x18af
    push16 r4
    ldi16 r4, 0x19d2
    push16 r4
    ldi16 r4, 0x1af5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r4
    push16 r2
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_009_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_009_EQ_done
.Lcset_009_EQ_true:
    cond_emit_char 'B'
.Lcset_009_EQ_done:
    brne8 .Lcset_009_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_009_NE_done
.Lcset_009_NE_true:
    cond_emit_char 'B'
.Lcset_009_NE_done:
    brult8 .Lcset_009_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_009_ULT_done
.Lcset_009_ULT_true:
    cond_emit_char 'B'
.Lcset_009_ULT_done:
    bruge8 .Lcset_009_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_009_UGE_done
.Lcset_009_UGE_true:
    cond_emit_char 'B'
.Lcset_009_UGE_done:
    brslt8 .Lcset_009_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_009_SLT_done
.Lcset_009_SLT_true:
    cond_emit_char 'B'
.Lcset_009_SLT_done:
    brsge8 .Lcset_009_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_009_SGE_done
.Lcset_009_SGE_true:
    cond_emit_char 'B'
.Lcset_009_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r5; path false; guard r3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x1337
    push16 r4
    ldi16 r4, 0x145a
    push16 r4
    ldi16 r4, 0x157d
    push16 r4
    ldi16 r4, 0x5fdd
    push16 r4
    ldi16 r4, 0x17c3
    push16 r4
    ldi16 r4, 0xa1c7
    push16 r4
    ldi16 r4, 0x1a09
    push16 r4
    ldi16 r4, 0x1b2c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r5
    push16 r3
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_00a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_00a_EQ_done
.Lcset_00a_EQ_true:
    cond_emit_char 'B'
.Lcset_00a_EQ_done:
    brne8 .Lcset_00a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00a_NE_done
.Lcset_00a_NE_true:
    cond_emit_char 'B'
.Lcset_00a_NE_done:
    brult8 .Lcset_00a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00a_ULT_done
.Lcset_00a_ULT_true:
    cond_emit_char 'B'
.Lcset_00a_ULT_done:
    bruge8 .Lcset_00a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00a_UGE_done
.Lcset_00a_UGE_true:
    cond_emit_char 'B'
.Lcset_00a_UGE_done:
    brslt8 .Lcset_00a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00a_SLT_done
.Lcset_00a_SLT_true:
    cond_emit_char 'B'
.Lcset_00a_SLT_done:
    brsge8 .Lcset_00a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00a_SGE_done
.Lcset_00a_SGE_true:
    cond_emit_char 'B'
.Lcset_00a_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r5; path true; guard r4.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x136e
    push16 r4
    ldi16 r4, 0x1491
    push16 r4
    ldi16 r4, 0x15b4
    push16 r4
    ldi16 r4, 0x16d7
    push16 r4
    ldi16 r4, 0x6127
    push16 r4
    ldi16 r4, 0xa1f4
    push16 r4
    ldi16 r4, 0x1a40
    push16 r4
    ldi16 r4, 0x1b63
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r5
    push16 r4
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_00b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_00b_EQ_done
.Lcset_00b_EQ_true:
    cond_emit_char 'B'
.Lcset_00b_EQ_done:
    brne8 .Lcset_00b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00b_NE_done
.Lcset_00b_NE_true:
    cond_emit_char 'B'
.Lcset_00b_NE_done:
    brult8 .Lcset_00b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00b_ULT_done
.Lcset_00b_ULT_true:
    cond_emit_char 'B'
.Lcset_00b_ULT_done:
    bruge8 .Lcset_00b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00b_UGE_done
.Lcset_00b_UGE_true:
    cond_emit_char 'B'
.Lcset_00b_UGE_done:
    brslt8 .Lcset_00b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00b_SLT_done
.Lcset_00b_SLT_true:
    cond_emit_char 'B'
.Lcset_00b_SLT_done:
    brsge8 .Lcset_00b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00b_SGE_done
.Lcset_00b_SGE_true:
    cond_emit_char 'B'
.Lcset_00b_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r6; path false; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x13a5
    push16 r4
    ldi16 r4, 0x14c8
    push16 r4
    ldi16 r4, 0x15eb
    push16 r4
    ldi16 r4, 0x170e
    push16 r4
    ldi16 r4, 0x1831
    push16 r4
    ldi16 r4, 0x6271
    push16 r4
    ldi16 r4, 0xa222
    push16 r4
    ldi16 r4, 0x1b9a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r6
    push16 r5
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_00c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_00c_EQ_done
.Lcset_00c_EQ_true:
    cond_emit_char 'B'
.Lcset_00c_EQ_done:
    brne8 .Lcset_00c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00c_NE_done
.Lcset_00c_NE_true:
    cond_emit_char 'B'
.Lcset_00c_NE_done:
    brult8 .Lcset_00c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00c_ULT_done
.Lcset_00c_ULT_true:
    cond_emit_char 'B'
.Lcset_00c_ULT_done:
    bruge8 .Lcset_00c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00c_UGE_done
.Lcset_00c_UGE_true:
    cond_emit_char 'B'
.Lcset_00c_UGE_done:
    brslt8 .Lcset_00c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00c_SLT_done
.Lcset_00c_SLT_true:
    cond_emit_char 'B'
.Lcset_00c_SLT_done:
    brsge8 .Lcset_00c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00c_SGE_done
.Lcset_00c_SGE_true:
    cond_emit_char 'B'
.Lcset_00c_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r6; path true; guard r7.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x13dc
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
    ldi16 r4, 0xa24f
    push16 r4
    ldi16 r4, 0x64bc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r6
    push16 r7
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_00d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_00d_EQ_done
.Lcset_00d_EQ_true:
    cond_emit_char 'B'
.Lcset_00d_EQ_done:
    brne8 .Lcset_00d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00d_NE_done
.Lcset_00d_NE_true:
    cond_emit_char 'B'
.Lcset_00d_NE_done:
    brult8 .Lcset_00d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00d_ULT_done
.Lcset_00d_ULT_true:
    cond_emit_char 'B'
.Lcset_00d_ULT_done:
    bruge8 .Lcset_00d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00d_UGE_done
.Lcset_00d_UGE_true:
    cond_emit_char 'B'
.Lcset_00d_UGE_done:
    brslt8 .Lcset_00d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00d_SLT_done
.Lcset_00d_SLT_true:
    cond_emit_char 'B'
.Lcset_00d_SLT_done:
    brsge8 .Lcset_00d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00d_SGE_done
.Lcset_00d_SGE_true:
    cond_emit_char 'B'
.Lcset_00d_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r7; path false; guard r0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x5dfe
    push16 r4
    ldi16 r4, 0x1536
    push16 r4
    ldi16 r4, 0x1659
    push16 r4
    ldi16 r4, 0x177c
    push16 r4
    ldi16 r4, 0x189f
    push16 r4
    ldi16 r4, 0x19c2
    push16 r4
    ldi16 r4, 0x1ae5
    push16 r4
    ldi16 r4, 0xa27d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_00e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_00e_EQ_done
.Lcset_00e_EQ_true:
    cond_emit_char 'B'
.Lcset_00e_EQ_done:
    brne8 .Lcset_00e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00e_NE_done
.Lcset_00e_NE_true:
    cond_emit_char 'B'
.Lcset_00e_NE_done:
    brult8 .Lcset_00e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00e_ULT_done
.Lcset_00e_ULT_true:
    cond_emit_char 'B'
.Lcset_00e_ULT_done:
    bruge8 .Lcset_00e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00e_UGE_done
.Lcset_00e_UGE_true:
    cond_emit_char 'B'
.Lcset_00e_UGE_done:
    brslt8 .Lcset_00e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00e_SLT_done
.Lcset_00e_SLT_true:
    cond_emit_char 'B'
.Lcset_00e_SLT_done:
    brsge8 .Lcset_00e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00e_SGE_done
.Lcset_00e_SGE_true:
    cond_emit_char 'B'
.Lcset_00e_SGE_done:
    cond_emit_char '\n'

    ; cset.eq r7; path true; guard r0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x5e47
    push16 r4
    ldi16 r4, 0x156d
    push16 r4
    ldi16 r4, 0x1690
    push16 r4
    ldi16 r4, 0x17b3
    push16 r4
    ldi16 r4, 0x18d6
    push16 r4
    ldi16 r4, 0x19f9
    push16 r4
    ldi16 r4, 0x1b1c
    push16 r4
    ldi16 r4, 0xa2aa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.eq r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_00f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_00f_EQ_done
.Lcset_00f_EQ_true:
    cond_emit_char 'B'
.Lcset_00f_EQ_done:
    brne8 .Lcset_00f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00f_NE_done
.Lcset_00f_NE_true:
    cond_emit_char 'B'
.Lcset_00f_NE_done:
    brult8 .Lcset_00f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00f_ULT_done
.Lcset_00f_ULT_true:
    cond_emit_char 'B'
.Lcset_00f_ULT_done:
    bruge8 .Lcset_00f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00f_UGE_done
.Lcset_00f_UGE_true:
    cond_emit_char 'B'
.Lcset_00f_UGE_done:
    brslt8 .Lcset_00f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_00f_SLT_done
.Lcset_00f_SLT_true:
    cond_emit_char 'B'
.Lcset_00f_SLT_done:
    brsge8 .Lcset_00f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_00f_SGE_done
.Lcset_00f_SGE_true:
    cond_emit_char 'B'
.Lcset_00f_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r0; path false; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0xa2d0
    push16 r4
    ldi16 r4, 0x5f91
    push16 r4
    ldi16 r4, 0x16c7
    push16 r4
    ldi16 r4, 0x17ea
    push16 r4
    ldi16 r4, 0x190d
    push16 r4
    ldi16 r4, 0x1a30
    push16 r4
    ldi16 r4, 0x1b53
    push16 r4
    ldi16 r4, 0x1c76
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r0
    push16 r1
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_010_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_010_EQ_done
.Lcset_010_EQ_true:
    cond_emit_char 'B'
.Lcset_010_EQ_done:
    brne8 .Lcset_010_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_010_NE_done
.Lcset_010_NE_true:
    cond_emit_char 'B'
.Lcset_010_NE_done:
    brult8 .Lcset_010_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_010_ULT_done
.Lcset_010_ULT_true:
    cond_emit_char 'B'
.Lcset_010_ULT_done:
    bruge8 .Lcset_010_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_010_UGE_done
.Lcset_010_UGE_true:
    cond_emit_char 'B'
.Lcset_010_UGE_done:
    brslt8 .Lcset_010_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_010_SLT_done
.Lcset_010_SLT_true:
    cond_emit_char 'B'
.Lcset_010_SLT_done:
    brsge8 .Lcset_010_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_010_SGE_done
.Lcset_010_SGE_true:
    cond_emit_char 'B'
.Lcset_010_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r0; path true; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0xa2fd
    push16 r4
    ldi16 r4, 0x15db
    push16 r4
    ldi16 r4, 0x60db
    push16 r4
    ldi16 r4, 0x1821
    push16 r4
    ldi16 r4, 0x1944
    push16 r4
    ldi16 r4, 0x1a67
    push16 r4
    ldi16 r4, 0x1b8a
    push16 r4
    ldi16 r4, 0x1cad
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r0
    push16 r2
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_011_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_011_EQ_done
.Lcset_011_EQ_true:
    cond_emit_char 'B'
.Lcset_011_EQ_done:
    brne8 .Lcset_011_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_011_NE_done
.Lcset_011_NE_true:
    cond_emit_char 'B'
.Lcset_011_NE_done:
    brult8 .Lcset_011_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_011_ULT_done
.Lcset_011_ULT_true:
    cond_emit_char 'B'
.Lcset_011_ULT_done:
    bruge8 .Lcset_011_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_011_UGE_done
.Lcset_011_UGE_true:
    cond_emit_char 'B'
.Lcset_011_UGE_done:
    brslt8 .Lcset_011_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_011_SLT_done
.Lcset_011_SLT_true:
    cond_emit_char 'B'
.Lcset_011_SLT_done:
    brsge8 .Lcset_011_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_011_SGE_done
.Lcset_011_SGE_true:
    cond_emit_char 'B'
.Lcset_011_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r1; path false; guard r3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x14ef
    push16 r4
    ldi16 r4, 0xa32b
    push16 r4
    ldi16 r4, 0x1735
    push16 r4
    ldi16 r4, 0x6225
    push16 r4
    ldi16 r4, 0x197b
    push16 r4
    ldi16 r4, 0x1a9e
    push16 r4
    ldi16 r4, 0x1bc1
    push16 r4
    ldi16 r4, 0x1ce4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r1
    push16 r3
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_012_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_012_EQ_done
.Lcset_012_EQ_true:
    cond_emit_char 'B'
.Lcset_012_EQ_done:
    brne8 .Lcset_012_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_012_NE_done
.Lcset_012_NE_true:
    cond_emit_char 'B'
.Lcset_012_NE_done:
    brult8 .Lcset_012_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_012_ULT_done
.Lcset_012_ULT_true:
    cond_emit_char 'B'
.Lcset_012_ULT_done:
    bruge8 .Lcset_012_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_012_UGE_done
.Lcset_012_UGE_true:
    cond_emit_char 'B'
.Lcset_012_UGE_done:
    brslt8 .Lcset_012_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_012_SLT_done
.Lcset_012_SLT_true:
    cond_emit_char 'B'
.Lcset_012_SLT_done:
    brsge8 .Lcset_012_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_012_SGE_done
.Lcset_012_SGE_true:
    cond_emit_char 'B'
.Lcset_012_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r1; path true; guard r4.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x1526
    push16 r4
    ldi16 r4, 0xa358
    push16 r4
    ldi16 r4, 0x176c
    push16 r4
    ldi16 r4, 0x188f
    push16 r4
    ldi16 r4, 0x636f
    push16 r4
    ldi16 r4, 0x1ad5
    push16 r4
    ldi16 r4, 0x1bf8
    push16 r4
    ldi16 r4, 0x1d1b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r1
    push16 r4
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_013_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_013_EQ_done
.Lcset_013_EQ_true:
    cond_emit_char 'B'
.Lcset_013_EQ_done:
    brne8 .Lcset_013_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_013_NE_done
.Lcset_013_NE_true:
    cond_emit_char 'B'
.Lcset_013_NE_done:
    brult8 .Lcset_013_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_013_ULT_done
.Lcset_013_ULT_true:
    cond_emit_char 'B'
.Lcset_013_ULT_done:
    bruge8 .Lcset_013_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_013_UGE_done
.Lcset_013_UGE_true:
    cond_emit_char 'B'
.Lcset_013_UGE_done:
    brslt8 .Lcset_013_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_013_SLT_done
.Lcset_013_SLT_true:
    cond_emit_char 'B'
.Lcset_013_SLT_done:
    brsge8 .Lcset_013_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_013_SGE_done
.Lcset_013_SGE_true:
    cond_emit_char 'B'
.Lcset_013_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r2; path false; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x155d
    push16 r4
    ldi16 r4, 0x1680
    push16 r4
    ldi16 r4, 0xa386
    push16 r4
    ldi16 r4, 0x18c6
    push16 r4
    ldi16 r4, 0x19e9
    push16 r4
    ldi16 r4, 0x64b9
    push16 r4
    ldi16 r4, 0x1c2f
    push16 r4
    ldi16 r4, 0x1d52
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r2
    push16 r5
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_014_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_014_EQ_done
.Lcset_014_EQ_true:
    cond_emit_char 'B'
.Lcset_014_EQ_done:
    brne8 .Lcset_014_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_014_NE_done
.Lcset_014_NE_true:
    cond_emit_char 'B'
.Lcset_014_NE_done:
    brult8 .Lcset_014_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_014_ULT_done
.Lcset_014_ULT_true:
    cond_emit_char 'B'
.Lcset_014_ULT_done:
    bruge8 .Lcset_014_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_014_UGE_done
.Lcset_014_UGE_true:
    cond_emit_char 'B'
.Lcset_014_UGE_done:
    brslt8 .Lcset_014_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_014_SLT_done
.Lcset_014_SLT_true:
    cond_emit_char 'B'
.Lcset_014_SLT_done:
    brsge8 .Lcset_014_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_014_SGE_done
.Lcset_014_SGE_true:
    cond_emit_char 'B'
.Lcset_014_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r2; path true; guard r6.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x1594
    push16 r4
    ldi16 r4, 0x16b7
    push16 r4
    ldi16 r4, 0xa3b3
    push16 r4
    ldi16 r4, 0x18fd
    push16 r4
    ldi16 r4, 0x1a20
    push16 r4
    ldi16 r4, 0x1b43
    push16 r4
    ldi16 r4, 0x6603
    push16 r4
    ldi16 r4, 0x1d89
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r2
    push16 r6
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_015_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_015_EQ_done
.Lcset_015_EQ_true:
    cond_emit_char 'B'
.Lcset_015_EQ_done:
    brne8 .Lcset_015_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_015_NE_done
.Lcset_015_NE_true:
    cond_emit_char 'B'
.Lcset_015_NE_done:
    brult8 .Lcset_015_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_015_ULT_done
.Lcset_015_ULT_true:
    cond_emit_char 'B'
.Lcset_015_ULT_done:
    bruge8 .Lcset_015_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_015_UGE_done
.Lcset_015_UGE_true:
    cond_emit_char 'B'
.Lcset_015_UGE_done:
    brslt8 .Lcset_015_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_015_SLT_done
.Lcset_015_SLT_true:
    cond_emit_char 'B'
.Lcset_015_SLT_done:
    brsge8 .Lcset_015_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_015_SGE_done
.Lcset_015_SGE_true:
    cond_emit_char 'B'
.Lcset_015_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r3; path false; guard r7.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x15cb
    push16 r4
    ldi16 r4, 0x16ee
    push16 r4
    ldi16 r4, 0x1811
    push16 r4
    ldi16 r4, 0xa3e1
    push16 r4
    ldi16 r4, 0x1a57
    push16 r4
    ldi16 r4, 0x1b7a
    push16 r4
    ldi16 r4, 0x1c9d
    push16 r4
    ldi16 r4, 0x674d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r3
    push16 r7
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_016_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_016_EQ_done
.Lcset_016_EQ_true:
    cond_emit_char 'B'
.Lcset_016_EQ_done:
    brne8 .Lcset_016_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_016_NE_done
.Lcset_016_NE_true:
    cond_emit_char 'B'
.Lcset_016_NE_done:
    brult8 .Lcset_016_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_016_ULT_done
.Lcset_016_ULT_true:
    cond_emit_char 'B'
.Lcset_016_ULT_done:
    bruge8 .Lcset_016_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_016_UGE_done
.Lcset_016_UGE_true:
    cond_emit_char 'B'
.Lcset_016_UGE_done:
    brslt8 .Lcset_016_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_016_SLT_done
.Lcset_016_SLT_true:
    cond_emit_char 'B'
.Lcset_016_SLT_done:
    brsge8 .Lcset_016_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_016_SGE_done
.Lcset_016_SGE_true:
    cond_emit_char 'B'
.Lcset_016_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r3; path true; guard r0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x608f
    push16 r4
    ldi16 r4, 0x1725
    push16 r4
    ldi16 r4, 0x1848
    push16 r4
    ldi16 r4, 0xa40e
    push16 r4
    ldi16 r4, 0x1a8e
    push16 r4
    ldi16 r4, 0x1bb1
    push16 r4
    ldi16 r4, 0x1cd4
    push16 r4
    ldi16 r4, 0x1df7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r3
    push16 r0
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_017_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_017_EQ_done
.Lcset_017_EQ_true:
    cond_emit_char 'B'
.Lcset_017_EQ_done:
    brne8 .Lcset_017_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_017_NE_done
.Lcset_017_NE_true:
    cond_emit_char 'B'
.Lcset_017_NE_done:
    brult8 .Lcset_017_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_017_ULT_done
.Lcset_017_ULT_true:
    cond_emit_char 'B'
.Lcset_017_ULT_done:
    bruge8 .Lcset_017_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_017_UGE_done
.Lcset_017_UGE_true:
    cond_emit_char 'B'
.Lcset_017_UGE_done:
    brslt8 .Lcset_017_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_017_SLT_done
.Lcset_017_SLT_true:
    cond_emit_char 'B'
.Lcset_017_SLT_done:
    brsge8 .Lcset_017_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_017_SGE_done
.Lcset_017_SGE_true:
    cond_emit_char 'B'
.Lcset_017_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r4; path false; guard r1.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1639
    push16 r4
    ldi16 r4, 0x61d9
    push16 r4
    ldi16 r4, 0x187f
    push16 r4
    ldi16 r4, 0x19a2
    push16 r4
    ldi16 r4, 0xa43c
    push16 r4
    ldi16 r4, 0x1be8
    push16 r4
    ldi16 r4, 0x1d0b
    push16 r4
    ldi16 r4, 0x1e2e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r4
    push16 r1
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_018_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_018_EQ_done
.Lcset_018_EQ_true:
    cond_emit_char 'B'
.Lcset_018_EQ_done:
    brne8 .Lcset_018_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_018_NE_done
.Lcset_018_NE_true:
    cond_emit_char 'B'
.Lcset_018_NE_done:
    brult8 .Lcset_018_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_018_ULT_done
.Lcset_018_ULT_true:
    cond_emit_char 'B'
.Lcset_018_ULT_done:
    bruge8 .Lcset_018_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_018_UGE_done
.Lcset_018_UGE_true:
    cond_emit_char 'B'
.Lcset_018_UGE_done:
    brslt8 .Lcset_018_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_018_SLT_done
.Lcset_018_SLT_true:
    cond_emit_char 'B'
.Lcset_018_SLT_done:
    brsge8 .Lcset_018_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_018_SGE_done
.Lcset_018_SGE_true:
    cond_emit_char 'B'
.Lcset_018_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r4; path true; guard r2.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x1670
    push16 r4
    ldi16 r4, 0x1793
    push16 r4
    ldi16 r4, 0x6323
    push16 r4
    ldi16 r4, 0x19d9
    push16 r4
    ldi16 r4, 0xa469
    push16 r4
    ldi16 r4, 0x1c1f
    push16 r4
    ldi16 r4, 0x1d42
    push16 r4
    ldi16 r4, 0x1e65
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r4
    push16 r2
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_019_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_019_EQ_done
.Lcset_019_EQ_true:
    cond_emit_char 'B'
.Lcset_019_EQ_done:
    brne8 .Lcset_019_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_019_NE_done
.Lcset_019_NE_true:
    cond_emit_char 'B'
.Lcset_019_NE_done:
    brult8 .Lcset_019_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_019_ULT_done
.Lcset_019_ULT_true:
    cond_emit_char 'B'
.Lcset_019_ULT_done:
    bruge8 .Lcset_019_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_019_UGE_done
.Lcset_019_UGE_true:
    cond_emit_char 'B'
.Lcset_019_UGE_done:
    brslt8 .Lcset_019_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_019_SLT_done
.Lcset_019_SLT_true:
    cond_emit_char 'B'
.Lcset_019_SLT_done:
    brsge8 .Lcset_019_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_019_SGE_done
.Lcset_019_SGE_true:
    cond_emit_char 'B'
.Lcset_019_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r5; path false; guard r3.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x16a7
    push16 r4
    ldi16 r4, 0x17ca
    push16 r4
    ldi16 r4, 0x18ed
    push16 r4
    ldi16 r4, 0x646d
    push16 r4
    ldi16 r4, 0x1b33
    push16 r4
    ldi16 r4, 0xa497
    push16 r4
    ldi16 r4, 0x1d79
    push16 r4
    ldi16 r4, 0x1e9c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r5
    push16 r3
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_01a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_01a_EQ_done
.Lcset_01a_EQ_true:
    cond_emit_char 'B'
.Lcset_01a_EQ_done:
    brne8 .Lcset_01a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01a_NE_done
.Lcset_01a_NE_true:
    cond_emit_char 'B'
.Lcset_01a_NE_done:
    brult8 .Lcset_01a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01a_ULT_done
.Lcset_01a_ULT_true:
    cond_emit_char 'B'
.Lcset_01a_ULT_done:
    bruge8 .Lcset_01a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01a_UGE_done
.Lcset_01a_UGE_true:
    cond_emit_char 'B'
.Lcset_01a_UGE_done:
    brslt8 .Lcset_01a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01a_SLT_done
.Lcset_01a_SLT_true:
    cond_emit_char 'B'
.Lcset_01a_SLT_done:
    brsge8 .Lcset_01a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01a_SGE_done
.Lcset_01a_SGE_true:
    cond_emit_char 'B'
.Lcset_01a_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r5; path true; guard r4.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x16de
    push16 r4
    ldi16 r4, 0x1801
    push16 r4
    ldi16 r4, 0x1924
    push16 r4
    ldi16 r4, 0x1a47
    push16 r4
    ldi16 r4, 0x65b7
    push16 r4
    ldi16 r4, 0xa4c4
    push16 r4
    ldi16 r4, 0x1db0
    push16 r4
    ldi16 r4, 0x1ed3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r5
    push16 r4
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_01b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_01b_EQ_done
.Lcset_01b_EQ_true:
    cond_emit_char 'B'
.Lcset_01b_EQ_done:
    brne8 .Lcset_01b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01b_NE_done
.Lcset_01b_NE_true:
    cond_emit_char 'B'
.Lcset_01b_NE_done:
    brult8 .Lcset_01b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01b_ULT_done
.Lcset_01b_ULT_true:
    cond_emit_char 'B'
.Lcset_01b_ULT_done:
    bruge8 .Lcset_01b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01b_UGE_done
.Lcset_01b_UGE_true:
    cond_emit_char 'B'
.Lcset_01b_UGE_done:
    brslt8 .Lcset_01b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01b_SLT_done
.Lcset_01b_SLT_true:
    cond_emit_char 'B'
.Lcset_01b_SLT_done:
    brsge8 .Lcset_01b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01b_SGE_done
.Lcset_01b_SGE_true:
    cond_emit_char 'B'
.Lcset_01b_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r6; path false; guard r5.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1715
    push16 r4
    ldi16 r4, 0x1838
    push16 r4
    ldi16 r4, 0x195b
    push16 r4
    ldi16 r4, 0x1a7e
    push16 r4
    ldi16 r4, 0x1ba1
    push16 r4
    ldi16 r4, 0x6701
    push16 r4
    ldi16 r4, 0xa4f2
    push16 r4
    ldi16 r4, 0x1f0a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r6
    push16 r5
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_01c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_01c_EQ_done
.Lcset_01c_EQ_true:
    cond_emit_char 'B'
.Lcset_01c_EQ_done:
    brne8 .Lcset_01c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01c_NE_done
.Lcset_01c_NE_true:
    cond_emit_char 'B'
.Lcset_01c_NE_done:
    brult8 .Lcset_01c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01c_ULT_done
.Lcset_01c_ULT_true:
    cond_emit_char 'B'
.Lcset_01c_ULT_done:
    bruge8 .Lcset_01c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01c_UGE_done
.Lcset_01c_UGE_true:
    cond_emit_char 'B'
.Lcset_01c_UGE_done:
    brslt8 .Lcset_01c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01c_SLT_done
.Lcset_01c_SLT_true:
    cond_emit_char 'B'
.Lcset_01c_SLT_done:
    brsge8 .Lcset_01c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01c_SGE_done
.Lcset_01c_SGE_true:
    cond_emit_char 'B'
.Lcset_01c_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r6; path true; guard r7.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x174c
    push16 r4
    ldi16 r4, 0x186f
    push16 r4
    ldi16 r4, 0x1992
    push16 r4
    ldi16 r4, 0x1ab5
    push16 r4
    ldi16 r4, 0x1bd8
    push16 r4
    ldi16 r4, 0x1cfb
    push16 r4
    ldi16 r4, 0xa51f
    push16 r4
    ldi16 r4, 0x694c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r6
    push16 r7
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_01d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_01d_EQ_done
.Lcset_01d_EQ_true:
    cond_emit_char 'B'
.Lcset_01d_EQ_done:
    brne8 .Lcset_01d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01d_NE_done
.Lcset_01d_NE_true:
    cond_emit_char 'B'
.Lcset_01d_NE_done:
    brult8 .Lcset_01d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01d_ULT_done
.Lcset_01d_ULT_true:
    cond_emit_char 'B'
.Lcset_01d_ULT_done:
    bruge8 .Lcset_01d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01d_UGE_done
.Lcset_01d_UGE_true:
    cond_emit_char 'B'
.Lcset_01d_UGE_done:
    brslt8 .Lcset_01d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01d_SLT_done
.Lcset_01d_SLT_true:
    cond_emit_char 'B'
.Lcset_01d_SLT_done:
    brsge8 .Lcset_01d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01d_SGE_done
.Lcset_01d_SGE_true:
    cond_emit_char 'B'
.Lcset_01d_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r7; path false; guard r0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x628e
    push16 r4
    ldi16 r4, 0x18a6
    push16 r4
    ldi16 r4, 0x19c9
    push16 r4
    ldi16 r4, 0x1aec
    push16 r4
    ldi16 r4, 0x1c0f
    push16 r4
    ldi16 r4, 0x1d32
    push16 r4
    ldi16 r4, 0x1e55
    push16 r4
    ldi16 r4, 0xa54d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_01e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_01e_EQ_done
.Lcset_01e_EQ_true:
    cond_emit_char 'B'
.Lcset_01e_EQ_done:
    brne8 .Lcset_01e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01e_NE_done
.Lcset_01e_NE_true:
    cond_emit_char 'B'
.Lcset_01e_NE_done:
    brult8 .Lcset_01e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01e_ULT_done
.Lcset_01e_ULT_true:
    cond_emit_char 'B'
.Lcset_01e_ULT_done:
    bruge8 .Lcset_01e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01e_UGE_done
.Lcset_01e_UGE_true:
    cond_emit_char 'B'
.Lcset_01e_UGE_done:
    brslt8 .Lcset_01e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01e_SLT_done
.Lcset_01e_SLT_true:
    cond_emit_char 'B'
.Lcset_01e_SLT_done:
    brsge8 .Lcset_01e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01e_SGE_done
.Lcset_01e_SGE_true:
    cond_emit_char 'B'
.Lcset_01e_SGE_done:
    cond_emit_char '\n'

    ; cset.ne r7; path true; guard r0.
    ldi16 r6, 0x1357
    ldi16 r7, 0x2468
    cmp r6, r7
    ldi16 r4, 0x62d7
    push16 r4
    ldi16 r4, 0x18dd
    push16 r4
    ldi16 r4, 0x1a00
    push16 r4
    ldi16 r4, 0x1b23
    push16 r4
    ldi16 r4, 0x1c46
    push16 r4
    ldi16 r4, 0x1d69
    push16 r4
    ldi16 r4, 0x1e8c
    push16 r4
    ldi16 r4, 0xa57a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ne r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_01f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_01f_EQ_done
.Lcset_01f_EQ_true:
    cond_emit_char 'B'
.Lcset_01f_EQ_done:
    brne8 .Lcset_01f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01f_NE_done
.Lcset_01f_NE_true:
    cond_emit_char 'B'
.Lcset_01f_NE_done:
    brult8 .Lcset_01f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01f_ULT_done
.Lcset_01f_ULT_true:
    cond_emit_char 'B'
.Lcset_01f_ULT_done:
    bruge8 .Lcset_01f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01f_UGE_done
.Lcset_01f_UGE_true:
    cond_emit_char 'B'
.Lcset_01f_UGE_done:
    brslt8 .Lcset_01f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_01f_SLT_done
.Lcset_01f_SLT_true:
    cond_emit_char 'B'
.Lcset_01f_SLT_done:
    brsge8 .Lcset_01f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_01f_SGE_done
.Lcset_01f_SGE_true:
    cond_emit_char 'B'
.Lcset_01f_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r0; path false; guard r1.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0xa5a0
    push16 r4
    ldi16 r4, 0x6421
    push16 r4
    ldi16 r4, 0x1a37
    push16 r4
    ldi16 r4, 0x1b5a
    push16 r4
    ldi16 r4, 0x1c7d
    push16 r4
    ldi16 r4, 0x1da0
    push16 r4
    ldi16 r4, 0x1ec3
    push16 r4
    ldi16 r4, 0x1fe6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r0
    push16 r1
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_020_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_020_EQ_done
.Lcset_020_EQ_true:
    cond_emit_char 'B'
.Lcset_020_EQ_done:
    brne8 .Lcset_020_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_020_NE_done
.Lcset_020_NE_true:
    cond_emit_char 'B'
.Lcset_020_NE_done:
    brult8 .Lcset_020_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_020_ULT_done
.Lcset_020_ULT_true:
    cond_emit_char 'B'
.Lcset_020_ULT_done:
    bruge8 .Lcset_020_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_020_UGE_done
.Lcset_020_UGE_true:
    cond_emit_char 'B'
.Lcset_020_UGE_done:
    brslt8 .Lcset_020_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_020_SLT_done
.Lcset_020_SLT_true:
    cond_emit_char 'B'
.Lcset_020_SLT_done:
    brsge8 .Lcset_020_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_020_SGE_done
.Lcset_020_SGE_true:
    cond_emit_char 'B'
.Lcset_020_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r0; path true; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa5cd
    push16 r4
    ldi16 r4, 0x194b
    push16 r4
    ldi16 r4, 0x656b
    push16 r4
    ldi16 r4, 0x1b91
    push16 r4
    ldi16 r4, 0x1cb4
    push16 r4
    ldi16 r4, 0x1dd7
    push16 r4
    ldi16 r4, 0x1efa
    push16 r4
    ldi16 r4, 0x201d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r0
    push16 r2
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_021_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_021_EQ_done
.Lcset_021_EQ_true:
    cond_emit_char 'B'
.Lcset_021_EQ_done:
    brne8 .Lcset_021_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_021_NE_done
.Lcset_021_NE_true:
    cond_emit_char 'B'
.Lcset_021_NE_done:
    brult8 .Lcset_021_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_021_ULT_done
.Lcset_021_ULT_true:
    cond_emit_char 'B'
.Lcset_021_ULT_done:
    bruge8 .Lcset_021_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_021_UGE_done
.Lcset_021_UGE_true:
    cond_emit_char 'B'
.Lcset_021_UGE_done:
    brslt8 .Lcset_021_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_021_SLT_done
.Lcset_021_SLT_true:
    cond_emit_char 'B'
.Lcset_021_SLT_done:
    brsge8 .Lcset_021_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_021_SGE_done
.Lcset_021_SGE_true:
    cond_emit_char 'B'
.Lcset_021_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r1; path false; guard r3.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x185f
    push16 r4
    ldi16 r4, 0xa5fb
    push16 r4
    ldi16 r4, 0x1aa5
    push16 r4
    ldi16 r4, 0x66b5
    push16 r4
    ldi16 r4, 0x1ceb
    push16 r4
    ldi16 r4, 0x1e0e
    push16 r4
    ldi16 r4, 0x1f31
    push16 r4
    ldi16 r4, 0x2054
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r1
    push16 r3
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_022_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_022_EQ_done
.Lcset_022_EQ_true:
    cond_emit_char 'B'
.Lcset_022_EQ_done:
    brne8 .Lcset_022_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_022_NE_done
.Lcset_022_NE_true:
    cond_emit_char 'B'
.Lcset_022_NE_done:
    brult8 .Lcset_022_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_022_ULT_done
.Lcset_022_ULT_true:
    cond_emit_char 'B'
.Lcset_022_ULT_done:
    bruge8 .Lcset_022_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_022_UGE_done
.Lcset_022_UGE_true:
    cond_emit_char 'B'
.Lcset_022_UGE_done:
    brslt8 .Lcset_022_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_022_SLT_done
.Lcset_022_SLT_true:
    cond_emit_char 'B'
.Lcset_022_SLT_done:
    brsge8 .Lcset_022_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_022_SGE_done
.Lcset_022_SGE_true:
    cond_emit_char 'B'
.Lcset_022_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r1; path true; guard r4.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1896
    push16 r4
    ldi16 r4, 0xa628
    push16 r4
    ldi16 r4, 0x1adc
    push16 r4
    ldi16 r4, 0x1bff
    push16 r4
    ldi16 r4, 0x67ff
    push16 r4
    ldi16 r4, 0x1e45
    push16 r4
    ldi16 r4, 0x1f68
    push16 r4
    ldi16 r4, 0x208b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r1
    push16 r4
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_023_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_023_EQ_done
.Lcset_023_EQ_true:
    cond_emit_char 'B'
.Lcset_023_EQ_done:
    brne8 .Lcset_023_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_023_NE_done
.Lcset_023_NE_true:
    cond_emit_char 'B'
.Lcset_023_NE_done:
    brult8 .Lcset_023_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_023_ULT_done
.Lcset_023_ULT_true:
    cond_emit_char 'B'
.Lcset_023_ULT_done:
    bruge8 .Lcset_023_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_023_UGE_done
.Lcset_023_UGE_true:
    cond_emit_char 'B'
.Lcset_023_UGE_done:
    brslt8 .Lcset_023_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_023_SLT_done
.Lcset_023_SLT_true:
    cond_emit_char 'B'
.Lcset_023_SLT_done:
    brsge8 .Lcset_023_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_023_SGE_done
.Lcset_023_SGE_true:
    cond_emit_char 'B'
.Lcset_023_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r2; path false; guard r5.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x18cd
    push16 r4
    ldi16 r4, 0x19f0
    push16 r4
    ldi16 r4, 0xa656
    push16 r4
    ldi16 r4, 0x1c36
    push16 r4
    ldi16 r4, 0x1d59
    push16 r4
    ldi16 r4, 0x6949
    push16 r4
    ldi16 r4, 0x1f9f
    push16 r4
    ldi16 r4, 0x20c2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r2
    push16 r5
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_024_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_024_EQ_done
.Lcset_024_EQ_true:
    cond_emit_char 'B'
.Lcset_024_EQ_done:
    brne8 .Lcset_024_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_024_NE_done
.Lcset_024_NE_true:
    cond_emit_char 'B'
.Lcset_024_NE_done:
    brult8 .Lcset_024_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_024_ULT_done
.Lcset_024_ULT_true:
    cond_emit_char 'B'
.Lcset_024_ULT_done:
    bruge8 .Lcset_024_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_024_UGE_done
.Lcset_024_UGE_true:
    cond_emit_char 'B'
.Lcset_024_UGE_done:
    brslt8 .Lcset_024_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_024_SLT_done
.Lcset_024_SLT_true:
    cond_emit_char 'B'
.Lcset_024_SLT_done:
    brsge8 .Lcset_024_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_024_SGE_done
.Lcset_024_SGE_true:
    cond_emit_char 'B'
.Lcset_024_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r2; path true; guard r6.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1904
    push16 r4
    ldi16 r4, 0x1a27
    push16 r4
    ldi16 r4, 0xa683
    push16 r4
    ldi16 r4, 0x1c6d
    push16 r4
    ldi16 r4, 0x1d90
    push16 r4
    ldi16 r4, 0x1eb3
    push16 r4
    ldi16 r4, 0x6a93
    push16 r4
    ldi16 r4, 0x20f9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r2
    push16 r6
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_025_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_025_EQ_done
.Lcset_025_EQ_true:
    cond_emit_char 'B'
.Lcset_025_EQ_done:
    brne8 .Lcset_025_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_025_NE_done
.Lcset_025_NE_true:
    cond_emit_char 'B'
.Lcset_025_NE_done:
    brult8 .Lcset_025_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_025_ULT_done
.Lcset_025_ULT_true:
    cond_emit_char 'B'
.Lcset_025_ULT_done:
    bruge8 .Lcset_025_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_025_UGE_done
.Lcset_025_UGE_true:
    cond_emit_char 'B'
.Lcset_025_UGE_done:
    brslt8 .Lcset_025_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_025_SLT_done
.Lcset_025_SLT_true:
    cond_emit_char 'B'
.Lcset_025_SLT_done:
    brsge8 .Lcset_025_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_025_SGE_done
.Lcset_025_SGE_true:
    cond_emit_char 'B'
.Lcset_025_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r3; path false; guard r7.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x193b
    push16 r4
    ldi16 r4, 0x1a5e
    push16 r4
    ldi16 r4, 0x1b81
    push16 r4
    ldi16 r4, 0xa6b1
    push16 r4
    ldi16 r4, 0x1dc7
    push16 r4
    ldi16 r4, 0x1eea
    push16 r4
    ldi16 r4, 0x200d
    push16 r4
    ldi16 r4, 0x6bdd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r3
    push16 r7
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_026_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_026_EQ_done
.Lcset_026_EQ_true:
    cond_emit_char 'B'
.Lcset_026_EQ_done:
    brne8 .Lcset_026_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_026_NE_done
.Lcset_026_NE_true:
    cond_emit_char 'B'
.Lcset_026_NE_done:
    brult8 .Lcset_026_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_026_ULT_done
.Lcset_026_ULT_true:
    cond_emit_char 'B'
.Lcset_026_ULT_done:
    bruge8 .Lcset_026_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_026_UGE_done
.Lcset_026_UGE_true:
    cond_emit_char 'B'
.Lcset_026_UGE_done:
    brslt8 .Lcset_026_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_026_SLT_done
.Lcset_026_SLT_true:
    cond_emit_char 'B'
.Lcset_026_SLT_done:
    brsge8 .Lcset_026_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_026_SGE_done
.Lcset_026_SGE_true:
    cond_emit_char 'B'
.Lcset_026_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r3; path true; guard r0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x651f
    push16 r4
    ldi16 r4, 0x1a95
    push16 r4
    ldi16 r4, 0x1bb8
    push16 r4
    ldi16 r4, 0xa6de
    push16 r4
    ldi16 r4, 0x1dfe
    push16 r4
    ldi16 r4, 0x1f21
    push16 r4
    ldi16 r4, 0x2044
    push16 r4
    ldi16 r4, 0x2167
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r3
    push16 r0
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_027_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_027_EQ_done
.Lcset_027_EQ_true:
    cond_emit_char 'B'
.Lcset_027_EQ_done:
    brne8 .Lcset_027_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_027_NE_done
.Lcset_027_NE_true:
    cond_emit_char 'B'
.Lcset_027_NE_done:
    brult8 .Lcset_027_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_027_ULT_done
.Lcset_027_ULT_true:
    cond_emit_char 'B'
.Lcset_027_ULT_done:
    bruge8 .Lcset_027_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_027_UGE_done
.Lcset_027_UGE_true:
    cond_emit_char 'B'
.Lcset_027_UGE_done:
    brslt8 .Lcset_027_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_027_SLT_done
.Lcset_027_SLT_true:
    cond_emit_char 'B'
.Lcset_027_SLT_done:
    brsge8 .Lcset_027_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_027_SGE_done
.Lcset_027_SGE_true:
    cond_emit_char 'B'
.Lcset_027_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r4; path false; guard r1.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x19a9
    push16 r4
    ldi16 r4, 0x6669
    push16 r4
    ldi16 r4, 0x1bef
    push16 r4
    ldi16 r4, 0x1d12
    push16 r4
    ldi16 r4, 0xa70c
    push16 r4
    ldi16 r4, 0x1f58
    push16 r4
    ldi16 r4, 0x207b
    push16 r4
    ldi16 r4, 0x219e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r4
    push16 r1
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_028_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_028_EQ_done
.Lcset_028_EQ_true:
    cond_emit_char 'B'
.Lcset_028_EQ_done:
    brne8 .Lcset_028_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_028_NE_done
.Lcset_028_NE_true:
    cond_emit_char 'B'
.Lcset_028_NE_done:
    brult8 .Lcset_028_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_028_ULT_done
.Lcset_028_ULT_true:
    cond_emit_char 'B'
.Lcset_028_ULT_done:
    bruge8 .Lcset_028_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_028_UGE_done
.Lcset_028_UGE_true:
    cond_emit_char 'B'
.Lcset_028_UGE_done:
    brslt8 .Lcset_028_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_028_SLT_done
.Lcset_028_SLT_true:
    cond_emit_char 'B'
.Lcset_028_SLT_done:
    brsge8 .Lcset_028_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_028_SGE_done
.Lcset_028_SGE_true:
    cond_emit_char 'B'
.Lcset_028_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r4; path true; guard r2.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x19e0
    push16 r4
    ldi16 r4, 0x1b03
    push16 r4
    ldi16 r4, 0x67b3
    push16 r4
    ldi16 r4, 0x1d49
    push16 r4
    ldi16 r4, 0xa739
    push16 r4
    ldi16 r4, 0x1f8f
    push16 r4
    ldi16 r4, 0x20b2
    push16 r4
    ldi16 r4, 0x21d5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r4
    push16 r2
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_029_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_029_EQ_done
.Lcset_029_EQ_true:
    cond_emit_char 'B'
.Lcset_029_EQ_done:
    brne8 .Lcset_029_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_029_NE_done
.Lcset_029_NE_true:
    cond_emit_char 'B'
.Lcset_029_NE_done:
    brult8 .Lcset_029_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_029_ULT_done
.Lcset_029_ULT_true:
    cond_emit_char 'B'
.Lcset_029_ULT_done:
    bruge8 .Lcset_029_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_029_UGE_done
.Lcset_029_UGE_true:
    cond_emit_char 'B'
.Lcset_029_UGE_done:
    brslt8 .Lcset_029_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_029_SLT_done
.Lcset_029_SLT_true:
    cond_emit_char 'B'
.Lcset_029_SLT_done:
    brsge8 .Lcset_029_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_029_SGE_done
.Lcset_029_SGE_true:
    cond_emit_char 'B'
.Lcset_029_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r5; path false; guard r3.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x1a17
    push16 r4
    ldi16 r4, 0x1b3a
    push16 r4
    ldi16 r4, 0x1c5d
    push16 r4
    ldi16 r4, 0x68fd
    push16 r4
    ldi16 r4, 0x1ea3
    push16 r4
    ldi16 r4, 0xa767
    push16 r4
    ldi16 r4, 0x20e9
    push16 r4
    ldi16 r4, 0x220c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r5
    push16 r3
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_02a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_02a_EQ_done
.Lcset_02a_EQ_true:
    cond_emit_char 'B'
.Lcset_02a_EQ_done:
    brne8 .Lcset_02a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02a_NE_done
.Lcset_02a_NE_true:
    cond_emit_char 'B'
.Lcset_02a_NE_done:
    brult8 .Lcset_02a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02a_ULT_done
.Lcset_02a_ULT_true:
    cond_emit_char 'B'
.Lcset_02a_ULT_done:
    bruge8 .Lcset_02a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02a_UGE_done
.Lcset_02a_UGE_true:
    cond_emit_char 'B'
.Lcset_02a_UGE_done:
    brslt8 .Lcset_02a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02a_SLT_done
.Lcset_02a_SLT_true:
    cond_emit_char 'B'
.Lcset_02a_SLT_done:
    brsge8 .Lcset_02a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02a_SGE_done
.Lcset_02a_SGE_true:
    cond_emit_char 'B'
.Lcset_02a_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r5; path true; guard r4.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1a4e
    push16 r4
    ldi16 r4, 0x1b71
    push16 r4
    ldi16 r4, 0x1c94
    push16 r4
    ldi16 r4, 0x1db7
    push16 r4
    ldi16 r4, 0x6a47
    push16 r4
    ldi16 r4, 0xa794
    push16 r4
    ldi16 r4, 0x2120
    push16 r4
    ldi16 r4, 0x2243
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r5
    push16 r4
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_02b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_02b_EQ_done
.Lcset_02b_EQ_true:
    cond_emit_char 'B'
.Lcset_02b_EQ_done:
    brne8 .Lcset_02b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02b_NE_done
.Lcset_02b_NE_true:
    cond_emit_char 'B'
.Lcset_02b_NE_done:
    brult8 .Lcset_02b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02b_ULT_done
.Lcset_02b_ULT_true:
    cond_emit_char 'B'
.Lcset_02b_ULT_done:
    bruge8 .Lcset_02b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02b_UGE_done
.Lcset_02b_UGE_true:
    cond_emit_char 'B'
.Lcset_02b_UGE_done:
    brslt8 .Lcset_02b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02b_SLT_done
.Lcset_02b_SLT_true:
    cond_emit_char 'B'
.Lcset_02b_SLT_done:
    brsge8 .Lcset_02b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02b_SGE_done
.Lcset_02b_SGE_true:
    cond_emit_char 'B'
.Lcset_02b_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r6; path false; guard r5.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x1a85
    push16 r4
    ldi16 r4, 0x1ba8
    push16 r4
    ldi16 r4, 0x1ccb
    push16 r4
    ldi16 r4, 0x1dee
    push16 r4
    ldi16 r4, 0x1f11
    push16 r4
    ldi16 r4, 0x6b91
    push16 r4
    ldi16 r4, 0xa7c2
    push16 r4
    ldi16 r4, 0x227a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r6
    push16 r5
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_02c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_02c_EQ_done
.Lcset_02c_EQ_true:
    cond_emit_char 'B'
.Lcset_02c_EQ_done:
    brne8 .Lcset_02c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02c_NE_done
.Lcset_02c_NE_true:
    cond_emit_char 'B'
.Lcset_02c_NE_done:
    brult8 .Lcset_02c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02c_ULT_done
.Lcset_02c_ULT_true:
    cond_emit_char 'B'
.Lcset_02c_ULT_done:
    bruge8 .Lcset_02c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02c_UGE_done
.Lcset_02c_UGE_true:
    cond_emit_char 'B'
.Lcset_02c_UGE_done:
    brslt8 .Lcset_02c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02c_SLT_done
.Lcset_02c_SLT_true:
    cond_emit_char 'B'
.Lcset_02c_SLT_done:
    brsge8 .Lcset_02c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02c_SGE_done
.Lcset_02c_SGE_true:
    cond_emit_char 'B'
.Lcset_02c_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r6; path true; guard r7.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1abc
    push16 r4
    ldi16 r4, 0x1bdf
    push16 r4
    ldi16 r4, 0x1d02
    push16 r4
    ldi16 r4, 0x1e25
    push16 r4
    ldi16 r4, 0x1f48
    push16 r4
    ldi16 r4, 0x206b
    push16 r4
    ldi16 r4, 0xa7ef
    push16 r4
    ldi16 r4, 0x6ddc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r6
    push16 r7
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_02d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_02d_EQ_done
.Lcset_02d_EQ_true:
    cond_emit_char 'B'
.Lcset_02d_EQ_done:
    brne8 .Lcset_02d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02d_NE_done
.Lcset_02d_NE_true:
    cond_emit_char 'B'
.Lcset_02d_NE_done:
    brult8 .Lcset_02d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02d_ULT_done
.Lcset_02d_ULT_true:
    cond_emit_char 'B'
.Lcset_02d_ULT_done:
    bruge8 .Lcset_02d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02d_UGE_done
.Lcset_02d_UGE_true:
    cond_emit_char 'B'
.Lcset_02d_UGE_done:
    brslt8 .Lcset_02d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02d_SLT_done
.Lcset_02d_SLT_true:
    cond_emit_char 'B'
.Lcset_02d_SLT_done:
    brsge8 .Lcset_02d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02d_SGE_done
.Lcset_02d_SGE_true:
    cond_emit_char 'B'
.Lcset_02d_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r7; path false; guard r0.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x671e
    push16 r4
    ldi16 r4, 0x1c16
    push16 r4
    ldi16 r4, 0x1d39
    push16 r4
    ldi16 r4, 0x1e5c
    push16 r4
    ldi16 r4, 0x1f7f
    push16 r4
    ldi16 r4, 0x20a2
    push16 r4
    ldi16 r4, 0x21c5
    push16 r4
    ldi16 r4, 0xa81d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_02e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_02e_EQ_done
.Lcset_02e_EQ_true:
    cond_emit_char 'B'
.Lcset_02e_EQ_done:
    brne8 .Lcset_02e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02e_NE_done
.Lcset_02e_NE_true:
    cond_emit_char 'B'
.Lcset_02e_NE_done:
    brult8 .Lcset_02e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02e_ULT_done
.Lcset_02e_ULT_true:
    cond_emit_char 'B'
.Lcset_02e_ULT_done:
    bruge8 .Lcset_02e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02e_UGE_done
.Lcset_02e_UGE_true:
    cond_emit_char 'B'
.Lcset_02e_UGE_done:
    brslt8 .Lcset_02e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02e_SLT_done
.Lcset_02e_SLT_true:
    cond_emit_char 'B'
.Lcset_02e_SLT_done:
    brsge8 .Lcset_02e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02e_SGE_done
.Lcset_02e_SGE_true:
    cond_emit_char 'B'
.Lcset_02e_SGE_done:
    cond_emit_char '\n'

    ; cset.ult r7; path true; guard r0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x6767
    push16 r4
    ldi16 r4, 0x1c4d
    push16 r4
    ldi16 r4, 0x1d70
    push16 r4
    ldi16 r4, 0x1e93
    push16 r4
    ldi16 r4, 0x1fb6
    push16 r4
    ldi16 r4, 0x20d9
    push16 r4
    ldi16 r4, 0x21fc
    push16 r4
    ldi16 r4, 0xa84a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.ult r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_02f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_02f_EQ_done
.Lcset_02f_EQ_true:
    cond_emit_char 'B'
.Lcset_02f_EQ_done:
    brne8 .Lcset_02f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02f_NE_done
.Lcset_02f_NE_true:
    cond_emit_char 'B'
.Lcset_02f_NE_done:
    brult8 .Lcset_02f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02f_ULT_done
.Lcset_02f_ULT_true:
    cond_emit_char 'B'
.Lcset_02f_ULT_done:
    bruge8 .Lcset_02f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02f_UGE_done
.Lcset_02f_UGE_true:
    cond_emit_char 'B'
.Lcset_02f_UGE_done:
    brslt8 .Lcset_02f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_02f_SLT_done
.Lcset_02f_SLT_true:
    cond_emit_char 'B'
.Lcset_02f_SLT_done:
    brsge8 .Lcset_02f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_02f_SGE_done
.Lcset_02f_SGE_true:
    cond_emit_char 'B'
.Lcset_02f_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r0; path false; guard r1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xa870
    push16 r4
    ldi16 r4, 0x68b1
    push16 r4
    ldi16 r4, 0x1da7
    push16 r4
    ldi16 r4, 0x1eca
    push16 r4
    ldi16 r4, 0x1fed
    push16 r4
    ldi16 r4, 0x2110
    push16 r4
    ldi16 r4, 0x2233
    push16 r4
    ldi16 r4, 0x2356
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r0
    push16 r1
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_030_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_030_EQ_done
.Lcset_030_EQ_true:
    cond_emit_char 'B'
.Lcset_030_EQ_done:
    brne8 .Lcset_030_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_030_NE_done
.Lcset_030_NE_true:
    cond_emit_char 'B'
.Lcset_030_NE_done:
    brult8 .Lcset_030_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_030_ULT_done
.Lcset_030_ULT_true:
    cond_emit_char 'B'
.Lcset_030_ULT_done:
    bruge8 .Lcset_030_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_030_UGE_done
.Lcset_030_UGE_true:
    cond_emit_char 'B'
.Lcset_030_UGE_done:
    brslt8 .Lcset_030_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_030_SLT_done
.Lcset_030_SLT_true:
    cond_emit_char 'B'
.Lcset_030_SLT_done:
    brsge8 .Lcset_030_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_030_SGE_done
.Lcset_030_SGE_true:
    cond_emit_char 'B'
.Lcset_030_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r0; path true; guard r2.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0xa89d
    push16 r4
    ldi16 r4, 0x1cbb
    push16 r4
    ldi16 r4, 0x69fb
    push16 r4
    ldi16 r4, 0x1f01
    push16 r4
    ldi16 r4, 0x2024
    push16 r4
    ldi16 r4, 0x2147
    push16 r4
    ldi16 r4, 0x226a
    push16 r4
    ldi16 r4, 0x238d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r0
    push16 r2
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_031_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_031_EQ_done
.Lcset_031_EQ_true:
    cond_emit_char 'B'
.Lcset_031_EQ_done:
    brne8 .Lcset_031_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_031_NE_done
.Lcset_031_NE_true:
    cond_emit_char 'B'
.Lcset_031_NE_done:
    brult8 .Lcset_031_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_031_ULT_done
.Lcset_031_ULT_true:
    cond_emit_char 'B'
.Lcset_031_ULT_done:
    bruge8 .Lcset_031_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_031_UGE_done
.Lcset_031_UGE_true:
    cond_emit_char 'B'
.Lcset_031_UGE_done:
    brslt8 .Lcset_031_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_031_SLT_done
.Lcset_031_SLT_true:
    cond_emit_char 'B'
.Lcset_031_SLT_done:
    brsge8 .Lcset_031_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_031_SGE_done
.Lcset_031_SGE_true:
    cond_emit_char 'B'
.Lcset_031_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r1; path false; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1bcf
    push16 r4
    ldi16 r4, 0xa8cb
    push16 r4
    ldi16 r4, 0x1e15
    push16 r4
    ldi16 r4, 0x6b45
    push16 r4
    ldi16 r4, 0x205b
    push16 r4
    ldi16 r4, 0x217e
    push16 r4
    ldi16 r4, 0x22a1
    push16 r4
    ldi16 r4, 0x23c4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r1
    push16 r3
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_032_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_032_EQ_done
.Lcset_032_EQ_true:
    cond_emit_char 'B'
.Lcset_032_EQ_done:
    brne8 .Lcset_032_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_032_NE_done
.Lcset_032_NE_true:
    cond_emit_char 'B'
.Lcset_032_NE_done:
    brult8 .Lcset_032_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_032_ULT_done
.Lcset_032_ULT_true:
    cond_emit_char 'B'
.Lcset_032_ULT_done:
    bruge8 .Lcset_032_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_032_UGE_done
.Lcset_032_UGE_true:
    cond_emit_char 'B'
.Lcset_032_UGE_done:
    brslt8 .Lcset_032_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_032_SLT_done
.Lcset_032_SLT_true:
    cond_emit_char 'B'
.Lcset_032_SLT_done:
    brsge8 .Lcset_032_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_032_SGE_done
.Lcset_032_SGE_true:
    cond_emit_char 'B'
.Lcset_032_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r1; path true; guard r4.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x1c06
    push16 r4
    ldi16 r4, 0xa8f8
    push16 r4
    ldi16 r4, 0x1e4c
    push16 r4
    ldi16 r4, 0x1f6f
    push16 r4
    ldi16 r4, 0x6c8f
    push16 r4
    ldi16 r4, 0x21b5
    push16 r4
    ldi16 r4, 0x22d8
    push16 r4
    ldi16 r4, 0x23fb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r1
    push16 r4
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_033_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_033_EQ_done
.Lcset_033_EQ_true:
    cond_emit_char 'B'
.Lcset_033_EQ_done:
    brne8 .Lcset_033_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_033_NE_done
.Lcset_033_NE_true:
    cond_emit_char 'B'
.Lcset_033_NE_done:
    brult8 .Lcset_033_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_033_ULT_done
.Lcset_033_ULT_true:
    cond_emit_char 'B'
.Lcset_033_ULT_done:
    bruge8 .Lcset_033_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_033_UGE_done
.Lcset_033_UGE_true:
    cond_emit_char 'B'
.Lcset_033_UGE_done:
    brslt8 .Lcset_033_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_033_SLT_done
.Lcset_033_SLT_true:
    cond_emit_char 'B'
.Lcset_033_SLT_done:
    brsge8 .Lcset_033_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_033_SGE_done
.Lcset_033_SGE_true:
    cond_emit_char 'B'
.Lcset_033_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r2; path false; guard r5.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1c3d
    push16 r4
    ldi16 r4, 0x1d60
    push16 r4
    ldi16 r4, 0xa926
    push16 r4
    ldi16 r4, 0x1fa6
    push16 r4
    ldi16 r4, 0x20c9
    push16 r4
    ldi16 r4, 0x6dd9
    push16 r4
    ldi16 r4, 0x230f
    push16 r4
    ldi16 r4, 0x2432
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r2
    push16 r5
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_034_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_034_EQ_done
.Lcset_034_EQ_true:
    cond_emit_char 'B'
.Lcset_034_EQ_done:
    brne8 .Lcset_034_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_034_NE_done
.Lcset_034_NE_true:
    cond_emit_char 'B'
.Lcset_034_NE_done:
    brult8 .Lcset_034_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_034_ULT_done
.Lcset_034_ULT_true:
    cond_emit_char 'B'
.Lcset_034_ULT_done:
    bruge8 .Lcset_034_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_034_UGE_done
.Lcset_034_UGE_true:
    cond_emit_char 'B'
.Lcset_034_UGE_done:
    brslt8 .Lcset_034_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_034_SLT_done
.Lcset_034_SLT_true:
    cond_emit_char 'B'
.Lcset_034_SLT_done:
    brsge8 .Lcset_034_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_034_SGE_done
.Lcset_034_SGE_true:
    cond_emit_char 'B'
.Lcset_034_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r2; path true; guard r6.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x1c74
    push16 r4
    ldi16 r4, 0x1d97
    push16 r4
    ldi16 r4, 0xa953
    push16 r4
    ldi16 r4, 0x1fdd
    push16 r4
    ldi16 r4, 0x2100
    push16 r4
    ldi16 r4, 0x2223
    push16 r4
    ldi16 r4, 0x6f23
    push16 r4
    ldi16 r4, 0x2469
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r2
    push16 r6
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_035_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_035_EQ_done
.Lcset_035_EQ_true:
    cond_emit_char 'B'
.Lcset_035_EQ_done:
    brne8 .Lcset_035_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_035_NE_done
.Lcset_035_NE_true:
    cond_emit_char 'B'
.Lcset_035_NE_done:
    brult8 .Lcset_035_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_035_ULT_done
.Lcset_035_ULT_true:
    cond_emit_char 'B'
.Lcset_035_ULT_done:
    bruge8 .Lcset_035_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_035_UGE_done
.Lcset_035_UGE_true:
    cond_emit_char 'B'
.Lcset_035_UGE_done:
    brslt8 .Lcset_035_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_035_SLT_done
.Lcset_035_SLT_true:
    cond_emit_char 'B'
.Lcset_035_SLT_done:
    brsge8 .Lcset_035_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_035_SGE_done
.Lcset_035_SGE_true:
    cond_emit_char 'B'
.Lcset_035_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r3; path false; guard r7.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1cab
    push16 r4
    ldi16 r4, 0x1dce
    push16 r4
    ldi16 r4, 0x1ef1
    push16 r4
    ldi16 r4, 0xa981
    push16 r4
    ldi16 r4, 0x2137
    push16 r4
    ldi16 r4, 0x225a
    push16 r4
    ldi16 r4, 0x237d
    push16 r4
    ldi16 r4, 0x706d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r3
    push16 r7
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_036_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_036_EQ_done
.Lcset_036_EQ_true:
    cond_emit_char 'B'
.Lcset_036_EQ_done:
    brne8 .Lcset_036_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_036_NE_done
.Lcset_036_NE_true:
    cond_emit_char 'B'
.Lcset_036_NE_done:
    brult8 .Lcset_036_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_036_ULT_done
.Lcset_036_ULT_true:
    cond_emit_char 'B'
.Lcset_036_ULT_done:
    bruge8 .Lcset_036_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_036_UGE_done
.Lcset_036_UGE_true:
    cond_emit_char 'B'
.Lcset_036_UGE_done:
    brslt8 .Lcset_036_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_036_SLT_done
.Lcset_036_SLT_true:
    cond_emit_char 'B'
.Lcset_036_SLT_done:
    brsge8 .Lcset_036_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_036_SGE_done
.Lcset_036_SGE_true:
    cond_emit_char 'B'
.Lcset_036_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r3; path true; guard r0.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x69af
    push16 r4
    ldi16 r4, 0x1e05
    push16 r4
    ldi16 r4, 0x1f28
    push16 r4
    ldi16 r4, 0xa9ae
    push16 r4
    ldi16 r4, 0x216e
    push16 r4
    ldi16 r4, 0x2291
    push16 r4
    ldi16 r4, 0x23b4
    push16 r4
    ldi16 r4, 0x24d7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r3
    push16 r0
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_037_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_037_EQ_done
.Lcset_037_EQ_true:
    cond_emit_char 'B'
.Lcset_037_EQ_done:
    brne8 .Lcset_037_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_037_NE_done
.Lcset_037_NE_true:
    cond_emit_char 'B'
.Lcset_037_NE_done:
    brult8 .Lcset_037_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_037_ULT_done
.Lcset_037_ULT_true:
    cond_emit_char 'B'
.Lcset_037_ULT_done:
    bruge8 .Lcset_037_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_037_UGE_done
.Lcset_037_UGE_true:
    cond_emit_char 'B'
.Lcset_037_UGE_done:
    brslt8 .Lcset_037_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_037_SLT_done
.Lcset_037_SLT_true:
    cond_emit_char 'B'
.Lcset_037_SLT_done:
    brsge8 .Lcset_037_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_037_SGE_done
.Lcset_037_SGE_true:
    cond_emit_char 'B'
.Lcset_037_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r4; path false; guard r1.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1d19
    push16 r4
    ldi16 r4, 0x6af9
    push16 r4
    ldi16 r4, 0x1f5f
    push16 r4
    ldi16 r4, 0x2082
    push16 r4
    ldi16 r4, 0xa9dc
    push16 r4
    ldi16 r4, 0x22c8
    push16 r4
    ldi16 r4, 0x23eb
    push16 r4
    ldi16 r4, 0x250e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r4
    push16 r1
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_038_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_038_EQ_done
.Lcset_038_EQ_true:
    cond_emit_char 'B'
.Lcset_038_EQ_done:
    brne8 .Lcset_038_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_038_NE_done
.Lcset_038_NE_true:
    cond_emit_char 'B'
.Lcset_038_NE_done:
    brult8 .Lcset_038_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_038_ULT_done
.Lcset_038_ULT_true:
    cond_emit_char 'B'
.Lcset_038_ULT_done:
    bruge8 .Lcset_038_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_038_UGE_done
.Lcset_038_UGE_true:
    cond_emit_char 'B'
.Lcset_038_UGE_done:
    brslt8 .Lcset_038_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_038_SLT_done
.Lcset_038_SLT_true:
    cond_emit_char 'B'
.Lcset_038_SLT_done:
    brsge8 .Lcset_038_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_038_SGE_done
.Lcset_038_SGE_true:
    cond_emit_char 'B'
.Lcset_038_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r4; path true; guard r2.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x1d50
    push16 r4
    ldi16 r4, 0x1e73
    push16 r4
    ldi16 r4, 0x6c43
    push16 r4
    ldi16 r4, 0x20b9
    push16 r4
    ldi16 r4, 0xaa09
    push16 r4
    ldi16 r4, 0x22ff
    push16 r4
    ldi16 r4, 0x2422
    push16 r4
    ldi16 r4, 0x2545
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r4
    push16 r2
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_039_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_039_EQ_done
.Lcset_039_EQ_true:
    cond_emit_char 'B'
.Lcset_039_EQ_done:
    brne8 .Lcset_039_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_039_NE_done
.Lcset_039_NE_true:
    cond_emit_char 'B'
.Lcset_039_NE_done:
    brult8 .Lcset_039_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_039_ULT_done
.Lcset_039_ULT_true:
    cond_emit_char 'B'
.Lcset_039_ULT_done:
    bruge8 .Lcset_039_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_039_UGE_done
.Lcset_039_UGE_true:
    cond_emit_char 'B'
.Lcset_039_UGE_done:
    brslt8 .Lcset_039_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_039_SLT_done
.Lcset_039_SLT_true:
    cond_emit_char 'B'
.Lcset_039_SLT_done:
    brsge8 .Lcset_039_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_039_SGE_done
.Lcset_039_SGE_true:
    cond_emit_char 'B'
.Lcset_039_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r5; path false; guard r3.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1d87
    push16 r4
    ldi16 r4, 0x1eaa
    push16 r4
    ldi16 r4, 0x1fcd
    push16 r4
    ldi16 r4, 0x6d8d
    push16 r4
    ldi16 r4, 0x2213
    push16 r4
    ldi16 r4, 0xaa37
    push16 r4
    ldi16 r4, 0x2459
    push16 r4
    ldi16 r4, 0x257c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r5
    push16 r3
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_03a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_03a_EQ_done
.Lcset_03a_EQ_true:
    cond_emit_char 'B'
.Lcset_03a_EQ_done:
    brne8 .Lcset_03a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03a_NE_done
.Lcset_03a_NE_true:
    cond_emit_char 'B'
.Lcset_03a_NE_done:
    brult8 .Lcset_03a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03a_ULT_done
.Lcset_03a_ULT_true:
    cond_emit_char 'B'
.Lcset_03a_ULT_done:
    bruge8 .Lcset_03a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03a_UGE_done
.Lcset_03a_UGE_true:
    cond_emit_char 'B'
.Lcset_03a_UGE_done:
    brslt8 .Lcset_03a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03a_SLT_done
.Lcset_03a_SLT_true:
    cond_emit_char 'B'
.Lcset_03a_SLT_done:
    brsge8 .Lcset_03a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03a_SGE_done
.Lcset_03a_SGE_true:
    cond_emit_char 'B'
.Lcset_03a_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r5; path true; guard r4.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x1dbe
    push16 r4
    ldi16 r4, 0x1ee1
    push16 r4
    ldi16 r4, 0x2004
    push16 r4
    ldi16 r4, 0x2127
    push16 r4
    ldi16 r4, 0x6ed7
    push16 r4
    ldi16 r4, 0xaa64
    push16 r4
    ldi16 r4, 0x2490
    push16 r4
    ldi16 r4, 0x25b3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r5
    push16 r4
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_03b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_03b_EQ_done
.Lcset_03b_EQ_true:
    cond_emit_char 'B'
.Lcset_03b_EQ_done:
    brne8 .Lcset_03b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03b_NE_done
.Lcset_03b_NE_true:
    cond_emit_char 'B'
.Lcset_03b_NE_done:
    brult8 .Lcset_03b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03b_ULT_done
.Lcset_03b_ULT_true:
    cond_emit_char 'B'
.Lcset_03b_ULT_done:
    bruge8 .Lcset_03b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03b_UGE_done
.Lcset_03b_UGE_true:
    cond_emit_char 'B'
.Lcset_03b_UGE_done:
    brslt8 .Lcset_03b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03b_SLT_done
.Lcset_03b_SLT_true:
    cond_emit_char 'B'
.Lcset_03b_SLT_done:
    brsge8 .Lcset_03b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03b_SGE_done
.Lcset_03b_SGE_true:
    cond_emit_char 'B'
.Lcset_03b_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r6; path false; guard r5.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1df5
    push16 r4
    ldi16 r4, 0x1f18
    push16 r4
    ldi16 r4, 0x203b
    push16 r4
    ldi16 r4, 0x215e
    push16 r4
    ldi16 r4, 0x2281
    push16 r4
    ldi16 r4, 0x7021
    push16 r4
    ldi16 r4, 0xaa92
    push16 r4
    ldi16 r4, 0x25ea
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r6
    push16 r5
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_03c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_03c_EQ_done
.Lcset_03c_EQ_true:
    cond_emit_char 'B'
.Lcset_03c_EQ_done:
    brne8 .Lcset_03c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03c_NE_done
.Lcset_03c_NE_true:
    cond_emit_char 'B'
.Lcset_03c_NE_done:
    brult8 .Lcset_03c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03c_ULT_done
.Lcset_03c_ULT_true:
    cond_emit_char 'B'
.Lcset_03c_ULT_done:
    bruge8 .Lcset_03c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03c_UGE_done
.Lcset_03c_UGE_true:
    cond_emit_char 'B'
.Lcset_03c_UGE_done:
    brslt8 .Lcset_03c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03c_SLT_done
.Lcset_03c_SLT_true:
    cond_emit_char 'B'
.Lcset_03c_SLT_done:
    brsge8 .Lcset_03c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03c_SGE_done
.Lcset_03c_SGE_true:
    cond_emit_char 'B'
.Lcset_03c_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r6; path true; guard r7.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x1e2c
    push16 r4
    ldi16 r4, 0x1f4f
    push16 r4
    ldi16 r4, 0x2072
    push16 r4
    ldi16 r4, 0x2195
    push16 r4
    ldi16 r4, 0x22b8
    push16 r4
    ldi16 r4, 0x23db
    push16 r4
    ldi16 r4, 0xaabf
    push16 r4
    ldi16 r4, 0x726c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r6
    push16 r7
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_03d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_03d_EQ_done
.Lcset_03d_EQ_true:
    cond_emit_char 'B'
.Lcset_03d_EQ_done:
    brne8 .Lcset_03d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03d_NE_done
.Lcset_03d_NE_true:
    cond_emit_char 'B'
.Lcset_03d_NE_done:
    brult8 .Lcset_03d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03d_ULT_done
.Lcset_03d_ULT_true:
    cond_emit_char 'B'
.Lcset_03d_ULT_done:
    bruge8 .Lcset_03d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03d_UGE_done
.Lcset_03d_UGE_true:
    cond_emit_char 'B'
.Lcset_03d_UGE_done:
    brslt8 .Lcset_03d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03d_SLT_done
.Lcset_03d_SLT_true:
    cond_emit_char 'B'
.Lcset_03d_SLT_done:
    brsge8 .Lcset_03d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03d_SGE_done
.Lcset_03d_SGE_true:
    cond_emit_char 'B'
.Lcset_03d_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r7; path false; guard r0.
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x6bae
    push16 r4
    ldi16 r4, 0x1f86
    push16 r4
    ldi16 r4, 0x20a9
    push16 r4
    ldi16 r4, 0x21cc
    push16 r4
    ldi16 r4, 0x22ef
    push16 r4
    ldi16 r4, 0x2412
    push16 r4
    ldi16 r4, 0x2535
    push16 r4
    ldi16 r4, 0xaaed
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_03e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_03e_EQ_done
.Lcset_03e_EQ_true:
    cond_emit_char 'B'
.Lcset_03e_EQ_done:
    brne8 .Lcset_03e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03e_NE_done
.Lcset_03e_NE_true:
    cond_emit_char 'B'
.Lcset_03e_NE_done:
    brult8 .Lcset_03e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03e_ULT_done
.Lcset_03e_ULT_true:
    cond_emit_char 'B'
.Lcset_03e_ULT_done:
    bruge8 .Lcset_03e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03e_UGE_done
.Lcset_03e_UGE_true:
    cond_emit_char 'B'
.Lcset_03e_UGE_done:
    brslt8 .Lcset_03e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03e_SLT_done
.Lcset_03e_SLT_true:
    cond_emit_char 'B'
.Lcset_03e_SLT_done:
    brsge8 .Lcset_03e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03e_SGE_done
.Lcset_03e_SGE_true:
    cond_emit_char 'B'
.Lcset_03e_SGE_done:
    cond_emit_char '\n'

    ; cset.uge r7; path true; guard r0.
    ldi16 r6, 0x0002
    ldi16 r7, 0x0001
    cmp r6, r7
    ldi16 r4, 0x6bf7
    push16 r4
    ldi16 r4, 0x1fbd
    push16 r4
    ldi16 r4, 0x20e0
    push16 r4
    ldi16 r4, 0x2203
    push16 r4
    ldi16 r4, 0x2326
    push16 r4
    ldi16 r4, 0x2449
    push16 r4
    ldi16 r4, 0x256c
    push16 r4
    ldi16 r4, 0xab1a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.uge r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_03f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_03f_EQ_done
.Lcset_03f_EQ_true:
    cond_emit_char 'B'
.Lcset_03f_EQ_done:
    brne8 .Lcset_03f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03f_NE_done
.Lcset_03f_NE_true:
    cond_emit_char 'B'
.Lcset_03f_NE_done:
    brult8 .Lcset_03f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03f_ULT_done
.Lcset_03f_ULT_true:
    cond_emit_char 'B'
.Lcset_03f_ULT_done:
    bruge8 .Lcset_03f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03f_UGE_done
.Lcset_03f_UGE_true:
    cond_emit_char 'B'
.Lcset_03f_UGE_done:
    brslt8 .Lcset_03f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_03f_SLT_done
.Lcset_03f_SLT_true:
    cond_emit_char 'B'
.Lcset_03f_SLT_done:
    brsge8 .Lcset_03f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_03f_SGE_done
.Lcset_03f_SGE_true:
    cond_emit_char 'B'
.Lcset_03f_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r0; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xab40
    push16 r4
    ldi16 r4, 0x6d41
    push16 r4
    ldi16 r4, 0x2117
    push16 r4
    ldi16 r4, 0x223a
    push16 r4
    ldi16 r4, 0x235d
    push16 r4
    ldi16 r4, 0x2480
    push16 r4
    ldi16 r4, 0x25a3
    push16 r4
    ldi16 r4, 0x26c6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r0
    push16 r1
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_040_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_040_EQ_done
.Lcset_040_EQ_true:
    cond_emit_char 'B'
.Lcset_040_EQ_done:
    brne8 .Lcset_040_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_040_NE_done
.Lcset_040_NE_true:
    cond_emit_char 'B'
.Lcset_040_NE_done:
    brult8 .Lcset_040_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_040_ULT_done
.Lcset_040_ULT_true:
    cond_emit_char 'B'
.Lcset_040_ULT_done:
    bruge8 .Lcset_040_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_040_UGE_done
.Lcset_040_UGE_true:
    cond_emit_char 'B'
.Lcset_040_UGE_done:
    brslt8 .Lcset_040_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_040_SLT_done
.Lcset_040_SLT_true:
    cond_emit_char 'B'
.Lcset_040_SLT_done:
    brsge8 .Lcset_040_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_040_SGE_done
.Lcset_040_SGE_true:
    cond_emit_char 'B'
.Lcset_040_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r0; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xab6d
    push16 r4
    ldi16 r4, 0x202b
    push16 r4
    ldi16 r4, 0x6e8b
    push16 r4
    ldi16 r4, 0x2271
    push16 r4
    ldi16 r4, 0x2394
    push16 r4
    ldi16 r4, 0x24b7
    push16 r4
    ldi16 r4, 0x25da
    push16 r4
    ldi16 r4, 0x26fd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r0
    push16 r2
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_041_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_041_EQ_done
.Lcset_041_EQ_true:
    cond_emit_char 'B'
.Lcset_041_EQ_done:
    brne8 .Lcset_041_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_041_NE_done
.Lcset_041_NE_true:
    cond_emit_char 'B'
.Lcset_041_NE_done:
    brult8 .Lcset_041_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_041_ULT_done
.Lcset_041_ULT_true:
    cond_emit_char 'B'
.Lcset_041_ULT_done:
    bruge8 .Lcset_041_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_041_UGE_done
.Lcset_041_UGE_true:
    cond_emit_char 'B'
.Lcset_041_UGE_done:
    brslt8 .Lcset_041_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_041_SLT_done
.Lcset_041_SLT_true:
    cond_emit_char 'B'
.Lcset_041_SLT_done:
    brsge8 .Lcset_041_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_041_SGE_done
.Lcset_041_SGE_true:
    cond_emit_char 'B'
.Lcset_041_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r1; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1f3f
    push16 r4
    ldi16 r4, 0xab9b
    push16 r4
    ldi16 r4, 0x2185
    push16 r4
    ldi16 r4, 0x6fd5
    push16 r4
    ldi16 r4, 0x23cb
    push16 r4
    ldi16 r4, 0x24ee
    push16 r4
    ldi16 r4, 0x2611
    push16 r4
    ldi16 r4, 0x2734
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r1
    push16 r3
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_042_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_042_EQ_done
.Lcset_042_EQ_true:
    cond_emit_char 'B'
.Lcset_042_EQ_done:
    brne8 .Lcset_042_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_042_NE_done
.Lcset_042_NE_true:
    cond_emit_char 'B'
.Lcset_042_NE_done:
    brult8 .Lcset_042_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_042_ULT_done
.Lcset_042_ULT_true:
    cond_emit_char 'B'
.Lcset_042_ULT_done:
    bruge8 .Lcset_042_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_042_UGE_done
.Lcset_042_UGE_true:
    cond_emit_char 'B'
.Lcset_042_UGE_done:
    brslt8 .Lcset_042_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_042_SLT_done
.Lcset_042_SLT_true:
    cond_emit_char 'B'
.Lcset_042_SLT_done:
    brsge8 .Lcset_042_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_042_SGE_done
.Lcset_042_SGE_true:
    cond_emit_char 'B'
.Lcset_042_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r1; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1f76
    push16 r4
    ldi16 r4, 0xabc8
    push16 r4
    ldi16 r4, 0x21bc
    push16 r4
    ldi16 r4, 0x22df
    push16 r4
    ldi16 r4, 0x711f
    push16 r4
    ldi16 r4, 0x2525
    push16 r4
    ldi16 r4, 0x2648
    push16 r4
    ldi16 r4, 0x276b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r1
    push16 r4
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_043_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_043_EQ_done
.Lcset_043_EQ_true:
    cond_emit_char 'B'
.Lcset_043_EQ_done:
    brne8 .Lcset_043_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_043_NE_done
.Lcset_043_NE_true:
    cond_emit_char 'B'
.Lcset_043_NE_done:
    brult8 .Lcset_043_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_043_ULT_done
.Lcset_043_ULT_true:
    cond_emit_char 'B'
.Lcset_043_ULT_done:
    bruge8 .Lcset_043_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_043_UGE_done
.Lcset_043_UGE_true:
    cond_emit_char 'B'
.Lcset_043_UGE_done:
    brslt8 .Lcset_043_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_043_SLT_done
.Lcset_043_SLT_true:
    cond_emit_char 'B'
.Lcset_043_SLT_done:
    brsge8 .Lcset_043_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_043_SGE_done
.Lcset_043_SGE_true:
    cond_emit_char 'B'
.Lcset_043_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r2; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1fad
    push16 r4
    ldi16 r4, 0x20d0
    push16 r4
    ldi16 r4, 0xabf6
    push16 r4
    ldi16 r4, 0x2316
    push16 r4
    ldi16 r4, 0x2439
    push16 r4
    ldi16 r4, 0x7269
    push16 r4
    ldi16 r4, 0x267f
    push16 r4
    ldi16 r4, 0x27a2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r2
    push16 r5
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_044_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_044_EQ_done
.Lcset_044_EQ_true:
    cond_emit_char 'B'
.Lcset_044_EQ_done:
    brne8 .Lcset_044_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_044_NE_done
.Lcset_044_NE_true:
    cond_emit_char 'B'
.Lcset_044_NE_done:
    brult8 .Lcset_044_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_044_ULT_done
.Lcset_044_ULT_true:
    cond_emit_char 'B'
.Lcset_044_ULT_done:
    bruge8 .Lcset_044_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_044_UGE_done
.Lcset_044_UGE_true:
    cond_emit_char 'B'
.Lcset_044_UGE_done:
    brslt8 .Lcset_044_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_044_SLT_done
.Lcset_044_SLT_true:
    cond_emit_char 'B'
.Lcset_044_SLT_done:
    brsge8 .Lcset_044_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_044_SGE_done
.Lcset_044_SGE_true:
    cond_emit_char 'B'
.Lcset_044_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r2; path true; guard r6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x1fe4
    push16 r4
    ldi16 r4, 0x2107
    push16 r4
    ldi16 r4, 0xac23
    push16 r4
    ldi16 r4, 0x234d
    push16 r4
    ldi16 r4, 0x2470
    push16 r4
    ldi16 r4, 0x2593
    push16 r4
    ldi16 r4, 0x73b3
    push16 r4
    ldi16 r4, 0x27d9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r2
    push16 r6
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_045_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_045_EQ_done
.Lcset_045_EQ_true:
    cond_emit_char 'B'
.Lcset_045_EQ_done:
    brne8 .Lcset_045_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_045_NE_done
.Lcset_045_NE_true:
    cond_emit_char 'B'
.Lcset_045_NE_done:
    brult8 .Lcset_045_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_045_ULT_done
.Lcset_045_ULT_true:
    cond_emit_char 'B'
.Lcset_045_ULT_done:
    bruge8 .Lcset_045_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_045_UGE_done
.Lcset_045_UGE_true:
    cond_emit_char 'B'
.Lcset_045_UGE_done:
    brslt8 .Lcset_045_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_045_SLT_done
.Lcset_045_SLT_true:
    cond_emit_char 'B'
.Lcset_045_SLT_done:
    brsge8 .Lcset_045_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_045_SGE_done
.Lcset_045_SGE_true:
    cond_emit_char 'B'
.Lcset_045_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r3; path false; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x201b
    push16 r4
    ldi16 r4, 0x213e
    push16 r4
    ldi16 r4, 0x2261
    push16 r4
    ldi16 r4, 0xac51
    push16 r4
    ldi16 r4, 0x24a7
    push16 r4
    ldi16 r4, 0x25ca
    push16 r4
    ldi16 r4, 0x26ed
    push16 r4
    ldi16 r4, 0x74fd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r3
    push16 r7
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_046_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_046_EQ_done
.Lcset_046_EQ_true:
    cond_emit_char 'B'
.Lcset_046_EQ_done:
    brne8 .Lcset_046_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_046_NE_done
.Lcset_046_NE_true:
    cond_emit_char 'B'
.Lcset_046_NE_done:
    brult8 .Lcset_046_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_046_ULT_done
.Lcset_046_ULT_true:
    cond_emit_char 'B'
.Lcset_046_ULT_done:
    bruge8 .Lcset_046_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_046_UGE_done
.Lcset_046_UGE_true:
    cond_emit_char 'B'
.Lcset_046_UGE_done:
    brslt8 .Lcset_046_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_046_SLT_done
.Lcset_046_SLT_true:
    cond_emit_char 'B'
.Lcset_046_SLT_done:
    brsge8 .Lcset_046_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_046_SGE_done
.Lcset_046_SGE_true:
    cond_emit_char 'B'
.Lcset_046_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r3; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6e3f
    push16 r4
    ldi16 r4, 0x2175
    push16 r4
    ldi16 r4, 0x2298
    push16 r4
    ldi16 r4, 0xac7e
    push16 r4
    ldi16 r4, 0x24de
    push16 r4
    ldi16 r4, 0x2601
    push16 r4
    ldi16 r4, 0x2724
    push16 r4
    ldi16 r4, 0x2847
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r3
    push16 r0
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_047_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_047_EQ_done
.Lcset_047_EQ_true:
    cond_emit_char 'B'
.Lcset_047_EQ_done:
    brne8 .Lcset_047_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_047_NE_done
.Lcset_047_NE_true:
    cond_emit_char 'B'
.Lcset_047_NE_done:
    brult8 .Lcset_047_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_047_ULT_done
.Lcset_047_ULT_true:
    cond_emit_char 'B'
.Lcset_047_ULT_done:
    bruge8 .Lcset_047_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_047_UGE_done
.Lcset_047_UGE_true:
    cond_emit_char 'B'
.Lcset_047_UGE_done:
    brslt8 .Lcset_047_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_047_SLT_done
.Lcset_047_SLT_true:
    cond_emit_char 'B'
.Lcset_047_SLT_done:
    brsge8 .Lcset_047_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_047_SGE_done
.Lcset_047_SGE_true:
    cond_emit_char 'B'
.Lcset_047_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r4; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2089
    push16 r4
    ldi16 r4, 0x6f89
    push16 r4
    ldi16 r4, 0x22cf
    push16 r4
    ldi16 r4, 0x23f2
    push16 r4
    ldi16 r4, 0xacac
    push16 r4
    ldi16 r4, 0x2638
    push16 r4
    ldi16 r4, 0x275b
    push16 r4
    ldi16 r4, 0x287e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r4
    push16 r1
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_048_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_048_EQ_done
.Lcset_048_EQ_true:
    cond_emit_char 'B'
.Lcset_048_EQ_done:
    brne8 .Lcset_048_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_048_NE_done
.Lcset_048_NE_true:
    cond_emit_char 'B'
.Lcset_048_NE_done:
    brult8 .Lcset_048_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_048_ULT_done
.Lcset_048_ULT_true:
    cond_emit_char 'B'
.Lcset_048_ULT_done:
    bruge8 .Lcset_048_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_048_UGE_done
.Lcset_048_UGE_true:
    cond_emit_char 'B'
.Lcset_048_UGE_done:
    brslt8 .Lcset_048_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_048_SLT_done
.Lcset_048_SLT_true:
    cond_emit_char 'B'
.Lcset_048_SLT_done:
    brsge8 .Lcset_048_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_048_SGE_done
.Lcset_048_SGE_true:
    cond_emit_char 'B'
.Lcset_048_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r4; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x20c0
    push16 r4
    ldi16 r4, 0x21e3
    push16 r4
    ldi16 r4, 0x70d3
    push16 r4
    ldi16 r4, 0x2429
    push16 r4
    ldi16 r4, 0xacd9
    push16 r4
    ldi16 r4, 0x266f
    push16 r4
    ldi16 r4, 0x2792
    push16 r4
    ldi16 r4, 0x28b5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r4
    push16 r2
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_049_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_049_EQ_done
.Lcset_049_EQ_true:
    cond_emit_char 'B'
.Lcset_049_EQ_done:
    brne8 .Lcset_049_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_049_NE_done
.Lcset_049_NE_true:
    cond_emit_char 'B'
.Lcset_049_NE_done:
    brult8 .Lcset_049_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_049_ULT_done
.Lcset_049_ULT_true:
    cond_emit_char 'B'
.Lcset_049_ULT_done:
    bruge8 .Lcset_049_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_049_UGE_done
.Lcset_049_UGE_true:
    cond_emit_char 'B'
.Lcset_049_UGE_done:
    brslt8 .Lcset_049_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_049_SLT_done
.Lcset_049_SLT_true:
    cond_emit_char 'B'
.Lcset_049_SLT_done:
    brsge8 .Lcset_049_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_049_SGE_done
.Lcset_049_SGE_true:
    cond_emit_char 'B'
.Lcset_049_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r5; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x20f7
    push16 r4
    ldi16 r4, 0x221a
    push16 r4
    ldi16 r4, 0x233d
    push16 r4
    ldi16 r4, 0x721d
    push16 r4
    ldi16 r4, 0x2583
    push16 r4
    ldi16 r4, 0xad07
    push16 r4
    ldi16 r4, 0x27c9
    push16 r4
    ldi16 r4, 0x28ec
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r5
    push16 r3
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_04a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_04a_EQ_done
.Lcset_04a_EQ_true:
    cond_emit_char 'B'
.Lcset_04a_EQ_done:
    brne8 .Lcset_04a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04a_NE_done
.Lcset_04a_NE_true:
    cond_emit_char 'B'
.Lcset_04a_NE_done:
    brult8 .Lcset_04a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04a_ULT_done
.Lcset_04a_ULT_true:
    cond_emit_char 'B'
.Lcset_04a_ULT_done:
    bruge8 .Lcset_04a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04a_UGE_done
.Lcset_04a_UGE_true:
    cond_emit_char 'B'
.Lcset_04a_UGE_done:
    brslt8 .Lcset_04a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04a_SLT_done
.Lcset_04a_SLT_true:
    cond_emit_char 'B'
.Lcset_04a_SLT_done:
    brsge8 .Lcset_04a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04a_SGE_done
.Lcset_04a_SGE_true:
    cond_emit_char 'B'
.Lcset_04a_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r5; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x212e
    push16 r4
    ldi16 r4, 0x2251
    push16 r4
    ldi16 r4, 0x2374
    push16 r4
    ldi16 r4, 0x2497
    push16 r4
    ldi16 r4, 0x7367
    push16 r4
    ldi16 r4, 0xad34
    push16 r4
    ldi16 r4, 0x2800
    push16 r4
    ldi16 r4, 0x2923
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r5
    push16 r4
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_04b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_04b_EQ_done
.Lcset_04b_EQ_true:
    cond_emit_char 'B'
.Lcset_04b_EQ_done:
    brne8 .Lcset_04b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04b_NE_done
.Lcset_04b_NE_true:
    cond_emit_char 'B'
.Lcset_04b_NE_done:
    brult8 .Lcset_04b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04b_ULT_done
.Lcset_04b_ULT_true:
    cond_emit_char 'B'
.Lcset_04b_ULT_done:
    bruge8 .Lcset_04b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04b_UGE_done
.Lcset_04b_UGE_true:
    cond_emit_char 'B'
.Lcset_04b_UGE_done:
    brslt8 .Lcset_04b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04b_SLT_done
.Lcset_04b_SLT_true:
    cond_emit_char 'B'
.Lcset_04b_SLT_done:
    brsge8 .Lcset_04b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04b_SGE_done
.Lcset_04b_SGE_true:
    cond_emit_char 'B'
.Lcset_04b_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r6; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2165
    push16 r4
    ldi16 r4, 0x2288
    push16 r4
    ldi16 r4, 0x23ab
    push16 r4
    ldi16 r4, 0x24ce
    push16 r4
    ldi16 r4, 0x25f1
    push16 r4
    ldi16 r4, 0x74b1
    push16 r4
    ldi16 r4, 0xad62
    push16 r4
    ldi16 r4, 0x295a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r6
    push16 r5
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_04c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_04c_EQ_done
.Lcset_04c_EQ_true:
    cond_emit_char 'B'
.Lcset_04c_EQ_done:
    brne8 .Lcset_04c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04c_NE_done
.Lcset_04c_NE_true:
    cond_emit_char 'B'
.Lcset_04c_NE_done:
    brult8 .Lcset_04c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04c_ULT_done
.Lcset_04c_ULT_true:
    cond_emit_char 'B'
.Lcset_04c_ULT_done:
    bruge8 .Lcset_04c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04c_UGE_done
.Lcset_04c_UGE_true:
    cond_emit_char 'B'
.Lcset_04c_UGE_done:
    brslt8 .Lcset_04c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04c_SLT_done
.Lcset_04c_SLT_true:
    cond_emit_char 'B'
.Lcset_04c_SLT_done:
    brsge8 .Lcset_04c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04c_SGE_done
.Lcset_04c_SGE_true:
    cond_emit_char 'B'
.Lcset_04c_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r6; path true; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x219c
    push16 r4
    ldi16 r4, 0x22bf
    push16 r4
    ldi16 r4, 0x23e2
    push16 r4
    ldi16 r4, 0x2505
    push16 r4
    ldi16 r4, 0x2628
    push16 r4
    ldi16 r4, 0x274b
    push16 r4
    ldi16 r4, 0xad8f
    push16 r4
    ldi16 r4, 0x76fc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r6
    push16 r7
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_04d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_04d_EQ_done
.Lcset_04d_EQ_true:
    cond_emit_char 'B'
.Lcset_04d_EQ_done:
    brne8 .Lcset_04d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04d_NE_done
.Lcset_04d_NE_true:
    cond_emit_char 'B'
.Lcset_04d_NE_done:
    brult8 .Lcset_04d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04d_ULT_done
.Lcset_04d_ULT_true:
    cond_emit_char 'B'
.Lcset_04d_ULT_done:
    bruge8 .Lcset_04d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04d_UGE_done
.Lcset_04d_UGE_true:
    cond_emit_char 'B'
.Lcset_04d_UGE_done:
    brslt8 .Lcset_04d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04d_SLT_done
.Lcset_04d_SLT_true:
    cond_emit_char 'B'
.Lcset_04d_SLT_done:
    brsge8 .Lcset_04d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04d_SGE_done
.Lcset_04d_SGE_true:
    cond_emit_char 'B'
.Lcset_04d_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r7; path false; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x703e
    push16 r4
    ldi16 r4, 0x22f6
    push16 r4
    ldi16 r4, 0x2419
    push16 r4
    ldi16 r4, 0x253c
    push16 r4
    ldi16 r4, 0x265f
    push16 r4
    ldi16 r4, 0x2782
    push16 r4
    ldi16 r4, 0x28a5
    push16 r4
    ldi16 r4, 0xadbd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_04e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_04e_EQ_done
.Lcset_04e_EQ_true:
    cond_emit_char 'B'
.Lcset_04e_EQ_done:
    brne8 .Lcset_04e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04e_NE_done
.Lcset_04e_NE_true:
    cond_emit_char 'B'
.Lcset_04e_NE_done:
    brult8 .Lcset_04e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04e_ULT_done
.Lcset_04e_ULT_true:
    cond_emit_char 'B'
.Lcset_04e_ULT_done:
    bruge8 .Lcset_04e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04e_UGE_done
.Lcset_04e_UGE_true:
    cond_emit_char 'B'
.Lcset_04e_UGE_done:
    brslt8 .Lcset_04e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04e_SLT_done
.Lcset_04e_SLT_true:
    cond_emit_char 'B'
.Lcset_04e_SLT_done:
    brsge8 .Lcset_04e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04e_SGE_done
.Lcset_04e_SGE_true:
    cond_emit_char 'B'
.Lcset_04e_SGE_done:
    cond_emit_char '\n'

    ; cset.slt r7; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7087
    push16 r4
    ldi16 r4, 0x232d
    push16 r4
    ldi16 r4, 0x2450
    push16 r4
    ldi16 r4, 0x2573
    push16 r4
    ldi16 r4, 0x2696
    push16 r4
    ldi16 r4, 0x27b9
    push16 r4
    ldi16 r4, 0x28dc
    push16 r4
    ldi16 r4, 0xadea
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.slt r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_04f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_04f_EQ_done
.Lcset_04f_EQ_true:
    cond_emit_char 'B'
.Lcset_04f_EQ_done:
    brne8 .Lcset_04f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04f_NE_done
.Lcset_04f_NE_true:
    cond_emit_char 'B'
.Lcset_04f_NE_done:
    brult8 .Lcset_04f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04f_ULT_done
.Lcset_04f_ULT_true:
    cond_emit_char 'B'
.Lcset_04f_ULT_done:
    bruge8 .Lcset_04f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04f_UGE_done
.Lcset_04f_UGE_true:
    cond_emit_char 'B'
.Lcset_04f_UGE_done:
    brslt8 .Lcset_04f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_04f_SLT_done
.Lcset_04f_SLT_true:
    cond_emit_char 'B'
.Lcset_04f_SLT_done:
    brsge8 .Lcset_04f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_04f_SGE_done
.Lcset_04f_SGE_true:
    cond_emit_char 'B'
.Lcset_04f_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r0; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xae10
    push16 r4
    ldi16 r4, 0x71d1
    push16 r4
    ldi16 r4, 0x2487
    push16 r4
    ldi16 r4, 0x25aa
    push16 r4
    ldi16 r4, 0x26cd
    push16 r4
    ldi16 r4, 0x27f0
    push16 r4
    ldi16 r4, 0x2913
    push16 r4
    ldi16 r4, 0x2a36
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r0
    push16 r1
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_050_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_050_EQ_done
.Lcset_050_EQ_true:
    cond_emit_char 'B'
.Lcset_050_EQ_done:
    brne8 .Lcset_050_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_050_NE_done
.Lcset_050_NE_true:
    cond_emit_char 'B'
.Lcset_050_NE_done:
    brult8 .Lcset_050_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_050_ULT_done
.Lcset_050_ULT_true:
    cond_emit_char 'B'
.Lcset_050_ULT_done:
    bruge8 .Lcset_050_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_050_UGE_done
.Lcset_050_UGE_true:
    cond_emit_char 'B'
.Lcset_050_UGE_done:
    brslt8 .Lcset_050_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_050_SLT_done
.Lcset_050_SLT_true:
    cond_emit_char 'B'
.Lcset_050_SLT_done:
    brsge8 .Lcset_050_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_050_SGE_done
.Lcset_050_SGE_true:
    cond_emit_char 'B'
.Lcset_050_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r0; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xae3d
    push16 r4
    ldi16 r4, 0x239b
    push16 r4
    ldi16 r4, 0x731b
    push16 r4
    ldi16 r4, 0x25e1
    push16 r4
    ldi16 r4, 0x2704
    push16 r4
    ldi16 r4, 0x2827
    push16 r4
    ldi16 r4, 0x294a
    push16 r4
    ldi16 r4, 0x2a6d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r0
    push16 r2
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_051_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_051_EQ_done
.Lcset_051_EQ_true:
    cond_emit_char 'B'
.Lcset_051_EQ_done:
    brne8 .Lcset_051_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_051_NE_done
.Lcset_051_NE_true:
    cond_emit_char 'B'
.Lcset_051_NE_done:
    brult8 .Lcset_051_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_051_ULT_done
.Lcset_051_ULT_true:
    cond_emit_char 'B'
.Lcset_051_ULT_done:
    bruge8 .Lcset_051_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_051_UGE_done
.Lcset_051_UGE_true:
    cond_emit_char 'B'
.Lcset_051_UGE_done:
    brslt8 .Lcset_051_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_051_SLT_done
.Lcset_051_SLT_true:
    cond_emit_char 'B'
.Lcset_051_SLT_done:
    brsge8 .Lcset_051_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_051_SGE_done
.Lcset_051_SGE_true:
    cond_emit_char 'B'
.Lcset_051_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r1; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x22af
    push16 r4
    ldi16 r4, 0xae6b
    push16 r4
    ldi16 r4, 0x24f5
    push16 r4
    ldi16 r4, 0x7465
    push16 r4
    ldi16 r4, 0x273b
    push16 r4
    ldi16 r4, 0x285e
    push16 r4
    ldi16 r4, 0x2981
    push16 r4
    ldi16 r4, 0x2aa4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r1
    push16 r3
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_052_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_052_EQ_done
.Lcset_052_EQ_true:
    cond_emit_char 'B'
.Lcset_052_EQ_done:
    brne8 .Lcset_052_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_052_NE_done
.Lcset_052_NE_true:
    cond_emit_char 'B'
.Lcset_052_NE_done:
    brult8 .Lcset_052_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_052_ULT_done
.Lcset_052_ULT_true:
    cond_emit_char 'B'
.Lcset_052_ULT_done:
    bruge8 .Lcset_052_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_052_UGE_done
.Lcset_052_UGE_true:
    cond_emit_char 'B'
.Lcset_052_UGE_done:
    brslt8 .Lcset_052_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_052_SLT_done
.Lcset_052_SLT_true:
    cond_emit_char 'B'
.Lcset_052_SLT_done:
    brsge8 .Lcset_052_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_052_SGE_done
.Lcset_052_SGE_true:
    cond_emit_char 'B'
.Lcset_052_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r1; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x22e6
    push16 r4
    ldi16 r4, 0xae98
    push16 r4
    ldi16 r4, 0x252c
    push16 r4
    ldi16 r4, 0x264f
    push16 r4
    ldi16 r4, 0x75af
    push16 r4
    ldi16 r4, 0x2895
    push16 r4
    ldi16 r4, 0x29b8
    push16 r4
    ldi16 r4, 0x2adb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r1
    push16 r4
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_053_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_053_EQ_done
.Lcset_053_EQ_true:
    cond_emit_char 'B'
.Lcset_053_EQ_done:
    brne8 .Lcset_053_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_053_NE_done
.Lcset_053_NE_true:
    cond_emit_char 'B'
.Lcset_053_NE_done:
    brult8 .Lcset_053_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_053_ULT_done
.Lcset_053_ULT_true:
    cond_emit_char 'B'
.Lcset_053_ULT_done:
    bruge8 .Lcset_053_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_053_UGE_done
.Lcset_053_UGE_true:
    cond_emit_char 'B'
.Lcset_053_UGE_done:
    brslt8 .Lcset_053_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_053_SLT_done
.Lcset_053_SLT_true:
    cond_emit_char 'B'
.Lcset_053_SLT_done:
    brsge8 .Lcset_053_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_053_SGE_done
.Lcset_053_SGE_true:
    cond_emit_char 'B'
.Lcset_053_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r2; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x231d
    push16 r4
    ldi16 r4, 0x2440
    push16 r4
    ldi16 r4, 0xaec6
    push16 r4
    ldi16 r4, 0x2686
    push16 r4
    ldi16 r4, 0x27a9
    push16 r4
    ldi16 r4, 0x76f9
    push16 r4
    ldi16 r4, 0x29ef
    push16 r4
    ldi16 r4, 0x2b12
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r2
    push16 r5
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_054_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_054_EQ_done
.Lcset_054_EQ_true:
    cond_emit_char 'B'
.Lcset_054_EQ_done:
    brne8 .Lcset_054_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_054_NE_done
.Lcset_054_NE_true:
    cond_emit_char 'B'
.Lcset_054_NE_done:
    brult8 .Lcset_054_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_054_ULT_done
.Lcset_054_ULT_true:
    cond_emit_char 'B'
.Lcset_054_ULT_done:
    bruge8 .Lcset_054_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_054_UGE_done
.Lcset_054_UGE_true:
    cond_emit_char 'B'
.Lcset_054_UGE_done:
    brslt8 .Lcset_054_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_054_SLT_done
.Lcset_054_SLT_true:
    cond_emit_char 'B'
.Lcset_054_SLT_done:
    brsge8 .Lcset_054_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_054_SGE_done
.Lcset_054_SGE_true:
    cond_emit_char 'B'
.Lcset_054_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r2; path true; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2354
    push16 r4
    ldi16 r4, 0x2477
    push16 r4
    ldi16 r4, 0xaef3
    push16 r4
    ldi16 r4, 0x26bd
    push16 r4
    ldi16 r4, 0x27e0
    push16 r4
    ldi16 r4, 0x2903
    push16 r4
    ldi16 r4, 0x7843
    push16 r4
    ldi16 r4, 0x2b49
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r2
    push16 r6
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_055_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_055_EQ_done
.Lcset_055_EQ_true:
    cond_emit_char 'B'
.Lcset_055_EQ_done:
    brne8 .Lcset_055_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_055_NE_done
.Lcset_055_NE_true:
    cond_emit_char 'B'
.Lcset_055_NE_done:
    brult8 .Lcset_055_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_055_ULT_done
.Lcset_055_ULT_true:
    cond_emit_char 'B'
.Lcset_055_ULT_done:
    bruge8 .Lcset_055_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_055_UGE_done
.Lcset_055_UGE_true:
    cond_emit_char 'B'
.Lcset_055_UGE_done:
    brslt8 .Lcset_055_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_055_SLT_done
.Lcset_055_SLT_true:
    cond_emit_char 'B'
.Lcset_055_SLT_done:
    brsge8 .Lcset_055_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_055_SGE_done
.Lcset_055_SGE_true:
    cond_emit_char 'B'
.Lcset_055_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r3; path false; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x238b
    push16 r4
    ldi16 r4, 0x24ae
    push16 r4
    ldi16 r4, 0x25d1
    push16 r4
    ldi16 r4, 0xaf21
    push16 r4
    ldi16 r4, 0x2817
    push16 r4
    ldi16 r4, 0x293a
    push16 r4
    ldi16 r4, 0x2a5d
    push16 r4
    ldi16 r4, 0x798d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r3
    push16 r7
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_056_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_056_EQ_done
.Lcset_056_EQ_true:
    cond_emit_char 'B'
.Lcset_056_EQ_done:
    brne8 .Lcset_056_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_056_NE_done
.Lcset_056_NE_true:
    cond_emit_char 'B'
.Lcset_056_NE_done:
    brult8 .Lcset_056_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_056_ULT_done
.Lcset_056_ULT_true:
    cond_emit_char 'B'
.Lcset_056_ULT_done:
    bruge8 .Lcset_056_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_056_UGE_done
.Lcset_056_UGE_true:
    cond_emit_char 'B'
.Lcset_056_UGE_done:
    brslt8 .Lcset_056_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_056_SLT_done
.Lcset_056_SLT_true:
    cond_emit_char 'B'
.Lcset_056_SLT_done:
    brsge8 .Lcset_056_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_056_SGE_done
.Lcset_056_SGE_true:
    cond_emit_char 'B'
.Lcset_056_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r3; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x72cf
    push16 r4
    ldi16 r4, 0x24e5
    push16 r4
    ldi16 r4, 0x2608
    push16 r4
    ldi16 r4, 0xaf4e
    push16 r4
    ldi16 r4, 0x284e
    push16 r4
    ldi16 r4, 0x2971
    push16 r4
    ldi16 r4, 0x2a94
    push16 r4
    ldi16 r4, 0x2bb7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r3
    push16 r0
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_057_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_057_EQ_done
.Lcset_057_EQ_true:
    cond_emit_char 'B'
.Lcset_057_EQ_done:
    brne8 .Lcset_057_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_057_NE_done
.Lcset_057_NE_true:
    cond_emit_char 'B'
.Lcset_057_NE_done:
    brult8 .Lcset_057_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_057_ULT_done
.Lcset_057_ULT_true:
    cond_emit_char 'B'
.Lcset_057_ULT_done:
    bruge8 .Lcset_057_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_057_UGE_done
.Lcset_057_UGE_true:
    cond_emit_char 'B'
.Lcset_057_UGE_done:
    brslt8 .Lcset_057_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_057_SLT_done
.Lcset_057_SLT_true:
    cond_emit_char 'B'
.Lcset_057_SLT_done:
    brsge8 .Lcset_057_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_057_SGE_done
.Lcset_057_SGE_true:
    cond_emit_char 'B'
.Lcset_057_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r4; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x23f9
    push16 r4
    ldi16 r4, 0x7419
    push16 r4
    ldi16 r4, 0x263f
    push16 r4
    ldi16 r4, 0x2762
    push16 r4
    ldi16 r4, 0xaf7c
    push16 r4
    ldi16 r4, 0x29a8
    push16 r4
    ldi16 r4, 0x2acb
    push16 r4
    ldi16 r4, 0x2bee
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r4
    push16 r1
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_058_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_058_EQ_done
.Lcset_058_EQ_true:
    cond_emit_char 'B'
.Lcset_058_EQ_done:
    brne8 .Lcset_058_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_058_NE_done
.Lcset_058_NE_true:
    cond_emit_char 'B'
.Lcset_058_NE_done:
    brult8 .Lcset_058_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_058_ULT_done
.Lcset_058_ULT_true:
    cond_emit_char 'B'
.Lcset_058_ULT_done:
    bruge8 .Lcset_058_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_058_UGE_done
.Lcset_058_UGE_true:
    cond_emit_char 'B'
.Lcset_058_UGE_done:
    brslt8 .Lcset_058_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_058_SLT_done
.Lcset_058_SLT_true:
    cond_emit_char 'B'
.Lcset_058_SLT_done:
    brsge8 .Lcset_058_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_058_SGE_done
.Lcset_058_SGE_true:
    cond_emit_char 'B'
.Lcset_058_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r4; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2430
    push16 r4
    ldi16 r4, 0x2553
    push16 r4
    ldi16 r4, 0x7563
    push16 r4
    ldi16 r4, 0x2799
    push16 r4
    ldi16 r4, 0xafa9
    push16 r4
    ldi16 r4, 0x29df
    push16 r4
    ldi16 r4, 0x2b02
    push16 r4
    ldi16 r4, 0x2c25
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r4
    push16 r2
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_059_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_059_EQ_done
.Lcset_059_EQ_true:
    cond_emit_char 'B'
.Lcset_059_EQ_done:
    brne8 .Lcset_059_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_059_NE_done
.Lcset_059_NE_true:
    cond_emit_char 'B'
.Lcset_059_NE_done:
    brult8 .Lcset_059_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_059_ULT_done
.Lcset_059_ULT_true:
    cond_emit_char 'B'
.Lcset_059_ULT_done:
    bruge8 .Lcset_059_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_059_UGE_done
.Lcset_059_UGE_true:
    cond_emit_char 'B'
.Lcset_059_UGE_done:
    brslt8 .Lcset_059_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_059_SLT_done
.Lcset_059_SLT_true:
    cond_emit_char 'B'
.Lcset_059_SLT_done:
    brsge8 .Lcset_059_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_059_SGE_done
.Lcset_059_SGE_true:
    cond_emit_char 'B'
.Lcset_059_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r5; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2467
    push16 r4
    ldi16 r4, 0x258a
    push16 r4
    ldi16 r4, 0x26ad
    push16 r4
    ldi16 r4, 0x76ad
    push16 r4
    ldi16 r4, 0x28f3
    push16 r4
    ldi16 r4, 0xafd7
    push16 r4
    ldi16 r4, 0x2b39
    push16 r4
    ldi16 r4, 0x2c5c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r5
    push16 r3
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_05a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_05a_EQ_done
.Lcset_05a_EQ_true:
    cond_emit_char 'B'
.Lcset_05a_EQ_done:
    brne8 .Lcset_05a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05a_NE_done
.Lcset_05a_NE_true:
    cond_emit_char 'B'
.Lcset_05a_NE_done:
    brult8 .Lcset_05a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05a_ULT_done
.Lcset_05a_ULT_true:
    cond_emit_char 'B'
.Lcset_05a_ULT_done:
    bruge8 .Lcset_05a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05a_UGE_done
.Lcset_05a_UGE_true:
    cond_emit_char 'B'
.Lcset_05a_UGE_done:
    brslt8 .Lcset_05a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05a_SLT_done
.Lcset_05a_SLT_true:
    cond_emit_char 'B'
.Lcset_05a_SLT_done:
    brsge8 .Lcset_05a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05a_SGE_done
.Lcset_05a_SGE_true:
    cond_emit_char 'B'
.Lcset_05a_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r5; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x249e
    push16 r4
    ldi16 r4, 0x25c1
    push16 r4
    ldi16 r4, 0x26e4
    push16 r4
    ldi16 r4, 0x2807
    push16 r4
    ldi16 r4, 0x77f7
    push16 r4
    ldi16 r4, 0xb004
    push16 r4
    ldi16 r4, 0x2b70
    push16 r4
    ldi16 r4, 0x2c93
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r5
    push16 r4
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_05b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_05b_EQ_done
.Lcset_05b_EQ_true:
    cond_emit_char 'B'
.Lcset_05b_EQ_done:
    brne8 .Lcset_05b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05b_NE_done
.Lcset_05b_NE_true:
    cond_emit_char 'B'
.Lcset_05b_NE_done:
    brult8 .Lcset_05b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05b_ULT_done
.Lcset_05b_ULT_true:
    cond_emit_char 'B'
.Lcset_05b_ULT_done:
    bruge8 .Lcset_05b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05b_UGE_done
.Lcset_05b_UGE_true:
    cond_emit_char 'B'
.Lcset_05b_UGE_done:
    brslt8 .Lcset_05b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05b_SLT_done
.Lcset_05b_SLT_true:
    cond_emit_char 'B'
.Lcset_05b_SLT_done:
    brsge8 .Lcset_05b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05b_SGE_done
.Lcset_05b_SGE_true:
    cond_emit_char 'B'
.Lcset_05b_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r6; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x24d5
    push16 r4
    ldi16 r4, 0x25f8
    push16 r4
    ldi16 r4, 0x271b
    push16 r4
    ldi16 r4, 0x283e
    push16 r4
    ldi16 r4, 0x2961
    push16 r4
    ldi16 r4, 0x7941
    push16 r4
    ldi16 r4, 0xb032
    push16 r4
    ldi16 r4, 0x2cca
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r6
    push16 r5
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_05c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_05c_EQ_done
.Lcset_05c_EQ_true:
    cond_emit_char 'B'
.Lcset_05c_EQ_done:
    brne8 .Lcset_05c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05c_NE_done
.Lcset_05c_NE_true:
    cond_emit_char 'B'
.Lcset_05c_NE_done:
    brult8 .Lcset_05c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05c_ULT_done
.Lcset_05c_ULT_true:
    cond_emit_char 'B'
.Lcset_05c_ULT_done:
    bruge8 .Lcset_05c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05c_UGE_done
.Lcset_05c_UGE_true:
    cond_emit_char 'B'
.Lcset_05c_UGE_done:
    brslt8 .Lcset_05c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05c_SLT_done
.Lcset_05c_SLT_true:
    cond_emit_char 'B'
.Lcset_05c_SLT_done:
    brsge8 .Lcset_05c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05c_SGE_done
.Lcset_05c_SGE_true:
    cond_emit_char 'B'
.Lcset_05c_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r6; path true; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x250c
    push16 r4
    ldi16 r4, 0x262f
    push16 r4
    ldi16 r4, 0x2752
    push16 r4
    ldi16 r4, 0x2875
    push16 r4
    ldi16 r4, 0x2998
    push16 r4
    ldi16 r4, 0x2abb
    push16 r4
    ldi16 r4, 0xb05f
    push16 r4
    ldi16 r4, 0x7b8c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r6
    push16 r7
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_05d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_05d_EQ_done
.Lcset_05d_EQ_true:
    cond_emit_char 'B'
.Lcset_05d_EQ_done:
    brne8 .Lcset_05d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05d_NE_done
.Lcset_05d_NE_true:
    cond_emit_char 'B'
.Lcset_05d_NE_done:
    brult8 .Lcset_05d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05d_ULT_done
.Lcset_05d_ULT_true:
    cond_emit_char 'B'
.Lcset_05d_ULT_done:
    bruge8 .Lcset_05d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05d_UGE_done
.Lcset_05d_UGE_true:
    cond_emit_char 'B'
.Lcset_05d_UGE_done:
    brslt8 .Lcset_05d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05d_SLT_done
.Lcset_05d_SLT_true:
    cond_emit_char 'B'
.Lcset_05d_SLT_done:
    brsge8 .Lcset_05d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05d_SGE_done
.Lcset_05d_SGE_true:
    cond_emit_char 'B'
.Lcset_05d_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r7; path false; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x74ce
    push16 r4
    ldi16 r4, 0x2666
    push16 r4
    ldi16 r4, 0x2789
    push16 r4
    ldi16 r4, 0x28ac
    push16 r4
    ldi16 r4, 0x29cf
    push16 r4
    ldi16 r4, 0x2af2
    push16 r4
    ldi16 r4, 0x2c15
    push16 r4
    ldi16 r4, 0xb08d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_05e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_05e_EQ_done
.Lcset_05e_EQ_true:
    cond_emit_char 'B'
.Lcset_05e_EQ_done:
    brne8 .Lcset_05e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05e_NE_done
.Lcset_05e_NE_true:
    cond_emit_char 'B'
.Lcset_05e_NE_done:
    brult8 .Lcset_05e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05e_ULT_done
.Lcset_05e_ULT_true:
    cond_emit_char 'B'
.Lcset_05e_ULT_done:
    bruge8 .Lcset_05e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05e_UGE_done
.Lcset_05e_UGE_true:
    cond_emit_char 'B'
.Lcset_05e_UGE_done:
    brslt8 .Lcset_05e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05e_SLT_done
.Lcset_05e_SLT_true:
    cond_emit_char 'B'
.Lcset_05e_SLT_done:
    brsge8 .Lcset_05e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05e_SGE_done
.Lcset_05e_SGE_true:
    cond_emit_char 'B'
.Lcset_05e_SGE_done:
    cond_emit_char '\n'

    ; cset.sge r7; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7517
    push16 r4
    ldi16 r4, 0x269d
    push16 r4
    ldi16 r4, 0x27c0
    push16 r4
    ldi16 r4, 0x28e3
    push16 r4
    ldi16 r4, 0x2a06
    push16 r4
    ldi16 r4, 0x2b29
    push16 r4
    ldi16 r4, 0x2c4c
    push16 r4
    ldi16 r4, 0xb0ba
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cset.sge r7
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcset_05f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcset_05f_EQ_done
.Lcset_05f_EQ_true:
    cond_emit_char 'B'
.Lcset_05f_EQ_done:
    brne8 .Lcset_05f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05f_NE_done
.Lcset_05f_NE_true:
    cond_emit_char 'B'
.Lcset_05f_NE_done:
    brult8 .Lcset_05f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05f_ULT_done
.Lcset_05f_ULT_true:
    cond_emit_char 'B'
.Lcset_05f_ULT_done:
    bruge8 .Lcset_05f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05f_UGE_done
.Lcset_05f_UGE_true:
    cond_emit_char 'B'
.Lcset_05f_UGE_done:
    brslt8 .Lcset_05f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcset_05f_SLT_done
.Lcset_05f_SLT_true:
    cond_emit_char 'B'
.Lcset_05f_SLT_done:
    brsge8 .Lcset_05f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcset_05f_SGE_done
.Lcset_05f_SGE_true:
    cond_emit_char 'B'
.Lcset_05f_SGE_done:
    cond_emit_char '\n'

    sys debug_break
