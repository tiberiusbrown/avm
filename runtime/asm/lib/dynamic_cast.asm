
dynamic_cast.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 dynamic_cast.c
00000000 l    d  .text.__avm_dynamic_cast_to_void	00000000 .text.__avm_dynamic_cast_to_void
00000000 l    d  .text.__dynamic_cast	00000000 .text.__dynamic_cast
00000000 l     F .text.classify	000003be classify
00000000 l    d  .text.classify	00000000 .text.classify
00000000 l     F .text.cross_edge	000002ba cross_edge
00000000 l    d  .text.cross_edge	00000000 .text.cross_edge
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_dynamic_cast_to_void	0000006d __avm_dynamic_cast_to_void
00000000         *UND*	00000000 abort
00000000 g     F .text.__dynamic_cast	0000020c __dynamic_cast
00000000         *UND*	00000000 vtable for __cxxabiv1::__class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__vmi_class_type_info

Disassembly of section .text.__avm_dynamic_cast_to_void:

<__avm_dynamic_cast_to_void>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_dynamic_cast_to_void
		R_AVM_FAR24	.text.__avm_dynamic_cast_to_void+0x65
<L0>:
 c5 fd ff              ldi16	r5, 0xfffd
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_dynamic_cast_to_void
		R_AVM_FAR24	.text.__avm_dynamic_cast_to_void+0x61
<L1>:
 04                    mov	r5, r4
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_dynamic_cast_to_void
		R_AVM_FAR24	.text.__avm_dynamic_cast_to_void+0x61
<L2>:
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 fa ff              ldi16	r4, 0xfffa
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f9 64                 and	r3, r1
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c3 01                 ldi8	r7, 0x1
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_dynamic_cast_to_void
		R_AVM_FAR24	.text.__avm_dynamic_cast_to_void+0x66
<L3>:
 e3 00 00 00           callf	__avm_dynamic_cast_to_void
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__dynamic_cast:

<__dynamic_cast>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dd                 adjsp	-0x23
 f0 30 2e              ldsp16	r0, [sp+0x2e]
 f0 19 30              ldsp8u	r1, [sp+0x30]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x92
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c4 ff ff              ldi16	r4, 0xffff
 c1 ff                 ldi8	r5, 0xff
 88                    and	r6, r4
 8d                    and	r7, r5
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 06 05 06           ldi16	r2, 0x605
 f0 07 ff ff           ldi16	r3, 0xffff
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 69                 add32	q2, q1
 f0 06 05 0b           ldi16	r2, 0xb05
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L1>:
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__class_type_info
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__class_type_info
 f7 66                 add32	q1, q2
 f0 63 8c              ldp24	q2, [q3]
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x78
<L2>:
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x97
<L3>:
 f2 68                 mov32	q2, q0
 c6 05 06              ldi16	r6, 0x605
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 c6 05 0b              ldi16	r6, 0xb05
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L4>:
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0xc4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x201
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L5>:
 f2 68                 mov32	q2, q0
 c6 05 06              ldi16	r6, 0x605
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 c6 05 0b              ldi16	r6, 0xb05
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L6>:
 f0 63 c0              ldp24	q3, [q0]
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0xf5
<L7>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f0 00 06              ldi8	r0, 0x6
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0xf5
<L8>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f7 68                 add32	q2, q0
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L9>:
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 3d 18              stsp16	[sp+0x18], r5
 c4 fd ff              ldi16	r4, 0xfffd
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L10>:
 01                    mov	r4, r5
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L11>:
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 fa ff              ldi16	r4, 0xfffa
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 62                 add32	q0, q2
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 62                 add32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L12>:
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 63 8c              ldp24	q2, [q3]
 f0 06 05 06           ldi16	r2, 0x605
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 66                 add32	q1, q2
 c6 04 0b              ldi16	r6, 0xb04
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L13>:
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 38 16              stsp16	[sp+0x16], r0
 f0 14 0a              leasp	r4, 0xa
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L14>:
 f0 1c 1a              ldsp8u	r4, [sp+0x1a]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x1ca
