
stdio_input.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_input.c
00000000 l    d  .text.fgetc	00000000 .text.fgetc
00000000 l    d  .text.getc	00000000 .text.getc
00000000 l    d  .text.ungetc	00000000 .text.ungetc
00000000 l    d  .text.fgets	00000000 .text.fgets
00000000 l    d  .text.fread	00000000 .text.fread
00000000 g     F .text.fgetc	00000060 fgetc
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.getc	00000060 getc
00000000 g     F .text.ungetc	0000007d ungetc
00000000 g     F .text.fgets	000000a6 fgets
00000000 g     F .text.fread	000000e6 fread
00000000         *UND*	00000000 __avm_umulhisi3

Disassembly of section .text.fgetc:

<fgetc>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetc
		R_AVM_FAR24	.text.fgetc+0x43
<L0>:
 44                    ld8u	r5, [r4]
 c2 21                 ldi8	r6, 0x21
 89                    and	r6, r5
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetc
		R_AVM_FAR24	.text.fgetc+0x3f
<L1>:
 c2 c0                 ldi8	r6, 0xc0
 89                    and	r6, r5
 ce 40                 cmpi.s8	r6, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetc
		R_AVM_FAR24	.text.fgetc+0x2a
<L2>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetc
		R_AVM_FAR24	.text.fgetc+0x56
<L3>:
 c2 40                 ldi8	r6, 0x40
 96                    or	r5, r6
 c2 10                 ldi8	r6, 0x10
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetc
		R_AVM_FAR24	.text.fgetc+0x4d
<L4>:
 c2 04                 ldi8	r6, 0x4
 96                    or	r5, r6
 c6 ff ff              ldi16	r6, 0xffff
 e2 00 00 00           jmpf	fgetc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgetc+0x53
 c2 08                 ldi8	r6, 0x8
 96                    or	r5, r6
 51                    st8	[r4], r5
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
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
 e2 00 00 00           jmpf	fgetc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgetc+0x45

Disassembly of section .text.getc:

<getc>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getc
		R_AVM_FAR24	.text.getc+0x43
<L0>:
 44                    ld8u	r5, [r4]
 c2 21                 ldi8	r6, 0x21
 89                    and	r6, r5
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getc
		R_AVM_FAR24	.text.getc+0x3f
<L1>:
 c2 c0                 ldi8	r6, 0xc0
 89                    and	r6, r5
 ce 40                 cmpi.s8	r6, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getc
		R_AVM_FAR24	.text.getc+0x2a
<L2>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getc
		R_AVM_FAR24	.text.getc+0x56
<L3>:
 c2 40                 ldi8	r6, 0x40
 96                    or	r5, r6
 c2 10                 ldi8	r6, 0x10
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getc
		R_AVM_FAR24	.text.getc+0x4d
<L4>:
 c2 04                 ldi8	r6, 0x4
 96                    or	r5, r6
 c6 ff ff              ldi16	r6, 0xffff
 e2 00 00 00           jmpf	getc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.getc+0x53
 c2 08                 ldi8	r6, 0x8
 96                    or	r5, r6
 51                    st8	[r4], r5
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
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
 e2 00 00 00           jmpf	getc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.getc+0x45

Disassembly of section .text.ungetc:

<ungetc>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetc
		R_AVM_FAR24	.text.ungetc+0x64
<L0>:
 f5 35                 ld8u	r1, [r5]
 c2 21                 ldi8	r6, 0x21
 f9 c4                 and	r6, r1
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetc
		R_AVM_FAR24	.text.ungetc+0x5e
<L1>:
 c2 c0                 ldi8	r6, 0xc0
 f9 c4                 and	r6, r1
 ce 40                 cmpi.s8	r6, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetc
		R_AVM_FAR24	.text.ungetc+0x32
<L2>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetc
		R_AVM_FAR24	.text.ungetc+0x71
<L3>:
 c2 40                 ldi8	r6, 0x40
 f9 39                 or	r1, r6
 f3 05                 st8	[r5], r1
 c6 ff ff              ldi16	r6, 0xffff
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetc
		R_AVM_FAR24	.text.ungetc+0x6d
<L4>:
 f0 00 10              ldi8	r0, 0x10
 f1 2d                 mov	r7, r1
 f9 e0                 and	r7, r0
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetc
		R_AVM_FAR24	.text.ungetc+0x6d
<L5>:
 c2 eb                 ldi8	r6, 0xeb
 f9 38                 and	r1, r6
 f9 21                 or	r1, r0
 f3 05                 st8	[r5], r1
 ee 8a 21              st8	[r5+1], r4
 f1 74                 zext8	r4
 08                    mov	r6, r4
 e2 00 00 00           jmpf	ungetc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ungetc+0x6d
 c0 08                 ldi8	r4, 0x8
 f9 31                 or	r1, r4
 f3 05                 st8	[r5], r1
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c6 ff ff              ldi16	r6, 0xffff
 02                    mov	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 c0 08                 ldi8	r4, 0x8
 f9 31                 or	r1, r4
 f3 05                 st8	[r5], r1
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	ungetc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ungetc+0x66

Disassembly of section .text.fgets:

<fgets>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x64
<L0>:
 f5 39                 ld8u	r1, [r6]
 c3 21                 ldi8	r7, 0x21
 f9 e4                 and	r7, r1
 cf 01                 cmpi.s8	r7, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x5e
<L1>:
 c3 c0                 ldi8	r7, 0xc0
 f9 e4                 and	r7, r1
 cf 40                 cmpi.s8	r7, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x32
<L2>:
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x6e
<L3>:
 c3 40                 ldi8	r7, 0x40
 f9 3d                 or	r1, r7
 f3 09                 st8	[r6], r1
 f2 30                 sub	r0, r0
 cd 01                 cmpi.s8	r5, 0x1
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x58
<L4>:
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x9f
<L5>:
 c3 10                 ldi8	r7, 0x10
 f9 e4                 and	r7, r1
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x7a
<L6>:
 c0 04                 ldi8	r4, 0x4
 f9 31                 or	r1, r4
 f3 09                 st8	[r6], r1
 f1 20                 mov	r4, r0
 e2 00 00 00           jmpf	fgets
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgets+0x6b
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
 c0 08                 ldi8	r4, 0x8
 f9 31                 or	r1, r4
 f3 09                 st8	[r6], r1
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	fgets
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgets+0x66
 c3 ef                 ldi8	r7, 0xef
 f9 3c                 and	r1, r7
 f3 09                 st8	[r6], r1
 ed ec 21              ld8u	r7, [r6+1]
 53                    st8	[r4], r7
 f0 00 01              ldi8	r0, 0x1
 cf 0a                 cmpi.s8	r7, 0xa
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x9d
<L7>:
 cd 01                 cmpi.s8	r5, 0x1
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x9f
<L8>:
 c1 04                 ldi8	r5, 0x4
 f9 35                 or	r1, r5
 f3 09                 st8	[r6], r1
 f1 24                 mov	r5, r0
 14                    add	r5, r4
 aa                    xor	r6, r6
 56                    st8	[r5], r6
 e2 00 00 00           jmpf	fgets
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgets+0x6b

Disassembly of section .text.fread:

<fread>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f1 04                 mov	r0, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x5f
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x5f
<L1>:
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x59
<L2>:
 f5 3d                 ld8u	r1, [r7]
 f0 02 21              ldi8	r2, 0x21
 f9 44                 and	r2, r1
 f0 0e 01              cmpi.s8	r2, 0x1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x53
<L3>:
 f0 02 c0              ldi8	r2, 0xc0
 f9 44                 and	r2, r1
 f0 0e 40              cmpi.s8	r2, 0x40
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x66
<L4>:
 f4 a2                 tst8	r2
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0xd0
<L5>:
 c0 40                 ldi8	r4, 0x40
 f9 31                 or	r1, r4
 f1 1f                 mov	r3, r7
 f3 0d                 st8	[r7], r1
 e2 00 00 00           jmpf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fread+0x68
 c1 08                 ldi8	r5, 0x8
 f9 35                 or	r1, r5
 f3 0d                 st8	[r7], r1
 c1 09                 ldi8	r5, 0x9
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f1 1f                 mov	r3, r7
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 f1 16                 mov	r2, r6
 06                    mov	r5, r6
 e3 00 00 00           callf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 01                    mov	r4, r5
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x8d
<L6>:
 c0 08                 ldi8	r4, 0x8
 f9 31                 or	r1, r4
 ee 26 20              st8	[r3+0], r1
 c0 05                 ldi8	r4, 0x5
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fread+0x5f
 a0                    xor	r4, r4
 f0 01 10              ldi8	r1, 0x10
 f1 27                 mov	r5, r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 32 02              ldsp16	r2, [sp+0x2]
 f1 2e                 mov	r7, r2
 f5 37                 ld8u	r3, [r5]
 f1 2b                 mov	r6, r3
 f9 c4                 and	r6, r1
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0xdc
<L7>:
 c2 ef                 ldi8	r6, 0xef
 f9 78                 and	r3, r6
 f3 07                 st8	[r5], r3
 ed ca 21              ld8u	r6, [r5+1]
 f0 6d c1              st8	[r0+], r6
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x9b
<L8>:
 f4 ac                 inc16	r4
 f4 02                 ldsp16	r6, [sp+0x0]
 32                    cmp	r4, r6
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x99
<L9>:
 f4 00                 ldsp16	r4, [sp+0x0]
 e2 00 00 00           jmpf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fread+0x5f
 c1 08                 ldi8	r5, 0x8
 f9 35                 or	r1, r5
 f3 0d                 st8	[r7], r1
 c1 16                 ldi8	r5, 0x16
 e2 00 00 00           jmpf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fread+0x5b
 c2 04                 ldi8	r6, 0x4
 f9 79                 or	r3, r6
 f3 07                 st8	[r5], r3
 e2 00 00 00           jmpf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fread+0x5f
