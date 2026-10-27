
math_ef_sqrt.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000000 l    d  .text.sqrtf	00000000 .text.sqrtf
00000000 l     O .rodata.sqrt_table	00002000 sqrt_table
00000000 l    d  .rodata.sqrt_table	00000000 .rodata.sqrt_table
00000000 g     F .text.sqrtf	000000e5 sqrtf

Disassembly of section .text.sqrtf:

<sqrtf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
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
		R_AVM_FAR24	.text.sqrtf+0xde
<L0>:
 f0 69 80              cmp32	q2, q0
 d9 04                 brsge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x3b
<L1>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x43
<L2>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0xde
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0xde
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	sqrtf
		R_AVM_FAR24	.text.sqrtf+0x60
<L3>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 02                 fmul
 c6 e8 ff              ldi16	r6, 0xffe8
 e2 00 00 00           jmpf	sqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.sqrtf+0x61
 aa                    xor	r6, r6
 f4 4a                 stsp16	[sp+0x2], r6
 f0 00 7f              ldi8	r0, 0x7f
 f9 14                 and	r0, r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c1 01                 ldi8	r5, 0x1
 86                    and	r5, r6
 fa 47                 lsl16i	r5, 0x7
 f9 a1                 or	r5, r0
 c2 08                 ldi8	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 fa 7b                 lsr16i	r4, 0xb
 f1 2b                 mov	r6, r3
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 04 f8 1f           ldi16	r0, 0x1ff8
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata.sqrt_table
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata.sqrt_table
 f7 6c                 add32	q3, q0
 f0 14 08              leasp	r4, 0x8
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 10                 sys	memcpy_p
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 61                 add32	q0, q1
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 12                    add	r4, r6
 f4 50                 stsp16	[sp+0x4], r4
 c6 00 c0              ldi16	r6, 0xc000
 c7 ff 7f              ldi16	r7, 0x7fff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 36                 lsl16i	r4, 0x6
 f0 04 80 ff           ldi16	r0, 0xff80
 f9 10                 and	r0, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f1 24                 mov	r5, r0
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
