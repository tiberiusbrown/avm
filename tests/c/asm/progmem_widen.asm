
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/progmem_widen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 progmem_widen.c
00000702 l     O .rodata	00000060 program_bytes
000004da l     F .text	0000007e sum_bytes
00000558 l     F .text	000000c4 sum_signed_bytes
0000061c l     F .text	00000045 mix_bytes
00000661 l     F .text	0000004e sum_byte_pairs
00000762 l     O .rodata	00000050 program_words
000006af l     F .text	00000051 sum_words
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000003c4 avm_test_main
00000700 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 ea 05              call16	avm_halt

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
 c4 02 07              ldi16	r4, 0x702
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 52              ldsp16	r6, [sp+0x52]
 e1 8e 03              call16	sum_bytes
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
 c4 03 07              ldi16	r4, 0x703
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 50              ldsp16	r6, [sp+0x50]
 e1 66 03              call16	sum_bytes
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
 e1 c9 03              call16	sum_signed_bytes
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 e1 84 04              call16	mix_bytes
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 e1 c0 04              call16	sum_byte_pairs
 f0 3c 40              stsp16	[sp+0x40], r4
 c4 62 07              ldi16	r4, 0x762
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 48              ldsp16	r6, [sp+0x48]
 e1 fe 04              call16	sum_words
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 35 42              ldsp16	r5, [sp+0x42]
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 35 44              ldsp16	r5, [sp+0x44]
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 35 40              ldsp16	r5, [sp+0x40]
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 2e              stsp16	[sp+0x2e], r5
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 32              stsp16	[sp+0x32], r5
 c4 64 07              ldi16	r4, 0x764
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 46              ldsp16	r6, [sp+0x46]
 e1 a4 04              call16	sum_words
 f0 3c 3a              stsp16	[sp+0x3a], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 01 0f              ldi8	r1, 0xf
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 02                    mov	r4, r6
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 37 38              ldsp16	r7, [sp+0x38]
 03                    mov	r4, r7
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 36 42              ldsp16	r6, [sp+0x42]
 02                    mov	r4, r6
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 36 44              ldsp16	r6, [sp+0x44]
 02                    mov	r4, r6
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 36 40              ldsp16	r6, [sp+0x40]
 02                    mov	r4, r6
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 06                    mov	r5, r6
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 28              stsp16	[sp+0x28], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 02                    mov	r4, r6
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 21                 cmp	r4, r1
 fc 35                 cmov.ult	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 03                    mov	r4, r7
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 c8 37                 addi.s8	r4, 0x37
 f5 2d                 cmp	r7, r1
 fc 26                 cmov.ult	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 42              ldsp16	r4, [sp+0x42]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 0b                    mov	r6, r7
 f9 c1                 or	r6, r0
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3e                 cmov.ult	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 44              ldsp16	r4, [sp+0x44]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 0b                    mov	r6, r7
 f9 c1                 or	r6, r0
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3e                 cmov.ult	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 0b                    mov	r6, r7
 f9 c1                 or	r6, r0
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3e                 cmov.ult	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 0b                    mov	r6, r7
 f9 c1                 or	r6, r0
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3e                 cmov.ult	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 34 40              ldsp16	r4, [sp+0x40]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 0b                    mov	r6, r7
 f9 c1                 or	r6, r0
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3e                 cmov.ult	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 c6 ab 20              ldi16	r6, 0x20ab
 f0 37 3c              ldsp16	r7, [sp+0x3c]
 3e                    cmp	r7, r6
 f8 0e                 cset.ne	r6
 c7 1e 1f              ldi16	r7, 0x1f1e
 f0 35 38              ldsp16	r5, [sp+0x38]
 37                    cmp	r5, r7
 f8 0f                 cset.ne	r7
 9e                    or	r7, r6
 c6 63 ff              ldi16	r6, 0xff63
 f0 35 42              ldsp16	r5, [sp+0x42]
 36                    cmp	r5, r6
 f8 0e                 cset.ne	r6
 9b                    or	r6, r7
 c7 d2 59              ldi16	r7, 0x59d2
 f0 35 44              ldsp16	r5, [sp+0x44]
 37                    cmp	r5, r7
 f8 0f                 cset.ne	r7
 9e                    or	r7, r6
 c6 31 4a              ldi16	r6, 0x4a31
 32                    cmp	r4, r6
 f8 09                 cset.ne	r1
 f9 3d                 or	r1, r7
 c2 42                 ldi8	r6, 0x42
 02                    mov	r4, r6
 06                    mov	r5, r6
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 02 3d              ldi8	r2, 0x3d
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 c4 6d d4              ldi16	r4, 0xd46d
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 38                    cmp	r6, r4
 f8 0e                 cset.ne	r6
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f9 c5                 or	r6, r1
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 c4 65 58              ldi16	r4, 0x5865
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 3c                    cmp	r7, r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 01 01              ldi8	r1, 0x1
 f9 30                 and	r1, r4
 f0 03 0a              ldi8	r3, 0xa
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 0d                    mov	r7, r5
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c2 31                 ldi8	r6, 0x31
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c1 57                 ldi8	r5, 0x57
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d6 54                 adjsp	0x54
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
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d0 6a                 breq8	sum_bytes+119
 a0                    xor	r4, r4
 c3 01                 ldi8	r7, 0x1
 f1 1e                 mov	r3, r6
 f9 7c                 and	r3, r7
 ce 01                 cmpi.s8	r6, 0x1
 d0 5a                 breq8	sum_bytes+114
 a0                    xor	r4, r4
 ca fe                 addi.s8	r6, -0x2
 f4 8e                 lsr16.1	r6
 f1 16                 mov	r2, r6
 f4 aa                 inc16	r2
 f9 e8                 and	r7, r2
 f6 2e                 tst16	r6
 d0 3c                 breq8	sum_bytes+99
 f4 43                 stsp16	[sp+0x0], r7
 f0 3b 02              stsp16	[sp+0x2], r3
 c4 fe ff              ldi16	r4, 0xfffe
 f9 50                 and	r2, r4
 a0                    xor	r4, r4
 f1 1c                 mov	r3, r4
 f0 68 c0              ldp32	q3, [q0+]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f1 76                 zext8	r6
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 01                    mov	r4, r5
 a5                    xor	r5, r5
 08                    mov	r6, r4
 f1 76                 zext8	r6
 1b                    add	r6, r7
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f0 0b 02              addi.s8	r3, 0x2
 f5 1a                 cmp	r3, r2
 d1 da                 brne8	sum_bytes+52
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 f0 33 02              ldsp16	r3, [sp+0x2]
 d0 0b                 breq8	sum_bytes+110
 f0 66 c0              ldp16	r6, [q0+]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 1c                    add	r7, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 02                    mov	r4, r6
 f4 a3                 tst8	r3
 d0 05                 breq8	sum_bytes+119
 08                    mov	r6, r4
 f0 60 80              ldp8u	r4, [q0]
 12                    add	r4, r6
 d6 08                 adjsp	0x8
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
 d6 f4                 adjsp	-0xc
 08                    mov	r6, r4
 f2 30                 sub	r0, r0
 f6 2e                 tst16	r6
 da ad 00              breq16	sum_signed_bytes+187
 f2 30                 sub	r0, r0
 f0 06 05 07           ldi16	r2, 0x705
 f0 03 00              ldi8	r3, 0x0
 c0 01                 ldi8	r4, 0x1
 0e                    mov	r7, r6
 8c                    and	r7, r4
 ce 01                 cmpi.s8	r6, 0x1
 da 94 00              breq16	sum_signed_bytes+180
 f2 30                 sub	r0, r0
 f1 14                 mov	r2, r4
 c4 05 07              ldi16	r4, 0x705
 c1 00                 ldi8	r5, 0x0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 22                 mov	r4, r2
 ca fe                 addi.s8	r6, -0x2
 f4 8e                 lsr16.1	r6
 f1 16                 mov	r2, r6
 f4 aa                 inc16	r2
 f9 88                 and	r4, r2
 f6 2e                 tst16	r6
 d0 58                 breq8	sum_signed_bytes+149
 f4 40                 stsp16	[sp+0x0], r4
 f4 4b                 stsp16	[sp+0x2], r7
 c4 fe ff              ldi16	r4, 0xfffe
 f9 50                 and	r2, r4
 f2 30                 sub	r0, r0
 c4 05 07              ldi16	r4, 0x705
 c1 00                 ldi8	r5, 0x0
 f1 18                 mov	r3, r0
 f0 68 c8              ldp32	q3, [q2+]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
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
 02                    mov	r4, r6
 fa bf                 asr16i	r4, 0xf
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 fa d8                 asr16i	r6, 0x8
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f2 05                 add	r0, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 0b 02              addi.s8	r3, 0x2
 f5 1a                 cmp	r3, r2
 d1 c2                 brne8	sum_signed_bytes+79
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 d0 15                 breq8	sum_signed_bytes+170
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 66 c8              ldp16	r6, [q2+]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 f6 44                 sext8	r4
 f2 20                 add	r4, r0
 fa d8                 asr16i	r6, 0x8
 18                    add	r6, r4
 f1 06                 mov	r0, r6
 f4 a7                 tst8	r7
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d0 07                 breq8	sum_signed_bytes+187
 f1 20                 mov	r4, r0
 f0 61 04              ldp8s	r0, [q1]
 f2 04                 add	r0, r4
 f1 20                 mov	r4, r0
 d6 0c                 adjsp	0xc
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
 c5 2b 6d              ldi16	r5, 0x6d2b
 f6 2c                 tst16	r4
 d0 34                 breq8	mix_bytes+63
 f0 04 04 07           ldi16	r0, 0x704
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
 d1 dd                 brne8	mix_bytes+26
 f2 56                 sub	r5, r2
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
 d6 fc                 adjsp	-0x4
 08                    mov	r6, r4
 a0                    xor	r4, r4
 f4 4a                 stsp16	[sp+0x2], r6
 f6 2e                 tst16	r6
 d0 39                 breq8	sum_byte_pairs+71
 f0 04 03 07           ldi16	r0, 0x703
 f0 01 00              ldi8	r1, 0x0
 a0                    xor	r4, r4
 c3 01                 ldi8	r7, 0x1
 f4 0a                 ldsp16	r6, [sp+0x2]
 8e                    and	r7, r6
 ce 01                 cmpi.s8	r6, 0x1
 d0 23                 breq8	sum_byte_pairs+66
 f4 43                 stsp16	[sp+0x0], r7
 c4 fe ff              ldi16	r4, 0xfffe
 f4 09                 ldsp16	r5, [sp+0x2]
 84                    and	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 0c                    mov	r7, r4
 f0 68 40              ldp32	q1, [q0+]
 f1 2a                 mov	r6, r2
 18                    add	r6, r4
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 12                    add	r4, r6
 cb 02                 addi.s8	r7, 0x2
 f4 0a                 ldsp16	r6, [sp+0x2]
 3e                    cmp	r7, r6
 d1 ef                 brne8	sum_byte_pairs+43
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d0 05                 breq8	sum_byte_pairs+71
 08                    mov	r6, r4
 f0 62 80              ldp16	r4, [q0]
 12                    add	r4, r6
 d6 04                 adjsp	0x4
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
 d6 fc                 adjsp	-0x4
 f2 30                 sub	r0, r0
 f4 4a                 stsp16	[sp+0x2], r6
 f6 2e                 tst16	r6
 d0 3a                 breq8	sum_words+72
 f2 30                 sub	r0, r0
 c3 01                 ldi8	r7, 0x1
 f4 0a                 ldsp16	r6, [sp+0x2]
 8e                    and	r7, r6
 ce 01                 cmpi.s8	r6, 0x1
 d0 28                 breq8	sum_words+65
 f4 43                 stsp16	[sp+0x0], r7
 c7 fe ff              ldi16	r7, 0xfffe
 f4 0a                 ldsp16	r6, [sp+0x2]
 8b                    and	r6, r7
 f4 4a                 stsp16	[sp+0x2], r6
 f2 30                 sub	r0, r0
 f1 2c                 mov	r7, r0
 f0 68 48              ldp32	q1, [q2+]
 f1 2a                 mov	r6, r2
 f2 28                 add	r6, r0
 f1 03                 mov	r0, r3
 f2 39                 sub	r1, r1
 f2 06                 add	r0, r6
 cb 02                 addi.s8	r7, 0x2
 f4 0a                 ldsp16	r6, [sp+0x2]
 3e                    cmp	r7, r6
 d1 ec                 brne8	sum_words+39
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d0 07                 breq8	sum_words+72
 f1 28                 mov	r6, r0
 f0 62 08              ldp16	r0, [q2]
 f2 06                 add	r0, r6
 f1 20                 mov	r4, r0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
