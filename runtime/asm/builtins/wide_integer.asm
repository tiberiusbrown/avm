
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
00000000 g     F .text.__avm_muldi3	000000a1 __avm_muldi3
00000000         *UND*	00000000 __avm_umulhisi3
00000000 g     F .text.__avm_udivmoddi4	000001ad __avm_udivmoddi4
00000000 g     F .text.__avm_udivdi3	0000019b __avm_udivdi3
00000000 g     F .text.__avm_umoddi3	0000013f __avm_umoddi3
00000000 g     F .text.__avm_divmoddi4	0000033d __avm_divmoddi4
00000000 g     F .text.__avm_divdi3	000002a2 __avm_divdi3
00000000 g     F .text.__avm_moddi3	00000239 __avm_moddi3
00000000 g     F .text.__avm_ashldi3	0000008b __avm_ashldi3
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_lshrsi3
00000000 g     F .text.__avm_lshrdi3	00000090 __avm_lshrdi3
00000000 g     F .text.__avm_ashrdi3	00000088 __avm_ashrdi3
00000000         *UND*	00000000 __avm_ashrsi3

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
 02                    mov	r4, r6
 f0 6d 93              st16	[r1+], r4
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
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x190
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
		R_AVM_FAR24	.text.__avm_udivmoddi4+0xb3
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
 f0 31 06              ldsp16	r1, [sp+0x6]
 f9 81                 or	r4, r0
 f1 04                 mov	r0, r4
 f0 38 04              stsp16	[sp+0x4], r0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 32 2a              ldsp16	r2, [sp+0x2a]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f1 06                 mov	r0, r6
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x173
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
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f9 81                 or	r4, r0
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 02                    mov	r4, r6
 f1 27                 mov	r5, r3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f1 29                 mov	r6, r1
 fa 9f                 lsr16i	r6, 0xf
 f7 6a                 add32	q2, q2
 f4 40                 stsp16	[sp+0x0], r4
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
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x14d
<L4>:
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 e2 00 00 00           jmpf	__avm_udivmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x92
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
		R_AVM_FAR24	.text.__avm_udivmoddi4+0x96
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
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 30 3d              ldsp16	r0, [sp+0x3d]
 f0 31 3f              ldsp16	r1, [sp+0x3f]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 39              ldsp16	r0, [sp+0x39]
 f0 31 3b              ldsp16	r1, [sp+0x3b]
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x5b
<L0>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x5b
<L1>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 00 40              ldi8	r0, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivdi3+0xd0
 f7 7e                 sub32	q3, q2
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 69 08              cmp32	q0, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f7 72                 sub32	q0, q2
 c0 01                 ldi8	r4, 0x1
 f9 89                 or	r4, r2
 f1 14                 mov	r2, r4
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f4 30                 ldsp16	r4, [sp+0xc]
 08                    mov	r6, r4
 f0 33 26              ldsp16	r3, [sp+0x26]
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 14                 mov	r2, r4
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x4e
<L2>:
 f0 38 2c              stsp16	[sp+0x2c], r0
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f7 60                 add32	q0, q0
 f9 81                 or	r4, r0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f7 6f                 add32	q3, q3
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 92                    or	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f7 65                 add32	q1, q1
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f9 89                 or	r4, r2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c4              cmp32	q3, q1
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f7 6f                 add32	q3, q3
 92                    or	r4, r6
 08                    mov	r6, r4
 f7 65                 add32	q1, q1
 f7 60                 add32	q0, q0
 f0 38 28              stsp16	[sp+0x28], r0
 f0 39 2a              stsp16	[sp+0x2a], r1
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x82
<L3>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x161
<L4>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivdi3+0xaa
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x82
<L5>:
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 80              cmp32	q2, q0
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_FAR24	.text.__avm_udivdi3+0x82
<L6>:
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e2 00 00 00           jmpf	__avm_udivdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivdi3+0xb6

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
		R_AVM_FAR24	.text.__avm_umoddi3+0x138
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
		R_AVM_FAR24	.text.__avm_umoddi3+0x96
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
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 1b                 ldsp16	r7, [sp+0x6]
 08                    mov	r6, r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 f1 15                 mov	r2, r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0x12e
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
 f1 14                 mov	r2, r4
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f1 21                 mov	r4, r1
 fa 7f                 lsr16i	r4, 0xf
 f7 6f                 add32	q3, q3
 f4 52                 stsp16	[sp+0x4], r6
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
		R_AVM_FAR24	.text.__avm_umoddi3+0x51
