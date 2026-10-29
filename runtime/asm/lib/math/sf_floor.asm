
math_sf_floor.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_floor.c
00000000 l    d  .text.floorf	00000000 .text.floorf
00000000 g     F .text.floorf	00000003 floorf

Disassembly of section .text.floorf:

<floorf>:
 ff 18                 ffloor
 ef                    ret
