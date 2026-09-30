
atomic64.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 atomic64.c
00000387 l     F .text	000000a2 check_store_load
00000429 l     F .text	00000127 check_add
00000550 l     F .text	00000121 check_sub
00000671 l     F .text	0000011a check_and
0000078b l     F .text	00000113 check_or
0000089e l     F .text	00000113 check_xor
000009b1 l     F .text	00000136 check_nand
00000ae7 l     F .text	000001b6 check_compare_exchange
00000c9d l     F .text	000000d2 check_exchange
00000d6f l     F .text	000000d3 check_aligned
00000100 l     O .data	00000008 value
00000108 l     O .data	00000008 aligned_value
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 atomic.c
0000117f l       .init_array	00000000 .hidden __init_array_end
0000117f l       .init_array	00000000 .hidden __init_array_start
0000117f l       .fini_array	00000000 .hidden __fini_array_start
0000117f l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000000b0 avm_test_main
00000e42 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000e53 g     F .text	0000000f __atomic_store
00000e44 g     F .text	0000000f __atomic_load
00000e86 g     F .text	00000053 __atomic_compare_exchange
00000e62 g     F .text	00000024 __atomic_exchange
00000fb1 g     F .text	00000065 __atomic_store_8
00001016 g     F .text	00000169 __atomic_fetch_add_8
00000ed9 g     F .text	000000d8 __atomic_load_8

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
 e1 24 0c              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 7f 11              ldi16	r4, 0x117f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 7f 11              ldi16	r6, 0x117f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 7f 11           ldi16	r0, 0x117f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 7f 11           ldi16	r2, 0x117f
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
 c4 7f 11              ldi16	r4, 0x117f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 7f 11              ldi16	r6, 0x117f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 7f 11           ldi16	r2, 0x117f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 7f 11           ldi16	r0, 0x117f
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
 d6 fc                 adjsp	-0x4
 e1 ab 00              call16	check_store_load
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+18
 d4 00                 jmp8	avm_test_main+11
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 e0 99 00              jmp16	avm_test_main+171
 e1 3d 01              call16	check_add
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+34
 d4 00                 jmp8	avm_test_main+27
 c0 02                 ldi8	r4, 0x2
 f4 48                 stsp16	[sp+0x2], r4
 e0 89 00              jmp16	avm_test_main+171
 e1 54 02              call16	check_sub
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+49
 d4 00                 jmp8	avm_test_main+43
 c0 03                 ldi8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 d4 7a                 jmp8	avm_test_main+171
 e1 66 03              call16	check_and
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+64
 d4 00                 jmp8	avm_test_main+58
 c0 04                 ldi8	r4, 0x4
 f4 48                 stsp16	[sp+0x2], r4
 d4 6b                 jmp8	avm_test_main+171
 e1 71 04              call16	check_or
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+79
 d4 00                 jmp8	avm_test_main+73
 c0 05                 ldi8	r4, 0x5
 f4 48                 stsp16	[sp+0x2], r4
 d4 5c                 jmp8	avm_test_main+171
 e1 75 05              call16	check_xor
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+94
 d4 00                 jmp8	avm_test_main+88
 c0 06                 ldi8	r4, 0x6
 f4 48                 stsp16	[sp+0x2], r4
 d4 4d                 jmp8	avm_test_main+171
 e1 79 06              call16	check_nand
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+109
 d4 00                 jmp8	avm_test_main+103
 c0 07                 ldi8	r4, 0x7
 f4 48                 stsp16	[sp+0x2], r4
 d4 3e                 jmp8	avm_test_main+171
 e1 a0 07              call16	check_compare_exchange
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d0 10                 breq8	avm_test_main+136
 d4 00                 jmp8	avm_test_main+122
 f4 02                 ldsp16	r6, [sp+0x0]
 c0 09                 ldi8	r4, 0x9
 c1 08                 ldi8	r5, 0x8
 ce 01                 cmpi.s8	r6, 0x1
 fb 25                 cmov.eq	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 d4 23                 jmp8	avm_test_main+171
 e1 3b 09              call16	check_exchange
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+151
 d4 00                 jmp8	avm_test_main+145
 c0 0a                 ldi8	r4, 0xa
 f4 48                 stsp16	[sp+0x2], r4
 d4 14                 jmp8	avm_test_main+171
 e1 fe 09              call16	check_aligned
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+166
 d4 00                 jmp8	avm_test_main+160
 c0 0b                 ldi8	r4, 0xb
 f4 48                 stsp16	[sp+0x2], r4
 d4 05                 jmp8	avm_test_main+171
 a0                    xor	r4, r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	avm_test_main+171
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 04                 adjsp	0x4
 ef                    ret

