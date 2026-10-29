
stdlib.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    d  .text.rand	00000000 .text.rand
00000000 l    d  .text.srand	00000000 .text.srand
00000000 l    d  .text.atoi	00000000 .text.atoi
00000000 l    d  .text.strtol	00000000 .text.strtol
00000000 l     F .text.parse_ulong	0000021c parse_ulong
00000000 l    d  .text.parse_ulong	00000000 .text.parse_ulong
00000000 l    d  .text.strtoul	00000000 .text.strtoul
00000000 l    d  .text.strtoll	00000000 .text.strtoll
00000000 l     F .text.parse_ullong	0000030c parse_ullong
00000000 l    d  .text.parse_ullong	00000000 .text.parse_ullong
00000000 l    d  .text.strtoull	00000000 .text.strtoull
00000000 l    d  .text.atol	00000000 .text.atol
00000000 l    d  .text.atoll	00000000 .text.atoll
00000000 l    d  .text.atof	00000000 .text.atof
00000000 l    d  .text.abs	00000000 .text.abs
00000000 l    d  .text.labs	00000000 .text.labs
00000000 l    d  .text.llabs	00000000 .text.llabs
00000000 l    d  .text.div	00000000 .text.div
00000000 l    d  .text.ldiv	00000000 .text.ldiv
00000000 l    d  .text.lldiv	00000000 .text.lldiv
00000000 l    d  .text.getenv	00000000 .text.getenv
00000000 l    d  .text.system	00000000 .text.system
00000000 g     F .text.rand	00000007 rand
00000000         *UND*	00000000 avm_random
00000000 g     F .text.srand	00000004 srand
00000000         *UND*	00000000 avm_set_random_seed
00000000 g     F .text.atoi	00000102 atoi
00000000         *UND*	00000000 isspace
00000000 g     O .data.__avm_errno	00000002 __avm_errno
00000000 g     F .text.strtol	00000045 strtol
00000000         *UND*	00000000 __avm_udivmodsi4
00000000         *UND*	00000000 __avm_mulsi3
00000000 g     F .text.strtoul	00000051 strtoul
00000000 g     F .text.strtoll	0000007f strtoll
00000000         *UND*	00000000 __avm_udivmoddi4
00000000         *UND*	00000000 __avm_muldi3
00000000 g     F .text.strtoull	00000078 strtoull
00000000 g     F .text.atol	0000013d atol
00000000         *UND*	00000000 __avm_umodsi3
00000000 g     F .text.atoll	00000223 atoll
00000000         *UND*	00000000 __avm_umoddi3
00000000 g     F .text.atof	00000005 atof
00000000         *UND*	00000000 strtod
00000000 g     F .text.abs	00000006 abs
00000000 g     F .text.labs	00000009 labs
00000000 g     F .text.llabs	00000034 llabs
00000000 g     F .text.div	0000000a div
00000000 g     F .text.ldiv	00000033 ldiv
00000000         *UND*	00000000 __avm_divmodsi4
00000000 g     F .text.lldiv	00000062 lldiv
00000000         *UND*	00000000 __avm_divmoddi4
00000000 g     F .text.getenv	00000002 getenv
00000000 g     F .text.system	0000000a system

Disassembly of section .text.rand:

<rand>:
 e3 00 00 00           callf	rand
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_random
 f4 8c                 lsr16.1	r4
 ef                    ret

Disassembly of section .text.srand:

<srand>:
 e2 00 00 00           jmpf	srand
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_set_random_seed

Disassembly of section .text.atoi:

<atoi>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f1 04                 mov	r0, r4
 f1 08                 mov	r1, r0
 f0 6c 81              ld8u	r4, [r0+]
 e3 00 00 00           callf	atoi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0x8
