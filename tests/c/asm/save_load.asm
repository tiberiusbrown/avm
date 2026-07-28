
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/save_load.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 save_load.c
00000100 l     O .saved	00000040 saved_state
0000089a l     F .text	00000007 call_save_exists
000008a1 l     F .text	00000007 call_load
000008a8 l     F .text	00000003 call_save
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000684 avm_test_main
000008ab g     F .text	00000002 avm_halt

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
 e1 95 06              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 c4 07 18              ldi16	r4, 0x1807
 c5 2a 3b              ldi16	r5, 0x3b2a
 f0 07 3c 01           ldi16	r3, 0x13c
 f0 6b 86              st32	[r3], q2
 c4 c1 d2              ldi16	r4, 0xd2c1
 c5 e4 f5              ldi16	r5, 0xf5e4
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 7b 8c              ldi16	r4, 0x8c7b
 c5 9e af              ldi16	r5, 0xaf9e
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 35 46              ldi16	r4, 0x4635
 c5 58 69              ldi16	r5, 0x6958
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c0 ef                 ldi8	r4, 0xef
 c5 12 23              ldi16	r5, 0x2312
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 a9 ba              ldi16	r4, 0xbaa9
 c5 cc dd              ldi16	r5, 0xddcc
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 63 74              ldi16	r4, 0x7463
 c5 86 97              ldi16	r5, 0x9786
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 1d 2e              ldi16	r4, 0x2e1d
 c5 40 51              ldi16	r5, 0x5140
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 d7 e8              ldi16	r4, 0xe8d7
 c5 fa 0b              ldi16	r5, 0xbfa
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 91 a2              ldi16	r4, 0xa291
 c5 b4 c5              ldi16	r5, 0xc5b4
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 4b 5c              ldi16	r4, 0x5c4b
 c5 6e 7f              ldi16	r5, 0x7f6e
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 05 16              ldi16	r4, 0x1605
 c5 28 39              ldi16	r5, 0x3928
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 bf d0              ldi16	r4, 0xd0bf
 c5 e2 f3              ldi16	r5, 0xf3e2
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 79 8a              ldi16	r4, 0x8a79
 c5 9c ad              ldi16	r5, 0xad9c
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 33 44              ldi16	r4, 0x4433
 c5 56 67              ldi16	r5, 0x6756
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 ed fe              ldi16	r4, 0xfeed
 c5 10 21              ldi16	r5, 0x2110
 f0 04 00 01           ldi16	r0, 0x100
 f0 6b 80              st32	[r0], q2
 e1 ba 05              call16	call_save_exists
 f0 3c 10              stsp16	[sp+0x10], r4
 f2 39                 sub	r1, r1
 f0 02 ed              ldi8	r2, 0xed
 e1 b6 05              call16	call_load
 f4 70                 stsp16	[sp+0xc], r4
 f1 21                 mov	r4, r1
 f0 6c a1              ld8u	r5, [r0+]
 f1 29                 mov	r6, r1
 f4 8e                 lsr16.1	r6
 f2 2a                 add	r6, r2
 f0 0a 11              addi.s8	r2, 0x11
 f4 ac                 inc16	r4
 f1 76                 zext8	r6
 39                    cmp	r6, r5
 d1 07                 brne8	avm_test_main+243
 f0 0d 3f              cmpi.s8	r1, 0x3f
 f1 0c                 mov	r1, r4
 d1 e6                 brne8	avm_test_main+217
 f4 5a                 stsp16	[sp+0x6], r6
 f4 61                 stsp16	[sp+0x8], r5
 e1 98 05              call16	call_save
 e1 87 05              call16	call_save_exists
 f4 78                 stsp16	[sp+0xe], r4
 c4 f4 05              ldi16	r4, 0x5f4
 c5 17 28              ldi16	r5, 0x2817
 f0 6b 86              st32	[r3], q2
 c4 ae bf              ldi16	r4, 0xbfae
 c5 d1 e2              ldi16	r5, 0xe2d1
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 68 79              ldi16	r4, 0x7968
 c5 8b 9c              ldi16	r5, 0x9c8b
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 22 33              ldi16	r4, 0x3322
 c5 45 56              ldi16	r5, 0x5645
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 dc ed              ldi16	r4, 0xeddc
 c5 ff 10              ldi16	r5, 0x10ff
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 96 a7              ldi16	r4, 0xa796
 c5 b9 ca              ldi16	r5, 0xcab9
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 50 61              ldi16	r4, 0x6150
 c5 73 84              ldi16	r5, 0x8473
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 0a 1b              ldi16	r4, 0x1b0a
 c5 2d 3e              ldi16	r5, 0x3e2d
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 c4 d5              ldi16	r4, 0xd5c4
 c5 e7 f8              ldi16	r5, 0xf8e7
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 7e 8f              ldi16	r4, 0x8f7e
 c5 a1 b2              ldi16	r5, 0xb2a1
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 38 49              ldi16	r4, 0x4938
 c5 5b 6c              ldi16	r5, 0x6c5b
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 f2 03              ldi16	r4, 0x3f2
 c5 15 26              ldi16	r5, 0x2615
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 ac bd              ldi16	r4, 0xbdac
 c5 cf e0              ldi16	r5, 0xe0cf
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 66 77              ldi16	r4, 0x7766
 c5 89 9a              ldi16	r5, 0x9a89
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 20 31              ldi16	r4, 0x3120
 c5 43 54              ldi16	r5, 0x5443
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 da eb              ldi16	r4, 0xebda
 c5 fd 0e              ldi16	r5, 0xefd
 f0 04 00 01           ldi16	r0, 0x100
 f0 6b 80              st32	[r0], q2
 f2 39                 sub	r1, r1
 f0 02 ed              ldi8	r2, 0xed
 e1 c6 04              call16	call_load
 f4 68                 stsp16	[sp+0xa], r4
 f1 21                 mov	r4, r1
 f0 6c a1              ld8u	r5, [r0+]
 f1 19                 mov	r3, r1
 f4 8b                 lsr16.1	r3
 f2 1a                 add	r3, r2
 f0 0a 11              addi.s8	r2, 0x11
 f4 ac                 inc16	r4
 f1 73                 zext8	r3
 f5 1d                 cmp	r3, r5
 d1 07                 brne8	avm_test_main+484
 f0 0d 3f              cmpi.s8	r1, 0x3f
 f1 0c                 mov	r1, r4
 d1 e5                 brne8	avm_test_main+457
 f4 51                 stsp16	[sp+0x4], r5
 f0 00 46              ldi8	r0, 0x46
 f2 42                 sub	r2, r2
 f1 22                 mov	r4, r2
 c8 6b                 addi.s8	r4, 0x6b
 f0 4c 3f 01           stm8	[0x13f], r4
 f1 22                 mov	r4, r2
 c8 5a                 addi.s8	r4, 0x5a
 f0 4c 3e 01           stm8	[0x13e], r4
 f1 22                 mov	r4, r2
 c8 48                 addi.s8	r4, 0x48
 f0 4c 3d 01           stm8	[0x13d], r4
 f1 22                 mov	r4, r2
 c8 37                 addi.s8	r4, 0x37
 f0 4c 3c 01           stm8	[0x13c], r4
 f1 22                 mov	r4, r2
 c8 25                 addi.s8	r4, 0x25
 f0 4c 3b 01           stm8	[0x13b], r4
 f1 22                 mov	r4, r2
 c8 14                 addi.s8	r4, 0x14
 f0 4c 3a 01           stm8	[0x13a], r4
 f1 22                 mov	r4, r2
 c8 02                 addi.s8	r4, 0x2
 f0 4c 39 01           stm8	[0x139], r4
 f1 22                 mov	r4, r2
 c8 f1                 addi.s8	r4, -0xf
 f0 4c 38 01           stm8	[0x138], r4
 f1 22                 mov	r4, r2
 c8 df                 addi.s8	r4, -0x21
 f0 4c 37 01           stm8	[0x137], r4
 f1 22                 mov	r4, r2
 c8 ce                 addi.s8	r4, -0x32
 f0 4c 36 01           stm8	[0x136], r4
 f1 22                 mov	r4, r2
 c8 bc                 addi.s8	r4, -0x44
 f0 4c 35 01           stm8	[0x135], r4
 f1 22                 mov	r4, r2
 c8 ab                 addi.s8	r4, -0x55
 f0 4c 34 01           stm8	[0x134], r4
 f1 22                 mov	r4, r2
 c8 99                 addi.s8	r4, -0x67
 f0 4c 33 01           stm8	[0x133], r4
 f1 22                 mov	r4, r2
 c8 88                 addi.s8	r4, -0x78
 f0 4c 32 01           stm8	[0x132], r4
 f1 22                 mov	r4, r2
 c8 76                 addi.s8	r4, 0x76
 f0 4c 31 01           stm8	[0x131], r4
 f1 22                 mov	r4, r2
 c8 65                 addi.s8	r4, 0x65
 f0 4c 30 01           stm8	[0x130], r4
 f1 22                 mov	r4, r2
 c8 53                 addi.s8	r4, 0x53
 f0 4c 2f 01           stm8	[0x12f], r4
 f1 22                 mov	r4, r2
 c8 42                 addi.s8	r4, 0x42
 f0 4c 2e 01           stm8	[0x12e], r4
 f1 22                 mov	r4, r2
 c8 30                 addi.s8	r4, 0x30
 f0 4c 2d 01           stm8	[0x12d], r4
 f1 22                 mov	r4, r2
 c8 1f                 addi.s8	r4, 0x1f
 f0 4c 2c 01           stm8	[0x12c], r4
 f1 22                 mov	r4, r2
 c8 0d                 addi.s8	r4, 0xd
 f0 4c 2b 01           stm8	[0x12b], r4
 f1 22                 mov	r4, r2
 c8 fc                 addi.s8	r4, -0x4
 f0 4c 2a 01           stm8	[0x12a], r4
 f1 22                 mov	r4, r2
 c8 ea                 addi.s8	r4, -0x16
 f0 4c 29 01           stm8	[0x129], r4
 f1 22                 mov	r4, r2
 c8 d9                 addi.s8	r4, -0x27
 f0 4c 28 01           stm8	[0x128], r4
 f1 22                 mov	r4, r2
 c8 c7                 addi.s8	r4, -0x39
 f0 4c 27 01           stm8	[0x127], r4
 f1 22                 mov	r4, r2
 c8 b6                 addi.s8	r4, -0x4a
 f0 4c 26 01           stm8	[0x126], r4
 f1 22                 mov	r4, r2
 c8 a4                 addi.s8	r4, -0x5c
 f0 4c 25 01           stm8	[0x125], r4
 f1 22                 mov	r4, r2
 c8 93                 addi.s8	r4, -0x6d
 f0 4c 24 01           stm8	[0x124], r4
 f1 22                 mov	r4, r2
 c8 81                 addi.s8	r4, -0x7f
 f0 4c 23 01           stm8	[0x123], r4
 f1 22                 mov	r4, r2
 c8 70                 addi.s8	r4, 0x70
 f0 4c 22 01           stm8	[0x122], r4
 f1 22                 mov	r4, r2
 c8 5e                 addi.s8	r4, 0x5e
 f0 4c 21 01           stm8	[0x121], r4
 f1 22                 mov	r4, r2
 c8 4d                 addi.s8	r4, 0x4d
 f0 4c 20 01           stm8	[0x120], r4
 f1 22                 mov	r4, r2
 c8 3b                 addi.s8	r4, 0x3b
 f0 4c 1f 01           stm8	[0x11f], r4
 f1 22                 mov	r4, r2
 c8 2a                 addi.s8	r4, 0x2a
 f0 4c 1e 01           stm8	[0x11e], r4
 f1 22                 mov	r4, r2
 c8 18                 addi.s8	r4, 0x18
 f0 4c 1d 01           stm8	[0x11d], r4
 f1 22                 mov	r4, r2
 c8 07                 addi.s8	r4, 0x7
 f0 4c 1c 01           stm8	[0x11c], r4
 f1 22                 mov	r4, r2
 c8 f5                 addi.s8	r4, -0xb
 f0 4c 1b 01           stm8	[0x11b], r4
 f1 22                 mov	r4, r2
 c8 e4                 addi.s8	r4, -0x1c
 f0 4c 1a 01           stm8	[0x11a], r4
 f1 22                 mov	r4, r2
 c8 d2                 addi.s8	r4, -0x2e
 f0 4c 19 01           stm8	[0x119], r4
 f1 22                 mov	r4, r2
 c8 c1                 addi.s8	r4, -0x3f
 f0 4c 18 01           stm8	[0x118], r4
 f1 22                 mov	r4, r2
 c8 af                 addi.s8	r4, -0x51
 f0 4c 17 01           stm8	[0x117], r4
 f1 22                 mov	r4, r2
 c8 9e                 addi.s8	r4, -0x62
 f0 4c 16 01           stm8	[0x116], r4
 f1 22                 mov	r4, r2
 c8 8c                 addi.s8	r4, -0x74
 f0 4c 15 01           stm8	[0x115], r4
 f1 22                 mov	r4, r2
 c8 7b                 addi.s8	r4, 0x7b
 f0 4c 14 01           stm8	[0x114], r4
 f1 22                 mov	r4, r2
 c8 69                 addi.s8	r4, 0x69
 f0 4c 13 01           stm8	[0x113], r4
 f1 22                 mov	r4, r2
 c8 58                 addi.s8	r4, 0x58
 f0 4c 12 01           stm8	[0x112], r4
 f1 22                 mov	r4, r2
 c8 46                 addi.s8	r4, 0x46
 f0 4c 11 01           stm8	[0x111], r4
 f1 22                 mov	r4, r2
 c8 35                 addi.s8	r4, 0x35
 f0 4c 10 01           stm8	[0x110], r4
 f1 22                 mov	r4, r2
 c8 23                 addi.s8	r4, 0x23
 f0 4c 0f 01           stm8	[0x10f], r4
 f1 22                 mov	r4, r2
 c8 12                 addi.s8	r4, 0x12
 f0 4c 0e 01           stm8	[0x10e], r4
 f1 22                 mov	r4, r2
 c8 ef                 addi.s8	r4, -0x11
 f0 4c 0c 01           stm8	[0x10c], r4
 f1 22                 mov	r4, r2
 c8 dd                 addi.s8	r4, -0x23
 f0 4c 0b 01           stm8	[0x10b], r4
 f1 22                 mov	r4, r2
 c8 cc                 addi.s8	r4, -0x34
 f0 4c 0a 01           stm8	[0x10a], r4
 f1 22                 mov	r4, r2
 c8 ba                 addi.s8	r4, -0x46
 f0 4c 09 01           stm8	[0x109], r4
 f1 22                 mov	r4, r2
 c8 a9                 addi.s8	r4, -0x57
 f0 4c 08 01           stm8	[0x108], r4
 f1 22                 mov	r4, r2
 c8 97                 addi.s8	r4, -0x69
 f0 4c 07 01           stm8	[0x107], r4
 f1 22                 mov	r4, r2
 c8 86                 addi.s8	r4, -0x7a
 f0 4c 06 01           stm8	[0x106], r4
 f1 22                 mov	r4, r2
 c8 74                 addi.s8	r4, 0x74
 f0 4c 05 01           stm8	[0x105], r4
 f1 22                 mov	r4, r2
 c8 63                 addi.s8	r4, 0x63
 f0 4c 04 01           stm8	[0x104], r4
 f1 22                 mov	r4, r2
 c8 51                 addi.s8	r4, 0x51
 f0 4c 03 01           stm8	[0x103], r4
 f1 22                 mov	r4, r2
 c8 40                 addi.s8	r4, 0x40
 f0 4c 02 01           stm8	[0x102], r4
 f1 22                 mov	r4, r2
 c8 2e                 addi.s8	r4, 0x2e
 f0 4c 01 01           stm8	[0x101], r4
 f0 4a 0d 01           stm8	[0x10d], r2
 f0 0a 1d              addi.s8	r2, 0x1d
 f0 4a 00 01           stm8	[0x100], r2
 e1 a9 02              call16	call_save
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 db fb fd              brne16	avm_test_main+491
 c4 10 21              ldi16	r4, 0x2110
 c5 33 44              ldi16	r5, 0x4433
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 ca db              ldi16	r4, 0xdbca
 c5 ed fe              ldi16	r5, 0xfeed
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 84 95              ldi16	r4, 0x9584
 c5 a7 b8              ldi16	r5, 0xb8a7
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 3e 4f              ldi16	r4, 0x4f3e
 c5 61 72              ldi16	r5, 0x7261
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 f8 09              ldi16	r4, 0x9f8
 c5 1b 2c              ldi16	r5, 0x2c1b
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 b2 c3              ldi16	r4, 0xc3b2
 c5 d5 e6              ldi16	r5, 0xe6d5
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 6c 7d              ldi16	r4, 0x7d6c
 c5 8f a0              ldi16	r5, 0xa08f
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 26 37              ldi16	r4, 0x3726
 c5 49 5a              ldi16	r5, 0x5a49
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 e0 f1              ldi16	r4, 0xf1e0
 c5 03 14              ldi16	r5, 0x1403
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 9a ab              ldi16	r4, 0xab9a
 c5 bd ce              ldi16	r5, 0xcebd
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 54 65              ldi16	r4, 0x6554
 c5 77 88              ldi16	r5, 0x8877
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 0e 1f              ldi16	r4, 0x1f0e
 c5 31 42              ldi16	r5, 0x4231
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 c8 d9              ldi16	r4, 0xd9c8
 c5 eb fc              ldi16	r5, 0xfceb
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 82 93              ldi16	r4, 0x9382
 c5 a5 b6              ldi16	r5, 0xb6a5
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 3c 4d              ldi16	r4, 0x4d3c
 c5 5f 70              ldi16	r5, 0x705f
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 f6 07              ldi16	r4, 0x7f6
 c5 19 2a              ldi16	r5, 0x2a19
 f0 04 00 01           ldi16	r0, 0x100
 f0 6b 80              st32	[r0], q2
 e1 d0 01              call16	call_save_exists
 f4 40                 stsp16	[sp+0x0], r4
 f2 42                 sub	r2, r2
 f0 01 ee              ldi8	r1, 0xee
 e1 cd 01              call16	call_load
 f4 48                 stsp16	[sp+0x2], r4
 f1 22                 mov	r4, r2
 f0 6c a1              ld8u	r5, [r0+]
 f1 2e                 mov	r7, r2
 f4 8f                 lsr16.1	r7
 f2 2d                 add	r7, r1
 f0 09 11              addi.s8	r1, 0x11
 f4 ac                 inc16	r4
 f1 77                 zext8	r7
 3d                    cmp	r7, r5
 d1 07                 brne8	avm_test_main+1244
 f0 0e 3f              cmpi.s8	r2, 0x3f
 f1 14                 mov	r2, r4
 d1 e6                 brne8	avm_test_main+1218
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f0 00 30              ldi8	r0, 0x30
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c2 01                 ldi8	r6, 0x1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f1 22                 mov	r4, r2
 82                    and	r4, r6
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 f5 1c                 cmp	r3, r4
 f8 03                 cset.eq	r3
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f9 45                 or	r2, r1
 f0 04 ff ff           ldi16	r0, 0xffff
 f9 0a                 xor	r0, r2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 38                    cmp	r6, r4
 f8 02                 cset.eq	r2
 3d                    cmp	r7, r5
 f8 04                 cset.eq	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 c3 01                 ldi8	r7, 0x1
 f9 3c                 and	r1, r7
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 f9 31                 or	r1, r4
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f9 08                 and	r0, r2
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 14                 and	r0, r5
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f9 04                 and	r0, r1
 f9 0c                 and	r0, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f9 18                 and	r0, r6
 87                    and	r5, r7
 f9 3c                 and	r1, r7
 8b                    and	r6, r7
 f0 33 02              ldsp16	r3, [sp+0x2]
 f9 0c                 and	r0, r3
 f9 7c                 and	r3, r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f9 10                 and	r0, r4
 f9 1e                 xor	r0, r7
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 55                 ldi8	r4, 0x55
 d7 00                 sys	debug_putc
 c3 30                 ldi8	r7, 0x30
 f9 5d                 or	r2, r7
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 97                    or	r5, r7
 f1 17                 mov	r2, r7
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 26                 mov	r5, r2
 f9 35                 or	r1, r5
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 31 04              ldsp16	r1, [sp+0x4]
 f9 35                 or	r1, r5
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 99                    or	r6, r5
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 f9 75                 or	r3, r5
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 f0 36 10              ldsp16	r6, [sp+0x10]
 99                    or	r6, r5
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<call_save_exists>:
 d7 2e                 sys	save_exists
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<call_load>:
 d7 2d                 sys	load
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<call_save>:
 d7 2c                 sys	save
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
