
wchar_stream.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 wchar_stream.c
00000000 l    d  .text.fwide	00000000 .text.fwide
00000000 l    d  .text.fgetwc	00000000 .text.fgetwc
00000000 l    d  .text.fputwc	00000000 .text.fputwc
00000000 l    d  .text.fgetws	00000000 .text.fgetws
00000000 l    d  .text.fputws	00000000 .text.fputws
00000000 l    d  .text.getwc	00000000 .text.getwc
00000000 l    d  .text.getwchar	00000000 .text.getwchar
00000000 l    d  .text.putwc	00000000 .text.putwc
00000000 l    d  .text.putwchar	00000000 .text.putwchar
00000000 l    d  .text.ungetwc	00000000 .text.ungetwc
00000000 g     F .text.fwide	00000054 fwide
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.fgetwc	00000070 fgetwc
00000000 g     F .text.fputwc	00000049 fputwc
00000000 g     F .text.fgetws	000000b6 fgetws
00000000 g     F .text.fputws	00000065 fputws
00000000 g     F .text.getwc	00000070 getwc
00000000 g     F .text.getwchar	0000006e getwchar
00000000         *UND*	00000000 __avm_stdin
00000000 g     F .text.putwc	00000049 putwc
00000000 g     F .text.putwchar	00000046 putwchar
00000000         *UND*	00000000 __avm_stdout
00000000 g     F .text.ungetwc	00000084 ungetwc

Disassembly of section .text.fwide:

<fwide>:
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwide
		R_AVM_FAR24	.text.fwide+0x4b
<L0>:
 4c                    ld8u	r7, [r4]
 c2 20                 ldi8	r6, 0x20
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwide
		R_AVM_FAR24	.text.fwide+0x47
<L1>:
 c2 c0                 ldi8	r6, 0xc0
 8b                    and	r6, r7
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwide
		R_AVM_FAR24	.text.fwide+0x34
<L2>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwide
		R_AVM_FAR24	.text.fwide+0x34
<L3>:
 c2 40                 ldi8	r6, 0x40
 f0 04 80 ff           ldi16	r0, 0xff80
 cd 01                 cmpi.s8	r5, 0x1
 fd 70                 cmov.sge	r6, r0
 9e                    or	r7, r6
 53                    st8	[r4], r7
 f1 76                 zext8	r6
 a0                    xor	r4, r4
 c5 ff ff              ldi16	r5, 0xffff
 ce 40                 cmpi.s8	r6, 0x40
 fb 25                 cmov.eq	r4, r5
 c1 80                 ldi8	r5, 0x80
 c3 01                 ldi8	r7, 0x1
 39                    cmp	r6, r5
 fb 27                 cmov.eq	r4, r7
 b8                    pop16	r0
 ef                    ret
 c1 08                 ldi8	r5, 0x8
 9d                    or	r7, r5
 53                    st8	[r4], r7
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.fgetwc:

<fgetwc>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetwc
		R_AVM_FAR24	.text.fgetwc+0x33
<L0>:
 44                    ld8u	r5, [r4]
 c2 21                 ldi8	r6, 0x21
 89                    and	r6, r5
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetwc
		R_AVM_FAR24	.text.fgetwc+0x2f
<L1>:
 cd 40                 cmpi.s8	r5, 0x40
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetwc
		R_AVM_FAR24	.text.fgetwc+0x3d
<L2>:
 c6 80 ff              ldi16	r6, 0xff80
 96                    or	r5, r6
 c2 10                 ldi8	r6, 0x10
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetwc
		R_AVM_FAR24	.text.fgetwc+0x5d
<L3>:
 e2 00 00 00           jmpf	fgetwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgetwc+0x53
 c2 08                 ldi8	r6, 0x8
 96                    or	r5, r6
 51                    st8	[r4], r5
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 09                    mov	r6, r5
 f6 46                 sext8	r6
 ce c0                 cmpi.s8	r6, -0x40
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetwc
		R_AVM_FAR24	.text.fgetwc+0x66
<L4>:
 c2 10                 ldi8	r6, 0x10
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetwc
		R_AVM_FAR24	.text.fgetwc+0x5d
<L5>:
 c2 04                 ldi8	r6, 0x4
 96                    or	r5, r6
 c6 ff ff              ldi16	r6, 0xffff
 e2 00 00 00           jmpf	fgetwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgetwc+0x63
 c2 ef                 ldi8	r6, 0xef
 86                    and	r5, r6
 ed c8 21              ld8u	r6, [r4+1]
 51                    st8	[r4], r5
 02                    mov	r4, r6
 ef                    ret
 c2 08                 ldi8	r6, 0x8
 96                    or	r5, r6
 51                    st8	[r4], r5
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	fgetwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgetwc+0x35

