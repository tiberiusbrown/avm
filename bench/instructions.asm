; Ordered timing names for bench/avm_bench.cpp:
;   001: SYS DEBUG_BREAK
;   002: CLR c0
;   003: MOV c0,c1
;   004: LD8 c0,[c2]
;   005: ST8 [c2],c1
;   006: LD16 c0,[c2]
;   007: ST16 [c2],c1
;   008: AND A,r0
;   009: PUSH16 r0
;   010: POP16 r0
;   011: ADD c0,c1
;   012: SUB c0,c1
;   013: CMP16 c0,c1
;   014: TST16 c0
;   015: CMP8 c0,c1
;   016: TST8 c0
;   017: BEQ.S (not taken)
;   018: BEQ.S (taken)
;   019: BNE.S (not taken)
;   020: BNE.S (taken)
;   021: NOT16 r0
;   022: NEG16 r0
;   023: INC16 r0
;   024: DEC16 r0
;   025: LSR16 r0
;   026: ZEXT8 r0
;   027: SEXT8 r0
;   028: SWAP8 r0
;   029: GETSP r0
;   030: SETSP r0
;   031: MTPB r0
;   032: MFPB r0
;   033: MOV16 r6,r0
;   034: MOV8Z r6,r0
;   035: MOV8S r6,r0
;   036: CSET r6,EQ (true)
;   037: CSET r6,EQ (false)
;   038: CSET r6,NE (true)
;   039: CSET r6,NE (false)
;   040: CSET r6,ULT (true)
;   041: CSET r6,ULT (false)
;   042: CSET r6,UGE (true)
;   043: CSET r6,UGE (false)
;   044: CSET r6,SLT (true)
;   045: CSET r6,SLT (false)
;   046: CSET r6,SGE (true)
;   047: CSET r6,SGE (false)
;   048: CSET r6,ULE (true)
;   049: CSET r6,ULE (false)
;   050: CSET r6,UGT (true)
;   051: CSET r6,UGT (false)
;   052: CMPI6 c0,-17
;   053: JMP rel8
;   054: CALL rel8
;   055: ADJSP 0
;   056: SYS DEBUG_PUTC
;   057: JMP16 addr16
;   058: CALL16 addr16
;   059: NOP
;   060: LDI8 c0,imm8
;   061: BREQ (not taken)
;   062: BREQ (taken)
;   063: BRNE (not taken)
;   064: BRNE (taken)
;   065: BRULT (not taken)
;   066: BRULT (taken)
;   067: BRUGE (not taken)
;   068: BRUGE (taken)
;   069: BRSLT (not taken)
;   070: BRSLT (taken)
;   071: BRSGE (not taken)
;   072: BRSGE (taken)
;   073: BRULE (not taken)
;   074: BRULE (taken)
;   075: BRUGT (not taken)
;   076: BRUGT (taken)
;   077: LD8 r0,[r6]
;   078: ST8 [r6],r0
;   079: LD16 r0,[r6]
;   080: ST16 [r6],r0
;   081: LD8 r0,[r6]+
;   082: ST8 [r6]+,r0
;   083: LD16 r0,[r6]+
;   084: ST16 [r6]+,r0
;   085: LEA r0,[r6+4]
;   086: LD8 r0,[r6+4]
;   087: ST8 [r6+4],r0
;   088: LD16 r0,[r6+4]
;   089: ST16 [r6+4],r0
;   090: LDSP8 r0,[SP+8]
;   091: STSP8 [SP+8],r0
;   092: LDSP16 r0,[SP+8]
;   093: STSP16 [SP+8],r0
;   094: LDM8 r0,0x0100
;   095: STM8 0x0100,r0
;   096: LDM16 r0,0x0100
;   097: STM16 0x0100,r0
;   098: JMPF target24
;   099: CALLF target24
;   100: RET
;   101: LDI16 r0,imm16
;   102: LDI8 r0,imm8
;   103: ADDI16 r0,imm16
;   104: SUBI16 r0,imm16
;   105: ANDI16 r0,imm16
;   106: ORI16 r0,imm16
;   107: XORI16 r0,imm16
;   108: CMPI16 r0,imm16
;   109: CMPI8 r0,imm8
;   110: TST16 r0
;   111: TST8 r0

