
math_kf_cos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_cos.c
00000000 l    d  .text.__kernel_cosf	00000000 .text.__kernel_cosf
00000000 g     F .text.__kernel_cosf	000000e8 __kernel_cosf

Disassembly of section .text.__kernel_cosf:

<__kernel_cosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f2 42                 sub	r2, r2
 f0 07 00 32           ldi16	r3, 0x3200
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_cosf
		R_AVM_FAR24	.text.__kernel_cosf+0x29
<L0>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	__kernel_cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_cosf+0xe1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 66                 mov32	q1, q2
 ff 25                 fmul	q1, q1
 f2 69                 mov32	q2, q1
 ff ca 06 4e d7 47 ad f6 74 0f 31 7c f2 93 b4 01 0d d0 37 61 0b b6 ba ab aa 2a 3d      fpoly	6, -1.13596476E-11, 2.08757234E-9, -2.75573143E-7, 2.48015876E-5, -0.00138888892, 0.0416666679
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c4 99 99              ldi16	r4, 0x9999
 c5 99 3e              ldi16	r5, 0x3e99
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_cosf
		R_AVM_FAR24	.text.__kernel_cosf+0x90
<L1>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 2e                 fmul	q3, q2
 f2 69                 mov32	q2, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 28                 fmul	q2, q0
 ff 1e                 fsub	q3, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 26                 fmul	q1, q2
 ff 07                 fadd	q1, q3
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	__kernel_cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_cosf+0xdf
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c7 48 3f              ldi16	r7, 0x3f48
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c7 90 3e              ldi16	r7, 0x3e90
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c0              cmp32	q3, q0
 f4 2b                 ldsp16	r7, [sp+0xa]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 2e                 fmul	q3, q2
 f2 69                 mov32	q2, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 28                 fmul	q2, q0
 ff 1e                 fsub	q3, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 26                 fmul	q1, q2
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 14                 fsub	q1, q0
 ff 07                 fadd	q1, q3
 c5 80 3f              ldi16	r5, 0x3f80
 ff 18                 fsub	q2, q0
 ff 19                 fsub	q2, q1
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
