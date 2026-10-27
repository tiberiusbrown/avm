
math_sf_fdim.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_fdim.c
00000000 l    d  .text.fdimf	00000000 .text.fdimf
00000000 g     F .text.fdimf	0000006b fdimf

Disassembly of section .text.fdimf:

<fdimf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f2 66                 mov32	q1, q2
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fdimf
		R_AVM_FAR24	.text.fdimf+0x3f
<L0>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fdimf
		R_AVM_FAR24	.text.fdimf+0x49
<L1>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 e2 00 00 00           jmpf	fdimf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fdimf+0x64
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 f1 16                 mov	r2, r6
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 0e 01              cmpi.s8	r2, 0x1
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
