
math_sf_fma.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_fma.c
00000000 l    d  .text.fmaf	00000000 .text.fmaf
00000000 g     F .text.fmaf	0000000d fmaf

Disassembly of section .text.fmaf:

<fmaf>:
 b1                    push16	r1
 b0                    push16	r0
 f0 30 07              ldsp16	r0, [sp+0x7]
 f0 31 09              ldsp16	r1, [sp+0x9]
 ff 1e                 fma
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
