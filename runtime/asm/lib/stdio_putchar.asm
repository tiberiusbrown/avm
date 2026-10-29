
stdio_putchar.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_putchar.c
00000000 l    d  .text.putchar	00000000 .text.putchar
00000000 g     F .text.putchar	00000007 putchar
00000000         *UND*	00000000 __avm_stdout
00000000         *UND*	00000000 fputc

Disassembly of section .text.putchar:

<putchar>:
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_stdout
 e2 00 00 00           jmpf	putchar
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fputc
