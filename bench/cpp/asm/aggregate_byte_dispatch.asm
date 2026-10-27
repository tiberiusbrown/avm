
aggregate_byte_dispatch.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 aggregate_byte_dispatch.cpp
00000433 l     F .text	00000024 dispatch(ChunkCoord)
00000100 l     O .data	00000002 aggregate_byte_dispatch_result
00000102 l     O .data	00000060 input
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
000004be l       .init_array	00000000 .hidden __init_array_end
000004be l       .init_array	00000000 .hidden __init_array_start
000004be l       .fini_array	00000000 .hidden __fini_array_start
000004be l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000001cc avm_test_main
00000459 g     F .text	00000065 __avm_terminate
00000457 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 43 02              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 34 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 be 04              ldi16	r4, 0x4be
 c1 00                 ldi8	r5, 0x0
 c6 be 04              ldi16	r6, 0x4be
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 be 04           ldi16	r0, 0x4be
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 be 04           ldi16	r2, 0x4be
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
 f2 30                 sub	r0, r0
 f0 48 02 01           stm8	[0x102], r0
 f0 48 03 01           stm8	[0x103], r0
 f0 48 04 01           stm8	[0x104], r0
 c0 01                 ldi8	r4, 0x1
 f0 4c 05 01           stm8	[0x105], r4
 f0 4c 06 01           stm8	[0x106], r4
 f0 48 07 01           stm8	[0x107], r0
 f0 4c 08 01           stm8	[0x108], r4
 c1 02                 ldi8	r5, 0x2
 f0 4d 09 01           stm8	[0x109], r5
 f0 48 0a 01           stm8	[0x10a], r0
 f0 4c 0b 01           stm8	[0x10b], r4
 c2 03                 ldi8	r6, 0x3
 f0 4e 0c 01           stm8	[0x10c], r6
 f0 48 0d 01           stm8	[0x10d], r0
 f0 01 7f              ldi8	r1, 0x7f
 f0 49 0e 01           stm8	[0x10e], r1
 f0 48 0f 01           stm8	[0x10f], r0
 f0 4c 10 01           stm8	[0x110], r4
 f0 02 80              ldi8	r2, 0x80
 f0 4a 11 01           stm8	[0x111], r2
 f0 4c 12 01           stm8	[0x112], r4
 f0 4c 13 01           stm8	[0x113], r4
 c3 ff                 ldi8	r7, 0xff
 f0 4f 14 01           stm8	[0x114], r7
 f0 4d 15 01           stm8	[0x115], r5
 f0 4c 16 01           stm8	[0x116], r4
 f0 4c 17 01           stm8	[0x117], r4
 f0 4e 18 01           stm8	[0x118], r6
 f0 4c 19 01           stm8	[0x119], r4
 f0 48 1a 01           stm8	[0x11a], r0
 f0 48 1b 01           stm8	[0x11b], r0
 f0 4d 1c 01           stm8	[0x11c], r5
 f0 4c 1d 01           stm8	[0x11d], r4
 f0 4c 1e 01           stm8	[0x11e], r4
 f0 4d 1f 01           stm8	[0x11f], r5
 f0 4c 20 01           stm8	[0x120], r4
 f0 4d 21 01           stm8	[0x121], r5
 f0 4d 22 01           stm8	[0x122], r5
 f0 4c 23 01           stm8	[0x123], r4
 f0 4e 24 01           stm8	[0x124], r6
 f0 4d 25 01           stm8	[0x125], r5
 f0 49 26 01           stm8	[0x126], r1
 f0 48 27 01           stm8	[0x127], r0
 f0 4e 28 01           stm8	[0x128], r6
 f0 4a 29 01           stm8	[0x129], r2
 f0 4c 2a 01           stm8	[0x12a], r4
 f0 4e 2b 01           stm8	[0x12b], r6
 f0 4f 2c 01           stm8	[0x12c], r7
 f0 4d 2d 01           stm8	[0x12d], r5
 f0 4e 2e 01           stm8	[0x12e], r6
 f0 4c 2f 01           stm8	[0x12f], r4
 f0 4e 30 01           stm8	[0x130], r6
 f0 4e 31 01           stm8	[0x131], r6
 f0 48 32 01           stm8	[0x132], r0
 f0 48 33 01           stm8	[0x133], r0
 f0 48 34 01           stm8	[0x134], r0
 f0 4c 35 01           stm8	[0x135], r4
 f0 4c 36 01           stm8	[0x136], r4
 f0 48 37 01           stm8	[0x137], r0
 f0 4c 38 01           stm8	[0x138], r4
 f0 4d 39 01           stm8	[0x139], r5
 f0 48 3a 01           stm8	[0x13a], r0
 f0 4c 3b 01           stm8	[0x13b], r4
 f0 4e 3c 01           stm8	[0x13c], r6
 f0 48 3d 01           stm8	[0x13d], r0
 f0 49 3e 01           stm8	[0x13e], r1
 f0 48 3f 01           stm8	[0x13f], r0
 f0 4c 40 01           stm8	[0x140], r4
 f0 4a 41 01           stm8	[0x141], r2
 f0 4c 42 01           stm8	[0x142], r4
 f0 4c 43 01           stm8	[0x143], r4
 f0 4f 44 01           stm8	[0x144], r7
 f0 4d 45 01           stm8	[0x145], r5
 f0 4c 46 01           stm8	[0x146], r4
 f0 4c 47 01           stm8	[0x147], r4
 f0 4e 48 01           stm8	[0x148], r6
 f0 4c 49 01           stm8	[0x149], r4
 f0 48 4a 01           stm8	[0x14a], r0
 f0 48 4b 01           stm8	[0x14b], r0
 f0 4d 4c 01           stm8	[0x14c], r5
 f0 4c 4d 01           stm8	[0x14d], r4
 f0 4c 4e 01           stm8	[0x14e], r4
 f0 4d 4f 01           stm8	[0x14f], r5
 f0 4c 50 01           stm8	[0x150], r4
 f0 4d 51 01           stm8	[0x151], r5
 f0 4d 52 01           stm8	[0x152], r5
 f0 4c 53 01           stm8	[0x153], r4
 f0 4e 54 01           stm8	[0x154], r6
 f0 4d 55 01           stm8	[0x155], r5
 f0 49 56 01           stm8	[0x156], r1
 f0 48 57 01           stm8	[0x157], r0
 f0 4e 58 01           stm8	[0x158], r6
 f0 4a 59 01           stm8	[0x159], r2
 f0 4c 5a 01           stm8	[0x15a], r4
 f0 4e 5b 01           stm8	[0x15b], r6
 f0 4f 5c 01           stm8	[0x15c], r7
 f0 4d 5d 01           stm8	[0x15d], r5
 f0 4e 5e 01           stm8	[0x15e], r6
 f0 4c 5f 01           stm8	[0x15f], r4
 f0 4e 60 01           stm8	[0x160], r6
 f0 4e 61 01           stm8	[0x161], r6
 d7 01                 sys	debug_break
 f1 08                 mov	r1, r0
