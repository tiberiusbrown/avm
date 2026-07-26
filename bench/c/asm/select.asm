
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/select.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 select.c
00000100 l     O .data	00000040 signed_a
00000140 l     O .data	00000040 signed_b
00000180 l     O .data	00000040 unsigned_values
000004fd l     F .text	00000022 select_kernel
000001c0 l     O .data	00000002 select_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000002e7 avm_test_main
0000051f g     F .text	00000002 avm_halt

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
 e1 09 03              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 c4 a0 f6              ldi16	r4, 0xf6a0
 f0 5c 00 01           stm16	[0x100], r4
 c4 08 07              ldi16	r4, 0x708
 f0 5c 40 01           stm16	[0x140], r4
 c0 03                 ldi8	r4, 0x3
 f0 5c 80 01           stm16	[0x180], r4
 c4 4d f7              ldi16	r4, 0xf74d
 f0 5c 02 01           stm16	[0x102], r4
 c4 89 06              ldi16	r4, 0x689
 f0 5c 42 01           stm16	[0x142], r4
 c4 04 01              ldi16	r4, 0x104
 f0 5c 82 01           stm16	[0x182], r4
 c4 fa f7              ldi16	r4, 0xf7fa
 f0 5c 04 01           stm16	[0x104], r4
 c4 0a 06              ldi16	r4, 0x60a
 f0 5c 44 01           stm16	[0x144], r4
 c4 05 02              ldi16	r4, 0x205
 f0 5c 84 01           stm16	[0x184], r4
 c4 a7 f8              ldi16	r4, 0xf8a7
 f0 5c 06 01           stm16	[0x106], r4
 c4 8b 05              ldi16	r4, 0x58b
 f0 5c 46 01           stm16	[0x146], r4
 c4 06 03              ldi16	r4, 0x306
 f0 5c 86 01           stm16	[0x186], r4
 c4 54 f9              ldi16	r4, 0xf954
 f0 5c 08 01           stm16	[0x108], r4
 c4 0c 05              ldi16	r4, 0x50c
 f0 5c 48 01           stm16	[0x148], r4
 c4 07 04              ldi16	r4, 0x407
 f0 5c 88 01           stm16	[0x188], r4
 c4 01 fa              ldi16	r4, 0xfa01
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 8d 04              ldi16	r4, 0x48d
 f0 5c 4a 01           stm16	[0x14a], r4
 c4 08 05              ldi16	r4, 0x508
 f0 5c 8a 01           stm16	[0x18a], r4
 c4 ae fa              ldi16	r4, 0xfaae
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 0e 04              ldi16	r4, 0x40e
 f0 5c 4c 01           stm16	[0x14c], r4
 c4 09 06              ldi16	r4, 0x609
 f0 5c 8c 01           stm16	[0x18c], r4
 c4 5b fb              ldi16	r4, 0xfb5b
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 8f 03              ldi16	r4, 0x38f
 f0 5c 4e 01           stm16	[0x14e], r4
 c4 0a 07              ldi16	r4, 0x70a
 f0 5c 8e 01           stm16	[0x18e], r4
 c4 08 fc              ldi16	r4, 0xfc08
 f0 5c 10 01           stm16	[0x110], r4
 c4 10 03              ldi16	r4, 0x310
 f0 5c 50 01           stm16	[0x150], r4
 c4 0b 08              ldi16	r4, 0x80b
 f0 5c 90 01           stm16	[0x190], r4
 c4 b5 fc              ldi16	r4, 0xfcb5
 f0 5c 12 01           stm16	[0x112], r4
 c4 91 02              ldi16	r4, 0x291
 f0 5c 52 01           stm16	[0x152], r4
 c4 0c 09              ldi16	r4, 0x90c
 f0 5c 92 01           stm16	[0x192], r4
 c4 62 fd              ldi16	r4, 0xfd62
 f0 5c 14 01           stm16	[0x114], r4
 c4 12 02              ldi16	r4, 0x212
 f0 5c 54 01           stm16	[0x154], r4
 c4 0d 0a              ldi16	r4, 0xa0d
 f0 5c 94 01           stm16	[0x194], r4
 c4 0f fe              ldi16	r4, 0xfe0f
 f0 5c 16 01           stm16	[0x116], r4
 c4 93 01              ldi16	r4, 0x193
 f0 5c 56 01           stm16	[0x156], r4
 c4 0e 0b              ldi16	r4, 0xb0e
 f0 5c 96 01           stm16	[0x196], r4
 c4 bc fe              ldi16	r4, 0xfebc
 f0 5c 18 01           stm16	[0x118], r4
 c4 14 01              ldi16	r4, 0x114
 f0 5c 58 01           stm16	[0x158], r4
 c4 0f 0c              ldi16	r4, 0xc0f
 f0 5c 98 01           stm16	[0x198], r4
 c4 69 ff              ldi16	r4, 0xff69
 f0 5c 1a 01           stm16	[0x11a], r4
 c0 95                 ldi8	r4, 0x95
 f0 5c 5a 01           stm16	[0x15a], r4
 c4 10 0d              ldi16	r4, 0xd10
 f0 5c 9a 01           stm16	[0x19a], r4
 c0 16                 ldi8	r4, 0x16
 f0 5c 1c 01           stm16	[0x11c], r4
 f0 5c 5c 01           stm16	[0x15c], r4
 c4 11 0e              ldi16	r4, 0xe11
 f0 5c 9c 01           stm16	[0x19c], r4
 c0 c3                 ldi8	r4, 0xc3
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 97 ff              ldi16	r4, 0xff97
 f0 5c 5e 01           stm16	[0x15e], r4
 c4 12 0f              ldi16	r4, 0xf12
 f0 5c 9e 01           stm16	[0x19e], r4
 c4 70 01              ldi16	r4, 0x170
 f0 5c 20 01           stm16	[0x120], r4
 c4 18 ff              ldi16	r4, 0xff18
 f0 5c 60 01           stm16	[0x160], r4
 c4 13 10              ldi16	r4, 0x1013
 f0 5c a0 01           stm16	[0x1a0], r4
 c4 1d 02              ldi16	r4, 0x21d
 f0 5c 22 01           stm16	[0x122], r4
 c4 99 fe              ldi16	r4, 0xfe99
 f0 5c 62 01           stm16	[0x162], r4
 c4 14 11              ldi16	r4, 0x1114
 f0 5c a2 01           stm16	[0x1a2], r4
 c4 ca 02              ldi16	r4, 0x2ca
 f0 5c 24 01           stm16	[0x124], r4
 c4 1a fe              ldi16	r4, 0xfe1a
 f0 5c 64 01           stm16	[0x164], r4
 c4 15 12              ldi16	r4, 0x1215
 f0 5c a4 01           stm16	[0x1a4], r4
 c4 77 03              ldi16	r4, 0x377
 f0 5c 26 01           stm16	[0x126], r4
 c4 9b fd              ldi16	r4, 0xfd9b
 f0 5c 66 01           stm16	[0x166], r4
 c4 16 13              ldi16	r4, 0x1316
 f0 5c a6 01           stm16	[0x1a6], r4
 c4 24 04              ldi16	r4, 0x424
 f0 5c 28 01           stm16	[0x128], r4
 c4 1c fd              ldi16	r4, 0xfd1c
 f0 5c 68 01           stm16	[0x168], r4
 c4 17 14              ldi16	r4, 0x1417
 f0 5c a8 01           stm16	[0x1a8], r4
 c4 d1 04              ldi16	r4, 0x4d1
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 9d fc              ldi16	r4, 0xfc9d
 f0 5c 6a 01           stm16	[0x16a], r4
 c4 18 15              ldi16	r4, 0x1518
 f0 5c aa 01           stm16	[0x1aa], r4
 c4 7e 05              ldi16	r4, 0x57e
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 1e fc              ldi16	r4, 0xfc1e
 f0 5c 6c 01           stm16	[0x16c], r4
 c4 19 16              ldi16	r4, 0x1619
 f0 5c ac 01           stm16	[0x1ac], r4
 c4 2b 06              ldi16	r4, 0x62b
 f0 5c 2e 01           stm16	[0x12e], r4
 c4 9f fb              ldi16	r4, 0xfb9f
 f0 5c 6e 01           stm16	[0x16e], r4
 c4 1a 17              ldi16	r4, 0x171a
 f0 5c ae 01           stm16	[0x1ae], r4
 c4 d8 06              ldi16	r4, 0x6d8
 f0 5c 30 01           stm16	[0x130], r4
 c4 20 fb              ldi16	r4, 0xfb20
 f0 5c 70 01           stm16	[0x170], r4
 c4 1b 18              ldi16	r4, 0x181b
 f0 5c b0 01           stm16	[0x1b0], r4
 c4 85 07              ldi16	r4, 0x785
 f0 5c 32 01           stm16	[0x132], r4
 c4 a1 fa              ldi16	r4, 0xfaa1
 f0 5c 72 01           stm16	[0x172], r4
 c4 1c 19              ldi16	r4, 0x191c
 f0 5c b2 01           stm16	[0x1b2], r4
 c4 32 08              ldi16	r4, 0x832
 f0 5c 34 01           stm16	[0x134], r4
 c4 22 fa              ldi16	r4, 0xfa22
 f0 5c 74 01           stm16	[0x174], r4
 c4 1d 1a              ldi16	r4, 0x1a1d
 f0 5c b4 01           stm16	[0x1b4], r4
 c4 df 08              ldi16	r4, 0x8df
 f0 5c 36 01           stm16	[0x136], r4
 c4 a3 f9              ldi16	r4, 0xf9a3
 f0 5c 76 01           stm16	[0x176], r4
 c4 1e 1b              ldi16	r4, 0x1b1e
 f0 5c b6 01           stm16	[0x1b6], r4
 c4 8c 09              ldi16	r4, 0x98c
 f0 5c 38 01           stm16	[0x138], r4
 c4 24 f9              ldi16	r4, 0xf924
 f0 5c 78 01           stm16	[0x178], r4
 c4 1f 1c              ldi16	r4, 0x1c1f
 f0 5c b8 01           stm16	[0x1b8], r4
 c4 39 0a              ldi16	r4, 0xa39
 f0 5c 3a 01           stm16	[0x13a], r4
 c4 a5 f8              ldi16	r4, 0xf8a5
 f0 5c 7a 01           stm16	[0x17a], r4
 c4 20 1d              ldi16	r4, 0x1d20
 f0 5c ba 01           stm16	[0x1ba], r4
 c4 e6 0a              ldi16	r4, 0xae6
 f0 5c 3c 01           stm16	[0x13c], r4
 c4 26 f8              ldi16	r4, 0xf826
 f0 5c 7c 01           stm16	[0x17c], r4
 c4 21 1e              ldi16	r4, 0x1e21
 f0 5c bc 01           stm16	[0x1bc], r4
 c4 93 0b              ldi16	r4, 0xb93
 f0 5c 3e 01           stm16	[0x13e], r4
 c4 a7 f7              ldi16	r4, 0xf7a7
 f0 5c 7e 01           stm16	[0x17e], r4
 c4 22 1f              ldi16	r4, 0x1f22
 f0 5c be 01           stm16	[0x1be], r4
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 09                    mov	r6, r5
 f4 49                 stsp16	[sp+0x2], r5
 f0 31 00              ldsp16	r1, [sp+0x0]
 f0 07 80 01           ldi16	r3, 0x180
 f0 06 40 01           ldi16	r2, 0x140
 f0 04 00 01           ldi16	r0, 0x100
 f4 52                 stsp16	[sp+0x4], r6
 f0 6c 91              ld16	r4, [r0+]
 f0 6c b5              ld16	r5, [r2+]
 f0 6c d7              ld16	r6, [r3+]
 d5 22                 call8	select_kernel
 f4 12                 ldsp16	r6, [sp+0x4]
 18                    add	r6, r4
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 ea                 brne8	avm_test_main+696
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 ce                 brne8	avm_test_main+679
 f0 5e c0 01           stm16	[0x1c0], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<select_kernel>:
 34                    cmp	r5, r4
 0d                    mov	r7, r5
 fd 3c                 cmov.slt	r7, r4
 31                    cmp	r4, r5
 fd 2c                 cmov.slt	r5, r4
 c4 18 fc              ldi16	r4, 0xfc18
 31                    cmp	r4, r5
 fd 25                 cmov.slt	r4, r5
 c5 e8 03              ldi16	r5, 0x3e8
 31                    cmp	r4, r5
 fd 2c                 cmov.slt	r5, r4
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 f4 a4                 tst8	r4
 fb 3d                 cmov.eq	r7, r5
 02                    mov	r4, r6
 fa 3e                 lsl16i	r4, 0xe
 fa bf                 asr16i	r4, 0xf
 82                    and	r4, r6
 a3                    xor	r4, r7
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
