
math_ef_exp2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_exp2.c
00000000 l    d  .text.exp2f	00000000 .text.exp2f
00000000 g     F .text.exp2f	000000f5 exp2f
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.exp2f:

<exp2f>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 06 80 7f           ldi16	r2, 0x7f80
 f5 2e                 cmp	r7, r2
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	exp2f
		R_AVM_FAR24	.text.exp2f+0xa3
<L0>:
 09                    mov	r6, r5
 c7 00 43              ldi16	r7, 0x4300
 3b                    cmp	r6, r7
 d3 04                 brslt8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	exp2f
		R_AVM_FAR24	.text.exp2f+0xc9
<L1>:
 c7 16 c3              ldi16	r7, 0xc316
 3b                    cmp	r6, r7
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	exp2f
		R_AVM_FAR24	.text.exp2f+0xd7
<L2>:
 c6 00 80              ldi16	r6, 0x8000
 89                    and	r6, r5
 f2 30                 sub	r0, r0
 c7 00 3f              ldi16	r7, 0x3f00
 f0 05 00 bf           ldi16	r1, 0xbf00
 f5 28                 cmp	r6, r0
 fb 79                 cmov.ne	r7, r1
 aa                    xor	r6, r6
 f2 62                 mov32	q0, q2
 ff 00                 fadd
 ff 0e                 ftos16
 f4 40                 stsp16	[sp+0x0], r4
 ff 0c                 s16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 cd 83                 cmpi.s8	r5, -0x7d
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	exp2f
		R_AVM_FAR24	.text.exp2f+0x7c
<L3>:
 fa 47                 lsl16i	r5, 0x7
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
 e2 00 00 00           jmpf	exp2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.exp2f+0x9d
 fa 47                 lsl16i	r5, 0x7
 c4 00 32              ldi16	r4, 0x3200
 11                    add	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c7 80 0d              ldi16	r7, 0xd80
 ff 02                 fmul
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 c7 80 80              ldi16	r7, 0x8080
 1e                    add	r7, r6
 c6 ff 80              ldi16	r6, 0x80ff
 3b                    cmp	r6, r7
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	exp2f
		R_AVM_FAR24	.text.exp2f+0xeb
<L4>:
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	exp2f
		R_AVM_FAR24	.text.exp2f+0xe3
<L5>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c8              cmp32	q3, q2
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	exp2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.exp2f+0x9d
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	exp2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.exp2f+0x9d
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	exp2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.exp2f+0x9d
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	exp2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.exp2f+0x9d
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	exp2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.exp2f+0x9d
