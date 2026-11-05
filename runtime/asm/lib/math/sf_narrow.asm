
math_sf_narrow.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_narrow.c
00000000 l    d  .text.fadd	00000000 .text.fadd
00000000 l     F .text.unlikely.avm_narrow_report	0000008f avm_narrow_report
00000000 l    d  .text.faddl	00000000 .text.faddl
00000000 l    d  .text.daddl	00000000 .text.daddl
00000000 l    d  .text.fsub	00000000 .text.fsub
00000000 l    d  .text.fsubl	00000000 .text.fsubl
00000000 l    d  .text.dsubl	00000000 .text.dsubl
00000000 l    d  .text.fmul	00000000 .text.fmul
00000000 l    d  .text.fmull	00000000 .text.fmull
00000000 l    d  .text.dmull	00000000 .text.dmull
00000000 l    d  .text.fdiv	00000000 .text.fdiv
00000000 l    d  .text.fdivl	00000000 .text.fdivl
00000000 l    d  .text.ddivl	00000000 .text.ddivl
00000000 l    d  .text.ffma	00000000 .text.ffma
00000000 l    d  .text.ffmal	00000000 .text.ffmal
00000000 l    d  .text.dfmal	00000000 .text.dfmal
00000000 l    d  .text.fsqrt	00000000 .text.fsqrt
00000000 l    d  .text.fsqrtl	00000000 .text.fsqrtl
00000000 l    d  .text.dsqrtl	00000000 .text.dsqrtl
00000000 l    d  .text.unlikely.avm_narrow_report	00000000 .text.unlikely.avm_narrow_report
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.fadd	00000033 fadd
00000000 g     F .text.faddl	00000033 faddl
00000000 g     F .text.daddl	00000033 daddl
00000000 g     F .text.fsub	00000033 fsub
00000000 g     F .text.fsubl	00000033 fsubl
00000000 g     F .text.dsubl	00000033 dsubl
00000000 g     F .text.fmul	00000033 fmul
00000000 g     F .text.fmull	00000033 fmull
00000000 g     F .text.dmull	00000033 dmull
00000000 g     F .text.fdiv	00000033 fdiv
00000000 g     F .text.fdivl	00000033 fdivl
00000000 g     F .text.ddivl	00000033 ddivl
00000000 g     F .text.ffma	00000019 ffma
00000000         *UND*	00000000 fmaf
00000000 g     F .text.ffmal	00000019 ffmal
00000000 g     F .text.dfmal	00000019 dfmal
00000000 g     F .text.fsqrt	00000004 fsqrt
00000000         *UND*	00000000 sqrtf
00000000 g     F .text.fsqrtl	00000004 fsqrtl
00000000 g     F .text.dsqrtl	00000004 dsqrtl
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.fadd:

<fadd>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 00                 fadd
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fadd
		R_AVM_FAR24	.text.fadd+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	fadd
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	fadd
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fadd+0x18

Disassembly of section .text.faddl:

<faddl>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 00                 fadd
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	faddl
		R_AVM_FAR24	.text.faddl+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	faddl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	faddl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.faddl+0x18

Disassembly of section .text.daddl:

<daddl>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 00                 fadd
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	daddl
		R_AVM_FAR24	.text.daddl+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	daddl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	daddl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.daddl+0x18

Disassembly of section .text.fsub:

<fsub>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 01                 fsub
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fsub
		R_AVM_FAR24	.text.fsub+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	fsub
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	fsub
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fsub+0x18

Disassembly of section .text.fsubl:

<fsubl>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 01                 fsub
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fsubl
		R_AVM_FAR24	.text.fsubl+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	fsubl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	fsubl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fsubl+0x18

Disassembly of section .text.dsubl:

<dsubl>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 01                 fsub
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	dsubl
		R_AVM_FAR24	.text.dsubl+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	dsubl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	dsubl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.dsubl+0x18

Disassembly of section .text.fmul:

<fmul>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 02                 fmul
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmul
		R_AVM_FAR24	.text.fmul+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	fmul
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	fmul
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmul+0x18

Disassembly of section .text.fmull:

<fmull>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 02                 fmul
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmull
		R_AVM_FAR24	.text.fmull+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	fmull
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	fmull
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmull+0x18

Disassembly of section .text.dmull:

<dmull>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 02                 fmul
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	dmull
		R_AVM_FAR24	.text.dmull+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	dmull
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	dmull
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.dmull+0x18

Disassembly of section .text.fdiv:

<fdiv>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 03                 fdiv
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fdiv
		R_AVM_FAR24	.text.fdiv+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	fdiv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	fdiv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fdiv+0x18

Disassembly of section .text.fdivl:

<fdivl>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 03                 fdiv
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fdivl
		R_AVM_FAR24	.text.fdivl+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	fdivl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	fdivl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fdivl+0x18

Disassembly of section .text.ddivl:

<ddivl>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 03                 fdiv
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 1d                 mov	r3, r5
 f9 68                 and	r3, r2
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ddivl
		R_AVM_FAR24	.text.ddivl+0x1d
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	ddivl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	ddivl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ddivl+0x18

Disassembly of section .text.ffma:

<ffma>:
 b1                    push16	r1
 b0                    push16	r0
 f0 30 07              ldsp16	r0, [sp+0x7]
 f0 31 09              ldsp16	r1, [sp+0x9]
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e3 00 00 00           callf	ffma
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fmaf
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.ffmal:

<ffmal>:
 b1                    push16	r1
 b0                    push16	r0
 f0 30 07              ldsp16	r0, [sp+0x7]
 f0 31 09              ldsp16	r1, [sp+0x9]
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e3 00 00 00           callf	ffmal
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fmaf
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.dfmal:

<dfmal>:
 b1                    push16	r1
 b0                    push16	r0
 f0 30 07              ldsp16	r0, [sp+0x7]
 f0 31 09              ldsp16	r1, [sp+0x9]
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e3 00 00 00           callf	dfmal
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fmaf
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.fsqrt:

<fsqrt>:
 e2 00 00 00           jmpf	fsqrt
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf

Disassembly of section .text.fsqrtl:

<fsqrtl>:
 e2 00 00 00           jmpf	fsqrtl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf

Disassembly of section .text.dsqrtl:

<dsqrtl>:
 e2 00 00 00           jmpf	dsqrtl
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf

Disassembly of section .text.unlikely.avm_narrow_report:

<avm_narrow_report>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 66                 mov32	q1, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 30 0f              ldsp16	r0, [sp+0xf]
 f0 31 11              ldsp16	r1, [sp+0x11]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_narrow_report
		R_AVM_FAR24	.text.unlikely.avm_narrow_report+0x59
<L0>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_narrow_report
		R_AVM_FAR24	.text.unlikely.avm_narrow_report+0x86
<L1>:
 c4 ff 7f              ldi16	r4, 0x7fff
 f4 0b                 ldsp16	r7, [sp+0x2]
 83                    and	r4, r7
 c5 7f 7f              ldi16	r5, 0x7f7f
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_narrow_report
		R_AVM_FAR24	.text.unlikely.avm_narrow_report+0x86
<L2>:
 c2 22                 ldi8	r6, 0x22
 e2 00 00 00           jmpf	avm_narrow_report
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_narrow_report+0x82
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_narrow_report
		R_AVM_FAR24	.text.unlikely.avm_narrow_report+0x86
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 88                    and	r6, r4
 8d                    and	r7, r5
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_narrow_report
		R_AVM_FAR24	.text.unlikely.avm_narrow_report+0x86
<L4>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 f2 69                 mov32	q2, q1
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
