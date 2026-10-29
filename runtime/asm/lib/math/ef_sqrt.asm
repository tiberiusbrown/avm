
math_ef_sqrt.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000000 l    d  .text.sqrtf	00000000 .text.sqrtf
00000000 l     F .text.avm_sqrt_special	00000039 avm_sqrt_special
00000000 l    d  .text.avm_sqrt_special	00000000 .text.avm_sqrt_special
00000000 g     F .text.sqrtf	0000000f sqrtf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.sqrtf:

<sqrtf>:
 f6 2d                 tst16	r5
 d9 04                 brsge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0xb
<L0>:
 ff 16                 fsqrt
 ef                    ret
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sqrt_special

Disassembly of section .text.avm_sqrt_special:

<avm_sqrt_special>:
 09                    mov	r6, r5
 c7 7f ff              ldi16	r7, 0xff7f
 3d                    cmp	r7, r5
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sqrt_special
		R_AVM_FAR24	.text.avm_sqrt_special+0x1e
<L0>:
 ce 80                 cmpi.s8	r6, -0x80
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sqrt_special
		R_AVM_FAR24	.text.avm_sqrt_special+0x1b
<L1>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sqrt_special
		R_AVM_FAR24	.text.avm_sqrt_special+0x30
<L2>:
 ff 16                 fsqrt
 ef                    ret
 c7 00 80              ldi16	r7, 0x8000
 3b                    cmp	r6, r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sqrt_special
		R_AVM_FAR24	.text.avm_sqrt_special+0x30
<L3>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sqrt_special
		R_AVM_FAR24	.text.avm_sqrt_special+0x1b
<L4>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 ff 16                 fsqrt
 ef                    ret