<L0>:
 ed 82 20              ld8u	r4, [r1+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 aa                    xor	r6, r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0x3a
<L1>:
 cc 2d                 cmpi.s8	r4, 0x2d
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0x43
<L2>:
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 c4 00 80              ldi16	r4, 0x8000
 f1 08                 mov	r1, r0
 e2 00 00 00           jmpf	atoi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoi+0x48
 c4 ff 7f              ldi16	r4, 0x7fff
 f1 08                 mov	r1, r0
 e2 00 00 00           jmpf	atoi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoi+0x46
 c4 ff 7f              ldi16	r4, 0x7fff
 f4 4a                 stsp16	[sp+0x2], r6
 c1 0a                 ldi8	r5, 0xa
 f4 40                 stsp16	[sp+0x0], r4
 f1 04                 mov	r0, r4
 ec 45                 urem16	r0, r5
 0e                    mov	r7, r6
 f1 1e                 mov	r3, r6
 e2 00 00 00           jmpf	atoi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoi+0x6e
 f1 27                 mov	r5, r3
 f1 16                 mov	r2, r6
 c2 0a                 ldi8	r6, 0xa
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f6 2a                 tst16	r2
 fb 1c                 cmov.eq	r3, r4
 f1 27                 mov	r5, r3
 f4 b7                 dec16	r7
 f4 a9                 inc16	r1
 f1 2a                 mov	r6, r2
 f1 1d                 mov	r3, r5
 ed 82 20              ld8u	r4, [r1+0]
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0x92
<L3>:
 c8 d0                 addi.s8	r4, -0x30
 f0 02 01              ldi8	r2, 0x1
 c5 cc 0c              ldi16	r5, 0xccc
 f5 27                 cmp	r5, r3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0x64
<L4>:
 e2 00 00 00           jmpf	atoi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoi+0xc4
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 f1 75                 zext8	r5
 cd 1a                 cmpi.s8	r5, 0x1a
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0xd8
<L5>:
 04                    mov	r5, r4
 c9 bf                 addi.s8	r5, -0x41
 f1 75                 zext8	r5
 cd 1a                 cmpi.s8	r5, 0x1a
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0xd8
<L6>:
 c8 c9                 addi.s8	r4, -0x37
 cc 0a                 cmpi.s8	r4, 0xa
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0xd8
<L7>:
 f0 02 01              ldi8	r2, 0x1
 c5 cc 0c              ldi16	r5, 0xccc
 f5 27                 cmp	r5, r3
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0x64
<L8>:
 f5 1d                 cmp	r3, r5
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0x57
<L9>:
 f5 04                 cmp	r0, r4
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0x66
<L10>:
 e2 00 00 00           jmpf	atoi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoi+0x57
 a5                    xor	r5, r5
 f6 2f                 tst16	r7
 01                    mov	r4, r5
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0xf4
<L11>:
 f6 2e                 tst16	r6
 f1 23                 mov	r4, r3
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoi
		R_AVM_FAR24	.text.atoi+0xf4
<L12>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 f4 00                 ldsp16	r4, [sp+0x0]
 24                    sub	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 a6                 tst8	r6
 fb 65                 cmov.ne	r4, r5
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strtol:

<strtol>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 f4                 adjsp	-0xc
 f0 17 0c              leasp	r7, 0xc
 f4 6b                 stsp16	[sp+0xa], r7
 f0 17 0e              leasp	r7, 0xe
 f4 63                 stsp16	[sp+0x8], r7
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e3 00 00 00           callf	strtol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong
 d6 0c                 adjsp	0xc
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f7 72                 sub32	q0, q2
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 2e                 tst16	r6
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.parse_ulong:

<parse_ulong>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 f1 0e                 mov	r1, r6
 f1 04                 mov	r0, r4
 f0 36 27              ldsp16	r6, [sp+0x27]
 f0 37 29              ldsp16	r7, [sp+0x29]
 f0 32 23              ldsp16	r2, [sp+0x23]
 f0 33 25              ldsp16	r3, [sp+0x25]
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 34 2d              ldsp16	r4, [sp+0x2d]
 f0 33 2b              ldsp16	r3, [sp+0x2b]
 f2 42                 sub	r2, r2
 ee 56 20              st16	[r3+0], r2
 f4 58                 stsp16	[sp+0x6], r4
 f5 52                 st16	[r4], r2
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x35
<L0>:
 f5 54                 st16	[r5], r0
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x51
<L1>:
 f1 21                 mov	r4, r1
 c8 db                 addi.s8	r4, -0x25
 cc dd                 cmpi.s8	r4, -0x23
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x51
<L2>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c2 16                 ldi8	r6, 0x16
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong+0x1ee
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f1 10                 mov	r2, r0
 f0 6c 81              ld8u	r4, [r0+]
 e3 00 00 00           callf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x5c
<L3>:
 ed 84 20              ld8u	r4, [r2+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x80
<L4>:
 cc 2d                 cmpi.s8	r4, 0x2d
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x89
<L5>:
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 04                 cset.eq	r4
 ee 96 20              st16	[r3+0], r4
 f1 10                 mov	r2, r0
 c0 2f                 ldi8	r4, 0x2f
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x9b
<L6>:
 f1 23                 mov	r4, r3
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong+0xf6
 ed 84 20              ld8u	r4, [r2+0]
 cc 30                 cmpi.s8	r4, 0x30
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0xed
<L7>:
 f1 23                 mov	r4, r3
 ed c4 21              ld8u	r6, [r2+1]
 c1 20                 ldi8	r5, 0x20
 96                    or	r5, r6
 f0 00 08              ldi8	r0, 0x8
 cd 78                 cmpi.s8	r5, 0x78
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0xf2
<L8>:
 c3 10                 ldi8	r7, 0x10
 f1 1a                 mov	r3, r2
 f0 0b 02              addi.s8	r3, 0x2
 ed a4 22              ld8u	r5, [r2+2]
 09                    mov	r6, r5
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0xfa
<L9>:
 09                    mov	r6, r5
 ca 9f                 addi.s8	r6, -0x61
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x1ff
<L10>:
 c6 a9 ff              ldi16	r6, 0xffa9
 19                    add	r6, r5
 ce 10                 cmpi.s8	r6, 0x10
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0xf2
<L11>:
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong+0xfa
 f1 23                 mov	r4, r3
 f0 00 0a              ldi8	r0, 0xa
 f6 29                 tst16	r1
 fb 08                 cmov.eq	r1, r0
 f1 1a                 mov	r3, r2
 f1 2d                 mov	r7, r1
 60                    ld16	r4, [r4]
 f6 2c                 tst16	r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d6 fe                 adjsp	-0x2
 f0 16 16              leasp	r6, 0x16
 f4 42                 stsp16	[sp+0x0], r6
 f4 53                 stsp16	[sp+0x4], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 e3 00 00 00           callf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 62                 stsp16	[sp+0x8], r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong+0x141
 c2 01                 ldi8	r6, 0x1
 7e                    st16	[r7], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b6                 dec16	r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 ab                 inc16	r3
 ed 46 20              ld8u	r2, [r3+0]
 f1 2a                 mov	r6, r2
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d2 04                 brult8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x159
<L12>:
 f0 0a d0              addi.s8	r2, -0x30
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong+0x183
 f1 2a                 mov	r6, r2
 ca 9f                 addi.s8	r6, -0x61
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x16e
<L13>:
 f0 0a a9              addi.s8	r2, -0x57
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong+0x183
 f1 2a                 mov	r6, r2
 ca c9                 addi.s8	r6, -0x37
 f0 0a bf              addi.s8	r2, -0x41
 f1 72                 zext8	r2
 c7 ff ff              ldi16	r7, 0xffff
 f0 0e 1a              cmpi.s8	r2, 0x1a
 fc 3e                 cmov.ult	r7, r6
 f1 17                 mov	r2, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f5 16                 cmp	r2, r6
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x1c7
<L14>:
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x136
<L15>:
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x1a9
<L16>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 2a                 cmp	r6, r2
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x136
<L17>:
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x139
<L18>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e3 00 00 00           callf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f4 1b                 ldsp16	r7, [sp+0x6]
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong+0x139
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x1f6
<L19>:
 f0 36 12              ldsp16	r6, [sp+0x12]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x1de
<L20>:
 f5 5b                 st16	[r6], r3
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0x1f8
<L21>:
 c2 22                 ldi8	r6, 0x22
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong+0x1f8
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 09                    mov	r6, r5
 ca bf                 addi.s8	r6, -0x41
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 d2 04                 brult8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0xf2
<L22>:
 c6 c9 ff              ldi16	r6, 0xffc9
 19                    add	r6, r5
 ce 10                 cmpi.s8	r6, 0x10
 d8 04                 bruge8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_FAR24	.text.parse_ulong+0xfa
<L23>:
 e2 00 00 00           jmpf	parse_ulong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong+0xf2

Disassembly of section .text.strtoul:

<strtoul>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 f4                 adjsp	-0xc
 f0 17 0c              leasp	r7, 0xc
 f4 6b                 stsp16	[sp+0xa], r7
 f0 17 0e              leasp	r7, 0xe
 f4 63                 stsp16	[sp+0x8], r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e3 00 00 00           callf	strtoul
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ulong
 d6 0c                 adjsp	0xc
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtoul
		R_AVM_FAR24	.text.strtoul+0x4a
<L0>:
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtoul
		R_AVM_FAR24	.text.strtoul+0x48
<L1>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f7 72                 sub32	q0, q2
 e2 00 00 00           jmpf	strtoul
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtoul+0x4a
 f2 62                 mov32	q0, q2
 f2 68                 mov32	q2, q0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.strtoll:

<strtoll>:
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
 e3 00 00 00           callf	strtoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ullong
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

Disassembly of section .text.parse_ullong:

<parse_ullong>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ce                 adjsp	-0x32
 f1 16                 mov	r2, r6
 09                    mov	r6, r5
 f1 04                 mov	r0, r4
 f0 34 49              ldsp16	r4, [sp+0x49]
 f0 35 4b              ldsp16	r5, [sp+0x4b]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 34 45              ldsp16	r4, [sp+0x45]
 f0 35 47              ldsp16	r5, [sp+0x47]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 34 41              ldsp16	r4, [sp+0x41]
 f0 35 43              ldsp16	r5, [sp+0x43]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 3d              ldsp16	r4, [sp+0x3d]
 f0 35 3f              ldsp16	r5, [sp+0x3f]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 4f              ldsp16	r4, [sp+0x4f]
 f0 31 4d              ldsp16	r1, [sp+0x4d]
 a5                    xor	r5, r5
 ee b2 20              st16	[r1+0], r5
 f4 68                 stsp16	[sp+0xa], r4
 71                    st16	[r4], r5
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x4e
<L0>:
 f5 58                 st16	[r6], r0
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x72
<L1>:
 f1 22                 mov	r4, r2
 c8 db                 addi.s8	r4, -0x25
 cc dd                 cmpi.s8	r4, -0x23
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x72
<L2>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c0 16                 ldi8	r4, 0x16
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ullong+0x2d0
 f0 3e 24              stsp16	[sp+0x24], r6
 f1 18                 mov	r3, r0
 f0 6c 81              ld8u	r4, [r0+]
 e3 00 00 00           callf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x75
<L3>:
 ed 86 20              ld8u	r4, [r3+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x99
<L4>:
 cc 2d                 cmpi.s8	r4, 0x2d
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0xa2
<L5>:
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 04                 cset.eq	r4
 ee 92 20              st16	[r1+0], r4
 f1 18                 mov	r3, r0
 c0 2f                 ldi8	r4, 0x2f
 f9 88                 and	r4, r2
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x105
<L6>:
 ed 86 20              ld8u	r4, [r3+0]
 cc 30                 cmpi.s8	r4, 0x30
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0xff
<L7>:
 ed 86 21              ld8u	r4, [r3+1]
 c1 20                 ldi8	r5, 0x20
 94                    or	r5, r4
 c0 08                 ldi8	r4, 0x8
 cd 78                 cmpi.s8	r5, 0x78
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x101
<L8>:
 c3 10                 ldi8	r7, 0x10
 f1 27                 mov	r5, r3
 c9 02                 addi.s8	r5, 0x2
 f0 3d 2e              stsp16	[sp+0x2e], r5
 ed a6 22              ld8u	r5, [r3+2]
 09                    mov	r6, r5
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x10a
<L9>:
 09                    mov	r6, r5
 ca 9f                 addi.s8	r6, -0x61
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x2ef
<L10>:
 c6 a9 ff              ldi16	r6, 0xffa9
 19                    add	r6, r5
 ce 10                 cmpi.s8	r6, 0x10
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x101
<L11>:
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ullong+0x10a
 c0 0a                 ldi8	r4, 0xa
 f6 2a                 tst16	r2
 fb 14                 cmov.eq	r2, r4
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f1 2e                 mov	r7, r2
 ed 92 20              ld16	r4, [r1+0]
 f6 2c                 tst16	r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f1 17                 mov	r2, r7
 f0 3a 0c              stsp16	[sp+0xc], r2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 d6 f6                 adjsp	-0xa
 f0 10 30              leasp	r0, 0x30
 f0 38 08              stsp16	[sp+0x8], r0
 f2 39                 sub	r1, r1
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f0 39 2c              stsp16	[sp+0x2c], r1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 39 02              stsp16	[sp+0x2], r1
 f2 30                 sub	r0, r0
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 e3 00 00 00           callf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivmoddi4
 d6 0a                 adjsp	0xa
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 42                 sub	r2, r2
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ullong+0x189
 c0 01                 ldi8	r4, 0x1
 f4 29                 ldsp16	r5, [sp+0xa]
 74                    st16	[r5], r4
 f4 b2                 dec16	r2
 f4 ab                 inc16	r3
 f4 33                 ldsp16	r7, [sp+0xc]
 ed c6 20              ld8u	r6, [r3+0]
 02                    mov	r4, r6
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d2 04                 brult8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x1b0
<L12>:
 ca d0                 addi.s8	r6, -0x30
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x1e8
<L13>:
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x2d8
<L14>:
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ullong+0x2a6
 02                    mov	r4, r6
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x1d2
<L15>:
 ca a9                 addi.s8	r6, -0x57
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x1e8
<L16>:
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x2d8
<L17>:
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ullong+0x2a6
 02                    mov	r4, r6
 c8 c9                 addi.s8	r4, -0x37
 ca bf                 addi.s8	r6, -0x41
 f1 76                 zext8	r6
 c5 ff ff              ldi16	r5, 0xffff
 ce 1a                 cmpi.s8	r6, 0x1a
 fc 2c                 cmov.ult	r5, r4
 09                    mov	r6, r5
 3b                    cmp	r6, r7
 d2 04                 brult8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x29e
<L18>:
 f4 62                 stsp16	[sp+0x8], r6
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
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x180
<L19>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 3a 30              stsp16	[sp+0x30], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
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
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f0 32 30              ldsp16	r2, [sp+0x30]
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x24d
<L20>:
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 23                 ldsp16	r7, [sp+0x8]
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x180
<L21>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 6a                    ld16	r6, [r6]
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x297
<L22>:
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 32 30              ldsp16	r2, [sp+0x30]
 f4 22                 ldsp16	r6, [sp+0x8]
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 62                 add32	q0, q2
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ullong+0x185
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x2d8
<L23>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x2b3
<L24>:
 f5 53                 st16	[r4], r3
 f4 28                 ldsp16	r4, [sp+0xa]
 60                    ld16	r4, [r4]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x2e2
<L25>:
 c0 22                 ldi8	r4, 0x22
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ullong+0x2e2
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
 09                    mov	r6, r5
 ca bf                 addi.s8	r6, -0x41
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 d2 04                 brult8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x101
<L26>:
 c6 c9 ff              ldi16	r6, 0xffc9
 19                    add	r6, r5
 ce 10                 cmpi.s8	r6, 0x10
 d8 04                 bruge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_FAR24	.text.parse_ullong+0x10a
<L27>:
 e2 00 00 00           jmpf	parse_ullong
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ullong+0x101

Disassembly of section .text.strtoull:

<strtoull>:
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
 e3 00 00 00           callf	strtoull
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.parse_ullong
 d6 14                 adjsp	0x14
 f0 32 00              ldsp16	r2, [sp+0x0]
 f6 2a                 tst16	r2
 f2 64                 mov32	q1, q0
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtoull
		R_AVM_FAR24	.text.strtoull+0x6d
<L0>:
 f0 30 02              ldsp16	r0, [sp+0x2]
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtoull
		R_AVM_FAR24	.text.strtoull+0x69
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
 e2 00 00 00           jmpf	strtoull
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtoull+0x6d
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

Disassembly of section .text.atol:

<atol>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f1 14                 mov	r2, r4
 f1 1a                 mov	r3, r2
 f0 6c 85              ld8u	r4, [r2+]
 e3 00 00 00           callf	atol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x8
<L0>:
 ed 86 20              ld8u	r4, [r3+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 f2 39                 sub	r1, r1
 c1 01                 ldi8	r5, 0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x3d
<L1>:
 cc 2d                 cmpi.s8	r4, 0x2d
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x4b
<L2>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f1 1a                 mov	r3, r2
 f0 39 04              stsp16	[sp+0x4], r1
 e2 00 00 00           jmpf	atol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atol+0x53
 f4 51                 stsp16	[sp+0x4], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f1 1a                 mov	r3, r2
 e2 00 00 00           jmpf	atol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atol+0x53
 f4 51                 stsp16	[sp+0x4], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e3 00 00 00           callf	atol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umodsi3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f1 01                 mov	r0, r1
 e2 00 00 00           jmpf	atol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atol+0x76
 f0 01 01              ldi8	r1, 0x1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f4 b0                 dec16	r0
 f4 ab                 inc16	r3
 ed 46 20              ld8u	r2, [r3+0]
 f1 22                 mov	r4, r2
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x8e
<L3>:
 f0 0a d0              addi.s8	r2, -0x30
 e2 00 00 00           jmpf	atol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atol+0xb6
 f1 22                 mov	r4, r2
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x10a
<L4>:
 f1 22                 mov	r4, r2
 c8 bf                 addi.s8	r4, -0x41
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x10a
<L5>:
 f0 0a c9              addi.s8	r2, -0x37
 f0 0e 0a              cmpi.s8	r2, 0xa
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x10a
<L6>:
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 01 01              ldi8	r1, 0x1
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc 0c              ldi16	r5, 0xccc
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x72
<L7>:
 f0 38 0a              stsp16	[sp+0xa], r0
 f2 63                 mov32	q0, q3
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0xe3
<L8>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 f5 2a                 cmp	r6, r2
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x6a
<L9>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 2c                 tst16	r4
 f2 6a                 mov32	q3, q0
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0xf6
<L10>:
 f0 01 01              ldi8	r1, 0x1
 e2 00 00 00           jmpf	atol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atol+0x6f
 02                    mov	r4, r6
 07                    mov	r5, r7
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e3 00 00 00           callf	atol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	atol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atol+0x6f
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f6 28                 tst16	r0
 f2 66                 mov32	q1, q2
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x12c
<L11>:
 f6 29                 tst16	r1
 f2 67                 mov32	q1, q3
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atol
		R_AVM_FAR24	.text.atol+0x12c
<L12>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 79                 sub32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.atoll:

<atoll>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 f1 04                 mov	r0, r4
 f1 08                 mov	r1, r0
 f0 6c 81              ld8u	r4, [r0+]
 e3 00 00 00           callf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x8
<L0>:
 ed c2 20              ld8u	r6, [r1+0]
 ce 2b                 cmpi.s8	r6, 0x2b
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c3 01                 ldi8	r7, 0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x42
<L1>:
 ce 2d                 cmpi.s8	r6, 0x2d
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x57
<L2>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f1 08                 mov	r1, r0
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoll+0x66
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f1 08                 mov	r1, r0
 e2 00 00 00           jmpf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoll+0x66
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 d6 f8                 adjsp	-0x8
 f0 02 0a              ldi8	r2, 0xa
 f2 4b                 sub	r3, r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 42                 sub	r2, r2
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 e3 00 00 00           callf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umoddi3
 d6 08                 adjsp	0x8
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3a 00              stsp16	[sp+0x0], r2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 e2 00 00 00           jmpf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoll+0xab
 f1 14                 mov	r2, r4
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 b4                 dec16	r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 a9                 inc16	r1
 ed a2 20              ld8u	r5, [r1+0]
 01                    mov	r4, r5
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0xc1
<L3>:
 c9 d0                 addi.s8	r5, -0x30
 e2 00 00 00           jmpf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoll+0xe5
 01                    mov	r4, r5
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x1b9
<L4>:
 01                    mov	r4, r5
 c8 bf                 addi.s8	r4, -0x41
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x1b9
<L5>:
 c9 c9                 addi.s8	r5, -0x37
 cd 0a                 cmpi.s8	r5, 0xa
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x1b9
<L6>:
 f4 49                 stsp16	[sp+0x2], r5
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 3a 10              stsp16	[sp+0x10], r2
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 f0 04 cc cc           ldi16	r0, 0xcccc
 f0 05 cc 0c           ldi16	r1, 0xccc
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 04              cmp32	q0, q1
 f8 15                 cset.ult	r5
 f0 69 40              cmp32	q1, q0
 fb 2c                 cmov.eq	r5, r4
 c0 01                 ldi8	r4, 0x1
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x9e
<L7>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc cc              ldi16	r7, 0xcccc
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 f0 30 02              ldsp16	r0, [sp+0x2]
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x163
<L8>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 28                 cmp	r6, r0
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x163
<L9>:
 f0 02 01              ldi8	r2, 0x1
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc cc              ldi16	r7, 0xcccc
 f0 04 cc cc           ldi16	r0, 0xcccc
 f0 05 cc 0c           ldi16	r1, 0xccc
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 e2 00 00 00           jmpf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoll+0xa0
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x179
<L10>:
 f0 02 01              ldi8	r2, 0x1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e2 00 00 00           jmpf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoll+0xa0
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 e3 00 00 00           callf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_muldi3
 d6 08                 adjsp	0x8
 f2 66                 mov32	q1, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 69 c4              cmp32	q3, q1
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 68                 add32	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 42                 sub	r2, r2
 e2 00 00 00           jmpf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoll+0xa0
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x1e9
<L11>:
 f6 2a                 tst16	r2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atoll
		R_AVM_FAR24	.text.atoll+0x1ef
<L12>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 e2 00 00 00           jmpf	atoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.atoll+0x1ef
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 68                 mov32	q2, q0
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 67                 mov32	q1, q3
 f7 76                 sub32	q1, q2
 f0 30 12              ldsp16	r0, [sp+0x12]
 f4 a0                 tst8	r0
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 a5                    xor	r5, r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f7 68                 add32	q2, q0
 f7 7e                 sub32	q3, q2
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 a4                 tst8	r4
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f2 69                 mov32	q2, q1
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.atof:

<atof>:
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	atof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtod

Disassembly of section .text.abs:

<abs>:
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 a1                    xor	r4, r5
 21                    sub	r4, r5
 ef                    ret

Disassembly of section .text.labs:

<labs>:
 09                    mov	r6, r5
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f7 7b                 sub32	q2, q3
 ef                    ret

Disassembly of section .text.llabs:

<llabs>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 66                 mov32	q1, q2
 f7 74                 sub32	q1, q0
 f0 69 c8              cmp32	q3, q2
 f2 68                 mov32	q2, q0
 fd 22                 cmov.slt	r4, r2
 fd 2b                 cmov.slt	r5, r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 f8 08                 cset.ne	r0
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f7 74                 sub32	q1, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 fd 32                 cmov.slt	r6, r2
 fd 3b                 cmov.slt	r7, r3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.div:

<div>:
 08                    mov	r6, r4
 ec b5                 sdiv16	r6, r5
 0e                    mov	r7, r6
 fe 3d                 mul16	r7, r5
 23                    sub	r4, r7
 04                    mov	r5, r4
 02                    mov	r4, r6
 ef                    ret

Disassembly of section .text.ldiv:

<ldiv>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 67                 mov32	q1, q3
 f1 04                 mov	r0, r4
 d6 fe                 adjsp	-0x2
 f0 14 02              leasp	r4, 0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 3e                 ldsp16	r6, [sp+0xf]
 f0 37 11              ldsp16	r7, [sp+0x11]
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	ldiv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divmodsi4
 d6 02                 adjsp	0x2
 f0 6b 80              st32	[r0], q2
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 6b c8              st32	[r4], q3
 f1 20                 mov	r4, r0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.lldiv:

<lldiv>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f1 04                 mov	r0, r4
 d6 f6                 adjsp	-0xa
 f0 14 0a              leasp	r4, 0xa
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 25              ldsp16	r4, [sp+0x25]
 f0 35 27              ldsp16	r5, [sp+0x27]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 f0 36 21              ldsp16	r6, [sp+0x21]
 f0 37 23              ldsp16	r7, [sp+0x23]
 e3 00 00 00           callf	lldiv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divmoddi4
 d6 0a                 adjsp	0xa
 f1 08                 mov	r1, r0
 f0 09 0c              addi.s8	r1, 0xc
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 6b 42              st32	[r1], q1
 f1 08                 mov	r1, r0
 f0 09 04              addi.s8	r1, 0x4
 f0 6b c2              st32	[r1], q3
 f0 6b 80              st32	[r0], q2
 f1 20                 mov	r4, r0
 c8 08                 addi.s8	r4, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 6b c8              st32	[r4], q3
 f1 20                 mov	r4, r0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.getenv:

<getenv>:
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.system:

<system>:
 a5                    xor	r5, r5
 c6 ff ff              ldi16	r6, 0xffff
 f6 2c                 tst16	r4
 fb 6e                 cmov.ne	r5, r6
 01                    mov	r4, r5
 ef                    ret
