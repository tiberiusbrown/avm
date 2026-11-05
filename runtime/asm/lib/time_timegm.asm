
time_timegm.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_timegm.c
00000000 l    d  .text.timegm	00000000 .text.timegm
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.timegm	00000004 timegm
00000000         *UND*	00000000 mktime

Disassembly of section .text.timegm:

<timegm>:
 e2 00 00 00           jmpf	timegm
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	mktime
