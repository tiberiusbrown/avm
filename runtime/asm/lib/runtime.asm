
runtime.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    d  .text.avm_halt	00000000 .text.avm_halt
00000000 g     F .text.avm_halt	00000004 avm_halt

Disassembly of section .text.avm_halt:

<avm_halt>:
 e2 00 00 00           jmpf	avm_halt
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_halt