<L3>:
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0x126
<L4>:
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0x51
<L5>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_FAR24	.text.__avm_umoddi3+0x51
<L6>:
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 e2 00 00 00           jmpf	__avm_umoddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_umoddi3+0x84
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
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x50
<L0>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 d3 04                 brslt8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x6a
<L1>:
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0xa8
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f2 63                 mov32	q0, q3
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x323
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 f0 32 1a              ldsp16	r2, [sp+0x1a]
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
		R_AVM_FAR24	.text.__avm_divmoddi4+0xc9
<L2>:
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0xf6
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
		R_AVM_FAR24	.text.__avm_divmoddi4+0x160
<L3>:
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f4 42                 stsp16	[sp+0x0], r6
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x2b2
<L4>:
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x2e3
 c2 40                 ldi8	r6, 0x40
 f2 69                 mov32	q2, q1
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x1ca
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
 f1 04                 mov	r0, r4
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f0 33 36              ldsp16	r3, [sp+0x36]
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 16                 mov	r2, r6
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 06                 mov	r0, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x12d
<L5>:
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
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
 f0 37 20              ldsp16	r7, [sp+0x20]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f7 65                 add32	q1, q1
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f9 c9                 or	r6, r2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f7 6f                 add32	q3, q3
 f1 0f                 mov	r1, r7
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 92                    or	r4, r6
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
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
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
		R_AVM_FAR24	.text.__avm_divmoddi4+0x179
<L6>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x274
<L7>:
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x1b0
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x179
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
		R_AVM_FAR24	.text.__avm_divmoddi4+0x179
<L9>:
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x1b0
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f0 69 c4              cmp32	q3, q1
 f2 69                 mov32	q2, q1
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f7 78                 sub32	q2, q0
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f7 77                 sub32	q1, q3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_FAR24	.text.__avm_divmoddi4+0x2fd
<L10>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 e2 00 00 00           jmpf	__avm_divmoddi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmoddi4+0x323
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f7 73                 sub32	q0, q3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f7 7b                 sub32	q2, q3
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f2 69                 mov32	q2, q1
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
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
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x9a
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x29b
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 f2 63                 mov32	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 20              ldsp16	r2, [sp+0x20]
 f1 1a                 mov	r3, r2
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f7 7c                 sub32	q3, q0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 6a                 mov32	q3, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 78                 sub32	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f0 69 84              cmp32	q2, q1
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0xb9
<L2>:
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0xe8
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 8c              cmp32	q2, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f7 79                 sub32	q2, q1
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 7e                 sub32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x138
<L3>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
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
		R_AVM_FAR24	.text.__avm_divdi3+0x26d
<L4>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x29b
 f0 02 40              ldi8	r2, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x1a4
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f7 7b                 sub32	q2, q3
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 4c              cmp32	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
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
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 36 14              ldsp16	r6, [sp+0x14]
 02                    mov	r4, r6
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f1 06                 mov	r0, r6
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x113
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
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 37 22              ldsp16	r7, [sp+0x22]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f7 6a                 add32	q2, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 98                    or	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 08                    mov	r6, r4
 f1 2d                 mov	r7, r1
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f7 65                 add32	q1, q1
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f9 89                 or	r4, r2
 f2 67                 mov32	q1, q3
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 35 26              ldsp16	r5, [sp+0x26]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
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
		R_AVM_FAR24	.text.__avm_divdi3+0x153
<L6>:
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x231
<L7>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x17d
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_FAR24	.text.__avm_divdi3+0x153
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
		R_AVM_FAR24	.text.__avm_divdi3+0x153
<L9>:
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 e2 00 00 00           jmpf	__avm_divdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divdi3+0x189
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
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
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
 d6 e2                 adjsp	-0x1e
 f2 62                 mov32	q0, q2
 f0 32 2d              ldsp16	r2, [sp+0x2d]
 f0 33 2f              ldsp16	r3, [sp+0x2f]
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f9 89                 or	r4, r2
 f9 ad                 or	r5, r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x50
<L0>:
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 4c              cmp32	q1, q3
 d3 04                 brslt8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x56
<L1>:
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 61                 mov32	q0, q1
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_moddi3+0x87
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_moddi3+0x232
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 7d                 sub32	q3, q1
 f7 78                 sub32	q2, q0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 04              cmp32	q0, q1
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0xa4
<L2>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_moddi3+0xcf
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f7 7d                 sub32	q3, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f7 78                 sub32	q2, q0
 f2 67                 mov32	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 fa 7f                 lsr16i	r4, 0xf
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 f9 89                 or	r4, r2
 f9 ad                 or	r5, r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x11d
