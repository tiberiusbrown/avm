
math_ef_pow.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_pow.c
00000000 l    d  .text.powf	00000000 .text.powf
00000000 g     F .text.powf	00000b03 powf
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
		R_AVM_FAR24	.text.powf+0x518
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
		R_AVM_FAR24	.text.powf+0x518
<L6>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 06                 fadd	q1, q2
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x518
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
		R_AVM_FAR24	.text.powf+0x518
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
		R_AVM_FAR24	.text.powf+0x514
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
		R_AVM_FAR24	.text.powf+0x514
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
		R_AVM_FAR24	.text.powf+0x514
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
		R_AVM_FAR24	.text.powf+0x514
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
		R_AVM_FAR24	.text.powf+0x518
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
		R_AVM_FAR24	.text.powf+0x514
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
		R_AVM_FAR24	.text.powf+0x518
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
		R_AVM_FAR24	.text.powf+0x3ec
<L29>:
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x3ec
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
 c5 80 3d              ldi16	r5, 0x3d80
 f2 6a                 mov32	q3, q0
 ff 67                 fabs	q3
 ff c8 4e              fcmp	r4, q3, q2
 f4 40                 stsp16	[sp+0x0], r4
 f1 23                 mov	r4, r3
 fa 77                 lsr16i	r4, 0x7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 ca 81                 addi.s8	r6, -0x7f
 f0 3e 18              stsp16	[sp+0x18], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d9 04                 brsge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x4c9
<L31>:
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 ff 0b                 fadd	q2, q3
 f2 64                 mov32	q1, q0
 ff 36                 fdiv	q1, q2
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 ff 25                 fmul	q1, q1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ff 25                 fmul	q1, q1
 f2 69                 mov32	q2, q1
 ff ca 04 97 88 17 3e 25 33 3a 3e 25 49 92 3e ab aa 2a 3f      fpoly	4, 0.147981986, 0.181835726, 0.285714298, 0.666666686
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2e                 fmul	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 69                 mov32	q2, q1
 ff ca 03 4f d0 1c 3e 29 8e 63 3e cd cc cc 3e  fpoly	3, 0.153138384, 0.222221985, 0.400000006
 ff 26                 fmul	q1, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 ff 09                 fadd	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0b                 fadd	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2e                 fmul	q3, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 1e                 fsub	q3, q2
 ff 03                 fadd	q0, q3
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x4ea
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x470
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
		R_AVM_FAR24	.text.powf+0x470
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
		R_AVM_FAR24	.text.powf+0x523
