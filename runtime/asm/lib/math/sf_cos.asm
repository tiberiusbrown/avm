
math_sf_cos.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_cos.c
00000000 l    d  .text.cosf	00000000 .text.cosf
00000000 g     F .text.cosf	00000074 cosf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.cosf:

<cosf>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 c6 ff 7f              ldi16	r6, 0x7fff
 89                    and	r6, r5
 c7 80 7f              ldi16	r7, 0x7f80
 3b                    cmp	r6, r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x62
<L0>:
 ff 1c                 frempio2
 f4 42                 stsp16	[sp+0x0], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 00 01              ldi8	r0, 0x1
 f4 00                 ldsp16	r4, [sp+0x0]
 f9 10                 and	r0, r4
 02                    mov	r4, r6
 ff 02                 fmul
 f4 a0                 tst8	r0
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x40
<L1>:
 ff 15 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x51
 ff 15 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 5e                 lsl16i	r6, 0xe
 c7 00 40              ldi16	r7, 0x4000
 1e                    add	r7, r6
 c6 00 80              ldi16	r6, 0x8000
 8b                    and	r6, r7
 a6                    xor	r5, r6
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ef                    ret
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cosf
		R_AVM_FAR24	.text.cosf+0x11
<L2>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	cosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cosf+0x11
