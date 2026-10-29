
math_ef_erf.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_erf.c
00000000 l    d  .text.erff	00000000 .text.erff
00000000 l     F .text.avm_erfc_positive_tail	00000056 avm_erfc_positive_tail
00000000 l    d  .text.avm_erfc_positive_tail	00000000 .text.avm_erfc_positive_tail
00000000 l    d  .text.erfcf	00000000 .text.erfcf
00000000 g     F .text.erff	000000e3 erff
00000000         *UND*	00000000 __avm_errno
00000000         *UND*	00000000 __avm_expf_noerrno
00000000 g     F .text.erfcf	0000013d erfcf

Disassembly of section .text.erff:

<erff>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 c6 80 7f              ldi16	r6, 0x7f80
 f5 0e                 cmp	r1, r6
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erff
		R_AVM_FAR24	.text.erff+0xd0
<L0>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erff
		R_AVM_FAR24	.text.erff+0xcb
<L1>:
 aa                    xor	r6, r6
 c7 80 40              ldi16	r7, 0x4080
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erff
		R_AVM_FAR24	.text.erff+0x3f
<L2>:
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 c6 80 3f              ldi16	r6, 0x3f80
 c7 80 bf              ldi16	r7, 0xbf80
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 06                    mov	r5, r6
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	erff
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erff+0xcb
 c6 ff ff              ldi16	r6, 0xffff
 c7 9f 3f              ldi16	r7, 0x3f9f
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erff
		R_AVM_FAR24	.text.erff+0x9e
<L3>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 07 cc fc 82 38 75 0c 43 ba 2e 7c a7 3b 2b 95 db bc b4 0e e7 3d 63 93 c0 be ba 6e 90 3f  fpoly	7, 6.24597014E-5, -7.44051591E-4, 0.00511123892, -0.0268045273, 0.112821013, -0.376124471, 1.12837911
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erff
		R_AVM_FAR24	.text.erff+0xcb
<L4>:
 09                    mov	r6, r5
 c7 80 7f              ldi16	r7, 0x7f80
 8b                    and	r6, r7
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erff
		R_AVM_FAR24	.text.erff+0xcb
<L5>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	erff
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erff+0xcb
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	erff
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_erfc_positive_tail
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d3 04                 brslt8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erff
		R_AVM_FAR24	.text.erff+0xc3
<L6>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 e2 00 00 00           jmpf	erff
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erff+0xcb
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erff
		R_AVM_FAR24	.text.erff+0x2b
<L7>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	erff
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erff+0xc9

Disassembly of section .text.avm_erfc_positive_tail:

<avm_erfc_positive_tail>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 07 4e ab 8a bf 5f 3d 19 40 8d ec d4 bf d1 d1 a9 bd 72 50 84 3e f9 d0 10 3f 2c 6c 10 3f  fpoly	7, -1.0833528, 2.39437079, -1.66346896, -0.0829197242, 0.258426249, 0.56568867, 0.564150572
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 ff 07                 fneg	q3
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 e3 00 00 00           callf	avm_erfc_positive_tail
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_expf_noerrno
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.erfcf:

<erfcf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 08                 fabs	q0
 c6 80 7f              ldi16	r6, 0x7f80
 f5 0e                 cmp	r1, r6
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erfcf
		R_AVM_FAR24	.text.erfcf+0xf4
<L0>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erfcf
		R_AVM_FAR24	.text.erfcf+0x11d
<L1>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 d9 04                 brsge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erfcf
		R_AVM_FAR24	.text.erfcf+0x54
<L2>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 40           ldi16	r3, 0x407f
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erfcf
		R_AVM_FAR24	.text.erfcf+0x54
<L3>:
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 e2 00 00 00           jmpf	erfcf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erfcf+0xeb
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 42                 sub	r2, r2
 f0 07 30 41           ldi16	r3, 0x4130
 f0 69 04              cmp32	q0, q1
 f8 16                 cset.ult	r6
 98                    or	r6, r4
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erfcf
		R_AVM_FAR24	.text.erfcf+0x131
<L4>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 9f 3f              ldi16	r7, 0x3f9f
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erfcf
		R_AVM_FAR24	.text.erfcf+0xba
<L5>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 02                 fmul
 ff 15 07 cc fc 82 38 75 0c 43 ba 2e 7c a7 3b 2b 95 db bc b4 0e e7 3d 63 93 c0 be ba 6e 90 3f  fpoly	7, 6.24597014E-5, -7.44051591E-4, 0.00511123892, -0.0268045273, 0.112821013, -0.376124471, 1.12837911
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e2 00 00 00           jmpf	erfcf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erfcf+0xe7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	erfcf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_erfc_positive_tail
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erfcf
		R_AVM_FAR24	.text.erfcf+0xe3
<L6>:
 03                    mov	r4, r7
 c5 80 7f              ldi16	r5, 0x7f80
 81                    and	r4, r5
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erfcf
		R_AVM_FAR24	.text.erfcf+0xeb
<L7>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	erfcf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erfcf+0xeb
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	erfcf
		R_AVM_FAR24	.text.erfcf+0x125
<L8>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 04 00 40           ldi16	r0, 0x4000
 f2 39                 sub	r1, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 fd 01                 cmov.slt	r0, r1
 f1 2c                 mov	r7, r0
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	erfcf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erfcf+0xeb
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 e2 00 00 00           jmpf	erfcf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erfcf+0xeb
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	erfcf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erfcf+0xe9
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	erfcf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.erfcf+0xeb
