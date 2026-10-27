
math_ef_remquo.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_remquo.c
00000000 l    d  .text.remquof	00000000 .text.remquof
00000000 g     F .text.remquof	00000158 remquof
00000000         *UND*	00000000 fmodf

Disassembly of section .text.remquof:

<remquof>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f2 66                 mov32	q1, q2
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 71                    st16	[r4], r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 ff 09                 fabs	q1
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x7b
<L0>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 ff 0b                 fabs	q3
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 69 c8              cmp32	q3, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x7b
<L1>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x81
<L2>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x81
<L3>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x88
<L4>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e2 00 00 00           jmpf	remquof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remquof+0x81
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 aa                    xor	r6, r6
 c7 00 41              ldi16	r7, 0x4100
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	remquof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fmodf
 f2 66                 mov32	q1, q2
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
 f4 41                 stsp16	[sp+0x0], r5
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0xdc
<L5>:
 c0 02                 ldi8	r4, 0x2
 f4 01                 ldsp16	r5, [sp+0x0]
 94                    or	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0xf3
<L6>:
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x118
<L7>:
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x128
<L8>:
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remquof
		R_AVM_FAR24	.text.remquof+0x128
<L9>:
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 e2 00 00 00           jmpf	remquof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remquof+0x12a
 f4 01                 ldsp16	r5, [sp+0x0]
 c0 07                 ldi8	r4, 0x7
 81                    and	r4, r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 a5                    xor	r5, r5
 24                    sub	r5, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 fd 25                 cmov.slt	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 74                    st16	[r5], r4
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 87                    and	r5, r7
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 e2 00 00 00           jmpf	remquof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remquof+0x81
