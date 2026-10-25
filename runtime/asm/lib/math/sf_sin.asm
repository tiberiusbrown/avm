
math_sf_sin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_sin.c
00000000 l    d  .text.sinf	00000000 .text.sinf
00000000 g     F .text.sinf	000004a2 sinf
00000000         *UND*	00000000 __ieee754_rem_pio2f

Disassembly of section .text.sinf:

<sinf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f0 06 d8 0f           ldi16	r2, 0xfd8
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x92
<L0>:
 f2 30                 sub	r0, r0
 f0 05 00 32           ldi16	r1, 0x3200
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x49b
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f0 04 d3 c9           ldi16	r0, 0xc9d3
 f0 05 2e 2f           ldi16	r1, 0x2f2e
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 34 2f           ldi16	r0, 0x2f34
 f0 05 d7 b2           ldi16	r1, 0xb2d7
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 1b ef           ldi16	r2, 0xef1b
 f0 07 38 36           ldi16	r3, 0x3638
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 01 0d           ldi16	r0, 0xd01
 f0 05 50 b9           ldi16	r1, 0xb950
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 89 88           ldi16	r2, 0x8889
 f0 07 08 3c           ldi16	r3, 0x3c08
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a be           ldi16	r1, 0xbe2a
 ff 04                 fadd	q1, q0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 21                 fmul	q0, q1
 ff 08                 fadd	q2, q0
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x49b
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x190
<L2>:
 f0 16 0c              leasp	r6, 0xc
 e3 00 00 00           callf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__ieee754_rem_pio2f
 c2 03                 ldi8	r6, 0x3
 88                    and	r6, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 ce 02                 cmpi.s8	r6, 0x2
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x196
<L3>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x26b
<L4>:
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x49b
<L5>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 04 d3 c9           ldi16	r0, 0xc9d3
 f0 05 2e 2f           ldi16	r1, 0x2f2e
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 34 2f           ldi16	r0, 0x2f34
 f0 05 d7 b2           ldi16	r1, 0xb2d7
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 1b ef           ldi16	r2, 0xef1b
 f0 07 38 36           ldi16	r3, 0x3638
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 01 0d           ldi16	r0, 0xd01
 f0 05 50 b9           ldi16	r1, 0xb950
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 89 88           ldi16	r2, 0x8889
 f0 07 08 3c           ldi16	r3, 0x3c08
 ff 01                 fadd	q0, q1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 61                 mov32	q0, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 23                 fmul	q0, q3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 24                 fmul	q1, q0
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 21                 fmul	q0, q1
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 ff 11                 fsub	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2c                 fmul	q3, q0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 1c                 fsub	q3, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 0c                 fadd	q3, q0
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x49b
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x49b
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x286
<L6>:
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x499
<L7>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 04 d3 c9           ldi16	r0, 0xc9d3
 f0 05 2e 2f           ldi16	r1, 0x2f2e
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 34 2f           ldi16	r0, 0x2f34
 f0 05 d7 b2           ldi16	r1, 0xb2d7
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 1b ef           ldi16	r2, 0xef1b
 f0 07 38 36           ldi16	r3, 0x3638
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 01 0d           ldi16	r0, 0xd01
 f0 05 50 b9           ldi16	r1, 0xb950
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 89 88           ldi16	r2, 0x8889
 f0 07 08 3c           ldi16	r3, 0x3c08
 ff 01                 fadd	q0, q1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 61                 mov32	q0, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 23                 fmul	q0, q3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 24                 fmul	q1, q0
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 21                 fmul	q0, q1
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 ff 11                 fsub	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2c                 fmul	q3, q0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 1c                 fsub	q3, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 0c                 fadd	q3, q0
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x499
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x2a1
<L8>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x49b
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x340
<L9>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x499
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 06 4e d7           ldi16	r2, 0xd74e
 f0 07 47 ad           ldi16	r3, 0xad47
 ff 2d                 fmul	q3, q1
 f0 06 f6 74           ldi16	r2, 0x74f6
 f0 07 0f 31           ldi16	r3, 0x310f
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 7c f2              ldi16	r6, 0xf27c
 c7 93 b4              ldi16	r7, 0xb493
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2d                 fmul	q3, q1
 f0 06 01 0d           ldi16	r2, 0xd01
 f0 07 d0 37           ldi16	r3, 0x37d0
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 61 0b              ldi16	r6, 0xb61
 c7 b6 ba              ldi16	r7, 0xbab6
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2d                 fmul	q3, q1
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 2a 3d           ldi16	r3, 0x3d2a
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 99 99              ldi16	r6, 0x9999
 c7 99 3e              ldi16	r7, 0x3e99
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x3dd
<L10>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 23                 fmul	q0, q3
 ff 02                 fadd	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 18                 fsub	q2, q0
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x49b
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 06 4e d7           ldi16	r2, 0xd74e
 f0 07 47 ad           ldi16	r3, 0xad47
 ff 2d                 fmul	q3, q1
 f0 06 f6 74           ldi16	r2, 0x74f6
 f0 07 0f 31           ldi16	r3, 0x310f
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 7c f2              ldi16	r6, 0xf27c
 c7 93 b4              ldi16	r7, 0xb493
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2d                 fmul	q3, q1
 f0 06 01 0d           ldi16	r2, 0xd01
 f0 07 d0 37           ldi16	r3, 0x37d0
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 61 0b              ldi16	r6, 0xb61
 c7 b6 ba              ldi16	r7, 0xbab6
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2d                 fmul	q3, q1
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 2a 3d           ldi16	r3, 0x3d2a
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 99 99              ldi16	r6, 0x9999
 c7 99 3e              ldi16	r7, 0x3e99
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x43d
<L11>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 23                 fmul	q0, q3
 ff 02                 fadd	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x497
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f7 6c                 add32	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 48 3f              ldi16	r7, 0x3f48
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c7 90 3e              ldi16	r7, 0x3e90
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 23                 fmul	q0, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 13                 fsub	q0, q3
 ff 02                 fadd	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 1b                 fsub	q2, q3
 ff 18                 fsub	q2, q0
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x49b
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f7 6c                 add32	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 48 3f              ldi16	r7, 0x3f48
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c7 90 3e              ldi16	r7, 0x3e90
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 23                 fmul	q0, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 13                 fsub	q0, q3
 ff 02                 fadd	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 1b                 fsub	q2, q3
 ff 18                 fsub	q2, q0
 ff 62                 fneg	q2
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
