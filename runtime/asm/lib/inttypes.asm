
inttypes.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 inttypes.c
00000000 l    d  .text.imaxabs	00000000 .text.imaxabs
00000000 l    d  .text.imaxdiv	00000000 .text.imaxdiv
00000000 l    d  .text.strtoimax	00000000 .text.strtoimax
00000000 l    d  .text.strtoumax	00000000 .text.strtoumax
00000000 l    d  .text.wcstoimax	00000000 .text.wcstoimax
00000000 l     F .text.parse_wide	0000030e parse_wide
00000000 l    d  .text.parse_wide	00000000 .text.parse_wide
00000000 l    d  .text.wcstoumax	00000000 .text.wcstoumax
00000000 g     F .text.imaxabs	00000004 imaxabs
00000000         *UND*	00000000 llabs
00000000 g     F .text.imaxdiv	00000072 imaxdiv
00000000         *UND*	00000000 lldiv
00000000 g     F .text.strtoimax	00000004 strtoimax
00000000         *UND*	00000000 strtoll
00000000 g     F .text.strtoumax	00000004 strtoumax
00000000         *UND*	00000000 strtoull
00000000 g     F .text.wcstoimax	0000007f wcstoimax
00000000         *UND*	00000000 __avm_udivmoddi4
00000000         *UND*	00000000 __avm_muldi3
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.wcstoumax	00000078 wcstoumax

Disassembly of section .text.imaxabs:

<imaxabs>:
 e2 00 00 00           jmpf	imaxabs
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	llabs

Disassembly of section .text.imaxdiv:

<imaxdiv>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 f0 36 21              ldsp16	r6, [sp+0x21]
 f0 37 23              ldsp16	r7, [sp+0x23]
 f0 32 25              ldsp16	r2, [sp+0x25]
 f0 33 27              ldsp16	r3, [sp+0x27]
 f0 30 29              ldsp16	r0, [sp+0x29]
 f0 31 2b              ldsp16	r1, [sp+0x2b]
 d6 f0                 adjsp	-0x10
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 14 12              leasp	r4, 0x12
 e3 00 00 00           callf	imaxdiv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	lldiv
 d6 10                 adjsp	0x10
 f4 01                 ldsp16	r5, [sp+0x0]
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f0 6b 08              st32	[r4], q0
 f0 6b ca              st32	[r5], q3
 01                    mov	r4, r5
 c8 0c                 addi.s8	r4, 0xc
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 6b 08              st32	[r4], q0
 01                    mov	r4, r5
 c8 08                 addi.s8	r4, 0x8
 f0 6b c8              st32	[r4], q3
 01                    mov	r4, r5
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strtoimax:

<strtoimax>:
 e2 00 00 00           jmpf	strtoimax
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtoll

Disassembly of section .text.strtoumax:

<strtoumax>:
 e2 00 00 00           jmpf	strtoumax
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtoull

Disassembly of section .text.wcstoimax:

<wcstoimax>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 d6 ec                 adjsp	-0x14
 f0 17 18              leasp	r7, 0x18
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 17 1a              leasp	r7, 0x1a
 f0 3f 10              stsp16	[sp+0x10], r7
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 e3 00 00 00           callf	wcstoimax
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide
 d6 14                 adjsp	0x14
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 69 80              cmp32	q2, q0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f8 0a                 cset.ne	r2
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 69                 add32	q2, q1
 f2 64                 mov32	q1, q0
 f7 76                 sub32	q1, q2
 f7 73                 sub32	q0, q3
 f4 18                 ldsp16	r4, [sp+0x6]
 f6 2c                 tst16	r4
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.parse_wide:

<parse_wide>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ce                 adjsp	-0x32
 f0 30 49              ldsp16	r0, [sp+0x49]
 f0 31 4b              ldsp16	r1, [sp+0x4b]
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 30 45              ldsp16	r0, [sp+0x45]
 f0 31 47              ldsp16	r1, [sp+0x47]
 f0 32 41              ldsp16	r2, [sp+0x41]
 f0 33 43              ldsp16	r3, [sp+0x43]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 32 3d              ldsp16	r2, [sp+0x3d]
 f0 33 3f              ldsp16	r3, [sp+0x3f]
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 37 4f              ldsp16	r7, [sp+0x4f]
 f0 33 4d              ldsp16	r3, [sp+0x4d]
 f2 42                 sub	r2, r2
 ee 56 20              st16	[r3+0], r2
 f4 6b                 stsp16	[sp+0xa], r7
 f5 5e                 st16	[r7], r2
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x48
<L0>:
 74                    st16	[r5], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x70
