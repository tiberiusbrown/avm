
math_sf_sincos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_sincos.c
00000000 l    d  .text.sincosf	00000000 .text.sincosf
00000000 g     F .text.sincosf	00000287 sincosf
00000000         *UND*	00000000 __kernel_rem_pio2f

Disassembly of section .text.sincosf:

<sincosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 f4 4b                 stsp16	[sp+0x2], r7
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 f4 52                 stsp16	[sp+0x4], r6
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 49 3f           ldi16	r1, 0x3f49
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x43
<L0>:
 f2 30                 sub	r0, r0
 f0 05 80 39           ldi16	r1, 0x3980
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x5e
<L1>:
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x26c
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x68
<L2>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 1f                 fsub	q3, q3
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x26c
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x21c
 f0 04 e3 cb           ldi16	r0, 0xcbe3
 f0 05 16 40           ldi16	r1, 0x4016
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0xb4
<L3>:
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 ff 0c                 fadd	q3, q0
 f0 04 69 21           ldi16	r0, 0x2169
 f0 05 a2 b3           ldi16	r1, 0xb3a2
 ff 0c                 fadd	q3, q0
 c0 01                 ldi8	r4, 0x1
 f4 68                 stsp16	[sp+0xa], r4
 f2 63                 mov32	q0, q3
 ff 60                 fneg	q0
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f0 69 84              cmp32	q2, q1
 fd 06                 cmov.slt	r0, r6
 fd 0f                 cmov.slt	r1, r7
 a0                    xor	r4, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x21c
 f0 04 00 50           ldi16	r0, 0x5000
 f0 05 c3 47           ldi16	r1, 0x47c3
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x20d
<L4>:
 f0 04 83 f9           ldi16	r0, 0xf983
 f0 05 a2 3f           ldi16	r1, 0x3fa2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 ff c7 0a              ftou32	q2, q2
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f7 80                 lsr32.1	q0
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 ff c5 08              u32tof	q2, q0
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 30                 sub	r0, r0
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 ff 28                 fmul	q2, q0
 f2 63                 mov32	q0, q3
 ff 02                 fadd	q0, q2
 c4 22 aa              ldi16	r4, 0xaa22
 c5 fd b9              ldi16	r5, 0xb9fd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 ff 29                 fmul	q2, q1
 ff 02                 fadd	q0, q2
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 c0 03                 ldi8	r4, 0x3
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f9 80                 and	r4, r0
 f4 68                 stsp16	[sp+0xa], r4
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 3f              ldi16	r5, 0x3f49
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 ff c8 42              fcmp	r4, q0, q2
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x162
<L5>:
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 bf              ldi16	r5, 0xbfc9
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 ff 02                 fadd	q0, q2
 c4 69 21              ldi16	r4, 0x2169
 c5 a2 b3              ldi16	r5, 0xb3a2
 ff 02                 fadd	q0, q2
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 ac                 inc16	r4
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x199
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 bf              ldi16	r5, 0xbf49
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 ff c8 42              fcmp	r4, q0, q2
 cc ff                 cmpi.s8	r4, -0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x19b
<L6>:
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 ff 02                 fadd	q0, q2
 c4 69 21              ldi16	r4, 0x2169
 c5 a2 33              ldi16	r5, 0x33a2
 ff 02                 fadd	q0, q2
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 b4                 dec16	r4
 f4 68                 stsp16	[sp+0xa], r4
 a0                    xor	r4, r4
 c5 80 f5              ldi16	r5, 0xf580
 f7 6b                 add32	q2, q3
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x27d
<L7>:
 c4 01 01              ldi16	r4, 0x101
 a5                    xor	r5, r5
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x20d
<L8>:
 c4 80 0f              ldi16	r4, 0xf80
 c5 c9 bf              ldi16	r5, 0xbfc9
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 ff 22                 fmul	q0, q2
 ff 0c                 fadd	q3, q0
 c4 00 44              ldi16	r4, 0x4400
 c5 35 b7              ldi16	r5, 0xb735
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 ff 22                 fmul	q0, q2
 ff 0c                 fadd	q3, q0
 c4 09 a3              ldi16	r4, 0xa309
 c5 85 ae              ldi16	r5, 0xae85
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 ff 22                 fmul	q0, q2
 ff 0c                 fadd	q3, q0
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x91
 f0 10 04              leasp	r0, 0x4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 28                 mov	r6, r0
 e3 00 00 00           callf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__kernel_rem_pio2f
 f2 62                 mov32	q0, q2
 f2 64                 mov32	q1, q0
 ff 25                 fmul	q1, q1
 f2 69                 mov32	q2, q1
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 ff 22                 fmul	q0, q2
 f2 69                 mov32	q2, q1
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 f2 66                 mov32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f4 11                 ldsp16	r5, [sp+0x4]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 f2 6b                 mov32	q3, q1
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 ff 60                 fneg	q0
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 c0 02                 ldi8	r4, 0x2
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sincosf
		R_AVM_FAR24	.text.sincosf+0x26c
<L9>:
 ff 60                 fneg	q0
 ff 63                 fneg	q3
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b c8              st32	[r4], q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 6b 08              st32	[r4], q0
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e2 00 00 00           jmpf	sincosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sincosf+0x91
