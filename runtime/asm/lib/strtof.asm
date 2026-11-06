
strtof.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    d  .text.strtof	00000000 .text.strtof
00000000 l     F .text.decimal_overflows	00000073 decimal_overflows
00000000 l    d  .text.decimal_overflows	00000000 .text.decimal_overflows
00000000 l     O .rodata.str1.1	00000028 decimal_overflows.threshold
00000000 l    d  .text.strtod	00000000 .text.strtod
00000000 l    d  .text.strtold	00000000 .text.strtold
00000000 l    d  .rodata.str1.1	00000000 .rodata.str1.1
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.strtof	000004af strtof
00000000         *UND*	00000000 isspace
00000000         *UND*	00000000 isalnum
00000000         *UND*	00000000 __avm_mulsi3
00000000         *UND*	00000000 __avm_hex_value
00000000         *UND*	00000000 __avm_decimal_value
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.strtod	00000004 strtod
00000000 g     F .text.strtold	00000004 strtold

Disassembly of section .text.strtof:

<strtof>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 de                 adjsp	-0x22
 f1 0c                 mov	r1, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x12
<L0>:
 f5 55                 st16	[r5], r1
 f0 3d 12              stsp16	[sp+0x12], r5
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
 ed 82 20              ld8u	r4, [r1+0]
 aa                    xor	r6, r6
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3d 16              stsp16	[sp+0x16], r5
 c2 20                 ldi8	r6, 0x20
 04                    mov	r5, r4
 96                    or	r5, r6
 cd 6e                 cmpi.s8	r5, 0x6e
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xeb
<L4>:
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x71
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f1 08                 mov	r1, r0
 c2 20                 ldi8	r6, 0x20
 04                    mov	r5, r4
 96                    or	r5, r6
 cd 6e                 cmpi.s8	r5, 0x6e
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xeb
<L5>:
 cd 69                 cmpi.s8	r5, 0x69
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x161
<L6>:
 ed c2 21              ld8u	r6, [r1+1]
 c1 df                 ldi8	r5, 0xdf
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x161
<L7>:
 ed c2 22              ld8u	r6, [r1+2]
 89                    and	r6, r5
 ce 46                 cmpi.s8	r6, 0x46
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x161
<L8>:
 ed c2 23              ld8u	r6, [r1+3]
 89                    and	r6, r5
 f1 21                 mov	r4, r1
 c8 03                 addi.s8	r4, 0x3
 ce 49                 cmpi.s8	r6, 0x49
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xd8
<L9>:
 ed c2 24              ld8u	r6, [r1+4]
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xd8
<L10>:
 ed c2 25              ld8u	r6, [r1+5]
 89                    and	r6, r5
 ce 49                 cmpi.s8	r6, 0x49
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xd8
<L11>:
 ed c2 26              ld8u	r6, [r1+6]
 89                    and	r6, r5
 ce 54                 cmpi.s8	r6, 0x54
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xd8
<L12>:
 ed c2 27              ld8u	r6, [r1+7]
 89                    and	r6, r5
 ce 59                 cmpi.s8	r6, 0x59
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xd8
<L13>:
 f0 09 08              addi.s8	r1, 0x8
 f1 21                 mov	r4, r1
 f0 35 12              ldsp16	r5, [sp+0x12]
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0xe4
<L14>:
 74                    st16	[r5], r4
 c4 80 7f              ldi16	r4, 0x7f80
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x155
 ed c2 21              ld8u	r6, [r1+1]
 c1 df                 ldi8	r5, 0xdf
 89                    and	r6, r5
 ce 41                 cmpi.s8	r6, 0x41
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x161
<L15>:
 ed c2 22              ld8u	r6, [r1+2]
 89                    and	r6, r5
 ce 4e                 cmpi.s8	r6, 0x4e
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x161
<L16>:
 f1 01                 mov	r0, r1
 f0 08 03              addi.s8	r0, 0x3
 ed 82 23              ld8u	r4, [r1+3]
 cc 28                 cmpi.s8	r4, 0x28
 f0 34 12              ldsp16	r4, [sp+0x12]
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x146
<L17>:
 f0 09 05              addi.s8	r1, 0x5
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x121
 f4 a9                 inc16	r1
 ed 82 1f              ld8u	r4, [r1-1]
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isalnum
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x11f
<L18>:
 ed 82 1f              ld8u	r4, [r1-1]
 cc 5f                 cmpi.s8	r4, 0x5f
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x11f
<L19>:
 cc 29                 cmpi.s8	r4, 0x29
 f0 34 12              ldsp16	r4, [sp+0x12]
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x148
<L20>:
 f1 08                 mov	r1, r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x152
