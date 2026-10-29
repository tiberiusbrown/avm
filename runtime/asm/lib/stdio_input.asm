
stdio_input.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_input.c
00000000 l    d  .text.fgetc	00000000 .text.fgetc
00000000 l    d  .text.getc	00000000 .text.getc
00000000 l    d  .text.ungetc	00000000 .text.ungetc
00000000 l    d  .text.fgets	00000000 .text.fgets
00000000 l    d  .text.fread	00000000 .text.fread
00000000 g     F .text.fgetc	00000040 fgetc
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.getc	00000040 getc
00000000 g     F .text.ungetc	00000058 ungetc
00000000 g     F .text.fgets	00000096 fgets
00000000 g     F .text.fread	000000d7 fread
00000000         *UND*	00000000 __avm_umulhisi3

Disassembly of section .text.fgetc:

<fgetc>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetc
		R_AVM_FAR24	.text.fgetc+0x2b
<L0>:
 44                    ld8u	r5, [r4]
 c2 21                 ldi8	r6, 0x21
 89                    and	r6, r5
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetc
		R_AVM_FAR24	.text.fgetc+0x27
<L1>:
 c2 10                 ldi8	r6, 0x10
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetc
		R_AVM_FAR24	.text.fgetc+0x35
<L2>:
 c2 44                 ldi8	r6, 0x44
 96                    or	r5, r6
 51                    st8	[r4], r5
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 c2 08                 ldi8	r6, 0x8
 96                    or	r5, r6
 51                    st8	[r4], r5
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 c2 8f                 ldi8	r6, 0x8f
 86                    and	r5, r6
 c2 40                 ldi8	r6, 0x40
 99                    or	r6, r5
 52                    st8	[r4], r6
 ed 88 21              ld8u	r4, [r4+1]
 ef                    ret

Disassembly of section .text.getc:

<getc>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getc
		R_AVM_FAR24	.text.getc+0x2b
<L0>:
 44                    ld8u	r5, [r4]
 c2 21                 ldi8	r6, 0x21
 89                    and	r6, r5
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getc
		R_AVM_FAR24	.text.getc+0x27
<L1>:
 c2 10                 ldi8	r6, 0x10
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	getc
		R_AVM_FAR24	.text.getc+0x35
<L2>:
 c2 44                 ldi8	r6, 0x44
 96                    or	r5, r6
 51                    st8	[r4], r5
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 c2 08                 ldi8	r6, 0x8
 96                    or	r5, r6
 51                    st8	[r4], r5
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 c2 8f                 ldi8	r6, 0x8f
 86                    and	r5, r6
 c2 40                 ldi8	r6, 0x40
 99                    or	r6, r5
 52                    st8	[r4], r6
 ed 88 21              ld8u	r4, [r4+1]
 ef                    ret

Disassembly of section .text.ungetc:

<ungetc>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetc
		R_AVM_FAR24	.text.ungetc+0x4b
<L0>:
 4d                    ld8u	r7, [r5]
 c2 21                 ldi8	r6, 0x21
 8b                    and	r6, r7
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetc
		R_AVM_FAR24	.text.ungetc+0x47
<L1>:
 f0 00 40              ldi8	r0, 0x40
 f9 1d                 or	r0, r7
 f3 04                 st8	[r5], r0
 c6 ff ff              ldi16	r6, 0xffff
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetc
		R_AVM_FAR24	.text.ungetc+0x54
<L2>:
 f0 01 10              ldi8	r1, 0x10
 f9 e4                 and	r7, r1
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ungetc
		R_AVM_FAR24	.text.ungetc+0x54
<L3>:
 c2 cb                 ldi8	r6, 0xcb
 f9 18                 and	r0, r6
 f9 05                 or	r0, r1
 f3 04                 st8	[r5], r0
 ee 8a 21              st8	[r5+1], r4
 f1 74                 zext8	r4
 08                    mov	r6, r4
 e2 00 00 00           jmpf	ungetc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ungetc+0x54
 c0 08                 ldi8	r4, 0x8
 9c                    or	r7, r4
 57                    st8	[r5], r7
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c6 ff ff              ldi16	r6, 0xffff
 02                    mov	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.fgets:

<fgets>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x59
<L0>:
 f5 3a                 ld8u	r2, [r6]
 c3 21                 ldi8	r7, 0x21
 f9 e8                 and	r7, r2
 cf 01                 cmpi.s8	r7, 0x1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x53
