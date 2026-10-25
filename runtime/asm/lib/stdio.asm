
stdio.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio.c
00000000 l    d  .text.vsnprintf	00000000 .text.vsnprintf
00000000 l    d  .text.vsnprintf_P	00000000 .text.vsnprintf_P
00000000 g     F .text.vsnprintf	00000007 vsnprintf
00000000 g     F .text.vsnprintf_P	00000008 vsnprintf_P

Disassembly of section .text.vsnprintf:

<vsnprintf>:
 b2                    push16	r2
 f1 17                 mov	r2, r7
 d7 2f                 sys	vsnprintf
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.vsnprintf_P:

<vsnprintf_P>:
 b2                    push16	r2
 f0 32 05              ldsp16	r2, [sp+0x5]
 d7 30                 sys	vsnprintf_p
 ba                    pop16	r2
 ef                    ret
