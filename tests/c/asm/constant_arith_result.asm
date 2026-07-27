
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/constant_arith_result.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 constant_arith_result.c
00000100 l     O .data	00000080 values
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000029e avm_test_main
000004b4 g     F .text	00000002 avm_halt

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
 e1 9e 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c4 b9 3e              ldi16	r4, 0x3eb9
 c5 ba 3f              ldi16	r5, 0x3fba
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c4 b7 3c              ldi16	r4, 0x3cb7
 c5 b8 3d              ldi16	r5, 0x3db8
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c4 b5 3a              ldi16	r4, 0x3ab5
 c5 b6 3b              ldi16	r5, 0x3bb6
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c4 b3 38              ldi16	r4, 0x38b3
 c5 b4 39              ldi16	r5, 0x39b4
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c4 b1 36              ldi16	r4, 0x36b1
 c5 b2 37              ldi16	r5, 0x37b2
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 af 34              ldi16	r4, 0x34af
 c5 b0 35              ldi16	r5, 0x35b0
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 ad 32              ldi16	r4, 0x32ad
 c5 ae 33              ldi16	r5, 0x33ae
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 ab 30              ldi16	r4, 0x30ab
 c5 ac 31              ldi16	r5, 0x31ac
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c4 a9 2e              ldi16	r4, 0x2ea9
 c5 aa 2f              ldi16	r5, 0x2faa
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c4 a7 2c              ldi16	r4, 0x2ca7
 c5 a8 2d              ldi16	r5, 0x2da8
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c4 a5 2a              ldi16	r4, 0x2aa5
 c5 a6 2b              ldi16	r5, 0x2ba6
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 a3 28              ldi16	r4, 0x28a3
 c5 a4 29              ldi16	r5, 0x29a4
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c4 a1 26              ldi16	r4, 0x26a1
 c5 a2 27              ldi16	r5, 0x27a2
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c4 9f 24              ldi16	r4, 0x249f
 c5 a0 25              ldi16	r5, 0x25a0
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 9d 22              ldi16	r4, 0x229d
 c5 9e 23              ldi16	r5, 0x239e
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 9b 20              ldi16	r4, 0x209b
 c5 9c 21              ldi16	r5, 0x219c
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c4 99 1e              ldi16	r4, 0x1e99
 c5 9a 1f              ldi16	r5, 0x1f9a
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 97 1c              ldi16	r4, 0x1c97
 c5 98 1d              ldi16	r5, 0x1d98
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 95 1a              ldi16	r4, 0x1a95
 c5 96 1b              ldi16	r5, 0x1b96
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 93 18              ldi16	r4, 0x1893
 c5 94 19              ldi16	r5, 0x1994
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 91 16              ldi16	r4, 0x1691
 c5 92 17              ldi16	r5, 0x1792
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 8f 14              ldi16	r4, 0x148f
 c5 90 15              ldi16	r5, 0x1590
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 8d 12              ldi16	r4, 0x128d
 c5 8e 13              ldi16	r5, 0x138e
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 8b 10              ldi16	r4, 0x108b
 c5 8c 11              ldi16	r5, 0x118c
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 89 0e              ldi16	r4, 0xe89
 c5 8a 0f              ldi16	r5, 0xf8a
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 87 0c              ldi16	r4, 0xc87
 c5 88 0d              ldi16	r5, 0xd88
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 85 0a              ldi16	r4, 0xa85
 c5 86 0b              ldi16	r5, 0xb86
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 83 08              ldi16	r4, 0x883
 c5 84 09              ldi16	r5, 0x984
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 81 06              ldi16	r4, 0x681
 c5 82 07              ldi16	r5, 0x782
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 7f 04              ldi16	r4, 0x47f
 c5 80 05              ldi16	r5, 0x580
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 7d 02              ldi16	r4, 0x27d
 c5 7e 03              ldi16	r5, 0x37e
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c0 7b                 ldi8	r4, 0x7b
 c5 7c 01              ldi16	r5, 0x17c
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 c3 03                 ldi8	r7, 0x3
 f0 00 05              ldi8	r0, 0x5
 09                    mov	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 c4 00 01              ldi16	r4, 0x100
 f4 5a                 stsp16	[sp+0x6], r6
 f7 21                 ld16	r1, [r4+]
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 fe 37                 mul16	r6, r7
 19                    add	r6, r5
 f1 25                 mov	r5, r1
 fe 28                 mul16	r5, r0
 a6                    xor	r5, r6
 c2 07                 ldi8	r6, 0x7
 f1 2d                 mov	r7, r1
 fe 3e                 mul16	r7, r6
 1d                    add	r7, r5
 c1 0a                 ldi8	r5, 0xa
 f1 29                 mov	r6, r1
 fe 35                 mul16	r6, r5
 ab                    xor	r6, r7
 f1 21                 mov	r4, r1
 c3 03                 ldi8	r7, 0x3
 ec 27                 udiv16	r4, r7
 f0 04 fd ff           ldi16	r0, 0xfffd
 0c                    mov	r7, r4
 fe 38                 mul16	r7, r0
 f2 2d                 add	r7, r1
 1c                    add	r7, r4
 f0 00 1f              ldi8	r0, 0x1f
 f1 21                 mov	r4, r1
 fe 20                 mul16	r4, r0
 12                    add	r4, r6
 f0 04 01 01           ldi16	r0, 0x101
 f1 29                 mov	r6, r1
 fe 30                 mul16	r6, r0
 a8                    xor	r6, r4
 c0 01                 ldi8	r4, 0x1
 f9 84                 and	r4, r1
 f1 01                 mov	r0, r1
 f4 88                 lsr16.1	r0
 f2 04                 add	r0, r4
 f2 06                 add	r0, r6
 f9 1e                 xor	r0, r7
 f0 06 00 80           ldi16	r2, 0x8000
 f9 46                 xor	r2, r1
 f1 1a                 mov	r3, r2
 c0 03                 ldi8	r4, 0x3
 ec 9c                 sdiv16	r3, r4
 c0 05                 ldi8	r4, 0x5
 ec d4                 srem16	r2, r4
 f1 21                 mov	r4, r1
 c2 05                 ldi8	r6, 0x5
 ec 26                 udiv16	r4, r6
 c6 fb ff              ldi16	r6, 0xfffb
 0c                    mov	r7, r4
 fe 3e                 mul16	r7, r6
 f2 2d                 add	r7, r1
 1c                    add	r7, r4
 f1 21                 mov	r4, r1
 ec 25                 udiv16	r4, r5
 c6 f6 ff              ldi16	r6, 0xfff6
 04                    mov	r5, r4
 fe 2e                 mul16	r5, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f2 25                 add	r5, r1
 f2 2c                 add	r7, r0
 f0 00 05              ldi8	r0, 0x5
 14                    add	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 a7                    xor	r5, r7
 c3 03                 ldi8	r7, 0x3
 f2 27                 add	r5, r3
 f9 aa                 xor	r5, r2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 db 70 ff              brne16	avm_test_main+407
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 db 5d ff              brne16	avm_test_main+400
 09                    mov	r6, r5
 f1 76                 zext8	r6
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 f0 01 30              ldi8	r1, 0x30
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f4 58                 stsp16	[sp+0x6], r4
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 fc 27                 cmov.ult	r4, r7
 f4 58                 stsp16	[sp+0x6], r4
 f0 00 0f              ldi8	r0, 0xf
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 f4 50                 stsp16	[sp+0x4], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 34                    cmp	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 f9 35                 or	r1, r5
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 29                 cmov.ult	r5, r1
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
