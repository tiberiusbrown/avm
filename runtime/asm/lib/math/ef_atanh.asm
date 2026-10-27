
math_ef_atanh.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_atanh.c
00000000 l    d  .text.atanhf	00000000 .text.atanhf
00000000 g     F .text.atanhf	000000b5 atanhf
00000000         *UND*	00000000 log1pf

Disassembly of section .text.atanhf:

<atanhf>:
 b3                    push16	r3
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0b                 fabs	q3
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanhf
		R_AVM_FAR24	.text.atanhf+0x3d
<L0>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 16 05 3a 6b 32 3e 3a 32 07 3e 0e 60 4d 3e 16 aa aa 3e 00 00 80 3f  fpoly	5, 0.174237162, 0.132027537, 0.200561732, 0.333328903, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 b8                    pop16	r0
 b9                    pop16	r1
 bb                    pop16	r3
 ef                    ret
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanhf
		R_AVM_FAR24	.text.atanhf+0x55
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 b8                    pop16	r0
 b9                    pop16	r1
 bb                    pop16	r3
 ef                    ret
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanhf
		R_AVM_FAR24	.text.atanhf+0x87
<L2>:
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atanhf
		R_AVM_FAR24	.text.atanhf+0xad
<L3>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 af                    xor	r7, r7
 f0 04 80 7f           ldi16	r0, 0x7f80
 f0 05 80 ff           ldi16	r1, 0xff80
 f0 69 8c              cmp32	q2, q3
 fb 41                 cmov.ne	r0, r1
 f1 24                 mov	r5, r0
 b8                    pop16	r0
 b9                    pop16	r1
 bb                    pop16	r3
 ef                    ret
 f1 1d                 mov	r3, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 e3 00 00 00           callf	atanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	log1pf
 f0 04 00 80           ldi16	r0, 0x8000
 f9 0c                 and	r0, r3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f9 a1                 or	r5, r0
 b8                    pop16	r0
 b9                    pop16	r1
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 b8                    pop16	r0
 b9                    pop16	r1
 bb                    pop16	r3
 ef                    ret
