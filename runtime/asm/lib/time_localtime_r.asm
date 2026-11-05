
time_localtime_r.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_localtime_r.c
00000000 l    d  .text.localtime_r	00000000 .text.localtime_r
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.localtime_r	00000004 localtime_r
00000000         *UND*	00000000 gmtime_r

Disassembly of section .text.localtime_r:

<localtime_r>:
 e2 00 00 00           jmpf	localtime_r
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	gmtime_r