Disassembly of section .text.fputwc:

<fputwc>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputwc
		R_AVM_FAR24	.text.fputwc+0x27
<L0>:
 49                    ld8u	r6, [r5]
 c3 22                 ldi8	r7, 0x22
 8e                    and	r7, r6
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputwc
		R_AVM_FAR24	.text.fputwc+0x23
<L1>:
 ce 40                 cmpi.s8	r6, 0x40
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputwc
		R_AVM_FAR24	.text.fputwc+0x31
<L2>:
 c3 80                 ldi8	r7, 0x80
 9b                    or	r6, r7
 56                    st8	[r5], r6
 d7 00                 sys	debug_putc
 ef                    ret
 c0 08                 ldi8	r4, 0x8
 98                    or	r6, r4
 56                    st8	[r5], r6
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 0e                    mov	r7, r6
 f6 47                 sext8	r7
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputwc
		R_AVM_FAR24	.text.fputwc+0x3f
<L3>:
 d7 00                 sys	debug_putc
 ef                    ret
 c0 08                 ldi8	r4, 0x8
 98                    or	r6, r4
 56                    st8	[r5], r6
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	fputwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fputwc+0x29

Disassembly of section .text.fgetws:

<fgetws>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetws
		R_AVM_FAR24	.text.fgetws+0x3c
<L0>:
 f5 39                 ld8u	r1, [r6]
 c3 21                 ldi8	r7, 0x21
 f9 e4                 and	r7, r1
 cf 01                 cmpi.s8	r7, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetws
		R_AVM_FAR24	.text.fgetws+0x36
<L1>:
 f0 0d 40              cmpi.s8	r1, 0x40
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetws
		R_AVM_FAR24	.text.fgetws+0x46
<L2>:
 c7 80 ff              ldi16	r7, 0xff80
 f9 3d                 or	r1, r7
 f3 09                 st8	[r6], r1
 f2 30                 sub	r0, r0
 cd 01                 cmpi.s8	r5, 0x1
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetws
		R_AVM_FAR24	.text.fgetws+0x78
<L3>:
 e2 00 00 00           jmpf	fgetws
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgetws+0x5c
 c0 08                 ldi8	r4, 0x8
 f9 31                 or	r1, r4
 f3 09                 st8	[r6], r1
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f1 2d                 mov	r7, r1
 f6 47                 sext8	r7
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetws
		R_AVM_FAR24	.text.fgetws+0x7e
<L4>:
 f2 30                 sub	r0, r0
 cd 01                 cmpi.s8	r5, 0x1
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetws
		R_AVM_FAR24	.text.fgetws+0x78
<L5>:
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetws
		R_AVM_FAR24	.text.fgetws+0xaf
<L6>:
 c3 10                 ldi8	r7, 0x10
 f9 e4                 and	r7, r1
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetws
		R_AVM_FAR24	.text.fgetws+0x8a
<L7>:
 c0 04                 ldi8	r4, 0x4
 f9 31                 or	r1, r4
 f3 09                 st8	[r6], r1
 f1 20                 mov	r4, r0
 e2 00 00 00           jmpf	fgetws
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgetws+0x43
 c0 08                 ldi8	r4, 0x8
 f9 31                 or	r1, r4
 f3 09                 st8	[r6], r1
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	fgetws
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgetws+0x3e
 c3 ef                 ldi8	r7, 0xef
 f9 3c                 and	r1, r7
 f3 09                 st8	[r6], r1
 ed ec 21              ld8u	r7, [r6+1]
 53                    st8	[r4], r7
 f0 00 01              ldi8	r0, 0x1
 cf 0a                 cmpi.s8	r7, 0xa
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetws
		R_AVM_FAR24	.text.fgetws+0xad
<L8>:
 cd 01                 cmpi.s8	r5, 0x1
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetws
		R_AVM_FAR24	.text.fgetws+0xaf
<L9>:
 c1 04                 ldi8	r5, 0x4
 f9 35                 or	r1, r5
 f3 09                 st8	[r6], r1
 f1 24                 mov	r5, r0
 14                    add	r5, r4
 aa                    xor	r6, r6
 56                    st8	[r5], r6
 e2 00 00 00           jmpf	fgetws
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgetws+0x43

Disassembly of section .text.fputws:

<fputws>:
 08                    mov	r6, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputws
		R_AVM_FAR24	.text.fputws+0x25
<L0>:
 41                    ld8u	r4, [r5]
 c3 22                 ldi8	r7, 0x22
 8c                    and	r7, r4
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputws
		R_AVM_FAR24	.text.fputws+0x2b
