
time_localtime.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_localtime.c
00000000 l    d  .text.localtime	00000000 .text.localtime
00000000 g     F .text.localtime	00000004 localtime
00000000         *UND*	00000000 gmtime

Disassembly of section .text.localtime:

<localtime>:
 e2 00 00 00           jmpf	localtime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	gmtime