<L1>:
 0e                    mov	r7, r6
 cb db                 addi.s8	r7, -0x25
 cf dd                 cmpi.s8	r7, -0x23
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x70
<L2>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c0 16                 ldi8	r4, 0x16
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e2 00 00 00           jmpf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide+0x2ca
 f4 ac                 inc16	r4
 44                    ld8u	r5, [r4]
 0d                    mov	r7, r5
 cb f7                 addi.s8	r7, -0x9
 cf 05                 cmpi.s8	r7, 0x5
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x6e
<L3>:
 cd 20                 cmpi.s8	r5, 0x20
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x6e
<L4>:
 cd 2b                 cmpi.s8	r5, 0x2b
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x94
<L5>:
 cd 2d                 cmpi.s8	r5, 0x2d
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x9d
<L6>:
 cd 2d                 cmpi.s8	r5, 0x2d
 f8 05                 cset.eq	r5
 ee b6 20              st16	[r3+0], r5
 f4 ac                 inc16	r4
 c1 2f                 ldi8	r5, 0x2f
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x100
<L7>:
 44                    ld8u	r5, [r4]
 cd 30                 cmpi.s8	r5, 0x30
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0xfa
<L8>:
 ed 48 21              ld8u	r2, [r4+1]
 c3 20                 ldi8	r7, 0x20
 f9 e9                 or	r7, r2
 c1 08                 ldi8	r5, 0x8
 cf 78                 cmpi.s8	r7, 0x78
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0xfc
<L9>:
 f0 02 10              ldi8	r2, 0x10
 0c                    mov	r7, r4
 cb 02                 addi.s8	r7, 0x2
 f0 3f 1e              stsp16	[sp+0x1e], r7
 ed a8 22              ld8u	r5, [r4+2]
 0d                    mov	r7, r5
 cb d0                 addi.s8	r7, -0x30
 f1 77                 zext8	r7
 cf 0a                 cmpi.s8	r7, 0xa
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x105
<L10>:
 0d                    mov	r7, r5
 cb 9f                 addi.s8	r7, -0x61
 f1 77                 zext8	r7
 cf 1a                 cmpi.s8	r7, 0x1a
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x2e9
<L11>:
 c7 a9 ff              ldi16	r7, 0xffa9
 1d                    add	r7, r5
 cf 10                 cmpi.s8	r7, 0x10
 c1 08                 ldi8	r5, 0x8
 d2 04                 brult8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0xfc
