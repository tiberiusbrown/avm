
bitfields.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 __avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 bitfields.c
00000100 l     O .data	00000002 bitfields_result
00000102 l     O .data	00000078 entries
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 trap_report.c
00000000 l    df *ABS*	00000000 trap_lookup.c
00000ee5 l     F .text	0000010f open_section
00000ff4 l     F .text	00000103 read_uleb128
00000000 l    df *ABS*	00000000 string.c
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 font_br5n.c
00000000 l    df *ABS*	00000000 integer.c
00001603 l       .init_array	00000000 .hidden __init_array_end
00001603 l       .init_array	00000000 .hidden __init_array_start
00001603 l       .fini_array	00000000 .hidden __fini_array_start
00001603 l       .fini_array	00000000 .hidden __fini_array_end
00000675 g     F .text	00000015 __avm_trap_entry
00000200 g     F .text	00000023 _start
00000267 g     F .text	000003a7 avm_test_main
00000610 g     F .text	00000065 __avm_terminate
0000060e g     F .text	00000002 avm_halt
00001262 g     O .rodata	000003a1 _avm_font_br5n_storage
00000000  w      *UND*	00000000 __avm_run_local_dtors
000007c1 g     F .text	00000724 __avm_trap_lookup
0000068a g     F .text	00000137 __avm_trap_report
000010f7 g     F .text	00000005 memset
00000500 g       *ABS*	00000000 __avm_framebuffer
00001147 g     F .text	00000068 __avm_mulsi3
000010fc g     F .text	0000004b __avm_umulhisi3

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	__avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 fa 03              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 eb 03              call16	avm_halt

<__avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 03 16              ldi16	r4, 0x1603
 c1 00                 ldi8	r5, 0x0
 c6 03 16              ldi16	r6, 0x1603
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 03 16           ldi16	r0, 0x1603
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 03 16           ldi16	r2, 0x1603
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
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
 d6 fa                 adjsp	-0x6
 f0 04 00 fc           ldi16	r0, 0xfc00
 f0 54 0f 01           ldm16	r4, [0x10f]
 f9 80                 and	r4, r0
 f0 01 2c              ldi8	r1, 0x2c
 f9 31                 or	r1, r4
 f0 54 0c 01           ldm16	r4, [0x10c]
 f9 80                 and	r4, r0
 c6 21 02              ldi16	r6, 0x221
 98                    or	r6, r4
 f0 54 09 01           ldm16	r4, [0x109]
 f9 80                 and	r4, r0
 c3 16                 ldi8	r7, 0x16
 9c                    or	r7, r4
 f0 55 06 01           ldm16	r5, [0x106]
 f9 a0                 and	r5, r0
 c4 0b 02              ldi16	r4, 0x20b
 91                    or	r4, r5
 c1 90                 ldi8	r5, 0x90
 f0 4d 02 01           stm8	[0x102], r5
 c1 99                 ldi8	r5, 0x99
 f0 4d 05 01           stm8	[0x105], r5
 c1 a2                 ldi8	r5, 0xa2
 f0 4d 08 01           stm8	[0x108], r5
 c1 ab                 ldi8	r5, 0xab
 f0 4d 0b 01           stm8	[0x10b], r5
 c1 b4                 ldi8	r5, 0xb4
 f0 4d 0e 01           stm8	[0x10e], r5
 c1 bd                 ldi8	r5, 0xbd
 f0 4d 11 01           stm8	[0x111], r5
 f0 55 03 01           ldm16	r5, [0x103]
 f9 a0                 and	r5, r0
 f0 5d 03 01           stm16	[0x103], r5
 f0 5c 06 01           stm16	[0x106], r4
 f0 5f 09 01           stm16	[0x109], r7
 f0 5e 0c 01           stm16	[0x10c], r6
 f0 59 0f 01           stm16	[0x10f], r1
 f0 54 12 01           ldm16	r4, [0x112]
 f9 80                 and	r4, r0
 c5 37 02              ldi16	r5, 0x237
 94                    or	r5, r4
 f0 5d 12 01           stm16	[0x112], r5
 c2 c6                 ldi8	r6, 0xc6
 f0 4e 14 01           stm8	[0x114], r6
 f0 54 15 01           ldm16	r4, [0x115]
 c1 cf                 ldi8	r5, 0xcf
 f0 4d 17 01           stm8	[0x117], r5
 f9 80                 and	r4, r0
 c1 42                 ldi8	r5, 0x42
 94                    or	r5, r4
 f0 5d 15 01           stm16	[0x115], r5
 c0 d0                 ldi8	r4, 0xd0
 f0 55 18 01           ldm16	r5, [0x118]
 f0 4c 1a 01           stm8	[0x11a], r4
 f9 a0                 and	r5, r0
 c4 4d 02              ldi16	r4, 0x24d
 91                    or	r4, r5
 f0 5c 18 01           stm16	[0x118], r4
 c0 d9                 ldi8	r4, 0xd9
 f0 55 1b 01           ldm16	r5, [0x11b]
 f0 4c 1d 01           stm8	[0x11d], r4
 f9 a0                 and	r5, r0
 c0 58                 ldi8	r4, 0x58
 91                    or	r4, r5
 f0 5c 1b 01           stm16	[0x11b], r4
 c0 e2                 ldi8	r4, 0xe2
 f0 55 1e 01           ldm16	r5, [0x11e]
 f0 4c 20 01           stm8	[0x120], r4
 f9 a0                 and	r5, r0
 c4 63 02              ldi16	r4, 0x263
 91                    or	r4, r5
 f0 5c 1e 01           stm16	[0x11e], r4
 c0 eb                 ldi8	r4, 0xeb
 f0 55 21 01           ldm16	r5, [0x121]
 f0 4c 23 01           stm8	[0x123], r4
 f9 a0                 and	r5, r0
 c0 6e                 ldi8	r4, 0x6e
 91                    or	r4, r5
 f0 5c 21 01           stm16	[0x121], r4
 c0 f4                 ldi8	r4, 0xf4
 f0 55 24 01           ldm16	r5, [0x124]
 f0 4c 26 01           stm8	[0x126], r4
 f9 a0                 and	r5, r0
 c4 79 02              ldi16	r4, 0x279
 91                    or	r4, r5
 f0 5c 24 01           stm16	[0x124], r4
 c0 fd                 ldi8	r4, 0xfd
 f0 55 27 01           ldm16	r5, [0x127]
 f0 4c 29 01           stm8	[0x129], r4
 f9 a0                 and	r5, r0
 c0 84                 ldi8	r4, 0x84
 91                    or	r4, r5
 f0 5c 27 01           stm16	[0x127], r4
 c0 06                 ldi8	r4, 0x6
 f0 55 2a 01           ldm16	r5, [0x12a]
 f0 4c 2c 01           stm8	[0x12c], r4
 f9 a0                 and	r5, r0
 c4 8f 02              ldi16	r4, 0x28f
 91                    or	r4, r5
 f0 5c 2a 01           stm16	[0x12a], r4
 c0 0f                 ldi8	r4, 0xf
 f0 55 2d 01           ldm16	r5, [0x12d]
 f0 4c 2f 01           stm8	[0x12f], r4
 f9 a0                 and	r5, r0
 c0 9a                 ldi8	r4, 0x9a
 91                    or	r4, r5
 f0 5c 2d 01           stm16	[0x12d], r4
 f0 01 10              ldi8	r1, 0x10
 f0 54 30 01           ldm16	r4, [0x130]
 f0 49 32 01           stm8	[0x132], r1
 f9 80                 and	r4, r0
 c5 a5 02              ldi16	r5, 0x2a5
 94                    or	r5, r4
 f0 5d 30 01           stm16	[0x130], r5
 c0 19                 ldi8	r4, 0x19
 f0 55 33 01           ldm16	r5, [0x133]
 f0 4c 35 01           stm8	[0x135], r4
 f9 a0                 and	r5, r0
 c0 b0                 ldi8	r4, 0xb0
 91                    or	r4, r5
 f0 5c 33 01           stm16	[0x133], r4
 c0 22                 ldi8	r4, 0x22
 f0 55 36 01           ldm16	r5, [0x136]
 f0 4c 38 01           stm8	[0x138], r4
 f9 a0                 and	r5, r0
 c4 bb 02              ldi16	r4, 0x2bb
 91                    or	r4, r5
 f0 5c 36 01           stm16	[0x136], r4
 c0 2b                 ldi8	r4, 0x2b
 f0 55 39 01           ldm16	r5, [0x139]
 f0 4c 3b 01           stm8	[0x13b], r4
 f9 a0                 and	r5, r0
 96                    or	r5, r6
 f0 5d 39 01           stm16	[0x139], r5
 c0 34                 ldi8	r4, 0x34
 f0 55 3c 01           ldm16	r5, [0x13c]
 f0 4c 3e 01           stm8	[0x13e], r4
 f9 a0                 and	r5, r0
 c4 d1 02              ldi16	r4, 0x2d1
 91                    or	r4, r5
 f0 5c 3c 01           stm16	[0x13c], r4
 c0 3d                 ldi8	r4, 0x3d
 f0 55 3f 01           ldm16	r5, [0x13f]
 f0 4c 41 01           stm8	[0x141], r4
 f9 a0                 and	r5, r0
 c0 dc                 ldi8	r4, 0xdc
 91                    or	r4, r5
 f0 5c 3f 01           stm16	[0x13f], r4
 c0 46                 ldi8	r4, 0x46
 f0 55 42 01           ldm16	r5, [0x142]
 f0 4c 44 01           stm8	[0x144], r4
 f9 a0                 and	r5, r0
 c4 e7 02              ldi16	r4, 0x2e7
 91                    or	r4, r5
 f0 5c 42 01           stm16	[0x142], r4
 c0 4f                 ldi8	r4, 0x4f
 f0 55 45 01           ldm16	r5, [0x145]
 f0 4c 47 01           stm8	[0x147], r4
 f9 a0                 and	r5, r0
 c0 f2                 ldi8	r4, 0xf2
 91                    or	r4, r5
 f0 5c 45 01           stm16	[0x145], r4
 c0 50                 ldi8	r4, 0x50
 f0 55 48 01           ldm16	r5, [0x148]
 f0 4c 4a 01           stm8	[0x14a], r4
 f9 a0                 and	r5, r0
 c4 fd 02              ldi16	r4, 0x2fd
 91                    or	r4, r5
 f0 5c 48 01           stm16	[0x148], r4
 c0 59                 ldi8	r4, 0x59
 f0 55 4b 01           ldm16	r5, [0x14b]
 f0 4c 4d 01           stm8	[0x14d], r4
 f9 a0                 and	r5, r0
 c4 08 01              ldi16	r4, 0x108
 91                    or	r4, r5
 f0 5c 4b 01           stm16	[0x14b], r4
 c0 62                 ldi8	r4, 0x62
 f0 55 4e 01           ldm16	r5, [0x14e]
 f0 4c 50 01           stm8	[0x150], r4
 f9 a0                 and	r5, r0
 c4 13 03              ldi16	r4, 0x313
 91                    or	r4, r5
 f0 5c 4e 01           stm16	[0x14e], r4
 c0 6b                 ldi8	r4, 0x6b
 f0 55 51 01           ldm16	r5, [0x151]
 f0 4c 53 01           stm8	[0x153], r4
 f9 a0                 and	r5, r0
 c4 1e 01              ldi16	r4, 0x11e
 91                    or	r4, r5
 f0 5c 51 01           stm16	[0x151], r4
 c0 74                 ldi8	r4, 0x74
 f0 55 54 01           ldm16	r5, [0x154]
 f0 4c 56 01           stm8	[0x156], r4
 f9 a0                 and	r5, r0
 c4 29 03              ldi16	r4, 0x329
 91                    or	r4, r5
 f0 5c 54 01           stm16	[0x154], r4
 c0 95                 ldi8	r4, 0x95
 f0 55 57 01           ldm16	r5, [0x157]
 f0 4c 59 01           stm8	[0x159], r4
 f9 a0                 and	r5, r0
 c4 34 01              ldi16	r4, 0x134
 91                    or	r4, r5
 f0 5c 57 01           stm16	[0x157], r4
 c0 9e                 ldi8	r4, 0x9e
 f0 55 5a 01           ldm16	r5, [0x15a]
 f0 4c 5c 01           stm8	[0x15c], r4
 f9 a0                 and	r5, r0
 c4 3f 03              ldi16	r4, 0x33f
 91                    or	r4, r5
 f0 5c 5a 01           stm16	[0x15a], r4
 c0 a7                 ldi8	r4, 0xa7
 f0 55 5d 01           ldm16	r5, [0x15d]
 f0 4c 5f 01           stm8	[0x15f], r4
 f9 a0                 and	r5, r0
 c4 4a 01              ldi16	r4, 0x14a
 91                    or	r4, r5
 f0 5c 5d 01           stm16	[0x15d], r4
 c0 a8                 ldi8	r4, 0xa8
 f0 55 60 01           ldm16	r5, [0x160]
 f0 4c 62 01           stm8	[0x162], r4
 f9 a0                 and	r5, r0
 c4 55 03              ldi16	r4, 0x355
 91                    or	r4, r5
 f0 5c 60 01           stm16	[0x160], r4
 c0 b1                 ldi8	r4, 0xb1
 f0 55 63 01           ldm16	r5, [0x163]
 f0 4c 65 01           stm8	[0x165], r4
 f9 a0                 and	r5, r0
 c4 60 01              ldi16	r4, 0x160
 91                    or	r4, r5
 f0 5c 63 01           stm16	[0x163], r4
 c0 ba                 ldi8	r4, 0xba
 f0 55 66 01           ldm16	r5, [0x166]
 f0 4c 68 01           stm8	[0x168], r4
 f9 a0                 and	r5, r0
 c4 6b 03              ldi16	r4, 0x36b
 91                    or	r4, r5
 f0 5c 66 01           stm16	[0x166], r4
 c0 c3                 ldi8	r4, 0xc3
 f0 55 69 01           ldm16	r5, [0x169]
 f0 4c 6b 01           stm8	[0x16b], r4
 f9 a0                 and	r5, r0
 c4 76 01              ldi16	r4, 0x176
 91                    or	r4, r5
 f0 5c 69 01           stm16	[0x169], r4
 c0 cc                 ldi8	r4, 0xcc
 f0 55 6c 01           ldm16	r5, [0x16c]
 f0 4c 6e 01           stm8	[0x16e], r4
 f9 a0                 and	r5, r0
 c4 81 03              ldi16	r4, 0x381
 91                    or	r4, r5
 f0 5c 6c 01           stm16	[0x16c], r4
 c0 d5                 ldi8	r4, 0xd5
 f0 55 6f 01           ldm16	r5, [0x16f]
 f0 4c 71 01           stm8	[0x171], r4
 f9 a0                 and	r5, r0
 c4 8c 01              ldi16	r4, 0x18c
 91                    or	r4, r5
 f0 5c 6f 01           stm16	[0x16f], r4
 c0 de                 ldi8	r4, 0xde
 f0 55 72 01           ldm16	r5, [0x172]
 f0 4c 74 01           stm8	[0x174], r4
 f9 a0                 and	r5, r0
 c4 97 03              ldi16	r4, 0x397
 91                    or	r4, r5
 f0 5c 72 01           stm16	[0x172], r4
 c0 e7                 ldi8	r4, 0xe7
 f0 55 75 01           ldm16	r5, [0x175]
 f0 4c 77 01           stm8	[0x177], r4
 f9 a0                 and	r5, r0
 c4 a2 01              ldi16	r4, 0x1a2
 91                    or	r4, r5
 f0 5c 75 01           stm16	[0x175], r4
 f0 54 78 01           ldm16	r4, [0x178]
 f9 80                 and	r4, r0
 c5 ad 03              ldi16	r5, 0x3ad
 94                    or	r5, r4
 f0 5d 78 01           stm16	[0x178], r5
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
 c0 28                 ldi8	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 02                    mov	r4, r6
