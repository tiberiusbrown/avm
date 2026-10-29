
math_sf_fma.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_fma.c
00000000 l    d  .text.fmaf	00000000 .text.fmaf
00000000 g     F .text.fmaf	00000103 fmaf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.fmaf:

<fmaf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f2 67                 mov32	q1, q3
 f0 30 1f              ldsp16	r0, [sp+0x1f]
 f0 31 21              ldsp16	r1, [sp+0x21]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 ff 1d                 fma
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c4 80 7f              ldi16	r4, 0x7f80
 84                    and	r5, r4
 34                    cmp	r5, r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x30
<L0>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 69                 mov32	q2, q1
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x25
<L1>:
 f2 68                 mov32	q2, q0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0xac
<L2>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0xac
<L3>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 0a                 fabs	q2
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0xf9
<L4>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x25
<L5>:
 c5 ff 7f              ldi16	r5, 0x7fff
 8d                    and	r7, r5
 f0 04 7f 7f           ldi16	r0, 0x7f7f
 f5 07                 cmp	r0, r7
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x25
<L6>:
 f4 83                 lsl16.1	r3
 c4 00 ff              ldi16	r4, 0xff00
 f9 8e                 xor	r4, r3
 f9 34                 and	r1, r5
 f9 51                 or	r2, r4
 f6 2a                 tst16	r2
 f8 05                 cset.eq	r5
 f5 01                 cmp	r0, r1
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x25
<L7>:
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaf
		R_AVM_FAR24	.text.fmaf+0x25
<L8>:
 c2 22                 ldi8	r6, 0x22
 e2 00 00 00           jmpf	fmaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaf+0xfb
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	fmaf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaf+0x25
