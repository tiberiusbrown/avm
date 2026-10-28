
math_ef_sqrt.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000000 l    d  .text.sqrtf	00000000 .text.sqrtf
00000000 l     F .text.avm_sqrt_special	00000039 avm_sqrt_special
00000000 l    d  .text.avm_sqrt_special	00000000 .text.avm_sqrt_special
00000000 g     F .text.sqrtf	00000010 sqrtf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.sqrtf:

<sqrtf>:
 09                    mov	r6, r5
 f6 2e                 tst16	r6
 d9 04                 brsge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0xc
<L0>:
 ff 17                 fsqrt
 ef                    ret
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_sqrt_special

Disassembly of section .text.avm_sqrt_special:

<avm_sqrt_special>:
 09                    mov	r6, r5
 c7 7f ff              ldi16	r7, 0xff7f
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sqrt_special
		R_AVM_FAR24	.text.avm_sqrt_special+0x20
<L0>:
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sqrt_special
		R_AVM_FAR24	.text.avm_sqrt_special+0x30
<L1>:
 c7 00 80              ldi16	r7, 0x8000
 3b                    cmp	r6, r7
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sqrt_special
		R_AVM_FAR24	.text.avm_sqrt_special+0x30
<L2>:
 ff 17                 fsqrt
 ef                    ret
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sqrt_special
		R_AVM_FAR24	.text.avm_sqrt_special+0x1d
<L3>:
 ce 80                 cmpi.s8	r6, -0x80
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_sqrt_special
		R_AVM_FAR24	.text.avm_sqrt_special+0x1d
<L4>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 ff 17                 fsqrt
 ef                    ret