<L15>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f5 04                 cmp	r0, r4
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L16>:
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 14 0a              leasp	r4, 0xa
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify
 f0 1d 1a              ldsp8u	r5, [sp+0x1a]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L17>:
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x208
<L18>:
 f0 1c 20              ldsp8u	r4, [sp+0x20]
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x1dc
<L19>:
 f0 34 21              ldsp16	r4, [sp+0x21]
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__dynamic_cast+0x201
 f0 1d 1f              ldsp8u	r5, [sp+0x1f]
 f0 1e 1c              ldsp8u	r6, [sp+0x1c]
 a0                    xor	r4, r4
 f0 1f 1b              ldsp8u	r7, [sp+0x1b]
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x201
<L20>:
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x201
<L21>:
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__dynamic_cast
		R_AVM_FAR24	.text.__dynamic_cast+0x201
<L22>:
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 d6 23                 adjsp	0x23
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 e3 00 00 00           callf	__dynamic_cast
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort

Disassembly of section .text.classify:

<classify>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 bf                 adjsp	-0x41
 f1 1c                 mov	r3, r4
 08                    mov	r6, r4
 ca 13                 addi.s8	r6, 0x13
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 6b 8c              st32	[r6], q2
 f1 2b                 mov	r6, r3
 ca 10                 addi.s8	r6, 0x10
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 f2 30                 sub	r0, r0
 ee 16 37              st16	[r3+23], r0
 f0 6a c6              ld32	q3, [r3]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ed 36 2c              ld16	r1, [r3+12]
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 2d 40              stsp8	[sp+0x40], r5
 c0 06                 ldi8	r4, 0x6
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f7 6e                 add32	q3, q2
 f0 3e 17              stsp16	[sp+0x17], r6
 f0 3f 19              stsp16	[sp+0x19], r7
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f7 6e                 add32	q3, q2
 f0 3e 11              stsp16	[sp+0x11], r6
 f0 3f 13              stsp16	[sp+0x13], r7
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__class_type_info
 f7 6e                 add32	q3, q2
 f4 6e                 stsp16	[sp+0xb], r6
 f4 77                 stsp16	[sp+0xd], r7
 f0 28 36              stsp8	[sp+0x36], r0
 f0 14 36              leasp	r4, 0x36
 f0 3c 15              stsp16	[sp+0x15], r4
 f0 3b 2c              stsp16	[sp+0x2c], r3
 f0 1c 3f              ldsp8u	r4, [sp+0x3f]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x174
<L0>:
 f0 38 2a              stsp16	[sp+0x2a], r0
 f0 1a 3e              ldsp8u	r2, [sp+0x3e]
 c0 01                 ldi8	r4, 0x1
 f1 58                 stsp8	[sp+0xa], r4
 f1 19                 mov	r3, r1
 f0 39 08              stsp16	[sp+0x8], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f6 2a                 tst16	r2
 f0 31 15              ldsp16	r1, [sp+0x15]
 f1 02                 mov	r0, r2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0xb7
