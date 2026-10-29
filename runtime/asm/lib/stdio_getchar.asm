
stdio_getchar.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_getchar.c
00000000 l    d  .text.getchar	00000000 .text.getchar
00000000 g     F .text.getchar	00000007 getchar
00000000         *UND*	00000000 __avm_stdin
00000000         *UND*	00000000 fgetc

Disassembly of section .text.getchar:

<getchar>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_stdin
 e2 00 00 00           jmpf	getchar
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fgetc
