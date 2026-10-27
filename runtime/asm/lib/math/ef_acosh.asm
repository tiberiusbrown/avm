
math_ef_acosh.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_acosh.c
00000000 l    d  .text.acoshf	00000000 .text.acoshf
00000000 g     F .text.acoshf	000000a1 acoshf
00000000         *UND*	00000000 logf

Disassembly of section .text.acoshf:

<acoshf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	acoshf
		R_AVM_FAR24	.text.acoshf+0x21
<L0>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 09                    mov	r6, r5
 c7 80 3f              ldi16	r7, 0x3f80
 3b                    cmp	r6, r7
 d3 04                 brslt8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	acoshf
		R_AVM_FAR24	.text.acoshf+0x33
<L1>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c7 80 45              ldi16	r7, 0x4580
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	acoshf
		R_AVM_FAR24	.text.acoshf+0x4c
<L2>:
 e3 00 00 00           callf	acoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 00                 fadd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c7 00 40              ldi16	r7, 0x4000
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	acoshf
		R_AVM_FAR24	.text.acoshf+0x71
<L3>:
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 ff 17                 fsqrt
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e3 00 00 00           callf	acoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 ff 17                 fsqrt
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 16 05 29 6f 83 3a 4c 1e a7 bb 44 dc 98 3c 34 a9 aa bd 00 00 80 3f  fpoly	5, 0.00100276351, -0.00510004722, 0.0186597183, -0.0833305418, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
