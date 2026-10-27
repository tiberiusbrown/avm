
math_ef_rem_pio2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_rem_pio2.c
00000000 l    d  .text.__ieee754_rem_pio2f	00000000 .text.__ieee754_rem_pio2f
00000000 g     F .text.__ieee754_rem_pio2f	000001a7 __ieee754_rem_pio2f
00000000         *UND*	00000000 avm_small_pio2
00000000         *UND*	00000000 __kernel_rem_pio2f
00000000         *UND*	00000000 avm_rem_pio2f_medium

Disassembly of section .text.__ieee754_rem_pio2f:

<__ieee754_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x21
<L0>:
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x36
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x41
<L1>:
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f2 69                 mov32	q2, q1
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 42                 sub	r2, r2
 f0 07 00 43           ldi16	r3, 0x4300
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0xaf
<L2>:
 f4 5a                 stsp16	[sp+0x6], r6
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 ff 1d                 frempio2
 f4 42                 stsp16	[sp+0x0], r6
 f2 66                 mov32	q1, q2
 ff 0a                 fabs	q2
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x14f
<L3>:
 c4 e3 cb              ldi16	r4, 0xcbe3
 c5 16 40              ldi16	r5, 0x4016
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0xd3
<L4>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 69 c0              cmp32	q3, q0
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f1 21                 mov	r4, r1
 fa bf                 asr16i	r4, 0xf
 c1 01                 ldi8	r5, 0x1
 94                    or	r5, r4
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x1a0
 f0 06 00 50           ldi16	r2, 0x5000
 f0 07 c3 47           ldi16	r3, 0x47c3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x158
<L5>:
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 5a                 stsp16	[sp+0x6], r6
 a0                    xor	r4, r4
 c5 80 44              ldi16	r5, 0x4480
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x160
<L6>:
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 ff 0f                 ftou16
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f4 8c                 lsr16.1	r4
 f4 40                 stsp16	[sp+0x0], r4
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 69                 add32	q2, q1
 f0 64 c8              ldp32	q3, [q2]
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 01                 fsub
 f0 00 03              ldi8	r0, 0x3
 f4 02                 ldsp16	r6, [sp+0x0]
 f9 18                 and	r0, r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 06 dc 0f           ldi16	r2, 0xfdc
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 c4              cmp32	q3, q1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x180
<L7>:
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x16e
<L8>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 a8                 inc16	r0
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x180
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 01                 ldsp16	r5, [sp+0x0]
 71                    st16	[r4], r5
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x38
 e3 00 00 00           callf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x36
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 1a                 ldsp16	r6, [sp+0x6]
 e3 00 00 00           callf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_rem_pio2f_medium
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x36
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b0                 dec16	r0
 f0 38 00              stsp16	[sp+0x0], r0
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 a5                    xor	r5, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 24                    sub	r5, r4
 fd 2c                 cmov.slt	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 71                    st16	[r4], r5
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x38
