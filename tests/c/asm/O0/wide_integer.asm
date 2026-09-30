
wide_integer.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 wide_integer.c
00000100 l     O .data	00000005 .L.str
0000189b l     F .text	00000019 test_line16
000018b4 l     F .text	00000022 test_puts
000018d6 l     F .text	0000000b test_putc
000018e1 l     F .text	0000000f test_hex16
000018f0 l     F .text	00000019 test_hex8
00001909 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    df *ABS*	00000000 integer.c
0000240b l       .init_array	00000000 .hidden __init_array_end
0000240b l       .init_array	00000000 .hidden __init_array_start
0000240b l       .fini_array	00000000 .hidden __fini_array_start
0000240b l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000015c4 avm_test_main
00001935 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00001937 g     F .text	000000b3 __avm_muldi3
000019ea g     F .text	000001aa __avm_udivdi3
00001b94 g     F .text	00000146 __avm_umoddi3
00001cda g     F .text	00000279 __avm_divdi3
00001f53 g     F .text	00000211 __avm_moddi3
00002164 g     F .text	00000077 __avm_ashldi3
000021db g     F .text	00000087 __avm_lshrdi3
00002262 g     F .text	00000085 __avm_ashrdi3
000022e7 g     F .text	00000024 __avm_ashlsi3
0000230b g     F .text	00000024 __avm_lshrsi3
0000232f g     F .text	0000002b __avm_ashrsi3
0000235a g     F .text	000000b1 __avm_mulsi3

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
 e1 17 17              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 0b 24              ldi16	r4, 0x240b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 0b 24              ldi16	r6, 0x240b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 0b 24           ldi16	r0, 0x240b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 0b 24           ldi16	r2, 0x240b
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
 c4 0b 24              ldi16	r4, 0x240b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 0b 24              ldi16	r6, 0x240b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 0b 24           ldi16	r2, 0x240b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 0b 24           ldi16	r0, 0x240b
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
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 fe                 adjsp	-0x2
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 f0 3c 7c              stsp16	[sp+0x7c], r4
 f0 3d 7e              stsp16	[sp+0x7e], r5
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 f0 3c 78              stsp16	[sp+0x78], r4
 f0 3d 7a              stsp16	[sp+0x7a], r5
 c4 a9 cb              ldi16	r4, 0xcba9
 c5 ed 0f              ldi16	r5, 0xfed
 f0 3c 74              stsp16	[sp+0x74], r4
 f0 3d 76              stsp16	[sp+0x76], r5
 c4 21 43              ldi16	r4, 0x4321
 c5 65 87              ldi16	r5, 0x8765
 f0 3c 70              stsp16	[sp+0x70], r4
 f0 3d 72              stsp16	[sp+0x72], r5
 d4 00                 jmp8	avm_test_main+58
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f0 30 70              ldsp16	r0, [sp+0x70]
 f0 31 72              ldsp16	r1, [sp+0x72]
 f0 32 74              ldsp16	r2, [sp+0x74]
 f0 33 76              ldsp16	r3, [sp+0x76]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 fd 15              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 04 8f d8           ldi16	r0, 0xd88f
 f0 05 36 22           ldi16	r1, 0x2236
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 f0 8c           ldi16	r0, 0x8cf0
 f0 05 61 e5           ldi16	r1, 0xe561
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+152
 d4 00                 jmp8	avm_test_main+136
 c4 00 01              ldi16	r4, 0x100
 c1 17                 ldi8	r5, 0x17
 e1 34 15              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 20 15              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+154
 d4 00                 jmp8	avm_test_main+156
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f0 30 70              ldsp16	r0, [sp+0x70]
 f0 31 72              ldsp16	r1, [sp+0x72]
 f0 32 74              ldsp16	r2, [sp+0x74]
 f0 33 76              ldsp16	r3, [sp+0x76]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 9b 15              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 04 8f d8           ldi16	r0, 0xd88f
 f0 05 36 22           ldi16	r1, 0x2236
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 f0 8c           ldi16	r0, 0x8cf0
 f0 05 61 e5           ldi16	r1, 0xe561
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+250
 d4 00                 jmp8	avm_test_main+234
 c4 00 01              ldi16	r4, 0x100
 c1 18                 ldi8	r5, 0x18
 e1 d2 14              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 be 14              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+252
 d4 00                 jmp8	avm_test_main+254
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 d6 f8                 adjsp	-0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 02                    mov	r4, r6
 07                    mov	r5, r7
 e1 41 15              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 04 87 a9           ldi16	r0, 0xa987
 f0 05 cb ed           ldi16	r1, 0xedcb
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 10 21           ldi16	r0, 0x2110
 f0 05 43 65           ldi16	r1, 0x6543
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+340
 d4 00                 jmp8	avm_test_main+324
 c4 00 01              ldi16	r4, 0x100
 c1 19                 ldi8	r5, 0x19
 e1 78 14              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 64 14              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+342
 d4 00                 jmp8	avm_test_main+344
 d6 f8                 adjsp	-0x8
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 e1 ee 14              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+412
 d4 00                 jmp8	avm_test_main+396
 c4 00 01              ldi16	r4, 0x100
 c1 1b                 ldi8	r5, 0x1b
 e1 30 14              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 1c 14              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+414
 d4 00                 jmp8	avm_test_main+416
 d6 f8                 adjsp	-0x8
 c4 ff ff              ldi16	r4, 0xffff
 c1 01                 ldi8	r5, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 aa                    xor	r6, r6
 c7 ff ff              ldi16	r7, 0xffff
 02                    mov	r4, r6
 07                    mov	r5, r7
 e1 a8 14              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 04 fd ff           ldi16	r0, 0xfffd
 f0 01 03              ldi8	r1, 0x3
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f2 30                 sub	r0, r0
 f0 01 01              ldi8	r1, 0x1
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+489
 d4 00                 jmp8	avm_test_main+473
 c4 00 01              ldi16	r4, 0x100
 c1 1d                 ldi8	r5, 0x1d
 e1 e3 13              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 cf 13              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+491
 d4 00                 jmp8	avm_test_main+493
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 3d 52              stsp16	[sp+0x52], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 e1 57 14              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f0 36 48              ldsp16	r6, [sp+0x48]
 f0 37 4a              ldsp16	r7, [sp+0x4a]
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+558
 d4 00                 jmp8	avm_test_main+542
 c4 00 01              ldi16	r4, 0x100
 c1 1e                 ldi8	r5, 0x1e
 e1 9e 13              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 8a 13              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+560
 c4 98 ba              ldi16	r4, 0xba98
 c5 dc fe              ldi16	r5, 0xfedc
 f0 3c 7c              stsp16	[sp+0x7c], r4
 f0 3d 7e              stsp16	[sp+0x7e], r5
 c4 10 32              ldi16	r4, 0x3210
 c5 54 76              ldi16	r5, 0x7654
 f0 3c 78              stsp16	[sp+0x78], r4
 f0 3d 7a              stsp16	[sp+0x7a], r5
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 3c 74              stsp16	[sp+0x74], r4
 f0 3d 76              stsp16	[sp+0x76], r5
 c4 89 67              ldi16	r4, 0x6789
 c5 45 23              ldi16	r5, 0x2345
 f0 3c 70              stsp16	[sp+0x70], r4
 f0 3d 72              stsp16	[sp+0x72], r5
 d4 00                 jmp8	avm_test_main+607
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f0 30 70              ldsp16	r0, [sp+0x70]
 f0 31 72              ldsp16	r1, [sp+0x72]
 f0 32 74              ldsp16	r2, [sp+0x74]
 f0 33 76              ldsp16	r3, [sp+0x76]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 8b 14              call16	__avm_udivdi3
 d6 08                 adjsp	0x8
 f2 30                 sub	r0, r0
 f0 05 00 e0           ldi16	r1, 0xe000
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+687
 d4 00                 jmp8	avm_test_main+671
 c4 00 01              ldi16	r4, 0x100
 c1 22                 ldi8	r5, 0x22
 e1 1d 13              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 09 13              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+689
 d4 00                 jmp8	avm_test_main+691
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f0 30 70              ldsp16	r0, [sp+0x70]
 f0 31 72              ldsp16	r1, [sp+0x72]
 f0 32 74              ldsp16	r2, [sp+0x74]
 f0 33 76              ldsp16	r3, [sp+0x76]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 e1 15              call16	__avm_umoddi3
 d6 08                 adjsp	0x8
 f0 04 10 32           ldi16	r0, 0x3210
 f0 05 54 96           ldi16	r1, 0x9654
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+773
 d4 00                 jmp8	avm_test_main+757
 c4 00 01              ldi16	r4, 0x100
 c1 23                 ldi8	r5, 0x23
 e1 c7 12              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 b3 12              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+775
 d4 00                 jmp8	avm_test_main+777
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f0 30 70              ldsp16	r0, [sp+0x70]
 f0 31 72              ldsp16	r1, [sp+0x72]
 f0 32 74              ldsp16	r2, [sp+0x74]
 f0 33 76              ldsp16	r3, [sp+0x76]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 e1 13              call16	__avm_udivdi3
 d6 08                 adjsp	0x8
 f2 30                 sub	r0, r0
 f0 05 00 e0           ldi16	r1, 0xe000
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+857
 d4 00                 jmp8	avm_test_main+841
 c4 00 01              ldi16	r4, 0x100
 c1 24                 ldi8	r5, 0x24
 e1 73 12              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 5f 12              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+859
 d4 00                 jmp8	avm_test_main+861
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f0 30 70              ldsp16	r0, [sp+0x70]
 f0 31 72              ldsp16	r1, [sp+0x72]
 f0 32 74              ldsp16	r2, [sp+0x74]
 f0 33 76              ldsp16	r3, [sp+0x76]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 37 15              call16	__avm_umoddi3
 d6 08                 adjsp	0x8
 f0 04 10 32           ldi16	r0, 0x3210
 f0 05 54 96           ldi16	r1, 0x9654
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+943
 d4 00                 jmp8	avm_test_main+927
 c4 00 01              ldi16	r4, 0x100
 c1 25                 ldi8	r5, 0x25
 e1 1d 12              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 09 12              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+945
 d4 00                 jmp8	avm_test_main+947
 d6 f8                 adjsp	-0x8
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 e1 44 13              call16	__avm_udivdi3
 d6 08                 adjsp	0x8
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1008
 d4 00                 jmp8	avm_test_main+992
 c4 00 01              ldi16	r4, 0x100
 c1 27                 ldi8	r5, 0x27
 e1 dc 11              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 c8 11              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1010
 d4 00                 jmp8	avm_test_main+1012
 d6 f8                 adjsp	-0x8
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 02                    mov	r4, r6
 07                    mov	r5, r7
 e1 b1 14              call16	__avm_umoddi3
 d6 08                 adjsp	0x8
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1065
 d4 00                 jmp8	avm_test_main+1049
 c4 00 01              ldi16	r4, 0x100
 c1 28                 ldi8	r5, 0x28
 e1 a3 11              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 8f 11              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1067
 d4 00                 jmp8	avm_test_main+1069
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 4c              stsp16	[sp+0x4c], r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 e1 ca 12              call16	__avm_udivdi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f0 36 44              ldsp16	r6, [sp+0x44]
 f0 37 46              ldsp16	r7, [sp+0x46]
 f0 06 aa aa           ldi16	r2, 0xaaaa
 f0 07 aa 2a           ldi16	r3, 0x2aaa
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f0 06 aa aa           ldi16	r2, 0xaaaa
 f0 07 aa aa           ldi16	r3, 0xaaaa
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1158
 d4 00                 jmp8	avm_test_main+1142
 c4 00 01              ldi16	r4, 0x100
 c1 2a                 ldi8	r5, 0x2a
 e1 46 11              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 32 11              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1160
 d4 00                 jmp8	avm_test_main+1162
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 3d 4a              stsp16	[sp+0x4a], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 e1 17 14              call16	__avm_umoddi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f0 36 40              ldsp16	r6, [sp+0x40]
 f0 37 42              ldsp16	r7, [sp+0x42]
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1236
 d4 00                 jmp8	avm_test_main+1220
 c4 00 01              ldi16	r4, 0x100
 c1 2b                 ldi8	r5, 0x2b
 e1 f8 10              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 e4 10              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1238
 d4 00                 jmp8	avm_test_main+1240
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 44              stsp16	[sp+0x44], r6
 f0 3f 46              stsp16	[sp+0x46], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e1 1f 12              call16	__avm_udivdi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1305
 d4 00                 jmp8	avm_test_main+1289
 c4 00 01              ldi16	r4, 0x100
 c1 2c                 ldi8	r5, 0x2c
 e1 b3 10              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 9f 10              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1307
 d4 00                 jmp8	avm_test_main+1309
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 40              stsp16	[sp+0x40], r6
 f0 3f 42              stsp16	[sp+0x42], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f2 69                 mov32	q2, q1
 e1 80 13              call16	__avm_umoddi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1382
 d4 00                 jmp8	avm_test_main+1366
 c4 00 01              ldi16	r4, 0x100
 c1 2d                 ldi8	r5, 0x2d
 e1 66 10              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 52 10              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1384
 d4 00                 jmp8	avm_test_main+1386
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 02                    mov	r4, r6
 07                    mov	r5, r7
 e1 89 11              call16	__avm_udivdi3
 d6 08                 adjsp	0x8
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1451
 d4 00                 jmp8	avm_test_main+1435
 c4 00 01              ldi16	r4, 0x100
 c1 2e                 ldi8	r5, 0x2e
 e1 21 10              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 0d 10              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1453
 d4 00                 jmp8	avm_test_main+1455
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 02                    mov	r4, r6
 07                    mov	r5, r7
 e1 f2 12              call16	__avm_umoddi3
 d6 08                 adjsp	0x8
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 fe ff           ldi16	r0, 0xfffe
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1536
 d4 00                 jmp8	avm_test_main+1520
 c4 00 01              ldi16	r4, 0x100
 c1 30                 ldi8	r5, 0x30
 e1 cc 0f              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 b8 0f              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1538
 d4 00                 jmp8	avm_test_main+1540
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 d6 f8                 adjsp	-0x8
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 ee 10              call16	__avm_udivdi3
 d6 08                 adjsp	0x8
 82                    and	r4, r6
 87                    and	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1606
 d4 00                 jmp8	avm_test_main+1590
 c4 00 01              ldi16	r4, 0x100
 c1 31                 ldi8	r5, 0x31
 e1 86 0f              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 72 0f              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1608
 d4 00                 jmp8	avm_test_main+1610
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f0 34 78              ldsp16	r4, [sp+0x78]
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 d6 f8                 adjsp	-0x8
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 38              stsp16	[sp+0x38], r0
 f0 39 3a              stsp16	[sp+0x3a], r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 4c 12              call16	__avm_umoddi3
 d6 08                 adjsp	0x8
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f2 63                 mov32	q0, q3
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 f0 32 78              ldsp16	r2, [sp+0x78]
 f0 33 7a              ldsp16	r3, [sp+0x7a]
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1718
 d4 00                 jmp8	avm_test_main+1702
 c4 00 01              ldi16	r4, 0x100
 c1 32                 ldi8	r5, 0x32
 e1 16 0f              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 02 0f              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1720
 c4 b7 8f              ldi16	r4, 0x8fb7
 c5 ff ff              ldi16	r5, 0xffff
 f0 3c 6c              stsp16	[sp+0x6c], r4
 f0 3d 6e              stsp16	[sp+0x6e], r5
 c4 87 20              ldi16	r4, 0x2087
 c5 f2 79              ldi16	r5, 0x79f2
 f0 3c 68              stsp16	[sp+0x68], r4
 f0 3d 6a              stsp16	[sp+0x6a], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 64              stsp16	[sp+0x64], r4
 f0 3d 66              stsp16	[sp+0x66], r5
 c6 87 d6              ldi16	r6, 0xd687
 c3 12                 ldi8	r7, 0x12
 f0 3e 60              stsp16	[sp+0x60], r6
 f0 3f 62              stsp16	[sp+0x62], r7
 f0 3c 5c              stsp16	[sp+0x5c], r4
 f0 3d 5e              stsp16	[sp+0x5e], r5
 c4 b1 68              ldi16	r4, 0x68b1
 c5 de 3a              ldi16	r5, 0x3ade
 f0 3c 58              stsp16	[sp+0x58], r4
 f0 3d 5a              stsp16	[sp+0x5a], r5
 d4 00                 jmp8	avm_test_main+1783
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 f0 30 58              ldsp16	r0, [sp+0x58]
 f0 31 5a              ldsp16	r1, [sp+0x5a]
 f0 32 5c              ldsp16	r2, [sp+0x5c]
 f0 33 5e              ldsp16	r3, [sp+0x5e]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 40 0f              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 04 bc 82           ldi16	r0, 0x82bc
 f0 05 d1 04           ldi16	r1, 0x4d1
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 57 55           ldi16	r0, 0x5557
 f0 05 b1 78           ldi16	r1, 0x78b1
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1877
 d4 00                 jmp8	avm_test_main+1861
 c4 00 01              ldi16	r4, 0x100
 c1 37                 ldi8	r5, 0x37
 e1 77 0e              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 63 0e              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1879
 d4 00                 jmp8	avm_test_main+1881
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 f0 30 60              ldsp16	r0, [sp+0x60]
 f0 31 62              ldsp16	r1, [sp+0x62]
 f0 32 64              ldsp16	r2, [sp+0x64]
 f0 33 66              ldsp16	r3, [sp+0x66]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 81 12              call16	__avm_divdi3
 d6 08                 adjsp	0x8
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 b8 1e           ldi16	r0, 0x1eb8
 f0 05 0a fa           ldi16	r1, 0xfa0a
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+1975
 d4 00                 jmp8	avm_test_main+1959
 c4 00 01              ldi16	r4, 0x100
 c1 38                 ldi8	r5, 0x38
 e1 15 0e              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 01 0e              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+1977
 d4 00                 jmp8	avm_test_main+1979
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 f0 30 60              ldsp16	r0, [sp+0x60]
 f0 31 62              ldsp16	r1, [sp+0x62]
 f0 32 64              ldsp16	r2, [sp+0x64]
 f0 33 66              ldsp16	r3, [sp+0x66]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 98 14              call16	__avm_moddi3
 d6 08                 adjsp	0x8
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 7f 1d           ldi16	r0, 0x1d7f
 f0 05 fe ff           ldi16	r1, 0xfffe
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+2073
 d4 00                 jmp8	avm_test_main+2057
 c4 00 01              ldi16	r4, 0x100
 c1 39                 ldi8	r5, 0x39
 e1 b3 0d              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 9f 0d              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+2075
 d4 00                 jmp8	avm_test_main+2077
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 f0 30 60              ldsp16	r0, [sp+0x60]
 f0 31 62              ldsp16	r1, [sp+0x62]
 f0 32 64              ldsp16	r2, [sp+0x64]
 f0 33 66              ldsp16	r3, [sp+0x66]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 bd 11              call16	__avm_divdi3
 d6 08                 adjsp	0x8
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 b8 1e           ldi16	r0, 0x1eb8
 f0 05 0a fa           ldi16	r1, 0xfa0a
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+2171
 d4 00                 jmp8	avm_test_main+2155
 c4 00 01              ldi16	r4, 0x100
 c1 3a                 ldi8	r5, 0x3a
 e1 51 0d              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 3d 0d              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+2173
 d4 00                 jmp8	avm_test_main+2175
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 f0 30 60              ldsp16	r0, [sp+0x60]
 f0 31 62              ldsp16	r1, [sp+0x62]
 f0 32 64              ldsp16	r2, [sp+0x64]
 f0 33 66              ldsp16	r3, [sp+0x66]
 d6 f8                 adjsp	-0x8
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 d4 13              call16	__avm_moddi3
 d6 08                 adjsp	0x8
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 7f 1d           ldi16	r0, 0x1d7f
 f0 05 fe ff           ldi16	r1, 0xfffe
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+2269
 d4 00                 jmp8	avm_test_main+2253
 c4 00 01              ldi16	r4, 0x100
 c1 3b                 ldi8	r5, 0x3b
 e1 ef 0c              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 db 0c              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+2271
 d4 00                 jmp8	avm_test_main+2273
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 f0 35 6e              ldsp16	r5, [sp+0x6e]
 f0 36 68              ldsp16	r6, [sp+0x68]
 f0 37 6a              ldsp16	r7, [sp+0x6a]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f2 64                 mov32	q1, q0
 f7 77                 sub32	q1, q3
 f0 3a 28              stsp16	[sp+0x28], r2
 f0 3b 2a              stsp16	[sp+0x2a], r3
 f0 69 c0              cmp32	q3, q0
 f8 0e                 cset.ne	r6
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f2 6a                 mov32	q3, q0
 f7 7e                 sub32	q3, q2
 f0 32 64              ldsp16	r2, [sp+0x64]
 f0 33 66              ldsp16	r3, [sp+0x66]
 f0 34 60              ldsp16	r4, [sp+0x60]
 f0 35 62              ldsp16	r5, [sp+0x62]
 f0 69 80              cmp32	q2, q0
 f8 08                 cset.ne	r0
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 f7 71                 sub32	q0, q1
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f7 76                 sub32	q1, q2
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 d6 f8                 adjsp	-0x8
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 e1 ba 10              call16	__avm_divdi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f0 06 b8 1e           ldi16	r2, 0x1eb8
 f0 07 0a fa           ldi16	r3, 0xfa0a
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+2438
 d4 00                 jmp8	avm_test_main+2422
 c4 00 01              ldi16	r4, 0x100
 c1 3c                 ldi8	r5, 0x3c
 e1 46 0c              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 32 0c              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+2440
 d4 00                 jmp8	avm_test_main+2442
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 f0 35 6e              ldsp16	r5, [sp+0x6e]
 f0 36 68              ldsp16	r6, [sp+0x68]
 f0 37 6a              ldsp16	r7, [sp+0x6a]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f2 64                 mov32	q1, q0
 f7 77                 sub32	q1, q3
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f0 69 c0              cmp32	q3, q0
 f8 0e                 cset.ne	r6
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f2 6a                 mov32	q3, q0
 f7 7e                 sub32	q3, q2
 f0 32 64              ldsp16	r2, [sp+0x64]
 f0 33 66              ldsp16	r3, [sp+0x66]
 f0 34 60              ldsp16	r4, [sp+0x60]
 f0 35 62              ldsp16	r5, [sp+0x62]
 f0 69 80              cmp32	q2, q0
 f8 08                 cset.ne	r0
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f7 71                 sub32	q0, q1
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f7 76                 sub32	q1, q2
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 d6 f8                 adjsp	-0x8
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 e1 8a 12              call16	__avm_moddi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f0 06 81 e2           ldi16	r2, 0xe281
 f0 03 01              ldi8	r3, 0x1
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+2594
 d4 00                 jmp8	avm_test_main+2578
 c4 00 01              ldi16	r4, 0x100
 c1 3d                 ldi8	r5, 0x3d
 e1 aa 0b              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 96 0b              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+2596
 d4 00                 jmp8	avm_test_main+2598
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 32 64              ldsp16	r2, [sp+0x64]
 f0 33 66              ldsp16	r3, [sp+0x66]
 f0 34 60              ldsp16	r4, [sp+0x60]
 f0 35 62              ldsp16	r5, [sp+0x62]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 69 80              cmp32	q2, q0
 f8 08                 cset.ne	r0
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f7 71                 sub32	q0, q1
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f7 76                 sub32	q1, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 d6 f8                 adjsp	-0x8
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 e1 fe 11              call16	__avm_moddi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f0 06 7f 1d           ldi16	r2, 0x1d7f
 f0 07 fe ff           ldi16	r3, 0xfffe
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+2747
 d4 00                 jmp8	avm_test_main+2731
 c4 00 01              ldi16	r4, 0x100
 c1 3e                 ldi8	r5, 0x3e
 e1 11 0b              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 fd 0a              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+2749
 d4 00                 jmp8	avm_test_main+2751
 d6 f8                 adjsp	-0x8
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f2 42                 sub	r2, r2
 f0 07 00 80           ldi16	r3, 0x8000
 f2 6b                 mov32	q3, q1
 e1 21 0f              call16	__avm_divdi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+2827
 d4 00                 jmp8	avm_test_main+2811
 c4 00 01              ldi16	r4, 0x100
 c1 3f                 ldi8	r5, 0x3f
 e1 c1 0a              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 ad 0a              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+2829
 d4 00                 jmp8	avm_test_main+2831
 d6 f8                 adjsp	-0x8
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 e1 4e 11              call16	__avm_moddi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+2899
 d4 00                 jmp8	avm_test_main+2883
 c4 00 01              ldi16	r4, 0x100
 c1 40                 ldi8	r5, 0x40
 e1 79 0a              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 65 0a              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+2901
 d4 00                 jmp8	avm_test_main+2903
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 e1 90 0e              call16	__avm_divdi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 06 55 55           ldi16	r2, 0x5555
 f0 07 55 d5           ldi16	r3, 0xd555
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f0 06 56 55           ldi16	r2, 0x5556
 f0 07 55 55           ldi16	r3, 0x5555
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+2990
 d4 00                 jmp8	avm_test_main+2974
 c4 00 01              ldi16	r4, 0x100
 c1 41                 ldi8	r5, 0x41
 e1 1e 0a              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 0a 0a              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+2992
 d4 00                 jmp8	avm_test_main+2994
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 e1 ae 10              call16	__avm_moddi3
 d6 08                 adjsp	0x8
 f2 63                 mov32	q0, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f0 06 fe ff           ldi16	r2, 0xfffe
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+3081
 d4 00                 jmp8	avm_test_main+3065
 c4 00 01              ldi16	r4, 0x100
 c1 42                 ldi8	r5, 0x42
 e1 c3 09              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 af 09              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3083
 d4 00                 jmp8	avm_test_main+3085
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 d6 f8                 adjsp	-0x8
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 d5 0d              call16	__avm_divdi3
 d6 08                 adjsp	0x8
 82                    and	r4, r6
 87                    and	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+3151
 d4 00                 jmp8	avm_test_main+3135
 c4 00 01              ldi16	r4, 0x100
 c1 43                 ldi8	r5, 0x43
 e1 7d 09              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 69 09              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3153
 d4 00                 jmp8	avm_test_main+3155
 f0 36 6c              ldsp16	r6, [sp+0x6c]
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 d6 f8                 adjsp	-0x8
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 02 10              call16	__avm_moddi3
 d6 08                 adjsp	0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 63                 mov32	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 32 68              ldsp16	r2, [sp+0x68]
 f0 33 6a              ldsp16	r3, [sp+0x6a]
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 f0 35 6e              ldsp16	r5, [sp+0x6e]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+3257
 d4 00                 jmp8	avm_test_main+3241
 c4 00 01              ldi16	r4, 0x100
 c1 44                 ldi8	r5, 0x44
 e1 13 09              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 ff 08              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3259
 c4 67 45              ldi16	r4, 0x4567
 c5 23 81              ldi16	r5, 0x8123
 f0 3c 54              stsp16	[sp+0x54], r4
 f0 3d 56              stsp16	[sp+0x56], r5
 c4 ef cd              ldi16	r4, 0xcdef
 c5 ab 89              ldi16	r5, 0x89ab
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 3d 52              stsp16	[sp+0x52], r5
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 3c 4c              stsp16	[sp+0x4c], r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 d4 00                 jmp8	avm_test_main+3294
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 f0 30 4c              ldsp16	r0, [sp+0x4c]
 f0 31 4e              ldsp16	r1, [sp+0x4e]
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e1 95 11              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f0 04 cf 8a           ldi16	r0, 0x8acf
 f0 05 46 02           ldi16	r1, 0x246
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 de 9b           ldi16	r0, 0x9bde
 f0 05 57 13           ldi16	r1, 0x1357
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+3373
 d4 00                 jmp8	avm_test_main+3357
 c4 00 01              ldi16	r4, 0x100
 c1 48                 ldi8	r5, 0x48
 e1 9f 08              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 8b 08              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3375
 d4 00                 jmp8	avm_test_main+3377
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 f0 30 4c              ldsp16	r0, [sp+0x4c]
 f0 31 4e              ldsp16	r1, [sp+0x4e]
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e1 b9 11              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 04 b3 a2           ldi16	r0, 0xa2b3
 f0 05 91 40           ldi16	r1, 0x4091
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 f7 e6           ldi16	r0, 0xe6f7
 f0 05 d5 c4           ldi16	r1, 0xc4d5
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+3456
 d4 00                 jmp8	avm_test_main+3440
 c4 00 01              ldi16	r4, 0x100
 c1 49                 ldi8	r5, 0x49
 e1 4c 08              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 38 08              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3458
 d4 00                 jmp8	avm_test_main+3460
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 f0 30 4c              ldsp16	r0, [sp+0x4c]
 f0 31 4e              ldsp16	r1, [sp+0x4e]
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e1 ed 11              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f0 04 b3 a2           ldi16	r0, 0xa2b3
 f0 05 91 c0           ldi16	r1, 0xc091
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 f7 e6           ldi16	r0, 0xe6f7
 f0 05 d5 c4           ldi16	r1, 0xc4d5
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+3539
 d4 00                 jmp8	avm_test_main+3523
 c4 00 01              ldi16	r4, 0x100
 c1 4b                 ldi8	r5, 0x4b
 e1 f9 07              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 e5 07              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3541
 d4 00                 jmp8	avm_test_main+3543
 d4 00                 jmp8	avm_test_main+3545
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f2 30                 sub	r0, r0
 f0 38 00              stsp16	[sp+0x0], r0
 e1 9e 10              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f0 04 67 45           ldi16	r0, 0x4567
 f0 05 23 81           ldi16	r1, 0x8123
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
 d0 12                 breq8	avm_test_main+3620
 d4 00                 jmp8	avm_test_main+3604
 c4 00 01              ldi16	r4, 0x100
 c1 52                 ldi8	r5, 0x52
 e1 a8 07              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 94 07              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3622
 d4 00                 jmp8	avm_test_main+3624
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f2 30                 sub	r0, r0
 f0 38 00              stsp16	[sp+0x0], r0
 e1 c6 10              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 04 67 45           ldi16	r0, 0x4567
 f0 05 23 81           ldi16	r1, 0x8123
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
 d0 12                 breq8	avm_test_main+3699
 d4 00                 jmp8	avm_test_main+3683
 c4 00 01              ldi16	r4, 0x100
 c1 52                 ldi8	r5, 0x52
 e1 59 07              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 45 07              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3701
 d4 00                 jmp8	avm_test_main+3703
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f2 30                 sub	r0, r0
 f0 38 00              stsp16	[sp+0x0], r0
 e1 fe 10              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f0 04 67 45           ldi16	r0, 0x4567
 f0 05 23 81           ldi16	r1, 0x8123
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
 d0 12                 breq8	avm_test_main+3778
 d4 00                 jmp8	avm_test_main+3762
 c4 00 01              ldi16	r4, 0x100
 c1 52                 ldi8	r5, 0x52
 e1 0a 07              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 f6 06              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3780
 d4 00                 jmp8	avm_test_main+3782
 d4 00                 jmp8	avm_test_main+3784
 d4 00                 jmp8	avm_test_main+3786
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 01              ldi8	r0, 0x1
 f0 38 00              stsp16	[sp+0x0], r0
 e1 ac 0f              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f0 04 cf 8a           ldi16	r0, 0x8acf
 f0 05 46 02           ldi16	r1, 0x246
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 de 9b           ldi16	r0, 0x9bde
 f0 05 57 13           ldi16	r1, 0x1357
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+3862
 d4 00                 jmp8	avm_test_main+3846
 c4 00 01              ldi16	r4, 0x100
 c1 53                 ldi8	r5, 0x53
 e1 b6 06              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 a2 06              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3864
 d4 00                 jmp8	avm_test_main+3866
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 01              ldi8	r0, 0x1
 f0 38 00              stsp16	[sp+0x0], r0
 e1 d3 0f              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 04 b3 a2           ldi16	r0, 0xa2b3
 f0 05 91 40           ldi16	r1, 0x4091
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 f7 e6           ldi16	r0, 0xe6f7
 f0 05 d5 c4           ldi16	r1, 0xc4d5
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+3942
 d4 00                 jmp8	avm_test_main+3926
 c4 00 01              ldi16	r4, 0x100
 c1 53                 ldi8	r5, 0x53
 e1 66 06              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 52 06              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+3944
 d4 00                 jmp8	avm_test_main+3946
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 01              ldi8	r0, 0x1
 f0 38 00              stsp16	[sp+0x0], r0
 e1 0a 10              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f0 04 b3 a2           ldi16	r0, 0xa2b3
 f0 05 91 c0           ldi16	r1, 0xc091
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 f7 e6           ldi16	r0, 0xe6f7
 f0 05 d5 c4           ldi16	r1, 0xc4d5
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4022
 d4 00                 jmp8	avm_test_main+4006
 c4 00 01              ldi16	r4, 0x100
 c1 53                 ldi8	r5, 0x53
 e1 16 06              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 02 06              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4024
 d4 00                 jmp8	avm_test_main+4026
 d4 00                 jmp8	avm_test_main+4028
 d4 00                 jmp8	avm_test_main+4030
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 0f              ldi8	r0, 0xf
 f0 38 00              stsp16	[sp+0x0], r0
 e1 b8 0e              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f0 04 d5 c4           ldi16	r0, 0xc4d5
 f0 05 b3 a2           ldi16	r1, 0xa2b3
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 00 80           ldi16	r0, 0x8000
 f0 05 f7 e6           ldi16	r1, 0xe6f7
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4106
 d4 00                 jmp8	avm_test_main+4090
 c4 00 01              ldi16	r4, 0x100
 c1 54                 ldi8	r5, 0x54
 e1 c2 05              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 ae 05              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4108
 d4 00                 jmp8	avm_test_main+4110
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 0f              ldi8	r0, 0xf
 f0 38 00              stsp16	[sp+0x0], r0
 e1 df 0e              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 04 46 02           ldi16	r0, 0x246
 f0 01 01              ldi8	r1, 0x1
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 57 13           ldi16	r0, 0x1357
 f0 05 cf 8a           ldi16	r1, 0x8acf
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4185
 d4 00                 jmp8	avm_test_main+4169
 c4 00 01              ldi16	r4, 0x100
 c1 54                 ldi8	r5, 0x54
 e1 73 05              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 5f 05              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4187
 d4 00                 jmp8	avm_test_main+4189
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 0f              ldi8	r0, 0xf
 f0 38 00              stsp16	[sp+0x0], r0
 e1 17 0f              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f0 04 46 02           ldi16	r0, 0x246
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 57 13           ldi16	r0, 0x1357
 f0 05 cf 8a           ldi16	r1, 0x8acf
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4265
 d4 00                 jmp8	avm_test_main+4249
 c4 00 01              ldi16	r4, 0x100
 c1 54                 ldi8	r5, 0x54
 e1 23 05              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 0f 05              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4267
 d4 00                 jmp8	avm_test_main+4269
 d4 00                 jmp8	avm_test_main+4271
 d4 00                 jmp8	avm_test_main+4273
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 10              ldi8	r0, 0x10
 f0 38 00              stsp16	[sp+0x0], r0
 e1 c5 0d              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f0 04 ab 89           ldi16	r0, 0x89ab
 f0 05 67 45           ldi16	r1, 0x4567
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f2 30                 sub	r0, r0
 f0 05 ef cd           ldi16	r1, 0xcdef
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4347
 d4 00                 jmp8	avm_test_main+4331
 c4 00 01              ldi16	r4, 0x100
 c1 55                 ldi8	r5, 0x55
 e1 d1 04              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 bd 04              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4349
 d4 00                 jmp8	avm_test_main+4351
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 10              ldi8	r0, 0x10
 f0 38 00              stsp16	[sp+0x0], r0
 e1 ee 0d              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 04 23 81           ldi16	r0, 0x8123
 f2 39                 sub	r1, r1
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 ab 89           ldi16	r0, 0x89ab
 f0 05 67 45           ldi16	r1, 0x4567
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4425
 d4 00                 jmp8	avm_test_main+4409
 c4 00 01              ldi16	r4, 0x100
 c1 55                 ldi8	r5, 0x55
 e1 83 04              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 6f 04              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4427
 d4 00                 jmp8	avm_test_main+4429
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 10              ldi8	r0, 0x10
 f0 38 00              stsp16	[sp+0x0], r0
 e1 27 0e              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f0 04 23 81           ldi16	r0, 0x8123
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 ab 89           ldi16	r0, 0x89ab
 f0 05 67 45           ldi16	r1, 0x4567
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4505
 d4 00                 jmp8	avm_test_main+4489
 c4 00 01              ldi16	r4, 0x100
 c1 55                 ldi8	r5, 0x55
 e1 33 04              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 1f 04              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4507
 d4 00                 jmp8	avm_test_main+4509
 d4 00                 jmp8	avm_test_main+4511
 d4 00                 jmp8	avm_test_main+4513
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 1f              ldi8	r0, 0x1f
 f0 38 00              stsp16	[sp+0x0], r0
 e1 d5 0c              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f0 04 f7 e6           ldi16	r0, 0xe6f7
 f0 05 d5 c4           ldi16	r1, 0xc4d5
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4587
 d4 00                 jmp8	avm_test_main+4571
 c4 00 01              ldi16	r4, 0x100
 c1 56                 ldi8	r5, 0x56
 e1 e1 03              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 cd 03              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4589
 d4 00                 jmp8	avm_test_main+4591
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 1f              ldi8	r0, 0x1f
 f0 38 00              stsp16	[sp+0x0], r0
 e1 fe 0c              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 cf 8a           ldi16	r0, 0x8acf
 f0 05 46 02           ldi16	r1, 0x246
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4664
 d4 00                 jmp8	avm_test_main+4648
 c4 00 01              ldi16	r4, 0x100
 c1 56                 ldi8	r5, 0x56
 e1 94 03              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 80 03              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4666
 d4 00                 jmp8	avm_test_main+4668
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 1f              ldi8	r0, 0x1f
 f0 38 00              stsp16	[sp+0x0], r0
 e1 38 0d              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 cf 8a           ldi16	r0, 0x8acf
 f0 05 46 02           ldi16	r1, 0x246
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4744
 d4 00                 jmp8	avm_test_main+4728
 c4 00 01              ldi16	r4, 0x100
 c1 56                 ldi8	r5, 0x56
 e1 44 03              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 30 03              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4746
 d4 00                 jmp8	avm_test_main+4748
 d4 00                 jmp8	avm_test_main+4750
 d4 00                 jmp8	avm_test_main+4752
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 20              ldi8	r0, 0x20
 f0 38 00              stsp16	[sp+0x0], r0
 e1 e6 0b              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f0 04 ef cd           ldi16	r0, 0xcdef
 f0 05 ab 89           ldi16	r1, 0x89ab
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4816
 d4 00                 jmp8	avm_test_main+4800
 c4 00 01              ldi16	r4, 0x100
 c1 57                 ldi8	r5, 0x57
 e1 fc 02              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 e8 02              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4818
 d4 00                 jmp8	avm_test_main+4820
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 20              ldi8	r0, 0x20
 f0 38 00              stsp16	[sp+0x0], r0
 e1 19 0c              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 04 67 45           ldi16	r0, 0x4567
 f0 05 23 81           ldi16	r1, 0x8123
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4884
 d4 00                 jmp8	avm_test_main+4868
 c4 00 01              ldi16	r4, 0x100
 c1 57                 ldi8	r5, 0x57
 e1 b8 02              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 a4 02              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4886
 d4 00                 jmp8	avm_test_main+4888
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 20              ldi8	r0, 0x20
 f0 38 00              stsp16	[sp+0x0], r0
 e1 5c 0c              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 67 45           ldi16	r0, 0x4567
 f0 05 23 81           ldi16	r1, 0x8123
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+4964
 d4 00                 jmp8	avm_test_main+4948
 c4 00 01              ldi16	r4, 0x100
 c1 57                 ldi8	r5, 0x57
 e1 68 02              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 54 02              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+4966
 d4 00                 jmp8	avm_test_main+4968
 d4 00                 jmp8	avm_test_main+4970
 d4 00                 jmp8	avm_test_main+4972
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 21              ldi8	r0, 0x21
 f0 38 00              stsp16	[sp+0x0], r0
 e1 0a 0b              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f0 04 de 9b           ldi16	r0, 0x9bde
 f0 05 57 13           ldi16	r1, 0x1357
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+5036
 d4 00                 jmp8	avm_test_main+5020
 c4 00 01              ldi16	r4, 0x100
 c1 58                 ldi8	r5, 0x58
 e1 20 02              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 0c 02              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+5038
 d4 00                 jmp8	avm_test_main+5040
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 21              ldi8	r0, 0x21
 f0 38 00              stsp16	[sp+0x0], r0
 e1 3d 0b              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 04 b3 a2           ldi16	r0, 0xa2b3
 f0 05 91 40           ldi16	r1, 0x4091
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+5104
 d4 00                 jmp8	avm_test_main+5088
 c4 00 01              ldi16	r4, 0x100
 c1 58                 ldi8	r5, 0x58
 e1 dc 01              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 c8 01              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+5106
 d4 00                 jmp8	avm_test_main+5108
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 21              ldi8	r0, 0x21
 f0 38 00              stsp16	[sp+0x0], r0
 e1 80 0b              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 b3 a2           ldi16	r0, 0xa2b3
 f0 05 91 c0           ldi16	r1, 0xc091
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+5184
 d4 00                 jmp8	avm_test_main+5168
 c4 00 01              ldi16	r4, 0x100
 c1 58                 ldi8	r5, 0x58
 e1 8c 01              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 78 01              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+5186
 d4 00                 jmp8	avm_test_main+5188
 d4 00                 jmp8	avm_test_main+5190
 d4 00                 jmp8	avm_test_main+5192
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 3f              ldi8	r0, 0x3f
 f0 38 00              stsp16	[sp+0x0], r0
 e1 2e 0a              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+5254
 d4 00                 jmp8	avm_test_main+5238
 c4 00 01              ldi16	r4, 0x100
 c1 59                 ldi8	r5, 0x59
 e1 46 01              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 32 01              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+5256
 d4 00                 jmp8	avm_test_main+5258
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 3f              ldi8	r0, 0x3f
 f0 38 00              stsp16	[sp+0x0], r0
 e1 63 0a              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+5319
 d4 00                 jmp8	avm_test_main+5303
 c4 00 01              ldi16	r4, 0x100
 c1 59                 ldi8	r5, 0x59
 e1 05 01              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 f1 00              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+5321
 d4 00                 jmp8	avm_test_main+5323
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 3f              ldi8	r0, 0x3f
 f0 38 00              stsp16	[sp+0x0], r0
 e1 a9 0a              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 82                    and	r4, r6
 87                    and	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	avm_test_main+5379
 d4 00                 jmp8	avm_test_main+5363
 c4 00 01              ldi16	r4, 0x100
 c1 59                 ldi8	r5, 0x59
 e1 c9 00              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 e0 b5 00              jmp16	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+5381
 d4 00                 jmp8	avm_test_main+5383
 d4 00                 jmp8	avm_test_main+5385
 d4 00                 jmp8	avm_test_main+5387
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 40              ldi8	r0, 0x40
 f0 38 00              stsp16	[sp+0x0], r0
 e1 6b 09              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 11                 breq8	avm_test_main+5438
 d4 00                 jmp8	avm_test_main+5423
 c4 00 01              ldi16	r4, 0x100
 c1 5a                 ldi8	r5, 0x5a
 e1 8d 00              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 d4 7a                 jmp8	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+5440
 d4 00                 jmp8	avm_test_main+5442
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 40              ldi8	r0, 0x40
 f0 38 00              stsp16	[sp+0x0], r0
 e1 ab 09              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 10                 breq8	avm_test_main+5492
 d4 00                 jmp8	avm_test_main+5478
 c4 00 01              ldi16	r4, 0x100
 c1 5a                 ldi8	r5, 0x5a
 d5 57                 call8	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 d4 44                 jmp8	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+5494
 d4 00                 jmp8	avm_test_main+5496
 f0 36 54              ldsp16	r6, [sp+0x54]
 f0 37 56              ldsp16	r7, [sp+0x56]
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 35 52              ldsp16	r5, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 00 40              ldi8	r0, 0x40
 f0 38 00              stsp16	[sp+0x0], r0
 e1 fc 09              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 82                    and	r4, r6
 87                    and	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d0 10                 breq8	avm_test_main+5550
 d4 00                 jmp8	avm_test_main+5536
 c4 00 01              ldi16	r4, 0x100
 c1 5a                 ldi8	r5, 0x5a
 d5 1d                 call8	test_line16
 c0 01                 ldi8	r4, 0x1
 f0 3c 80              stsp16	[sp+0x80], r4
 d4 0a                 jmp8	avm_test_main+5560
 d4 00                 jmp8	avm_test_main+5552
 d4 00                 jmp8	avm_test_main+5554
 a0                    xor	r4, r4
 f0 3c 80              stsp16	[sp+0x80], r4
 d4 00                 jmp8	avm_test_main+5560
 f0 34 80              ldsp16	r4, [sp+0x80]
 d6 7f                 adjsp	0x7f
 d6 03                 adjsp	0x3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 0f                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 2d                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 34                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d5 25                 call8	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<test_puts>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_puts+6
 f4 00                 ldsp16	r4, [sp+0x0]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d0 10                 breq8	test_puts+31
 d4 00                 jmp8	test_puts+17
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f4 41                 stsp16	[sp+0x0], r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 d5 05                 call8	test_putc
 d4 e7                 jmp8	test_puts+6
 d6 02                 adjsp	0x2
 ef                    ret

