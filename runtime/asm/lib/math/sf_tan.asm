
math_sf_tan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_tan.c
00000000 l    d  .text.tanf	00000000 .text.tanf
00000000 g     F .text.tanf	00000319 tanf
00000000         *UND*	00000000 __ieee754_rem_pio2f

Disassembly of section .text.tanf:

<tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f2 66                 mov32	q1, q2
 ff 65                 fabs	q1
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x10a
<L0>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 31           ldi16	r1, 0x317f
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x35
<L1>:
 ff c2 62              ftos16	r6, q2
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x2aa
<L2>:
 c6 3f a1              ldi16	r6, 0xa13f
 c7 2c 3f              ldi16	r7, 0x3f2c
 f0 69 c4              cmp32	q3, q1
 f8 16                 cset.ult	r6
 f4 42                 stsp16	[sp+0x0], r6
 c6 40 a1              ldi16	r6, 0xa140
 f0 69 4c              cmp32	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x84
<L3>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f2 62                 mov32	q0, q2
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 f0 05 00 80           ldi16	r1, 0x8000
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 ff 1d                 fsub	q3, q1
 f0 04 68 21           ldi16	r0, 0x2168
 f0 05 22 33           ldi16	r1, 0x3322
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 11                 fsub	q0, q1
 ff 0c                 fadd	q3, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 63                 mov32	q0, q3
 ff 20                 fmul	q0, q0
 f2 68                 mov32	q2, q0
 ff ca 05 44 a2 d6 3b 15 4e ea 3b 2f b0 b6 3c 6f db 5c 3d 0b 89 08 3e  fpoly	5, 0.00655010528, 0.00715042138, 0.0223008078, 0.0539202057, 0.133335277
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c2 01                 ldi8	r6, 0x1
 f4 03                 ldsp16	r7, [sp+0x0]
 8e                    and	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 ff 28                 fmul	q2, q0
 f0 06 aa aa           ldi16	r2, 0xaaaa
 f0 07 aa 3e           ldi16	r3, 0x3eaa
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f2 67                 mov32	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 0b                 fadd	q2, q3
 ff 22                 fmul	q0, q2
 ff 03                 fadd	q0, q3
 ff 04                 fadd	q1, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0d                 fadd	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x182
<L4>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 63                 mov32	q0, q3
 ff 02                 fadd	q0, q2
 ff 2f                 fmul	q3, q3
 ff 3c                 fdiv	q3, q0
 ff 1d                 fsub	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 13                 fsub	q0, q3
 ff 00                 fadd	q0, q0
 ff 18                 fsub	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x296
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x17c
<L5>:
 f0 16 14              leasp	r6, 0x14
 e3 00 00 00           callf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__ieee754_rem_pio2f
 10                    add	r4, r4
 c1 02                 ldi8	r5, 0x2
 81                    and	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f2 6b                 mov32	q3, q1
 ff 67                 fabs	q3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 31           ldi16	r1, 0x317f
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x188
<L6>:
 ff c2 51              ftos16	r5, q1
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x188
<L7>:
 c0 02                 ldi8	r4, 0x2
 f4 11                 ldsp16	r5, [sp+0x4]
 a1                    xor	r4, r5
 06                    mov	r5, r6
 94                    or	r5, r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1ce
<L8>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 39                 fdiv	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2aa
 ff 1a                 fsub	q2, q2
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2aa
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2aa
 c4 3f a1              ldi16	r4, 0xa13f
 c5 2c 3f              ldi16	r5, 0x3f2c
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 f4 60                 stsp16	[sp+0x8], r4
 c4 40 a1              ldi16	r4, 0xa140
 f0 69 c8              cmp32	q3, q2
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1c8
<L9>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d3 04                 brslt8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x1d8
<L10>:
 f2 69                 mov32	q2, q1
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x1ea
 f2 61                 mov32	q0, q1
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x200
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 3b                 fdiv	q2, q3
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2aa
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 60                 fneg	q0
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 ff 1e                 fsub	q3, q2
 f0 06 68 21           ldi16	r2, 0x2168
 f0 07 22 33           ldi16	r3, 0x3322
 ff 14                 fsub	q1, q0
 f2 61                 mov32	q0, q1
 ff 03                 fadd	q0, q3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 ff 20                 fmul	q0, q0
 f2 68                 mov32	q2, q0
 ff ca 05 44 a2 d6 3b 15 4e ea 3b 2f b0 b6 3c 6f db 5c 3d 0b 89 08 3e  fpoly	5, 0.00655010528, 0.00715042138, 0.0223008078, 0.0539202057, 0.133335277
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c2 01                 ldi8	r6, 0x1
 f4 20                 ldsp16	r4, [sp+0x8]
 82                    and	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 24                 fmul	q1, q0
 c6 aa aa              ldi16	r6, 0xaaaa
 c7 aa 3e              ldi16	r7, 0x3eaa
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2d                 fmul	q3, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 07                 fadd	q1, q3
 ff 21                 fmul	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0c                 fadd	q3, q0
 ff 0b                 fadd	q2, q3
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 ff 02                 fadd	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x2b1
<L11>:
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 01                 ldi8	r5, 0x1
 24                    sub	r5, r4
 ff c0 52              s16tof	q2, r5
 f2 64                 mov32	q1, q0
 ff 06                 fadd	q1, q2
 ff 20                 fmul	q0, q0
 ff 31                 fdiv	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 13                 fsub	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 1c                 fsub	q3, q0
 ff 0f                 fadd	q3, q3
 ff 1b                 fsub	q2, q3
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9e                 lsr16i	r6, 0xe
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 c2 01                 ldi8	r6, 0x1
 f7 7c                 sub32	q3, q0
 ff c4 0f              s32tof	q3, q3
 ff 2b                 fmul	q2, q3
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tanf
		R_AVM_FAR24	.text.tanf+0x2c1
<L12>:
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2aa
 f2 42                 sub	r2, r2
 f0 07 80 bf           ldi16	r3, 0xbf80
 ff 34                 fdiv	q1, q0
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f2 69                 mov32	q2, q1
 82                    and	r4, r6
 87                    and	r5, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 64                 mov32	q1, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 27                 fmul	q1, q3
 f2 6b                 mov32	q3, q1
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ff 0d                 fadd	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 11                 fsub	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 1c                 fsub	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 2c                 fmul	q3, q0
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 07                 fadd	q1, q3
 ff 29                 fmul	q2, q1
 ff 08                 fadd	q2, q0
 e2 00 00 00           jmpf	tanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tanf+0x2aa
