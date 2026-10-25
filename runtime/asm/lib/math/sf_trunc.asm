
math_sf_trunc.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_trunc.c
00000000 l    d  .text.truncf	00000000 .text.truncf
00000000 g     F .text.truncf	00000062 truncf
00000000         *UND*	00000000 __avm_ashrsi3

Disassembly of section .text.truncf:

<truncf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 66                 mov32	q1, q2
 f1 23                 mov	r4, r3
 fa 77                 lsr16i	r4, 0x7
 08                    mov	r6, r4
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 c6 81 ff              ldi16	r6, 0xff81
 c7 ff ff              ldi16	r7, 0xffff
 f7 6c                 add32	q3, q0
 f1 74                 zext8	r4
 c1 95                 ldi8	r5, 0x95
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	truncf
		R_AVM_FAR24	.text.truncf+0x3a
<L0>:
 f0 0c 7f              cmpi.s8	r0, 0x7f
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	truncf
		R_AVM_FAR24	.text.truncf+0x49
<L1>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 e2 00 00 00           jmpf	truncf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.truncf+0x5b
 c0 80                 ldi8	r4, 0x80
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	truncf
		R_AVM_FAR24	.text.truncf+0x5b
<L2>:
 ff 05                 fadd	q1, q1
 e2 00 00 00           jmpf	truncf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.truncf+0x5b
 f2 30                 sub	r0, r0
 f0 05 80 ff           ldi16	r1, 0xff80
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	truncf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f2 69                 mov32	q2, q1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
