
math_ef_rem_pio2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_rem_pio2.c
00000000 l    d  .text.__ieee754_rem_pio2f	00000000 .text.__ieee754_rem_pio2f
00000000 g     F .text.__ieee754_rem_pio2f	0000016d __ieee754_rem_pio2f
00000000         *UND*	00000000 avm_small_pio2
00000000         *UND*	00000000 __kernel_rem_pio2f
00000000         *UND*	00000000 avm_rem_pio2f_medium

Disassembly of section .text.__ieee754_rem_pio2f:

<__ieee754_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 62                 mov32	q0, q2
 ff 64                 fabs	q0
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
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x166
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x38
<L1>:
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x166
 f0 06 e3 cb           ldi16	r2, 0xcbe3
 f0 07 16 40           ldi16	r3, 0x4016
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x7f
<L2>:
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 ff 01                 fadd	q0, q1
 f0 06 69 21           ldi16	r2, 0x2169
 f0 07 a2 b3           ldi16	r3, 0xb3a2
 ff 01                 fadd	q0, q1
 f4 4a                 stsp16	[sp+0x2], r6
 f2 64                 mov32	q1, q0
 ff 61                 fneg	q1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 fd 10                 cmov.slt	r2, r0
 fd 19                 cmov.slt	r3, r1
 09                    mov	r6, r5
 f2 69                 mov32	q2, q1
 fa df                 asr16i	r6, 0xf
 c3 01                 ldi8	r7, 0x1
 9e                    or	r7, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 7b                    st16	[r6], r7
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x166
 f0 06 00 50           ldi16	r2, 0x5000
 f0 07 c3 47           ldi16	r3, 0x47c3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x122
<L3>:
 f2 42                 sub	r2, r2
 f0 07 80 44           ldi16	r3, 0x4480
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x12a
<L4>:
 f4 4a                 stsp16	[sp+0x2], r6
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff c3 71              ftou16	r7, q1
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 f4 8f                 lsr16.1	r7
 f4 43                 stsp16	[sp+0x0], r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	avm_small_pio2
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	avm_small_pio2
 f7 67                 add32	q1, q3
 f0 64 44              ldp32	q1, [q1]
 ff 11                 fsub	q0, q1
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	avm_small_pio2+0x4
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	avm_small_pio2+0x4
 f7 67                 add32	q1, q3
 f0 64 c4              ldp32	q3, [q1]
 ff 13                 fsub	q0, q3
 c2 03                 ldi8	r6, 0x3
 f4 03                 ldsp16	r7, [sp+0x0]
 8b                    and	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 c6 dc 0f              ldi16	r6, 0xfdc
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 4c              cmp32	q1, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x148
<L5>:
 f0 69 c0              cmp32	q3, q0
 d3 04                 brslt8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x132
<L6>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 03                 fadd	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x146
 e3 00 00 00           callf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x166
 e3 00 00 00           callf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_rem_pio2f_medium
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x166
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 03                 fadd	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b6                 dec16	r6
 f4 42                 stsp16	[sp+0x0], r6
 f2 6a                 mov32	q3, q0
 ff 63                 fneg	q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 48              cmp32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 fd 20                 cmov.slt	r4, r0
 fd 29                 cmov.slt	r5, r1
 aa                    xor	r6, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 2b                    sub	r6, r7
 fd 37                 cmov.slt	r6, r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 7e                    st16	[r7], r6
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