<check_store_load>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d8                 adjsp	-0x28
 f0 06 78 56           ldi16	r2, 0x5678
 f0 07 34 12           ldi16	r3, 0x1234
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f0 04 f0 de           ldi16	r0, 0xdef0
 f0 05 bc 9a           ldi16	r1, 0x9abc
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 d6 fc                 adjsp	-0x4
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 f4 69                 stsp16	[sp+0xa], r5
 c0 08                 ldi8	r4, 0x8
 f4 60                 stsp16	[sp+0x8], r4
 f0 16 24              leasp	r6, 0x24
 e1 76 0a              call16	__atomic_store
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d6 04                 adjsp	0x4
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 16 1c              leasp	r6, 0x1c
 e1 51 0a              call16	__atomic_load
 d6 04                 adjsp	0x4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 d6 28                 adjsp	0x28
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_add>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c0                 adjsp	-0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 c0 20                 ldi8	r4, 0x20
 a5                    xor	r5, r5
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c4 04 01              ldi16	r4, 0x104
 f0 6a 88              ld32	q2, [r4]
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 d4 00                 jmp8	check_add+73
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 f7 6e                 add32	q3, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6b                 mov32	q3, q1
 f7 6e                 add32	q3, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 69 c4              cmp32	q3, q1
 f8 16                 cset.ult	r6
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 3a 38              stsp16	[sp+0x38], r2
 f0 3b 3a              stsp16	[sp+0x3a], r3
 f0 38 3c              stsp16	[sp+0x3c], r0
 f0 39 3e              stsp16	[sp+0x3e], r1
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 c0 08                 ldi8	r4, 0x8
 f0 16 40              leasp	r6, 0x40
 f0 17 38              leasp	r7, 0x38
 e1 a9 09              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f1 04                 mov	r0, r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 a0                 tst8	r0
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 da 6c ff              breq16	check_add+73
 d4 00                 jmp8	check_add+223
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f0 04 78 56           ldi16	r0, 0x5678
 f0 05 34 12           ldi16	r1, 0x1234
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 f0 de           ldi16	r0, 0xdef0
 f0 05 bc 9a           ldi16	r1, 0x9abc
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 d6 40                 adjsp	0x40
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_sub>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c4                 adjsp	-0x3c
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 c0 10                 ldi8	r4, 0x10
 a5                    xor	r5, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 04 01              ldi16	r4, 0x104
 f0 6a 88              ld32	q2, [r4]
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 d4 00                 jmp8	check_sub+71
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 f7 7e                 sub32	q3, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 69 48              cmp32	q1, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6b                 mov32	q3, q1
 f7 7e                 sub32	q3, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f0 38 38              stsp16	[sp+0x38], r0
 f0 39 3a              stsp16	[sp+0x3a], r1
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 c0 08                 ldi8	r4, 0x8
 f0 16 3c              leasp	r6, 0x3c
 f0 17 34              leasp	r7, 0x34
 e1 88 08              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f1 04                 mov	r0, r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 a0                 tst8	r0
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 da 70 ff              breq16	check_sub+71
 d4 00                 jmp8	check_sub+217
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f0 04 78 56           ldi16	r0, 0x5678
 f0 05 34 12           ldi16	r1, 0x1234
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 10 df           ldi16	r0, 0xdf10
 f0 05 bc 9a           ldi16	r1, 0x9abc
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_and>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c4                 adjsp	-0x3c
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 c4 f0 ff              ldi16	r4, 0xfff0
 c5 ff ff              ldi16	r5, 0xffff
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 04 01              ldi16	r4, 0x104
 f0 6a 88              ld32	q2, [r4]
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 d4 00                 jmp8	check_and+78
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 88                    and	r6, r4
 8d                    and	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6a                 mov32	q3, q0
 88                    and	r6, r4
 8d                    and	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f0 38 38              stsp16	[sp+0x38], r0
 f0 39 3a              stsp16	[sp+0x3a], r1
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 c0 08                 ldi8	r4, 0x8
 f0 16 3c              leasp	r6, 0x3c
 f0 17 34              leasp	r7, 0x34
 e1 6e 07              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f1 04                 mov	r0, r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 a0                 tst8	r0
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 da 7e ff              breq16	check_and+78
 d4 00                 jmp8	check_and+210
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f0 04 78 56           ldi16	r0, 0x5678
 f0 05 34 12           ldi16	r1, 0x1234
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 00 df           ldi16	r0, 0xdf00
 f0 05 bc 9a           ldi16	r1, 0x9abc
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_or>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c4                 adjsp	-0x3c
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 04 01              ldi16	r4, 0x104
 f0 6a 88              ld32	q2, [r4]
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 d4 00                 jmp8	check_or+71
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6a                 mov32	q3, q0
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f0 38 38              stsp16	[sp+0x38], r0
 f0 39 3a              stsp16	[sp+0x3a], r1
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 c0 08                 ldi8	r4, 0x8
 f0 16 3c              leasp	r6, 0x3c
 f0 17 34              leasp	r7, 0x34
 e1 5b 06              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f1 04                 mov	r0, r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 a0                 tst8	r0
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 da 7e ff              breq16	check_or+71
 d4 00                 jmp8	check_or+203
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f0 04 78 56           ldi16	r0, 0x5678
 f0 05 34 12           ldi16	r1, 0x1234
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 00 df           ldi16	r0, 0xdf00
 f0 05 bc 9a           ldi16	r1, 0x9abc
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_xor>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c4                 adjsp	-0x3c
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 04 01              ldi16	r4, 0x104
 f0 6a 88              ld32	q2, [r4]
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 d4 00                 jmp8	check_xor+71
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6a                 mov32	q3, q0
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f0 38 38              stsp16	[sp+0x38], r0
 f0 39 3a              stsp16	[sp+0x3a], r1
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 c0 08                 ldi8	r4, 0x8
 f0 16 3c              leasp	r6, 0x3c
 f0 17 34              leasp	r7, 0x34
 e1 48 05              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f1 04                 mov	r0, r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 a0                 tst8	r0
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 da 7e ff              breq16	check_xor+71
 d4 00                 jmp8	check_xor+203
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f0 04 78 56           ldi16	r0, 0x5678
 f0 05 34 12           ldi16	r1, 0x1234
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 03 df           ldi16	r0, 0xdf03
 f0 05 bc 9a           ldi16	r1, 0x9abc
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_nand>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 bc                 adjsp	-0x44
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 32              ldsp16	r5, [sp+0x32]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c4 04 01              ldi16	r4, 0x104
 f0 6a 88              ld32	q2, [r4]
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 d4 00                 jmp8	check_nand+74
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f2 69                 mov32	q2, q1
 82                    and	r4, r6
 87                    and	r5, r7
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 82                    and	r4, r6
 87                    and	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3a 3c              stsp16	[sp+0x3c], r2
 f0 3b 3e              stsp16	[sp+0x3e], r3
 f0 38 40              stsp16	[sp+0x40], r0
 f0 39 42              stsp16	[sp+0x42], r1
 f0 3e 34              stsp16	[sp+0x34], r6
 f0 3f 36              stsp16	[sp+0x36], r7
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 c0 08                 ldi8	r4, 0x8
 f0 16 44              leasp	r6, 0x44
 f0 17 3c              leasp	r7, 0x3c
 e1 16 04              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f1 04                 mov	r0, r4
 f0 34 40              ldsp16	r4, [sp+0x40]
 f0 35 42              ldsp16	r5, [sp+0x42]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 a0                 tst8	r0
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 da 60 ff              breq16	check_nand+74
 d4 00                 jmp8	check_nand+236
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 f0 04 78 56           ldi16	r0, 0x5678
 f0 05 34 12           ldi16	r1, 0x1234
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 04 02 df           ldi16	r0, 0xdf02
 f0 05 bc 9a           ldi16	r1, 0x9abc
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 d6 44                 adjsp	0x44
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_compare_exchange>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 b0                 adjsp	-0x50
 c4 87 a9              ldi16	r4, 0xa987
 c5 cb ed              ldi16	r5, 0xedcb
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 c4 fd 20              ldi16	r4, 0x20fd
 c5 43 65              ldi16	r5, 0x6543
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 32 2a              ldsp16	r2, [sp+0x2a]
 f0 33 2c              ldsp16	r3, [sp+0x2c]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f0 3a 3c              stsp16	[sp+0x3c], r2
 f0 3b 3e              stsp16	[sp+0x3e], r3
 f0 38 38              stsp16	[sp+0x38], r0
 f0 39 3a              stsp16	[sp+0x3a], r1
 f0 3e 34              stsp16	[sp+0x34], r6
 f0 3f 36              stsp16	[sp+0x36], r7
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 c0 08                 ldi8	r4, 0x8
 f0 16 40              leasp	r6, 0x40
 f0 17 38              leasp	r7, 0x38
 e1 25 03              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 04                    mov	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 a4                 tst8	r4
 d1 19                 brne8	check_compare_exchange+178
 d4 00                 jmp8	check_compare_exchange+155
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 d4 00                 jmp8	check_compare_exchange+178
 f0 34 12              ldsp16	r4, [sp+0x12]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f0 2c 1d              stsp8	[sp+0x1d], r4
 f0 1c 1d              ldsp8u	r4, [sp+0x1d]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 0a                 brne8	check_compare_exchange+205
 d4 00                 jmp8	check_compare_exchange+197
 c0 01                 ldi8	r4, 0x1
 f0 3c 2e              stsp16	[sp+0x2e], r4
 e0 df 00              jmp16	check_compare_exchange+428
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 3c 19              stsp16	[sp+0x19], r4
 f0 3d 1b              stsp16	[sp+0x1b], r5
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f0 3c 15              stsp16	[sp+0x15], r4
 f0 3d 17              stsp16	[sp+0x17], r5
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 32 2a              ldsp16	r2, [sp+0x2a]
 f0 33 2c              ldsp16	r3, [sp+0x2c]
 f0 34 15              ldsp16	r4, [sp+0x15]
 f0 35 17              ldsp16	r5, [sp+0x17]
 f0 36 19              ldsp16	r6, [sp+0x19]
 f0 37 1b              ldsp16	r7, [sp+0x1b]
 f0 3a 4c              stsp16	[sp+0x4c], r2
 f0 3b 4e              stsp16	[sp+0x4e], r3
 f0 38 48              stsp16	[sp+0x48], r0
 f0 39 4a              stsp16	[sp+0x4a], r1
 f0 3e 44              stsp16	[sp+0x44], r6
 f0 3f 46              stsp16	[sp+0x46], r7
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 3d 42              stsp16	[sp+0x42], r5
 d6 f8                 adjsp	-0x8
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 c0 08                 ldi8	r4, 0x8
 f0 16 50              leasp	r6, 0x50
 f0 17 48              leasp	r7, 0x48
 e1 67 02              call16	__atomic_compare_exchange
 d6 08                 adjsp	0x8
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 36 48              ldsp16	r6, [sp+0x48]
 f0 37 4a              ldsp16	r7, [sp+0x4a]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 04                    mov	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 a4                 tst8	r4
 d1 18                 brne8	check_compare_exchange+365
 d4 00                 jmp8	check_compare_exchange+343
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 d4 00                 jmp8	check_compare_exchange+365
 f4 20                 ldsp16	r4, [sp+0x8]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f0 2c 14              stsp8	[sp+0x14], r4
 f0 1c 14              ldsp8u	r4, [sp+0x14]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 22                 brne8	check_compare_exchange+415
 d4 00                 jmp8	check_compare_exchange+383
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 09                 breq8	check_compare_exchange+422
 d4 00                 jmp8	check_compare_exchange+415
 c0 02                 ldi8	r4, 0x2
 f0 3c 2e              stsp16	[sp+0x2e], r4
 d4 06                 jmp8	check_compare_exchange+428
 a0                    xor	r4, r4
 f0 3c 2e              stsp16	[sp+0x2e], r4
 d4 00                 jmp8	check_compare_exchange+428
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d6 50                 adjsp	0x50
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_exchange>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ce                 adjsp	-0x32
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 c0 0b                 ldi8	r4, 0xb
 a5                    xor	r5, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 d6 fc                 adjsp	-0x4
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 c0 08                 ldi8	r4, 0x8
 f0 16 26              leasp	r6, 0x26
 f0 17 1e              leasp	r7, 0x1e
 e1 7d 01              call16	__atomic_exchange
 d6 04                 adjsp	0x4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 02 07              ldi8	r2, 0x7
 f2 4b                 sub	r3, r3
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 98                    or	r6, r4
 9d                    or	r7, r5
 c0 01                 ldi8	r4, 0x1
 f0 69 c0              cmp32	q3, q0
 f4 40                 stsp16	[sp+0x0], r4
 d1 4a                 brne8	check_exchange+198
 d4 00                 jmp8	check_exchange+126
 d6 fc                 adjsp	-0x4
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c5 00 01              ldi16	r5, 0x100
 c0 08                 ldi8	r4, 0x8
 f0 16 2e              leasp	r6, 0x2e
 e1 15 01              call16	__atomic_load
 d6 04                 adjsp	0x4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 00 0b              ldi8	r0, 0xb
 f2 39                 sub	r1, r1
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	check_exchange+198
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 32                 adjsp	0x32
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_aligned>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 02 05              ldi8	r2, 0x5
 f2 4b                 sub	r3, r3
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 d6 f4                 adjsp	-0xc
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 08 01              ldi16	r4, 0x108
 f4 70                 stsp16	[sp+0xc], r4
 e1 03 02              call16	__atomic_store_8
 d6 0c                 adjsp	0xc
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 d6 f4                 adjsp	-0xc
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 e1 36 02              call16	__atomic_fetch_add_8
 d6 0c                 adjsp	0xc
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 98                    or	r6, r4
 9d                    or	r7, r5
 c0 01                 ldi8	r4, 0x1
 f0 69 c0              cmp32	q3, q0
 f4 48                 stsp16	[sp+0x2], r4
 d1 31                 brne8	check_aligned+199
 d4 00                 jmp8	check_aligned+152
 c4 08 01              ldi16	r4, 0x108
 c2 05                 ldi8	r6, 0x5
 af                    xor	r7, r7
 e1 c9 00              call16	__atomic_load_8
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	check_aligned+199
 f4 08                 ldsp16	r4, [sp+0x2]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__atomic_load>:
 f6 2c                 tst16	r4
 d0 0a                 breq8	__atomic_load+14
 f7 0f                 ld8u	r7, [r5+]
 f6 17                 st8	[r6+], r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	__atomic_load+4
 ef                    ret

