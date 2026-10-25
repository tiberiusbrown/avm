
math_ef_pow.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_pow.c
00000000 l    d  .text.powf	00000000 .text.powf
00000000 g     F .text.powf	00000bd1 powf
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
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
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
		R_AVM_FAR24	.text.powf+0x584
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
		R_AVM_FAR24	.text.powf+0x584
<L6>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 06                 fadd	q1, q2
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x584
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
		R_AVM_FAR24	.text.powf+0x584
<L8>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 02                 fadd	q0, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2ee
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
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
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
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x580
<L16>:
 c0 01                 ldi8	r4, 0x1
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2db
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
		R_AVM_FAR24	.text.powf+0x580
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2ee
<L18>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 38                 fdiv	q2, q0
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x580
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x20f
<L19>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 2a                 fmul	q2, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x580
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f7 69                 add32	q2, q1
 aa                    xor	r6, r6
 c3 60                 ldi8	r7, 0x60
 f0 69 c8              cmp32	q3, q2
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2af
<L20>:
 a0                    xor	r4, r4
 c5 00 c8              ldi16	r5, 0xc800
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c7 00 0f              ldi16	r7, 0xf00
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2af
<L21>:
 a0                    xor	r4, r4
 c5 40 40              ldi16	r5, 0x4040
 f0 69 48              cmp32	q1, q2
 c5 a0 40              ldi16	r5, 0x40a0
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x26c
<L22>:
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x26c
<L23>:
 aa                    xor	r6, r6
 c7 80 40              ldi16	r7, 0x4080
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2af
<L24>:
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 a0                    xor	r4, r4
 c5 40 40              ldi16	r5, 0x4040
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x28c
<L25>:
 ff 2f                 fmul	q3, q3
 a0                    xor	r4, r4
 c5 a0 40              ldi16	r5, 0x40a0
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x290
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
		R_AVM_FAR24	.text.powf+0x584
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 69 08              cmp32	q0, q2
 d9 04                 brsge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2f8
<L27>:
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2f8
<L28>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x580
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
		R_AVM_FAR24	.text.powf+0x584
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 c5 00 c1              ldi16	r5, 0xc100
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c7 00 01              ldi16	r7, 0x100
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x437
<L29>:
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x437
<L30>:
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 62                 add32	q0, q2
 c2 80                 ldi8	r6, 0x80
 f9 c4                 and	r6, r1
 96                    or	r5, r6
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 c5 80 3d              ldi16	r5, 0x3d80
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ff 65                 fabs	q1
 ff c8 26              fcmp	r2, q1, q2
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 ca 81                 addi.s8	r6, -0x7f
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 0e 01              cmpi.s8	r2, 0x1
 d9 04                 brsge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x514
<L31>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 ff 08                 fadd	q2, q0
 f2 63                 mov32	q0, q3
 ff 32                 fdiv	q0, q2
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 ff 20                 fmul	q0, q0
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 68                 mov32	q2, q0
 ff 2a                 fmul	q2, q2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 04 97 88           ldi16	r0, 0x8897
 f0 05 17 3e           ldi16	r1, 0x3e17
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 25 33           ldi16	r0, 0x3325
 f0 05 3a 3e           ldi16	r1, 0x3e3a
 ff 04                 fadd	q1, q0
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 25 49           ldi16	r2, 0x4925
 f0 07 92 3e           ldi16	r3, 0x3e92
 ff 01                 fadd	q0, q1
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3f           ldi16	r1, 0x3f2a
 ff 04                 fadd	q1, q0
 f0 04 4f d0           ldi16	r0, 0xd04f
 f0 05 1c 3e           ldi16	r1, 0x3e1c
 ff 28                 fmul	q2, q0
 f0 04 29 8e           ldi16	r0, 0x8e29
 f0 05 63 3e           ldi16	r1, 0x3e63
 ff 08                 fadd	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 21                 fmul	q0, q1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 cc 3e              ldi16	r5, 0x3ecc
 ff 02                 fadd	q0, q2
 ff 24                 fmul	q1, q0
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f2 69                 mov32	q2, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 08                 fadd	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 08                 fadd	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 22                 fmul	q0, q2
 ff 11                 fsub	q0, q1
 ff 0c                 fadd	q3, q0
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x556
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x4bb
<L32>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 3f              ldi16	r5, 0x3fff
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x4bb
<L33>:
 f0 34 18              ldsp16	r4, [sp+0x18]
 fa 7f                 lsr16i	r4, 0xf
 08                    mov	r6, r4
 af                    xor	r7, r7
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 02                    mov	r4, r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x58f
<L34>:
 c0 01                 ldi8	r4, 0x1
 c5 00 4d              ldi16	r5, 0x4d00
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x597
<L35>:
 c4 f3 ff              ldi16	r4, 0xfff3
 c5 7f 3f              ldi16	r5, 0x3f7f
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 69 84              cmp32	q2, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d8 04                 bruge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x625
<L36>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x584
<L37>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x580
 f0 34 18              ldsp16	r4, [sp+0x18]
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
 d1 04                 brne8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2a7
