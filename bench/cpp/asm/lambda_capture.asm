
lambda_capture.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 c0 0b                 ldi8	r4, 0xb
 f0 5c 02 01           stm16	[0x102], r4
 c0 6c                 ldi8	r4, 0x6c
 f0 5c 04 01           stm16	[0x104], r4
 c0 cd                 ldi8	r4, 0xcd
 f0 5c 06 01           stm16	[0x106], r4
 c4 2e 01              ldi16	r4, 0x12e
 f0 5c 08 01           stm16	[0x108], r4
 c4 8f 01              ldi16	r4, 0x18f
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 f0 01              ldi16	r4, 0x1f0
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 51 02              ldi16	r4, 0x251
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 b2 02              ldi16	r4, 0x2b2
 f0 5c 10 01           stm16	[0x110], r4
 c4 13 03              ldi16	r4, 0x313
 f0 5c 12 01           stm16	[0x112], r4
 c4 74 03              ldi16	r4, 0x374
 f0 5c 14 01           stm16	[0x114], r4
 c4 d5 03              ldi16	r4, 0x3d5
 f0 5c 16 01           stm16	[0x116], r4
 c4 36 04              ldi16	r4, 0x436
 f0 5c 18 01           stm16	[0x118], r4
 c4 97 04              ldi16	r4, 0x497
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 f8 04              ldi16	r4, 0x4f8
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 59 05              ldi16	r4, 0x559
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 ba 05              ldi16	r4, 0x5ba
 f0 5c 20 01           stm16	[0x120], r4
 c4 1b 06              ldi16	r4, 0x61b
 f0 5c 22 01           stm16	[0x122], r4
 c4 7c 06              ldi16	r4, 0x67c
 f0 5c 24 01           stm16	[0x124], r4
 c4 dd 06              ldi16	r4, 0x6dd
 f0 5c 26 01           stm16	[0x126], r4
 c4 3e 07              ldi16	r4, 0x73e
 f0 5c 28 01           stm16	[0x128], r4
 c4 9f 07              ldi16	r4, 0x79f
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 00 08              ldi16	r4, 0x800
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 61 08              ldi16	r4, 0x861
 f0 5c 2e 01           stm16	[0x12e], r4
 c4 c2 08              ldi16	r4, 0x8c2
 f0 5c 30 01           stm16	[0x130], r4
 c4 23 09              ldi16	r4, 0x923
 f0 5c 32 01           stm16	[0x132], r4
 c4 84 09              ldi16	r4, 0x984
 f0 5c 34 01           stm16	[0x134], r4
 c4 e5 09              ldi16	r4, 0x9e5
 f0 5c 36 01           stm16	[0x136], r4
 c4 46 0a              ldi16	r4, 0xa46
 f0 5c 38 01           stm16	[0x138], r4
 c4 a7 0a              ldi16	r4, 0xaa7
 f0 5c 3a 01           stm16	[0x13a], r4
 c4 08 0b              ldi16	r4, 0xb08
 f0 5c 3c 01           stm16	[0x13c], r4
 c4 69 0b              ldi16	r4, 0xb69
 f0 5c 3e 01           stm16	[0x13e], r4
 c4 ca 0b              ldi16	r4, 0xbca
 f0 5c 40 01           stm16	[0x140], r4
 f2 30                 sub	r0, r0
 f0 07 34 12           ldi16	r3, 0x1234
 d7 01                 sys	debug_break
<L0>:
 f0 02 20              ldi8	r2, 0x20
 f0 05 02 01           ldi16	r1, 0x102
<L1>:
 ed 92 20              ld16	r4, [r1+0]
 d5 2f                 call8	_ZL5applyIZ13avm_test_mainE3$_0EjT_j
 f2 23                 add	r4, r3
 f4 40                 stsp16	[sp+0x0], r4
 f0 6c b3              ld16	r5, [r1+]
 f0 14 00              leasp	r4, 0x0
 d5 2a                 call8	_ZL5applyIZ13avm_test_mainE3$_1EjT_j
 f0 33 00              ldsp16	r3, [sp+0x0]
 f9 72                 xor	r3, r4
 f0 3b 00              stsp16	[sp+0x0], r3
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 e1                 brne8	-0x1f <L1>
 f4 a8                 inc16	r0
 f0 0c 18              cmpi.s8	r0, 0x18
 d1 d3                 brne8	-0x2d <L0>
 f0 5b 00 01           stm16	[0x100], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<unsigned int apply<avm_test_main::$_0>(avm_test_main::$_0, unsigned int)>:
 c1 07                 ldi8	r5, 0x7
 fe 25                 mul16	r4, r5
 c8 03                 addi.s8	r4, 0x3
 ef                    ret

<unsigned int apply<avm_test_main::$_1>(avm_test_main::$_1, unsigned int)>:
 68                    ld16	r6, [r4]
 a9                    xor	r6, r5
 72                    st16	[r4], r6
 fa 82                 lsr16i	r5, 0x2
 19                    add	r6, r5
 02                    mov	r4, r6
 ef                    ret

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<__avm_umulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
