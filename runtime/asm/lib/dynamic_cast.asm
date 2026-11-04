
dynamic_cast.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 dynamic_cast.c
00000000 l    d  .text.__dynamic_cast	00000000 .text.__dynamic_cast
00000000 l     F .text.cross_edge	000002ba cross_edge
00000000 l    d  .text.cross_edge	00000000 .text.cross_edge
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__dynamic_cast	00000580 __dynamic_cast
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
 d6 a1                 adjsp	-0x5f
 f0 30 6a              ldsp16	r0, [sp+0x6a]
 f0 19 6c              ldsp8u	r1, [sp+0x6c]
 f0 38 2b              stsp16	[sp+0x2b], r0
 f0 39 2d              stsp16	[sp+0x2d], r1
 f0 3c 2f              stsp16	[sp+0x2f], r4
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0xa0
<L0>:
 c4 ff ff              ldi16	r4, 0xffff
 c1 ff                 ldi8	r5, 0xff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 06 05 06           ldi16	r2, 0x605
 f0 07 ff ff           ldi16	r3, 0xffff
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 06 05 0b           ldi16	r2, 0xb05
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L1>:
 f0 30 2b              ldsp16	r0, [sp+0x2b]
 f0 31 2d              ldsp16	r1, [sp+0x2d]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 2b              stsp16	[sp+0x2b], r0
 f0 39 2d              stsp16	[sp+0x2d], r1
 f0 02 06              ldi8	r2, 0x6
 f2 4b                 sub	r3, r3
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__class_type_info
 f7 61                 add32	q0, q1
 f0 63 8c              ldp24	q2, [q3]
 f0 38 13              stsp16	[sp+0x13], r0
 f0 39 15              stsp16	[sp+0x15], r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x7f
