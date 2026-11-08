
small_memops.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 02 01              ldi16	r4, 0x102
 c6 d5 0e              ldi16	r6, 0xed5
 c3 00                 ldi8	r7, 0x0
 c1 20                 ldi8	r5, 0x20
 d7 10                 sys	memcpy_p
 f2 39                 sub	r1, r1
 c3 40                 ldi8	r7, 0x40
 d7 01                 sys	debug_break
 f0 06 26 01           ldi16	r2, 0x126
 f0 04 34 01           ldi16	r0, 0x134
 f0 07 36 01           ldi16	r3, 0x136
<L0>:
 c4 22 01              ldi16	r4, 0x122
 a5                    xor	r5, r5
 c2 20                 ldi8	r6, 0x20
 d7 11                 sys	memset
 c4 23 01              ldi16	r4, 0x123
 c5 05 01              ldi16	r5, 0x105
 c2 01                 ldi8	r6, 0x1
 d7 0f                 sys	memcpy
 c4 24 01              ldi16	r4, 0x124
 c5 07 01              ldi16	r5, 0x107
 c2 02                 ldi8	r6, 0x2
 d7 0f                 sys	memcpy
 f1 22                 mov	r4, r2
 c5 09 01              ldi16	r5, 0x109
 c2 03                 ldi8	r6, 0x3
 d7 0f                 sys	memcpy
 c4 2a 01              ldi16	r4, 0x12a
 c5 0b 01              ldi16	r5, 0x10b
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 c4 2e 01              ldi16	r4, 0x12e
 c5 0d 01              ldi16	r5, 0x10d
 c2 05                 ldi8	r6, 0x5
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
 c1 5a                 ldi8	r5, 0x5a
 c2 08                 ldi8	r6, 0x8
 d7 11                 sys	memset
 c4 29 01              ldi16	r4, 0x129
 f1 26                 mov	r5, r2
 c2 07                 ldi8	r6, 0x7
 d7 12                 sys	memmove
 f1 23                 mov	r4, r3
 f1 24                 mov	r5, r0
 c2 0c                 ldi8	r6, 0xc
 d7 12                 sys	memmove
 f0 44 22 01           ldm8u	r4, [0x122]
 f2 21                 add	r4, r1
 f0 45 23 01           ldm8u	r5, [0x123]
 14                    add	r5, r4
 f0 44 24 01           ldm8u	r4, [0x124]
 11                    add	r4, r5
 f0 45 25 01           ldm8u	r5, [0x125]
 14                    add	r5, r4
 f0 44 26 01           ldm8u	r4, [0x126]
 11                    add	r4, r5
 f0 45 27 01           ldm8u	r5, [0x127]
 14                    add	r5, r4
 f0 44 28 01           ldm8u	r4, [0x128]
 11                    add	r4, r5
 f0 45 29 01           ldm8u	r5, [0x129]
 14                    add	r5, r4
 f0 44 2a 01           ldm8u	r4, [0x12a]
 11                    add	r4, r5
 f0 45 2b 01           ldm8u	r5, [0x12b]
 14                    add	r5, r4
 f0 44 2c 01           ldm8u	r4, [0x12c]
 11                    add	r4, r5
 f0 45 2d 01           ldm8u	r5, [0x12d]
 14                    add	r5, r4
 f0 44 2e 01           ldm8u	r4, [0x12e]
 11                    add	r4, r5
 f0 45 2f 01           ldm8u	r5, [0x12f]
 14                    add	r5, r4
 f0 44 30 01           ldm8u	r4, [0x130]
 11                    add	r4, r5
 f0 45 31 01           ldm8u	r5, [0x131]
 14                    add	r5, r4
 f0 44 32 01           ldm8u	r4, [0x132]
 11                    add	r4, r5
 f0 45 33 01           ldm8u	r5, [0x133]
 14                    add	r5, r4
 f0 44 34 01           ldm8u	r4, [0x134]
 11                    add	r4, r5
 f0 45 35 01           ldm8u	r5, [0x135]
 14                    add	r5, r4
 f0 44 36 01           ldm8u	r4, [0x136]
 11                    add	r4, r5
 f0 45 37 01           ldm8u	r5, [0x137]
 14                    add	r5, r4
 f0 44 38 01           ldm8u	r4, [0x138]
 11                    add	r4, r5
 f0 45 39 01           ldm8u	r5, [0x139]
 14                    add	r5, r4
 f0 44 3a 01           ldm8u	r4, [0x13a]
 11                    add	r4, r5
 f0 45 3b 01           ldm8u	r5, [0x13b]
 14                    add	r5, r4
 f0 44 3c 01           ldm8u	r4, [0x13c]
 11                    add	r4, r5
 f0 45 3d 01           ldm8u	r5, [0x13d]
 14                    add	r5, r4
 f0 44 3e 01           ldm8u	r4, [0x13e]
 11                    add	r4, r5
 f0 45 3f 01           ldm8u	r5, [0x13f]
 14                    add	r5, r4
 f0 44 40 01           ldm8u	r4, [0x140]
 11                    add	r4, r5
 f0 41 41 01           ldm8u	r1, [0x141]
 f2 0c                 add	r1, r4
 f4 b7                 dec16	r7
 f4 a7                 tst8	r7
 db 05 ff              brne16	-0xfb <L0>
 f0 59 00 01           stm16	[0x100], r1
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
