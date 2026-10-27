
math_ef_remainder.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_remainder.c
00000000 l    d  .text.remainderf	00000000 .text.remainderf
00000000 g     F .text.remainderf	000000e8 remainderf
00000000         *UND*	00000000 fmodf

Disassembly of section .text.remainderf:

<remainderf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f2 66                 mov32	q1, q2
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 ff 09                 fabs	q1
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remainderf
		R_AVM_FAR24	.text.remainderf+0x74
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 0b                 fabs	q3
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 f2 63                 mov32	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remainderf
		R_AVM_FAR24	.text.remainderf+0x74
<L1>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remainderf
		R_AVM_FAR24	.text.remainderf+0x7a
<L2>:
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 c0              cmp32	q3, q0
 f2 63                 mov32	q0, q3
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remainderf
		R_AVM_FAR24	.text.remainderf+0x7a
<L3>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remainderf
		R_AVM_FAR24	.text.remainderf+0x81
<L4>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 e2 00 00 00           jmpf	remainderf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remainderf+0x7a
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ff 00                 fadd
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	remainderf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fmodf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 f4 52                 stsp16	[sp+0x4], r6
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 cc 02                 cmpi.s8	r4, 0x2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fc 54                 cmov.uge	r2, r4
 fc 5d                 cmov.uge	r3, r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 f4 42                 stsp16	[sp+0x0], r6
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f4 01                 ldsp16	r5, [sp+0x0]
 f6 2d                 tst16	r5
 f2 6a                 mov32	q3, q0
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f4 10                 ldsp16	r4, [sp+0x4]
 cc 02                 cmpi.s8	r4, 0x2
 fc 72                 cmov.uge	r6, r2
 fc 7b                 cmov.uge	r7, r3
 cd 01                 cmpi.s8	r5, 0x1
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 87                    and	r5, r7
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 e2 00 00 00           jmpf	remainderf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remainderf+0x7a
