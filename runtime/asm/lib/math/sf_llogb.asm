
math_sf_llogb.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_llogb.c
00000000 l    d  .text.llogbf	00000000 .text.llogbf
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.llogbf	000000e6 llogbf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.llogbf:

<llogbf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 30                 sub	r0, r0
 f0 05 80 80           ldi16	r1, 0x8080
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llogbf
		R_AVM_FAR24	.text.llogbf+0xb4
<L0>:
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 87                 lsr16i	r5, 0x7
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llogbf
		R_AVM_FAR24	.text.llogbf+0x31
<L1>:
 c9 81                 addi.s8	r5, -0x7f
 e2 00 00 00           jmpf	llogbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llogbf+0xac
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llogbf
		R_AVM_FAR24	.text.llogbf+0x74
<L2>:
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
 c5 8a ff              ldi16	r5, 0xff8a
 e2 00 00 00           jmpf	llogbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llogbf+0xab
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
 c5 7a ff              ldi16	r5, 0xff7a
 24                    sub	r5, r4
 01                    mov	r4, r5
 fa cf                 asr16i	r5, 0xf
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 63                 mov32	q0, q3
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llogbf
		R_AVM_FAR24	.text.llogbf+0xde
<L3>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f0 69 84              cmp32	q2, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 e2 00 00 00           jmpf	llogbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llogbf+0xaf
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 e2 00 00 00           jmpf	llogbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llogbf+0xaf
