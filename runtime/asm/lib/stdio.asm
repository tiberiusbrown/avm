
stdio.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio.c
00000000 l    d  .text.vsnprintf	00000000 .text.vsnprintf
00000000 l    d  .text.vsnprintf_P	00000000 .text.vsnprintf_P
00000000 l    d  .text.snprintf	00000000 .text.snprintf
00000000 l    d  .text.snprintf_P	00000000 .text.snprintf_P
00000000 l    d  .text.sprintf	00000000 .text.sprintf
00000000 l    d  .text.vsprintf	00000000 .text.vsprintf
00000000 g     F .text.vsnprintf	00000007 vsnprintf
00000000 g     F .text.vsnprintf_P	00000008 vsnprintf_P
00000000 g     F .text.snprintf	00000015 snprintf
00000000 g     F .text.snprintf_P	00000017 snprintf_P
00000000 g     F .text.sprintf	00000016 sprintf
00000000 g     F .text.vsprintf	0000000f vsprintf

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

Disassembly of section .text.snprintf:

<snprintf>:
 b2                    push16	r2
 d6 fe                 adjsp	-0x2
 f4 2e                 ldsp16	r6, [sp+0xb]
 f4 25                 ldsp16	r5, [sp+0x9]
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 12 0d              leasp	r2, 0xd
 f0 3a 00              stsp16	[sp+0x0], r2
 d7 2f                 sys	vsnprintf
 d6 02                 adjsp	0x2
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.snprintf_P:

<snprintf_P>:
 b2                    push16	r2
 d6 fe                 adjsp	-0x2
 f4 2e                 ldsp16	r6, [sp+0xb]
 f3 77                 ldsp8u	r7, [sp+0xd]
 f4 25                 ldsp16	r5, [sp+0x9]
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 12 0e              leasp	r2, 0xe
 f0 3a 00              stsp16	[sp+0x0], r2
 d7 30                 sys	vsnprintf_p
 d6 02                 adjsp	0x2
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.sprintf:

<sprintf>:
 b2                    push16	r2
 d6 fe                 adjsp	-0x2
 f4 26                 ldsp16	r6, [sp+0x9]
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 12 0b              leasp	r2, 0xb
 f0 3a 00              stsp16	[sp+0x0], r2
 c5 ff ff              ldi16	r5, 0xffff
 d7 2f                 sys	vsnprintf
 d6 02                 adjsp	0x2
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.vsprintf:

<vsprintf>:
 b2                    push16	r2
 b0                    push16	r0
 f1 06                 mov	r0, r6
 09                    mov	r6, r5
 c5 ff ff              ldi16	r5, 0xffff
 f1 10                 mov	r2, r0
 d7 2f                 sys	vsnprintf
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret
