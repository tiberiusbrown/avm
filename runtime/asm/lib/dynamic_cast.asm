
dynamic_cast.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 dynamic_cast.c
00000000 l    d  .text.__dynamic_cast	00000000 .text.__dynamic_cast
00000000 l     F .text.cross_edge	000002ba cross_edge
00000000 l    d  .text.cross_edge	00000000 .text.cross_edge
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__dynamic_cast	00000634 __dynamic_cast
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
 d6 a7                 adjsp	-0x59
 f0 30 64              ldsp16	r0, [sp+0x64]
 f0 19 66              ldsp8u	r1, [sp+0x66]
 f0 38 17              stsp16	[sp+0x17], r0
 f0 39 19              stsp16	[sp+0x19], r1
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0xa0
<L0>:
 f0 3c 1d              stsp16	[sp+0x1d], r4
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
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L1>:
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 31 19              ldsp16	r1, [sp+0x19]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 17              stsp16	[sp+0x17], r0
 f0 39 19              stsp16	[sp+0x19], r1
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__class_type_info
 f7 62                 add32	q0, q2
 f0 63 4c              ldp24	q1, [q3]
 f0 38 13              stsp16	[sp+0x13], r0
 f0 39 15              stsp16	[sp+0x15], r1
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x7d
<L2>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f7 62                 add32	q0, q2
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0xa5
<L3>:
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 31 19              ldsp16	r1, [sp+0x19]
 f0 06 05 06           ldi16	r2, 0x605
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 61                 add32	q0, q1
 c4 05 0b              ldi16	r4, 0xb05
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L4>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0xd6
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x61b
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f7 62                 add32	q0, q2
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L5>:
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 31 19              ldsp16	r1, [sp+0x19]
 f0 06 05 06           ldi16	r2, 0x605
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 61                 add32	q0, q1
 c4 05 0b              ldi16	r4, 0xb05
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L6>:
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 31 19              ldsp16	r1, [sp+0x19]
 f0 63 40              ldp24	q1, [q0]
 f0 34 13              ldsp16	r4, [sp+0x13]
 f0 35 15              ldsp16	r5, [sp+0x15]
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x115
<L7>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x115
<L8>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f7 62                 add32	q0, q2
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L9>:
 f0 3e 40              stsp16	[sp+0x40], r6
 f0 3f 42              stsp16	[sp+0x42], r7
 c5 fd ff              ldi16	r5, 0xfffd
 f0 37 1d              ldsp16	r7, [sp+0x1d]
 37                    cmp	r5, r7
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L10>:
 0b                    mov	r6, r7
 f7 32                 ld16	r2, [r6+]
 f5 3b                 ld8u	r3, [r6]
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L11>:
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 5c                 stsp16	[sp+0x7], r4
 f4 65                 stsp16	[sp+0x9], r5
 f0 04 fa ff           ldi16	r0, 0xfffa
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 61                 add32	q0, q1
 f0 63 00              ldp24	q0, [q0]
 f0 3a 0b              stsp16	[sp+0xb], r2
 f0 3b 0d              stsp16	[sp+0xd], r3
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f9 64                 and	r3, r1
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 f0 32 0b              ldsp16	r2, [sp+0xb]
 f0 33 0d              ldsp16	r3, [sp+0xd]
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f4 1e                 ldsp16	r6, [sp+0x7]
 f4 27                 ldsp16	r7, [sp+0x9]
 f7 6b                 add32	q2, q3
 c6 ff ff              ldi16	r6, 0xffff
 af                    xor	r7, r7
 f0 3c 07              stsp16	[sp+0x7], r4
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L12>:
 c6 fd ff              ldi16	r6, 0xfffd
 c7 ff ff              ldi16	r7, 0xffff
 f7 67                 add32	q1, q3
 f0 63 84              ldp24	q2, [q1]
 f4 6c                 stsp16	[sp+0xb], r4
 f4 75                 stsp16	[sp+0xd], r5
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
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L13>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 3e 34              stsp16	[sp+0x34], r6
 f0 3f 36              stsp16	[sp+0x36], r7
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f7 6e                 add32	q3, q2
 f0 3e 23              stsp16	[sp+0x23], r6
 f0 3f 25              stsp16	[sp+0x25], r7
 a0                    xor	r4, r4
 f0 2c 54              stsp8	[sp+0x54], r4
 f0 2c 4c              stsp8	[sp+0x4c], r4
 f0 3c 55              stsp16	[sp+0x55], r4
 f0 15 4c              leasp	r5, 0x4c
 f0 3d 1f              stsp16	[sp+0x1f], r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3c 1b              stsp16	[sp+0x1b], r4
 f1 14                 mov	r2, r4
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 1c 55              ldsp8u	r4, [sp+0x55]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x2af
<L14>:
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 50                 stsp16	[sp+0x4], r4
 c0 01                 ldi8	r4, 0x1
 f1 48                 stsp8	[sp+0x6], r4
 f0 2c 55              stsp8	[sp+0x55], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 35                 ldsp16	r5, [sp+0xd]
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x435
 c1 02                 ldi8	r5, 0x2
 f0 1c 55              ldsp8u	r4, [sp+0x55]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x224
<L15>:
 f0 3d 38              stsp16	[sp+0x38], r5
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x2af
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 50                 stsp16	[sp+0x4], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 35                 ldsp16	r5, [sp+0xd]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 01                 ldi8	r6, 0x1
 f1 4a                 stsp8	[sp+0x6], r6
 f0 2e 55              stsp8	[sp+0x55], r6
 c2 02                 ldi8	r6, 0x2
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x47b
 f0 1c 55              ldsp8u	r4, [sp+0x55]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x2aa
<L16>:
 f0 3a 57              stsp16	[sp+0x57], r2
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 50                 stsp16	[sp+0x4], r4
 c2 01                 ldi8	r6, 0x1
 f1 4a                 stsp8	[sp+0x6], r6
 f0 2e 55              stsp8	[sp+0x55], r6
 f0 34 17              ldsp16	r4, [sp+0x17]
 f0 35 19              ldsp16	r5, [sp+0x19]
 f0 32 0b              ldsp16	r2, [sp+0xb]
 f0 33 0d              ldsp16	r3, [sp+0xd]
 f0 69 48              cmp32	q1, q2
 f2 69                 mov32	q2, q1
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x47b
<L17>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 37 1b              ldsp16	r7, [sp+0x1b]
 3b                    cmp	r6, r7
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3c9
<L18>:
 f3 5a                 ldsp8u	r6, [sp+0x6]
 f0 32 57              ldsp16	r2, [sp+0x57]
 f9 59                 or	r2, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x295
<L19>:
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 38                    cmp	r6, r4
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x2a4
<L20>:
 f0 1c 56              ldsp8u	r4, [sp+0x56]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x23d
<L21>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x5d5
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x499
 c0 01                 ldi8	r4, 0x1
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 1b 54              ldsp8u	r3, [sp+0x54]
 f0 3a 57              stsp16	[sp+0x57], r2
 c0 01                 ldi8	r4, 0x1
 f1 48                 stsp8	[sp+0x6], r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 50                 stsp16	[sp+0x4], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 35                 ldsp16	r5, [sp+0xd]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f6 2b                 tst16	r3
 f0 31 1f              ldsp16	r1, [sp+0x1f]
 f1 03                 mov	r0, r3
 f4 3e                 ldsp16	r6, [sp+0xf]
 f0 37 11              ldsp16	r7, [sp+0x11]
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x30c
<L22>:
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
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L23>:
 f4 a9                 inc16	r1
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d0 04                 breq8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x2d7
<L24>:
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
 d8 04                 bruge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L25>:
 f0 63 08              ldp24	q0, [q2]
 f0 36 13              ldsp16	r6, [sp+0x13]
 f0 37 15              ldsp16	r7, [sp+0x15]
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3b8
<L26>:
 f0 36 23              ldsp16	r6, [sp+0x23]
 f0 37 25              ldsp16	r7, [sp+0x25]
 f0 69 0c              cmp32	q0, q3
 c3 01                 ldi8	r7, 0x1
 d1 04                 brne8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3a9
<L27>:
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L28>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 00 06              ldi8	r0, 0x6
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 62 cc              ldp16	r6, [q3]
 ce 04                 cmpi.s8	r6, 0x4
 d2 04                 brult8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L29>:
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 62 ec              ldp16	r7, [q3]
 cf 21                 cmpi.s8	r7, 0x21
 d2 04                 brult8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L30>:
 0b                    mov	r6, r7
 fa 9d                 lsr16i	r6, 0xd
 f0 3e 21              stsp16	[sp+0x21], r6
 0b                    mov	r6, r7
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 37 21              ldsp16	r7, [sp+0x21]
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f1 2b                 mov	r6, r3
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f7 74                 sub32	q1, q0
 f0 04 f6 ff           ldi16	r0, 0xfff6
 f0 01 ff              ldi8	r1, 0xff
 f7 61                 add32	q0, q1
 f1 1e                 mov	r3, r6
 f0 32 57              ldsp16	r2, [sp+0x57]
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L31>:
 f0 34 1f              ldsp16	r4, [sp+0x1f]
 f2 23                 add	r4, r3
 44                    ld8u	r5, [r4]
 f1 77                 zext8	r7
 37                    cmp	r5, r7
 d8 04                 bruge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3f0
<L32>:
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5da
<L33>:
 f4 b3                 dec16	r3
 f0 2b 54              stsp8	[sp+0x54], r3
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x2b5
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 69 80              cmp32	q2, q0
 f0 32 57              ldsp16	r2, [sp+0x57]
 d0 04                 breq8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x3e1
<L34>:
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 38                    cmp	r6, r4
 d1 04                 brne8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x46c
<L35>:
 f0 1c 56              ldsp8u	r4, [sp+0x56]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x210
<L36>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x622
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f4 af                 inc16	r7
 c6 00 02              ldi16	r6, 0x200
 f0 3f 3e              stsp16	[sp+0x3e], r7
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L37>:
 f0 0f 07              cmpi.s8	r3, 0x7
 d2 04                 brult8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L38>:
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
 d0 04                 breq8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x628