<test_putc>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex16>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 d5 07                 call8	test_hex8
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 03                 call8	test_hex8
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 fa 74                 lsr16i	r4, 0x4
 d5 0f                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d8                 call8	test_putc
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 07                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d0                 call8	test_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex_digit>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 0a                 cmpi.s8	r4, 0xa
 d9 0c                 brsge8	test_hex_digit+29
 d4 00                 jmp8	test_hex_digit+19
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 30                 addi.s8	r4, 0x30
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 0a                 jmp8	test_hex_digit+39
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 37                 addi.s8	r4, 0x37
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_hex_digit+39
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 03                 adjsp	0x3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_muldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d6                 adjsp	-0x2a
 f0 30 35              ldsp16	r0, [sp+0x35]
 f0 31 37              ldsp16	r1, [sp+0x37]
 f0 32 39              ldsp16	r2, [sp+0x39]
 f0 33 3b              ldsp16	r3, [sp+0x3b]
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 f0 00 04              ldi8	r0, 0x4
 f0 12 12              leasp	r2, 0x12
 f4 40                 stsp16	[sp+0x0], r4
 10                    add	r4, r4
 f0 15 22              leasp	r5, 0x22
 14                    add	r5, r4
 f0 11 1a              leasp	r1, 0x1a
 61                    ld16	r4, [r5]
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 38 04              stsp16	[sp+0x4], r0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 6c 93              ld16	r4, [r1+]
 a5                    xor	r5, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e1 bc 09              call16	__avm_mulsi3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 ed d4 20              ld16	r6, [r2+0]
 af                    xor	r7, r7
 f1 22                 mov	r4, r2
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f7 6d                 add32	q3, q1
 f1 14                 mov	r2, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 f0 6d 95              st16	[r2+], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 ca                 brne8	__avm_muldi3+87
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 0a 02              addi.s8	r2, 0x2
 f0 30 04              ldsp16	r0, [sp+0x4]
 f4 b0                 dec16	r0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 d1 9f                 brne8	__avm_muldi3+63
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 d6 2a                 adjsp	0x2a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_udivdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d6                 adjsp	-0x2a
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 34 39              ldsp16	r4, [sp+0x39]
 f0 35 3b              ldsp16	r5, [sp+0x3b]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 35              ldsp16	r2, [sp+0x35]
 f0 33 37              ldsp16	r3, [sp+0x37]
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 69 48              cmp32	q1, q2
 d1 28                 brne8	__avm_udivdi3+87
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 48              cmp32	q1, q2
 d1 1d                 brne8	__avm_udivdi3+87
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3b 24              stsp16	[sp+0x24], r3
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f2 6b                 mov32	q3, q1
 d6 2a                 adjsp	0x2a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 00 40              ldi8	r0, 0x40
 f2 66                 mov32	q1, q2
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 d4 5d                 jmp8	__avm_udivdi3+205
 f7 7e                 sub32	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 69 48              cmp32	q1, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 76                 sub32	q1, q2
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 92                    or	r4, r6
 97                    or	r5, r7
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 da 7b ff              breq16	__avm_udivdi3+72
 f0 38 10              stsp16	[sp+0x10], r0
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f7 65                 add32	q1, q1
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 f7 65                 add32	q1, q1
 f9 41                 or	r2, r0
 f9 65                 or	r3, r1
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 fa 7f                 lsr16i	r4, 0xf
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 c0              cmp32	q3, q0
 f0 30 22              ldsp16	r0, [sp+0x22]
 f0 31 24              ldsp16	r1, [sp+0x24]
 f7 6f                 add32	q3, q3
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f7 6a                 add32	q2, q2
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f7 60                 add32	q0, q0
 f7 65                 add32	q1, q1
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 de 05 ff              brslt16	__avm_udivdi3+112
 f0 69 c8              cmp32	q3, q2
 d8 0f                 bruge8	__avm_udivdi3+383
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 e0 24 ff              jmp16	__avm_udivdi3+163
 f0 69 c8              cmp32	q3, q2
 db eb fe              brne16	__avm_udivdi3+112
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 69 84              cmp32	q2, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 dd d5 fe              bruge16	__avm_udivdi3+112
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 e0 f9 fe              jmp16	__avm_udivdi3+163

<__avm_umoddi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	-0x1a
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 25              ldsp16	r0, [sp+0x25]
 f0 31 27              ldsp16	r1, [sp+0x27]
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 69 08              cmp32	q0, q2
 d1 0c                 brne8	__avm_umoddi3+53
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 da 04 01              breq16	__avm_umoddi3+313
 f0 00 40              ldi8	r0, 0x40
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 d4 3d                 jmp8	__avm_umoddi3+130
 f7 76                 sub32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 61                 mov32	q0, q1
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f0 69 48              cmp32	q1, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 72                 sub32	q0, q2
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 76                 sub32	q1, q2
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 f1 04                 mov	r0, r4
 da a6 00              breq16	__avm_umoddi3+296
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 f7 60                 add32	q0, q0
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 fa 7f                 lsr16i	r4, 0xf
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 69 84              cmp32	q2, q1
 f2 66                 mov32	q1, q2
 f7 65                 add32	q1, q1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f7 6f                 add32	q3, q3
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f7 60                 add32	q0, q0
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 de 57 ff              brslt16	__avm_umoddi3+69
 f0 69 48              cmp32	q1, q2
 d8 09                 bruge8	__avm_umoddi3+252
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 e0 71 ff              jmp16	__avm_umoddi3+109
 f0 69 48              cmp32	q1, q2
 db 43 ff              brne16	__avm_umoddi3+69
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f0 69 40              cmp32	q1, q0
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 dd 25 ff              bruge16	__avm_umoddi3+69
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 e0 45 ff              jmp16	__avm_umoddi3+109
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_divdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ce                 adjsp	-0x32
 f2 63                 mov32	q0, q3
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 36 41              ldsp16	r6, [sp+0x41]
 f0 37 43              ldsp16	r7, [sp+0x43]
 f0 32 3d              ldsp16	r2, [sp+0x3d]
 f0 33 3f              ldsp16	r3, [sp+0x3f]
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d0 1b                 breq8	__avm_divdi3+70
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 40              cmp32	q1, q0
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d9 0f                 brsge8	__avm_divdi3+81
 f2 68                 mov32	q2, q0
 d4 4e                 jmp8	__avm_divdi3+148
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 e0 21 02              jmp16	__avm_divdi3+626
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f0 69 80              cmp32	q2, q0
 f2 68                 mov32	q2, q0
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 78                 sub32	q2, q0
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f7 72                 sub32	q0, q2
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 69 4c              cmp32	q1, q3
 d9 08                 brsge8	__avm_divdi3+167
 f2 63                 mov32	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d4 2d                 jmp8	__avm_divdi3+212
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f7 73                 sub32	q0, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f7 7b                 sub32	q2, q3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 d1 1b                 brne8	__avm_divdi3+272
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f4 1b                 ldsp16	r7, [sp+0x6]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 38                    cmp	r6, r4
 db 40 01              brne16	__avm_divdi3+581
 f2 6b                 mov32	q3, q1
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 e0 62 01              jmp16	__avm_divdi3+626
 c2 40                 ldi8	r6, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 66                 mov32	q1, q2
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 d4 5f                 jmp8	__avm_divdi3+393
 f7 7b                 sub32	q2, q3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f0 69 04              cmp32	q0, q1
 f8 16                 cset.ult	r6
 af                    xor	r7, r7
 f7 7b                 sub32	q2, q3
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 92                    or	r4, r6
 97                    or	r5, r7
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f7 71                 sub32	q0, q1
 f0 38 2a              stsp16	[sp+0x2a], r0
 f0 39 2c              stsp16	[sp+0x2c], r1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 da 6c ff              breq16	__avm_divdi3+245
 f0 3e 18              stsp16	[sp+0x18], r6
 f7 65                 add32	q1, q1
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 6a                 add32	q2, q2
 f9 89                 or	r4, r2
 f9 ad                 or	r5, r3
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 fa 9f                 lsr16i	r6, 0xf
 af                    xor	r7, r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 69 84              cmp32	q2, q1
 f7 6a                 add32	q2, q2
 92                    or	r4, r6
 97                    or	r5, r7
 f7 60                 add32	q0, q0
 f0 38 26              stsp16	[sp+0x26], r0
 f0 39 28              stsp16	[sp+0x28], r1
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 af                    xor	r7, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 f7 6f                 add32	q3, q3
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f0 3f 30              stsp16	[sp+0x30], r7
 f7 65                 add32	q1, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3b 24              stsp16	[sp+0x24], r3
 de 16 ff              brslt16	__avm_divdi3+298
 f0 69 8c              cmp32	q2, q3
 d8 09                 bruge8	__avm_divdi3+546
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 e0 3d ff              jmp16	__avm_divdi3+351
 f0 69 8c              cmp32	q2, q3
 db 02 ff              brne16	__avm_divdi3+298
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f0 69 0c              cmp32	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 dd ee fe              bruge16	__avm_divdi3+298
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 e0 1a ff              jmp16	__avm_divdi3+351
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f0 69 84              cmp32	q2, q1
 f2 6b                 mov32	q3, q1
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f7 7c                 sub32	q3, q0
 f7 76                 sub32	q1, q2
 f2 69                 mov32	q2, q1
 d6 32                 adjsp	0x32
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_moddi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 de                 adjsp	-0x22
 f2 63                 mov32	q0, q3
 f0 32 31              ldsp16	r2, [sp+0x31]
 f0 33 33              ldsp16	r3, [sp+0x33]
 f0 36 2d              ldsp16	r6, [sp+0x2d]
 f0 37 2f              ldsp16	r7, [sp+0x2f]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 62                 breq8	__avm_moddi3+141
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 80              cmp32	q2, q0
 d3 3d                 brslt8	__avm_moddi3+124
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 69 8c              cmp32	q2, q3
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f2 63                 mov32	q0, q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f7 71                 sub32	q0, q1
 f7 7e                 sub32	q3, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 d9 0b                 brsge8	__avm_moddi3+146
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d4 3a                 jmp8	__avm_moddi3+199
 f2 6a                 mov32	q3, q0
 e0 78 01              jmp16	__avm_moddi3+522
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f2 63                 mov32	q0, q3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f7 71                 sub32	q0, q1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 7e                 sub32	q3, q2
 f2 64                 mov32	q1, q0
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 fa 9f                 lsr16i	r6, 0xf
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 2a                 brne8	__avm_moddi3+270
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 a4                 tst8	r4
 db e8 00              brne16	__avm_moddi3+487
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 e0 fc 00              jmp16	__avm_moddi3+522
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 c2 40                 ldi8	r6, 0x40
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 d4 36                 jmp8	__avm_moddi3+352
 f7 76                 sub32	q1, q2
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f0 69 0c              cmp32	q0, q3
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 76                 sub32	q1, q2
 f0 3a 16              stsp16	[sp+0x16], r2
 f0 3b 18              stsp16	[sp+0x18], r3
 f7 73                 sub32	q0, q3
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 08                    mov	r6, r4
 d0 96                 breq8	__avm_moddi3+246
 f0 3e 10              stsp16	[sp+0x10], r6
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 f7 65                 add32	q1, q1
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 fa 7f                 lsr16i	r4, 0xf
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f0 69 4c              cmp32	q1, q3
 f7 65                 add32	q1, q1
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f7 60                 add32	q0, q0
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f7 60                 add32	q0, q0
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 de 6c ff              brslt16	__avm_moddi3+298
 f0 69 48              cmp32	q1, q2
 d8 09                 bruge8	__avm_moddi3+460
 f0 3a 16              stsp16	[sp+0x16], r2
 f0 3b 18              stsp16	[sp+0x18], r3
 e0 7c ff              jmp16	__avm_moddi3+328
 f0 69 48              cmp32	q1, q2
 db 58 ff              brne16	__avm_moddi3+298
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f0 69 0c              cmp32	q0, q3
 dd 4c ff              bruge16	__avm_moddi3+298
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 e0 61 ff              jmp16	__avm_moddi3+328
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 69 48              cmp32	q1, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f7 7c                 sub32	q3, q0
 f7 79                 sub32	q2, q1
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 13              ldsp16	r2, [sp+0x13]
 f0 0e 40              cmpi.s8	r2, 0x40
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d8 58                 bruge8	__avm_ashldi3+112
 f0 0e 20              cmpi.s8	r2, 0x20
 d2 11                 brult8	__avm_ashldi3+46
 f0 0a e0              addi.s8	r2, -0x20
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 5b 01              call16	__avm_ashlsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 42                 jmp8	__avm_ashldi3+112
 f6 2a                 tst16	r2
 d0 38                 breq8	__avm_ashldi3+106
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 3f 01              call16	__avm_ashlsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 20                 ldi8	r4, 0x20
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 54 01              call16	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 1d 01              call16	__avm_ashlsi3
 f2 6b                 mov32	q3, q1
 d4 06                 jmp8	__avm_ashldi3+112
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f2 68                 mov32	q2, q0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_lshrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 17              ldsp16	r2, [sp+0x17]
 f0 0e 40              cmpi.s8	r2, 0x40
 f2 62                 mov32	q0, q2
 d8 68                 bruge8	__avm_lshrdi3+126
 f0 0e 20              cmpi.s8	r2, 0x20
 d2 14                 brult8	__avm_lshrdi3+47
 f0 0a e0              addi.s8	r2, -0x20
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e1 07 01              call16	__avm_lshrsi3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d4 4f                 jmp8	__avm_lshrdi3+126
 f6 2a                 tst16	r2
 d0 45                 breq8	__avm_lshrdi3+120
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6a                 mov32	q3, q0
 e1 e6 00              call16	__avm_lshrsi3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 20                 ldi8	r4, 0x20
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 68                 mov32	q2, q0
 e1 ad 00              call16	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e1 be 00              call16	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 d4 06                 jmp8	__avm_lshrdi3+126
 f2 63                 mov32	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 0c 40              cmpi.s8	r0, 0x40
 d2 0d                 brult8	__avm_ashrdi3+27
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa bf                 asr16i	r4, 0xf
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 63                 jmp8	__avm_ashrdi3+126
 f0 0c 20              cmpi.s8	r0, 0x20
 d2 1e                 brult8	__avm_ashrdi3+62
 f0 08 e0              addi.s8	r0, -0x20
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 67                 mov32	q1, q3
 f2 6a                 mov32	q3, q0
 e1 9f 00              call16	__avm_ashrsi3
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa df                 asr16i	r6, 0xf
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 af                    xor	r7, r7
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 d4 40                 jmp8	__avm_ashrdi3+126
 f6 28                 tst16	r0
 d0 3c                 breq8	__avm_ashrdi3+126
 f1 10                 mov	r2, r0
 f2 4b                 sub	r3, r3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6b                 mov32	q3, q1
 d5 55                 call8	__avm_lshrsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 20                 ldi8	r4, 0x20
 f2 50                 sub	r4, r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f2 69                 mov32	q2, q1
 d5 1d                 call8	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 d5 53                 call8	__avm_ashrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashlsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	__avm_ashlsi3+16
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 11                 jmp8	__avm_ashlsi3+33
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_ashlsi3+33
 f7 6a                 add32	q2, q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_ashlsi3+25
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_lshrsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	__avm_lshrsi3+16
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 11                 jmp8	__avm_lshrsi3+33
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_lshrsi3+33
 f7 82                 lsr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_lshrsi3+25
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_ashrsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d8 0b                 bruge8	__avm_ashrsi3+23
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa bf                 asr16i	r4, 0xf
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d4 11                 jmp8	__avm_ashrsi3+40
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_ashrsi3+40
 f7 86                 asr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_ashrsi3+32
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 68                 stsp16	[sp+0xa], r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fe 26                 mul16	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 2a                 ldsp16	r6, [sp+0xa]
 fe 34                 mul16	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 4a                 stsp16	[sp+0x2], r6
 f1 74                 zext8	r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f3 18                 mulu8.w	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 3b                 mulsu8.w	r6, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 2e                 muls8.w	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f3 32                 mulsu8.w	r4, r6
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 1b                    add	r6, r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa e8                 asr16i	r7, 0x8
 1e                    add	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 18                    add	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 fa 38                 lsl16i	r4, 0x8
 08                    mov	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 33                 ldsp16	r7, [sp+0xc]
 1e                    add	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 38                    cmp	r6, r4
 f8 14                 cset.ult	r4
 f4 29                 ldsp16	r5, [sp+0xa]
 11                    add	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 16                    add	r5, r6
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 32                 ldsp16	r6, [sp+0xc]
 36                    cmp	r5, r6
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
