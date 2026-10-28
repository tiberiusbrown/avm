
immediate_exit.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 immediate_exit.c
00000000 l    d  .text._Exit	00000000 .text._Exit
00000000 l    d  .text.abort	00000000 .text.abort
00000000 g     F .text._Exit	00000004 _Exit
00000000         *UND*	00000000 avm_halt
00000000  w    F .text.abort	00000018 abort
00000000  w      *UND*	00000000 __avm_signal_abort

Disassembly of section .text._Exit:

<_Exit>:
 e3 00 00 00           callf	_Exit
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text.abort:

<abort>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	__avm_signal_abort
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	__avm_signal_abort
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	abort
		R_AVM_FAR24	.text.abort+0x14
<L0>:
 e3 00 00 00           callf	abort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_signal_abort
 e3 00 00 00           callf	abort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt
