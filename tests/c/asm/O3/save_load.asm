
save_load.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 save_load.c
00000100 l     O .saved	00000040 saved_state
000008ec l     F .text	00000007 call_save_exists
000008f3 l     F .text	00000007 call_load
000008fa l     F .text	0000033d check_saved
00000c37 l     F .text	00000003 call_save
00000000 l    df *ABS*	00000000 runtime.c
00000c3c l       .init_array	00000000 .hidden __init_array_end
00000c3c l       .init_array	00000000 .hidden __init_array_start
00000c3c l       .fini_array	00000000 .hidden __fini_array_start
00000c3c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000615 avm_test_main
00000c3a g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 1c 0a              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 3c 0c              ldi16	r4, 0xc3c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 3c 0c              ldi16	r6, 0xc3c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 3c 0c           ldi16	r0, 0xc3c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 3c 0c           ldi16	r2, 0xc3c
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
 c4 3c 0c              ldi16	r4, 0xc3c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 3c 0c              ldi16	r6, 0xc3c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 3c 0c           ldi16	r2, 0xc3c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 3c 0c           ldi16	r0, 0xc3c
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
 d6 f0                 adjsp	-0x10
 c4 07 18              ldi16	r4, 0x1807
 c5 2a 3b              ldi16	r5, 0x3b2a
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
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
 f0 07 1c 01           ldi16	r3, 0x11c
 f0 6b 86              st32	[r3], q2
 c4 91 a2              ldi16	r4, 0xa291
 c5 b4 c5              ldi16	r5, 0xc5b4
 f0 06 18 01           ldi16	r2, 0x118
 f0 6b 84              st32	[r2], q2
 c4 4b 5c              ldi16	r4, 0x5c4b
 c5 6e 7f              ldi16	r5, 0x7f6e
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 05 16              ldi16	r4, 0x1605
 c5 28 39              ldi16	r5, 0x3928
 f0 05 10 01           ldi16	r1, 0x110
 f0 6b 82              st32	[r1], q2
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
 f0 04 04 01           ldi16	r0, 0x104
 f0 6b 80              st32	[r0], q2
 c4 ed fe              ldi16	r4, 0xfeed
 c5 10 21              ldi16	r5, 0x2110
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 e1 49 05              call16	call_save_exists
 f4 48                 stsp16	[sp+0x2], r4
 e1 4b 05              call16	call_load
 f4 40                 stsp16	[sp+0x0], r4
 c0 11                 ldi8	r4, 0x11
 e1 4b 05              call16	check_saved
 f4 50                 stsp16	[sp+0x4], r4
 e1 83 08              call16	call_save
 e1 35 05              call16	call_save_exists
 f4 78                 stsp16	[sp+0xe], r4
 c4 f4 05              ldi16	r4, 0x5f4
 c5 17 28              ldi16	r5, 0x2817
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 ae bf              ldi16	r4, 0xbfae
 c5 d1 e2              ldi16	r5, 0xe2d1
 c7 38 01              ldi16	r7, 0x138
 f0 6b 8e              st32	[r7], q2
 c4 68 79              ldi16	r4, 0x7968
 c5 8b 9c              ldi16	r5, 0x9c8b
 c7 34 01              ldi16	r7, 0x134
 f0 6b 8e              st32	[r7], q2
 c4 22 33              ldi16	r4, 0x3322
 c5 45 56              ldi16	r5, 0x5645
 c7 30 01              ldi16	r7, 0x130
 f0 6b 8e              st32	[r7], q2
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
 f0 6b 86              st32	[r3], q2
 c4 7e 8f              ldi16	r4, 0x8f7e
 c5 a1 b2              ldi16	r5, 0xb2a1
 f0 6b 84              st32	[r2], q2
 c4 38 49              ldi16	r4, 0x4938
 c5 5b 6c              ldi16	r5, 0x6c5b
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 f2 03              ldi16	r4, 0x3f2
 c5 15 26              ldi16	r5, 0x2615
 f0 6b 82              st32	[r1], q2
 f0 05 0c 01           ldi16	r1, 0x10c
 c4 ac bd              ldi16	r4, 0xbdac
 c5 cf e0              ldi16	r5, 0xe0cf
 f0 6b 82              st32	[r1], q2
 c4 66 77              ldi16	r4, 0x7766
 c5 89 9a              ldi16	r5, 0x9a89
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 20 31              ldi16	r4, 0x3120
 c5 43 54              ldi16	r5, 0x5443
 f0 6b 80              st32	[r0], q2
 f0 04 00 01           ldi16	r0, 0x100
 c4 da eb              ldi16	r4, 0xebda
 c5 fd 0e              ldi16	r5, 0xefd
 f0 6b 80              st32	[r0], q2
 e1 81 04              call16	call_load
 f4 68                 stsp16	[sp+0xa], r4
 c0 11                 ldi8	r4, 0x11
 e1 81 04              call16	check_saved
 f4 70                 stsp16	[sp+0xc], r4
 f0 02 46              ldi8	r2, 0x46
 f2 4b                 sub	r3, r3
 f1 23                 mov	r4, r3
 c8 6b                 addi.s8	r4, 0x6b
 f0 4c 3f 01           stm8	[0x13f], r4
 f1 23                 mov	r4, r3
 c8 5a                 addi.s8	r4, 0x5a
 f0 4c 3e 01           stm8	[0x13e], r4
 f1 23                 mov	r4, r3
 c8 48                 addi.s8	r4, 0x48
 f0 4c 3d 01           stm8	[0x13d], r4
 f1 23                 mov	r4, r3
 c8 37                 addi.s8	r4, 0x37
 f0 4c 3c 01           stm8	[0x13c], r4
 f1 23                 mov	r4, r3
 c8 25                 addi.s8	r4, 0x25
 f0 4c 3b 01           stm8	[0x13b], r4
 f1 23                 mov	r4, r3
 c8 14                 addi.s8	r4, 0x14
 f0 4c 3a 01           stm8	[0x13a], r4
 f1 23                 mov	r4, r3
 c8 02                 addi.s8	r4, 0x2
 f0 4c 39 01           stm8	[0x139], r4
 f1 23                 mov	r4, r3
 c8 f1                 addi.s8	r4, -0xf
 f0 4c 38 01           stm8	[0x138], r4
 f1 23                 mov	r4, r3
 c8 df                 addi.s8	r4, -0x21
 f0 4c 37 01           stm8	[0x137], r4
 f1 23                 mov	r4, r3
 c8 ce                 addi.s8	r4, -0x32
 f0 4c 36 01           stm8	[0x136], r4
 f1 23                 mov	r4, r3
 c8 bc                 addi.s8	r4, -0x44
 f0 4c 35 01           stm8	[0x135], r4
 f1 23                 mov	r4, r3
 c8 ab                 addi.s8	r4, -0x55
 f0 4c 34 01           stm8	[0x134], r4
 f1 23                 mov	r4, r3
 c8 99                 addi.s8	r4, -0x67
 f0 4c 33 01           stm8	[0x133], r4
 f1 23                 mov	r4, r3
 c8 88                 addi.s8	r4, -0x78
 f0 4c 32 01           stm8	[0x132], r4
 f1 23                 mov	r4, r3
 c8 76                 addi.s8	r4, 0x76
 f0 4c 31 01           stm8	[0x131], r4
 f1 23                 mov	r4, r3
 c8 65                 addi.s8	r4, 0x65
 f0 4c 30 01           stm8	[0x130], r4
 f1 23                 mov	r4, r3
 c8 53                 addi.s8	r4, 0x53
 f0 4c 2f 01           stm8	[0x12f], r4
 f1 23                 mov	r4, r3
 c8 42                 addi.s8	r4, 0x42
 f0 4c 2e 01           stm8	[0x12e], r4
 f1 23                 mov	r4, r3
 c8 30                 addi.s8	r4, 0x30
 f0 4c 2d 01           stm8	[0x12d], r4
 f1 23                 mov	r4, r3
 c8 1f                 addi.s8	r4, 0x1f
 f0 4c 2c 01           stm8	[0x12c], r4
 f1 23                 mov	r4, r3
 c8 0d                 addi.s8	r4, 0xd
 f0 4c 2b 01           stm8	[0x12b], r4
 f1 23                 mov	r4, r3
 c8 fc                 addi.s8	r4, -0x4
 f0 4c 2a 01           stm8	[0x12a], r4
 f1 23                 mov	r4, r3
 c8 ea                 addi.s8	r4, -0x16
 f0 4c 29 01           stm8	[0x129], r4
 f1 23                 mov	r4, r3
 c8 d9                 addi.s8	r4, -0x27
 f0 4c 28 01           stm8	[0x128], r4
 f1 23                 mov	r4, r3
 c8 c7                 addi.s8	r4, -0x39
 f0 4c 27 01           stm8	[0x127], r4
 f1 23                 mov	r4, r3
 c8 b6                 addi.s8	r4, -0x4a
 f0 4c 26 01           stm8	[0x126], r4
 f1 23                 mov	r4, r3
 c8 a4                 addi.s8	r4, -0x5c
 f0 4c 25 01           stm8	[0x125], r4
 f1 23                 mov	r4, r3
 c8 93                 addi.s8	r4, -0x6d
 f0 4c 24 01           stm8	[0x124], r4
 f1 23                 mov	r4, r3
 c8 81                 addi.s8	r4, -0x7f
 f0 4c 23 01           stm8	[0x123], r4
 f1 23                 mov	r4, r3
 c8 70                 addi.s8	r4, 0x70
 f0 4c 22 01           stm8	[0x122], r4
 f1 23                 mov	r4, r3
 c8 5e                 addi.s8	r4, 0x5e
 f0 4c 21 01           stm8	[0x121], r4
 f1 23                 mov	r4, r3
 c8 4d                 addi.s8	r4, 0x4d
 f0 4c 20 01           stm8	[0x120], r4
 f1 23                 mov	r4, r3
 c8 3b                 addi.s8	r4, 0x3b
 f0 4c 1f 01           stm8	[0x11f], r4
 f1 23                 mov	r4, r3
 c8 2a                 addi.s8	r4, 0x2a
 f0 4c 1e 01           stm8	[0x11e], r4
 f1 23                 mov	r4, r3
 c8 18                 addi.s8	r4, 0x18
 f0 4c 1d 01           stm8	[0x11d], r4
 f1 23                 mov	r4, r3
 c8 07                 addi.s8	r4, 0x7
 f0 4c 1c 01           stm8	[0x11c], r4
 f1 23                 mov	r4, r3
 c8 f5                 addi.s8	r4, -0xb
 f0 4c 1b 01           stm8	[0x11b], r4
 f1 23                 mov	r4, r3
 c8 e4                 addi.s8	r4, -0x1c
 f0 4c 1a 01           stm8	[0x11a], r4
 f1 23                 mov	r4, r3
 c8 d2                 addi.s8	r4, -0x2e
 f0 4c 19 01           stm8	[0x119], r4
 f1 23                 mov	r4, r3
 c8 c1                 addi.s8	r4, -0x3f
 f0 4c 18 01           stm8	[0x118], r4
 f1 23                 mov	r4, r3
 c8 af                 addi.s8	r4, -0x51
 f0 4c 17 01           stm8	[0x117], r4
 f1 23                 mov	r4, r3
 c8 9e                 addi.s8	r4, -0x62
 f0 4c 16 01           stm8	[0x116], r4
 f1 23                 mov	r4, r3
 c8 8c                 addi.s8	r4, -0x74
 f0 4c 15 01           stm8	[0x115], r4
 f1 23                 mov	r4, r3
 c8 7b                 addi.s8	r4, 0x7b
 f0 4c 14 01           stm8	[0x114], r4
 f1 23                 mov	r4, r3
 c8 69                 addi.s8	r4, 0x69
 f0 4c 13 01           stm8	[0x113], r4
 f1 23                 mov	r4, r3
 c8 58                 addi.s8	r4, 0x58
 f0 4c 12 01           stm8	[0x112], r4
 f1 23                 mov	r4, r3
 c8 46                 addi.s8	r4, 0x46
 f0 4c 11 01           stm8	[0x111], r4
 f1 23                 mov	r4, r3
 c8 35                 addi.s8	r4, 0x35
 f0 4c 10 01           stm8	[0x110], r4
 f1 23                 mov	r4, r3
 c8 23                 addi.s8	r4, 0x23
 f0 4c 0f 01           stm8	[0x10f], r4
 f1 23                 mov	r4, r3
 c8 12                 addi.s8	r4, 0x12
 f0 4c 0e 01           stm8	[0x10e], r4
 f1 23                 mov	r4, r3
 c8 ef                 addi.s8	r4, -0x11
 f0 4c 0c 01           stm8	[0x10c], r4
 f1 23                 mov	r4, r3
 c8 dd                 addi.s8	r4, -0x23
 f0 4c 0b 01           stm8	[0x10b], r4
 f1 23                 mov	r4, r3
 c8 cc                 addi.s8	r4, -0x34
 f0 4c 0a 01           stm8	[0x10a], r4
 f1 23                 mov	r4, r3
 c8 ba                 addi.s8	r4, -0x46
 f0 4c 09 01           stm8	[0x109], r4
 f1 23                 mov	r4, r3
 c8 a9                 addi.s8	r4, -0x57
 f0 4c 08 01           stm8	[0x108], r4
 f1 23                 mov	r4, r3
 c8 97                 addi.s8	r4, -0x69
 f0 4c 07 01           stm8	[0x107], r4
 f1 23                 mov	r4, r3
 c8 86                 addi.s8	r4, -0x7a
 f0 4c 06 01           stm8	[0x106], r4
 f1 23                 mov	r4, r3
 c8 74                 addi.s8	r4, 0x74
 f0 4c 05 01           stm8	[0x105], r4
 f1 23                 mov	r4, r3
 c8 63                 addi.s8	r4, 0x63
 f0 4c 04 01           stm8	[0x104], r4
 f1 23                 mov	r4, r3
 c8 51                 addi.s8	r4, 0x51
 f0 4c 03 01           stm8	[0x103], r4
 f1 23                 mov	r4, r3
 c8 40                 addi.s8	r4, 0x40
 f0 4c 02 01           stm8	[0x102], r4
 f1 23                 mov	r4, r3
 c8 2e                 addi.s8	r4, 0x2e
 f0 4c 01 01           stm8	[0x101], r4
 f0 4b 0d 01           stm8	[0x10d], r3
 f0 0b 1d              addi.s8	r3, 0x1d
 f0 4b 00 01           stm8	[0x100], r3
 e1 b9 05              call16	call_save
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 db fb fd              brne16	avm_test_main+425
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
 f0 6b 82              st32	[r1], q2
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
 f0 6b 80              st32	[r0], q2
 e1 aa 01              call16	call_save_exists
 f1 04                 mov	r0, r4
 e1 ac 01              call16	call_load
 f4 58                 stsp16	[sp+0x6], r4
 c0 46                 ldi8	r4, 0x46
 e1 ac 01              call16	check_saved
 f4 60                 stsp16	[sp+0x8], r4
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f0 03 01              ldi8	r3, 0x1
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 c0 30                 ldi8	r4, 0x30
 98                    or	r6, r4
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 31 00              ldsp16	r1, [sp+0x0]
 f9 a5                 or	r5, r1
 f9 ae                 xor	r5, r3
 f0 32 04              ldsp16	r2, [sp+0x4]
 f9 a8                 and	r5, r2
 f4 38                 ldsp16	r4, [sp+0xe]
 84                    and	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 84                    and	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 84                    and	r5, r4
 f9 a0                 and	r5, r0
 f4 1b                 ldsp16	r7, [sp+0x6]
 87                    and	r5, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 84                    and	r5, r4
 c6 ff ff              ldi16	r6, 0xffff
 a9                    xor	r6, r5
 f9 2c                 and	r1, r3
 f9 4c                 and	r2, r3
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 ac                 and	r5, r3
 f4 79                 stsp16	[sp+0xe], r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 ac                 and	r5, r3
 f4 69                 stsp16	[sp+0xa], r5
 f4 31                 ldsp16	r5, [sp+0xc]
 f9 ac                 and	r5, r3
 f4 71                 stsp16	[sp+0xc], r5
 f9 0c                 and	r0, r3
 f9 ec                 and	r7, r3
 f4 5b                 stsp16	[sp+0x6], r7
 f9 8c                 and	r4, r3
 f4 60                 stsp16	[sp+0x8], r4
 f9 cc                 and	r6, r3
 c3 30                 ldi8	r7, 0x30
 f9 3d                 or	r1, r7
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
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
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 55                 ldi8	r4, 0x55
 d7 00                 sys	debug_putc
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
 f4 39                 ldsp16	r5, [sp+0xe]
 97                    or	r5, r7
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
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f9 3d                 or	r1, r7
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
 f4 31                 ldsp16	r5, [sp+0xc]
 97                    or	r5, r7
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
 01                    mov	r4, r5
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
 f9 1d                 or	r0, r7
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 f4 19                 ldsp16	r5, [sp+0x6]
 97                    or	r5, r7
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 f4 21                 ldsp16	r5, [sp+0x8]
 97                    or	r5, r7
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
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
 02                    mov	r4, r6
 d6 10                 adjsp	0x10
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

