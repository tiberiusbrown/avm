
popcount.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 popcount.c
00000100 l     O .data	00000030 words
00000130 l     O .data	00000002 result
00000000 l    df *ABS*	00000000 runtime.c
00000654 l       .init_array	00000000 .hidden __init_array_end
00000654 l       .init_array	00000000 .hidden __init_array_start
00000654 l       .fini_array	00000000 .hidden __fini_array_start
00000654 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000038b avm_test_main
00000652 g     F .text	00000002 avm_halt
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
 e1 34 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 54 06              ldi16	r4, 0x654
 c1 00                 ldi8	r5, 0x0
 c6 54 06              ldi16	r6, 0x654
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 54 06           ldi16	r0, 0x654
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 54 06           ldi16	r2, 0x654
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
 c4 54 06              ldi16	r4, 0x654
 c1 00                 ldi8	r5, 0x0
 c6 54 06              ldi16	r6, 0x654
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 54 06           ldi16	r2, 0x654
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 54 06           ldi16	r0, 0x654
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
 c4 01 80              ldi16	r4, 0x8001
 f0 5c 00 01           stm16	[0x100], r4
 c4 0c 89              ldi16	r4, 0x890c
 f0 5c 02 01           stm16	[0x102], r4
 c4 1b 92              ldi16	r4, 0x921b
 f0 5c 04 01           stm16	[0x104], r4
 c4 26 9b              ldi16	r4, 0x9b26
 f0 5c 06 01           stm16	[0x106], r4
 c4 35 a4              ldi16	r4, 0xa435
 f0 5c 08 01           stm16	[0x108], r4
 c4 40 ad              ldi16	r4, 0xad40
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 4f b6              ldi16	r4, 0xb64f
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 5a bf              ldi16	r4, 0xbf5a
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 69 c8              ldi16	r4, 0xc869
 f0 5c 10 01           stm16	[0x110], r4
 c4 74 d1              ldi16	r4, 0xd174
 f0 5c 12 01           stm16	[0x112], r4
 c4 83 da              ldi16	r4, 0xda83
 f0 5c 14 01           stm16	[0x114], r4
 c4 8e e3              ldi16	r4, 0xe38e
 f0 5c 16 01           stm16	[0x116], r4
 c4 9d ec              ldi16	r4, 0xec9d
 f0 5c 18 01           stm16	[0x118], r4
 c4 a8 f5              ldi16	r4, 0xf5a8
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 b7 fe              ldi16	r4, 0xfeb7
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 c2 07              ldi16	r4, 0x7c2
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 d1 10              ldi16	r4, 0x10d1
 f0 5c 20 01           stm16	[0x120], r4
 c4 dc 19              ldi16	r4, 0x19dc
 f0 5c 22 01           stm16	[0x122], r4
 c4 eb 22              ldi16	r4, 0x22eb
 f0 5c 24 01           stm16	[0x124], r4
 c4 f6 2b              ldi16	r4, 0x2bf6
 f0 5c 26 01           stm16	[0x126], r4
 c4 05 35              ldi16	r4, 0x3505
 f0 5c 28 01           stm16	[0x128], r4
 c4 10 3e              ldi16	r4, 0x3e10
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 1f 47              ldi16	r4, 0x471f
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 2a 50              ldi16	r4, 0x502a
 f0 5c 2e 01           stm16	[0x12e], r4
 a5                    xor	r5, r5
 f0 00 14              ldi8	r0, 0x14
 d7 01                 sys	debug_break
 f0 05 55 55           ldi16	r1, 0x5555
 c6 33 33              ldi16	r6, 0x3333
 f0 06 0f 0f           ldi16	r2, 0xf0f
 f0 03 1f              ldi8	r3, 0x1f
<L0>:
 f0 57 00 01           ldm16	r7, [0x100]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 02 01           ldm16	r5, [0x102]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 04 01           ldm16	r7, [0x104]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 06 01           ldm16	r5, [0x106]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 08 01           ldm16	r7, [0x108]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 0a 01           ldm16	r5, [0x10a]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 0c 01           ldm16	r7, [0x10c]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 0e 01           ldm16	r5, [0x10e]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 10 01           ldm16	r7, [0x110]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 12 01           ldm16	r5, [0x112]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 14 01           ldm16	r7, [0x114]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 16 01           ldm16	r5, [0x116]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 18 01           ldm16	r7, [0x118]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 1a 01           ldm16	r5, [0x11a]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 1c 01           ldm16	r7, [0x11c]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 1e 01           ldm16	r5, [0x11e]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 20 01           ldm16	r7, [0x120]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 22 01           ldm16	r5, [0x122]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 24 01           ldm16	r7, [0x124]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 26 01           ldm16	r5, [0x126]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 28 01           ldm16	r7, [0x128]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 2a 01           ldm16	r5, [0x12a]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f0 57 2c 01           ldm16	r7, [0x12c]
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 2c                    sub	r7, r4
 03                    mov	r4, r7
 82                    and	r4, r6
 fa a2                 lsr16i	r7, 0x2
 8e                    and	r7, r6
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 13                    add	r4, r7
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f9 ec                 and	r7, r3
 1d                    add	r7, r5
 f0 55 2e 01           ldm16	r5, [0x12e]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f9 84                 and	r4, r1
 24                    sub	r5, r4
 01                    mov	r4, r5
 82                    and	r4, r6
 fa 82                 lsr16i	r5, 0x2
 86                    and	r5, r6
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 11                    add	r4, r5
 f9 88                 and	r4, r2
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f9 ac                 and	r5, r3
 17                    add	r5, r7
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 db 41 fd              brne16	-0x2bf <L0>
 f0 5d 30 01           stm16	[0x130], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
