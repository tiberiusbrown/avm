
stdio_puts.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_puts.c
00000000 l    d  .text.puts	00000000 .text.puts
00000000 g     F .text.puts	00000026 puts
00000000         *UND*	00000000 __avm_stdout
00000000         *UND*	00000000 fputs
00000000         *UND*	00000000 fputc

Disassembly of section .text.puts:

<puts>:
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_stdout
 e3 00 00 00           callf	puts
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fputs
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	puts
		R_AVM_FAR24	.text.puts+0x22
<L0>:
 c0 0a                 ldi8	r4, 0xa
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_stdout
 e3 00 00 00           callf	puts
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fputc
 04                    mov	r5, r4
 a0                    xor	r4, r4
 c6 ff ff              ldi16	r6, 0xffff
 cd ff                 cmpi.s8	r5, -0x1
 fb 26                 cmov.eq	r4, r6
 ef                    ret
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
