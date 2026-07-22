
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/progmem_widen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 progmem_widen.c
0000073a l     O .rodata	00000060 program_bytes
00000511 l     F .text	00000083 sum_bytes
00000594 l     F .text	000000b6 sum_signed_bytes
0000064a l     F .text	00000049 mix_bytes
00000693 l     F .text	00000057 sum_byte_pairs
0000079a l     O .rodata	00000050 program_words
000006ea l     F .text	0000004e sum_words
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000003fb avm_test_main
00000738 g     F .text	00000002 avm_halt

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
 e1 22 06              call16	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ae                 adjsp	-0x52
 c0 41                 ldi8	r4, 0x41
 f0 3c 50              stsp16	[sp+0x50], r4
 c0 3e                 ldi8	r4, 0x3e
 f0 3c 4e              stsp16	[sp+0x4e], r4
 c0 25                 ldi8	r4, 0x25
 f0 3c 4c              stsp16	[sp+0x4c], r4
 c0 29                 ldi8	r4, 0x29
 f0 3c 4a              stsp16	[sp+0x4a], r4
 c0 17                 ldi8	r4, 0x17
 f0 3c 48              stsp16	[sp+0x48], r4
 c0 21                 ldi8	r4, 0x21
 f0 3c 46              stsp16	[sp+0x46], r4
 c0 11                 ldi8	r4, 0x11
 f0 3c 44              stsp16	[sp+0x44], r4
 c4 3a 07              ldi16	r4, 0x73a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 50              ldsp16	r6, [sp+0x50]
 e1 c6 03              call16	sum_bytes
 f0 3c 3a              stsp16	[sp+0x3a], r4
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
 f0 3e 32              stsp16	[sp+0x32], r6
 c4 3b 07              ldi16	r4, 0x73b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 4e              ldsp16	r6, [sp+0x4e]
 e1 9e 03              call16	sum_bytes
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
 f0 3e 34              stsp16	[sp+0x34], r6
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 e1 06 04              call16	sum_signed_bytes
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 e1 b3 04              call16	mix_bytes
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 34 48              ldsp16	r4, [sp+0x48]
 e1 f3 04              call16	sum_byte_pairs
 f0 3c 3e              stsp16	[sp+0x3e], r4
 c4 9a 07              ldi16	r4, 0x79a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 46              ldsp16	r6, [sp+0x46]
 e1 3a 05              call16	sum_words
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 37 40              ldsp16	r7, [sp+0x40]
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 37 42              ldsp16	r7, [sp+0x42]
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 37 3e              ldsp16	r7, [sp+0x3e]
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
 f0 3e 30              stsp16	[sp+0x30], r6
 c4 9c 07              ldi16	r4, 0x79c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 44              ldsp16	r6, [sp+0x44]
 e1 dc 04              call16	sum_words
 f0 3c 36              stsp16	[sp+0x36], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 01 0f              ldi8	r1, 0xf
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 07                    mov	r5, r7
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 24              stsp16	[sp+0x24], r4
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 37 38              ldsp16	r7, [sp+0x38]
 0b                    mov	r6, r7
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 f0 3d 26              stsp16	[sp+0x26], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 37 40              ldsp16	r7, [sp+0x40]
 07                    mov	r5, r7
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 22              stsp16	[sp+0x22], r4
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 37 42              ldsp16	r7, [sp+0x42]
 07                    mov	r5, r7
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 20              stsp16	[sp+0x20], r4
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 07                    mov	r5, r7
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 37 36              ldsp16	r7, [sp+0x36]
 07                    mov	r5, r7
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 1e              stsp16	[sp+0x1e], r4
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 04                    mov	r5, r4
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f4 7b                 stsp16	[sp+0xe], r7
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 09                    mov	r6, r5
 ca 37                 addi.s8	r6, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 34                 cmov.ult	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 21                 cmp	r4, r1
 fc 3d                 cmov.ult	r7, r5
 f0 36 38              ldsp16	r6, [sp+0x38]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f0 36 40              ldsp16	r6, [sp+0x40]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f0 36 42              ldsp16	r6, [sp+0x42]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f0 36 36              ldsp16	r6, [sp+0x36]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 21                 cmp	r4, r1
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 c5 ab 20              ldi16	r5, 0x20ab
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 39                    cmp	r6, r5
 f8 0d                 cset.ne	r5
 f0 05 1e 1f           ldi16	r1, 0x1f1e
 f0 36 38              ldsp16	r6, [sp+0x38]
 f5 29                 cmp	r6, r1
 f8 09                 cset.ne	r1
 f9 35                 or	r1, r5
 c5 63 ff              ldi16	r5, 0xff63
 f0 36 40              ldsp16	r6, [sp+0x40]
 39                    cmp	r6, r5
 f8 0d                 cset.ne	r5
 f9 a5                 or	r5, r1
 f0 05 d2 59           ldi16	r1, 0x59d2
 f0 36 42              ldsp16	r6, [sp+0x42]
 f5 29                 cmp	r6, r1
 f8 0a                 cset.ne	r2
 f9 55                 or	r2, r5
 c5 31 4a              ldi16	r5, 0x4a31
 31                    cmp	r4, r5
 f8 09                 cset.ne	r1
 f9 29                 or	r1, r2
 c1 42                 ldi8	r5, 0x42
 01                    mov	r4, r5
 f0 3c 3e              stsp16	[sp+0x3e], r4
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 f0 3c 3a              stsp16	[sp+0x3a], r4
 d7 00                 sys	debug_putc
 c1 3d                 ldi8	r5, 0x3d
 01                    mov	r4, r5
 f0 3c 42              stsp16	[sp+0x42], r4
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c4 6d d4              ldi16	r4, 0xd46d
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f9 a5                 or	r5, r1
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 c4 65 58              ldi16	r4, 0x5865
 f0 36 36              ldsp16	r6, [sp+0x36]
 38                    cmp	r6, r4
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f0 00 01              ldi8	r0, 0x1
 f9 10                 and	r0, r4
 c0 0a                 ldi8	r4, 0xa
 f0 3c 40              stsp16	[sp+0x40], r4
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 f0 3c 3c              stsp16	[sp+0x3c], r4
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 f0 3c 3e              stsp16	[sp+0x3e], r4
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 52                 adjsp	sum_bytes+78
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<sum_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	avm_test_main+1017
 f2 62                 mov32	q0, q2
 f6 2e                 tst16	r6
 d0 07                 breq8	sum_bytes+19
 ce 01                 cmpi.s8	r6, 0x1
 d1 06                 brne8	sum_bytes+22
 aa                    xor	r6, r6
 d4 63                 jmp8	sum_bytes+118
 aa                    xor	r6, r6
 d4 65                 jmp8	sum_bytes+123
 c3 01                 ldi8	r7, 0x1
 06                    mov	r5, r6
 87                    and	r5, r7
 ca fe                 addi.s8	r6, -0x2
 fa 91                 lsr16i	r6, 0x1
 02                    mov	r4, r6
 f4 ac                 inc16	r4
 f6 2e                 tst16	r6
 d0 3d                 breq8	sum_bytes+98
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
 d1 03                 brne8	sum_bytes+99
 d4 10                 jmp8	sum_bytes+114
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
 d0 05                 breq8	sum_bytes+123
 02                    mov	r4, r6
 f0 60 c0              ldp8u	r6, [q0]
 18                    add	r6, r4
 02                    mov	r4, r6
 d6 08                 adjsp	sum_signed_bytes+3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sum_signed_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	sum_bytes+127
 f6 2c                 tst16	r4
 d0 10                 breq8	sum_signed_bytes+26
 f0 06 3d 07           ldi16	r2, 0x73d
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
 f0 06 3d 07           ldi16	r2, 0x73d
 f0 03 00              ldi8	r3, 0x0
 c8 fe                 addi.s8	r4, -0x2
 fa 71                 lsr16i	r4, 0x1
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f6 2c                 tst16	r4
 d0 5a                 breq8	sum_signed_bytes+145
 89                    and	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 06 fe ff           ldi16	r2, 0xfffe
 f9 54                 and	r2, r5
 f2 30                 sub	r0, r0
 c4 3d 07              ldi16	r4, 0x73d
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
 f1 14                 mov	r2, r4
 f6 2a                 tst16	r2
 d0 37                 breq8	mix_bytes+65
 c6 3c 07              ldi16	r6, 0x73c
 c3 00                 ldi8	r7, 0x0
 f2 39                 sub	r1, r1
 c5 2b 6d              ldi16	r5, 0x6d2b
 f0 00 0e              ldi8	r0, 0xe
 f0 65 6c              ldp8u	r3, [q3+]
 c4 01 01              ldi16	r4, 0x101
 fe 1c                 mul16	r3, r4
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 fa 41                 lsl16i	r5, 0x1
 94                    or	r5, r4
 01                    mov	r4, r5
 f9 8e                 xor	r4, r3
 f0 08 ef              addi.s8	r0, -0x11
 f0 03 11              ldi8	r3, 0x11
 f1 25                 mov	r5, r1
 fe 2b                 mul16	r5, r3
 f4 a9                 inc16	r1
 14                    add	r5, r4
 c9 03                 addi.s8	r5, 0x3
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 da                 brne8	mix_bytes+23
 f2 50                 sub	r4, r0
 d4 03                 jmp8	mix_bytes+68
 c4 2b 6d              ldi16	r4, 0x6d2b
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
 d0 0c                 breq8	sum_byte_pairs+22
 c6 3b 07              ldi16	r6, 0x73b
 c3 00                 ldi8	r7, 0x0
 cc 01                 cmpi.s8	r4, 0x1
 d1 06                 brne8	sum_byte_pairs+25
 a0                    xor	r4, r4
 d4 33                 jmp8	sum_byte_pairs+73
 a0                    xor	r4, r4
 d4 37                 jmp8	sum_byte_pairs+80
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 c5 fe ff              ldi16	r5, 0xfffe
 84                    and	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 3b 07              ldi16	r6, 0x73b
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 f1 14                 mov	r2, r4
 f0 68 0c              ldp32	q0, [q3+]
 f1 18                 mov	r3, r0
 f2 1c                 add	r3, r4
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 f2 23                 add	r4, r3
 f0 0a 02              addi.s8	r2, 0x2
 f0 30 02              ldsp16	r0, [sp+0x2]
 f5 10                 cmp	r2, r0
 d1 ea                 brne8	sum_byte_pairs+44
 f0 30 00              ldsp16	r0, [sp+0x0]
 f4 a0                 tst8	r0
 d0 07                 breq8	sum_byte_pairs+80
 f1 04                 mov	r0, r4
 f0 62 8c              ldp16	r4, [q3]
 f2 20                 add	r4, r0
 d6 04                 adjsp	sum_byte_pairs+86
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
 f6 2e                 tst16	r6
 d0 07                 breq8	sum_words+17
 ce 01                 cmpi.s8	r6, 0x1
 d1 06                 brne8	sum_words+20
 aa                    xor	r6, r6
 d4 2e                 jmp8	sum_words+63
 aa                    xor	r6, r6
 d4 32                 jmp8	sum_words+70
 c3 01                 ldi8	r7, 0x1
 8e                    and	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 c7 fe ff              ldi16	r7, 0xfffe
 8e                    and	r7, r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 f1 16                 mov	r2, r6
 f0 68 08              ldp32	q0, [q2+]
 f1 18                 mov	r3, r0
 f2 1e                 add	r3, r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 f2 2b                 add	r6, r3
 f0 0a 02              addi.s8	r2, 0x2
 f0 30 02              ldsp16	r0, [sp+0x2]
 f5 10                 cmp	r2, r0
 d1 ea                 brne8	sum_words+34
 f0 30 00              ldsp16	r0, [sp+0x0]
 f4 a0                 tst8	r0
 d0 07                 breq8	sum_words+70
 f1 06                 mov	r0, r6
 f0 62 c8              ldp16	r6, [q2]
 f2 28                 add	r6, r0
 02                    mov	r4, r6
 d6 04                 adjsp	sum_words+77
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
