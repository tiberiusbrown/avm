
wide_compare.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 wide_compare.c
00000100 l     O .data	00000040 unsigned_values
00000140 l     O .data	00000040 signed_values
00000180 l     O .data	00000002 wide_compare_result
00000000 l    df *ABS*	00000000 runtime.c
0000051e l       .init_array	00000000 .hidden __init_array_end
0000051e l       .init_array	00000000 .hidden __init_array_start
0000051e l       .fini_array	00000000 .hidden __fini_array_start
0000051e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000255 avm_test_main
0000051c g     F .text	00000002 avm_halt
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
 e1 fe 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 1e 05              ldi16	r4, 0x51e
 c1 00                 ldi8	r5, 0x0
 c6 1e 05              ldi16	r6, 0x51e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 1e 05           ldi16	r0, 0x51e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 1e 05           ldi16	r2, 0x51e
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
 c4 1e 05              ldi16	r4, 0x51e
 c1 00                 ldi8	r5, 0x0
 c6 1e 05              ldi16	r6, 0x51e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 1e 05           ldi16	r2, 0x51e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 1e 05           ldi16	r0, 0x51e
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
 d6 e4                 adjsp	-0x1c
 c4 10 32              ldi16	r4, 0x3210
 c5 54 76              ldi16	r5, 0x7654
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f0 06 98 ba           ldi16	r2, 0xba98
 f0 07 dc fe           ldi16	r3, 0xfedc
 c4 04 01              ldi16	r4, 0x104
 f0 6b 48              st32	[r4], q1
 c4 ea 72              ldi16	r4, 0x72ea
 c5 fb ff              ldi16	r5, 0xfffb
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 cc 50              ldi16	r4, 0x50cc
 c5 d9 61              ldi16	r5, 0x61d9
 c7 40 01              ldi16	r7, 0x140
 f0 6b 8e              st32	[r7], q2
 c4 30 32              ldi16	r4, 0x3230
 c5 54 76              ldi16	r5, 0x7654
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 0c 01              ldi16	r4, 0x10c
 f0 6b 48              st32	[r4], q1
 c4 2f 96              ldi16	r4, 0x962f
 c5 fc ff              ldi16	r5, 0xfffc
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c4 99 fc              ldi16	r4, 0xfc99
 c5 62 c9              ldi16	r5, 0xc962
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 90 32              ldi16	r4, 0x3290
 c5 54 76              ldi16	r5, 0x7654
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 14 01              ldi16	r4, 0x114
 f0 6b 48              st32	[r4], q1
 c4 75 b9              ldi16	r4, 0xb975
 c5 fd ff              ldi16	r5, 0xfffd
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 66 a8              ldi16	r4, 0xa866
 c5 ec 30              ldi16	r5, 0x30ec
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c4 90 33              ldi16	r4, 0x3390
 c5 54 76              ldi16	r5, 0x7654
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 1c 01              ldi16	r4, 0x11c
 f0 6b 48              st32	[r4], q1
 c4 ba dc              ldi16	r4, 0xdcba
 c5 fe ff              ldi16	r5, 0xfffe
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c4 33 54              ldi16	r4, 0x5433
 c5 76 98              ldi16	r5, 0x9876
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c4 10 36              ldi16	r4, 0x3610
 c5 54 76              ldi16	r5, 0x7654
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 24 01              ldi16	r4, 0x124
 f0 6b 48              st32	[r4], q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c4 64 01              ldi16	r4, 0x164
 f0 6b 08              st32	[r4], q0
 c4 60 01              ldi16	r4, 0x160
 f0 6b 08              st32	[r4], q0
 c4 10 38              ldi16	r4, 0x3810
 c5 54 76              ldi16	r5, 0x7654
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 2c 01              ldi16	r4, 0x12c
 f0 6b 48              st32	[r4], q1
 c4 45 23              ldi16	r4, 0x2345
 c1 01                 ldi8	r5, 0x1
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 cd ab              ldi16	r4, 0xabcd
 c5 89 67              ldi16	r5, 0x6789
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 10 2a              ldi16	r4, 0x2a10
 c5 54 76              ldi16	r5, 0x7654
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 34 01              ldi16	r4, 0x134
 f0 6b 48              st32	[r4], q1
 c4 8a 46              ldi16	r4, 0x468a
 c1 02                 ldi8	r5, 0x2
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c4 9a 57              ldi16	r4, 0x579a
 c5 13 cf              ldi16	r5, 0xcf13
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c4 3c 01              ldi16	r4, 0x13c
 f0 6b 48              st32	[r4], q1
 c4 10 0a              ldi16	r4, 0xa10
 c5 54 76              ldi16	r5, 0x7654
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 d0 69              ldi16	r4, 0x69d0
 c1 03                 ldi8	r5, 0x3
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c4 67 03              ldi16	r4, 0x367
 c5 9d 36              ldi16	r5, 0x369d
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 f1 05                 mov	r0, r5
 f4 49                 stsp16	[sp+0x2], r5
 f0 3f 1a              stsp16	[sp+0x1a], r7
 c4 00 01              ldi16	r4, 0x100
 0c                    mov	r7, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 38 10              stsp16	[sp+0x10], r0
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 02                    mov	r4, r6
 c8 06                 addi.s8	r4, 0x6
 c1 07                 ldi8	r5, 0x7
 84                    and	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 01                    mov	r4, r5
 c6 00 01              ldi16	r6, 0x100
 12                    add	r4, r6
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6a 4c              ld32	q1, [r6]
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 6a cc              ld32	q3, [r6]
 f0 6a 08              ld32	q0, [r4]
 f0 69 c0              cmp32	q3, q0
 f8 14                 cset.ult	r4
 c6 04 01              ldi16	r6, 0x104
 16                    add	r5, r6
 f0 6a ca              ld32	q3, [r5]
 f0 69 4c              cmp32	q1, q3
 f8 15                 cset.ult	r5
 fb 2c                 cmov.eq	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 c1 38                 ldi8	r5, 0x38
 84                    and	r5, r4
 01                    mov	r4, r5
 c6 44 01              ldi16	r6, 0x144
 12                    add	r4, r6
 c6 40 01              ldi16	r6, 0x140
 16                    add	r5, r6
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 3f 1a              stsp16	[sp+0x1a], r7
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6a 4c              ld32	q1, [r6]
 f0 6a 0e              ld32	q0, [r7]
 f0 6a ca              ld32	q3, [r5]
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f0 6a c8              ld32	q3, [r4]
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 69 c4              cmp32	q3, q1
 f8 24                 cset.slt	r4
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 80              cmp32	q2, q0
 f8 14                 cset.ult	r4
 f0 69 4c              cmp32	q1, q3
 f4 13                 ldsp16	r7, [sp+0x4]
 fb 3c                 cmov.eq	r7, r4
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 36 10              ldsp16	r6, [sp+0x10]
 12                    add	r4, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 12                    add	r4, r6
 13                    add	r4, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 f0 36 16              ldsp16	r6, [sp+0x16]
 f8 00                 cset.eq	r0
 f2 04                 add	r0, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c8 08                 addi.s8	r4, 0x8
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 37 18              ldsp16	r7, [sp+0x18]
 cb 08                 addi.s8	r7, 0x8
 f4 ae                 inc16	r6
 ce 0b                 cmpi.s8	r6, 0xb
 db 2f ff              brne16	avm_test_main+359
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 c7 40 01              ldi16	r7, 0x140
 db 15 ff              brne16	avm_test_main+348
 f0 58 80 01           stm16	[0x180], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
