
pgmspace.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    d  .text.memcpy_P	00000000 .text.memcpy_P
00000000 l    d  .text.memcmp_P	00000000 .text.memcmp_P
00000000 l    d  .text.strcmp_P	00000000 .text.strcmp_P
00000000 l    d  .text.strlen_P	00000000 .text.strlen_P
00000000 l    d  .text.strncpy_P	00000000 .text.strncpy_P
00000000 l    d  .text.strncat_P	00000000 .text.strncat_P
00000000 l    d  .text.strcpy_P	00000000 .text.strcpy_P
00000000 l    d  .text.strcat_P	00000000 .text.strcat_P
00000000 g     F .text.memcpy_P	0000000b memcpy_P
00000000 g     F .text.memcmp_P	00000005 memcmp_P
00000000 g     F .text.strcmp_P	00000003 strcmp_P
00000000 g     F .text.strlen_P	00000005 strlen_P
00000000 g     F .text.strncpy_P	0000000b strncpy_P
00000000 g     F .text.strncat_P	0000000b strncat_P
00000000 g     F .text.strcpy_P	0000000c strcpy_P
00000000 g     F .text.strcat_P	0000000c strcat_P

Disassembly of section .text.memcpy_P:

<memcpy_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 10                 sys	memcpy_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.memcmp_P:

<memcmp_P>:
 f4 0d                 ldsp16	r5, [sp+0x3]
 d7 13                 sys	memcmp_p
 ef                    ret

Disassembly of section .text.strcmp_P:

<strcmp_P>:
 d7 14                 sys	strcmp_p
 ef                    ret

Disassembly of section .text.strlen_P:

<strlen_P>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d7 15                 sys	strlen_p
 ef                    ret

Disassembly of section .text.strncpy_P:

<strncpy_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 16                 sys	strncpy_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.strncat_P:

<strncat_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 17                 sys	strncat_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.strcpy_P:

<strcpy_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 c5 ff ff              ldi16	r5, 0xffff
 d7 16                 sys	strncpy_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.strcat_P:

<strcat_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 c5 ff ff              ldi16	r5, 0xffff
 d7 17                 sys	strncat_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret
