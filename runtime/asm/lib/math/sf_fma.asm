
math_sf_fma.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_fma.c
00000000 l    d  .text.fmaf	00000000 .text.fmaf
00000000 g     F .text.fmaf	00000119 fmaf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.fmaf:

<fmaf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 31 19              ldsp16	r1, [sp+0x19]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 1e                 fma
 f1 15                 mov	r2, r5
 f0 07 80 7f           ldi16	r3, 0x7f80
 f9 4c                 and	r2, r3
 f5 13                 cmp	r2, r3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x2d
<L0>:
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x26
<L1>:
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f2 61                 mov32	q0, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0xb1
<L2>:
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 04              cmp32	q0, q1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0xb1
<L3>:
 f2 66                 mov32	q1, q2
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x10f
<L4>:
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 40              cmp32	q1, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x26
<L5>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 7f           ldi16	r3, 0x7f7f
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x26
<L6>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 ff 15                 fclass
 c7 04 02              ldi16	r7, 0x204
 8e                    and	r7, r6
 f6 2f                 tst16	r7
 f8 0e                 cset.ne	r6
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x26
<L7>:
 c3 01                 ldi8	r7, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x26
<L8>:
 c2 22                 ldi8	r6, 0x22
 e2 00 00 00           jmpf	fmaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaf+0x111
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	fmaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaf+0x26
