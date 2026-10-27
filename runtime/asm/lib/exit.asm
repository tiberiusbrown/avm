
exit.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 exit.c
00000000 l    d  .text.exit	00000000 .text.exit
00000000 g     F .text.exit	0000000c exit
00000000         *UND*	00000000 __avm_run_local_dtors
00000000         *UND*	00000000 __avm_terminate
00000000         *UND*	00000000 avm_halt

Disassembly of section .text.exit:

<exit>:
 e3 00 00 00           callf	exit
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_run_local_dtors
 e3 00 00 00           callf	exit
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_terminate
 e3 00 00 00           callf	exit
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt
