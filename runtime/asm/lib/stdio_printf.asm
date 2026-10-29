
stdio_printf.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_printf.c
00000000 l    d  .text.vprintf	00000000 .text.vprintf
00000000 l    d  .text.printf	00000000 .text.printf
00000000 g     F .text.vprintf	00000009 vprintf
00000000         *UND*	00000000 __avm_stdout
00000000         *UND*	00000000 vfprintf
00000000 g     F .text.printf	00000013 printf

Disassembly of section .text.vprintf:

<vprintf>:
 09                    mov	r6, r5
 04                    mov	r5, r4
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_stdout
 e2 00 00 00           jmpf	vprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	vfprintf

Disassembly of section .text.printf:

<printf>:
 d6 fe                 adjsp	-0x2
 f4 15                 ldsp16	r5, [sp+0x5]
 f0 16 07              leasp	r6, 0x7
 f4 42                 stsp16	[sp+0x0], r6
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_stdout
 e3 00 00 00           callf	printf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	vfprintf
 d6 02                 adjsp	0x2
 ef                    ret
