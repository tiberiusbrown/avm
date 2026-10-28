
math_sf_ilogb.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_ilogb.c
00000000 l    d  .text.ilogbf	00000000 .text.ilogbf
00000000 g     F .text.ilogbf	000000d9 ilogbf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.ilogbf:

<ilogbf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 a0                    xor	r4, r4
 c5 80 80              ldi16	r5, 0x8080
 f2 63                 mov32	q0, q3
 f7 62                 add32	q0, q2
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0xac
<L0>:
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 87                 lsr16i	r5, 0x7
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x2d
<L1>:
 c9 81                 addi.s8	r5, -0x7f
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x70
<L2>:
 04                    mov	r5, r4
 f4 8d                 lsr16.1	r5
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 72                 lsr16i	r4, 0x2
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 94                    or	r5, r4
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 99                    or	r6, r5
 c4 ff ff              ldi16	r4, 0xffff
 a2                    xor	r4, r6
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
 c0 1f                 ldi8	r4, 0x1f
 81                    and	r4, r5
 c5 8a ff              ldi16	r5, 0xff8a
 e2 00 00 00           jmpf	ilogbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ilogbf+0xa7
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
 c0 1f                 ldi8	r4, 0x1f
 81                    and	r4, r5
 c5 7a ff              ldi16	r5, 0xff7a
 24                    sub	r5, r4
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0xd2
<L3>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 c5 00 80              ldi16	r5, 0x8000
 c4 ff 7f              ldi16	r4, 0x7fff
 f0 69 c0              cmp32	q3, q0
 fb 2c                 cmov.eq	r5, r4
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c5 00 80              ldi16	r5, 0x8000
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
