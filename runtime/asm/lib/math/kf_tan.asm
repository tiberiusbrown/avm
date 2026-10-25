
math_kf_tan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_tan.c
00000000 l    d  .text.__kernel_tanf	00000000 .text.__kernel_tanf
00000000 g     F .text.__kernel_tanf	00000200 __kernel_tanf

Disassembly of section .text.__kernel_tanf:

<__kernel_tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f2 63                 mov32	q0, q3
 f2 66                 mov32	q1, q2
 f0 34 27              ldsp16	r4, [sp+0x27]
 f4 40                 stsp16	[sp+0x0], r4
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
 f4 00                 ldsp16	r4, [sp+0x0]
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
		R_AVM_FAR24	.text.__kernel_tanf+0x97
<L2>:
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 ff 31                 fdiv	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 01                 cmpi.s8	r6, 0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0x1f7
 c4 3f a1              ldi16	r4, 0xa13f
 c5 2c 3f              ldi16	r5, 0x3f2c
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 f4 60                 stsp16	[sp+0x8], r4
 c4 40 a1              ldi16	r4, 0xa140
 f0 69 c8              cmp32	q3, q2
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x8d
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0xa3
<L4>:
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0xab
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0xc7
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 ff 33                 fdiv	q0, q3
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0x1f7
 f2 6a                 mov32	q3, q0
 ff 63                 fneg	q3
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 49 3f           ldi16	r1, 0x3f49
 ff 12                 fsub	q0, q2
 f0 06 68 21           ldi16	r2, 0x2168
 f0 07 22 33           ldi16	r3, 0x3322
 ff 17                 fsub	q1, q3
 ff 04                 fadd	q1, q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 ff 25                 fmul	q1, q1
 c4 44 a2              ldi16	r4, 0xa244
 c5 d6 3b              ldi16	r5, 0x3bd6
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c4 15 4e              ldi16	r4, 0x4e15
 c5 ea 3b              ldi16	r5, 0x3bea
 ff 02                 fadd	q0, q2
 f2 69                 mov32	q2, q1
 ff 28                 fmul	q2, q0
 f0 04 2f b0           ldi16	r0, 0xb02f
 f0 05 b6 3c           ldi16	r1, 0x3cb6
 ff 08                 fadd	q2, q0
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c4 6f db              ldi16	r4, 0xdb6f
 c5 5c 3d              ldi16	r5, 0x3d5c
 ff 02                 fadd	q0, q2
 c0 01                 ldi8	r4, 0x1
 f4 21                 ldsp16	r5, [sp+0x8]
 84                    and	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 69                 mov32	q2, q1
 ff 28                 fmul	q2, q0
 f0 04 0b 89           ldi16	r0, 0x890b
 f0 05 08 3e           ldi16	r1, 0x3e08
 ff 08                 fadd	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2d                 fmul	q3, q1
 f0 04 aa aa           ldi16	r0, 0xaaaa
 f0 05 aa 3e           ldi16	r1, 0x3eaa
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 2e                 fmul	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0b                 fadd	q2, q3
 ff 26                 fmul	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 09                 fadd	q2, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 02                 fadd	q0, q2
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 ff 04                 fadd	q1, q0
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x19b
<L5>:
 f4 00                 ldsp16	r4, [sp+0x0]
 ff c0 40              s16tof	q0, r4
 f2 6b                 mov32	q3, q1
 ff 0c                 fadd	q3, q0
 ff 25                 fmul	q1, q1
 ff 37                 fdiv	q1, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 17                 fsub	q1, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 1d                 fsub	q3, q1
 ff 0f                 fadd	q3, q3
 ff 13                 fsub	q0, q3
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9e                 lsr16i	r6, 0xe
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 82                    and	r4, r6
 c2 01                 ldi8	r6, 0x1
 f7 7e                 sub32	q3, q2
 ff c4 0f              s32tof	q3, q3
 ff 23                 fmul	q0, q3
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0x1f7
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_FAR24	.text.__kernel_tanf+0x1ab
<L6>:
 f2 61                 mov32	q0, q1
 e2 00 00 00           jmpf	__kernel_tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_tanf+0x1f7
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 ff 31                 fdiv	q0, q1
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f2 68                 mov32	q2, q0
 82                    and	r4, r6
 87                    and	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 17                 fsub	q1, q3
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 19                 fsub	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2b                 fmul	q2, q3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 06                 fadd	q1, q2
 ff 21                 fmul	q0, q1
 ff 03                 fadd	q0, q3
 f2 68                 mov32	q2, q0
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