<L0>:
 f4 4a                 stsp16	[sp+0x2], r6
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 07 03 01           ldi16	r3, 0x103
<L1>:
 f4 51                 stsp16	[sp+0x4], r5
 ed e6 1f              ld8u	r7, [r3-1]
 07                    mov	r5, r7
 f6 45                 sext8	r5
 fa c3                 asr16i	r5, 0x3
 c6 f1 ff              ldi16	r6, 0xfff1
 cd 0f                 cmpi.s8	r5, 0xf
 fd 31                 cmov.slt	r6, r1
 f0 00 07              ldi8	r0, 0x7
 f9 1c                 and	r0, r7
 19                    add	r6, r5
 ed 56 20              ld16	r2, [r3+0]
 f1 26                 mov	r5, r2
 f2 24                 add	r5, r0
 f4 ad                 inc16	r5
 0d                    mov	r7, r5
 fa 69                 lsl16i	r7, 0x9
 f0 05 00 02           ldi16	r1, 0x200
 f9 3c                 and	r1, r7
 c7 00 fe              ldi16	r7, 0xfe00
 f9 e8                 and	r7, r2
 f0 06 ff 01           ldi16	r2, 0x1ff
 f9 54                 and	r2, r5
 f9 e9                 or	r7, r2
 f9 e6                 xor	r7, r1
 f0 01 01              ldi8	r1, 0x1
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 f9 a4                 and	r5, r1
 f0 01 10              ldi8	r1, 0x10
 f2 14                 add	r2, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 ca 88                 addi.s8	r6, -0x78
 02                    mov	r4, r6
 f6 44                 sext8	r4
 fa b3                 asr16i	r4, 0x3
 f2 22                 add	r4, r2
 f9 c1                 or	r6, r0
 ee f6 20              st16	[r3+0], r7
 ee c6 1f              st8	[r3-1], r6
 11                    add	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 0b 03              addi.s8	r3, 0x3
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 9b                 brne8	-0x65 <L1>
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 ce 14                 cmpi.s8	r6, 0x14
 d1 8b                 brne8	-0x75 <L0>
 f0 5c 00 01           stm16	[0x100], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_terminate>:
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
 d0 03                 breq8	0x3 <L0>
 e1 db f9              call16	-1573 <__avm_run_local_dtors>
