
builtins_atomic.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 atomic.c
00000000 l    d  .text.__atomic_is_lock_free	00000000 .text.__atomic_is_lock_free
00000000 l    d  .text.__atomic_load	00000000 .text.__atomic_load
00000000 l    d  .text.__atomic_store	00000000 .text.__atomic_store
00000000 l    d  .text.__atomic_exchange	00000000 .text.__atomic_exchange
00000000 l    d  .text.__atomic_compare_exchange	00000000 .text.__atomic_compare_exchange
00000000 l    d  .text.__atomic_load_8	00000000 .text.__atomic_load_8
00000000 l    d  .text.__atomic_store_8	00000000 .text.__atomic_store_8
00000000 l    d  .text.__atomic_exchange_8	00000000 .text.__atomic_exchange_8
00000000 l    d  .text.__atomic_compare_exchange_8	00000000 .text.__atomic_compare_exchange_8
00000000 l    d  .text.__atomic_fetch_add_8	00000000 .text.__atomic_fetch_add_8
00000000 l    d  .text.__atomic_fetch_sub_8	00000000 .text.__atomic_fetch_sub_8
00000000 l    d  .text.__atomic_fetch_and_8	00000000 .text.__atomic_fetch_and_8
00000000 l    d  .text.__atomic_fetch_or_8	00000000 .text.__atomic_fetch_or_8
00000000 l    d  .text.__atomic_fetch_xor_8	00000000 .text.__atomic_fetch_xor_8
00000000 l    d  .text.__atomic_fetch_nand_8	00000000 .text.__atomic_fetch_nand_8
00000000 g     F .text.__atomic_is_lock_free	0000000c __atomic_is_lock_free
00000000 g     F .text.__atomic_load	00000017 __atomic_load
00000000 g     F .text.__atomic_store	00000017 __atomic_store
00000000 g     F .text.__atomic_exchange	00000030 __atomic_exchange
00000000 g     F .text.__atomic_compare_exchange	00000069 __atomic_compare_exchange
00000000 g     F .text.__atomic_load_8	00000044 __atomic_load_8
00000000 g     F .text.__atomic_store_8	00000060 __atomic_store_8
00000000 g     F .text.__atomic_exchange_8	000000b3 __atomic_exchange_8
00000000 g     F .text.__atomic_compare_exchange_8	00000103 __atomic_compare_exchange_8
00000000 g     F .text.__atomic_fetch_add_8	000000ee __atomic_fetch_add_8
00000000 g     F .text.__atomic_fetch_sub_8	000000eb __atomic_fetch_sub_8
00000000 g     F .text.__atomic_fetch_and_8	000000cb __atomic_fetch_and_8
00000000 g     F .text.__atomic_fetch_or_8	000000cb __atomic_fetch_or_8
00000000 g     F .text.__atomic_fetch_xor_8	000000cb __atomic_fetch_xor_8
00000000 g     F .text.__atomic_fetch_nand_8	000000ec __atomic_fetch_nand_8

Disassembly of section .text.__atomic_is_lock_free:

<__atomic_is_lock_free>:
 cc 04                 cmpi.s8	r4, 0x4
 f8 05                 cset.eq	r5
 f4 b4                 dec16	r4
 cc 02                 cmpi.s8	r4, 0x2
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret

Disassembly of section .text.__atomic_load:

<__atomic_load>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_load
		R_AVM_FAR24	.text.__atomic_load+0x16
<L0>:
 f7 0f                 ld8u	r7, [r5+]
 f6 17                 st8	[r6+], r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_load
		R_AVM_FAR24	.text.__atomic_load+0x8
<L1>:
 ef                    ret

Disassembly of section .text.__atomic_store:

<__atomic_store>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_store
		R_AVM_FAR24	.text.__atomic_store+0x16
<L0>:
 f7 17                 ld8u	r7, [r6+]
 f6 0f                 st8	[r5+], r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_store
		R_AVM_FAR24	.text.__atomic_store+0x8
<L1>:
 ef                    ret

Disassembly of section .text.__atomic_exchange:

<__atomic_exchange>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_exchange
		R_AVM_FAR24	.text.__atomic_exchange+0x2c
<L0>:
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 f0 6c 41              ld8u	r2, [r0+]
 f6 1a                 st8	[r7+], r2
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_exchange
		R_AVM_FAR24	.text.__atomic_exchange+0xf
