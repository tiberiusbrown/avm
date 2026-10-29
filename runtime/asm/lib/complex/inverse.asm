
complex_inverse.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 inverse.c
00000000 l    d  .text.cacosf	00000000 .text.cacosf
00000000 l     F .text.cx_acos	0000051e cx_acos
00000000 l    d  .text.cx_acos	00000000 .text.cx_acos
00000000 l    d  .text.casinf	00000000 .text.casinf
00000000 l    d  .text.cacoshf	00000000 .text.cacoshf
00000000 l    d  .text.casinhf	00000000 .text.casinhf
00000000 l     F .text.cx_asinh_small	00000146 cx_asinh_small
00000000 l    d  .text.cx_asinh_small	00000000 .text.cx_asinh_small
00000000 l    d  .text.catanhf	00000000 .text.catanhf
00000000 l    d  .text.catanf	00000000 .text.catanf
00000000 g     F .text.cacosf	0000003a cacosf
00000000         *UND*	00000000 fabsf
00000000         *UND*	00000000 acoshf
00000000         *UND*	00000000 copysignf
00000000         *UND*	00000000 sqrtf
00000000         *UND*	00000000 acosf
00000000         *UND*	00000000 fmaxf
00000000         *UND*	00000000 fminf
00000000         *UND*	00000000 logf
00000000         *UND*	00000000 log1pf
00000000         *UND*	00000000 atan2f
00000000 g     F .text.casinf	00000214 casinf
00000000         *UND*	00000000 asinf
00000000 g     F .text.cacoshf	00000052 cacoshf
00000000 g     F .text.casinhf	000002d8 casinhf
00000000         *UND*	00000000 asinhf
00000000 g     F .text.catanhf	0000030c catanhf
00000000         *UND*	00000000 hypotf
00000000         *UND*	00000000 atanhf
00000000 g     F .text.catanf	0000004d catanf

Disassembly of section .text.cacosf:

<cacosf>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f1 04                 mov	r0, r4
 f0 6a ca              ld32	q3, [r5]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 8a              ld32	q2, [r5]
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 14 04              leasp	r4, 0x4
 e3 00 00 00           callf	cacosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos
 d6 04                 adjsp	0x4
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 6b 48              st32	[r4], q1
 f0 6b c0              st32	[r0], q3
 f1 20                 mov	r4, r0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.cx_acos:

<cx_acos>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 da                 adjsp	-0x26
 f4 40                 stsp16	[sp+0x0], r4
 f0 30 31              ldsp16	r0, [sp+0x31]
 f0 31 33              ldsp16	r1, [sp+0x33]
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 66                 mov32	q1, q2
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 c6 00 ff              ldi16	r6, 0xff00
 a2                    xor	r4, r6
 f1 27                 mov	r5, r3
 15                    add	r5, r5
 a6                    xor	r5, r6
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f1 2a                 mov	r6, r2
 99                    or	r6, r5
 f1 24                 mov	r5, r0
 94                    or	r5, r4
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f6 2d                 tst16	r5
 f8 04                 cset.eq	r4
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0xb0
<L0>:
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0xb0
<L1>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x4e5
<L2>:
 f4 81                 lsl16.1	r1
 f9 21                 or	r1, r0
 f6 29                 tst16	r1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x137
