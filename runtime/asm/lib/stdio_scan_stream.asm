
stdio_scan_stream.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_scan_stream.c
00000000 l    d  .text.vfscanf	00000000 .text.vfscanf
00000000 l     F .text.stream_read	00000004 stream_read
00000000 l     F .text.stream_unread	00000007 stream_unread
00000000 l    d  .text.stream_read	00000000 .text.stream_read
00000000 l    d  .text.stream_unread	00000000 .text.stream_unread
00000000 l    d  .text.fscanf	00000000 .text.fscanf
00000000 g     F .text.vfscanf	0000008f vfscanf
00000000         *UND*	00000000 __avm_vscan
00000000         *UND*	00000000 __avm_errno
00000000         *UND*	00000000 fgetc
00000000         *UND*	00000000 ungetc
00000000 g     F .text.fscanf	0000009d fscanf

Disassembly of section .text.vfscanf:

<vfscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfscanf
		R_AVM_FAR24	.text.vfscanf+0x75
<L0>:
 f5 31                 ld8u	r1, [r4]
 c3 21                 ldi8	r7, 0x21
 f9 e4                 and	r7, r1
 cf 01                 cmpi.s8	r7, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfscanf
		R_AVM_FAR24	.text.vfscanf+0x6f
<L1>:
 f0 00 c0              ldi8	r0, 0xc0
 f9 04                 and	r0, r1
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfscanf
		R_AVM_FAR24	.text.vfscanf+0x36
<L2>:
 f4 a0                 tst8	r0
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfscanf
		R_AVM_FAR24	.text.vfscanf+0x83
<L3>:
 c3 40                 ldi8	r7, 0x40
 f9 3d                 or	r1, r7
 f3 01                 st8	[r4], r1
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
 e2 00 00 00           jmpf	vfscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfscanf+0x7e
 c1 08                 ldi8	r5, 0x8
 f9 35                 or	r1, r5
 f3 01                 st8	[r4], r1
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c1 08                 ldi8	r5, 0x8
 f9 35                 or	r1, r5
 f3 01                 st8	[r4], r1
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	vfscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfscanf+0x77

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
 f0 31 19              ldsp16	r1, [sp+0x19]
 f0 16 1d              leasp	r6, 0x1d
 f4 42                 stsp16	[sp+0x0], r6
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fscanf
		R_AVM_FAR24	.text.fscanf+0x83
<L0>:
 ed e2 20              ld8u	r7, [r1+0]
 c0 21                 ldi8	r4, 0x21
 83                    and	r4, r7
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fscanf
		R_AVM_FAR24	.text.fscanf+0x7d
<L1>:
 f0 00 c0              ldi8	r0, 0xc0
 f9 1c                 and	r0, r7
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fscanf
		R_AVM_FAR24	.text.fscanf+0x41
<L2>:
 f4 a0                 tst8	r0
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fscanf
		R_AVM_FAR24	.text.fscanf+0x91
<L3>:
 c0 40                 ldi8	r4, 0x40
 9c                    or	r7, r4
 ee e2 20              st8	[r1+0], r7
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 39 02              stsp16	[sp+0x2], r1
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.stream_read
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.stream_read
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 29 0e              stsp8	[sp+0xe], r1
 f1 20                 mov	r4, r0
 f1 40                 stsp8	[sp+0x4], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.stream_unread
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.stream_unread
 f0 38 0f              stsp16	[sp+0xf], r0
 f0 29 11              stsp8	[sp+0x11], r1
 f1 20                 mov	r4, r0
 f1 4c                 stsp8	[sp+0x7], r4
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 54                 stsp16	[sp+0x5], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 60                 stsp16	[sp+0x8], r4
 f0 14 02              leasp	r4, 0x2
 e3 00 00 00           callf	fscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 e2 00 00 00           jmpf	fscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fscanf+0x8c
 c0 08                 ldi8	r4, 0x8
 9c                    or	r7, r4
 ee e2 20              st8	[r1+0], r7
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c0 08                 ldi8	r4, 0x8
 9c                    or	r7, r4
 ee e2 20              st8	[r1+0], r7
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	fscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fscanf+0x85
