
math_ef_fmod.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_fmod.c
00000000 l    d  .text.fmodf	00000000 .text.fmodf
00000000 l     F .text.avm_fmod_special	0000009a avm_fmod_special
00000000 l    d  .text.avm_fmod_special	00000000 .text.avm_fmod_special
00000000 g     F .text.fmodf	00000035 fmodf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.fmodf:

<fmodf>:
 b1                    push16	r1
 b0                    push16	r0
 f1 05                 mov	r0, r5
 f0 05 80 7f           ldi16	r1, 0x7f80
 f9 04                 and	r0, r1
 f5 01                 cmp	r0, r1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2f
<L0>:
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2a
<L1>:
 f1 07                 mov	r0, r7
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 20                 and	r1, r0
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2f
<L2>:
 ff 1c                 fmod
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 b8                    pop16	r0
 b9                    pop16	r1
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_fmod_special

Disassembly of section .text.avm_fmod_special:

<avm_fmod_special>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f1 05                 mov	r0, r5
 f0 05 80 7f           ldi16	r1, 0x7f80
 f9 04                 and	r0, r1
 f5 01                 cmp	r0, r1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_fmod_special
		R_AVM_FAR24	.text.avm_fmod_special+0x2f
<L0>:
 f1 07                 mov	r0, r7
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 20                 and	r1, r0
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_fmod_special
		R_AVM_FAR24	.text.avm_fmod_special+0x2f
<L1>:
 ff 1c                 fmod
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f2 66                 mov32	q1, q2
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_fmod_special
		R_AVM_FAR24	.text.avm_fmod_special+0x26
<L2>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_fmod_special
		R_AVM_FAR24	.text.avm_fmod_special+0x26
<L3>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_fmod_special
		R_AVM_FAR24	.text.avm_fmod_special+0x8f
<L4>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 04              cmp32	q0, q1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_fmod_special
		R_AVM_FAR24	.text.avm_fmod_special+0x26
<L5>:
 f0 00 21              ldi8	r0, 0x21
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	avm_fmod_special
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_fmod_special+0x26
