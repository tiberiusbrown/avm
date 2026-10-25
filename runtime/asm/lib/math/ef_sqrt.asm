
math_ef_sqrt.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000000 l    d  .text.sqrtf	00000000 .text.sqrtf
00000000 l     O .rodata.sqrt_table	00000600 sqrt_table
00000000 l    d  .rodata.sqrt_table	00000000 .rodata.sqrt_table
00000000 g     F .text.sqrtf	00000179 sqrtf

Disassembly of section .text.sqrtf:

<sqrtf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x172
<L0>:
 f0 69 80              cmp32	q2, q0
 d9 04                 brsge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x39
<L1>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x41
<L2>:
 ff 0a                 fadd	q2, q2
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0x172
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0x172
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x5e
<L3>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 2b                 fmul	q2, q3
 c6 e8 ff              ldi16	r6, 0xffe8
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0x5f
 aa                    xor	r6, r6
 f4 52                 stsp16	[sp+0x4], r6
 f0 00 7f              ldi8	r0, 0x7f
 f9 14                 and	r0, r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 01                 ldi8	r5, 0x1
 86                    and	r5, r6
 fa 47                 lsl16i	r5, 0x7
 f9 a1                 or	r5, r0
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 c0 0c                 ldi8	r4, 0xc
 04                    mov	r5, r4
 f1 2b                 mov	r6, r3
 f4 8e                 lsr16.1	r6
 fe 34                 mul16	r6, r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.rodata.sqrt_table
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.rodata.sqrt_table
 f7 63                 add32	q0, q3
 f0 14 0c              leasp	r4, 0xc
 f2 6a                 mov32	q3, q0
 d7 10                 sys	memcpy_p
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 61                 add32	q0, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 a0                    xor	r4, r4
 c5 fe 7f              ldi16	r5, 0x7ffe
 f9 a4                 and	r5, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 6a                 mov32	q3, q0
 ff 1e                 fsub	q3, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 2b                 fmul	q2, q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 02                 fadd	q0, q2
 ff 2c                 fmul	q3, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 03                 fadd	q0, q3
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0xe8
<L4>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 3f           ldi16	r1, 0x3fff
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0x165
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 64                 mov32	q1, q0
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 13                 fsub	q0, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 0a                 fadd	q2, q2
 ff 28                 fmul	q2, q0
 ff 2f                 fmul	q3, q3
 ff 25                 fmul	q1, q1
 ff 1d                 fsub	q3, q1
 ff 0e                 fadd	q3, q2
 ff 20                 fmul	q0, q0
 ff 03                 fadd	q0, q3
 a0                    xor	r4, r4
 c5 00 34              ldi16	r5, 0x3400
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 19                 fsub	q2, q1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 ff 1b                 fsub	q2, q3
 ff 18                 fsub	q2, q0
 f2 42                 sub	r2, r2
 f0 07 80 27           ldi16	r3, 0x2780
 ff c8 49              fcmp	r4, q2, q1
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x144
<L5>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0x163
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0e                 fadd	q3, q2
 ff 1c                 fsub	q3, q0
 ff c8 4d              fcmp	r4, q3, q1
 cc ff                 cmpi.s8	r4, -0x1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x165
<L6>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 08                    mov	r6, r4
 fa 56                 lsl16i	r6, 0x6
 c4 80 ff              ldi16	r4, 0xff80
 82                    and	r4, r6
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 68                 add32	q2, q0
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