; AVM instruction-cycle benchmark image
;
; Measurement protocol (matching the earlier ABC benchmark):
;   * Ardens runs to a DEBUG_BREAK and records cycle_count.
;   * It resumes to the next DEBUG_BREAK and records cycle_count again.
;   * The break-to-break baseline is subtracted from every ordinary entry.
;   * SYS DEBUG_BREAK itself is reported directly from that baseline.
;
; The implemented-instruction inventory contains 86 architectural forms.
; Branches are emitted in both taken and not-taken forms, and every CSET
; condition is emitted for both true and false results.  This produces 111
; timing entries while still covering every implemented form.

.section .text,"ax",@progbits
.equ SYS_DEBUG_PUTC,  0
.equ SYS_DEBUG_BREAK, 1

.globl _start
.type _start, @function
.p2align 1
_start:
    ; Reserve a stable scratch area and retain its base in r7/c3.
    adjsp -64
    getsp r7

    ; Warm-up pair consumed by the benchmark harness.
    sys SYS_DEBUG_BREAK
    sys SYS_DEBUG_BREAK

    ; Baseline pair.  The harness also reports this latency as entry 001,
    ; SYS DEBUG_BREAK, without subtracting it from itself.
    sys SYS_DEBUG_BREAK
    sys SYS_DEBUG_BREAK

    ; [002] CLR c0
    ldi8 c0, 0xff
    sys SYS_DEBUG_BREAK
    clr c0
    sys SYS_DEBUG_BREAK

    ; [003] MOV c0,c1
    ldi8 c1, 0x5a
    sys SYS_DEBUG_BREAK
    mov c0, c1
    sys SYS_DEBUG_BREAK

    ; [004] LD8 c0,[c2]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0xa5
    st8 [c2], c1
    sys SYS_DEBUG_BREAK
    ld8 c0, [c2]
    sys SYS_DEBUG_BREAK

    ; [005] ST8 [c2],c1
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x3c
    sys SYS_DEBUG_BREAK
    st8 [c2], c1
    sys SYS_DEBUG_BREAK

    ; [006] LD16 c0,[c2]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st16 [c2], c1
    sys SYS_DEBUG_BREAK
    ld16 c0, [c2]
    sys SYS_DEBUG_BREAK

    ; [007] ST16 [c2],c1
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x69
    sys SYS_DEBUG_BREAK
    st16 [c2], c1
    sys SYS_DEBUG_BREAK

    ; [008] AND A,r0
    ldi8 c0, 0xf3
    ldi8 c1, 0x5f
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    and a, r0
    sys SYS_DEBUG_BREAK

    ; [009] PUSH16 r0
    ldi8 c1, 0x42
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    push16 r0
    sys SYS_DEBUG_BREAK
    pop16 r1

    ; [010] POP16 r0
    ldi8 c1, 0x42
    push16 r5
    sys SYS_DEBUG_BREAK
    pop16 r0
    sys SYS_DEBUG_BREAK

    ; [011] ADD c0,c1
    ldi8 c0, 0x12
    ldi8 c1, 0x34
    sys SYS_DEBUG_BREAK
    add c0, c1
    sys SYS_DEBUG_BREAK

    ; [012] SUB c0,c1
    ldi8 c0, 0x34
    ldi8 c1, 0x12
    sys SYS_DEBUG_BREAK
    sub c0, c1
    sys SYS_DEBUG_BREAK

    ; [013] CMP16 c0,c1
    ldi8 c0, 0x12
    ldi8 c1, 0x34
    sys SYS_DEBUG_BREAK
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK

    ; [014] TST16 c0
    ldi8 c0, 0
    sys SYS_DEBUG_BREAK
    tst16 c0
    sys SYS_DEBUG_BREAK

    ; [015] CMP8 c0,c1
    ldi8 c0, 0x12
    ldi8 c1, 0x34
    sys SYS_DEBUG_BREAK
    cmp8 c0, c1
    sys SYS_DEBUG_BREAK

    ; [016] TST8 c0
    ldi8 c0, 0
    sys SYS_DEBUG_BREAK
    tst8 c0
    sys SYS_DEBUG_BREAK

    ; [017] BEQ.S (not taken)
    ldi8 c0, 1
    tst16 c0
    sys SYS_DEBUG_BREAK
    beq.s 2
    sys SYS_DEBUG_BREAK
