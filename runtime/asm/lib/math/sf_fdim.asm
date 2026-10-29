
math_sf_fdim.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_fdim.c
00000000 l    d  .text.fdimf	00000000 .text.fdimf
00000000 l     F .text.unlikely.avm_fdim_special	00000065 avm_fdim_special
00000000 l    d  .text.unlikely.avm_fdim_special	00000000 .text.unlikely.avm_fdim_special
00000000 g     F .text.fdimf	00000060 fdimf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.fdimf:

<fdimf>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 29                 mov	r6, r1
 f9 c8                 and	r6, r2
 f5 2a                 cmp	r6, r2
 f8 06                 cset.eq	r6
 0d                    mov	r7, r5
 f9 e8                 and	r7, r2
 f5 2e                 cmp	r7, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fdimf
		R_AVM_FAR24	.text.fdimf+0x4d
<L0>:
 c3 01                 ldi8	r7, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fdimf
		R_AVM_FAR24	.text.fdimf+0x4d
<L1>:
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d9 04                 brsge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fdimf
		R_AVM_FAR24	.text.fdimf+0x47
<L2>:
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 c6 ff 7f              ldi16	r6, 0x7fff
 89                    and	r6, r5
 f5 2a                 cmp	r6, r2
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fdimf
		R_AVM_FAR24	.text.fdimf+0x56
<L3>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
 f2 6a                 mov32	q3, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 e2 00 00 00           jmpf	fdimf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_fdim_special
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.unlikely.avm_fdim_special:

<avm_fdim_special>:
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
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_fdim_special
		R_AVM_FAR24	.text.unlikely.avm_fdim_special+0x5a
<L0>:
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_fdim_special
		R_AVM_FAR24	.text.unlikely.avm_fdim_special+0x5a
<L1>:
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 f2 61                 mov32	q0, q1
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
 e2 00 00 00           jmpf	avm_fdim_special
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_fdim_special+0x5e
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
