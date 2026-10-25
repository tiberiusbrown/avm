
math_kf_tan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_tan.c
00000000 l    d  .text.__kernel_tanf	00000000 .text.__kernel_tanf
00000000 g     F .text.__kernel_tanf	00000263 __kernel_tanf

Disassembly of section .text.__kernel_tanf:

<__kernel_tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f2 63                 mov32	q0, q3
 f2 66                 mov32	q1, q2
 f0 34 2b              ldsp16	r4, [sp+0x2b]
 f4 50                 stsp16	[sp+0x4], r4
 f2 6b                 mov32	q3, q1
 ff 67                 fabs	q3
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 31              ldi16	r5, 0x317f
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x57
<L0>:
 ff c2 41              ftos16	r4, q1
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x57
<L1>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 ac                 inc16	r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 92                    or	r4, r6
 97                    or	r5, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x95
<L2>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 39                 fdiv	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 ce 01                 cmpi.s8	r6, 0x1
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0x25a
 c4 3f a1              ldi16	r4, 0xa13f
 c5 2c 3f              ldi16	r5, 0x3f2c
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 f4 60                 stsp16	[sp+0x8], r4
 c4 40 a1              ldi16	r4, 0xa140
 f0 69 c8              cmp32	q3, q2
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x8b
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0xa1
<L4>:
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0xa7
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0xc3
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ff 37                 fdiv	q1, q3
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0x25a
 ff 60                 fneg	q0
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 ff 1e                 fsub	q3, q2
 f0 06 68 21           ldi16	r2, 0x2168
 f0 07 22 33           ldi16	r3, 0x3322
 ff 14                 fsub	q1, q0
 ff 07                 fadd	q1, q3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 ff 25                 fmul	q1, q1
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 ff 25                 fmul	q1, q1
 c4 84 53              ldi16	r4, 0x5384
 c5 d9 37              ldi16	r5, 0x37d9
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c4 7a c0              ldi16	r4, 0xc07a
 c5 95 38              ldi16	r5, 0x3895
 ff 02                 fadd	q0, q2
 c6 5f ae              ldi16	r6, 0xae5f
 c7 9b b7              ldi16	r7, 0xb79b
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 45 f4              ldi16	r6, 0xf445
 c7 a3 38              ldi16	r7, 0x38a3
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 c8 26              ldi16	r4, 0x26c8
 c5 1a 3a              ldi16	r5, 0x3a1a
 ff 0e                 fadd	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 69                 mov32	q2, q1
 ff 28                 fmul	q2, q0
 f0 04 b9 37           ldi16	r0, 0x37b9
 f0 05 81 39           ldi16	r1, 0x3981
 ff 08                 fadd	q2, q0
 c2 01                 ldi8	r6, 0x1
 f4 23                 ldsp16	r7, [sp+0x8]
 8e                    and	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c4 48 de              ldi16	r4, 0xde48
 c5 be 3a              ldi16	r5, 0x3abe
 ff 02                 fadd	q0, q2
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2b                 fmul	q2, q3
 c6 16 69              ldi16	r6, 0x6916
 c7 6b 3b              ldi16	r7, 0x3b6b
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 a4 27              ldi16	r4, 0x27a4
 c5 b3 3c              ldi16	r5, 0x3cb3
 ff 0e                 fadd	q3, q2
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 89 88              ldi16	r6, 0x8889
 c7 08 3e              ldi16	r7, 0x3e08
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f0 04 1f 37           ldi16	r0, 0x371f
 f0 05 11 3c           ldi16	r1, 0x3c11
 ff 0c                 fadd	q3, q0
 ff 27                 fmul	q1, q3
 c6 d1 0d              ldi16	r6, 0xdd1
 c7 5d 3d              ldi16	r7, 0x3d5d
 ff 07                 fadd	q1, q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 0b                 fadd	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2c                 fmul	q3, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 aa 3e           ldi16	r1, 0x3eaa
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f2 63                 mov32	q0, q3
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 ff 21                 fmul	q0, q1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 ff 2e                 fmul	q3, q2
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f2 68                 mov32	q2, q0
 ff 0b                 fadd	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2e                 fmul	q3, q2
 ff 03                 fadd	q0, q3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 08                 fadd	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 ff 02                 fadd	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x202
<L5>:
 f4 10                 ldsp16	r4, [sp+0x4]
 ff c0 41              s16tof	q1, r4
 f2 6a                 mov32	q3, q0
 ff 0d                 fadd	q3, q1
 ff 20                 fmul	q0, q0
 ff 33                 fdiv	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 13                 fsub	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 1c                 fsub	q3, q0
 ff 0f                 fadd	q3, q3
 ff 17                 fsub	q1, q3
 f0 37 16              ldsp16	r7, [sp+0x16]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9e                 lsr16i	r6, 0xe
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 c2 01                 ldi8	r6, 0x1
 f7 7c                 sub32	q3, q0
 ff c4 0f              s32tof	q3, q3
 ff 27                 fmul	q1, q3
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0x25a
 f4 10                 ldsp16	r4, [sp+0x4]
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x212
<L6>:
 f2 64                 mov32	q1, q0
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0x25a
 f2 42                 sub	r2, r2
 f0 07 80 bf           ldi16	r3, 0xbf80
 ff 34                 fdiv	q1, q0
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f2 69                 mov32	q2, q1
 82                    and	r4, r6
 87                    and	r5, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 13                 fsub	q0, q3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 18                 fsub	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2b                 fmul	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 02                 fadd	q0, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 f2 69                 mov32	q2, q1
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
