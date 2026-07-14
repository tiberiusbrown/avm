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
;   025: LSL16 r0
;   026: LSR16 r0
;   027: ASR16 r0
;   028: LSR8 r0
;   029: ASR8 r0
;   030: ZEXT8 r0
;   031: SEXT8 r0
;   032: SWAP8 r0
;   033: GETSP r0
;   034: SETSP r0
;   035: MTPB r0
;   036: MFPB r0
;   037: MOV16 r6,r0
;   038: MOV8Z r6,b0
;   039: MOV8S r6,b0
;   040: CSET r6,EQ (true)
;   041: CSET r6,EQ (false)
;   042: CSET r6,NE (true)
;   043: CSET r6,NE (false)
;   044: CSET r6,ULT (true)
;   045: CSET r6,ULT (false)
;   046: CSET r6,UGE (true)
;   047: CSET r6,UGE (false)
;   048: CSET r6,SLT (true)
;   049: CSET r6,SLT (false)
;   050: CSET r6,SGE (true)
;   051: CSET r6,SGE (false)
;   052: CSET r6,ULE (true)
;   053: CSET r6,ULE (false)
;   054: CSET r6,UGT (true)
;   055: CSET r6,UGT (false)
;   056: CMPI6 c0,-17
;   057: JMP rel8
;   058: CALL rel8
;   059: ADJSP 0
;   060: SYS DEBUG_PUTC
;   061: JMP16 addr16
;   062: CALL16 addr16
;   063: NOP
;   064: LDI8 c0,imm8
;   065: BREQ (not taken)
;   066: BREQ (taken)
;   067: BRNE (not taken)
;   068: BRNE (taken)
;   069: BRULT (not taken)
;   070: BRULT (taken)
;   071: BRUGE (not taken)
;   072: BRUGE (taken)
;   073: BRSLT (not taken)
;   074: BRSLT (taken)
;   075: BRSGE (not taken)
;   076: BRSGE (taken)
;   077: BRULE (not taken)
;   078: BRULE (taken)
;   079: BRUGT (not taken)
;   080: BRUGT (taken)
;   081: LD8 r0,[r6]
;   082: ST8 [r6],r0
;   083: LD16 r0,[r6]
;   084: ST16 [r6],r0
;   085: LD8 r0,[r6]+
;   086: ST8 [r6]+,r0
;   087: LD16 r0,[r6]+
;   088: ST16 [r6]+,r0
;   089: LEA r0,[r6+4]
;   090: LD8 r0,[r6+4]
;   091: ST8 [r6+4],r0
;   092: LD16 r0,[r6+4]
;   093: ST16 [r6+4],r0
;   094: LDSP8 r0,[SP+8]
;   095: STSP8 [SP+8],r0
;   096: LDSP16 r0,[SP+8]
;   097: STSP16 [SP+8],r0
;   098: LDM8 r0,0x0100
;   099: STM8 0x0100,r0
;   100: LDM16 r0,0x0100
;   101: STM16 0x0100,r0
;   102: JMPF target24
;   103: CALLF target24
;   104: RET
;   105: LDI16 r0,imm16
;   106: LDI8 r0,imm8
;   107: ADDI16 r0,imm16
;   108: SUBI16 r0,imm16
;   109: ANDI16 r0,imm16
;   110: ORI16 r0,imm16
;   111: XORI16 r0,imm16
;   112: CMPI16 r0,imm16
;   113: CMPI8 r0,imm8
;   114: TST16 r0
;   115: TST8 r0
;   116: OR A,r0
;   117: XOR A,r0
;   118: BIC A,r0
;   119: ADD.NF c2,c3
;   120: SUB.NF c2,c3
;   121: AND c2,c3
;   122: OR c2,c3
;   123: XOR c2,c3
;   124: BIC c2,c3
;   125: LDPBI 0
;   126: LDP8 r0,[PB:r6]
;   127: LDP16 r0,[PB:r6]
;   128: LDP8 r0,[PB:r6+4]
;   129: LDP16 r0,[PB:r6+4]
;   130: MOV32 q0,q1
;   131: ADD32 q0,q1
;   132: SUB32 q0,q1
;   133: CMP32 q0,q1
;   134: JMPP q0
;   135: CALLP q0
;   136: MULU8 A,r0
;   137: MULS8 A,r1
;   138: MULSU8 A,r2
;   139: MULU8 c1,c2
;   140: MULS8 c2,c3
;   141: MULSU8 c3,c1

