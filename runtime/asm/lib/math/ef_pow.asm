
math_ef_pow.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_pow.c
00000000 l    d  .text.powf	00000000 .text.powf
00000000 l     F .text.avm_pow_boundary	00000969 avm_pow_boundary
00000000 l    d  .text.avm_pow_boundary	00000000 .text.avm_pow_boundary
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.powf	000006c0 powf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.powf:

<powf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x96
<L0>:
 03                    mov	r4, r7
 f0 07 7f 7f           ldi16	r3, 0x7f7f
 f5 19                 cmp	r3, r1
 c5 80 7f              ldi16	r5, 0x7f80
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x58e
<L1>:
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x58e
<L2>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 3f           ldi16	r3, 0x3f7f
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0xc8
<L3>:
 f2 42                 sub	r2, r2
 f0 07 80 bf           ldi16	r3, 0xbf80
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x127
<L4>:
 f2 42                 sub	r2, r2
 f0 07 00 3f           ldi16	r3, 0x3f00
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x102
<L5>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1ac
<L6>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 16                 fsqrt
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x656
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x652
<L7>:
 f2 30                 sub	r0, r0
 f0 01 40              ldi8	r1, 0x40
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x652
<L8>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x656
 f2 42                 sub	r2, r2
 f0 07 00 40           ldi16	r3, 0x4000
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x168
<L9>:
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x102
<L10>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6c                 add32	q3, q0
 f0 04 fe ff           ldi16	r0, 0xfffe
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1a2
<L11>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x65a
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 48              cmp32	q1, q2
 d9 04                 brsge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1c6
<L12>:
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x1b1
 f1 15                 mov	r2, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x665
<L13>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 03                 fdiv
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x65a
<L14>:
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 c7 80 80              ldi16	r7, 0x8080
 1e                    add	r7, r6
 c6 ff 80              ldi16	r6, 0x80ff
 3b                    cmp	r6, r7
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1a2
<L15>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x65a
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 64                 add32	q1, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 fe ff              ldi16	r6, 0xfffe
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x65a
<L16>:
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 c7 80 7f              ldi16	r7, 0x7f80
 8b                    and	r6, r7
 c7 80 80              ldi16	r7, 0x8080
 1e                    add	r7, r6
 c6 ff 80              ldi16	r6, 0x80ff
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x65a
<L17>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x65a
 c2 01                 ldi8	r6, 0x1
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 4b           ldi16	r3, 0x4b7f
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x240
<L18>:
 c2 01                 ldi8	r6, 0x1
 f4 62                 stsp16	[sp+0x8], r6
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x1f8
<L19>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x219
<L20>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d3 04                 brslt8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x67b
<L21>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f2 68                 mov32	q2, q0
 ff 06                 fneg	q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x656
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x685
<L22>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x29a
<L23>:
 c4 80 bf              ldi16	r4, 0xbf80
 c5 80 3f              ldi16	r5, 0x3f80
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 fb 65                 cmov.ne	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x656
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2ef
<L24>:
 f4 20                 ldsp16	r4, [sp+0x8]
 fa 77                 lsr16i	r4, 0x7
 c1 86                 ldi8	r5, 0x86
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x320
<L25>:
 0c                    mov	r7, r4
 c0 01                 ldi8	r4, 0x1
 f2 4b                 sub	r3, r3
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x577
<L26>:
 27                    sub	r5, r7
 f0 02 7f              ldi8	r2, 0x7f
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 07                    mov	r5, r7
 f9 50                 and	r2, r4
 02                    mov	r4, r6
 c3 80                 ldi8	r7, 0x80
 f9 e9                 or	r7, r2
 c6 ff ff              ldi16	r6, 0xffff
 f4 61                 stsp16	[sp+0x8], r5
 fa 09                 shl16v	r6, r5
 c5 ff ff              ldi16	r5, 0xffff
 a9                    xor	r6, r5
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x577
<L27>:
 f4 20                 ldsp16	r4, [sp+0x8]
 fa 1c                 lsr16v	r7, r4
 f0 03 01              ldi8	r3, 0x1
 f9 7c                 and	r3, r7
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x576
 a0                    xor	r4, r4
 c5 90 c0              ldi16	r5, 0xc090
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c3 20                 ldi8	r7, 0x20
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x2f7
<L28>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 15 07 25 49 12 3e ab aa 2a be cd cc 4c 3e 00 00 80 be ab aa aa 3e 00 00 00 bf 00 00 80 3f  fpoly	7, 0.142857149, -0.166666672, 0.200000003, -0.25, 0.333333343, -0.5, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x40c
 c0 01                 ldi8	r4, 0x1
 f4 60                 stsp16	[sp+0x8], r4
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x1cb
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x341
<L29>:
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 68 ff              ldi16	r4, 0xff68
 f0 3c 10              stsp16	[sp+0x10], r4
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x34d
 c1 96                 ldi8	r5, 0x96
 24                    sub	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 02                    mov	r4, r6
 f4 21                 ldsp16	r5, [sp+0x8]
 c6 ff ff              ldi16	r6, 0xffff
 0e                    mov	r7, r6
 fa 0d                 shl16v	r7, r5
 ae                    xor	r7, r6
 08                    mov	r6, r4
 8c                    and	r7, r4
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x56f
<L30>:
 c0 01                 ldi8	r4, 0x1
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x577
 c4 81 ff              ldi16	r4, 0xff81
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 88                    and	r6, r4
 8d                    and	r7, r5
 c4 20 fb              ldi16	r4, 0xfb20
 c1 4a                 ldi8	r5, 0x4a
 f7 6b                 add32	q2, q3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c0 80                 ldi8	r4, 0x80
 f0 32 14              ldsp16	r2, [sp+0x14]
 f1 1d                 mov	r3, r5
 f9 8c                 and	r4, r3
 9c                    or	r7, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f0 34 10              ldsp16	r4, [sp+0x10]
 18                    add	r6, r4
 f2 69                 mov32	q2, q1
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 ff 0c                 s16tof
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 01                 ldi8	r4, 0x1
 c5 00 41              ldi16	r5, 0x4100
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x3d3
<L31>:
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f2 69                 mov32	q2, q1
 ff 15 08 23 54 19 be 0a 5e 71 3e 47 48 7e be 78 e0 92 3e 74 74 b8 be 9c 3c f6 3e 8e aa 38 bf 3a aa b8 3f      fpoly	8, -0.149735019, 0.235710293, -0.248322591, 0.286868811, -0.360263467, 0.480931163, -0.721352458, 1.4426949
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x3fa
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f2 69                 mov32	q2, q1
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c4 00 04              ldi16	r4, 0x400
 c5 00 bd              ldi16	r5, 0xbd00
 f7 69                 add32	q2, q1
 c6 01 06              ldi16	r6, 0x601
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x4b2
<L32>:
 c4 00 02              ldi16	r4, 0x200
 c5 ea bc              ldi16	r5, 0xbcea
 f7 66                 add32	q1, q2
 c4 00 04              ldi16	r4, 0x400
 a5                    xor	r5, r5
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x4b2
<L33>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 21                 mov	r4, r1
 c5 00 43              ldi16	r5, 0x4300
 31                    cmp	r4, r5
 d3 04                 brslt8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x698
<L34>:
 c5 16 c3              ldi16	r5, 0xc316
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x6a8
<L35>:
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 a5                    xor	r5, r5
 c6 00 3f              ldi16	r6, 0x3f00
 c7 00 bf              ldi16	r7, 0xbf00
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 ff 0e                 ftos16
 f4 50                 stsp16	[sp+0x4], r4
 ff 0c                 s16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f4 13                 ldsp16	r7, [sp+0x4]
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 cf 83                 cmpi.s8	r7, -0x7d
 d9 04                 brsge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x511
<L36>:
 fa 67                 lsl16i	r7, 0x7
 f1 0f                 mov	r1, r7
 f2 30                 sub	r0, r0
 f7 62                 add32	q0, q2
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x209
 d6 f8                 adjsp	-0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 14 24              leasp	r4, 0x24
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_pow_boundary
 d6 08                 adjsp	0x8
 aa                    xor	r6, r6
 c7 00 43              ldi16	r7, 0x4300
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x545
<L37>:
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 b3              ldi16	r7, 0xb338
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 ff 14                 fcmp
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 ce 02                 cmpi.s8	r6, 0x2
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 c4 ff 7f              ldi16	r4, 0x7fff
 f9 84                 and	r4, r1
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x209
<L38>:
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x53b
 fa 67                 lsl16i	r7, 0x7
 c6 00 32              ldi16	r6, 0x3200
 1b                    add	r6, r7
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f7 62                 add32	q0, q2
 aa                    xor	r6, r6
 c7 80 0d              ldi16	r7, 0xd80
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 c5 80 7f              ldi16	r5, 0x7f80
 81                    and	r4, r5
 c5 80 80              ldi16	r5, 0x8080
 14                    add	r5, r4
 c4 ff 80              ldi16	r4, 0x80ff
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x209
<L39>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x209
 aa                    xor	r6, r6
 c7 16 c3              ldi16	r7, 0xc316
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x586
<L40>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 f8 04                 cset.eq	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x209
 fa 19                 lsr16v	r6, r5
 f0 03 01              ldi8	r3, 0x1
 f9 78                 and	r3, r6
 a0                    xor	r4, r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f9 78                 and	r3, r6
 f4 a3                 tst8	r3
 f8 06                 cset.eq	r6
 f4 62                 stsp16	[sp+0x8], r6
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x1cb
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x448
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 4c              cmp32	q1, q3
 f8 15                 cset.ult	r5
 f4 71                 stsp16	[sp+0xc], r5
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x610
<L41>:
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x610
<L42>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 c5 80 7f              ldi16	r5, 0x7f80
 d0 04                 breq8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x42
