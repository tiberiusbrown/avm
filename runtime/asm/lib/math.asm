
math.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 math.c
00000000 l    d  .text.log2f	00000000 .text.log2f
00000000 l    d  .text.fminf	00000000 .text.fminf
00000000 l    d  .text.fmaxf	00000000 .text.fmaxf
00000000 g     F .text.log2f	00000170 log2f
00000000 g     F .text.fminf	00000085 fminf
00000000 g     F .text.fmaxf	0000007b fmaxf

Disassembly of section .text.log2f:

<log2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x2e
<L0>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 68              fcmp	r6, q2, q0
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x153
<L1>:
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x14c
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x4d
<L2>:
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 ff 28                 fmul	q2, q0
 c6 68 ff              ldi16	r6, 0xff68
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x50
 c6 81 ff              ldi16	r6, 0xff81
 f4 72                 stsp16	[sp+0xc], r6
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6d                 add32	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c2 80                 ldi8	r6, 0x80
 8b                    and	r6, r7
 f9 79                 or	r3, r6
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 03                 fadd	q0, q3
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 c7 80 3d              ldi16	r7, 0x3d80
 f2 64                 mov32	q1, q0
 ff 65                 fabs	q1
 ff c8 57              fcmp	r5, q1, q3
 f4 2b                 ldsp16	r7, [sp+0xa]
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 ff c0 61              s16tof	q1, r6
 cd 01                 cmpi.s8	r5, 0x1
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x11f
<L3>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f2 64                 mov32	q1, q0
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 39                 fdiv	q2, q1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 66                 mov32	q1, q2
 ff 25                 fmul	q1, q1
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 ff 25                 fmul	q1, q1
 f2 69                 mov32	q2, q1
 ff ca 04 97 88 17 3e 25 33 3a 3e 25 49 92 3e ab aa 2a 3f      fpoly	4, 0.147981986, 0.181835726, 0.285714298, 0.666666686
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2e                 fmul	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f2 69                 mov32	q2, q1
 ff ca 03 4f d0 1c 3e 29 8e 63 3e cd cc cc 3e  fpoly	3, 0.153138384, 0.222221985, 0.400000006
 ff 26                 fmul	q1, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 ff 09                 fadd	q2, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0b                 fadd	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2e                 fmul	q3, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 1e                 fsub	q3, q2
 ff 03                 fadd	q0, q3
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x140
 f2 68                 mov32	q2, q0
 ff ca 05 ab aa 2a 3e cd cc 4c be 00 00 80 3e ab aa aa be 00 00 00 3f  fpoly	5, 0.166666672, -0.200000003, 0.25, -0.333333343, 0.5
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 ff 2e                 fmul	q3, q2
 ff 13                 fsub	q0, q3
 f2 68                 mov32	q2, q0
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 ff 2b                 fmul	q2, q3
 ff 09                 fadd	q2, q1
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log2f
		R_AVM_FAR24	.text.log2f+0x168
<L4>:
 ff 0a                 fadd	q2, q2
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x14c
 ff 1a                 fsub	q2, q2
 ff 38                 fdiv	q2, q0
 e2 00 00 00           jmpf	log2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log2f+0x14c

Disassembly of section .text.fminf:

<fminf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminf
		R_AVM_FAR24	.text.fminf+0x2f
<L0>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e2 00 00 00           jmpf	fminf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminf+0x7e
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminf
		R_AVM_FAR24	.text.fminf+0x46
<L1>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	fminf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminf+0x7e
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminf
		R_AVM_FAR24	.text.fminf+0x7a
<L2>:
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff c8 4c              fcmp	r4, q3, q0
 cc ff                 cmpi.s8	r4, -0x1
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fminf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminf+0x7e
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.fmaxf:

<fmaxf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxf
		R_AVM_FAR24	.text.fmaxf+0x74
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxf
		R_AVM_FAR24	.text.fmaxf+0x44
<L1>:
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	fmaxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaxf+0x74
 02                    mov	r4, r6
 07                    mov	r5, r7
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxf
		R_AVM_FAR24	.text.fmaxf+0x70
<L2>:
 ff c8 43              fcmp	r4, q0, q3
 cc 01                 cmpi.s8	r4, 0x1
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 e2 00 00 00           jmpf	fmaxf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaxf+0x74
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