<L0>:
 c4 03 16              ldi16	r4, 0x1603
 c1 00                 ldi8	r5, 0x0
 c6 03 16              ldi16	r6, 0x1603
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 03 16           ldi16	r2, 0x1603
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 03 16           ldi16	r0, 0x1603
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 92 f9              call16	-1646 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_trap_entry>:
 c4 00 01              ldi16	r4, 0x100
 c5 00 09              ldi16	r5, 0x900
 c6 00 01              ldi16	r6, 0x100
 d7 0f                 sys	memcpy
 c7 00 0a              ldi16	r7, 0xa00
 f1 8f                 setsp	r7
 c4 00 02              ldi16	r4, 0x200
 d4 00                 jmp8	__avm_trap_report

<__avm_trap_report>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f9                 adjsp	-0x7
 f1 04                 mov	r0, r4
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 05 20 02           ldi16	r1, 0x220
 f2 69                 mov32	q2, q1
 f1 29                 mov	r6, r1
 e1 20 01              call16	__avm_trap_lookup
 c4 00 05              ldi16	r4, 0x500
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 e1 4c 0a              call16	memset
 c4 62 12              ldi16	r4, 0x1262
 c1 00                 ldi8	r5, 0x0
 d7 31                 sys	set_text_font
 a0                    xor	r4, r4
 d7 32                 sys	set_text_mode
 ed 80 23              ld8u	r4, [r0+3]
 cc 01                 cmpi.s8	r4, 0x1
 d0 16                 breq8	0x16 <L1>
 cc 03                 cmpi.s8	r4, 0x3
 d0 0b                 breq8	0xb <L0>
 cc 02                 cmpi.s8	r4, 0x2
 d1 15                 brne8	0x15 <L2>
 c6 33 12              ldi16	r6, 0x1233
 c3 00                 ldi8	r7, 0x0
 d4 13                 jmp8	0x13 <L3>
<L0>:
 c6 43 12              ldi16	r6, 0x1243
 c3 00                 ldi8	r7, 0x0
 d4 0c                 jmp8	0xc <L3>
<L1>:
 c6 24 12              ldi16	r6, 0x1224
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	0x5 <L3>
<L2>:
 c6 55 12              ldi16	r6, 0x1255
 c3 00                 ldi8	r7, 0x0
