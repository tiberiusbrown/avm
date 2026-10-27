
math_sf_nan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_nan.c
00000000 l    d  .text.nanf	00000000 .text.nanf
00000000 g     F .text.nanf	00000005 nanf

Disassembly of section .text.nanf:

<nanf>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 ef                    ret