<L1>:
 f7 17                 ld8u	r7, [r6+]
 f6 0f                 st8	[r5+], r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_exchange
		R_AVM_FAR24	.text.__atomic_exchange+0x1e
<L2>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.__atomic_compare_exchange:

<__atomic_compare_exchange>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 04                 mov	r0, r4
 c0 01                 ldi8	r4, 0x1
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange
		R_AVM_FAR24	.text.__atomic_compare_exchange+0x62
<L0>:
 f4 49                 stsp16	[sp+0x2], r5
 f4 42                 stsp16	[sp+0x0], r6
 f1 16                 mov	r2, r6
 f1 18                 mov	r3, r0
 41                    ld8u	r4, [r5]
 f4 50                 stsp16	[sp+0x4], r4
 ed 84 20              ld8u	r4, [r2+0]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f5 0c                 cmp	r1, r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange
		R_AVM_FAR24	.text.__atomic_compare_exchange+0x4f
<L1>:
 f4 aa                 inc16	r2
 f4 ad                 inc16	r5
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange
		R_AVM_FAR24	.text.__atomic_compare_exchange+0x1a
<L2>:
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 1c                 ld8u	r4, [r7+]
 f6 0c                 st8	[r5+], r4
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange
		R_AVM_FAR24	.text.__atomic_compare_exchange+0x3b
<L3>:
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	__atomic_compare_exchange
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__atomic_compare_exchange+0x62
 a0                    xor	r4, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f7 17                 ld8u	r7, [r6+]
 f6 0f                 st8	[r5+], r7
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange
		R_AVM_FAR24	.text.__atomic_compare_exchange+0x54
<L4>:
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__atomic_load_8:

<__atomic_load_8>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 48                    ld8u	r6, [r4]
 f1 4e                 stsp8	[sp+0x7], r6
 ed a8 21              ld8u	r5, [r4+1]
 f1 49                 stsp8	[sp+0x6], r5
 fa 48                 lsl16i	r5, 0x8
 96                    or	r5, r6
 ed c8 22              ld8u	r6, [r4+2]
 f1 46                 stsp8	[sp+0x5], r6
 ed e8 23              ld8u	r7, [r4+3]
 f1 43                 stsp8	[sp+0x4], r7
 fa 68                 lsl16i	r7, 0x8
 9e                    or	r7, r6
 ed 08 24              ld8u	r0, [r4+4]
 f0 28 03              stsp8	[sp+0x3], r0
 ed c8 25              ld8u	r6, [r4+5]
 f1 3a                 stsp8	[sp+0x2], r6
 fa 58                 lsl16i	r6, 0x8
 f9 c1                 or	r6, r0
 f1 05                 mov	r0, r5
 f1 0f                 mov	r1, r7
 ed a8 26              ld8u	r5, [r4+6]
 f1 35                 stsp8	[sp+0x1], r5
 ed 88 27              ld8u	r4, [r4+7]
 f1 30                 stsp8	[sp+0x0], r4
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 0c                    mov	r7, r4
 f2 68                 mov32	q2, q0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.__atomic_store_8:

<__atomic_store_8>:
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f1 04                 mov	r0, r4
 f0 34 11              ldsp16	r4, [sp+0x11]
 f0 35 13              ldsp16	r5, [sp+0x13]
 f1 5c                 stsp8	[sp+0xb], r4
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f1 5a                 stsp8	[sp+0xa], r6
 f0 36 15              ldsp16	r6, [sp+0x15]
 f0 37 17              ldsp16	r7, [sp+0x17]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 4e                 stsp8	[sp+0x7], r6
 fa 98                 lsr16i	r6, 0x8
 f1 4a                 stsp8	[sp+0x6], r6
 01                    mov	r4, r5
 04                    mov	r5, r4
 f1 55                 stsp8	[sp+0x9], r5
 fa 78                 lsr16i	r4, 0x8
 f1 50                 stsp8	[sp+0x8], r4
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 04                    mov	r5, r4
 f1 45                 stsp8	[sp+0x5], r5
 fa 78                 lsr16i	r4, 0x8
 f1 40                 stsp8	[sp+0x4], r4
 f3 6c                 ldsp8u	r4, [sp+0xb]
 ee 80 20              st8	[r0+0], r4
 f3 68                 ldsp8u	r4, [sp+0xa]
 ee 80 21              st8	[r0+1], r4
 f3 64                 ldsp8u	r4, [sp+0x9]
 ee 80 22              st8	[r0+2], r4
 f3 60                 ldsp8u	r4, [sp+0x8]
 ee 80 23              st8	[r0+3], r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 ee 80 24              st8	[r0+4], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 ee 80 25              st8	[r0+5], r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 ee 80 26              st8	[r0+6], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 ee 80 27              st8	[r0+7], r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.__atomic_exchange_8:

