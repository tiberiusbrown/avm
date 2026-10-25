
math_ef_sqrt.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000000 l    d  .text.sqrtf	00000000 .text.sqrtf
00000000 l     O .rodata.sqrt_table	00000800 sqrt_table
00000000 l    d  .rodata.sqrt_table	00000000 .rodata.sqrt_table
00000000 g     F .text.sqrtf	0000016b sqrtf

Disassembly of section .text.sqrtf:

<sqrtf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
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
		R_AVM_FAR24	.text.sqrtf+0x164
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
		R_AVM_FAR24	.text.sqrtf+0x164
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0x164
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x5f
<L3>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 2b                 fmul	q2, q3
 f0 04 e8 ff           ldi16	r0, 0xffe8
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0x61
 f2 30                 sub	r0, r0
 f0 01 7f              ldi8	r1, 0x7f
 f9 34                 and	r1, r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 c1 01                 ldi8	r5, 0x1
 86                    and	r5, r6
 fa 47                 lsl16i	r5, 0x7
 f9 a5                 or	r5, r1
 f2 28                 add	r6, r0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 09                    mov	r6, r5
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 04 f0 07           ldi16	r0, 0x7f0
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f7 66                 add32	q1, q2
 a0                    xor	r4, r4
 c5 fe 7f              ldi16	r5, 0x7ffe
 f9 ac                 and	r5, r3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 16                 fsub	q1, q2
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	.rodata.sqrt_table+0x8
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	.rodata.sqrt_table+0x8
 f7 68                 add32	q2, q0
 f0 64 88              ldp32	q2, [q2]
 ff 29                 fmul	q2, q1
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata.sqrt_table+0x4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata.sqrt_table+0x4
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 0e                 fadd	q3, q2
 ff 27                 fmul	q1, q3
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	.rodata.sqrt_table
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	.rodata.sqrt_table
 f7 68                 add32	q2, q0
 f0 64 c8              ldp32	q3, [q2]
 ff 0d                 fadd	q3, q1
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0xda
<L4>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 3f           ldi16	r1, 0x3fff
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0x157
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 67                 mov32	q1, q3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 61                 mov32	q0, q1
 ff 12                 fsub	q0, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0f                 fadd	q3, q3
 ff 2c                 fmul	q3, q0
 ff 2a                 fmul	q2, q2
 ff 25                 fmul	q1, q1
 ff 19                 fsub	q2, q1
 ff 0b                 fadd	q2, q3
 ff 20                 fmul	q0, q0
 ff 02                 fadd	q0, q2
 aa                    xor	r6, r6
 c7 00 34              ldi16	r7, 0x3400
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 2b                 fmul	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 1d                 fsub	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 ff 1e                 fsub	q3, q2
 ff 1c                 fsub	q3, q0
 f2 42                 sub	r2, r2
 f0 07 80 27           ldi16	r3, 0x2780
 ff c8 6d              fcmp	r6, q3, q1
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x136
<L5>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0x155
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0b                 fadd	q2, q3
 ff 18                 fsub	q2, q0
 ff c8 49              fcmp	r4, q2, q1
 cc ff                 cmpi.s8	r4, -0x1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x157
<L6>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 08                    mov	r6, r4
 fa 56                 lsl16i	r6, 0x6
 c4 80 ff              ldi16	r4, 0xff80
 82                    and	r4, r6
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 68                 add32	q2, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
