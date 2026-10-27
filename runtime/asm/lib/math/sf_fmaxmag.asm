
math_sf_fmaxmag.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_fmaxmag.c
00000000 l    d  .text.fmaxmagf	00000000 .text.fmaxmagf
00000000 g     F .text.fmaxmagf	000000d6 fmaxmagf

Disassembly of section .text.fmaxmagf:

<fmaxmagf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f2 67                 mov32	q1, q3
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c4              cmp32	q3, q1
 f8 16                 cset.ult	r6
 f4 52                 stsp16	[sp+0x4], r6
 aa                    xor	r6, r6
 f0 69 c0              cmp32	q3, q0
 f8 16                 cset.ult	r6
 f4 5a                 stsp16	[sp+0x6], r6
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxmagf
		R_AVM_FAR24	.text.fmaxmagf+0x62
<L0>:
 f2 6b                 mov32	q3, q1
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxmagf
		R_AVM_FAR24	.text.fmaxmagf+0x62
<L1>:
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxmagf
		R_AVM_FAR24	.text.fmaxmagf+0xb2
<L2>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 82                    and	r4, r6
 87                    and	r5, r7
 e2 00 00 00           jmpf	fmaxmagf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaxmagf+0xcf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 42                 sub	r2, r2
 f0 03 40              ldi8	r3, 0x40
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f8 06                 cset.eq	r6
 f0 30 06              ldsp16	r0, [sp+0x6]
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxmagf
		R_AVM_FAR24	.text.fmaxmagf+0xa8
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 f0 31 04              ldsp16	r1, [sp+0x4]
 f9 32                 xor	r1, r4
 f9 7c                 and	r3, r7
 f1 23                 mov	r4, r3
 fa 76                 lsr16i	r4, 0x6
 f9 85                 or	r4, r1
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaxmagf
		R_AVM_FAR24	.text.fmaxmagf+0xc3
<L4>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 e2 00 00 00           jmpf	fmaxmagf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaxmagf+0xcf
 f0 69 c0              cmp32	q3, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	fmaxmagf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaxmagf+0xcf
 f9 14                 and	r0, r5
 f4 a0                 tst8	r0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
