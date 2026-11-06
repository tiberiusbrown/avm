
dynamic_cast.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 dynamic_cast.c
00000000 l    d  .text.__dynamic_cast	00000000 .text.__dynamic_cast
00000000 l     F .text.cross_edge	000002ba cross_edge
00000000 l    d  .text.cross_edge	00000000 .text.cross_edge
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__dynamic_cast	0000061e __dynamic_cast
00000000         *UND*	00000000 vtable for __cxxabiv1::__class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__vmi_class_type_info
00000000         *UND*	00000000 abort

Disassembly of section .text.__dynamic_cast:

<__dynamic_cast>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 a3                 adjsp	-0x5d
 f0 32 68              ldsp16	r2, [sp+0x68]
 f0 1b 6a              ldsp8u	r3, [sp+0x6a]
 f0 3c 19              stsp16	[sp+0x19], r4
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x99
<L0>:
 c4 ff ff              ldi16	r4, 0xffff
 c1 ff                 ldi8	r5, 0xff
 88                    and	r6, r4
 8d                    and	r7, r5
 c4 05 06              ldi16	r4, 0x605
 c5 ff ff              ldi16	r5, 0xffff
 f2 63                 mov32	q0, q3
 f7 62                 add32	q0, q2
 c4 05 0b              ldi16	r4, 0xb05
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L1>:
 c4 ff ff              ldi16	r4, 0xffff
 c1 ff                 ldi8	r5, 0xff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__class_type_info
 f7 62                 add32	q0, q2
 f0 63 8c              ldp24	q2, [q3]
 f0 38 15              stsp16	[sp+0x15], r0
 f0 39 17              stsp16	[sp+0x17], r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x7c
<L2>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f0 3c 1f              stsp16	[sp+0x1f], r4
 f0 3d 21              stsp16	[sp+0x21], r5
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 34 1f              ldsp16	r4, [sp+0x1f]
 f0 35 21              ldsp16	r5, [sp+0x21]
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x9e
<L3>:
 f2 69                 mov32	q2, q1
 f0 04 05 06           ldi16	r0, 0x605
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 68                 add32	q2, q0
 f0 04 05 0b           ldi16	r0, 0xb05
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L4>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0xd2
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x605
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 34 1f              ldsp16	r4, [sp+0x1f]
 f0 35 21              ldsp16	r5, [sp+0x21]
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L5>:
 f2 69                 mov32	q2, q1
 f0 04 05 06           ldi16	r0, 0x605
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 68                 add32	q2, q0
 f0 04 05 0b           ldi16	r0, 0xb05
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L6>:
 f0 63 84              ldp24	q2, [q1]
 f0 30 15              ldsp16	r0, [sp+0x15]
 f0 31 17              ldsp16	r1, [sp+0x17]
 f0 69 80              cmp32	q2, q0
 f0 3e 42              stsp16	[sp+0x42], r6
 f0 3f 44              stsp16	[sp+0x44], r7
 f0 3a 59              stsp16	[sp+0x59], r2
 f0 3b 5b              stsp16	[sp+0x5b], r3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x119
<L7>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f0 02 06              ldi8	r2, 0x6
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x119
<L8>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f7 61                 add32	q0, q1
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L9>:
 c4 fd ff              ldi16	r4, 0xfffd
 f0 35 19              ldsp16	r5, [sp+0x19]
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L10>:
 f0 36 19              ldsp16	r6, [sp+0x19]
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L11>:
 f0 36 19              ldsp16	r6, [sp+0x19]
 af                    xor	r7, r7
 f4 5e                 stsp16	[sp+0x7], r6
 f4 67                 stsp16	[sp+0x9], r7
 f0 04 fa ff           ldi16	r0, 0xfffa
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f9 64                 and	r3, r1
 f0 3c 1f              stsp16	[sp+0x1f], r4
 f0 3d 21              stsp16	[sp+0x21], r5
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f4 1e                 ldsp16	r6, [sp+0x7]
 f4 27                 ldsp16	r7, [sp+0x9]
 f7 6b                 add32	q2, q3
 c6 ff ff              ldi16	r6, 0xffff
 af                    xor	r7, r7
 f0 3c 07              stsp16	[sp+0x7], r4
 f0 69 c8              cmp32	q3, q2
 f0 34 1f              ldsp16	r4, [sp+0x1f]
 f0 35 21              ldsp16	r5, [sp+0x21]
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L12>:
 c6 fd ff              ldi16	r6, 0xfffd
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f4 6c                 stsp16	[sp+0xb], r4
 f4 75                 stsp16	[sp+0xd], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 05 06              ldi16	r4, 0x605
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 c4 04 0b              ldi16	r4, 0xb04
 f0 3e 11              stsp16	[sp+0x11], r6
 f0 3f 13              stsp16	[sp+0x13], r7
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L13>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 3f 38              stsp16	[sp+0x38], r7
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f7 6e                 add32	q3, q2
 f0 3e 25              stsp16	[sp+0x25], r6
 f0 3f 27              stsp16	[sp+0x27], r7
 a0                    xor	r4, r4
 f0 2c 56              stsp8	[sp+0x56], r4
 f0 2c 4e              stsp8	[sp+0x4e], r4
 f0 3c 57              stsp16	[sp+0x57], r4
 f0 15 4e              leasp	r5, 0x4e
 f0 3d 23              stsp16	[sp+0x23], r5
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3c 1b              stsp16	[sp+0x1b], r4
 f4 7c                 stsp16	[sp+0xf], r4
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 32 59              ldsp16	r2, [sp+0x59]
 f0 33 5b              ldsp16	r3, [sp+0x5b]
 f0 1c 57              ldsp8u	r4, [sp+0x57]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x2d5
<L14>:
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f1 48                 stsp8	[sp+0x6], r4
 f0 2c 57              stsp8	[sp+0x57], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 35                 ldsp16	r5, [sp+0xd]
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x467
<L15>:
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 cf 01                 cmpi.s8	r7, 0x1
 f0 30 42              ldsp16	r0, [sp+0x42]
 f0 31 44              ldsp16	r1, [sp+0x44]
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x293
<L16>:
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x470
<L17>:
 f3 5a                 ldsp8u	r6, [sp+0x6]
 f4 7e                 stsp16	[sp+0xf], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 3e 1b              stsp16	[sp+0x1b], r6
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x2a6
 c1 02                 ldi8	r5, 0x2
 f0 1c 57              ldsp8u	r4, [sp+0x57]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x257
<L18>:
 f0 3d 3a              stsp16	[sp+0x3a], r5
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x2d5
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 50                 stsp16	[sp+0x4], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 35                 ldsp16	r5, [sp+0xd]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 01                 ldi8	r6, 0x1
 f1 4a                 stsp8	[sp+0x6], r6
 f0 2e 57              stsp8	[sp+0x57], r6
 c3 02                 ldi8	r7, 0x2
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x470
 f0 1c 57              ldsp8u	r4, [sp+0x57]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x2d0
<L19>:
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 50                 stsp16	[sp+0x4], r4
 c3 01                 ldi8	r7, 0x1
 f1 4b                 stsp8	[sp+0x6], r7
 f0 2f 57              stsp8	[sp+0x57], r7
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 35                 ldsp16	r5, [sp+0xd]
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x470
<L20>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 37 1b              ldsp16	r7, [sp+0x1b]
 3b                    cmp	r6, r7
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3f3
<L21>:
 f3 5a                 ldsp8u	r6, [sp+0x6]
 f4 3f                 ldsp16	r7, [sp+0xf]
 9e                    or	r7, r6
 f4 7f                 stsp16	[sp+0xf], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x2bb
<L22>:
 f0 34 19              ldsp16	r4, [sp+0x19]
 38                    cmp	r6, r4
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x2ca
<L23>:
 f0 1c 58              ldsp8u	r4, [sp+0x58]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x270