<L21>:
 f5 51                 st16	[r4], r1
 c4 c0 7f              ldi16	r4, 0x7fc0
 f0 37 16              ldsp16	r7, [sp+0x16]
 93                    or	r4, r7
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x4a6
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 c1 01                 ldi8	r5, 0x1
 f4 51                 stsp16	[sp+0x4], r5
 c1 09                 ldi8	r5, 0x9
 f4 59                 stsp16	[sp+0x6], r5
 cc 30                 cmpi.s8	r4, 0x30
 f0 39 20              stsp16	[sp+0x20], r1
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x1e0
<L22>:
 ed 82 21              ld8u	r4, [r1+1]
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 cc 78                 cmpi.s8	r4, 0x78
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x1e0
<L23>:
 ed 82 22              ld8u	r4, [r1+2]
 c1 02                 ldi8	r5, 0x2
 c2 03                 ldi8	r6, 0x3
 cc 2e                 cmpi.s8	r4, 0x2e
 fb 2e                 cmov.eq	r5, r6
 f2 25                 add	r5, r1
 41                    ld8u	r4, [r5]
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 d8 04                 bruge8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x1bf
<L24>:
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 06                 cmpi.s8	r4, 0x6
 f0 33 20              ldsp16	r3, [sp+0x20]
 d2 04                 brult8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x1e2
<L25>:
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 0b 02              addi.s8	r3, 0x2
 c0 10                 ldi8	r4, 0x10
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c0 04                 ldi8	r4, 0x4
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 c0 08                 ldi8	r4, 0x8
 f4 58                 stsp16	[sp+0x6], r4
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x1e2
 f1 19                 mov	r3, r1
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 0b 02              addi.s8	r3, 0x2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f1 0c                 mov	r1, r4
 f1 04                 mov	r0, r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f4 70                 stsp16	[sp+0xc], r4
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x1fe
 f0 00 01              ldi8	r0, 0x1
 f4 ab                 inc16	r3
 ed 86 1e              ld8u	r4, [r3-2]
 cc 2e                 cmpi.s8	r4, 0x2e
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x211
<L26>:
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x1f9
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
		R_AVM_FAR24	.text.strtof+0x238
<L28>:
 f1 14                 mov	r2, r4
 f0 0a d0              addi.s8	r2, -0x30
 f0 0e 0a              cmpi.s8	r2, 0xa
 f8 2d                 cset.sge	r5
 f6 2a                 tst16	r2
 d9 04                 brsge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x2eb
<L29>:
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x258
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 96                    or	r5, r6
 09                    mov	r6, r5
 ca a9                 addi.s8	r6, -0x57
 c9 9f                 addi.s8	r5, -0x61
 f1 75                 zext8	r5
 f0 06 ff ff           ldi16	r2, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 16                 cmov.ult	r2, r6
 f0 0e 0a              cmpi.s8	r2, 0xa
 f8 2d                 cset.sge	r5
 f6 2a                 tst16	r2
 d9 04                 brsge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x2eb
<L30>:
 f4 12                 ldsp16	r6, [sp+0x4]
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x2eb
<L31>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 38 1e              stsp16	[sp+0x1e], r0
 f6 28                 tst16	r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 73                 sub32	q0, q3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 01 01              ldi8	r1, 0x1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x2a2
<L32>:
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x2a2
<L33>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x2e2
 f1 03                 mov	r0, r3
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f4 18                 ldsp16	r4, [sp+0x6]
 f5 1c                 cmp	r3, r4
 d3 04                 brslt8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x2ca
<L34>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 ab                 inc16	r3
 f0 3b 1c              stsp16	[sp+0x1c], r3
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x2e0
 f4 30                 ldsp16	r4, [sp+0xc]
 f9 89                 or	r4, r2
 f4 70                 stsp16	[sp+0xc], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 18                 mov	r3, r0
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f4 ab                 inc16	r3
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x1fe
 f1 25                 mov	r5, r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x4a6
<L35>:
 f1 27                 mov	r5, r3
 c9 fe                 addi.s8	r5, -0x2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x35d
<L36>:
 c2 20                 ldi8	r6, 0x20
 92                    or	r4, r6
 cc 65                 cmpi.s8	r4, 0x65
 d1 04                 brne8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x368