<__atomic_store>:
 f6 2c                 tst16	r4
 d0 0a                 breq8	__atomic_store+14
 f7 17                 ld8u	r7, [r6+]
 f6 0f                 st8	[r5+], r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	__atomic_store+4
 ef                    ret

<__atomic_exchange>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d0 19                 breq8	__atomic_exchange+32
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 f0 6c 41              ld8u	r2, [r0+]
 f6 1a                 st8	[r7+], r2
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f5                 brne8	__atomic_exchange+11
 f7 17                 ld8u	r7, [r6+]
 f6 0f                 st8	[r5+], r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	__atomic_exchange+22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<__atomic_compare_exchange>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 04                 mov	r0, r4
 c0 01                 ldi8	r4, 0x1
 f6 28                 tst16	r0
 d0 3e                 breq8	__atomic_compare_exchange+76
 f4 49                 stsp16	[sp+0x2], r5
 f4 42                 stsp16	[sp+0x0], r6
 f1 16                 mov	r2, r6
 f1 18                 mov	r3, r0
 41                    ld8u	r4, [r5]
 f4 50                 stsp16	[sp+0x4], r4
 ed 84 20              ld8u	r4, [r2+0]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f5 0c                 cmp	r1, r4
 d1 1a                 brne8	__atomic_compare_exchange+61
 f4 aa                 inc16	r2
 f4 ad                 inc16	r5
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 e9                 brne8	__atomic_compare_exchange+22
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 1c                 ld8u	r4, [r7+]
 f6 0c                 st8	[r5+], r4
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 f6                 brne8	__atomic_compare_exchange+47
 c0 01                 ldi8	r4, 0x1
 d4 0f                 jmp8	__atomic_compare_exchange+76
 a0                    xor	r4, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f7 17                 ld8u	r7, [r6+]
 f6 0f                 st8	[r5+], r7
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 f6                 brne8	__atomic_compare_exchange+66
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__atomic_load_8>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 44                    ld8u	r5, [r4]
 f4 69                 stsp16	[sp+0xa], r5
 f0 2d 15              stsp8	[sp+0x15], r5
 f2 39                 sub	r1, r1
 ed a8 21              ld8u	r5, [r4+1]
 af                    xor	r7, r7
 f9 e4                 and	r7, r1
 f0 2d 14              stsp8	[sp+0x14], r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 58                 lsl16i	r6, 0x8
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 fa 48                 lsl16i	r5, 0x8
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 ed a8 22              ld8u	r5, [r4+2]
 f0 2d 13              stsp8	[sp+0x13], r5
 ed c8 23              ld8u	r6, [r4+3]
 f0 2e 12              stsp8	[sp+0x12], r6
 f1 05                 mov	r0, r5
 f0 02 ff              ldi8	r2, 0xff
 f9 08                 and	r0, r2
 f1 08                 mov	r1, r0
 f2 30                 sub	r0, r0
 fa 58                 lsl16i	r6, 0x8
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 ed 48 24              ld8u	r2, [r4+4]
 f0 2a 11              stsp8	[sp+0x11], r2
 ed a8 25              ld8u	r5, [r4+5]
 f4 40                 stsp16	[sp+0x0], r4
 af                    xor	r7, r7
 f2 39                 sub	r1, r1
 f9 e4                 and	r7, r1
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 2d 10              stsp8	[sp+0x10], r5
 fa 58                 lsl16i	r6, 0x8
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 fa 48                 lsl16i	r5, 0x8
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f4 29                 ldsp16	r5, [sp+0xa]
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 ed a8 26              ld8u	r5, [r4+6]
 f1 6d                 stsp8	[sp+0xf], r5
 09                    mov	r6, r5
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f9 c8                 and	r6, r2
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 88 27              ld8u	r4, [r4+7]
 f1 68                 stsp8	[sp+0xe], r4
 f1 1e                 mov	r3, r6
 f2 42                 sub	r2, r2
 fa 38                 lsl16i	r4, 0x8
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 98                    or	r6, r4
 9d                    or	r7, r5
 f2 68                 mov32	q2, q0
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__atomic_store_8>:
 d6 f0                 adjsp	-0x10
 f0 36 13              ldsp16	r6, [sp+0x13]
 f0 37 15              ldsp16	r7, [sp+0x15]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 6e                 stsp8	[sp+0xf], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f1 69                 stsp8	[sp+0xe], r5
 f0 36 17              ldsp16	r6, [sp+0x17]
 f0 37 19              ldsp16	r7, [sp+0x19]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f1 5e                 stsp8	[sp+0xb], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f1 59                 stsp8	[sp+0xa], r5
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 06                    mov	r5, r6
 f1 65                 stsp8	[sp+0xd], r5
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 f1 61                 stsp8	[sp+0xc], r5
 f4 1b                 ldsp16	r7, [sp+0x6]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 06                    mov	r5, r6
 f1 55                 stsp8	[sp+0x9], r5
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 f1 51                 stsp8	[sp+0x8], r5
 f3 7d                 ldsp8u	r5, [sp+0xf]
 51                    st8	[r4], r5
 f3 79                 ldsp8u	r5, [sp+0xe]
 ee a8 21              st8	[r4+1], r5
 f3 75                 ldsp8u	r5, [sp+0xd]
 ee a8 22              st8	[r4+2], r5
 f3 71                 ldsp8u	r5, [sp+0xc]
 ee a8 23              st8	[r4+3], r5
 f3 6d                 ldsp8u	r5, [sp+0xb]
 ee a8 24              st8	[r4+4], r5
 f3 69                 ldsp8u	r5, [sp+0xa]
 ee a8 25              st8	[r4+5], r5
 f3 65                 ldsp8u	r5, [sp+0x9]
 ee a8 26              st8	[r4+6], r5
 f3 61                 ldsp8u	r5, [sp+0x8]
 ee a8 27              st8	[r4+7], r5
 d6 10                 adjsp	0x10
 ef                    ret

