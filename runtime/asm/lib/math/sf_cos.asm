
math_sf_cos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_cos.c
00000000 l    d  .text.cosf	00000000 .text.cosf
00000000 g     F .text.cosf	00000282 cosf
00000000         *UND*	00000000 __kernel_rem_pio2f

Disassembly of section .text.cosf:

<cosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 49 3f           ldi16	r1, 0x3f49
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x32
<L0>:
 f2 30                 sub	r0, r0
 f0 05 80 39           ldi16	r1, 0x3980
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x52
<L1>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x275
 f2 30                 sub	r0, r0
 f0 38 08              stsp16	[sp+0x8], r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x6b
<L2>:
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1f7
 ff 2a                 fmul	q2, q2
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x275
 f0 06 e3 cb           ldi16	r2, 0xcbe3
 f0 07 16 40           ldi16	r3, 0x4016
 f0 69 4c              cmp32	q1, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0xc7
<L3>:
 f2 63                 mov32	q0, q3
 c2 01                 ldi8	r6, 0x1
 f4 52                 stsp16	[sp+0x4], r6
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 ff 01                 fadd	q0, q1
 f0 06 69 21           ldi16	r2, 0x2169
 f0 07 a2 b3           ldi16	r3, 0xb3a2
 ff 01                 fadd	q0, q1
 f2 6a                 mov32	q3, q0
 ff 63                 fneg	q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 48              cmp32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 fd 20                 cmov.slt	r4, r0
 fd 29                 cmov.slt	r5, r1
 aa                    xor	r6, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 2b                    sub	r6, r7
 fd 37                 cmov.slt	r6, r7
 f4 62                 stsp16	[sp+0x8], r6
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x1f7
 f0 06 00 50           ldi16	r2, 0x5000
 f0 07 c3 47           ldi16	r3, 0x47c3
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x1ec
<L4>:
 f0 04 83 f9           ldi16	r0, 0xf983
 f0 05 a2 3f           ldi16	r1, 0x3fa2
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 ff 2c                 fmul	q3, q0
 ff c7 0f              ftou32	q3, q3
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f2 68                 mov32	q2, q0
 f7 82                 lsr32.1	q2
 ff c5 02              u32tof	q0, q2
 aa                    xor	r6, r6
 c7 c9 bf              ldi16	r7, 0xbfc9
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 6a                 mov32	q3, q0
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 2d                 fmul	q3, q1
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 ff 07                 fadd	q1, q3
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd b9              ldi16	r7, 0xb9fd
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f2 6a                 mov32	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 2c                 fmul	q3, q0
 ff 07                 fadd	q1, q3
 f0 00 03              ldi8	r0, 0x3
 f9 10                 and	r0, r4
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 ff c8 67              fcmp	r6, q1, q3
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x15f
<L5>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 07                 fadd	q1, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 07                 fadd	q1, q3
 f4 a8                 inc16	r0
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x182
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff c8 67              fcmp	r6, q1, q3
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x182
<L6>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 07                 fadd	q1, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 07                 fadd	q1, q3
 f4 b0                 dec16	r0
 f0 38 04              stsp16	[sp+0x4], r0
 aa                    xor	r6, r6
 c7 80 f5              ldi16	r7, 0xf580
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f7 6c                 add32	q3, q0
 f2 69                 mov32	q2, q1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x27c
<L7>:
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x1ec
<L8>:
 c6 80 0f              ldi16	r6, 0xf80
 c7 c9 bf              ldi16	r7, 0xbfc9
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 ff 01                 fadd	q0, q1
 c6 00 44              ldi16	r6, 0x4400
 c7 35 b7              ldi16	r7, 0xb735
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 c6 09 a3              ldi16	r6, 0xa309
 c7 85 ae              ldi16	r7, 0xae85
 ff 2b                 fmul	q2, q3
 ff 02                 fadd	q0, q2
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x9a
 f0 16 08              leasp	r6, 0x8
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e3 00 00 00           callf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 c2 01                 ldi8	r6, 0x1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f9 c8                 and	r6, r2
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x21f
<L9>:
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x24d
<L10>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x262
 aa                    xor	r6, r6
 c7 80 39              ldi16	r7, 0x3980
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x262
<L11>:
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
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x262
 ff 2a                 fmul	q2, q2
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 f4 aa                 inc16	r2
 f0 00 02              ldi8	r0, 0x2
 f9 08                 and	r0, r2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 63                 fneg	q3
 f4 a0                 tst8	r0
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x9a
