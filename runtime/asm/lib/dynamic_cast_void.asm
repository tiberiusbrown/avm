
dynamic_cast_void.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 dynamic_cast_void.c
00000000 l    d  .text.__avm_dynamic_cast_to_void	00000000 .text.__avm_dynamic_cast_to_void
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_dynamic_cast_to_void	0000006b __avm_dynamic_cast_to_void
00000000         *UND*	00000000 abort

Disassembly of section .text.__avm_dynamic_cast_to_void:

<__avm_dynamic_cast_to_void>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_dynamic_cast_to_void
		R_AVM_FAR24	.text.__avm_dynamic_cast_to_void+0x63
<L0>:
 cc fe                 cmpi.s8	r4, -0x2
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_dynamic_cast_to_void
		R_AVM_FAR24	.text.__avm_dynamic_cast_to_void+0x5f
<L1>:
 04                    mov	r5, r4
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 c2 05                 ldi8	r6, 0x5
 af                    xor	r7, r7
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_dynamic_cast_to_void
		R_AVM_FAR24	.text.__avm_dynamic_cast_to_void+0x5f
<L2>:
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 fa ff              ldi16	r4, 0xfffa
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f9 64                 and	r3, r1
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c3 01                 ldi8	r7, 0x1
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_dynamic_cast_to_void
		R_AVM_FAR24	.text.__avm_dynamic_cast_to_void+0x64
<L3>:
 e3 00 00 00           callf	__avm_dynamic_cast_to_void
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
