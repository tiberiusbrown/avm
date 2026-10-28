
math_sf_scalbn.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_scalbn.c
00000000 l    d  .text.scalbnf	00000000 .text.scalbnf
00000000 g     F .text.scalbnf	0000010b scalbnf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.scalbnf:

<scalbnf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 06                 mov	r0, r6
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xab
<L0>:
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 f0 01 ff              ldi8	r1, 0xff
 f5 29                 cmp	r6, r1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x2e
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xab
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xab
<L2>:
 c7 15 01              ldi16	r7, 0x115
 f5 07                 cmp	r0, r7
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xb0
<L3>:
 c7 ea fe              ldi16	r7, 0xfeea
 f5 2c                 cmp	r7, r0
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xcd
<L4>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x61
<L5>:
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 02                 fmul
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 ca e7                 addi.s8	r6, -0x19
 f2 28                 add	r6, r0
 f5 29                 cmp	r6, r1
 d3 04                 brslt8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xde
<L6>:
 ce 01                 cmpi.s8	r6, 0x1
 d9 04                 brsge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x7f
<L7>:
 c7 7f 80              ldi16	r7, 0x807f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 9b                    or	r6, r7
 06                    mov	r5, r6
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xab
 ce e9                 cmpi.s8	r6, -0x17
 d9 04                 brsge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xf1
<L8>:
 c7 7f 80              ldi16	r7, 0x807f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 c5 80 0c              ldi16	r5, 0xc80
 16                    add	r5, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 c7 00 33              ldi16	r7, 0x3300
 ff 02                 fmul
 09                    mov	r6, r5
 c7 80 7f              ldi16	r7, 0x7f80
 8e                    and	r7, r6
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x101
<L9>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 c6 80 7f              ldi16	r6, 0x7f80
 c7 80 ff              ldi16	r7, 0xff80
 f0 69 84              cmp32	q2, q1
 fb 77                 cmov.ne	r6, r7
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 06                    mov	r5, r6
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xab
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 8d                    and	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xab
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 c5 80 7f              ldi16	r5, 0x7f80
 94                    or	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xab
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xab
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xab