<L12>:
 e2 00 00 00           jmpf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide+0x105
 c1 0a                 ldi8	r5, 0xa
 f6 2e                 tst16	r6
 fb 35                 cmov.eq	r6, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f1 16                 mov	r2, r6
 f0 3a 0c              stsp16	[sp+0xc], r2
 ed 96 20              ld16	r4, [r3+0]
 f6 2c                 tst16	r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 d6 f6                 adjsp	-0xa
 f0 14 32              leasp	r4, 0x32
 f4 60                 stsp16	[sp+0x8], r4
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 2e              stsp16	[sp+0x2e], r0
 f0 39 30              stsp16	[sp+0x30], r1
 f2 68                 mov32	q2, q0
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 e3 00 00 00           callf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivmoddi4
 d6 0a                 adjsp	0xa
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 61                 mov32	q0, q1
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f4 32                 ldsp16	r6, [sp+0xc]
 f1 14                 mov	r2, r4
 e2 00 00 00           jmpf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide+0x182
 c0 01                 ldi8	r4, 0x1
 f4 29                 ldsp16	r5, [sp+0xa]
 74                    st16	[r5], r4
 f4 b3                 dec16	r3
 f4 aa                 inc16	r2
 f4 32                 ldsp16	r6, [sp+0xc]
 ed e4 20              ld8u	r7, [r2+0]
 03                    mov	r4, r7
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x1a7
<L13>:
 cb d0                 addi.s8	r7, -0x30
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x1df
<L14>:
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x2d2
<L15>:
 e2 00 00 00           jmpf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide+0x2a0
 03                    mov	r4, r7
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d2 04                 brult8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x1c9
<L16>:
 cb a9                 addi.s8	r7, -0x57
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x1df
<L17>:
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x2d2
<L18>:
 e2 00 00 00           jmpf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide+0x2a0
 03                    mov	r4, r7
 c8 c9                 addi.s8	r4, -0x37
 cb bf                 addi.s8	r7, -0x41
 f1 77                 zext8	r7
 c5 ff ff              ldi16	r5, 0xffff
 cf 1a                 cmpi.s8	r7, 0x1a
 fc 2c                 cmov.ult	r5, r4
 0d                    mov	r7, r5
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x298
<L19>:
 f4 63                 stsp16	[sp+0x8], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 69 c0              cmp32	q3, q0
 f8 15                 cset.ult	r5
 f0 69 0c              cmp32	q0, q3
 fb 2c                 cmov.eq	r5, r4
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x177
<L20>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 3b 30              stsp16	[sp+0x30], r3
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f2 6a                 mov32	q3, q0
 f2 64                 mov32	q1, q0
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f2 61                 mov32	q0, q1
 98                    or	r6, r4
 9d                    or	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x244
<L21>:
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 23                 ldsp16	r7, [sp+0x8]
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x177
<L22>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 6a                    ld16	r6, [r6]
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x291
<L23>:
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 33 30              ldsp16	r3, [sp+0x30]
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 69 08              cmp32	q0, q2
 f8 14                 cset.ult	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f0 34 14              ldsp16	r4, [sp+0x14]
 07                    mov	r5, r7
 f7 62                 add32	q0, q2
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 e2 00 00 00           jmpf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide+0x17c
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x2d2
<L24>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x2ad
<L25>:
 f5 52                 st16	[r4], r2
 f4 28                 ldsp16	r4, [sp+0xa]
 60                    ld16	r4, [r4]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x2dc
<L26>:
 c0 22                 ldi8	r4, 0x22
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide+0x2dc
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6a                 mov32	q3, q0
 d6 32                 adjsp	0x32
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 0d                    mov	r7, r5
 cb bf                 addi.s8	r7, -0x41
 f1 77                 zext8	r7
 cf 1a                 cmpi.s8	r7, 0x1a
 d2 04                 brult8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x308
<L27>:
 c7 c9 ff              ldi16	r7, 0xffc9
 1d                    add	r7, r5
 cf 10                 cmpi.s8	r7, 0x10
 c1 08                 ldi8	r5, 0x8
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_wide
		R_AVM_FAR24	.text.parse_wide+0x105
<L28>:
 e2 00 00 00           jmpf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide+0xfc
 c1 08                 ldi8	r5, 0x8
 e2 00 00 00           jmpf	parse_wide
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide+0xfc

Disassembly of section .text.wcstoumax:

<wcstoumax>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 ec                 adjsp	-0x14
 f0 17 14              leasp	r7, 0x14
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 17 16              leasp	r7, 0x16
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e3 00 00 00           callf	wcstoumax
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_wide
 d6 14                 adjsp	0x14
 f0 32 00              ldsp16	r2, [sp+0x0]
 f6 2a                 tst16	r2
 f2 64                 mov32	q1, q0
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstoumax
		R_AVM_FAR24	.text.wcstoumax+0x6d
<L0>:
 f0 30 02              ldsp16	r0, [sp+0x2]
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstoumax
		R_AVM_FAR24	.text.wcstoumax+0x69
<L1>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f8 08                 cset.ne	r0
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f2 61                 mov32	q0, q1
 f7 72                 sub32	q0, q2
 f7 77                 sub32	q1, q3
 e2 00 00 00           jmpf	wcstoumax
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wcstoumax+0x6d
 f2 62                 mov32	q0, q2
 f2 67                 mov32	q1, q3
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
