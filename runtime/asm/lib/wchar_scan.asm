
wchar_scan.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 wchar_scan.c
00000000 l    d  .text.vswscanf	00000000 .text.vswscanf
00000000 l     F .text.wide_read	00000014 wide_read
00000000 l     F .text.wide_unread	00000006 wide_unread
00000000 l    d  .text.wide_read	00000000 .text.wide_read
00000000 l    d  .text.wide_unread	00000000 .text.wide_unread
00000000 l    d  .text.vfwscanf	00000000 .text.vfwscanf
00000000 l     F .text.stream_read	00000004 stream_read
00000000 l     F .text.stream_unread	00000007 stream_unread
00000000 l    d  .text.stream_read	00000000 .text.stream_read
00000000 l    d  .text.stream_unread	00000000 .text.stream_unread
00000000 l    d  .text.vwscanf	00000000 .text.vwscanf
00000000 l    d  .text.fwscanf	00000000 .text.fwscanf
00000000 l    d  .text.swscanf	00000000 .text.swscanf
00000000 l    d  .text.wscanf	00000000 .text.wscanf
00000000 g     F .text.vswscanf	00000044 vswscanf
00000000         *UND*	00000000 __avm_vscan
00000000 g     F .text.vfwscanf	00000092 vfwscanf
00000000         *UND*	00000000 __avm_errno
00000000         *UND*	00000000 fgetwc
00000000         *UND*	00000000 ungetwc
00000000 g     F .text.vwscanf	0000008a vwscanf
00000000         *UND*	00000000 __avm_stdin
00000000 g     F .text.fwscanf	0000009e fwscanf
00000000 g     F .text.swscanf	0000004f swscanf
00000000 g     F .text.wscanf	00000091 wscanf

Disassembly of section .text.vswscanf:

<vswscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 60                 stsp16	[sp+0x8], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.wide_read
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.wide_read
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 29 0e              stsp8	[sp+0xe], r1
 f1 20                 mov	r4, r0
 f1 38                 stsp8	[sp+0x2], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.wide_unread
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.wide_unread
 f0 38 0f              stsp16	[sp+0xf], r0
 f0 29 11              stsp8	[sp+0x11], r1
 f1 20                 mov	r4, r0
 f1 44                 stsp8	[sp+0x5], r4
 f0 14 08              leasp	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 68                 stsp16	[sp+0xa], r4
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 4c                 stsp16	[sp+0x3], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 58                 stsp16	[sp+0x6], r4
 f0 14 00              leasp	r4, 0x0
 e3 00 00 00           callf	vswscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.wide_read:

<wide_read>:
 64                    ld16	r5, [r4]
 49                    ld8u	r6, [r5]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wide_read
		R_AVM_FAR24	.text.wide_read+0x10
<L0>:
 09                    mov	r6, r5
 f4 ae                 inc16	r6
 72                    st16	[r4], r6
 41                    ld8u	r4, [r5]
 ef                    ret
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.wide_unread:

<wide_unread>:
 68                    ld16	r6, [r4]
 f4 b6                 dec16	r6
 72                    st16	[r4], r6
 01                    mov	r4, r5
 ef                    ret

Disassembly of section .text.vfwscanf:

<vfwscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfwscanf
		R_AVM_FAR24	.text.vfwscanf+0x33
<L0>:
 f5 30                 ld8u	r0, [r4]
 c3 21                 ldi8	r7, 0x21
 f9 e0                 and	r7, r0
 cf 01                 cmpi.s8	r7, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfwscanf
		R_AVM_FAR24	.text.vfwscanf+0x2d
<L1>:
 f0 0c 40              cmpi.s8	r0, 0x40
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfwscanf
		R_AVM_FAR24	.text.vfwscanf+0x40
<L2>:
 c3 80                 ldi8	r7, 0x80
 f9 1d                 or	r0, r7
 f3 00                 st8	[r4], r0
 e2 00 00 00           jmpf	vfwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfwscanf+0x4c
 c1 08                 ldi8	r5, 0x8
 f9 15                 or	r0, r5
 f3 00                 st8	[r4], r0
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 e2 00 00 00           jmpf	vfwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfwscanf+0x81
 f1 2c                 mov	r7, r0
 f6 47                 sext8	r7
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfwscanf
		R_AVM_FAR24	.text.vfwscanf+0x86
<L3>:
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
 e3 00 00 00           callf	vfwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c1 08                 ldi8	r5, 0x8
 f9 15                 or	r0, r5
 f3 00                 st8	[r4], r0
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	vfwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfwscanf+0x35

Disassembly of section .text.stream_read:

<stream_read>:
 e2 00 00 00           jmpf	stream_read
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fgetwc

Disassembly of section .text.stream_unread:

<stream_unread>:
 08                    mov	r6, r4
 01                    mov	r4, r5
 06                    mov	r5, r6
 e2 00 00 00           jmpf	stream_unread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	ungetwc

Disassembly of section .text.vwscanf:

<vwscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 09                    mov	r6, r5
 04                    mov	r5, r4
 c3 21                 ldi8	r7, 0x21
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	__avm_stdin
 8c                    and	r7, r4
 cf 01                 cmpi.s8	r7, 0x1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vwscanf
		R_AVM_FAR24	.text.vwscanf+0x28