<L2>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f7 61                 add32	q0, q1
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0xa5
<L3>:
 f0 34 2b              ldsp16	r4, [sp+0x2b]
 f0 35 2d              ldsp16	r5, [sp+0x2d]
 f0 04 05 06           ldi16	r0, 0x605
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 68                 add32	q2, q0
 f0 04 05 0b           ldi16	r0, 0xb05
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L4>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0xd4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x575
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f7 61                 add32	q0, q1
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L5>:
 f0 34 2b              ldsp16	r4, [sp+0x2b]
 f0 35 2d              ldsp16	r5, [sp+0x2d]
 f0 04 05 06           ldi16	r0, 0x605
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 68                 add32	q2, q0
 f0 04 05 0b           ldi16	r0, 0xb05
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L6>:
 f0 34 2b              ldsp16	r4, [sp+0x2b]
 f0 35 2d              ldsp16	r5, [sp+0x2d]
 f0 63 88              ldp24	q2, [q2]
 f0 30 13              ldsp16	r0, [sp+0x13]
 f0 31 15              ldsp16	r1, [sp+0x15]
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x110
<L7>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f7 61                 add32	q0, q1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x110
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
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L9>:
 f0 3e 48              stsp16	[sp+0x48], r6
 f0 3f 4a              stsp16	[sp+0x4a], r7
 c4 fd ff              ldi16	r4, 0xfffd
 f0 35 2f              ldsp16	r5, [sp+0x2f]
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L10>:
 f0 36 2f              ldsp16	r6, [sp+0x2f]
 f7 30                 ld16	r0, [r6+]
 f5 39                 ld8u	r1, [r6]
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L11>:
 f0 36 2f              ldsp16	r6, [sp+0x2f]
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f0 3c 1f              stsp16	[sp+0x1f], r4
 f0 3d 21              stsp16	[sp+0x21], r5
 c6 fa ff              ldi16	r6, 0xfffa
 c7 ff ff              ldi16	r7, 0xffff
 f7 6c                 add32	q3, q0
 f0 63 4c              ldp24	q1, [q3]
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 69                 add32	q2, q1
 f0 38 27              stsp16	[sp+0x27], r0
 f0 39 29              stsp16	[sp+0x29], r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f0 30 27              ldsp16	r0, [sp+0x27]
 f0 31 29              ldsp16	r1, [sp+0x29]
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 f0 36 1f              ldsp16	r6, [sp+0x1f]
 f0 37 21              ldsp16	r7, [sp+0x21]
 f7 6b                 add32	q2, q3
 c6 ff ff              ldi16	r6, 0xffff
 af                    xor	r7, r7
 f0 3c 0b              stsp16	[sp+0xb], r4
 f0 3b 0d              stsp16	[sp+0xd], r3
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L12>:
 c6 fd ff              ldi16	r6, 0xfffd
 c7 ff ff              ldi16	r7, 0xffff
 f7 63                 add32	q0, q3
 f0 63 80              ldp24	q2, [q0]
 f4 5c                 stsp16	[sp+0x7], r4
 f4 65                 stsp16	[sp+0x9], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 05 06              ldi16	r4, 0x605
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 c4 04 0b              ldi16	r4, 0xb04
 f4 7e                 stsp16	[sp+0xf], r6
 f0 3f 11              stsp16	[sp+0x11], r7
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L13>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 5c              stsp16	[sp+0x5c], r4
 f0 2d 5e              stsp8	[sp+0x5e], r5
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 c0 06                 ldi8	r4, 0x6
 f7 6e                 add32	q3, q2
 f0 3e 23              stsp16	[sp+0x23], r6
 f0 3f 25              stsp16	[sp+0x25], r7
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f7 6e                 add32	q3, q2
 f0 3e 19              stsp16	[sp+0x19], r6
 f0 3f 1b              stsp16	[sp+0x1b], r7
 a0                    xor	r4, r4
 f0 2c 54              stsp8	[sp+0x54], r4
 f0 15 54              leasp	r5, 0x54
 f0 3d 27              stsp16	[sp+0x27], r5
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 06 05 0b           ldi16	r2, 0xb05
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 1c 5d              ldsp8u	r4, [sp+0x5d]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x323
<L14>:
 f0 19 5c              ldsp8u	r1, [sp+0x5c]
 c0 01                 ldi8	r4, 0x1
 f1 48                 stsp8	[sp+0x6], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 50                 stsp16	[sp+0x4], r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 25                 ldsp16	r5, [sp+0x9]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f6 29                 tst16	r1
 f0 30 27              ldsp16	r0, [sp+0x27]
 f0 39 1f              stsp16	[sp+0x1f], r1
 f4 3e                 ldsp16	r6, [sp+0xf]
 f0 37 11              ldsp16	r7, [sp+0x11]
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x267
<L15>:
 ed a0 20              ld8u	r5, [r0+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 00              leasp	r4, 0x0
 08                    mov	r6, r4
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L16>:
 f4 a8                 inc16	r0
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x232
<L17>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 04 05 06           ldi16	r0, 0x605
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 6c                 add32	q3, q0
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L18>:
 f0 63 08              ldp24	q0, [q2]
 f0 36 13              ldsp16	r6, [sp+0x13]
 f0 37 15              ldsp16	r7, [sp+0x15]
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x30f
<L19>:
 f0 36 19              ldsp16	r6, [sp+0x19]
 f0 37 1b              ldsp16	r7, [sp+0x1b]
 f0 69 0c              cmp32	q0, q3
 c3 01                 ldi8	r7, 0x1
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x2fe
<L20>:
 f0 36 23              ldsp16	r6, [sp+0x23]
 f0 37 25              ldsp16	r7, [sp+0x25]
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L21>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 00 06              ldi8	r0, 0x6
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 62 cc              ldp16	r6, [q3]
 ce 04                 cmpi.s8	r6, 0x4
 d2 04                 brult8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L22>:
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 62 cc              ldp16	r6, [q3]
 ce 21                 cmpi.s8	r6, 0x21
 d2 04                 brult8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L23>:
 f0 3e 17              stsp16	[sp+0x17], r6
 fa 9d                 lsr16i	r6, 0xd
 f0 3e 1d              stsp16	[sp+0x1d], r6
 f0 36 17              ldsp16	r6, [sp+0x17]
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 37 1d              ldsp16	r7, [sp+0x1d]
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f0 37 17              ldsp16	r7, [sp+0x17]
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f7 74                 sub32	q1, q0
 f0 04 f6 ff           ldi16	r0, 0xfff6
 f0 01 ff              ldi8	r1, 0xff
 f7 61                 add32	q0, q1
 f0 06 05 0b           ldi16	r2, 0xb05
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L24>:
 f0 34 27              ldsp16	r4, [sp+0x27]
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 11                    add	r4, r5
 44                    ld8u	r5, [r4]
 f1 77                 zext8	r7
 37                    cmp	r5, r7
 d8 04                 bruge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x33c
<L25>:
 f0 31 1f              ldsp16	r1, [sp+0x1f]
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x531
<L26>:
 f4 b1                 dec16	r1
 f0 29 5c              stsp8	[sp+0x5c], r1
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x20f
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 50                 stsp16	[sp+0x4], r4
 f4 1e                 ldsp16	r6, [sp+0x7]
 f4 27                 ldsp16	r7, [sp+0x9]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c0 01                 ldi8	r4, 0x1
 f1 48                 stsp8	[sp+0x6], r4
 f0 2c 5d              stsp8	[sp+0x5d], r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x383
 f0 37 44              ldsp16	r7, [sp+0x44]
 f4 af                 inc16	r7
 c6 00 02              ldi16	r6, 0x200
 f0 3f 44              stsp16	[sp+0x44], r7
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L27>:
 f0 36 1f              ldsp16	r6, [sp+0x1f]
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L28>:
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
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x529
<L29>:
 f0 1c 5c              ldsp8u	r4, [sp+0x5c]
 f4 ac                 inc16	r4
 f0 2c 5c              stsp8	[sp+0x5c], r4
 f1 74                 zext8	r4
 f0 35 27              ldsp16	r5, [sp+0x27]
 11                    add	r4, r5
 a5                    xor	r5, r5
 51                    st8	[r4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 48              ldsp16	r0, [sp+0x48]
 f0 31 4a              ldsp16	r1, [sp+0x4a]
 f0 36 2b              ldsp16	r6, [sp+0x2b]
 f0 37 2d              ldsp16	r7, [sp+0x2d]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3de
<L30>:
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3be
<L31>:
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3de
<L32>:
 c2 01                 ldi8	r6, 0x1
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f3 5a                 ldsp8u	r6, [sp+0x6]
 f0 3e 42              stsp16	[sp+0x42], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 3e 46              stsp16	[sp+0x46], r6
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x3de
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 37 46              ldsp16	r7, [sp+0x46]
 3b                    cmp	r6, r7
 d0 04                 breq8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3d9
<L33>:
 f3 5a                 ldsp8u	r6, [sp+0x6]
 f0 37 42              ldsp16	r7, [sp+0x42]
 9e                    or	r7, r6
 f0 3f 42              stsp16	[sp+0x42], r7
 c2 01                 ldi8	r6, 0x1
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x3db
 c2 02                 ldi8	r6, 0x2
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x50e
<L34>:
 f0 34 2f              ldsp16	r4, [sp+0x2f]
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x50e
<L35>:
 f3 58                 ldsp8u	r4, [sp+0x6]
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 94                    or	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f2 30                 sub	r0, r0
 f0 1c 5c              ldsp8u	r4, [sp+0x5c]
 f0 3c 1f              stsp16	[sp+0x1f], r4
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x425
 c2 02                 ldi8	r6, 0x2
 c0 01                 ldi8	r4, 0x1
 f0 35 40              ldsp16	r5, [sp+0x40]
 3d                    cmp	r7, r5
 fb 34                 cmov.eq	r6, r4
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x50e
<L36>:
 c0 01                 ldi8	r4, 0x1
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 2c 37              stsp8	[sp+0x37], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f0 3c 35              stsp16	[sp+0x35], r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 25                 ldsp16	r5, [sp+0x9]
 f0 3c 31              stsp16	[sp+0x31], r4
 f0 3d 33              stsp16	[sp+0x33], r5
 f1 08                 mov	r1, r0
 f1 71                 zext8	r1
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x482
<L37>:
 f1 10                 mov	r2, r0
 f1 72                 zext8	r2
 f0 33 27              ldsp16	r3, [sp+0x27]
 ed a6 20              ld8u	r5, [r3+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 31              leasp	r4, 0x31
 08                    mov	r6, r4
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L38>:
 f4 ab                 inc16	r3
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x44f
<L39>:
 f0 34 31              ldsp16	r4, [sp+0x31]
 f0 35 33              ldsp16	r5, [sp+0x33]
 f0 06 05 0b           ldi16	r2, 0xb05
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 36 2b              ldsp16	r6, [sp+0x2b]
 f0 37 2d              ldsp16	r7, [sp+0x2d]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x415
<L40>:
 c2 01                 ldi8	r6, 0x1
 f0 2e 37              stsp8	[sp+0x37], r6
 f0 37 35              ldsp16	r7, [sp+0x35]
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4ef
<L41>:
 f0 3f 17              stsp16	[sp+0x17], r7
 f0 32 27              ldsp16	r2, [sp+0x27]
 f2 11                 add	r2, r1
 f0 33 1f              ldsp16	r3, [sp+0x1f]
 ed a4 20              ld8u	r5, [r2+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 31              leasp	r4, 0x31
 08                    mov	r6, r4
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x51d
<L42>:
 f4 aa                 inc16	r2
 f4 a9                 inc16	r1
 f5 0b                 cmp	r1, r3
 d8 04                 bruge8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4b2
<L43>:
 f0 1c 37              ldsp8u	r4, [sp+0x37]
 f4 a4                 tst8	r4
 f0 06 05 0b           ldi16	r2, 0xb05
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 37 17              ldsp16	r7, [sp+0x17]
 c2 01                 ldi8	r6, 0x1
 d1 04                 brne8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x415
<L44>:
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x408
<L45>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x415
<L46>:
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 3f 40              stsp16	[sp+0x40], r7
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x415
 f0 1c 5e              ldsp8u	r4, [sp+0x5e]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x201
<L47>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x531
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L48>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x53c
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L49>:
 f0 34 38              ldsp16	r4, [sp+0x38]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x57c
<L50>:
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x550
<L51>:
 f0 34 40              ldsp16	r4, [sp+0x40]
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x575
 a0                    xor	r4, r4
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x575
<L52>:
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x575
<L53>:
 f0 35 42              ldsp16	r5, [sp+0x42]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x575
<L54>:
 f0 34 46              ldsp16	r4, [sp+0x46]
 d6 5f                 adjsp	0x5f
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
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
