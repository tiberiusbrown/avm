
wchar_string.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 wchar_string.c
00000000 l    d  .text.wcscpy	00000000 .text.wcscpy
00000000 l    d  .text.wcscat	00000000 .text.wcscat
00000000 l    d  .text.wcsncpy	00000000 .text.wcsncpy
00000000 l    d  .text.wcsncat	00000000 .text.wcsncat
00000000 l    d  .text.wmemcpy	00000000 .text.wmemcpy
00000000 l    d  .text.wmemmove	00000000 .text.wmemmove
00000000 l    d  .text.wcscmp	00000000 .text.wcscmp
00000000 l    d  .text.wcscoll	00000000 .text.wcscoll
00000000 l    d  .text.wcsncmp	00000000 .text.wcsncmp
00000000 l    d  .text.wmemcmp	00000000 .text.wmemcmp
00000000 l    d  .text.wcsxfrm	00000000 .text.wcsxfrm
00000000 l    d  .text.wcschr	00000000 .text.wcschr
00000000 l    d  .text.wcsrchr	00000000 .text.wcsrchr
00000000 l    d  .text.wcscspn	00000000 .text.wcscspn
00000000 l    d  .text.wcsspn	00000000 .text.wcsspn
00000000 l    d  .text.wcspbrk	00000000 .text.wcspbrk
00000000 l    d  .text.wcsstr	00000000 .text.wcsstr
00000000 l    d  .text.wmemchr	00000000 .text.wmemchr
00000000 l    d  .text.wcslen	00000000 .text.wcslen
00000000 l    d  .text.wmemset	00000000 .text.wmemset
00000000 l    d  .text.wcstok	00000000 .text.wcstok
00000000 g     F .text.wcscpy	00000004 wcscpy
00000000         *UND*	00000000 strcpy
00000000 g     F .text.wcscat	00000008 wcscat
00000000 g     F .text.wcsncpy	00000005 wcsncpy
00000000 g     F .text.wcsncat	00000005 wcsncat
00000000 g     F .text.wmemcpy	00000005 wmemcpy
00000000 g     F .text.wmemmove	00000004 wmemmove
00000000         *UND*	00000000 memmove
00000000 g     F .text.wcscmp	00000003 wcscmp
00000000 g     F .text.wcscoll	00000003 wcscoll
00000000 g     F .text.wcsncmp	00000004 wcsncmp
00000000         *UND*	00000000 strncmp
00000000 g     F .text.wmemcmp	00000003 wmemcmp
00000000 g     F .text.wcsxfrm	00000004 wcsxfrm
00000000         *UND*	00000000 strxfrm
00000000 g     F .text.wcschr	00000004 wcschr
00000000         *UND*	00000000 strchr
00000000 g     F .text.wcsrchr	00000004 wcsrchr
00000000         *UND*	00000000 strrchr
00000000 g     F .text.wcscspn	00000004 wcscspn
00000000         *UND*	00000000 strcspn
00000000 g     F .text.wcsspn	00000004 wcsspn
00000000         *UND*	00000000 strspn
00000000 g     F .text.wcspbrk	00000004 wcspbrk
00000000         *UND*	00000000 strpbrk
00000000 g     F .text.wcsstr	00000004 wcsstr
00000000         *UND*	00000000 strstr
00000000 g     F .text.wmemchr	00000004 wmemchr
00000000         *UND*	00000000 memchr
00000000 g     F .text.wcslen	00000003 wcslen
00000000 g     F .text.wmemset	00000004 wmemset
00000000         *UND*	00000000 memset
00000000 g     F .text.wcstok	00000065 wcstok

Disassembly of section .text.wcscpy:

<wcscpy>:
 e2 00 00 00           jmpf	wcscpy
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strcpy

Disassembly of section .text.wcscat:

<wcscat>:
 0c                    mov	r7, r4
 c6 ff ff              ldi16	r6, 0xffff
 d7 1c                 sys	strncat
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.wcsncpy:

<wcsncpy>:
 0c                    mov	r7, r4
 d7 1b                 sys	strncpy
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.wcsncat:

<wcsncat>:
 0c                    mov	r7, r4
 d7 1c                 sys	strncat
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.wmemcpy:

<wmemcpy>:
 0c                    mov	r7, r4
 d7 0f                 sys	memcpy
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.wmemmove:

<wmemmove>:
 e2 00 00 00           jmpf	wmemmove
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	memmove

Disassembly of section .text.wcscmp:

<wcscmp>:
 d7 19                 sys	strcmp
 ef                    ret

Disassembly of section .text.wcscoll:

<wcscoll>:
 d7 19                 sys	strcmp
 ef                    ret

Disassembly of section .text.wcsncmp:

<wcsncmp>:
 e2 00 00 00           jmpf	wcsncmp
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strncmp

Disassembly of section .text.wmemcmp:

<wmemcmp>:
 d7 18                 sys	memcmp
 ef                    ret

Disassembly of section .text.wcsxfrm:

<wcsxfrm>:
 e2 00 00 00           jmpf	wcsxfrm
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strxfrm

Disassembly of section .text.wcschr:

<wcschr>:
 e2 00 00 00           jmpf	wcschr
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strchr

Disassembly of section .text.wcsrchr:

<wcsrchr>:
 e2 00 00 00           jmpf	wcsrchr
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strrchr

Disassembly of section .text.wcscspn:

<wcscspn>:
 e2 00 00 00           jmpf	wcscspn
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strcspn

Disassembly of section .text.wcsspn:

<wcsspn>:
 e2 00 00 00           jmpf	wcsspn
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strspn

Disassembly of section .text.wcspbrk:

<wcspbrk>:
 e2 00 00 00           jmpf	wcspbrk
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strpbrk

Disassembly of section .text.wcsstr:

<wcsstr>:
 e2 00 00 00           jmpf	wcsstr
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strstr

Disassembly of section .text.wmemchr:

<wmemchr>:
 e2 00 00 00           jmpf	wmemchr
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	memchr

Disassembly of section .text.wcslen:

<wcslen>:
 d7 1a                 sys	strlen
 ef                    ret

Disassembly of section .text.wmemset:

<wmemset>:
 e2 00 00 00           jmpf	wmemset
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	memset

Disassembly of section .text.wcstok:

<wcstok>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 f1 14                 mov	r2, r4
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstok
		R_AVM_FAR24	.text.wcstok+0x1d
<L0>:
 ed 50 20              ld16	r2, [r0+0]
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstok
		R_AVM_FAR24	.text.wcstok+0x60
<L1>:
 f2 4b                 sub	r3, r3
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	wcstok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strspn
 f2 22                 add	r4, r2
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstok
		R_AVM_FAR24	.text.wcstok+0x4e
<L2>:
 f1 14                 mov	r2, r4
 f1 25                 mov	r5, r1
 e3 00 00 00           callf	wcstok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strcspn
 04                    mov	r5, r4
 f1 22                 mov	r4, r2
 14                    add	r5, r4
 49                    ld8u	r6, [r5]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstok
		R_AVM_FAR24	.text.wcstok+0x56
<L3>:
 aa                    xor	r6, r6
 f6 0e                 st8	[r5+], r6
 e2 00 00 00           jmpf	wcstok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wcstok+0x58
 f1 27                 mov	r5, r3
 f1 23                 mov	r4, r3
 e2 00 00 00           jmpf	wcstok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wcstok+0x58
 f1 27                 mov	r5, r3
 ee b0 20              st16	[r0+0], r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	wcstok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wcstok+0x5b
