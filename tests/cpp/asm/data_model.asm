
C:/Users/Brown/Documents/GitHub/avm/build/tests/cpp/data_model.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 data_model.cpp
00000100 l     O .data	00000003 .L__const.avm_test_main.data_bytes
0000051b l     O .rodata	00000003 program_bytes
00000103 l     O .data	00000012 .L__const.avm_test_main.records
00000115 l     O .data	00000002 .L__const.avm_test_main.bits
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000300 avm_test_main
00000516 g     F .text	00000002 avm_halt
00000518 g     F .text	00000003 memcpy

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 00 03              call16	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d6 b4                 adjsp	-0x4c
 c2 9b                 ldi8	r6, 0x9b
 f0 2e 4b              stsp8	[sp+0x4b], r6
 c1 f1                 ldi8	r5, 0xf1
 f0 2d 4a              stsp8	[sp+0x4a], r5
 c4 60 a4              ldi16	r4, 0xa460
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 04 eb 32           ldi16	r0, 0x32eb
 f0 05 a4 f8           ldi16	r1, 0xf8a4
 f0 38 44              stsp16	[sp+0x44], r0
 f0 39 46              stsp16	[sp+0x46], r1
 f0 04 a9 cb           ldi16	r0, 0xcba9
 f0 05 ed ff           ldi16	r1, 0xffed
 f0 38 40              stsp16	[sp+0x40], r0
 f0 39 42              stsp16	[sp+0x42], r1
 f0 04 22 43           ldi16	r0, 0x4322
 f0 05 65 87           ldi16	r1, 0x8765
 f0 38 3c              stsp16	[sp+0x3c], r0
 f0 39 3e              stsp16	[sp+0x3e], r1
 f0 04 98 ba           ldi16	r0, 0xba98
 f0 05 dc fe           ldi16	r1, 0xfedc
 f0 38 38              stsp16	[sp+0x38], r0
 f0 39 3a              stsp16	[sp+0x3a], r1
 f0 04 10 32           ldi16	r0, 0x3210
 f0 05 54 76           ldi16	r1, 0x7654
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 f0 1f 4b              ldsp8u	r7, [sp+0x4b]
 3e                    cmp	r7, r6
 d1 0d                 brne8	avm_test_main+109
 f0 26 4b              ldsp8s	r6, [sp+0x4b]
 c7 ff ff              ldi16	r7, 0xffff
 3e                    cmp	r7, r6
 d9 0b                 brsge8	avm_test_main+116
 c0 5d                 ldi8	r4, 0x5d
 d4 02                 jmp8	avm_test_main+111
 c0 5c                 ldi8	r4, 0x5c
 d6 4c                 adjsp	avm_test_main+189
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 f0 1e 4a              ldsp8u	r6, [sp+0x4a]
 39                    cmp	r6, r5
 d1 74                 brne8	avm_test_main+238
 f0 1d 4a              ldsp8u	r5, [sp+0x4a]
 c2 c9                 ldi8	r6, 0xc9
 36                    cmp	r5, r6
 d2 71                 brult8	avm_test_main+243
 f0 35 48              ldsp16	r5, [sp+0x48]
 34                    cmp	r5, r4
 d1 70                 brne8	avm_test_main+248
 f0 34 44              ldsp16	r4, [sp+0x44]
 f0 35 46              ldsp16	r5, [sp+0x46]
 c6 eb 32              ldi16	r6, 0x32eb
 c7 a4 f8              ldi16	r7, 0xf8a4
 f0 69 8c              cmp32	q2, q3
 d1 64                 brne8	avm_test_main+253
 c4 a9 cb              ldi16	r4, 0xcba9
 c5 ed ff              ldi16	r5, 0xffed
 f0 36 40              ldsp16	r6, [sp+0x40]
 f0 37 42              ldsp16	r7, [sp+0x42]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 c4 22 43              ldi16	r4, 0x4322
 c5 65 87              ldi16	r5, 0x8765
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 40                 brne8	avm_test_main+258
 c4 56 34              ldi16	r4, 0x3456
 c1 12                 ldi8	r5, 0x12
 f0 36 40              ldsp16	r6, [sp+0x40]
 f0 37 42              ldsp16	r7, [sp+0x42]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 c4 de bc              ldi16	r4, 0xbcde
 c5 9a 78              ldi16	r5, 0x789a
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 1d                 brne8	avm_test_main+263
 c0 63                 ldi8	r4, 0x63
 d4 81                 jmp8	avm_test_main+111
 c0 5e                 ldi8	r4, 0x5e
 e0 7c ff              jmp16	avm_test_main+111
 c0 5f                 ldi8	r4, 0x5f
 e0 77 ff              jmp16	avm_test_main+111
 c0 60                 ldi8	r4, 0x60
 e0 72 ff              jmp16	avm_test_main+111
 c0 61                 ldi8	r4, 0x61
 e0 6d ff              jmp16	avm_test_main+111
 c0 62                 ldi8	r4, 0x62
 e0 68 ff              jmp16	avm_test_main+111
 c4 98 ba              ldi16	r4, 0xba98
 c5 dc fe              ldi16	r5, 0xfedc
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 c4 10 32              ldi16	r4, 0x3210
 c5 54 76              ldi16	r5, 0x7654
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 2e                 brne8	avm_test_main+350
 c4 67 45              ldi16	r4, 0x4567
 c5 23 01              ldi16	r5, 0x123
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 c4 ef cd              ldi16	r4, 0xcdef
 c5 ab 89              ldi16	r5, 0x89ab
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 0a                 brne8	avm_test_main+355
 c0 65                 ldi8	r4, 0x65
 e0 11 ff              jmp16	avm_test_main+111
 c0 64                 ldi8	r4, 0x64
 e0 0c ff              jmp16	avm_test_main+111
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 ff c8 0e              fcmp	r0, q3, q2
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f6 28                 tst16	r0
 d1 44                 brne8	avm_test_main+474
 f0 00 00              ldi8	r0, 0x0
 f0 05 80 3f           ldi16	r1, 0x3f80
 ff c8 6c              fcmp	r6, q3, q0
 f6 2e                 tst16	r6
 d1 3b                 brne8	avm_test_main+479
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff c8 4b              fcmp	r4, q2, q3
 f6 2c                 tst16	r4
 d1 35                 brne8	avm_test_main+484
 c4 00 01              ldi16	r4, 0x100
 f0 6c d9              ld16	r6, [r4+]
 f0 6c e8              ld8u	r7, [r4]
 f0 3e 25              stsp16	[sp+0x25], r6
 f0 2f 27              stsp8	[sp+0x27], r7
 f0 14 25              leasp	r4, 0x25
 f0 3c 23              stsp16	[sp+0x23], r4
 c6 1b 05              ldi16	r6, 0x51b
 c3 00                 ldi8	r7, 0x0
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 2f 22              stsp8	[sp+0x22], r7
 f0 35 23              ldsp16	r5, [sp+0x23]
 34                    cmp	r5, r4
 d0 14                 breq8	avm_test_main+489
 c0 78                 ldi8	r4, 0x78
 e0 95 fe              jmp16	avm_test_main+111
 c0 6e                 ldi8	r4, 0x6e
 e0 90 fe              jmp16	avm_test_main+111
 c0 6f                 ldi8	r4, 0x6f
 e0 8b fe              jmp16	avm_test_main+111
 c0 70                 ldi8	r4, 0x70
 e0 86 fe              jmp16	avm_test_main+111
 f0 34 23              ldsp16	r4, [sp+0x23]
 c8 02                 addi.s8	r4, 0x2
 40                    ld8u	r4, [r4]
 cc 65                 cmpi.s8	r4, 0x65
 d1 17                 brne8	avm_test_main+522
 c4 1b 05              ldi16	r4, 0x51b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 1f 22              ldsp8u	r7, [sp+0x22]
 f0 69 c8              cmp32	q3, q2
 d0 0a                 breq8	avm_test_main+527
 c0 7a                 ldi8	r4, 0x7a
 e0 65 fe              jmp16	avm_test_main+111
 c0 79                 ldi8	r4, 0x79
 e0 60 fe              jmp16	avm_test_main+111
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 1f 22              ldsp8u	r7, [sp+0x22]
 f7 6e                 add32	q3, q2
 f0 60 8c              ldp8u	r4, [q3]
 cc 34                 cmpi.s8	r4, 0x34
 db ca 00              brne16	avm_test_main+748
 f0 44 03 01           ldm8u	r4, [0x103]
 f0 2c 1f              stsp8	[sp+0x1f], r4
 f0 44 04 01           ldm8u	r4, [0x104]
 f0 2c 1e              stsp8	[sp+0x1e], r4
 f0 44 05 01           ldm8u	r4, [0x105]
 f0 2c 1d              stsp8	[sp+0x1d], r4
 f0 44 06 01           ldm8u	r4, [0x106]
 f0 2c 1c              stsp8	[sp+0x1c], r4
 f0 44 07 01           ldm8u	r4, [0x107]
 f0 2c 1b              stsp8	[sp+0x1b], r4
 f0 44 08 01           ldm8u	r4, [0x108]
 f0 2c 1a              stsp8	[sp+0x1a], r4
 f0 54 09 01           ldm16	r4, [0x109]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 44 0b 01           ldm8u	r4, [0x10b]
 f0 2c 17              stsp8	[sp+0x17], r4
 f0 14 08              leasp	r4, 0x8
 c5 0c 01              ldi16	r5, 0x10c
 c2 09                 ldi8	r6, 0x9
 e1 9d 00              call16	memcpy
 f0 1c 1f              ldsp8u	r4, [sp+0x1f]
 cc 11                 cmpi.s8	r4, 0x11
 db 84 00              brne16	avm_test_main+753
 c0 84                 ldi8	r4, 0x84
 f0 1d 1e              ldsp8u	r5, [sp+0x1e]
 cd 33                 cmpi.s8	r5, 0x33
 db f8 fd              brne16	avm_test_main+111
 f0 1d 1d              ldsp8u	r5, [sp+0x1d]
 cd 22                 cmpi.s8	r5, 0x22
 db f0 fd              brne16	avm_test_main+111
 c0 85                 ldi8	r4, 0x85
 f0 1d 1c              ldsp8u	r5, [sp+0x1c]
 cd 55                 cmpi.s8	r5, 0x55
 db e6 fd              brne16	avm_test_main+111
 f0 1d 1b              ldsp8u	r5, [sp+0x1b]
 cd 44                 cmpi.s8	r5, 0x44
 db de fd              brne16	avm_test_main+111
 c0 86                 ldi8	r4, 0x86
 f0 1d 1a              ldsp8u	r5, [sp+0x1a]
 c2 99                 ldi8	r6, 0x99
 36                    cmp	r5, r6
 db d3 fd              brne16	avm_test_main+111
 f0 1d 17              ldsp8u	r5, [sp+0x17]
 cd 66                 cmpi.s8	r5, 0x66
 db cb fd              brne16	avm_test_main+111
 c4 34 12              ldi16	r4, 0x1234
 f4 58                 stsp16	[sp+0x6], r4
 f4 19                 ldsp16	r5, [sp+0x6]
 34                    cmp	r5, r4
 d1 48                 brne8	avm_test_main+758
 f0 54 15 01           ldm16	r4, [0x115]
 f4 50                 stsp16	[sp+0x4], r4
 c0 07                 ldi8	r4, 0x7
 f4 11                 ldsp16	r5, [sp+0x4]
 84                    and	r5, r4
 c0 93                 ldi8	r4, 0x93
 cd 05                 cmpi.s8	r5, 0x5
 db af fd              brne16	avm_test_main+111
 c1 f8                 ldi8	r5, 0xf8
 f4 12                 ldsp16	r6, [sp+0x4]
 89                    and	r6, r5
 c1 88                 ldi8	r5, 0x88
 39                    cmp	r6, r5
 db a4 fd              brne16	avm_test_main+111
 c5 00 ff              ldi16	r5, 0xff00
 f4 12                 ldsp16	r6, [sp+0x4]
 89                    and	r6, r5
 c5 00 a5              ldi16	r5, 0xa500
 39                    cmp	r6, r5
 db 97 fd              brne16	avm_test_main+111
 f3 50                 ldsp8u	r4, [sp+0x4]
 c1 8d                 ldi8	r5, 0x8d
 31                    cmp	r4, r5
 d1 1c                 brne8	avm_test_main+763
 c1 a5                 ldi8	r5, 0xa5
 f3 56                 ldsp8u	r6, [sp+0x5]
 c0 95                 ldi8	r4, 0x95
 af                    xor	r7, r7
 39                    cmp	r6, r5
 fb 27                 cmov.eq	r4, r7
 e0 83 fd              jmp16	avm_test_main+111
 c0 7b                 ldi8	r4, 0x7b
 e0 7e fd              jmp16	avm_test_main+111
 c0 83                 ldi8	r4, 0x83
 e0 79 fd              jmp16	avm_test_main+111
 c0 8d                 ldi8	r4, 0x8d
 e0 74 fd              jmp16	avm_test_main+111
 c0 94                 ldi8	r4, 0x94
 e0 6f fd              jmp16	avm_test_main+111

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<memcpy>:
 d7 0f                 sys	memcpy
 ef                    ret
