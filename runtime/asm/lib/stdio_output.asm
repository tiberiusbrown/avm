
stdio_output.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_output.c
00000000 l    d  .text.fputc	00000000 .text.fputc
00000000 l    d  .text.putc	00000000 .text.putc
00000000 l    d  .text.fputs	00000000 .text.fputs
00000000 l    d  .text.fwrite	00000000 .text.fwrite
00000000 g     F .text.fputc	00000048 fputc
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.putc	00000048 putc
00000000 g     F .text.fputs	00000061 fputs
00000000 g     F .text.fwrite	000000b9 fwrite
00000000         *UND*	00000000 __avm_umulhisi3

Disassembly of section .text.fputc:

<fputc>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputc
		R_AVM_FAR24	.text.fputc+0x34
<L0>:
 49                    ld8u	r6, [r5]
 c3 22                 ldi8	r7, 0x22
 8e                    and	r7, r6
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputc
		R_AVM_FAR24	.text.fputc+0x30
<L1>:
 c3 c0                 ldi8	r7, 0xc0
 8e                    and	r7, r6
 cf 40                 cmpi.s8	r7, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputc
		R_AVM_FAR24	.text.fputc+0x2b
<L2>:
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputc
		R_AVM_FAR24	.text.fputc+0x3e
<L3>:
 c3 40                 ldi8	r7, 0x40
 9b                    or	r6, r7
 56                    st8	[r5], r6
 f1 74                 zext8	r4
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
 c0 08                 ldi8	r4, 0x8
 98                    or	r6, r4
 56                    st8	[r5], r6
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	fputc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fputc+0x36

Disassembly of section .text.putc:

<putc>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putc
		R_AVM_FAR24	.text.putc+0x34
<L0>:
 49                    ld8u	r6, [r5]
 c3 22                 ldi8	r7, 0x22
 8e                    and	r7, r6
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putc
		R_AVM_FAR24	.text.putc+0x30
<L1>:
 c3 c0                 ldi8	r7, 0xc0
 8e                    and	r7, r6
 cf 40                 cmpi.s8	r7, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putc
		R_AVM_FAR24	.text.putc+0x2b
<L2>:
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putc
		R_AVM_FAR24	.text.putc+0x3e
<L3>:
 c3 40                 ldi8	r7, 0x40
 9b                    or	r6, r7
 56                    st8	[r5], r6
 f1 74                 zext8	r4
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
 c0 08                 ldi8	r4, 0x8
 98                    or	r6, r4
 56                    st8	[r5], r6
 c0 16                 ldi8	r4, 0x16
 e2 00 00 00           jmpf	putc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.putc+0x36

Disassembly of section .text.fputs:

<fputs>:
 08                    mov	r6, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputs
		R_AVM_FAR24	.text.fputs+0x47
<L0>:
 41                    ld8u	r4, [r5]
 c3 22                 ldi8	r7, 0x22
 8c                    and	r7, r4
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputs
		R_AVM_FAR24	.text.fputs+0x4d
<L1>:
 c3 c0                 ldi8	r7, 0xc0
 8c                    and	r7, r4
 cf 40                 cmpi.s8	r7, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputs
		R_AVM_FAR24	.text.fputs+0x2c
<L2>:
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputs
		R_AVM_FAR24	.text.fputs+0x53
<L3>:
 c3 40                 ldi8	r7, 0x40
 93                    or	r4, r7
 54                    st8	[r5], r4
 a5                    xor	r5, r5
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputs
		R_AVM_FAR24	.text.fputs+0x45
<L4>:
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputs
		R_AVM_FAR24	.text.fputs+0x36
<L5>:
 01                    mov	r4, r5
 ef                    ret
 c2 09                 ldi8	r6, 0x9
 e2 00 00 00           jmpf	fputs
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fputs+0x59
 c2 09                 ldi8	r6, 0x9
 e2 00 00 00           jmpf	fputs
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fputs+0x55
 c2 16                 ldi8	r6, 0x16
 c3 08                 ldi8	r7, 0x8
 93                    or	r4, r7
 54                    st8	[r5], r4
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.fwrite:

<fwrite>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 04                 mov	r0, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0xb2
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0xb2
<L1>:
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x56
<L2>:
 f5 3d                 ld8u	r1, [r7]
 f0 02 22              ldi8	r2, 0x22
 f9 44                 and	r2, r1
 f0 0e 02              cmpi.s8	r2, 0x2
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x5c
<L3>:
 f0 02 c0              ldi8	r2, 0xc0
 f9 44                 and	r2, r1
 f0 0e 40              cmpi.s8	r2, 0x40
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x62
<L4>:
 f4 a2                 tst8	r2
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0xa7
<L5>:
 f0 38 00              stsp16	[sp+0x0], r0
 c0 40                 ldi8	r4, 0x40
 f9 31                 or	r1, r4
 f1 1f                 mov	r3, r7
 f3 0d                 st8	[r7], r1
 e2 00 00 00           jmpf	fwrite
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwrite+0x67
 c1 09                 ldi8	r5, 0x9
 e2 00 00 00           jmpf	fwrite
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwrite+0xae
 c1 09                 ldi8	r5, 0x9
 e2 00 00 00           jmpf	fwrite
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwrite+0xa9
 f0 38 00              stsp16	[sp+0x0], r0
 f1 1f                 mov	r3, r7
 f1 15                 mov	r2, r5
 01                    mov	r4, r5
 f1 06                 mov	r0, r6
 06                    mov	r5, r6
 e3 00 00 00           callf	fwrite
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 01                    mov	r4, r5
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x83
<L6>:
 c1 05                 ldi8	r5, 0x5
 a0                    xor	r4, r4
 f1 2f                 mov	r7, r3
 e2 00 00 00           jmpf	fwrite
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwrite+0xa9
 f1 24                 mov	r5, r0
 09                    mov	r6, r5
 fe 32                 mul16	r6, r2
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0xa2
<L7>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 6c 81              ld8u	r4, [r0+]
 d7 00                 sys	debug_putc
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x93
<L8>:
 01                    mov	r4, r5
 e2 00 00 00           jmpf	fwrite
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwrite+0xb2
 c1 16                 ldi8	r5, 0x16
 c2 08                 ldi8	r6, 0x8
 f9 c5                 or	r6, r1
 5e                    st8	[r7], r6
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
