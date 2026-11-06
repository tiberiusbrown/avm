
math_sf_ilogb.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_ilogb.c
00000000 l    d  .text.ilogbf	00000000 .text.ilogbf
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.ilogbf	00000092 ilogbf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.ilogbf:

<ilogbf>:
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 04                    mov	r5, r4
 f4 b5                 dec16	r5
 c2 fd                 ldi8	r6, 0xfd
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x1b
<L0>:
 c8 81                 addi.s8	r4, -0x7f
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 a0                    xor	r4, r4
 c5 80 80              ldi16	r5, 0x8080
 f2 6a                 mov32	q3, q0
 f7 6e                 add32	q3, q2
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x69
<L1>:
 f1 29                 mov	r6, r1
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x48
<L2>:
 c8 81                 addi.s8	r4, -0x7f
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x5c
<L3>:
 02                    mov	r4, r6
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 c4 fc fe              ldi16	r4, 0xfefc
 11                    add	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f1 20                 mov	r4, r0
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 c4 ec fe              ldi16	r4, 0xfeec
 11                    add	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ilogbf
		R_AVM_FAR24	.text.ilogbf+0x8c
<L4>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 c4 00 80              ldi16	r4, 0x8000
 c5 ff 7f              ldi16	r5, 0x7fff
 f0 69 0c              cmp32	q0, q3
 fb 25                 cmov.eq	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c4 00 80              ldi16	r4, 0x8000
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
