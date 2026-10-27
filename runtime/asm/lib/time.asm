
time.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time.c
00000000 l    d  .text.clock	00000000 .text.clock
00000000 g     F .text.clock	00000003 clock

Disassembly of section .text.clock:

<clock>:
 d7 03                 sys	millis32
 ef                    ret