<__atomic_fetch_add_8>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f0 36 33              ldsp16	r6, [sp+0x33]
 f0 37 35              ldsp16	r7, [sp+0x35]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 36 2f              ldsp16	r6, [sp+0x2f]
 f0 37 31              ldsp16	r7, [sp+0x31]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 44                    ld8u	r5, [r4]
 f4 59                 stsp16	[sp+0x6], r5
 f0 2d 23              stsp8	[sp+0x23], r5
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 ed a8 21              ld8u	r5, [r4+1]
 f2 39                 sub	r1, r1
 f9 3c                 and	r1, r7
 f2 67                 mov32	q1, q3
 f0 2d 22              stsp8	[sp+0x22], r5
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 58                 lsl16i	r6, 0x8
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 fa 48                 lsl16i	r5, 0x8
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 ed a8 22              ld8u	r5, [r4+2]
 f0 2d 21              stsp8	[sp+0x21], r5
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 ed a8 23              ld8u	r5, [r4+3]
 f0 2d 20              stsp8	[sp+0x20], r5
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 fa 48                 lsl16i	r5, 0x8
 f1 1d                 mov	r3, r5
 f2 42                 sub	r2, r2
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f9 41                 or	r2, r0
 f9 65                 or	r3, r1
 f4 19                 ldsp16	r5, [sp+0x6]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f9 c9                 or	r6, r2
 f9 ed                 or	r7, r3
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 ed 08 24              ld8u	r0, [r4+4]
 f0 28 1f              stsp8	[sp+0x1f], r0
 ed a8 25              ld8u	r5, [r4+5]
 f4 68                 stsp16	[sp+0xa], r4
 af                    xor	r7, r7
 f2 4b                 sub	r3, r3
 f9 ec                 and	r7, r3
 f0 2d 1e              stsp8	[sp+0x1e], r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 58                 lsl16i	r6, 0x8
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 fa 48                 lsl16i	r5, 0x8
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 ed 88 26              ld8u	r4, [r4+6]
 f0 2c 1d              stsp8	[sp+0x1d], r4
 08                    mov	r6, r4
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 f0 00 ff              ldi8	r0, 0xff
 f2 39                 sub	r1, r1
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f9 c0                 and	r6, r0
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 ed cc 27              ld8u	r6, [r6+7]
 f4 52                 stsp16	[sp+0x4], r6
 fa 58                 lsl16i	r6, 0x8
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 69                 add32	q2, q1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 69 84              cmp32	q2, q1
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 6c                 add32	q3, q0
 f7 6e                 add32	q3, q2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 1c              stsp8	[sp+0x1c], r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 2e 1b              stsp8	[sp+0x1b], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 2c 1a              stsp8	[sp+0x1a], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 08                    mov	r6, r4
 f0 2e 19              stsp8	[sp+0x19], r6
 fa 78                 lsr16i	r4, 0x8
 f0 2c 18              stsp8	[sp+0x18], r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 2e 17              stsp8	[sp+0x17], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 2c 16              stsp8	[sp+0x16], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 08                    mov	r6, r4
 f0 2e 15              stsp8	[sp+0x15], r6
 fa 78                 lsr16i	r4, 0x8
 f0 2c 14              stsp8	[sp+0x14], r4
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
 f4 29                 ldsp16	r5, [sp+0xa]
 54                    st8	[r5], r4
 f0 1c 1a              ldsp8u	r4, [sp+0x1a]
 ee 8a 21              st8	[r5+1], r4
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 ee 8a 22              st8	[r5+2], r4
 f0 1c 18              ldsp8u	r4, [sp+0x18]
 ee 8a 23              st8	[r5+3], r4
 f0 1c 17              ldsp8u	r4, [sp+0x17]
 ee 8a 24              st8	[r5+4], r4
 f0 1c 16              ldsp8u	r4, [sp+0x16]
 ee 8a 25              st8	[r5+5], r4
 f0 1c 15              ldsp8u	r4, [sp+0x15]
 ee 8a 26              st8	[r5+6], r4
 f0 1c 14              ldsp8u	r4, [sp+0x14]
 ee 8a 27              st8	[r5+7], r4
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
