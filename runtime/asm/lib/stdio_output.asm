
stdio_output.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_output.c
00000000 l    d  .text.fputc	00000000 .text.fputc
00000000 l    d  .text.putc	00000000 .text.putc
00000000 l    d  .text.fputs	00000000 .text.fputs
00000000 l    d  .text.fwrite	00000000 .text.fwrite
00000000 g     F .text.fputc	0000002b fputc
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.putc	0000002b putc
00000000 g     F .text.fputs	00000042 fputs
00000000 g     F .text.fwrite	0000009a fwrite
00000000         *UND*	00000000 __avm_umulhisi3

Disassembly of section .text.fputc:

<fputc>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputc
		R_AVM_FAR24	.text.fputc+0x21
<L0>:
 49                    ld8u	r6, [r5]
 c3 22                 ldi8	r7, 0x22
 8e                    and	r7, r6
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputc
		R_AVM_FAR24	.text.fputc+0x1d
<L1>:
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

Disassembly of section .text.putc:

<putc>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putc
		R_AVM_FAR24	.text.putc+0x21
<L0>:
 49                    ld8u	r6, [r5]
 c3 22                 ldi8	r7, 0x22
 8e                    and	r7, r6
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	putc
		R_AVM_FAR24	.text.putc+0x1d
<L1>:
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

Disassembly of section .text.fputs:

<fputs>:
 08                    mov	r6, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputs
		R_AVM_FAR24	.text.fputs+0x38
<L0>:
 41                    ld8u	r4, [r5]
 c3 22                 ldi8	r7, 0x22
 8c                    and	r7, r4
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputs
		R_AVM_FAR24	.text.fputs+0x34
<L1>:
 c3 40                 ldi8	r7, 0x40
 93                    or	r4, r7
 54                    st8	[r5], r4
 a5                    xor	r5, r5
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputs
		R_AVM_FAR24	.text.fputs+0x32
<L2>:
 d7 00                 sys	debug_putc
 ed 8c 21              ld8u	r4, [r6+1]
 f4 ae                 inc16	r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fputs
		R_AVM_FAR24	.text.fputs+0x23
<L3>:
 01                    mov	r4, r5
 ef                    ret
 c2 08                 ldi8	r6, 0x8
 92                    or	r4, r6
 54                    st8	[r5], r4
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
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
		R_AVM_FAR24	.text.fwrite+0x93
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x93
<L1>:
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x59
<L2>:
 f5 3d                 ld8u	r1, [r7]
 f0 02 22              ldi8	r2, 0x22
 f9 44                 and	r2, r1
 f0 0e 02              cmpi.s8	r2, 0x2
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x63
<L3>:
 f0 38 00              stsp16	[sp+0x0], r0
 c0 40                 ldi8	r4, 0x40
 f9 85                 or	r4, r1
 f1 07                 mov	r0, r7
 5c                    st8	[r7], r4
 f1 15                 mov	r2, r5
 01                    mov	r4, r5
 f1 1e                 mov	r3, r6
 06                    mov	r5, r6
 e3 00 00 00           callf	fwrite
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 01                    mov	r4, r5
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x73
<L4>:
 c1 05                 ldi8	r5, 0x5
 c2 48                 ldi8	r6, 0x48
 a0                    xor	r4, r4
 f1 2c                 mov	r7, r0
 e2 00 00 00           jmpf	fwrite
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwrite+0x67
 c1 09                 ldi8	r5, 0x9
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	fwrite
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwrite+0x93
 c1 09                 ldi8	r5, 0x9
 c2 08                 ldi8	r6, 0x8
 f9 39                 or	r1, r6
 f3 0d                 st8	[r7], r1
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	fwrite
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwrite+0x93
 f1 2b                 mov	r6, r3
 fe 32                 mul16	r6, r2
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x91
<L5>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 6c 81              ld8u	r4, [r0+]
 d7 00                 sys	debug_putc
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwrite
		R_AVM_FAR24	.text.fwrite+0x82
<L6>:
 f1 23                 mov	r4, r3
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
