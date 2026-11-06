
builtins_wide_integer.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    d  .text.__avm_muldi3	00000000 .text.__avm_muldi3
00000000 l    d  .text.__avm_udivmoddi4	00000000 .text.__avm_udivmoddi4
00000000 l    d  .text.__avm_udivdi3	00000000 .text.__avm_udivdi3
00000000 l    d  .text.__avm_umoddi3	00000000 .text.__avm_umoddi3
00000000 l    d  .text.__avm_divmoddi4	00000000 .text.__avm_divmoddi4
00000000 l    d  .text.__avm_divdi3	00000000 .text.__avm_divdi3
00000000 l    d  .text.__avm_moddi3	00000000 .text.__avm_moddi3
00000000 l    d  .text.__avm_ashldi3	00000000 .text.__avm_ashldi3
00000000 l    d  .text.__avm_lshrdi3	00000000 .text.__avm_lshrdi3
00000000 l    d  .text.__avm_ashrdi3	00000000 .text.__avm_ashrdi3
00000000 l    d  .text.__floatundisf	00000000 .text.__floatundisf
00000000 l    d  .text.__floatdisf	00000000 .text.__floatdisf
00000000 l    d  .text.__fixunssfdi	00000000 .text.__fixunssfdi
00000000 l    d  .text.__fixsfdi	00000000 .text.__fixsfdi
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_muldi3	000000a0 __avm_muldi3
00000000         *UND*	00000000 __avm_umulhisi3
00000000 g     F .text.__avm_udivmoddi4	0000019f __avm_udivmoddi4
00000000 g     F .text.__avm_udivdi3	00000184 __avm_udivdi3
00000000 g     F .text.__avm_umoddi3	0000013d __avm_umoddi3
00000000 g     F .text.__avm_divmoddi4	0000033e __avm_divmoddi4
00000000 g     F .text.__avm_divdi3	00000295 __avm_divdi3
00000000 g     F .text.__avm_moddi3	00000224 __avm_moddi3
00000000 g     F .text.__avm_ashldi3	00000100 __avm_ashldi3
00000000 g     F .text.__avm_lshrdi3	0000011f __avm_lshrdi3
00000000 g     F .text.__avm_ashrdi3	00000115 __avm_ashrdi3
00000000 g     F .text.__floatundisf	00000147 __floatundisf
00000000         *UND*	00000000 __avm_ashlsi3
00000000 g     F .text.__floatdisf	000001ab __floatdisf
00000000 g     F .text.__fixunssfdi	000000d6 __fixunssfdi
00000000         *UND*	00000000 __avm_lshrsi3
00000000 g     F .text.__fixsfdi	00000142 __fixsfdi

Disassembly of section .text.__avm_muldi3:

<__avm_muldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f0 30 2f              ldsp16	r0, [sp+0x2f]
 f0 31 31              ldsp16	r1, [sp+0x31]
 f0 32 33              ldsp16	r2, [sp+0x33]
 f0 33 35              ldsp16	r3, [sp+0x35]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 00 04              ldi8	r0, 0x4
 f0 11 08              leasp	r1, 0x8
 f4 58                 stsp16	[sp+0x6], r4
 10                    add	r4, r4
 f0 15 10              leasp	r5, 0x10
 14                    add	r5, r4
 f0 16 1c              leasp	r6, 0x1c
 61                    ld16	r4, [r5]
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 39 18              stsp16	[sp+0x18], r1
 f0 38 1a              stsp16	[sp+0x1a], r0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f7 34                 ld16	r4, [r6+]
 f4 42                 stsp16	[sp+0x0], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 e3 00 00 00           callf	__avm_muldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 ed d2 20              ld16	r6, [r1+0]
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f7 6e                 add32	q3, q2
 f0 6d d3              st16	[r1+], r6
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_muldi3
		R_AVM_FAR24	.text.__avm_muldi3+0x54
<L0>:
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 09 02              addi.s8	r1, 0x2
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f4 b0                 dec16	r0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_muldi3
		R_AVM_FAR24	.text.__avm_muldi3+0x3a
<L1>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_udivmoddi4:

