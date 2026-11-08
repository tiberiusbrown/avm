
count_trailing_zeros.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 18              ldi16	r4, 0x1800
 f0 5c 02 01           stm16	[0x102], r4
 c4 0d 11              ldi16	r4, 0x110d
 f0 5c 04 01           stm16	[0x104], r4
 c4 1a 0a              ldi16	r4, 0xa1a
 f0 5c 06 01           stm16	[0x106], r4
 c4 27 03              ldi16	r4, 0x327
 f0 5c 08 01           stm16	[0x108], r4
 c4 34 3c              ldi16	r4, 0x3c34
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 41 35              ldi16	r4, 0x3541
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 4e 2e              ldi16	r4, 0x2e4e
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 5b 27              ldi16	r4, 0x275b
 f0 5c 10 01           stm16	[0x110], r4
 c4 68 50              ldi16	r4, 0x5068
 f0 5c 12 01           stm16	[0x112], r4
 c4 75 49              ldi16	r4, 0x4975
 f0 5c 14 01           stm16	[0x114], r4
 c4 82 42              ldi16	r4, 0x4282
 f0 5c 16 01           stm16	[0x116], r4
 c4 8f 7b              ldi16	r4, 0x7b8f
 f0 5c 18 01           stm16	[0x118], r4
 c4 9c 74              ldi16	r4, 0x749c
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 a9 6d              ldi16	r4, 0x6da9
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 b6 66              ldi16	r4, 0x66b6
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 c3 9f              ldi16	r4, 0x9fc3
 f0 5c 20 01           stm16	[0x120], r4
 c4 d0 88              ldi16	r4, 0x88d0
 f0 5c 22 01           stm16	[0x122], r4
 c4 dd 81              ldi16	r4, 0x81dd
 f0 5c 24 01           stm16	[0x124], r4
 c4 ea ba              ldi16	r4, 0xbaea
 f0 5c 26 01           stm16	[0x126], r4
 c4 f7 b3              ldi16	r4, 0xb3f7
 f0 5c 28 01           stm16	[0x128], r4
 c4 04 ad              ldi16	r4, 0xad04
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 11 a6              ldi16	r4, 0xa611
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 1e df              ldi16	r4, 0xdf1e
 f0 5c 2e 01           stm16	[0x12e], r4
 c4 2b c8              ldi16	r4, 0xc82b
 f0 5c 30 01           stm16	[0x130], r4
 f2 30                 sub	r0, r0
 f0 01 14              ldi8	r1, 0x14
 d7 01                 sys	debug_break
 f0 06 00 80           ldi16	r2, 0x8000
 f0 07 18 f4           ldi16	r3, 0xf418
 f1 2c                 mov	r7, r0
<L0>:
 f0 55 02 01           ldm16	r5, [0x102]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 04 01           ldm16	r5, [0x104]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 06 01           ldm16	r5, [0x106]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 08 01           ldm16	r5, [0x108]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 0a 01           ldm16	r5, [0x10a]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 0c 01           ldm16	r5, [0x10c]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 0e 01           ldm16	r5, [0x10e]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 10 01           ldm16	r5, [0x110]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 12 01           ldm16	r5, [0x112]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 14 01           ldm16	r5, [0x114]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 16 01           ldm16	r5, [0x116]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 18 01           ldm16	r5, [0x118]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 1a 01           ldm16	r5, [0x11a]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 1c 01           ldm16	r5, [0x11c]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 1e 01           ldm16	r5, [0x11e]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 20 01           ldm16	r5, [0x120]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 22 01           ldm16	r5, [0x122]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 24 01           ldm16	r5, [0x124]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 26 01           ldm16	r5, [0x126]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 28 01           ldm16	r5, [0x128]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 2a 01           ldm16	r5, [0x12a]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 2c 01           ldm16	r5, [0x12c]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f0 55 2e 01           ldm16	r5, [0x12e]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 17                    add	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 55 30 01           ldm16	r5, [0x130]
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 21                    sub	r4, r5
 81                    and	r4, r5
 ff 0d                 u16tof
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 f2 2f                 add	r7, r3
 f4 b1                 dec16	r1
 f4 a1                 tst8	r1
 db 3b fe              brne16	-0x1c5 <L0>
 f0 5f 00 01           stm16	[0x100], r7
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