<check_saved>:
 b0                    push16	r0
 c2 1d                 ldi8	r6, 0x1d
 0c                    mov	r7, r4
 f6 3e                 mul8	r7, r6
 f2 30                 sub	r0, r0
 f0 45 00 01           ldm8u	r5, [0x100]
 37                    cmp	r5, r7
 db 29 03              brne16	check_saved+825
 f3 12                 mulu8.w	r4, r6
 04                    mov	r5, r4
 c9 11                 addi.s8	r5, 0x11
 f1 75                 zext8	r5
 f0 46 01 01           ldm8u	r6, [0x101]
 39                    cmp	r6, r5
 db 1a 03              brne16	check_saved+825
 04                    mov	r5, r4
 c9 23                 addi.s8	r5, 0x23
 f1 75                 zext8	r5
 f0 46 02 01           ldm8u	r6, [0x102]
 39                    cmp	r6, r5
 db 0d 03              brne16	check_saved+825
 04                    mov	r5, r4
 c9 34                 addi.s8	r5, 0x34
 f1 75                 zext8	r5
 f0 46 03 01           ldm8u	r6, [0x103]
 39                    cmp	r6, r5
 db 00 03              brne16	check_saved+825
 04                    mov	r5, r4
 c9 46                 addi.s8	r5, 0x46
 f1 75                 zext8	r5
 f0 46 04 01           ldm8u	r6, [0x104]
 39                    cmp	r6, r5
 db f3 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 57                 addi.s8	r5, 0x57
 f1 75                 zext8	r5
 f0 46 05 01           ldm8u	r6, [0x105]
 39                    cmp	r6, r5
 db e6 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 69                 addi.s8	r5, 0x69
 f1 75                 zext8	r5
 f0 46 06 01           ldm8u	r6, [0x106]
 39                    cmp	r6, r5
 db d9 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 7a                 addi.s8	r5, 0x7a
 f1 75                 zext8	r5
 f0 46 07 01           ldm8u	r6, [0x107]
 39                    cmp	r6, r5
 db cc 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 8c                 addi.s8	r5, -0x74
 f1 75                 zext8	r5
 f0 46 08 01           ldm8u	r6, [0x108]
 39                    cmp	r6, r5
 db bf 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 9d                 addi.s8	r5, -0x63
 f1 75                 zext8	r5
 f0 46 09 01           ldm8u	r6, [0x109]
 39                    cmp	r6, r5
 db b2 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 af                 addi.s8	r5, -0x51
 f1 75                 zext8	r5
 f0 46 0a 01           ldm8u	r6, [0x10a]
 39                    cmp	r6, r5
 db a5 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 c0                 addi.s8	r5, -0x40
 f1 75                 zext8	r5
 f0 46 0b 01           ldm8u	r6, [0x10b]
 39                    cmp	r6, r5
 db 98 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 d2                 addi.s8	r5, -0x2e
 f1 75                 zext8	r5
 f0 46 0c 01           ldm8u	r6, [0x10c]
 39                    cmp	r6, r5
 db 8b 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 e3                 addi.s8	r5, -0x1d
 f1 75                 zext8	r5
 f0 46 0d 01           ldm8u	r6, [0x10d]
 39                    cmp	r6, r5
 db 7e 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 f5                 addi.s8	r5, -0xb
 f1 75                 zext8	r5
 f0 46 0e 01           ldm8u	r6, [0x10e]
 39                    cmp	r6, r5
 db 71 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f1 75                 zext8	r5
 f0 46 0f 01           ldm8u	r6, [0x10f]
 39                    cmp	r6, r5
 db 64 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 18                 addi.s8	r5, 0x18
 f1 75                 zext8	r5
 f0 46 10 01           ldm8u	r6, [0x110]
 39                    cmp	r6, r5
 db 57 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 29                 addi.s8	r5, 0x29
 f1 75                 zext8	r5
 f0 46 11 01           ldm8u	r6, [0x111]
 39                    cmp	r6, r5
 db 4a 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 3b                 addi.s8	r5, 0x3b
 f1 75                 zext8	r5
 f0 46 12 01           ldm8u	r6, [0x112]
 39                    cmp	r6, r5
 db 3d 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 4c                 addi.s8	r5, 0x4c
 f1 75                 zext8	r5
 f0 46 13 01           ldm8u	r6, [0x113]
 39                    cmp	r6, r5
 db 30 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 5e                 addi.s8	r5, 0x5e
 f1 75                 zext8	r5
 f0 46 14 01           ldm8u	r6, [0x114]
 39                    cmp	r6, r5
 db 23 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 6f                 addi.s8	r5, 0x6f
 f1 75                 zext8	r5
 f0 46 15 01           ldm8u	r6, [0x115]
 39                    cmp	r6, r5
 db 16 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 81                 addi.s8	r5, -0x7f
 f1 75                 zext8	r5
 f0 46 16 01           ldm8u	r6, [0x116]
 39                    cmp	r6, r5
 db 09 02              brne16	check_saved+825
 04                    mov	r5, r4
 c9 92                 addi.s8	r5, -0x6e
 f1 75                 zext8	r5
 f0 46 17 01           ldm8u	r6, [0x117]
 39                    cmp	r6, r5
 db fc 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 a4                 addi.s8	r5, -0x5c
 f1 75                 zext8	r5
 f0 46 18 01           ldm8u	r6, [0x118]
 39                    cmp	r6, r5
 db ef 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 b5                 addi.s8	r5, -0x4b
 f1 75                 zext8	r5
 f0 46 19 01           ldm8u	r6, [0x119]
 39                    cmp	r6, r5
 db e2 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 c7                 addi.s8	r5, -0x39
 f1 75                 zext8	r5
 f0 46 1a 01           ldm8u	r6, [0x11a]
 39                    cmp	r6, r5
 db d5 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 d8                 addi.s8	r5, -0x28
 f1 75                 zext8	r5
 f0 46 1b 01           ldm8u	r6, [0x11b]
 39                    cmp	r6, r5
 db c8 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 ea                 addi.s8	r5, -0x16
 f1 75                 zext8	r5
 f0 46 1c 01           ldm8u	r6, [0x11c]
 39                    cmp	r6, r5
 db bb 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 fb                 addi.s8	r5, -0x5
 f1 75                 zext8	r5
 f0 46 1d 01           ldm8u	r6, [0x11d]
 39                    cmp	r6, r5
 db ae 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 0d                 addi.s8	r5, 0xd
 f1 75                 zext8	r5
 f0 46 1e 01           ldm8u	r6, [0x11e]
 39                    cmp	r6, r5
 db a1 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 1e                 addi.s8	r5, 0x1e
 f1 75                 zext8	r5
 f0 46 1f 01           ldm8u	r6, [0x11f]
 39                    cmp	r6, r5
 db 94 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 30                 addi.s8	r5, 0x30
 f1 75                 zext8	r5
 f0 46 20 01           ldm8u	r6, [0x120]
 39                    cmp	r6, r5
 db 87 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 41                 addi.s8	r5, 0x41
 f1 75                 zext8	r5
 f0 46 21 01           ldm8u	r6, [0x121]
 39                    cmp	r6, r5
 db 7a 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 53                 addi.s8	r5, 0x53
 f1 75                 zext8	r5
 f0 46 22 01           ldm8u	r6, [0x122]
 39                    cmp	r6, r5
 db 6d 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 64                 addi.s8	r5, 0x64
 f1 75                 zext8	r5
 f0 46 23 01           ldm8u	r6, [0x123]
 39                    cmp	r6, r5
 db 60 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 76                 addi.s8	r5, 0x76
 f1 75                 zext8	r5
 f0 46 24 01           ldm8u	r6, [0x124]
 39                    cmp	r6, r5
 db 53 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 87                 addi.s8	r5, -0x79
 f1 75                 zext8	r5
 f0 46 25 01           ldm8u	r6, [0x125]
 39                    cmp	r6, r5
 db 46 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 99                 addi.s8	r5, -0x67
 f1 75                 zext8	r5
 f0 46 26 01           ldm8u	r6, [0x126]
 39                    cmp	r6, r5
 db 39 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 aa                 addi.s8	r5, -0x56
 f1 75                 zext8	r5
 f0 46 27 01           ldm8u	r6, [0x127]
 39                    cmp	r6, r5
 db 2c 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 bc                 addi.s8	r5, -0x44
 f1 75                 zext8	r5
 f0 46 28 01           ldm8u	r6, [0x128]
 39                    cmp	r6, r5
 db 1f 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 cd                 addi.s8	r5, -0x33
 f1 75                 zext8	r5
 f0 46 29 01           ldm8u	r6, [0x129]
 39                    cmp	r6, r5
 db 12 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 df                 addi.s8	r5, -0x21
 f1 75                 zext8	r5
 f0 46 2a 01           ldm8u	r6, [0x12a]
 39                    cmp	r6, r5
 db 05 01              brne16	check_saved+825
 04                    mov	r5, r4
 c9 f0                 addi.s8	r5, -0x10
 f1 75                 zext8	r5
 f0 46 2b 01           ldm8u	r6, [0x12b]
 39                    cmp	r6, r5
 db f8 00              brne16	check_saved+825
 04                    mov	r5, r4
 c9 02                 addi.s8	r5, 0x2
 f1 75                 zext8	r5
 f0 46 2c 01           ldm8u	r6, [0x12c]
 39                    cmp	r6, r5
 db eb 00              brne16	check_saved+825
 04                    mov	r5, r4
 c9 13                 addi.s8	r5, 0x13
 f1 75                 zext8	r5
 f0 46 2d 01           ldm8u	r6, [0x12d]
 39                    cmp	r6, r5
 db de 00              brne16	check_saved+825
 04                    mov	r5, r4
 c9 25                 addi.s8	r5, 0x25
 f1 75                 zext8	r5
 f0 46 2e 01           ldm8u	r6, [0x12e]
 39                    cmp	r6, r5
 db d1 00              brne16	check_saved+825
 04                    mov	r5, r4
 c9 36                 addi.s8	r5, 0x36
 f1 75                 zext8	r5
 f0 46 2f 01           ldm8u	r6, [0x12f]
 39                    cmp	r6, r5
 db c4 00              brne16	check_saved+825
 04                    mov	r5, r4
 c9 48                 addi.s8	r5, 0x48
 f1 75                 zext8	r5
 f0 46 30 01           ldm8u	r6, [0x130]
 39                    cmp	r6, r5
 db b7 00              brne16	check_saved+825
 04                    mov	r5, r4
 c9 59                 addi.s8	r5, 0x59
 f1 75                 zext8	r5
 f0 46 31 01           ldm8u	r6, [0x131]
 39                    cmp	r6, r5
 db aa 00              brne16	check_saved+825
 04                    mov	r5, r4
 c9 6b                 addi.s8	r5, 0x6b
 f1 75                 zext8	r5
 f0 46 32 01           ldm8u	r6, [0x132]
 39                    cmp	r6, r5
 db 9d 00              brne16	check_saved+825
 04                    mov	r5, r4
 c9 7c                 addi.s8	r5, 0x7c
 f1 75                 zext8	r5
 f0 46 33 01           ldm8u	r6, [0x133]
 39                    cmp	r6, r5
 db 90 00              brne16	check_saved+825
 04                    mov	r5, r4
 c9 8e                 addi.s8	r5, -0x72
 f1 75                 zext8	r5
 f0 46 34 01           ldm8u	r6, [0x134]
 39                    cmp	r6, r5
 db 83 00              brne16	check_saved+825
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 f1 75                 zext8	r5
 f0 46 35 01           ldm8u	r6, [0x135]
 39                    cmp	r6, r5
 d1 77                 brne8	check_saved+825
 04                    mov	r5, r4
 c9 b1                 addi.s8	r5, -0x4f
 f1 75                 zext8	r5
 f0 46 36 01           ldm8u	r6, [0x136]
 39                    cmp	r6, r5
 d1 6b                 brne8	check_saved+825
 04                    mov	r5, r4
 c9 c2                 addi.s8	r5, -0x3e
 f1 75                 zext8	r5
 f0 46 37 01           ldm8u	r6, [0x137]
 39                    cmp	r6, r5
 d1 5f                 brne8	check_saved+825
 04                    mov	r5, r4
 c9 d4                 addi.s8	r5, -0x2c
 f1 75                 zext8	r5
 f0 46 38 01           ldm8u	r6, [0x138]
 39                    cmp	r6, r5
 d1 53                 brne8	check_saved+825
 04                    mov	r5, r4
 c9 e5                 addi.s8	r5, -0x1b
 f1 75                 zext8	r5
 f0 46 39 01           ldm8u	r6, [0x139]
 39                    cmp	r6, r5
 d1 47                 brne8	check_saved+825
 04                    mov	r5, r4
 c9 f7                 addi.s8	r5, -0x9
 f1 75                 zext8	r5
 f0 46 3a 01           ldm8u	r6, [0x13a]
 39                    cmp	r6, r5
 d1 3b                 brne8	check_saved+825
 04                    mov	r5, r4
 c9 08                 addi.s8	r5, 0x8
 f1 75                 zext8	r5
 f0 46 3b 01           ldm8u	r6, [0x13b]
 39                    cmp	r6, r5
 d1 2f                 brne8	check_saved+825
 04                    mov	r5, r4
 c9 1a                 addi.s8	r5, 0x1a
 f1 75                 zext8	r5
 f0 46 3c 01           ldm8u	r6, [0x13c]
 39                    cmp	r6, r5
 d1 23                 brne8	check_saved+825
 04                    mov	r5, r4
 c9 2b                 addi.s8	r5, 0x2b
 f1 75                 zext8	r5
 f0 46 3d 01           ldm8u	r6, [0x13d]
 39                    cmp	r6, r5
 d1 17                 brne8	check_saved+825
 04                    mov	r5, r4
 c9 3d                 addi.s8	r5, 0x3d
 f1 75                 zext8	r5
 f0 46 3e 01           ldm8u	r6, [0x13e]
 39                    cmp	r6, r5
 d1 0b                 brne8	check_saved+825
 c8 4e                 addi.s8	r4, 0x4e
 f1 74                 zext8	r4
 f0 45 3f 01           ldm8u	r5, [0x13f]
 34                    cmp	r5, r4
 f8 00                 cset.eq	r0
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<call_save>:
 d7 2c                 sys	save
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