<L38>:
 f2 63                 mov32	q0, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f7 6b                 add32	q2, q3
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x58f
<L39>:
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2ee
<L40>:
 ff 60                 fneg	q0
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2ee
 c4 ab aa              ldi16	r4, 0xaaab
 c5 2a 3e              ldi16	r5, 0x3e2a
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 ff 02                 fadd	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f2 30                 sub	r0, r0
 f0 05 80 3e           ldi16	r1, 0x3e80
 ff 08                 fadd	q2, q0
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa be              ldi16	r5, 0xbeaa
 ff 02                 fadd	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 ff 08                 fadd	q2, q0
 f2 63                 mov32	q0, q3
 ff 20                 fmul	q0, q0
 ff 22                 fmul	q0, q2
 ff 1c                 fsub	q3, q0
 f0 34 18              ldsp16	r4, [sp+0x18]
 ff c0 42              s16tof	q2, r4
 f0 06 80 71           ldi16	r2, 0x7180
 f0 07 31 3f           ldi16	r3, 0x3f31
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 37           ldi16	r3, 0x3717
 ff 29                 fmul	q2, q1
 ff 0b                 fadd	q2, q3
 ff 02                 fadd	q0, q2
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
 ff 10                 fsub	q0, q0
 ff 30                 fdiv	q0, q0
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2ee
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 8c              cmp32	q2, q3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 d8 04                 bruge8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x5cb
<L41>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 23                 fmul	q0, q3
 f2 64                 mov32	q1, q0
 c6 e8 ff              ldi16	r6, 0xffe8
 c7 ff ff              ldi16	r7, 0xffff
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f1 2b                 mov	r6, r3
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 fa d7                 asr16i	r6, 0x7
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 63                 add32	q0, q3
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 c6 80 3f              ldi16	r6, 0x3f80
 99                    or	r6, r5
 f1 14                 mov	r2, r4
 f1 1e                 mov	r3, r6
 c6 81 ff              ldi16	r6, 0xff81
 c7 ff ff              ldi16	r7, 0xffff
 f7 6c                 add32	q3, q0
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 10              stsp16	[sp+0x10], r6
 f2 30                 sub	r0, r0
 f0 05 40 20           ldi16	r1, 0x2040
 c6 72 c4              ldi16	r6, 0xc472
 c3 1c                 ldi8	r7, 0x1c
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x646
<L42>:
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x6fd
 c0 08                 ldi8	r4, 0x8
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x677
<L43>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x584
<L44>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x580
 c6 d7 b3              ldi16	r6, 0xb3d7
 c3 5d                 ldi8	r7, 0x5d
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x6d4
<L45>:
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 10              stsp16	[sp+0x10], r4
 c5 60 20              ldi16	r5, 0x2060
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 c5 80 3f              ldi16	r5, 0x3f80
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x705
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
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 c4 00 aa              ldi16	r4, 0xaa00
 c5 b8 3f              ldi16	r5, 0x3fb8
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 f2 61                 mov32	q0, q1
 ff 03                 fadd	q0, q3
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f2 68                 mov32	q2, q0
 ff 19                 fsub	q2, q1
 ff 1e                 fsub	q3, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x8ed
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f0 05 00 3f           ldi16	r1, 0x3f00
 f9 35                 or	r1, r5
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f7 6d                 add32	q3, q1
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f1 25                 mov	r5, r1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 66                 mov32	q1, q2
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 c6 00 c0              ldi16	r6, 0xc000
 c7 15 3f              ldi16	r7, 0x3f15
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 10              ldsp16	r0, [sp+0x10]
 f4 a0                 tst8	r0
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f0 3e 34              stsp16	[sp+0x34], r6
 f0 3f 36              stsp16	[sp+0x36], r7
 c6 dc cf              ldi16	r6, 0xcfdc
 c7 d1 35              ldi16	r7, 0x35d1
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 68                 mov32	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0b                 fadd	q2, q3
 ff 36                 fdiv	q1, q2
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 18                 fsub	q2, q0
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 ff 20                 fmul	q0, q0
 c4 42 f1              ldi16	r4, 0xf142
 c5 53 3e              ldi16	r5, 0x3e53
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 55 32              ldi16	r4, 0x3255
 c5 6c 3e              ldi16	r5, 0x3e6c
 ff 06                 fadd	q1, q2
 f7 83                 lsr32.1	q3
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff 5f              ldi16	r5, 0x5fff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 f0 06 05 a3           ldi16	r2, 0xa305
 f0 07 8b 3e           ldi16	r3, 0x3e8b
 ff 0d                 fadd	q3, q1
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f7 69                 add32	q2, q1
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 07                 fadd	q1, q3
 f0 3a 30              stsp16	[sp+0x30], r2
 f0 3b 32              stsp16	[sp+0x32], r3
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1e                 fsub	q3, q2
 ff 29                 fmul	q2, q1
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 ff 16                 fsub	q1, q2
 f0 3a 28              stsp16	[sp+0x28], r2
 f0 3b 2a              stsp16	[sp+0x2a], r3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 0e                 fadd	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 68                 mov32	q2, q0
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 ff 2b                 fmul	q2, q3
 c6 b7 6d              ldi16	r6, 0x6db7
 c7 db 3e              ldi16	r7, 0x3edb
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 9a 99              ldi16	r4, 0x999a
 c5 19 3f              ldi16	r5, 0x3f19
 ff 0e                 fadd	q3, q2
 ff 20                 fmul	q0, q0
 ff 23                 fmul	q0, q3
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2d                 fmul	q3, q1
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 ff 1b                 fsub	q2, q3
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 2e                 fmul	q3, q2
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 09                 fadd	q2, q1
 ff 2b                 fmul	q2, q3
 ff 08                 fadd	q2, q0
 f2 30                 sub	r0, r0
 f0 05 40 40           ldi16	r1, 0x4040
 ff 25                 fmul	q1, q1
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 ff 04                 fadd	q1, q0
 ff 06                 fadd	q1, q2
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f2 30                 sub	r0, r0
 f0 05 40 c0           ldi16	r1, 0xc040
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 61                 mov32	q0, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fadd	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 13                 fsub	q0, q3
 ff 18                 fsub	q2, q0
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 2e                 fmul	q3, q2
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 ff 21                 fmul	q0, q1
 ff 03                 fadd	q0, q3
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 2d                 fmul	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 67                 mov32	q1, q3
 ff 08                 fadd	q2, q0
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 82                    and	r4, r6
 87                    and	r5, r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1d                 fsub	q3, q1
 ff 13                 fsub	q0, q3
 c6 4f 38              ldi16	r6, 0x384f
 c7 76 3f              ldi16	r7, 0x3f76
 ff 23                 fmul	q0, q3
 f2 64                 mov32	q1, q0
 c6 c6 23              ldi16	r6, 0x23c6
 c7 f6 b8              ldi16	r7, 0xb8f6
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 04                 fadd	q1, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 01                 fadd	q0, q1
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 c6 00 40              ldi16	r6, 0x4000
 c7 76 3f              ldi16	r7, 0x3f76
 ff 2b                 fmul	q2, q3
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff c4 07              s32tof	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0c                 fadd	q3, q0
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 ff 03                 fadd	q0, q3
 ff 01                 fadd	q0, q1
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 6a                 mov32	q3, q0
 ff 1d                 fsub	q3, q1
 f0 32 34              ldsp16	r2, [sp+0x34]
 f0 33 36              ldsp16	r3, [sp+0x36]
 ff 1d                 fsub	q3, q1
 ff 1b                 fsub	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 0e                 fadd	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1b                 fsub	q2, q3
 ff 28                 fmul	q2, q0
 ff 06                 fadd	q1, q2
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 22                 fmul	q0, q2
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 6a                 mov32	q3, q0
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 0d                 fadd	q3, q1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x984
<L46>:
 c0 01                 ldi8	r4, 0x1
 c5 00 43              ldi16	r5, 0x4300
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x9de
<L47>:
 aa                    xor	r6, r6
 c7 80 ff              ldi16	r7, 0xff80
 f0 34 14              ldsp16	r4, [sp+0x14]
 f6 2c                 tst16	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x580
 c0 01                 ldi8	r4, 0x1
 c5 16 43              ldi16	r5, 0x4316
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x9c8
<L48>:
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1b                 fsub	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff c8 42              fcmp	r4, q0, q2
 cc 01                 cmpi.s8	r4, 0x1
 d3 04                 brslt8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xa2c
