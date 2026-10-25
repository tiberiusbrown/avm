
math_ef_log10.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_log10.c
00000000 l    d  .text.log10f	00000000 .text.log10f
00000000 g     F .text.log10f	000001f3 log10f

Disassembly of section .text.log10f:

<log10f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x2e
<L0>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 68              fcmp	r6, q2, q0
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x1d6
<L1>:
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x1cf
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x4d
<L2>:
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 ff 28                 fmul	q2, q0
 c6 68 ff              ldi16	r6, 0xff68
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x50
 c6 81 ff              ldi16	r6, 0xff81
 f4 52                 stsp16	[sp+0x4], r6
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 61                 add32	q0, q1
 c2 80                 ldi8	r6, 0x80
 f9 c4                 and	r6, r1
 f9 79                 or	r3, r6
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f4 10                 ldsp16	r4, [sp+0x4]
 18                    add	r6, r4
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 ff 0c                 fadd	q3, q0
 f0 05 80 3d           ldi16	r1, 0x3d80
 f2 67                 mov32	q1, q3
 ff 65                 fabs	q1
 ff c8 04              fcmp	r0, q1, q0
 ff c0 42              s16tof	q2, r4
 f0 06 db 27           ldi16	r2, 0x27db
 f0 07 54 35           ldi16	r3, 0x3554
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 ff 29                 fmul	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 0c 01              cmpi.s8	r0, 0x1
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x167
<L3>:
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 f2 67                 mov32	q1, q3
 ff 04                 fadd	q1, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 39                 fdiv	q2, q1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ff 2a                 fmul	q2, q2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 ff 2a                 fmul	q2, q2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 06 97 88           ldi16	r2, 0x8897
 f0 07 17 3e           ldi16	r3, 0x3e17
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 25 33           ldi16	r2, 0x3325
 f0 07 3a 3e           ldi16	r3, 0x3e3a
 ff 01                 fadd	q0, q1
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 25 49           ldi16	r0, 0x4925
 f0 05 92 3e           ldi16	r1, 0x3e92
 ff 04                 fadd	q1, q0
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 2a 3f           ldi16	r3, 0x3f2a
 ff 01                 fadd	q0, q1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 06 4f d0           ldi16	r2, 0xd04f
 f0 07 1c 3e           ldi16	r3, 0x3e1c
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 29 8e           ldi16	r2, 0x8e29
 f0 07 63 3e           ldi16	r3, 0x3e63
 ff 01                 fadd	q0, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 26                 fmul	q1, q2
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 cc 3e           ldi16	r1, 0x3ecc
 ff 04                 fadd	q1, q0
 ff 29                 fmul	q2, q1
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f2 64                 mov32	q1, q0
 ff 06                 fadd	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 06                 fadd	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 29                 fmul	q2, q1
 ff 18                 fsub	q2, q0
 ff 0e                 fadd	q3, q2
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x1ab
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 4c be           ldi16	r1, 0xbe4c
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f2 42                 sub	r2, r2
 f0 07 80 3e           ldi16	r3, 0x3e80
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 aa be           ldi16	r1, 0xbeaa
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f2 42                 sub	r2, r2
 f0 07 00 3f           ldi16	r3, 0x3f00
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 25                 fmul	q1, q1
 ff 24                 fmul	q1, q0
 ff 1d                 fsub	q3, q1
 f0 04 80 20           ldi16	r0, 0x2080
 f0 05 9a 3e           ldi16	r1, 0x3e9a
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 24                 fmul	q1, q0
 f0 04 d9 5b           ldi16	r0, 0x5bd9
 f0 05 de 3e           ldi16	r1, 0x3ede
 ff 2c                 fmul	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 0b                 fadd	q2, q3
 ff 06                 fadd	q1, q2
 f2 69                 mov32	q2, q1
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	log10f
		R_AVM_FAR24	.text.log10f+0x1eb
<L4>:
 ff 0a                 fadd	q2, q2
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x1cf
 ff 1a                 fsub	q2, q2
 ff 38                 fdiv	q2, q0
 e2 00 00 00           jmpf	log10f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.log10f+0x1cf
