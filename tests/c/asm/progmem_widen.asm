
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/progmem_widen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 progmem_widen.c
00000751 l     O .rodata	00000060 program_bytes
0000052f l     F .text	00000087 sum_bytes
000005b6 l     F .text	000000b6 sum_signed_bytes
0000066c l     F .text	00000047 mix_bytes
000006b3 l     F .text	00000052 sum_byte_pairs
000007b1 l     O .rodata	00000050 program_words
00000705 l     F .text	0000004a sum_words
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000419 avm_test_main
0000074f g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 39 06              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ac                 adjsp	-0x54
 c0 41                 ldi8	r4, 0x41
 f0 3c 52              stsp16	[sp+0x52], r4
 c0 3e                 ldi8	r4, 0x3e
 f0 3c 50              stsp16	[sp+0x50], r4
 c0 25                 ldi8	r4, 0x25
 f0 3c 4e              stsp16	[sp+0x4e], r4
 c0 29                 ldi8	r4, 0x29
 f0 3c 4c              stsp16	[sp+0x4c], r4
 c0 17                 ldi8	r4, 0x17
 f0 3c 4a              stsp16	[sp+0x4a], r4
 c0 21                 ldi8	r4, 0x21
 f0 3c 48              stsp16	[sp+0x48], r4
 c0 11                 ldi8	r4, 0x11
 f0 3c 46              stsp16	[sp+0x46], r4
 c4 51 07              ldi16	r4, 0x751
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 52              ldsp16	r6, [sp+0x52]
 e1 e3 03              call16	sum_bytes
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 00 30              ldi8	r0, 0x30
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 34              stsp16	[sp+0x34], r6
 c4 52 07              ldi16	r4, 0x752
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 50              ldsp16	r6, [sp+0x50]
 e1 bb 03              call16	sum_bytes
 f0 3c 38              stsp16	[sp+0x38], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 e1 27 04              call16	sum_signed_bytes
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 e1 d4 04              call16	mix_bytes
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 e1 12 05              call16	sum_byte_pairs
 f0 3c 40              stsp16	[sp+0x40], r4
 c4 b1 07              ldi16	r4, 0x7b1
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 48              ldsp16	r6, [sp+0x48]
 e1 54 05              call16	sum_words
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 37 42              ldsp16	r7, [sp+0x42]
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 32              stsp16	[sp+0x32], r6
 f0 37 44              ldsp16	r7, [sp+0x44]
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 37 40              ldsp16	r7, [sp+0x40]
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 2e              stsp16	[sp+0x2e], r6
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 2c              stsp16	[sp+0x2c], r6
 c4 b3 07              ldi16	r4, 0x7b3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 46              ldsp16	r6, [sp+0x46]
 e1 f6 04              call16	sum_words
 f0 3c 3a              stsp16	[sp+0x3a], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 01 0f              ldi8	r1, 0xf
 f0 37 3c              ldsp16	r7, [sp+0x3c]
 03                    mov	r4, r7
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 26              stsp16	[sp+0x26], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 37 38              ldsp16	r7, [sp+0x38]
 0b                    mov	r6, r7
 f9 c4                 and	r6, r1
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 28              stsp16	[sp+0x28], r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 37 42              ldsp16	r7, [sp+0x42]
 03                    mov	r4, r7
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 24              stsp16	[sp+0x24], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 37 44              ldsp16	r7, [sp+0x44]
 03                    mov	r4, r7
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 37 40              ldsp16	r7, [sp+0x40]
 03                    mov	r4, r7
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 1a              stsp16	[sp+0x1a], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 03                    mov	r4, r7
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 18              stsp16	[sp+0x18], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 03                    mov	r4, r7
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f0 3d 10              stsp16	[sp+0x10], r5
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 37 38              ldsp16	r7, [sp+0x38]
 03                    mov	r4, r7
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 2d                 cmp	r7, r1
 fc 25                 cmov.ult	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f0 36 42              ldsp16	r6, [sp+0x42]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f0 36 44              ldsp16	r6, [sp+0x44]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 f0 36 40              ldsp16	r6, [sp+0x40]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 c5 ab 20              ldi16	r5, 0x20ab
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 31                    cmp	r4, r5
 f8 09                 cset.ne	r1
 c5 1e 1f              ldi16	r5, 0x1f1e
 3d                    cmp	r7, r5
 f8 0d                 cset.ne	r5
 f9 a5                 or	r5, r1
 c7 63 ff              ldi16	r7, 0xff63
 f0 34 42              ldsp16	r4, [sp+0x42]
 33                    cmp	r4, r7
 f8 0f                 cset.ne	r7
 9d                    or	r7, r5
 c5 d2 59              ldi16	r5, 0x59d2
 f0 34 44              ldsp16	r4, [sp+0x44]
 31                    cmp	r4, r5
 f8 0d                 cset.ne	r5
 97                    or	r5, r7
 c7 31 4a              ldi16	r7, 0x4a31
 3b                    cmp	r6, r7
 f8 0f                 cset.ne	r7
 9d                    or	r7, r5
 f0 03 42              ldi8	r3, 0x42
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 02 3d              ldi8	r2, 0x3d
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c4 6d d4              ldi16	r4, 0xd46d
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 f0 35 20              ldsp16	r5, [sp+0x20]
 b4                    push16	r4
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 bc                    pop16	r4
 93                    or	r4, r7
 f0 35 34              ldsp16	r5, [sp+0x34]
 b4                    push16	r4
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 bc                    pop16	r4
 f0 35 26              ldsp16	r5, [sp+0x26]
 b4                    push16	r4
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c5 65 58              ldi16	r5, 0x5865
 bc                    pop16	r4
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 39                    cmp	r6, r5
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 01 01              ldi8	r1, 0x1
 f9 34                 and	r1, r5
 c0 0a                 ldi8	r4, 0xa
 f0 3c 44              stsp16	[sp+0x44], r4
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 f0 3c 40              stsp16	[sp+0x40], r4
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 f0 3c 3e              stsp16	[sp+0x3e], r4
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 f0 3c 42              stsp16	[sp+0x42], r4
 d7 00                 sys	debug_putc
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 22              ldsp16	r5, [sp+0x22]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 36              ldsp16	r5, [sp+0x36]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 28              ldsp16	r5, [sp+0x28]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 c1 53                 ldi8	r5, 0x53
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 32              ldsp16	r5, [sp+0x32]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 24              ldsp16	r5, [sp+0x24]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 c1 4d                 ldi8	r5, 0x4d
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 16              ldsp16	r5, [sp+0x16]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 30              ldsp16	r5, [sp+0x30]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 c1 50                 ldi8	r5, 0x50
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 f0 3c 40              stsp16	[sp+0x40], r4
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 14              ldsp16	r5, [sp+0x14]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 c1 57                 ldi8	r5, 0x57
 01                    mov	r4, r5
 f0 3c 3c              stsp16	[sp+0x3c], r4
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 39                 ldsp16	r5, [sp+0xe]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 10              ldsp16	r5, [sp+0x10]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d6 54                 adjsp	sum_bytes+79
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sum_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	avm_test_main+1047
 f2 62                 mov32	q0, q2
 f6 2e                 tst16	r6
 d0 07                 breq8	sum_bytes+19
 ce 01                 cmpi.s8	r6, 0x1
 d1 06                 brne8	sum_bytes+22
 aa                    xor	r6, r6
 d4 51                 jmp8	sum_bytes+100
 aa                    xor	r6, r6
 d4 53                 jmp8	sum_bytes+105
 c3 01                 ldi8	r7, 0x1
 06                    mov	r5, r6
 87                    and	r5, r7
 ca fe                 addi.s8	r6, -0x2
 f4 8e                 lsr16.1	r6
 02                    mov	r4, r6
 f4 ac                 inc16	r4
 f6 2e                 tst16	r6
 d0 4c                 breq8	sum_bytes+113
 f4 49                 stsp16	[sp+0x2], r5
 8c                    and	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 f0 06 fe ff           ldi16	r2, 0xfffe
 f9 50                 and	r2, r4
 aa                    xor	r6, r6
 f1 1e                 mov	r3, r6
 f0 68 80              ldp32	q2, [q0+]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 16                    add	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 06                    mov	r5, r6
 f1 75                 zext8	r5
 14                    add	r5, r4
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f0 0b 02              addi.s8	r3, 0x2
 f5 1a                 cmp	r3, r2
 d1 db                 brne8	sum_bytes+51
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 f4 09                 ldsp16	r5, [sp+0x2]
 d1 12                 brne8	sum_bytes+114
 f4 a5                 tst8	r5
 d0 05                 breq8	sum_bytes+105
 02                    mov	r4, r6
 f0 60 c0              ldp8u	r6, [q0]
 18                    add	r6, r4
 02                    mov	r4, r6
 d6 08                 adjsp	sum_bytes+116
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 f0 66 80              ldp16	r4, [q0+]
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 12                    add	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f4 a5                 tst8	r5
 d0 e4                 breq8	sum_bytes+105
 d4 dd                 jmp8	sum_bytes+100