<L49>:
 a0                    xor	r4, r4
 c5 16 43              ldi16	r5, 0x4316
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xa2c
<L50>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f6 28                 tst16	r0
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x580
 a0                    xor	r4, r4
 c5 00 43              ldi16	r5, 0x4300
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 69 08              cmp32	q0, q2
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d0 04                 breq8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xa2c
<L51>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 1b                 fsub	q2, q3
 c6 3c aa              ldi16	r6, 0xaa3c
 c7 38 33              ldi16	r7, 0x3338
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f2 6a                 mov32	q3, q0
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 ff 0d                 fadd	q3, q1
 ff c8 4e              fcmp	r4, q3, q2
 cc 01                 cmpi.s8	r4, 0x1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d1 04                 brne8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x96f
<L52>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xa40
 c0 01                 ldi8	r4, 0x1
 c5 00 3f              ldi16	r5, 0x3f00
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 d8 04                 bruge8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xac2
<L53>:
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
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f7 6d                 add32	q3, q1
 c0 7f                 ldi8	r4, 0x7f
 83                    and	r4, r7
 c1 80                 ldi8	r5, 0x80
 94                    or	r5, r4
 02                    mov	r4, r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
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
 f2 30                 sub	r0, r0
 f2 6a                 mov32	q3, q0
 f7 7e                 sub32	q3, q2
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
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
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 82                    and	r4, r6
 87                    and	r5, r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 1e                 fsub	q3, q2
 f2 68                 mov32	q2, q0
 ff 0b                 fadd	q2, q3
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xad2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 06 00 80           ldi16	r2, 0x8000
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 69                 mov32	q2, q1
 ff 1b                 fsub	q2, q3
 ff 12                 fsub	q0, q2
 c4 18 72              ldi16	r4, 0x7218
 c5 31 3f              ldi16	r5, 0x3f31
 ff 22                 fmul	q0, q2
 c4 8c be              ldi16	r4, 0xbe8c
 c5 bf 35              ldi16	r5, 0x35bf
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 ff 0c                 fadd	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c4 00 72              ldi16	r4, 0x7200
 c5 31 3f              ldi16	r5, 0x3f31
 ff 26                 fmul	q1, q2
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 c4 4c bb              ldi16	r4, 0xbb4c
 c5 31 33              ldi16	r5, 0x3331
 ff 07                 fadd	q1, q3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ff 25                 fmul	q1, q1
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 c6 0e ea              ldi16	r6, 0xea0e
 c7 dd b5              ldi16	r7, 0xb5dd
 ff 03                 fadd	q0, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f0 04 55 b3           ldi16	r0, 0xb355
 f0 05 8a 38           ldi16	r1, 0x388a
 ff 0c                 fadd	q3, q0
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 61 0b              ldi16	r6, 0xb61
 c7 36 bb              ldi16	r7, 0xbb36
 ff 0b                 fadd	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 1c                 fsub	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 13                 fsub	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2c                 fmul	q3, q0
 ff 03                 fadd	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 ff 0c                 fadd	q3, q0
 ff 27                 fmul	q1, q3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 1d                 fsub	q3, q1
 f2 30                 sub	r0, r0
 f0 05 00 c0           ldi16	r1, 0xc000
 f2 67                 mov32	q1, q3
 ff 04                 fadd	q1, q0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 31                 fdiv	q0, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 12                 fsub	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 18                 fsub	q2, q0
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 57                 lsl16i	r6, 0x7
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f7 62                 add32	q0, q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f2 6a                 mov32	q3, q0
 f0 69 40              cmp32	q1, q0
 d9 04                 brsge8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xbc0
<L54>:
 f4 32                 ldsp16	r6, [sp+0xc]
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	scalbnf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 62                 fneg	q2
 f0 30 14              ldsp16	r0, [sp+0x14]
 f6 28                 tst16	r0
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x2a7