<L3>:
 a0                    xor	r4, r4
 c1 05                 ldi8	r5, 0x5
 d7 34                 sys	draw_text_p
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ed 90 24              ld16	r4, [r0+4]
 f4 50                 stsp16	[sp+0x4], r4
 f0 13 00              leasp	r3, 0x0
 c6 af 11              ldi16	r6, 0x11af
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 0b                 ldi8	r5, 0xb
 f1 13                 mov	r2, r3
 d7 36                 sys	draw_textfv_p
 f0 6c 93              ld16	r4, [r1+]
 ed a2 20              ld8u	r5, [r1+0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	0x12 <L4>
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c6 c0 11              ldi16	r6, 0x11c0
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 f1 13                 mov	r2, r3
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L5>
<L4>:
 c6 c9 11              ldi16	r6, 0x11c9
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 34                 sys	draw_text_p
<L5>:
 c6 23 02              ldi16	r6, 0x223
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 1d                 breq8	0x1d <L6>
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c4 26 02              ldi16	r4, 0x226
 f0 6a 88              ld32	q2, [r4]
 f4 4c                 stsp16	[sp+0x3], r4
 f4 55                 stsp16	[sp+0x5], r5
 f0 12 00              leasp	r2, 0x0
 c6 ce 11              ldi16	r6, 0x11ce
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L7>
<L6>:
 c6 d8 11              ldi16	r6, 0x11d8
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 34                 sys	draw_text_p
<L7>:
 ed 90 28              ld16	r4, [r0+8]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2a              ld16	r4, [r0+10]
 f4 48                 stsp16	[sp+0x2], r4
 f0 12 00              leasp	r2, 0x0
 c6 dc 11              ldi16	r6, 0x11dc
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 1d                 ldi8	r5, 0x1d
 d7 36                 sys	draw_textfv_p
 ed 90 2c              ld16	r4, [r0+12]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2e              ld16	r4, [r0+14]
 f4 48                 stsp16	[sp+0x2], r4
 c6 ec 11              ldi16	r6, 0x11ec
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 23                 ldi8	r5, 0x23
 d7 36                 sys	draw_textfv_p
 ed 90 30              ld16	r4, [r0+16]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 32              ld16	r4, [r0+18]
 f4 48                 stsp16	[sp+0x2], r4
 c6 fc 11              ldi16	r6, 0x11fc
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 29                 ldi8	r5, 0x29
 d7 36                 sys	draw_textfv_p
 ed 90 34              ld16	r4, [r0+20]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 36              ld16	r4, [r0+22]
 f4 48                 stsp16	[sp+0x2], r4
 c6 0c 12              ldi16	r6, 0x120c
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 2f                 ldi8	r5, 0x2f
 d7 36                 sys	draw_textfv_p
 ed 80 26              ld8u	r4, [r0+6]
 f4 40                 stsp16	[sp+0x0], r4
 c6 1c 12              ldi16	r6, 0x121c
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 35                 ldi8	r5, 0x35
 d7 36                 sys	draw_textfv_p
 a0                    xor	r4, r4
 d7 1d                 sys	display
<L8>:
 d4 fe                 jmp8	-0x2 <L8>

<__avm_trap_lookup>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 a2                 adjsp	-0x5e
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 0e                    mov	r7, r6
 cb 06                 addi.s8	r7, 0x6
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 6b 4e              st32	[r7], q1
 0e                    mov	r7, r6
 f7 5a                 st16	[r7+], r2
 f3 0f                 st8	[r7], r3
 0e                    mov	r7, r6
 cb 03                 addi.s8	r7, 0x3
 f7 5a                 st16	[r7+], r2
 f3 0f                 st8	[r7], r3
 f0 00 0f              ldi8	r0, 0xf
 f2 39                 sub	r1, r1
 f0 63 80              ldp24	q2, [q0]
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 00 2e              ldi8	r0, 0x2e
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 62                 add32	q0, q2
 f0 02 2f              ldi8	r2, 0x2f
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 04              cmp32	q0, q1
 d2 76                 brult8	0x76 <L0>
 f0 60 e8              ldp8u	r7, [q2]
 cf 41                 cmpi.s8	r7, 0x41
 d1 6f                 brne8	0x6f <L0>
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 56                 cmpi.s8	r7, 0x56
 d1 5f                 brne8	0x5f <L0>
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 cf 44                 cmpi.s8	r7, 0x44
 d1 51                 brne8	0x51 <L0>
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 31                 cmpi.s8	r7, 0x31
 d1 41                 brne8	0x41 <L0>
 f0 02 04              ldi8	r2, 0x4
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 63 00              ldp24	q0, [q0]
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 cf 05                 cmpi.s8	r7, 0x5
 d1 21                 brne8	0x21 <L0>
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 f4 a7                 tst8	r7
 d1 13                 brne8	0x13 <L0>
 f0 00 09              ldi8	r0, 0x9
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d0 07                 breq8	0x7 <L1>
<L0>:
 d6 5e                 adjsp	0x5e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 f0 02 2f              ldi8	r2, 0x2f
 f2 4b                 sub	r3, r3
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 69 04              cmp32	q0, q1
 d2 e9                 brult8	-0x17 <L0>
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f7 72                 sub32	q0, q2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 69 04              cmp32	q0, q1
 f0 00 2f              ldi8	r0, 0x2f
 f2 39                 sub	r1, r1
 d2 d1                 brult8	-0x2f <L0>
 f0 02 0c              ldi8	r2, 0xc
 f2 4b                 sub	r3, r3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f7 66                 add32	q1, q2
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 a0                    xor	r4, r4
 f0 3e 1a              stsp16	[sp+0x1a], r6
<L2>:
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 00 07              ldi8	r0, 0x7
 0c                    mov	r7, r4
 fe 38                 mul16	r7, r0
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 0c                    mov	r7, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 66                 add32	q1, q2
 f2 61                 mov32	q0, q1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 61                 mov32	q0, q1
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f0 60 84              ldp8u	r4, [q1]
 f4 53                 stsp16	[sp+0x4], r7
 f4 af                 inc16	r7
 f0 3c 16              stsp16	[sp+0x16], r4
 3c                    cmp	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 db 6e ff              brne16	-0x92 <L0>
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f0 69 40              cmp32	q1, q0
 db 62 ff              brne16	-0x9e <L0>
 d6 fa                 adjsp	-0x6
 f0 17 2a              leasp	r7, 0x2a
 f4 53                 stsp16	[sp+0x4], r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 64                 mov32	q1, q0
 f7 66                 add32	q1, q2
 f0 17 3e              leasp	r7, 0x3e
 03                    mov	r4, r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 e1 ab 05              call16	open_section
 d6 06                 adjsp	0x6
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f4 a7                 tst8	r7
 da 36 ff              breq16	-0xca <L0>
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 62                 add32	q0, q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 cc 05                 cmpi.s8	r4, 0x5
 db 6c ff              brne16	-0x94 <L2>
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 08              cmp32	q0, q2
 db 1c ff              brne16	-0xe4 <L0>
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 08                    mov	r6, r4
 fa 96                 lsr16i	r6, 0x6
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 4a                 lsl16i	r5, 0xa
 96                    or	r5, r6
 fa 76                 lsr16i	r4, 0x6
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 36 58              ldsp16	r6, [sp+0x58]
 f4 52                 stsp16	[sp+0x4], r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 db f5 fe              brne16	-0x10b <L0>
 f0 30 40              ldsp16	r0, [sp+0x40]
 f0 31 42              ldsp16	r1, [sp+0x42]
 f0 63 80              ldp24	q2, [q0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 db e4 fe              brne16	-0x11c <L0>
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 69 8c              cmp32	q2, q3
 db d6 fe              brne16	-0x12a <L0>
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 c0 0b                 ldi8	r4, 0xb
 a5                    xor	r5, r5
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f7 68                 add32	q2, q0
 f0 60 88              ldp8u	r4, [q2]
 f4 a4                 tst8	r4
 db bd fe              brne16	-0x143 <L0>
 f0 34 54              ldsp16	r4, [sp+0x54]
 f6 2c                 tst16	r4
 da 15 01              breq16	0x115 <L5>
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 08                    mov	r6, r4
 af                    xor	r7, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L3>:
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f7 7e                 sub32	q3, q2
 f7 83                 lsr32.1	q3
 f7 6e                 add32	q3, q2
 f2 67                 mov32	q1, q3
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 67                 add32	q1, q3
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 69                 add32	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 69 40              cmp32	q1, q0
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 fc 06                 cmov.ult	r0, r6
 fc 0f                 cmov.ult	r1, r7
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 6a                 mov32	q3, q0
 f0 69 8c              cmp32	q2, q3
 d2 9f                 brult8	-0x61 <L3>
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 69 80              cmp32	q2, q0
 da 94 00              breq16	0x94 <L5>
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6b                 add32	q2, q3
 f2 6b                 mov32	q3, q1
 f7 6e                 add32	q3, q2
 c4 fa ff              ldi16	r4, 0xfffa
 c5 ff ff              ldi16	r5, 0xffff
 f2 67                 mov32	q1, q3
 f7 6b                 add32	q2, q3
 f0 63 c8              ldp24	q3, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d8 70                 bruge8	0x70 <L5>
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f7 6e                 add32	q3, q2
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 32 50              ldsp16	r2, [sp+0x50]
 f0 33 52              ldsp16	r3, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f2 6b                 mov32	q3, q1
 e1 57 05              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 2e                 breq8	0x2e <L4>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 f0 69 c0              cmp32	q3, q0
 d0 1f                 breq8	0x1f <L4>
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f7 76                 sub32	q1, q2
 f0 69 c4              cmp32	q3, q1
 d8 12                 bruge8	0x12 <L4>
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d1 09                 brne8	0x9 <L4>
 c6 ff ff              ldi16	r6, 0xffff
 c3 ff                 ldi8	r7, 0xff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 62                 mov32	q0, q2
<L4>:
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f7 40                 st16	[r4+], r0
 f3 01                 st8	[r4], r1
<L5>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 da 99 fd              breq16	-0x267 <L0>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
<L6>:
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 63                 mov32	q0, q3
 f7 72                 sub32	q0, q2
 f7 80                 lsr32.1	q0
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e1 3a 06              call16	__avm_mulsi3
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f2 68                 mov32	q2, q0
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f0 69 c4              cmp32	q3, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 69 8c              cmp32	q2, q3
 d2 a2                 brult8	-0x5e <L6>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 da 23 fd              breq16	-0x2dd <L0>
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 e1 ea 05              call16	__avm_mulsi3
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 66                 add32	q1, q2
 c4 f4 ff              ldi16	r4, 0xfff4
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 c6 fa ff              ldi16	r6, 0xfffa
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 36 44              ldsp16	r6, [sp+0x44]
 f0 37 46              ldsp16	r7, [sp+0x46]
 f7 6e                 add32	q3, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 f0 60 a4              ldp8u	r5, [q1]
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 f0 30 48              ldsp16	r0, [sp+0x48]
 f0 31 4a              ldsp16	r1, [sp+0x4a]
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 69 c0              cmp32	q3, q0
 dd 67 02              bruge16	0x267 <L17>
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 3c 32              stsp16	[sp+0x32], r4
 f2 39                 sub	r1, r1
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 39 36              stsp16	[sp+0x36], r1
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 f0 3c 2c              stsp16	[sp+0x2c], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
<L7>:
 c0 40                 ldi8	r4, 0x40
 a5                    xor	r5, r5
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f0 69 08              cmp32	q0, q2
 da 84 fc              breq16	-0x37c <L0>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 3a 5a              stsp16	[sp+0x5a], r2
 f0 3b 5c              stsp16	[sp+0x5c], r3
 f0 61 8c              ldp8s	r4, [q3]
 f4 78                 stsp16	[sp+0xe], r4
 f4 a4                 tst8	r4
 de d1 00              brslt16	0xd1 <L11>
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 84              cmp32	q2, q1
 da 43 fc              breq16	-0x3bd <L0>
 f4 3a                 ldsp16	r6, [sp+0xe]
 f1 76                 zext8	r6
 c0 0f                 ldi8	r4, 0xf
 82                    and	r4, r6
 f4 ac                 inc16	r4
 a5                    xor	r5, r5
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 fa 94                 lsr16i	r6, 0x4
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 63                 add32	q0, q3
 c4 fc ff              ldi16	r4, 0xfffc
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
<L8>:
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 71                 stsp16	[sp+0xc], r5
<L9>:
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 6e                 add32	q3, q2
 f0 00 01              ldi8	r0, 0x1
 f0 05 00 ff           ldi16	r1, 0xff00
 f0 69 c0              cmp32	q3, q0
 c0 01                 ldi8	r4, 0x1
 f0 3c 12              stsp16	[sp+0x12], r4
 dc f4 fb              brult16	-0x40c <L0>
<L10>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 ff              ldi8	r1, 0xff
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 73                 sub32	q0, q3
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 f2 6b                 mov32	q3, q1
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 69 c0              cmp32	q3, q0
 dd d1 fb              bruge16	-0x42f <L0>
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 69                 add32	q2, q1
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 69 08              cmp32	q0, q2
 dc 79 01              brult16	0x179 <L18>
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f7 68                 add32	q2, q0
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 69 c8              cmp32	q3, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 dc ee fe              brult16	-0x112 <L7>
 e0 42 01              jmp16	322 <L18>
<L11>:
 f4 38                 ldsp16	r4, [sp+0xe]
 cc 80                 cmpi.s8	r4, -0x80
 d1 7a                 brne8	0x7a <L12>
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 df 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 5c fb              breq16	-0x4a4 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 c3 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 40 fb              breq16	-0x4c0 <L0>
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f1 28                 mov	r6, r0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 69 08              cmp32	q0, q2
 dd 28 fb              bruge16	-0x4d8 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 2a              leasp	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 8f 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 0c fb              breq16	-0x4f4 <L0>
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 e0 ed fe              jmp16	-275 <L9>
<L12>:
 c2 ff                 ldi8	r6, 0xff
 f4 38                 ldsp16	r4, [sp+0xe]
 a5                    xor	r5, r5
 82                    and	r4, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 ce 93                 cmpi.s8	r6, -0x6d
 d2 26                 brult8	0x26 <L14>
 c6 6e ff              ldi16	r6, 0xff6e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L13>:
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 71                 stsp16	[sp+0xc], r5
 e0 d8 fe              jmp16	-296 <L10>
<L14>:
 c6 82 ff              ldi16	r6, 0xff82
 f4 3b                 ldsp16	r7, [sp+0xe]
 3b                    cmp	r6, r7
 d2 24                 brult8	0x24 <L15>
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 2b 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da a8 fa              breq16	-0x558 <L0>
 f4 38                 ldsp16	r4, [sp+0xe]
 cc 82                 cmpi.s8	r4, -0x7e
 d0 be                 breq8	-0x42 <L13>
 d4 0e                 jmp8	0xe <L16>
<L15>:
 c6 7e ff              ldi16	r6, 0xff7e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L16>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 84              cmp32	q2, q1
 da 86 fa              breq16	-0x57a <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 ed 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 6a fa              breq16	-0x596 <L0>
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f1 28                 mov	r6, r0
 c0 01                 ldi8	r4, 0x1
 88                    and	r6, r4
 f6 4e                 neg16	r6
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 80                 lsr32.1	q0
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 63                 add32	q0, q3
 e0 2c fe              jmp16	-468 <L8>
<L17>:
 f0 35 56              ldsp16	r5, [sp+0x56]
 f0 3d 32              stsp16	[sp+0x32], r5
 f4 a4                 tst8	r4
 da 3e fa              breq16	-0x5c2 <L0>
 d4 0c                 jmp8	0xc <L19>
<L18>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 f4 a4                 tst8	r4
 da 30 fa              breq16	-0x5d0 <L0>
<L19>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 35 32              ldsp16	r5, [sp+0x32]
 31                    cmp	r4, r5
 dd 27 fa              bruge16	-0x5d9 <L0>
 f4 10                 ldsp16	r4, [sp+0x4]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6f                 add32	q3, q3
 f7 6e                 add32	q3, q2
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f7 6e                 add32	q3, q2
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 30 50              ldsp16	r0, [sp+0x50]
 f0 31 52              ldsp16	r1, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f2 6a                 mov32	q3, q0
 e1 6a 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 23                 breq8	0x23 <L20>
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 16                 breq8	0x16 <L20>
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f7 72                 sub32	q0, q2
 f0 69 c0              cmp32	q3, q0
 d8 09                 bruge8	0x9 <L20>
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d0 0d                 breq8	0xd <L21>
<L20>:
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c8 03                 addi.s8	r4, 0x3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 e0 b8 f9              jmp16	-1608 <L0>
<L21>:
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 ca 03                 addi.s8	r6, 0x3
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 da a6 f9              breq16	-0x65a <L0>
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c8 06                 addi.s8	r4, 0x6
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 6b c8              st32	[r4], q3
 e0 95 f9              jmp16	-1643 <L0>

<open_section>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 19              ldsp16	r4, [sp+0x19]
 f0 32 15              ldsp16	r2, [sp+0x15]
 f0 33 17              ldsp16	r3, [sp+0x17]
 cd 04                 cmpi.s8	r5, 0x4
 d0 11                 breq8	0x11 <L0>
 cd 03                 cmpi.s8	r5, 0x3
 d1 1e                 brne8	0x1e <L2>
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d8 49                 bruge8	0x49 <L3>
 a0                    xor	r4, r4
 d4 70                 jmp8	0x70 <L5>
<L0>:
 f7 67                 add32	q1, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 18                 addi.s8	r5, 0x18
 f0 6b 4a              st32	[r5], q1
 c8 14                 addi.s8	r4, 0x14
<L1>:
 f0 6b c8              st32	[r4], q3
 d4 5d                 jmp8	0x5d <L4>
<L2>:
 a0                    xor	r4, r4
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d2 54                 brult8	0x54 <L5>
 f0 62 8c              ldp16	r4, [q3]
 f4 58                 stsp16	[sp+0x6], r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 a5                 tst8	r5
 d0 4e                 breq8	0x4e <L6>
 cd 01                 cmpi.s8	r5, 0x1
 d1 73                 brne8	0x73 <L7>
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d1 2d                 brne8	0x2d <L5>
 e0 81 00              jmp16	129 <L8>
<L3>:
 f4 58                 stsp16	[sp+0x6], r4
 f0 63 8c              ldp24	q2, [q3]
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 6b 84              st32	[r2], q2
 f7 63                 add32	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 0c                 addi.s8	r5, 0xc
 f0 6b 0a              st32	[r5], q0
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 63                 add32	q0, q3
 c8 10                 addi.s8	r4, 0x10
 f0 6b 08              st32	[r4], q0
<L4>:
 c0 01                 ldi8	r4, 0x1
<L5>:
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L6>:
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d1 df                 brne8	-0x21 <L5>
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 3c              st16	[r4+28], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 e0 6c ff              jmp16	-148 <L1>
<L7>:
 f4 41                 stsp16	[sp+0x0], r5
 c1 0c                 ldi8	r5, 0xc
 f1 20                 mov	r4, r0
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 e1 44 01              call16	__avm_umulhisi3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 00 02              ldi8	r0, 0x2
 f9 11                 or	r0, r4
 f1 20                 mov	r4, r0
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 f0 30 06              ldsp16	r0, [sp+0x6]
 d1 af                 brne8	-0x51 <L5>
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d1 11                 brne8	0x11 <L9>
<L8>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 3e              st16	[r4+30], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 04                 addi.s8	r4, 0x4
 e0 34 ff              jmp16	-204 <L1>
<L9>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 40              st16	[r4+32], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 08                 addi.s8	r4, 0x8
 e0 23 ff              jmp16	-221 <L1>

<read_uleb128>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 32 1b              ldsp16	r2, [sp+0x1b]
 f0 6a 0a              ld32	q0, [r5]
 f0 69 0c              cmp32	q0, q3
 d8 76                 bruge8	0x76 <L4>
 f0 3a 06              stsp16	[sp+0x6], r2
 f4 61                 stsp16	[sp+0x8], r5
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 61 a0              ldp8s	r5, [q0]
 f4 69                 stsp16	[sp+0xa], r5
 c0 7f                 ldi8	r4, 0x7f
 84                    and	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 a4                 tst8	r4
 d3 12                 brslt8	0x12 <L1>
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
<L0>:
 f0 6b 4a              st32	[r5], q1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 d4 44                 jmp8	0x44 <L4>
<L1>:
 f0 69 4c              cmp32	q1, q3
 d8 3e                 bruge8	0x3e <L3>
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 61 84              ldp8s	r4, [q1]
 f4 68                 stsp16	[sp+0xa], r4
 fa 37                 lsl16i	r4, 0x7
 f4 40                 stsp16	[sp+0x0], r4
 c4 80 3f              ldi16	r4, 0x3f80
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 51                 or	r2, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f2 4b                 sub	r3, r3
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 a4                 tst8	r4
 d3 1b                 brslt8	0x1b <L5>
 a0                    xor	r4, r4
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
<L2>:
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 2f                 tst16	r7
 d1 b1                 brne8	-0x4f <L0>
 d4 01                 jmp8	0x1 <L4>
<L3>:
 a0                    xor	r4, r4
<L4>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L5>:
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 69 4c              cmp32	q1, q3
 a0                    xor	r4, r4
 d8 ed                 bruge8	-0x13 <L4>
 f0 60 84              ldp8u	r4, [q1]
 f4 68                 stsp16	[sp+0xa], r4
 fa 3e                 lsl16i	r4, 0xe
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 89                 or	r4, r2
 f4 70                 stsp16	[sp+0xc], r4
 c1 7f                 ldi8	r5, 0x7f
 f4 28                 ldsp16	r4, [sp+0xa]
 84                    and	r5, r4
 fa 82                 lsr16i	r5, 0x2
 f1 1d                 mov	r3, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f4 a5                 tst8	r5
 d3 0b                 brslt8	0xb <L6>
 f6 45                 sext8	r5
 f4 69                 stsp16	[sp+0xa], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 a0                    xor	r4, r4
 d4 b2                 jmp8	-0x4e <L2>
<L6>:
 f0 69 4c              cmp32	q1, q3
 f4 21                 ldsp16	r5, [sp+0x8]
 d8 2b                 bruge8	0x2b <L7>
 f0 61 c4              ldp8s	r6, [q1]
 f4 a6                 tst8	r6
 a0                    xor	r4, r4
 d3 ac                 brslt8	-0x54 <L4>
 f4 6a                 stsp16	[sp+0xa], r6
 f1 16                 mov	r2, r6
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f9 c8                 and	r6, r2
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c2 04                 ldi8	r6, 0x4
 f7 63                 add32	q0, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 fa 55                 lsl16i	r6, 0x5
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f9 79                 or	r3, r6
 f0 3b 0e              stsp16	[sp+0xe], r3
 f2 64                 mov32	q1, q0
 f4 1a                 ldsp16	r6, [sp+0x6]
 d4 80                 jmp8	-0x80 <L2>
<L7>:
 a0                    xor	r4, r4
 d4 86                 jmp8	-0x7a <L4>

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<__avm_umulhisi3>:
 d6 f8                 adjsp	-0x8
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 f4 41                 stsp16	[sp+0x0], r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 1d                 mulu8.w	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 51                 stsp16	[sp+0x4], r5
 18                    add	r6, r4
 fa 38                 lsl16i	r4, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 04                    mov	r5, r4
 17                    add	r5, r7
 0d                    mov	r7, r5
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 fa 58                 lsl16i	r6, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 19                    add	r6, r5
 3b                    cmp	r6, r7
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 08                 adjsp	0x8
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 1c                    add	r7, r4
 fa 38                 lsl16i	r4, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 19                    add	r6, r5
 06                    mov	r5, r6
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 fa 68                 lsl16i	r7, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