<L37>:
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x328
<L38>:
 71                    st16	[r4], r5
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x396
<L39>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x3a0
<L40>:
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f1 20                 mov	r4, r0
 f1 24                 mov	r5, r0
 fa cf                 asr16i	r5, 0xf
 f7 69                 add32	q2, q1
 c2 27                 ldi8	r6, 0x27
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x46d
<L41>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.decimal_overflows
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x46e
 c2 20                 ldi8	r6, 0x20
 92                    or	r4, r6
 cc 70                 cmpi.s8	r4, 0x70
 d0 04                 breq8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x312
<L42>:
 f1 2b                 mov	r6, r3
 f4 b6                 dec16	r6
 42                    ld8u	r4, [r6]
 cc 2b                 cmpi.s8	r4, 0x2b
 d1 04                 brne8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x37d
<L43>:
 cc 2d                 cmpi.s8	r4, 0x2d
 d0 04                 breq8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x3b4
<L44>:
 ed 06 20              ld8u	r0, [r3+0]
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 0f                 cset.ne	r7
 f1 20                 mov	r4, r0
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d2 04                 brult8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x410
<L45>:
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x3c8
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x4a6
 d6 fe                 adjsp	-0x2
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 40                 stsp16	[sp+0x0], r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_hex_value
 d6 02                 adjsp	0x2
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x481
 c3 01                 ldi8	r7, 0x1
 f1 04                 mov	r0, r4
 f1 1e                 mov	r3, r6
 f1 20                 mov	r4, r0
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d2 04                 brult8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x410
<L46>:
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f1 0b                 mov	r1, r3
 f0 06 3f 42           ldi16	r2, 0x423f
 f0 03 0f              ldi8	r3, 0xf
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d3 04                 brslt8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x3fb
<L47>:
 ed 02 21              ld8u	r0, [r1+1]
 f4 a9                 inc16	r1
 f1 28                 mov	r6, r0
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d2 04                 brult8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x436
<L48>:
 f0 69 48              cmp32	q1, q2
 d9 04                 brsge8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x3df
<L49>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 08 d0              addi.s8	r0, -0x30
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x3df
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x327
<L50>:
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x331
<L51>:
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x396
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f7 76                 sub32	q1, q2
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f4 a6                 tst8	r6
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 25                 mov	r5, r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x327
<L52>:
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x331
<L53>:
 e2 00 00 00           jmpf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtof+0x396
 a0                    xor	r4, r4
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f0 38 00              stsp16	[sp+0x0], r0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	strtof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_decimal_value
 d6 04                 adjsp	0x4
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f7 6e                 add32	q3, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 80           ldi16	r1, 0x80ff
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtof
		R_AVM_FAR24	.text.strtof+0x49e
<L54>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 f0 37 16              ldsp16	r7, [sp+0x16]
 97                    or	r5, r7
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 f2 68                 mov32	q2, q0
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.decimal_overflows:

<decimal_overflows>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 e2 00 00 00           jmpf	decimal_overflows
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.decimal_overflows+0xc
 f4 ac                 inc16	r4
 44                    ld8u	r5, [r4]
 cd 2e                 cmpi.s8	r5, 0x2e
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	decimal_overflows
		R_AVM_FAR24	.text.decimal_overflows+0xa
<L0>:
 cd 30                 cmpi.s8	r5, 0x30
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	decimal_overflows
		R_AVM_FAR24	.text.decimal_overflows+0xa
<L1>:
 f2 30                 sub	r0, r0
 c1 30                 ldi8	r5, 0x30
 f4 41                 stsp16	[sp+0x0], r5
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	.rodata.str1.1
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	.rodata.str1.1
 44                    ld8u	r5, [r4]
 cd 2e                 cmpi.s8	r5, 0x2e
 f8 07                 cset.eq	r7
 1c                    add	r7, r4
 47                    ld8u	r5, [r7]
 01                    mov	r4, r5
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 f4 02                 ldsp16	r6, [sp+0x0]
 fc 35                 cmov.ult	r6, r5
 f0 38 02              stsp16	[sp+0x2], r0
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 60 a0              ldp8u	r5, [q0]
 39                    cmp	r6, r5
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	decimal_overflows
		R_AVM_FAR24	.text.decimal_overflows+0x67
<L2>:
 cc 0a                 cmpi.s8	r4, 0xa
 f8 14                 cset.ult	r4
 1c                    add	r7, r4
 f0 30 02              ldsp16	r0, [sp+0x2]
 f4 a8                 inc16	r0
 f0 0c 27              cmpi.s8	r0, 0x27
 03                    mov	r4, r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	decimal_overflows
		R_AVM_FAR24	.text.decimal_overflows+0x2a
<L3>:
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	decimal_overflows
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.decimal_overflows+0x6c
 f1 76                 zext8	r6
 36                    cmp	r5, r6
 f8 14                 cset.ult	r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

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