<L3>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x1c6
<L4>:
 f2 66                 mov32	q1, q2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	acoshf
 e2 00 00 00           jmpf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos+0x1b1
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 06 00 ff           ldi16	r2, 0xff00
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 ff 06                 fneg	q2
 f4 02                 ldsp16	r6, [sp+0x0]
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f4 81                 lsl16.1	r1
 f9 2a                 xor	r1, r2
 f9 05                 or	r0, r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 3f           ldi16	r3, 0x3f49
 f6 28                 tst16	r0
 fb 32                 cmov.eq	r6, r2
 fb 3b                 cmov.eq	r7, r3
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f4 83                 lsl16.1	r3
 c4 00 ff              ldi16	r4, 0xff00
 f9 72                 xor	r3, r4
 f9 4d                 or	r2, r3
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 f6 2a                 tst16	r2
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f4 6a                 stsp16	[sp+0xa], r6
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f4 2a                 ldsp16	r6, [sp+0xa]
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 69                 mov32	q2, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 14                 fcmp
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 ce 02                 cmpi.s8	r6, 0x2
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 08              st32	[r4], q0
 e2 00 00 00           jmpf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos+0x252
 c6 a9 5f              ldi16	r6, 0x5fa9
 c7 63 58              ldi16	r7, 0x5863
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x1e5
<L5>:
 c6 a9 5f              ldi16	r6, 0x5fa9
 c7 63 58              ldi16	r7, 0x5863
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x1e5
<L6>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x259
<L7>:
 c6 ac c5              ldi16	r6, 0xc5ac
 c7 27 37              ldi16	r7, 0x3727
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x259
<L8>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 14                 fcmp
 f1 16                 mov	r2, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f0 0e 01              cmpi.s8	r2, 0x1
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 0c              st32	[r6], q0
 ff 06                 fneg	q2
 ca 04                 addi.s8	r6, 0x4
 e2 00 00 00           jmpf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos+0x24f
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	acosf
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 ff 04                 fneg	q0
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f0 6b 8e              st32	[r7], q2
 e2 00 00 00           jmpf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos+0x252
 f2 68                 mov32	q2, q0
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fmaxf
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fminf
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	atan2f
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 4c              st32	[r6], q1
 ca 04                 addi.s8	r6, 0x4
 ff 06                 fneg	q2
 f0 6b 8c              st32	[r6], q2
 d6 26                 adjsp	0x26
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 66                 mov32	q1, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f2 69                 mov32	q2, q1
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f2 61                 mov32	q0, q1
 f0 32 12              ldsp16	r2, [sp+0x12]
 f1 1f                 mov	r3, r7
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f6 2c                 tst16	r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x2d4
<L9>:
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ff 00                 fadd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 62                 mov32	q0, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f2 6b                 mov32	q3, q1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x348
<L10>:
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f2 67                 mov32	q1, q3
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 f2 61                 mov32	q0, q1
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x3f2
<L11>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos+0x432
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 ff 00                 fadd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 f2 62                 mov32	q0, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 ff 00                 fadd
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	atan2f
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	log1pf
 f4 81                 lsl16.1	r1
 f9 21                 or	r1, r0
 f6 29                 tst16	r1
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x4d1
<L12>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 62                 mov32	q0, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ff 14                 fcmp
 f2 68                 mov32	q2, q0
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x4d1
<L13>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 ff 01                 fsub
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 f2 62                 mov32	q0, q2
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 ff 03                 fdiv
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e3 00 00 00           callf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 e2 00 00 00           jmpf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos+0x1bb
 f0 33 00              ldsp16	r3, [sp+0x0]
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 15                    add	r5, r5
 94                    or	r5, r4
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cx_acos
		R_AVM_FAR24	.text.cx_acos+0x50d
<L14>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 6b 86              st32	[r3], q2
 f0 0b 04              addi.s8	r3, 0x4
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f0 6b 86              st32	[r3], q2
 e2 00 00 00           jmpf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos+0x252
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f0 6b 86              st32	[r3], q2
 f0 0b 04              addi.s8	r3, 0x4
 f0 6b 86              st32	[r3], q2
 e2 00 00 00           jmpf	cx_acos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos+0x252

Disassembly of section .text.casinf:

<casinf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f4 50                 stsp16	[sp+0x4], r4
 f4 58                 stsp16	[sp+0x6], r4
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a 48              ld32	q1, [r4]
 f0 6a 0a              ld32	q0, [r5]
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d6 fc                 adjsp	-0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 14 10              leasp	r4, 0x10
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos
 d6 04                 adjsp	0x4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f1 23                 mov	r4, r3
 81                    and	r4, r5
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 29                 mov	r6, r1
 89                    and	r6, r5
 39                    cmp	r6, r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinf
		R_AVM_FAR24	.text.casinf+0xe0
<L0>:
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinf
		R_AVM_FAR24	.text.casinf+0xe0
<L1>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinf
		R_AVM_FAR24	.text.casinf+0x9c
<L2>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinf
		R_AVM_FAR24	.text.casinf+0xe0
<L3>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 c6 a9 5f              ldi16	r6, 0x5fa9
 c7 63 58              ldi16	r7, 0x5863
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinf
		R_AVM_FAR24	.text.casinf+0xce
<L4>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 c6 a9 5f              ldi16	r6, 0x5fa9
 c7 63 58              ldi16	r7, 0x5863
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinf
		R_AVM_FAR24	.text.casinf+0x109
