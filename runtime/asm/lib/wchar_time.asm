
wchar_time.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 wchar_time.c
00000000 l    d  .text.wcsftime	00000000 .text.wcsftime
00000000 g     F .text.wcsftime	00000004 wcsftime
00000000         *UND*	00000000 strftime

Disassembly of section .text.wcsftime:

<wcsftime>:
 e2 00 00 00           jmpf	wcsftime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strftime
