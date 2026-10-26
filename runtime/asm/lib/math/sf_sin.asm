
math_sf_sin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_sin.c
00000000 l    d  .text.sinf	00000000 .text.sinf
00000000 g     F .text.sinf	00000265 sinf
00000000         *UND*	00000000 __kernel_rem_pio2f

Disassembly of section .text.sinf:

<sinf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f2 62                 mov32	q0, q2
 ff 64                 fabs	q0
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x47
<L0>:
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x254
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x254
 aa                    xor	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x5c
<L2>:
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x1d5
 c6 e3 cb              ldi16	r6, 0xcbe3
 c7 16 40              ldi16	r7, 0x4016
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x9e
<L3>:
 c2 01                 ldi8	r6, 0x1
 f4 5a                 stsp16	[sp+0x6], r6
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 03                 fadd	q0, q3
 f2 6a                 mov32	q3, q0
 ff 63                 fneg	q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 48              cmp32	q1, q2
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 a0                    xor	r4, r4
 f4 19                 ldsp16	r5, [sp+0x6]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x1d7
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x1ce
<L4>:
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff c7 0d              ftou32	q3, q1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f7 81                 lsr32.1	q1
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 ff c5 05              u32tof	q1, q1
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 aa                    xor	r6, r6
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 27                 fmul	q1, q3
 f2 6a                 mov32	q3, q0
 ff 0d                 fadd	q3, q1
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd b9              ldi16	r7, 0xb9fd
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 ff 27                 fmul	q1, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 ff 0d                 fadd	q3, q1
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c2 03                 ldi8	r6, 0x3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f9 c8                 and	r6, r2
 f4 5a                 stsp16	[sp+0x6], r6
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 3f           ldi16	r3, 0x3f49
 f4 0a                 ldsp16	r6, [sp+0x2]
 ff c8 6d              fcmp	r6, q3, q1
 f0 32 02              ldsp16	r2, [sp+0x2]
 f1 1f                 mov	r3, r7
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x139
<L5>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 07                 fadd	q1, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 07                 fadd	q1, q3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 ae                 inc16	r6
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x15e
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff c8 67              fcmp	r6, q1, q3
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x160
<L6>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 07                 fadd	q1, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 07                 fadd	q1, q3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 b6                 dec16	r6
 f4 5a                 stsp16	[sp+0x6], r6
 aa                    xor	r6, r6
 c7 80 f5              ldi16	r7, 0xf580
 f7 6c                 add32	q3, q0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x25b
<L7>:
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x1ce
<L8>:
 c6 80 0f              ldi16	r6, 0xf80
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 c6 00 44              ldi16	r6, 0x4400
 c7 35 b7              ldi16	r7, 0xb735
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 c6 09 a3              ldi16	r6, 0xa309
 c7 85 ae              ldi16	r7, 0xae85
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x7f
 f0 16 00              leasp	r6, 0x0
 e3 00 00 00           callf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 c0 01                 ldi8	r4, 0x1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f9 88                 and	r4, r2
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x218
<L9>:
 a0                    xor	r4, r4
 c5 80 39              ldi16	r5, 0x3980
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x246
<L10>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 2a                 fmul	q2, q2
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 ff 2e                 fmul	q3, q2
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x246
 a0                    xor	r4, r4
 c5 80 39              ldi16	r5, 0x3980
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sinf
		R_AVM_FAR24	.text.sinf+0x22d
<L11>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x246
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c0 02                 ldi8	r4, 0x2
 f9 50                 and	r2, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 62                 fneg	q2
 f4 a2                 tst8	r2
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 e2 00 00 00           jmpf	sinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sinf+0x7f