.L_short_17:

    ; [018] BEQ.S (taken)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    beq.s 2
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_short_18:
    sys SYS_DEBUG_BREAK

    ; [019] BNE.S (not taken)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    bne.s 2
    sys SYS_DEBUG_BREAK
.L_short_19:

    ; [020] BNE.S (taken)
    ldi8 c0, 1
    tst16 c0
    sys SYS_DEBUG_BREAK
    bne.s 2
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_short_20:
    sys SYS_DEBUG_BREAK

    ; [021] NOT16 r0
    ldi8 c1, 0x55
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    not16 r0
    sys SYS_DEBUG_BREAK

    ; [022] NEG16 r0
    ldi8 c1, 7
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    neg16 r0
    sys SYS_DEBUG_BREAK

    ; [023] INC16 r0
    ldi8 c1, 7
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    inc16 r0
    sys SYS_DEBUG_BREAK

    ; [024] DEC16 r0
    ldi8 c1, 7
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    dec16 r0
    sys SYS_DEBUG_BREAK

    ; [025] LSR16 r0
    ldi8 c1, 0x80
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    lsr16 r0
    sys SYS_DEBUG_BREAK

    ; [026] ZEXT8 r0
    ldi8 c1, 0x80
    sext8 r5
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    zext8 r0
    sys SYS_DEBUG_BREAK

    ; [027] SEXT8 r0
    ldi8 c1, 0x80
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    sext8 r0
    sys SYS_DEBUG_BREAK

    ; [028] SWAP8 r0
    ldi8 c1, 0x3c
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    swap8 r0
    sys SYS_DEBUG_BREAK

    ; [029] GETSP r0
    sys SYS_DEBUG_BREAK
    getsp r0
    sys SYS_DEBUG_BREAK

    ; [030] SETSP r0
    getsp r0
    sys SYS_DEBUG_BREAK
    setsp r0
    sys SYS_DEBUG_BREAK

    ; [031] MTPB r0
    ldi8 c1, 0
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    mtpb r0
    sys SYS_DEBUG_BREAK

    ; [032] MFPB r0
    sys SYS_DEBUG_BREAK
    mfpb r0
    sys SYS_DEBUG_BREAK

    ; [033] MOV16 r6,r0
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    mov16 r6, r0
    sys SYS_DEBUG_BREAK

    ; [034] MOV8Z r6,r0
    ldi8 c1, 0x80
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    mov8z r6, r0
    sys SYS_DEBUG_BREAK

    ; [035] MOV8S r6,r0
    ldi8 c1, 0x80
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    mov8s r6, r0
    sys SYS_DEBUG_BREAK

    ; [036] CSET r6,EQ (true)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, eq
    sys SYS_DEBUG_BREAK

    ; [037] CSET r6,EQ (false)
    ldi8 c0, 1
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, eq
    sys SYS_DEBUG_BREAK

    ; [038] CSET r6,NE (true)
    ldi8 c0, 1
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, ne
    sys SYS_DEBUG_BREAK

    ; [039] CSET r6,NE (false)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, ne
    sys SYS_DEBUG_BREAK

    ; [040] CSET r6,ULT (true)
    ldi8 c0, 0
    ldi8 c1, 1
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, ult
    sys SYS_DEBUG_BREAK

    ; [041] CSET r6,ULT (false)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, ult
    sys SYS_DEBUG_BREAK

    ; [042] CSET r6,UGE (true)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, uge
    sys SYS_DEBUG_BREAK

    ; [043] CSET r6,UGE (false)
    ldi8 c0, 0
    ldi8 c1, 1
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, uge
    sys SYS_DEBUG_BREAK

    ; [044] CSET r6,SLT (true)
    ldi8 c0, 0x80
    sext8 r4
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, slt
    sys SYS_DEBUG_BREAK

    ; [045] CSET r6,SLT (false)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, slt
    sys SYS_DEBUG_BREAK

    ; [046] CSET r6,SGE (true)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, sge
    sys SYS_DEBUG_BREAK

    ; [047] CSET r6,SGE (false)
    ldi8 c0, 0x80
    sext8 r4
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, sge
    sys SYS_DEBUG_BREAK

    ; [048] CSET r6,ULE (true)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, ule
    sys SYS_DEBUG_BREAK

    ; [049] CSET r6,ULE (false)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, ule
    sys SYS_DEBUG_BREAK

    ; [050] CSET r6,UGT (true)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, ugt
    sys SYS_DEBUG_BREAK

    ; [051] CSET r6,UGT (false)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, ugt
    sys SYS_DEBUG_BREAK

    ; [052] CMPI6 c0,-17
    ldi8 c0, 9
    sys SYS_DEBUG_BREAK
    cmpi6 c0, -17
    sys SYS_DEBUG_BREAK

    ; [053] JMP rel8
    sys SYS_DEBUG_BREAK
    jmp .L_jmp_rel_target
    nop
