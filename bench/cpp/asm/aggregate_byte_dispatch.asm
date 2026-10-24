
aggregate_byte_dispatch.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 aggregate_byte_dispatch.cpp
00000100 l     O .data	00000060 input
000004b0 l     F .text	0000002e dispatch(ChunkCoord)
00000160 l     O .data	00000002 aggregate_byte_dispatch_result
00000000 l    df *ABS*	00000000 runtime.c
000004e0 l       .init_array	00000000 .hidden __init_array_end
000004e0 l       .init_array	00000000 .hidden __init_array_start
000004e0 l       .fini_array	00000000 .hidden __fini_array_start
000004e0 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000001e9 avm_test_main
000004de g     F .text	00000002 avm_halt
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
 e1 c0 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e0 04              ldi16	r4, 0x4e0
 c1 00                 ldi8	r5, 0x0
 c6 e0 04              ldi16	r6, 0x4e0
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 e0 04           ldi16	r0, 0x4e0
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e0 04           ldi16	r2, 0x4e0
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
 d0 03                 breq8	0x3 <L0>
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 e0 04              ldi16	r4, 0x4e0
 c1 00                 ldi8	r5, 0x0
 c6 e0 04              ldi16	r6, 0x4e0
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e0 04           ldi16	r2, 0x4e0
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e0 04           ldi16	r0, 0x4e0
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
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
<L3>:
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
 d6 fe                 adjsp	-0x2
 af                    xor	r7, r7
 f0 4f 00 01           stm8	[0x100], r7
 f0 4f 01 01           stm8	[0x101], r7
 f0 4f 02 01           stm8	[0x102], r7
 c0 01                 ldi8	r4, 0x1
 f0 4c 03 01           stm8	[0x103], r4
 f0 4c 04 01           stm8	[0x104], r4
 f0 4f 05 01           stm8	[0x105], r7
 f0 4c 06 01           stm8	[0x106], r4
 c1 02                 ldi8	r5, 0x2
 f0 4d 07 01           stm8	[0x107], r5
 f0 4f 08 01           stm8	[0x108], r7
 f0 4c 09 01           stm8	[0x109], r4
 c2 03                 ldi8	r6, 0x3
 f0 4e 0a 01           stm8	[0x10a], r6
 f0 4f 0b 01           stm8	[0x10b], r7
 f0 01 7f              ldi8	r1, 0x7f
 f0 49 0c 01           stm8	[0x10c], r1
 f0 4f 0d 01           stm8	[0x10d], r7
 f0 4c 0e 01           stm8	[0x10e], r4
 f0 02 80              ldi8	r2, 0x80
 f0 4a 0f 01           stm8	[0x10f], r2
 f0 4c 10 01           stm8	[0x110], r4
 f0 4c 11 01           stm8	[0x111], r4
 f0 00 ff              ldi8	r0, 0xff
 f0 48 12 01           stm8	[0x112], r0
 f0 4d 13 01           stm8	[0x113], r5
 f0 4c 14 01           stm8	[0x114], r4
 f0 4c 15 01           stm8	[0x115], r4
 f0 4e 16 01           stm8	[0x116], r6
 f0 4c 17 01           stm8	[0x117], r4
 f0 4f 18 01           stm8	[0x118], r7
 f0 4f 19 01           stm8	[0x119], r7
 f0 4d 1a 01           stm8	[0x11a], r5
 f0 4c 1b 01           stm8	[0x11b], r4
 f0 4c 1c 01           stm8	[0x11c], r4
 f0 4d 1d 01           stm8	[0x11d], r5
 f0 4c 1e 01           stm8	[0x11e], r4
 f0 4d 1f 01           stm8	[0x11f], r5
 f0 4d 20 01           stm8	[0x120], r5
 f0 4c 21 01           stm8	[0x121], r4
 f0 4e 22 01           stm8	[0x122], r6
 f0 4d 23 01           stm8	[0x123], r5
 f0 49 24 01           stm8	[0x124], r1
 f0 4f 25 01           stm8	[0x125], r7
 f0 4e 26 01           stm8	[0x126], r6
 f0 4a 27 01           stm8	[0x127], r2
 f0 4c 28 01           stm8	[0x128], r4
 f0 4e 29 01           stm8	[0x129], r6
 f0 48 2a 01           stm8	[0x12a], r0
 f0 4d 2b 01           stm8	[0x12b], r5
 f0 4e 2c 01           stm8	[0x12c], r6
 f0 4c 2d 01           stm8	[0x12d], r4
 f0 4e 2e 01           stm8	[0x12e], r6
 f0 4e 2f 01           stm8	[0x12f], r6
 f0 4f 30 01           stm8	[0x130], r7
 f0 4f 31 01           stm8	[0x131], r7
 f0 4f 32 01           stm8	[0x132], r7
 f0 4c 33 01           stm8	[0x133], r4
 f0 4c 34 01           stm8	[0x134], r4
 f0 4f 35 01           stm8	[0x135], r7
 f0 4c 36 01           stm8	[0x136], r4
 f0 4d 37 01           stm8	[0x137], r5
 f0 4f 38 01           stm8	[0x138], r7
 f0 4c 39 01           stm8	[0x139], r4
 f0 4e 3a 01           stm8	[0x13a], r6
 f0 4f 3b 01           stm8	[0x13b], r7
 f0 49 3c 01           stm8	[0x13c], r1
 f0 4f 3d 01           stm8	[0x13d], r7
 f0 4c 3e 01           stm8	[0x13e], r4
 f0 4a 3f 01           stm8	[0x13f], r2
 f0 4c 40 01           stm8	[0x140], r4
 f0 4c 41 01           stm8	[0x141], r4
 f0 48 42 01           stm8	[0x142], r0
 f0 4d 43 01           stm8	[0x143], r5
 f0 4c 44 01           stm8	[0x144], r4
 f0 4c 45 01           stm8	[0x145], r4
 f0 4e 46 01           stm8	[0x146], r6
 f0 4c 47 01           stm8	[0x147], r4
 f0 4f 48 01           stm8	[0x148], r7
 f0 4f 49 01           stm8	[0x149], r7
 f0 4d 4a 01           stm8	[0x14a], r5
 f0 4c 4b 01           stm8	[0x14b], r4
 f0 4c 4c 01           stm8	[0x14c], r4
 f0 4d 4d 01           stm8	[0x14d], r5
 f0 4c 4e 01           stm8	[0x14e], r4
 f0 4d 4f 01           stm8	[0x14f], r5
 f0 4d 50 01           stm8	[0x150], r5
 f0 4c 51 01           stm8	[0x151], r4
 f0 4e 52 01           stm8	[0x152], r6
 f0 4d 53 01           stm8	[0x153], r5
 f0 49 54 01           stm8	[0x154], r1
 f0 4f 55 01           stm8	[0x155], r7
 f0 4e 56 01           stm8	[0x156], r6
 f0 4a 57 01           stm8	[0x157], r2
 f0 4c 58 01           stm8	[0x158], r4
 f0 4e 59 01           stm8	[0x159], r6
 f0 48 5a 01           stm8	[0x15a], r0
 f0 4d 5b 01           stm8	[0x15b], r5
 f0 4e 5c 01           stm8	[0x15c], r6
 f0 4c 5d 01           stm8	[0x15d], r4
 f0 4e 5e 01           stm8	[0x15e], r6
 f0 4e 5f 01           stm8	[0x15f], r6
 d7 01                 sys	debug_break
 f1 0f                 mov	r1, r7
