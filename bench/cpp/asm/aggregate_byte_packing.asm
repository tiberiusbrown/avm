
aggregate_byte_packing.elf:	file format elf32-avm

Disassembly of section .text:

<consume2(Bytes2)>:
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f1 74                 zext8	r4
 11                    add	r4, r5
 ef                    ret

<consume3(Bytes3)>:
 b1                    push16	r1
 b0                    push16	r0
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 08                    mov	r6, r4
 f1 76                 zext8	r6
 1b                    add	r6, r7
 f0 01 ff              ldi8	r1, 0xff
 f9 34                 and	r1, r5
 f1 21                 mov	r4, r1
 12                    add	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<consume4(Bytes4)>:
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 08                    mov	r6, r4
 f1 76                 zext8	r6
 1b                    add	r6, r7
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f1 74                 zext8	r4
 11                    add	r4, r5
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c4 00 a5              ldi16	r4, 0xa500
 f0 5c 02 01           stm16	[0x102], r4
 c4 25 a5              ldi16	r4, 0xa525
 f0 5c 04 01           stm16	[0x104], r4
 c4 4a a5              ldi16	r4, 0xa54a
 f0 5c 06 01           stm16	[0x106], r4
 c4 6f a5              ldi16	r4, 0xa56f
 f0 5c 08 01           stm16	[0x108], r4
 c4 94 a5              ldi16	r4, 0xa594
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 b9 a5              ldi16	r4, 0xa5b9
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 de a5              ldi16	r4, 0xa5de
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 03 a5              ldi16	r4, 0xa503
 f0 5c 10 01           stm16	[0x110], r4
 c4 28 a5              ldi16	r4, 0xa528
 f0 5c 12 01           stm16	[0x112], r4
 c4 4d a5              ldi16	r4, 0xa54d
 f0 5c 14 01           stm16	[0x114], r4
 c4 72 a5              ldi16	r4, 0xa572
 f0 5c 16 01           stm16	[0x116], r4
 c4 97 a5              ldi16	r4, 0xa597
 f0 5c 18 01           stm16	[0x118], r4
 c4 bc a5              ldi16	r4, 0xa5bc
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 e1 a5              ldi16	r4, 0xa5e1
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 06 a5              ldi16	r4, 0xa506
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 2b a5              ldi16	r4, 0xa52b
 f0 5c 20 01           stm16	[0x120], r4
 c4 50 a5              ldi16	r4, 0xa550
 f0 5c 22 01           stm16	[0x122], r4
 c4 75 a5              ldi16	r4, 0xa575
 f0 5c 24 01           stm16	[0x124], r4
 c4 9a a5              ldi16	r4, 0xa59a
 f0 5c 26 01           stm16	[0x126], r4
 c4 bf a5              ldi16	r4, 0xa5bf
 f0 5c 28 01           stm16	[0x128], r4
 c4 e4 a5              ldi16	r4, 0xa5e4
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 09 a5              ldi16	r4, 0xa509
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 2e a5              ldi16	r4, 0xa52e
 f0 5c 2e 01           stm16	[0x12e], r4
 c4 53 a5              ldi16	r4, 0xa553
 f0 5c 30 01           stm16	[0x130], r4
 c4 78 a5              ldi16	r4, 0xa578
 f0 5c 32 01           stm16	[0x132], r4
 c4 9d a5              ldi16	r4, 0xa59d
 f0 5c 34 01           stm16	[0x134], r4
 c4 c2 a5              ldi16	r4, 0xa5c2
 f0 5c 36 01           stm16	[0x136], r4
 c4 e7 a5              ldi16	r4, 0xa5e7
 f0 5c 38 01           stm16	[0x138], r4
 c4 0c a5              ldi16	r4, 0xa50c
 f0 5c 3a 01           stm16	[0x13a], r4
 c4 31 a5              ldi16	r4, 0xa531
 f0 5c 3c 01           stm16	[0x13c], r4
 c4 56 a5              ldi16	r4, 0xa556
 f0 5c 3e 01           stm16	[0x13e], r4
 c4 7b a5              ldi16	r4, 0xa57b
 f0 5c 40 01           stm16	[0x140], r4
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c6 02 01              ldi16	r6, 0x102
 c3 1f                 ldi8	r7, 0x1f
 f1 0d                 mov	r1, r5
<L0>:
 f4 41                 stsp16	[sp+0x0], r5
 06                    mov	r5, r6
 f0 02 03              ldi8	r2, 0x3
<L1>:
 f7 2c                 ld16	r4, [r5+]
 f4 51                 stsp16	[sp+0x4], r5
 f1 74                 zext8	r4
 f1 26                 mov	r5, r2
 c9 1e                 addi.s8	r5, 0x1e
 87                    and	r5, r7
 15                    add	r5, r5
 16                    add	r5, r6
 65                    ld16	r5, [r5]
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f1 22                 mov	r4, r2
 f4 b4                 dec16	r4
 83                    and	r4, r7
 f1 26                 mov	r5, r2
 87                    and	r5, r7
 15                    add	r5, r5
 16                    add	r5, r6
 10                    add	r4, r4
 12                    add	r4, r6
 f5 43                 ld16	r3, [r4]
 61                    ld16	r4, [r5]
 f4 48                 stsp16	[sp+0x2], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 e1 b6 fe              call16	_Z8consume26Bytes2
 f1 04                 mov	r0, r4
 f1 73                 zext8	r3
 f4 18                 ldsp16	r4, [sp+0x6]
 f1 27                 mov	r5, r3
 e1 b2 fe              call16	_Z8consume36Bytes3
 f2 08                 add	r1, r0
 f2 0c                 add	r1, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 fa 38                 lsl16i	r4, 0x8
 f9 8d                 or	r4, r3
 f4 19                 ldsp16	r5, [sp+0x6]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 e1 b4 fe              call16	_Z8consume46Bytes4
 f4 11                 ldsp16	r5, [sp+0x4]
 c3 1f                 ldi8	r7, 0x1f
 c6 02 01              ldi16	r6, 0x102
 f2 0c                 add	r1, r4
 f4 aa                 inc16	r2
 f0 0e 23              cmpi.s8	r2, 0x23
 d1 aa                 brne8	-0x56 <L1>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 10                 cmpi.s8	r5, 0x10
 d1 9c                 brne8	-0x64 <L0>
 f0 59 00 01           stm16	[0x100], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
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
