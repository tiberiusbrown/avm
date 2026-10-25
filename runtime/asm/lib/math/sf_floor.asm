
math_sf_floor.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_floor.c
00000000 l    d  .text.floorf	00000000 .text.floorf
00000000 g     F .text.floorf	000000e0 floorf
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_lshrsi3
00000000         *UND*	00000000 __avm_ashrsi3

Disassembly of section .text.floorf:

<floorf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 4a           ldi16	r1, 0x4aff
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0x47
<L0>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 3f           ldi16	r1, 0x3f7f
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0x5c
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xc8
<L2>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xd9
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xd9
<L3>:
 ff 0a                 fadd	q2, q2
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xd9
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 f0 04 81 ff           ldi16	r0, 0xff81
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 63                 add32	q0, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xd9
<L4>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xb2
<L5>:
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6e                 add32	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 82                    and	r4, r6
 87                    and	r5, r7
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xd9
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xd9
<L6>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