; AVM instruction-cycle benchmark image
;
; Measurement protocol (matching the earlier ABC benchmark):
;   * Ardens runs to a DEBUG_BREAK and records cycle_count.
;   * It resumes to the next DEBUG_BREAK and records cycle_count again.
;   * The break-to-break baseline is subtracted from every ordinary entry.
;   * SYS DEBUG_BREAK itself is reported directly from that baseline.
;
; The implemented-instruction inventory contains 114 architectural forms.
; Branches are emitted in both taken and not-taken forms, and every CSET
; condition is emitted for both true and false results.  This produces 141
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

    ; [025] LSL16 r0
    ldi16 r0, 0x4081
    sys SYS_DEBUG_BREAK
    lsl16 r0
    sys SYS_DEBUG_BREAK

    ; [026] LSR16 r0
    ldi8 c1, 0x80
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    lsr16 r0
    sys SYS_DEBUG_BREAK

    ; [027] ASR16 r0
    ldi16 r0, 0x8001
    sys SYS_DEBUG_BREAK
    asr16 r0
    sys SYS_DEBUG_BREAK

    ; [028] LSR8 r0
    ; The nonzero high byte also checks that only b0 is shifted.
    ldi16 r0, 0xab81
    sys SYS_DEBUG_BREAK
    lsr8 r0
    sys SYS_DEBUG_BREAK

    ; [029] ASR8 r0
    ; The nonzero high byte also checks that only b0 is shifted.
    ldi16 r0, 0xab81
    sys SYS_DEBUG_BREAK
    asr8 r0
    sys SYS_DEBUG_BREAK

    ; [030] ZEXT8 r0
    ldi8 c1, 0x80
    sext8 r5
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    zext8 r0
    sys SYS_DEBUG_BREAK

    ; [031] SEXT8 r0
    ldi8 c1, 0x80
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    sext8 r0
    sys SYS_DEBUG_BREAK

    ; [032] SWAP8 r0
    ldi8 c1, 0x3c
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    swap8 r0
    sys SYS_DEBUG_BREAK

    ; [033] GETSP r0
    sys SYS_DEBUG_BREAK
    getsp r0
    sys SYS_DEBUG_BREAK

    ; [034] SETSP r0
    getsp r0
    sys SYS_DEBUG_BREAK
    setsp r0
    sys SYS_DEBUG_BREAK

    ; [035] MTPB r0
    ldi8 c1, 0
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    mtpb r0
    sys SYS_DEBUG_BREAK

    ; [036] MFPB r0
    sys SYS_DEBUG_BREAK
    mfpb r0
    sys SYS_DEBUG_BREAK

    ; [037] MOV16 r6,r0
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    mov16 r6, r0
    sys SYS_DEBUG_BREAK

    ; [038] MOV8Z r6,b0
    ldi8 c1, 0x80
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    mov8z r6, b0
    sys SYS_DEBUG_BREAK

    ; [039] MOV8S r6,b0
    ldi8 c1, 0x80
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    mov8s r6, b0
    sys SYS_DEBUG_BREAK

    ; [040] CSET r6,EQ (true)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, eq
    sys SYS_DEBUG_BREAK

    ; [041] CSET r6,EQ (false)
    ldi8 c0, 1
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, eq
    sys SYS_DEBUG_BREAK

    ; [042] CSET r6,NE (true)
    ldi8 c0, 1
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, ne
    sys SYS_DEBUG_BREAK

    ; [043] CSET r6,NE (false)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, ne
    sys SYS_DEBUG_BREAK

    ; [044] CSET r6,ULT (true)
    ldi8 c0, 0
    ldi8 c1, 1
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, ult
    sys SYS_DEBUG_BREAK

    ; [045] CSET r6,ULT (false)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, ult
    sys SYS_DEBUG_BREAK

    ; [046] CSET r6,UGE (true)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, uge
    sys SYS_DEBUG_BREAK

    ; [047] CSET r6,UGE (false)
    ldi8 c0, 0
    ldi8 c1, 1
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, uge
    sys SYS_DEBUG_BREAK

    ; [048] CSET r6,SLT (true)
    ldi8 c0, 0x80
    sext8 r4
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, slt
    sys SYS_DEBUG_BREAK

    ; [049] CSET r6,SLT (false)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, slt
    sys SYS_DEBUG_BREAK

    ; [050] CSET r6,SGE (true)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, sge
    sys SYS_DEBUG_BREAK

    ; [051] CSET r6,SGE (false)
    ldi8 c0, 0x80
    sext8 r4
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, sge
    sys SYS_DEBUG_BREAK

    ; [052] CSET r6,ULE (true)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, ule
    sys SYS_DEBUG_BREAK

    ; [053] CSET r6,ULE (false)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, ule
    sys SYS_DEBUG_BREAK

    ; [054] CSET r6,UGT (true)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    cset r6, ugt
    sys SYS_DEBUG_BREAK

    ; [055] CSET r6,UGT (false)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    cset r6, ugt
    sys SYS_DEBUG_BREAK

    ; [056] CMPI6 c0,-17
    ldi8 c0, 9
    sys SYS_DEBUG_BREAK
    cmpi6 c0, -17
    sys SYS_DEBUG_BREAK

    ; [057] JMP rel8
    sys SYS_DEBUG_BREAK
    jmp .L_jmp_rel_target
    nop
