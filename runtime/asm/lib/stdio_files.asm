
stdio_files.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_files.c
00000000 l    d  .text.fopen	00000000 .text.fopen
00000000 l    d  .text.freopen	00000000 .text.freopen
00000000 l    d  .text.remove	00000000 .text.remove
00000000 l    d  .text.rename	00000000 .text.rename
00000000 l    d  .text.tmpfile	00000000 .text.tmpfile
00000000 l    d  .text.tmpnam	00000000 .text.tmpnam
00000000 l     O .flash.str1.1	00000011 tmpnam.digits
00000000 l    d  .flash.str1.1	00000000 .flash.str1.1
00000000 l    d  .data..L_MergedGlobals	00000000 .data..L_MergedGlobals
00000000 l     O .data..L_MergedGlobals	00000004 tmpnam.next
00000004 l     O .data..L_MergedGlobals	00000010 tmpnam.name
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.fopen	00000008 fopen
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.freopen	00000017 freopen
00000000         *UND*	00000000 fclose
00000000         *UND*	00000000 clearerr
00000000 g     F .text.remove	0000000a remove
00000000 g     F .text.rename	0000000a rename
00000000 g     F .text.tmpfile	00000008 tmpfile
00000000 g     F .text.tmpnam	00000099 tmpnam

Disassembly of section .text.fopen:

<fopen>:
 c0 26                 ldi8	r4, 0x26
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.freopen:

<freopen>:
 b0                    push16	r0
 f1 06                 mov	r0, r6
 02                    mov	r4, r6
 e3 00 00 00           callf	freopen
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fclose
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	freopen
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	clearerr
 c0 26                 ldi8	r4, 0x26
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 b8                    pop16	r0
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
 b1                    push16	r1
 b0                    push16	r0
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	.data..L_MergedGlobals
 f0 6a ca              ld32	q3, [r5]
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	tmpnam
		R_AVM_FAR24	.text.tmpnam+0x95
<L0>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 6b 0a              st32	[r5], q0
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	.data..L_MergedGlobals+0x4
 f6 2c                 tst16	r4
 fb 25                 cmov.eq	r4, r5
 f0 04 74 6d           ldi16	r0, 0x6d74
 f0 01 70              ldi8	r1, 0x70
 04                    mov	r5, r4
 f7 48                 st16	[r5+], r0
 f3 05                 st8	[r5], r1
 a5                    xor	r5, r5
 ee a8 2b              st8	[r4+11], r5
 f0 00 0f              ldi8	r0, 0xf
 06                    mov	r5, r6
 f9 a0                 and	r5, r0
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	.flash.str1.1
 f2 25                 add	r5, r1
 45                    ld8u	r5, [r5]
 ee a8 2a              st8	[r4+10], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 f2 25                 add	r5, r1
 45                    ld8u	r5, [r5]
 ee a8 27              st8	[r4+7], r5
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 f9 a0                 and	r5, r0
 f2 25                 add	r5, r1
 45                    ld8u	r5, [r5]
 ee a8 29              st8	[r4+9], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 f2 25                 add	r5, r1
 45                    ld8u	r5, [r5]
 ee a8 28              st8	[r4+8], r5
 0b                    mov	r6, r7
 06                    mov	r5, r6
 f9 a0                 and	r5, r0
 f2 25                 add	r5, r1
 45                    ld8u	r5, [r5]
 ee a8 26              st8	[r4+6], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 f2 25                 add	r5, r1
 45                    ld8u	r5, [r5]
 ee a8 23              st8	[r4+3], r5
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 f9 a0                 and	r5, r0
 f2 25                 add	r5, r1
 45                    ld8u	r5, [r5]
 ee a8 25              st8	[r4+5], r5
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 f2 29                 add	r6, r1
 46                    ld8u	r5, [r6]
 ee a8 24              st8	[r4+4], r5
 e2 00 00 00           jmpf	tmpnam
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.tmpnam+0x96
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
