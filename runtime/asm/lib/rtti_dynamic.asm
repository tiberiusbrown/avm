
rtti_dynamic.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 rtti_dynamic.c
00000000 l    d  .text.__avm_typeid_from_object	00000000 .text.__avm_typeid_from_object
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_typeid_from_object	00000068 __avm_typeid_from_object
00000000         *UND*	00000000 abort

Disassembly of section .text.__avm_typeid_from_object:

<__avm_typeid_from_object>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_typeid_from_object
		R_AVM_FAR24	.text.__avm_typeid_from_object+0x64
<L0>:
 cc fe                 cmpi.s8	r4, -0x2
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_typeid_from_object
		R_AVM_FAR24	.text.__avm_typeid_from_object+0x64
<L1>:
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_typeid_from_object
		R_AVM_FAR24	.text.__avm_typeid_from_object+0x64
<L2>:
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 63 cc              ldp24	q3, [q3]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_typeid_from_object
		R_AVM_FAR24	.text.__avm_typeid_from_object+0x64
<L3>:
 c4 00 05              ldi16	r4, 0x500
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_typeid_from_object
		R_AVM_FAR24	.text.__avm_typeid_from_object+0x64
<L4>:
 c4 05 06              ldi16	r4, 0x605
 c5 ff ff              ldi16	r5, 0xffff
 f7 6b                 add32	q2, q3
 f0 04 fe 05           ldi16	r0, 0x5fe
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_typeid_from_object
		R_AVM_FAR24	.text.__avm_typeid_from_object+0x64
<L5>:
 c4 00 06              ldi16	r4, 0x600
 12                    add	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 e3 00 00 00           callf	__avm_typeid_from_object
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