<L0>:
 cc 40                 cmpi.s8	r4, 0x40
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vwscanf
		R_AVM_FAR24	.text.vwscanf+0x3c
<L1>:
 c3 80                 ldi8	r7, 0x80
 93                    or	r4, r7
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	__avm_stdin
 e2 00 00 00           jmpf	vwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vwscanf+0x47
 c1 09                 ldi8	r5, 0x9
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 c1 08                 ldi8	r5, 0x8
 91                    or	r4, r5
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	__avm_stdin
 c4 ff ff              ldi16	r4, 0xffff
 e2 00 00 00           jmpf	vwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vwscanf+0x7f
 0c                    mov	r7, r4
 f6 47                 sext8	r7
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vwscanf
		R_AVM_FAR24	.text.vwscanf+0x84
<L2>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_stdin
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
 e3 00 00 00           callf	vwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c1 16                 ldi8	r5, 0x16
 e2 00 00 00           jmpf	vwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vwscanf+0x2a

Disassembly of section .text.fwscanf:

<fwscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f0 35 1b              ldsp16	r5, [sp+0x1b]
 f0 30 19              ldsp16	r0, [sp+0x19]
 f0 16 1d              leasp	r6, 0x1d
 f4 42                 stsp16	[sp+0x0], r6
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwscanf
		R_AVM_FAR24	.text.fwscanf+0x3d
<L0>:
 ed e0 20              ld8u	r7, [r0+0]
 c0 21                 ldi8	r4, 0x21
 83                    and	r4, r7
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwscanf
		R_AVM_FAR24	.text.fwscanf+0x37
<L1>:
 cf 40                 cmpi.s8	r7, 0x40
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwscanf
		R_AVM_FAR24	.text.fwscanf+0x4a
<L2>:
 c0 80                 ldi8	r4, 0x80
 9c                    or	r7, r4
 ee e0 20              st8	[r0+0], r7
 e2 00 00 00           jmpf	fwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwscanf+0x55
 c0 08                 ldi8	r4, 0x8
 9c                    or	r7, r4
 ee e0 20              st8	[r0+0], r7
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 e2 00 00 00           jmpf	fwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwscanf+0x8d
 03                    mov	r4, r7
 f6 44                 sext8	r4
 cc c0                 cmpi.s8	r4, -0x40
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwscanf
		R_AVM_FAR24	.text.fwscanf+0x92
<L3>:
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 38 02              stsp16	[sp+0x2], r0
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
 e3 00 00 00           callf	fwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c0 08                 ldi8	r4, 0x8
 9c                    or	r7, r4
 ee e0 20              st8	[r0+0], r7
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	fwscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwscanf+0x3f

Disassembly of section .text.swscanf:

<swscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f0 35 1d              ldsp16	r5, [sp+0x1d]
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 f0 16 1f              leasp	r6, 0x1f
 f4 62                 stsp16	[sp+0x8], r6
 f4 68                 stsp16	[sp+0xa], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.wide_read
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.wide_read
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 29 10              stsp8	[sp+0x10], r1
 f1 20                 mov	r4, r0
 f1 38                 stsp8	[sp+0x2], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.wide_unread
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.wide_unread
 f0 38 11              stsp16	[sp+0x11], r0
 f0 29 13              stsp8	[sp+0x13], r1
 f1 20                 mov	r4, r0
 f1 44                 stsp8	[sp+0x5], r4
 f0 14 0a              leasp	r4, 0xa
 f4 40                 stsp16	[sp+0x0], r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 3c                 ldsp16	r4, [sp+0xf]
 f4 4c                 stsp16	[sp+0x3], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 58                 stsp16	[sp+0x6], r4
 f0 14 00              leasp	r4, 0x0
 e3 00 00 00           callf	swscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.wscanf:

<wscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f0 35 19              ldsp16	r5, [sp+0x19]
 f0 16 1b              leasp	r6, 0x1b
 f4 42                 stsp16	[sp+0x0], r6
 c3 21                 ldi8	r7, 0x21
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	__avm_stdin
 8c                    and	r7, r4
 cf 01                 cmpi.s8	r7, 0x1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wscanf
		R_AVM_FAR24	.text.wscanf+0x2e
<L0>:
 cc 40                 cmpi.s8	r4, 0x40
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wscanf
		R_AVM_FAR24	.text.wscanf+0x42
<L1>:
 c3 80                 ldi8	r7, 0x80
 93                    or	r4, r7
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	__avm_stdin
 e2 00 00 00           jmpf	wscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wscanf+0x4d
 c1 09                 ldi8	r5, 0x9
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 c1 08                 ldi8	r5, 0x8
 91                    or	r4, r5
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	__avm_stdin
 c4 ff ff              ldi16	r4, 0xffff
 e2 00 00 00           jmpf	wscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wscanf+0x86
 0c                    mov	r7, r4
 f6 47                 sext8	r7
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wscanf
		R_AVM_FAR24	.text.wscanf+0x8b
<L2>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_stdin
 f4 68                 stsp16	[sp+0xa], r4
 f4 48                 stsp16	[sp+0x2], r4
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
 e3 00 00 00           callf	wscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c1 16                 ldi8	r5, 0x16
 e2 00 00 00           jmpf	wscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wscanf+0x30