<L1>:
 f0 01 40              ldi8	r1, 0x40
 f9 29                 or	r1, r2
 f3 09                 st8	[r6], r1
 cd 01                 cmpi.s8	r5, 0x1
 d9 04                 brsge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x5f
<L2>:
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x87
<L3>:
 c3 10                 ldi8	r7, 0x10
 f9 5c                 and	r2, r7
 f2 30                 sub	r0, r0
 f4 a2                 tst8	r2
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x67
<L4>:
 f1 24                 mov	r5, r0
 c3 44                 ldi8	r7, 0x44
 f9 e5                 or	r7, r1
 5b                    st8	[r6], r7
 f4 a2                 tst8	r2
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x61
<L5>:
 e2 00 00 00           jmpf	fgets
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgets+0x87
 c0 08                 ldi8	r4, 0x8
 f9 51                 or	r2, r4
 f3 0a                 st8	[r6], r2
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 f2 30                 sub	r0, r0
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
 c3 cf                 ldi8	r7, 0xcf
 f9 3c                 and	r1, r7
 f3 09                 st8	[r6], r1
 ed ec 21              ld8u	r7, [r6+1]
 53                    st8	[r4], r7
 cf 0a                 cmpi.s8	r7, 0xa
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x7f
<L6>:
 c1 01                 ldi8	r5, 0x1
 e2 00 00 00           jmpf	fgets
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgets+0x87
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgets
		R_AVM_FAR24	.text.fgets+0x90
<L7>:
 14                    add	r5, r4
 aa                    xor	r6, r6
 56                    st8	[r5], r6
 f1 04                 mov	r0, r4
 e2 00 00 00           jmpf	fgets
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgets+0x61
 c1 01                 ldi8	r5, 0x1
 e2 00 00 00           jmpf	fgets
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgets+0x42

Disassembly of section .text.fread:

<fread>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 04                 mov	r0, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0xc6
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0xc6
<L1>:
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0xc0
<L2>:
 f5 3f                 ld8u	r3, [r7]
 f0 01 21              ldi8	r1, 0x21
 f1 13                 mov	r2, r3
 f9 44                 and	r2, r1
 f0 0e 01              cmpi.s8	r2, 0x1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x63
<L3>:
 f0 02 40              ldi8	r2, 0x40
 f1 23                 mov	r4, r3
 f9 89                 or	r4, r2
 f4 53                 stsp16	[sp+0x4], r7
 5c                    st8	[r7], r4
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 f4 42                 stsp16	[sp+0x0], r6
 06                    mov	r5, r6
 e3 00 00 00           callf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 01                    mov	r4, r5
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x6d
<L4>:
 c0 48                 ldi8	r4, 0x48
 f9 71                 or	r3, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f3 03                 st8	[r4], r3
 c0 05                 ldi8	r4, 0x5
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fread+0xc6
 c1 08                 ldi8	r5, 0x8
 f9 75                 or	r3, r5
 f3 0f                 st8	[r7], r3
 e2 00 00 00           jmpf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fread+0xc0
 a0                    xor	r4, r4
 f0 32 04              ldsp16	r2, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 ed e4 20              ld8u	r7, [r2+0]
 f1 1f                 mov	r3, r7
 f9 64                 and	r3, r1
 f0 0f 01              cmpi.s8	r3, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0xba
<L5>:
 c1 10                 ldi8	r5, 0x10
 87                    and	r5, r7
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0xcd
<L6>:
 c1 8f                 ldi8	r5, 0x8f
 8d                    and	r7, r5
 c1 40                 ldi8	r5, 0x40
 9d                    or	r7, r5
 ee e4 20              st8	[r2+0], r7
 ed a4 21              ld8u	r5, [r2+1]
 f0 6d a1              st8	[r0+], r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x73
<L7>:
 f4 ac                 inc16	r4
 f4 01                 ldsp16	r5, [sp+0x0]
 31                    cmp	r4, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fread
		R_AVM_FAR24	.text.fread+0x73
<L8>:
 f4 00                 ldsp16	r4, [sp+0x0]
 e2 00 00 00           jmpf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fread+0xc6
 c2 08                 ldi8	r6, 0x8
 9e                    or	r7, r6
 ee e4 20              st8	[r2+0], r7
 c1 09                 ldi8	r5, 0x9
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c1 44                 ldi8	r5, 0x44
 9d                    or	r7, r5
 ee e4 20              st8	[r2+0], r7
 e2 00 00 00           jmpf	fread
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fread+0xc6
