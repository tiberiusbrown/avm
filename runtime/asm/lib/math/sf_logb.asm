
math_sf_logb.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_logb.c
00000000 l    d  .text.logbf	00000000 .text.logbf
00000000 g     F .text.logbf	000000e9 logbf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.logbf:

<logbf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logbf
		R_AVM_FAR24	.text.logbf+0x3f
<L0>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logbf
		R_AVM_FAR24	.text.logbf+0x4d
<L1>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logbf
		R_AVM_FAR24	.text.logbf+0xe2
<L2>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	logbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logbf+0xe0
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 aa                    xor	r6, r6
 c7 80 ff              ldi16	r7, 0xff80
 e2 00 00 00           jmpf	logbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logbf+0xe2
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logbf
		R_AVM_FAR24	.text.logbf+0x61
<L3>:
 c8 81                 addi.s8	r4, -0x7f
 e2 00 00 00           jmpf	logbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logbf+0xde
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logbf
		R_AVM_FAR24	.text.logbf+0xa4
<L4>:
 02                    mov	r4, r6
 f4 8c                 lsr16.1	r4
 92                    or	r4, r6
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c5 55 55              ldi16	r5, 0x5555
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 89                    and	r6, r5
 22                    sub	r4, r6
 c5 33 33              ldi16	r5, 0x3333
 08                    mov	r6, r4
 89                    and	r6, r5
 fa 72                 lsr16i	r4, 0x2
 81                    and	r4, r5
 12                    add	r4, r6
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 14                    add	r5, r4
 c4 0f 0f              ldi16	r4, 0xf0f
 81                    and	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c2 1f                 ldi8	r6, 0x1f
 89                    and	r6, r5
 c4 8a ff              ldi16	r4, 0xff8a
 e2 00 00 00           jmpf	logbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logbf+0xdd
 f1 20                 mov	r4, r0
 f4 8c                 lsr16.1	r4
 f9 81                 or	r4, r0
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c5 55 55              ldi16	r5, 0x5555
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 89                    and	r6, r5
 22                    sub	r4, r6
 c5 33 33              ldi16	r5, 0x3333
 08                    mov	r6, r4
 89                    and	r6, r5
 fa 72                 lsr16i	r4, 0x2
 81                    and	r4, r5
 12                    add	r4, r6
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 14                    add	r5, r4
 c4 0f 0f              ldi16	r4, 0xf0f
 81                    and	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c2 1f                 ldi8	r6, 0x1f
 89                    and	r6, r5
 c4 7a ff              ldi16	r4, 0xff7a
 22                    sub	r4, r6
 ff 0c                 s16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