<L0>:
 f0 03 20              ldi8	r3, 0x20
 f0 06 04 01           ldi16	r2, 0x104
<L1>:
 ed 84 1e              ld8u	r4, [r2-2]
 08                    mov	r6, r4
 ed 84 1f              ld8u	r4, [r2-1]
 fa 38                 lsl16i	r4, 0x8
 92                    or	r4, r6
 ed a4 20              ld8u	r5, [r2+0]
 d5 1e                 call8	_ZL8dispatch10ChunkCoord
 f2 0c                 add	r1, r4
 f0 0a 03              addi.s8	r2, 0x3
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 e6                 brne8	-0x1a <L1>
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 d8                 brne8	-0x28 <L0>
 f0 59 00 01           stm16	[0x100], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<dispatch(ChunkCoord)>:
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 01                 cmpi.s8	r6, 0x1
 d1 1a                 brne8	0x1a <L0>
 c3 ff                 ldi8	r7, 0xff
 8d                    and	r7, r5
 0b                    mov	r6, r7
 06                    mov	r5, r6
 15                    add	r5, r5
 16                    add	r5, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 c1 53                 ldi8	r5, 0x53
 c2 25                 ldi8	r6, 0x25
 cc 04                 cmpi.s8	r4, 0x4
 fb 2e                 cmov.eq	r5, r6
 c2 0b                 ldi8	r6, 0xb
 cc 03                 cmpi.s8	r4, 0x3
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 ef                    ret
<L0>:
 c0 95                 ldi8	r4, 0x95
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
 e1 92 fb              call16	-1134 <__avm_run_local_dtors>
<L0>:
 c4 be 04              ldi16	r4, 0x4be
 c1 00                 ldi8	r5, 0x0
 c6 be 04              ldi16	r6, 0x4be
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 be 04           ldi16	r2, 0x4be
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 be 04           ldi16	r0, 0x4be
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
 e1 49 fb              call16	-1207 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
