
math_sf_tan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_tan.c
00000000 l    d  .text.tanf	00000000 .text.tanf
00000000 g     F .text.tanf	00000258 tanf
00000000         *UND*	00000000 __kernel_rem_pio2f

Disassembly of section .text.tanf:

<tanf>:
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
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x4b
<L0>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff c8 6b              fcmp	r6, q2, q3
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x247
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 27                 fmul	q1, q3
 ff 24                 fmul	q1, q0
 ff 09                 fadd	q2, q1
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x247
 aa                    xor	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x60
<L2>:
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x206
 c6 e3 cb              ldi16	r6, 0xcbe3
 c7 16 40              ldi16	r7, 0x4016
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0xa2
<L3>:
 c2 01                 ldi8	r6, 0x1
 f4 4a                 stsp16	[sp+0x2], r6
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 03                 fadd	q0, q3
 f2 6a                 mov32	q3, q0
 ff 60                 fneg	q0
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 48              cmp32	q1, q2
 fd 06                 cmov.slt	r0, r6
 fd 0f                 cmov.slt	r1, r7
 a0                    xor	r4, r4
 f4 09                 ldsp16	r5, [sp+0x2]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x208
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1ff
<L4>:
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff c7 0d              ftou32	q3, q1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f7 81                 lsr32.1	q1
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 ff c5 0d              u32tof	q3, q1
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f2 42                 sub	r2, r2
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 ff 2d                 fmul	q3, q1
 f2 64                 mov32	q1, q0
 ff 07                 fadd	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd b9              ldi16	r7, 0xb9fd
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 ff 2d                 fmul	q3, q1
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 ff 07                 fadd	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 c2 03                 ldi8	r6, 0x3
 f0 32 02              ldsp16	r2, [sp+0x2]
 f9 c8                 and	r6, r2
 f4 4a                 stsp16	[sp+0x2], r6
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 ff c8 67              fcmp	r6, q1, q3
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x156
<L5>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 ff 07                 fadd	q1, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 07                 fadd	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x18d
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 ff c8 67              fcmp	r6, q1, q3
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x18f
<L6>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 ff 07                 fadd	q1, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 07                 fadd	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 b6                 dec16	r6
 f4 4a                 stsp16	[sp+0x2], r6
 aa                    xor	r6, r6
 c7 80 f5              ldi16	r7, 0xf580
 f7 6c                 add32	q3, q0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x24e
<L7>:
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1ff
<L8>:
 c6 80 0f              ldi16	r6, 0xf80
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 c6 00 44              ldi16	r6, 0x4400
 c7 35 b7              ldi16	r7, 0xb735
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 c6 09 a3              ldi16	r6, 0xa309
 c7 85 ae              ldi16	r7, 0xae85
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x83
 f0 16 00              leasp	r6, 0x0
 e3 00 00 00           callf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 f4 02                 ldsp16	r6, [sp+0x0]
 88                    and	r6, r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 42              fcmp	r4, q0, q2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x23b
<L9>:
 f2 64                 mov32	q1, q0
 ff 25                 fmul	q1, q1
 f2 69                 mov32	q2, q1
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f4 5a                 stsp16	[sp+0x6], r6
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 2e                 fmul	q3, q2
 ff 03                 fadd	q0, q3
 f4 1a                 ldsp16	r6, [sp+0x6]
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 38                 fdiv	q2, q0
 f4 a6                 tst8	r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x83
