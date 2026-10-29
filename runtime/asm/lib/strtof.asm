
strtof.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    d  .text.strtof	00000000 .text.strtof
00000000 l     O .rodata.str1.1	00000028 decimal_overflows.threshold
00000000 l     O .rodata.decimal_value.powers	00000018 decimal_value.powers
00000000 l    d  .text.strtod	00000000 .text.strtod
00000000 l    d  .text.strtold	00000000 .text.strtold
00000000 l    d  .rodata.decimal_value.powers	00000000 .rodata.decimal_value.powers
00000000 l    d  .rodata.str1.1	00000000 .rodata.str1.1
00000000 g     F .text.strtof	0000086e strtof
00000000         *UND*	00000000 isspace
00000000         *UND*	00000000 isalnum
00000000         *UND*	00000000 __avm_mulsi3
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_lshrsi3
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.strtod	00000004 strtod
00000000 g     F .text.strtold	00000004 strtold

Disassembly of section .text.strtof:

<strtof>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f1 0c                 mov	r1, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x12
<L0>:
 f5 55                 st16	[r5], r1
 f0 3d 16              stsp16	[sp+0x16], r5
 f1 01                 mov	r0, r1
 f0 6c 83              ld8u	r4, [r1+]
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x15
<L1>:
 ed 80 20              ld8u	r4, [r0+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x39
<L2>:
 cc 2d                 cmpi.s8	r4, 0x2d
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x5b
<L3>:
 a5                    xor	r5, r5
 c6 00 80              ldi16	r6, 0x8000
 cc 2d                 cmpi.s8	r4, 0x2d
 fb 2e                 cmov.eq	r5, r6
 f0 39 1c              stsp16	[sp+0x1c], r1
 ed 82 20              ld8u	r4, [r1+0]
 f1 1d                 mov	r3, r5
 f2 42                 sub	r2, r2
 c2 20                 ldi8	r6, 0x20
 04                    mov	r5, r4
 96                    or	r5, r6
 cd 6e                 cmpi.s8	r5, 0x6e
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xf2
<L4>:
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x6e
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 38 1c              stsp16	[sp+0x1c], r0
 c2 20                 ldi8	r6, 0x20
 04                    mov	r5, r4
 96                    or	r5, r6
 cd 6e                 cmpi.s8	r5, 0x6e
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xf2
<L5>:
 cd 69                 cmpi.s8	r5, 0x69
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x16d
<L6>:
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 ed ca 21              ld8u	r6, [r5+1]
 c1 df                 ldi8	r5, 0xdf
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x16d
<L7>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 ed cc 22              ld8u	r6, [r6+2]
 89                    and	r6, r5
 ce 46                 cmpi.s8	r6, 0x46
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x16d
<L8>:
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 ed ce 23              ld8u	r6, [r7+3]
 89                    and	r6, r5
 03                    mov	r4, r7
 c8 03                 addi.s8	r4, 0x3
 ce 49                 cmpi.s8	r6, 0x49
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xdb
<L9>:
 ed ce 24              ld8u	r6, [r7+4]
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xdb
<L10>:
 ed ce 25              ld8u	r6, [r7+5]
 89                    and	r6, r5
 ce 49                 cmpi.s8	r6, 0x49
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xdb
<L11>:
 ed ce 26              ld8u	r6, [r7+6]
 89                    and	r6, r5
 ce 54                 cmpi.s8	r6, 0x54
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xdb
<L12>:
 ed ce 27              ld8u	r6, [r7+7]
 89                    and	r6, r5
 ce 59                 cmpi.s8	r6, 0x59
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xdb
<L13>:
 cb 08                 addi.s8	r7, 0x8
 03                    mov	r4, r7
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xe7
<L14>:
 74                    st16	[r5], r4
 c4 80 7f              ldi16	r4, 0x7f80
 f9 8d                 or	r4, r3
 04                    mov	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7dd
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 ed ca 21              ld8u	r6, [r5+1]
 c1 df                 ldi8	r5, 0xdf
 89                    and	r6, r5
 ce 41                 cmpi.s8	r6, 0x41
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x16d
<L15>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 ed cc 22              ld8u	r6, [r6+2]
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x16d
<L16>:
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f1 01                 mov	r0, r1
 f0 08 03              addi.s8	r0, 0x3
 ed 82 23              ld8u	r4, [r1+3]
 cc 28                 cmpi.s8	r4, 0x28
 f0 34 16              ldsp16	r4, [sp+0x16]
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x156
<L17>:
 f0 09 05              addi.s8	r1, 0x5
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x131
 f4 a9                 inc16	r1
 ed 82 1f              ld8u	r4, [r1-1]
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isalnum
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x12f
<L18>:
 ed 82 1f              ld8u	r4, [r1-1]
 cc 5f                 cmpi.s8	r4, 0x5f
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x12f
<L19>:
 cc 29                 cmpi.s8	r4, 0x29
 f0 34 16              ldsp16	r4, [sp+0x16]
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x158
<L20>:
 f1 08                 mov	r1, r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x162
<L21>:
 f5 51                 st16	[r4], r1
 c4 c0 7f              ldi16	r4, 0x7fc0
 f9 8d                 or	r4, r3
 04                    mov	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7dd
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 c1 01                 ldi8	r5, 0x1
 f4 51                 stsp16	[sp+0x4], r5
 c1 09                 ldi8	r5, 0x9
 f4 69                 stsp16	[sp+0xa], r5
 cc 30                 cmpi.s8	r4, 0x30
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x1f2
<L22>:
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 ed 84 21              ld8u	r4, [r2+1]
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 cc 78                 cmpi.s8	r4, 0x78
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x1f9
<L23>:
 ed 84 22              ld8u	r4, [r2+2]
 c1 02                 ldi8	r5, 0x2
 c2 03                 ldi8	r6, 0x3
 cc 2e                 cmpi.s8	r4, 0x2e
 fb 2e                 cmov.eq	r5, r6
 f2 26                 add	r5, r2
 41                    ld8u	r4, [r5]
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 d8 04                 bruge8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x1d1
<L24>:
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 06                 cmpi.s8	r4, 0x6
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 d2 04                 brult8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x1fb
<L25>:
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 09 02              addi.s8	r1, 0x2
 c0 10                 ldi8	r4, 0x10
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c0 04                 ldi8	r4, 0x4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 c0 08                 ldi8	r4, 0x8
 f4 68                 stsp16	[sp+0xa], r4
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x1fb
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x1fb
 f1 0a                 mov	r1, r2
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 09 02              addi.s8	r1, 0x2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f1 1c                 mov	r3, r4
 f1 14                 mov	r2, r4
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f4 70                 stsp16	[sp+0xc], r4
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x217
 f0 02 01              ldi8	r2, 0x1
 f4 a9                 inc16	r1
 ed 82 1e              ld8u	r4, [r1-2]
 cc 2e                 cmpi.s8	r4, 0x2e
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x22a
<L26>:
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x212
<L27>:
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d2 04                 brult8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x251
<L28>:
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2d                 cset.sge	r5
 f6 28                 tst16	r0
 d9 04                 brsge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x304
<L29>:
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x271
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 96                    or	r5, r6
 09                    mov	r6, r5
 ca a9                 addi.s8	r6, -0x57
 c9 9f                 addi.s8	r5, -0x61
 f1 75                 zext8	r5
 f0 04 ff ff           ldi16	r0, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 06                 cmov.ult	r0, r6
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2d                 cset.sge	r5
 f6 28                 tst16	r0
 d9 04                 brsge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x304
<L30>:
 f4 12                 ldsp16	r6, [sp+0x4]
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x304
<L31>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3a 18              stsp16	[sp+0x18], r2
 f6 2a                 tst16	r2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f7 77                 sub32	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 03 01              ldi8	r3, 0x1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x2bb
<L32>:
 f6 28                 tst16	r0
 d0 04                 breq8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x2bb
<L33>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x2fb
 f1 11                 mov	r2, r1
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f4 28                 ldsp16	r4, [sp+0xa]
 f5 0c                 cmp	r1, r4
 d3 04                 brslt8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x2e3
<L34>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 a9                 inc16	r1
 f0 39 1e              stsp16	[sp+0x1e], r1
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x2f9
 f4 30                 ldsp16	r4, [sp+0xc]
 f9 81                 or	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f7 68                 add32	q2, q0
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f1 0a                 mov	r1, r2
 f0 32 18              ldsp16	r2, [sp+0x18]
 f4 a9                 inc16	r1
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x217
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x330
<L35>:
 f1 25                 mov	r5, r1
 c9 fe                 addi.s8	r5, -0x2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x336
<L36>:
 c2 20                 ldi8	r6, 0x20
 92                    or	r4, r6
 cc 65                 cmpi.s8	r4, 0x65
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 d1 04                 brne8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x344
<L37>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x3fd
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7dd
 c2 20                 ldi8	r6, 0x20
 92                    or	r4, r6
 cc 70                 cmpi.s8	r4, 0x70
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 d0 04                 breq8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x328
<L38>:
 f1 29                 mov	r6, r1
 f4 b6                 dec16	r6
 42                    ld8u	r4, [r6]
 cc 2b                 cmpi.s8	r4, 0x2b
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x359
<L39>:
 cc 2d                 cmpi.s8	r4, 0x2d
 d0 04                 breq8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x372
<L40>:
 ed 62 20              ld8u	r3, [r1+0]
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 0f                 cset.ne	r7
 f1 23                 mov	r4, r3
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d2 04                 brult8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x3ce
<L41>:
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x386
 c3 01                 ldi8	r7, 0x1
 f1 1c                 mov	r3, r4
 f1 0e                 mov	r1, r6
 f1 23                 mov	r4, r3
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d2 04                 brult8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x3ce
<L42>:
 f0 3f 18              stsp16	[sp+0x18], r7
 f1 11                 mov	r2, r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 04 3f 42           ldi16	r0, 0x423f
 f0 01 0f              ldi8	r1, 0xf
 f0 69 08              cmp32	q0, q2
 d3 04                 brslt8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x3b9
<L43>:
 ed 64 21              ld8u	r3, [r2+1]
 f4 aa                 inc16	r2
 f1 2b                 mov	r6, r3
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d2 04                 brult8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x3d9
<L44>:
 f0 69 08              cmp32	q0, q2
 d9 04                 brsge8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x39d
<L45>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 0b d0              addi.s8	r3, -0x30
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x39d
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x3fd
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f7 72                 sub32	q0, q2
 f0 36 18              ldsp16	r6, [sp+0x18]
 f4 a6                 tst8	r6
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 62                 add32	q0, q2
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f1 26                 mov	r5, r2
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x409
<L46>:
 71                    st16	[r4], r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x4af
<L47>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x4b9
<L48>:
 f1 20                 mov	r4, r0
 f1 24                 mov	r5, r0
 fa cf                 asr16i	r5, 0xf
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 c2 27                 ldi8	r6, 0x27
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x7cc
<L49>:
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x5f7
<L50>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x456
 f4 ae                 inc16	r6
 42                    ld8u	r4, [r6]
 cc 2e                 cmpi.s8	r4, 0x2e
 d1 04                 brne8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x454
<L51>:
 cc 30                 cmpi.s8	r4, 0x30
 d1 04                 brne8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x454
<L52>:
 f2 4b                 sub	r3, r3
 c0 30                 ldi8	r4, 0x30
 f0 3c 12              stsp16	[sp+0x12], r4
 46                    ld8u	r5, [r6]
 cd 2e                 cmpi.s8	r5, 0x2e
 f8 07                 cset.eq	r7
 1e                    add	r7, r6
 43                    ld8u	r4, [r7]
 f1 14                 mov	r2, r4
 f0 0a d0              addi.s8	r2, -0x30
 f1 72                 zext8	r2
 f0 0e 0a              cmpi.s8	r2, 0xa
 f0 36 12              ldsp16	r6, [sp+0x12]
 fc 34                 cmov.ult	r6, r4
 f1 03                 mov	r0, r3
 f2 39                 sub	r1, r1
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	.rodata.str1.1
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	.rodata.str1.1
 f7 62                 add32	q0, q2
 f0 60 80              ldp8u	r4, [q0]
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x5e4
<L53>:
 f0 0e 0a              cmpi.s8	r2, 0xa
 f8 16                 cset.ult	r6
 1e                    add	r7, r6
 f4 ab                 inc16	r3
 f0 0f 27              cmpi.s8	r3, 0x27
 0b                    mov	r6, r7
 d0 04                 breq8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x46e
<L54>:
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7cc
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7dd
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f0 01 10              ldi8	r1, 0x10
 f0 69 8c              cmp32	q2, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 fc 31                 cmov.ult	r6, r1
 f2 4b                 sub	r3, r3
 fc 27                 cmov.ult	r4, r7
 fc 2b                 cmov.ult	r5, r3
 f0 06 00 01           ldi16	r2, 0x100
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x4ee
<L55>:
 c3 08                 ldi8	r7, 0x8
 9b                    or	r6, r7
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 97                    or	r5, r7
 fa 78                 lsr16i	r4, 0x8
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f0 02 10              ldi8	r2, 0x10
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x511
<L56>:
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 4c                 lsl16i	r5, 0xc
 97                    or	r5, r7
 fa 74                 lsr16i	r4, 0x4
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 ca 04                 addi.s8	r6, 0x4
 f0 02 04              ldi8	r2, 0x4
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x52e
<L57>:
 0c                    mov	r7, r4
 fa a2                 lsr16i	r7, 0x2
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 4e                 lsl16i	r5, 0xe
 97                    or	r5, r7
 fa 72                 lsr16i	r4, 0x2
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 ca 02                 addi.s8	r6, 0x2
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f0 69 48              cmp32	q1, q2
 f8 12                 cset.ult	r2
 f2 16                 add	r2, r6
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f1 28                 mov	r6, r0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f7 68                 add32	q2, q0
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 c2 7f                 ldi8	r6, 0x7f
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L58>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x561
<L58>:
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7cc
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c4 6a ff              ldi16	r4, 0xff6a
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 69 c8              cmp32	q3, q2
 d3 04                 brslt8	0x4 <L59>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x588
<L59>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7cc
 c4 81 ff              ldi16	r4, 0xff81
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	0x4 <L60>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x6bb
<L60>:
 f0 06 6b ff           ldi16	r2, 0xff6b
 f4 1a                 ldsp16	r6, [sp+0x6]
 f2 46                 sub	r2, r6
 f0 0e 01              cmpi.s8	r2, 0x1
 d9 04                 brsge8	0x4 <L61>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x750
<L61>:
 f0 0e 21              cmpi.s8	r2, 0x21
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 d2 04                 brult8	0x4 <L62>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x7cc
<L62>:
 c4 4b ff              ldi16	r4, 0xff4b
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L63>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x7e4
<L63>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L64>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x833
<L64>:
 c0 01                 ldi8	r4, 0x1
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7b1
 f1 76                 zext8	r6
 32                    cmp	r4, r6
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d8 04                 bruge8	0x4 <L65>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x7cc
<L65>:
 c4 ca ff              ldi16	r4, 0xffca
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 08              cmp32	q0, q2
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 d9 04                 brsge8	0x4 <L66>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x7cc
<L66>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 11                 u32tof
 f2 64                 mov32	q1, q0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f2 52                 sub	r4, r2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 f1 26                 mov	r5, r2
 fd 2c                 cmov.slt	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 c0 05                 ldi8	r4, 0x5
 f4 58                 stsp16	[sp+0x6], r4
 f1 2b                 mov	r6, r3
 fa 9f                 lsr16i	r6, 0xf
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	.rodata.decimal_value.powers
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	.rodata.decimal_value.powers
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3d 14              stsp16	[sp+0x14], r5
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x66c
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 fa 7e                 lsr16i	r4, 0xe
 15                    add	r5, r5
 15                    add	r5, r5
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f7 69                 add32	q2, q1
 f0 64 c8              ldp32	q3, [q2]
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 b4                 dec16	r4
 f4 58                 stsp16	[sp+0x6], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 cc 06                 cmpi.s8	r4, 0x6
 f0 36 12              ldsp16	r6, [sp+0x12]
 d1 04                 brne8	0x4 <L67>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x6a3
<L67>:
 f4 a6                 tst8	r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 01                 ldsp16	r5, [sp+0x0]
 fb 65                 cmov.ne	r4, r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 fa 14                 lsr16v	r5, r4
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L68>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x655
<L68>:
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L69>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x640
<L69>:
 f4 01                 ldsp16	r5, [sp+0x0]
 01                    mov	r4, r5
 fa 7e                 lsr16i	r4, 0xe
 15                    add	r5, r5
 15                    add	r5, r5
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f7 69                 add32	q2, q1
 f0 64 c8              ldp32	q3, [q2]
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x653
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 7f           ldi16	r3, 0x7f7f
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7b1
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 0e 18              cmpi.s8	r2, 0x18
 d2 04                 brult8	0x4 <L70>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x6fc
<L70>:
 f0 00 17              ldi8	r0, 0x17
 f2 32                 sub	r0, r2
 c2 0f                 ldi8	r6, 0xf
 f1 20                 mov	r4, r0
 82                    and	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 a8                    xor	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 0c                    mov	r7, r4
 f4 8f                 lsr16.1	r7
 fa 1e                 lsr16v	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 06                 shl16v	r5, r6
 97                    or	r5, r7
 c2 10                 ldi8	r6, 0x10
 f9 18                 and	r0, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 02                 shl16v	r4, r6
 f4 a0                 tst8	r0
 fb 6c                 cmov.ne	r5, r4
 aa                    xor	r6, r6
 fb 66                 cmov.ne	r4, r6
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x782
 f1 22                 mov	r4, r2
 c8 e8                 addi.s8	r4, -0x18
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 62                 add32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 0a e9              addi.s8	r2, -0x17
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L71>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x762
<L71>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x782
 c0 95                 ldi8	r4, 0x95
 18                    add	r6, r4
 af                    xor	r7, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7b1
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L72>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x782
<L72>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L73>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x747
<L73>:
 f2 6a                 mov32	q3, q0
 c0 01                 ldi8	r4, 0x1
 88                    and	r6, r4
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L74>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x747
<L74>:
 aa                    xor	r6, r6
 c7 00 01              ldi16	r7, 0x100
 f0 69 0c              cmp32	q0, q3
 f8 06                 cset.eq	r6
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 6b                 add32	q2, q3
 c2 7f                 ldi8	r6, 0x7f
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L75>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x7cc
<L75>:
 c2 7f                 ldi8	r6, 0x7f
 f9 c4                 and	r6, r1
 fa 37                 lsl16i	r4, 0x7
 92                    or	r4, r6
 04                    mov	r5, r4
 f1 20                 mov	r4, r0
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 c5 80 80              ldi16	r5, 0x8080
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f7 68                 add32	q2, q0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 80              ldi16	r7, 0x80ff
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L76>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x7d2
<L76>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 97                    or	r5, r7
 02                    mov	r4, r6
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 6a ff              ldi16	r4, 0xff6a
 22                    sub	r4, r6
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 62                 add32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L77>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x847
<L77>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7af
 f0 69 c8              cmp32	q3, q2
 f8 05                 cset.eq	r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 81                    and	r4, r5
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7b1
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L78>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x7b1
<L78>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L79>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x82c
<L79>:
 f2 68                 mov32	q2, q0
 c2 01                 ldi8	r6, 0x1
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L80>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x7b1
<L80>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x7af

Disassembly of section .text.strtod:

<strtod>:
 e2 00 00 00           jmpf	strtod
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtof

Disassembly of section .text.strtold:

<strtold>:
 e2 00 00 00           jmpf	strtold
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtof
