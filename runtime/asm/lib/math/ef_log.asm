
math_ef_log.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_log.c
00000000 l    d  .text.logf	00000000 .text.logf
00000000 g     F .text.logf	00000171 logf

Disassembly of section .text.logf:

<logf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x2e
<L0>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 68              fcmp	r6, q2, q0
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x154
<L1>:
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x14d
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x4d
<L2>:
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 ff 28                 fmul	q2, q0
 c7 68 ff              ldi16	r7, 0xff68
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x50
 c7 81 ff              ldi16	r7, 0xff81
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 61                 add32	q0, q1
 c2 80                 ldi8	r6, 0x80
 f9 c4                 and	r6, r1
 f9 79                 or	r3, r6
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 13                    add	r4, r7
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 0e                 fadd	q3, q2
 c5 80 3d              ldi16	r5, 0x3d80
 f2 63                 mov32	q0, q3
 ff 64                 fabs	q0
 ff c8 42              fcmp	r4, q0, q2
 cc 01                 cmpi.s8	r4, 0x1
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x10d
<L3>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 63                 mov32	q0, q3
 ff 02                 fadd	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 38                 fdiv	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 62                 mov32	q0, q2
 ff 20                 fmul	q0, q0
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 20                 fmul	q0, q0
 f2 68                 mov32	q2, q0
 ff ca 04 97 88 17 3e 25 33 3a 3e 25 49 92 3e ab aa 2a 3f      fpoly	4, 0.147981986, 0.181835726, 0.285714298, 0.666666686
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 26                 fmul	q1, q2
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 68                 mov32	q2, q0
 ff ca 03 4f d0 1c 3e 29 8e 63 3e cd cc cc 3e  fpoly	3, 0.153138384, 0.222221985, 0.400000006
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 f2 69                 mov32	q2, q1
 ff 08                 fadd	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 08                 fadd	q2, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 22                 fmul	q0, q2
 ff 11                 fsub	q0, q1
 ff 0c                 fadd	q3, q0
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x12e
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 ab aa 2a 3e cd cc 4c be 00 00 80 3e ab aa aa be 00 00 00 3f  fpoly	5, 0.166666672, -0.200000003, 0.25, -0.333333343, 0.5
 f2 63                 mov32	q0, q3
 ff 20                 fmul	q0, q0
 ff 22                 fmul	q0, q2
 ff 1c                 fsub	q3, q0
 f4 20                 ldsp16	r4, [sp+0x8]
 ff c0 40              s16tof	q0, r4
 f0 06 80 71           ldi16	r2, 0x7180
 f0 07 31 3f           ldi16	r3, 0x3f31
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 37           ldi16	r3, 0x3717
 ff 21                 fmul	q0, q1
 ff 03                 fadd	q0, q3
 ff 08                 fadd	q2, q0
 d6 0c                 adjsp	0xc
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
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x169
<L4>:
 ff 0a                 fadd	q2, q2
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x14d
 ff 1a                 fsub	q2, q2
 ff 38                 fdiv	q2, q0
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x14d
