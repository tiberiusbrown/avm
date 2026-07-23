
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/data_model.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 data_model.c
00000100 l     O .data	00000003 .L__const.avm_test_main.data_bytes
000004fd l     O .rodata	00000003 program_bytes
00000103 l     O .data	00000012 .L__const.avm_test_main.records
00000115 l     O .data	00000002 .L__const.avm_test_main.bits
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000002e2 avm_test_main
000004f8 g     F .text	00000002 avm_halt
000004fa g     F .text	00000003 memcpy

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
 e1 e2 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 b8                 adjsp	-0x48
 f0 00 9b              ldi8	r0, 0x9b
 f0 28 47              stsp8	[sp+0x47], r0
 c3 f1                 ldi8	r7, 0xf1
 f0 2f 46              stsp8	[sp+0x46], r7
 c6 60 a4              ldi16	r6, 0xa460
 f0 3e 44              stsp16	[sp+0x44], r6
 f0 06 eb 32           ldi16	r2, 0x32eb
 f0 07 a4 f8           ldi16	r3, 0xf8a4
 f0 3a 40              stsp16	[sp+0x40], r2
 f0 3b 42              stsp16	[sp+0x42], r3
 c4 a9 cb              ldi16	r4, 0xcba9
 c5 ed ff              ldi16	r5, 0xffed
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 c4 22 43              ldi16	r4, 0x4322
 c5 65 87              ldi16	r5, 0x8765
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 c4 98 ba              ldi16	r4, 0xba98
 c5 dc fe              ldi16	r5, 0xfedc
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 c4 10 32              ldi16	r4, 0x3210
 c5 54 76              ldi16	r5, 0x7654
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 1c 47              ldsp8u	r4, [sp+0x47]
 f5 20                 cmp	r4, r0
 d1 0b                 brne8	avm_test_main+103
 f0 24 47              ldsp8s	r4, [sp+0x47]
 f4 a4                 tst8	r4
 d3 0d                 brslt8	avm_test_main+112
 c0 5d                 ldi8	r4, 0x5d
 d4 02                 jmp8	avm_test_main+105
 c0 5c                 ldi8	r4, 0x5c
 d6 48                 adjsp	avm_test_main+179
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 1c 46              ldsp8u	r4, [sp+0x46]
 33                    cmp	r4, r7
 d1 6e                 brne8	avm_test_main+228
 f0 1c 46              ldsp8u	r4, [sp+0x46]
 c1 c9                 ldi8	r5, 0xc9
 31                    cmp	r4, r5
 d2 6a                 brult8	avm_test_main+232
 f0 34 44              ldsp16	r4, [sp+0x44]
 32                    cmp	r4, r6
 d1 69                 brne8	avm_test_main+237
 f0 34 40              ldsp16	r4, [sp+0x40]
 f0 35 42              ldsp16	r5, [sp+0x42]
 f0 69 84              cmp32	q2, q1
 d1 63                 brne8	avm_test_main+242
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 c6 a9 cb              ldi16	r6, 0xcba9
 c7 ed ff              ldi16	r7, 0xffed
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f0 04 22 43           ldi16	r0, 0x4322
 f0 05 65 87           ldi16	r1, 0x8765
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 98                    or	r6, r4
 9d                    or	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 3d                 brne8	avm_test_main+247
 c4 56 34              ldi16	r4, 0x3456
 c1 12                 ldi8	r5, 0x12
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 c4 de bc              ldi16	r4, 0xbcde
 c5 9a 78              ldi16	r5, 0x789a
 f0 32 38              ldsp16	r2, [sp+0x38]
 f0 33 3a              ldsp16	r3, [sp+0x3a]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f0 69 40              cmp32	q1, q0
 d1 1c                 brne8	avm_test_main+252
 c0 63                 ldi8	r4, 0x63
 d4 85                 jmp8	avm_test_main+105
 c0 5e                 ldi8	r4, 0x5e
 d4 81                 jmp8	avm_test_main+105
 c0 5f                 ldi8	r4, 0x5f
 e0 7c ff              jmp16	avm_test_main+105
 c0 60                 ldi8	r4, 0x60
 e0 77 ff              jmp16	avm_test_main+105
 c0 61                 ldi8	r4, 0x61
 e0 72 ff              jmp16	avm_test_main+105
 c0 62                 ldi8	r4, 0x62
 e0 6d ff              jmp16	avm_test_main+105
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 c6 98 ba              ldi16	r6, 0xba98
 c7 dc fe              ldi16	r7, 0xfedc
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 f0 06 10 32           ldi16	r2, 0x3210
 f0 07 54 76           ldi16	r3, 0x7654
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 69 c0              cmp32	q3, q0
 d1 2c                 brne8	avm_test_main+335
 c4 67 45              ldi16	r4, 0x4567
 c5 23 01              ldi16	r5, 0x123
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 c4 ef cd              ldi16	r4, 0xcdef
 c5 ab 89              ldi16	r5, 0x89ab
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f0 69 40              cmp32	q1, q0
 d1 0a                 brne8	avm_test_main+340
 c0 65                 ldi8	r4, 0x65
 e0 1a ff              jmp16	avm_test_main+105
 c0 64                 ldi8	r4, 0x64
 e0 15 ff              jmp16	avm_test_main+105
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff c8 6e              fcmp	r6, q3, q2
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f6 2e                 tst16	r6
 d1 39                 brne8	avm_test_main+444
 ff c8 62              fcmp	r6, q0, q2
 f6 2e                 tst16	r6
 d1 37                 brne8	avm_test_main+449
 ff c8 46              fcmp	r4, q1, q2
 f6 2c                 tst16	r4
 d1 35                 brne8	avm_test_main+454
 c4 00 01              ldi16	r4, 0x100
 f0 6c d9              ld16	r6, [r4+]
 ed e8 20              ld8u	r7, [r4+0]
 f0 3e 21              stsp16	[sp+0x21], r6
 f0 2f 23              stsp8	[sp+0x23], r7
 f0 14 21              leasp	r4, 0x21
 f0 3c 1f              stsp16	[sp+0x1f], r4
 c6 fd 04              ldi16	r6, 0x4fd
 c3 00                 ldi8	r7, 0x0
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 2f 1e              stsp8	[sp+0x1e], r7
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 34                    cmp	r5, r4
 d0 14                 breq8	avm_test_main+459
 c0 78                 ldi8	r4, 0x78
 e0 ad fe              jmp16	avm_test_main+105
 c0 6e                 ldi8	r4, 0x6e
 e0 a8 fe              jmp16	avm_test_main+105
 c0 6f                 ldi8	r4, 0x6f
 e0 a3 fe              jmp16	avm_test_main+105
 c0 70                 ldi8	r4, 0x70
 e0 9e fe              jmp16	avm_test_main+105
 f0 34 1f              ldsp16	r4, [sp+0x1f]
 ed 88 22              ld8u	r4, [r4+2]
 cc 65                 cmpi.s8	r4, 0x65
 d1 17                 brne8	avm_test_main+492
 c4 fd 04              ldi16	r4, 0x4fd
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 1f 1e              ldsp8u	r7, [sp+0x1e]
 f0 69 c8              cmp32	q3, q2
 d0 0a                 breq8	avm_test_main+497
 c0 7a                 ldi8	r4, 0x7a
 e0 7d fe              jmp16	avm_test_main+105
 c0 79                 ldi8	r4, 0x79
 e0 78 fe              jmp16	avm_test_main+105
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 1f 1e              ldsp8u	r7, [sp+0x1e]
 f7 6e                 add32	q3, q2
 f0 60 8c              ldp8u	r4, [q3]
 cc 34                 cmpi.s8	r4, 0x34
 db ca 00              brne16	avm_test_main+718
 f0 44 03 01           ldm8u	r4, [0x103]
 f0 2c 1b              stsp8	[sp+0x1b], r4
 f0 44 04 01           ldm8u	r4, [0x104]
 f0 2c 1a              stsp8	[sp+0x1a], r4
 f0 44 05 01           ldm8u	r4, [0x105]
 f0 2c 19              stsp8	[sp+0x19], r4
 f0 44 06 01           ldm8u	r4, [0x106]
 f0 2c 18              stsp8	[sp+0x18], r4
 f0 44 07 01           ldm8u	r4, [0x107]
 f0 2c 17              stsp8	[sp+0x17], r4
 f0 44 08 01           ldm8u	r4, [0x108]
 f0 2c 16              stsp8	[sp+0x16], r4
 f0 54 09 01           ldm16	r4, [0x109]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 44 0b 01           ldm8u	r4, [0x10b]
 f0 2c 13              stsp8	[sp+0x13], r4
 f0 14 08              leasp	r4, 0x8
 c5 0c 01              ldi16	r5, 0x10c
 c2 09                 ldi8	r6, 0x9
 e1 9d 00              call16	memcpy
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
 cc 11                 cmpi.s8	r4, 0x11
 db 84 00              brne16	avm_test_main+723
 c0 83                 ldi8	r4, 0x83
 f0 1d 1a              ldsp8u	r5, [sp+0x1a]
 cd 33                 cmpi.s8	r5, 0x33
 db 10 fe              brne16	avm_test_main+105
 f0 1d 19              ldsp8u	r5, [sp+0x19]
 cd 22                 cmpi.s8	r5, 0x22
 db 08 fe              brne16	avm_test_main+105
 c0 84                 ldi8	r4, 0x84
 f0 1d 18              ldsp8u	r5, [sp+0x18]
 cd 55                 cmpi.s8	r5, 0x55
 db fe fd              brne16	avm_test_main+105
 f0 1d 17              ldsp8u	r5, [sp+0x17]
 cd 44                 cmpi.s8	r5, 0x44
 db f6 fd              brne16	avm_test_main+105
 c0 85                 ldi8	r4, 0x85
 f0 1d 16              ldsp8u	r5, [sp+0x16]
 c2 99                 ldi8	r6, 0x99
 36                    cmp	r5, r6
 db eb fd              brne16	avm_test_main+105
 f0 1d 13              ldsp8u	r5, [sp+0x13]
 cd 66                 cmpi.s8	r5, 0x66
 db e3 fd              brne16	avm_test_main+105
 c4 34 12              ldi16	r4, 0x1234
 f4 58                 stsp16	[sp+0x6], r4
 f4 19                 ldsp16	r5, [sp+0x6]
 34                    cmp	r5, r4
 d1 48                 brne8	avm_test_main+728
 f0 54 15 01           ldm16	r4, [0x115]
 f4 50                 stsp16	[sp+0x4], r4
 c0 07                 ldi8	r4, 0x7
 f4 11                 ldsp16	r5, [sp+0x4]
 84                    and	r5, r4
 c0 91                 ldi8	r4, 0x91
 cd 05                 cmpi.s8	r5, 0x5
 db c7 fd              brne16	avm_test_main+105
 c1 f8                 ldi8	r5, 0xf8
 f4 12                 ldsp16	r6, [sp+0x4]
 89                    and	r6, r5
 c1 88                 ldi8	r5, 0x88
 39                    cmp	r6, r5
 db bc fd              brne16	avm_test_main+105
 c5 00 ff              ldi16	r5, 0xff00
 f4 12                 ldsp16	r6, [sp+0x4]
 89                    and	r6, r5
 c5 00 a5              ldi16	r5, 0xa500
 39                    cmp	r6, r5
 db af fd              brne16	avm_test_main+105
 f3 50                 ldsp8u	r4, [sp+0x4]
 c1 8d                 ldi8	r5, 0x8d
 31                    cmp	r4, r5
 d1 1c                 brne8	avm_test_main+733
 c1 a5                 ldi8	r5, 0xa5
 f3 56                 ldsp8u	r6, [sp+0x5]
 c0 93                 ldi8	r4, 0x93
 af                    xor	r7, r7
 39                    cmp	r6, r5
 fb 27                 cmov.eq	r4, r7
 e0 9b fd              jmp16	avm_test_main+105
 c0 7b                 ldi8	r4, 0x7b
 e0 96 fd              jmp16	avm_test_main+105
 c0 82                 ldi8	r4, 0x82
 e0 91 fd              jmp16	avm_test_main+105
 c0 8b                 ldi8	r4, 0x8b
 e0 8c fd              jmp16	avm_test_main+105
 c0 92                 ldi8	r4, 0x92
 e0 87 fd              jmp16	avm_test_main+105

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<memcpy>:
 d7 0f                 sys	memcpy
 ef                    ret
