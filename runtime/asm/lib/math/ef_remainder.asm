
math_ef_remainder.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_remainder.c
00000000 l    d  .text.remainderf	00000000 .text.remainderf
00000000 g     F .text.remainderf	000000da remainderf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.remainderf:

<remainderf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 66                 mov32	q1, q2
 ff 09                 fabs	q1
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remainderf
		R_AVM_FAR24	.text.remainderf+0xbf
<L0>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0b                 fabs	q3
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 f2 63                 mov32	q0, q3
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remainderf
		R_AVM_FAR24	.text.remainderf+0xbf
<L1>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remainderf
		R_AVM_FAR24	.text.remainderf+0xcc
<L2>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remainderf
		R_AVM_FAR24	.text.remainderf+0xcc
<L3>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	remainderf
		R_AVM_FAR24	.text.remainderf+0xc5
<L4>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 1b                 fmod
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 f4 62                 stsp16	[sp+0x8], r6
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
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
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 f2 62                 mov32	q0, q2
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 f4 22                 ldsp16	r6, [sp+0x8]
 ce 02                 cmpi.s8	r6, 0x2
 fc 42                 cmov.uge	r0, r2
 fc 4b                 cmov.uge	r1, r3
 cf 01                 cmpi.s8	r7, 0x1
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f0 31 06              ldsp16	r1, [sp+0x6]
 f9 a4                 and	r5, r1
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 e2 00 00 00           jmpf	remainderf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remainderf+0xc5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 00                 fadd
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e2 00 00 00           jmpf	remainderf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.remainderf+0xc5