<__atomic_exchange_8>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f1 04                 mov	r0, r4
 f0 34 21              ldsp16	r4, [sp+0x21]
 f0 35 23              ldsp16	r5, [sp+0x23]
 f1 54                 stsp8	[sp+0x9], r4
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f1 52                 stsp8	[sp+0x8], r6
 f0 36 25              ldsp16	r6, [sp+0x25]
 f0 37 27              ldsp16	r7, [sp+0x27]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f1 46                 stsp8	[sp+0x5], r6
 fa 98                 lsr16i	r6, 0x8
 f1 42                 stsp8	[sp+0x4], r6
 01                    mov	r4, r5
 04                    mov	r5, r4
 f1 4d                 stsp8	[sp+0x7], r5
 fa 78                 lsr16i	r4, 0x8
 f1 48                 stsp8	[sp+0x6], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 04                    mov	r5, r4
 f1 3d                 stsp8	[sp+0x3], r5
 fa 78                 lsr16i	r4, 0x8
 f1 38                 stsp8	[sp+0x2], r4
 ed 40 20              ld8u	r2, [r0+0]
 f0 2a 15              stsp8	[sp+0x15], r2
 ed 80 21              ld8u	r4, [r0+1]
 f4 40                 stsp16	[sp+0x0], r4
 f0 2c 12              stsp8	[sp+0x12], r4
 ed 80 22              ld8u	r4, [r0+2]
 f4 68                 stsp16	[sp+0xa], r4
 f0 2c 11              stsp8	[sp+0x11], r4
 ed a0 23              ld8u	r5, [r0+3]
 f0 2d 10              stsp8	[sp+0x10], r5
 ed 60 24              ld8u	r3, [r0+4]
 f0 2b 14              stsp8	[sp+0x14], r3
 ed 80 25              ld8u	r4, [r0+5]
 f1 6c                 stsp8	[sp+0xf], r4
 0c                    mov	r7, r4
 ed 20 26              ld8u	r1, [r0+6]
 f0 29 13              stsp8	[sp+0x13], r1
 ed c0 27              ld8u	r6, [r0+7]
 f1 6a                 stsp8	[sp+0xe], r6
 f3 64                 ldsp8u	r4, [sp+0x9]
 ee 80 20              st8	[r0+0], r4
 f3 60                 ldsp8u	r4, [sp+0x8]
 ee 80 21              st8	[r0+1], r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 ee 80 22              st8	[r0+2], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 ee 80 23              st8	[r0+3], r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 ee 80 24              st8	[r0+4], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 ee 80 25              st8	[r0+5], r4
 f3 4c                 ldsp8u	r4, [sp+0x3]
 ee 80 26              st8	[r0+6], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 ee 80 27              st8	[r0+7], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 38                 lsl16i	r4, 0x8
 f9 89                 or	r4, r2
 fa 68                 lsl16i	r7, 0x8
 f9 ed                 or	r7, r3
 f4 43                 stsp16	[sp+0x0], r7
 fa 48                 lsl16i	r5, 0x8
 f4 2b                 ldsp16	r7, [sp+0xa]
 97                    or	r5, r7
 fa 58                 lsl16i	r6, 0x8
 f9 c5                 or	r6, r1
 f4 03                 ldsp16	r7, [sp+0x0]
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__atomic_compare_exchange_8:

<__atomic_compare_exchange_8>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 f0 34 13              ldsp16	r4, [sp+0x13]
 f0 35 15              ldsp16	r5, [sp+0x15]
 f1 5c                 stsp8	[sp+0xb], r4
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f1 5a                 stsp8	[sp+0xa], r6
 f0 36 17              ldsp16	r6, [sp+0x17]
 f0 37 19              ldsp16	r7, [sp+0x19]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 4e                 stsp8	[sp+0x7], r6
 fa 98                 lsr16i	r6, 0x8
 f1 4a                 stsp8	[sp+0x6], r6
 01                    mov	r4, r5
 04                    mov	r5, r4
 f1 55                 stsp8	[sp+0x9], r5
 fa 78                 lsr16i	r4, 0x8
 f1 50                 stsp8	[sp+0x8], r4
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 04                    mov	r5, r4
 f1 45                 stsp8	[sp+0x5], r5
 fa 78                 lsr16i	r4, 0x8
 f1 40                 stsp8	[sp+0x4], r4
 ed 80 20              ld8u	r4, [r0+0]
 ed a2 20              ld8u	r5, [r1+0]
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange_8
		R_AVM_FAR24	.text.__atomic_compare_exchange_8+0xcd
<L0>:
 ed 80 21              ld8u	r4, [r0+1]
 ed a2 21              ld8u	r5, [r1+1]
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange_8
		R_AVM_FAR24	.text.__atomic_compare_exchange_8+0xcd
<L1>:
 ed 80 22              ld8u	r4, [r0+2]
 ed a2 22              ld8u	r5, [r1+2]
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange_8
		R_AVM_FAR24	.text.__atomic_compare_exchange_8+0xcd
<L2>:
 ed 80 23              ld8u	r4, [r0+3]
 ed a2 23              ld8u	r5, [r1+3]
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange_8
		R_AVM_FAR24	.text.__atomic_compare_exchange_8+0xcd
<L3>:
 ed 80 24              ld8u	r4, [r0+4]
 ed a2 24              ld8u	r5, [r1+4]
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange_8
		R_AVM_FAR24	.text.__atomic_compare_exchange_8+0xcd
<L4>:
 ed 80 25              ld8u	r4, [r0+5]
 ed a2 25              ld8u	r5, [r1+5]
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange_8
		R_AVM_FAR24	.text.__atomic_compare_exchange_8+0xcd
<L5>:
 ed 80 26              ld8u	r4, [r0+6]
 ed a2 26              ld8u	r5, [r1+6]
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange_8
		R_AVM_FAR24	.text.__atomic_compare_exchange_8+0xcd
<L6>:
 ed 80 27              ld8u	r4, [r0+7]
 ed a2 27              ld8u	r5, [r1+7]
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__atomic_compare_exchange_8
		R_AVM_FAR24	.text.__atomic_compare_exchange_8+0xcd
<L7>:
 f3 6c                 ldsp8u	r4, [sp+0xb]
 ee 80 20              st8	[r0+0], r4
 f3 68                 ldsp8u	r4, [sp+0xa]
 ee 80 21              st8	[r0+1], r4
 f3 64                 ldsp8u	r4, [sp+0x9]
 ee 80 22              st8	[r0+2], r4
 f3 60                 ldsp8u	r4, [sp+0x8]
 ee 80 23              st8	[r0+3], r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 ee 80 24              st8	[r0+4], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 ee 80 25              st8	[r0+5], r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 ee 80 26              st8	[r0+6], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 ee 80 27              st8	[r0+7], r4
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	__atomic_compare_exchange_8
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__atomic_compare_exchange_8+0xfe
 ed 80 20              ld8u	r4, [r0+0]
 ee 82 20              st8	[r1+0], r4
 ed 80 21              ld8u	r4, [r0+1]
 ee 82 21              st8	[r1+1], r4
 ed 80 22              ld8u	r4, [r0+2]
 ee 82 22              st8	[r1+2], r4
 ed 80 23              ld8u	r4, [r0+3]
 ee 82 23              st8	[r1+3], r4
 ed 80 24              ld8u	r4, [r0+4]
 ee 82 24              st8	[r1+4], r4
 ed 80 25              ld8u	r4, [r0+5]
 ee 82 25              st8	[r1+5], r4
 ed 80 26              ld8u	r4, [r0+6]
 ee 82 26              st8	[r1+6], r4
 ed 80 27              ld8u	r4, [r0+7]
 ee 82 27              st8	[r1+7], r4
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.__atomic_fetch_add_8:

<__atomic_fetch_add_8>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 de                 adjsp	-0x22
 f1 14                 mov	r2, r4
 f0 34 31              ldsp16	r4, [sp+0x31]
 f0 35 33              ldsp16	r5, [sp+0x33]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 2d              ldsp16	r4, [sp+0x2d]
 f0 35 2f              ldsp16	r5, [sp+0x2f]
 ed c4 20              ld8u	r6, [r2+0]
 f0 2e 18              stsp8	[sp+0x18], r6
 ed e4 21              ld8u	r7, [r2+1]
 f0 2f 17              stsp8	[sp+0x17], r7
 fa 68                 lsl16i	r7, 0x8
 9e                    or	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 ed c4 22              ld8u	r6, [r2+2]
 f0 2e 16              stsp8	[sp+0x16], r6
 ed e4 23              ld8u	r7, [r2+3]
 f0 2f 15              stsp8	[sp+0x15], r7
 fa 68                 lsl16i	r7, 0x8
 9e                    or	r7, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 ed e4 24              ld8u	r7, [r2+4]
 f0 2f 14              stsp8	[sp+0x14], r7
 ed c4 25              ld8u	r6, [r2+5]
 f0 2e 13              stsp8	[sp+0x13], r6
 fa 58                 lsl16i	r6, 0x8
 9b                    or	r6, r7
 ed 64 26              ld8u	r3, [r2+6]
 f0 2b 21              stsp8	[sp+0x21], r3
 ed e4 27              ld8u	r7, [r2+7]
 f0 3f 10              stsp16	[sp+0x10], r7
 fa 68                 lsl16i	r7, 0x8
 f9 ed                 or	r7, r3
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 38 1d              stsp16	[sp+0x1d], r0
 f0 39 1f              stsp16	[sp+0x1f], r1
 f7 68                 add32	q2, q0
 f0 69 80              cmp32	q2, q0
 f8 16                 cset.ult	r6
 af                    xor	r7, r7
 f0 3e 19              stsp16	[sp+0x19], r6
 f0 3f 1b              stsp16	[sp+0x1b], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 6c                 add32	q3, q0
 f0 30 19              ldsp16	r0, [sp+0x19]
 f0 31 1b              ldsp16	r1, [sp+0x1b]
 f7 6c                 add32	q3, q0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 2e 12              stsp8	[sp+0x12], r6
 f1 5c                 stsp8	[sp+0xb], r4
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f1 5a                 stsp8	[sp+0xa], r6
 01                    mov	r4, r5
 04                    mov	r5, r4
 f1 55                 stsp8	[sp+0x9], r5
 fa 78                 lsr16i	r4, 0x8
 f1 50                 stsp8	[sp+0x8], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 4e                 stsp8	[sp+0x7], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 48                 stsp8	[sp+0x6], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 45                 stsp8	[sp+0x5], r5
 fa 78                 lsr16i	r4, 0x8
 f1 40                 stsp8	[sp+0x4], r4
 f3 6c                 ldsp8u	r4, [sp+0xb]
 ee 84 20              st8	[r2+0], r4
 f3 68                 ldsp8u	r4, [sp+0xa]
 ee 84 21              st8	[r2+1], r4
 f3 64                 ldsp8u	r4, [sp+0x9]
 ee 84 22              st8	[r2+2], r4
 f3 60                 ldsp8u	r4, [sp+0x8]
 ee 84 23              st8	[r2+3], r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 ee 84 24              st8	[r2+4], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 ee 84 25              st8	[r2+5], r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 ee 84 26              st8	[r2+6], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 ee 84 27              st8	[r2+7], r4
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__atomic_fetch_sub_8:

<__atomic_fetch_sub_8>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 de                 adjsp	-0x22
 f1 04                 mov	r0, r4
 f0 34 2f              ldsp16	r4, [sp+0x2f]
 f0 35 31              ldsp16	r5, [sp+0x31]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 2b              ldsp16	r4, [sp+0x2b]
 f0 35 2d              ldsp16	r5, [sp+0x2d]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ed 80 20              ld8u	r4, [r0+0]
 f0 2c 21              stsp8	[sp+0x21], r4
 ed a0 21              ld8u	r5, [r0+1]
 f0 2d 20              stsp8	[sp+0x20], r5
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 ed 80 22              ld8u	r4, [r0+2]
 f0 2c 1f              stsp8	[sp+0x1f], r4
 ed c0 23              ld8u	r6, [r0+3]
 f0 2e 1e              stsp8	[sp+0x1e], r6
 fa 58                 lsl16i	r6, 0x8
 98                    or	r6, r4
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 ed 80 24              ld8u	r4, [r0+4]
 f0 2c 1d              stsp8	[sp+0x1d], r4
 ed a0 25              ld8u	r5, [r0+5]
 f0 2d 1c              stsp8	[sp+0x1c], r5
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 ed 80 26              ld8u	r4, [r0+6]
 f0 2c 1b              stsp8	[sp+0x1b], r4
 ed c0 27              ld8u	r6, [r0+7]
 f0 3e 14              stsp16	[sp+0x14], r6
 fa 58                 lsl16i	r6, 0x8
 98                    or	r6, r4
 0e                    mov	r7, r6
 09                    mov	r6, r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 48              cmp32	q1, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 7e                 sub32	q3, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f7 7e                 sub32	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 2c 1a              stsp8	[sp+0x1a], r4
 f2 6b                 mov32	q3, q1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 7e                 sub32	q3, q2
 f1 5e                 stsp8	[sp+0xb], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 58                 stsp8	[sp+0xa], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 55                 stsp8	[sp+0x9], r5
 fa 78                 lsr16i	r4, 0x8
 f1 50                 stsp8	[sp+0x8], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 4e                 stsp8	[sp+0x7], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 48                 stsp8	[sp+0x6], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 45                 stsp8	[sp+0x5], r5
 fa 78                 lsr16i	r4, 0x8
 f1 40                 stsp8	[sp+0x4], r4
 f3 6c                 ldsp8u	r4, [sp+0xb]
 ee 80 20              st8	[r0+0], r4
 f3 68                 ldsp8u	r4, [sp+0xa]
 ee 80 21              st8	[r0+1], r4
 f3 64                 ldsp8u	r4, [sp+0x9]
 ee 80 22              st8	[r0+2], r4
 f3 60                 ldsp8u	r4, [sp+0x8]
 ee 80 23              st8	[r0+3], r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 ee 80 24              st8	[r0+4], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 ee 80 25              st8	[r0+5], r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 ee 80 26              st8	[r0+6], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 ee 80 27              st8	[r0+7], r4
 f2 69                 mov32	q2, q1
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__atomic_fetch_and_8:

<__atomic_fetch_and_8>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f1 04                 mov	r0, r4
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 25              ldsp16	r4, [sp+0x25]
 f0 35 27              ldsp16	r5, [sp+0x27]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ed 80 20              ld8u	r4, [r0+0]
 f0 2c 1a              stsp8	[sp+0x1a], r4
 ed e0 21              ld8u	r7, [r0+1]
 f0 2f 19              stsp8	[sp+0x19], r7
 fa 68                 lsl16i	r7, 0x8
 9c                    or	r7, r4
 ed a0 22              ld8u	r5, [r0+2]
 f0 2d 18              stsp8	[sp+0x18], r5
 ed 80 23              ld8u	r4, [r0+3]
 f0 2c 17              stsp8	[sp+0x17], r4
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 04                    mov	r5, r4
 03                    mov	r4, r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ed 80 24              ld8u	r4, [r0+4]
 f0 2c 16              stsp8	[sp+0x16], r4
 ed e0 25              ld8u	r7, [r0+5]
 f0 2f 15              stsp8	[sp+0x15], r7
 fa 68                 lsl16i	r7, 0x8
 9c                    or	r7, r4
 ed 40 26              ld8u	r2, [r0+6]
 f0 2a 1b              stsp8	[sp+0x1b], r2
 ed 80 27              ld8u	r4, [r0+7]
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f9 a9                 or	r5, r2
 f1 17                 mov	r2, r7
 f1 1d                 mov	r3, r5
 f0 2c 14              stsp8	[sp+0x14], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 88                    and	r6, r4
 8d                    and	r7, r5
 f1 4e                 stsp8	[sp+0x7], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 48                 stsp8	[sp+0x6], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 45                 stsp8	[sp+0x5], r5
 fa 78                 lsr16i	r4, 0x8
 f1 40                 stsp8	[sp+0x4], r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f1 3e                 stsp8	[sp+0x3], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 38                 stsp8	[sp+0x2], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 35                 stsp8	[sp+0x1], r5
 fa 78                 lsr16i	r4, 0x8
 f1 30                 stsp8	[sp+0x0], r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 ee 80 20              st8	[r0+0], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 ee 80 21              st8	[r0+1], r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 ee 80 22              st8	[r0+2], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 ee 80 23              st8	[r0+3], r4
 f3 4c                 ldsp8u	r4, [sp+0x3]
 ee 80 24              st8	[r0+4], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 ee 80 25              st8	[r0+5], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 ee 80 26              st8	[r0+6], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 ee 80 27              st8	[r0+7], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__atomic_fetch_or_8:

<__atomic_fetch_or_8>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f1 04                 mov	r0, r4
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 25              ldsp16	r4, [sp+0x25]
 f0 35 27              ldsp16	r5, [sp+0x27]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ed 80 20              ld8u	r4, [r0+0]
 f0 2c 1a              stsp8	[sp+0x1a], r4
 ed e0 21              ld8u	r7, [r0+1]
 f0 2f 19              stsp8	[sp+0x19], r7
 fa 68                 lsl16i	r7, 0x8
 9c                    or	r7, r4
 ed a0 22              ld8u	r5, [r0+2]
 f0 2d 18              stsp8	[sp+0x18], r5
 ed 80 23              ld8u	r4, [r0+3]
 f0 2c 17              stsp8	[sp+0x17], r4
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 04                    mov	r5, r4
 03                    mov	r4, r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ed 80 24              ld8u	r4, [r0+4]
 f0 2c 16              stsp8	[sp+0x16], r4
 ed e0 25              ld8u	r7, [r0+5]
 f0 2f 15              stsp8	[sp+0x15], r7
 fa 68                 lsl16i	r7, 0x8
 9c                    or	r7, r4
 ed 40 26              ld8u	r2, [r0+6]
 f0 2a 1b              stsp8	[sp+0x1b], r2
 ed 80 27              ld8u	r4, [r0+7]
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f9 a9                 or	r5, r2
 f1 17                 mov	r2, r7
 f1 1d                 mov	r3, r5
 f0 2c 14              stsp8	[sp+0x14], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 98                    or	r6, r4
 9d                    or	r7, r5
 f1 4e                 stsp8	[sp+0x7], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 48                 stsp8	[sp+0x6], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 45                 stsp8	[sp+0x5], r5
 fa 78                 lsr16i	r4, 0x8
 f1 40                 stsp8	[sp+0x4], r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 f1 3e                 stsp8	[sp+0x3], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 38                 stsp8	[sp+0x2], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 35                 stsp8	[sp+0x1], r5
 fa 78                 lsr16i	r4, 0x8
 f1 30                 stsp8	[sp+0x0], r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 ee 80 20              st8	[r0+0], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 ee 80 21              st8	[r0+1], r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 ee 80 22              st8	[r0+2], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 ee 80 23              st8	[r0+3], r4
 f3 4c                 ldsp8u	r4, [sp+0x3]
 ee 80 24              st8	[r0+4], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 ee 80 25              st8	[r0+5], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 ee 80 26              st8	[r0+6], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 ee 80 27              st8	[r0+7], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__atomic_fetch_xor_8:

<__atomic_fetch_xor_8>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f1 04                 mov	r0, r4
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 25              ldsp16	r4, [sp+0x25]
 f0 35 27              ldsp16	r5, [sp+0x27]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ed 80 20              ld8u	r4, [r0+0]
 f0 2c 1a              stsp8	[sp+0x1a], r4
 ed e0 21              ld8u	r7, [r0+1]
 f0 2f 19              stsp8	[sp+0x19], r7
 fa 68                 lsl16i	r7, 0x8
 9c                    or	r7, r4
 ed a0 22              ld8u	r5, [r0+2]
 f0 2d 18              stsp8	[sp+0x18], r5
 ed 80 23              ld8u	r4, [r0+3]
 f0 2c 17              stsp8	[sp+0x17], r4
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 04                    mov	r5, r4
 03                    mov	r4, r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ed 80 24              ld8u	r4, [r0+4]
 f0 2c 16              stsp8	[sp+0x16], r4
 ed e0 25              ld8u	r7, [r0+5]
 f0 2f 15              stsp8	[sp+0x15], r7
 fa 68                 lsl16i	r7, 0x8
 9c                    or	r7, r4
 ed 40 26              ld8u	r2, [r0+6]
 f0 2a 1b              stsp8	[sp+0x1b], r2
 ed 80 27              ld8u	r4, [r0+7]
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f9 a9                 or	r5, r2
 f1 17                 mov	r2, r7
 f1 1d                 mov	r3, r5
 f0 2c 14              stsp8	[sp+0x14], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f1 4e                 stsp8	[sp+0x7], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 48                 stsp8	[sp+0x6], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 45                 stsp8	[sp+0x5], r5
 fa 78                 lsr16i	r4, 0x8
 f1 40                 stsp8	[sp+0x4], r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f1 3e                 stsp8	[sp+0x3], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 38                 stsp8	[sp+0x2], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 35                 stsp8	[sp+0x1], r5
 fa 78                 lsr16i	r4, 0x8
 f1 30                 stsp8	[sp+0x0], r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 ee 80 20              st8	[r0+0], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 ee 80 21              st8	[r0+1], r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 ee 80 22              st8	[r0+2], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 ee 80 23              st8	[r0+3], r4
 f3 4c                 ldsp8u	r4, [sp+0x3]
 ee 80 24              st8	[r0+4], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 ee 80 25              st8	[r0+5], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 ee 80 26              st8	[r0+6], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 ee 80 27              st8	[r0+7], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__atomic_fetch_nand_8:

<__atomic_fetch_nand_8>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 f1 14                 mov	r2, r4
 f0 34 2b              ldsp16	r4, [sp+0x2b]
 f0 35 2d              ldsp16	r5, [sp+0x2d]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 27              ldsp16	r4, [sp+0x27]
 f0 35 29              ldsp16	r5, [sp+0x29]
 ed c4 20              ld8u	r6, [r2+0]
 f0 2e 1c              stsp8	[sp+0x1c], r6
 ed e4 21              ld8u	r7, [r2+1]
 f0 2f 1b              stsp8	[sp+0x1b], r7
 fa 68                 lsl16i	r7, 0x8
 9e                    or	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 ed c4 22              ld8u	r6, [r2+2]
 f0 2e 1a              stsp8	[sp+0x1a], r6
 ed e4 23              ld8u	r7, [r2+3]
 f0 2f 19              stsp8	[sp+0x19], r7
 fa 68                 lsl16i	r7, 0x8
 9e                    or	r7, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 4b                 stsp16	[sp+0x2], r7
 ed e4 24              ld8u	r7, [r2+4]
 f0 2f 18              stsp8	[sp+0x18], r7
 ed c4 25              ld8u	r6, [r2+5]
 f0 2e 17              stsp8	[sp+0x17], r6
 fa 58                 lsl16i	r6, 0x8
 9b                    or	r6, r7
 ed 04 26              ld8u	r0, [r2+6]
 f0 28 1d              stsp8	[sp+0x1d], r0
 ed e4 27              ld8u	r7, [r2+7]
 f0 3f 10              stsp16	[sp+0x10], r7
 fa 68                 lsl16i	r7, 0x8
 f9 e1                 or	r7, r0
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 82                    and	r4, r6
 87                    and	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 2e 16              stsp8	[sp+0x16], r6
 f1 6c                 stsp8	[sp+0xf], r4
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f1 6a                 stsp8	[sp+0xe], r6
 01                    mov	r4, r5
 04                    mov	r5, r4
 f1 65                 stsp8	[sp+0xd], r5
 fa 78                 lsr16i	r4, 0x8
 f1 60                 stsp8	[sp+0xc], r4
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f1 5e                 stsp8	[sp+0xb], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f1 58                 stsp8	[sp+0xa], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 f1 55                 stsp8	[sp+0x9], r5
 fa 78                 lsr16i	r4, 0x8
 f1 50                 stsp8	[sp+0x8], r4
 f3 7c                 ldsp8u	r4, [sp+0xf]
 ee 84 20              st8	[r2+0], r4
 f3 78                 ldsp8u	r4, [sp+0xe]
 ee 84 21              st8	[r2+1], r4
 f3 74                 ldsp8u	r4, [sp+0xd]
 ee 84 22              st8	[r2+2], r4
 f3 70                 ldsp8u	r4, [sp+0xc]
 ee 84 23              st8	[r2+3], r4
 f3 6c                 ldsp8u	r4, [sp+0xb]
 ee 84 24              st8	[r2+4], r4
 f3 68                 ldsp8u	r4, [sp+0xa]
 ee 84 25              st8	[r2+5], r4
 f3 64                 ldsp8u	r4, [sp+0x9]
 ee 84 26              st8	[r2+6], r4
 f3 60                 ldsp8u	r4, [sp+0x8]
 ee 84 27              st8	[r2+7], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