.L_jmp_rel_target:
    sys SYS_DEBUG_BREAK

    ; [058] CALL rel8
    sys SYS_DEBUG_BREAK
    call .L_call_rel_target
.L_call_rel_return:
    jmp .L_call_rel_done
.L_call_rel_target:
    sys SYS_DEBUG_BREAK
    ret
.L_call_rel_done:

    ; [059] ADJSP 0
    sys SYS_DEBUG_BREAK
    adjsp 0
    sys SYS_DEBUG_BREAK

    ; [060] SYS DEBUG_PUTC
    ldi8 c0, 0x2e
    sys SYS_DEBUG_BREAK
    sys SYS_DEBUG_PUTC
    sys SYS_DEBUG_BREAK

    ; [061] JMP16 addr16
    sys SYS_DEBUG_BREAK
    jmp16 .L_jmp16_target
    nop
.L_jmp16_target:
    sys SYS_DEBUG_BREAK

    ; [062] CALL16 addr16
    sys SYS_DEBUG_BREAK
    call16 .L_call16_target
.L_call16_return:
    jmp .L_call16_done
.L_call16_target:
    sys SYS_DEBUG_BREAK
    ret
.L_call16_done:

    ; [063] NOP
    sys SYS_DEBUG_BREAK
    nop
    sys SYS_DEBUG_BREAK

    ; [064] LDI8 c0,imm8
    sys SYS_DEBUG_BREAK
    ldi8 c0, 0xa5
    sys SYS_DEBUG_BREAK

    ; [065] BREQ (not taken)
    ldi8 c0, 1
    tst16 c0
    sys SYS_DEBUG_BREAK
    breq .L_general_65
    sys SYS_DEBUG_BREAK
.L_general_65:

    ; [066] BREQ (taken)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    breq .L_general_66
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_66:
    sys SYS_DEBUG_BREAK

    ; [067] BRNE (not taken)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    brne .L_general_67
    sys SYS_DEBUG_BREAK