<L1>:
 cc 40                 cmpi.s8	r4, 0x40
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputws
		R_AVM_FAR24	.text.fputws+0x39
<L2>:
 c3 80                 ldi8	r7, 0x80
 93                    or	r4, r7
 54                    st8	[r5], r4
 e2 00 00 00           jmpf	fputws
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fputws+0x44
 c2 09                 ldi8	r6, 0x9
 e2 00 00 00           jmpf	fputws
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fputws+0x31
 c2 09                 ldi8	r6, 0x9
 c3 08                 ldi8	r7, 0x8
 93                    or	r4, r7
 54                    st8	[r5], r4
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 0c                    mov	r7, r4
 f6 47                 sext8	r7
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputws
		R_AVM_FAR24	.text.fputws+0x5f
<L3>:
 a5                    xor	r5, r5
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputws
		R_AVM_FAR24	.text.fputws+0x5d
<L4>:
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputws
		R_AVM_FAR24	.text.fputws+0x4e
<L5>:
 01                    mov	r4, r5
 ef                    ret
 c2 16                 ldi8	r6, 0x16
 e2 00 00 00           jmpf	fputws
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fputws+0x2d

Disassembly of section .text.getwc:

<getwc>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwc
		R_AVM_FAR24	.text.getwc+0x33
<L0>:
 44                    ld8u	r5, [r4]
 c2 21                 ldi8	r6, 0x21
 89                    and	r6, r5
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwc
		R_AVM_FAR24	.text.getwc+0x2f
<L1>:
 cd 40                 cmpi.s8	r5, 0x40
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwc
		R_AVM_FAR24	.text.getwc+0x3d
<L2>:
 c6 80 ff              ldi16	r6, 0xff80
 96                    or	r5, r6
 c2 10                 ldi8	r6, 0x10
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwc
		R_AVM_FAR24	.text.getwc+0x5d
<L3>:
 e2 00 00 00           jmpf	getwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.getwc+0x53
 c2 08                 ldi8	r6, 0x8
 96                    or	r5, r6
 51                    st8	[r4], r5
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 09                    mov	r6, r5
 f6 46                 sext8	r6
 ce c0                 cmpi.s8	r6, -0x40
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwc
		R_AVM_FAR24	.text.getwc+0x66
<L4>:
 c2 10                 ldi8	r6, 0x10
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwc
		R_AVM_FAR24	.text.getwc+0x5d
<L5>:
 c2 04                 ldi8	r6, 0x4
 96                    or	r5, r6
 c6 ff ff              ldi16	r6, 0xffff
 e2 00 00 00           jmpf	getwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.getwc+0x63
 c2 ef                 ldi8	r6, 0xef
 86                    and	r5, r6
 ed c8 21              ld8u	r6, [r4+1]
 51                    st8	[r4], r5
 02                    mov	r4, r6
 ef                    ret
 c2 08                 ldi8	r6, 0x8
 96                    or	r5, r6
 51                    st8	[r4], r5
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	getwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.getwc+0x35

Disassembly of section .text.getwchar:

<getwchar>:
 c0 21                 ldi8	r4, 0x21
 f0 45 00 00           ldm8u	r5, [0x0]
		R_AVM_DATA16	__avm_stdin
 81                    and	r4, r5
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwchar
		R_AVM_FAR24	.text.getwchar+0x2a
<L0>:
 cd 40                 cmpi.s8	r5, 0x40
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwchar
		R_AVM_FAR24	.text.getwchar+0x3b
<L1>:
 c4 80 ff              ldi16	r4, 0xff80
 94                    or	r5, r4
 c0 10                 ldi8	r4, 0x10
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwchar
		R_AVM_FAR24	.text.getwchar+0x5c
<L2>:
 e2 00 00 00           jmpf	getwchar
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.getwchar+0x51
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c0 08                 ldi8	r4, 0x8
 94                    or	r5, r4
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	__avm_stdin
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 01                    mov	r4, r5
 f6 44                 sext8	r4
 cc c0                 cmpi.s8	r4, -0x40
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwchar
		R_AVM_FAR24	.text.getwchar+0x68
<L3>:
 c0 10                 ldi8	r4, 0x10
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getwchar
		R_AVM_FAR24	.text.getwchar+0x5c
<L4>:
 c0 04                 ldi8	r4, 0x4
 94                    or	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	__avm_stdin
 ef                    ret
 c0 ef                 ldi8	r4, 0xef
 84                    and	r5, r4
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	__avm_stdin+0x1
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	__avm_stdin
 ef                    ret
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	getwchar
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.getwchar+0x2c

