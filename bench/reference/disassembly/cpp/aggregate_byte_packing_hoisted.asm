
aggregate_byte_packing_hoisted.elf:	file format elf32-avm

Disassembly of section .text:

<consume_coord(ChunkCoord)>:
 c3 ff                 ldi8	r7, 0xff
 8d                    and	r7, r5
 0b                    mov	r6, r7
 c1 05                 ldi8	r5, 0x5
 f3 19                 mulu8.w	r6, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 0d                    mov	r7, r5
 1f                    add	r7, r7
 1d                    add	r7, r5
 f1 74                 zext8	r4
 13                    add	r4, r7
 12                    add	r4, r6
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 a5                    xor	r5, r5
 f0 b4 03              stm8	[0x103], r5
 c0 25                 ldi8	r4, 0x25
 f0 b0 04              stm8	[0x104], r4
 c0 4a                 ldi8	r4, 0x4a
 f0 b0 05              stm8	[0x105], r4
 c0 6f                 ldi8	r4, 0x6f
 f0 b0 06              stm8	[0x106], r4
 c0 94                 ldi8	r4, 0x94
 f0 b0 07              stm8	[0x107], r4
 c0 b9                 ldi8	r4, 0xb9
 f0 b0 08              stm8	[0x108], r4
 c0 de                 ldi8	r4, 0xde
 f0 b0 09              stm8	[0x109], r4
 c0 03                 ldi8	r4, 0x3
 f0 b0 0a              stm8	[0x10a], r4
 c0 28                 ldi8	r4, 0x28
 f0 b0 0b              stm8	[0x10b], r4
 c0 4d                 ldi8	r4, 0x4d
 f0 b0 0c              stm8	[0x10c], r4
 c0 72                 ldi8	r4, 0x72
 f0 b0 0d              stm8	[0x10d], r4
 c0 97                 ldi8	r4, 0x97
 f0 b0 0e              stm8	[0x10e], r4
 c0 bc                 ldi8	r4, 0xbc
 f0 b0 0f              stm8	[0x10f], r4
 c0 e1                 ldi8	r4, 0xe1
 f0 b0 10              stm8	[0x110], r4
 c0 06                 ldi8	r4, 0x6
 f0 b0 11              stm8	[0x111], r4
 c0 2b                 ldi8	r4, 0x2b
 f0 b0 12              stm8	[0x112], r4
 c0 81                 ldi8	r4, 0x81
 f0 b0 00              stm8	[0x100], r4
 d7 01                 sys	debug_break
 f1 15                 mov	r2, r5
<L0>:
 f4 41                 stsp16	[sp+0x0], r5
 a0                    xor	r4, r4
<L1>:
 f4 48                 stsp16	[sp+0x2], r4
 f0 07 03 01           ldi16	r3, 0x103
 f2 23                 add	r4, r3
 40                    ld8u	r4, [r4]
 f1 0c                 mov	r1, r4
 f0 00 10              ldi8	r0, 0x10
<L2>:
 f0 6c 87              ld8u	r4, [r3+]
 f0 94 00              ldm8u	r5, [0x100]
 09                    mov	r6, r5
 fa 38                 lsl16i	r4, 0x8
 92                    or	r4, r6
 f1 25                 mov	r5, r1
 e1 6f ff              call16	_Z13consume_coord10ChunkCoord
 f2 14                 add	r2, r4
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 e9                 brne8	-0x17 <L2>
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 d3                 brne8	-0x2d <L1>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 c8                 brne8	-0x38 <L0>
 f0 e8 01              stm16	[0x101], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
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
