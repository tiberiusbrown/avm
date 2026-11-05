
time_timespec.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_timespec.c
00000000 l    d  .text.timespec_get	00000000 .text.timespec_get
00000000 l    d  .text.timespec_getres	00000000 .text.timespec_getres
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.timespec_get	00000002 timespec_get
00000000 g     F .text.timespec_getres	00000002 timespec_getres

Disassembly of section .text.timespec_get:

<timespec_get>:
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.timespec_getres:

<timespec_getres>:
 a0                    xor	r4, r4
 ef                    ret
