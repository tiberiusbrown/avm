
math_sf_floor.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_floor.c
00000000 l    d  .text.floorf	00000000 .text.floorf
00000000 g     F .text.floorf	000000cf floorf

Disassembly of section .text.floorf:

<floorf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 05                 mov	r0, r5
 c7 ff 7f              ldi16	r7, 0x7fff
 f9 e0                 and	r7, r0
 c6 7f 3f              ldi16	r6, 0x3f7f
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0x2d
<L0>:
 9c                    or	r7, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 10                 and	r0, r4
 c4 80 bf              ldi16	r4, 0xbf80
 f6 2f                 tst16	r7
 fb 20                 cmov.eq	r4, r0
 f6 28                 tst16	r0
 fb 20                 cmov.eq	r4, r0
 af                    xor	r7, r7
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xc6
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 f4 4a                 stsp16	[sp+0x2], r6
 ca 81                 addi.s8	r6, -0x7f
 f4 52                 stsp16	[sp+0x4], r6
 c6 ff 42              ldi16	r6, 0x42ff
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0x70
<L1>:
 c3 7f                 ldi8	r7, 0x7f
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 1e                 lsr16v	r7, r6
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xc8
<L2>:
 c6 80 ff              ldi16	r6, 0xff80
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 43                 stsp16	[sp+0x0], r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 fa 2e                 asr16v	r7, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 01                    mov	r4, r5
 fa bf                 asr16i	r4, 0xf
 82                    and	r4, r6
 f2 20                 add	r4, r0
 07                    mov	r5, r7
 81                    and	r4, r5
 af                    xor	r7, r7
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xc6
 c6 ff 4a              ldi16	r6, 0x4aff
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xac
<L3>:
 c6 7a ff              ldi16	r6, 0xff7a
 f4 0b                 ldsp16	r7, [sp+0x2]
 1e                    add	r7, r6
 0b                    mov	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 fa 1e                 lsr16v	r7, r6
 0b                    mov	r6, r7
 88                    and	r6, r4
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xc8
<L4>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 48              cmp32	q1, q2
 d3 04                 brslt8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	floorf
		R_AVM_FAR24	.text.floorf+0xbd
<L5>:
 c5 ff ff              ldi16	r5, 0xffff
 ad                    xor	r7, r5
 8c                    and	r7, r4
 f1 20                 mov	r4, r0
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xc6
 f2 62                 mov32	q0, q2
 ff 00                 fadd	q0, q0
 c2 80                 ldi8	r6, 0x80
 f4 13                 ldsp16	r7, [sp+0x4]
 3e                    cmp	r7, r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 e2 00 00 00           jmpf	floorf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.floorf+0xc8
 9c                    or	r7, r4
 f4 af                 inc16	r7
 f6 2f                 tst16	r7
 f8 04                 cset.eq	r4
 f2 20                 add	r4, r0
 04                    mov	r5, r4
 03                    mov	r4, r7
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
