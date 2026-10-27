
math_ef_sqrt.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000000 l    d  .text.sqrtf	00000000 .text.sqrtf
00000000 g     F .text.sqrtf	00000003 sqrtf

Disassembly of section .text.sqrtf:

<sqrtf>:
 ff 17                 fsqrt
 ef                    ret
