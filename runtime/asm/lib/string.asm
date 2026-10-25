
string.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 string.c
00000000 l    d  .text.memcpy	00000000 .text.memcpy
00000000 l    d  .text.memset	00000000 .text.memset
00000000 l    d  .text.memmove	00000000 .text.memmove
00000000 l    d  .text.memcmp	00000000 .text.memcmp
00000000 l    d  .text.strcmp	00000000 .text.strcmp
00000000 l    d  .text.strlen	00000000 .text.strlen
00000000 l    d  .text.strncpy	00000000 .text.strncpy
00000000 l    d  .text.strncat	00000000 .text.strncat
00000000 l    d  .text.strcpy	00000000 .text.strcpy
00000000 l    d  .text.strcat	00000000 .text.strcat
00000000 g     F .text.memcpy	00000005 memcpy
00000000 g     F .text.memset	00000005 memset
00000000 g     F .text.memmove	00000005 memmove
00000000 g     F .text.memcmp	00000003 memcmp
00000000 g     F .text.strcmp	00000003 strcmp
00000000 g     F .text.strlen	00000003 strlen
00000000 g     F .text.strncpy	00000005 strncpy
00000000 g     F .text.strncat	00000005 strncat
00000000 g     F .text.strcpy	00000008 strcpy
00000000 g     F .text.strcat	00000008 strcat

Disassembly of section .text.memcpy:

<memcpy>:
 0c                    mov	r7, r4
 d7 0f                 sys	memcpy
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.memset:

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.memmove:

<memmove>:
 0c                    mov	r7, r4
 d7 12                 sys	memmove
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.memcmp:

<memcmp>:
 d7 18                 sys	memcmp
 ef                    ret

Disassembly of section .text.strcmp:

<strcmp>:
 d7 19                 sys	strcmp
 ef                    ret

Disassembly of section .text.strlen:

<strlen>:
 d7 1a                 sys	strlen
 ef                    ret

Disassembly of section .text.strncpy:

<strncpy>:
 0c                    mov	r7, r4
 d7 1b                 sys	strncpy
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.strncat:

<strncat>:
 0c                    mov	r7, r4
 d7 1c                 sys	strncat
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.strcpy:

<strcpy>:
 0c                    mov	r7, r4
 c6 ff ff              ldi16	r6, 0xffff
 d7 1b                 sys	strncpy
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.strcat:

<strcat>:
 0c                    mov	r7, r4
 c6 ff ff              ldi16	r6, 0xffff
 d7 1c                 sys	strncat
 03                    mov	r4, r7
 ef                    ret
