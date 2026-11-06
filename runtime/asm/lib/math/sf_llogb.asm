
math_sf_llogb.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_llogb.c
00000000 l    d  .text.llogbf	00000000 .text.llogbf
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.llogbf	00000088 llogbf
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
		R_AVM_FAR24	.text.llogbf+0x56
<L0>:
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa a7                 lsr16i	r7, 0x7
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llogbf
		R_AVM_FAR24	.text.llogbf+0x31
<L1>:
 cb 81                 addi.s8	r7, -0x7f
 e2 00 00 00           jmpf	llogbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llogbf+0x4d
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llogbf
		R_AVM_FAR24	.text.llogbf+0x45
<L2>:
 02                    mov	r4, r6
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 c7 fc fe              ldi16	r7, 0xfefc
 e2 00 00 00           jmpf	llogbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llogbf+0x4c
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 c7 ec fe              ldi16	r7, 0xfeec
 1d                    add	r7, r5
 03                    mov	r4, r7
 07                    mov	r5, r7
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
		R_AVM_FAR24	.text.llogbf+0x80
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
		R_AVM_FAR24	.text.llogbf+0x51
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 e2 00 00 00           jmpf	llogbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llogbf+0x51
