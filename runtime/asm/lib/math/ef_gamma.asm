
math_ef_gamma.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_gamma.c
00000000 l    d  .text.lgammaf	00000000 .text.lgammaf
00000000 l     F .text.avm_gamma_positive_small	000000d1 avm_gamma_positive_small
00000000 l     F .text.avm_lgamma_stirling	00000095 avm_lgamma_stirling
00000000 l     F .text.avm_gamma_reflection_small	00000136 avm_gamma_reflection_small
00000000 l     F .text.avm_lgamma_reflection_large	000000b5 avm_lgamma_reflection_large
00000000 l    d  .text.avm_gamma_positive_small	00000000 .text.avm_gamma_positive_small
00000000 l    d  .text.avm_lgamma_stirling	00000000 .text.avm_lgamma_stirling
00000000 l    d  .text.avm_gamma_reflection_small	00000000 .text.avm_gamma_reflection_small
00000000 l    d  .text.avm_lgamma_reflection_large	00000000 .text.avm_lgamma_reflection_large
00000000 l    d  .text.tgammaf	00000000 .text.tgammaf
00000000 g     F .text.lgammaf	000001e4 lgammaf
00000000         *UND*	00000000 __avm_errno
00000000         *UND*	00000000 logf
00000000 g     F .text.tgammaf	000001ee tgammaf
00000000         *UND*	00000000 __avm_expf_noerrno

Disassembly of section .text.lgammaf:

<lgammaf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0x2c
<L0>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0x50
<L1>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0x58
<L2>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 f0 69 08              cmp32	q0, q2
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0x9b
<L3>:
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0xd4
<L4>:
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 f2 69                 mov32	q2, q1
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0x1dd
<L5>:
 aa                    xor	r6, r6
 c7 00 37              ldi16	r7, 0x3700
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0xda
<L6>:
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0xad
 aa                    xor	r6, r6
 c7 00 b7              ldi16	r7, 0xb700
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ff 06                 fneg	q2
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0xb7
<L7>:
 e3 00 00 00           callf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 ff 06                 fneg	q2
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 00 4b              ldi16	r5, 0x4b00
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0xf8
<L8>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 aa                    xor	r6, r6
 c7 00 41              ldi16	r7, 0x4100
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0x120
<L9>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_gamma_positive_small
 e3 00 00 00           callf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 f2 67                 mov32	q1, q3
 f2 69                 mov32	q2, q1
 ff 13                 ftou32
 ff 11                 u32tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0x15d
<L10>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 c4 8e af              ldi16	r4, 0xaf8e
 c5 44 7c              ldi16	r5, 0x7c44
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0x13d
<L11>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_lgamma_stirling
 09                    mov	r6, r5
 1a                    add	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 ae                    xor	r7, r6
 08                    mov	r6, r4
 9b                    or	r6, r7
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0x1dd
<L12>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 14                 fcmp
 f4 42                 stsp16	[sp+0x0], r6
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 01                 cmpi.s8	r6, 0x1
 f4 12                 ldsp16	r6, [sp+0x4]
 fd 74                 cmov.sge	r6, r4
 fd 7d                 cmov.sge	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 02                 fmul
 ff 15 06 b5 c0 19 bb 03 34 d6 3c 72 54 43 be 5a ce 4f 3f 33 8d d2 bf 00 00 80 3f      fpoly	6, -0.00234608096, 0.026147848, -0.190751821, 0.811742424, -1.64493406, 1.0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 aa                    xor	r6, r6
 c7 e0 c0              ldi16	r7, 0xc0e0
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f1 06                 mov	r0, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 f0 0c 01              cmpi.s8	r0, 0x1
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	lgammaf
		R_AVM_FAR24	.text.lgammaf+0x1d9
<L13>:
 e3 00 00 00           callf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_gamma_reflection_small
 e3 00 00 00           callf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 e2 00 00 00           jmpf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.lgammaf+0x1dd
 e3 00 00 00           callf	lgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_lgamma_reflection_large
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.avm_gamma_positive_small:

<avm_gamma_positive_small>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_gamma_positive_small
		R_AVM_FAR24	.text.avm_gamma_positive_small+0x6d
<L0>:
 f2 68                 mov32	q2, q0
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 e2 00 00 00           jmpf	avm_gamma_positive_small
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_gamma_positive_small+0xcc
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_gamma_positive_small
		R_AVM_FAR24	.text.avm_gamma_positive_small+0x5b
<L1>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.avm_lgamma_stirling:

<avm_lgamma_stirling>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 03 01 0d 50 3a 61 0b 36 bb ab aa aa 3d  fpoly	3, 7.93650805E-4, -0.00277777785, 0.0833333358
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 aa                    xor	r6, r6
 c7 00 bf              ldi16	r7, 0xbf00
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c7 80 7b              ldi16	r7, 0x7b80
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 f4 42                 stsp16	[sp+0x0], r6
 e3 00 00 00           callf	avm_lgamma_stirling
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 02                 cmpi.s8	r4, 0x2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_lgamma_stirling
		R_AVM_FAR24	.text.avm_lgamma_stirling+0x60
<L0>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 e2 00 00 00           jmpf	avm_lgamma_stirling
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_lgamma_stirling+0x76
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 00 bf              ldi16	r7, 0xbf00
 ff 00                 fadd
 c6 8e 3f              ldi16	r6, 0x3f8e
 c7 6b 3f              ldi16	r7, 0x3f6b
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.avm_gamma_reflection_small:

