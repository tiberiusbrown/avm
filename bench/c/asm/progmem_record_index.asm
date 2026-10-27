
progmem_record_index.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 progmem_record_index.c
0000042d l     O .rodata	00000600 records
00000a2d l     O .rodata	00000004 data
00000a31 l     O .rodata	00000007 title
00000100 l     O .data	00000002 progmem_record_index_result
00000102 l     O .data	00000040 selections
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000a38 l       .init_array	00000000 .hidden __init_array_end
00000a38 l       .init_array	00000000 .hidden __init_array_start
00000a38 l       .fini_array	00000000 .hidden __fini_array_start
00000a38 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000015f avm_test_main
000003c8 g     F .text	00000065 __avm_terminate
000003c6 g     F .text	00000002 avm_halt
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
 e1 b2 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 a3 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 38 0a              ldi16	r4, 0xa38
 c1 00                 ldi8	r5, 0x0
 c6 38 0a              ldi16	r6, 0xa38
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 38 0a           ldi16	r0, 0xa38
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 38 0a           ldi16	r2, 0xa38
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
 d6 fe                 adjsp	-0x2
 a5                    xor	r5, r5
 f0 4d 02 01           stm8	[0x102], r5
 c0 7f                 ldi8	r4, 0x7f
 f0 4c 03 01           stm8	[0x103], r4
 c2 80                 ldi8	r6, 0x80
 f0 4e 04 01           stm8	[0x104], r6
 c3 ff                 ldi8	r7, 0xff
 f0 4f 05 01           stm8	[0x105], r7
 f0 4d 06 01           stm8	[0x106], r5
 f0 4c 07 01           stm8	[0x107], r4
 f0 4e 08 01           stm8	[0x108], r6
 f0 4f 09 01           stm8	[0x109], r7
 f0 4d 0a 01           stm8	[0x10a], r5
 f0 4c 0b 01           stm8	[0x10b], r4
 f0 4e 0c 01           stm8	[0x10c], r6
 f0 4f 0d 01           stm8	[0x10d], r7
 f0 4d 0e 01           stm8	[0x10e], r5
 f0 4c 0f 01           stm8	[0x10f], r4
 f0 4e 10 01           stm8	[0x110], r6
 f0 4f 11 01           stm8	[0x111], r7
 f0 4d 12 01           stm8	[0x112], r5
 f0 4c 13 01           stm8	[0x113], r4
 f0 4e 14 01           stm8	[0x114], r6
 f0 4f 15 01           stm8	[0x115], r7
 f0 4d 16 01           stm8	[0x116], r5
 f0 4c 17 01           stm8	[0x117], r4
 f0 4e 18 01           stm8	[0x118], r6
 f0 4f 19 01           stm8	[0x119], r7
 f0 4d 1a 01           stm8	[0x11a], r5
 f0 4c 1b 01           stm8	[0x11b], r4
 f0 4e 1c 01           stm8	[0x11c], r6
 f0 4f 1d 01           stm8	[0x11d], r7
 f0 4d 1e 01           stm8	[0x11e], r5
 f0 4c 1f 01           stm8	[0x11f], r4
 f0 4e 20 01           stm8	[0x120], r6
 f0 4f 21 01           stm8	[0x121], r7
 f0 4d 22 01           stm8	[0x122], r5
 f0 4c 23 01           stm8	[0x123], r4
 f0 4e 24 01           stm8	[0x124], r6
 f0 4f 25 01           stm8	[0x125], r7
 f0 4d 26 01           stm8	[0x126], r5
 f0 4c 27 01           stm8	[0x127], r4
 f0 4e 28 01           stm8	[0x128], r6
 f0 4f 29 01           stm8	[0x129], r7
 f0 4d 2a 01           stm8	[0x12a], r5
 f0 4c 2b 01           stm8	[0x12b], r4
 f0 4e 2c 01           stm8	[0x12c], r6
 f0 4f 2d 01           stm8	[0x12d], r7
 f0 4d 2e 01           stm8	[0x12e], r5
 f0 4c 2f 01           stm8	[0x12f], r4
 f0 4e 30 01           stm8	[0x130], r6
 f0 4f 31 01           stm8	[0x131], r7
 f0 4d 32 01           stm8	[0x132], r5
 f0 4c 33 01           stm8	[0x133], r4
 f0 4e 34 01           stm8	[0x134], r6
 f0 4f 35 01           stm8	[0x135], r7
 f0 4d 36 01           stm8	[0x136], r5
 f0 4c 37 01           stm8	[0x137], r4
 f0 4e 38 01           stm8	[0x138], r6
 f0 4f 39 01           stm8	[0x139], r7
 f0 4d 3a 01           stm8	[0x13a], r5
 f0 4c 3b 01           stm8	[0x13b], r4
 f0 4e 3c 01           stm8	[0x13c], r6
 f0 4f 3d 01           stm8	[0x13d], r7
 f0 4d 3e 01           stm8	[0x13e], r5
 f0 4c 3f 01           stm8	[0x13f], r4
 f0 4e 40 01           stm8	[0x140], r6
 f0 4f 41 01           stm8	[0x141], r7
 d7 01                 sys	debug_break
 c7 02 01              ldi16	r7, 0x102
 01                    mov	r4, r5
 f0 06 30 04           ldi16	r2, 0x430
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f4 41                 stsp16	[sp+0x0], r5
 a5                    xor	r5, r5
<L1>:
 09                    mov	r6, r5
 1b                    add	r6, r7
 4a                    ld8u	r6, [r6]
 c3 06                 ldi8	r7, 0x6
 f3 1b                 mulu8.w	r6, r7
 af                    xor	r7, r7
 f0 04 2d 04           ldi16	r0, 0x42d
 f0 01 00              ldi8	r1, 0x0
 f7 63                 add32	q0, q3
 f0 63 00              ldp24	q0, [q0]
 f0 60 00              ldp8u	r0, [q0]
 f2 04                 add	r0, r4
 f7 6d                 add32	q3, q1
 f0 63 cc              ldp24	q3, [q3]
 f0 60 8c              ldp8u	r4, [q3]
 c7 02 01              ldi16	r7, 0x102
 f2 20                 add	r4, r0
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d1 d4                 brne8	-0x2c <L1>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 10                 cmpi.s8	r5, 0x10
 d1 c9                 brne8	-0x37 <L0>
 f0 5c 00 01           stm16	[0x100], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
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
 e1 23 fc              call16	-989 <__avm_run_local_dtors>
<L0>:
 c4 38 0a              ldi16	r4, 0xa38
 c1 00                 ldi8	r5, 0x0
 c6 38 0a              ldi16	r6, 0xa38
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 38 0a           ldi16	r2, 0xa38
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 38 0a           ldi16	r0, 0xa38
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
 e1 da fb              call16	-1062 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
