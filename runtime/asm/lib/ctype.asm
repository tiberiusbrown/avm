
ctype.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    d  .text.isalnum	00000000 .text.isalnum
00000000 l    d  .text.isalpha	00000000 .text.isalpha
00000000 l    d  .text.isdigit	00000000 .text.isdigit
00000000 l    d  .text.isblank	00000000 .text.isblank
00000000 l    d  .text.iscntrl	00000000 .text.iscntrl
00000000 l    d  .text.isgraph	00000000 .text.isgraph
00000000 l    d  .text.islower	00000000 .text.islower
00000000 l    d  .text.isprint	00000000 .text.isprint
00000000 l    d  .text.ispunct	00000000 .text.ispunct
00000000 l    d  .text.isspace	00000000 .text.isspace
00000000 l    d  .text.isupper	00000000 .text.isupper
00000000 l    d  .text.isxdigit	00000000 .text.isxdigit
00000000 l    d  .text.tolower	00000000 .text.tolower
00000000 l    d  .text.toupper	00000000 .text.toupper
00000000 g     F .text.isalnum	00000011 isalnum
00000000 g     F .text.isalpha	0000000a isalpha
00000000 g     F .text.isdigit	00000007 isdigit
00000000 g     F .text.isblank	0000000a isblank
00000000 g     F .text.iscntrl	0000000a iscntrl
00000000 g     F .text.isgraph	00000007 isgraph
00000000 g     F .text.islower	00000007 islower
00000000 g     F .text.isprint	00000007 isprint
00000000 g     F .text.ispunct	0000001e ispunct
00000000 g     F .text.isspace	0000000c isspace
00000000 g     F .text.isupper	00000007 isupper
00000000 g     F .text.isxdigit	00000011 isxdigit
00000000 g     F .text.tolower	0000000c tolower
00000000 g     F .text.toupper	0000000c toupper

Disassembly of section .text.isalnum:

<isalnum>:
 c1 20                 ldi8	r5, 0x20
 94                    or	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 cd 1a                 cmpi.s8	r5, 0x1a
 f8 15                 cset.ult	r5
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret

Disassembly of section .text.isalpha:

<isalpha>:
 c1 20                 ldi8	r5, 0x20
 94                    or	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 cd 1a                 cmpi.s8	r5, 0x1a
 f8 14                 cset.ult	r4
 ef                    ret

Disassembly of section .text.isdigit:

<isdigit>:
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 f8 14                 cset.ult	r4
 ef                    ret

Disassembly of section .text.isblank:

<isblank>:
 cc 09                 cmpi.s8	r4, 0x9
 f8 05                 cset.eq	r5
 cc 20                 cmpi.s8	r4, 0x20
 f8 04                 cset.eq	r4
 91                    or	r4, r5
 ef                    ret

Disassembly of section .text.iscntrl:

<iscntrl>:
 cc 7f                 cmpi.s8	r4, 0x7f
 f8 05                 cset.eq	r5
 cc 20                 cmpi.s8	r4, 0x20
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret

Disassembly of section .text.isgraph:

<isgraph>:
 c8 df                 addi.s8	r4, -0x21
 cc 5e                 cmpi.s8	r4, 0x5e
 f8 14                 cset.ult	r4
 ef                    ret

Disassembly of section .text.islower:

<islower>:
 c8 9f                 addi.s8	r4, -0x61
 cc 1a                 cmpi.s8	r4, 0x1a
 f8 14                 cset.ult	r4
 ef                    ret

Disassembly of section .text.isprint:

<isprint>:
 c8 e0                 addi.s8	r4, -0x20
 cc 5f                 cmpi.s8	r4, 0x5f
 f8 14                 cset.ult	r4
 ef                    ret

Disassembly of section .text.ispunct:

<ispunct>:
 04                    mov	r5, r4
 c9 81                 addi.s8	r5, -0x7f
 cd a2                 cmpi.s8	r5, -0x5e
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ispunct
		R_AVM_FAR24	.text.ispunct+0xd
<L0>:
 a0                    xor	r4, r4
 ef                    ret
 c1 20                 ldi8	r5, 0x20
 94                    or	r5, r4
 c9 85                 addi.s8	r5, -0x7b
 cd e6                 cmpi.s8	r5, -0x1a
 f8 15                 cset.ult	r5
 c8 c6                 addi.s8	r4, -0x3a
 cc f6                 cmpi.s8	r4, -0xa
 f8 14                 cset.ult	r4
 81                    and	r4, r5
 ef                    ret

Disassembly of section .text.isspace:

<isspace>:
 cc 20                 cmpi.s8	r4, 0x20
 f8 05                 cset.eq	r5
 c8 f7                 addi.s8	r4, -0x9
 cc 05                 cmpi.s8	r4, 0x5
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret

Disassembly of section .text.isupper:

<isupper>:
 c8 bf                 addi.s8	r4, -0x41
 cc 1a                 cmpi.s8	r4, 0x1a
 f8 14                 cset.ult	r4
 ef                    ret

Disassembly of section .text.isxdigit:

<isxdigit>:
 c1 20                 ldi8	r5, 0x20
 94                    or	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 cd 06                 cmpi.s8	r5, 0x6
 f8 15                 cset.ult	r5
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret

Disassembly of section .text.tolower:

<tolower>:
 08                    mov	r6, r4
 ca a5                 addi.s8	r6, -0x5b
 04                    mov	r5, r4
 c9 20                 addi.s8	r5, 0x20
 ce e6                 cmpi.s8	r6, -0x1a
 fc 2c                 cmov.ult	r5, r4
 01                    mov	r4, r5
 ef                    ret

Disassembly of section .text.toupper:

<toupper>:
 08                    mov	r6, r4
 ca 85                 addi.s8	r6, -0x7b
 04                    mov	r5, r4
 c9 e0                 addi.s8	r5, -0x20
 ce e6                 cmpi.s8	r6, -0x1a
 fc 2c                 cmov.ult	r5, r4
 01                    mov	r4, r5
 ef                    ret
