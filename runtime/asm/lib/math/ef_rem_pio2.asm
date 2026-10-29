
math_ef_rem_pio2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_rem_pio2.c
00000000 l    d  .text.__ieee754_rem_pio2f	00000000 .text.__ieee754_rem_pio2f
00000000 g     F .text.__ieee754_rem_pio2f	00000176 __ieee754_rem_pio2f
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
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x135
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x3a
<L1>:
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 01                 fsub
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x135
 f0 06 e3 cb           ldi16	r2, 0xcbe3
 f0 07 16 40           ldi16	r3, 0x4016
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x8e
<L2>:
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 68                 mov32	q2, q0
 f4 5a                 stsp16	[sp+0x6], r6
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 06                 fneg	q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f1 29                 mov	r6, r1
 fa df                 asr16i	r6, 0xf
 c3 01                 ldi8	r7, 0x1
 9e                    or	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 7b                    st16	[r6], r7
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x135
 f0 06 00 50           ldi16	r2, 0x5000
 f0 07 c3 47           ldi16	r3, 0x47c3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x129
<L3>:
 f2 42                 sub	r2, r2
 f0 07 80 44           ldi16	r3, 0x4480
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x131
<L4>:
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 5a                 stsp16	[sp+0x6], r6
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
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x14e
<L5>:
 f6 2d                 tst16	r5
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x13c
<L6>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 a8                 inc16	r0
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x14e
 e3 00 00 00           callf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x135
 e3 00 00 00           callf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_rem_pio2f_medium
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b0                 dec16	r0
 f0 38 00              stsp16	[sp+0x0], r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 af                    xor	r7, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 2e                    sub	r7, r6
 fd 3e                 cmov.slt	r7, r6
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x87