<__avm_udivmoddi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	-0x30
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 3f              ldsp16	r4, [sp+0x3f]
 f0 35 41              ldsp16	r5, [sp+0x41]
 f0 36 43              ldsp16	r6, [sp+0x43]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 3b              ldsp16	r2, [sp+0x3b]
 f0 33 3d              ldsp16	r3, [sp+0x3d]
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x49
<L0>:
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x49
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 64                 mov32	q1, q0
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x182
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 02 40              ldi8	r2, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 62                 mov32	q0, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivmoddi4+0xab
 f7 76                 sub32	q1, q2
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 69 c0              cmp32	q3, q0
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 76                 sub32	q1, q2
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f7 7c                 sub32	q3, q0
 c0 01                 ldi8	r4, 0x1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 81                 or	r4, r0
 f0 3c 04              stsp16	[sp+0x4], r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 32 2a              ldsp16	r2, [sp+0x2a]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f1 06                 mov	r0, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 40                 stsp16	[sp+0x0], r4
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x165
<L2>:
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 65                 add32	q1, q1
 f9 c9                 or	r6, r2
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f7 60                 add32	q0, q0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f9 81                 or	r4, r0
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f1 27                 mov	r5, r3
 f4 72                 stsp16	[sp+0xc], r6
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f1 29                 mov	r6, r1
 fa 9f                 lsr16i	r6, 0xf
 f7 6a                 add32	q2, q2
 f4 49                 stsp16	[sp+0x2], r5
 98                    or	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 c4              cmp32	q3, q1
 f2 67                 mov32	q1, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 65                 add32	q1, q1
 f9 89                 or	r4, r2
 f1 14                 mov	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6a                 add32	q2, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f7 60                 add32	q0, q0
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x6b
<L3>:
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x13f
<L4>:
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x8d
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x6b
<L5>:
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x6b
<L6>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x91
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 6b 8c              st32	[r6], q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 d6 30                 adjsp	0x30
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_udivdi3:

<__avm_udivdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d2                 adjsp	-0x2e
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 30 3d              ldsp16	r0, [sp+0x3d]
 f0 31 3f              ldsp16	r1, [sp+0x3f]
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 34 39              ldsp16	r4, [sp+0x39]
 f0 35 3b              ldsp16	r5, [sp+0x3b]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x5d
<L0>:
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x5d
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 40                 ldi8	r4, 0x40
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 26              stsp16	[sp+0x26], r0
 f0 39 28              stsp16	[sp+0x28], r1
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivdi3+0xc4
 f7 76                 sub32	q1, q2
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 c8              cmp32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f8 16                 cset.ult	r6
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 74                 sub32	q1, q0
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 7b                 sub32	q2, q3
 c2 01                 ldi8	r6, 0x1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 c1                 or	r6, r0
 f0 3e 04              stsp16	[sp+0x4], r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f1 04                 mov	r0, r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 42                 stsp16	[sp+0x0], r6
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 f1 22                 mov	r4, r2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x50
<L2>:
 f0 3c 24              stsp16	[sp+0x24], r4
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f7 65                 add32	q1, q1
 f9 c9                 or	r6, r2
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f7 60                 add32	q0, q0
 f0 39 2c              stsp16	[sp+0x2c], r1
 f9 81                 or	r4, r0
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f1 27                 mov	r5, r3
 f4 72                 stsp16	[sp+0xc], r6
 f4 79                 stsp16	[sp+0xe], r5
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 03                    mov	r4, r7
 fa 7f                 lsr16i	r4, 0xf
 f7 60                 add32	q0, q0
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f9 81                 or	r4, r0
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 26              ldsp16	r2, [sp+0x26]
 f0 33 28              ldsp16	r3, [sp+0x28]
 f0 69 40              cmp32	q1, q0
 f7 65                 add32	q1, q1
 f9 89                 or	r4, r2
 f1 14                 mov	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6a                 add32	q2, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f7 6f                 add32	q3, q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x75
<L3>:
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x15c
<L4>:
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivdi3+0xa8
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x75
<L5>:
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x75
<L6>:
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivdi3+0xa8

Disassembly of section .text.__avm_umoddi3:

<__avm_umoddi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 30 2d              ldsp16	r0, [sp+0x2d]
 f0 31 2f              ldsp16	r1, [sp+0x2f]
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0x38
<L0>:
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0x136
<L1>:
 f0 02 40              ldi8	r2, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_umoddi3+0x67
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 1b                 ldsp16	r7, [sp+0x6]
 08                    mov	r6, r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 f1 15                 mov	r2, r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0x12c
<L2>:
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 60                 add32	q0, q0
 f9 81                 or	r4, r0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 03                    mov	r4, r7
 fa 7f                 lsr16i	r4, 0xf
 f7 65                 add32	q1, q1
 f9 89                 or	r4, r2
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f1 21                 mov	r4, r1
 fa 7f                 lsr16i	r4, 0xf
 f7 6f                 add32	q3, q3
 f4 5b                 stsp16	[sp+0x6], r7
 92                    or	r4, r6
 f7 60                 add32	q0, q0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c4              cmp32	q3, q1
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0xf5
<L3>:
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0x51
<L4>:
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0xf5
<L5>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0xf5
<L6>:
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_umoddi3+0x122
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f7 73                 sub32	q0, q3
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 4c              cmp32	q1, q3
 f8 15                 cset.ult	r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 73                 sub32	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 77                 sub32	q1, q3
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_umoddi3+0x55
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_divmoddi4:

<__avm_divmoddi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c8                 adjsp	-0x38
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 32 47              ldsp16	r2, [sp+0x47]
 f0 33 49              ldsp16	r3, [sp+0x49]
 f0 30 43              ldsp16	r0, [sp+0x43]
 f0 31 45              ldsp16	r1, [sp+0x45]
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f0 34 4b              ldsp16	r4, [sp+0x4b]
 f0 3c 22              stsp16	[sp+0x22], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x50
<L0>:
 f0 69 8c              cmp32	q2, q3
 d3 04                 brslt8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x5c