<sum_signed_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	sum_bytes+131
 f6 2c                 tst16	r4
 d0 10                 breq8	sum_signed_bytes+26
 f0 06 54 07           ldi16	r2, 0x754
 f0 03 00              ldi8	r3, 0x0
 cc 01                 cmpi.s8	r4, 0x1
 d1 0a                 brne8	sum_signed_bytes+31
 f2 30                 sub	r0, r0
 e0 8c 00              jmp16	sum_signed_bytes+166
 f2 30                 sub	r0, r0
 e0 8e 00              jmp16	sum_signed_bytes+173
 c2 01                 ldi8	r6, 0x1
 04                    mov	r5, r4
 86                    and	r5, r6
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 54 07           ldi16	r2, 0x754
 f0 03 00              ldi8	r3, 0x0
 c8 fe                 addi.s8	r4, -0x2
 f4 8c                 lsr16.1	r4
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f6 2c                 tst16	r4
 d0 5a                 breq8	sum_signed_bytes+145
 89                    and	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 06 fe ff           ldi16	r2, 0xfffe
 f9 54                 and	r2, r5
 f2 30                 sub	r0, r0
 c4 54 07              ldi16	r4, 0x754
 c1 00                 ldi8	r5, 0x0
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f1 18                 mov	r3, r0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 68 c8              ldp32	q3, [q2+]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 f6 45                 sext8	r5
 f2 24                 add	r5, r0
 02                    mov	r4, r6
 fa b8                 asr16i	r4, 0x8
 11                    add	r4, r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 06                    mov	r5, r6
 f6 45                 sext8	r5
 14                    add	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 02                    mov	r4, r6
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 a0                    xor	r4, r4
 fa d8                 asr16i	r6, 0x8
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f2 04                 add	r0, r4
 f0 0b 02              addi.s8	r3, 0x2
 f5 1a                 cmp	r3, r2
 d1 ca                 brne8	sum_signed_bytes+77
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d1 04                 brne8	sum_signed_bytes+147
 d4 0f                 jmp8	sum_signed_bytes+160
 f2 30                 sub	r0, r0
 f0 66 c4              ldp16	r6, [q1+]
 0e                    mov	r7, r6
 f6 47                 sext8	r7
 f2 2c                 add	r7, r0
 fa d8                 asr16i	r6, 0x8
 1b                    add	r6, r7
 f1 06                 mov	r0, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 a4                 tst8	r4
 d0 07                 breq8	sum_signed_bytes+173
 f1 28                 mov	r6, r0
 f0 61 04              ldp8s	r0, [q1]
 f2 06                 add	r0, r6
 f1 20                 mov	r4, r0
 d6 0a                 adjsp	mix_bytes+5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d0 36                 breq8	mix_bytes+62
 f0 04 53 07           ldi16	r0, 0x753
 f0 01 00              ldi8	r1, 0x0
 f2 4b                 sub	r3, r3
 c7 2b 6d              ldi16	r7, 0x6d2b
 f0 02 0e              ldi8	r2, 0xe
 f0 65 c0              ldp8u	r6, [q0+]
 c5 01 01              ldi16	r5, 0x101
 fe 35                 mul16	r6, r5
 07                    mov	r5, r7
 fa 8f                 lsr16i	r5, 0xf
 1f                    add	r7, r7
 9d                    or	r7, r5
 07                    mov	r5, r7
 a6                    xor	r5, r6
 f0 0a ef              addi.s8	r2, -0x11
 c2 11                 ldi8	r6, 0x11
 f1 2f                 mov	r7, r3
 fe 3e                 mul16	r7, r6
 f4 ab                 inc16	r3
 1d                    add	r7, r5
 cb 03                 addi.s8	r7, 0x3
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 dd                 brne8	mix_bytes+23
 f2 56                 sub	r5, r2
 d4 03                 jmp8	mix_bytes+65
 c5 2b 6d              ldi16	r5, 0x6d2b
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sum_byte_pairs>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	sum_byte_pairs+2
 f6 2c                 tst16	r4
 d0 0e                 breq8	sum_byte_pairs+24
 f0 06 52 07           ldi16	r2, 0x752
 f0 03 00              ldi8	r3, 0x0
 cc 01                 cmpi.s8	r4, 0x1
 d1 06                 brne8	sum_byte_pairs+27
 a0                    xor	r4, r4
 d4 2e                 jmp8	sum_byte_pairs+70
 a0                    xor	r4, r4
 d4 30                 jmp8	sum_byte_pairs+75
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 c5 fe ff              ldi16	r5, 0xfffe
 84                    and	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 52 07           ldi16	r2, 0x752
 f0 03 00              ldi8	r3, 0x0
 a0                    xor	r4, r4
 08                    mov	r6, r4
 f0 68 04              ldp32	q0, [q1+]
 f1 2c                 mov	r7, r0
 1c                    add	r7, r4
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 13                    add	r4, r7
 ca 02                 addi.s8	r6, 0x2
 f4 0b                 ldsp16	r7, [sp+0x2]
 3b                    cmp	r6, r7
 d1 ef                 brne8	sum_byte_pairs+47
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d0 05                 breq8	sum_byte_pairs+75
 08                    mov	r6, r4
 f0 62 84              ldp16	r4, [q1]
 12                    add	r4, r6
 d6 04                 adjsp	sum_byte_pairs+81
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sum_words>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	sum_words+2
 f2 62                 mov32	q0, q2
 f6 2e                 tst16	r6
 d0 07                 breq8	sum_words+19
 ce 01                 cmpi.s8	r6, 0x1
 d1 06                 brne8	sum_words+22
 a0                    xor	r4, r4
 d4 2b                 jmp8	sum_words+62
 a0                    xor	r4, r4
 d4 2d                 jmp8	sum_words+67
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 c4 fe ff              ldi16	r4, 0xfffe
 82                    and	r4, r6
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 f1 14                 mov	r2, r4
 f0 68 c0              ldp32	q3, [q0+]
 f1 1e                 mov	r3, r6
 f2 1c                 add	r3, r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f2 23                 add	r4, r3
 f0 0a 02              addi.s8	r2, 0x2
 f4 0a                 ldsp16	r6, [sp+0x2]
 f5 16                 cmp	r2, r6
 d1 ec                 brne8	sum_words+36
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d0 05                 breq8	sum_words+67
 08                    mov	r6, r4
 f0 62 80              ldp16	r4, [q0]
 12                    add	r4, r6
 d6 04                 adjsp	sum_words+73
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
