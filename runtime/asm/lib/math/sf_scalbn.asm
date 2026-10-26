
math_sf_scalbn.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_scalbn.c
00000000 l    d  .text.scalbnf	00000000 .text.scalbnf
00000000 g     F .text.scalbnf	0000015a scalbnf

Disassembly of section .text.scalbnf:

<scalbnf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xe0
<L0>:
 f4 52                 stsp16	[sp+0x4], r6
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x5c
<L1>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x62
<L2>:
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 2b                 fmul	q2, q3
 c6 cf 8a              ldi16	r6, 0x8acf
 f4 13                 ldsp16	r7, [sp+0x4]
 3b                    cmp	r6, r7
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x6b
<L3>:
 c6 60 42              ldi16	r6, 0x4260
 c7 a2 0d              ldi16	r7, 0xda2
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xde
 ff 0a                 fadd	q2, q2
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xe0
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0x7d
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f9 58                 and	r2, r6
 c6 e7 ff              ldi16	r6, 0xffe7
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 c6 31 75              ldi16	r6, 0x7531
 3e                    cmp	r7, r6
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xa4
<L4>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 c6 49 71              ldi16	r6, 0x7149
 c7 49 f1              ldi16	r7, 0xf149
 f0 69 80              cmp32	q2, q0
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xd2
 f2 66                 mov32	q1, q2
 0b                    mov	r6, r7
 fa ef                 asr16i	r7, 0xf
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6b                 add32	q2, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xe7
<L5>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 c6 49 71              ldi16	r6, 0x7149
 c7 49 f1              ldi16	r7, 0xf149
 f0 69 40              cmp32	q1, q0
 fb 77                 cmov.ne	r6, r7
 c4 ca f2              ldi16	r4, 0xf2ca
 06                    mov	r5, r6
 c6 ca f2              ldi16	r6, 0xf2ca
 c7 49 71              ldi16	r7, 0x7149
 ff 2b                 fmul	q2, q3
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 02                    mov	r4, r6
 07                    mov	r5, r7
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f2 69                 mov32	q2, q1
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x108
<L6>:
 f0 04 7f 80           ldi16	r0, 0x807f
 f9 14                 and	r0, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 57                 lsl16i	r6, 0x7
 f9 c1                 or	r6, r0
 06                    mov	r5, r6
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xe0
 f0 06 e9 ff           ldi16	r2, 0xffe9
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x13c
<L7>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 c6 a2 0d              ldi16	r6, 0xda2
 c7 a2 8d              ldi16	r7, 0x8da2
 f0 69 80              cmp32	q2, q0
 fb 77                 cmov.ne	r6, r7
 c4 60 42              ldi16	r4, 0x4260
 06                    mov	r5, r6
 c6 60 42              ldi16	r6, 0x4260
 c7 a2 0d              ldi16	r7, 0xda2
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xde
 c7 7f 80              ldi16	r7, 0x807f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f2 42                 sub	r2, r2
 f0 07 80 0c           ldi16	r3, 0xc80
 f7 64                 add32	q1, q0
 f9 7d                 or	r3, r7
 f1 27                 mov	r5, r3
 aa                    xor	r6, r6
 c7 00 33              ldi16	r7, 0x3300
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xde