<L39>:
 f0 1c 54              ldsp8u	r4, [sp+0x54]
 f4 ac                 inc16	r4
 f0 2c 54              stsp8	[sp+0x54], r4
 f1 74                 zext8	r4
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 11                    add	r4, r5
 a5                    xor	r5, r5
 51                    st8	[r4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 17              ldsp16	r6, [sp+0x17]
 f0 37 19              ldsp16	r7, [sp+0x19]
 f0 69 8c              cmp32	q2, q3
 f0 3a 57              stsp16	[sp+0x57], r2
 d0 04                 breq8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x472
<L40>:
 f0 36 38              ldsp16	r6, [sp+0x38]
 ce 01                 cmpi.s8	r6, 0x1
 f0 30 40              ldsp16	r0, [sp+0x40]
 f0 31 42              ldsp16	r1, [sp+0x42]
 d1 04                 brne8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x26d
<L41>:
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x47b
<L42>:
 f0 1a 06              ldsp8u	r2, [sp+0x6]
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 3e 1b              stsp16	[sp+0x1b], r6
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x280
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x499
 f0 30 40              ldsp16	r0, [sp+0x40]
 f0 31 42              ldsp16	r1, [sp+0x42]
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 3e 38              stsp16	[sp+0x38], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5b4
<L43>:
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 38                    cmp	r6, r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 32 57              ldsp16	r2, [sp+0x57]
 d0 04                 breq8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5b7
<L44>:
 f0 3c 38              stsp16	[sp+0x38], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 94                    or	r5, r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f2 30                 sub	r0, r0
 f0 1b 54              ldsp8u	r3, [sp+0x54]
 f0 3a 57              stsp16	[sp+0x57], r2
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x4cc
 c0 01                 ldi8	r4, 0x1
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 39                    cmp	r6, r5
 c1 02                 ldi8	r5, 0x2
 fb 2c                 cmov.eq	r5, r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 f5 1c                 cmp	r3, r4
 d8 04                 bruge8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5b7
<L45>:
 c0 01                 ldi8	r4, 0x1
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 2c 2d              stsp8	[sp+0x2d], r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 3c 2b              stsp16	[sp+0x2b], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 35                 ldsp16	r5, [sp+0xd]
 f0 3c 27              stsp16	[sp+0x27], r4
 f0 3d 29              stsp16	[sp+0x29], r5
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x520
<L46>:
 f1 08                 mov	r1, r0
 f1 71                 zext8	r1
 f0 32 1f              ldsp16	r2, [sp+0x1f]
 ed a4 20              ld8u	r5, [r2+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 27              leasp	r4, 0x27
 08                    mov	r6, r4
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L47>:
 f4 aa                 inc16	r2
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d0 04                 breq8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4f2
<L48>:
 f0 34 27              ldsp16	r4, [sp+0x27]
 f0 35 29              ldsp16	r5, [sp+0x29]
 f0 32 57              ldsp16	r2, [sp+0x57]
 f0 36 17              ldsp16	r6, [sp+0x17]
 f0 37 19              ldsp16	r7, [sp+0x19]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4be
<L49>:
 c1 01                 ldi8	r5, 0x1
 f0 2d 2d              stsp8	[sp+0x2d], r5
 f0 36 2b              ldsp16	r6, [sp+0x2b]
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 f5 23                 cmp	r4, r3
 d2 04                 brult8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x587
<L50>:
 f0 3e 21              stsp16	[sp+0x21], r6
 f1 08                 mov	r1, r0
 f1 71                 zext8	r1
 f0 32 1f              ldsp16	r2, [sp+0x1f]
 f2 11                 add	r2, r1
 ed a4 20              ld8u	r5, [r2+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 27              leasp	r4, 0x27
 08                    mov	r6, r4
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5c6
<L51>:
 f4 aa                 inc16	r2
 f4 a9                 inc16	r1
 f5 0b                 cmp	r1, r3
 d8 04                 bruge8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x54f
<L52>:
 f0 1c 2d              ldsp8u	r4, [sp+0x2d]
 f4 a4                 tst8	r4
 f0 32 57              ldsp16	r2, [sp+0x57]
 f0 36 21              ldsp16	r6, [sp+0x21]
 c1 01                 ldi8	r5, 0x1
 d1 04                 brne8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4be
<L53>:
 f0 34 32              ldsp16	r4, [sp+0x32]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4b1
<L54>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4be
<L55>:
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 f5 1c                 cmp	r3, r4
 d2 04                 brult8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x4cc
<L56>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x5b7
 f0 32 57              ldsp16	r2, [sp+0x57]
 f0 1c 56              ldsp8u	r4, [sp+0x56]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x1f2
<L57>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x5da
 cc 01                 cmpi.s8	r4, 0x1
 f0 32 57              ldsp16	r2, [sp+0x57]
 d0 04                 breq8	0x4 <L58>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L58>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x5e5
 c0 01                 ldi8	r4, 0x1
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L59>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x630
<L59>:
 f0 34 32              ldsp16	r4, [sp+0x32]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L60>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5f9
<L60>:
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x61b
 a0                    xor	r4, r4
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L61>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61b
<L61>:
 f0 35 38              ldsp16	r5, [sp+0x38]
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L62>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61b
<L62>:
 f4 a2                 tst8	r2
 d1 04                 brne8	0x4 <L63>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x61b
<L63>:
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 d6 59                 adjsp	0x59
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x5d7
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L64>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x5da
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