.L_jmp_rel_target:
    sys SYS_DEBUG_BREAK

    ; [054] CALL rel8
    sys SYS_DEBUG_BREAK
    call .L_call_rel_target
.L_call_rel_return:
    jmp .L_call_rel_done
.L_call_rel_target:
    sys SYS_DEBUG_BREAK
    ret
.L_call_rel_done:

    ; [055] ADJSP 0
    sys SYS_DEBUG_BREAK
    adjsp 0
    sys SYS_DEBUG_BREAK

    ; [056] SYS DEBUG_PUTC
    ldi8 c0, 0x2e
    sys SYS_DEBUG_BREAK
    sys SYS_DEBUG_PUTC
    sys SYS_DEBUG_BREAK

    ; [057] JMP16 addr16
    sys SYS_DEBUG_BREAK
    jmp16 .L_jmp16_target
    nop
.L_jmp16_target:
    sys SYS_DEBUG_BREAK

    ; [058] CALL16 addr16
    sys SYS_DEBUG_BREAK
    call16 .L_call16_target
.L_call16_return:
    jmp .L_call16_done
.L_call16_target:
    sys SYS_DEBUG_BREAK
    ret
.L_call16_done:

    ; [059] NOP
    sys SYS_DEBUG_BREAK
    nop
    sys SYS_DEBUG_BREAK

    ; [060] LDI8 c0,imm8
    sys SYS_DEBUG_BREAK
    ldi8 c0, 0xa5
    sys SYS_DEBUG_BREAK

    ; [061] BREQ (not taken)
    ldi8 c0, 1
    tst16 c0
    sys SYS_DEBUG_BREAK
    breq .L_general_61
    sys SYS_DEBUG_BREAK
.L_general_61:

    ; [062] BREQ (taken)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    breq .L_general_62
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_62:
    sys SYS_DEBUG_BREAK

    ; [063] BRNE (not taken)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    brne .L_general_63
    sys SYS_DEBUG_BREAK
