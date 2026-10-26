
math_ef_rem_pio2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_rem_pio2.c
00000000 l    d  .text.__ieee754_rem_pio2f	00000000 .text.__ieee754_rem_pio2f
00000000 g     F .text.__ieee754_rem_pio2f	000001be __ieee754_rem_pio2f
00000000         *UND*	00000000 __kernel_rem_pio2f

Disassembly of section .text.__ieee754_rem_pio2f:

<__ieee754_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 f2 62                 mov32	q0, q2
 ff 64                 fabs	q0
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x1b7
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x32
<L1>:
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x1b7
 f0 06 e3 cb           ldi16	r2, 0xcbe3
 f0 07 16 40           ldi16	r3, 0x4016
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x7e
<L2>:
 f4 42                 stsp16	[sp+0x0], r6
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 03                 fadd	q0, q3
 c2 01                 ldi8	r6, 0x1
 f4 4a                 stsp16	[sp+0x2], r6
 f2 6a                 mov32	q3, q0
 ff 63                 fneg	q3
 f2 64                 mov32	q1, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 fd 22                 cmov.slt	r4, r2
 fd 2b                 cmov.slt	r5, r3
 aa                    xor	r6, r6
 0e                    mov	r7, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 2e                    sub	r7, r6
 fd 3e                 cmov.slt	r7, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 7b                    st16	[r6], r7
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x1b7
 f0 06 00 50           ldi16	r2, 0x5000
 f0 07 c3 47           ldi16	r3, 0x47c3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x1b3
<L3>:
 f4 42                 stsp16	[sp+0x0], r6
 f0 06 83 f9           ldi16	r2, 0xf983
 f0 07 a2 3f           ldi16	r3, 0x3fa2
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 ff 21                 fmul	q0, q1
 ff c7 00              ftou32	q0, q0
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f7 83                 lsr32.1	q3
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 ff c5 0f              u32tof	q3, q3
 f2 30                 sub	r0, r0
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 ff 01                 fadd	q0, q1
 f0 06 22 aa           ldi16	r2, 0xaa22
 f0 07 fd b9           ldi16	r3, 0xb9fd
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f2 67                 mov32	q1, q3
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 f0 02 03              ldi8	r2, 0x3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f9 58                 and	r2, r6
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 ff c8 63              fcmp	r6, q0, q3
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x113
<L4>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 03                 fadd	q0, q3
 f4 aa                 inc16	r2
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x136
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff c8 63              fcmp	r6, q0, q3
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x136
<L5>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 03                 fadd	q0, q3
 f4 b2                 dec16	r2
 f0 3a 02              stsp16	[sp+0x2], r2
 f2 64                 mov32	q1, q0
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 aa                    xor	r6, r6
 c7 80 f5              ldi16	r7, 0xf580
 f7 6c                 add32	q3, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x1ab
<L6>:
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x1b1
<L7>:
 c6 80 0f              ldi16	r6, 0xf80
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 ff 23                 fmul	q0, q3
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 ff 04                 fadd	q1, q0
 c6 00 44              ldi16	r6, 0x4400
 c7 35 b7              ldi16	r7, 0xb735
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 ff 23                 fmul	q0, q3
 ff 04                 fadd	q1, q0
 f2 61                 mov32	q0, q1
 c6 09 a3              ldi16	r6, 0xa309
 c7 85 ae              ldi16	r7, 0xae85
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x59
 f2 61                 mov32	q0, q1
 e2 00 00 00           jmpf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__ieee754_rem_pio2f+0x59
 f4 02                 ldsp16	r6, [sp+0x0]
 e3 00 00 00           callf	__ieee754_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