Disassembly of section .text.putwc:

<putwc>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putwc
		R_AVM_FAR24	.text.putwc+0x27
<L0>:
 49                    ld8u	r6, [r5]
 c3 22                 ldi8	r7, 0x22
 8e                    and	r7, r6
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putwc
		R_AVM_FAR24	.text.putwc+0x23
<L1>:
 ce 40                 cmpi.s8	r6, 0x40
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putwc
		R_AVM_FAR24	.text.putwc+0x31
<L2>:
 c3 80                 ldi8	r7, 0x80
 9b                    or	r6, r7
 56                    st8	[r5], r6
 d7 00                 sys	debug_putc
 ef                    ret
 c0 08                 ldi8	r4, 0x8
 98                    or	r6, r4
 56                    st8	[r5], r6
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 0e                    mov	r7, r6
 f6 47                 sext8	r7
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putwc
		R_AVM_FAR24	.text.putwc+0x3f
<L3>:
 d7 00                 sys	debug_putc
 ef                    ret
 c0 08                 ldi8	r4, 0x8
 98                    or	r6, r4
 56                    st8	[r5], r6
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	putwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.putwc+0x29

Disassembly of section .text.putwchar:

<putwchar>:
 c2 22                 ldi8	r6, 0x22
 f0 45 00 00           ldm8u	r5, [0x0]
		R_AVM_DATA16	__avm_stdout
 89                    and	r6, r5
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putwchar
		R_AVM_FAR24	.text.putwchar+0x21
<L0>:
 cd 40                 cmpi.s8	r5, 0x40
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putwchar
		R_AVM_FAR24	.text.putwchar+0x32
<L1>:
 c2 80                 ldi8	r6, 0x80
 96                    or	r5, r6
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	__avm_stdout
 d7 00                 sys	debug_putc
 ef                    ret
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c0 08                 ldi8	r4, 0x8
 94                    or	r5, r4
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	__avm_stdout
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 09                    mov	r6, r5
 f6 46                 sext8	r6
 ce c0                 cmpi.s8	r6, -0x40
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putwchar
		R_AVM_FAR24	.text.putwchar+0x40
<L2>:
 d7 00                 sys	debug_putc
 ef                    ret
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	putwchar
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.putwchar+0x23

Disassembly of section .text.ungetwc:

<ungetwc>:
 b1                    push16	r1
 b0                    push16	r0
 f1 0c                 mov	r1, r4
 c4 ff ff              ldi16	r4, 0xffff
 f0 0d ff              cmpi.s8	r1, -0x1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetwc
		R_AVM_FAR24	.text.ungetwc+0x4d
<L0>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetwc
		R_AVM_FAR24	.text.ungetwc+0x47
<L1>:
 4d                    ld8u	r7, [r5]
 c2 21                 ldi8	r6, 0x21
 8b                    and	r6, r7
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetwc
		R_AVM_FAR24	.text.ungetwc+0x43
<L2>:
 cf 40                 cmpi.s8	r7, 0x40
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetwc
		R_AVM_FAR24	.text.ungetwc+0x50
<L3>:
 c6 80 ff              ldi16	r6, 0xff80
 9e                    or	r7, r6
 57                    st8	[r5], r7
 f0 00 10              ldi8	r0, 0x10
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetwc
		R_AVM_FAR24	.text.ungetwc+0x4d
<L4>:
 e2 00 00 00           jmpf	ungetwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ungetwc+0x69
 c2 08                 ldi8	r6, 0x8
 9e                    or	r7, r6
 57                    st8	[r5], r7
 c1 09                 ldi8	r5, 0x9
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 0b                    mov	r6, r7
 f6 46                 sext8	r6
 ce c0                 cmpi.s8	r6, -0x40
 d3 04                 brslt8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetwc
		R_AVM_FAR24	.text.ungetwc+0x7a
<L5>:
 f0 00 10              ldi8	r0, 0x10
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetwc
		R_AVM_FAR24	.text.ungetwc+0x4d
<L6>:
 c0 eb                 ldi8	r4, 0xeb
 8c                    and	r7, r4
 f9 e1                 or	r7, r0
 57                    st8	[r5], r7
 ee 2a 21              st8	[r5+1], r1
 f1 71                 zext8	r1
 f1 21                 mov	r4, r1
 e2 00 00 00           jmpf	ungetwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ungetwc+0x4d
 c2 08                 ldi8	r6, 0x8
 9e                    or	r7, r6
 57                    st8	[r5], r7
 c1 16                 ldi8	r5, 0x16
 e2 00 00 00           jmpf	ungetwc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ungetwc+0x49
