
math_ef_remquo.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_remquo.c
00000000 l    d  .text.remquof	00000000 .text.remquof
00000000 g     F .text.remquof	00000186 remquof
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.remquof:

<remquof>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f2 66                 mov32	q1, q2
 f0 30 1f              ldsp16	r0, [sp+0x1f]
 f2 39                 sub	r1, r1
 f0 38 12              stsp16	[sp+0x12], r0
 ee 30 20              st16	[r0+0], r1
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 ff 09                 fabs	q1
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x75
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 0b                 fabs	q3
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 69 c0              cmp32	q3, q0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x75
<L1>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x178
<L2>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x178
<L3>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x7f
<L4>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e2 00 00 00           jmpf	remquof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remquof+0x171
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 e2 00 00 00           jmpf	remquof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remquof+0x171
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 aa                    xor	r6, r6
 c7 00 41              ldi16	r7, 0x4100
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 1c                 fmod
 f2 66                 mov32	q1, q2
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 aa                    xor	r6, r6
 c7 80 40              ldi16	r7, 0x4080
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c1 04                 ldi8	r5, 0x4
 f0 69 4c              cmp32	q1, q3
 a0                    xor	r4, r4
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0xec
<L5>:
 f2 6b                 mov32	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x105
<L6>:
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x131
<L7>:
 e2 00 00 00           jmpf	remquof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remquof+0x11c
 c0 02                 ldi8	r4, 0x2
 f4 21                 ldsp16	r5, [sp+0x8]
 94                    or	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x10f
<L8>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 aa                 inc16	r2
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x131
<L9>:
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x141
<L10>:
 c0 01                 ldi8	r4, 0x1
 f9 88                 and	r4, r2
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x141
<L11>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 aa                 inc16	r2
 e2 00 00 00           jmpf	remquof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remquof+0x145
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c0 07                 ldi8	r4, 0x7
 f9 88                 and	r4, r2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 a5                    xor	r5, r5
 24                    sub	r5, r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 fd 25                 cmov.slt	r4, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 74                    st16	[r5], r4
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 87                    and	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e2 00 00 00           jmpf	remquof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remquof+0x171
