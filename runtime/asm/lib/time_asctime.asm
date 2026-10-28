
time_asctime.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_asctime.c
00000000 l    d  .text.asctime	00000000 .text.asctime
00000000 l     O .data.asctime.result	0000001a asctime.result
00000000 l    d  .data.asctime.result	00000000 .data.asctime.result
00000000 g     F .text.asctime	000001c7 asctime
00000000         *UND*	00000000 __avm_mulhisi3
00000000         *UND*	00000000 __avm_time_weekdays
00000000         *UND*	00000000 __avm_time_months
00000000         *UND*	00000000 __avm_udivmodsi4

Disassembly of section .text.asctime:

<asctime>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 a5                    xor	r5, r5
 ed d8 2c              ld16	r6, [r4+12]
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x1bf
<L0>:
 ed d8 28              ld16	r6, [r4+8]
 ce 0c                 cmpi.s8	r6, 0xc
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x1bf
<L1>:
 ed d8 26              ld16	r6, [r4+6]
 ca e0                 addi.s8	r6, -0x20
 ce e1                 cmpi.s8	r6, -0x1f
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x1bf
<L2>:
 ed d8 24              ld16	r6, [r4+4]
 ce 18                 cmpi.s8	r6, 0x18
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x1bf
<L3>:
 ed d8 22              ld16	r6, [r4+2]
 ce 3c                 cmpi.s8	r6, 0x3c
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x1bf
<L4>:
 68                    ld16	r6, [r4]
 ce 3d                 cmpi.s8	r6, 0x3d
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x1bf
<L5>:
 ed d8 2e              ld16	r6, [r4+14]
 f6 2e                 tst16	r6
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x1bf
<L6>:
 c7 6d 01              ldi16	r7, 0x16d
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x1bf
<L7>:
 ed 18 2a              ld16	r0, [r4+10]
 c7 5c e0              ldi16	r7, 0xe05c
 f2 2c                 add	r7, r0
 c6 d8 dc              ldi16	r6, 0xdcd8
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x1bf
<L8>:
 f1 28                 mov	r6, r0
 f1 2c                 mov	r7, r0
 fa ef                 asr16i	r7, 0xf
 f0 04 6c 07           ldi16	r0, 0x76c
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 42                 sub	r2, r2
 f4 50                 stsp16	[sp+0x4], r4
 ed 98 2c              ld16	r4, [r4+12]
 c1 0a                 ldi8	r5, 0xa
 e3 00 00 00           callf	asctime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulhisi3
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__avm_time_weekdays
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__avm_time_weekdays
 f7 6b                 add32	q2, q3
 f1 1a                 mov	r3, r2
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	.data.asctime.result
 f2 1e                 add	r3, r6
 f0 60 88              ldp8u	r4, [q2]
 ee 86 20              st8	[r3+0], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 ed 98 28              ld16	r4, [r4+8]
 c1 0a                 ldi8	r5, 0xa
 e3 00 00 00           callf	asctime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulhisi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f7 6c                 add32	q3, q0
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	__avm_time_months
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	__avm_time_months
 f7 6c                 add32	q3, q0
 f0 60 ac              ldp8u	r5, [q3]
 ee a6 24              st8	[r3+4], r5
 f4 aa                 inc16	r2
 f0 0e 03              cmpi.s8	r2, 0x3
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x88
<L9>:
 f0 00 20              ldi8	r0, 0x20
 f0 48 00 00           stm8	[0x0], r0
		R_AVM_DATA16	.data.asctime.result+0xa
 f0 48 00 00           stm8	[0x0], r0
		R_AVM_DATA16	.data.asctime.result+0x13
 f0 48 00 00           stm8	[0x0], r0
		R_AVM_DATA16	.data.asctime.result+0x7
 f0 48 00 00           stm8	[0x0], r0
		R_AVM_DATA16	.data.asctime.result+0x3
 ed b8 26              ld16	r5, [r4+6]
 09                    mov	r6, r5
 f0 03 0a              ldi8	r3, 0xa
 ec b3                 sdiv16	r6, r3
 0e                    mov	r7, r6
 cb 30                 addi.s8	r7, 0x30
 f0 4f 00 00           stm8	[0x0], r7
		R_AVM_DATA16	.data.asctime.result+0x8
 f0 02 f6              ldi8	r2, 0xf6
 fe 32                 mul16	r6, r2
 19                    add	r6, r5
 ca 30                 addi.s8	r6, 0x30
 f0 4e 00 00           stm8	[0x0], r6
		R_AVM_DATA16	.data.asctime.result+0x9
 ed b8 26              ld16	r5, [r4+6]
 cd 0a                 cmpi.s8	r5, 0xa
 d3 04                 brslt8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	asctime
		R_AVM_FAR24	.text.asctime+0x114
