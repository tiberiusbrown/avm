
math_kf_sin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_sin.c
00000000 l    d  .text.__kernel_sinf	00000000 .text.__kernel_sinf
00000000 g     F .text.__kernel_sinf	000000da __kernel_sinf

Disassembly of section .text.__kernel_sinf:

<__kernel_sinf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 32 1f              ldsp16	r2, [sp+0x1f]
 f0 3a 10              stsp16	[sp+0x10], r2
 f2 42                 sub	r2, r2
 f0 07 00 32           ldi16	r3, 0x3200
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_sinf
		R_AVM_FAR24	.text.__kernel_sinf+0xd3
<L0>:
 f2 62                 mov32	q0, q2
 ff 20                 fmul	q0, q0
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff ca 05 d3 c9 2e 2f 34 2f d7 b2 1b ef 38 36 01 0d 50 b9 89 88 08 3c  fpoly	5, 1.58969102E-10, -2.50507597E-8, 2.75573143E-6, -1.98412701E-4, 0.00833333377
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 ff 24                 fmul	q1, q0
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 32 10              ldsp16	r2, [sp+0x10]
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_sinf
		R_AVM_FAR24	.text.__kernel_sinf+0xbd
<L1>:
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 21                 fmul	q0, q1
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 2c                 fmul	q3, q0
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 1d                 fsub	q3, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 23                 fmul	q0, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 13                 fsub	q0, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a 3e              ldi16	r7, 0x3e2a
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 ff 18                 fsub	q2, q0
 e2 00 00 00           jmpf	__kernel_sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_sinf+0xd3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 23                 fmul	q0, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a be              ldi16	r7, 0xbe2a
 ff 03                 fadd	q0, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2c                 fmul	q3, q0
 ff 0b                 fadd	q2, q3
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
