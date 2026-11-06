
math_sf_logb.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_logb.c
00000000 l    d  .text.logbf	00000000 .text.logbf
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.logbf	00000083 logbf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.logbf:

<logbf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logbf
		R_AVM_FAR24	.text.logbf+0x3f
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f2 61                 mov32	q0, q1
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logbf
		R_AVM_FAR24	.text.logbf+0x4d
<L1>:
 f0 69 80              cmp32	q2, q0
 f2 68                 mov32	q2, q0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logbf
		R_AVM_FAR24	.text.logbf+0x7e
<L2>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 00                 fadd
 e2 00 00 00           jmpf	logbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logbf+0x7e
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e2 00 00 00           jmpf	logbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logbf+0x7e
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa a7                 lsr16i	r7, 0x7
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logbf
		R_AVM_FAR24	.text.logbf+0x5f
<L3>:
 cb 81                 addi.s8	r7, -0x7f
 e2 00 00 00           jmpf	logbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logbf+0x7b
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logbf
		R_AVM_FAR24	.text.logbf+0x73
<L4>:
 02                    mov	r4, r6
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 c7 fc fe              ldi16	r7, 0xfefc
 e2 00 00 00           jmpf	logbf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logbf+0x7a
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 c7 ec fe              ldi16	r7, 0xfeec
 1d                    add	r7, r5
 03                    mov	r4, r7
 ff 0c                 s16tof
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
