
byte_phi_stream.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 byte_phi_stream.c
00000100 l     O .data	00000008 ram_bytes
0000031c l     F .text	0000001d scan_ram
00000339 l     F .text	0000002c scan_program
00000108 l     O .data	00000002 byte_phi_stream_result
00000367 l     O .rodata	00000008 program_bytes
00000000 l    df *ABS*	00000000 runtime.c
0000036f l       .init_array	00000000 .hidden __init_array_end
0000036f l       .init_array	00000000 .hidden __init_array_start
0000036f l       .fini_array	00000000 .hidden __fini_array_start
0000036f l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000055 avm_test_main
00000365 g     F .text	00000002 avm_halt
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
 e1 47 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 6f 03              ldi16	r4, 0x36f
 c1 00                 ldi8	r5, 0x0
 c6 6f 03              ldi16	r6, 0x36f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 6f 03           ldi16	r0, 0x36f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 6f 03           ldi16	r2, 0x36f
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
 c4 6f 03              ldi16	r4, 0x36f
 c1 00                 ldi8	r5, 0x0
 c6 6f 03              ldi16	r6, 0x36f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 6f 03           ldi16	r2, 0x36f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 6f 03           ldi16	r0, 0x36f
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
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 f0 48 00 01           stm8	[0x100], r0
 c0 25                 ldi8	r4, 0x25
 f0 4c 01 01           stm8	[0x101], r4
 c0 4a                 ldi8	r4, 0x4a
 f0 4c 02 01           stm8	[0x102], r4
 c0 6f                 ldi8	r4, 0x6f
 f0 4c 03 01           stm8	[0x103], r4
 c0 94                 ldi8	r4, 0x94
 f0 4c 04 01           stm8	[0x104], r4
 c0 b9                 ldi8	r4, 0xb9
 f0 4c 05 01           stm8	[0x105], r4
 c0 de                 ldi8	r4, 0xde
 f0 4c 06 01           stm8	[0x106], r4
 c0 03                 ldi8	r4, 0x3
 f0 4c 07 01           stm8	[0x107], r4
 f0 02 80              ldi8	r2, 0x80
 d7 01                 sys	debug_break
<L0>:
 d5 1b                 call8	scan_ram
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 d5 32                 call8	scan_program
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 ee                 brne8	-0x12 <L0>
 f0 58 08 01           stm16	[0x108], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<scan_ram>:
 b0                    push16	r0
 c3 ff                 ldi8	r7, 0xff
 a5                    xor	r5, r5
 c2 07                 ldi8	r6, 0x7
 f0 04 00 01           ldi16	r0, 0x100
 01                    mov	r4, r5
<L0>:
 cf 20                 cmpi.s8	r7, 0x20
 f8 17                 cset.ult	r7
 13                    add	r4, r7
 0d                    mov	r7, r5
 8e                    and	r7, r6
 f2 2c                 add	r7, r0
 4f                    ld8u	r7, [r7]
 f4 ad                 inc16	r5
 cd 41                 cmpi.s8	r5, 0x41
 d1 f0                 brne8	-0x10 <L0>
 b8                    pop16	r0
 ef                    ret

<scan_program>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c3 ff                 ldi8	r7, 0xff
 a5                    xor	r5, r5
 c2 07                 ldi8	r6, 0x7
 01                    mov	r4, r5
<L0>:
 cf 20                 cmpi.s8	r7, 0x20
 f8 17                 cset.ult	r7
 13                    add	r4, r7
 0d                    mov	r7, r5
 8e                    and	r7, r6
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f0 04 67 03           ldi16	r0, 0x367
 f0 01 00              ldi8	r1, 0x0
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 f4 ad                 inc16	r5
 cd 41                 cmpi.s8	r5, 0x41
 d1 e3                 brne8	-0x1d <L0>
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
