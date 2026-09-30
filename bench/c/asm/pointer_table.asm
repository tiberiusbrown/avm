
pointer_table.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 pointer_table.c
00000100 l     O .data	000000c0 rows
000001c0 l     O .data	00000010 row_pointers
000001d0 l     O .data	00000002 pointer_table_result
00000000 l    df *ABS*	00000000 runtime.c
000005aa l       .init_array	00000000 .hidden __init_array_end
000005aa l       .init_array	00000000 .hidden __init_array_start
000005aa l       .fini_array	00000000 .hidden __fini_array_start
000005aa l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000002e1 avm_test_main
000005a8 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 8a 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 aa 05              ldi16	r4, 0x5aa
 c1 00                 ldi8	r5, 0x0
 c6 aa 05              ldi16	r6, 0x5aa
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 aa 05           ldi16	r0, 0x5aa
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 aa 05           ldi16	r2, 0x5aa
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 aa 05              ldi16	r4, 0x5aa
 c1 00                 ldi8	r5, 0x0
 c6 aa 05              ldi16	r6, 0x5aa
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 aa 05           ldi16	r2, 0x5aa
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 aa 05           ldi16	r0, 0x5aa
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
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
 c4 8c 93              ldi16	r4, 0x938c
 c5 9a a1              ldi16	r5, 0xa19a
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 70 77              ldi16	r4, 0x7770
 c5 7e 85              ldi16	r5, 0x857e
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 54 5b              ldi16	r4, 0x5b54
 c5 62 69              ldi16	r5, 0x6962
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 38 3f              ldi16	r4, 0x3f38
 c5 46 4d              ldi16	r5, 0x4d46
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 1c 23              ldi16	r4, 0x231c
 c5 2a 31              ldi16	r5, 0x312a
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 ab b2              ldi16	r4, 0xb2ab
 c5 b9 c0              ldi16	r5, 0xc0b9
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 8f 96              ldi16	r4, 0x968f
 c5 9d a4              ldi16	r5, 0xa49d
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 73 7a              ldi16	r4, 0x7a73
 c5 81 88              ldi16	r5, 0x8881
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 57 5e              ldi16	r4, 0x5e57
 c5 65 6c              ldi16	r5, 0x6c65
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 3b 42              ldi16	r4, 0x423b
 c5 49 50              ldi16	r5, 0x5049
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 ca d1              ldi16	r4, 0xd1ca
 c5 d8 df              ldi16	r5, 0xdfd8
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 ae b5              ldi16	r4, 0xb5ae
 c5 bc c3              ldi16	r5, 0xc3bc
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c4 92 99              ldi16	r4, 0x9992
 c5 a0 a7              ldi16	r5, 0xa7a0
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 76 7d              ldi16	r4, 0x7d76
 c5 84 8b              ldi16	r5, 0x8b84
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 5a 61              ldi16	r4, 0x615a
 c5 68 6f              ldi16	r5, 0x6f68
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 00 07              ldi16	r4, 0x700
 c5 0e 15              ldi16	r5, 0x150e
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 c4 1f 26              ldi16	r4, 0x261f
 c5 2d 34              ldi16	r5, 0x342d
 c7 18 01              ldi16	r7, 0x118
 f0 6b 8e              st32	[r7], q2
 f0 04 3e 45           ldi16	r0, 0x453e
 f0 05 4c 53           ldi16	r1, 0x534c
 c5 30 01              ldi16	r5, 0x130
 f0 6b 0a              st32	[r5], q0
 f0 5e c0 01           stm16	[0x1c0], r6
 c6 48 01              ldi16	r6, 0x148
 f0 5e c2 01           stm16	[0x1c2], r6
 c4 90 01              ldi16	r4, 0x190
 f0 5c c4 01           stm16	[0x1c4], r4
 f0 5f c6 01           stm16	[0x1c6], r7
 f0 04 e9 f0           ldi16	r0, 0xf0e9
 f0 05 f7 fe           ldi16	r1, 0xfef7
 c7 5c 01              ldi16	r7, 0x15c
 f0 6b 0e              st32	[r7], q0
 f0 04 cd d4           ldi16	r0, 0xd4cd
 f0 05 db e2           ldi16	r1, 0xe2db
 c7 58 01              ldi16	r7, 0x158
 f0 6b 0e              st32	[r7], q0
 f0 04 b1 b8           ldi16	r0, 0xb8b1
 f0 05 bf c6           ldi16	r1, 0xc6bf
 c7 54 01              ldi16	r7, 0x154
 f0 6b 0e              st32	[r7], q0
 f0 04 95 9c           ldi16	r0, 0x9c95
 f0 05 a3 aa           ldi16	r1, 0xaaa3
 c7 50 01              ldi16	r7, 0x150
 f0 6b 0e              st32	[r7], q0
 f0 04 79 80           ldi16	r0, 0x8079
 f0 05 87 8e           ldi16	r1, 0x8e87
 c7 4c 01              ldi16	r7, 0x14c
 f0 6b 0e              st32	[r7], q0
 f0 04 5d 64           ldi16	r0, 0x645d
 f0 05 6b 72           ldi16	r1, 0x726b
 f0 6b 0c              st32	[r6], q0
 c6 60 01              ldi16	r6, 0x160
 f0 5e c8 01           stm16	[0x1c8], r6
 f0 04 08 0f           ldi16	r0, 0xf08
 f0 05 16 1d           ldi16	r1, 0x1d16
 c7 74 01              ldi16	r7, 0x174
 f0 6b 0e              st32	[r7], q0
 f0 04 ec f3           ldi16	r0, 0xf3ec
 f0 05 fa 01           ldi16	r1, 0x1fa
 c7 70 01              ldi16	r7, 0x170
 f0 6b 0e              st32	[r7], q0
 f0 04 d0 d7           ldi16	r0, 0xd7d0
 f0 05 de e5           ldi16	r1, 0xe5de
 c7 6c 01              ldi16	r7, 0x16c
 f0 6b 0e              st32	[r7], q0
 f0 04 b4 bb           ldi16	r0, 0xbbb4
 f0 05 c2 c9           ldi16	r1, 0xc9c2
 c7 68 01              ldi16	r7, 0x168
 f0 6b 0e              st32	[r7], q0
 f0 04 98 9f           ldi16	r0, 0x9f98
 f0 05 a6 ad           ldi16	r1, 0xada6
 c7 64 01              ldi16	r7, 0x164
 f0 6b 0e              st32	[r7], q0
 f0 04 7c 83           ldi16	r0, 0x837c
 f0 05 8a 91           ldi16	r1, 0x918a
 f0 6b 0c              st32	[r6], q0
 c6 a8 01              ldi16	r6, 0x1a8
 f0 5e ca 01           stm16	[0x1ca], r6
 f0 04 27 2e           ldi16	r0, 0x2e27
 f0 05 35 3c           ldi16	r1, 0x3c35
 c7 8c 01              ldi16	r7, 0x18c
 f0 6b 0e              st32	[r7], q0
 f0 04 0b 12           ldi16	r0, 0x120b
 f0 05 19 20           ldi16	r1, 0x2019
 c7 88 01              ldi16	r7, 0x188
 f0 6b 0e              st32	[r7], q0
 f0 04 ef f6           ldi16	r0, 0xf6ef
 f0 05 fd 04           ldi16	r1, 0x4fd
 c7 84 01              ldi16	r7, 0x184
 f0 6b 0e              st32	[r7], q0
 f0 04 d3 da           ldi16	r0, 0xdad3
 f0 05 e1 e8           ldi16	r1, 0xe8e1
 c7 80 01              ldi16	r7, 0x180
 f0 6b 0e              st32	[r7], q0
 f0 04 b7 be           ldi16	r0, 0xbeb7
 f0 05 c5 cc           ldi16	r1, 0xccc5
 c7 7c 01              ldi16	r7, 0x17c
 f0 6b 0e              st32	[r7], q0
 f0 04 9b a2           ldi16	r0, 0xa29b
 f0 05 a9 b0           ldi16	r1, 0xb0a9
 c7 78 01              ldi16	r7, 0x178
 f0 6b 0e              st32	[r7], q0
 f0 5d cc 01           stm16	[0x1cc], r5
 f0 04 46 4d           ldi16	r0, 0x4d46
 f0 05 54 5b           ldi16	r1, 0x5b54
 c5 a4 01              ldi16	r5, 0x1a4
 f0 6b 0a              st32	[r5], q0
 f0 04 2a 31           ldi16	r0, 0x312a
 f0 05 38 3f           ldi16	r1, 0x3f38
 c5 a0 01              ldi16	r5, 0x1a0
 f0 6b 0a              st32	[r5], q0
 f0 04 0e 15           ldi16	r0, 0x150e
 f0 05 1c 23           ldi16	r1, 0x231c
 c5 9c 01              ldi16	r5, 0x19c
 f0 6b 0a              st32	[r5], q0
 f0 04 f2 f9           ldi16	r0, 0xf9f2
 f0 05 00 07           ldi16	r1, 0x700
 c5 98 01              ldi16	r5, 0x198
 f0 6b 0a              st32	[r5], q0
 f0 04 d6 dd           ldi16	r0, 0xddd6
 f0 05 e4 eb           ldi16	r1, 0xebe4
 c5 94 01              ldi16	r5, 0x194
 f0 6b 0a              st32	[r5], q0
 f0 04 ba c1           ldi16	r0, 0xc1ba
 f0 05 c8 cf           ldi16	r1, 0xcfc8
 f0 6b 08              st32	[r4], q0
 f0 5f ce 01           stm16	[0x1ce], r7
 c4 65 6c              ldi16	r4, 0x6c65
 c5 73 7a              ldi16	r5, 0x7a73
 c7 bc 01              ldi16	r7, 0x1bc
 f0 6b 8e              st32	[r7], q2
 c4 49 50              ldi16	r4, 0x5049
 c5 57 5e              ldi16	r5, 0x5e57
 c7 b8 01              ldi16	r7, 0x1b8
 f0 6b 8e              st32	[r7], q2
 c4 2d 34              ldi16	r4, 0x342d
 c5 3b 42              ldi16	r5, 0x423b
 c7 b4 01              ldi16	r7, 0x1b4
 f0 6b 8e              st32	[r7], q2
 c4 11 18              ldi16	r4, 0x1811
 c5 1f 26              ldi16	r5, 0x261f
 c7 b0 01              ldi16	r7, 0x1b0
 f0 6b 8e              st32	[r7], q2
 c4 f5 fc              ldi16	r4, 0xfcf5
 c5 03 0a              ldi16	r5, 0xa03
 c7 ac 01              ldi16	r7, 0x1ac
 f0 6b 8e              st32	[r7], q2
 c4 d9 e0              ldi16	r4, 0xe0d9
 c5 e7 ee              ldi16	r5, 0xeee7
 f0 6b 8c              st32	[r6], q2
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
 f0 04 c0 01           ldi16	r0, 0x1c0
 f1 16                 mov	r2, r6
 a5                    xor	r5, r5
 f1 1d                 mov	r3, r5
 0e                    mov	r7, r6
 f2 2e                 add	r7, r2
 c0 18                 ldi8	r4, 0x18
 ec 7c                 urem16	r7, r4
 01                    mov	r4, r5
 f2 20                 add	r4, r0
 f5 40                 ld16	r0, [r4]
 f1 20                 mov	r4, r0
 13                    add	r4, r7
 f5 31                 ld8u	r1, [r4]
 f2 0b                 add	r1, r3
 f3 01                 st8	[r4], r1
 f1 71                 zext8	r1
 f2 0e                 add	r1, r6
 f2 37                 sub	r0, r7
 ed c0 37              ld8u	r6, [r0+23]
 f0 04 c0 01           ldi16	r0, 0x1c0
 f2 29                 add	r6, r1
 f4 ab                 inc16	r3
 c9 02                 addi.s8	r5, 0x2
 cd 10                 cmpi.s8	r5, 0x10
 d1 d4                 brne8	avm_test_main+674
 f4 aa                 inc16	r2
 f0 0e 20              cmpi.s8	r2, 0x20
 d1 ca                 brne8	avm_test_main+671
 f0 5e d0 01           stm16	[0x1d0], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