<L3>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 34 18              ldsp16	r4, [sp+0x18]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x20f
<L4>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_moddi3+0x232
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 02 40              ldi8	r2, 0x40
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_moddi3+0x179
 f7 77                 sub32	q1, q3
 f2 6a                 mov32	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 0c              cmp32	q0, q3
 f8 15                 cset.ult	r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 77                 sub32	q1, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 73                 sub32	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 04                 mov	r0, r4
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x104
<L5>:
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f7 65                 add32	q1, q1
 f9 c9                 or	r6, r2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 29                 mov	r6, r1
 fa 9f                 lsr16i	r6, 0xf
 f7 6a                 add32	q2, q2
 98                    or	r6, r4
 02                    mov	r4, r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 14                 mov	r2, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 03                    mov	r4, r7
 fa 7f                 lsr16i	r4, 0xf
 f7 60                 add32	q0, q0
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f9 81                 or	r4, r0
 f7 6f                 add32	q3, q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 69 0c              cmp32	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x140
<L6>:
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x161
<L7>:
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x140
<L8>:
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 0c              cmp32	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_FAR24	.text.__avm_moddi3+0x140
<L9>:
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 e2 00 00 00           jmpf	__avm_moddi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_moddi3+0x167
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 08              cmp32	q0, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f7 7d                 sub32	q3, q1
 f7 78                 sub32	q2, q0
 d6 1e                 adjsp	0x1e
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
 d6 f8                 adjsp	-0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 13              ldsp16	r2, [sp+0x13]
 f0 0e 40              cmpi.s8	r2, 0x40
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_FAR24	.text.__avm_ashldi3+0x84
<L0>:
 f0 0e 20              cmpi.s8	r2, 0x20
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_FAR24	.text.__avm_ashldi3+0x39
<L1>:
 f0 0a e0              addi.s8	r2, -0x20
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_ashldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashldi3+0x84
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_FAR24	.text.__avm_ashldi3+0x7e
<L2>:
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f1 2a                 mov	r6, r2
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	__avm_ashldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 20                 ldi8	r4, 0x20
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_ashldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	__avm_ashldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 6b                 mov32	q3, q1
 e2 00 00 00           jmpf	__avm_ashldi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashldi3+0x84
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f2 68                 mov32	q2, q0
 d6 08                 adjsp	0x8
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
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 13              ldsp16	r2, [sp+0x13]
 f0 0e 40              cmpi.s8	r2, 0x40
 f2 62                 mov32	q0, q2
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_FAR24	.text.__avm_lshrdi3+0x87
<L0>:
 f0 0e 20              cmpi.s8	r2, 0x20
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_FAR24	.text.__avm_lshrdi3+0x38
<L1>:
 f0 0a e0              addi.s8	r2, -0x20
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 30                 sub	r0, r0
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_lshrdi3+0x87
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_FAR24	.text.__avm_lshrdi3+0x81
<L2>:
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 63                 mov32	q0, q3
 f1 2a                 mov	r6, r2
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 20                 ldi8	r4, 0x20
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	__avm_lshrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_lshrdi3+0x87
 f2 63                 mov32	q0, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 d6 08                 adjsp	0x8
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
 d6 f8                 adjsp	-0x8
 f0 30 13              ldsp16	r0, [sp+0x13]
 f0 0c 40              cmpi.s8	r0, 0x40
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_FAR24	.text.__avm_ashrdi3+0x1c
<L0>:
 03                    mov	r4, r7
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashrdi3+0x81
 f0 0c 20              cmpi.s8	r0, 0x20
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_FAR24	.text.__avm_ashrdi3+0x3d
<L1>:
 f0 08 e0              addi.s8	r0, -0x20
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 67                 mov32	q1, q3
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashrsi3
 f1 2b                 mov	r6, r3
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_ashrdi3+0x81
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_ashrdi3
		R_AVM_FAR24	.text.__avm_ashrdi3+0x81
<L2>:
 f1 10                 mov	r2, r0
 f2 4b                 sub	r3, r3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 f4 1b                 ldsp16	r7, [sp+0x6]
 e3 00 00 00           callf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 20                 ldi8	r4, 0x20
 f2 50                 sub	r4, r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e3 00 00 00           callf	__avm_ashrdi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
