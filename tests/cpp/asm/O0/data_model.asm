
data_model.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 data_model.cpp
0000077c l     F .text	00000043 is_binary32_one(void const*)
00000100 l     O .data	00000003 .L__const.avm_test_main.data_bytes
000007c6 l     O .rodata	00000003 program_bytes
00000103 l     O .data	00000012 .L__const.avm_test_main.records
00000115 l     O .data	00000002 .L__const.avm_test_main.bits
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
000007c9 l       .init_array	00000000 .hidden __init_array_end
000007c9 l       .init_array	00000000 .hidden __init_array_start
000007c9 l       .fini_array	00000000 .hidden __fini_array_start
000007c9 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000004a5 avm_test_main
000007bf g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000007c1 g     F .text	00000005 memcpy

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 a1 05              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 c9 07              ldi16	r4, 0x7c9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 c9 07              ldi16	r6, 0x7c9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 c9 07           ldi16	r0, 0x7c9
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 c9 07           ldi16	r2, 0x7c9
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 c9 07              ldi16	r4, 0x7c9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 c9 07              ldi16	r6, 0x7c9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 c9 07           ldi16	r2, 0x7c9
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 c9 07           ldi16	r0, 0x7c9
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d6 a6                 adjsp	-0x5a
 c0 9b                 ldi8	r4, 0x9b
 f0 2c 57              stsp8	[sp+0x57], r4
 c0 f1                 ldi8	r4, 0xf1
 f0 2c 56              stsp8	[sp+0x56], r4
 c4 60 a4              ldi16	r4, 0xa460
 f0 3c 54              stsp16	[sp+0x54], r4
 c4 eb 32              ldi16	r4, 0x32eb
 c5 a4 f8              ldi16	r5, 0xf8a4
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 3d 52              stsp16	[sp+0x52], r5
 c4 a9 cb              ldi16	r4, 0xcba9
 c5 ed ff              ldi16	r5, 0xffed
 f0 3c 4c              stsp16	[sp+0x4c], r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 c4 22 43              ldi16	r4, 0x4322
 c5 65 87              ldi16	r5, 0x8765
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 3d 4a              stsp16	[sp+0x4a], r5
 c4 98 ba              ldi16	r4, 0xba98
 c5 dc fe              ldi16	r5, 0xfedc
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 3d 46              stsp16	[sp+0x46], r5
 c4 10 32              ldi16	r4, 0x3210
 c5 54 76              ldi16	r5, 0x7654
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 3d 42              stsp16	[sp+0x42], r5
 d4 00                 jmp8	avm_test_main+82
 f0 24 57              ldsp8s	r4, [sp+0x57]
 cc 9b                 cmpi.s8	r4, -0x65
 d0 0a                 breq8	avm_test_main+99
 d4 00                 jmp8	avm_test_main+91
 c0 5c                 ldi8	r4, 0x5c
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 3a 04              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+101
 d4 00                 jmp8	avm_test_main+103
 f0 24 57              ldsp8s	r4, [sp+0x57]
 f4 a4                 tst8	r4
 d3 0a                 brslt8	avm_test_main+120
 d4 00                 jmp8	avm_test_main+112
 c0 5d                 ldi8	r4, 0x5d
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 25 04              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+122
 d4 00                 jmp8	avm_test_main+124
 f0 1c 56              ldsp8u	r4, [sp+0x56]
 c1 f1                 ldi8	r5, 0xf1
 31                    cmp	r4, r5
 d0 0a                 breq8	avm_test_main+142
 d4 00                 jmp8	avm_test_main+134
 c0 5e                 ldi8	r4, 0x5e
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 0f 04              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+144
 d4 00                 jmp8	avm_test_main+146
 f0 1d 56              ldsp8u	r5, [sp+0x56]
 c0 c8                 ldi8	r4, 0xc8
 31                    cmp	r4, r5
 d3 0a                 brslt8	avm_test_main+164
 d4 00                 jmp8	avm_test_main+156
 c0 5f                 ldi8	r4, 0x5f
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 f9 03              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+166
 d4 00                 jmp8	avm_test_main+168
 f0 34 54              ldsp16	r4, [sp+0x54]
 c5 60 a4              ldi16	r5, 0xa460
 31                    cmp	r4, r5
 d0 0a                 breq8	avm_test_main+187
 d4 00                 jmp8	avm_test_main+179
 c0 60                 ldi8	r4, 0x60
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 e2 03              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+189
 d4 00                 jmp8	avm_test_main+191
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 c6 eb 32              ldi16	r6, 0x32eb
 c7 a4 f8              ldi16	r7, 0xf8a4
 f0 69 8c              cmp32	q2, q3
 d0 0a                 breq8	avm_test_main+218
 d4 00                 jmp8	avm_test_main+210
 c0 61                 ldi8	r4, 0x61
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 c3 03              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+220
 d4 00                 jmp8	avm_test_main+222
 f0 34 48              ldsp16	r4, [sp+0x48]
 f0 35 4a              ldsp16	r5, [sp+0x4a]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f0 04 a9 cb           ldi16	r0, 0xcba9
 f0 05 ed ff           ldi16	r1, 0xffed
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 22 43           ldi16	r0, 0x4322
 f0 05 65 87           ldi16	r1, 0x8765
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 0a                 breq8	avm_test_main+277
 d4 00                 jmp8	avm_test_main+269
 c0 62                 ldi8	r4, 0x62
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 88 03              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+279
 d4 00                 jmp8	avm_test_main+281
 f0 34 48              ldsp16	r4, [sp+0x48]
 f0 35 4a              ldsp16	r5, [sp+0x4a]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f0 04 56 34           ldi16	r0, 0x3456
 f0 01 12              ldi8	r1, 0x12
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 de bc           ldi16	r0, 0xbcde
 f0 05 9a 78           ldi16	r1, 0x789a
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 0a                 brne8	avm_test_main+335
 d4 00                 jmp8	avm_test_main+327
 c0 63                 ldi8	r4, 0x63
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 4e 03              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+337
 d4 00                 jmp8	avm_test_main+339
 f0 34 40              ldsp16	r4, [sp+0x40]
 f0 35 42              ldsp16	r5, [sp+0x42]
 f0 36 44              ldsp16	r6, [sp+0x44]
 f0 37 46              ldsp16	r7, [sp+0x46]
 f0 04 98 ba           ldi16	r0, 0xba98
 f0 05 dc fe           ldi16	r1, 0xfedc
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 10 32           ldi16	r0, 0x3210
 f0 05 54 76           ldi16	r1, 0x7654
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 0a                 breq8	avm_test_main+394
 d4 00                 jmp8	avm_test_main+386
 c0 64                 ldi8	r4, 0x64
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 13 03              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+396
 d4 00                 jmp8	avm_test_main+398
 f0 34 40              ldsp16	r4, [sp+0x40]
 f0 35 42              ldsp16	r5, [sp+0x42]
 f0 36 44              ldsp16	r6, [sp+0x44]
 f0 37 46              ldsp16	r7, [sp+0x46]
 f0 04 67 45           ldi16	r0, 0x4567
 f0 05 23 01           ldi16	r1, 0x123
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 ef cd           ldi16	r0, 0xcdef
 f0 05 ab 89           ldi16	r1, 0x89ab
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 0a                 brne8	avm_test_main+453
 d4 00                 jmp8	avm_test_main+445
 c0 65                 ldi8	r4, 0x65
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 d8 02              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+455
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 d4 00                 jmp8	avm_test_main+515
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 32              ldsp16	r5, [sp+0x32]
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff c8 4b              fcmp	r4, q2, q3
 f6 2c                 tst16	r4
 d0 0a                 breq8	avm_test_main+542
 d4 00                 jmp8	avm_test_main+534
 c0 6e                 ldi8	r4, 0x6e
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 7f 02              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+544
 d4 00                 jmp8	avm_test_main+546
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff c8 4b              fcmp	r4, q2, q3
 f6 2c                 tst16	r4
 d0 0a                 breq8	avm_test_main+573
 d4 00                 jmp8	avm_test_main+565
 c0 6f                 ldi8	r4, 0x6f
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 60 02              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+575
 d4 00                 jmp8	avm_test_main+577
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff c8 4b              fcmp	r4, q2, q3
 f6 2c                 tst16	r4
 d0 0a                 breq8	avm_test_main+604
 d4 00                 jmp8	avm_test_main+596
 c0 70                 ldi8	r4, 0x70
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 41 02              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+606
 d4 00                 jmp8	avm_test_main+608
 f0 14 30              leasp	r4, 0x30
 e1 3f 02              call16	_ZL15is_binary32_onePKv
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 0a                 brne8	avm_test_main+631
 d4 00                 jmp8	avm_test_main+623
 c0 71                 ldi8	r4, 0x71
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 26 02              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+633
 d4 00                 jmp8	avm_test_main+635
 f0 14 2c              leasp	r4, 0x2c
 e1 24 02              call16	_ZL15is_binary32_onePKv
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 0a                 brne8	avm_test_main+658
 d4 00                 jmp8	avm_test_main+650
 c0 72                 ldi8	r4, 0x72
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 0b 02              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+660
 d4 00                 jmp8	avm_test_main+662
 f0 14 28              leasp	r4, 0x28
 e1 09 02              call16	_ZL15is_binary32_onePKv
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 0a                 brne8	avm_test_main+685
 d4 00                 jmp8	avm_test_main+677
 c0 73                 ldi8	r4, 0x73
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 f0 01              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+687
 f0 44 02 01           ldm8u	r4, [0x102]
 f0 2c 27              stsp8	[sp+0x27], r4
 f0 44 01 01           ldm8u	r4, [0x101]
 f0 2c 26              stsp8	[sp+0x26], r4
 f0 44 00 01           ldm8u	r4, [0x100]
 f0 2c 25              stsp8	[sp+0x25], r4
 f0 14 25              leasp	r4, 0x25
 f0 3c 23              stsp16	[sp+0x23], r4
 c4 c6 07              ldi16	r4, 0x7c6
 c1 00                 ldi8	r5, 0x0
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 2d 22              stsp8	[sp+0x22], r5
 d4 00                 jmp8	avm_test_main+727
 f0 34 23              ldsp16	r4, [sp+0x23]
 f0 15 25              leasp	r5, 0x25
 31                    cmp	r4, r5
 d0 0a                 breq8	avm_test_main+746
 d4 00                 jmp8	avm_test_main+738
 c0 78                 ldi8	r4, 0x78
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 b3 01              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+748
 d4 00                 jmp8	avm_test_main+750
 f0 34 23              ldsp16	r4, [sp+0x23]
 ed 88 22              ld8u	r4, [r4+2]
 cc 65                 cmpi.s8	r4, 0x65
 d0 0a                 breq8	avm_test_main+770
 d4 00                 jmp8	avm_test_main+762
 c0 79                 ldi8	r4, 0x79
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 9b 01              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+772
 d4 00                 jmp8	avm_test_main+774
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 1d 22              ldsp8u	r5, [sp+0x22]
 c6 c6 07              ldi16	r6, 0x7c6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 8c              cmp32	q2, q3
 d0 0a                 breq8	avm_test_main+802
 d4 00                 jmp8	avm_test_main+794
 c0 7a                 ldi8	r4, 0x7a
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 7b 01              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+804
 d4 00                 jmp8	avm_test_main+806
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 1d 22              ldsp8u	r5, [sp+0x22]
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 60 88              ldp8u	r4, [q2]
 cc 34                 cmpi.s8	r4, 0x34
 d0 0a                 breq8	avm_test_main+834
 d4 00                 jmp8	avm_test_main+826
 c0 7b                 ldi8	r4, 0x7b
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 5b 01              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+836
 c5 03 01              ldi16	r5, 0x103
 f0 14 0e              leasp	r4, 0xe
 f4 40                 stsp16	[sp+0x0], r4
 c2 12                 ldi8	r6, 0x12
 e1 99 01              call16	memcpy
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 70                 stsp16	[sp+0xc], r4
 d4 00                 jmp8	avm_test_main+855
 f4 30                 ldsp16	r4, [sp+0xc]
 40                    ld8u	r4, [r4]
 cc 11                 cmpi.s8	r4, 0x11
 d0 0a                 breq8	avm_test_main+872
 d4 00                 jmp8	avm_test_main+864
 c0 83                 ldi8	r4, 0x83
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 35 01              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+874
 d4 00                 jmp8	avm_test_main+876
 f4 30                 ldsp16	r4, [sp+0xc]
 ed 88 21              ld8u	r4, [r4+1]
 cc 33                 cmpi.s8	r4, 0x33
 d1 0d                 brne8	avm_test_main+898
 d4 00                 jmp8	avm_test_main+887
 f4 30                 ldsp16	r4, [sp+0xc]
 ed 88 22              ld8u	r4, [r4+2]
 cc 22                 cmpi.s8	r4, 0x22
 d0 0a                 breq8	avm_test_main+906
 d4 00                 jmp8	avm_test_main+898
 c0 84                 ldi8	r4, 0x84
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 13 01              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+908
 d4 00                 jmp8	avm_test_main+910
 f4 30                 ldsp16	r4, [sp+0xc]
 ed 88 23              ld8u	r4, [r4+3]
 cc 55                 cmpi.s8	r4, 0x55
 d1 0d                 brne8	avm_test_main+932
 d4 00                 jmp8	avm_test_main+921
 f4 30                 ldsp16	r4, [sp+0xc]
 ed 88 24              ld8u	r4, [r4+4]
 cc 44                 cmpi.s8	r4, 0x44
 d0 0a                 breq8	avm_test_main+940
 d4 00                 jmp8	avm_test_main+932
 c0 85                 ldi8	r4, 0x85
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 f1 00              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+942
 d4 00                 jmp8	avm_test_main+944
 f4 30                 ldsp16	r4, [sp+0xc]
 ed 88 25              ld8u	r4, [r4+5]
 c1 99                 ldi8	r5, 0x99
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+967
 d4 00                 jmp8	avm_test_main+956
 f4 30                 ldsp16	r4, [sp+0xc]
 ed 88 28              ld8u	r4, [r4+8]
 cc 66                 cmpi.s8	r4, 0x66
 d0 0a                 breq8	avm_test_main+975
 d4 00                 jmp8	avm_test_main+967
 c0 86                 ldi8	r4, 0x86
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 ce 00              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+977
 d4 00                 jmp8	avm_test_main+979
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 14 0e              leasp	r4, 0xe
 21                    sub	r4, r5
 f6 2c                 tst16	r4
 d0 0a                 breq8	avm_test_main+999
 d4 00                 jmp8	avm_test_main+991
 c0 88                 ldi8	r4, 0x88
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 b6 00              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+1001
 c4 34 12              ldi16	r4, 0x1234
 f4 68                 stsp16	[sp+0xa], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 60                 stsp16	[sp+0x8], r4
 f0 14 08              leasp	r4, 0x8
 f4 58                 stsp16	[sp+0x6], r4
 d4 00                 jmp8	avm_test_main+1017
 f4 20                 ldsp16	r4, [sp+0x8]
 c5 34 12              ldi16	r5, 0x1234
 31                    cmp	r4, r5
 d0 0a                 breq8	avm_test_main+1035
 d4 00                 jmp8	avm_test_main+1027
 c0 8d                 ldi8	r4, 0x8d
 f0 3c 58              stsp16	[sp+0x58], r4
 e0 92 00              jmp16	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+1037
 d4 00                 jmp8	avm_test_main+1039
 f4 18                 ldsp16	r4, [sp+0x6]
 40                    ld8u	r4, [r4]
 cc 34                 cmpi.s8	r4, 0x34
 d1 0d                 brne8	avm_test_main+1059
 d4 00                 jmp8	avm_test_main+1048
 f4 18                 ldsp16	r4, [sp+0x6]
 ed 88 21              ld8u	r4, [r4+1]
 cc 12                 cmpi.s8	r4, 0x12
 d0 09                 breq8	avm_test_main+1066
 d4 00                 jmp8	avm_test_main+1059
 c0 8e                 ldi8	r4, 0x8e
 f0 3c 58              stsp16	[sp+0x58], r4
 d4 73                 jmp8	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+1068
 f0 44 16 01           ldm8u	r4, [0x116]
 f1 44                 stsp8	[sp+0x5], r4
 f0 44 15 01           ldm8u	r4, [0x115]
 f1 40                 stsp8	[sp+0x4], r4
 f0 14 04              leasp	r4, 0x4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	avm_test_main+1087
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 07                 ldi8	r5, 0x7
 81                    and	r4, r5
 cc 05                 cmpi.s8	r4, 0x5
 d1 1a                 brne8	avm_test_main+1122
 d4 00                 jmp8	avm_test_main+1098
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 73                 lsr16i	r4, 0x3
 c1 1f                 ldi8	r5, 0x1f
 81                    and	r4, r5
 cc 11                 cmpi.s8	r4, 0x11
 d1 0d                 brne8	avm_test_main+1122
 d4 00                 jmp8	avm_test_main+1111
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 78                 lsr16i	r4, 0x8
 c1 a5                 ldi8	r5, 0xa5
 31                    cmp	r4, r5
 d0 09                 breq8	avm_test_main+1129
 d4 00                 jmp8	avm_test_main+1122
 c0 93                 ldi8	r4, 0x93
 f0 3c 58              stsp16	[sp+0x58], r4
 d4 34                 jmp8	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+1131
 d4 00                 jmp8	avm_test_main+1133
 f4 08                 ldsp16	r4, [sp+0x2]
 40                    ld8u	r4, [r4]
 c1 8d                 ldi8	r5, 0x8d
 31                    cmp	r4, r5
 d0 09                 breq8	avm_test_main+1150
 d4 00                 jmp8	avm_test_main+1143
 c0 94                 ldi8	r4, 0x94
 f0 3c 58              stsp16	[sp+0x58], r4
 d4 1f                 jmp8	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+1152
 d4 00                 jmp8	avm_test_main+1154
 f4 08                 ldsp16	r4, [sp+0x2]
 ed 88 21              ld8u	r4, [r4+1]
 c1 a5                 ldi8	r5, 0xa5
 31                    cmp	r4, r5
 d0 09                 breq8	avm_test_main+1173
 d4 00                 jmp8	avm_test_main+1166
 c0 95                 ldi8	r4, 0x95
 f0 3c 58              stsp16	[sp+0x58], r4
 d4 08                 jmp8	avm_test_main+1181
 d4 00                 jmp8	avm_test_main+1175
 a0                    xor	r4, r4
 f0 3c 58              stsp16	[sp+0x58], r4
 d4 00                 jmp8	avm_test_main+1181
 f0 34 58              ldsp16	r4, [sp+0x58]
 d6 5a                 adjsp	0x5a
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<is_binary32_one(void const*)>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 44                    ld8u	r5, [r4]
 a0                    xor	r4, r4
 f4 a5                 tst8	r5
 f4 40                 stsp16	[sp+0x0], r4
 d1 2c                 brne8	_ZL15is_binary32_onePKv+62
 d4 00                 jmp8	_ZL15is_binary32_onePKv+20
 f4 08                 ldsp16	r4, [sp+0x2]
 ed a8 21              ld8u	r5, [r4+1]
 a0                    xor	r4, r4
 f4 a5                 tst8	r5
 f4 40                 stsp16	[sp+0x0], r4
 d1 1e                 brne8	_ZL15is_binary32_onePKv+62
 d4 00                 jmp8	_ZL15is_binary32_onePKv+34
 f4 08                 ldsp16	r4, [sp+0x2]
 ed a8 22              ld8u	r5, [r4+2]
 a0                    xor	r4, r4
 c2 80                 ldi8	r6, 0x80
 36                    cmp	r5, r6
 f4 40                 stsp16	[sp+0x0], r4
 d1 0f                 brne8	_ZL15is_binary32_onePKv+62
 d4 00                 jmp8	_ZL15is_binary32_onePKv+49
 f4 08                 ldsp16	r4, [sp+0x2]
 ed 88 23              ld8u	r4, [r4+3]
 cc 3f                 cmpi.s8	r4, 0x3f
 f8 04                 cset.eq	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	_ZL15is_binary32_onePKv+62
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 06                 adjsp	0x6
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<memcpy>:
 0c                    mov	r7, r4
 d7 0f                 sys	memcpy
 03                    mov	r4, r7
 ef                    ret