<L5>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	atan2f
 e2 00 00 00           jmpf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.casinf+0xf0
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 6b 8c              st32	[r6], q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 06                 fneg	q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f4 18                 ldsp16	r4, [sp+0x6]
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f2 66                 mov32	q1, q2
 f2 61                 mov32	q0, q1
 f4 20                 ldsp16	r4, [sp+0x8]
 07                    mov	r5, r7
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f6 2c                 tst16	r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinf
		R_AVM_FAR24	.text.casinf+0x187
<L6>:
 f2 68                 mov32	q2, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 00                 fadd
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 62                 mov32	q0, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinf
		R_AVM_FAR24	.text.casinf+0x1fc
<L7>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 03                 fdiv
 e3 00 00 00           callf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	asinf
 e2 00 00 00           jmpf	casinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.casinf+0xf0

Disassembly of section .text.cacoshf:

<cacoshf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 50                 stsp16	[sp+0x4], r4
 f0 6a ca              ld32	q3, [r5]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 d6 fc                 adjsp	-0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 14 0a              leasp	r4, 0xa
 e3 00 00 00           callf	cacoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos
 d6 04                 adjsp	0x4
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 e3 00 00 00           callf	cacoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	cacoshf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 13                 ldsp16	r7, [sp+0x4]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 6b 8e              st32	[r7], q2
 03                    mov	r4, r7
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.casinhf:

<casinhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d8                 adjsp	-0x28
 f4 40                 stsp16	[sp+0x0], r4
 f4 48                 stsp16	[sp+0x2], r4
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a 48              ld32	q1, [r4]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f0 6a 0a              ld32	q0, [r5]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x2c
<L0>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	asinhf
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.casinhf+0x1a7
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x4d
<L1>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d9 04                 brsge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x17c
<L2>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 aa                    xor	r6, r6
 c7 00 3e              ldi16	r7, 0x3e00
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x99
<L3>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 aa                    xor	r6, r6
 c7 00 3e              ldi16	r7, 0x3e00
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x99
<L4>:
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 80 3c              ldi16	r7, 0x3c80
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x188
<L5>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 14 10              leasp	r4, 0x10
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_acos
 d6 04                 adjsp	0x4
 c5 80 7f              ldi16	r5, 0x7f80
 f1 23                 mov	r4, r3
 81                    and	r4, r5
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 07                 fneg	q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f1 29                 mov	r6, r1
 89                    and	r6, r5
 39                    cmp	r6, r5
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x15e
<L6>:
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x15e
<L7>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x120
<L8>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x15e
<L9>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 c6 a9 5f              ldi16	r6, 0x5fa9
 c7 63 58              ldi16	r7, 0x5863
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x14c
<L10>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 c6 a9 5f              ldi16	r6, 0x5fa9
 c7 63 58              ldi16	r7, 0x5863
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x1ba
<L11>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	atan2f
 e2 00 00 00           jmpf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.casinhf+0x170
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 66                 mov32	q1, q2
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 e2 00 00 00           jmpf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.casinhf+0x1a7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	asinf
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.casinhf+0x1a7
 d6 fc                 adjsp	-0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 14 24              leasp	r4, 0x24
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cx_asinh_small
 d6 04                 adjsp	0x4
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 08              st32	[r4], q0
 c8 04                 addi.s8	r4, 0x4
 f0 6b 48              st32	[r4], q1
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 28                 adjsp	0x28
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 03                    mov	r4, r7
 10                    add	r4, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 92                    or	r4, r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f6 2c                 tst16	r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x23f
<L12>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 f4 12                 ldsp16	r6, [sp+0x4]
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 03                    mov	r4, r7
 10                    add	r4, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 92                    or	r4, r6
 f6 2c                 tst16	r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	casinhf
		R_AVM_FAR24	.text.casinhf+0x2c2
<L13>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 e3 00 00 00           callf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	asinf
 e2 00 00 00           jmpf	casinhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.casinhf+0x170

Disassembly of section .text.cx_asinh_small:

<cx_asinh_small>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f2 63                 mov32	q0, q3
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 34 21              ldsp16	r4, [sp+0x21]
 f0 35 23              ldsp16	r5, [sp+0x23]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 06 6e db           ldi16	r2, 0xdb6e
 f0 07 36 bd           ldi16	r3, 0xbd36
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 c6 9a 99              ldi16	r6, 0x999a
 c7 99 3d              ldi16	r7, 0x3d99
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a be              ldi16	r7, 0xbe2a
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	cx_asinh_small
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 e3 00 00 00           callf	cx_asinh_small
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f0 37 10              ldsp16	r7, [sp+0x10]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 6b 8e              st32	[r7], q2
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.catanhf:

<catanhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f4 40                 stsp16	[sp+0x0], r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 6a ca              ld32	q3, [r5]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f0 04 00 ff           ldi16	r0, 0xff00
 f9 82                 xor	r4, r0
 07                    mov	r5, r7
 15                    add	r5, r5
 f9 a2                 xor	r5, r0
 f1 06                 mov	r0, r6
 f9 15                 or	r0, r5
 f1 0a                 mov	r1, r2
 f9 31                 or	r1, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fabsf
 f6 29                 tst16	r1
 f8 06                 cset.eq	r6
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0xad
<L0>:
 c3 01                 ldi8	r7, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0xad
<L1>:
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 28                 mov	r6, r0
 f7 8e                 bool	r6
 f1 2d                 mov	r7, r1
 1f                    add	r7, r7
 9e                    or	r7, r6
 f0 06 00 ff           ldi16	r2, 0xff00
 f5 17                 cmp	r2, r7
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0xe7
<L2>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 8e                 bool	r6
 1f                    add	r7, r7
 9e                    or	r7, r6
 f5 17                 cmp	r2, r7
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0xe7
<L3>:
 09                    mov	r6, r5
 1a                    add	r6, r6
 98                    or	r6, r4
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0x118
<L4>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0x1cc
<L5>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 e2 00 00 00           jmpf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catanhf+0x1e0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 62                 mov32	q0, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 02                    mov	r4, r6
 f7 8c                 bool	r4
 07                    mov	r5, r7
 15                    add	r5, r5
 94                    or	r5, r4
 c4 00 ff              ldi16	r4, 0xff00
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0xd9
<L6>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 08              st32	[r4], q0
 c8 04                 addi.s8	r4, 0x4
 f0 6b c8              st32	[r4], q3
 e2 00 00 00           jmpf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catanhf+0x303
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0x106
<L7>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 0c              st32	[r6], q0
 ca 04                 addi.s8	r6, 0x4
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f0 6b 8c              st32	[r6], q2
 e2 00 00 00           jmpf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catanhf+0x303
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 e2 00 00 00           jmpf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catanhf+0x303
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c6 6b 0b              ldi16	r6, 0xb6b
 c7 5e 5d              ldi16	r7, 0x5d5e
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0x1f5
<L8>:
 c6 6b 0b              ldi16	r6, 0xb6b
 c7 5e 5d              ldi16	r7, 0x5d5e
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0x1f5
<L9>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 69                 mov32	q2, q1
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 c6 60 42              ldi16	r6, 0x4260
 c7 a2 0d              ldi16	r7, 0xda2
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0x26f
<L10>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	hypotf
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	hypotf
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	logf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 01                 fsub
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 e2 00 00 00           jmpf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catanhf+0x2ac
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	catanhf
		R_AVM_FAR24	.text.catanhf+0x245
<L11>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	atanhf
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 6b 0c              st32	[r6], q0
 f0 6b 8e              st32	[r7], q2
 e2 00 00 00           jmpf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catanhf+0x303
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	fmaxf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 03                 fdiv
 e2 00 00 00           jmpf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catanhf+0x25d
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 ff 03                 fdiv
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 62                 mov32	q0, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 e2 00 00 00           jmpf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.catanhf+0x2f0
 aa                    xor	r6, r6
 c7 80 40              ldi16	r7, 0x4080
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 03                 fdiv
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	log1pf
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c7 80 3e              ldi16	r7, 0x3e80
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	atan2f
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 e3 00 00 00           callf	catanhf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f0 6b 0e              st32	[r7], q0
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.catanf:

<catanf>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 f1 04                 mov	r0, r4
 f0 6a ca              ld32	q3, [r5]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 8a              ld32	q2, [r5]
 ff 06                 fneg	q2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 14 10              leasp	r4, 0x10
 f0 15 08              leasp	r5, 0x8
 e3 00 00 00           callf	catanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	catanhf
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 07                 fneg	q3
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 f0 6b c8              st32	[r4], q3
 f0 6b 40              st32	[r0], q1
 f1 20                 mov	r4, r0
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
