
byte_load_liveout.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 byte_load_liveout.c
0000033d l     F .text	0000004c step
00000391 l     O .rodata	00000008 program_bytes
00000389 l     F .text	00000006 consume
00000100 l     O .data	00000001 choose
00000101 l     O .data	00000002 byte_load_liveout_result
00000103 l     O .data	00000008 ram_bytes
00000000 l    df *ABS*	00000000 runtime.c
00000399 l       .init_array	00000000 .hidden __init_array_end
00000399 l       .init_array	00000000 .hidden __init_array_start
00000399 l       .fini_array	00000000 .hidden __fini_array_start
00000399 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000076 avm_test_main
0000038f g     F .text	00000002 avm_halt
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
 e1 71 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 99 03              ldi16	r4, 0x399
 c1 00                 ldi8	r5, 0x0
 c6 99 03              ldi16	r6, 0x399
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 99 03           ldi16	r0, 0x399
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 99 03           ldi16	r2, 0x399
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
 c4 99 03              ldi16	r4, 0x399
 c1 00                 ldi8	r5, 0x0
 c6 99 03              ldi16	r6, 0x399
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 99 03           ldi16	r2, 0x399
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 99 03           ldi16	r0, 0x399
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
 d6 fc                 adjsp	-0x4
 c0 81                 ldi8	r4, 0x81
 f0 4c 03 01           stm8	[0x103], r4
 c0 a6                 ldi8	r4, 0xa6
 f0 4c 04 01           stm8	[0x104], r4
 c0 cb                 ldi8	r4, 0xcb
 f0 4c 05 01           stm8	[0x105], r4
 c0 f0                 ldi8	r4, 0xf0
 f0 4c 06 01           stm8	[0x106], r4
 c0 15                 ldi8	r4, 0x15
 f0 4c 07 01           stm8	[0x107], r4
 c0 3a                 ldi8	r4, 0x3a
 f0 4c 08 01           stm8	[0x108], r4
 c0 5f                 ldi8	r4, 0x5f
 f0 4c 09 01           stm8	[0x109], r4
 c0 84                 ldi8	r4, 0x84
 f0 4c 0a 01           stm8	[0x10a], r4
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 c0 07                 ldi8	r4, 0x7
 f4 40                 stsp16	[sp+0x0], r4
 f0 07 00 01           ldi16	r3, 0x100
 f1 01                 mov	r0, r1
 f1 11                 mov	r2, r1
<L0>:
 f1 21                 mov	r4, r1
 f4 09                 ldsp16	r5, [sp+0x2]
 81                    and	r4, r5
 f0 4c 00 01           stm8	[0x100], r4
 f1 21                 mov	r4, r1
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 f1 26                 mov	r5, r2
 f2 24                 add	r5, r0
 d5 18                 call8	step
 f9 52                 xor	r2, r4
 f4 a9                 inc16	r1
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 e2                 brne8	-0x1e <L0>
 f0 5a 01 01           stm16	[0x101], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<step>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 06 91 03           ldi16	r2, 0x391
 f0 03 00              ldi8	r3, 0x0
 f7 67                 add32	q1, q3
 c6 03 01              ldi16	r6, 0x103
 18                    add	r6, r4
 f5 38                 ld8u	r0, [r6]
 f0 60 24              ldp8u	r1, [q1]
 f0 44 00 01           ldm8u	r4, [0x100]
 f4 a4                 tst8	r4
 d0 12                 breq8	0x12 <L0>
 f1 20                 mov	r4, r0
 f1 05                 mov	r0, r5
 d5 26                 call8	consume
 f1 14                 mov	r2, r4
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d5 1e                 call8	consume
 f9 8a                 xor	r4, r2
 d4 15                 jmp8	0x15 <L1>
<L0>:
 c6 5a a5              ldi16	r6, 0xa55a
 a9                    xor	r6, r5
 f1 21                 mov	r4, r1
 f1 0d                 mov	r1, r5
 06                    mov	r5, r6
 d5 0f                 call8	consume
 f1 14                 mov	r2, r4
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d5 07                 call8	consume
 f2 22                 add	r4, r2
<L1>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<consume>:
 08                    mov	r6, r4
 fa 58                 lsl16i	r6, 0x8
 92                    or	r4, r6
 11                    add	r4, r5
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
