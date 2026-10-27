
math_ef_log1p.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_log1p.c
00000000 l    d  .text.log1pf	00000000 .text.log1pf
00000000 g     F .text.log1pf	00000139 log1pf

Disassembly of section .text.log1pf:

<log1pf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f0 05 80 33           ldi16	r1, 0x3380
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log1pf
		R_AVM_FAR24	.text.log1pf+0x10f
<L0>:
 f2 30                 sub	r0, r0
 f0 05 80 3d           ldi16	r1, 0x3d80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log1pf
		R_AVM_FAR24	.text.log1pf+0x57
<L1>:
 f2 62                 mov32	q0, q2
 ff 16 04 cd cc 4c 3e 00 00 80 be ab aa aa 3e 00 00 00 bf      fpoly	4, 0.200000003, -0.25, 0.333333343, -0.5
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e2 00 00 00           jmpf	log1pf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log1pf+0x10f
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 c7 80 80              ldi16	r7, 0x8080
 f2 66                 mov32	q1, q2
 f7 67                 add32	q1, q3
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log1pf
		R_AVM_FAR24	.text.log1pf+0x81
<L2>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log1pf
		R_AVM_FAR24	.text.log1pf+0x116
<L3>:
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e2 00 00 00           jmpf	log1pf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log1pf+0x10f
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log1pf
		R_AVM_FAR24	.text.log1pf+0x9e
<L4>:
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 e2 00 00 00           jmpf	log1pf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log1pf+0xa1
 c6 81 ff              ldi16	r6, 0xff81
 f4 42                 stsp16	[sp+0x0], r6
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6d                 add32	q3, q1
 f0 00 80              ldi8	r0, 0x80
 f9 1c                 and	r0, r7
 f9 61                 or	r3, r0
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 16 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 02                 fmul
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log1pf
		R_AVM_FAR24	.text.log1pf+0x12d
<L5>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	log1pf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log1pf+0x10f
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 01                 fsub
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 03                 fdiv
 e2 00 00 00           jmpf	log1pf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log1pf+0x10f
