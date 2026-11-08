.include "include/conditional_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; cmov.slt r0,r0; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2100
    push16 r4
    ldi16 r4, 0x6d01
    push16 r4
    ldi16 r4, 0x4a57
    push16 r4
    ldi16 r4, 0x4b7a
    push16 r4
    ldi16 r4, 0x4c9d
    push16 r4
    ldi16 r4, 0x4dc0
    push16 r4
    ldi16 r4, 0x4ee3
    push16 r4
    ldi16 r4, 0x5006
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r0
    push16 r1
    push16 r0
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_000_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_000_EQ_done
.Lcmov_slt_sge_000_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_000_EQ_done:
    brne8 .Lcmov_slt_sge_000_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_000_NE_done
.Lcmov_slt_sge_000_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_000_NE_done:
    brult8 .Lcmov_slt_sge_000_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_000_ULT_done
.Lcmov_slt_sge_000_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_000_ULT_done:
    bruge8 .Lcmov_slt_sge_000_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_000_UGE_done
.Lcmov_slt_sge_000_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_000_UGE_done:
    brslt8 .Lcmov_slt_sge_000_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_000_SLT_done
.Lcmov_slt_sge_000_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_000_SLT_done:
    brsge8 .Lcmov_slt_sge_000_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_000_SGE_done
.Lcmov_slt_sge_000_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_000_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r0; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2131
    push16 r4
    ldi16 r4, 0x496b
    push16 r4
    ldi16 r4, 0x6e55
    push16 r4
    ldi16 r4, 0x4bb1
    push16 r4
    ldi16 r4, 0x4cd4
    push16 r4
    ldi16 r4, 0x4df7
    push16 r4
    ldi16 r4, 0x4f1a
    push16 r4
    ldi16 r4, 0x503d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r0
    push16 r2
    push16 r0
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_001_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_001_EQ_done
.Lcmov_slt_sge_001_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_001_EQ_done:
    brne8 .Lcmov_slt_sge_001_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_001_NE_done
.Lcmov_slt_sge_001_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_001_NE_done:
    brult8 .Lcmov_slt_sge_001_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_001_ULT_done
.Lcmov_slt_sge_001_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_001_ULT_done:
    bruge8 .Lcmov_slt_sge_001_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_001_UGE_done
.Lcmov_slt_sge_001_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_001_UGE_done:
    brslt8 .Lcmov_slt_sge_001_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_001_SLT_done
.Lcmov_slt_sge_001_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_001_SLT_done:
    brsge8 .Lcmov_slt_sge_001_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_001_SGE_done
.Lcmov_slt_sge_001_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_001_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r1; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2162
    push16 r4
    ldi16 r4, 0xd177
    push16 r4
    ldi16 r4, 0x4ac5
    push16 r4
    ldi16 r4, 0x6fa9
    push16 r4
    ldi16 r4, 0x4d0b
    push16 r4
    ldi16 r4, 0x4e2e
    push16 r4
    ldi16 r4, 0x4f51
    push16 r4
    ldi16 r4, 0x5074
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r1
    push16 r3
    push16 r1
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_002_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_002_EQ_done
.Lcmov_slt_sge_002_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_002_EQ_done:
    brne8 .Lcmov_slt_sge_002_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_002_NE_done
.Lcmov_slt_sge_002_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_002_NE_done:
    brult8 .Lcmov_slt_sge_002_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_002_ULT_done
.Lcmov_slt_sge_002_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_002_ULT_done:
    bruge8 .Lcmov_slt_sge_002_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_002_UGE_done
.Lcmov_slt_sge_002_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_002_UGE_done:
    brslt8 .Lcmov_slt_sge_002_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_002_SLT_done
.Lcmov_slt_sge_002_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_002_SLT_done:
    brsge8 .Lcmov_slt_sge_002_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_002_SGE_done
.Lcmov_slt_sge_002_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_002_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r1; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2193
    push16 r4
    ldi16 r4, 0xd1b2
    push16 r4
    ldi16 r4, 0x4afc
    push16 r4
    ldi16 r4, 0x4c1f
    push16 r4
    ldi16 r4, 0x70fd
    push16 r4
    ldi16 r4, 0x4e65
    push16 r4
    ldi16 r4, 0x4f88
    push16 r4
    ldi16 r4, 0x50ab
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r1
    push16 r4
    push16 r1
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_003_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_003_EQ_done
.Lcmov_slt_sge_003_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_003_EQ_done:
    brne8 .Lcmov_slt_sge_003_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_003_NE_done
.Lcmov_slt_sge_003_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_003_NE_done:
    brult8 .Lcmov_slt_sge_003_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_003_ULT_done
.Lcmov_slt_sge_003_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_003_ULT_done:
    bruge8 .Lcmov_slt_sge_003_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_003_UGE_done
.Lcmov_slt_sge_003_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_003_UGE_done:
    brslt8 .Lcmov_slt_sge_003_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_003_SLT_done
.Lcmov_slt_sge_003_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_003_SLT_done:
    brsge8 .Lcmov_slt_sge_003_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_003_SGE_done
.Lcmov_slt_sge_003_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_003_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r2; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x21c4
    push16 r4
    ldi16 r4, 0x4a10
    push16 r4
    ldi16 r4, 0xd2ee
    push16 r4
    ldi16 r4, 0x4c56
    push16 r4
    ldi16 r4, 0x4d79
    push16 r4
    ldi16 r4, 0x7251
    push16 r4
    ldi16 r4, 0x4fbf
    push16 r4
    ldi16 r4, 0x50e2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r2
    push16 r5
    push16 r2
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_004_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_004_EQ_done
.Lcmov_slt_sge_004_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_004_EQ_done:
    brne8 .Lcmov_slt_sge_004_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_004_NE_done
.Lcmov_slt_sge_004_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_004_NE_done:
    brult8 .Lcmov_slt_sge_004_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_004_ULT_done
.Lcmov_slt_sge_004_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_004_ULT_done:
    bruge8 .Lcmov_slt_sge_004_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_004_UGE_done
.Lcmov_slt_sge_004_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_004_UGE_done:
    brslt8 .Lcmov_slt_sge_004_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_004_SLT_done
.Lcmov_slt_sge_004_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_004_SLT_done:
    brsge8 .Lcmov_slt_sge_004_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_004_SGE_done
.Lcmov_slt_sge_004_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_004_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r2; path true; guard r6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x21f5
    push16 r4
    ldi16 r4, 0x4a47
    push16 r4
    ldi16 r4, 0xd329
    push16 r4
    ldi16 r4, 0x4c8d
    push16 r4
    ldi16 r4, 0x4db0
    push16 r4
    ldi16 r4, 0x4ed3
    push16 r4
    ldi16 r4, 0x73a5
    push16 r4
    ldi16 r4, 0x5119
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r2
    push16 r6
    push16 r2
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_005_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_005_EQ_done
.Lcmov_slt_sge_005_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_005_EQ_done:
    brne8 .Lcmov_slt_sge_005_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_005_NE_done
.Lcmov_slt_sge_005_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_005_NE_done:
    brult8 .Lcmov_slt_sge_005_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_005_ULT_done
.Lcmov_slt_sge_005_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_005_ULT_done:
    bruge8 .Lcmov_slt_sge_005_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_005_UGE_done
.Lcmov_slt_sge_005_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_005_UGE_done:
    brslt8 .Lcmov_slt_sge_005_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_005_SLT_done
.Lcmov_slt_sge_005_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_005_SLT_done:
    brsge8 .Lcmov_slt_sge_005_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_005_SGE_done
.Lcmov_slt_sge_005_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_005_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r3; path false; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2226
    push16 r4
    ldi16 r4, 0x4a7e
    push16 r4
    ldi16 r4, 0x4ba1
    push16 r4
    ldi16 r4, 0xd465
    push16 r4
    ldi16 r4, 0x4de7
    push16 r4
    ldi16 r4, 0x4f0a
    push16 r4
    ldi16 r4, 0x502d
    push16 r4
    ldi16 r4, 0x74f9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r3
    push16 r7
    push16 r3
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_006_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_006_EQ_done
.Lcmov_slt_sge_006_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_006_EQ_done:
    brne8 .Lcmov_slt_sge_006_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_006_NE_done
.Lcmov_slt_sge_006_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_006_NE_done:
    brult8 .Lcmov_slt_sge_006_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_006_ULT_done
.Lcmov_slt_sge_006_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_006_ULT_done:
    bruge8 .Lcmov_slt_sge_006_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_006_UGE_done
.Lcmov_slt_sge_006_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_006_UGE_done:
    brslt8 .Lcmov_slt_sge_006_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_006_SLT_done
.Lcmov_slt_sge_006_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_006_SLT_done:
    brsge8 .Lcmov_slt_sge_006_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_006_SGE_done
.Lcmov_slt_sge_006_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_006_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r3; path true; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2257
    push16 r4
    ldi16 r4, 0x6f46
    push16 r4
    ldi16 r4, 0x4bd8
    push16 r4
    ldi16 r4, 0xd4a0
    push16 r4
    ldi16 r4, 0x4e1e
    push16 r4
    ldi16 r4, 0x4f41
    push16 r4
    ldi16 r4, 0x5064
    push16 r4
    ldi16 r4, 0x5187
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r3
    push16 r1
    push16 r3
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_007_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_007_EQ_done
.Lcmov_slt_sge_007_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_007_EQ_done:
    brne8 .Lcmov_slt_sge_007_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_007_NE_done
.Lcmov_slt_sge_007_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_007_NE_done:
    brult8 .Lcmov_slt_sge_007_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_007_ULT_done
.Lcmov_slt_sge_007_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_007_ULT_done:
    bruge8 .Lcmov_slt_sge_007_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_007_UGE_done
.Lcmov_slt_sge_007_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_007_UGE_done:
    brslt8 .Lcmov_slt_sge_007_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_007_SLT_done
.Lcmov_slt_sge_007_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_007_SLT_done:
    brsge8 .Lcmov_slt_sge_007_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_007_SGE_done
.Lcmov_slt_sge_007_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_007_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r4; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2288
    push16 r4
    ldi16 r4, 0x6f99
    push16 r4
    ldi16 r4, 0x4c0f
    push16 r4
    ldi16 r4, 0x4d32
    push16 r4
    ldi16 r4, 0xd5dc
    push16 r4
    ldi16 r4, 0x4f78
    push16 r4
    ldi16 r4, 0x509b
    push16 r4
    ldi16 r4, 0x51be
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r4
    push16 r1
    push16 r4
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_008_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_008_EQ_done
.Lcmov_slt_sge_008_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_008_EQ_done:
    brne8 .Lcmov_slt_sge_008_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_008_NE_done
.Lcmov_slt_sge_008_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_008_NE_done:
    brult8 .Lcmov_slt_sge_008_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_008_ULT_done
.Lcmov_slt_sge_008_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_008_ULT_done:
    bruge8 .Lcmov_slt_sge_008_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_008_UGE_done
.Lcmov_slt_sge_008_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_008_UGE_done:
    brslt8 .Lcmov_slt_sge_008_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_008_SLT_done
.Lcmov_slt_sge_008_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_008_SLT_done:
    brsge8 .Lcmov_slt_sge_008_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_008_SGE_done
.Lcmov_slt_sge_008_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_008_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r4; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x22b9
    push16 r4
    ldi16 r4, 0x4b23
    push16 r4
    ldi16 r4, 0x70ed
    push16 r4
    ldi16 r4, 0x4d69
    push16 r4
    ldi16 r4, 0xd617
    push16 r4
    ldi16 r4, 0x4faf
    push16 r4
    ldi16 r4, 0x50d2
    push16 r4
    ldi16 r4, 0x51f5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r4
    push16 r2
    push16 r4
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_009_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_009_EQ_done
.Lcmov_slt_sge_009_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_009_EQ_done:
    brne8 .Lcmov_slt_sge_009_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_009_NE_done
.Lcmov_slt_sge_009_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_009_NE_done:
    brult8 .Lcmov_slt_sge_009_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_009_ULT_done
.Lcmov_slt_sge_009_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_009_ULT_done:
    bruge8 .Lcmov_slt_sge_009_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_009_UGE_done
.Lcmov_slt_sge_009_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_009_UGE_done:
    brslt8 .Lcmov_slt_sge_009_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_009_SLT_done
.Lcmov_slt_sge_009_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_009_SLT_done:
    brsge8 .Lcmov_slt_sge_009_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_009_SGE_done
.Lcmov_slt_sge_009_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_009_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r5; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x22ea
    push16 r4
    ldi16 r4, 0x4b5a
    push16 r4
    ldi16 r4, 0x4c7d
    push16 r4
    ldi16 r4, 0x7241
    push16 r4
    ldi16 r4, 0x4ec3
    push16 r4
    ldi16 r4, 0xd753
    push16 r4
    ldi16 r4, 0x5109
    push16 r4
    ldi16 r4, 0x522c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r5
    push16 r3
    push16 r5
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_00a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00a_EQ_done
.Lcmov_slt_sge_00a_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00a_EQ_done:
    brne8 .Lcmov_slt_sge_00a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00a_NE_done
.Lcmov_slt_sge_00a_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00a_NE_done:
    brult8 .Lcmov_slt_sge_00a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00a_ULT_done
.Lcmov_slt_sge_00a_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00a_ULT_done:
    bruge8 .Lcmov_slt_sge_00a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00a_UGE_done
.Lcmov_slt_sge_00a_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00a_UGE_done:
    brslt8 .Lcmov_slt_sge_00a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00a_SLT_done
.Lcmov_slt_sge_00a_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00a_SLT_done:
    brsge8 .Lcmov_slt_sge_00a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00a_SGE_done
.Lcmov_slt_sge_00a_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00a_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r5; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x231b
    push16 r4
    ldi16 r4, 0x4b91
    push16 r4
    ldi16 r4, 0x4cb4
    push16 r4
    ldi16 r4, 0x4dd7
    push16 r4
    ldi16 r4, 0x7395
    push16 r4
    ldi16 r4, 0xd78e
    push16 r4
    ldi16 r4, 0x5140
    push16 r4
    ldi16 r4, 0x5263
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r5
    push16 r4
    push16 r5
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_00b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00b_EQ_done
.Lcmov_slt_sge_00b_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00b_EQ_done:
    brne8 .Lcmov_slt_sge_00b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00b_NE_done
.Lcmov_slt_sge_00b_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00b_NE_done:
    brult8 .Lcmov_slt_sge_00b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00b_ULT_done
.Lcmov_slt_sge_00b_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00b_ULT_done:
    bruge8 .Lcmov_slt_sge_00b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00b_UGE_done
.Lcmov_slt_sge_00b_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00b_UGE_done:
    brslt8 .Lcmov_slt_sge_00b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00b_SLT_done
.Lcmov_slt_sge_00b_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00b_SLT_done:
    brsge8 .Lcmov_slt_sge_00b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00b_SGE_done
.Lcmov_slt_sge_00b_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00b_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r6; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x234c
    push16 r4
    ldi16 r4, 0x4bc8
    push16 r4
    ldi16 r4, 0x4ceb
    push16 r4
    ldi16 r4, 0x4e0e
    push16 r4
    ldi16 r4, 0x4f31
    push16 r4
    ldi16 r4, 0x74e9
    push16 r4
    ldi16 r4, 0xd8ca
    push16 r4
    ldi16 r4, 0x529a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r6
    push16 r5
    push16 r6
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_00c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00c_EQ_done
.Lcmov_slt_sge_00c_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00c_EQ_done:
    brne8 .Lcmov_slt_sge_00c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00c_NE_done
.Lcmov_slt_sge_00c_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00c_NE_done:
    brult8 .Lcmov_slt_sge_00c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00c_ULT_done
.Lcmov_slt_sge_00c_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00c_ULT_done:
    bruge8 .Lcmov_slt_sge_00c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00c_UGE_done
.Lcmov_slt_sge_00c_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00c_UGE_done:
    brslt8 .Lcmov_slt_sge_00c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00c_SLT_done
.Lcmov_slt_sge_00c_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00c_SLT_done:
    brsge8 .Lcmov_slt_sge_00c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00c_SGE_done
.Lcmov_slt_sge_00c_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00c_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r6; path true; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x237d
    push16 r4
    ldi16 r4, 0x4bff
    push16 r4
    ldi16 r4, 0x4d22
    push16 r4
    ldi16 r4, 0x4e45
    push16 r4
    ldi16 r4, 0x4f68
    push16 r4
    ldi16 r4, 0x508b
    push16 r4
    ldi16 r4, 0xd905
    push16 r4
    ldi16 r4, 0x773e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r6
    push16 r7
    push16 r6
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_00d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00d_EQ_done
.Lcmov_slt_sge_00d_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00d_EQ_done:
    brne8 .Lcmov_slt_sge_00d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00d_NE_done
.Lcmov_slt_sge_00d_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00d_NE_done:
    brult8 .Lcmov_slt_sge_00d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00d_ULT_done
.Lcmov_slt_sge_00d_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00d_ULT_done:
    bruge8 .Lcmov_slt_sge_00d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00d_UGE_done
.Lcmov_slt_sge_00d_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00d_UGE_done:
    brslt8 .Lcmov_slt_sge_00d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00d_SLT_done
.Lcmov_slt_sge_00d_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00d_SLT_done:
    brsge8 .Lcmov_slt_sge_00d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00d_SGE_done
.Lcmov_slt_sge_00d_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00d_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r7; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x23ae
    push16 r4
    ldi16 r4, 0x718b
    push16 r4
    ldi16 r4, 0x4d59
    push16 r4
    ldi16 r4, 0x4e7c
    push16 r4
    ldi16 r4, 0x4f9f
    push16 r4
    ldi16 r4, 0x50c2
    push16 r4
    ldi16 r4, 0x51e5
    push16 r4
    ldi16 r4, 0xda41
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r7
    push16 r1
    push16 r7
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_00e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00e_EQ_done
.Lcmov_slt_sge_00e_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00e_EQ_done:
    brne8 .Lcmov_slt_sge_00e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00e_NE_done
.Lcmov_slt_sge_00e_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00e_NE_done:
    brult8 .Lcmov_slt_sge_00e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00e_ULT_done
.Lcmov_slt_sge_00e_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00e_ULT_done:
    bruge8 .Lcmov_slt_sge_00e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00e_UGE_done
.Lcmov_slt_sge_00e_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00e_UGE_done:
    brslt8 .Lcmov_slt_sge_00e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00e_SLT_done
.Lcmov_slt_sge_00e_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00e_SLT_done:
    brsge8 .Lcmov_slt_sge_00e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00e_SGE_done
.Lcmov_slt_sge_00e_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00e_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r0,r7; path true; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x23df
    push16 r4
    ldi16 r4, 0x71de
    push16 r4
    ldi16 r4, 0x4d90
    push16 r4
    ldi16 r4, 0x4eb3
    push16 r4
    ldi16 r4, 0x4fd6
    push16 r4
    ldi16 r4, 0x50f9
    push16 r4
    ldi16 r4, 0x521c
    push16 r4
    ldi16 r4, 0xda7c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r0, r7
    push16 r1
    push16 r7
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_00f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00f_EQ_done
.Lcmov_slt_sge_00f_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00f_EQ_done:
    brne8 .Lcmov_slt_sge_00f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00f_NE_done
.Lcmov_slt_sge_00f_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00f_NE_done:
    brult8 .Lcmov_slt_sge_00f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00f_ULT_done
.Lcmov_slt_sge_00f_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00f_ULT_done:
    bruge8 .Lcmov_slt_sge_00f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00f_UGE_done
.Lcmov_slt_sge_00f_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00f_UGE_done:
    brslt8 .Lcmov_slt_sge_00f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00f_SLT_done
.Lcmov_slt_sge_00f_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00f_SLT_done:
    brsge8 .Lcmov_slt_sge_00f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_00f_SGE_done
.Lcmov_slt_sge_00f_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_00f_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r0; path false; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xd3b0
    push16 r4
    ldi16 r4, 0x2521
    push16 r4
    ldi16 r4, 0x7332
    push16 r4
    ldi16 r4, 0x4eea
    push16 r4
    ldi16 r4, 0x500d
    push16 r4
    ldi16 r4, 0x5130
    push16 r4
    ldi16 r4, 0x5253
    push16 r4
    ldi16 r4, 0x5376
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r0
    push16 r2
    push16 r0
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_010_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_010_EQ_done
.Lcmov_slt_sge_010_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_010_EQ_done:
    brne8 .Lcmov_slt_sge_010_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_010_NE_done
.Lcmov_slt_sge_010_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_010_NE_done:
    brult8 .Lcmov_slt_sge_010_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_010_ULT_done
.Lcmov_slt_sge_010_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_010_ULT_done:
    bruge8 .Lcmov_slt_sge_010_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_010_UGE_done
.Lcmov_slt_sge_010_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_010_UGE_done:
    brslt8 .Lcmov_slt_sge_010_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_010_SLT_done
.Lcmov_slt_sge_010_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_010_SLT_done:
    brsge8 .Lcmov_slt_sge_010_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_010_SGE_done
.Lcmov_slt_sge_010_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_010_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r0; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xd3eb
    push16 r4
    ldi16 r4, 0x2552
    push16 r4
    ldi16 r4, 0x7385
    push16 r4
    ldi16 r4, 0x4f21
    push16 r4
    ldi16 r4, 0x5044
    push16 r4
    ldi16 r4, 0x5167
    push16 r4
    ldi16 r4, 0x528a
    push16 r4
    ldi16 r4, 0x53ad
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r0
    push16 r2
    push16 r0
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_011_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_011_EQ_done
.Lcmov_slt_sge_011_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_011_EQ_done:
    brne8 .Lcmov_slt_sge_011_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_011_NE_done
.Lcmov_slt_sge_011_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_011_NE_done:
    brult8 .Lcmov_slt_sge_011_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_011_ULT_done
.Lcmov_slt_sge_011_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_011_ULT_done:
    bruge8 .Lcmov_slt_sge_011_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_011_UGE_done
.Lcmov_slt_sge_011_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_011_UGE_done:
    brslt8 .Lcmov_slt_sge_011_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_011_SLT_done
.Lcmov_slt_sge_011_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_011_SLT_done:
    brsge8 .Lcmov_slt_sge_011_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_011_SGE_done
.Lcmov_slt_sge_011_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_011_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r1; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4bef
    push16 r4
    ldi16 r4, 0x2583
    push16 r4
    ldi16 r4, 0x4e35
    push16 r4
    ldi16 r4, 0x74d9
    push16 r4
    ldi16 r4, 0x507b
    push16 r4
    ldi16 r4, 0x519e
    push16 r4
    ldi16 r4, 0x52c1
    push16 r4
    ldi16 r4, 0x53e4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r1
    push16 r3
    push16 r1
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_012_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_012_EQ_done
.Lcmov_slt_sge_012_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_012_EQ_done:
    brne8 .Lcmov_slt_sge_012_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_012_NE_done
.Lcmov_slt_sge_012_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_012_NE_done:
    brult8 .Lcmov_slt_sge_012_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_012_ULT_done
.Lcmov_slt_sge_012_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_012_ULT_done:
    bruge8 .Lcmov_slt_sge_012_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_012_UGE_done
.Lcmov_slt_sge_012_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_012_UGE_done:
    brslt8 .Lcmov_slt_sge_012_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_012_SLT_done
.Lcmov_slt_sge_012_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_012_SLT_done:
    brsge8 .Lcmov_slt_sge_012_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_012_SGE_done
.Lcmov_slt_sge_012_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_012_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r1; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4c26
    push16 r4
    ldi16 r4, 0x25b4
    push16 r4
    ldi16 r4, 0x4e6c
    push16 r4
    ldi16 r4, 0x4f8f
    push16 r4
    ldi16 r4, 0x762d
    push16 r4
    ldi16 r4, 0x51d5
    push16 r4
    ldi16 r4, 0x52f8
    push16 r4
    ldi16 r4, 0x541b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r1
    push16 r4
    push16 r1
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_013_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_013_EQ_done
.Lcmov_slt_sge_013_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_013_EQ_done:
    brne8 .Lcmov_slt_sge_013_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_013_NE_done
.Lcmov_slt_sge_013_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_013_NE_done:
    brult8 .Lcmov_slt_sge_013_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_013_ULT_done
.Lcmov_slt_sge_013_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_013_ULT_done:
    bruge8 .Lcmov_slt_sge_013_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_013_UGE_done
.Lcmov_slt_sge_013_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_013_UGE_done:
    brslt8 .Lcmov_slt_sge_013_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_013_SLT_done
.Lcmov_slt_sge_013_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_013_SLT_done:
    brsge8 .Lcmov_slt_sge_013_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_013_SGE_done
.Lcmov_slt_sge_013_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_013_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r2; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4c5d
    push16 r4
    ldi16 r4, 0x25e5
    push16 r4
    ldi16 r4, 0xd69e
    push16 r4
    ldi16 r4, 0x4fc6
    push16 r4
    ldi16 r4, 0x50e9
    push16 r4
    ldi16 r4, 0x7781
    push16 r4
    ldi16 r4, 0x532f
    push16 r4
    ldi16 r4, 0x5452
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r2
    push16 r5
    push16 r2
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_014_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_014_EQ_done
.Lcmov_slt_sge_014_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_014_EQ_done:
    brne8 .Lcmov_slt_sge_014_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_014_NE_done
.Lcmov_slt_sge_014_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_014_NE_done:
    brult8 .Lcmov_slt_sge_014_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_014_ULT_done
.Lcmov_slt_sge_014_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_014_ULT_done:
    bruge8 .Lcmov_slt_sge_014_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_014_UGE_done
.Lcmov_slt_sge_014_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_014_UGE_done:
    brslt8 .Lcmov_slt_sge_014_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_014_SLT_done
.Lcmov_slt_sge_014_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_014_SLT_done:
    brsge8 .Lcmov_slt_sge_014_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_014_SGE_done
.Lcmov_slt_sge_014_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_014_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r2; path true; guard r6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4c94
    push16 r4
    ldi16 r4, 0x2616
    push16 r4
    ldi16 r4, 0xd6d9
    push16 r4
    ldi16 r4, 0x4ffd
    push16 r4
    ldi16 r4, 0x5120
    push16 r4
    ldi16 r4, 0x5243
    push16 r4
    ldi16 r4, 0x78d5
    push16 r4
    ldi16 r4, 0x5489
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r2
    push16 r6
    push16 r2
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_015_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_015_EQ_done
.Lcmov_slt_sge_015_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_015_EQ_done:
    brne8 .Lcmov_slt_sge_015_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_015_NE_done
.Lcmov_slt_sge_015_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_015_NE_done:
    brult8 .Lcmov_slt_sge_015_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_015_ULT_done
.Lcmov_slt_sge_015_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_015_ULT_done:
    bruge8 .Lcmov_slt_sge_015_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_015_UGE_done
.Lcmov_slt_sge_015_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_015_UGE_done:
    brslt8 .Lcmov_slt_sge_015_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_015_SLT_done
.Lcmov_slt_sge_015_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_015_SLT_done:
    brsge8 .Lcmov_slt_sge_015_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_015_SGE_done
.Lcmov_slt_sge_015_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_015_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r3; path false; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4ccb
    push16 r4
    ldi16 r4, 0x2647
    push16 r4
    ldi16 r4, 0x4f11
    push16 r4
    ldi16 r4, 0xd815
    push16 r4
    ldi16 r4, 0x5157
    push16 r4
    ldi16 r4, 0x527a
    push16 r4
    ldi16 r4, 0x539d
    push16 r4
    ldi16 r4, 0x7a29
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r3
    push16 r7
    push16 r3
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_016_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_016_EQ_done
.Lcmov_slt_sge_016_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_016_EQ_done:
    brne8 .Lcmov_slt_sge_016_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_016_NE_done
.Lcmov_slt_sge_016_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_016_NE_done:
    brult8 .Lcmov_slt_sge_016_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_016_ULT_done
.Lcmov_slt_sge_016_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_016_ULT_done:
    bruge8 .Lcmov_slt_sge_016_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_016_UGE_done
.Lcmov_slt_sge_016_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_016_UGE_done:
    brslt8 .Lcmov_slt_sge_016_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_016_SLT_done
.Lcmov_slt_sge_016_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_016_SLT_done:
    brsge8 .Lcmov_slt_sge_016_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_016_SGE_done
.Lcmov_slt_sge_016_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_016_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r3; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7375
    push16 r4
    ldi16 r4, 0x2678
    push16 r4
    ldi16 r4, 0x4f48
    push16 r4
    ldi16 r4, 0xd850
    push16 r4
    ldi16 r4, 0x518e
    push16 r4
    ldi16 r4, 0x52b1
    push16 r4
    ldi16 r4, 0x53d4
    push16 r4
    ldi16 r4, 0x54f7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r3
    push16 r0
    push16 r3
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_017_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_017_EQ_done
.Lcmov_slt_sge_017_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_017_EQ_done:
    brne8 .Lcmov_slt_sge_017_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_017_NE_done
.Lcmov_slt_sge_017_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_017_NE_done:
    brult8 .Lcmov_slt_sge_017_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_017_ULT_done
.Lcmov_slt_sge_017_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_017_ULT_done:
    bruge8 .Lcmov_slt_sge_017_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_017_UGE_done
.Lcmov_slt_sge_017_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_017_UGE_done:
    brslt8 .Lcmov_slt_sge_017_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_017_SLT_done
.Lcmov_slt_sge_017_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_017_SLT_done:
    brsge8 .Lcmov_slt_sge_017_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_017_SGE_done
.Lcmov_slt_sge_017_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_017_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r4; path false; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4d39
    push16 r4
    ldi16 r4, 0x26a9
    push16 r4
    ldi16 r4, 0x75ca
    push16 r4
    ldi16 r4, 0x50a2
    push16 r4
    ldi16 r4, 0xd98c
    push16 r4
    ldi16 r4, 0x52e8
    push16 r4
    ldi16 r4, 0x540b
    push16 r4
    ldi16 r4, 0x552e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r4
    push16 r2
    push16 r4
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_018_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_018_EQ_done
.Lcmov_slt_sge_018_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_018_EQ_done:
    brne8 .Lcmov_slt_sge_018_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_018_NE_done
.Lcmov_slt_sge_018_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_018_NE_done:
    brult8 .Lcmov_slt_sge_018_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_018_ULT_done
.Lcmov_slt_sge_018_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_018_ULT_done:
    bruge8 .Lcmov_slt_sge_018_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_018_UGE_done
.Lcmov_slt_sge_018_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_018_UGE_done:
    brslt8 .Lcmov_slt_sge_018_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_018_SLT_done
.Lcmov_slt_sge_018_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_018_SLT_done:
    brsge8 .Lcmov_slt_sge_018_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_018_SGE_done
.Lcmov_slt_sge_018_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_018_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r4; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4d70
    push16 r4
    ldi16 r4, 0x26da
    push16 r4
    ldi16 r4, 0x761d
    push16 r4
    ldi16 r4, 0x50d9
    push16 r4
    ldi16 r4, 0xd9c7
    push16 r4
    ldi16 r4, 0x531f
    push16 r4
    ldi16 r4, 0x5442
    push16 r4
    ldi16 r4, 0x5565
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r4
    push16 r2
    push16 r4
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_019_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_019_EQ_done
.Lcmov_slt_sge_019_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_019_EQ_done:
    brne8 .Lcmov_slt_sge_019_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_019_NE_done
.Lcmov_slt_sge_019_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_019_NE_done:
    brult8 .Lcmov_slt_sge_019_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_019_ULT_done
.Lcmov_slt_sge_019_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_019_ULT_done:
    bruge8 .Lcmov_slt_sge_019_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_019_UGE_done
.Lcmov_slt_sge_019_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_019_UGE_done:
    brslt8 .Lcmov_slt_sge_019_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_019_SLT_done
.Lcmov_slt_sge_019_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_019_SLT_done:
    brsge8 .Lcmov_slt_sge_019_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_019_SGE_done
.Lcmov_slt_sge_019_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_019_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r5; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4da7
    push16 r4
    ldi16 r4, 0x270b
    push16 r4
    ldi16 r4, 0x4fed
    push16 r4
    ldi16 r4, 0x7771
    push16 r4
    ldi16 r4, 0x5233
    push16 r4
    ldi16 r4, 0xdb03
    push16 r4
    ldi16 r4, 0x5479
    push16 r4
    ldi16 r4, 0x559c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r5
    push16 r3
    push16 r5
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_01a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01a_EQ_done
.Lcmov_slt_sge_01a_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01a_EQ_done:
    brne8 .Lcmov_slt_sge_01a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01a_NE_done
.Lcmov_slt_sge_01a_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01a_NE_done:
    brult8 .Lcmov_slt_sge_01a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01a_ULT_done
.Lcmov_slt_sge_01a_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01a_ULT_done:
    bruge8 .Lcmov_slt_sge_01a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01a_UGE_done
.Lcmov_slt_sge_01a_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01a_UGE_done:
    brslt8 .Lcmov_slt_sge_01a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01a_SLT_done
.Lcmov_slt_sge_01a_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01a_SLT_done:
    brsge8 .Lcmov_slt_sge_01a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01a_SGE_done
.Lcmov_slt_sge_01a_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01a_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r5; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4dde
    push16 r4
    ldi16 r4, 0x273c
    push16 r4
    ldi16 r4, 0x5024
    push16 r4
    ldi16 r4, 0x5147
    push16 r4
    ldi16 r4, 0x78c5
    push16 r4
    ldi16 r4, 0xdb3e
    push16 r4
    ldi16 r4, 0x54b0
    push16 r4
    ldi16 r4, 0x55d3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r5
    push16 r4
    push16 r5
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_01b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01b_EQ_done
.Lcmov_slt_sge_01b_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01b_EQ_done:
    brne8 .Lcmov_slt_sge_01b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01b_NE_done
.Lcmov_slt_sge_01b_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01b_NE_done:
    brult8 .Lcmov_slt_sge_01b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01b_ULT_done
.Lcmov_slt_sge_01b_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01b_ULT_done:
    bruge8 .Lcmov_slt_sge_01b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01b_UGE_done
.Lcmov_slt_sge_01b_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01b_UGE_done:
    brslt8 .Lcmov_slt_sge_01b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01b_SLT_done
.Lcmov_slt_sge_01b_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01b_SLT_done:
    brsge8 .Lcmov_slt_sge_01b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01b_SGE_done
.Lcmov_slt_sge_01b_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01b_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r6; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4e15
    push16 r4
    ldi16 r4, 0x276d
    push16 r4
    ldi16 r4, 0x505b
    push16 r4
    ldi16 r4, 0x517e
    push16 r4
    ldi16 r4, 0x52a1
    push16 r4
    ldi16 r4, 0x7a19
    push16 r4
    ldi16 r4, 0xdc7a
    push16 r4
    ldi16 r4, 0x560a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r6
    push16 r5
    push16 r6
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_01c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01c_EQ_done
.Lcmov_slt_sge_01c_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01c_EQ_done:
    brne8 .Lcmov_slt_sge_01c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01c_NE_done
.Lcmov_slt_sge_01c_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01c_NE_done:
    brult8 .Lcmov_slt_sge_01c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01c_ULT_done
.Lcmov_slt_sge_01c_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01c_ULT_done:
    bruge8 .Lcmov_slt_sge_01c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01c_UGE_done
.Lcmov_slt_sge_01c_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01c_UGE_done:
    brslt8 .Lcmov_slt_sge_01c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01c_SLT_done
.Lcmov_slt_sge_01c_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01c_SLT_done:
    brsge8 .Lcmov_slt_sge_01c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01c_SGE_done
.Lcmov_slt_sge_01c_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01c_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r6; path true; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4e4c
    push16 r4
    ldi16 r4, 0x279e
    push16 r4
    ldi16 r4, 0x5092
    push16 r4
    ldi16 r4, 0x51b5
    push16 r4
    ldi16 r4, 0x52d8
    push16 r4
    ldi16 r4, 0x53fb
    push16 r4
    ldi16 r4, 0xdcb5
    push16 r4
    ldi16 r4, 0x7c6e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r6
    push16 r7
    push16 r6
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_01d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01d_EQ_done
.Lcmov_slt_sge_01d_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01d_EQ_done:
    brne8 .Lcmov_slt_sge_01d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01d_NE_done
.Lcmov_slt_sge_01d_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01d_NE_done:
    brult8 .Lcmov_slt_sge_01d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01d_ULT_done
.Lcmov_slt_sge_01d_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01d_ULT_done:
    bruge8 .Lcmov_slt_sge_01d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01d_UGE_done
.Lcmov_slt_sge_01d_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01d_UGE_done:
    brslt8 .Lcmov_slt_sge_01d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01d_SLT_done
.Lcmov_slt_sge_01d_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01d_SLT_done:
    brsge8 .Lcmov_slt_sge_01d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01d_SGE_done
.Lcmov_slt_sge_01d_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01d_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r7; path false; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x75ba
    push16 r4
    ldi16 r4, 0x27cf
    push16 r4
    ldi16 r4, 0x50c9
    push16 r4
    ldi16 r4, 0x51ec
    push16 r4
    ldi16 r4, 0x530f
    push16 r4
    ldi16 r4, 0x5432
    push16 r4
    ldi16 r4, 0x5555
    push16 r4
    ldi16 r4, 0xddf1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r7
    push16 r0
    push16 r7
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_01e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01e_EQ_done
.Lcmov_slt_sge_01e_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01e_EQ_done:
    brne8 .Lcmov_slt_sge_01e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01e_NE_done
.Lcmov_slt_sge_01e_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01e_NE_done:
    brult8 .Lcmov_slt_sge_01e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01e_ULT_done
.Lcmov_slt_sge_01e_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01e_ULT_done:
    bruge8 .Lcmov_slt_sge_01e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01e_UGE_done
.Lcmov_slt_sge_01e_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01e_UGE_done:
    brslt8 .Lcmov_slt_sge_01e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01e_SLT_done
.Lcmov_slt_sge_01e_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01e_SLT_done:
    brsge8 .Lcmov_slt_sge_01e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01e_SGE_done
.Lcmov_slt_sge_01e_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01e_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r1,r7; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x760d
    push16 r4
    ldi16 r4, 0x2800
    push16 r4
    ldi16 r4, 0x5100
    push16 r4
    ldi16 r4, 0x5223
    push16 r4
    ldi16 r4, 0x5346
    push16 r4
    ldi16 r4, 0x5469
    push16 r4
    ldi16 r4, 0x558c
    push16 r4
    ldi16 r4, 0xde2c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r1, r7
    push16 r0
    push16 r7
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_01f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01f_EQ_done
.Lcmov_slt_sge_01f_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01f_EQ_done:
    brne8 .Lcmov_slt_sge_01f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01f_NE_done
.Lcmov_slt_sge_01f_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01f_NE_done:
    brult8 .Lcmov_slt_sge_01f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01f_ULT_done
.Lcmov_slt_sge_01f_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01f_ULT_done:
    bruge8 .Lcmov_slt_sge_01f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01f_UGE_done
.Lcmov_slt_sge_01f_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01f_UGE_done:
    brslt8 .Lcmov_slt_sge_01f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01f_SLT_done
.Lcmov_slt_sge_01f_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01f_SLT_done:
    brsge8 .Lcmov_slt_sge_01f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_01f_SGE_done
.Lcmov_slt_sge_01f_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_01f_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r0; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xd760
    push16 r4
    ldi16 r4, 0x7761
    push16 r4
    ldi16 r4, 0x2942
    push16 r4
    ldi16 r4, 0x525a
    push16 r4
    ldi16 r4, 0x537d
    push16 r4
    ldi16 r4, 0x54a0
    push16 r4
    ldi16 r4, 0x55c3
    push16 r4
    ldi16 r4, 0x56e6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r0
    push16 r1
    push16 r0
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_020_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_020_EQ_done
.Lcmov_slt_sge_020_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_020_EQ_done:
    brne8 .Lcmov_slt_sge_020_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_020_NE_done
.Lcmov_slt_sge_020_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_020_NE_done:
    brult8 .Lcmov_slt_sge_020_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_020_ULT_done
.Lcmov_slt_sge_020_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_020_ULT_done:
    bruge8 .Lcmov_slt_sge_020_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_020_UGE_done
.Lcmov_slt_sge_020_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_020_UGE_done:
    brslt8 .Lcmov_slt_sge_020_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_020_SLT_done
.Lcmov_slt_sge_020_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_020_SLT_done:
    brsge8 .Lcmov_slt_sge_020_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_020_SGE_done
.Lcmov_slt_sge_020_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_020_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r0; path true; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xd79b
    push16 r4
    ldi16 r4, 0x504b
    push16 r4
    ldi16 r4, 0x2973
    push16 r4
    ldi16 r4, 0x79b6
    push16 r4
    ldi16 r4, 0x53b4
    push16 r4
    ldi16 r4, 0x54d7
    push16 r4
    ldi16 r4, 0x55fa
    push16 r4
    ldi16 r4, 0x571d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r0
    push16 r3
    push16 r0
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_021_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_021_EQ_done
.Lcmov_slt_sge_021_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_021_EQ_done:
    brne8 .Lcmov_slt_sge_021_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_021_NE_done
.Lcmov_slt_sge_021_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_021_NE_done:
    brult8 .Lcmov_slt_sge_021_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_021_ULT_done
.Lcmov_slt_sge_021_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_021_ULT_done:
    bruge8 .Lcmov_slt_sge_021_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_021_UGE_done
.Lcmov_slt_sge_021_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_021_UGE_done:
    brslt8 .Lcmov_slt_sge_021_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_021_SLT_done
.Lcmov_slt_sge_021_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_021_SLT_done:
    brsge8 .Lcmov_slt_sge_021_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_021_SGE_done
.Lcmov_slt_sge_021_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_021_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r1; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4f5f
    push16 r4
    ldi16 r4, 0xd8d7
    push16 r4
    ldi16 r4, 0x29a4
    push16 r4
    ldi16 r4, 0x7a09
    push16 r4
    ldi16 r4, 0x53eb
    push16 r4
    ldi16 r4, 0x550e
    push16 r4
    ldi16 r4, 0x5631
    push16 r4
    ldi16 r4, 0x5754
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r1
    push16 r3
    push16 r1
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_022_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_022_EQ_done
.Lcmov_slt_sge_022_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_022_EQ_done:
    brne8 .Lcmov_slt_sge_022_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_022_NE_done
.Lcmov_slt_sge_022_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_022_NE_done:
    brult8 .Lcmov_slt_sge_022_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_022_ULT_done
.Lcmov_slt_sge_022_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_022_ULT_done:
    bruge8 .Lcmov_slt_sge_022_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_022_UGE_done
.Lcmov_slt_sge_022_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_022_UGE_done:
    brslt8 .Lcmov_slt_sge_022_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_022_SLT_done
.Lcmov_slt_sge_022_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_022_SLT_done:
    brsge8 .Lcmov_slt_sge_022_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_022_SGE_done
.Lcmov_slt_sge_022_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_022_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r1; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4f96
    push16 r4
    ldi16 r4, 0xd912
    push16 r4
    ldi16 r4, 0x29d5
    push16 r4
    ldi16 r4, 0x52ff
    push16 r4
    ldi16 r4, 0x7b5d
    push16 r4
    ldi16 r4, 0x5545
    push16 r4
    ldi16 r4, 0x5668
    push16 r4
    ldi16 r4, 0x578b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r1
    push16 r4
    push16 r1
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_023_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_023_EQ_done
.Lcmov_slt_sge_023_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_023_EQ_done:
    brne8 .Lcmov_slt_sge_023_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_023_NE_done
.Lcmov_slt_sge_023_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_023_NE_done:
    brult8 .Lcmov_slt_sge_023_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_023_ULT_done
.Lcmov_slt_sge_023_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_023_ULT_done:
    bruge8 .Lcmov_slt_sge_023_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_023_UGE_done
.Lcmov_slt_sge_023_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_023_UGE_done:
    brslt8 .Lcmov_slt_sge_023_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_023_SLT_done
.Lcmov_slt_sge_023_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_023_SLT_done:
    brsge8 .Lcmov_slt_sge_023_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_023_SGE_done
.Lcmov_slt_sge_023_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_023_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r2; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4fcd
    push16 r4
    ldi16 r4, 0x50f0
    push16 r4
    ldi16 r4, 0x2a06
    push16 r4
    ldi16 r4, 0x5336
    push16 r4
    ldi16 r4, 0x5459
    push16 r4
    ldi16 r4, 0x7cb1
    push16 r4
    ldi16 r4, 0x569f
    push16 r4
    ldi16 r4, 0x57c2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r2
    push16 r5
    push16 r2
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_024_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_024_EQ_done
.Lcmov_slt_sge_024_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_024_EQ_done:
    brne8 .Lcmov_slt_sge_024_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_024_NE_done
.Lcmov_slt_sge_024_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_024_NE_done:
    brult8 .Lcmov_slt_sge_024_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_024_ULT_done
.Lcmov_slt_sge_024_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_024_ULT_done:
    bruge8 .Lcmov_slt_sge_024_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_024_UGE_done
.Lcmov_slt_sge_024_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_024_UGE_done:
    brslt8 .Lcmov_slt_sge_024_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_024_SLT_done
.Lcmov_slt_sge_024_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_024_SLT_done:
    brsge8 .Lcmov_slt_sge_024_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_024_SGE_done
.Lcmov_slt_sge_024_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_024_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r2; path true; guard r6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5004
    push16 r4
    ldi16 r4, 0x5127
    push16 r4
    ldi16 r4, 0x2a37
    push16 r4
    ldi16 r4, 0x536d
    push16 r4
    ldi16 r4, 0x5490
    push16 r4
    ldi16 r4, 0x55b3
    push16 r4
    ldi16 r4, 0x7e05
    push16 r4
    ldi16 r4, 0x57f9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r2
    push16 r6
    push16 r2
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_025_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_025_EQ_done
.Lcmov_slt_sge_025_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_025_EQ_done:
    brne8 .Lcmov_slt_sge_025_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_025_NE_done
.Lcmov_slt_sge_025_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_025_NE_done:
    brult8 .Lcmov_slt_sge_025_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_025_ULT_done
.Lcmov_slt_sge_025_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_025_ULT_done:
    bruge8 .Lcmov_slt_sge_025_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_025_UGE_done
.Lcmov_slt_sge_025_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_025_UGE_done:
    brslt8 .Lcmov_slt_sge_025_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_025_SLT_done
.Lcmov_slt_sge_025_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_025_SLT_done:
    brsge8 .Lcmov_slt_sge_025_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_025_SGE_done
.Lcmov_slt_sge_025_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_025_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r3; path false; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x503b
    push16 r4
    ldi16 r4, 0x515e
    push16 r4
    ldi16 r4, 0x2a68
    push16 r4
    ldi16 r4, 0xdbc5
    push16 r4
    ldi16 r4, 0x54c7
    push16 r4
    ldi16 r4, 0x55ea
    push16 r4
    ldi16 r4, 0x570d
    push16 r4
    ldi16 r4, 0x7f59
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r3
    push16 r7
    push16 r3
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_026_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_026_EQ_done
.Lcmov_slt_sge_026_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_026_EQ_done:
    brne8 .Lcmov_slt_sge_026_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_026_NE_done
.Lcmov_slt_sge_026_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_026_NE_done:
    brult8 .Lcmov_slt_sge_026_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_026_ULT_done
.Lcmov_slt_sge_026_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_026_ULT_done:
    bruge8 .Lcmov_slt_sge_026_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_026_UGE_done
.Lcmov_slt_sge_026_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_026_UGE_done:
    brslt8 .Lcmov_slt_sge_026_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_026_SLT_done
.Lcmov_slt_sge_026_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_026_SLT_done:
    brsge8 .Lcmov_slt_sge_026_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_026_SGE_done
.Lcmov_slt_sge_026_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_026_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r3; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x78a5
    push16 r4
    ldi16 r4, 0x5195
    push16 r4
    ldi16 r4, 0x2a99
    push16 r4
    ldi16 r4, 0xdc00
    push16 r4
    ldi16 r4, 0x54fe
    push16 r4
    ldi16 r4, 0x5621
    push16 r4
    ldi16 r4, 0x5744
    push16 r4
    ldi16 r4, 0x5867
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r3
    push16 r0
    push16 r3
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_027_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_027_EQ_done
.Lcmov_slt_sge_027_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_027_EQ_done:
    brne8 .Lcmov_slt_sge_027_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_027_NE_done
.Lcmov_slt_sge_027_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_027_NE_done:
    brult8 .Lcmov_slt_sge_027_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_027_ULT_done
.Lcmov_slt_sge_027_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_027_ULT_done:
    bruge8 .Lcmov_slt_sge_027_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_027_UGE_done
.Lcmov_slt_sge_027_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_027_UGE_done:
    brslt8 .Lcmov_slt_sge_027_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_027_SLT_done
.Lcmov_slt_sge_027_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_027_SLT_done:
    brsge8 .Lcmov_slt_sge_027_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_027_SGE_done
.Lcmov_slt_sge_027_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_027_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r4; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x50a9
    push16 r4
    ldi16 r4, 0x79f9
    push16 r4
    ldi16 r4, 0x2aca
    push16 r4
    ldi16 r4, 0x5412
    push16 r4
    ldi16 r4, 0xdd3c
    push16 r4
    ldi16 r4, 0x5658
    push16 r4
    ldi16 r4, 0x577b
    push16 r4
    ldi16 r4, 0x589e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r4
    push16 r1
    push16 r4
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_028_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_028_EQ_done
.Lcmov_slt_sge_028_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_028_EQ_done:
    brne8 .Lcmov_slt_sge_028_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_028_NE_done
.Lcmov_slt_sge_028_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_028_NE_done:
    brult8 .Lcmov_slt_sge_028_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_028_ULT_done
.Lcmov_slt_sge_028_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_028_ULT_done:
    bruge8 .Lcmov_slt_sge_028_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_028_UGE_done
.Lcmov_slt_sge_028_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_028_UGE_done:
    brslt8 .Lcmov_slt_sge_028_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_028_SLT_done
.Lcmov_slt_sge_028_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_028_SLT_done:
    brsge8 .Lcmov_slt_sge_028_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_028_SGE_done
.Lcmov_slt_sge_028_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_028_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r4; path true; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x50e0
    push16 r4
    ldi16 r4, 0x5203
    push16 r4
    ldi16 r4, 0x2afb
    push16 r4
    ldi16 r4, 0x7c4e
    push16 r4
    ldi16 r4, 0xdd77
    push16 r4
    ldi16 r4, 0x568f
    push16 r4
    ldi16 r4, 0x57b2
    push16 r4
    ldi16 r4, 0x58d5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r4
    push16 r3
    push16 r4
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_029_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_029_EQ_done
.Lcmov_slt_sge_029_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_029_EQ_done:
    brne8 .Lcmov_slt_sge_029_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_029_NE_done
.Lcmov_slt_sge_029_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_029_NE_done:
    brult8 .Lcmov_slt_sge_029_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_029_ULT_done
.Lcmov_slt_sge_029_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_029_ULT_done:
    bruge8 .Lcmov_slt_sge_029_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_029_UGE_done
.Lcmov_slt_sge_029_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_029_UGE_done:
    brslt8 .Lcmov_slt_sge_029_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_029_SLT_done
.Lcmov_slt_sge_029_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_029_SLT_done:
    brsge8 .Lcmov_slt_sge_029_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_029_SGE_done
.Lcmov_slt_sge_029_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_029_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r5; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5117
    push16 r4
    ldi16 r4, 0x523a
    push16 r4
    ldi16 r4, 0x2b2c
    push16 r4
    ldi16 r4, 0x7ca1
    push16 r4
    ldi16 r4, 0x55a3
    push16 r4
    ldi16 r4, 0xdeb3
    push16 r4
    ldi16 r4, 0x57e9
    push16 r4
    ldi16 r4, 0x590c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r5
    push16 r3
    push16 r5
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_02a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02a_EQ_done
.Lcmov_slt_sge_02a_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02a_EQ_done:
    brne8 .Lcmov_slt_sge_02a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02a_NE_done
.Lcmov_slt_sge_02a_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02a_NE_done:
    brult8 .Lcmov_slt_sge_02a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02a_ULT_done
.Lcmov_slt_sge_02a_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02a_ULT_done:
    bruge8 .Lcmov_slt_sge_02a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02a_UGE_done
.Lcmov_slt_sge_02a_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02a_UGE_done:
    brslt8 .Lcmov_slt_sge_02a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02a_SLT_done
.Lcmov_slt_sge_02a_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02a_SLT_done:
    brsge8 .Lcmov_slt_sge_02a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02a_SGE_done
.Lcmov_slt_sge_02a_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02a_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r5; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x514e
    push16 r4
    ldi16 r4, 0x5271
    push16 r4
    ldi16 r4, 0x2b5d
    push16 r4
    ldi16 r4, 0x54b7
    push16 r4
    ldi16 r4, 0x7df5
    push16 r4
    ldi16 r4, 0xdeee
    push16 r4
    ldi16 r4, 0x5820
    push16 r4
    ldi16 r4, 0x5943
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r5
    push16 r4
    push16 r5
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_02b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02b_EQ_done
.Lcmov_slt_sge_02b_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02b_EQ_done:
    brne8 .Lcmov_slt_sge_02b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02b_NE_done
.Lcmov_slt_sge_02b_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02b_NE_done:
    brult8 .Lcmov_slt_sge_02b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02b_ULT_done
.Lcmov_slt_sge_02b_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02b_ULT_done:
    bruge8 .Lcmov_slt_sge_02b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02b_UGE_done
.Lcmov_slt_sge_02b_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02b_UGE_done:
    brslt8 .Lcmov_slt_sge_02b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02b_SLT_done
.Lcmov_slt_sge_02b_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02b_SLT_done:
    brsge8 .Lcmov_slt_sge_02b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02b_SGE_done
.Lcmov_slt_sge_02b_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02b_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r6; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5185
    push16 r4
    ldi16 r4, 0x52a8
    push16 r4
    ldi16 r4, 0x2b8e
    push16 r4
    ldi16 r4, 0x54ee
    push16 r4
    ldi16 r4, 0x5611
    push16 r4
    ldi16 r4, 0x7f49
    push16 r4
    ldi16 r4, 0xe02a
    push16 r4
    ldi16 r4, 0x597a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r6
    push16 r5
    push16 r6
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_02c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02c_EQ_done
.Lcmov_slt_sge_02c_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02c_EQ_done:
    brne8 .Lcmov_slt_sge_02c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02c_NE_done
.Lcmov_slt_sge_02c_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02c_NE_done:
    brult8 .Lcmov_slt_sge_02c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02c_ULT_done
.Lcmov_slt_sge_02c_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02c_ULT_done:
    bruge8 .Lcmov_slt_sge_02c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02c_UGE_done
.Lcmov_slt_sge_02c_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02c_UGE_done:
    brslt8 .Lcmov_slt_sge_02c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02c_SLT_done
.Lcmov_slt_sge_02c_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02c_SLT_done:
    brsge8 .Lcmov_slt_sge_02c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02c_SGE_done
.Lcmov_slt_sge_02c_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02c_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r6; path true; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x51bc
    push16 r4
    ldi16 r4, 0x52df
    push16 r4
    ldi16 r4, 0x2bbf
    push16 r4
    ldi16 r4, 0x5525
    push16 r4
    ldi16 r4, 0x5648
    push16 r4
    ldi16 r4, 0x576b
    push16 r4
    ldi16 r4, 0xe065
    push16 r4
    ldi16 r4, 0x819e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r6
    push16 r7
    push16 r6
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_02d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02d_EQ_done
.Lcmov_slt_sge_02d_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02d_EQ_done:
    brne8 .Lcmov_slt_sge_02d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02d_NE_done
.Lcmov_slt_sge_02d_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02d_NE_done:
    brult8 .Lcmov_slt_sge_02d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02d_ULT_done
.Lcmov_slt_sge_02d_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02d_ULT_done:
    bruge8 .Lcmov_slt_sge_02d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02d_UGE_done
.Lcmov_slt_sge_02d_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02d_UGE_done:
    brslt8 .Lcmov_slt_sge_02d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02d_SLT_done
.Lcmov_slt_sge_02d_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02d_SLT_done:
    brsge8 .Lcmov_slt_sge_02d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02d_SGE_done
.Lcmov_slt_sge_02d_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02d_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r7; path false; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7aea
    push16 r4
    ldi16 r4, 0x5316
    push16 r4
    ldi16 r4, 0x2bf0
    push16 r4
    ldi16 r4, 0x555c
    push16 r4
    ldi16 r4, 0x567f
    push16 r4
    ldi16 r4, 0x57a2
    push16 r4
    ldi16 r4, 0x58c5
    push16 r4
    ldi16 r4, 0xe1a1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r7
    push16 r0
    push16 r7
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_02e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02e_EQ_done
.Lcmov_slt_sge_02e_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02e_EQ_done:
    brne8 .Lcmov_slt_sge_02e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02e_NE_done
.Lcmov_slt_sge_02e_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02e_NE_done:
    brult8 .Lcmov_slt_sge_02e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02e_ULT_done
.Lcmov_slt_sge_02e_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02e_ULT_done:
    bruge8 .Lcmov_slt_sge_02e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02e_UGE_done
.Lcmov_slt_sge_02e_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02e_UGE_done:
    brslt8 .Lcmov_slt_sge_02e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02e_SLT_done
.Lcmov_slt_sge_02e_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02e_SLT_done:
    brsge8 .Lcmov_slt_sge_02e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02e_SGE_done
.Lcmov_slt_sge_02e_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02e_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r2,r7; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7b3d
    push16 r4
    ldi16 r4, 0x534d
    push16 r4
    ldi16 r4, 0x2c21
    push16 r4
    ldi16 r4, 0x5593
    push16 r4
    ldi16 r4, 0x56b6
    push16 r4
    ldi16 r4, 0x57d9
    push16 r4
    ldi16 r4, 0x58fc
    push16 r4
    ldi16 r4, 0xe1dc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r2, r7
    push16 r0
    push16 r7
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_02f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02f_EQ_done
.Lcmov_slt_sge_02f_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02f_EQ_done:
    brne8 .Lcmov_slt_sge_02f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02f_NE_done
.Lcmov_slt_sge_02f_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02f_NE_done:
    brult8 .Lcmov_slt_sge_02f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02f_ULT_done
.Lcmov_slt_sge_02f_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02f_ULT_done:
    bruge8 .Lcmov_slt_sge_02f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02f_UGE_done
.Lcmov_slt_sge_02f_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02f_UGE_done:
    brslt8 .Lcmov_slt_sge_02f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02f_SLT_done
.Lcmov_slt_sge_02f_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02f_SLT_done:
    brsge8 .Lcmov_slt_sge_02f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_02f_SGE_done
.Lcmov_slt_sge_02f_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_02f_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r0; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xdb10
    push16 r4
    ldi16 r4, 0x7c91
    push16 r4
    ldi16 r4, 0x54a7
    push16 r4
    ldi16 r4, 0x2d63
    push16 r4
    ldi16 r4, 0x56ed
    push16 r4
    ldi16 r4, 0x5810
    push16 r4
    ldi16 r4, 0x5933
    push16 r4
    ldi16 r4, 0x5a56
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r0
    push16 r1
    push16 r0
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_030_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_030_EQ_done
.Lcmov_slt_sge_030_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_030_EQ_done:
    brne8 .Lcmov_slt_sge_030_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_030_NE_done
.Lcmov_slt_sge_030_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_030_NE_done:
    brult8 .Lcmov_slt_sge_030_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_030_ULT_done
.Lcmov_slt_sge_030_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_030_ULT_done:
    bruge8 .Lcmov_slt_sge_030_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_030_UGE_done
.Lcmov_slt_sge_030_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_030_UGE_done:
    brslt8 .Lcmov_slt_sge_030_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_030_SLT_done
.Lcmov_slt_sge_030_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_030_SLT_done:
    brsge8 .Lcmov_slt_sge_030_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_030_SGE_done
.Lcmov_slt_sge_030_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_030_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r0; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xdb4b
    push16 r4
    ldi16 r4, 0x53bb
    push16 r4
    ldi16 r4, 0x7de5
    push16 r4
    ldi16 r4, 0x2d94
    push16 r4
    ldi16 r4, 0x5724
    push16 r4
    ldi16 r4, 0x5847
    push16 r4
    ldi16 r4, 0x596a
    push16 r4
    ldi16 r4, 0x5a8d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r0
    push16 r2
    push16 r0
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_031_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_031_EQ_done
.Lcmov_slt_sge_031_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_031_EQ_done:
    brne8 .Lcmov_slt_sge_031_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_031_NE_done
.Lcmov_slt_sge_031_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_031_NE_done:
    brult8 .Lcmov_slt_sge_031_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_031_ULT_done
.Lcmov_slt_sge_031_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_031_ULT_done:
    bruge8 .Lcmov_slt_sge_031_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_031_UGE_done
.Lcmov_slt_sge_031_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_031_UGE_done:
    brslt8 .Lcmov_slt_sge_031_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_031_SLT_done
.Lcmov_slt_sge_031_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_031_SLT_done:
    brsge8 .Lcmov_slt_sge_031_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_031_SGE_done
.Lcmov_slt_sge_031_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_031_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r1; path false; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x52cf
    push16 r4
    ldi16 r4, 0xdc87
    push16 r4
    ldi16 r4, 0x5515
    push16 r4
    ldi16 r4, 0x2dc5
    push16 r4
    ldi16 r4, 0x803a
    push16 r4
    ldi16 r4, 0x587e
    push16 r4
    ldi16 r4, 0x59a1
    push16 r4
    ldi16 r4, 0x5ac4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r1
    push16 r4
    push16 r1
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_032_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_032_EQ_done
.Lcmov_slt_sge_032_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_032_EQ_done:
    brne8 .Lcmov_slt_sge_032_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_032_NE_done
.Lcmov_slt_sge_032_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_032_NE_done:
    brult8 .Lcmov_slt_sge_032_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_032_ULT_done
.Lcmov_slt_sge_032_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_032_ULT_done:
    bruge8 .Lcmov_slt_sge_032_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_032_UGE_done
.Lcmov_slt_sge_032_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_032_UGE_done:
    brslt8 .Lcmov_slt_sge_032_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_032_SLT_done
.Lcmov_slt_sge_032_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_032_SLT_done:
    brsge8 .Lcmov_slt_sge_032_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_032_SGE_done
.Lcmov_slt_sge_032_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_032_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r1; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5306
    push16 r4
    ldi16 r4, 0xdcc2
    push16 r4
    ldi16 r4, 0x554c
    push16 r4
    ldi16 r4, 0x2df6
    push16 r4
    ldi16 r4, 0x808d
    push16 r4
    ldi16 r4, 0x58b5
    push16 r4
    ldi16 r4, 0x59d8
    push16 r4
    ldi16 r4, 0x5afb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r1
    push16 r4
    push16 r1
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_033_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_033_EQ_done
.Lcmov_slt_sge_033_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_033_EQ_done:
    brne8 .Lcmov_slt_sge_033_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_033_NE_done
.Lcmov_slt_sge_033_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_033_NE_done:
    brult8 .Lcmov_slt_sge_033_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_033_ULT_done
.Lcmov_slt_sge_033_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_033_ULT_done:
    bruge8 .Lcmov_slt_sge_033_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_033_UGE_done
.Lcmov_slt_sge_033_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_033_UGE_done:
    brslt8 .Lcmov_slt_sge_033_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_033_SLT_done
.Lcmov_slt_sge_033_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_033_SLT_done:
    brsge8 .Lcmov_slt_sge_033_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_033_SGE_done
.Lcmov_slt_sge_033_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_033_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r2; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x533d
    push16 r4
    ldi16 r4, 0x5460
    push16 r4
    ldi16 r4, 0xddfe
    push16 r4
    ldi16 r4, 0x2e27
    push16 r4
    ldi16 r4, 0x57c9
    push16 r4
    ldi16 r4, 0x81e1
    push16 r4
    ldi16 r4, 0x5a0f
    push16 r4
    ldi16 r4, 0x5b32
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r2
    push16 r5
    push16 r2
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_034_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_034_EQ_done
.Lcmov_slt_sge_034_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_034_EQ_done:
    brne8 .Lcmov_slt_sge_034_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_034_NE_done
.Lcmov_slt_sge_034_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_034_NE_done:
    brult8 .Lcmov_slt_sge_034_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_034_ULT_done
.Lcmov_slt_sge_034_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_034_ULT_done:
    bruge8 .Lcmov_slt_sge_034_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_034_UGE_done
.Lcmov_slt_sge_034_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_034_UGE_done:
    brslt8 .Lcmov_slt_sge_034_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_034_SLT_done
.Lcmov_slt_sge_034_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_034_SLT_done:
    brsge8 .Lcmov_slt_sge_034_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_034_SGE_done
.Lcmov_slt_sge_034_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_034_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r2; path true; guard r6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5374
    push16 r4
    ldi16 r4, 0x5497
    push16 r4
    ldi16 r4, 0xde39
    push16 r4
    ldi16 r4, 0x2e58
    push16 r4
    ldi16 r4, 0x5800
    push16 r4
    ldi16 r4, 0x5923
    push16 r4
    ldi16 r4, 0x8335
    push16 r4
    ldi16 r4, 0x5b69
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r2
    push16 r6
    push16 r2
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_035_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_035_EQ_done
.Lcmov_slt_sge_035_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_035_EQ_done:
    brne8 .Lcmov_slt_sge_035_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_035_NE_done
.Lcmov_slt_sge_035_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_035_NE_done:
    brult8 .Lcmov_slt_sge_035_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_035_ULT_done
.Lcmov_slt_sge_035_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_035_ULT_done:
    bruge8 .Lcmov_slt_sge_035_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_035_UGE_done
.Lcmov_slt_sge_035_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_035_UGE_done:
    brslt8 .Lcmov_slt_sge_035_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_035_SLT_done
.Lcmov_slt_sge_035_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_035_SLT_done:
    brsge8 .Lcmov_slt_sge_035_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_035_SGE_done
.Lcmov_slt_sge_035_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_035_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r3; path false; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x53ab
    push16 r4
    ldi16 r4, 0x54ce
    push16 r4
    ldi16 r4, 0x55f1
    push16 r4
    ldi16 r4, 0x2e89
    push16 r4
    ldi16 r4, 0x5837
    push16 r4
    ldi16 r4, 0x595a
    push16 r4
    ldi16 r4, 0x5a7d
    push16 r4
    ldi16 r4, 0x8489
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r3
    push16 r7
    push16 r3
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_036_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_036_EQ_done
.Lcmov_slt_sge_036_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_036_EQ_done:
    brne8 .Lcmov_slt_sge_036_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_036_NE_done
.Lcmov_slt_sge_036_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_036_NE_done:
    brult8 .Lcmov_slt_sge_036_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_036_ULT_done
.Lcmov_slt_sge_036_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_036_ULT_done:
    bruge8 .Lcmov_slt_sge_036_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_036_UGE_done
.Lcmov_slt_sge_036_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_036_UGE_done:
    brslt8 .Lcmov_slt_sge_036_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_036_SLT_done
.Lcmov_slt_sge_036_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_036_SLT_done:
    brsge8 .Lcmov_slt_sge_036_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_036_SGE_done
.Lcmov_slt_sge_036_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_036_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r3; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7dd5
    push16 r4
    ldi16 r4, 0x5505
    push16 r4
    ldi16 r4, 0x5628
    push16 r4
    ldi16 r4, 0x2eba
    push16 r4
    ldi16 r4, 0x586e
    push16 r4
    ldi16 r4, 0x5991
    push16 r4
    ldi16 r4, 0x5ab4
    push16 r4
    ldi16 r4, 0x5bd7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r3
    push16 r0
    push16 r3
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_037_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_037_EQ_done
.Lcmov_slt_sge_037_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_037_EQ_done:
    brne8 .Lcmov_slt_sge_037_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_037_NE_done
.Lcmov_slt_sge_037_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_037_NE_done:
    brult8 .Lcmov_slt_sge_037_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_037_ULT_done
.Lcmov_slt_sge_037_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_037_ULT_done:
    bruge8 .Lcmov_slt_sge_037_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_037_UGE_done
.Lcmov_slt_sge_037_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_037_UGE_done:
    brslt8 .Lcmov_slt_sge_037_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_037_SLT_done
.Lcmov_slt_sge_037_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_037_SLT_done:
    brsge8 .Lcmov_slt_sge_037_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_037_SGE_done
.Lcmov_slt_sge_037_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_037_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r4; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5419
    push16 r4
    ldi16 r4, 0x7f29
    push16 r4
    ldi16 r4, 0x565f
    push16 r4
    ldi16 r4, 0x2eeb
    push16 r4
    ldi16 r4, 0xe0ec
    push16 r4
    ldi16 r4, 0x59c8
    push16 r4
    ldi16 r4, 0x5aeb
    push16 r4
    ldi16 r4, 0x5c0e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r4
    push16 r1
    push16 r4
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_038_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_038_EQ_done
.Lcmov_slt_sge_038_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_038_EQ_done:
    brne8 .Lcmov_slt_sge_038_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_038_NE_done
.Lcmov_slt_sge_038_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_038_NE_done:
    brult8 .Lcmov_slt_sge_038_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_038_ULT_done
.Lcmov_slt_sge_038_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_038_ULT_done:
    bruge8 .Lcmov_slt_sge_038_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_038_UGE_done
.Lcmov_slt_sge_038_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_038_UGE_done:
    brslt8 .Lcmov_slt_sge_038_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_038_SLT_done
.Lcmov_slt_sge_038_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_038_SLT_done:
    brsge8 .Lcmov_slt_sge_038_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_038_SGE_done
.Lcmov_slt_sge_038_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_038_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r4; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5450
    push16 r4
    ldi16 r4, 0x5573
    push16 r4
    ldi16 r4, 0x807d
    push16 r4
    ldi16 r4, 0x2f1c
    push16 r4
    ldi16 r4, 0xe127
    push16 r4
    ldi16 r4, 0x59ff
    push16 r4
    ldi16 r4, 0x5b22
    push16 r4
    ldi16 r4, 0x5c45
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r4
    push16 r2
    push16 r4
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_039_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_039_EQ_done
.Lcmov_slt_sge_039_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_039_EQ_done:
    brne8 .Lcmov_slt_sge_039_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_039_NE_done
.Lcmov_slt_sge_039_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_039_NE_done:
    brult8 .Lcmov_slt_sge_039_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_039_ULT_done
.Lcmov_slt_sge_039_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_039_ULT_done:
    bruge8 .Lcmov_slt_sge_039_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_039_UGE_done
.Lcmov_slt_sge_039_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_039_UGE_done:
    brslt8 .Lcmov_slt_sge_039_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_039_SLT_done
.Lcmov_slt_sge_039_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_039_SLT_done:
    brsge8 .Lcmov_slt_sge_039_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_039_SGE_done
.Lcmov_slt_sge_039_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_039_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r5; path false; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5487
    push16 r4
    ldi16 r4, 0x55aa
    push16 r4
    ldi16 r4, 0x56cd
    push16 r4
    ldi16 r4, 0x2f4d
    push16 r4
    ldi16 r4, 0x82d2
    push16 r4
    ldi16 r4, 0xe263
    push16 r4
    ldi16 r4, 0x5b59
    push16 r4
    ldi16 r4, 0x5c7c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r5
    push16 r4
    push16 r5
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_03a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03a_EQ_done
.Lcmov_slt_sge_03a_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03a_EQ_done:
    brne8 .Lcmov_slt_sge_03a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03a_NE_done
.Lcmov_slt_sge_03a_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03a_NE_done:
    brult8 .Lcmov_slt_sge_03a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03a_ULT_done
.Lcmov_slt_sge_03a_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03a_ULT_done:
    bruge8 .Lcmov_slt_sge_03a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03a_UGE_done
.Lcmov_slt_sge_03a_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03a_UGE_done:
    brslt8 .Lcmov_slt_sge_03a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03a_SLT_done
.Lcmov_slt_sge_03a_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03a_SLT_done:
    brsge8 .Lcmov_slt_sge_03a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03a_SGE_done
.Lcmov_slt_sge_03a_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03a_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r5; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x54be
    push16 r4
    ldi16 r4, 0x55e1
    push16 r4
    ldi16 r4, 0x5704
    push16 r4
    ldi16 r4, 0x2f7e
    push16 r4
    ldi16 r4, 0x8325
    push16 r4
    ldi16 r4, 0xe29e
    push16 r4
    ldi16 r4, 0x5b90
    push16 r4
    ldi16 r4, 0x5cb3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r5
    push16 r4
    push16 r5
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_03b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03b_EQ_done
.Lcmov_slt_sge_03b_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03b_EQ_done:
    brne8 .Lcmov_slt_sge_03b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03b_NE_done
.Lcmov_slt_sge_03b_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03b_NE_done:
    brult8 .Lcmov_slt_sge_03b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03b_ULT_done
.Lcmov_slt_sge_03b_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03b_ULT_done:
    bruge8 .Lcmov_slt_sge_03b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03b_UGE_done
.Lcmov_slt_sge_03b_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03b_UGE_done:
    brslt8 .Lcmov_slt_sge_03b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03b_SLT_done
.Lcmov_slt_sge_03b_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03b_SLT_done:
    brsge8 .Lcmov_slt_sge_03b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03b_SGE_done
.Lcmov_slt_sge_03b_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03b_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r6; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x54f5
    push16 r4
    ldi16 r4, 0x5618
    push16 r4
    ldi16 r4, 0x573b
    push16 r4
    ldi16 r4, 0x2faf
    push16 r4
    ldi16 r4, 0x5981
    push16 r4
    ldi16 r4, 0x8479
    push16 r4
    ldi16 r4, 0xe3da
    push16 r4
    ldi16 r4, 0x5cea
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r6
    push16 r5
    push16 r6
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_03c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03c_EQ_done
.Lcmov_slt_sge_03c_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03c_EQ_done:
    brne8 .Lcmov_slt_sge_03c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03c_NE_done
.Lcmov_slt_sge_03c_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03c_NE_done:
    brult8 .Lcmov_slt_sge_03c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03c_ULT_done
.Lcmov_slt_sge_03c_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03c_ULT_done:
    bruge8 .Lcmov_slt_sge_03c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03c_UGE_done
.Lcmov_slt_sge_03c_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03c_UGE_done:
    brslt8 .Lcmov_slt_sge_03c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03c_SLT_done
.Lcmov_slt_sge_03c_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03c_SLT_done:
    brsge8 .Lcmov_slt_sge_03c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03c_SGE_done
.Lcmov_slt_sge_03c_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03c_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r6; path true; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x552c
    push16 r4
    ldi16 r4, 0x564f
    push16 r4
    ldi16 r4, 0x5772
    push16 r4
    ldi16 r4, 0x2fe0
    push16 r4
    ldi16 r4, 0x59b8
    push16 r4
    ldi16 r4, 0x5adb
    push16 r4
    ldi16 r4, 0xe415
    push16 r4
    ldi16 r4, 0x86ce
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r6
    push16 r7
    push16 r6
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_03d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03d_EQ_done
.Lcmov_slt_sge_03d_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03d_EQ_done:
    brne8 .Lcmov_slt_sge_03d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03d_NE_done
.Lcmov_slt_sge_03d_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03d_NE_done:
    brult8 .Lcmov_slt_sge_03d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03d_ULT_done
.Lcmov_slt_sge_03d_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03d_ULT_done:
    bruge8 .Lcmov_slt_sge_03d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03d_UGE_done
.Lcmov_slt_sge_03d_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03d_UGE_done:
    brslt8 .Lcmov_slt_sge_03d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03d_SLT_done
.Lcmov_slt_sge_03d_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03d_SLT_done:
    brsge8 .Lcmov_slt_sge_03d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03d_SGE_done
.Lcmov_slt_sge_03d_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03d_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r7; path false; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x801a
    push16 r4
    ldi16 r4, 0x5686
    push16 r4
    ldi16 r4, 0x57a9
    push16 r4
    ldi16 r4, 0x3011
    push16 r4
    ldi16 r4, 0x59ef
    push16 r4
    ldi16 r4, 0x5b12
    push16 r4
    ldi16 r4, 0x5c35
    push16 r4
    ldi16 r4, 0xe551
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r7
    push16 r0
    push16 r7
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_03e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03e_EQ_done
.Lcmov_slt_sge_03e_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03e_EQ_done:
    brne8 .Lcmov_slt_sge_03e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03e_NE_done
.Lcmov_slt_sge_03e_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03e_NE_done:
    brult8 .Lcmov_slt_sge_03e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03e_ULT_done
.Lcmov_slt_sge_03e_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03e_ULT_done:
    bruge8 .Lcmov_slt_sge_03e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03e_UGE_done
.Lcmov_slt_sge_03e_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03e_UGE_done:
    brslt8 .Lcmov_slt_sge_03e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03e_SLT_done
.Lcmov_slt_sge_03e_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03e_SLT_done:
    brsge8 .Lcmov_slt_sge_03e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03e_SGE_done
.Lcmov_slt_sge_03e_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03e_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r3,r7; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x806d
    push16 r4
    ldi16 r4, 0x56bd
    push16 r4
    ldi16 r4, 0x57e0
    push16 r4
    ldi16 r4, 0x3042
    push16 r4
    ldi16 r4, 0x5a26
    push16 r4
    ldi16 r4, 0x5b49
    push16 r4
    ldi16 r4, 0x5c6c
    push16 r4
    ldi16 r4, 0xe58c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r3, r7
    push16 r0
    push16 r7
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_03f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03f_EQ_done
.Lcmov_slt_sge_03f_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03f_EQ_done:
    brne8 .Lcmov_slt_sge_03f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03f_NE_done
.Lcmov_slt_sge_03f_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03f_NE_done:
    brult8 .Lcmov_slt_sge_03f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03f_ULT_done
.Lcmov_slt_sge_03f_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03f_ULT_done:
    bruge8 .Lcmov_slt_sge_03f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03f_UGE_done
.Lcmov_slt_sge_03f_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03f_UGE_done:
    brslt8 .Lcmov_slt_sge_03f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03f_SLT_done
.Lcmov_slt_sge_03f_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03f_SLT_done:
    brsge8 .Lcmov_slt_sge_03f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_03f_SGE_done
.Lcmov_slt_sge_03f_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_03f_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r0; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xdec0
    push16 r4
    ldi16 r4, 0x81c1
    push16 r4
    ldi16 r4, 0x5817
    push16 r4
    ldi16 r4, 0x593a
    push16 r4
    ldi16 r4, 0x3184
    push16 r4
    ldi16 r4, 0x5b80
    push16 r4
    ldi16 r4, 0x5ca3
    push16 r4
    ldi16 r4, 0x5dc6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r0
    push16 r1
    push16 r0
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_040_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_040_EQ_done
.Lcmov_slt_sge_040_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_040_EQ_done:
    brne8 .Lcmov_slt_sge_040_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_040_NE_done
.Lcmov_slt_sge_040_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_040_NE_done:
    brult8 .Lcmov_slt_sge_040_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_040_ULT_done
.Lcmov_slt_sge_040_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_040_ULT_done:
    bruge8 .Lcmov_slt_sge_040_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_040_UGE_done
.Lcmov_slt_sge_040_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_040_UGE_done:
    brslt8 .Lcmov_slt_sge_040_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_040_SLT_done
.Lcmov_slt_sge_040_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_040_SLT_done:
    brsge8 .Lcmov_slt_sge_040_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_040_SGE_done
.Lcmov_slt_sge_040_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_040_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r0; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xdefb
    push16 r4
    ldi16 r4, 0x572b
    push16 r4
    ldi16 r4, 0x8315
    push16 r4
    ldi16 r4, 0x5971
    push16 r4
    ldi16 r4, 0x31b5
    push16 r4
    ldi16 r4, 0x5bb7
    push16 r4
    ldi16 r4, 0x5cda
    push16 r4
    ldi16 r4, 0x5dfd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r0
    push16 r2
    push16 r0
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_041_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_041_EQ_done
.Lcmov_slt_sge_041_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_041_EQ_done:
    brne8 .Lcmov_slt_sge_041_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_041_NE_done
.Lcmov_slt_sge_041_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_041_NE_done:
    brult8 .Lcmov_slt_sge_041_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_041_ULT_done
.Lcmov_slt_sge_041_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_041_ULT_done:
    bruge8 .Lcmov_slt_sge_041_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_041_UGE_done
.Lcmov_slt_sge_041_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_041_UGE_done:
    brslt8 .Lcmov_slt_sge_041_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_041_SLT_done
.Lcmov_slt_sge_041_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_041_SLT_done:
    brsge8 .Lcmov_slt_sge_041_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_041_SGE_done
.Lcmov_slt_sge_041_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_041_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r1; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x563f
    push16 r4
    ldi16 r4, 0xe037
    push16 r4
    ldi16 r4, 0x5885
    push16 r4
    ldi16 r4, 0x8469
    push16 r4
    ldi16 r4, 0x31e6
    push16 r4
    ldi16 r4, 0x5bee
    push16 r4
    ldi16 r4, 0x5d11
    push16 r4
    ldi16 r4, 0x5e34
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r1
    push16 r3
    push16 r1
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_042_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_042_EQ_done
.Lcmov_slt_sge_042_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_042_EQ_done:
    brne8 .Lcmov_slt_sge_042_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_042_NE_done
.Lcmov_slt_sge_042_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_042_NE_done:
    brult8 .Lcmov_slt_sge_042_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_042_ULT_done
.Lcmov_slt_sge_042_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_042_ULT_done:
    bruge8 .Lcmov_slt_sge_042_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_042_UGE_done
.Lcmov_slt_sge_042_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_042_UGE_done:
    brslt8 .Lcmov_slt_sge_042_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_042_SLT_done
.Lcmov_slt_sge_042_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_042_SLT_done:
    brsge8 .Lcmov_slt_sge_042_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_042_SGE_done
.Lcmov_slt_sge_042_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_042_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r1; path true; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5676
    push16 r4
    ldi16 r4, 0xe072
    push16 r4
    ldi16 r4, 0x58bc
    push16 r4
    ldi16 r4, 0x59df
    push16 r4
    ldi16 r4, 0x3217
    push16 r4
    ldi16 r4, 0x86be
    push16 r4
    ldi16 r4, 0x5d48
    push16 r4
    ldi16 r4, 0x5e6b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r1
    push16 r5
    push16 r1
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_043_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_043_EQ_done
.Lcmov_slt_sge_043_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_043_EQ_done:
    brne8 .Lcmov_slt_sge_043_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_043_NE_done
.Lcmov_slt_sge_043_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_043_NE_done:
    brult8 .Lcmov_slt_sge_043_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_043_ULT_done
.Lcmov_slt_sge_043_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_043_ULT_done:
    bruge8 .Lcmov_slt_sge_043_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_043_UGE_done
.Lcmov_slt_sge_043_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_043_UGE_done:
    brslt8 .Lcmov_slt_sge_043_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_043_SLT_done
.Lcmov_slt_sge_043_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_043_SLT_done:
    brsge8 .Lcmov_slt_sge_043_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_043_SGE_done
.Lcmov_slt_sge_043_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_043_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r2; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x56ad
    push16 r4
    ldi16 r4, 0x57d0
    push16 r4
    ldi16 r4, 0xe1ae
    push16 r4
    ldi16 r4, 0x5a16
    push16 r4
    ldi16 r4, 0x3248
    push16 r4
    ldi16 r4, 0x8711
    push16 r4
    ldi16 r4, 0x5d7f
    push16 r4
    ldi16 r4, 0x5ea2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r2
    push16 r5
    push16 r2
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_044_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_044_EQ_done
.Lcmov_slt_sge_044_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_044_EQ_done:
    brne8 .Lcmov_slt_sge_044_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_044_NE_done
.Lcmov_slt_sge_044_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_044_NE_done:
    brult8 .Lcmov_slt_sge_044_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_044_ULT_done
.Lcmov_slt_sge_044_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_044_ULT_done:
    bruge8 .Lcmov_slt_sge_044_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_044_UGE_done
.Lcmov_slt_sge_044_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_044_UGE_done:
    brslt8 .Lcmov_slt_sge_044_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_044_SLT_done
.Lcmov_slt_sge_044_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_044_SLT_done:
    brsge8 .Lcmov_slt_sge_044_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_044_SGE_done
.Lcmov_slt_sge_044_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_044_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r2; path true; guard r6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x56e4
    push16 r4
    ldi16 r4, 0x5807
    push16 r4
    ldi16 r4, 0xe1e9
    push16 r4
    ldi16 r4, 0x5a4d
    push16 r4
    ldi16 r4, 0x3279
    push16 r4
    ldi16 r4, 0x5c93
    push16 r4
    ldi16 r4, 0x8865
    push16 r4
    ldi16 r4, 0x5ed9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r2
    push16 r6
    push16 r2
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_045_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_045_EQ_done
.Lcmov_slt_sge_045_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_045_EQ_done:
    brne8 .Lcmov_slt_sge_045_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_045_NE_done
.Lcmov_slt_sge_045_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_045_NE_done:
    brult8 .Lcmov_slt_sge_045_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_045_ULT_done
.Lcmov_slt_sge_045_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_045_ULT_done:
    bruge8 .Lcmov_slt_sge_045_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_045_UGE_done
.Lcmov_slt_sge_045_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_045_UGE_done:
    brslt8 .Lcmov_slt_sge_045_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_045_SLT_done
.Lcmov_slt_sge_045_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_045_SLT_done:
    brsge8 .Lcmov_slt_sge_045_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_045_SGE_done
.Lcmov_slt_sge_045_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_045_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r3; path false; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x571b
    push16 r4
    ldi16 r4, 0x583e
    push16 r4
    ldi16 r4, 0x5961
    push16 r4
    ldi16 r4, 0xe325
    push16 r4
    ldi16 r4, 0x32aa
    push16 r4
    ldi16 r4, 0x5cca
    push16 r4
    ldi16 r4, 0x5ded
    push16 r4
    ldi16 r4, 0x89b9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r3
    push16 r7
    push16 r3
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_046_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_046_EQ_done
.Lcmov_slt_sge_046_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_046_EQ_done:
    brne8 .Lcmov_slt_sge_046_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_046_NE_done
.Lcmov_slt_sge_046_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_046_NE_done:
    brult8 .Lcmov_slt_sge_046_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_046_ULT_done
.Lcmov_slt_sge_046_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_046_ULT_done:
    bruge8 .Lcmov_slt_sge_046_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_046_UGE_done
.Lcmov_slt_sge_046_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_046_UGE_done:
    brslt8 .Lcmov_slt_sge_046_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_046_SLT_done
.Lcmov_slt_sge_046_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_046_SLT_done:
    brsge8 .Lcmov_slt_sge_046_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_046_SGE_done
.Lcmov_slt_sge_046_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_046_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r3; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8305
    push16 r4
    ldi16 r4, 0x5875
    push16 r4
    ldi16 r4, 0x5998
    push16 r4
    ldi16 r4, 0xe360
    push16 r4
    ldi16 r4, 0x32db
    push16 r4
    ldi16 r4, 0x5d01
    push16 r4
    ldi16 r4, 0x5e24
    push16 r4
    ldi16 r4, 0x5f47
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r3
    push16 r0
    push16 r3
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_047_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_047_EQ_done
.Lcmov_slt_sge_047_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_047_EQ_done:
    brne8 .Lcmov_slt_sge_047_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_047_NE_done
.Lcmov_slt_sge_047_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_047_NE_done:
    brult8 .Lcmov_slt_sge_047_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_047_ULT_done
.Lcmov_slt_sge_047_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_047_ULT_done:
    bruge8 .Lcmov_slt_sge_047_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_047_UGE_done
.Lcmov_slt_sge_047_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_047_UGE_done:
    brslt8 .Lcmov_slt_sge_047_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_047_SLT_done
.Lcmov_slt_sge_047_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_047_SLT_done:
    brsge8 .Lcmov_slt_sge_047_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_047_SGE_done
.Lcmov_slt_sge_047_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_047_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r4; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5789
    push16 r4
    ldi16 r4, 0x8459
    push16 r4
    ldi16 r4, 0x59cf
    push16 r4
    ldi16 r4, 0x5af2
    push16 r4
    ldi16 r4, 0x330c
    push16 r4
    ldi16 r4, 0x5d38
    push16 r4
    ldi16 r4, 0x5e5b
    push16 r4
    ldi16 r4, 0x5f7e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r4
    push16 r1
    push16 r4
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_048_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_048_EQ_done
.Lcmov_slt_sge_048_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_048_EQ_done:
    brne8 .Lcmov_slt_sge_048_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_048_NE_done
.Lcmov_slt_sge_048_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_048_NE_done:
    brult8 .Lcmov_slt_sge_048_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_048_ULT_done
.Lcmov_slt_sge_048_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_048_ULT_done:
    bruge8 .Lcmov_slt_sge_048_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_048_UGE_done
.Lcmov_slt_sge_048_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_048_UGE_done:
    brslt8 .Lcmov_slt_sge_048_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_048_SLT_done
.Lcmov_slt_sge_048_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_048_SLT_done:
    brsge8 .Lcmov_slt_sge_048_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_048_SGE_done
.Lcmov_slt_sge_048_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_048_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r4; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x57c0
    push16 r4
    ldi16 r4, 0x58e3
    push16 r4
    ldi16 r4, 0x85ad
    push16 r4
    ldi16 r4, 0x5b29
    push16 r4
    ldi16 r4, 0x333d
    push16 r4
    ldi16 r4, 0x5d6f
    push16 r4
    ldi16 r4, 0x5e92
    push16 r4
    ldi16 r4, 0x5fb5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r4
    push16 r2
    push16 r4
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_049_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_049_EQ_done
.Lcmov_slt_sge_049_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_049_EQ_done:
    brne8 .Lcmov_slt_sge_049_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_049_NE_done
.Lcmov_slt_sge_049_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_049_NE_done:
    brult8 .Lcmov_slt_sge_049_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_049_ULT_done
.Lcmov_slt_sge_049_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_049_ULT_done:
    bruge8 .Lcmov_slt_sge_049_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_049_UGE_done
.Lcmov_slt_sge_049_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_049_UGE_done:
    brslt8 .Lcmov_slt_sge_049_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_049_SLT_done
.Lcmov_slt_sge_049_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_049_SLT_done:
    brsge8 .Lcmov_slt_sge_049_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_049_SGE_done
.Lcmov_slt_sge_049_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_049_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r5; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x57f7
    push16 r4
    ldi16 r4, 0x591a
    push16 r4
    ldi16 r4, 0x5a3d
    push16 r4
    ldi16 r4, 0x8701
    push16 r4
    ldi16 r4, 0x336e
    push16 r4
    ldi16 r4, 0xe613
    push16 r4
    ldi16 r4, 0x5ec9
    push16 r4
    ldi16 r4, 0x5fec
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r5
    push16 r3
    push16 r5
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_04a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04a_EQ_done
.Lcmov_slt_sge_04a_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04a_EQ_done:
    brne8 .Lcmov_slt_sge_04a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04a_NE_done
.Lcmov_slt_sge_04a_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04a_NE_done:
    brult8 .Lcmov_slt_sge_04a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04a_ULT_done
.Lcmov_slt_sge_04a_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04a_ULT_done:
    bruge8 .Lcmov_slt_sge_04a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04a_UGE_done
.Lcmov_slt_sge_04a_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04a_UGE_done:
    brslt8 .Lcmov_slt_sge_04a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04a_SLT_done
.Lcmov_slt_sge_04a_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04a_SLT_done:
    brsge8 .Lcmov_slt_sge_04a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04a_SGE_done
.Lcmov_slt_sge_04a_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04a_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r5; path true; guard r6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x582e
    push16 r4
    ldi16 r4, 0x5951
    push16 r4
    ldi16 r4, 0x5a74
    push16 r4
    ldi16 r4, 0x5b97
    push16 r4
    ldi16 r4, 0x339f
    push16 r4
    ldi16 r4, 0xe64e
    push16 r4
    ldi16 r4, 0x8a57
    push16 r4
    ldi16 r4, 0x6023
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r5
    push16 r6
    push16 r5
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_04b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04b_EQ_done
.Lcmov_slt_sge_04b_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04b_EQ_done:
    brne8 .Lcmov_slt_sge_04b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04b_NE_done
.Lcmov_slt_sge_04b_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04b_NE_done:
    brult8 .Lcmov_slt_sge_04b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04b_ULT_done
.Lcmov_slt_sge_04b_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04b_ULT_done:
    bruge8 .Lcmov_slt_sge_04b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04b_UGE_done
.Lcmov_slt_sge_04b_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04b_UGE_done:
    brslt8 .Lcmov_slt_sge_04b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04b_SLT_done
.Lcmov_slt_sge_04b_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04b_SLT_done:
    brsge8 .Lcmov_slt_sge_04b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04b_SGE_done
.Lcmov_slt_sge_04b_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04b_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r6; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5865
    push16 r4
    ldi16 r4, 0x5988
    push16 r4
    ldi16 r4, 0x5aab
    push16 r4
    ldi16 r4, 0x5bce
    push16 r4
    ldi16 r4, 0x33d0
    push16 r4
    ldi16 r4, 0x89a9
    push16 r4
    ldi16 r4, 0xe78a
    push16 r4
    ldi16 r4, 0x605a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r6
    push16 r5
    push16 r6
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_04c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04c_EQ_done
.Lcmov_slt_sge_04c_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04c_EQ_done:
    brne8 .Lcmov_slt_sge_04c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04c_NE_done
.Lcmov_slt_sge_04c_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04c_NE_done:
    brult8 .Lcmov_slt_sge_04c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04c_ULT_done
.Lcmov_slt_sge_04c_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04c_ULT_done:
    bruge8 .Lcmov_slt_sge_04c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04c_UGE_done
.Lcmov_slt_sge_04c_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04c_UGE_done:
    brslt8 .Lcmov_slt_sge_04c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04c_SLT_done
.Lcmov_slt_sge_04c_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04c_SLT_done:
    brsge8 .Lcmov_slt_sge_04c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04c_SGE_done
.Lcmov_slt_sge_04c_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04c_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r6; path true; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x589c
    push16 r4
    ldi16 r4, 0x59bf
    push16 r4
    ldi16 r4, 0x5ae2
    push16 r4
    ldi16 r4, 0x5c05
    push16 r4
    ldi16 r4, 0x3401
    push16 r4
    ldi16 r4, 0x5e4b
    push16 r4
    ldi16 r4, 0xe7c5
    push16 r4
    ldi16 r4, 0x8bfe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r6
    push16 r7
    push16 r6
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_04d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04d_EQ_done
.Lcmov_slt_sge_04d_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04d_EQ_done:
    brne8 .Lcmov_slt_sge_04d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04d_NE_done
.Lcmov_slt_sge_04d_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04d_NE_done:
    brult8 .Lcmov_slt_sge_04d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04d_ULT_done
.Lcmov_slt_sge_04d_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04d_ULT_done:
    bruge8 .Lcmov_slt_sge_04d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04d_UGE_done
.Lcmov_slt_sge_04d_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04d_UGE_done:
    brslt8 .Lcmov_slt_sge_04d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04d_SLT_done
.Lcmov_slt_sge_04d_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04d_SLT_done:
    brsge8 .Lcmov_slt_sge_04d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04d_SGE_done
.Lcmov_slt_sge_04d_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04d_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r7; path false; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x854a
    push16 r4
    ldi16 r4, 0x59f6
    push16 r4
    ldi16 r4, 0x5b19
    push16 r4
    ldi16 r4, 0x5c3c
    push16 r4
    ldi16 r4, 0x3432
    push16 r4
    ldi16 r4, 0x5e82
    push16 r4
    ldi16 r4, 0x5fa5
    push16 r4
    ldi16 r4, 0xe901
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r7
    push16 r0
    push16 r7
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_04e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04e_EQ_done
.Lcmov_slt_sge_04e_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04e_EQ_done:
    brne8 .Lcmov_slt_sge_04e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04e_NE_done
.Lcmov_slt_sge_04e_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04e_NE_done:
    brult8 .Lcmov_slt_sge_04e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04e_ULT_done
.Lcmov_slt_sge_04e_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04e_ULT_done:
    bruge8 .Lcmov_slt_sge_04e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04e_UGE_done
.Lcmov_slt_sge_04e_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04e_UGE_done:
    brslt8 .Lcmov_slt_sge_04e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04e_SLT_done
.Lcmov_slt_sge_04e_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04e_SLT_done:
    brsge8 .Lcmov_slt_sge_04e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04e_SGE_done
.Lcmov_slt_sge_04e_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04e_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r4,r7; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x859d
    push16 r4
    ldi16 r4, 0x5a2d
    push16 r4
    ldi16 r4, 0x5b50
    push16 r4
    ldi16 r4, 0x5c73
    push16 r4
    ldi16 r4, 0x3463
    push16 r4
    ldi16 r4, 0x5eb9
    push16 r4
    ldi16 r4, 0x5fdc
    push16 r4
    ldi16 r4, 0xe93c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r4, r7
    push16 r0
    push16 r7
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_04f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04f_EQ_done
.Lcmov_slt_sge_04f_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04f_EQ_done:
    brne8 .Lcmov_slt_sge_04f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04f_NE_done
.Lcmov_slt_sge_04f_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04f_NE_done:
    brult8 .Lcmov_slt_sge_04f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04f_ULT_done
.Lcmov_slt_sge_04f_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04f_ULT_done:
    bruge8 .Lcmov_slt_sge_04f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04f_UGE_done
.Lcmov_slt_sge_04f_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04f_UGE_done:
    brslt8 .Lcmov_slt_sge_04f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04f_SLT_done
.Lcmov_slt_sge_04f_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04f_SLT_done:
    brsge8 .Lcmov_slt_sge_04f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_04f_SGE_done
.Lcmov_slt_sge_04f_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_04f_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r0; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xe270
    push16 r4
    ldi16 r4, 0x86f1
    push16 r4
    ldi16 r4, 0x5b87
    push16 r4
    ldi16 r4, 0x5caa
    push16 r4
    ldi16 r4, 0x5dcd
    push16 r4
    ldi16 r4, 0x35a5
    push16 r4
    ldi16 r4, 0x6013
    push16 r4
    ldi16 r4, 0x6136
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r0
    push16 r1
    push16 r0
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_050_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_050_EQ_done
.Lcmov_slt_sge_050_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_050_EQ_done:
    brne8 .Lcmov_slt_sge_050_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_050_NE_done
.Lcmov_slt_sge_050_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_050_NE_done:
    brult8 .Lcmov_slt_sge_050_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_050_ULT_done
.Lcmov_slt_sge_050_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_050_ULT_done:
    bruge8 .Lcmov_slt_sge_050_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_050_UGE_done
.Lcmov_slt_sge_050_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_050_UGE_done:
    brslt8 .Lcmov_slt_sge_050_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_050_SLT_done
.Lcmov_slt_sge_050_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_050_SLT_done:
    brsge8 .Lcmov_slt_sge_050_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_050_SGE_done
.Lcmov_slt_sge_050_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_050_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r0; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xe2ab
    push16 r4
    ldi16 r4, 0x5a9b
    push16 r4
    ldi16 r4, 0x8845
    push16 r4
    ldi16 r4, 0x5ce1
    push16 r4
    ldi16 r4, 0x5e04
    push16 r4
    ldi16 r4, 0x35d6
    push16 r4
    ldi16 r4, 0x604a
    push16 r4
    ldi16 r4, 0x616d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r0
    push16 r2
    push16 r0
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_051_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_051_EQ_done
.Lcmov_slt_sge_051_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_051_EQ_done:
    brne8 .Lcmov_slt_sge_051_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_051_NE_done
.Lcmov_slt_sge_051_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_051_NE_done:
    brult8 .Lcmov_slt_sge_051_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_051_ULT_done
.Lcmov_slt_sge_051_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_051_ULT_done:
    bruge8 .Lcmov_slt_sge_051_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_051_UGE_done
.Lcmov_slt_sge_051_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_051_UGE_done:
    brslt8 .Lcmov_slt_sge_051_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_051_SLT_done
.Lcmov_slt_sge_051_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_051_SLT_done:
    brsge8 .Lcmov_slt_sge_051_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_051_SGE_done
.Lcmov_slt_sge_051_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_051_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r1; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x59af
    push16 r4
    ldi16 r4, 0xe3e7
    push16 r4
    ldi16 r4, 0x5bf5
    push16 r4
    ldi16 r4, 0x8999
    push16 r4
    ldi16 r4, 0x5e3b
    push16 r4
    ldi16 r4, 0x3607
    push16 r4
    ldi16 r4, 0x6081
    push16 r4
    ldi16 r4, 0x61a4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r1
    push16 r3
    push16 r1
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_052_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_052_EQ_done
.Lcmov_slt_sge_052_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_052_EQ_done:
    brne8 .Lcmov_slt_sge_052_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_052_NE_done
.Lcmov_slt_sge_052_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_052_NE_done:
    brult8 .Lcmov_slt_sge_052_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_052_ULT_done
.Lcmov_slt_sge_052_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_052_ULT_done:
    bruge8 .Lcmov_slt_sge_052_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_052_UGE_done
.Lcmov_slt_sge_052_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_052_UGE_done:
    brslt8 .Lcmov_slt_sge_052_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_052_SLT_done
.Lcmov_slt_sge_052_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_052_SLT_done:
    brsge8 .Lcmov_slt_sge_052_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_052_SGE_done
.Lcmov_slt_sge_052_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_052_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r1; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x59e6
    push16 r4
    ldi16 r4, 0xe422
    push16 r4
    ldi16 r4, 0x5c2c
    push16 r4
    ldi16 r4, 0x5d4f
    push16 r4
    ldi16 r4, 0x8aed
    push16 r4
    ldi16 r4, 0x3638
    push16 r4
    ldi16 r4, 0x60b8
    push16 r4
    ldi16 r4, 0x61db
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r1
    push16 r4
    push16 r1
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_053_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_053_EQ_done
.Lcmov_slt_sge_053_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_053_EQ_done:
    brne8 .Lcmov_slt_sge_053_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_053_NE_done
.Lcmov_slt_sge_053_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_053_NE_done:
    brult8 .Lcmov_slt_sge_053_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_053_ULT_done
.Lcmov_slt_sge_053_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_053_ULT_done:
    bruge8 .Lcmov_slt_sge_053_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_053_UGE_done
.Lcmov_slt_sge_053_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_053_UGE_done:
    brslt8 .Lcmov_slt_sge_053_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_053_SLT_done
.Lcmov_slt_sge_053_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_053_SLT_done:
    brsge8 .Lcmov_slt_sge_053_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_053_SGE_done
.Lcmov_slt_sge_053_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_053_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r2; path false; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5a1d
    push16 r4
    ldi16 r4, 0x5b40
    push16 r4
    ldi16 r4, 0xe55e
    push16 r4
    ldi16 r4, 0x5d86
    push16 r4
    ldi16 r4, 0x5ea9
    push16 r4
    ldi16 r4, 0x3669
    push16 r4
    ldi16 r4, 0x8d42
    push16 r4
    ldi16 r4, 0x6212
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r2
    push16 r6
    push16 r2
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_054_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_054_EQ_done
.Lcmov_slt_sge_054_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_054_EQ_done:
    brne8 .Lcmov_slt_sge_054_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_054_NE_done
.Lcmov_slt_sge_054_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_054_NE_done:
    brult8 .Lcmov_slt_sge_054_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_054_ULT_done
.Lcmov_slt_sge_054_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_054_ULT_done:
    bruge8 .Lcmov_slt_sge_054_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_054_UGE_done
.Lcmov_slt_sge_054_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_054_UGE_done:
    brslt8 .Lcmov_slt_sge_054_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_054_SLT_done
.Lcmov_slt_sge_054_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_054_SLT_done:
    brsge8 .Lcmov_slt_sge_054_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_054_SGE_done
.Lcmov_slt_sge_054_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_054_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r2; path true; guard r6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5a54
    push16 r4
    ldi16 r4, 0x5b77
    push16 r4
    ldi16 r4, 0xe599
    push16 r4
    ldi16 r4, 0x5dbd
    push16 r4
    ldi16 r4, 0x5ee0
    push16 r4
    ldi16 r4, 0x369a
    push16 r4
    ldi16 r4, 0x8d95
    push16 r4
    ldi16 r4, 0x6249
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r2
    push16 r6
    push16 r2
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_055_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_055_EQ_done
.Lcmov_slt_sge_055_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_055_EQ_done:
    brne8 .Lcmov_slt_sge_055_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_055_NE_done
.Lcmov_slt_sge_055_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_055_NE_done:
    brult8 .Lcmov_slt_sge_055_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_055_ULT_done
.Lcmov_slt_sge_055_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_055_ULT_done:
    bruge8 .Lcmov_slt_sge_055_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_055_UGE_done
.Lcmov_slt_sge_055_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_055_UGE_done:
    brslt8 .Lcmov_slt_sge_055_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_055_SLT_done
.Lcmov_slt_sge_055_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_055_SLT_done:
    brsge8 .Lcmov_slt_sge_055_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_055_SGE_done
.Lcmov_slt_sge_055_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_055_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r3; path false; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5a8b
    push16 r4
    ldi16 r4, 0x5bae
    push16 r4
    ldi16 r4, 0x5cd1
    push16 r4
    ldi16 r4, 0xe6d5
    push16 r4
    ldi16 r4, 0x5f17
    push16 r4
    ldi16 r4, 0x36cb
    push16 r4
    ldi16 r4, 0x615d
    push16 r4
    ldi16 r4, 0x8ee9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r3
    push16 r7
    push16 r3
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_056_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_056_EQ_done
.Lcmov_slt_sge_056_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_056_EQ_done:
    brne8 .Lcmov_slt_sge_056_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_056_NE_done
.Lcmov_slt_sge_056_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_056_NE_done:
    brult8 .Lcmov_slt_sge_056_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_056_ULT_done
.Lcmov_slt_sge_056_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_056_ULT_done:
    bruge8 .Lcmov_slt_sge_056_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_056_UGE_done
.Lcmov_slt_sge_056_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_056_UGE_done:
    brslt8 .Lcmov_slt_sge_056_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_056_SLT_done
.Lcmov_slt_sge_056_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_056_SLT_done:
    brsge8 .Lcmov_slt_sge_056_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_056_SGE_done
.Lcmov_slt_sge_056_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_056_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r3; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8835
    push16 r4
    ldi16 r4, 0x5be5
    push16 r4
    ldi16 r4, 0x5d08
    push16 r4
    ldi16 r4, 0xe710
    push16 r4
    ldi16 r4, 0x5f4e
    push16 r4
    ldi16 r4, 0x36fc
    push16 r4
    ldi16 r4, 0x6194
    push16 r4
    ldi16 r4, 0x62b7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r3
    push16 r0
    push16 r3
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_057_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_057_EQ_done
.Lcmov_slt_sge_057_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_057_EQ_done:
    brne8 .Lcmov_slt_sge_057_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_057_NE_done
.Lcmov_slt_sge_057_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_057_NE_done:
    brult8 .Lcmov_slt_sge_057_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_057_ULT_done
.Lcmov_slt_sge_057_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_057_ULT_done:
    bruge8 .Lcmov_slt_sge_057_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_057_UGE_done
.Lcmov_slt_sge_057_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_057_UGE_done:
    brslt8 .Lcmov_slt_sge_057_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_057_SLT_done
.Lcmov_slt_sge_057_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_057_SLT_done:
    brsge8 .Lcmov_slt_sge_057_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_057_SGE_done
.Lcmov_slt_sge_057_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_057_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r4; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5af9
    push16 r4
    ldi16 r4, 0x8989
    push16 r4
    ldi16 r4, 0x5d3f
    push16 r4
    ldi16 r4, 0x5e62
    push16 r4
    ldi16 r4, 0xe84c
    push16 r4
    ldi16 r4, 0x372d
    push16 r4
    ldi16 r4, 0x61cb
    push16 r4
    ldi16 r4, 0x62ee
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r4
    push16 r1
    push16 r4
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_058_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_058_EQ_done
.Lcmov_slt_sge_058_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_058_EQ_done:
    brne8 .Lcmov_slt_sge_058_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_058_NE_done
.Lcmov_slt_sge_058_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_058_NE_done:
    brult8 .Lcmov_slt_sge_058_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_058_ULT_done
.Lcmov_slt_sge_058_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_058_ULT_done:
    bruge8 .Lcmov_slt_sge_058_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_058_UGE_done
.Lcmov_slt_sge_058_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_058_UGE_done:
    brslt8 .Lcmov_slt_sge_058_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_058_SLT_done
.Lcmov_slt_sge_058_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_058_SLT_done:
    brsge8 .Lcmov_slt_sge_058_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_058_SGE_done
.Lcmov_slt_sge_058_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_058_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r4; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5b30
    push16 r4
    ldi16 r4, 0x5c53
    push16 r4
    ldi16 r4, 0x8add
    push16 r4
    ldi16 r4, 0x5e99
    push16 r4
    ldi16 r4, 0xe887
    push16 r4
    ldi16 r4, 0x375e
    push16 r4
    ldi16 r4, 0x6202
    push16 r4
    ldi16 r4, 0x6325
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r4
    push16 r2
    push16 r4
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_059_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_059_EQ_done
.Lcmov_slt_sge_059_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_059_EQ_done:
    brne8 .Lcmov_slt_sge_059_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_059_NE_done
.Lcmov_slt_sge_059_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_059_NE_done:
    brult8 .Lcmov_slt_sge_059_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_059_ULT_done
.Lcmov_slt_sge_059_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_059_ULT_done:
    bruge8 .Lcmov_slt_sge_059_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_059_UGE_done
.Lcmov_slt_sge_059_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_059_UGE_done:
    brslt8 .Lcmov_slt_sge_059_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_059_SLT_done
.Lcmov_slt_sge_059_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_059_SLT_done:
    brsge8 .Lcmov_slt_sge_059_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_059_SGE_done
.Lcmov_slt_sge_059_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_059_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r5; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5b67
    push16 r4
    ldi16 r4, 0x5c8a
    push16 r4
    ldi16 r4, 0x5dad
    push16 r4
    ldi16 r4, 0x8c31
    push16 r4
    ldi16 r4, 0x5ff3
    push16 r4
    ldi16 r4, 0x378f
    push16 r4
    ldi16 r4, 0x6239
    push16 r4
    ldi16 r4, 0x635c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r5
    push16 r3
    push16 r5
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_05a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05a_EQ_done
.Lcmov_slt_sge_05a_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05a_EQ_done:
    brne8 .Lcmov_slt_sge_05a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05a_NE_done
.Lcmov_slt_sge_05a_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05a_NE_done:
    brult8 .Lcmov_slt_sge_05a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05a_ULT_done
.Lcmov_slt_sge_05a_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05a_ULT_done:
    bruge8 .Lcmov_slt_sge_05a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05a_UGE_done
.Lcmov_slt_sge_05a_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05a_UGE_done:
    brslt8 .Lcmov_slt_sge_05a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05a_SLT_done
.Lcmov_slt_sge_05a_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05a_SLT_done:
    brsge8 .Lcmov_slt_sge_05a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05a_SGE_done
.Lcmov_slt_sge_05a_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05a_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r5; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5b9e
    push16 r4
    ldi16 r4, 0x5cc1
    push16 r4
    ldi16 r4, 0x5de4
    push16 r4
    ldi16 r4, 0x5f07
    push16 r4
    ldi16 r4, 0x8d85
    push16 r4
    ldi16 r4, 0x37c0
    push16 r4
    ldi16 r4, 0x6270
    push16 r4
    ldi16 r4, 0x6393
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r5
    push16 r4
    push16 r5
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_05b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05b_EQ_done
.Lcmov_slt_sge_05b_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05b_EQ_done:
    brne8 .Lcmov_slt_sge_05b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05b_NE_done
.Lcmov_slt_sge_05b_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05b_NE_done:
    brult8 .Lcmov_slt_sge_05b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05b_ULT_done
.Lcmov_slt_sge_05b_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05b_ULT_done:
    bruge8 .Lcmov_slt_sge_05b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05b_UGE_done
.Lcmov_slt_sge_05b_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05b_UGE_done:
    brslt8 .Lcmov_slt_sge_05b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05b_SLT_done
.Lcmov_slt_sge_05b_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05b_SLT_done:
    brsge8 .Lcmov_slt_sge_05b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05b_SGE_done
.Lcmov_slt_sge_05b_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05b_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r6; path false; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5bd5
    push16 r4
    ldi16 r4, 0x5cf8
    push16 r4
    ldi16 r4, 0x5e1b
    push16 r4
    ldi16 r4, 0x5f3e
    push16 r4
    ldi16 r4, 0x6061
    push16 r4
    ldi16 r4, 0x37f1
    push16 r4
    ldi16 r4, 0xeb3a
    push16 r4
    ldi16 r4, 0x90db
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r6
    push16 r7
    push16 r6
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_05c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05c_EQ_done
.Lcmov_slt_sge_05c_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05c_EQ_done:
    brne8 .Lcmov_slt_sge_05c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05c_NE_done
.Lcmov_slt_sge_05c_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05c_NE_done:
    brult8 .Lcmov_slt_sge_05c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05c_ULT_done
.Lcmov_slt_sge_05c_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05c_ULT_done:
    bruge8 .Lcmov_slt_sge_05c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05c_UGE_done
.Lcmov_slt_sge_05c_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05c_UGE_done:
    brslt8 .Lcmov_slt_sge_05c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05c_SLT_done
.Lcmov_slt_sge_05c_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05c_SLT_done:
    brsge8 .Lcmov_slt_sge_05c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05c_SGE_done
.Lcmov_slt_sge_05c_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05c_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r6; path true; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5c0c
    push16 r4
    ldi16 r4, 0x5d2f
    push16 r4
    ldi16 r4, 0x5e52
    push16 r4
    ldi16 r4, 0x5f75
    push16 r4
    ldi16 r4, 0x6098
    push16 r4
    ldi16 r4, 0x3822
    push16 r4
    ldi16 r4, 0xeb75
    push16 r4
    ldi16 r4, 0x912e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r6
    push16 r7
    push16 r6
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_05d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05d_EQ_done
.Lcmov_slt_sge_05d_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05d_EQ_done:
    brne8 .Lcmov_slt_sge_05d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05d_NE_done
.Lcmov_slt_sge_05d_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05d_NE_done:
    brult8 .Lcmov_slt_sge_05d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05d_ULT_done
.Lcmov_slt_sge_05d_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05d_ULT_done:
    bruge8 .Lcmov_slt_sge_05d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05d_UGE_done
.Lcmov_slt_sge_05d_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05d_UGE_done:
    brslt8 .Lcmov_slt_sge_05d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05d_SLT_done
.Lcmov_slt_sge_05d_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05d_SLT_done:
    brsge8 .Lcmov_slt_sge_05d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05d_SGE_done
.Lcmov_slt_sge_05d_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05d_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r7; path false; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8a7a
    push16 r4
    ldi16 r4, 0x5d66
    push16 r4
    ldi16 r4, 0x5e89
    push16 r4
    ldi16 r4, 0x5fac
    push16 r4
    ldi16 r4, 0x60cf
    push16 r4
    ldi16 r4, 0x3853
    push16 r4
    ldi16 r4, 0x6315
    push16 r4
    ldi16 r4, 0xecb1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r7
    push16 r0
    push16 r7
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_05e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05e_EQ_done
.Lcmov_slt_sge_05e_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05e_EQ_done:
    brne8 .Lcmov_slt_sge_05e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05e_NE_done
.Lcmov_slt_sge_05e_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05e_NE_done:
    brult8 .Lcmov_slt_sge_05e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05e_ULT_done
.Lcmov_slt_sge_05e_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05e_ULT_done:
    bruge8 .Lcmov_slt_sge_05e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05e_UGE_done
.Lcmov_slt_sge_05e_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05e_UGE_done:
    brslt8 .Lcmov_slt_sge_05e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05e_SLT_done
.Lcmov_slt_sge_05e_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05e_SLT_done:
    brsge8 .Lcmov_slt_sge_05e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05e_SGE_done
.Lcmov_slt_sge_05e_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05e_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r5,r7; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8acd
    push16 r4
    ldi16 r4, 0x5d9d
    push16 r4
    ldi16 r4, 0x5ec0
    push16 r4
    ldi16 r4, 0x5fe3
    push16 r4
    ldi16 r4, 0x6106
    push16 r4
    ldi16 r4, 0x3884
    push16 r4
    ldi16 r4, 0x634c
    push16 r4
    ldi16 r4, 0xecec
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r5, r7
    push16 r0
    push16 r7
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_05f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05f_EQ_done
.Lcmov_slt_sge_05f_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05f_EQ_done:
    brne8 .Lcmov_slt_sge_05f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05f_NE_done
.Lcmov_slt_sge_05f_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05f_NE_done:
    brult8 .Lcmov_slt_sge_05f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05f_ULT_done
.Lcmov_slt_sge_05f_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05f_ULT_done:
    bruge8 .Lcmov_slt_sge_05f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05f_UGE_done
.Lcmov_slt_sge_05f_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05f_UGE_done:
    brslt8 .Lcmov_slt_sge_05f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05f_SLT_done
.Lcmov_slt_sge_05f_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05f_SLT_done:
    brsge8 .Lcmov_slt_sge_05f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_05f_SGE_done
.Lcmov_slt_sge_05f_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_05f_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r0; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xe620
    push16 r4
    ldi16 r4, 0x8c21
    push16 r4
    ldi16 r4, 0x5ef7
    push16 r4
    ldi16 r4, 0x601a
    push16 r4
    ldi16 r4, 0x613d
    push16 r4
    ldi16 r4, 0x6260
    push16 r4
    ldi16 r4, 0x39c6
    push16 r4
    ldi16 r4, 0x64a6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r0
    push16 r1
    push16 r0
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_060_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_060_EQ_done
.Lcmov_slt_sge_060_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_060_EQ_done:
    brne8 .Lcmov_slt_sge_060_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_060_NE_done
.Lcmov_slt_sge_060_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_060_NE_done:
    brult8 .Lcmov_slt_sge_060_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_060_ULT_done
.Lcmov_slt_sge_060_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_060_ULT_done:
    bruge8 .Lcmov_slt_sge_060_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_060_UGE_done
.Lcmov_slt_sge_060_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_060_UGE_done:
    brslt8 .Lcmov_slt_sge_060_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_060_SLT_done
.Lcmov_slt_sge_060_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_060_SLT_done:
    brsge8 .Lcmov_slt_sge_060_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_060_SGE_done
.Lcmov_slt_sge_060_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_060_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r0; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xe65b
    push16 r4
    ldi16 r4, 0x5e0b
    push16 r4
    ldi16 r4, 0x8d75
    push16 r4
    ldi16 r4, 0x6051
    push16 r4
    ldi16 r4, 0x6174
    push16 r4
    ldi16 r4, 0x6297
    push16 r4
    ldi16 r4, 0x39f7
    push16 r4
    ldi16 r4, 0x64dd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r0
    push16 r2
    push16 r0
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_061_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_061_EQ_done
.Lcmov_slt_sge_061_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_061_EQ_done:
    brne8 .Lcmov_slt_sge_061_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_061_NE_done
.Lcmov_slt_sge_061_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_061_NE_done:
    brult8 .Lcmov_slt_sge_061_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_061_ULT_done
.Lcmov_slt_sge_061_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_061_ULT_done:
    bruge8 .Lcmov_slt_sge_061_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_061_UGE_done
.Lcmov_slt_sge_061_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_061_UGE_done:
    brslt8 .Lcmov_slt_sge_061_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_061_SLT_done
.Lcmov_slt_sge_061_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_061_SLT_done:
    brsge8 .Lcmov_slt_sge_061_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_061_SGE_done
.Lcmov_slt_sge_061_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_061_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r1; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5d1f
    push16 r4
    ldi16 r4, 0xe797
    push16 r4
    ldi16 r4, 0x5f65
    push16 r4
    ldi16 r4, 0x8ec9
    push16 r4
    ldi16 r4, 0x61ab
    push16 r4
    ldi16 r4, 0x62ce
    push16 r4
    ldi16 r4, 0x3a28
    push16 r4
    ldi16 r4, 0x6514
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r1
    push16 r3
    push16 r1
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_062_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_062_EQ_done
.Lcmov_slt_sge_062_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_062_EQ_done:
    brne8 .Lcmov_slt_sge_062_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_062_NE_done
.Lcmov_slt_sge_062_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_062_NE_done:
    brult8 .Lcmov_slt_sge_062_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_062_ULT_done
.Lcmov_slt_sge_062_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_062_ULT_done:
    bruge8 .Lcmov_slt_sge_062_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_062_UGE_done
.Lcmov_slt_sge_062_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_062_UGE_done:
    brslt8 .Lcmov_slt_sge_062_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_062_SLT_done
.Lcmov_slt_sge_062_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_062_SLT_done:
    brsge8 .Lcmov_slt_sge_062_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_062_SGE_done
.Lcmov_slt_sge_062_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_062_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r1; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5d56
    push16 r4
    ldi16 r4, 0xe7d2
    push16 r4
    ldi16 r4, 0x5f9c
    push16 r4
    ldi16 r4, 0x60bf
    push16 r4
    ldi16 r4, 0x901d
    push16 r4
    ldi16 r4, 0x6305
    push16 r4
    ldi16 r4, 0x3a59
    push16 r4
    ldi16 r4, 0x654b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r1
    push16 r4
    push16 r1
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_063_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_063_EQ_done
.Lcmov_slt_sge_063_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_063_EQ_done:
    brne8 .Lcmov_slt_sge_063_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_063_NE_done
.Lcmov_slt_sge_063_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_063_NE_done:
    brult8 .Lcmov_slt_sge_063_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_063_ULT_done
.Lcmov_slt_sge_063_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_063_ULT_done:
    bruge8 .Lcmov_slt_sge_063_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_063_UGE_done
.Lcmov_slt_sge_063_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_063_UGE_done:
    brslt8 .Lcmov_slt_sge_063_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_063_SLT_done
.Lcmov_slt_sge_063_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_063_SLT_done:
    brsge8 .Lcmov_slt_sge_063_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_063_SGE_done
.Lcmov_slt_sge_063_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_063_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r2; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5d8d
    push16 r4
    ldi16 r4, 0x5eb0
    push16 r4
    ldi16 r4, 0xe90e
    push16 r4
    ldi16 r4, 0x60f6
    push16 r4
    ldi16 r4, 0x6219
    push16 r4
    ldi16 r4, 0x9171
    push16 r4
    ldi16 r4, 0x3a8a
    push16 r4
    ldi16 r4, 0x6582
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r2
    push16 r5
    push16 r2
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_064_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_064_EQ_done
.Lcmov_slt_sge_064_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_064_EQ_done:
    brne8 .Lcmov_slt_sge_064_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_064_NE_done
.Lcmov_slt_sge_064_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_064_NE_done:
    brult8 .Lcmov_slt_sge_064_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_064_ULT_done
.Lcmov_slt_sge_064_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_064_ULT_done:
    bruge8 .Lcmov_slt_sge_064_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_064_UGE_done
.Lcmov_slt_sge_064_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_064_UGE_done:
    brslt8 .Lcmov_slt_sge_064_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_064_SLT_done
.Lcmov_slt_sge_064_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_064_SLT_done:
    brsge8 .Lcmov_slt_sge_064_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_064_SGE_done
.Lcmov_slt_sge_064_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_064_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r2; path true; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5dc4
    push16 r4
    ldi16 r4, 0x5ee7
    push16 r4
    ldi16 r4, 0xe949
    push16 r4
    ldi16 r4, 0x612d
    push16 r4
    ldi16 r4, 0x6250
    push16 r4
    ldi16 r4, 0x6373
    push16 r4
    ldi16 r4, 0x3abb
    push16 r4
    ldi16 r4, 0x93c6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r2
    push16 r7
    push16 r2
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_065_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_065_EQ_done
.Lcmov_slt_sge_065_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_065_EQ_done:
    brne8 .Lcmov_slt_sge_065_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_065_NE_done
.Lcmov_slt_sge_065_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_065_NE_done:
    brult8 .Lcmov_slt_sge_065_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_065_ULT_done
.Lcmov_slt_sge_065_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_065_ULT_done:
    bruge8 .Lcmov_slt_sge_065_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_065_UGE_done
.Lcmov_slt_sge_065_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_065_UGE_done:
    brslt8 .Lcmov_slt_sge_065_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_065_SLT_done
.Lcmov_slt_sge_065_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_065_SLT_done:
    brsge8 .Lcmov_slt_sge_065_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_065_SGE_done
.Lcmov_slt_sge_065_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_065_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r3; path false; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5dfb
    push16 r4
    ldi16 r4, 0x5f1e
    push16 r4
    ldi16 r4, 0x6041
    push16 r4
    ldi16 r4, 0xea85
    push16 r4
    ldi16 r4, 0x6287
    push16 r4
    ldi16 r4, 0x63aa
    push16 r4
    ldi16 r4, 0x3aec
    push16 r4
    ldi16 r4, 0x9419
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r3
    push16 r7
    push16 r3
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_066_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_066_EQ_done
.Lcmov_slt_sge_066_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_066_EQ_done:
    brne8 .Lcmov_slt_sge_066_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_066_NE_done
.Lcmov_slt_sge_066_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_066_NE_done:
    brult8 .Lcmov_slt_sge_066_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_066_ULT_done
.Lcmov_slt_sge_066_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_066_ULT_done:
    bruge8 .Lcmov_slt_sge_066_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_066_UGE_done
.Lcmov_slt_sge_066_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_066_UGE_done:
    brslt8 .Lcmov_slt_sge_066_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_066_SLT_done
.Lcmov_slt_sge_066_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_066_SLT_done:
    brsge8 .Lcmov_slt_sge_066_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_066_SGE_done
.Lcmov_slt_sge_066_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_066_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r3; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8d65
    push16 r4
    ldi16 r4, 0x5f55
    push16 r4
    ldi16 r4, 0x6078
    push16 r4
    ldi16 r4, 0xeac0
    push16 r4
    ldi16 r4, 0x62be
    push16 r4
    ldi16 r4, 0x63e1
    push16 r4
    ldi16 r4, 0x3b1d
    push16 r4
    ldi16 r4, 0x6627
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r3
    push16 r0
    push16 r3
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_067_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_067_EQ_done
.Lcmov_slt_sge_067_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_067_EQ_done:
    brne8 .Lcmov_slt_sge_067_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_067_NE_done
.Lcmov_slt_sge_067_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_067_NE_done:
    brult8 .Lcmov_slt_sge_067_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_067_ULT_done
.Lcmov_slt_sge_067_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_067_ULT_done:
    bruge8 .Lcmov_slt_sge_067_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_067_UGE_done
.Lcmov_slt_sge_067_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_067_UGE_done:
    brslt8 .Lcmov_slt_sge_067_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_067_SLT_done
.Lcmov_slt_sge_067_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_067_SLT_done:
    brsge8 .Lcmov_slt_sge_067_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_067_SGE_done
.Lcmov_slt_sge_067_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_067_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r4; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5e69
    push16 r4
    ldi16 r4, 0x8eb9
    push16 r4
    ldi16 r4, 0x60af
    push16 r4
    ldi16 r4, 0x61d2
    push16 r4
    ldi16 r4, 0xebfc
    push16 r4
    ldi16 r4, 0x6418
    push16 r4
    ldi16 r4, 0x3b4e
    push16 r4
    ldi16 r4, 0x665e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r4
    push16 r1
    push16 r4
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_068_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_068_EQ_done
.Lcmov_slt_sge_068_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_068_EQ_done:
    brne8 .Lcmov_slt_sge_068_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_068_NE_done
.Lcmov_slt_sge_068_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_068_NE_done:
    brult8 .Lcmov_slt_sge_068_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_068_ULT_done
.Lcmov_slt_sge_068_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_068_ULT_done:
    bruge8 .Lcmov_slt_sge_068_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_068_UGE_done
.Lcmov_slt_sge_068_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_068_UGE_done:
    brslt8 .Lcmov_slt_sge_068_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_068_SLT_done
.Lcmov_slt_sge_068_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_068_SLT_done:
    brsge8 .Lcmov_slt_sge_068_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_068_SGE_done
.Lcmov_slt_sge_068_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_068_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r4; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5ea0
    push16 r4
    ldi16 r4, 0x5fc3
    push16 r4
    ldi16 r4, 0x900d
    push16 r4
    ldi16 r4, 0x6209
    push16 r4
    ldi16 r4, 0xec37
    push16 r4
    ldi16 r4, 0x644f
    push16 r4
    ldi16 r4, 0x3b7f
    push16 r4
    ldi16 r4, 0x6695
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r4
    push16 r2
    push16 r4
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_069_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_069_EQ_done
.Lcmov_slt_sge_069_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_069_EQ_done:
    brne8 .Lcmov_slt_sge_069_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_069_NE_done
.Lcmov_slt_sge_069_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_069_NE_done:
    brult8 .Lcmov_slt_sge_069_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_069_ULT_done
.Lcmov_slt_sge_069_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_069_ULT_done:
    bruge8 .Lcmov_slt_sge_069_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_069_UGE_done
.Lcmov_slt_sge_069_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_069_UGE_done:
    brslt8 .Lcmov_slt_sge_069_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_069_SLT_done
.Lcmov_slt_sge_069_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_069_SLT_done:
    brsge8 .Lcmov_slt_sge_069_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_069_SGE_done
.Lcmov_slt_sge_069_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_069_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r5; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5ed7
    push16 r4
    ldi16 r4, 0x5ffa
    push16 r4
    ldi16 r4, 0x611d
    push16 r4
    ldi16 r4, 0x9161
    push16 r4
    ldi16 r4, 0x6363
    push16 r4
    ldi16 r4, 0xed73
    push16 r4
    ldi16 r4, 0x3bb0
    push16 r4
    ldi16 r4, 0x66cc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r5
    push16 r3
    push16 r5
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_06a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06a_EQ_done
.Lcmov_slt_sge_06a_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06a_EQ_done:
    brne8 .Lcmov_slt_sge_06a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06a_NE_done
.Lcmov_slt_sge_06a_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06a_NE_done:
    brult8 .Lcmov_slt_sge_06a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06a_ULT_done
.Lcmov_slt_sge_06a_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06a_ULT_done:
    bruge8 .Lcmov_slt_sge_06a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06a_UGE_done
.Lcmov_slt_sge_06a_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06a_UGE_done:
    brslt8 .Lcmov_slt_sge_06a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06a_SLT_done
.Lcmov_slt_sge_06a_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06a_SLT_done:
    brsge8 .Lcmov_slt_sge_06a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06a_SGE_done
.Lcmov_slt_sge_06a_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06a_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r5; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5f0e
    push16 r4
    ldi16 r4, 0x6031
    push16 r4
    ldi16 r4, 0x6154
    push16 r4
    ldi16 r4, 0x6277
    push16 r4
    ldi16 r4, 0x92b5
    push16 r4
    ldi16 r4, 0xedae
    push16 r4
    ldi16 r4, 0x3be1
    push16 r4
    ldi16 r4, 0x6703
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r5
    push16 r4
    push16 r5
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_06b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06b_EQ_done
.Lcmov_slt_sge_06b_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06b_EQ_done:
    brne8 .Lcmov_slt_sge_06b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06b_NE_done
.Lcmov_slt_sge_06b_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06b_NE_done:
    brult8 .Lcmov_slt_sge_06b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06b_ULT_done
.Lcmov_slt_sge_06b_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06b_ULT_done:
    bruge8 .Lcmov_slt_sge_06b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06b_UGE_done
.Lcmov_slt_sge_06b_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06b_UGE_done:
    brslt8 .Lcmov_slt_sge_06b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06b_SLT_done
.Lcmov_slt_sge_06b_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06b_SLT_done:
    brsge8 .Lcmov_slt_sge_06b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06b_SGE_done
.Lcmov_slt_sge_06b_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06b_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r6; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5f45
    push16 r4
    ldi16 r4, 0x6068
    push16 r4
    ldi16 r4, 0x618b
    push16 r4
    ldi16 r4, 0x62ae
    push16 r4
    ldi16 r4, 0x63d1
    push16 r4
    ldi16 r4, 0x9409
    push16 r4
    ldi16 r4, 0x3c12
    push16 r4
    ldi16 r4, 0x673a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r6
    push16 r5
    push16 r6
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_06c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06c_EQ_done
.Lcmov_slt_sge_06c_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06c_EQ_done:
    brne8 .Lcmov_slt_sge_06c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06c_NE_done
.Lcmov_slt_sge_06c_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06c_NE_done:
    brult8 .Lcmov_slt_sge_06c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06c_ULT_done
.Lcmov_slt_sge_06c_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06c_ULT_done:
    bruge8 .Lcmov_slt_sge_06c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06c_UGE_done
.Lcmov_slt_sge_06c_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06c_UGE_done:
    brslt8 .Lcmov_slt_sge_06c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06c_SLT_done
.Lcmov_slt_sge_06c_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06c_SLT_done:
    brsge8 .Lcmov_slt_sge_06c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06c_SGE_done
.Lcmov_slt_sge_06c_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06c_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r6; path true; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5f7c
    push16 r4
    ldi16 r4, 0x609f
    push16 r4
    ldi16 r4, 0x61c2
    push16 r4
    ldi16 r4, 0x62e5
    push16 r4
    ldi16 r4, 0x6408
    push16 r4
    ldi16 r4, 0x652b
    push16 r4
    ldi16 r4, 0x3c43
    push16 r4
    ldi16 r4, 0x965e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r6
    push16 r7
    push16 r6
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_06d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06d_EQ_done
.Lcmov_slt_sge_06d_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06d_EQ_done:
    brne8 .Lcmov_slt_sge_06d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06d_NE_done
.Lcmov_slt_sge_06d_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06d_NE_done:
    brult8 .Lcmov_slt_sge_06d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06d_ULT_done
.Lcmov_slt_sge_06d_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06d_ULT_done:
    bruge8 .Lcmov_slt_sge_06d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06d_UGE_done
.Lcmov_slt_sge_06d_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06d_UGE_done:
    brslt8 .Lcmov_slt_sge_06d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06d_SLT_done
.Lcmov_slt_sge_06d_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06d_SLT_done:
    brsge8 .Lcmov_slt_sge_06d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06d_SGE_done
.Lcmov_slt_sge_06d_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06d_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r7; path false; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x8faa
    push16 r4
    ldi16 r4, 0x60d6
    push16 r4
    ldi16 r4, 0x61f9
    push16 r4
    ldi16 r4, 0x631c
    push16 r4
    ldi16 r4, 0x643f
    push16 r4
    ldi16 r4, 0x6562
    push16 r4
    ldi16 r4, 0x3c74
    push16 r4
    ldi16 r4, 0xf061
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r7
    push16 r0
    push16 r7
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_06e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06e_EQ_done
.Lcmov_slt_sge_06e_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06e_EQ_done:
    brne8 .Lcmov_slt_sge_06e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06e_NE_done
.Lcmov_slt_sge_06e_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06e_NE_done:
    brult8 .Lcmov_slt_sge_06e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06e_ULT_done
.Lcmov_slt_sge_06e_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06e_ULT_done:
    bruge8 .Lcmov_slt_sge_06e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06e_UGE_done
.Lcmov_slt_sge_06e_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06e_UGE_done:
    brslt8 .Lcmov_slt_sge_06e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06e_SLT_done
.Lcmov_slt_sge_06e_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06e_SLT_done:
    brsge8 .Lcmov_slt_sge_06e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06e_SGE_done
.Lcmov_slt_sge_06e_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06e_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r6,r7; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x8ffd
    push16 r4
    ldi16 r4, 0x610d
    push16 r4
    ldi16 r4, 0x6230
    push16 r4
    ldi16 r4, 0x6353
    push16 r4
    ldi16 r4, 0x6476
    push16 r4
    ldi16 r4, 0x6599
    push16 r4
    ldi16 r4, 0x3ca5
    push16 r4
    ldi16 r4, 0xf09c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r6, r7
    push16 r0
    push16 r7
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_06f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06f_EQ_done
.Lcmov_slt_sge_06f_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06f_EQ_done:
    brne8 .Lcmov_slt_sge_06f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06f_NE_done
.Lcmov_slt_sge_06f_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06f_NE_done:
    brult8 .Lcmov_slt_sge_06f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06f_ULT_done
.Lcmov_slt_sge_06f_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06f_ULT_done:
    bruge8 .Lcmov_slt_sge_06f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06f_UGE_done
.Lcmov_slt_sge_06f_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06f_UGE_done:
    brslt8 .Lcmov_slt_sge_06f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06f_SLT_done
.Lcmov_slt_sge_06f_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06f_SLT_done:
    brsge8 .Lcmov_slt_sge_06f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_06f_SGE_done
.Lcmov_slt_sge_06f_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_06f_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r0; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xe9d0
    push16 r4
    ldi16 r4, 0x9151
    push16 r4
    ldi16 r4, 0x6267
    push16 r4
    ldi16 r4, 0x638a
    push16 r4
    ldi16 r4, 0x64ad
    push16 r4
    ldi16 r4, 0x65d0
    push16 r4
    ldi16 r4, 0x66f3
    push16 r4
    ldi16 r4, 0x3de7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r0
    push16 r1
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_070_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_070_EQ_done
.Lcmov_slt_sge_070_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_070_EQ_done:
    brne8 .Lcmov_slt_sge_070_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_070_NE_done
.Lcmov_slt_sge_070_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_070_NE_done:
    brult8 .Lcmov_slt_sge_070_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_070_ULT_done
.Lcmov_slt_sge_070_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_070_ULT_done:
    bruge8 .Lcmov_slt_sge_070_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_070_UGE_done
.Lcmov_slt_sge_070_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_070_UGE_done:
    brslt8 .Lcmov_slt_sge_070_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_070_SLT_done
.Lcmov_slt_sge_070_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_070_SLT_done:
    brsge8 .Lcmov_slt_sge_070_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_070_SGE_done
.Lcmov_slt_sge_070_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_070_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r0; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xea0b
    push16 r4
    ldi16 r4, 0x617b
    push16 r4
    ldi16 r4, 0x92a5
    push16 r4
    ldi16 r4, 0x63c1
    push16 r4
    ldi16 r4, 0x64e4
    push16 r4
    ldi16 r4, 0x6607
    push16 r4
    ldi16 r4, 0x672a
    push16 r4
    ldi16 r4, 0x3e18
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r0
    push16 r2
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_071_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_071_EQ_done
.Lcmov_slt_sge_071_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_071_EQ_done:
    brne8 .Lcmov_slt_sge_071_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_071_NE_done
.Lcmov_slt_sge_071_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_071_NE_done:
    brult8 .Lcmov_slt_sge_071_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_071_ULT_done
.Lcmov_slt_sge_071_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_071_ULT_done:
    bruge8 .Lcmov_slt_sge_071_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_071_UGE_done
.Lcmov_slt_sge_071_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_071_UGE_done:
    brslt8 .Lcmov_slt_sge_071_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_071_SLT_done
.Lcmov_slt_sge_071_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_071_SLT_done:
    brsge8 .Lcmov_slt_sge_071_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_071_SGE_done
.Lcmov_slt_sge_071_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_071_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r1; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x608f
    push16 r4
    ldi16 r4, 0xeb47
    push16 r4
    ldi16 r4, 0x62d5
    push16 r4
    ldi16 r4, 0x93f9
    push16 r4
    ldi16 r4, 0x651b
    push16 r4
    ldi16 r4, 0x663e
    push16 r4
    ldi16 r4, 0x6761
    push16 r4
    ldi16 r4, 0x3e49
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r1
    push16 r3
    push16 r1
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_072_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_072_EQ_done
.Lcmov_slt_sge_072_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_072_EQ_done:
    brne8 .Lcmov_slt_sge_072_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_072_NE_done
.Lcmov_slt_sge_072_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_072_NE_done:
    brult8 .Lcmov_slt_sge_072_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_072_ULT_done
.Lcmov_slt_sge_072_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_072_ULT_done:
    bruge8 .Lcmov_slt_sge_072_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_072_UGE_done
.Lcmov_slt_sge_072_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_072_UGE_done:
    brslt8 .Lcmov_slt_sge_072_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_072_SLT_done
.Lcmov_slt_sge_072_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_072_SLT_done:
    brsge8 .Lcmov_slt_sge_072_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_072_SGE_done
.Lcmov_slt_sge_072_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_072_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r1; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x60c6
    push16 r4
    ldi16 r4, 0xeb82
    push16 r4
    ldi16 r4, 0x630c
    push16 r4
    ldi16 r4, 0x642f
    push16 r4
    ldi16 r4, 0x954d
    push16 r4
    ldi16 r4, 0x6675
    push16 r4
    ldi16 r4, 0x6798
    push16 r4
    ldi16 r4, 0x3e7a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r1
    push16 r4
    push16 r1
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_073_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_073_EQ_done
.Lcmov_slt_sge_073_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_073_EQ_done:
    brne8 .Lcmov_slt_sge_073_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_073_NE_done
.Lcmov_slt_sge_073_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_073_NE_done:
    brult8 .Lcmov_slt_sge_073_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_073_ULT_done
.Lcmov_slt_sge_073_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_073_ULT_done:
    bruge8 .Lcmov_slt_sge_073_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_073_UGE_done
.Lcmov_slt_sge_073_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_073_UGE_done:
    brslt8 .Lcmov_slt_sge_073_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_073_SLT_done
.Lcmov_slt_sge_073_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_073_SLT_done:
    brsge8 .Lcmov_slt_sge_073_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_073_SGE_done
.Lcmov_slt_sge_073_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_073_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r2; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x60fd
    push16 r4
    ldi16 r4, 0x6220
    push16 r4
    ldi16 r4, 0xecbe
    push16 r4
    ldi16 r4, 0x6466
    push16 r4
    ldi16 r4, 0x6589
    push16 r4
    ldi16 r4, 0x96a1
    push16 r4
    ldi16 r4, 0x67cf
    push16 r4
    ldi16 r4, 0x3eab
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r2
    push16 r5
    push16 r2
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_074_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_074_EQ_done
.Lcmov_slt_sge_074_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_074_EQ_done:
    brne8 .Lcmov_slt_sge_074_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_074_NE_done
.Lcmov_slt_sge_074_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_074_NE_done:
    brult8 .Lcmov_slt_sge_074_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_074_ULT_done
.Lcmov_slt_sge_074_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_074_ULT_done:
    bruge8 .Lcmov_slt_sge_074_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_074_UGE_done
.Lcmov_slt_sge_074_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_074_UGE_done:
    brslt8 .Lcmov_slt_sge_074_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_074_SLT_done
.Lcmov_slt_sge_074_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_074_SLT_done:
    brsge8 .Lcmov_slt_sge_074_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_074_SGE_done
.Lcmov_slt_sge_074_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_074_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r2; path true; guard r6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6134
    push16 r4
    ldi16 r4, 0x6257
    push16 r4
    ldi16 r4, 0xecf9
    push16 r4
    ldi16 r4, 0x649d
    push16 r4
    ldi16 r4, 0x65c0
    push16 r4
    ldi16 r4, 0x66e3
    push16 r4
    ldi16 r4, 0x97f5
    push16 r4
    ldi16 r4, 0x3edc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r2
    push16 r6
    push16 r2
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_075_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_075_EQ_done
.Lcmov_slt_sge_075_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_075_EQ_done:
    brne8 .Lcmov_slt_sge_075_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_075_NE_done
.Lcmov_slt_sge_075_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_075_NE_done:
    brult8 .Lcmov_slt_sge_075_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_075_ULT_done
.Lcmov_slt_sge_075_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_075_ULT_done:
    bruge8 .Lcmov_slt_sge_075_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_075_UGE_done
.Lcmov_slt_sge_075_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_075_UGE_done:
    brslt8 .Lcmov_slt_sge_075_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_075_SLT_done
.Lcmov_slt_sge_075_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_075_SLT_done:
    brsge8 .Lcmov_slt_sge_075_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_075_SGE_done
.Lcmov_slt_sge_075_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_075_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r3; path false; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x9242
    push16 r4
    ldi16 r4, 0x628e
    push16 r4
    ldi16 r4, 0x63b1
    push16 r4
    ldi16 r4, 0xee35
    push16 r4
    ldi16 r4, 0x65f7
    push16 r4
    ldi16 r4, 0x671a
    push16 r4
    ldi16 r4, 0x683d
    push16 r4
    ldi16 r4, 0x3f0d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r3
    push16 r0
    push16 r3
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_076_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_076_EQ_done
.Lcmov_slt_sge_076_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_076_EQ_done:
    brne8 .Lcmov_slt_sge_076_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_076_NE_done
.Lcmov_slt_sge_076_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_076_NE_done:
    brult8 .Lcmov_slt_sge_076_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_076_ULT_done
.Lcmov_slt_sge_076_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_076_ULT_done:
    bruge8 .Lcmov_slt_sge_076_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_076_UGE_done
.Lcmov_slt_sge_076_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_076_UGE_done:
    brslt8 .Lcmov_slt_sge_076_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_076_SLT_done
.Lcmov_slt_sge_076_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_076_SLT_done:
    brsge8 .Lcmov_slt_sge_076_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_076_SGE_done
.Lcmov_slt_sge_076_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_076_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r3; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x9295
    push16 r4
    ldi16 r4, 0x62c5
    push16 r4
    ldi16 r4, 0x63e8
    push16 r4
    ldi16 r4, 0xee70
    push16 r4
    ldi16 r4, 0x662e
    push16 r4
    ldi16 r4, 0x6751
    push16 r4
    ldi16 r4, 0x6874
    push16 r4
    ldi16 r4, 0x3f3e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r3
    push16 r0
    push16 r3
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_077_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_077_EQ_done
.Lcmov_slt_sge_077_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_077_EQ_done:
    brne8 .Lcmov_slt_sge_077_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_077_NE_done
.Lcmov_slt_sge_077_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_077_NE_done:
    brult8 .Lcmov_slt_sge_077_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_077_ULT_done
.Lcmov_slt_sge_077_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_077_ULT_done:
    bruge8 .Lcmov_slt_sge_077_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_077_UGE_done
.Lcmov_slt_sge_077_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_077_UGE_done:
    brslt8 .Lcmov_slt_sge_077_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_077_SLT_done
.Lcmov_slt_sge_077_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_077_SLT_done:
    brsge8 .Lcmov_slt_sge_077_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_077_SGE_done
.Lcmov_slt_sge_077_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_077_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r4; path false; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x61d9
    push16 r4
    ldi16 r4, 0x93e9
    push16 r4
    ldi16 r4, 0x641f
    push16 r4
    ldi16 r4, 0x6542
    push16 r4
    ldi16 r4, 0xefac
    push16 r4
    ldi16 r4, 0x6788
    push16 r4
    ldi16 r4, 0x68ab
    push16 r4
    ldi16 r4, 0x3f6f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r4
    push16 r1
    push16 r4
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_078_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_078_EQ_done
.Lcmov_slt_sge_078_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_078_EQ_done:
    brne8 .Lcmov_slt_sge_078_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_078_NE_done
.Lcmov_slt_sge_078_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_078_NE_done:
    brult8 .Lcmov_slt_sge_078_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_078_ULT_done
.Lcmov_slt_sge_078_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_078_ULT_done:
    bruge8 .Lcmov_slt_sge_078_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_078_UGE_done
.Lcmov_slt_sge_078_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_078_UGE_done:
    brslt8 .Lcmov_slt_sge_078_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_078_SLT_done
.Lcmov_slt_sge_078_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_078_SLT_done:
    brsge8 .Lcmov_slt_sge_078_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_078_SGE_done
.Lcmov_slt_sge_078_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_078_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r4; path true; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6210
    push16 r4
    ldi16 r4, 0x6333
    push16 r4
    ldi16 r4, 0x953d
    push16 r4
    ldi16 r4, 0x6579
    push16 r4
    ldi16 r4, 0xefe7
    push16 r4
    ldi16 r4, 0x67bf
    push16 r4
    ldi16 r4, 0x68e2
    push16 r4
    ldi16 r4, 0x3fa0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r4
    push16 r2
    push16 r4
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_079_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_079_EQ_done
.Lcmov_slt_sge_079_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_079_EQ_done:
    brne8 .Lcmov_slt_sge_079_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_079_NE_done
.Lcmov_slt_sge_079_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_079_NE_done:
    brult8 .Lcmov_slt_sge_079_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_079_ULT_done
.Lcmov_slt_sge_079_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_079_ULT_done:
    bruge8 .Lcmov_slt_sge_079_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_079_UGE_done
.Lcmov_slt_sge_079_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_079_UGE_done:
    brslt8 .Lcmov_slt_sge_079_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_079_SLT_done
.Lcmov_slt_sge_079_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_079_SLT_done:
    brsge8 .Lcmov_slt_sge_079_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_079_SGE_done
.Lcmov_slt_sge_079_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_079_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r5; path false; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6247
    push16 r4
    ldi16 r4, 0x636a
    push16 r4
    ldi16 r4, 0x648d
    push16 r4
    ldi16 r4, 0x9691
    push16 r4
    ldi16 r4, 0x66d3
    push16 r4
    ldi16 r4, 0xf123
    push16 r4
    ldi16 r4, 0x6919
    push16 r4
    ldi16 r4, 0x3fd1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r5
    push16 r3
    push16 r5
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_07a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07a_EQ_done
.Lcmov_slt_sge_07a_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07a_EQ_done:
    brne8 .Lcmov_slt_sge_07a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07a_NE_done
.Lcmov_slt_sge_07a_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07a_NE_done:
    brult8 .Lcmov_slt_sge_07a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07a_ULT_done
.Lcmov_slt_sge_07a_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07a_ULT_done:
    bruge8 .Lcmov_slt_sge_07a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07a_UGE_done
.Lcmov_slt_sge_07a_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07a_UGE_done:
    brslt8 .Lcmov_slt_sge_07a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07a_SLT_done
.Lcmov_slt_sge_07a_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07a_SLT_done:
    brsge8 .Lcmov_slt_sge_07a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07a_SGE_done
.Lcmov_slt_sge_07a_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07a_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r5; path true; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x627e
    push16 r4
    ldi16 r4, 0x63a1
    push16 r4
    ldi16 r4, 0x64c4
    push16 r4
    ldi16 r4, 0x65e7
    push16 r4
    ldi16 r4, 0x97e5
    push16 r4
    ldi16 r4, 0xf15e
    push16 r4
    ldi16 r4, 0x6950
    push16 r4
    ldi16 r4, 0x4002
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r5
    push16 r4
    push16 r5
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_07b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07b_EQ_done
.Lcmov_slt_sge_07b_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07b_EQ_done:
    brne8 .Lcmov_slt_sge_07b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07b_NE_done
.Lcmov_slt_sge_07b_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07b_NE_done:
    brult8 .Lcmov_slt_sge_07b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07b_ULT_done
.Lcmov_slt_sge_07b_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07b_ULT_done:
    bruge8 .Lcmov_slt_sge_07b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07b_UGE_done
.Lcmov_slt_sge_07b_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07b_UGE_done:
    brslt8 .Lcmov_slt_sge_07b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07b_SLT_done
.Lcmov_slt_sge_07b_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07b_SLT_done:
    brsge8 .Lcmov_slt_sge_07b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07b_SGE_done
.Lcmov_slt_sge_07b_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07b_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r6; path false; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x62b5
    push16 r4
    ldi16 r4, 0x63d8
    push16 r4
    ldi16 r4, 0x64fb
    push16 r4
    ldi16 r4, 0x661e
    push16 r4
    ldi16 r4, 0x6741
    push16 r4
    ldi16 r4, 0x9939
    push16 r4
    ldi16 r4, 0xf29a
    push16 r4
    ldi16 r4, 0x4033
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r6
    push16 r5
    push16 r6
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_07c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07c_EQ_done
.Lcmov_slt_sge_07c_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07c_EQ_done:
    brne8 .Lcmov_slt_sge_07c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07c_NE_done
.Lcmov_slt_sge_07c_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07c_NE_done:
    brult8 .Lcmov_slt_sge_07c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07c_ULT_done
.Lcmov_slt_sge_07c_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07c_ULT_done:
    bruge8 .Lcmov_slt_sge_07c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07c_UGE_done
.Lcmov_slt_sge_07c_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07c_UGE_done:
    brslt8 .Lcmov_slt_sge_07c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07c_SLT_done
.Lcmov_slt_sge_07c_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07c_SLT_done:
    brsge8 .Lcmov_slt_sge_07c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07c_SGE_done
.Lcmov_slt_sge_07c_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07c_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r6; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x9487
    push16 r4
    ldi16 r4, 0x640f
    push16 r4
    ldi16 r4, 0x6532
    push16 r4
    ldi16 r4, 0x6655
    push16 r4
    ldi16 r4, 0x6778
    push16 r4
    ldi16 r4, 0x689b
    push16 r4
    ldi16 r4, 0xf2d5
    push16 r4
    ldi16 r4, 0x4064
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r6
    push16 r0
    push16 r6
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_07d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07d_EQ_done
.Lcmov_slt_sge_07d_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07d_EQ_done:
    brne8 .Lcmov_slt_sge_07d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07d_NE_done
.Lcmov_slt_sge_07d_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07d_NE_done:
    brult8 .Lcmov_slt_sge_07d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07d_ULT_done
.Lcmov_slt_sge_07d_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07d_ULT_done:
    bruge8 .Lcmov_slt_sge_07d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07d_UGE_done
.Lcmov_slt_sge_07d_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07d_UGE_done:
    brslt8 .Lcmov_slt_sge_07d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07d_SLT_done
.Lcmov_slt_sge_07d_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07d_SLT_done:
    brsge8 .Lcmov_slt_sge_07d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07d_SGE_done
.Lcmov_slt_sge_07d_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07d_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r7; path false; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x94da
    push16 r4
    ldi16 r4, 0x6446
    push16 r4
    ldi16 r4, 0x6569
    push16 r4
    ldi16 r4, 0x668c
    push16 r4
    ldi16 r4, 0x67af
    push16 r4
    ldi16 r4, 0x68d2
    push16 r4
    ldi16 r4, 0x69f5
    push16 r4
    ldi16 r4, 0x4095
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r7
    push16 r0
    push16 r7
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_07e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07e_EQ_done
.Lcmov_slt_sge_07e_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07e_EQ_done:
    brne8 .Lcmov_slt_sge_07e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07e_NE_done
.Lcmov_slt_sge_07e_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07e_NE_done:
    brult8 .Lcmov_slt_sge_07e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07e_ULT_done
.Lcmov_slt_sge_07e_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07e_ULT_done:
    bruge8 .Lcmov_slt_sge_07e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07e_UGE_done
.Lcmov_slt_sge_07e_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07e_UGE_done:
    brslt8 .Lcmov_slt_sge_07e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07e_SLT_done
.Lcmov_slt_sge_07e_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07e_SLT_done:
    brsge8 .Lcmov_slt_sge_07e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07e_SGE_done
.Lcmov_slt_sge_07e_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07e_SGE_done:
    cond_emit_char '\n'

    ; cmov.slt r7,r7; path true; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x952d
    push16 r4
    ldi16 r4, 0x647d
    push16 r4
    ldi16 r4, 0x65a0
    push16 r4
    ldi16 r4, 0x66c3
    push16 r4
    ldi16 r4, 0x67e6
    push16 r4
    ldi16 r4, 0x6909
    push16 r4
    ldi16 r4, 0x6a2c
    push16 r4
    ldi16 r4, 0x40c6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.slt r7, r7
    push16 r0
    push16 r7
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_07f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07f_EQ_done
.Lcmov_slt_sge_07f_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07f_EQ_done:
    brne8 .Lcmov_slt_sge_07f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07f_NE_done
.Lcmov_slt_sge_07f_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07f_NE_done:
    brult8 .Lcmov_slt_sge_07f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07f_ULT_done
.Lcmov_slt_sge_07f_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07f_ULT_done:
    bruge8 .Lcmov_slt_sge_07f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07f_UGE_done
.Lcmov_slt_sge_07f_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07f_UGE_done:
    brslt8 .Lcmov_slt_sge_07f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07f_SLT_done
.Lcmov_slt_sge_07f_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07f_SLT_done:
    brsge8 .Lcmov_slt_sge_07f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_07f_SGE_done
.Lcmov_slt_sge_07f_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_07f_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r0; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x3980
    push16 r4
    ldi16 r4, 0x9681
    push16 r4
    ldi16 r4, 0x65d7
    push16 r4
    ldi16 r4, 0x66fa
    push16 r4
    ldi16 r4, 0x681d
    push16 r4
    ldi16 r4, 0x6940
    push16 r4
    ldi16 r4, 0x6a63
    push16 r4
    ldi16 r4, 0x6b86
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r0
    push16 r1
    push16 r0
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_080_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_080_EQ_done
.Lcmov_slt_sge_080_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_080_EQ_done:
    brne8 .Lcmov_slt_sge_080_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_080_NE_done
.Lcmov_slt_sge_080_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_080_NE_done:
    brult8 .Lcmov_slt_sge_080_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_080_ULT_done
.Lcmov_slt_sge_080_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_080_ULT_done:
    bruge8 .Lcmov_slt_sge_080_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_080_UGE_done
.Lcmov_slt_sge_080_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_080_UGE_done:
    brslt8 .Lcmov_slt_sge_080_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_080_SLT_done
.Lcmov_slt_sge_080_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_080_SLT_done:
    brsge8 .Lcmov_slt_sge_080_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_080_SGE_done
.Lcmov_slt_sge_080_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_080_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r0; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x39b1
    push16 r4
    ldi16 r4, 0x64eb
    push16 r4
    ldi16 r4, 0x97d5
    push16 r4
    ldi16 r4, 0x6731
    push16 r4
    ldi16 r4, 0x6854
    push16 r4
    ldi16 r4, 0x6977
    push16 r4
    ldi16 r4, 0x6a9a
    push16 r4
    ldi16 r4, 0x6bbd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r0
    push16 r2
    push16 r0
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_081_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_081_EQ_done
.Lcmov_slt_sge_081_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_081_EQ_done:
    brne8 .Lcmov_slt_sge_081_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_081_NE_done
.Lcmov_slt_sge_081_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_081_NE_done:
    brult8 .Lcmov_slt_sge_081_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_081_ULT_done
.Lcmov_slt_sge_081_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_081_ULT_done:
    bruge8 .Lcmov_slt_sge_081_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_081_UGE_done
.Lcmov_slt_sge_081_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_081_UGE_done:
    brslt8 .Lcmov_slt_sge_081_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_081_SLT_done
.Lcmov_slt_sge_081_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_081_SLT_done:
    brsge8 .Lcmov_slt_sge_081_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_081_SGE_done
.Lcmov_slt_sge_081_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_081_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r1; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x39e2
    push16 r4
    ldi16 r4, 0xeef7
    push16 r4
    ldi16 r4, 0x6645
    push16 r4
    ldi16 r4, 0x9929
    push16 r4
    ldi16 r4, 0x688b
    push16 r4
    ldi16 r4, 0x69ae
    push16 r4
    ldi16 r4, 0x6ad1
    push16 r4
    ldi16 r4, 0x6bf4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r1
    push16 r3
    push16 r1
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_082_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_082_EQ_done
.Lcmov_slt_sge_082_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_082_EQ_done:
    brne8 .Lcmov_slt_sge_082_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_082_NE_done
.Lcmov_slt_sge_082_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_082_NE_done:
    brult8 .Lcmov_slt_sge_082_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_082_ULT_done
.Lcmov_slt_sge_082_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_082_ULT_done:
    bruge8 .Lcmov_slt_sge_082_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_082_UGE_done
.Lcmov_slt_sge_082_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_082_UGE_done:
    brslt8 .Lcmov_slt_sge_082_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_082_SLT_done
.Lcmov_slt_sge_082_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_082_SLT_done:
    brsge8 .Lcmov_slt_sge_082_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_082_SGE_done
.Lcmov_slt_sge_082_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_082_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r1; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3a13
    push16 r4
    ldi16 r4, 0xef32
    push16 r4
    ldi16 r4, 0x667c
    push16 r4
    ldi16 r4, 0x679f
    push16 r4
    ldi16 r4, 0x9a7d
    push16 r4
    ldi16 r4, 0x69e5
    push16 r4
    ldi16 r4, 0x6b08
    push16 r4
    ldi16 r4, 0x6c2b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r1
    push16 r4
    push16 r1
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_083_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_083_EQ_done
.Lcmov_slt_sge_083_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_083_EQ_done:
    brne8 .Lcmov_slt_sge_083_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_083_NE_done
.Lcmov_slt_sge_083_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_083_NE_done:
    brult8 .Lcmov_slt_sge_083_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_083_ULT_done
.Lcmov_slt_sge_083_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_083_ULT_done:
    bruge8 .Lcmov_slt_sge_083_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_083_UGE_done
.Lcmov_slt_sge_083_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_083_UGE_done:
    brslt8 .Lcmov_slt_sge_083_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_083_SLT_done
.Lcmov_slt_sge_083_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_083_SLT_done:
    brsge8 .Lcmov_slt_sge_083_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_083_SGE_done
.Lcmov_slt_sge_083_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_083_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r2; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x3a44
    push16 r4
    ldi16 r4, 0x6590
    push16 r4
    ldi16 r4, 0xf06e
    push16 r4
    ldi16 r4, 0x67d6
    push16 r4
    ldi16 r4, 0x68f9
    push16 r4
    ldi16 r4, 0x9bd1
    push16 r4
    ldi16 r4, 0x6b3f
    push16 r4
    ldi16 r4, 0x6c62
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r2
    push16 r5
    push16 r2
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_084_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_084_EQ_done
.Lcmov_slt_sge_084_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_084_EQ_done:
    brne8 .Lcmov_slt_sge_084_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_084_NE_done
.Lcmov_slt_sge_084_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_084_NE_done:
    brult8 .Lcmov_slt_sge_084_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_084_ULT_done
.Lcmov_slt_sge_084_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_084_ULT_done:
    bruge8 .Lcmov_slt_sge_084_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_084_UGE_done
.Lcmov_slt_sge_084_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_084_UGE_done:
    brslt8 .Lcmov_slt_sge_084_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_084_SLT_done
.Lcmov_slt_sge_084_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_084_SLT_done:
    brsge8 .Lcmov_slt_sge_084_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_084_SGE_done
.Lcmov_slt_sge_084_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_084_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r2; path true; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3a75
    push16 r4
    ldi16 r4, 0x65c7
    push16 r4
    ldi16 r4, 0xf0a9
    push16 r4
    ldi16 r4, 0x680d
    push16 r4
    ldi16 r4, 0x6930
    push16 r4
    ldi16 r4, 0x6a53
    push16 r4
    ldi16 r4, 0x9d25
    push16 r4
    ldi16 r4, 0x6c99
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r2
    push16 r6
    push16 r2
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_085_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_085_EQ_done
.Lcmov_slt_sge_085_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_085_EQ_done:
    brne8 .Lcmov_slt_sge_085_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_085_NE_done
.Lcmov_slt_sge_085_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_085_NE_done:
    brult8 .Lcmov_slt_sge_085_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_085_ULT_done
.Lcmov_slt_sge_085_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_085_ULT_done:
    bruge8 .Lcmov_slt_sge_085_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_085_UGE_done
.Lcmov_slt_sge_085_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_085_UGE_done:
    brslt8 .Lcmov_slt_sge_085_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_085_SLT_done
.Lcmov_slt_sge_085_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_085_SLT_done:
    brsge8 .Lcmov_slt_sge_085_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_085_SGE_done
.Lcmov_slt_sge_085_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_085_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r3; path false; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x3aa6
    push16 r4
    ldi16 r4, 0x65fe
    push16 r4
    ldi16 r4, 0x6721
    push16 r4
    ldi16 r4, 0xf1e5
    push16 r4
    ldi16 r4, 0x6967
    push16 r4
    ldi16 r4, 0x6a8a
    push16 r4
    ldi16 r4, 0x6bad
    push16 r4
    ldi16 r4, 0x9e79
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r3
    push16 r7
    push16 r3
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_086_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_086_EQ_done
.Lcmov_slt_sge_086_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_086_EQ_done:
    brne8 .Lcmov_slt_sge_086_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_086_NE_done
.Lcmov_slt_sge_086_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_086_NE_done:
    brult8 .Lcmov_slt_sge_086_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_086_ULT_done
.Lcmov_slt_sge_086_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_086_ULT_done:
    bruge8 .Lcmov_slt_sge_086_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_086_UGE_done
.Lcmov_slt_sge_086_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_086_UGE_done:
    brslt8 .Lcmov_slt_sge_086_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_086_SLT_done
.Lcmov_slt_sge_086_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_086_SLT_done:
    brsge8 .Lcmov_slt_sge_086_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_086_SGE_done
.Lcmov_slt_sge_086_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_086_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r3; path true; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3ad7
    push16 r4
    ldi16 r4, 0x98c6
    push16 r4
    ldi16 r4, 0x6758
    push16 r4
    ldi16 r4, 0xf220
    push16 r4
    ldi16 r4, 0x699e
    push16 r4
    ldi16 r4, 0x6ac1
    push16 r4
    ldi16 r4, 0x6be4
    push16 r4
    ldi16 r4, 0x6d07
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r3
    push16 r1
    push16 r3
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_087_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_087_EQ_done
.Lcmov_slt_sge_087_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_087_EQ_done:
    brne8 .Lcmov_slt_sge_087_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_087_NE_done
.Lcmov_slt_sge_087_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_087_NE_done:
    brult8 .Lcmov_slt_sge_087_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_087_ULT_done
.Lcmov_slt_sge_087_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_087_ULT_done:
    bruge8 .Lcmov_slt_sge_087_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_087_UGE_done
.Lcmov_slt_sge_087_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_087_UGE_done:
    brslt8 .Lcmov_slt_sge_087_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_087_SLT_done
.Lcmov_slt_sge_087_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_087_SLT_done:
    brsge8 .Lcmov_slt_sge_087_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_087_SGE_done
.Lcmov_slt_sge_087_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_087_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r4; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x3b08
    push16 r4
    ldi16 r4, 0x9919
    push16 r4
    ldi16 r4, 0x678f
    push16 r4
    ldi16 r4, 0x68b2
    push16 r4
    ldi16 r4, 0xf35c
    push16 r4
    ldi16 r4, 0x6af8
    push16 r4
    ldi16 r4, 0x6c1b
    push16 r4
    ldi16 r4, 0x6d3e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r4
    push16 r1
    push16 r4
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_088_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_088_EQ_done
.Lcmov_slt_sge_088_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_088_EQ_done:
    brne8 .Lcmov_slt_sge_088_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_088_NE_done
.Lcmov_slt_sge_088_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_088_NE_done:
    brult8 .Lcmov_slt_sge_088_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_088_ULT_done
.Lcmov_slt_sge_088_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_088_ULT_done:
    bruge8 .Lcmov_slt_sge_088_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_088_UGE_done
.Lcmov_slt_sge_088_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_088_UGE_done:
    brslt8 .Lcmov_slt_sge_088_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_088_SLT_done
.Lcmov_slt_sge_088_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_088_SLT_done:
    brsge8 .Lcmov_slt_sge_088_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_088_SGE_done
.Lcmov_slt_sge_088_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_088_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r4; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3b39
    push16 r4
    ldi16 r4, 0x66a3
    push16 r4
    ldi16 r4, 0x9a6d
    push16 r4
    ldi16 r4, 0x68e9
    push16 r4
    ldi16 r4, 0xf397
    push16 r4
    ldi16 r4, 0x6b2f
    push16 r4
    ldi16 r4, 0x6c52
    push16 r4
    ldi16 r4, 0x6d75
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r4
    push16 r2
    push16 r4
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_089_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_089_EQ_done
.Lcmov_slt_sge_089_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_089_EQ_done:
    brne8 .Lcmov_slt_sge_089_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_089_NE_done
.Lcmov_slt_sge_089_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_089_NE_done:
    brult8 .Lcmov_slt_sge_089_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_089_ULT_done
.Lcmov_slt_sge_089_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_089_ULT_done:
    bruge8 .Lcmov_slt_sge_089_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_089_UGE_done
.Lcmov_slt_sge_089_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_089_UGE_done:
    brslt8 .Lcmov_slt_sge_089_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_089_SLT_done
.Lcmov_slt_sge_089_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_089_SLT_done:
    brsge8 .Lcmov_slt_sge_089_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_089_SGE_done
.Lcmov_slt_sge_089_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_089_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r5; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x3b6a
    push16 r4
    ldi16 r4, 0x66da
    push16 r4
    ldi16 r4, 0x67fd
    push16 r4
    ldi16 r4, 0x9bc1
    push16 r4
    ldi16 r4, 0x6a43
    push16 r4
    ldi16 r4, 0xf4d3
    push16 r4
    ldi16 r4, 0x6c89
    push16 r4
    ldi16 r4, 0x6dac
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r5
    push16 r3
    push16 r5
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_08a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08a_EQ_done
.Lcmov_slt_sge_08a_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08a_EQ_done:
    brne8 .Lcmov_slt_sge_08a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08a_NE_done
.Lcmov_slt_sge_08a_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08a_NE_done:
    brult8 .Lcmov_slt_sge_08a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08a_ULT_done
.Lcmov_slt_sge_08a_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08a_ULT_done:
    bruge8 .Lcmov_slt_sge_08a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08a_UGE_done
.Lcmov_slt_sge_08a_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08a_UGE_done:
    brslt8 .Lcmov_slt_sge_08a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08a_SLT_done
.Lcmov_slt_sge_08a_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08a_SLT_done:
    brsge8 .Lcmov_slt_sge_08a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08a_SGE_done
.Lcmov_slt_sge_08a_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08a_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r5; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3b9b
    push16 r4
    ldi16 r4, 0x6711
    push16 r4
    ldi16 r4, 0x6834
    push16 r4
    ldi16 r4, 0x6957
    push16 r4
    ldi16 r4, 0x9d15
    push16 r4
    ldi16 r4, 0xf50e
    push16 r4
    ldi16 r4, 0x6cc0
    push16 r4
    ldi16 r4, 0x6de3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r5
    push16 r4
    push16 r5
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_08b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08b_EQ_done
.Lcmov_slt_sge_08b_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08b_EQ_done:
    brne8 .Lcmov_slt_sge_08b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08b_NE_done
.Lcmov_slt_sge_08b_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08b_NE_done:
    brult8 .Lcmov_slt_sge_08b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08b_ULT_done
.Lcmov_slt_sge_08b_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08b_ULT_done:
    bruge8 .Lcmov_slt_sge_08b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08b_UGE_done
.Lcmov_slt_sge_08b_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08b_UGE_done:
    brslt8 .Lcmov_slt_sge_08b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08b_SLT_done
.Lcmov_slt_sge_08b_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08b_SLT_done:
    brsge8 .Lcmov_slt_sge_08b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08b_SGE_done
.Lcmov_slt_sge_08b_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08b_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r6; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x3bcc
    push16 r4
    ldi16 r4, 0x6748
    push16 r4
    ldi16 r4, 0x686b
    push16 r4
    ldi16 r4, 0x698e
    push16 r4
    ldi16 r4, 0x6ab1
    push16 r4
    ldi16 r4, 0x9e69
    push16 r4
    ldi16 r4, 0xf64a
    push16 r4
    ldi16 r4, 0x6e1a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r6
    push16 r5
    push16 r6
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_08c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08c_EQ_done
.Lcmov_slt_sge_08c_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08c_EQ_done:
    brne8 .Lcmov_slt_sge_08c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08c_NE_done
.Lcmov_slt_sge_08c_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08c_NE_done:
    brult8 .Lcmov_slt_sge_08c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08c_ULT_done
.Lcmov_slt_sge_08c_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08c_ULT_done:
    bruge8 .Lcmov_slt_sge_08c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08c_UGE_done
.Lcmov_slt_sge_08c_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08c_UGE_done:
    brslt8 .Lcmov_slt_sge_08c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08c_SLT_done
.Lcmov_slt_sge_08c_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08c_SLT_done:
    brsge8 .Lcmov_slt_sge_08c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08c_SGE_done
.Lcmov_slt_sge_08c_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08c_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r6; path true; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3bfd
    push16 r4
    ldi16 r4, 0x677f
    push16 r4
    ldi16 r4, 0x68a2
    push16 r4
    ldi16 r4, 0x69c5
    push16 r4
    ldi16 r4, 0x6ae8
    push16 r4
    ldi16 r4, 0x6c0b
    push16 r4
    ldi16 r4, 0xf685
    push16 r4
    ldi16 r4, 0xa0be
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r6
    push16 r7
    push16 r6
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_08d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08d_EQ_done
.Lcmov_slt_sge_08d_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08d_EQ_done:
    brne8 .Lcmov_slt_sge_08d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08d_NE_done
.Lcmov_slt_sge_08d_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08d_NE_done:
    brult8 .Lcmov_slt_sge_08d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08d_ULT_done
.Lcmov_slt_sge_08d_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08d_ULT_done:
    bruge8 .Lcmov_slt_sge_08d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08d_UGE_done
.Lcmov_slt_sge_08d_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08d_UGE_done:
    brslt8 .Lcmov_slt_sge_08d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08d_SLT_done
.Lcmov_slt_sge_08d_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08d_SLT_done:
    brsge8 .Lcmov_slt_sge_08d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08d_SGE_done
.Lcmov_slt_sge_08d_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08d_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r7; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x3c2e
    push16 r4
    ldi16 r4, 0x9b0b
    push16 r4
    ldi16 r4, 0x68d9
    push16 r4
    ldi16 r4, 0x69fc
    push16 r4
    ldi16 r4, 0x6b1f
    push16 r4
    ldi16 r4, 0x6c42
    push16 r4
    ldi16 r4, 0x6d65
    push16 r4
    ldi16 r4, 0xf7c1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r7
    push16 r1
    push16 r7
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_08e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08e_EQ_done
.Lcmov_slt_sge_08e_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08e_EQ_done:
    brne8 .Lcmov_slt_sge_08e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08e_NE_done
.Lcmov_slt_sge_08e_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08e_NE_done:
    brult8 .Lcmov_slt_sge_08e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08e_ULT_done
.Lcmov_slt_sge_08e_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08e_ULT_done:
    bruge8 .Lcmov_slt_sge_08e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08e_UGE_done
.Lcmov_slt_sge_08e_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08e_UGE_done:
    brslt8 .Lcmov_slt_sge_08e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08e_SLT_done
.Lcmov_slt_sge_08e_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08e_SLT_done:
    brsge8 .Lcmov_slt_sge_08e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08e_SGE_done
.Lcmov_slt_sge_08e_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08e_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r0,r7; path true; guard r1.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3c5f
    push16 r4
    ldi16 r4, 0x9b5e
    push16 r4
    ldi16 r4, 0x6910
    push16 r4
    ldi16 r4, 0x6a33
    push16 r4
    ldi16 r4, 0x6b56
    push16 r4
    ldi16 r4, 0x6c79
    push16 r4
    ldi16 r4, 0x6d9c
    push16 r4
    ldi16 r4, 0xf7fc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r0, r7
    push16 r1
    push16 r7
    push16 r0
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_08f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08f_EQ_done
.Lcmov_slt_sge_08f_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08f_EQ_done:
    brne8 .Lcmov_slt_sge_08f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08f_NE_done
.Lcmov_slt_sge_08f_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08f_NE_done:
    brult8 .Lcmov_slt_sge_08f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08f_ULT_done
.Lcmov_slt_sge_08f_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08f_ULT_done:
    bruge8 .Lcmov_slt_sge_08f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08f_UGE_done
.Lcmov_slt_sge_08f_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08f_UGE_done:
    brslt8 .Lcmov_slt_sge_08f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08f_SLT_done
.Lcmov_slt_sge_08f_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08f_SLT_done:
    brsge8 .Lcmov_slt_sge_08f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_08f_SGE_done
.Lcmov_slt_sge_08f_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_08f_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r0; path false; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xf130
    push16 r4
    ldi16 r4, 0x3da1
    push16 r4
    ldi16 r4, 0x9cb2
    push16 r4
    ldi16 r4, 0x6a6a
    push16 r4
    ldi16 r4, 0x6b8d
    push16 r4
    ldi16 r4, 0x6cb0
    push16 r4
    ldi16 r4, 0x6dd3
    push16 r4
    ldi16 r4, 0x6ef6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r0
    push16 r2
    push16 r0
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_090_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_090_EQ_done
.Lcmov_slt_sge_090_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_090_EQ_done:
    brne8 .Lcmov_slt_sge_090_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_090_NE_done
.Lcmov_slt_sge_090_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_090_NE_done:
    brult8 .Lcmov_slt_sge_090_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_090_ULT_done
.Lcmov_slt_sge_090_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_090_ULT_done:
    bruge8 .Lcmov_slt_sge_090_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_090_UGE_done
.Lcmov_slt_sge_090_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_090_UGE_done:
    brslt8 .Lcmov_slt_sge_090_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_090_SLT_done
.Lcmov_slt_sge_090_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_090_SLT_done:
    brsge8 .Lcmov_slt_sge_090_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_090_SGE_done
.Lcmov_slt_sge_090_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_090_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r0; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xf16b
    push16 r4
    ldi16 r4, 0x3dd2
    push16 r4
    ldi16 r4, 0x9d05
    push16 r4
    ldi16 r4, 0x6aa1
    push16 r4
    ldi16 r4, 0x6bc4
    push16 r4
    ldi16 r4, 0x6ce7
    push16 r4
    ldi16 r4, 0x6e0a
    push16 r4
    ldi16 r4, 0x6f2d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r0
    push16 r2
    push16 r0
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_091_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_091_EQ_done
.Lcmov_slt_sge_091_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_091_EQ_done:
    brne8 .Lcmov_slt_sge_091_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_091_NE_done
.Lcmov_slt_sge_091_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_091_NE_done:
    brult8 .Lcmov_slt_sge_091_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_091_ULT_done
.Lcmov_slt_sge_091_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_091_ULT_done:
    bruge8 .Lcmov_slt_sge_091_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_091_UGE_done
.Lcmov_slt_sge_091_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_091_UGE_done:
    brslt8 .Lcmov_slt_sge_091_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_091_SLT_done
.Lcmov_slt_sge_091_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_091_SLT_done:
    brsge8 .Lcmov_slt_sge_091_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_091_SGE_done
.Lcmov_slt_sge_091_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_091_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r1; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x676f
    push16 r4
    ldi16 r4, 0x3e03
    push16 r4
    ldi16 r4, 0x69b5
    push16 r4
    ldi16 r4, 0x9e59
    push16 r4
    ldi16 r4, 0x6bfb
    push16 r4
    ldi16 r4, 0x6d1e
    push16 r4
    ldi16 r4, 0x6e41
    push16 r4
    ldi16 r4, 0x6f64
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r1
    push16 r3
    push16 r1
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_092_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_092_EQ_done
.Lcmov_slt_sge_092_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_092_EQ_done:
    brne8 .Lcmov_slt_sge_092_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_092_NE_done
.Lcmov_slt_sge_092_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_092_NE_done:
    brult8 .Lcmov_slt_sge_092_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_092_ULT_done
.Lcmov_slt_sge_092_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_092_ULT_done:
    bruge8 .Lcmov_slt_sge_092_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_092_UGE_done
.Lcmov_slt_sge_092_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_092_UGE_done:
    brslt8 .Lcmov_slt_sge_092_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_092_SLT_done
.Lcmov_slt_sge_092_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_092_SLT_done:
    brsge8 .Lcmov_slt_sge_092_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_092_SGE_done
.Lcmov_slt_sge_092_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_092_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r1; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x67a6
    push16 r4
    ldi16 r4, 0x3e34
    push16 r4
    ldi16 r4, 0x69ec
    push16 r4
    ldi16 r4, 0x6b0f
    push16 r4
    ldi16 r4, 0x9fad
    push16 r4
    ldi16 r4, 0x6d55
    push16 r4
    ldi16 r4, 0x6e78
    push16 r4
    ldi16 r4, 0x6f9b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r1
    push16 r4
    push16 r1
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_093_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_093_EQ_done
.Lcmov_slt_sge_093_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_093_EQ_done:
    brne8 .Lcmov_slt_sge_093_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_093_NE_done
.Lcmov_slt_sge_093_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_093_NE_done:
    brult8 .Lcmov_slt_sge_093_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_093_ULT_done
.Lcmov_slt_sge_093_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_093_ULT_done:
    bruge8 .Lcmov_slt_sge_093_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_093_UGE_done
.Lcmov_slt_sge_093_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_093_UGE_done:
    brslt8 .Lcmov_slt_sge_093_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_093_SLT_done
.Lcmov_slt_sge_093_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_093_SLT_done:
    brsge8 .Lcmov_slt_sge_093_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_093_SGE_done
.Lcmov_slt_sge_093_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_093_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r2; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x67dd
    push16 r4
    ldi16 r4, 0x3e65
    push16 r4
    ldi16 r4, 0xf41e
    push16 r4
    ldi16 r4, 0x6b46
    push16 r4
    ldi16 r4, 0x6c69
    push16 r4
    ldi16 r4, 0xa101
    push16 r4
    ldi16 r4, 0x6eaf
    push16 r4
    ldi16 r4, 0x6fd2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r2
    push16 r5
    push16 r2
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_094_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_094_EQ_done
.Lcmov_slt_sge_094_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_094_EQ_done:
    brne8 .Lcmov_slt_sge_094_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_094_NE_done
.Lcmov_slt_sge_094_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_094_NE_done:
    brult8 .Lcmov_slt_sge_094_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_094_ULT_done
.Lcmov_slt_sge_094_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_094_ULT_done:
    bruge8 .Lcmov_slt_sge_094_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_094_UGE_done
.Lcmov_slt_sge_094_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_094_UGE_done:
    brslt8 .Lcmov_slt_sge_094_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_094_SLT_done
.Lcmov_slt_sge_094_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_094_SLT_done:
    brsge8 .Lcmov_slt_sge_094_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_094_SGE_done
.Lcmov_slt_sge_094_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_094_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r2; path true; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6814
    push16 r4
    ldi16 r4, 0x3e96
    push16 r4
    ldi16 r4, 0xf459
    push16 r4
    ldi16 r4, 0x6b7d
    push16 r4
    ldi16 r4, 0x6ca0
    push16 r4
    ldi16 r4, 0x6dc3
    push16 r4
    ldi16 r4, 0xa255
    push16 r4
    ldi16 r4, 0x7009
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r2
    push16 r6
    push16 r2
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_095_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_095_EQ_done
.Lcmov_slt_sge_095_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_095_EQ_done:
    brne8 .Lcmov_slt_sge_095_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_095_NE_done
.Lcmov_slt_sge_095_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_095_NE_done:
    brult8 .Lcmov_slt_sge_095_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_095_ULT_done
.Lcmov_slt_sge_095_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_095_ULT_done:
    bruge8 .Lcmov_slt_sge_095_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_095_UGE_done
.Lcmov_slt_sge_095_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_095_UGE_done:
    brslt8 .Lcmov_slt_sge_095_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_095_SLT_done
.Lcmov_slt_sge_095_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_095_SLT_done:
    brsge8 .Lcmov_slt_sge_095_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_095_SGE_done
.Lcmov_slt_sge_095_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_095_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r3; path false; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x684b
    push16 r4
    ldi16 r4, 0x3ec7
    push16 r4
    ldi16 r4, 0x6a91
    push16 r4
    ldi16 r4, 0xf595
    push16 r4
    ldi16 r4, 0x6cd7
    push16 r4
    ldi16 r4, 0x6dfa
    push16 r4
    ldi16 r4, 0x6f1d
    push16 r4
    ldi16 r4, 0xa3a9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r3
    push16 r7
    push16 r3
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_096_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_096_EQ_done
.Lcmov_slt_sge_096_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_096_EQ_done:
    brne8 .Lcmov_slt_sge_096_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_096_NE_done
.Lcmov_slt_sge_096_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_096_NE_done:
    brult8 .Lcmov_slt_sge_096_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_096_ULT_done
.Lcmov_slt_sge_096_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_096_ULT_done:
    bruge8 .Lcmov_slt_sge_096_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_096_UGE_done
.Lcmov_slt_sge_096_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_096_UGE_done:
    brslt8 .Lcmov_slt_sge_096_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_096_SLT_done
.Lcmov_slt_sge_096_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_096_SLT_done:
    brsge8 .Lcmov_slt_sge_096_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_096_SGE_done
.Lcmov_slt_sge_096_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_096_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r3; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x9cf5
    push16 r4
    ldi16 r4, 0x3ef8
    push16 r4
    ldi16 r4, 0x6ac8
    push16 r4
    ldi16 r4, 0xf5d0
    push16 r4
    ldi16 r4, 0x6d0e
    push16 r4
    ldi16 r4, 0x6e31
    push16 r4
    ldi16 r4, 0x6f54
    push16 r4
    ldi16 r4, 0x7077
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r3
    push16 r0
    push16 r3
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_097_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_097_EQ_done
.Lcmov_slt_sge_097_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_097_EQ_done:
    brne8 .Lcmov_slt_sge_097_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_097_NE_done
.Lcmov_slt_sge_097_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_097_NE_done:
    brult8 .Lcmov_slt_sge_097_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_097_ULT_done
.Lcmov_slt_sge_097_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_097_ULT_done:
    bruge8 .Lcmov_slt_sge_097_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_097_UGE_done
.Lcmov_slt_sge_097_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_097_UGE_done:
    brslt8 .Lcmov_slt_sge_097_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_097_SLT_done
.Lcmov_slt_sge_097_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_097_SLT_done:
    brsge8 .Lcmov_slt_sge_097_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_097_SGE_done
.Lcmov_slt_sge_097_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_097_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r4; path false; guard r2.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x68b9
    push16 r4
    ldi16 r4, 0x3f29
    push16 r4
    ldi16 r4, 0x9f4a
    push16 r4
    ldi16 r4, 0x6c22
    push16 r4
    ldi16 r4, 0xf70c
    push16 r4
    ldi16 r4, 0x6e68
    push16 r4
    ldi16 r4, 0x6f8b
    push16 r4
    ldi16 r4, 0x70ae
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r4
    push16 r2
    push16 r4
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_098_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_098_EQ_done
.Lcmov_slt_sge_098_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_098_EQ_done:
    brne8 .Lcmov_slt_sge_098_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_098_NE_done
.Lcmov_slt_sge_098_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_098_NE_done:
    brult8 .Lcmov_slt_sge_098_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_098_ULT_done
.Lcmov_slt_sge_098_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_098_ULT_done:
    bruge8 .Lcmov_slt_sge_098_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_098_UGE_done
.Lcmov_slt_sge_098_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_098_UGE_done:
    brslt8 .Lcmov_slt_sge_098_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_098_SLT_done
.Lcmov_slt_sge_098_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_098_SLT_done:
    brsge8 .Lcmov_slt_sge_098_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_098_SGE_done
.Lcmov_slt_sge_098_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_098_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r4; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x68f0
    push16 r4
    ldi16 r4, 0x3f5a
    push16 r4
    ldi16 r4, 0x9f9d
    push16 r4
    ldi16 r4, 0x6c59
    push16 r4
    ldi16 r4, 0xf747
    push16 r4
    ldi16 r4, 0x6e9f
    push16 r4
    ldi16 r4, 0x6fc2
    push16 r4
    ldi16 r4, 0x70e5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r4
    push16 r2
    push16 r4
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_099_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_099_EQ_done
.Lcmov_slt_sge_099_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_099_EQ_done:
    brne8 .Lcmov_slt_sge_099_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_099_NE_done
.Lcmov_slt_sge_099_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_099_NE_done:
    brult8 .Lcmov_slt_sge_099_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_099_ULT_done
.Lcmov_slt_sge_099_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_099_ULT_done:
    bruge8 .Lcmov_slt_sge_099_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_099_UGE_done
.Lcmov_slt_sge_099_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_099_UGE_done:
    brslt8 .Lcmov_slt_sge_099_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_099_SLT_done
.Lcmov_slt_sge_099_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_099_SLT_done:
    brsge8 .Lcmov_slt_sge_099_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_099_SGE_done
.Lcmov_slt_sge_099_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_099_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r5; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6927
    push16 r4
    ldi16 r4, 0x3f8b
    push16 r4
    ldi16 r4, 0x6b6d
    push16 r4
    ldi16 r4, 0xa0f1
    push16 r4
    ldi16 r4, 0x6db3
    push16 r4
    ldi16 r4, 0xf883
    push16 r4
    ldi16 r4, 0x6ff9
    push16 r4
    ldi16 r4, 0x711c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r5
    push16 r3
    push16 r5
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_09a_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09a_EQ_done
.Lcmov_slt_sge_09a_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09a_EQ_done:
    brne8 .Lcmov_slt_sge_09a_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09a_NE_done
.Lcmov_slt_sge_09a_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09a_NE_done:
    brult8 .Lcmov_slt_sge_09a_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09a_ULT_done
.Lcmov_slt_sge_09a_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09a_ULT_done:
    bruge8 .Lcmov_slt_sge_09a_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09a_UGE_done
.Lcmov_slt_sge_09a_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09a_UGE_done:
    brslt8 .Lcmov_slt_sge_09a_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09a_SLT_done
.Lcmov_slt_sge_09a_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09a_SLT_done:
    brsge8 .Lcmov_slt_sge_09a_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09a_SGE_done
.Lcmov_slt_sge_09a_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09a_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r5; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x695e
    push16 r4
    ldi16 r4, 0x3fbc
    push16 r4
    ldi16 r4, 0x6ba4
    push16 r4
    ldi16 r4, 0x6cc7
    push16 r4
    ldi16 r4, 0xa245
    push16 r4
    ldi16 r4, 0xf8be
    push16 r4
    ldi16 r4, 0x7030
    push16 r4
    ldi16 r4, 0x7153
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r5
    push16 r4
    push16 r5
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_09b_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09b_EQ_done
.Lcmov_slt_sge_09b_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09b_EQ_done:
    brne8 .Lcmov_slt_sge_09b_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09b_NE_done
.Lcmov_slt_sge_09b_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09b_NE_done:
    brult8 .Lcmov_slt_sge_09b_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09b_ULT_done
.Lcmov_slt_sge_09b_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09b_ULT_done:
    bruge8 .Lcmov_slt_sge_09b_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09b_UGE_done
.Lcmov_slt_sge_09b_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09b_UGE_done:
    brslt8 .Lcmov_slt_sge_09b_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09b_SLT_done
.Lcmov_slt_sge_09b_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09b_SLT_done:
    brsge8 .Lcmov_slt_sge_09b_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09b_SGE_done
.Lcmov_slt_sge_09b_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09b_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r6; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6995
    push16 r4
    ldi16 r4, 0x3fed
    push16 r4
    ldi16 r4, 0x6bdb
    push16 r4
    ldi16 r4, 0x6cfe
    push16 r4
    ldi16 r4, 0x6e21
    push16 r4
    ldi16 r4, 0xa399
    push16 r4
    ldi16 r4, 0xf9fa
    push16 r4
    ldi16 r4, 0x718a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r6
    push16 r5
    push16 r6
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_09c_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09c_EQ_done
.Lcmov_slt_sge_09c_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09c_EQ_done:
    brne8 .Lcmov_slt_sge_09c_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09c_NE_done
.Lcmov_slt_sge_09c_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09c_NE_done:
    brult8 .Lcmov_slt_sge_09c_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09c_ULT_done
.Lcmov_slt_sge_09c_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09c_ULT_done:
    bruge8 .Lcmov_slt_sge_09c_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09c_UGE_done
.Lcmov_slt_sge_09c_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09c_UGE_done:
    brslt8 .Lcmov_slt_sge_09c_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09c_SLT_done
.Lcmov_slt_sge_09c_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09c_SLT_done:
    brsge8 .Lcmov_slt_sge_09c_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09c_SGE_done
.Lcmov_slt_sge_09c_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09c_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r6; path true; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x69cc
    push16 r4
    ldi16 r4, 0x401e
    push16 r4
    ldi16 r4, 0x6c12
    push16 r4
    ldi16 r4, 0x6d35
    push16 r4
    ldi16 r4, 0x6e58
    push16 r4
    ldi16 r4, 0x6f7b
    push16 r4
    ldi16 r4, 0xfa35
    push16 r4
    ldi16 r4, 0xa5ee
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r6
    push16 r7
    push16 r6
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_09d_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09d_EQ_done
.Lcmov_slt_sge_09d_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09d_EQ_done:
    brne8 .Lcmov_slt_sge_09d_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09d_NE_done
.Lcmov_slt_sge_09d_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09d_NE_done:
    brult8 .Lcmov_slt_sge_09d_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09d_ULT_done
.Lcmov_slt_sge_09d_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09d_ULT_done:
    bruge8 .Lcmov_slt_sge_09d_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09d_UGE_done
.Lcmov_slt_sge_09d_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09d_UGE_done:
    brslt8 .Lcmov_slt_sge_09d_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09d_SLT_done
.Lcmov_slt_sge_09d_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09d_SLT_done:
    brsge8 .Lcmov_slt_sge_09d_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09d_SGE_done
.Lcmov_slt_sge_09d_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09d_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r7; path false; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x9f3a
    push16 r4
    ldi16 r4, 0x404f
    push16 r4
    ldi16 r4, 0x6c49
    push16 r4
    ldi16 r4, 0x6d6c
    push16 r4
    ldi16 r4, 0x6e8f
    push16 r4
    ldi16 r4, 0x6fb2
    push16 r4
    ldi16 r4, 0x70d5
    push16 r4
    ldi16 r4, 0xfb71
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r7
    push16 r0
    push16 r7
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_09e_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09e_EQ_done
.Lcmov_slt_sge_09e_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09e_EQ_done:
    brne8 .Lcmov_slt_sge_09e_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09e_NE_done
.Lcmov_slt_sge_09e_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09e_NE_done:
    brult8 .Lcmov_slt_sge_09e_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09e_ULT_done
.Lcmov_slt_sge_09e_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09e_ULT_done:
    bruge8 .Lcmov_slt_sge_09e_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09e_UGE_done
.Lcmov_slt_sge_09e_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09e_UGE_done:
    brslt8 .Lcmov_slt_sge_09e_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09e_SLT_done
.Lcmov_slt_sge_09e_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09e_SLT_done:
    brsge8 .Lcmov_slt_sge_09e_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09e_SGE_done
.Lcmov_slt_sge_09e_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09e_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r1,r7; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x9f8d
    push16 r4
    ldi16 r4, 0x4080
    push16 r4
    ldi16 r4, 0x6c80
    push16 r4
    ldi16 r4, 0x6da3
    push16 r4
    ldi16 r4, 0x6ec6
    push16 r4
    ldi16 r4, 0x6fe9
    push16 r4
    ldi16 r4, 0x710c
    push16 r4
    ldi16 r4, 0xfbac
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r1, r7
    push16 r0
    push16 r7
    push16 r1
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_09f_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09f_EQ_done
.Lcmov_slt_sge_09f_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09f_EQ_done:
    brne8 .Lcmov_slt_sge_09f_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09f_NE_done
.Lcmov_slt_sge_09f_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09f_NE_done:
    brult8 .Lcmov_slt_sge_09f_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09f_ULT_done
.Lcmov_slt_sge_09f_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09f_ULT_done:
    bruge8 .Lcmov_slt_sge_09f_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09f_UGE_done
.Lcmov_slt_sge_09f_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09f_UGE_done:
    brslt8 .Lcmov_slt_sge_09f_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09f_SLT_done
.Lcmov_slt_sge_09f_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09f_SLT_done:
    brsge8 .Lcmov_slt_sge_09f_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_09f_SGE_done
.Lcmov_slt_sge_09f_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_09f_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r0; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xf4e0
    push16 r4
    ldi16 r4, 0xa0e1
    push16 r4
    ldi16 r4, 0x41c2
    push16 r4
    ldi16 r4, 0x6dda
    push16 r4
    ldi16 r4, 0x6efd
    push16 r4
    ldi16 r4, 0x7020
    push16 r4
    ldi16 r4, 0x7143
    push16 r4
    ldi16 r4, 0x7266
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r0
    push16 r1
    push16 r0
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0a0_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a0_EQ_done
.Lcmov_slt_sge_0a0_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a0_EQ_done:
    brne8 .Lcmov_slt_sge_0a0_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a0_NE_done
.Lcmov_slt_sge_0a0_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a0_NE_done:
    brult8 .Lcmov_slt_sge_0a0_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a0_ULT_done
.Lcmov_slt_sge_0a0_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a0_ULT_done:
    bruge8 .Lcmov_slt_sge_0a0_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a0_UGE_done
.Lcmov_slt_sge_0a0_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a0_UGE_done:
    brslt8 .Lcmov_slt_sge_0a0_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a0_SLT_done
.Lcmov_slt_sge_0a0_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a0_SLT_done:
    brsge8 .Lcmov_slt_sge_0a0_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a0_SGE_done
.Lcmov_slt_sge_0a0_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a0_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r0; path true; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xf51b
    push16 r4
    ldi16 r4, 0x6bcb
    push16 r4
    ldi16 r4, 0x41f3
    push16 r4
    ldi16 r4, 0xa336
    push16 r4
    ldi16 r4, 0x6f34
    push16 r4
    ldi16 r4, 0x7057
    push16 r4
    ldi16 r4, 0x717a
    push16 r4
    ldi16 r4, 0x729d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r0
    push16 r3
    push16 r0
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0a1_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a1_EQ_done
.Lcmov_slt_sge_0a1_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a1_EQ_done:
    brne8 .Lcmov_slt_sge_0a1_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a1_NE_done
.Lcmov_slt_sge_0a1_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a1_NE_done:
    brult8 .Lcmov_slt_sge_0a1_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a1_ULT_done
.Lcmov_slt_sge_0a1_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a1_ULT_done:
    bruge8 .Lcmov_slt_sge_0a1_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a1_UGE_done
.Lcmov_slt_sge_0a1_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a1_UGE_done:
    brslt8 .Lcmov_slt_sge_0a1_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a1_SLT_done
.Lcmov_slt_sge_0a1_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a1_SLT_done:
    brsge8 .Lcmov_slt_sge_0a1_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a1_SGE_done
.Lcmov_slt_sge_0a1_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a1_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r1; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6adf
    push16 r4
    ldi16 r4, 0xf657
    push16 r4
    ldi16 r4, 0x4224
    push16 r4
    ldi16 r4, 0xa389
    push16 r4
    ldi16 r4, 0x6f6b
    push16 r4
    ldi16 r4, 0x708e
    push16 r4
    ldi16 r4, 0x71b1
    push16 r4
    ldi16 r4, 0x72d4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r1
    push16 r3
    push16 r1
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0a2_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a2_EQ_done
.Lcmov_slt_sge_0a2_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a2_EQ_done:
    brne8 .Lcmov_slt_sge_0a2_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a2_NE_done
.Lcmov_slt_sge_0a2_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a2_NE_done:
    brult8 .Lcmov_slt_sge_0a2_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a2_ULT_done
.Lcmov_slt_sge_0a2_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a2_ULT_done:
    bruge8 .Lcmov_slt_sge_0a2_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a2_UGE_done
.Lcmov_slt_sge_0a2_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a2_UGE_done:
    brslt8 .Lcmov_slt_sge_0a2_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a2_SLT_done
.Lcmov_slt_sge_0a2_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a2_SLT_done:
    brsge8 .Lcmov_slt_sge_0a2_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a2_SGE_done
.Lcmov_slt_sge_0a2_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a2_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r1; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6b16
    push16 r4
    ldi16 r4, 0xf692
    push16 r4
    ldi16 r4, 0x4255
    push16 r4
    ldi16 r4, 0x6e7f
    push16 r4
    ldi16 r4, 0xa4dd
    push16 r4
    ldi16 r4, 0x70c5
    push16 r4
    ldi16 r4, 0x71e8
    push16 r4
    ldi16 r4, 0x730b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r1
    push16 r4
    push16 r1
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0a3_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a3_EQ_done
.Lcmov_slt_sge_0a3_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a3_EQ_done:
    brne8 .Lcmov_slt_sge_0a3_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a3_NE_done
.Lcmov_slt_sge_0a3_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a3_NE_done:
    brult8 .Lcmov_slt_sge_0a3_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a3_ULT_done
.Lcmov_slt_sge_0a3_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a3_ULT_done:
    bruge8 .Lcmov_slt_sge_0a3_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a3_UGE_done
.Lcmov_slt_sge_0a3_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a3_UGE_done:
    brslt8 .Lcmov_slt_sge_0a3_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a3_SLT_done
.Lcmov_slt_sge_0a3_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a3_SLT_done:
    brsge8 .Lcmov_slt_sge_0a3_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a3_SGE_done
.Lcmov_slt_sge_0a3_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a3_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r2; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6b4d
    push16 r4
    ldi16 r4, 0x6c70
    push16 r4
    ldi16 r4, 0x4286
    push16 r4
    ldi16 r4, 0x6eb6
    push16 r4
    ldi16 r4, 0x6fd9
    push16 r4
    ldi16 r4, 0xa631
    push16 r4
    ldi16 r4, 0x721f
    push16 r4
    ldi16 r4, 0x7342
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r2
    push16 r5
    push16 r2
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0a4_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a4_EQ_done
.Lcmov_slt_sge_0a4_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a4_EQ_done:
    brne8 .Lcmov_slt_sge_0a4_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a4_NE_done
.Lcmov_slt_sge_0a4_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a4_NE_done:
    brult8 .Lcmov_slt_sge_0a4_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a4_ULT_done
.Lcmov_slt_sge_0a4_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a4_ULT_done:
    bruge8 .Lcmov_slt_sge_0a4_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a4_UGE_done
.Lcmov_slt_sge_0a4_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a4_UGE_done:
    brslt8 .Lcmov_slt_sge_0a4_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a4_SLT_done
.Lcmov_slt_sge_0a4_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a4_SLT_done:
    brsge8 .Lcmov_slt_sge_0a4_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a4_SGE_done
.Lcmov_slt_sge_0a4_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a4_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r2; path true; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6b84
    push16 r4
    ldi16 r4, 0x6ca7
    push16 r4
    ldi16 r4, 0x42b7
    push16 r4
    ldi16 r4, 0x6eed
    push16 r4
    ldi16 r4, 0x7010
    push16 r4
    ldi16 r4, 0x7133
    push16 r4
    ldi16 r4, 0xa785
    push16 r4
    ldi16 r4, 0x7379
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r2
    push16 r6
    push16 r2
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0a5_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a5_EQ_done
.Lcmov_slt_sge_0a5_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a5_EQ_done:
    brne8 .Lcmov_slt_sge_0a5_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a5_NE_done
.Lcmov_slt_sge_0a5_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a5_NE_done:
    brult8 .Lcmov_slt_sge_0a5_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a5_ULT_done
.Lcmov_slt_sge_0a5_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a5_ULT_done:
    bruge8 .Lcmov_slt_sge_0a5_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a5_UGE_done
.Lcmov_slt_sge_0a5_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a5_UGE_done:
    brslt8 .Lcmov_slt_sge_0a5_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a5_SLT_done
.Lcmov_slt_sge_0a5_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a5_SLT_done:
    brsge8 .Lcmov_slt_sge_0a5_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a5_SGE_done
.Lcmov_slt_sge_0a5_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a5_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r3; path false; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6bbb
    push16 r4
    ldi16 r4, 0x6cde
    push16 r4
    ldi16 r4, 0x42e8
    push16 r4
    ldi16 r4, 0xf945
    push16 r4
    ldi16 r4, 0x7047
    push16 r4
    ldi16 r4, 0x716a
    push16 r4
    ldi16 r4, 0x728d
    push16 r4
    ldi16 r4, 0xa8d9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r3
    push16 r7
    push16 r3
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0a6_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a6_EQ_done
.Lcmov_slt_sge_0a6_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a6_EQ_done:
    brne8 .Lcmov_slt_sge_0a6_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a6_NE_done
.Lcmov_slt_sge_0a6_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a6_NE_done:
    brult8 .Lcmov_slt_sge_0a6_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a6_ULT_done
.Lcmov_slt_sge_0a6_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a6_ULT_done:
    bruge8 .Lcmov_slt_sge_0a6_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a6_UGE_done
.Lcmov_slt_sge_0a6_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a6_UGE_done:
    brslt8 .Lcmov_slt_sge_0a6_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a6_SLT_done
.Lcmov_slt_sge_0a6_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a6_SLT_done:
    brsge8 .Lcmov_slt_sge_0a6_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a6_SGE_done
.Lcmov_slt_sge_0a6_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a6_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r3; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xa225
    push16 r4
    ldi16 r4, 0x6d15
    push16 r4
    ldi16 r4, 0x4319
    push16 r4
    ldi16 r4, 0xf980
    push16 r4
    ldi16 r4, 0x707e
    push16 r4
    ldi16 r4, 0x71a1
    push16 r4
    ldi16 r4, 0x72c4
    push16 r4
    ldi16 r4, 0x73e7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r3
    push16 r0
    push16 r3
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0a7_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a7_EQ_done
.Lcmov_slt_sge_0a7_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a7_EQ_done:
    brne8 .Lcmov_slt_sge_0a7_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a7_NE_done
.Lcmov_slt_sge_0a7_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a7_NE_done:
    brult8 .Lcmov_slt_sge_0a7_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a7_ULT_done
.Lcmov_slt_sge_0a7_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a7_ULT_done:
    bruge8 .Lcmov_slt_sge_0a7_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a7_UGE_done
.Lcmov_slt_sge_0a7_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a7_UGE_done:
    brslt8 .Lcmov_slt_sge_0a7_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a7_SLT_done
.Lcmov_slt_sge_0a7_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a7_SLT_done:
    brsge8 .Lcmov_slt_sge_0a7_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a7_SGE_done
.Lcmov_slt_sge_0a7_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a7_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r4; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6c29
    push16 r4
    ldi16 r4, 0xa379
    push16 r4
    ldi16 r4, 0x434a
    push16 r4
    ldi16 r4, 0x6f92
    push16 r4
    ldi16 r4, 0xfabc
    push16 r4
    ldi16 r4, 0x71d8
    push16 r4
    ldi16 r4, 0x72fb
    push16 r4
    ldi16 r4, 0x741e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r4
    push16 r1
    push16 r4
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0a8_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a8_EQ_done
.Lcmov_slt_sge_0a8_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a8_EQ_done:
    brne8 .Lcmov_slt_sge_0a8_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a8_NE_done
.Lcmov_slt_sge_0a8_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a8_NE_done:
    brult8 .Lcmov_slt_sge_0a8_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a8_ULT_done
.Lcmov_slt_sge_0a8_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a8_ULT_done:
    bruge8 .Lcmov_slt_sge_0a8_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a8_UGE_done
.Lcmov_slt_sge_0a8_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a8_UGE_done:
    brslt8 .Lcmov_slt_sge_0a8_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a8_SLT_done
.Lcmov_slt_sge_0a8_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a8_SLT_done:
    brsge8 .Lcmov_slt_sge_0a8_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a8_SGE_done
.Lcmov_slt_sge_0a8_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a8_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r4; path true; guard r3.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6c60
    push16 r4
    ldi16 r4, 0x6d83
    push16 r4
    ldi16 r4, 0x437b
    push16 r4
    ldi16 r4, 0xa5ce
    push16 r4
    ldi16 r4, 0xfaf7
    push16 r4
    ldi16 r4, 0x720f
    push16 r4
    ldi16 r4, 0x7332
    push16 r4
    ldi16 r4, 0x7455
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r4
    push16 r3
    push16 r4
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0a9_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a9_EQ_done
.Lcmov_slt_sge_0a9_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a9_EQ_done:
    brne8 .Lcmov_slt_sge_0a9_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a9_NE_done
.Lcmov_slt_sge_0a9_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a9_NE_done:
    brult8 .Lcmov_slt_sge_0a9_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a9_ULT_done
.Lcmov_slt_sge_0a9_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a9_ULT_done:
    bruge8 .Lcmov_slt_sge_0a9_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a9_UGE_done
.Lcmov_slt_sge_0a9_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a9_UGE_done:
    brslt8 .Lcmov_slt_sge_0a9_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a9_SLT_done
.Lcmov_slt_sge_0a9_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a9_SLT_done:
    brsge8 .Lcmov_slt_sge_0a9_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0a9_SGE_done
.Lcmov_slt_sge_0a9_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0a9_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r5; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6c97
    push16 r4
    ldi16 r4, 0x6dba
    push16 r4
    ldi16 r4, 0x43ac
    push16 r4
    ldi16 r4, 0xa621
    push16 r4
    ldi16 r4, 0x7123
    push16 r4
    ldi16 r4, 0xfc33
    push16 r4
    ldi16 r4, 0x7369
    push16 r4
    ldi16 r4, 0x748c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r5
    push16 r3
    push16 r5
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0aa_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0aa_EQ_done
.Lcmov_slt_sge_0aa_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0aa_EQ_done:
    brne8 .Lcmov_slt_sge_0aa_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0aa_NE_done
.Lcmov_slt_sge_0aa_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0aa_NE_done:
    brult8 .Lcmov_slt_sge_0aa_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0aa_ULT_done
.Lcmov_slt_sge_0aa_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0aa_ULT_done:
    bruge8 .Lcmov_slt_sge_0aa_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0aa_UGE_done
.Lcmov_slt_sge_0aa_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0aa_UGE_done:
    brslt8 .Lcmov_slt_sge_0aa_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0aa_SLT_done
.Lcmov_slt_sge_0aa_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0aa_SLT_done:
    brsge8 .Lcmov_slt_sge_0aa_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0aa_SGE_done
.Lcmov_slt_sge_0aa_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0aa_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r5; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6cce
    push16 r4
    ldi16 r4, 0x6df1
    push16 r4
    ldi16 r4, 0x43dd
    push16 r4
    ldi16 r4, 0x7037
    push16 r4
    ldi16 r4, 0xa775
    push16 r4
    ldi16 r4, 0xfc6e
    push16 r4
    ldi16 r4, 0x73a0
    push16 r4
    ldi16 r4, 0x74c3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r5
    push16 r4
    push16 r5
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ab_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ab_EQ_done
.Lcmov_slt_sge_0ab_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ab_EQ_done:
    brne8 .Lcmov_slt_sge_0ab_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ab_NE_done
.Lcmov_slt_sge_0ab_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ab_NE_done:
    brult8 .Lcmov_slt_sge_0ab_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ab_ULT_done
.Lcmov_slt_sge_0ab_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ab_ULT_done:
    bruge8 .Lcmov_slt_sge_0ab_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ab_UGE_done
.Lcmov_slt_sge_0ab_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ab_UGE_done:
    brslt8 .Lcmov_slt_sge_0ab_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ab_SLT_done
.Lcmov_slt_sge_0ab_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ab_SLT_done:
    brsge8 .Lcmov_slt_sge_0ab_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ab_SGE_done
.Lcmov_slt_sge_0ab_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ab_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r6; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6d05
    push16 r4
    ldi16 r4, 0x6e28
    push16 r4
    ldi16 r4, 0x440e
    push16 r4
    ldi16 r4, 0x706e
    push16 r4
    ldi16 r4, 0x7191
    push16 r4
    ldi16 r4, 0xa8c9
    push16 r4
    ldi16 r4, 0xfdaa
    push16 r4
    ldi16 r4, 0x74fa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r6
    push16 r5
    push16 r6
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ac_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ac_EQ_done
.Lcmov_slt_sge_0ac_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ac_EQ_done:
    brne8 .Lcmov_slt_sge_0ac_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ac_NE_done
.Lcmov_slt_sge_0ac_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ac_NE_done:
    brult8 .Lcmov_slt_sge_0ac_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ac_ULT_done
.Lcmov_slt_sge_0ac_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ac_ULT_done:
    bruge8 .Lcmov_slt_sge_0ac_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ac_UGE_done
.Lcmov_slt_sge_0ac_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ac_UGE_done:
    brslt8 .Lcmov_slt_sge_0ac_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ac_SLT_done
.Lcmov_slt_sge_0ac_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ac_SLT_done:
    brsge8 .Lcmov_slt_sge_0ac_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ac_SGE_done
.Lcmov_slt_sge_0ac_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ac_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r6; path true; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6d3c
    push16 r4
    ldi16 r4, 0x6e5f
    push16 r4
    ldi16 r4, 0x443f
    push16 r4
    ldi16 r4, 0x70a5
    push16 r4
    ldi16 r4, 0x71c8
    push16 r4
    ldi16 r4, 0x72eb
    push16 r4
    ldi16 r4, 0xfde5
    push16 r4
    ldi16 r4, 0xab1e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r6
    push16 r7
    push16 r6
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ad_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ad_EQ_done
.Lcmov_slt_sge_0ad_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ad_EQ_done:
    brne8 .Lcmov_slt_sge_0ad_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ad_NE_done
.Lcmov_slt_sge_0ad_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ad_NE_done:
    brult8 .Lcmov_slt_sge_0ad_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ad_ULT_done
.Lcmov_slt_sge_0ad_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ad_ULT_done:
    bruge8 .Lcmov_slt_sge_0ad_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ad_UGE_done
.Lcmov_slt_sge_0ad_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ad_UGE_done:
    brslt8 .Lcmov_slt_sge_0ad_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ad_SLT_done
.Lcmov_slt_sge_0ad_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ad_SLT_done:
    brsge8 .Lcmov_slt_sge_0ad_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ad_SGE_done
.Lcmov_slt_sge_0ad_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ad_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r7; path false; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa46a
    push16 r4
    ldi16 r4, 0x6e96
    push16 r4
    ldi16 r4, 0x4470
    push16 r4
    ldi16 r4, 0x70dc
    push16 r4
    ldi16 r4, 0x71ff
    push16 r4
    ldi16 r4, 0x7322
    push16 r4
    ldi16 r4, 0x7445
    push16 r4
    ldi16 r4, 0xff21
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r7
    push16 r0
    push16 r7
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ae_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ae_EQ_done
.Lcmov_slt_sge_0ae_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ae_EQ_done:
    brne8 .Lcmov_slt_sge_0ae_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ae_NE_done
.Lcmov_slt_sge_0ae_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ae_NE_done:
    brult8 .Lcmov_slt_sge_0ae_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ae_ULT_done
.Lcmov_slt_sge_0ae_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ae_ULT_done:
    bruge8 .Lcmov_slt_sge_0ae_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ae_UGE_done
.Lcmov_slt_sge_0ae_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ae_UGE_done:
    brslt8 .Lcmov_slt_sge_0ae_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ae_SLT_done
.Lcmov_slt_sge_0ae_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ae_SLT_done:
    brsge8 .Lcmov_slt_sge_0ae_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ae_SGE_done
.Lcmov_slt_sge_0ae_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ae_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r2,r7; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xa4bd
    push16 r4
    ldi16 r4, 0x6ecd
    push16 r4
    ldi16 r4, 0x44a1
    push16 r4
    ldi16 r4, 0x7113
    push16 r4
    ldi16 r4, 0x7236
    push16 r4
    ldi16 r4, 0x7359
    push16 r4
    ldi16 r4, 0x747c
    push16 r4
    ldi16 r4, 0xff5c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r2, r7
    push16 r0
    push16 r7
    push16 r2
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0af_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0af_EQ_done
.Lcmov_slt_sge_0af_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0af_EQ_done:
    brne8 .Lcmov_slt_sge_0af_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0af_NE_done
.Lcmov_slt_sge_0af_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0af_NE_done:
    brult8 .Lcmov_slt_sge_0af_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0af_ULT_done
.Lcmov_slt_sge_0af_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0af_ULT_done:
    bruge8 .Lcmov_slt_sge_0af_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0af_UGE_done
.Lcmov_slt_sge_0af_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0af_UGE_done:
    brslt8 .Lcmov_slt_sge_0af_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0af_SLT_done
.Lcmov_slt_sge_0af_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0af_SLT_done:
    brsge8 .Lcmov_slt_sge_0af_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0af_SGE_done
.Lcmov_slt_sge_0af_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0af_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r0; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xf890
    push16 r4
    ldi16 r4, 0xa611
    push16 r4
    ldi16 r4, 0x7027
    push16 r4
    ldi16 r4, 0x45e3
    push16 r4
    ldi16 r4, 0x726d
    push16 r4
    ldi16 r4, 0x7390
    push16 r4
    ldi16 r4, 0x74b3
    push16 r4
    ldi16 r4, 0x75d6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r0
    push16 r1
    push16 r0
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0b0_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b0_EQ_done
.Lcmov_slt_sge_0b0_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b0_EQ_done:
    brne8 .Lcmov_slt_sge_0b0_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b0_NE_done
.Lcmov_slt_sge_0b0_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b0_NE_done:
    brult8 .Lcmov_slt_sge_0b0_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b0_ULT_done
.Lcmov_slt_sge_0b0_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b0_ULT_done:
    bruge8 .Lcmov_slt_sge_0b0_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b0_UGE_done
.Lcmov_slt_sge_0b0_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b0_UGE_done:
    brslt8 .Lcmov_slt_sge_0b0_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b0_SLT_done
.Lcmov_slt_sge_0b0_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b0_SLT_done:
    brsge8 .Lcmov_slt_sge_0b0_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b0_SGE_done
.Lcmov_slt_sge_0b0_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b0_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r0; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xf8cb
    push16 r4
    ldi16 r4, 0x6f3b
    push16 r4
    ldi16 r4, 0xa765
    push16 r4
    ldi16 r4, 0x4614
    push16 r4
    ldi16 r4, 0x72a4
    push16 r4
    ldi16 r4, 0x73c7
    push16 r4
    ldi16 r4, 0x74ea
    push16 r4
    ldi16 r4, 0x760d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r0
    push16 r2
    push16 r0
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0b1_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b1_EQ_done
.Lcmov_slt_sge_0b1_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b1_EQ_done:
    brne8 .Lcmov_slt_sge_0b1_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b1_NE_done
.Lcmov_slt_sge_0b1_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b1_NE_done:
    brult8 .Lcmov_slt_sge_0b1_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b1_ULT_done
.Lcmov_slt_sge_0b1_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b1_ULT_done:
    bruge8 .Lcmov_slt_sge_0b1_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b1_UGE_done
.Lcmov_slt_sge_0b1_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b1_UGE_done:
    brslt8 .Lcmov_slt_sge_0b1_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b1_SLT_done
.Lcmov_slt_sge_0b1_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b1_SLT_done:
    brsge8 .Lcmov_slt_sge_0b1_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b1_SGE_done
.Lcmov_slt_sge_0b1_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b1_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r1; path false; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6e4f
    push16 r4
    ldi16 r4, 0xfa07
    push16 r4
    ldi16 r4, 0x7095
    push16 r4
    ldi16 r4, 0x4645
    push16 r4
    ldi16 r4, 0xa9ba
    push16 r4
    ldi16 r4, 0x73fe
    push16 r4
    ldi16 r4, 0x7521
    push16 r4
    ldi16 r4, 0x7644
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r1
    push16 r4
    push16 r1
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0b2_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b2_EQ_done
.Lcmov_slt_sge_0b2_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b2_EQ_done:
    brne8 .Lcmov_slt_sge_0b2_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b2_NE_done
.Lcmov_slt_sge_0b2_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b2_NE_done:
    brult8 .Lcmov_slt_sge_0b2_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b2_ULT_done
.Lcmov_slt_sge_0b2_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b2_ULT_done:
    bruge8 .Lcmov_slt_sge_0b2_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b2_UGE_done
.Lcmov_slt_sge_0b2_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b2_UGE_done:
    brslt8 .Lcmov_slt_sge_0b2_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b2_SLT_done
.Lcmov_slt_sge_0b2_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b2_SLT_done:
    brsge8 .Lcmov_slt_sge_0b2_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b2_SGE_done
.Lcmov_slt_sge_0b2_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b2_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r1; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6e86
    push16 r4
    ldi16 r4, 0xfa42
    push16 r4
    ldi16 r4, 0x70cc
    push16 r4
    ldi16 r4, 0x4676
    push16 r4
    ldi16 r4, 0xaa0d
    push16 r4
    ldi16 r4, 0x7435
    push16 r4
    ldi16 r4, 0x7558
    push16 r4
    ldi16 r4, 0x767b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r1
    push16 r4
    push16 r1
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0b3_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b3_EQ_done
.Lcmov_slt_sge_0b3_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b3_EQ_done:
    brne8 .Lcmov_slt_sge_0b3_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b3_NE_done
.Lcmov_slt_sge_0b3_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b3_NE_done:
    brult8 .Lcmov_slt_sge_0b3_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b3_ULT_done
.Lcmov_slt_sge_0b3_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b3_ULT_done:
    bruge8 .Lcmov_slt_sge_0b3_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b3_UGE_done
.Lcmov_slt_sge_0b3_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b3_UGE_done:
    brslt8 .Lcmov_slt_sge_0b3_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b3_SLT_done
.Lcmov_slt_sge_0b3_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b3_SLT_done:
    brsge8 .Lcmov_slt_sge_0b3_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b3_SGE_done
.Lcmov_slt_sge_0b3_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b3_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r2; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6ebd
    push16 r4
    ldi16 r4, 0x6fe0
    push16 r4
    ldi16 r4, 0xfb7e
    push16 r4
    ldi16 r4, 0x46a7
    push16 r4
    ldi16 r4, 0x7349
    push16 r4
    ldi16 r4, 0xab61
    push16 r4
    ldi16 r4, 0x758f
    push16 r4
    ldi16 r4, 0x76b2
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r2
    push16 r5
    push16 r2
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0b4_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b4_EQ_done
.Lcmov_slt_sge_0b4_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b4_EQ_done:
    brne8 .Lcmov_slt_sge_0b4_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b4_NE_done
.Lcmov_slt_sge_0b4_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b4_NE_done:
    brult8 .Lcmov_slt_sge_0b4_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b4_ULT_done
.Lcmov_slt_sge_0b4_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b4_ULT_done:
    bruge8 .Lcmov_slt_sge_0b4_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b4_UGE_done
.Lcmov_slt_sge_0b4_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b4_UGE_done:
    brslt8 .Lcmov_slt_sge_0b4_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b4_SLT_done
.Lcmov_slt_sge_0b4_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b4_SLT_done:
    brsge8 .Lcmov_slt_sge_0b4_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b4_SGE_done
.Lcmov_slt_sge_0b4_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b4_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r2; path true; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6ef4
    push16 r4
    ldi16 r4, 0x7017
    push16 r4
    ldi16 r4, 0xfbb9
    push16 r4
    ldi16 r4, 0x46d8
    push16 r4
    ldi16 r4, 0x7380
    push16 r4
    ldi16 r4, 0x74a3
    push16 r4
    ldi16 r4, 0xacb5
    push16 r4
    ldi16 r4, 0x76e9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r2
    push16 r6
    push16 r2
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0b5_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b5_EQ_done
.Lcmov_slt_sge_0b5_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b5_EQ_done:
    brne8 .Lcmov_slt_sge_0b5_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b5_NE_done
.Lcmov_slt_sge_0b5_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b5_NE_done:
    brult8 .Lcmov_slt_sge_0b5_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b5_ULT_done
.Lcmov_slt_sge_0b5_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b5_ULT_done:
    bruge8 .Lcmov_slt_sge_0b5_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b5_UGE_done
.Lcmov_slt_sge_0b5_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b5_UGE_done:
    brslt8 .Lcmov_slt_sge_0b5_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b5_SLT_done
.Lcmov_slt_sge_0b5_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b5_SLT_done:
    brsge8 .Lcmov_slt_sge_0b5_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b5_SGE_done
.Lcmov_slt_sge_0b5_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b5_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r3; path false; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6f2b
    push16 r4
    ldi16 r4, 0x704e
    push16 r4
    ldi16 r4, 0x7171
    push16 r4
    ldi16 r4, 0x4709
    push16 r4
    ldi16 r4, 0x73b7
    push16 r4
    ldi16 r4, 0x74da
    push16 r4
    ldi16 r4, 0x75fd
    push16 r4
    ldi16 r4, 0xae09
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r3
    push16 r7
    push16 r3
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0b6_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b6_EQ_done
.Lcmov_slt_sge_0b6_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b6_EQ_done:
    brne8 .Lcmov_slt_sge_0b6_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b6_NE_done
.Lcmov_slt_sge_0b6_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b6_NE_done:
    brult8 .Lcmov_slt_sge_0b6_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b6_ULT_done
.Lcmov_slt_sge_0b6_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b6_ULT_done:
    bruge8 .Lcmov_slt_sge_0b6_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b6_UGE_done
.Lcmov_slt_sge_0b6_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b6_UGE_done:
    brslt8 .Lcmov_slt_sge_0b6_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b6_SLT_done
.Lcmov_slt_sge_0b6_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b6_SLT_done:
    brsge8 .Lcmov_slt_sge_0b6_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b6_SGE_done
.Lcmov_slt_sge_0b6_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b6_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r3; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xa755
    push16 r4
    ldi16 r4, 0x7085
    push16 r4
    ldi16 r4, 0x71a8
    push16 r4
    ldi16 r4, 0x473a
    push16 r4
    ldi16 r4, 0x73ee
    push16 r4
    ldi16 r4, 0x7511
    push16 r4
    ldi16 r4, 0x7634
    push16 r4
    ldi16 r4, 0x7757
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r3
    push16 r0
    push16 r3
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0b7_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b7_EQ_done
.Lcmov_slt_sge_0b7_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b7_EQ_done:
    brne8 .Lcmov_slt_sge_0b7_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b7_NE_done
.Lcmov_slt_sge_0b7_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b7_NE_done:
    brult8 .Lcmov_slt_sge_0b7_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b7_ULT_done
.Lcmov_slt_sge_0b7_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b7_ULT_done:
    bruge8 .Lcmov_slt_sge_0b7_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b7_UGE_done
.Lcmov_slt_sge_0b7_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b7_UGE_done:
    brslt8 .Lcmov_slt_sge_0b7_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b7_SLT_done
.Lcmov_slt_sge_0b7_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b7_SLT_done:
    brsge8 .Lcmov_slt_sge_0b7_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b7_SGE_done
.Lcmov_slt_sge_0b7_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b7_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r4; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6f99
    push16 r4
    ldi16 r4, 0xa8a9
    push16 r4
    ldi16 r4, 0x71df
    push16 r4
    ldi16 r4, 0x476b
    push16 r4
    ldi16 r4, 0xfe6c
    push16 r4
    ldi16 r4, 0x7548
    push16 r4
    ldi16 r4, 0x766b
    push16 r4
    ldi16 r4, 0x778e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r4
    push16 r1
    push16 r4
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0b8_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b8_EQ_done
.Lcmov_slt_sge_0b8_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b8_EQ_done:
    brne8 .Lcmov_slt_sge_0b8_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b8_NE_done
.Lcmov_slt_sge_0b8_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b8_NE_done:
    brult8 .Lcmov_slt_sge_0b8_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b8_ULT_done
.Lcmov_slt_sge_0b8_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b8_ULT_done:
    bruge8 .Lcmov_slt_sge_0b8_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b8_UGE_done
.Lcmov_slt_sge_0b8_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b8_UGE_done:
    brslt8 .Lcmov_slt_sge_0b8_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b8_SLT_done
.Lcmov_slt_sge_0b8_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b8_SLT_done:
    brsge8 .Lcmov_slt_sge_0b8_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b8_SGE_done
.Lcmov_slt_sge_0b8_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b8_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r4; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6fd0
    push16 r4
    ldi16 r4, 0x70f3
    push16 r4
    ldi16 r4, 0xa9fd
    push16 r4
    ldi16 r4, 0x479c
    push16 r4
    ldi16 r4, 0xfea7
    push16 r4
    ldi16 r4, 0x757f
    push16 r4
    ldi16 r4, 0x76a2
    push16 r4
    ldi16 r4, 0x77c5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r4
    push16 r2
    push16 r4
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0b9_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b9_EQ_done
.Lcmov_slt_sge_0b9_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b9_EQ_done:
    brne8 .Lcmov_slt_sge_0b9_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b9_NE_done
.Lcmov_slt_sge_0b9_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b9_NE_done:
    brult8 .Lcmov_slt_sge_0b9_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b9_ULT_done
.Lcmov_slt_sge_0b9_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b9_ULT_done:
    bruge8 .Lcmov_slt_sge_0b9_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b9_UGE_done
.Lcmov_slt_sge_0b9_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b9_UGE_done:
    brslt8 .Lcmov_slt_sge_0b9_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b9_SLT_done
.Lcmov_slt_sge_0b9_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b9_SLT_done:
    brsge8 .Lcmov_slt_sge_0b9_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0b9_SGE_done
.Lcmov_slt_sge_0b9_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0b9_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r5; path false; guard r4.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7007
    push16 r4
    ldi16 r4, 0x712a
    push16 r4
    ldi16 r4, 0x724d
    push16 r4
    ldi16 r4, 0x47cd
    push16 r4
    ldi16 r4, 0xac52
    push16 r4
    ldi16 r4, 0xffe3
    push16 r4
    ldi16 r4, 0x76d9
    push16 r4
    ldi16 r4, 0x77fc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r5
    push16 r4
    push16 r5
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ba_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ba_EQ_done
.Lcmov_slt_sge_0ba_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ba_EQ_done:
    brne8 .Lcmov_slt_sge_0ba_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ba_NE_done
.Lcmov_slt_sge_0ba_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ba_NE_done:
    brult8 .Lcmov_slt_sge_0ba_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ba_ULT_done
.Lcmov_slt_sge_0ba_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ba_ULT_done:
    bruge8 .Lcmov_slt_sge_0ba_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ba_UGE_done
.Lcmov_slt_sge_0ba_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ba_UGE_done:
    brslt8 .Lcmov_slt_sge_0ba_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ba_SLT_done
.Lcmov_slt_sge_0ba_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ba_SLT_done:
    brsge8 .Lcmov_slt_sge_0ba_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ba_SGE_done
.Lcmov_slt_sge_0ba_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ba_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r5; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x703e
    push16 r4
    ldi16 r4, 0x7161
    push16 r4
    ldi16 r4, 0x7284
    push16 r4
    ldi16 r4, 0x47fe
    push16 r4
    ldi16 r4, 0xaca5
    push16 r4
    ldi16 r4, 0x001e
    push16 r4
    ldi16 r4, 0x7710
    push16 r4
    ldi16 r4, 0x7833
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r5
    push16 r4
    push16 r5
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0bb_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bb_EQ_done
.Lcmov_slt_sge_0bb_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bb_EQ_done:
    brne8 .Lcmov_slt_sge_0bb_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bb_NE_done
.Lcmov_slt_sge_0bb_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bb_NE_done:
    brult8 .Lcmov_slt_sge_0bb_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bb_ULT_done
.Lcmov_slt_sge_0bb_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bb_ULT_done:
    bruge8 .Lcmov_slt_sge_0bb_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bb_UGE_done
.Lcmov_slt_sge_0bb_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bb_UGE_done:
    brslt8 .Lcmov_slt_sge_0bb_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bb_SLT_done
.Lcmov_slt_sge_0bb_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bb_SLT_done:
    brsge8 .Lcmov_slt_sge_0bb_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bb_SGE_done
.Lcmov_slt_sge_0bb_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bb_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r6; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7075
    push16 r4
    ldi16 r4, 0x7198
    push16 r4
    ldi16 r4, 0x72bb
    push16 r4
    ldi16 r4, 0x482f
    push16 r4
    ldi16 r4, 0x7501
    push16 r4
    ldi16 r4, 0xadf9
    push16 r4
    ldi16 r4, 0x015a
    push16 r4
    ldi16 r4, 0x786a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r6
    push16 r5
    push16 r6
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0bc_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bc_EQ_done
.Lcmov_slt_sge_0bc_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bc_EQ_done:
    brne8 .Lcmov_slt_sge_0bc_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bc_NE_done
.Lcmov_slt_sge_0bc_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bc_NE_done:
    brult8 .Lcmov_slt_sge_0bc_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bc_ULT_done
.Lcmov_slt_sge_0bc_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bc_ULT_done:
    bruge8 .Lcmov_slt_sge_0bc_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bc_UGE_done
.Lcmov_slt_sge_0bc_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bc_UGE_done:
    brslt8 .Lcmov_slt_sge_0bc_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bc_SLT_done
.Lcmov_slt_sge_0bc_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bc_SLT_done:
    brsge8 .Lcmov_slt_sge_0bc_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bc_SGE_done
.Lcmov_slt_sge_0bc_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bc_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r6; path true; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x70ac
    push16 r4
    ldi16 r4, 0x71cf
    push16 r4
    ldi16 r4, 0x72f2
    push16 r4
    ldi16 r4, 0x4860
    push16 r4
    ldi16 r4, 0x7538
    push16 r4
    ldi16 r4, 0x765b
    push16 r4
    ldi16 r4, 0x0195
    push16 r4
    ldi16 r4, 0xb04e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r6
    push16 r7
    push16 r6
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0bd_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bd_EQ_done
.Lcmov_slt_sge_0bd_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bd_EQ_done:
    brne8 .Lcmov_slt_sge_0bd_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bd_NE_done
.Lcmov_slt_sge_0bd_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bd_NE_done:
    brult8 .Lcmov_slt_sge_0bd_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bd_ULT_done
.Lcmov_slt_sge_0bd_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bd_ULT_done:
    bruge8 .Lcmov_slt_sge_0bd_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bd_UGE_done
.Lcmov_slt_sge_0bd_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bd_UGE_done:
    brslt8 .Lcmov_slt_sge_0bd_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bd_SLT_done
.Lcmov_slt_sge_0bd_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bd_SLT_done:
    brsge8 .Lcmov_slt_sge_0bd_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bd_SGE_done
.Lcmov_slt_sge_0bd_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bd_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r7; path false; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xa99a
    push16 r4
    ldi16 r4, 0x7206
    push16 r4
    ldi16 r4, 0x7329
    push16 r4
    ldi16 r4, 0x4891
    push16 r4
    ldi16 r4, 0x756f
    push16 r4
    ldi16 r4, 0x7692
    push16 r4
    ldi16 r4, 0x77b5
    push16 r4
    ldi16 r4, 0x02d1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r7
    push16 r0
    push16 r7
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0be_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0be_EQ_done
.Lcmov_slt_sge_0be_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0be_EQ_done:
    brne8 .Lcmov_slt_sge_0be_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0be_NE_done
.Lcmov_slt_sge_0be_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0be_NE_done:
    brult8 .Lcmov_slt_sge_0be_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0be_ULT_done
.Lcmov_slt_sge_0be_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0be_ULT_done:
    bruge8 .Lcmov_slt_sge_0be_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0be_UGE_done
.Lcmov_slt_sge_0be_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0be_UGE_done:
    brslt8 .Lcmov_slt_sge_0be_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0be_SLT_done
.Lcmov_slt_sge_0be_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0be_SLT_done:
    brsge8 .Lcmov_slt_sge_0be_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0be_SGE_done
.Lcmov_slt_sge_0be_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0be_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r3,r7; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xa9ed
    push16 r4
    ldi16 r4, 0x723d
    push16 r4
    ldi16 r4, 0x7360
    push16 r4
    ldi16 r4, 0x48c2
    push16 r4
    ldi16 r4, 0x75a6
    push16 r4
    ldi16 r4, 0x76c9
    push16 r4
    ldi16 r4, 0x77ec
    push16 r4
    ldi16 r4, 0x030c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r3, r7
    push16 r0
    push16 r7
    push16 r3
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0bf_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bf_EQ_done
.Lcmov_slt_sge_0bf_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bf_EQ_done:
    brne8 .Lcmov_slt_sge_0bf_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bf_NE_done
.Lcmov_slt_sge_0bf_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bf_NE_done:
    brult8 .Lcmov_slt_sge_0bf_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bf_ULT_done
.Lcmov_slt_sge_0bf_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bf_ULT_done:
    bruge8 .Lcmov_slt_sge_0bf_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bf_UGE_done
.Lcmov_slt_sge_0bf_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bf_UGE_done:
    brslt8 .Lcmov_slt_sge_0bf_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bf_SLT_done
.Lcmov_slt_sge_0bf_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bf_SLT_done:
    brsge8 .Lcmov_slt_sge_0bf_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0bf_SGE_done
.Lcmov_slt_sge_0bf_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0bf_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r0; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xfc40
    push16 r4
    ldi16 r4, 0xab41
    push16 r4
    ldi16 r4, 0x7397
    push16 r4
    ldi16 r4, 0x74ba
    push16 r4
    ldi16 r4, 0x4a04
    push16 r4
    ldi16 r4, 0x7700
    push16 r4
    ldi16 r4, 0x7823
    push16 r4
    ldi16 r4, 0x7946
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r0
    push16 r1
    push16 r0
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0c0_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c0_EQ_done
.Lcmov_slt_sge_0c0_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c0_EQ_done:
    brne8 .Lcmov_slt_sge_0c0_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c0_NE_done
.Lcmov_slt_sge_0c0_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c0_NE_done:
    brult8 .Lcmov_slt_sge_0c0_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c0_ULT_done
.Lcmov_slt_sge_0c0_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c0_ULT_done:
    bruge8 .Lcmov_slt_sge_0c0_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c0_UGE_done
.Lcmov_slt_sge_0c0_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c0_UGE_done:
    brslt8 .Lcmov_slt_sge_0c0_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c0_SLT_done
.Lcmov_slt_sge_0c0_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c0_SLT_done:
    brsge8 .Lcmov_slt_sge_0c0_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c0_SGE_done
.Lcmov_slt_sge_0c0_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c0_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r0; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xfc7b
    push16 r4
    ldi16 r4, 0x72ab
    push16 r4
    ldi16 r4, 0xac95
    push16 r4
    ldi16 r4, 0x74f1
    push16 r4
    ldi16 r4, 0x4a35
    push16 r4
    ldi16 r4, 0x7737
    push16 r4
    ldi16 r4, 0x785a
    push16 r4
    ldi16 r4, 0x797d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r0
    push16 r2
    push16 r0
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0c1_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c1_EQ_done
.Lcmov_slt_sge_0c1_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c1_EQ_done:
    brne8 .Lcmov_slt_sge_0c1_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c1_NE_done
.Lcmov_slt_sge_0c1_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c1_NE_done:
    brult8 .Lcmov_slt_sge_0c1_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c1_ULT_done
.Lcmov_slt_sge_0c1_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c1_ULT_done:
    bruge8 .Lcmov_slt_sge_0c1_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c1_UGE_done
.Lcmov_slt_sge_0c1_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c1_UGE_done:
    brslt8 .Lcmov_slt_sge_0c1_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c1_SLT_done
.Lcmov_slt_sge_0c1_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c1_SLT_done:
    brsge8 .Lcmov_slt_sge_0c1_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c1_SGE_done
.Lcmov_slt_sge_0c1_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c1_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r1; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x71bf
    push16 r4
    ldi16 r4, 0xfdb7
    push16 r4
    ldi16 r4, 0x7405
    push16 r4
    ldi16 r4, 0xade9
    push16 r4
    ldi16 r4, 0x4a66
    push16 r4
    ldi16 r4, 0x776e
    push16 r4
    ldi16 r4, 0x7891
    push16 r4
    ldi16 r4, 0x79b4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r1
    push16 r3
    push16 r1
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0c2_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c2_EQ_done
.Lcmov_slt_sge_0c2_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c2_EQ_done:
    brne8 .Lcmov_slt_sge_0c2_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c2_NE_done
.Lcmov_slt_sge_0c2_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c2_NE_done:
    brult8 .Lcmov_slt_sge_0c2_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c2_ULT_done
.Lcmov_slt_sge_0c2_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c2_ULT_done:
    bruge8 .Lcmov_slt_sge_0c2_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c2_UGE_done
.Lcmov_slt_sge_0c2_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c2_UGE_done:
    brslt8 .Lcmov_slt_sge_0c2_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c2_SLT_done
.Lcmov_slt_sge_0c2_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c2_SLT_done:
    brsge8 .Lcmov_slt_sge_0c2_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c2_SGE_done
.Lcmov_slt_sge_0c2_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c2_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r1; path true; guard r5.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x71f6
    push16 r4
    ldi16 r4, 0xfdf2
    push16 r4
    ldi16 r4, 0x743c
    push16 r4
    ldi16 r4, 0x755f
    push16 r4
    ldi16 r4, 0x4a97
    push16 r4
    ldi16 r4, 0xb03e
    push16 r4
    ldi16 r4, 0x78c8
    push16 r4
    ldi16 r4, 0x79eb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r1
    push16 r5
    push16 r1
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0c3_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c3_EQ_done
.Lcmov_slt_sge_0c3_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c3_EQ_done:
    brne8 .Lcmov_slt_sge_0c3_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c3_NE_done
.Lcmov_slt_sge_0c3_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c3_NE_done:
    brult8 .Lcmov_slt_sge_0c3_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c3_ULT_done
.Lcmov_slt_sge_0c3_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c3_ULT_done:
    bruge8 .Lcmov_slt_sge_0c3_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c3_UGE_done
.Lcmov_slt_sge_0c3_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c3_UGE_done:
    brslt8 .Lcmov_slt_sge_0c3_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c3_SLT_done
.Lcmov_slt_sge_0c3_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c3_SLT_done:
    brsge8 .Lcmov_slt_sge_0c3_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c3_SGE_done
.Lcmov_slt_sge_0c3_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c3_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r2; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x722d
    push16 r4
    ldi16 r4, 0x7350
    push16 r4
    ldi16 r4, 0xff2e
    push16 r4
    ldi16 r4, 0x7596
    push16 r4
    ldi16 r4, 0x4ac8
    push16 r4
    ldi16 r4, 0xb091
    push16 r4
    ldi16 r4, 0x78ff
    push16 r4
    ldi16 r4, 0x7a22
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r2
    push16 r5
    push16 r2
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0c4_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c4_EQ_done
.Lcmov_slt_sge_0c4_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c4_EQ_done:
    brne8 .Lcmov_slt_sge_0c4_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c4_NE_done
.Lcmov_slt_sge_0c4_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c4_NE_done:
    brult8 .Lcmov_slt_sge_0c4_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c4_ULT_done
.Lcmov_slt_sge_0c4_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c4_ULT_done:
    bruge8 .Lcmov_slt_sge_0c4_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c4_UGE_done
.Lcmov_slt_sge_0c4_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c4_UGE_done:
    brslt8 .Lcmov_slt_sge_0c4_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c4_SLT_done
.Lcmov_slt_sge_0c4_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c4_SLT_done:
    brsge8 .Lcmov_slt_sge_0c4_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c4_SGE_done
.Lcmov_slt_sge_0c4_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c4_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r2; path true; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7264
    push16 r4
    ldi16 r4, 0x7387
    push16 r4
    ldi16 r4, 0xff69
    push16 r4
    ldi16 r4, 0x75cd
    push16 r4
    ldi16 r4, 0x4af9
    push16 r4
    ldi16 r4, 0x7813
    push16 r4
    ldi16 r4, 0xb1e5
    push16 r4
    ldi16 r4, 0x7a59
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r2
    push16 r6
    push16 r2
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0c5_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c5_EQ_done
.Lcmov_slt_sge_0c5_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c5_EQ_done:
    brne8 .Lcmov_slt_sge_0c5_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c5_NE_done
.Lcmov_slt_sge_0c5_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c5_NE_done:
    brult8 .Lcmov_slt_sge_0c5_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c5_ULT_done
.Lcmov_slt_sge_0c5_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c5_ULT_done:
    bruge8 .Lcmov_slt_sge_0c5_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c5_UGE_done
.Lcmov_slt_sge_0c5_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c5_UGE_done:
    brslt8 .Lcmov_slt_sge_0c5_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c5_SLT_done
.Lcmov_slt_sge_0c5_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c5_SLT_done:
    brsge8 .Lcmov_slt_sge_0c5_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c5_SGE_done
.Lcmov_slt_sge_0c5_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c5_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r3; path false; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x729b
    push16 r4
    ldi16 r4, 0x73be
    push16 r4
    ldi16 r4, 0x74e1
    push16 r4
    ldi16 r4, 0x00a5
    push16 r4
    ldi16 r4, 0x4b2a
    push16 r4
    ldi16 r4, 0x784a
    push16 r4
    ldi16 r4, 0x796d
    push16 r4
    ldi16 r4, 0xb339
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r3
    push16 r7
    push16 r3
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0c6_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c6_EQ_done
.Lcmov_slt_sge_0c6_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c6_EQ_done:
    brne8 .Lcmov_slt_sge_0c6_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c6_NE_done
.Lcmov_slt_sge_0c6_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c6_NE_done:
    brult8 .Lcmov_slt_sge_0c6_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c6_ULT_done
.Lcmov_slt_sge_0c6_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c6_ULT_done:
    bruge8 .Lcmov_slt_sge_0c6_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c6_UGE_done
.Lcmov_slt_sge_0c6_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c6_UGE_done:
    brslt8 .Lcmov_slt_sge_0c6_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c6_SLT_done
.Lcmov_slt_sge_0c6_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c6_SLT_done:
    brsge8 .Lcmov_slt_sge_0c6_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c6_SGE_done
.Lcmov_slt_sge_0c6_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c6_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r3; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xac85
    push16 r4
    ldi16 r4, 0x73f5
    push16 r4
    ldi16 r4, 0x7518
    push16 r4
    ldi16 r4, 0x00e0
    push16 r4
    ldi16 r4, 0x4b5b
    push16 r4
    ldi16 r4, 0x7881
    push16 r4
    ldi16 r4, 0x79a4
    push16 r4
    ldi16 r4, 0x7ac7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r3
    push16 r0
    push16 r3
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0c7_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c7_EQ_done
.Lcmov_slt_sge_0c7_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c7_EQ_done:
    brne8 .Lcmov_slt_sge_0c7_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c7_NE_done
.Lcmov_slt_sge_0c7_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c7_NE_done:
    brult8 .Lcmov_slt_sge_0c7_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c7_ULT_done
.Lcmov_slt_sge_0c7_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c7_ULT_done:
    bruge8 .Lcmov_slt_sge_0c7_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c7_UGE_done
.Lcmov_slt_sge_0c7_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c7_UGE_done:
    brslt8 .Lcmov_slt_sge_0c7_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c7_SLT_done
.Lcmov_slt_sge_0c7_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c7_SLT_done:
    brsge8 .Lcmov_slt_sge_0c7_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c7_SGE_done
.Lcmov_slt_sge_0c7_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c7_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r4; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7309
    push16 r4
    ldi16 r4, 0xadd9
    push16 r4
    ldi16 r4, 0x754f
    push16 r4
    ldi16 r4, 0x7672
    push16 r4
    ldi16 r4, 0x4b8c
    push16 r4
    ldi16 r4, 0x78b8
    push16 r4
    ldi16 r4, 0x79db
    push16 r4
    ldi16 r4, 0x7afe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r4
    push16 r1
    push16 r4
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0c8_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c8_EQ_done
.Lcmov_slt_sge_0c8_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c8_EQ_done:
    brne8 .Lcmov_slt_sge_0c8_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c8_NE_done
.Lcmov_slt_sge_0c8_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c8_NE_done:
    brult8 .Lcmov_slt_sge_0c8_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c8_ULT_done
.Lcmov_slt_sge_0c8_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c8_ULT_done:
    bruge8 .Lcmov_slt_sge_0c8_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c8_UGE_done
.Lcmov_slt_sge_0c8_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c8_UGE_done:
    brslt8 .Lcmov_slt_sge_0c8_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c8_SLT_done
.Lcmov_slt_sge_0c8_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c8_SLT_done:
    brsge8 .Lcmov_slt_sge_0c8_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c8_SGE_done
.Lcmov_slt_sge_0c8_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c8_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r4; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7340
    push16 r4
    ldi16 r4, 0x7463
    push16 r4
    ldi16 r4, 0xaf2d
    push16 r4
    ldi16 r4, 0x76a9
    push16 r4
    ldi16 r4, 0x4bbd
    push16 r4
    ldi16 r4, 0x78ef
    push16 r4
    ldi16 r4, 0x7a12
    push16 r4
    ldi16 r4, 0x7b35
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r4
    push16 r2
    push16 r4
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0c9_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c9_EQ_done
.Lcmov_slt_sge_0c9_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c9_EQ_done:
    brne8 .Lcmov_slt_sge_0c9_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c9_NE_done
.Lcmov_slt_sge_0c9_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c9_NE_done:
    brult8 .Lcmov_slt_sge_0c9_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c9_ULT_done
.Lcmov_slt_sge_0c9_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c9_ULT_done:
    bruge8 .Lcmov_slt_sge_0c9_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c9_UGE_done
.Lcmov_slt_sge_0c9_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c9_UGE_done:
    brslt8 .Lcmov_slt_sge_0c9_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c9_SLT_done
.Lcmov_slt_sge_0c9_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c9_SLT_done:
    brsge8 .Lcmov_slt_sge_0c9_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0c9_SGE_done
.Lcmov_slt_sge_0c9_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0c9_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r5; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7377
    push16 r4
    ldi16 r4, 0x749a
    push16 r4
    ldi16 r4, 0x75bd
    push16 r4
    ldi16 r4, 0xb081
    push16 r4
    ldi16 r4, 0x4bee
    push16 r4
    ldi16 r4, 0x0393
    push16 r4
    ldi16 r4, 0x7a49
    push16 r4
    ldi16 r4, 0x7b6c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r5
    push16 r3
    push16 r5
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ca_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ca_EQ_done
.Lcmov_slt_sge_0ca_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ca_EQ_done:
    brne8 .Lcmov_slt_sge_0ca_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ca_NE_done
.Lcmov_slt_sge_0ca_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ca_NE_done:
    brult8 .Lcmov_slt_sge_0ca_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ca_ULT_done
.Lcmov_slt_sge_0ca_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ca_ULT_done:
    bruge8 .Lcmov_slt_sge_0ca_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ca_UGE_done
.Lcmov_slt_sge_0ca_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ca_UGE_done:
    brslt8 .Lcmov_slt_sge_0ca_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ca_SLT_done
.Lcmov_slt_sge_0ca_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ca_SLT_done:
    brsge8 .Lcmov_slt_sge_0ca_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ca_SGE_done
.Lcmov_slt_sge_0ca_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ca_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r5; path true; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x73ae
    push16 r4
    ldi16 r4, 0x74d1
    push16 r4
    ldi16 r4, 0x75f4
    push16 r4
    ldi16 r4, 0x7717
    push16 r4
    ldi16 r4, 0x4c1f
    push16 r4
    ldi16 r4, 0x03ce
    push16 r4
    ldi16 r4, 0xb3d7
    push16 r4
    ldi16 r4, 0x7ba3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r5
    push16 r6
    push16 r5
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0cb_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cb_EQ_done
.Lcmov_slt_sge_0cb_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cb_EQ_done:
    brne8 .Lcmov_slt_sge_0cb_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cb_NE_done
.Lcmov_slt_sge_0cb_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cb_NE_done:
    brult8 .Lcmov_slt_sge_0cb_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cb_ULT_done
.Lcmov_slt_sge_0cb_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cb_ULT_done:
    bruge8 .Lcmov_slt_sge_0cb_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cb_UGE_done
.Lcmov_slt_sge_0cb_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cb_UGE_done:
    brslt8 .Lcmov_slt_sge_0cb_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cb_SLT_done
.Lcmov_slt_sge_0cb_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cb_SLT_done:
    brsge8 .Lcmov_slt_sge_0cb_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cb_SGE_done
.Lcmov_slt_sge_0cb_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cb_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r6; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x73e5
    push16 r4
    ldi16 r4, 0x7508
    push16 r4
    ldi16 r4, 0x762b
    push16 r4
    ldi16 r4, 0x774e
    push16 r4
    ldi16 r4, 0x4c50
    push16 r4
    ldi16 r4, 0xb329
    push16 r4
    ldi16 r4, 0x050a
    push16 r4
    ldi16 r4, 0x7bda
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r6
    push16 r5
    push16 r6
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0cc_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cc_EQ_done
.Lcmov_slt_sge_0cc_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cc_EQ_done:
    brne8 .Lcmov_slt_sge_0cc_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cc_NE_done
.Lcmov_slt_sge_0cc_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cc_NE_done:
    brult8 .Lcmov_slt_sge_0cc_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cc_ULT_done
.Lcmov_slt_sge_0cc_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cc_ULT_done:
    bruge8 .Lcmov_slt_sge_0cc_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cc_UGE_done
.Lcmov_slt_sge_0cc_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cc_UGE_done:
    brslt8 .Lcmov_slt_sge_0cc_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cc_SLT_done
.Lcmov_slt_sge_0cc_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cc_SLT_done:
    brsge8 .Lcmov_slt_sge_0cc_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cc_SGE_done
.Lcmov_slt_sge_0cc_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cc_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r6; path true; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x741c
    push16 r4
    ldi16 r4, 0x753f
    push16 r4
    ldi16 r4, 0x7662
    push16 r4
    ldi16 r4, 0x7785
    push16 r4
    ldi16 r4, 0x4c81
    push16 r4
    ldi16 r4, 0x79cb
    push16 r4
    ldi16 r4, 0x0545
    push16 r4
    ldi16 r4, 0xb57e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r6
    push16 r7
    push16 r6
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0cd_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cd_EQ_done
.Lcmov_slt_sge_0cd_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cd_EQ_done:
    brne8 .Lcmov_slt_sge_0cd_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cd_NE_done
.Lcmov_slt_sge_0cd_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cd_NE_done:
    brult8 .Lcmov_slt_sge_0cd_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cd_ULT_done
.Lcmov_slt_sge_0cd_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cd_ULT_done:
    bruge8 .Lcmov_slt_sge_0cd_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cd_UGE_done
.Lcmov_slt_sge_0cd_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cd_UGE_done:
    brslt8 .Lcmov_slt_sge_0cd_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cd_SLT_done
.Lcmov_slt_sge_0cd_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cd_SLT_done:
    brsge8 .Lcmov_slt_sge_0cd_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cd_SGE_done
.Lcmov_slt_sge_0cd_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cd_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r7; path false; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xaeca
    push16 r4
    ldi16 r4, 0x7576
    push16 r4
    ldi16 r4, 0x7699
    push16 r4
    ldi16 r4, 0x77bc
    push16 r4
    ldi16 r4, 0x4cb2
    push16 r4
    ldi16 r4, 0x7a02
    push16 r4
    ldi16 r4, 0x7b25
    push16 r4
    ldi16 r4, 0x0681
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r7
    push16 r0
    push16 r7
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ce_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ce_EQ_done
.Lcmov_slt_sge_0ce_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ce_EQ_done:
    brne8 .Lcmov_slt_sge_0ce_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ce_NE_done
.Lcmov_slt_sge_0ce_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ce_NE_done:
    brult8 .Lcmov_slt_sge_0ce_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ce_ULT_done
.Lcmov_slt_sge_0ce_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ce_ULT_done:
    bruge8 .Lcmov_slt_sge_0ce_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ce_UGE_done
.Lcmov_slt_sge_0ce_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ce_UGE_done:
    brslt8 .Lcmov_slt_sge_0ce_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ce_SLT_done
.Lcmov_slt_sge_0ce_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ce_SLT_done:
    brsge8 .Lcmov_slt_sge_0ce_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ce_SGE_done
.Lcmov_slt_sge_0ce_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ce_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r4,r7; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xaf1d
    push16 r4
    ldi16 r4, 0x75ad
    push16 r4
    ldi16 r4, 0x76d0
    push16 r4
    ldi16 r4, 0x77f3
    push16 r4
    ldi16 r4, 0x4ce3
    push16 r4
    ldi16 r4, 0x7a39
    push16 r4
    ldi16 r4, 0x7b5c
    push16 r4
    ldi16 r4, 0x06bc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r4, r7
    push16 r0
    push16 r7
    push16 r4
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0cf_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cf_EQ_done
.Lcmov_slt_sge_0cf_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cf_EQ_done:
    brne8 .Lcmov_slt_sge_0cf_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cf_NE_done
.Lcmov_slt_sge_0cf_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cf_NE_done:
    brult8 .Lcmov_slt_sge_0cf_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cf_ULT_done
.Lcmov_slt_sge_0cf_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cf_ULT_done:
    bruge8 .Lcmov_slt_sge_0cf_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cf_UGE_done
.Lcmov_slt_sge_0cf_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cf_UGE_done:
    brslt8 .Lcmov_slt_sge_0cf_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cf_SLT_done
.Lcmov_slt_sge_0cf_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cf_SLT_done:
    brsge8 .Lcmov_slt_sge_0cf_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0cf_SGE_done
.Lcmov_slt_sge_0cf_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0cf_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r0; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xfff0
    push16 r4
    ldi16 r4, 0xb071
    push16 r4
    ldi16 r4, 0x7707
    push16 r4
    ldi16 r4, 0x782a
    push16 r4
    ldi16 r4, 0x794d
    push16 r4
    ldi16 r4, 0x4e25
    push16 r4
    ldi16 r4, 0x7b93
    push16 r4
    ldi16 r4, 0x7cb6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r0
    push16 r1
    push16 r0
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0d0_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d0_EQ_done
.Lcmov_slt_sge_0d0_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d0_EQ_done:
    brne8 .Lcmov_slt_sge_0d0_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d0_NE_done
.Lcmov_slt_sge_0d0_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d0_NE_done:
    brult8 .Lcmov_slt_sge_0d0_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d0_ULT_done
.Lcmov_slt_sge_0d0_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d0_ULT_done:
    bruge8 .Lcmov_slt_sge_0d0_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d0_UGE_done
.Lcmov_slt_sge_0d0_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d0_UGE_done:
    brslt8 .Lcmov_slt_sge_0d0_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d0_SLT_done
.Lcmov_slt_sge_0d0_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d0_SLT_done:
    brsge8 .Lcmov_slt_sge_0d0_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d0_SGE_done
.Lcmov_slt_sge_0d0_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d0_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r0; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x002b
    push16 r4
    ldi16 r4, 0x761b
    push16 r4
    ldi16 r4, 0xb1c5
    push16 r4
    ldi16 r4, 0x7861
    push16 r4
    ldi16 r4, 0x7984
    push16 r4
    ldi16 r4, 0x4e56
    push16 r4
    ldi16 r4, 0x7bca
    push16 r4
    ldi16 r4, 0x7ced
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r0
    push16 r2
    push16 r0
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0d1_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d1_EQ_done
.Lcmov_slt_sge_0d1_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d1_EQ_done:
    brne8 .Lcmov_slt_sge_0d1_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d1_NE_done
.Lcmov_slt_sge_0d1_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d1_NE_done:
    brult8 .Lcmov_slt_sge_0d1_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d1_ULT_done
.Lcmov_slt_sge_0d1_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d1_ULT_done:
    bruge8 .Lcmov_slt_sge_0d1_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d1_UGE_done
.Lcmov_slt_sge_0d1_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d1_UGE_done:
    brslt8 .Lcmov_slt_sge_0d1_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d1_SLT_done
.Lcmov_slt_sge_0d1_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d1_SLT_done:
    brsge8 .Lcmov_slt_sge_0d1_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d1_SGE_done
.Lcmov_slt_sge_0d1_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d1_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r1; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x752f
    push16 r4
    ldi16 r4, 0x0167
    push16 r4
    ldi16 r4, 0x7775
    push16 r4
    ldi16 r4, 0xb319
    push16 r4
    ldi16 r4, 0x79bb
    push16 r4
    ldi16 r4, 0x4e87
    push16 r4
    ldi16 r4, 0x7c01
    push16 r4
    ldi16 r4, 0x7d24
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r1
    push16 r3
    push16 r1
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0d2_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d2_EQ_done
.Lcmov_slt_sge_0d2_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d2_EQ_done:
    brne8 .Lcmov_slt_sge_0d2_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d2_NE_done
.Lcmov_slt_sge_0d2_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d2_NE_done:
    brult8 .Lcmov_slt_sge_0d2_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d2_ULT_done
.Lcmov_slt_sge_0d2_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d2_ULT_done:
    bruge8 .Lcmov_slt_sge_0d2_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d2_UGE_done
.Lcmov_slt_sge_0d2_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d2_UGE_done:
    brslt8 .Lcmov_slt_sge_0d2_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d2_SLT_done
.Lcmov_slt_sge_0d2_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d2_SLT_done:
    brsge8 .Lcmov_slt_sge_0d2_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d2_SGE_done
.Lcmov_slt_sge_0d2_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d2_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r1; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7566
    push16 r4
    ldi16 r4, 0x01a2
    push16 r4
    ldi16 r4, 0x77ac
    push16 r4
    ldi16 r4, 0x78cf
    push16 r4
    ldi16 r4, 0xb46d
    push16 r4
    ldi16 r4, 0x4eb8
    push16 r4
    ldi16 r4, 0x7c38
    push16 r4
    ldi16 r4, 0x7d5b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r1
    push16 r4
    push16 r1
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0d3_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d3_EQ_done
.Lcmov_slt_sge_0d3_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d3_EQ_done:
    brne8 .Lcmov_slt_sge_0d3_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d3_NE_done
.Lcmov_slt_sge_0d3_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d3_NE_done:
    brult8 .Lcmov_slt_sge_0d3_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d3_ULT_done
.Lcmov_slt_sge_0d3_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d3_ULT_done:
    bruge8 .Lcmov_slt_sge_0d3_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d3_UGE_done
.Lcmov_slt_sge_0d3_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d3_UGE_done:
    brslt8 .Lcmov_slt_sge_0d3_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d3_SLT_done
.Lcmov_slt_sge_0d3_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d3_SLT_done:
    brsge8 .Lcmov_slt_sge_0d3_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d3_SGE_done
.Lcmov_slt_sge_0d3_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d3_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r2; path false; guard r6.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x759d
    push16 r4
    ldi16 r4, 0x76c0
    push16 r4
    ldi16 r4, 0x02de
    push16 r4
    ldi16 r4, 0x7906
    push16 r4
    ldi16 r4, 0x7a29
    push16 r4
    ldi16 r4, 0x4ee9
    push16 r4
    ldi16 r4, 0xb6c2
    push16 r4
    ldi16 r4, 0x7d92
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r2
    push16 r6
    push16 r2
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0d4_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d4_EQ_done
.Lcmov_slt_sge_0d4_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d4_EQ_done:
    brne8 .Lcmov_slt_sge_0d4_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d4_NE_done
.Lcmov_slt_sge_0d4_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d4_NE_done:
    brult8 .Lcmov_slt_sge_0d4_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d4_ULT_done
.Lcmov_slt_sge_0d4_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d4_ULT_done:
    bruge8 .Lcmov_slt_sge_0d4_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d4_UGE_done
.Lcmov_slt_sge_0d4_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d4_UGE_done:
    brslt8 .Lcmov_slt_sge_0d4_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d4_SLT_done
.Lcmov_slt_sge_0d4_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d4_SLT_done:
    brsge8 .Lcmov_slt_sge_0d4_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d4_SGE_done
.Lcmov_slt_sge_0d4_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d4_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r2; path true; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x75d4
    push16 r4
    ldi16 r4, 0x76f7
    push16 r4
    ldi16 r4, 0x0319
    push16 r4
    ldi16 r4, 0x793d
    push16 r4
    ldi16 r4, 0x7a60
    push16 r4
    ldi16 r4, 0x4f1a
    push16 r4
    ldi16 r4, 0xb715
    push16 r4
    ldi16 r4, 0x7dc9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r2
    push16 r6
    push16 r2
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0d5_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d5_EQ_done
.Lcmov_slt_sge_0d5_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d5_EQ_done:
    brne8 .Lcmov_slt_sge_0d5_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d5_NE_done
.Lcmov_slt_sge_0d5_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d5_NE_done:
    brult8 .Lcmov_slt_sge_0d5_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d5_ULT_done
.Lcmov_slt_sge_0d5_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d5_ULT_done:
    bruge8 .Lcmov_slt_sge_0d5_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d5_UGE_done
.Lcmov_slt_sge_0d5_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d5_UGE_done:
    brslt8 .Lcmov_slt_sge_0d5_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d5_SLT_done
.Lcmov_slt_sge_0d5_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d5_SLT_done:
    brsge8 .Lcmov_slt_sge_0d5_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d5_SGE_done
.Lcmov_slt_sge_0d5_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d5_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r3; path false; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x760b
    push16 r4
    ldi16 r4, 0x772e
    push16 r4
    ldi16 r4, 0x7851
    push16 r4
    ldi16 r4, 0x0455
    push16 r4
    ldi16 r4, 0x7a97
    push16 r4
    ldi16 r4, 0x4f4b
    push16 r4
    ldi16 r4, 0x7cdd
    push16 r4
    ldi16 r4, 0xb869
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r3
    push16 r7
    push16 r3
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0d6_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d6_EQ_done
.Lcmov_slt_sge_0d6_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d6_EQ_done:
    brne8 .Lcmov_slt_sge_0d6_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d6_NE_done
.Lcmov_slt_sge_0d6_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d6_NE_done:
    brult8 .Lcmov_slt_sge_0d6_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d6_ULT_done
.Lcmov_slt_sge_0d6_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d6_ULT_done:
    bruge8 .Lcmov_slt_sge_0d6_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d6_UGE_done
.Lcmov_slt_sge_0d6_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d6_UGE_done:
    brslt8 .Lcmov_slt_sge_0d6_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d6_SLT_done
.Lcmov_slt_sge_0d6_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d6_SLT_done:
    brsge8 .Lcmov_slt_sge_0d6_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d6_SGE_done
.Lcmov_slt_sge_0d6_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d6_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r3; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb1b5
    push16 r4
    ldi16 r4, 0x7765
    push16 r4
    ldi16 r4, 0x7888
    push16 r4
    ldi16 r4, 0x0490
    push16 r4
    ldi16 r4, 0x7ace
    push16 r4
    ldi16 r4, 0x4f7c
    push16 r4
    ldi16 r4, 0x7d14
    push16 r4
    ldi16 r4, 0x7e37
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r3
    push16 r0
    push16 r3
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0d7_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d7_EQ_done
.Lcmov_slt_sge_0d7_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d7_EQ_done:
    brne8 .Lcmov_slt_sge_0d7_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d7_NE_done
.Lcmov_slt_sge_0d7_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d7_NE_done:
    brult8 .Lcmov_slt_sge_0d7_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d7_ULT_done
.Lcmov_slt_sge_0d7_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d7_ULT_done:
    bruge8 .Lcmov_slt_sge_0d7_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d7_UGE_done
.Lcmov_slt_sge_0d7_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d7_UGE_done:
    brslt8 .Lcmov_slt_sge_0d7_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d7_SLT_done
.Lcmov_slt_sge_0d7_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d7_SLT_done:
    brsge8 .Lcmov_slt_sge_0d7_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d7_SGE_done
.Lcmov_slt_sge_0d7_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d7_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r4; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7679
    push16 r4
    ldi16 r4, 0xb309
    push16 r4
    ldi16 r4, 0x78bf
    push16 r4
    ldi16 r4, 0x79e2
    push16 r4
    ldi16 r4, 0x05cc
    push16 r4
    ldi16 r4, 0x4fad
    push16 r4
    ldi16 r4, 0x7d4b
    push16 r4
    ldi16 r4, 0x7e6e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r4
    push16 r1
    push16 r4
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0d8_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d8_EQ_done
.Lcmov_slt_sge_0d8_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d8_EQ_done:
    brne8 .Lcmov_slt_sge_0d8_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d8_NE_done
.Lcmov_slt_sge_0d8_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d8_NE_done:
    brult8 .Lcmov_slt_sge_0d8_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d8_ULT_done
.Lcmov_slt_sge_0d8_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d8_ULT_done:
    bruge8 .Lcmov_slt_sge_0d8_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d8_UGE_done
.Lcmov_slt_sge_0d8_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d8_UGE_done:
    brslt8 .Lcmov_slt_sge_0d8_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d8_SLT_done
.Lcmov_slt_sge_0d8_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d8_SLT_done:
    brsge8 .Lcmov_slt_sge_0d8_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d8_SGE_done
.Lcmov_slt_sge_0d8_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d8_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r4; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x76b0
    push16 r4
    ldi16 r4, 0x77d3
    push16 r4
    ldi16 r4, 0xb45d
    push16 r4
    ldi16 r4, 0x7a19
    push16 r4
    ldi16 r4, 0x0607
    push16 r4
    ldi16 r4, 0x4fde
    push16 r4
    ldi16 r4, 0x7d82
    push16 r4
    ldi16 r4, 0x7ea5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r4
    push16 r2
    push16 r4
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0d9_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d9_EQ_done
.Lcmov_slt_sge_0d9_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d9_EQ_done:
    brne8 .Lcmov_slt_sge_0d9_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d9_NE_done
.Lcmov_slt_sge_0d9_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d9_NE_done:
    brult8 .Lcmov_slt_sge_0d9_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d9_ULT_done
.Lcmov_slt_sge_0d9_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d9_ULT_done:
    bruge8 .Lcmov_slt_sge_0d9_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d9_UGE_done
.Lcmov_slt_sge_0d9_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d9_UGE_done:
    brslt8 .Lcmov_slt_sge_0d9_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d9_SLT_done
.Lcmov_slt_sge_0d9_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d9_SLT_done:
    brsge8 .Lcmov_slt_sge_0d9_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0d9_SGE_done
.Lcmov_slt_sge_0d9_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0d9_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r5; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x76e7
    push16 r4
    ldi16 r4, 0x780a
    push16 r4
    ldi16 r4, 0x792d
    push16 r4
    ldi16 r4, 0xb5b1
    push16 r4
    ldi16 r4, 0x7b73
    push16 r4
    ldi16 r4, 0x500f
    push16 r4
    ldi16 r4, 0x7db9
    push16 r4
    ldi16 r4, 0x7edc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r5
    push16 r3
    push16 r5
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0da_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0da_EQ_done
.Lcmov_slt_sge_0da_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0da_EQ_done:
    brne8 .Lcmov_slt_sge_0da_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0da_NE_done
.Lcmov_slt_sge_0da_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0da_NE_done:
    brult8 .Lcmov_slt_sge_0da_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0da_ULT_done
.Lcmov_slt_sge_0da_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0da_ULT_done:
    bruge8 .Lcmov_slt_sge_0da_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0da_UGE_done
.Lcmov_slt_sge_0da_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0da_UGE_done:
    brslt8 .Lcmov_slt_sge_0da_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0da_SLT_done
.Lcmov_slt_sge_0da_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0da_SLT_done:
    brsge8 .Lcmov_slt_sge_0da_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0da_SGE_done
.Lcmov_slt_sge_0da_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0da_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r5; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x771e
    push16 r4
    ldi16 r4, 0x7841
    push16 r4
    ldi16 r4, 0x7964
    push16 r4
    ldi16 r4, 0x7a87
    push16 r4
    ldi16 r4, 0xb705
    push16 r4
    ldi16 r4, 0x5040
    push16 r4
    ldi16 r4, 0x7df0
    push16 r4
    ldi16 r4, 0x7f13
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r5
    push16 r4
    push16 r5
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0db_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0db_EQ_done
.Lcmov_slt_sge_0db_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0db_EQ_done:
    brne8 .Lcmov_slt_sge_0db_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0db_NE_done
.Lcmov_slt_sge_0db_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0db_NE_done:
    brult8 .Lcmov_slt_sge_0db_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0db_ULT_done
.Lcmov_slt_sge_0db_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0db_ULT_done:
    bruge8 .Lcmov_slt_sge_0db_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0db_UGE_done
.Lcmov_slt_sge_0db_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0db_UGE_done:
    brslt8 .Lcmov_slt_sge_0db_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0db_SLT_done
.Lcmov_slt_sge_0db_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0db_SLT_done:
    brsge8 .Lcmov_slt_sge_0db_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0db_SGE_done
.Lcmov_slt_sge_0db_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0db_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r6; path false; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7755
    push16 r4
    ldi16 r4, 0x7878
    push16 r4
    ldi16 r4, 0x799b
    push16 r4
    ldi16 r4, 0x7abe
    push16 r4
    ldi16 r4, 0x7be1
    push16 r4
    ldi16 r4, 0x5071
    push16 r4
    ldi16 r4, 0x08ba
    push16 r4
    ldi16 r4, 0xba5b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r6
    push16 r7
    push16 r6
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0dc_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dc_EQ_done
.Lcmov_slt_sge_0dc_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dc_EQ_done:
    brne8 .Lcmov_slt_sge_0dc_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dc_NE_done
.Lcmov_slt_sge_0dc_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dc_NE_done:
    brult8 .Lcmov_slt_sge_0dc_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dc_ULT_done
.Lcmov_slt_sge_0dc_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dc_ULT_done:
    bruge8 .Lcmov_slt_sge_0dc_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dc_UGE_done
.Lcmov_slt_sge_0dc_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dc_UGE_done:
    brslt8 .Lcmov_slt_sge_0dc_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dc_SLT_done
.Lcmov_slt_sge_0dc_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dc_SLT_done:
    brsge8 .Lcmov_slt_sge_0dc_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dc_SGE_done
.Lcmov_slt_sge_0dc_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dc_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r6; path true; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x778c
    push16 r4
    ldi16 r4, 0x78af
    push16 r4
    ldi16 r4, 0x79d2
    push16 r4
    ldi16 r4, 0x7af5
    push16 r4
    ldi16 r4, 0x7c18
    push16 r4
    ldi16 r4, 0x50a2
    push16 r4
    ldi16 r4, 0x08f5
    push16 r4
    ldi16 r4, 0xbaae
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r6
    push16 r7
    push16 r6
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0dd_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dd_EQ_done
.Lcmov_slt_sge_0dd_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dd_EQ_done:
    brne8 .Lcmov_slt_sge_0dd_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dd_NE_done
.Lcmov_slt_sge_0dd_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dd_NE_done:
    brult8 .Lcmov_slt_sge_0dd_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dd_ULT_done
.Lcmov_slt_sge_0dd_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dd_ULT_done:
    bruge8 .Lcmov_slt_sge_0dd_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dd_UGE_done
.Lcmov_slt_sge_0dd_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dd_UGE_done:
    brslt8 .Lcmov_slt_sge_0dd_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dd_SLT_done
.Lcmov_slt_sge_0dd_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dd_SLT_done:
    brsge8 .Lcmov_slt_sge_0dd_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0dd_SGE_done
.Lcmov_slt_sge_0dd_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0dd_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r7; path false; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb3fa
    push16 r4
    ldi16 r4, 0x78e6
    push16 r4
    ldi16 r4, 0x7a09
    push16 r4
    ldi16 r4, 0x7b2c
    push16 r4
    ldi16 r4, 0x7c4f
    push16 r4
    ldi16 r4, 0x50d3
    push16 r4
    ldi16 r4, 0x7e95
    push16 r4
    ldi16 r4, 0x0a31
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r7
    push16 r0
    push16 r7
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0de_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0de_EQ_done
.Lcmov_slt_sge_0de_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0de_EQ_done:
    brne8 .Lcmov_slt_sge_0de_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0de_NE_done
.Lcmov_slt_sge_0de_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0de_NE_done:
    brult8 .Lcmov_slt_sge_0de_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0de_ULT_done
.Lcmov_slt_sge_0de_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0de_ULT_done:
    bruge8 .Lcmov_slt_sge_0de_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0de_UGE_done
.Lcmov_slt_sge_0de_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0de_UGE_done:
    brslt8 .Lcmov_slt_sge_0de_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0de_SLT_done
.Lcmov_slt_sge_0de_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0de_SLT_done:
    brsge8 .Lcmov_slt_sge_0de_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0de_SGE_done
.Lcmov_slt_sge_0de_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0de_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r5,r7; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb44d
    push16 r4
    ldi16 r4, 0x791d
    push16 r4
    ldi16 r4, 0x7a40
    push16 r4
    ldi16 r4, 0x7b63
    push16 r4
    ldi16 r4, 0x7c86
    push16 r4
    ldi16 r4, 0x5104
    push16 r4
    ldi16 r4, 0x7ecc
    push16 r4
    ldi16 r4, 0x0a6c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r5, r7
    push16 r0
    push16 r7
    push16 r5
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0df_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0df_EQ_done
.Lcmov_slt_sge_0df_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0df_EQ_done:
    brne8 .Lcmov_slt_sge_0df_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0df_NE_done
.Lcmov_slt_sge_0df_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0df_NE_done:
    brult8 .Lcmov_slt_sge_0df_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0df_ULT_done
.Lcmov_slt_sge_0df_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0df_ULT_done:
    bruge8 .Lcmov_slt_sge_0df_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0df_UGE_done
.Lcmov_slt_sge_0df_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0df_UGE_done:
    brslt8 .Lcmov_slt_sge_0df_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0df_SLT_done
.Lcmov_slt_sge_0df_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0df_SLT_done:
    brsge8 .Lcmov_slt_sge_0df_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0df_SGE_done
.Lcmov_slt_sge_0df_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0df_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r0; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x03a0
    push16 r4
    ldi16 r4, 0xb5a1
    push16 r4
    ldi16 r4, 0x7a77
    push16 r4
    ldi16 r4, 0x7b9a
    push16 r4
    ldi16 r4, 0x7cbd
    push16 r4
    ldi16 r4, 0x7de0
    push16 r4
    ldi16 r4, 0x5246
    push16 r4
    ldi16 r4, 0x8026
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r0
    push16 r1
    push16 r0
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0e0_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e0_EQ_done
.Lcmov_slt_sge_0e0_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e0_EQ_done:
    brne8 .Lcmov_slt_sge_0e0_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e0_NE_done
.Lcmov_slt_sge_0e0_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e0_NE_done:
    brult8 .Lcmov_slt_sge_0e0_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e0_ULT_done
.Lcmov_slt_sge_0e0_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e0_ULT_done:
    bruge8 .Lcmov_slt_sge_0e0_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e0_UGE_done
.Lcmov_slt_sge_0e0_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e0_UGE_done:
    brslt8 .Lcmov_slt_sge_0e0_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e0_SLT_done
.Lcmov_slt_sge_0e0_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e0_SLT_done:
    brsge8 .Lcmov_slt_sge_0e0_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e0_SGE_done
.Lcmov_slt_sge_0e0_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e0_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r0; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x03db
    push16 r4
    ldi16 r4, 0x798b
    push16 r4
    ldi16 r4, 0xb6f5
    push16 r4
    ldi16 r4, 0x7bd1
    push16 r4
    ldi16 r4, 0x7cf4
    push16 r4
    ldi16 r4, 0x7e17
    push16 r4
    ldi16 r4, 0x5277
    push16 r4
    ldi16 r4, 0x805d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r0
    push16 r2
    push16 r0
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0e1_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e1_EQ_done
.Lcmov_slt_sge_0e1_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e1_EQ_done:
    brne8 .Lcmov_slt_sge_0e1_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e1_NE_done
.Lcmov_slt_sge_0e1_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e1_NE_done:
    brult8 .Lcmov_slt_sge_0e1_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e1_ULT_done
.Lcmov_slt_sge_0e1_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e1_ULT_done:
    bruge8 .Lcmov_slt_sge_0e1_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e1_UGE_done
.Lcmov_slt_sge_0e1_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e1_UGE_done:
    brslt8 .Lcmov_slt_sge_0e1_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e1_SLT_done
.Lcmov_slt_sge_0e1_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e1_SLT_done:
    brsge8 .Lcmov_slt_sge_0e1_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e1_SGE_done
.Lcmov_slt_sge_0e1_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e1_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r1; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x789f
    push16 r4
    ldi16 r4, 0x0517
    push16 r4
    ldi16 r4, 0x7ae5
    push16 r4
    ldi16 r4, 0xb849
    push16 r4
    ldi16 r4, 0x7d2b
    push16 r4
    ldi16 r4, 0x7e4e
    push16 r4
    ldi16 r4, 0x52a8
    push16 r4
    ldi16 r4, 0x8094
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r1
    push16 r3
    push16 r1
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0e2_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e2_EQ_done
.Lcmov_slt_sge_0e2_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e2_EQ_done:
    brne8 .Lcmov_slt_sge_0e2_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e2_NE_done
.Lcmov_slt_sge_0e2_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e2_NE_done:
    brult8 .Lcmov_slt_sge_0e2_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e2_ULT_done
.Lcmov_slt_sge_0e2_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e2_ULT_done:
    bruge8 .Lcmov_slt_sge_0e2_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e2_UGE_done
.Lcmov_slt_sge_0e2_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e2_UGE_done:
    brslt8 .Lcmov_slt_sge_0e2_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e2_SLT_done
.Lcmov_slt_sge_0e2_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e2_SLT_done:
    brsge8 .Lcmov_slt_sge_0e2_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e2_SGE_done
.Lcmov_slt_sge_0e2_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e2_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r1; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x78d6
    push16 r4
    ldi16 r4, 0x0552
    push16 r4
    ldi16 r4, 0x7b1c
    push16 r4
    ldi16 r4, 0x7c3f
    push16 r4
    ldi16 r4, 0xb99d
    push16 r4
    ldi16 r4, 0x7e85
    push16 r4
    ldi16 r4, 0x52d9
    push16 r4
    ldi16 r4, 0x80cb
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r1
    push16 r4
    push16 r1
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0e3_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e3_EQ_done
.Lcmov_slt_sge_0e3_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e3_EQ_done:
    brne8 .Lcmov_slt_sge_0e3_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e3_NE_done
.Lcmov_slt_sge_0e3_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e3_NE_done:
    brult8 .Lcmov_slt_sge_0e3_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e3_ULT_done
.Lcmov_slt_sge_0e3_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e3_ULT_done:
    bruge8 .Lcmov_slt_sge_0e3_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e3_UGE_done
.Lcmov_slt_sge_0e3_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e3_UGE_done:
    brslt8 .Lcmov_slt_sge_0e3_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e3_SLT_done
.Lcmov_slt_sge_0e3_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e3_SLT_done:
    brsge8 .Lcmov_slt_sge_0e3_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e3_SGE_done
.Lcmov_slt_sge_0e3_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e3_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r2; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x790d
    push16 r4
    ldi16 r4, 0x7a30
    push16 r4
    ldi16 r4, 0x068e
    push16 r4
    ldi16 r4, 0x7c76
    push16 r4
    ldi16 r4, 0x7d99
    push16 r4
    ldi16 r4, 0xbaf1
    push16 r4
    ldi16 r4, 0x530a
    push16 r4
    ldi16 r4, 0x8102
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r2
    push16 r5
    push16 r2
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0e4_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e4_EQ_done
.Lcmov_slt_sge_0e4_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e4_EQ_done:
    brne8 .Lcmov_slt_sge_0e4_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e4_NE_done
.Lcmov_slt_sge_0e4_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e4_NE_done:
    brult8 .Lcmov_slt_sge_0e4_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e4_ULT_done
.Lcmov_slt_sge_0e4_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e4_ULT_done:
    bruge8 .Lcmov_slt_sge_0e4_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e4_UGE_done
.Lcmov_slt_sge_0e4_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e4_UGE_done:
    brslt8 .Lcmov_slt_sge_0e4_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e4_SLT_done
.Lcmov_slt_sge_0e4_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e4_SLT_done:
    brsge8 .Lcmov_slt_sge_0e4_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e4_SGE_done
.Lcmov_slt_sge_0e4_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e4_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r2; path true; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7944
    push16 r4
    ldi16 r4, 0x7a67
    push16 r4
    ldi16 r4, 0x06c9
    push16 r4
    ldi16 r4, 0x7cad
    push16 r4
    ldi16 r4, 0x7dd0
    push16 r4
    ldi16 r4, 0x7ef3
    push16 r4
    ldi16 r4, 0x533b
    push16 r4
    ldi16 r4, 0xbd46
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r2
    push16 r7
    push16 r2
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0e5_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e5_EQ_done
.Lcmov_slt_sge_0e5_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e5_EQ_done:
    brne8 .Lcmov_slt_sge_0e5_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e5_NE_done
.Lcmov_slt_sge_0e5_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e5_NE_done:
    brult8 .Lcmov_slt_sge_0e5_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e5_ULT_done
.Lcmov_slt_sge_0e5_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e5_ULT_done:
    bruge8 .Lcmov_slt_sge_0e5_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e5_UGE_done
.Lcmov_slt_sge_0e5_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e5_UGE_done:
    brslt8 .Lcmov_slt_sge_0e5_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e5_SLT_done
.Lcmov_slt_sge_0e5_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e5_SLT_done:
    brsge8 .Lcmov_slt_sge_0e5_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e5_SGE_done
.Lcmov_slt_sge_0e5_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e5_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r3; path false; guard r7.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x797b
    push16 r4
    ldi16 r4, 0x7a9e
    push16 r4
    ldi16 r4, 0x7bc1
    push16 r4
    ldi16 r4, 0x0805
    push16 r4
    ldi16 r4, 0x7e07
    push16 r4
    ldi16 r4, 0x7f2a
    push16 r4
    ldi16 r4, 0x536c
    push16 r4
    ldi16 r4, 0xbd99
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r3
    push16 r7
    push16 r3
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0e6_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e6_EQ_done
.Lcmov_slt_sge_0e6_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e6_EQ_done:
    brne8 .Lcmov_slt_sge_0e6_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e6_NE_done
.Lcmov_slt_sge_0e6_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e6_NE_done:
    brult8 .Lcmov_slt_sge_0e6_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e6_ULT_done
.Lcmov_slt_sge_0e6_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e6_ULT_done:
    bruge8 .Lcmov_slt_sge_0e6_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e6_UGE_done
.Lcmov_slt_sge_0e6_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e6_UGE_done:
    brslt8 .Lcmov_slt_sge_0e6_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e6_SLT_done
.Lcmov_slt_sge_0e6_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e6_SLT_done:
    brsge8 .Lcmov_slt_sge_0e6_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e6_SGE_done
.Lcmov_slt_sge_0e6_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e6_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r3; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb6e5
    push16 r4
    ldi16 r4, 0x7ad5
    push16 r4
    ldi16 r4, 0x7bf8
    push16 r4
    ldi16 r4, 0x0840
    push16 r4
    ldi16 r4, 0x7e3e
    push16 r4
    ldi16 r4, 0x7f61
    push16 r4
    ldi16 r4, 0x539d
    push16 r4
    ldi16 r4, 0x81a7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r3
    push16 r0
    push16 r3
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0e7_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e7_EQ_done
.Lcmov_slt_sge_0e7_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e7_EQ_done:
    brne8 .Lcmov_slt_sge_0e7_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e7_NE_done
.Lcmov_slt_sge_0e7_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e7_NE_done:
    brult8 .Lcmov_slt_sge_0e7_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e7_ULT_done
.Lcmov_slt_sge_0e7_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e7_ULT_done:
    bruge8 .Lcmov_slt_sge_0e7_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e7_UGE_done
.Lcmov_slt_sge_0e7_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e7_UGE_done:
    brslt8 .Lcmov_slt_sge_0e7_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e7_SLT_done
.Lcmov_slt_sge_0e7_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e7_SLT_done:
    brsge8 .Lcmov_slt_sge_0e7_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e7_SGE_done
.Lcmov_slt_sge_0e7_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e7_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r4; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x79e9
    push16 r4
    ldi16 r4, 0xb839
    push16 r4
    ldi16 r4, 0x7c2f
    push16 r4
    ldi16 r4, 0x7d52
    push16 r4
    ldi16 r4, 0x097c
    push16 r4
    ldi16 r4, 0x7f98
    push16 r4
    ldi16 r4, 0x53ce
    push16 r4
    ldi16 r4, 0x81de
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r4
    push16 r1
    push16 r4
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0e8_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e8_EQ_done
.Lcmov_slt_sge_0e8_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e8_EQ_done:
    brne8 .Lcmov_slt_sge_0e8_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e8_NE_done
.Lcmov_slt_sge_0e8_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e8_NE_done:
    brult8 .Lcmov_slt_sge_0e8_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e8_ULT_done
.Lcmov_slt_sge_0e8_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e8_ULT_done:
    bruge8 .Lcmov_slt_sge_0e8_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e8_UGE_done
.Lcmov_slt_sge_0e8_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e8_UGE_done:
    brslt8 .Lcmov_slt_sge_0e8_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e8_SLT_done
.Lcmov_slt_sge_0e8_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e8_SLT_done:
    brsge8 .Lcmov_slt_sge_0e8_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e8_SGE_done
.Lcmov_slt_sge_0e8_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e8_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r4; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7a20
    push16 r4
    ldi16 r4, 0x7b43
    push16 r4
    ldi16 r4, 0xb98d
    push16 r4
    ldi16 r4, 0x7d89
    push16 r4
    ldi16 r4, 0x09b7
    push16 r4
    ldi16 r4, 0x7fcf
    push16 r4
    ldi16 r4, 0x53ff
    push16 r4
    ldi16 r4, 0x8215
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r4
    push16 r2
    push16 r4
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0e9_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e9_EQ_done
.Lcmov_slt_sge_0e9_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e9_EQ_done:
    brne8 .Lcmov_slt_sge_0e9_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e9_NE_done
.Lcmov_slt_sge_0e9_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e9_NE_done:
    brult8 .Lcmov_slt_sge_0e9_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e9_ULT_done
.Lcmov_slt_sge_0e9_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e9_ULT_done:
    bruge8 .Lcmov_slt_sge_0e9_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e9_UGE_done
.Lcmov_slt_sge_0e9_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e9_UGE_done:
    brslt8 .Lcmov_slt_sge_0e9_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e9_SLT_done
.Lcmov_slt_sge_0e9_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e9_SLT_done:
    brsge8 .Lcmov_slt_sge_0e9_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0e9_SGE_done
.Lcmov_slt_sge_0e9_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0e9_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r5; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7a57
    push16 r4
    ldi16 r4, 0x7b7a
    push16 r4
    ldi16 r4, 0x7c9d
    push16 r4
    ldi16 r4, 0xbae1
    push16 r4
    ldi16 r4, 0x7ee3
    push16 r4
    ldi16 r4, 0x0af3
    push16 r4
    ldi16 r4, 0x5430
    push16 r4
    ldi16 r4, 0x824c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r5
    push16 r3
    push16 r5
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ea_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ea_EQ_done
.Lcmov_slt_sge_0ea_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ea_EQ_done:
    brne8 .Lcmov_slt_sge_0ea_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ea_NE_done
.Lcmov_slt_sge_0ea_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ea_NE_done:
    brult8 .Lcmov_slt_sge_0ea_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ea_ULT_done
.Lcmov_slt_sge_0ea_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ea_ULT_done:
    bruge8 .Lcmov_slt_sge_0ea_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ea_UGE_done
.Lcmov_slt_sge_0ea_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ea_UGE_done:
    brslt8 .Lcmov_slt_sge_0ea_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ea_SLT_done
.Lcmov_slt_sge_0ea_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ea_SLT_done:
    brsge8 .Lcmov_slt_sge_0ea_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ea_SGE_done
.Lcmov_slt_sge_0ea_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ea_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r5; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7a8e
    push16 r4
    ldi16 r4, 0x7bb1
    push16 r4
    ldi16 r4, 0x7cd4
    push16 r4
    ldi16 r4, 0x7df7
    push16 r4
    ldi16 r4, 0xbc35
    push16 r4
    ldi16 r4, 0x0b2e
    push16 r4
    ldi16 r4, 0x5461
    push16 r4
    ldi16 r4, 0x8283
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r5
    push16 r4
    push16 r5
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0eb_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0eb_EQ_done
.Lcmov_slt_sge_0eb_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0eb_EQ_done:
    brne8 .Lcmov_slt_sge_0eb_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0eb_NE_done
.Lcmov_slt_sge_0eb_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0eb_NE_done:
    brult8 .Lcmov_slt_sge_0eb_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0eb_ULT_done
.Lcmov_slt_sge_0eb_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0eb_ULT_done:
    bruge8 .Lcmov_slt_sge_0eb_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0eb_UGE_done
.Lcmov_slt_sge_0eb_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0eb_UGE_done:
    brslt8 .Lcmov_slt_sge_0eb_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0eb_SLT_done
.Lcmov_slt_sge_0eb_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0eb_SLT_done:
    brsge8 .Lcmov_slt_sge_0eb_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0eb_SGE_done
.Lcmov_slt_sge_0eb_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0eb_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r6; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7ac5
    push16 r4
    ldi16 r4, 0x7be8
    push16 r4
    ldi16 r4, 0x7d0b
    push16 r4
    ldi16 r4, 0x7e2e
    push16 r4
    ldi16 r4, 0x7f51
    push16 r4
    ldi16 r4, 0xbd89
    push16 r4
    ldi16 r4, 0x5492
    push16 r4
    ldi16 r4, 0x82ba
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r6
    push16 r5
    push16 r6
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ec_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ec_EQ_done
.Lcmov_slt_sge_0ec_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ec_EQ_done:
    brne8 .Lcmov_slt_sge_0ec_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ec_NE_done
.Lcmov_slt_sge_0ec_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ec_NE_done:
    brult8 .Lcmov_slt_sge_0ec_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ec_ULT_done
.Lcmov_slt_sge_0ec_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ec_ULT_done:
    bruge8 .Lcmov_slt_sge_0ec_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ec_UGE_done
.Lcmov_slt_sge_0ec_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ec_UGE_done:
    brslt8 .Lcmov_slt_sge_0ec_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ec_SLT_done
.Lcmov_slt_sge_0ec_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ec_SLT_done:
    brsge8 .Lcmov_slt_sge_0ec_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ec_SGE_done
.Lcmov_slt_sge_0ec_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ec_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r6; path true; guard r7.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7afc
    push16 r4
    ldi16 r4, 0x7c1f
    push16 r4
    ldi16 r4, 0x7d42
    push16 r4
    ldi16 r4, 0x7e65
    push16 r4
    ldi16 r4, 0x7f88
    push16 r4
    ldi16 r4, 0x80ab
    push16 r4
    ldi16 r4, 0x54c3
    push16 r4
    ldi16 r4, 0xbfde
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r6
    push16 r7
    push16 r6
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ed_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ed_EQ_done
.Lcmov_slt_sge_0ed_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ed_EQ_done:
    brne8 .Lcmov_slt_sge_0ed_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ed_NE_done
.Lcmov_slt_sge_0ed_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ed_NE_done:
    brult8 .Lcmov_slt_sge_0ed_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ed_ULT_done
.Lcmov_slt_sge_0ed_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ed_ULT_done:
    bruge8 .Lcmov_slt_sge_0ed_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ed_UGE_done
.Lcmov_slt_sge_0ed_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ed_UGE_done:
    brslt8 .Lcmov_slt_sge_0ed_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ed_SLT_done
.Lcmov_slt_sge_0ed_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ed_SLT_done:
    brsge8 .Lcmov_slt_sge_0ed_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ed_SGE_done
.Lcmov_slt_sge_0ed_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ed_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r7; path false; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xb92a
    push16 r4
    ldi16 r4, 0x7c56
    push16 r4
    ldi16 r4, 0x7d79
    push16 r4
    ldi16 r4, 0x7e9c
    push16 r4
    ldi16 r4, 0x7fbf
    push16 r4
    ldi16 r4, 0x80e2
    push16 r4
    ldi16 r4, 0x54f4
    push16 r4
    ldi16 r4, 0x0de1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r7
    push16 r0
    push16 r7
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ee_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ee_EQ_done
.Lcmov_slt_sge_0ee_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ee_EQ_done:
    brne8 .Lcmov_slt_sge_0ee_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ee_NE_done
.Lcmov_slt_sge_0ee_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ee_NE_done:
    brult8 .Lcmov_slt_sge_0ee_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ee_ULT_done
.Lcmov_slt_sge_0ee_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ee_ULT_done:
    bruge8 .Lcmov_slt_sge_0ee_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ee_UGE_done
.Lcmov_slt_sge_0ee_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ee_UGE_done:
    brslt8 .Lcmov_slt_sge_0ee_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ee_SLT_done
.Lcmov_slt_sge_0ee_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ee_SLT_done:
    brsge8 .Lcmov_slt_sge_0ee_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ee_SGE_done
.Lcmov_slt_sge_0ee_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ee_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r6,r7; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xb97d
    push16 r4
    ldi16 r4, 0x7c8d
    push16 r4
    ldi16 r4, 0x7db0
    push16 r4
    ldi16 r4, 0x7ed3
    push16 r4
    ldi16 r4, 0x7ff6
    push16 r4
    ldi16 r4, 0x8119
    push16 r4
    ldi16 r4, 0x5525
    push16 r4
    ldi16 r4, 0x0e1c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r6, r7
    push16 r0
    push16 r7
    push16 r6
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ef_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ef_EQ_done
.Lcmov_slt_sge_0ef_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ef_EQ_done:
    brne8 .Lcmov_slt_sge_0ef_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ef_NE_done
.Lcmov_slt_sge_0ef_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ef_NE_done:
    brult8 .Lcmov_slt_sge_0ef_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ef_ULT_done
.Lcmov_slt_sge_0ef_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ef_ULT_done:
    bruge8 .Lcmov_slt_sge_0ef_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ef_UGE_done
.Lcmov_slt_sge_0ef_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ef_UGE_done:
    brslt8 .Lcmov_slt_sge_0ef_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ef_SLT_done
.Lcmov_slt_sge_0ef_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ef_SLT_done:
    brsge8 .Lcmov_slt_sge_0ef_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ef_SGE_done
.Lcmov_slt_sge_0ef_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ef_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r0; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0750
    push16 r4
    ldi16 r4, 0xbad1
    push16 r4
    ldi16 r4, 0x7de7
    push16 r4
    ldi16 r4, 0x7f0a
    push16 r4
    ldi16 r4, 0x802d
    push16 r4
    ldi16 r4, 0x8150
    push16 r4
    ldi16 r4, 0x8273
    push16 r4
    ldi16 r4, 0x5667
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r0
    push16 r1
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0f0_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f0_EQ_done
.Lcmov_slt_sge_0f0_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f0_EQ_done:
    brne8 .Lcmov_slt_sge_0f0_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f0_NE_done
.Lcmov_slt_sge_0f0_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f0_NE_done:
    brult8 .Lcmov_slt_sge_0f0_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f0_ULT_done
.Lcmov_slt_sge_0f0_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f0_ULT_done:
    bruge8 .Lcmov_slt_sge_0f0_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f0_UGE_done
.Lcmov_slt_sge_0f0_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f0_UGE_done:
    brslt8 .Lcmov_slt_sge_0f0_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f0_SLT_done
.Lcmov_slt_sge_0f0_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f0_SLT_done:
    brsge8 .Lcmov_slt_sge_0f0_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f0_SGE_done
.Lcmov_slt_sge_0f0_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f0_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r0; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x078b
    push16 r4
    ldi16 r4, 0x7cfb
    push16 r4
    ldi16 r4, 0xbc25
    push16 r4
    ldi16 r4, 0x7f41
    push16 r4
    ldi16 r4, 0x8064
    push16 r4
    ldi16 r4, 0x8187
    push16 r4
    ldi16 r4, 0x82aa
    push16 r4
    ldi16 r4, 0x5698
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r0
    push16 r2
    push16 r0
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0f1_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f1_EQ_done
.Lcmov_slt_sge_0f1_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f1_EQ_done:
    brne8 .Lcmov_slt_sge_0f1_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f1_NE_done
.Lcmov_slt_sge_0f1_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f1_NE_done:
    brult8 .Lcmov_slt_sge_0f1_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f1_ULT_done
.Lcmov_slt_sge_0f1_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f1_ULT_done:
    bruge8 .Lcmov_slt_sge_0f1_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f1_UGE_done
.Lcmov_slt_sge_0f1_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f1_UGE_done:
    brslt8 .Lcmov_slt_sge_0f1_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f1_SLT_done
.Lcmov_slt_sge_0f1_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f1_SLT_done:
    brsge8 .Lcmov_slt_sge_0f1_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f1_SGE_done
.Lcmov_slt_sge_0f1_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f1_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r1; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7c0f
    push16 r4
    ldi16 r4, 0x08c7
    push16 r4
    ldi16 r4, 0x7e55
    push16 r4
    ldi16 r4, 0xbd79
    push16 r4
    ldi16 r4, 0x809b
    push16 r4
    ldi16 r4, 0x81be
    push16 r4
    ldi16 r4, 0x82e1
    push16 r4
    ldi16 r4, 0x56c9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r1
    push16 r3
    push16 r1
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0f2_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f2_EQ_done
.Lcmov_slt_sge_0f2_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f2_EQ_done:
    brne8 .Lcmov_slt_sge_0f2_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f2_NE_done
.Lcmov_slt_sge_0f2_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f2_NE_done:
    brult8 .Lcmov_slt_sge_0f2_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f2_ULT_done
.Lcmov_slt_sge_0f2_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f2_ULT_done:
    bruge8 .Lcmov_slt_sge_0f2_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f2_UGE_done
.Lcmov_slt_sge_0f2_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f2_UGE_done:
    brslt8 .Lcmov_slt_sge_0f2_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f2_SLT_done
.Lcmov_slt_sge_0f2_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f2_SLT_done:
    brsge8 .Lcmov_slt_sge_0f2_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f2_SGE_done
.Lcmov_slt_sge_0f2_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f2_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r1; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7c46
    push16 r4
    ldi16 r4, 0x0902
    push16 r4
    ldi16 r4, 0x7e8c
    push16 r4
    ldi16 r4, 0x7faf
    push16 r4
    ldi16 r4, 0xbecd
    push16 r4
    ldi16 r4, 0x81f5
    push16 r4
    ldi16 r4, 0x8318
    push16 r4
    ldi16 r4, 0x56fa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r1
    push16 r4
    push16 r1
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0f3_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f3_EQ_done
.Lcmov_slt_sge_0f3_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f3_EQ_done:
    brne8 .Lcmov_slt_sge_0f3_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f3_NE_done
.Lcmov_slt_sge_0f3_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f3_NE_done:
    brult8 .Lcmov_slt_sge_0f3_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f3_ULT_done
.Lcmov_slt_sge_0f3_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f3_ULT_done:
    bruge8 .Lcmov_slt_sge_0f3_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f3_UGE_done
.Lcmov_slt_sge_0f3_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f3_UGE_done:
    brslt8 .Lcmov_slt_sge_0f3_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f3_SLT_done
.Lcmov_slt_sge_0f3_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f3_SLT_done:
    brsge8 .Lcmov_slt_sge_0f3_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f3_SGE_done
.Lcmov_slt_sge_0f3_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f3_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r2; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7c7d
    push16 r4
    ldi16 r4, 0x7da0
    push16 r4
    ldi16 r4, 0x0a3e
    push16 r4
    ldi16 r4, 0x7fe6
    push16 r4
    ldi16 r4, 0x8109
    push16 r4
    ldi16 r4, 0xc021
    push16 r4
    ldi16 r4, 0x834f
    push16 r4
    ldi16 r4, 0x572b
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r2
    push16 r5
    push16 r2
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0f4_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f4_EQ_done
.Lcmov_slt_sge_0f4_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f4_EQ_done:
    brne8 .Lcmov_slt_sge_0f4_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f4_NE_done
.Lcmov_slt_sge_0f4_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f4_NE_done:
    brult8 .Lcmov_slt_sge_0f4_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f4_ULT_done
.Lcmov_slt_sge_0f4_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f4_ULT_done:
    bruge8 .Lcmov_slt_sge_0f4_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f4_UGE_done
.Lcmov_slt_sge_0f4_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f4_UGE_done:
    brslt8 .Lcmov_slt_sge_0f4_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f4_SLT_done
.Lcmov_slt_sge_0f4_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f4_SLT_done:
    brsge8 .Lcmov_slt_sge_0f4_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f4_SGE_done
.Lcmov_slt_sge_0f4_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f4_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r2; path true; guard r6.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7cb4
    push16 r4
    ldi16 r4, 0x7dd7
    push16 r4
    ldi16 r4, 0x0a79
    push16 r4
    ldi16 r4, 0x801d
    push16 r4
    ldi16 r4, 0x8140
    push16 r4
    ldi16 r4, 0x8263
    push16 r4
    ldi16 r4, 0xc175
    push16 r4
    ldi16 r4, 0x575c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r2
    push16 r6
    push16 r2
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0f5_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f5_EQ_done
.Lcmov_slt_sge_0f5_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f5_EQ_done:
    brne8 .Lcmov_slt_sge_0f5_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f5_NE_done
.Lcmov_slt_sge_0f5_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f5_NE_done:
    brult8 .Lcmov_slt_sge_0f5_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f5_ULT_done
.Lcmov_slt_sge_0f5_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f5_ULT_done:
    bruge8 .Lcmov_slt_sge_0f5_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f5_UGE_done
.Lcmov_slt_sge_0f5_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f5_UGE_done:
    brslt8 .Lcmov_slt_sge_0f5_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f5_SLT_done
.Lcmov_slt_sge_0f5_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f5_SLT_done:
    brsge8 .Lcmov_slt_sge_0f5_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f5_SGE_done
.Lcmov_slt_sge_0f5_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f5_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r3; path false; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xbbc2
    push16 r4
    ldi16 r4, 0x7e0e
    push16 r4
    ldi16 r4, 0x7f31
    push16 r4
    ldi16 r4, 0x0bb5
    push16 r4
    ldi16 r4, 0x8177
    push16 r4
    ldi16 r4, 0x829a
    push16 r4
    ldi16 r4, 0x83bd
    push16 r4
    ldi16 r4, 0x578d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r3
    push16 r0
    push16 r3
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0f6_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f6_EQ_done
.Lcmov_slt_sge_0f6_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f6_EQ_done:
    brne8 .Lcmov_slt_sge_0f6_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f6_NE_done
.Lcmov_slt_sge_0f6_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f6_NE_done:
    brult8 .Lcmov_slt_sge_0f6_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f6_ULT_done
.Lcmov_slt_sge_0f6_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f6_ULT_done:
    bruge8 .Lcmov_slt_sge_0f6_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f6_UGE_done
.Lcmov_slt_sge_0f6_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f6_UGE_done:
    brslt8 .Lcmov_slt_sge_0f6_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f6_SLT_done
.Lcmov_slt_sge_0f6_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f6_SLT_done:
    brsge8 .Lcmov_slt_sge_0f6_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f6_SGE_done
.Lcmov_slt_sge_0f6_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f6_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r3; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xbc15
    push16 r4
    ldi16 r4, 0x7e45
    push16 r4
    ldi16 r4, 0x7f68
    push16 r4
    ldi16 r4, 0x0bf0
    push16 r4
    ldi16 r4, 0x81ae
    push16 r4
    ldi16 r4, 0x82d1
    push16 r4
    ldi16 r4, 0x83f4
    push16 r4
    ldi16 r4, 0x57be
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r3
    push16 r0
    push16 r3
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0f7_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f7_EQ_done
.Lcmov_slt_sge_0f7_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f7_EQ_done:
    brne8 .Lcmov_slt_sge_0f7_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f7_NE_done
.Lcmov_slt_sge_0f7_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f7_NE_done:
    brult8 .Lcmov_slt_sge_0f7_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f7_ULT_done
.Lcmov_slt_sge_0f7_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f7_ULT_done:
    bruge8 .Lcmov_slt_sge_0f7_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f7_UGE_done
.Lcmov_slt_sge_0f7_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f7_UGE_done:
    brslt8 .Lcmov_slt_sge_0f7_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f7_SLT_done
.Lcmov_slt_sge_0f7_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f7_SLT_done:
    brsge8 .Lcmov_slt_sge_0f7_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f7_SGE_done
.Lcmov_slt_sge_0f7_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f7_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r4; path false; guard r1.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7d59
    push16 r4
    ldi16 r4, 0xbd69
    push16 r4
    ldi16 r4, 0x7f9f
    push16 r4
    ldi16 r4, 0x80c2
    push16 r4
    ldi16 r4, 0x0d2c
    push16 r4
    ldi16 r4, 0x8308
    push16 r4
    ldi16 r4, 0x842b
    push16 r4
    ldi16 r4, 0x57ef
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r4
    push16 r1
    push16 r4
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0f8_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f8_EQ_done
.Lcmov_slt_sge_0f8_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f8_EQ_done:
    brne8 .Lcmov_slt_sge_0f8_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f8_NE_done
.Lcmov_slt_sge_0f8_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f8_NE_done:
    brult8 .Lcmov_slt_sge_0f8_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f8_ULT_done
.Lcmov_slt_sge_0f8_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f8_ULT_done:
    bruge8 .Lcmov_slt_sge_0f8_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f8_UGE_done
.Lcmov_slt_sge_0f8_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f8_UGE_done:
    brslt8 .Lcmov_slt_sge_0f8_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f8_SLT_done
.Lcmov_slt_sge_0f8_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f8_SLT_done:
    brsge8 .Lcmov_slt_sge_0f8_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f8_SGE_done
.Lcmov_slt_sge_0f8_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f8_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r4; path true; guard r2.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7d90
    push16 r4
    ldi16 r4, 0x7eb3
    push16 r4
    ldi16 r4, 0xbebd
    push16 r4
    ldi16 r4, 0x80f9
    push16 r4
    ldi16 r4, 0x0d67
    push16 r4
    ldi16 r4, 0x833f
    push16 r4
    ldi16 r4, 0x8462
    push16 r4
    ldi16 r4, 0x5820
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r4
    push16 r2
    push16 r4
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0f9_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f9_EQ_done
.Lcmov_slt_sge_0f9_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f9_EQ_done:
    brne8 .Lcmov_slt_sge_0f9_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f9_NE_done
.Lcmov_slt_sge_0f9_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f9_NE_done:
    brult8 .Lcmov_slt_sge_0f9_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f9_ULT_done
.Lcmov_slt_sge_0f9_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f9_ULT_done:
    bruge8 .Lcmov_slt_sge_0f9_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f9_UGE_done
.Lcmov_slt_sge_0f9_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f9_UGE_done:
    brslt8 .Lcmov_slt_sge_0f9_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f9_SLT_done
.Lcmov_slt_sge_0f9_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f9_SLT_done:
    brsge8 .Lcmov_slt_sge_0f9_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0f9_SGE_done
.Lcmov_slt_sge_0f9_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0f9_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r5; path false; guard r3.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7dc7
    push16 r4
    ldi16 r4, 0x7eea
    push16 r4
    ldi16 r4, 0x800d
    push16 r4
    ldi16 r4, 0xc011
    push16 r4
    ldi16 r4, 0x8253
    push16 r4
    ldi16 r4, 0x0ea3
    push16 r4
    ldi16 r4, 0x8499
    push16 r4
    ldi16 r4, 0x5851
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r5
    push16 r3
    push16 r5
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0fa_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fa_EQ_done
.Lcmov_slt_sge_0fa_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fa_EQ_done:
    brne8 .Lcmov_slt_sge_0fa_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fa_NE_done
.Lcmov_slt_sge_0fa_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fa_NE_done:
    brult8 .Lcmov_slt_sge_0fa_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fa_ULT_done
.Lcmov_slt_sge_0fa_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fa_ULT_done:
    bruge8 .Lcmov_slt_sge_0fa_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fa_UGE_done
.Lcmov_slt_sge_0fa_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fa_UGE_done:
    brslt8 .Lcmov_slt_sge_0fa_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fa_SLT_done
.Lcmov_slt_sge_0fa_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fa_SLT_done:
    brsge8 .Lcmov_slt_sge_0fa_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fa_SGE_done
.Lcmov_slt_sge_0fa_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fa_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r5; path true; guard r4.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x7dfe
    push16 r4
    ldi16 r4, 0x7f21
    push16 r4
    ldi16 r4, 0x8044
    push16 r4
    ldi16 r4, 0x8167
    push16 r4
    ldi16 r4, 0xc165
    push16 r4
    ldi16 r4, 0x0ede
    push16 r4
    ldi16 r4, 0x84d0
    push16 r4
    ldi16 r4, 0x5882
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r5
    push16 r4
    push16 r5
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0fb_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fb_EQ_done
.Lcmov_slt_sge_0fb_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fb_EQ_done:
    brne8 .Lcmov_slt_sge_0fb_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fb_NE_done
.Lcmov_slt_sge_0fb_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fb_NE_done:
    brult8 .Lcmov_slt_sge_0fb_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fb_ULT_done
.Lcmov_slt_sge_0fb_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fb_ULT_done:
    bruge8 .Lcmov_slt_sge_0fb_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fb_UGE_done
.Lcmov_slt_sge_0fb_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fb_UGE_done:
    brslt8 .Lcmov_slt_sge_0fb_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fb_SLT_done
.Lcmov_slt_sge_0fb_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fb_SLT_done:
    brsge8 .Lcmov_slt_sge_0fb_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fb_SGE_done
.Lcmov_slt_sge_0fb_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fb_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r6; path false; guard r5.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x7e35
    push16 r4
    ldi16 r4, 0x7f58
    push16 r4
    ldi16 r4, 0x807b
    push16 r4
    ldi16 r4, 0x819e
    push16 r4
    ldi16 r4, 0x82c1
    push16 r4
    ldi16 r4, 0xc2b9
    push16 r4
    ldi16 r4, 0x101a
    push16 r4
    ldi16 r4, 0x58b3
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r6
    push16 r5
    push16 r6
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0fc_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fc_EQ_done
.Lcmov_slt_sge_0fc_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fc_EQ_done:
    brne8 .Lcmov_slt_sge_0fc_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fc_NE_done
.Lcmov_slt_sge_0fc_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fc_NE_done:
    brult8 .Lcmov_slt_sge_0fc_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fc_ULT_done
.Lcmov_slt_sge_0fc_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fc_ULT_done:
    bruge8 .Lcmov_slt_sge_0fc_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fc_UGE_done
.Lcmov_slt_sge_0fc_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fc_UGE_done:
    brslt8 .Lcmov_slt_sge_0fc_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fc_SLT_done
.Lcmov_slt_sge_0fc_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fc_SLT_done:
    brsge8 .Lcmov_slt_sge_0fc_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fc_SGE_done
.Lcmov_slt_sge_0fc_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fc_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r6; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xbe07
    push16 r4
    ldi16 r4, 0x7f8f
    push16 r4
    ldi16 r4, 0x80b2
    push16 r4
    ldi16 r4, 0x81d5
    push16 r4
    ldi16 r4, 0x82f8
    push16 r4
    ldi16 r4, 0x841b
    push16 r4
    ldi16 r4, 0x1055
    push16 r4
    ldi16 r4, 0x58e4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r6
    push16 r0
    push16 r6
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0fd_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fd_EQ_done
.Lcmov_slt_sge_0fd_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fd_EQ_done:
    brne8 .Lcmov_slt_sge_0fd_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fd_NE_done
.Lcmov_slt_sge_0fd_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fd_NE_done:
    brult8 .Lcmov_slt_sge_0fd_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fd_ULT_done
.Lcmov_slt_sge_0fd_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fd_ULT_done:
    bruge8 .Lcmov_slt_sge_0fd_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fd_UGE_done
.Lcmov_slt_sge_0fd_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fd_UGE_done:
    brslt8 .Lcmov_slt_sge_0fd_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fd_SLT_done
.Lcmov_slt_sge_0fd_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fd_SLT_done:
    brsge8 .Lcmov_slt_sge_0fd_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fd_SGE_done
.Lcmov_slt_sge_0fd_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fd_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r7; path false; guard r0.
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xbe5a
    push16 r4
    ldi16 r4, 0x7fc6
    push16 r4
    ldi16 r4, 0x80e9
    push16 r4
    ldi16 r4, 0x820c
    push16 r4
    ldi16 r4, 0x832f
    push16 r4
    ldi16 r4, 0x8452
    push16 r4
    ldi16 r4, 0x8575
    push16 r4
    ldi16 r4, 0x5915
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r7
    push16 r0
    push16 r7
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0fe_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fe_EQ_done
.Lcmov_slt_sge_0fe_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fe_EQ_done:
    brne8 .Lcmov_slt_sge_0fe_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fe_NE_done
.Lcmov_slt_sge_0fe_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fe_NE_done:
    brult8 .Lcmov_slt_sge_0fe_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fe_ULT_done
.Lcmov_slt_sge_0fe_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fe_ULT_done:
    bruge8 .Lcmov_slt_sge_0fe_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fe_UGE_done
.Lcmov_slt_sge_0fe_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fe_UGE_done:
    brslt8 .Lcmov_slt_sge_0fe_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fe_SLT_done
.Lcmov_slt_sge_0fe_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fe_SLT_done:
    brsge8 .Lcmov_slt_sge_0fe_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0fe_SGE_done
.Lcmov_slt_sge_0fe_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0fe_SGE_done:
    cond_emit_char '\n'

    ; cmov.sge r7,r7; path true; guard r0.
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0xbead
    push16 r4
    ldi16 r4, 0x7ffd
    push16 r4
    ldi16 r4, 0x8120
    push16 r4
    ldi16 r4, 0x8243
    push16 r4
    ldi16 r4, 0x8366
    push16 r4
    ldi16 r4, 0x8489
    push16 r4
    ldi16 r4, 0x85ac
    push16 r4
    ldi16 r4, 0x5946
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    cmov.sge r7, r7
    push16 r0
    push16 r7
    push16 r7
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    pop16 r0
    call cond_print_r0_line
    breq8 .Lcmov_slt_sge_0ff_EQ_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ff_EQ_done
.Lcmov_slt_sge_0ff_EQ_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ff_EQ_done:
    brne8 .Lcmov_slt_sge_0ff_NE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ff_NE_done
.Lcmov_slt_sge_0ff_NE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ff_NE_done:
    brult8 .Lcmov_slt_sge_0ff_ULT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ff_ULT_done
.Lcmov_slt_sge_0ff_ULT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ff_ULT_done:
    bruge8 .Lcmov_slt_sge_0ff_UGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ff_UGE_done
.Lcmov_slt_sge_0ff_UGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ff_UGE_done:
    brslt8 .Lcmov_slt_sge_0ff_SLT_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ff_SLT_done
.Lcmov_slt_sge_0ff_SLT_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ff_SLT_done:
    brsge8 .Lcmov_slt_sge_0ff_SGE_true
    cond_emit_char 'A'
    jmp8 .Lcmov_slt_sge_0ff_SGE_done
.Lcmov_slt_sge_0ff_SGE_true:
    cond_emit_char 'B'
.Lcmov_slt_sge_0ff_SGE_done:
    cond_emit_char '\n'

    sys debug_break
