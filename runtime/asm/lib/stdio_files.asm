
stdio_files.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_files.c
00000000 l    d  .text.fopen	00000000 .text.fopen
00000000 l    d  .text.freopen	00000000 .text.freopen
00000000 l    d  .text.remove	00000000 .text.remove
00000000 l    d  .text.rename	00000000 .text.rename
00000000 l    d  .text.tmpfile	00000000 .text.tmpfile
00000000 l    d  .text.tmpnam	00000000 .text.tmpnam
00000000 g     F .text.fopen	00000008 fopen
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.freopen	0000000d freopen
00000000         *UND*	00000000 fclose
00000000 g     F .text.remove	0000000a remove
00000000 g     F .text.rename	0000000a rename
00000000 g     F .text.tmpfile	00000008 tmpfile
00000000 g     F .text.tmpnam	00000008 tmpnam

Disassembly of section .text.fopen:

<fopen>:
 c0 26                 ldi8	r4, 0x26
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.freopen:

<freopen>:
 02                    mov	r4, r6
 e3 00 00 00           callf	freopen
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fclose
 c0 26                 ldi8	r4, 0x26
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.remove:

<remove>:
 c0 26                 ldi8	r4, 0x26
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.rename:

<rename>:
 c0 26                 ldi8	r4, 0x26
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.tmpfile:

<tmpfile>:
 c0 26                 ldi8	r4, 0x26
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.tmpnam:

<tmpnam>:
 c0 26                 ldi8	r4, 0x26
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 ef                    ret