<L1>:
 ed a2 20              ld8u	r5, [r1+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 04              leasp	r4, 0x4
 08                    mov	r6, r4
 e3 00 00 00           callf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x380
<L2>:
 f4 a9                 inc16	r1
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x8e
<L3>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 05 06              ldi16	r6, 0x605
 c7 ff ff              ldi16	r7, 0xffff
 f7 6e                 add32	q3, q2
 f0 04 05 0b           ldi16	r0, 0xb05
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x38f
<L4>:
 f0 63 08              ldp24	q0, [q2]
 f4 2e                 ldsp16	r6, [sp+0xb]
 f4 37                 ldsp16	r7, [sp+0xd]
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x161
<L5>:
 f0 36 11              ldsp16	r6, [sp+0x11]
 f0 37 13              ldsp16	r7, [sp+0x13]
 f0 69 0c              cmp32	q0, q3
 c2 01                 ldi8	r6, 0x1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x152
<L6>:
 f0 36 17              ldsp16	r6, [sp+0x17]
 f0 37 19              ldsp16	r7, [sp+0x19]
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x39b
<L7>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 00 06              ldi8	r0, 0x6
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 62 cc              ldp16	r6, [q3]
 ce 04                 cmpi.s8	r6, 0x4
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x3a1
<L8>:
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 62 cc              ldp16	r6, [q3]
 ce 21                 cmpi.s8	r6, 0x21
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x3a7
<L9>:
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 f0 3f 1b              stsp16	[sp+0x1b], r7
 f4 7e                 stsp16	[sp+0xf], r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 3e 1b              stsp16	[sp+0x1b], r6
 f0 3f 1d              stsp16	[sp+0x1d], r7
 f4 3e                 ldsp16	r6, [sp+0xf]
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f0 36 1b              ldsp16	r6, [sp+0x1b]
 f7 73                 sub32	q0, q3
 c6 f6 ff              ldi16	r6, 0xfff6
 c3 ff                 ldi8	r7, 0xff
 f7 6c                 add32	q3, q0
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x3ad
<L10>:
 f4 3e                 ldsp16	r6, [sp+0xf]
 f0 37 15              ldsp16	r7, [sp+0x15]
 f2 2e                 add	r7, r2
 47                    ld8u	r5, [r7]
 f1 76                 zext8	r6
 36                    cmp	r5, r6
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x31e
<L11>:
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x395
<L12>:
 f4 b2                 dec16	r2
 f0 2a 3e              stsp8	[sp+0x3e], r2
 f1 0b                 mov	r1, r3
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x70
 f0 39 08              stsp16	[sp+0x8], r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c0 01                 ldi8	r4, 0x1
 f1 58                 stsp8	[sp+0xa], r4
 f0 2c 3f              stsp8	[sp+0x3f], r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f1 2b                 mov	r6, r3
 ca 08                 addi.s8	r6, 0x8
 f0 6a cc              ld32	q3, [r6]
 f0 3e 1b              stsp16	[sp+0x1b], r6
 f0 3f 1d              stsp16	[sp+0x1d], r7
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x1e2
<L13>:
 ed c6 32              ld8u	r6, [r3+18]
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x1c4
<L14>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x1e2
<L15>:
 c2 01                 ldi8	r6, 0x1
 ee c6 32              st8	[r3+18], r6
 f4 22                 ldsp16	r6, [sp+0x8]
 ee d6 33              st16	[r3+19], r6
 f3 6a                 ldsp8u	r6, [sp+0xa]
 ee c6 35              st8	[r3+21], r6
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x1e2
 ed d6 33              ld16	r6, [r3+19]
 f4 23                 ldsp16	r7, [sp+0x8]
 3e                    cmp	r7, r6
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x1dd
<L16>:
 ed c6 35              ld8u	r6, [r3+21]
 f3 6b                 ldsp8u	r7, [sp+0xa]
 9e                    or	r7, r6
 ee e6 35              st8	[r3+21], r7
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x1e2
 c2 02                 ldi8	r6, 0x2
 ee c6 32              st8	[r3+18], r6
 f1 2b                 mov	r6, r3
 ca 04                 addi.s8	r6, 0x4
 f0 6a cc              ld32	q3, [r6]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x36f
<L17>:
 ed 96 2e              ld16	r4, [r3+14]
 f4 21                 ldsp16	r5, [sp+0x8]
 34                    cmp	r5, r4
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x36f
<L18>:
 f0 38 2a              stsp16	[sp+0x2a], r0
 f0 02 01              ldi8	r2, 0x1
 ee 46 30              st8	[r3+16], r2
 ed 86 31              ld8u	r4, [r3+17]
 f3 69                 ldsp8u	r5, [sp+0xa]
 94                    or	r5, r4
 ee a6 31              st8	[r3+17], r5
 aa                    xor	r6, r6
 f0 1c 3e              ldsp8u	r4, [sp+0x3e]
 f4 7c                 stsp16	[sp+0xf], r4
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x228
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f4 3d                 ldsp16	r5, [sp+0xf]
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x36c
<L19>:
 f0 2a 27              stsp8	[sp+0x27], r2
 f0 39 25              stsp16	[sp+0x25], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3c 21              stsp16	[sp+0x21], r4
 f0 3d 23              stsp16	[sp+0x23], r5
 f1 06                 mov	r0, r6
 f1 70                 zext8	r0
 f4 a6                 tst8	r6
 f0 3e 1f              stsp16	[sp+0x1f], r6
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x283
<L20>:
 f1 19                 mov	r3, r1
 f1 0e                 mov	r1, r6
 f1 71                 zext8	r1
 f0 32 15              ldsp16	r2, [sp+0x15]
 ed a4 20              ld8u	r5, [r2+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 21              leasp	r4, 0x21
 08                    mov	r6, r4
 e3 00 00 00           callf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x389
<L21>:
 f4 aa                 inc16	r2
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x250
<L22>:
 f0 34 21              ldsp16	r4, [sp+0x21]
 f0 35 23              ldsp16	r5, [sp+0x23]
 f1 0b                 mov	r1, r3
 f0 33 2c              ldsp16	r3, [sp+0x2c]
 f0 02 01              ldi8	r2, 0x1
 f0 36 1b              ldsp16	r6, [sp+0x1b]
 f0 37 1d              ldsp16	r7, [sp+0x1d]
 f0 69 8c              cmp32	q2, q3
 f0 36 1f              ldsp16	r6, [sp+0x1f]
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x21a
<L23>:
 f0 2a 27              stsp8	[sp+0x27], r2
 f0 37 25              ldsp16	r7, [sp+0x25]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f4 3d                 ldsp16	r5, [sp+0xf]
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x2ee
<L24>:
 f0 3f 28              stsp16	[sp+0x28], r7
 f1 11                 mov	r2, r1
 f0 31 15              ldsp16	r1, [sp+0x15]
 f2 08                 add	r1, r0
 ed a2 20              ld8u	r5, [r1+0]
 f4 b5                 dec16	r5
 f1 75                 zext8	r5
 f0 14 21              leasp	r4, 0x21
 08                    mov	r6, r4
 e3 00 00 00           callf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x382
<L25>:
 f4 a9                 inc16	r1
 f4 a8                 inc16	r0
 f4 3c                 ldsp16	r4, [sp+0xf]
 f5 04                 cmp	r0, r4
 d8 04                 bruge8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x2b1
<L26>:
 f0 1c 27              ldsp8u	r4, [sp+0x27]
 f4 a4                 tst8	r4
 f1 0a                 mov	r1, r2
 f0 02 01              ldi8	r2, 0x1
 f0 36 1f              ldsp16	r6, [sp+0x1f]
 f0 37 28              ldsp16	r7, [sp+0x28]
 d1 04                 brne8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x21a
<L27>:
 ed 86 36              ld8u	r4, [r3+22]
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x30b
<L28>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x21a
<L29>:
 ee f6 37              st16	[r3+23], r7
 ee 46 36              st8	[r3+22], r2
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x21a
 ed 96 37              ld16	r4, [r3+23]
 3c                    cmp	r7, r4
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x21a
<L30>:
 c0 02                 ldi8	r4, 0x2
 ee 86 36              st8	[r3+22], r4
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x21a
 c0 03                 ldi8	r4, 0x3
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f4 a8                 inc16	r0
 f0 0e 07              cmpi.s8	r2, 0x7
 d2 04                 brult8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x382
<L31>:
 c6 00 02              ldi16	r6, 0x200
 f5 28                 cmp	r6, r0
 f1 0b                 mov	r1, r3
 f0 33 2c              ldsp16	r3, [sp+0x2c]
 d8 04                 bruge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x382
<L32>:
 01                    mov	r4, r5
 f4 ac                 inc16	r4
 5c                    st8	[r7], r4
 f0 14 04              leasp	r4, 0x4
 08                    mov	r6, r4
 e3 00 00 00           callf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.cross_edge
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x3b3
<L33>:
 f0 1c 3e              ldsp8u	r4, [sp+0x3e]
 f4 ac                 inc16	r4
 f0 2c 3e              stsp8	[sp+0x3e], r4
 f1 74                 zext8	r4
 f0 35 15              ldsp16	r5, [sp+0x15]
 11                    add	r4, r5
 a5                    xor	r5, r5
 51                    st8	[r4], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x188
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f0 1c 40              ldsp8u	r4, [sp+0x40]
 f4 a4                 tst8	r4
 c0 01                 ldi8	r4, 0x1
 d1 04                 brne8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	classify
		R_AVM_FAR24	.text.classify+0x5f
<L34>:
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x382
 c0 02                 ldi8	r4, 0x2
 d6 41                 adjsp	0x41
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x382
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x382
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x382
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x382
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x382
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x382
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x382
 04                    mov	r5, r4
 cc 01                 cmpi.s8	r4, 0x1
 c0 02                 ldi8	r4, 0x2
 fb 25                 cmov.eq	r4, r5
 e2 00 00 00           jmpf	classify
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.classify+0x382

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
