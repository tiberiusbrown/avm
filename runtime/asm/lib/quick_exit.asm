
quick_exit.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 quick_exit.c
00000000 l    d  .text.at_quick_exit	00000000 .text.at_quick_exit
00000000 l    d  .text.quick_exit	00000000 .text.quick_exit
00000000 l    d  .data..L_MergedGlobals	00000000 .data..L_MergedGlobals
00000000 l     O .data..L_MergedGlobals	00000001 quick_exit_count
00000001 l     O .data..L_MergedGlobals	00000060 quick_exit_callbacks
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.at_quick_exit	0000003c at_quick_exit
00000000 g     F .text.quick_exit	00000035 quick_exit
00000000         *UND*	00000000 _Exit

Disassembly of section .text.at_quick_exit:

<at_quick_exit>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 f2 62                 mov32	q0, q2
 f1 71                 zext8	r1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	at_quick_exit
		R_AVM_FAR24	.text.at_quick_exit+0x36
<L0>:
 f0 47 00 00           ldm8u	r7, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals
 cf 20                 cmpi.s8	r7, 0x20
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	at_quick_exit
		R_AVM_FAR24	.text.at_quick_exit+0x36
<L1>:
 0b                    mov	r6, r7
 f4 ae                 inc16	r6
 f0 4e 00 00           stm8	[0x0], r6
		R_AVM_DATA16	.data..L_MergedGlobals
 0b                    mov	r6, r7
 1a                    add	r6, r6
 1b                    add	r6, r7
 c7 00 00              ldi16	r7, 0x0
		R_AVM_DATA16	.data..L_MergedGlobals+0x1
 1e                    add	r7, r6
 f7 5c                 st16	[r7+], r4
 5d                    st8	[r7], r5
 aa                    xor	r6, r6
 02                    mov	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.quick_exit:

<quick_exit>:
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	quick_exit
		R_AVM_FAR24	.text.quick_exit+0x2f
<L0>:
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	.data..L_MergedGlobals+0x1
 f4 b4                 dec16	r4
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data..L_MergedGlobals
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 f2 25                 add	r5, r1
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 eb                    callp	q3
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	.data..L_MergedGlobals
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	quick_exit
		R_AVM_FAR24	.text.quick_exit+0x14
<L1>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	quick_exit
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	_Exit