<L0>:
 f4 43                 stsp16	[sp+0x0], r7
 f0 03 20              ldi8	r3, 0x20
 f0 06 02 01           ldi16	r2, 0x102
<L1>:
 ed 04 1e              ld8u	r0, [r2-2]
 ed 84 1f              ld8u	r4, [r2-1]
 a5                    xor	r5, r5
 0c                    mov	r7, r4
 fa 68                 lsl16i	r7, 0x8
 0b                    mov	r6, r7
 af                    xor	r7, r7
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 38                 lsl16i	r4, 0x8
 04                    mov	r5, r4
 a0                    xor	r4, r4
 92                    or	r4, r6
 97                    or	r5, r7
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 98                    or	r6, r4
 9d                    or	r7, r5
 ed 84 20              ld8u	r4, [r2+0]
 04                    mov	r5, r4
 a0                    xor	r4, r4
 92                    or	r4, r6
 97                    or	r5, r7
 d5 24                 call8	_ZL8dispatch10ChunkCoord
 f2 0c                 add	r1, r4
 f0 0a 03              addi.s8	r2, 0x3
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 d3                 brne8	-0x2d <L1>
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 d1 bf                 brne8	-0x41 <L0>
 f0 59 60 01           stm16	[0x160], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<dispatch(ChunkCoord)>:
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 01                 cmpi.s8	r6, 0x1
 d1 20                 brne8	0x20 <L0>
 c3 ff                 ldi8	r7, 0xff
 8d                    and	r7, r5
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 f1 28                 mov	r6, r0
 1a                    add	r6, r6
 f2 28                 add	r6, r0
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 c2 53                 ldi8	r6, 0x53
 c3 25                 ldi8	r7, 0x25
 cc 04                 cmpi.s8	r4, 0x4
 fb 37                 cmov.eq	r6, r7
 c3 0b                 ldi8	r7, 0xb
 cc 03                 cmpi.s8	r4, 0x3
 02                    mov	r4, r6
 fb 27                 cmov.eq	r4, r7
 d4 02                 jmp8	0x2 <L1>
<L0>:
 c0 95                 ldi8	r4, 0x95
<L1>:
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