.L_general_63:

    ; [064] BRNE (taken)
    ldi8 c0, 1
    tst16 c0
    sys SYS_DEBUG_BREAK
    brne .L_general_64
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_64:
    sys SYS_DEBUG_BREAK

    ; [065] BRULT (not taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brult .L_general_65
    sys SYS_DEBUG_BREAK
.L_general_65:

    ; [066] BRULT (taken)
    ldi8 c0, 0
    ldi8 c1, 1
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brult .L_general_66
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_66:
    sys SYS_DEBUG_BREAK

    ; [067] BRUGE (not taken)
    ldi8 c0, 0
    ldi8 c1, 1
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    bruge .L_general_67
    sys SYS_DEBUG_BREAK
.L_general_67:

    ; [068] BRUGE (taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    bruge .L_general_68
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_68:
    sys SYS_DEBUG_BREAK

    ; [069] BRSLT (not taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brslt .L_general_69
    sys SYS_DEBUG_BREAK
.L_general_69:

    ; [070] BRSLT (taken)
    ldi8 c0, 0x80
    sext8 r4
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brslt .L_general_70
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_70:
    sys SYS_DEBUG_BREAK

    ; [071] BRSGE (not taken)
    ldi8 c0, 0x80
    sext8 r4
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brsge .L_general_71
    sys SYS_DEBUG_BREAK
.L_general_71:

    ; [072] BRSGE (taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brsge .L_general_72
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_72:
    sys SYS_DEBUG_BREAK

    ; [073] BRULE (not taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brule .L_general_73
    sys SYS_DEBUG_BREAK
.L_general_73:

    ; [074] BRULE (taken)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    brule .L_general_74
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_74:
    sys SYS_DEBUG_BREAK

    ; [075] BRUGT (not taken)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    brugt .L_general_75
    sys SYS_DEBUG_BREAK
.L_general_75:

    ; [076] BRUGT (taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brugt .L_general_76
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_76:
    sys SYS_DEBUG_BREAK

    ; [077] LD8 r0,[r6]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st8 [c2], c1
    sys SYS_DEBUG_BREAK
    ld8 r0, [r6]
    sys SYS_DEBUG_BREAK

    ; [078] ST8 [r6],r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st8 [r6], r0
    sys SYS_DEBUG_BREAK

    ; [079] LD16 r0,[r6]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st16 [c2], c1
    sys SYS_DEBUG_BREAK
    ld16 r0, [r6]
    sys SYS_DEBUG_BREAK

    ; [080] ST16 [r6],r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st16 [r6], r0
    sys SYS_DEBUG_BREAK

    ; [081] LD8 r0,[r6]+
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st8 [c2], c1
    sys SYS_DEBUG_BREAK
    ld8 r0, [r6]+
    sys SYS_DEBUG_BREAK

    ; [082] ST8 [r6]+,r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st8 [r6]+, r0
    sys SYS_DEBUG_BREAK

    ; [083] LD16 r0,[r6]+
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st16 [c2], c1
    sys SYS_DEBUG_BREAK
    ld16 r0, [r6]+
    sys SYS_DEBUG_BREAK

    ; [084] ST16 [r6]+,r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st16 [r6]+, r0
    sys SYS_DEBUG_BREAK

    ; [085] LEA r0,[r6+4]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    sys SYS_DEBUG_BREAK
    lea r0, [r6 + 4]
    sys SYS_DEBUG_BREAK

    ; [086] LD8 r0,[r6+4]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st8 [r6 + 4], r5
    sys SYS_DEBUG_BREAK
    ld8 r0, [r6 + 4]
    sys SYS_DEBUG_BREAK

    ; [087] ST8 [r6+4],r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st8 [r6 + 4], r0
    sys SYS_DEBUG_BREAK

    ; [088] LD16 r0,[r6+4]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st16 [r6 + 4], r5
    sys SYS_DEBUG_BREAK
    ld16 r0, [r6 + 4]
    sys SYS_DEBUG_BREAK

    ; [089] ST16 [r6+4],r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st16 [r6 + 4], r0
    sys SYS_DEBUG_BREAK

    ; [090] LDSP8 r0,[SP+8]
    ldi8 c1, 0x5a
    mov16 r0, r5
    stsp8 [sp + 8], r0
    sys SYS_DEBUG_BREAK
    ldsp8 r0, [sp + 8]
    sys SYS_DEBUG_BREAK

    ; [091] STSP8 [SP+8],r0
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    stsp8 [sp + 8], r0
    sys SYS_DEBUG_BREAK

    ; [092] LDSP16 r0,[SP+8]
    ldi8 c1, 0x5a
    mov16 r0, r5
    stsp16 [sp + 8], r0
    sys SYS_DEBUG_BREAK
    ldsp16 r0, [sp + 8]
    sys SYS_DEBUG_BREAK

    ; [093] STSP16 [SP+8],r0
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    stsp16 [sp + 8], r0
    sys SYS_DEBUG_BREAK

    ; [094] LDM8 r0,0x0100
    ldi8 c1, 0x5a
    mov16 r0, r5
    stm8 0x0100, r0
    sys SYS_DEBUG_BREAK
    ldm8 r0, 0x0100
    sys SYS_DEBUG_BREAK

    ; [095] STM8 0x0100,r0
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    stm8 0x0100, r0
    sys SYS_DEBUG_BREAK

    ; [096] LDM16 r0,0x0100
    ldi8 c1, 0x5a
    mov16 r0, r5
    stm16 0x0100, r0
    sys SYS_DEBUG_BREAK
    ldm16 r0, 0x0100
    sys SYS_DEBUG_BREAK

    ; [097] STM16 0x0100,r0
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    stm16 0x0100, r0
    sys SYS_DEBUG_BREAK

    ; [098] JMPF target24
    sys SYS_DEBUG_BREAK
    jmpf .L_jmpf_target
    nop
    .p2align 1
.L_jmpf_target:
    sys SYS_DEBUG_BREAK

    ; [099] CALLF target24
    sys SYS_DEBUG_BREAK
    callf .L_callf_target
.L_callf_return:
    jmp .L_callf_done
    .p2align 1
.L_callf_target:
    sys SYS_DEBUG_BREAK
    ret
.L_callf_done:

    ; [100] RET
    call .L_ret_bench_body
.L_ret_bench_return:
    sys SYS_DEBUG_BREAK
    jmp .L_ret_bench_done
.L_ret_bench_body:
    sys SYS_DEBUG_BREAK
    ret
.L_ret_bench_done:

    ; [101] LDI16 r0,imm16
    sys SYS_DEBUG_BREAK
    ldi16 r0, 0xa55a
    sys SYS_DEBUG_BREAK

    ; [102] LDI8 r0,imm8
    ; Seed a nonzero high byte so the benchmark also exercises zero extension.
    ldi16 r0, 0xffff
    sys SYS_DEBUG_BREAK
    ldi8 r0, 0xa5
    sys SYS_DEBUG_BREAK

    ; [103] ADDI16 r0,imm16
    ldi16 r0, 0x1234
    sys SYS_DEBUG_BREAK
    addi16 r0, 0x4321
    sys SYS_DEBUG_BREAK

    ; [104] SUBI16 r0,imm16
    ldi16 r0, 0x5678
    sys SYS_DEBUG_BREAK
    subi16 r0, 0x1234
    sys SYS_DEBUG_BREAK

    ; [105] ANDI16 r0,imm16
    ldi16 r0, 0xf0f3
    sys SYS_DEBUG_BREAK
    andi16 r0, 0x0ff0
    sys SYS_DEBUG_BREAK

    ; [106] ORI16 r0,imm16
    ldi16 r0, 0x0f00
    sys SYS_DEBUG_BREAK
    ori16 r0, 0x00f3
    sys SYS_DEBUG_BREAK

    ; [107] XORI16 r0,imm16
    ldi16 r0, 0xaaaa
    sys SYS_DEBUG_BREAK
    xori16 r0, 0x0ff0
    sys SYS_DEBUG_BREAK

    ; [108] CMPI16 r0,imm16
    ldi16 r0, 0x1234
    sys SYS_DEBUG_BREAK
    cmpi16 r0, 0x5678
    sys SYS_DEBUG_BREAK

    ; [109] CMPI8 r0,imm8
    ldi16 r0, 0xab34
    sys SYS_DEBUG_BREAK
    cmpi8 r0, 0x56
    sys SYS_DEBUG_BREAK

    ; [110] TST16 r0
    ldi16 r0, 0x8000
    sys SYS_DEBUG_BREAK
    tst16 r0
    sys SYS_DEBUG_BREAK

    ; [111] TST8 r0
    ldi16 r0, 0xab80
    sys SYS_DEBUG_BREAK
    tst8 r0
    sys SYS_DEBUG_BREAK

    ; Restore the original stack pointer before entering the sentinel loop.
    adjsp 64
.L_done:
    sys SYS_DEBUG_BREAK
    jmp .L_done

.size _start, .-_start