<L34>:
 c0 01                 ldi8	r4, 0x1
 c5 00 4d              ldi16	r5, 0x4d00
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x52b
<L35>:
 c4 f3 ff              ldi16	r4, 0xfff3
 c5 7f 3f              ldi16	r5, 0x3f7f
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 8c              cmp32	q2, q3
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d8 04                 bruge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x5b3
<L36>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x518
<L37>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x514
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
		R_AVM_FAR24	.text.powf+0x523
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
 f2 68                 mov32	q2, q0
 ff ca 05 ab aa 2a 3e cd cc 4c be 00 00 80 3e ab aa aa be 00 00 00 3f  fpoly	5, 0.166666672, -0.200000003, 0.25, -0.333333343, 0.5
 f2 6a                 mov32	q3, q0
 ff 2f                 fmul	q3, q3
 ff 2e                 fmul	q3, q2
 ff 13                 fsub	q0, q3
 f0 34 18              ldsp16	r4, [sp+0x18]
 ff c0 42              s16tof	q2, r4
 f0 06 80 71           ldi16	r2, 0x7180
 f0 07 31 3f           ldi16	r3, 0x3f31
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 37           ldi16	r3, 0x3717
 ff 29                 fmul	q2, q1
 ff 08                 fadd	q2, q0
 ff 0e                 fadd	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 2b                 fmul	q2, q3
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
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 69 48              cmp32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d8 04                 bruge8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x55f
<L41>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 2b                 fmul	q2, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c6 e8 ff              ldi16	r6, 0xffe8
 c7 ff ff              ldi16	r7, 0xffff
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 fa d7                 asr16i	r6, 0x7
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f7 6c                 add32	q3, q0
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
 f7 6b                 add32	q2, q3
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 00 01              ldi8	r0, 0x1
 aa                    xor	r6, r6
 c7 40 20              ldi16	r7, 0x2040
 c4 72 c4              ldi16	r4, 0xc472
 c1 1c                 ldi8	r5, 0x1c
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x5d4
<L42>:
 f0 38 04              stsp16	[sp+0x4], r0
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x68c
 c0 08                 ldi8	r4, 0x8
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x601
<L43>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x518
<L44>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x514
 c4 d7 b3              ldi16	r4, 0xb3d7
 c1 5d                 ldi8	r5, 0x5d
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x65e
<L45>:
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f4 50                 stsp16	[sp+0x4], r4
 c5 60 20              ldi16	r5, 0x2060
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x692
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
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x86a
 f0 38 04              stsp16	[sp+0x4], r0
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 05 00 3f           ldi16	r1, 0x3f00
 f9 2d                 or	r1, r3
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f7 6b                 add32	q2, q3
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 c6 00 c0              ldi16	r6, 0xc000
 c7 15 3f              ldi16	r7, 0x3f15
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 c6 dc cf              ldi16	r6, 0xcfdc
 c7 d1 35              ldi16	r7, 0x35d1
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 32 34              ldsp16	r2, [sp+0x34]
 f0 33 36              ldsp16	r3, [sp+0x36]
 f2 69                 mov32	q2, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 0b                 fadd	q2, q3
 ff 32                 fdiv	q0, q2
 f2 6a                 mov32	q3, q0
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 11                 fsub	q0, q1
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 ff 23                 fmul	q0, q3
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
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
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 28              stsp16	[sp+0x28], r0
 f0 39 2a              stsp16	[sp+0x2a], r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 f0 30 30              ldsp16	r0, [sp+0x30]
 f0 31 32              ldsp16	r1, [sp+0x32]
 ff 12                 fsub	q0, q2
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 ff 17                 fsub	q1, q3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 06                 fadd	q1, q2
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 ff 24                 fmul	q1, q0
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 32              ldsp16	r5, [sp+0x32]
 ff 19                 fsub	q2, q1
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 2e                 fmul	q3, q2
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
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
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
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
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 0d                 fadd	q3, q1
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 00 40              ldi16	r6, 0x4000
 c7 76 3f              ldi16	r7, 0x3f76
 ff 2b                 fmul	q2, q3
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff c4 03              s32tof	q0, q3
 f2 66                 mov32	q1, q2
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 07                 fadd	q1, q3
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 0d                 fadd	q3, q1
 ff 0c                 fadd	q3, q0
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f2 67                 mov32	q1, q3
 ff 14                 fsub	q1, q0
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 ff 14                 fsub	q1, q0
 ff 19                 fsub	q2, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 02                 fadd	q0, q2
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 66                 mov32	q1, q2
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 24                 fmul	q1, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 18                 fsub	q2, q0
 ff 2b                 fmul	q2, q3
 ff 06                 fadd	q1, q2
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
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
 d9 04                 brsge8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x907
<L46>:
 c0 01                 ldi8	r4, 0x1
 c5 00 43              ldi16	r5, 0x4300
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x945
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
		R_AVM_FAR24	.text.powf+0x514
 c0 01                 ldi8	r4, 0x1
 c5 16 43              ldi16	r5, 0x4316
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x93b
<L48>:
 f2 6b                 mov32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 18                 fsub	q2, q0
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff c8 46              fcmp	r4, q1, q2
 cc 01                 cmpi.s8	r4, 0x1
 d3 04                 brslt8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x993
<L49>:
 a0                    xor	r4, r4
 c5 16 43              ldi16	r5, 0x4316
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x993
<L50>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0xaf6
 f2 6b                 mov32	q3, q1
 a0                    xor	r4, r4
 c5 00 43              ldi16	r5, 0x4300
 f0 69 c8              cmp32	q3, q2
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d0 04                 breq8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x993
<L51>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 18                 fsub	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 3c aa              ldi16	r4, 0xaa3c
 c5 38 33              ldi16	r5, 0x3338
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff c8 4e              fcmp	r4, q3, q2
 cc 01                 cmpi.s8	r4, 0x1
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 d1 04                 brne8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x8f2
<L52>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x9a3
 c0 01                 ldi8	r4, 0x1
 c5 00 3f              ldi16	r5, 0x3f00
 f0 69 c8              cmp32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 d8 04                 bruge8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xa33
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
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
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
		R_AVM_FAR24	.text.powf+0xa3f
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
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
 f0 34 10              ldsp16	r4, [sp+0x10]
 fa 37                 lsl16i	r4, 0x7
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f7 6d                 add32	q3, q1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 69 0c              cmp32	q0, q3
 d9 04                 brsge8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xaf2
<L54>:
 f2 69                 mov32	q2, q1
 f0 36 10              ldsp16	r6, [sp+0x10]
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	scalbnf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 63                 fneg	q3
 f0 30 14              ldsp16	r0, [sp+0x14]
 f6 28                 tst16	r0
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x514