.L_general_67:

    ; [068] BRNE (taken)
    ldi8 c0, 1
    tst16 c0
    sys SYS_DEBUG_BREAK
    brne .L_general_68
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_68:
    sys SYS_DEBUG_BREAK

    ; [069] BRULT (not taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brult .L_general_69
    sys SYS_DEBUG_BREAK
.L_general_69:

    ; [070] BRULT (taken)
    ldi8 c0, 0
    ldi8 c1, 1
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brult .L_general_70
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_70:
    sys SYS_DEBUG_BREAK

    ; [071] BRUGE (not taken)
    ldi8 c0, 0
    ldi8 c1, 1
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    bruge .L_general_71
    sys SYS_DEBUG_BREAK
.L_general_71:

    ; [072] BRUGE (taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    bruge .L_general_72
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_72:
    sys SYS_DEBUG_BREAK

    ; [073] BRSLT (not taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brslt .L_general_73
    sys SYS_DEBUG_BREAK
.L_general_73:

    ; [074] BRSLT (taken)
    ldi8 c0, 0x80
    sext8 r4
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brslt .L_general_74
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_74:
    sys SYS_DEBUG_BREAK

    ; [075] BRSGE (not taken)
    ldi8 c0, 0x80
    sext8 r4
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brsge .L_general_75
    sys SYS_DEBUG_BREAK
.L_general_75:

    ; [076] BRSGE (taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brsge .L_general_76
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_76:
    sys SYS_DEBUG_BREAK

    ; [077] BRULE (not taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brule .L_general_77
    sys SYS_DEBUG_BREAK
.L_general_77:

    ; [078] BRULE (taken)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    brule .L_general_78
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_78:
    sys SYS_DEBUG_BREAK

    ; [079] BRUGT (not taken)
    ldi8 c0, 0
    tst16 c0
    sys SYS_DEBUG_BREAK
    brugt .L_general_79
    sys SYS_DEBUG_BREAK
.L_general_79:

    ; [080] BRUGT (taken)
    ldi8 c0, 1
    ldi8 c1, 0
    cmp16 c0, c1
    sys SYS_DEBUG_BREAK
    brugt .L_general_80
    sys SYS_DEBUG_BREAK    ; skipped fall-through breakpoint
.L_general_80:
    sys SYS_DEBUG_BREAK

    ; [081] LD8 r0,[r6]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st8 [c2], c1
    sys SYS_DEBUG_BREAK
    ld8 r0, [r6]
    sys SYS_DEBUG_BREAK

    ; [082] ST8 [r6],r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st8 [r6], r0
    sys SYS_DEBUG_BREAK

    ; [083] LD16 r0,[r6]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st16 [c2], c1
    sys SYS_DEBUG_BREAK
    ld16 r0, [r6]
    sys SYS_DEBUG_BREAK

    ; [084] ST16 [r6],r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st16 [r6], r0
    sys SYS_DEBUG_BREAK

    ; [085] LD8 r0,[r6]+
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st8 [c2], c1
    sys SYS_DEBUG_BREAK
    ld8 r0, [r6]+
    sys SYS_DEBUG_BREAK

    ; [086] ST8 [r6]+,r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st8 [r6]+, r0
    sys SYS_DEBUG_BREAK

    ; [087] LD16 r0,[r6]+
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st16 [c2], c1
    sys SYS_DEBUG_BREAK
    ld16 r0, [r6]+
    sys SYS_DEBUG_BREAK

    ; [088] ST16 [r6]+,r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st16 [r6]+, r0
    sys SYS_DEBUG_BREAK

    ; [089] LEA r0,[r6+4]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    sys SYS_DEBUG_BREAK
    lea r0, [r6 + 4]
    sys SYS_DEBUG_BREAK

    ; [090] LD8 r0,[r6+4]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st8 [r6 + 4], r5
    sys SYS_DEBUG_BREAK
    ld8 r0, [r6 + 4]
    sys SYS_DEBUG_BREAK

    ; [091] ST8 [r6+4],r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st8 [r6 + 4], r0
    sys SYS_DEBUG_BREAK

    ; [092] LD16 r0,[r6+4]
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    st16 [r6 + 4], r5
    sys SYS_DEBUG_BREAK
    ld16 r0, [r6 + 4]
    sys SYS_DEBUG_BREAK

    ; [093] ST16 [r6+4],r0
    mov c2, c3
    ldi8 c1, 16
    add c2, c1
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    st16 [r6 + 4], r0
    sys SYS_DEBUG_BREAK

    ; [094] LDSP8 r0,[SP+8]
    ldi8 c1, 0x5a
    mov16 r0, r5
    stsp8 [sp + 8], r0
    sys SYS_DEBUG_BREAK
    ldsp8 r0, [sp + 8]
    sys SYS_DEBUG_BREAK

    ; [095] STSP8 [SP+8],r0
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    stsp8 [sp + 8], r0
    sys SYS_DEBUG_BREAK

    ; [096] LDSP16 r0,[SP+8]
    ldi8 c1, 0x5a
    mov16 r0, r5
    stsp16 [sp + 8], r0
    sys SYS_DEBUG_BREAK
    ldsp16 r0, [sp + 8]
    sys SYS_DEBUG_BREAK

    ; [097] STSP16 [SP+8],r0
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    stsp16 [sp + 8], r0
    sys SYS_DEBUG_BREAK

    ; [098] LDM8 r0,0x0100
    ldi8 c1, 0x5a
    mov16 r0, r5
    stm8 0x0100, r0
    sys SYS_DEBUG_BREAK
    ldm8 r0, 0x0100
    sys SYS_DEBUG_BREAK

    ; [099] STM8 0x0100,r0
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    stm8 0x0100, r0
    sys SYS_DEBUG_BREAK

    ; [100] LDM16 r0,0x0100
    ldi8 c1, 0x5a
    mov16 r0, r5
    stm16 0x0100, r0
    sys SYS_DEBUG_BREAK
    ldm16 r0, 0x0100
    sys SYS_DEBUG_BREAK

    ; [101] STM16 0x0100,r0
    ldi8 c1, 0x5a
    mov16 r0, r5
    sys SYS_DEBUG_BREAK
    stm16 0x0100, r0
    sys SYS_DEBUG_BREAK

    ; [102] JMPF target24
    sys SYS_DEBUG_BREAK
    jmpf .L_jmpf_target
    nop
    .p2align 1
.L_jmpf_target:
    sys SYS_DEBUG_BREAK

    ; [103] CALLF target24
    sys SYS_DEBUG_BREAK
    callf .L_callf_target
.L_callf_return:
    jmp .L_callf_done
    .p2align 1
.L_callf_target:
    sys SYS_DEBUG_BREAK
    ret
.L_callf_done:

    ; [104] RET
    call .L_ret_bench_body
.L_ret_bench_return:
    sys SYS_DEBUG_BREAK
    jmp .L_ret_bench_done
.L_ret_bench_body:
    sys SYS_DEBUG_BREAK
    ret
.L_ret_bench_done:

    ; [105] LDI16 r0,imm16
    sys SYS_DEBUG_BREAK
    ldi16 r0, 0xa55a
    sys SYS_DEBUG_BREAK

    ; [106] LDI8 r0,imm8
    ; Seed a nonzero high byte so the benchmark also exercises zero extension.
    ldi16 r0, 0xffff
    sys SYS_DEBUG_BREAK
    ldi8 r0, 0xa5
    sys SYS_DEBUG_BREAK

    ; [107] ADDI16 r0,imm16
    ldi16 r0, 0x1234
    sys SYS_DEBUG_BREAK
    addi16 r0, 0x4321
    sys SYS_DEBUG_BREAK

    ; [108] SUBI16 r0,imm16
    ldi16 r0, 0x5678
    sys SYS_DEBUG_BREAK
    subi16 r0, 0x1234
    sys SYS_DEBUG_BREAK

    ; [109] ANDI16 r0,imm16
    ldi16 r0, 0xf0f3
    sys SYS_DEBUG_BREAK
    andi16 r0, 0x0ff0
    sys SYS_DEBUG_BREAK

    ; [110] ORI16 r0,imm16
    ldi16 r0, 0x0f00
    sys SYS_DEBUG_BREAK
    ori16 r0, 0x00f3
    sys SYS_DEBUG_BREAK

    ; [111] XORI16 r0,imm16
    ldi16 r0, 0xaaaa
    sys SYS_DEBUG_BREAK
    xori16 r0, 0x0ff0
    sys SYS_DEBUG_BREAK

    ; [112] CMPI16 r0,imm16
    ldi16 r0, 0x1234
    sys SYS_DEBUG_BREAK
    cmpi16 r0, 0x5678
    sys SYS_DEBUG_BREAK

    ; [113] CMPI8 r0,imm8
    ldi16 r0, 0xab34
    sys SYS_DEBUG_BREAK
    cmpi8 r0, 0x56
    sys SYS_DEBUG_BREAK

    ; [114] TST16 r0
    ldi16 r0, 0x8000
    sys SYS_DEBUG_BREAK
    tst16 r0
    sys SYS_DEBUG_BREAK

    ; [115] TST8 r0
    ldi16 r0, 0xab80
    sys SYS_DEBUG_BREAK
    tst8 r0
    sys SYS_DEBUG_BREAK

    ; [116] OR A,r0
    ldi16 c0, 0x1234
    ldi16 r0, 0xa5a5
    sys SYS_DEBUG_BREAK
    or a, r0
    sys SYS_DEBUG_BREAK

    ; [117] XOR A,r0
    ldi16 c0, 0x55aa
    ldi16 r0, 0x0ff0
    sys SYS_DEBUG_BREAK
    xor a, r0
    sys SYS_DEBUG_BREAK

    ; [118] BIC A,r0
    ldi16 c0, 0xffff
    ldi16 r0, 0x0ff0
    sys SYS_DEBUG_BREAK
    bic a, r0
    sys SYS_DEBUG_BREAK

    ; [119] ADD.NF c2,c3
    ldi16 c2, 0x1234
    ldi16 c3, 0x0102
    sys SYS_DEBUG_BREAK
    add.nf c2, c3
    sys SYS_DEBUG_BREAK

    ; [120] SUB.NF c2,c3
    ldi16 c2, 0x1234
    ldi16 c3, 0x0102
    sys SYS_DEBUG_BREAK
    sub.nf c2, c3
    sys SYS_DEBUG_BREAK

    ; [121] AND c2,c3
    ldi16 c2, 0xa55a
    ldi16 c3, 0x0ff0
    sys SYS_DEBUG_BREAK
    and c2, c3
    sys SYS_DEBUG_BREAK

    ; [122] OR c2,c3
    ldi16 c2, 0xa005
    ldi16 c3, 0x0ff0
    sys SYS_DEBUG_BREAK
    or c2, c3
    sys SYS_DEBUG_BREAK

    ; [123] XOR c2,c3
    ldi16 c2, 0x55aa
    ldi16 c3, 0x0ff0
    sys SYS_DEBUG_BREAK
    xor c2, c3
    sys SYS_DEBUG_BREAK

    ; [124] BIC c2,c3
    ldi16 c2, 0xffff
    ldi16 c3, 0x0ff0
    sys SYS_DEBUG_BREAK
    bic c2, c3
    sys SYS_DEBUG_BREAK

    ; [125] LDPBI 0
    sys SYS_DEBUG_BREAK
    ldpbi 0
    sys SYS_DEBUG_BREAK

    ; [126] LDP8 r0,[PB:r6]
    ldpbi 0
    ldi16 r6, 0x0100
    sys SYS_DEBUG_BREAK
    ldp8 r0, [pb:r6]
    sys SYS_DEBUG_BREAK

    ; [127] LDP16 r0,[PB:r6]
    ldpbi 0
    ldi16 r6, 0x0100
    sys SYS_DEBUG_BREAK
    ldp16 r0, [pb:r6]
    sys SYS_DEBUG_BREAK

    ; [128] LDP8 r0,[PB:r6+4]
    ldpbi 0
    ldi16 r6, 0x0100
    sys SYS_DEBUG_BREAK
    ldp8 r0, [pb:r6 + 4]
    sys SYS_DEBUG_BREAK

    ; [129] LDP16 r0,[PB:r6+4]
    ldpbi 0
    ldi16 r6, 0x0100
    sys SYS_DEBUG_BREAK
    ldp16 r0, [pb:r6 + 4]
    sys SYS_DEBUG_BREAK

    ; [130] MOV32 q0,q1
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    ldi16 r2, 0x3333
    ldi16 r3, 0x4444
    sys SYS_DEBUG_BREAK
    mov32 q0, q1
    sys SYS_DEBUG_BREAK

    ; [131] ADD32 q0,q1
    ldi16 r0, 0xffff
    ldi16 r1, 0x1234
    ldi16 r2, 0x0001
    ldi16 r3, 0x4321
    sys SYS_DEBUG_BREAK
    add32 q0, q1
    sys SYS_DEBUG_BREAK

    ; [132] SUB32 q0,q1
    ldi16 r0, 0x0000
    ldi16 r1, 0x5678
    ldi16 r2, 0x0001
    ldi16 r3, 0x1234
    sys SYS_DEBUG_BREAK
    sub32 q0, q1
    sys SYS_DEBUG_BREAK

    ; [133] CMP32 q0,q1
    ldi16 r0, 0x5678
    ldi16 r1, 0x1234
    ldi16 r2, 0x5679
    ldi16 r3, 0x1234
    sys SYS_DEBUG_BREAK
    cmp32 q0, q1
    sys SYS_DEBUG_BREAK

    ; [134] JMPP q0
    ; q0 is a canonical 24-bit code pointer:
    ;   r0 = prog_lo16(target)
    ;   low8(r1) = prog_hi8(target)
    ;   high8(r1) = 0 (LDI8 zero-extends)
    ldi16 r0, prog_lo16(.L_jmpp_target)
    ldi8  r1, prog_hi8(.L_jmpp_target)
    sys SYS_DEBUG_BREAK
    jmpp q0
    sys SYS_DEBUG_BREAK    ; unreachable if JMPP succeeds
.L_jmpp_target:
    sys SYS_DEBUG_BREAK

    ; [135] CALLP q0
    ldi16 r0, prog_lo16(.L_callp_target)
    ldi8  r1, prog_hi8(.L_callp_target)
    sys SYS_DEBUG_BREAK
    callp q0
.L_callp_return:
    jmp .L_callp_done
.L_callp_target:
    sys SYS_DEBUG_BREAK
    ret
.L_callp_done:

    ; E2 accumulator/non-compact-source multiplication page. These three
    ; entries exercise all unsigned/signed operand interpretations.

    ; [136] MULU8 A,r0
    ldi8 c0, 0xf3          ; unsigned 243
    ldi8 r0, 0x11          ; unsigned 17
    sys SYS_DEBUG_BREAK
    mulu8 a, r0
    sys SYS_DEBUG_BREAK

    ; [137] MULS8 A,r1
    ldi8 c0, 0xf3          ; signed -13
    ldi8 r1, 0x11          ; signed 17
    sys SYS_DEBUG_BREAK
    muls8 a, r1
    sys SYS_DEBUG_BREAK

    ; [138] MULSU8 A,r2
    ldi8 c0, 0xf9          ; signed -7
    ldi8 r2, 0xc8          ; unsigned 200
    sys SYS_DEBUG_BREAK
    mulsu8 a, r2
    sys SYS_DEBUG_BREAK

    ; F4 compact-register multiplication page. Use different destination/source
    ; pairs so the benchmark reaches distinct operand-specialized table slots.

    ; [139] MULU8 c1,c2
    ldi8 c1, 0xf3          ; unsigned 243
    ldi8 c2, 0x11          ; unsigned 17
    sys SYS_DEBUG_BREAK
    mulu8 c1, c2
    sys SYS_DEBUG_BREAK

    ; [140] MULS8 c2,c3
    ldi8 c2, 0xf3          ; signed -13
    ldi8 c3, 0x11          ; signed 17
    sys SYS_DEBUG_BREAK
    muls8 c2, c3
    sys SYS_DEBUG_BREAK

    ; [141] MULSU8 c3,c1
    ldi8 c3, 0xf9          ; signed -7
    ldi8 c1, 0xc8          ; unsigned 200
    sys SYS_DEBUG_BREAK
    mulsu8 c3, c1
    sys SYS_DEBUG_BREAK

    ; Restore the original stack pointer before entering the sentinel loop.
    adjsp 64
.L_done:
    sys SYS_DEBUG_BREAK
    jmp .L_done

.size _start, .-_start
