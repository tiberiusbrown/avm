
complex_sqrt.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sqrt.c
00000000 l    d  .text.csqrtf	00000000 .text.csqrtf
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.csqrtf	00000247 csqrtf
00000000         *UND*	00000000 fabsf
00000000         *UND*	00000000 sqrtf
00000000         *UND*	00000000 copysignf
00000000         *UND*	00000000 hypotf

Disassembly of section .text.csqrtf:

<csqrtf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f4 48                 stsp16	[sp+0x2], r4
 f4 40                 stsp16	[sp+0x0], r4
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a c8              ld32	q3, [r4]
 f2 67                 mov32	q1, q3
 03                    mov	r4, r7
 10                    add	r4, r4
 f0 04 00 ff           ldi16	r0, 0xff00
 f9 82                 xor	r4, r0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 98                    or	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 6a 0a              ld32	q0, [r5]
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0x56
<L0>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e2 00 00 00           jmpf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csqrtf+0x20c
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 c6 00 ff              ldi16	r6, 0xff00
 a2                    xor	r4, r6
 f1 24                 mov	r5, r0
 94                    or	r5, r4
 f6 2d                 tst16	r5
 02                    mov	r4, r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0x8f
<L1>:
 f1 14                 mov	r2, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0xd5
<L2>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 f5 15                 cmp	r2, r5
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0x4e
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csqrtf+0xef
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0x23d
<L4>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 15                    add	r5, r5
 94                    or	r5, r4
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0xfd
<L5>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0x164
<L6>:
 ff 04                 fneg	q0
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csqrtf+0x20c
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f5 15                 cmp	r2, r5
 fc 46                 cmov.uge	r0, r6
 fc 4f                 cmov.uge	r1, r7
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csqrtf+0x20c
 c6 c2 bd              ldi16	r6, 0xbdc2
 c7 f0 7c              ldi16	r7, 0x7cf0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0x172
<L7>:
 c6 c2 bd              ldi16	r6, 0xbdc2
 c7 f0 7c              ldi16	r7, 0x7cf0
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0x172
<L8>:
 c6 60 42              ldi16	r6, 0x4260
 c7 a2 0d              ldi16	r7, 0xda2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0x22d
<L9>:
 f2 69                 mov32	q2, q1
 f2 64                 mov32	q1, q0
 c6 60 42              ldi16	r6, 0x4260
 c7 a2 0d              ldi16	r7, 0xda2
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	csqrtf
		R_AVM_FAR24	.text.csqrtf+0x21f
<L10>:
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 c7 80 39              ldi16	r7, 0x3980
 e2 00 00 00           jmpf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csqrtf+0x189
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csqrtf+0x4e
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 64                 mov32	q1, q0
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 c7 00 40              ldi16	r7, 0x4000
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 69                 mov32	q2, q1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	hypotf
 2a                    sub	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 63                 mov32	q0, q3
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 f1 16                 mov	r2, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 0e 02              cmpi.s8	r2, 0x2
 f2 64                 mov32	q1, q0
 fc 56                 cmov.uge	r2, r6
 fc 5f                 cmov.uge	r3, r7
 fc 70                 cmov.uge	r6, r0
 fc 79                 cmov.uge	r7, r1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e3 00 00 00           callf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f2 62                 mov32	q0, q2
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 6b 08              st32	[r4], q0
 c8 04                 addi.s8	r4, 0x4
 f0 6b c8              st32	[r4], q3
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 e2 00 00 00           jmpf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csqrtf+0x189
 f2 64                 mov32	q1, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 e2 00 00 00           jmpf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csqrtf+0x189
 2a                    sub	r6, r6
 c7 c0 7f              ldi16	r7, 0x7fc0
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	csqrtf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.csqrtf+0x20c
