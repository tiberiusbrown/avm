
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/data_model.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 data_model.c
00000100 l     O .data	00000003 .L__const.avm_test_main.data_bytes
000004e1 l     O .rodata	00000003 program_bytes
00000103 l     O .data	00000012 .L__const.avm_test_main.records
00000115 l     O .data	00000002 .L__const.avm_test_main.bits
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000002c4 avm_test_main
000004da g     F .text	00000002 avm_halt
000004dc g     F .text	00000005 memcpy

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
 e1 c4 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 b8                 adjsp	-0x48
 c2 9b                 ldi8	r6, 0x9b
 f0 2e 47              stsp8	[sp+0x47], r6
 f0 02 f1              ldi8	r2, 0xf1
 f0 2a 46              stsp8	[sp+0x46], r2
 c5 60 a4              ldi16	r5, 0xa460
 f0 3d 44              stsp16	[sp+0x44], r5
 f0 04 eb 32           ldi16	r0, 0x32eb
 f0 05 a4 f8           ldi16	r1, 0xf8a4
 f0 38 40              stsp16	[sp+0x40], r0
 f0 39 42              stsp16	[sp+0x42], r1
 f0 04 a9 cb           ldi16	r0, 0xcba9
 f0 05 ed ff           ldi16	r1, 0xffed
 f0 38 3c              stsp16	[sp+0x3c], r0
 f0 39 3e              stsp16	[sp+0x3e], r1
 f0 04 22 43           ldi16	r0, 0x4322
 f0 05 65 87           ldi16	r1, 0x8765
 f0 38 38              stsp16	[sp+0x38], r0
 f0 39 3a              stsp16	[sp+0x3a], r1
 f0 04 98 ba           ldi16	r0, 0xba98
 f0 05 dc fe           ldi16	r1, 0xfedc
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 f0 04 10 32           ldi16	r0, 0x3210
 f0 05 54 76           ldi16	r1, 0x7654
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 c0 5c                 ldi8	r4, 0x5c
 f0 1f 47              ldsp8u	r7, [sp+0x47]
 3e                    cmp	r7, r6
 db 57 02              brne16	avm_test_main+701
 c0 5d                 ldi8	r4, 0x5d
 f0 26 47              ldsp8s	r6, [sp+0x47]
 f4 a6                 tst8	r6
 df 4d 02              brsge16	avm_test_main+701
 c0 5e                 ldi8	r4, 0x5e
 f0 1e 46              ldsp8u	r6, [sp+0x46]
 f5 2a                 cmp	r6, r2
 db 43 02              brne16	avm_test_main+701
 c0 5f                 ldi8	r4, 0x5f
 f0 1e 46              ldsp8u	r6, [sp+0x46]
 c3 c9                 ldi8	r7, 0xc9
 3b                    cmp	r6, r7
 dc 38 02              brult16	avm_test_main+701
 c0 60                 ldi8	r4, 0x60
 f0 36 44              ldsp16	r6, [sp+0x44]
 39                    cmp	r6, r5
 db 2f 02              brne16	avm_test_main+701
 c0 61                 ldi8	r4, 0x61
 f0 36 40              ldsp16	r6, [sp+0x40]
 f0 37 42              ldsp16	r7, [sp+0x42]
 f0 04 eb 32           ldi16	r0, 0x32eb
 f0 05 a4 f8           ldi16	r1, 0xf8a4
 f0 69 c0              cmp32	q3, q0
 db 19 02              brne16	avm_test_main+701
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 c6 a9 cb              ldi16	r6, 0xcba9
 c7 ed ff              ldi16	r7, 0xffed
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 30 38              ldsp16	r0, [sp+0x38]
 f0 31 3a              ldsp16	r1, [sp+0x3a]
 c6 22 43              ldi16	r6, 0x4322
 c7 65 87              ldi16	r7, 0x8765
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 c0 62                 ldi8	r4, 0x62
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 db ed 01              brne16	avm_test_main+701
 c4 56 34              ldi16	r4, 0x3456
 c1 12                 ldi8	r5, 0x12
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 c4 de bc              ldi16	r4, 0xbcde
 c5 9a 78              ldi16	r5, 0x789a
 f0 32 38              ldsp16	r2, [sp+0x38]
 f0 33 3a              ldsp16	r3, [sp+0x3a]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f9 41                 or	r2, r0
 f9 65                 or	r3, r1
 c0 63                 ldi8	r4, 0x63
 f0 69 4c              cmp32	q1, q3
 da c2 01              breq16	avm_test_main+701
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f0 04 98 ba           ldi16	r0, 0xba98
 f0 05 dc fe           ldi16	r1, 0xfedc
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 f0 30 30              ldsp16	r0, [sp+0x30]
 f0 31 32              ldsp16	r1, [sp+0x32]
 f0 06 10 32           ldi16	r2, 0x3210
 f0 07 54 76           ldi16	r3, 0x7654
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 c0 64                 ldi8	r4, 0x64
 f0 69 0c              cmp32	q0, q3
 db 92 01              brne16	avm_test_main+701
 c4 67 45              ldi16	r4, 0x4567
 c5 23 01              ldi16	r5, 0x123
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 c4 ef cd              ldi16	r4, 0xcdef
 c5 ab 89              ldi16	r5, 0x89ab
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f9 41                 or	r2, r0
 f9 65                 or	r3, r1
 c0 65                 ldi8	r4, 0x65
 f0 69 4c              cmp32	q1, q3
 da 66 01              breq16	avm_test_main+701
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 ff c8 5b              fcmp	r5, q2, q3
 c0 6e                 ldi8	r4, 0x6e
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f6 2d                 tst16	r5
 db 34 01              brne16	avm_test_main+701
 ff c8 57              fcmp	r5, q1, q3
 c0 6f                 ldi8	r4, 0x6f
 f6 2d                 tst16	r5
 db 2a 01              brne16	avm_test_main+701
 ff c8 53              fcmp	r5, q0, q3
 c0 70                 ldi8	r4, 0x70
 f6 2d                 tst16	r5
 db 20 01              brne16	avm_test_main+701
 c4 00 01              ldi16	r4, 0x100
 f0 6c d9              ld16	r6, [r4+]
 ed e8 20              ld8u	r7, [r4+0]
 f0 3e 21              stsp16	[sp+0x21], r6
 f0 2f 23              stsp8	[sp+0x23], r7
 f0 15 21              leasp	r5, 0x21
 f0 3d 1f              stsp16	[sp+0x1f], r5
 f0 04 e1 04           ldi16	r0, 0x4e1
 f0 01 00              ldi8	r1, 0x0
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 29 1e              stsp8	[sp+0x1e], r1
 c0 78                 ldi8	r4, 0x78
 f0 36 1f              ldsp16	r6, [sp+0x1f]
 39                    cmp	r6, r5
 db f5 00              brne16	avm_test_main+701
 c0 79                 ldi8	r4, 0x79
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 ed aa 22              ld8u	r5, [r5+2]
 cd 65                 cmpi.s8	r5, 0x65
 db e8 00              brne16	avm_test_main+701
 c0 7a                 ldi8	r4, 0x7a
 f1 71                 zext8	r1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 1f 1e              ldsp8u	r7, [sp+0x1e]
 f0 69 c0              cmp32	q3, q0
 db d8 00              brne16	avm_test_main+701
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 1f 1e              ldsp8u	r7, [sp+0x1e]
 f7 6e                 add32	q3, q2
 c0 7b                 ldi8	r4, 0x7b
 f0 60 ac              ldp8u	r5, [q3]
 cd 34                 cmpi.s8	r5, 0x34
 db c3 00              brne16	avm_test_main+701
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
 e1 89 00              call16	memcpy
 c0 82                 ldi8	r4, 0x82
 f0 1d 1b              ldsp8u	r5, [sp+0x1b]
 cd 11                 cmpi.s8	r5, 0x11
 d1 77                 brne8	avm_test_main+701
 c0 83                 ldi8	r4, 0x83
 f0 1d 1a              ldsp8u	r5, [sp+0x1a]
 cd 33                 cmpi.s8	r5, 0x33
 d1 6e                 brne8	avm_test_main+701
 f0 1d 19              ldsp8u	r5, [sp+0x19]
 cd 22                 cmpi.s8	r5, 0x22
 d1 67                 brne8	avm_test_main+701
 c0 84                 ldi8	r4, 0x84
 f0 1d 18              ldsp8u	r5, [sp+0x18]
 cd 55                 cmpi.s8	r5, 0x55
 d1 5e                 brne8	avm_test_main+701
 f0 1d 17              ldsp8u	r5, [sp+0x17]
 cd 44                 cmpi.s8	r5, 0x44
 d1 57                 brne8	avm_test_main+701
 c0 85                 ldi8	r4, 0x85
 f0 1d 16              ldsp8u	r5, [sp+0x16]
 c2 99                 ldi8	r6, 0x99
 36                    cmp	r5, r6
 d1 4d                 brne8	avm_test_main+701
 f0 1d 13              ldsp8u	r5, [sp+0x13]
 cd 66                 cmpi.s8	r5, 0x66
 d1 46                 brne8	avm_test_main+701
 c0 8b                 ldi8	r4, 0x8b
 c5 34 12              ldi16	r5, 0x1234
 f4 59                 stsp16	[sp+0x6], r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 39                    cmp	r6, r5
 d1 3a                 brne8	avm_test_main+701
 f0 54 15 01           ldm16	r4, [0x115]
 f4 50                 stsp16	[sp+0x4], r4
 c0 07                 ldi8	r4, 0x7
 f4 11                 ldsp16	r5, [sp+0x4]
 84                    and	r5, r4
 c0 91                 ldi8	r4, 0x91
 cd 05                 cmpi.s8	r5, 0x5
 d1 29                 brne8	avm_test_main+701
 c1 f8                 ldi8	r5, 0xf8
 f4 12                 ldsp16	r6, [sp+0x4]
 89                    and	r6, r5
 c1 88                 ldi8	r5, 0x88
 39                    cmp	r6, r5
 d1 1f                 brne8	avm_test_main+701
 c5 00 ff              ldi16	r5, 0xff00
 f4 12                 ldsp16	r6, [sp+0x4]
 89                    and	r6, r5
 c5 00 a5              ldi16	r5, 0xa500
 39                    cmp	r6, r5
 d1 13                 brne8	avm_test_main+701
 c0 92                 ldi8	r4, 0x92
 f3 51                 ldsp8u	r5, [sp+0x4]
 c2 8d                 ldi8	r6, 0x8d
 36                    cmp	r5, r6
 d1 0a                 brne8	avm_test_main+701
 c1 a5                 ldi8	r5, 0xa5
 f3 56                 ldsp8u	r6, [sp+0x5]
 c0 93                 ldi8	r4, 0x93
 af                    xor	r7, r7
 39                    cmp	r6, r5
 fb 27                 cmov.eq	r4, r7
 d6 48                 adjsp	0x48
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<memcpy>:
 0c                    mov	r7, r4
 d7 0f                 sys	memcpy
 03                    mov	r4, r7
 ef                    ret
