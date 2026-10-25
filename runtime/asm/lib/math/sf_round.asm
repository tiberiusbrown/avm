
math_sf_round.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_round.c
00000000 l    d  .text.roundf	00000000 .text.roundf
00000000 g     F .text.roundf	0000009c roundf
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_lshrsi3
00000000         *UND*	00000000 __avm_ashrsi3

Disassembly of section .text.roundf:

<roundf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 66                 mov32	q1, q2
 f1 2b                 mov	r6, r3
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 02                    mov	r4, r6
 c8 81                 addi.s8	r4, -0x7f
 c3 95                 ldi8	r7, 0x95
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x43
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 ce 7f                 cmpi.s8	r6, 0x7f
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x52
<L1>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 cc ff                 cmpi.s8	r4, -0x1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x93
<L2>:
 c4 80 3f              ldi16	r4, 0x3f80
 f9 8d                 or	r4, r3
 f1 1c                 mov	r3, r4
 f2 42                 sub	r2, r2
 e2 00 00 00           jmpf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.roundf+0x93
 c2 80                 ldi8	r6, 0x80
 32                    cmp	r4, r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x93
<L3>:
 ff 05                 fadd	q1, q1
 e2 00 00 00           jmpf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.roundf+0x93
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	roundf
		R_AVM_FAR24	.text.roundf+0x93
<L4>:
 aa                    xor	r6, r6
 c3 40                 ldi8	r7, 0x40
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e3 00 00 00           callf	roundf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashrsi3
 f2 66                 mov32	q1, q2
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f2 69                 mov32	q2, q1
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
