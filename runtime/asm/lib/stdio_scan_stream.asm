
stdio_scan_stream.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_scan_stream.c
00000000 l    d  .text.vfscanf	00000000 .text.vfscanf
00000000 l     F .text.stream_read	00000004 stream_read
00000000 l     F .text.stream_unread	00000007 stream_unread
00000000 l    d  .text.stream_read	00000000 .text.stream_read
00000000 l    d  .text.stream_unread	00000000 .text.stream_unread
00000000 l    d  .text.fscanf	00000000 .text.fscanf
00000000 g     F .text.vfscanf	0000003e vfscanf
00000000         *UND*	00000000 __avm_vscan
00000000         *UND*	00000000 fgetc
00000000         *UND*	00000000 ungetc
00000000 g     F .text.fscanf	0000004a fscanf

Disassembly of section .text.vfscanf:

<vfscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f4 60                 stsp16	[sp+0x8], r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.stream_read
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.stream_read
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 29 0c              stsp8	[sp+0xc], r1
 f1 20                 mov	r4, r0
 f1 38                 stsp8	[sp+0x2], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.stream_unread
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.stream_unread
 f0 38 0d              stsp16	[sp+0xd], r0
 f0 29 0f              stsp8	[sp+0xf], r1
 f1 20                 mov	r4, r0
 f1 44                 stsp8	[sp+0x5], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 4c                 stsp16	[sp+0x3], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 58                 stsp16	[sp+0x6], r4
 f0 14 00              leasp	r4, 0x0
 e3 00 00 00           callf	vfscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.stream_read:

<stream_read>:
 e2 00 00 00           jmpf	stream_read
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fgetc

Disassembly of section .text.stream_unread:

<stream_unread>:
 08                    mov	r6, r4
 01                    mov	r4, r5
 06                    mov	r5, r6
 e2 00 00 00           jmpf	stream_unread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	ungetc

Disassembly of section .text.fscanf:

<fscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f0 35 1b              ldsp16	r5, [sp+0x1b]
 f0 34 19              ldsp16	r4, [sp+0x19]
 f0 16 1d              leasp	r6, 0x1d
 f4 62                 stsp16	[sp+0x8], r6
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.stream_read
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.stream_read
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 29 0e              stsp8	[sp+0xe], r1
 f1 2c                 mov	r7, r0
 f1 3b                 stsp8	[sp+0x2], r7
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.stream_unread
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.stream_unread
 f0 38 0f              stsp16	[sp+0xf], r0
 f0 29 11              stsp8	[sp+0x11], r1
 f1 2c                 mov	r7, r0
 f1 47                 stsp8	[sp+0x5], r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 68                 stsp16	[sp+0xa], r4
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 4c                 stsp16	[sp+0x3], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 58                 stsp16	[sp+0x6], r4
 f0 14 00              leasp	r4, 0x0
 e3 00 00 00           callf	fscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