<L24>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x5bd
 c3 01                 ldi8	r7, 0x1
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x485
 c0 01                 ldi8	r4, 0x1
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 18 56              ldsp8u	r0, [sp+0x56]
 c0 01                 ldi8	r4, 0x1
 f1 48                 stsp8	[sp+0x6], r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 50                 stsp16	[sp+0x4], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 35                 ldsp16	r5, [sp+0xd]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f6 28                 tst16	r0
 f0 31 23              ldsp16	r1, [sp+0x23]
 f0 38 1f              stsp16	[sp+0x1f], r0
 f0 36 11              ldsp16	r6, [sp+0x11]
 f0 37 13              ldsp16	r7, [sp+0x13]
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x331
<L25>:
 ed a2 20              ld8u	r5, [r1+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 00              leasp	r4, 0x0
 08                    mov	r6, r4
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L26>:
 f4 a9                 inc16	r1
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d0 04                 breq8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x2fc
<L27>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 04 05 06           ldi16	r0, 0x605
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 6c                 add32	q3, q0
 f0 04 05 0b           ldi16	r0, 0xb05
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L28>:
 f0 63 08              ldp24	q0, [q2]
 f0 36 15              ldsp16	r6, [sp+0x15]
 f0 37 17              ldsp16	r7, [sp+0x17]
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3df
<L29>:
 f0 36 25              ldsp16	r6, [sp+0x25]
 f0 37 27              ldsp16	r7, [sp+0x27]
 f0 69 0c              cmp32	q0, q3
 c3 01                 ldi8	r7, 0x1
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3ce
<L30>:
 f0 36 36              ldsp16	r6, [sp+0x36]
 f0 37 38              ldsp16	r7, [sp+0x38]
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L31>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 00 06              ldi8	r0, 0x6
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 62 cc              ldp16	r6, [q3]
 ce 04                 cmpi.s8	r6, 0x4
 d2 04                 brult8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L32>:
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 62 cc              ldp16	r6, [q3]
 ce 21                 cmpi.s8	r6, 0x21
 d2 04                 brult8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L33>:
 f0 3e 1d              stsp16	[sp+0x1d], r6
 fa 9d                 lsr16i	r6, 0xd
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 36 1d              ldsp16	r6, [sp+0x1d]
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 37 30              ldsp16	r7, [sp+0x30]
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f0 37 1d              ldsp16	r7, [sp+0x1d]
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f7 74                 sub32	q1, q0
 f0 04 f6 ff           ldi16	r0, 0xfff6
 f0 01 ff              ldi8	r1, 0xff
 f7 61                 add32	q0, q1
 f0 32 59              ldsp16	r2, [sp+0x59]
 f0 33 5b              ldsp16	r3, [sp+0x5b]
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L34>:
 f0 34 23              ldsp16	r4, [sp+0x23]
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 11                    add	r4, r5
 44                    ld8u	r5, [r4]
 f1 77                 zext8	r7
 37                    cmp	r5, r7
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x417
<L35>:
 f0 30 1f              ldsp16	r0, [sp+0x1f]
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5c2
<L36>:
 f4 b0                 dec16	r0
 f0 28 56              stsp8	[sp+0x56], r0
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x2d8
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x408
<L37>:
 f0 34 19              ldsp16	r4, [sp+0x19]
 38                    cmp	r6, r4
 d1 04                 brne8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5ab
<L38>:
 f0 1c 58              ldsp8u	r4, [sp+0x58]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x243
<L39>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x60c
 f0 37 40              ldsp16	r7, [sp+0x40]
 f4 af                 inc16	r7
 c6 00 02              ldi16	r6, 0x200
 f0 3f 40              stsp16	[sp+0x40], r7
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L40>:
 f0 36 1f              ldsp16	r6, [sp+0x1f]
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L41>:
 09                    mov	r6, r5
 f4 ae                 inc16	r6
 52                    st8	[r4], r6
 f0 14 00              leasp	r4, 0x0
 08                    mov	r6, r4
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x612
<L42>:
 f0 1c 56              ldsp8u	r4, [sp+0x56]
 f4 ac                 inc16	r4
 f0 2c 56              stsp8	[sp+0x56], r4
 f1 74                 zext8	r4
 f0 35 23              ldsp16	r5, [sp+0x23]
 11                    add	r4, r5
 a5                    xor	r5, r5
 51                    st8	[r4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x21d
<L43>:
 f0 30 42              ldsp16	r0, [sp+0x42]
 f0 31 44              ldsp16	r1, [sp+0x44]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x599
<L44>:
 f0 34 19              ldsp16	r4, [sp+0x19]
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x599
<L45>:
 f0 3f 3a              stsp16	[sp+0x3a], r7
 f3 58                 ldsp8u	r4, [sp+0x6]
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 94                    or	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f2 30                 sub	r0, r0
 f0 1c 56              ldsp8u	r4, [sp+0x56]
 f0 3c 1f              stsp16	[sp+0x1f], r4
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x4ba
 c0 01                 ldi8	r4, 0x1
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 39                    cmp	r6, r5
 c1 02                 ldi8	r5, 0x2
 fb 2c                 cmov.eq	r5, r4
 f0 3d 34              stsp16	[sp+0x34], r5
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x59c
<L46>:
 c0 01                 ldi8	r4, 0x1
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 2c 2f              stsp8	[sp+0x2f], r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 3c 2d              stsp16	[sp+0x2d], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 35                 ldsp16	r5, [sp+0xd]
 f0 3c 29              stsp16	[sp+0x29], r4
 f0 3d 2b              stsp16	[sp+0x2b], r5
 f1 08                 mov	r1, r0
 f1 71                 zext8	r1
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x515
<L47>:
 f1 10                 mov	r2, r0
 f1 72                 zext8	r2
 f0 33 23              ldsp16	r3, [sp+0x23]
 ed a6 20              ld8u	r5, [r3+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 29              leasp	r4, 0x29
 08                    mov	r6, r4
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L48>:
 f4 ab                 inc16	r3
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4e4
<L49>:
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f0 32 59              ldsp16	r2, [sp+0x59]
 f0 33 5b              ldsp16	r3, [sp+0x5b]
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4aa
<L50>:
 c3 01                 ldi8	r7, 0x1
 f0 2f 2f              stsp8	[sp+0x2f], r7
 f0 36 2d              ldsp16	r6, [sp+0x2d]
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57a
<L51>:
 f0 3e 1d              stsp16	[sp+0x1d], r6
 f0 32 23              ldsp16	r2, [sp+0x23]
 f2 11                 add	r2, r1
 f0 33 1f              ldsp16	r3, [sp+0x1f]
 ed a4 20              ld8u	r5, [r2+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 29              leasp	r4, 0x29
 08                    mov	r6, r4
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5b1
<L52>:
 f4 aa                 inc16	r2
 f4 a9                 inc16	r1
 f5 0b                 cmp	r1, r3
 d8 04                 bruge8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x53f
<L53>:
 f0 1c 2f              ldsp8u	r4, [sp+0x2f]
 f4 a4                 tst8	r4
 f0 32 59              ldsp16	r2, [sp+0x59]
 f0 33 5b              ldsp16	r3, [sp+0x5b]
 f0 36 1d              ldsp16	r6, [sp+0x1d]
 c3 01                 ldi8	r7, 0x1
 d1 04                 brne8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4aa
<L54>:
 f0 34 34              ldsp16	r4, [sp+0x34]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x49d
<L55>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4aa
<L56>:
 f0 3f 34              stsp16	[sp+0x34], r7
 f0 3e 3e              stsp16	[sp+0x3e], r6
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x4aa
 f0 3f 3a              stsp16	[sp+0x3a], r7
 f0 1c 58              ldsp8u	r4, [sp+0x58]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x1fa
<L57>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x5c2
 c3 02                 ldi8	r7, 0x2
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x485
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L58>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L58>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x5cd
 c0 01                 ldi8	r4, 0x1
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 34 32              ldsp16	r4, [sp+0x32]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L59>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61a
<L59>:
 f0 34 34              ldsp16	r4, [sp+0x34]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L60>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5e1
<L60>:
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x605
 a0                    xor	r4, r4
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L61>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x605
<L61>:
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L62>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x605
<L62>:
 f4 3d                 ldsp16	r5, [sp+0xf]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L63>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x605
<L63>:
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 d6 5d                 adjsp	0x5d
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x5bf
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L64>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5c2
<L64>:
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.cross_edge:

<cross_edge>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f4 42                 stsp16	[sp+0x0], r6
 f4 49                 stsp16	[sp+0x2], r5
 04                    mov	r5, r4
 c0 02                 ldi8	r4, 0x2
 f0 6a 0a              ld32	q0, [r5]
 f0 06 05 06           ldi16	r2, 0x605
 f0 07 ff ff           ldi16	r3, 0xffff
 f2 6a                 mov32	q3, q0
 f7 6d                 add32	q3, q1
 f0 06 05 0b           ldi16	r2, 0xb05
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0xfe
<L0>:
 f4 59                 stsp16	[sp+0x6], r5
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__class_type_info
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__class_type_info
 f7 67                 add32	q1, q3
 f0 63 80              ldp24	q2, [q0]
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x4f
<L1>:
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f7 63                 add32	q0, q3
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x79
<L2>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 a4                 tst8	r4
 f0 06 05 06           ldi16	r2, 0x605
 f0 07 ff ff           ldi16	r3, 0xffff
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0xc9
<L3>:
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f2 63                 mov32	q0, q3
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f7 6c                 add32	q3, q0
 f0 69 8c              cmp32	q2, q3
 f0 06 05 06           ldi16	r2, 0x605
 f0 07 ff ff           ldi16	r3, 0xffff
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0xc3
<L4>:
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 6a c8              ld32	q3, [r4]
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 68                 add32	q2, q0
 f0 62 88              ldp16	r4, [q2]
 cc 04                 cmpi.s8	r4, 0x4
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0xfc
<L5>:
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 62 88              ldp16	r4, [q2]
 cc 21                 cmpi.s8	r4, 0x21
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x18d
<L6>:
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 6a 88              ld32	q2, [r4]
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 02                 ldi8	r4, 0x2
 f4 70                 stsp16	[sp+0xc], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 66                 add32	q1, q2
 c4 05 0b              ldi16	r4, 0xb05
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x105
<L7>:
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 c0 02                 ldi8	r4, 0x2
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 63 88              ldp24	q2, [q2]
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x142
<L8>:
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x142
<L9>:
 f2 63                 mov32	q0, q3
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f7 6c                 add32	q3, q0
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x29c
<L10>:
 c1 01                 ldi8	r5, 0x1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f9 a0                 and	r5, r0
 f4 18                 ldsp16	r4, [sp+0x6]
 ed d8 24              ld16	r6, [r4+4]
 f4 a5                 tst8	r5
 c0 02                 ldi8	r4, 0x2
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x234
<L11>:
 af                    xor	r7, r7
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 67                 add32	q1, q3
 c6 ff ff              ldi16	r6, 0xffff
 af                    xor	r7, r7
 f0 69 c4              cmp32	q3, q1
 f4 19                 ldsp16	r5, [sp+0x6]
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0xfe
<L12>:
 ed ca 26              ld8u	r6, [r5+6]
 f4 03                 ldsp16	r7, [sp+0x0]
 ee 5e 24              st16	[r7+4], r2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 6b 8e              st32	[r7], q2
 f4 88                 lsr16.1	r0
 a0                    xor	r4, r4
 f4 a6                 tst8	r6
 fb 04                 cmov.eq	r0, r4
 ee 0e 26              st8	[r7+6], r0
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 f4 70                 stsp16	[sp+0xc], r4
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 f4 61                 stsp16	[sp+0x8], r5
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 30                 ldsp16	r4, [sp+0xc]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f7 7c                 sub32	q3, q0
 c4 f6 ff              ldi16	r4, 0xfff6
 c1 ff                 ldi8	r5, 0xff
 f7 6b                 add32	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x2a8
<L13>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f1 74                 zext8	r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 38                    cmp	r6, r4
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x2a2
<L14>:
 02                    mov	r4, r6
 a5                    xor	r5, r5
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 af                    xor	r7, r7
 f7 7e                 sub32	q3, q2
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 63                 add32	q0, q3
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c0 0e                 ldi8	r4, 0xe
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 c2 0d                 ldi8	r6, 0xd
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 60 cc              ldp8u	r6, [q3]
 f4 72                 stsp16	[sp+0xc], r6
 f0 63 88              ldp24	q2, [q2]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 cc 04                 cmpi.s8	r4, 0x4
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 d8 04                 bruge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0xdf
<L15>:
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 c5 fd ff              ldi16	r5, 0xfffd
 36                    cmp	r5, r6
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0xfe
<L16>:
 06                    mov	r5, r6
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x2ae
<L17>:
 f7 61                 add32	q0, q1
 f0 06 fd ff           ldi16	r2, 0xfffd
 f0 03 ff              ldi8	r3, 0xff
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cross_edge
		R_AVM_FAR24	.text.cross_edge+0x2b4
<L18>:
 f0 63 00              ldp24	q0, [q0]
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f9 64                 and	r3, r1
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 68                 add32	q2, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 c0 02                 ldi8	r4, 0x2
 f0 30 0c              ldsp16	r0, [sp+0xc]
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0x161
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	cross_edge
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge+0xfe
