
math_ef_cosh.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_cosh.c
00000000 l    d  .text.coshf	00000000 .text.coshf
00000000 g     F .text.coshf	000000bc coshf
00000000         *UND*	00000000 __avm_expf_noerrno
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.coshf:

<coshf>:
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0a                 fabs	q2
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coshf
		R_AVM_FAR24	.text.coshf+0x2f
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 02                 fmul
 ff 16 04 68 fb ba 3a cd 9b 2a 3d 0d 00 00 3f 00 00 80 3f      fpoly	4, 0.00142655987, 0.0416524895, 0.500000775, 1.0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coshf
		R_AVM_FAR24	.text.coshf+0x46
<L1>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 00                 fadd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c6 ff ff              ldi16	r6, 0xffff
 c7 0f 41              ldi16	r7, 0x410f
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coshf
		R_AVM_FAR24	.text.coshf+0x72
<L2>:
 e3 00 00 00           callf	coshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_expf_noerrno
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c6 fd d4              ldi16	r6, 0xd4fd
 c7 b2 42              ldi16	r7, 0x42b2
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coshf
		R_AVM_FAR24	.text.coshf+0xa4
<L3>:
 c6 18 72              ldi16	r6, 0x7218
 c7 31 bf              ldi16	r7, 0xbf31
 ff 00                 fadd
 e3 00 00 00           callf	coshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_expf_noerrno
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 ff 14                 fcmp
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 f6 2e                 tst16	r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coshf
		R_AVM_FAR24	.text.coshf+0x2c
<L4>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
