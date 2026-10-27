
math_sf_llround.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_llround.c
00000000 l    d  .text.llroundf	00000000 .text.llroundf
00000000 g     F .text.llroundf	000000e0 llroundf
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_lshrsi3

Disassembly of section .text.llroundf:

<llroundf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 ff 1b                 fround
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 5e           ldi16	r1, 0x5eff
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llroundf
		R_AVM_FAR24	.text.llroundf+0x2b
<L0>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	llroundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llroundf+0xd9
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 4e           ldi16	r1, 0x4eff
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llroundf
		R_AVM_FAR24	.text.llroundf+0x46
<L1>:
 ff 12                 ftos32
 09                    mov	r6, r5
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 e2 00 00 00           jmpf	llroundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llroundf+0xd9
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 7f                 ldi8	r4, 0x7f
 83                    and	r4, r7
 c1 80                 ldi8	r5, 0x80
 94                    or	r5, r4
 f1 16                 mov	r2, r6
 f1 1d                 mov	r3, r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c2 b5                 ldi8	r6, 0xb5
 38                    cmp	r6, r4
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llroundf
		R_AVM_FAR24	.text.llroundf+0x87
<L2>:
 c6 6a ff              ldi16	r6, 0xff6a
 f4 10                 ldsp16	r4, [sp+0x4]
 18                    add	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	llroundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 c0 b6                 ldi8	r4, 0xb6
 f4 12                 ldsp16	r6, [sp+0x4]
 22                    sub	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	llroundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	llroundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llroundf+0x9b
 c6 4a ff              ldi16	r6, 0xff4a
 f4 10                 ldsp16	r4, [sp+0x4]
 12                    add	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	llroundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llroundf
		R_AVM_FAR24	.text.llroundf+0xb6
<L3>:
 f2 6b                 mov32	q3, q1
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	llroundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llroundf+0xd9
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f7 7d                 sub32	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 78                 sub32	q2, q0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
