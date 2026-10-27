
immediate_exit.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 immediate_exit.c
00000000 l    d  .text._Exit	00000000 .text._Exit
00000000 l    d  .text.abort	00000000 .text.abort
00000000 g     F .text._Exit	00000004 _Exit
00000000         *UND*	00000000 avm_halt
00000000  w    F .text.abort	00000004 abort

Disassembly of section .text._Exit:

<_Exit>:
 e3 00 00 00           callf	_Exit
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text.abort:

<abort>:
 e3 00 00 00           callf	abort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt
