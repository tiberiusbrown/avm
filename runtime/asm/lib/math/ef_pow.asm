
math_ef_pow.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_pow.c
00000000 l    d  .text.powf	00000000 .text.powf
00000000 g     F .text.powf	00000a3f powf
00000000         *UND*	00000000 __avm_lshrsi3
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 sqrtf
00000000         *UND*	00000000 expf
00000000         *UND*	00000000 __avm_ashrsi3
00000000         *UND*	00000000 scalbnf

Disassembly of section .text.powf:

<powf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c8                 adjsp	-0x38
 f2 67                 mov32	q1, q3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 f2 63                 mov32	q0, q3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x85
<L0>:
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c4              cmp32	q3, q1
 f8 14                 cset.ult	r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xc1
<L1>:
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xc1
<L2>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 80              cmp32	q2, q0
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xfd
<L3>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1d5
<L4>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x18e
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x38e
<L5>:
 a0                    xor	r4, r4
 c1 40                 ldi8	r5, 0x40
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 ac                 and	r5, r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x38e
<L6>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 06                 fadd	q1, q2
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x38e
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xf3
<L7>:
 c5 ff ff              ldi16	r5, 0xffff
 a1                    xor	r4, r5
 f0 03 40              ldi8	r3, 0x40
 f4 2b                 ldsp16	r7, [sp+0xa]
 f9 7c                 and	r3, r7
 f1 2b                 mov	r6, r3
 fa 96                 lsr16i	r6, 0x6
 98                    or	r6, r4
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x38e
<L8>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 02                 fadd	q0, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2e2
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 4b              ldi16	r5, 0x4b7f
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x120
<L9>:
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1d5
<L10>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x18e
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x17f
<L11>:
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 c2 96                 ldi8	r6, 0x96
 af                    xor	r7, r7
 f7 7e                 sub32	q3, q2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f0 69 84              cmp32	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x181
<L12>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 88                    and	r6, r4
 8d                    and	r7, r5
 02                    mov	r4, r6
 c2 02                 ldi8	r6, 0x2
 f7 7e                 sub32	q3, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1d5
<L13>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x18e
 aa                    xor	r6, r6
 af                    xor	r7, r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1d5
<L14>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1f2
<L15>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x38a
<L16>:
 c0 01                 ldi8	r4, 0x1
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2cf
<L17>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 0c              cmp32	q0, q3
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x38a
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2e2
<L18>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 38                 fdiv	q2, q0
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x38a
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x20f
<L19>:
 ff 20                 fmul	q0, q0
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2e2
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f7 69                 add32	q2, q1
 aa                    xor	r6, r6
 c3 60                 ldi8	r7, 0x60
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2a3
<L20>:
 a0                    xor	r4, r4
 c5 00 c8              ldi16	r5, 0xc800
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c7 00 0f              ldi16	r7, 0xf00
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2a3
<L21>:
 a0                    xor	r4, r4
 c5 40 40              ldi16	r5, 0x4040
 f0 69 48              cmp32	q1, q2
 c5 a0 40              ldi16	r5, 0x40a0
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x260
<L22>:
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x260
<L23>:
 aa                    xor	r6, r6
 c7 80 40              ldi16	r7, 0x4080
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2a3
<L24>:
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 a0                    xor	r4, r4
 c5 40 40              ldi16	r5, 0x4040
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x280
<L25>:
 ff 2f                 fmul	q3, q3
 a0                    xor	r4, r4
 c5 a0 40              ldi16	r5, 0x40a0
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x284
<L26>:
 ff 23                 fmul	q0, q3
 f2 6a                 mov32	q3, q0
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 ff 33                 fdiv	q0, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 84              cmp32	q2, q1
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x38e
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 69 08              cmp32	q0, q2
 d9 04                 brsge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2ec
<L27>:
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2ec
<L28>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x38a
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 63                 fneg	q3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 fd 06                 cmov.slt	r0, r6
 fd 0f                 cmov.slt	r1, r7
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x38e
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 a0                    xor	r4, r4
 c5 00 c1              ldi16	r5, 0xc100
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c7 00 01              ldi16	r7, 0x100
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x399
<L29>:
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x399
<L30>:
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 66                 add32	q1, q2
 c2 80                 ldi8	r6, 0x80
 f9 cc                 and	r6, r3
 96                    or	r5, r6
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 ff ca 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 2b                 mov	r6, r3
 fa 97                 lsr16i	r6, 0x7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 23                 fmul	q0, q3
 c8 81                 addi.s8	r4, -0x7f
 ff c0 42              s16tof	q2, r4
 ff 02                 fadd	q0, q2
 c4 18 72              ldi16	r4, 0x7218
 c5 31 3f              ldi16	r5, 0x3f31
 ff 22                 fmul	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 28                 fmul	q2, q0
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	expf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 38                 adjsp	0x38
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x41d
<L31>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 3f              ldi16	r5, 0x3fff
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x41d
<L32>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 fa 7f                 lsr16i	r4, 0xf
 08                    mov	r6, r4
 af                    xor	r7, r7
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 02                    mov	r4, r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x476
<L33>:
 c0 01                 ldi8	r4, 0x1
 c5 00 4d              ldi16	r5, 0x4d00
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x47e
<L34>:
 c4 f3 ff              ldi16	r4, 0xfff3
 c5 7f 3f              ldi16	r5, 0x3f7f
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 69 8c              cmp32	q2, q3
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x500
<L35>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x38a
<L36>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x38e
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 fa 7f                 lsr16i	r4, 0xf
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 33                 fdiv	q0, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c4              cmp32	q3, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 fd 30                 cmov.slt	r6, r0
 fd 39                 cmov.slt	r7, r1
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x29b
<L37>:
 f2 63                 mov32	q0, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 6b                 add32	q2, q3
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x476
<L38>:
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2e2
<L39>:
 ff 60                 fneg	q0
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2e2
 ff 10                 fsub	q0, q0
 ff 30                 fdiv	q0, q0
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2e2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 69 48              cmp32	q1, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 d8 04                 bruge8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x4aa
<L40>:
 a0                    xor	r4, r4
 c5 80 4b              ldi16	r5, 0x4b80
 ff 2e                 fmul	q3, q2
 c4 e8 ff              ldi16	r4, 0xffe8
 c5 ff ff              ldi16	r5, 0xffff
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 fa d7                 asr16i	r6, 0x7
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f7 63                 add32	q0, q3
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c4 80 3f              ldi16	r4, 0x3f80
 f9 8d                 or	r4, r3
 04                    mov	r5, r4
 f1 22                 mov	r4, r2
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 81 ff              ldi16	r4, 0xff81
 c5 ff ff              ldi16	r5, 0xffff
 f7 68                 add32	q2, q0
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 c0 01                 ldi8	r4, 0x1
 f2 30                 sub	r0, r0
 f0 05 40 20           ldi16	r1, 0x2040
 c6 72 c4              ldi16	r6, 0xc472
 c3 1c                 ldi8	r7, 0x1c
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x521
<L41>:
 f0 38 28              stsp16	[sp+0x28], r0
 f0 39 2a              stsp16	[sp+0x2a], r1
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x5ce
 c0 08                 ldi8	r4, 0x8
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x54a
<L42>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x38e
<L43>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x38a
 c6 d7 b3              ldi16	r6, 0xb3d7
 c3 5d                 ldi8	r7, 0x5d
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x5a7
<L44>:
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 aa                    xor	r6, r6
 c7 60 20              ldi16	r7, 0x2060
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 c7 80 3f              ldi16	r7, 0x3f80
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x5d4
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 c5 80 be              ldi16	r5, 0xbe80
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa 3e              ldi16	r5, 0x3eaa
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 1e                 fsub	q3, q2
 f2 68                 mov32	q2, q0
 ff 2a                 fmul	q2, q2
 ff 2b                 fmul	q2, q3
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 bf              ldi16	r7, 0xbfb8
 ff 2b                 fmul	q2, q3
 c6 70 a5              ldi16	r6, 0xa570
 c7 ec 36              ldi16	r7, 0x36ec
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff 06                 fadd	q1, q2
 c4 00 aa              ldi16	r4, 0xaa00
 c5 b8 3f              ldi16	r5, 0x3fb8
 ff 22                 fmul	q0, q2
 f2 6a                 mov32	q3, q0
 ff 0d                 fadd	q3, q1
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 88                    and	r6, r4
 8d                    and	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 18                 fsub	q2, q0
 ff 16                 fsub	q1, q2
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x7a6
 f0 38 28              stsp16	[sp+0x28], r0
 f0 39 2a              stsp16	[sp+0x2a], r1
 c5 00 3f              ldi16	r5, 0x3f00
 f9 ad                 or	r5, r3
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f7 63                 add32	q0, q3
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f1 2a                 mov	r6, r2
 0d                    mov	r7, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 04 00 c0           ldi16	r0, 0xc000
 f0 05 15 3f           ldi16	r1, 0x3f15
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 a4                 tst8	r4
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 c4 dc cf              ldi16	r4, 0xcfdc
 c5 d1 35              ldi16	r5, 0x35d1
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f2 69                 mov32	q2, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 08                 fadd	q2, q0
 ff 3e                 fdiv	q3, q2
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 ff 11                 fsub	q0, q1
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 ff 23                 fmul	q0, q3
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 ff 20                 fmul	q0, q0
 f2 68                 mov32	q2, q0
 ff ca 06 42 f1 53 3e 55 32 6c 3e 05 a3 8b 3e ab aa aa 3e b7 6d db 3e 9a 99 19 3f      fpoly	6, 0.206975013, 0.230660751, 0.272728115, 0.333333343, 0.428571433, 0.600000024
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 82                 lsr32.1	q2
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff 5f              ldi16	r7, 0x5fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f7 6e                 add32	q3, q2
 ff 20                 fmul	q0, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 28                 fmul	q2, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 28              stsp16	[sp+0x28], r0
 f0 39 2a              stsp16	[sp+0x2a], r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 ff 12                 fsub	q0, q2
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 ff 17                 fsub	q1, q3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 06                 fadd	q1, q2
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 ff 24                 fmul	q1, q0
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 ff 19                 fsub	q2, q1
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 2e                 fmul	q3, q2
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 08                 fadd	q2, q0
 ff 2b                 fmul	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 40 40              ldi16	r7, 0x4040
 f2 68                 mov32	q2, q0
 ff 2a                 fmul	q2, q2
 f2 66                 mov32	q1, q2
 ff 07                 fadd	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 07                 fadd	q1, q3
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 aa                    xor	r6, r6
 c7 40 c0              ldi16	r7, 0xc040
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f2 6b                 mov32	q3, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 0c                 fadd	q3, q0
 ff 1e                 fsub	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 1b                 fsub	q2, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2b                 fmul	q2, q3
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 2d                 fmul	q3, q1
 ff 0e                 fadd	q3, q2
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 ff 21                 fmul	q0, q1
 f2 68                 mov32	q2, q0
 ff 0b                 fadd	q2, q3
 f2 67                 mov32	q1, q3
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 82                    and	r4, r6
 87                    and	r5, r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1c                 fsub	q3, q0
 ff 17                 fsub	q1, q3
 c6 4f 38              ldi16	r6, 0x384f
 c7 76 3f              ldi16	r7, 0x3f76
 ff 27                 fmul	q1, q3
 c6 c6 23              ldi16	r6, 0x23c6
 c7 f6 b8              ldi16	r7, 0xb8f6
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 04                 fadd	q1, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 0d                 fadd	q3, q1
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 c6 00 40              ldi16	r6, 0x4000
 c7 76 3f              ldi16	r7, 0x3f76
 ff 2b                 fmul	q2, q3
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff c4 03              s32tof	q0, q3
 f2 66                 mov32	q1, q2
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 07                 fadd	q1, q3
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 ff 0d                 fadd	q3, q1
 ff 0c                 fadd	q3, q0
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f2 67                 mov32	q1, q3
 ff 14                 fsub	q1, q0
 f0 30 30              ldsp16	r0, [sp+0x30]
 f0 31 32              ldsp16	r1, [sp+0x32]
 ff 14                 fsub	q1, q0
 ff 19                 fsub	q2, q1
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 02                 fadd	q0, q2
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 66                 mov32	q1, q2
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 24                 fmul	q1, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 18                 fsub	q2, q0
 ff 2b                 fmul	q2, q3
 ff 06                 fadd	q1, q2
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 2e                 fmul	q3, q2
 f2 63                 mov32	q0, q3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 01                 fadd	q0, q1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 69 08              cmp32	q0, q2
 f2 63                 mov32	q0, q3
 d9 04                 brsge8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x843
<L45>:
 c0 01                 ldi8	r4, 0x1
 c5 00 43              ldi16	r5, 0x4300
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x881
<L46>:
 aa                    xor	r6, r6
 c7 80 ff              ldi16	r7, 0xff80
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x38a
 c0 01                 ldi8	r4, 0x1
 c5 16 43              ldi16	r5, 0x4316
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x877
<L47>:
 f2 6b                 mov32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 18                 fsub	q2, q0
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff c8 46              fcmp	r4, q1, q2
 cc 01                 cmpi.s8	r4, 0x1
 d3 04                 brslt8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x8cf
<L48>:
 a0                    xor	r4, r4
 c5 16 43              ldi16	r5, 0x4316
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x8cf
<L49>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xa32
 f2 6b                 mov32	q3, q1
 a0                    xor	r4, r4
 c5 00 43              ldi16	r5, 0x4300
 f0 69 c8              cmp32	q3, q2
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d0 04                 breq8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x8cf
<L50>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 18                 fsub	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 3c aa              ldi16	r4, 0xaa3c
 c5 38 33              ldi16	r5, 0x3338
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff c8 4e              fcmp	r4, q3, q2
 cc 01                 cmpi.s8	r4, 0x1
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 d1 04                 brne8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x82e
<L51>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x8df
 c0 01                 ldi8	r4, 0x1
 c5 00 3f              ldi16	r5, 0x3f00
 f0 69 c8              cmp32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 d8 04                 bruge8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x96f
<L52>:
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 c6 82 ff              ldi16	r6, 0xff82
 c7 ff ff              ldi16	r7, 0xffff
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6e                 add32	q3, q2
 c0 7f                 ldi8	r4, 0x7f
 83                    and	r4, r7
 c1 80                 ldi8	r5, 0x80
 94                    or	r5, r4
 02                    mov	r4, r6
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 c2 96                 ldi8	r6, 0x96
 f7 7c                 sub32	q3, q0
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 7e                 sub32	q3, q2
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f2 30                 sub	r0, r0
 f0 69 40              cmp32	q1, q0
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c6 81 ff              ldi16	r6, 0xff81
 c7 ff ff              ldi16	r7, 0xffff
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashrsi3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 82                    and	r4, r6
 87                    and	r5, r7
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 12                 fsub	q0, q2
 f2 6b                 mov32	q3, q1
 ff 0c                 fadd	q3, q0
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x97b
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 c4 00 80              ldi16	r4, 0x8000
 c5 ff ff              ldi16	r5, 0xffff
 82                    and	r4, r6
 87                    and	r5, r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1c                 fsub	q3, q0
 ff 17                 fsub	q1, q3
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 27                 fmul	q1, q3
 f0 04 8c be           ldi16	r0, 0xbe8c
 f0 05 bf 35           ldi16	r1, 0x35bf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2c                 fmul	q3, q0
 ff 0d                 fadd	q3, q1
 f0 04 00 72           ldi16	r0, 0x7200
 f0 05 31 3f           ldi16	r1, 0x3f31
 ff 28                 fmul	q2, q0
 f2 66                 mov32	q1, q2
 ff 07                 fadd	q1, q3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 61                 mov32	q0, q1
 ff 12                 fsub	q0, q2
 ff 1c                 fsub	q3, q0
 f2 61                 mov32	q0, q1
 ff 20                 fmul	q0, q0
 f2 68                 mov32	q2, q0
 ff ca 05 4c bb 31 33 0e ea dd b5 55 b3 8a 38 61 0b 36 bb ab aa 2a 3e  fpoly	5, 4.13813694E-8, -1.6533902E-6, 6.61375597E-5, -0.00277777785, 0.166666672
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 27                 fmul	q1, q3
 ff 0d                 fadd	q3, q1
 ff 28                 fmul	q2, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 12                 fsub	q0, q2
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 f2 64                 mov32	q1, q0
 ff 06                 fadd	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 28                 fmul	q2, q0
 ff 39                 fdiv	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 1b                 fsub	q2, q3
 ff 16                 fsub	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 06                 fadd	q1, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 fa 37                 lsl16i	r4, 0x7
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f7 6d                 add32	q3, q1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 69 0c              cmp32	q0, q3
 d9 04                 brsge8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xa2e
<L53>:
 f2 69                 mov32	q2, q1
 f0 36 14              ldsp16	r6, [sp+0x14]
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	scalbnf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 63                 fneg	q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f6 28                 tst16	r0
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x38a
