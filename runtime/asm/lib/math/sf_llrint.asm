
math_sf_llrint.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_llrint.c
00000000 l    d  .text.llrintf	00000000 .text.llrintf
00000000 g     F .text.llrintf	00000134 llrintf
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_lshrsi3
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.llrintf:

<llrintf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 f2 64                 mov32	q1, q0
 ff 09                 fabs	q1
 f1 23                 mov	r4, r3
 c5 00 4b              ldi16	r5, 0x4b00
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llrintf
		R_AVM_FAR24	.text.llrintf+0x2f
<L0>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c4              cmp32	q3, q1
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 e2 00 00 00           jmpf	llrintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llrintf+0x48
 f0 04 00 80           ldi16	r0, 0x8000
 f9 04                 and	r0, r1
 aa                    xor	r6, r6
 c7 00 4b              ldi16	r7, 0x4b00
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 c7 00 cb              ldi16	r7, 0xcb00
 ff 00                 fadd
 f9 a1                 or	r5, r0
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 aa                    xor	r6, r6
 c7 00 5f              ldi16	r7, 0x5f00
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llrintf
		R_AVM_FAR24	.text.llrintf+0x114
<L1>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 4e              ldi16	r7, 0x4eff
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llrintf
		R_AVM_FAR24	.text.llrintf+0x7a
<L2>:
 f2 68                 mov32	q2, q0
 ff 12                 ftos32
 09                    mov	r6, r5
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 e2 00 00 00           jmpf	llrintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llrintf+0x10d
 c2 7f                 ldi8	r6, 0x7f
 89                    and	r6, r5
 c3 80                 ldi8	r7, 0x80
 9e                    or	r7, r6
 f1 14                 mov	r2, r4
 f1 1f                 mov	r3, r7
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 c0 b5                 ldi8	r4, 0xb5
 32                    cmp	r4, r6
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llrintf
		R_AVM_FAR24	.text.llrintf+0xed
<L3>:
 c4 6a ff              ldi16	r4, 0xff6a
 12                    add	r4, r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	llrintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 b6                 ldi8	r4, 0xb6
 f4 02                 ldsp16	r6, [sp+0x0]
 22                    sub	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	llrintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c0              cmp32	q3, q0
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llrintf
		R_AVM_FAR24	.text.llrintf+0x10b
<L4>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f7 7d                 sub32	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 78                 sub32	q2, q0
 e2 00 00 00           jmpf	llrintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llrintf+0x10d
 c4 4a ff              ldi16	r4, 0xff4a
 18                    add	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	llrintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c0              cmp32	q3, q0
 d3 04                 brslt8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llrintf
		R_AVM_FAR24	.text.llrintf+0xc6
<L5>:
 f2 6b                 mov32	q3, q1
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 42                 sub	r2, r2
 f0 07 00 df           ldi16	r3, 0xdf00
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	llrintf
		R_AVM_FAR24	.text.llrintf+0x10d
<L6>:
 f0 00 21              ldi8	r0, 0x21
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	llrintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.llrintf+0x10d