<L10>:
 f0 48 00 00           stm8	[0x0], r0
		R_AVM_DATA16	.data.asctime.result+0x8
 ed b8 24              ld16	r5, [r4+4]
 09                    mov	r6, r5
 ec b3                 sdiv16	r6, r3
 0e                    mov	r7, r6
 cb 30                 addi.s8	r7, 0x30
 f0 4f 00 00           stm8	[0x0], r7
		R_AVM_DATA16	.data.asctime.result+0xb
 fe 32                 mul16	r6, r2
 19                    add	r6, r5
 ca 30                 addi.s8	r6, 0x30
 f0 4e 00 00           stm8	[0x0], r6
		R_AVM_DATA16	.data.asctime.result+0xc
 d6 fe                 adjsp	-0x2
 f0 15 08              leasp	r5, 0x8
 f4 41                 stsp16	[sp+0x0], r5
 ed 58 22              ld16	r2, [r4+2]
 f1 0a                 mov	r1, r2
 ec 8b                 sdiv16	r1, r3
 f1 25                 mov	r5, r1
 c9 30                 addi.s8	r5, 0x30
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	.data.asctime.result+0xe
 c2 64                 ldi8	r6, 0x64
 af                    xor	r7, r7
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 e3 00 00 00           callf	asctime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f1 04                 mov	r0, r4
 ec 83                 sdiv16	r0, r3
 f1 28                 mov	r6, r0
 c1 f6                 ldi8	r5, 0xf6
 fe 35                 mul16	r6, r5
 18                    add	r6, r4
 c3 67                 ldi8	r7, 0x67
 f0 33 06              ldsp16	r3, [sp+0x6]
 f1 23                 mov	r4, r3
 fe 27                 mul16	r4, r7
 fa 7a                 lsr16i	r4, 0xa
 c7 f6 ff              ldi16	r7, 0xfff6
 f3 3c                 mulsu8.w	r7, r4
 f2 2f                 add	r7, r3
 fe 0d                 mul16	r1, r5
 f1 1d                 mov	r3, r5
 f2 0a                 add	r1, r2
 f0 09 30              addi.s8	r1, 0x30
 f0 49 00 00           stm8	[0x0], r1
		R_AVM_DATA16	.data.asctime.result+0xf
 f0 01 30              ldi8	r1, 0x30
 f9 85                 or	r4, r1
 f9 e5                 or	r7, r1
 f4 11                 ldsp16	r5, [sp+0x4]
 f5 45                 ld16	r1, [r5]
 f0 4f 00 00           stm8	[0x0], r7
		R_AVM_DATA16	.data.asctime.result+0x17
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data.asctime.result+0x16
 ca 30                 addi.s8	r6, 0x30
 f0 4e 00 00           stm8	[0x0], r6
		R_AVM_DATA16	.data.asctime.result+0x15
 f0 08 30              addi.s8	r0, 0x30
 f0 48 00 00           stm8	[0x0], r0
		R_AVM_DATA16	.data.asctime.result+0x14
 c0 3a                 ldi8	r4, 0x3a
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data.asctime.result+0x10
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data.asctime.result+0xd
 c1 0a                 ldi8	r5, 0xa
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	.data.asctime.result+0x18
 f1 21                 mov	r4, r1
 ec a5                 sdiv16	r4, r5
 04                    mov	r5, r4
 c9 30                 addi.s8	r5, 0x30
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	.data.asctime.result+0x11
 fe 23                 mul16	r4, r3
 f2 21                 add	r4, r1
 c8 30                 addi.s8	r4, 0x30
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	.data.asctime.result+0x12
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	.data.asctime.result
 01                    mov	r4, r5
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
