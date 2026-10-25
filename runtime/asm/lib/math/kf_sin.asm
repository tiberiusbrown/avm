
math_kf_sin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_sin.c
00000000 l    d  .text.__kernel_sinf	00000000 .text.__kernel_sinf
00000000 g     F .text.__kernel_sinf	000000d6 __kernel_sinf

Disassembly of section .text.__kernel_sinf:

<__kernel_sinf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 30 19              ldsp16	r0, [sp+0x19]
 f0 38 08              stsp16	[sp+0x8], r0
 f2 30                 sub	r0, r0
 f0 05 00 32           ldi16	r1, 0x3200
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_sinf
		R_AVM_FAR24	.text.__kernel_sinf+0xcf
<L0>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 ff 2f                 fmul	q3, q3
 c4 d3 c9              ldi16	r4, 0xc9d3
 c5 2e 2f              ldi16	r5, 0x2f2e
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 c4 34 2f              ldi16	r4, 0x2f34
 c5 d7 b2              ldi16	r5, 0xb2d7
 ff 06                 fadd	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 29                 fmul	q2, q1
 f0 06 1b ef           ldi16	r2, 0xef1b
 f0 07 38 36           ldi16	r3, 0x3638
 ff 09                 fadd	q2, q1
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 01 0d              ldi16	r4, 0xd01
 c5 50 b9              ldi16	r5, 0xb950
 ff 02                 fadd	q0, q2
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 c4 89 88              ldi16	r4, 0x8889
 c5 08 3c              ldi16	r5, 0x3c08
 ff 06                 fadd	q1, q2
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 ff 23                 fmul	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_sinf
		R_AVM_FAR24	.text.__kernel_sinf+0xb7
<L1>:
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 ff 21                 fmul	q0, q1
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 26                 fmul	q1, q2
 ff 14                 fsub	q1, q0
 ff 2d                 fmul	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 1c                 fsub	q3, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 28                 fmul	q2, q0
 ff 0e                 fadd	q3, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ff 1b                 fsub	q2, q3
 e2 00 00 00           jmpf	__kernel_sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_sinf+0xcf
 ff 2d                 fmul	q3, q1
 f2 68                 mov32	q2, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a be           ldi16	r1, 0xbe2a
 ff 0c                 fadd	q3, q0
 ff 2b                 fmul	q2, q3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 ff 0e                 fadd	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