<L43>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d0 04                 breq8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x5e4
<L44>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 d3 04                 brslt8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x6b6
<L45>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x65a
<L46>:
 03                    mov	r4, r7
 fa 7f                 lsr16i	r4, 0xf
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 c0              cmp32	q3, q0
 f8 15                 cset.ult	r5
 34                    cmp	r5, r4
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x675
<L47>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x656
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 80              cmp32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d0 04                 breq8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x648
<L48>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 42                 xor	r2, r0
 f0 01 40              ldi8	r1, 0x40
 f9 3c                 and	r1, r7
 f1 21                 mov	r4, r1
 fa 76                 lsr16i	r4, 0x6
 f9 89                 or	r4, r2
 f0 00 01              ldi8	r0, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d0 04                 breq8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	powf
		R_AVM_FAR24	.text.powf+0x652
<L49>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x656
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 03                 fdiv
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x656
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x656
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x1f8
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 c6 c0 7f              ldi16	r6, 0x7fc0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 99                    or	r6, r5
 06                    mov	r5, r6
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x656
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x209
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x209
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	powf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.powf+0x5f5

Disassembly of section .text.avm_pow_boundary:

<avm_pow_boundary>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 be                 adjsp	-0x42
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 34 51              ldsp16	r4, [sp+0x51]
 f0 35 53              ldsp16	r5, [sp+0x53]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 30 4d              ldsp16	r0, [sp+0x4d]
 f0 31 4f              ldsp16	r1, [sp+0x4f]
 f2 68                 mov32	q2, q0
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_pow_boundary
		R_AVM_FAR24	.text.avm_pow_boundary+0x119
<L0>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_pow_boundary
		R_AVM_FAR24	.text.avm_pow_boundary+0x119
<L1>:
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 c8 81                 addi.s8	r4, -0x7f
 ff 0c                 s16tof
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c7 00 80              ldi16	r7, 0x8000
 f1 05                 mov	r0, r5
 f9 1c                 and	r0, r7
 aa                    xor	r6, r6
 f5 06                 cmp	r0, r6
 fb 77                 cmov.ne	r6, r7
 f4 62                 stsp16	[sp+0x8], r6
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 f2 64                 mov32	q1, q0
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 ff 01                 fsub
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 32 3c              ldsp16	r2, [sp+0x3c]
 f0 6b 84              st32	[r2], q2
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 e2 00 00 00           jmpf	avm_pow_boundary
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_pow_boundary+0x954
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_pow_boundary
		R_AVM_FAR24	.text.avm_pow_boundary+0x148
<L2>:
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 f0 3e 10              stsp16	[sp+0x10], r6
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	avm_pow_boundary
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_pow_boundary+0x153
 c6 81 ff              ldi16	r6, 0xff81
 f0 3e 10              stsp16	[sp+0x10], r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 66                 add32	q1, q2
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 97                    or	r5, r7
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 12                    add	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 c5 80 bf              ldi16	r5, 0xbf80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 01                 fsub
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f1 23                 mov	r4, r3
 fa 77                 lsr16i	r4, 0x7
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f2 6b                 mov32	q3, q1
 f2 61                 mov32	q0, q1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 01                 fsub
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 03                 fdiv
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 ff 15 06 f1 f0 70 3d 89 88 88 3d d9 89 9d 3d 8c 2e ba 3d 39 8e e3 3d 25 49 12 3e      fpoly	6, 0.0588235296, 0.0666666701, 0.0769230798, 0.0909090936, 0.111111112, 0.142857149
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c 3e              ldi16	r7, 0x3e4c
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 01                 fsub
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c 3e              ldi16	r7, 0x3e4c
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c b1              ldi16	r7, 0xb14c
 ff 00                 fadd
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f2 6b                 mov32	q3, q1
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 3a 3e              stsp16	[sp+0x3e], r2
 f0 3b 40              stsp16	[sp+0x40], r3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f2 68                 mov32	q2, q0
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f2 63                 mov32	q0, q3
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f2 64                 mov32	q1, q0
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 68                 mov32	q2, q0
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 00                 fadd
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 00                 fadd
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f2 68                 mov32	q2, q0
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 f0 35 40              ldsp16	r5, [sp+0x40]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f2 69                 mov32	q2, q1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 aa be           ldi16	r1, 0xbeaa
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 00                 fadd
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a b2              ldi16	r7, 0xb22a
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f2 69                 mov32	q2, q1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 01                 fsub
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 64                 mov32	q1, q0
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 68                 mov32	q2, q0
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 c6 00 a0              ldi16	r6, 0xa000
 ff 02                 fmul
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 69                 mov32	q2, q1
 c6 00 b0              ldi16	r6, 0xb000
 c7 23 3a              ldi16	r7, 0x3a23
 ff 02                 fmul
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 c6 00 a0              ldi16	r6, 0xa000
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 c6 00 b0              ldi16	r6, 0xb000
 c7 23 3a              ldi16	r7, 0x3a23
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 c6 60 70              ldi16	r6, 0x7060
 c7 25 33              ldi16	r7, 0x3325
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 34 38              ldsp16	r4, [sp+0x38]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 32 3c              ldsp16	r2, [sp+0x3c]
 f0 6b 84              st32	[r2], q2
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 0a 04              addi.s8	r2, 0x4
 f0 6b 84              st32	[r2], q2
 d6 42                 adjsp	0x42
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
