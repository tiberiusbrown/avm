
popcount.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 01 80              ldi16	r4, 0x8001
 f0 5c 02 01           stm16	[0x102], r4
 c4 0c 89              ldi16	r4, 0x890c
 f0 5c 04 01           stm16	[0x104], r4
 c4 1b 92              ldi16	r4, 0x921b
 f0 5c 06 01           stm16	[0x106], r4
 c4 26 9b              ldi16	r4, 0x9b26
 f0 5c 08 01           stm16	[0x108], r4
 c4 35 a4              ldi16	r4, 0xa435
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 40 ad              ldi16	r4, 0xad40
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 4f b6              ldi16	r4, 0xb64f
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 5a bf              ldi16	r4, 0xbf5a
 f0 5c 10 01           stm16	[0x110], r4
 c4 69 c8              ldi16	r4, 0xc869
 f0 5c 12 01           stm16	[0x112], r4
 c4 74 d1              ldi16	r4, 0xd174
 f0 5c 14 01           stm16	[0x114], r4
 c4 83 da              ldi16	r4, 0xda83
 f0 5c 16 01           stm16	[0x116], r4
 c4 8e e3              ldi16	r4, 0xe38e
 f0 5c 18 01           stm16	[0x118], r4
 c4 9d ec              ldi16	r4, 0xec9d
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 a8 f5              ldi16	r4, 0xf5a8
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 b7 fe              ldi16	r4, 0xfeb7
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 c2 07              ldi16	r4, 0x7c2
 f0 5c 20 01           stm16	[0x120], r4
 c4 d1 10              ldi16	r4, 0x10d1
 f0 5c 22 01           stm16	[0x122], r4
 c4 dc 19              ldi16	r4, 0x19dc
 f0 5c 24 01           stm16	[0x124], r4
 c4 eb 22              ldi16	r4, 0x22eb
 f0 5c 26 01           stm16	[0x126], r4
 c4 f6 2b              ldi16	r4, 0x2bf6
 f0 5c 28 01           stm16	[0x128], r4
 c4 05 35              ldi16	r4, 0x3505
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 10 3e              ldi16	r4, 0x3e10
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 1f 47              ldi16	r4, 0x471f
 f0 5c 2e 01           stm16	[0x12e], r4
 c4 2a 50              ldi16	r4, 0x502a
 f0 5c 30 01           stm16	[0x130], r4
 a5                    xor	r5, r5
 f0 00 14              ldi8	r0, 0x14
 d7 01                 sys	debug_break
 f0 05 55 55           ldi16	r1, 0x5555
 c6 33 33              ldi16	r6, 0x3333
 f0 06 0f 0f           ldi16	r2, 0xf0f
 f0 03 1f              ldi8	r3, 0x1f
<L0>:
 f0 57 02 01           ldm16	r7, [0x102]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 04 01           ldm16	r5, [0x104]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 06 01           ldm16	r7, [0x106]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 08 01           ldm16	r5, [0x108]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 0a 01           ldm16	r7, [0x10a]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 0c 01           ldm16	r5, [0x10c]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 0e 01           ldm16	r7, [0x10e]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 10 01           ldm16	r5, [0x110]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 12 01           ldm16	r7, [0x112]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 14 01           ldm16	r5, [0x114]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 16 01           ldm16	r7, [0x116]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 18 01           ldm16	r5, [0x118]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 1a 01           ldm16	r7, [0x11a]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 1c 01           ldm16	r5, [0x11c]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 1e 01           ldm16	r7, [0x11e]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 20 01           ldm16	r5, [0x120]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 22 01           ldm16	r7, [0x122]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 24 01           ldm16	r5, [0x124]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 26 01           ldm16	r7, [0x126]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 28 01           ldm16	r5, [0x128]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 2a 01           ldm16	r7, [0x12a]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 2c 01           ldm16	r5, [0x12c]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 2e 01           ldm16	r7, [0x12e]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 30 01           ldm16	r5, [0x130]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 db 41 fd              brne16	-0x2bf <L0>
 f0 5d 00 01           stm16	[0x100], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
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