<L1>:
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x9a
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x320
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f1 1a                 mov	r3, r2
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 f7 73                 sub32	q0, q3
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f0 69 8c              cmp32	q2, q3
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0xbb
<L2>:
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0xe8
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f7 7d                 sub32	q3, q1
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 92                    or	r4, r6
 97                    or	r5, r7
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x152
<L3>:
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f4 42                 stsp16	[sp+0x0], r6
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x299
<L4>:
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x2ca
 c2 40                 ldi8	r6, 0x40
 f2 69                 mov32	q2, q1
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x1ba
 f7 79                 sub32	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 4c              cmp32	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f7 76                 sub32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f9 81                 or	r4, r0
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f0 33 36              ldsp16	r3, [sp+0x36]
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 16                 mov	r2, r6
 f0 31 20              ldsp16	r1, [sp+0x20]
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 06                 mov	r0, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x11f
<L5>:
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f4 72                 stsp16	[sp+0xc], r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f7 65                 add32	q1, q1
 f0 3b 36              stsp16	[sp+0x36], r3
 f9 c9                 or	r6, r2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f7 60                 add32	q0, q0
 f0 39 20              stsp16	[sp+0x20], r1
 f9 81                 or	r4, r0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f7 6a                 add32	q2, q2
 98                    or	r6, r4
 02                    mov	r4, r6
 f7 60                 add32	q0, q0
 f7 65                 add32	q1, q1
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x16b
<L6>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x25b
<L7>:
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x1a0
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x16b
<L8>:
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x16b
<L9>:
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x1a0
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 69 4c              cmp32	q1, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f7 78                 sub32	q2, q0
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f7 7d                 sub32	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x2ea
<L10>:
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x320
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 04              cmp32	q0, q1
 f2 68                 mov32	q2, q0
 f2 61                 mov32	q0, q1
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f7 73                 sub32	q0, q3
 f7 76                 sub32	q1, q2
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f0 6b 4c              st32	[r6], q1
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 d6 38                 adjsp	0x38
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_divdi3:

<__avm_divdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ce                 adjsp	-0x32
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 41              ldsp16	r2, [sp+0x41]
 f0 33 43              ldsp16	r3, [sp+0x43]
 f0 30 3d              ldsp16	r0, [sp+0x3d]
 f0 31 3f              ldsp16	r1, [sp+0x3f]
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x48
<L0>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 d3 04                 brslt8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x54
<L1>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x8f
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x28e
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 f2 63                 mov32	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f7 7c                 sub32	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 6a                 mov32	q3, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 78                 sub32	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0xae
<L2>:
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0xdf
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 80              cmp32	q2, q0
 f2 68                 mov32	q2, q0
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f7 79                 sub32	q2, q1
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 72                 sub32	q0, q2
 f2 68                 mov32	q2, q0
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x133
<L3>:
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 0b                    mov	r6, r7
 fa 9f                 lsr16i	r6, 0xf
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x260
<L4>:
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x28e
 f0 02 40              ldi8	r2, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3c 22              stsp16	[sp+0x22], r4
 f4 60                 stsp16	[sp+0x8], r4
 f4 68                 stsp16	[sp+0xa], r4
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3c 26              stsp16	[sp+0x26], r4
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x19d
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f7 7b                 sub32	q2, q3
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 4c              cmp32	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 76                 sub32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f9 81                 or	r4, r0
 f1 04                 mov	r0, r4
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 36 10              ldsp16	r6, [sp+0x10]
 02                    mov	r4, r6
 f0 31 06              ldsp16	r1, [sp+0x6]
 f4 32                 ldsp16	r6, [sp+0xc]
 f1 06                 mov	r0, r6
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x10a
<L5>:
 f0 3a 30              stsp16	[sp+0x30], r2
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f2 64                 mov32	q1, q0
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 37 22              ldsp16	r7, [sp+0x22]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f7 6a                 add32	q2, q2
 f0 3d 1a              stsp16	[sp+0x1a], r5
 98                    or	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 08                    mov	r6, r4
 f1 2d                 mov	r7, r1
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f7 65                 add32	q1, q1
 f0 3b 06              stsp16	[sp+0x6], r3
 f9 89                 or	r4, r2
 f2 67                 mov32	q1, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 35 26              ldsp16	r5, [sp+0x26]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 80              cmp32	q2, q0
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f7 6a                 add32	q2, q2
 98                    or	r6, r4
 02                    mov	r4, r6
 f7 60                 add32	q0, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6f                 add32	q3, q3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x14c
<L6>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x224
<L7>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x176
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x14c
<L8>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 48              cmp32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x14c
<L9>:
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x182
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 69 84              cmp32	q2, q1
 f2 6b                 mov32	q3, q1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f1 08                 mov	r1, r0
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f7 7c                 sub32	q3, q0
 f7 76                 sub32	q1, q2
 f2 69                 mov32	q2, q1
 d6 32                 adjsp	0x32
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_moddi3:

<__avm_moddi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 de                 adjsp	-0x22
 f0 32 31              ldsp16	r2, [sp+0x31]
 f0 33 33              ldsp16	r3, [sp+0x33]
 f0 30 2d              ldsp16	r0, [sp+0x2d]
 f0 31 2f              ldsp16	r1, [sp+0x2f]
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x21d
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 03                    mov	r4, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 0c              cmp32	q0, q3
 d9 04                 brsge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x7a
<L1>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 3c 1e              stsp16	[sp+0x1e], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 48              cmp32	q1, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 7c                 sub32	q3, q0
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 0c              cmp32	q0, q3
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x95
<L2>:
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_moddi3+0xbf
 f0 3c 1e              stsp16	[sp+0x1e], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f0 69 48              cmp32	q1, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 7c                 sub32	q3, q0
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 fa 7f                 lsr16i	r4, 0xf
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f2 68                 mov32	q2, q0
 92                    or	r4, r6
 97                    or	r5, r7
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0xff
<L3>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x1fa
<L4>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_moddi3+0x21d
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c0 40                 ldi8	r4, 0x40
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_moddi3+0x15c
 f7 77                 sub32	q1, q3
 f2 6a                 mov32	q3, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 0c              cmp32	q0, q3
 f8 15                 cset.ult	r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 77                 sub32	q1, q3
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f7 73                 sub32	q0, q3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f1 04                 mov	r0, r4
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 f1 22                 mov	r4, r2
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0xe6
<L5>:
 f0 3c 14              stsp16	[sp+0x14], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f7 65                 add32	q1, q1
 f9 c9                 or	r6, r2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f1 29                 mov	r6, r1
 fa 9f                 lsr16i	r6, 0xf
 f7 6a                 add32	q2, q2
 98                    or	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 69                 stsp16	[sp+0xa], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3b 12              stsp16	[sp+0x12], r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 03                    mov	r4, r7
 fa 7f                 lsr16i	r4, 0xf
 f7 60                 add32	q0, q0
 f0 39 06              stsp16	[sp+0x6], r1
 f9 81                 or	r4, r0
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 6f                 add32	q3, q3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 69 0c              cmp32	q0, q3
 f2 61                 mov32	q0, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x121
<L6>:
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x142
<L7>:
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x121
<L8>:
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 0c              cmp32	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x121
<L9>:
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_moddi3+0x148
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 69 48              cmp32	q1, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f7 7c                 sub32	q3, q0
 f7 79                 sub32	q2, q1
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_ashldi3:

<__avm_ashldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a5                    xor	r5, r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 59                 stsp16	[sp+0x6], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_FAR24	.text.__avm_ashldi3+0x45
<L0>:
 f1 14                 mov	r2, r4
 fa 7f                 lsr16i	r4, 0xf
 f7 6f                 add32	q3, q3
 98                    or	r6, r4
 c0 01                 ldi8	r4, 0x1
 f1 1c                 mov	r3, r4
 8c                    and	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 10                    add	r4, r4
 93                    or	r4, r7
 f1 06                 mov	r0, r6
 f1 0c                 mov	r1, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6a                 add32	q2, q2
 f9 74                 and	r3, r5
 f4 82                 lsl16.1	r2
 f9 4d                 or	r2, r3
 f1 1a                 mov	r3, r2
 f1 14                 mov	r2, r4
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashldi3+0xf5
 f4 60                 stsp16	[sp+0x8], r4
 f4 72                 stsp16	[sp+0xc], r6
 09                    mov	r6, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 ce 40                 cmpi.s8	r6, 0x40
 f2 61                 mov32	q0, q1
 06                    mov	r5, r6
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_FAR24	.text.__avm_ashldi3+0xf5
<L1>:
 cd 30                 cmpi.s8	r5, 0x30
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_FAR24	.text.__avm_ashldi3+0x6f
<L2>:
 c9 d0                 addi.s8	r5, -0x30
 fa 01                 shl16v	r4, r5
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashldi3+0xf5
 cd 20                 cmpi.s8	r5, 0x20
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_FAR24	.text.__avm_ashldi3+0x88
<L3>:
 c9 e0                 addi.s8	r5, -0x20
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 52                 stsp16	[sp+0x4], r6
 08                    mov	r6, r4
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 40                 stsp16	[sp+0x0], r4
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashldi3+0xa9
 cd 10                 cmpi.s8	r5, 0x10
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_FAR24	.text.__avm_ashldi3+0xa0
<L4>:
 aa                    xor	r6, r6
 f0 3e 12              stsp16	[sp+0x12], r6
 c9 f0                 addi.s8	r5, -0x10
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 52                 stsp16	[sp+0x4], r6
 f4 22                 ldsp16	r6, [sp+0x8]
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashldi3+0xa9
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 42                 stsp16	[sp+0x0], r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 3d 10              stsp16	[sp+0x10], r5
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c3 0f                 ldi8	r7, 0xf
 83                    and	r4, r7
 f4 60                 stsp16	[sp+0x8], r4
 8d                    and	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 03                 shl16v	r4, r7
 0e                    mov	r7, r6
 f4 8f                 lsr16.1	r7
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 1d                 lsr16v	r7, r5
 9c                    or	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 fa 08                 shl16v	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 8c                 lsr16.1	r4
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 11                 lsr16v	r4, r5
 92                    or	r4, r6
 f1 04                 mov	r0, r4
 f1 0f                 mov	r1, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 fa 08                 shl16v	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f0 35 12              ldsp16	r5, [sp+0x12]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 fa 12                 lsr16v	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 92                    or	r4, r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 fa 06                 shl16v	r5, r6
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_lshrdi3:

<__avm_lshrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f1 05                 mov	r0, r5
 f0 35 1d              ldsp16	r5, [sp+0x1d]
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_FAR24	.text.__avm_lshrdi3+0x60
<L0>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 38 08              stsp16	[sp+0x8], r0
 f0 3e 0a              stsp16	[sp+0xa], r6
 f2 63                 mov32	q0, q3
 f7 80                 lsr32.1	q0
 f0 06 ff 7f           ldi16	r2, 0x7fff
 f9 44                 and	r2, r1
 c7 fe ff              ldi16	r7, 0xfffe
 06                    mov	r5, r6
 87                    and	r5, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 f7 80                 lsr32.1	q0
 f1 1a                 mov	r3, r2
 f1 10                 mov	r2, r0
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 5f                 lsl16i	r6, 0xf
 f0 30 08              ldsp16	r0, [sp+0x8]
 f1 08                 mov	r1, r0
 f1 01                 mov	r0, r1
 f4 88                 lsr16.1	r0
 f9 19                 or	r0, r6
 c5 fe ff              ldi16	r5, 0xfffe
 81                    and	r4, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 06                    mov	r5, r6
 f7 82                 lsr32.1	q2
 f1 24                 mov	r5, r0
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_lshrdi3+0x116
 f4 60                 stsp16	[sp+0x8], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 cd 40                 cmpi.s8	r5, 0x40
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_FAR24	.text.__avm_lshrdi3+0x74
<L1>:
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_lshrdi3+0x116
 cd 30                 cmpi.s8	r5, 0x30
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_FAR24	.text.__avm_lshrdi3+0x88
<L2>:
 c9 d0                 addi.s8	r5, -0x30
 09                    mov	r6, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 12                 lsr16v	r4, r6
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_lshrdi3+0x116
 cd 20                 cmpi.s8	r5, 0x20
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_FAR24	.text.__avm_lshrdi3+0xa2
<L3>:
 a0                    xor	r4, r4
 c9 e0                 addi.s8	r5, -0x20
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 62                 stsp16	[sp+0x8], r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 12                 ldsp16	r6, [sp+0x4]
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_lshrdi3+0xcf
 cd 10                 cmpi.s8	r5, 0x10
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_FAR24	.text.__avm_lshrdi3+0xc0
<L4>:
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 c9 f0                 addi.s8	r5, -0x10
 f1 20                 mov	r4, r0
 f4 60                 stsp16	[sp+0x8], r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 07                    mov	r5, r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_lshrdi3+0xcf
 f4 79                 stsp16	[sp+0xe], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 70                 stsp16	[sp+0xc], r4
 f1 28                 mov	r6, r0
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 79                 stsp16	[sp+0xe], r5
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c3 0f                 ldi8	r7, 0xf
 83                    and	r4, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 15                    add	r5, r5
 fa 04                 shl16v	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 8c                    and	r7, r4
 02                    mov	r4, r6
 fa 13                 lsr16v	r4, r7
 91                    or	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 fa 13                 lsr16v	r4, r7
 1a                    add	r6, r6
 f4 01                 ldsp16	r5, [sp+0x0]
 fa 09                 shl16v	r6, r5
 98                    or	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 02                    mov	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 1b                 lsr16v	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 1a                    add	r6, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 fa 0b                 shl16v	r6, r7
 f4 33                 ldsp16	r7, [sp+0xc]
 9b                    or	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 36 10              ldsp16	r6, [sp+0x10]
 fa 1b                 lsr16v	r6, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 f1 17                 mov	r2, r7
 f1 1e                 mov	r3, r6
 f2 6b                 mov32	q3, q1
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_ashrdi3:

<__avm_ashrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f1 05                 mov	r0, r5
 f0 35 1d              ldsp16	r5, [sp+0x1d]
 f4 41                 stsp16	[sp+0x0], r5
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_FAR24	.text.__avm_ashrdi3+0x42
<L0>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 fa 4f                 lsl16i	r5, 0xf
 f1 10                 mov	r2, r0
 f4 8a                 lsr16.1	r2
 f9 55                 or	r2, r5
 c7 fe ff              ldi16	r7, 0xfffe
 83                    and	r4, r7
 f1 24                 mov	r5, r0
 f7 82                 lsr32.1	q2
 f1 04                 mov	r0, r4
 f1 0a                 mov	r1, r2
 8b                    and	r6, r7
 02                    mov	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 0e                    mov	r7, r6
 08                    mov	r6, r4
 f7 87                 asr32.1	q3
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashrdi3+0x10c
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 40                 cmpi.s8	r4, 0x40
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_FAR24	.text.__avm_ashrdi3+0x5c
<L1>:
 f4 08                 ldsp16	r4, [sp+0x2]
 fa bf                 asr16i	r4, 0xf
 f1 04                 mov	r0, r4
 f1 0c                 mov	r1, r4
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashrdi3+0x10c
 f4 08                 ldsp16	r4, [sp+0x2]
 08                    mov	r6, r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 30                 cmpi.s8	r4, 0x30
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_FAR24	.text.__avm_ashrdi3+0x7c
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 d0                 addi.s8	r4, -0x30
 fa 28                 asr16v	r6, r4
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 09                    mov	r6, r5
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashrdi3+0x10c
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 20                 cmpi.s8	r4, 0x20
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_FAR24	.text.__avm_ashrdi3+0x9b
<L3>:
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 e0                 addi.s8	r4, -0x20
 f4 40                 stsp16	[sp+0x0], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 72                 stsp16	[sp+0xc], r6
 f4 69                 stsp16	[sp+0xa], r5
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashrdi3+0xcb
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 10                 cmpi.s8	r4, 0x10
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_FAR24	.text.__avm_ashrdi3+0xbe
<L4>:
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 f0                 addi.s8	r4, -0x10
 f4 40                 stsp16	[sp+0x0], r4
 f1 20                 mov	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 68                 stsp16	[sp+0xa], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashrdi3+0xcb
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 68                 stsp16	[sp+0xa], r4
 f1 28                 mov	r6, r0
 c5 ff ff              ldi16	r5, 0xffff
 f4 03                 ldsp16	r7, [sp+0x0]
 a7                    xor	r5, r7
 c0 0f                 ldi8	r4, 0xf
 84                    and	r5, r4
 01                    mov	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 29                 ldsp16	r5, [sp+0xa]
 15                    add	r5, r5
 fa 04                 shl16v	r5, r4
 c0 0f                 ldi8	r4, 0xf
 83                    and	r4, r7
 f4 48                 stsp16	[sp+0x2], r4
 0e                    mov	r7, r6
 fa 1c                 lsr16v	r7, r4
 9d                    or	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 09                 ldsp16	r5, [sp+0x2]
 fa 11                 lsr16v	r4, r5
 1a                    add	r6, r6
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 09                 shl16v	r6, r5
 98                    or	r6, r4
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 08                 ldsp16	r4, [sp+0x2]
 fa 18                 lsr16v	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 1a                    add	r6, r6
 fa 09                 shl16v	r6, r5
 f4 2b                 ldsp16	r7, [sp+0xa]
 9b                    or	r6, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 fa 23                 asr16v	r4, r7
 0c                    mov	r7, r4
 f2 68                 mov32	q2, q0
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__floatundisf:

<__floatundisf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 66                 mov32	q1, q2
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatundisf
		R_AVM_FAR24	.text.__floatundisf+0x111
<L0>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatundisf
		R_AVM_FAR24	.text.__floatundisf+0xc4
<L1>:
 f2 66                 mov32	q1, q2
 03                    mov	r4, r7
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 f0 00 8e              ldi8	r0, 0x8e
 f2 35                 sub	r0, r5
 02                    mov	r4, r6
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 c0 9e                 ldi8	r4, 0x9e
 21                    sub	r4, r5
 f6 2f                 tst16	r7
 fb 04                 cmov.eq	r0, r4
 f1 20                 mov	r4, r0
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatundisf
		R_AVM_FAR24	.text.__floatundisf+0xca
<L2>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f9 12                 xor	r0, r4
 c2 0f                 ldi8	r6, 0xf
 f4 50                 stsp16	[sp+0x4], r4
 f1 20                 mov	r4, r0
 82                    and	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 a2                    xor	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f2 6b                 mov32	q3, q1
 f7 83                 lsr32.1	q3
 03                    mov	r4, r7
 10                    add	r4, r4
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 01                 shl16v	r4, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 19                 lsr16v	r6, r5
 98                    or	r6, r4
 fa 1d                 lsr16v	r7, r5
 f0 01 10              ldi8	r1, 0x10
 f9 04                 and	r0, r1
 f4 a0                 tst8	r0
 fb 77                 cmov.ne	r6, r7
 f2 30                 sub	r0, r0
 fb 78                 cmov.ne	r7, r0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 c0 0f                 ldi8	r4, 0xf
 84                    and	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 a1                    xor	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 f4 33                 ldsp16	r7, [sp+0xc]
 fa 1b                 lsr16v	r6, r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa 07                 shl16v	r5, r7
 96                    or	r5, r6
 fa 03                 shl16v	r4, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f9 38                 and	r1, r6
 f4 a1                 tst8	r1
 fb 6c                 cmov.ne	r5, r4
 fb 60                 cmov.ne	r4, r0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__floatundisf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 e2 00 00 00           jmpf	__floatundisf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__floatundisf+0xd2
 ff 11                 u32tof
 e2 00 00 00           jmpf	__floatundisf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__floatundisf+0x113
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 50                 stsp16	[sp+0x4], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 fa 48                 lsl16i	r5, 0x8
 97                    or	r5, r7
 fa 98                 lsr16i	r6, 0x8
 0e                    mov	r7, r6
 09                    mov	r6, r5
 c1 80                 ldi8	r5, 0x80
 84                    and	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 37                 lsl16i	r4, 0x7
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 76                 sub32	q1, q2
 f2 30                 sub	r0, r0
 f0 05 00 5f           ldi16	r1, 0x5f00
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f7 61                 add32	q0, q1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatundisf
		R_AVM_FAR24	.text.__floatundisf+0x11a
<L3>:
 f2 68                 mov32	q2, q0
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 7f 01              ldi16	r4, 0x17f
 f4 02                 ldsp16	r6, [sp+0x0]
 82                    and	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 98                    or	r6, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f2 68                 mov32	q2, q0
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatundisf
		R_AVM_FAR24	.text.__floatundisf+0x113
<L4>:
 c0 01                 ldi8	r4, 0x1
 c5 00 5f              ldi16	r5, 0x5f00
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	__floatundisf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__floatundisf+0x113

Disassembly of section .text.__floatdisf:

<__floatdisf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 0c              cmp32	q0, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_FAR24	.text.__floatdisf+0x23
<L0>:
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__floatdisf+0x42
 f0 69 84              cmp32	q2, q1
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f7 7b                 sub32	q2, q3
 f2 61                 mov32	q0, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f7 71                 sub32	q0, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f0 69 04              cmp32	q0, q1
 f2 61                 mov32	q0, q1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_FAR24	.text.__floatdisf+0x112
<L1>:
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 69 80              cmp32	q2, q0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_FAR24	.text.__floatdisf+0x118
<L2>:
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 03                    mov	r4, r7
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 f0 00 8e              ldi8	r0, 0x8e
 f2 35                 sub	r0, r5
 02                    mov	r4, r6
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 c0 9e                 ldi8	r4, 0x9e
 21                    sub	r4, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f6 2f                 tst16	r7
 fb 04                 cmov.eq	r0, r4
 f1 20                 mov	r4, r0
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_FAR24	.text.__floatdisf+0x124
<L3>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f9 12                 xor	r0, r4
 c2 0f                 ldi8	r6, 0xf
 f4 50                 stsp16	[sp+0x4], r4
 f1 20                 mov	r4, r0
 82                    and	r4, r6
 f0 3c 14              stsp16	[sp+0x14], r4
 a2                    xor	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 f2 6b                 mov32	q3, q1
 f7 83                 lsr32.1	q3
 03                    mov	r4, r7
 10                    add	r4, r4
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 01                 shl16v	r4, r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 fa 19                 lsr16v	r6, r5
 98                    or	r6, r4
 fa 1d                 lsr16v	r7, r5
 f0 01 10              ldi8	r1, 0x10
 f9 04                 and	r0, r1
 f4 a0                 tst8	r0
 fb 77                 cmov.ne	r6, r7
 f2 30                 sub	r0, r0
 fb 78                 cmov.ne	r7, r0
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 c0 0f                 ldi8	r4, 0xf
 84                    and	r5, r4
 f0 3d 16              stsp16	[sp+0x16], r5
 a1                    xor	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 f0 37 14              ldsp16	r7, [sp+0x14]
 fa 1b                 lsr16v	r6, r7
 f0 37 16              ldsp16	r7, [sp+0x16]
 fa 07                 shl16v	r5, r7
 96                    or	r5, r6
 fa 03                 shl16v	r4, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f9 38                 and	r1, r6
 f4 a1                 tst8	r1
 fb 6c                 cmov.ne	r5, r4
 fb 60                 cmov.ne	r4, r0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__floatdisf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__floatdisf+0x126
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__floatdisf+0x1a4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 11                 u32tof
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__floatdisf+0x196
 f4 50                 stsp16	[sp+0x4], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 fa 48                 lsl16i	r5, 0x8
 97                    or	r5, r7
 fa 98                 lsr16i	r6, 0x8
 0e                    mov	r7, r6
 09                    mov	r6, r5
 c1 80                 ldi8	r5, 0x80
 84                    and	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 37                 lsl16i	r4, 0x7
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 76                 sub32	q1, q2
 f2 30                 sub	r0, r0
 f0 05 00 5f           ldi16	r1, 0x5f00
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f7 61                 add32	q0, q1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_FAR24	.text.__floatdisf+0x16b
<L4>:
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__floatdisf+0x196
 c4 7f 01              ldi16	r4, 0x17f
 f4 02                 ldsp16	r6, [sp+0x0]
 82                    and	r4, r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 98                    or	r6, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f2 68                 mov32	q2, q0
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__floatdisf
		R_AVM_FAR24	.text.__floatdisf+0x196
<L5>:
 c0 01                 ldi8	r4, 0x1
 c5 00 5f              ldi16	r5, 0x5f00
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 c6 00 80              ldi16	r6, 0x8000
 99                    or	r6, r5
 f1 0e                 mov	r1, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 fb 64                 cmov.ne	r4, r4
 fb 69                 cmov.ne	r5, r1
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__fixunssfdi:

<__fixunssfdi>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f6 29                 tst16	r1
 d9 04                 brsge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixunssfdi
		R_AVM_FAR24	.text.__fixunssfdi+0xcb
<L0>:
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f9 50                 and	r2, r4
 c0 ff                 ldi8	r4, 0xff
 f5 14                 cmp	r2, r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixunssfdi
		R_AVM_FAR24	.text.__fixunssfdi+0xcb
<L1>:
 f0 0e 7f              cmpi.s8	r2, 0x7f
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixunssfdi
		R_AVM_FAR24	.text.__fixunssfdi+0xcb
<L2>:
 c0 be                 ldi8	r4, 0xbe
 f5 22                 cmp	r4, r2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixunssfdi
		R_AVM_FAR24	.text.__fixunssfdi+0xcb
<L3>:
 c0 7f                 ldi8	r4, 0x7f
 f9 84                 and	r4, r1
 c1 80                 ldi8	r5, 0x80
 94                    or	r5, r4
 f1 20                 mov	r4, r0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 95                 ldi8	r4, 0x95
 f5 22                 cmp	r4, r2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixunssfdi
		R_AVM_FAR24	.text.__fixunssfdi+0x6d
<L4>:
 c0 96                 ldi8	r4, 0x96
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e3 00 00 00           callf	__fixunssfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	__fixunssfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__fixunssfdi+0xcb
 c6 6a ff              ldi16	r6, 0xff6a
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixunssfdi
		R_AVM_FAR24	.text.__fixunssfdi+0xae
<L5>:
 c0 b5                 ldi8	r4, 0xb5
 f5 22                 cmp	r4, r2
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixunssfdi
		R_AVM_FAR24	.text.__fixunssfdi+0xb4
<L6>:
 af                    xor	r7, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__fixunssfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 b6                 ldi8	r4, 0xb6
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__fixunssfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e2 00 00 00           jmpf	__fixunssfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__fixunssfdi+0xc7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	__fixunssfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__fixunssfdi+0xcb
 c4 4a ff              ldi16	r4, 0xff4a
 f2 22                 add	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e3 00 00 00           callf	__fixunssfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__fixsfdi:

<__fixsfdi>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 08                    mov	r6, r4
 f1 76                 zext8	r6
 c1 ff                 ldi8	r5, 0xff
 39                    cmp	r6, r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_FAR24	.text.__fixsfdi+0x9f
<L0>:
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 10                 and	r0, r4
 f0 0c 7f              cmpi.s8	r0, 0x7f
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_FAR24	.text.__fixsfdi+0x9f
<L1>:
 c2 be                 ldi8	r6, 0xbe
 f5 28                 cmp	r6, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_FAR24	.text.__fixsfdi+0x139
<L2>:
 f5 06                 cmp	r0, r6
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_FAR24	.text.__fixsfdi+0x6d
<L3>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 80              ldi16	r7, 0x807f
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 88                    and	r6, r4
 8d                    and	r7, r5
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f0 69 c8              cmp32	q3, q2
 fb 01                 cmov.eq	r0, r1
 a5                    xor	r5, r5
 f1 18                 mov	r3, r0
 f2 42                 sub	r2, r2
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__fixsfdi+0x139
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 88                    and	r6, r4
 8d                    and	r7, r5
 c0 80                 ldi8	r4, 0x80
 93                    or	r4, r7
 f1 16                 mov	r2, r6
 f1 1c                 mov	r3, r4
 c0 95                 ldi8	r4, 0x95
 f5 20                 cmp	r4, r0
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_FAR24	.text.__fixsfdi+0xa7
<L4>:
 c0 96                 ldi8	r4, 0x96
 f2 50                 sub	r4, r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__fixsfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__fixsfdi+0xff
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__fixsfdi+0x139
 c6 6a ff              ldi16	r6, 0xff6a
 c7 ff ff              ldi16	r7, 0xffff
 f7 6c                 add32	q3, q0
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_FAR24	.text.__fixsfdi+0xe4
<L5>:
 c0 b5                 ldi8	r4, 0xb5
 f5 20                 cmp	r4, r0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_FAR24	.text.__fixsfdi+0xec
<L6>:
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__fixsfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 b6                 ldi8	r4, 0xb6
 f2 50                 sub	r4, r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__fixsfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__fixsfdi+0xff
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__fixsfdi+0xff
 c4 4a ff              ldi16	r4, 0xff4a
 f2 20                 add	r4, r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__fixsfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d3 04                 brslt8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_FAR24	.text.__fixsfdi+0x11a
<L7>:
 f2 69                 mov32	q2, q1
 f2 64                 mov32	q1, q0
 e2 00 00 00           jmpf	__fixsfdi
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__fixsfdi+0x139
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 f2 6b                 mov32	q3, q1
 f2 64                 mov32	q1, q0
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 76                 sub32	q1, q2
 f7 73                 sub32	q0, q3
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