<avm_gamma_reflection_small>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_gamma_reflection_small
		R_AVM_FAR24	.text.avm_gamma_reflection_small+0x5f
<L0>:
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 e2 00 00 00           jmpf	avm_gamma_reflection_small
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_gamma_reflection_small+0x11f
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_gamma_reflection_small
		R_AVM_FAR24	.text.avm_gamma_reflection_small+0xc6
<L1>:
 f2 68                 mov32	q2, q0
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 e2 00 00 00           jmpf	avm_gamma_reflection_small
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_gamma_reflection_small+0x11f
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_gamma_reflection_small
		R_AVM_FAR24	.text.avm_gamma_reflection_small+0xb4
<L2>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 03                 fdiv
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.avm_lgamma_reflection_large:

<avm_lgamma_reflection_large>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e3 00 00 00           callf	avm_lgamma_reflection_large
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 69                 mov32	q2, q1
 ff 15 03 01 0d 50 3a 61 0b 36 bb ab aa aa 3d  fpoly	3, 7.93650805E-4, -0.00277777785, 0.0833333358
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	avm_lgamma_reflection_large
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 aa                    xor	r6, r6
 c7 00 bf              ldi16	r7, 0xbf00
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c7 80 7b              ldi16	r7, 0x7b80
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_lgamma_reflection_large
		R_AVM_FAR24	.text.avm_lgamma_reflection_large+0x76
<L0>:
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 e2 00 00 00           jmpf	avm_lgamma_reflection_large
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_lgamma_reflection_large+0x8c
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 00 bf              ldi16	r7, 0xbf00
 ff 00                 fadd
 c6 8e 3f              ldi16	r6, 0x3f8e
 c7 6b 3f              ldi16	r7, 0x3f6b
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 06                 fneg	q2
 ff 01                 fsub
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.tgammaf:

<tgammaf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x26
<L0>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tgammaf+0x1c7
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x1c7
<L1>:
 f2 30                 sub	r0, r0
 f0 05 80 ff           ldi16	r1, 0xff80
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x52
<L2>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e2 00 00 00           jmpf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tgammaf+0x1c7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x96
<L3>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 36           ldi16	r1, 0x36ff
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0xa5
<L4>:
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 1a                    add	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 ae                    xor	r7, r6
 08                    mov	r6, r4
 9b                    or	r6, r7
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x1c7
<L5>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tgammaf+0x1c7
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 c6 80 7f              ldi16	r6, 0x7f80
 99                    or	r6, r5
 06                    mov	r5, r6
 e2 00 00 00           jmpf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tgammaf+0x1c7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0xcc
<L6>:
 aa                    xor	r6, r6
 c7 00 41              ldi16	r7, 0x4100
 f2 62                 mov32	q0, q2
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x198
<L7>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_gamma_positive_small
 e2 00 00 00           jmpf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tgammaf+0x1c7
 f2 30                 sub	r0, r0
 f0 05 00 4b           ldi16	r1, 0x4b00
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x44
<L8>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 f2 69                 mov32	q2, q1
 ff 13                 ftou32
 f4 50                 stsp16	[sp+0x4], r4
 f4 5b                 stsp16	[sp+0x6], r7
 ff 11                 u32tof
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x44
<L9>:
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 2c c2              ldi16	r7, 0xc22c
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 14                 fcmp
 c4 ff ff              ldi16	r4, 0xffff
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 82                 xor	r4, r0
 fa 3f                 lsl16i	r4, 0xf
 04                    mov	r5, r4
 a0                    xor	r4, r4
 ce 01                 cmpi.s8	r6, 0x1
 d9 04                 brsge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x8c
<L10>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 61                 mov32	q0, q1
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 14                 fcmp
 f4 42                 stsp16	[sp+0x0], r6
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 01                 cmpi.s8	r6, 0x1
 fd 54                 cmov.sge	r2, r4
 fd 5d                 cmov.sge	r3, r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 ff 15 06 b5 c0 19 bb 03 34 d6 3c 72 54 43 be 5a ce 4f 3f 33 8d d2 bf 00 00 80 3f      fpoly	6, -0.00234608096, 0.026147848, -0.190751821, 0.811742424, -1.64493406, 1.0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 aa                    xor	r6, r6
 c7 e0 c0              ldi16	r7, 0xc0e0
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 14                 fcmp
 f4 62                 stsp16	[sp+0x8], r6
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x1ce
<L11>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_gamma_reflection_small
 e2 00 00 00           jmpf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tgammaf+0x1e7
 c6 10 29              ldi16	r6, 0x2910
 c7 0c 42              ldi16	r7, 0x420c
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x1bf
<L12>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_lgamma_stirling
 e3 00 00 00           callf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_expf_noerrno
 c6 80 7f              ldi16	r6, 0x7f80
 a9                    xor	r6, r5
 0c                    mov	r7, r4
 9e                    or	r7, r6
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x1c7
<L13>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 f2 69                 mov32	q2, q1
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_lgamma_reflection_large
 e3 00 00 00           callf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_expf_noerrno
 c2 7f                 ldi8	r6, 0x7f
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tgammaf
		R_AVM_FAR24	.text.tgammaf+0x1e7
<L14>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 f4 1b                 ldsp16	r7, [sp+0x6]
 97                    or	r5, r7
 e2 00 00 00           jmpf	tgammaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tgammaf+0x1c7
