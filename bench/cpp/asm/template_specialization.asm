
template_specialization.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 template_specialization.cpp
00000100 l     O .data	00000040 inputs
00000404 l     F .text	0000000e unsigned int transform<3u>(unsigned int)
00000412 l     F .text	0000000d unsigned int transform<7u>(unsigned int)
0000041f l     F .text	0000000d unsigned int transform<11u>(unsigned int)
00000140 l     O .data	00000002 template_result
00000000 l    df *ABS*	00000000 runtime.c
0000042e l       .init_array	00000000 .hidden __init_array_end
0000042e l       .init_array	00000000 .hidden __init_array_start
0000042e l       .fini_array	00000000 .hidden __fini_array_start
0000042e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000013d avm_test_main
0000042c g     F .text	00000002 avm_halt
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
 e1 0e 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 2e 04              ldi16	r4, 0x42e
 c1 00                 ldi8	r5, 0x0
 c6 2e 04              ldi16	r6, 0x42e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 2e 04           ldi16	r0, 0x42e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 2e 04           ldi16	r2, 0x42e
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
 c4 2e 04              ldi16	r4, 0x42e
 c1 00                 ldi8	r5, 0x0
 c6 2e 04              ldi16	r6, 0x42e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 2e 04           ldi16	r2, 0x42e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 2e 04           ldi16	r0, 0x42e
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
 d6 f8                 adjsp	-0x8
 c4 34 12              ldi16	r4, 0x1234
 f0 5c 00 01           stm16	[0x100], r4
 c4 e1 18              ldi16	r4, 0x18e1
 f0 5c 02 01           stm16	[0x102], r4
 c4 8e 1f              ldi16	r4, 0x1f8e
 f0 5c 04 01           stm16	[0x104], r4
 c4 3b 26              ldi16	r4, 0x263b
 f0 5c 06 01           stm16	[0x106], r4
 c4 e8 2c              ldi16	r4, 0x2ce8
 f0 5c 08 01           stm16	[0x108], r4
 c4 95 33              ldi16	r4, 0x3395
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 42 3a              ldi16	r4, 0x3a42
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 ef 40              ldi16	r4, 0x40ef
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 9c 47              ldi16	r4, 0x479c
 f0 5c 10 01           stm16	[0x110], r4
 c4 49 4e              ldi16	r4, 0x4e49
 f0 5c 12 01           stm16	[0x112], r4
 c4 f6 54              ldi16	r4, 0x54f6
 f0 5c 14 01           stm16	[0x114], r4
 c4 a3 5b              ldi16	r4, 0x5ba3
 f0 5c 16 01           stm16	[0x116], r4
 c4 50 62              ldi16	r4, 0x6250
 f0 5c 18 01           stm16	[0x118], r4
 c4 fd 68              ldi16	r4, 0x68fd
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 aa 6f              ldi16	r4, 0x6faa
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 57 76              ldi16	r4, 0x7657
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 04 7d              ldi16	r4, 0x7d04
 f0 5c 20 01           stm16	[0x120], r4
 c4 b1 83              ldi16	r4, 0x83b1
 f0 5c 22 01           stm16	[0x122], r4
 c4 5e 8a              ldi16	r4, 0x8a5e
 f0 5c 24 01           stm16	[0x124], r4
 c4 0b 91              ldi16	r4, 0x910b
 f0 5c 26 01           stm16	[0x126], r4
 c4 b8 97              ldi16	r4, 0x97b8
 f0 5c 28 01           stm16	[0x128], r4
 c4 65 9e              ldi16	r4, 0x9e65
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 12 a5              ldi16	r4, 0xa512
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 bf ab              ldi16	r4, 0xabbf
 f0 5c 2e 01           stm16	[0x12e], r4
 c4 6c b2              ldi16	r4, 0xb26c
 f0 5c 30 01           stm16	[0x130], r4
 c4 19 b9              ldi16	r4, 0xb919
 f0 5c 32 01           stm16	[0x132], r4
 c4 c6 bf              ldi16	r4, 0xbfc6
 f0 5c 34 01           stm16	[0x134], r4
 c4 73 c6              ldi16	r4, 0xc673
 f0 5c 36 01           stm16	[0x136], r4
 c4 20 cd              ldi16	r4, 0xcd20
 f0 5c 38 01           stm16	[0x138], r4
 c4 cd d3              ldi16	r4, 0xd3cd
 f0 5c 3a 01           stm16	[0x13a], r4
 c4 7a da              ldi16	r4, 0xda7a
 f0 5c 3c 01           stm16	[0x13c], r4
 c4 27 e1              ldi16	r4, 0xe127
 f0 5c 3e 01           stm16	[0x13e], r4
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 f1 05                 mov	r0, r5
 f4 49                 stsp16	[sp+0x2], r5
 f4 01                 ldsp16	r5, [sp+0x0]
 c4 00 01              ldi16	r4, 0x100
 f4 59                 stsp16	[sp+0x6], r5
 f7 21                 ld16	r1, [r4+]
 f4 50                 stsp16	[sp+0x4], r4
 f1 21                 mov	r4, r1
 f2 20                 add	r4, r0
 d5 3b                 call8	_ZL9transformILj3EEjj
 f1 14                 mov	r2, r4
 f9 42                 xor	r2, r0
 f1 22                 mov	r4, r2
 f9 86                 xor	r4, r1
 d5 3f                 call8	_ZL9transformILj7EEjj
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 f2 3b                 sub	r1, r3
 f1 21                 mov	r4, r1
 d5 42                 call8	_ZL9transformILj11EEjj
 f4 19                 ldsp16	r5, [sp+0x6]
 f1 04                 mov	r0, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f9 0e                 xor	r0, r3
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 d2                 brne8	avm_test_main+246
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 18                 cmpi.s8	r4, 0x18
 d1 c0                 brne8	avm_test_main+239
 f0 58 40 01           stm16	[0x140], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<unsigned int transform<3u>(unsigned int)>:
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 99                    or	r6, r5
 c5 33 33              ldi16	r5, 0x3333
 a6                    xor	r5, r6
 11                    add	r4, r5
 ef                    ret

<unsigned int transform<7u>(unsigned int)>:
 04                    mov	r5, r4
 fa 89                 lsr16i	r5, 0x9
 08                    mov	r6, r4
 fa 57                 lsl16i	r6, 0x7
 99                    or	r6, r5
 c5 77 77              ldi16	r5, 0x7777
 a6                    xor	r5, r6
 11                    add	r4, r5
 ef                    ret

<unsigned int transform<11u>(unsigned int)>:
 04                    mov	r5, r4
 fa 85                 lsr16i	r5, 0x5
 08                    mov	r6, r4
 fa 5b                 lsl16i	r6, 0xb
 99                    or	r6, r5
 c5 bb bb              ldi16	r5, 0xbbbb
 a6                    xor	r5, r6
 11                    add	r4, r5
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
