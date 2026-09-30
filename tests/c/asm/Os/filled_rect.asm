
filled_rect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 filled_rect.c
00000536 l     F .text	00000106 check_case
0000063c l     F .text	00000091 check_round_trip
000006cd l     F .text	00000044 prepare_memory
00000711 l     F .text	00000058 check_guards
00000769 l     F .text	0000015d fail_case
00000100 l     O .data	00000005 .L.str
00000105 l     O .data	00000005 .L.str.1
0000010a l     O .data	00000005 .L.str.2
00000000 l    df *ABS*	00000000 runtime.c
000008c8 l       .init_array	00000000 .hidden __init_array_end
000008c8 l       .init_array	00000000 .hidden __init_array_start
000008c8 l       .fini_array	00000000 .hidden __fini_array_start
000008c8 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000025f avm_test_main
000008c6 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 a8 06              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 c8 08              ldi16	r4, 0x8c8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 c8 08              ldi16	r6, 0x8c8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 c8 08           ldi16	r0, 0x8c8
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 c8 08           ldi16	r2, 0x8c8
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
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
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 c8 08              ldi16	r4, 0x8c8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 c8 08              ldi16	r6, 0x8c8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 c8 08           ldi16	r2, 0x8c8
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 c8 08           ldi16	r0, 0x8c8
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b0                    push16	r0
 d6 fd                 adjsp	-0x3
 c4 0d 08              ldi16	r4, 0x80d
 c1 31                 ldi8	r5, 0x31
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 a0                    xor	r4, r4
 f0 00 01              ldi8	r0, 0x1
 c2 0a                 ldi8	r6, 0xa
 c3 08                 ldi8	r7, 0x8
 f1 24                 mov	r5, r0
 e1 46 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 3b 02              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 0d 08              ldi16	r4, 0x80d
 c1 c7                 ldi8	r5, 0xc7
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f0 00 01              ldi8	r0, 0x1
 a5                    xor	r5, r5
 c2 0a                 ldi8	r6, 0xa
 c3 08                 ldi8	r7, 0x8
 f1 20                 mov	r4, r0
 e1 27 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 1c 02              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 11 13              ldi16	r4, 0x1311
 c1 5a                 ldi8	r5, 0x5a
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 02                 ldi8	r4, 0x2
 f0 00 01              ldi8	r0, 0x1
 c2 14                 ldi8	r6, 0x14
 c3 05                 ldi8	r7, 0x5
 f1 24                 mov	r5, r0
 e1 07 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db fc 01              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 11 13              ldi16	r4, 0x1311
 c1 a5                 ldi8	r5, 0xa5
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 c2 14                 ldi8	r6, 0x14
 c3 05                 ldi8	r7, 0x5
 e1 eb 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db e0 01              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 0c 0a              ldi16	r4, 0xa0c
 c1 96                 ldi8	r5, 0x96
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 04                 ldi8	r4, 0x4
 f0 00 01              ldi8	r0, 0x1
 c6 f9 ff              ldi16	r6, 0xfff9
 c7 fd ff              ldi16	r7, 0xfffd
 f1 24                 mov	r5, r0
 e1 c9 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db be 01              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 14 14              ldi16	r4, 0x1414
 c1 69                 ldi8	r5, 0x69
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 c2 7c                 ldi8	r6, 0x7c
 c3 3c                 ldi8	r7, 0x3c
 e1 ad 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db a2 01              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 09 02              ldi16	r4, 0x209
 c1 3c                 ldi8	r5, 0x3c
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 06                 ldi8	r4, 0x6
 f0 00 01              ldi8	r0, 0x1
 c2 28                 ldi8	r6, 0x28
 c3 07                 ldi8	r7, 0x7
 f1 24                 mov	r5, r0
 e1 8d 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 82 01              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 01 01              ldi16	r4, 0x101
 c1 c3                 ldi8	r5, 0xc3
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 c2 7f                 ldi8	r6, 0x7f
 c3 3f                 ldi8	r7, 0x3f
 e1 71 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 66 01              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 ff ff              ldi16	r4, 0xffff
 c1 55                 ldi8	r5, 0x55
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 08                 ldi8	r4, 0x8
 f0 00 01              ldi8	r0, 0x1
 c6 81 ff              ldi16	r6, 0xff81
 c7 41 ff              ldi16	r7, 0xff41
 f1 24                 mov	r5, r0
 e1 4f 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 44 01              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 80 40              ldi16	r4, 0x4080
 c1 aa                 ldi8	r5, 0xaa
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 09                    mov	r6, r5
 0d                    mov	r7, r5
 e1 35 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 2a 01              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 00 11              ldi16	r4, 0x1100
 c1 0f                 ldi8	r5, 0xf
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0a                 ldi8	r4, 0xa
 f0 00 01              ldi8	r0, 0x1
 c2 1e                 ldi8	r6, 0x1e
 c3 0c                 ldi8	r7, 0xc
 f1 24                 mov	r5, r0
 e1 15 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 0a 01              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c0 11                 ldi8	r4, 0x11
 c1 f0                 ldi8	r5, 0xf0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0b                 ldi8	r4, 0xb
 a5                    xor	r5, r5
 c2 1e                 ldi8	r6, 0x1e
 c3 0c                 ldi8	r7, 0xc
 e1 fa 00              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db ef 00              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 11 09              ldi16	r4, 0x911
 c1 87                 ldi8	r5, 0x87
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f0 00 01              ldi8	r0, 0x1
 c2 80                 ldi8	r6, 0x80
 c0 0c                 ldi8	r4, 0xc
 f1 24                 mov	r5, r0
 0c                    mov	r7, r4
 e1 db 00              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db d0 00              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 14 09              ldi16	r4, 0x914
 c1 78                 ldi8	r5, 0x78
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0d                 ldi8	r4, 0xd
 a5                    xor	r5, r5
 c6 ec ff              ldi16	r6, 0xffec
 c3 0c                 ldi8	r7, 0xc
 e1 be 00              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db b3 00              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 11 09              ldi16	r4, 0x911
 c1 1e                 ldi8	r5, 0x1e
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0e                 ldi8	r4, 0xe
 f0 00 01              ldi8	r0, 0x1
 c2 1e                 ldi8	r6, 0x1e
 c7 f7 ff              ldi16	r7, 0xfff7
 f1 24                 mov	r5, r0
 e1 9d 00              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 92 00              brne16	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 11 09              ldi16	r4, 0x911
 c1 e1                 ldi8	r5, 0xe1
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0f                 ldi8	r4, 0xf
 a5                    xor	r5, r5
 c2 1e                 ldi8	r6, 0x1e
 c3 40                 ldi8	r7, 0x40
 e1 81 00              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 d1 77                 brne8	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 ff 09              ldi16	r4, 0x9ff
 c1 42                 ldi8	r5, 0x42
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 10                 ldi8	r4, 0x10
 f0 00 01              ldi8	r0, 0x1
 c6 02 ff              ldi16	r6, 0xff02
 c3 0b                 ldi8	r7, 0xb
 f1 24                 mov	r5, r0
 d5 62                 call8	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 d1 58                 brne8	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 05 ff              ldi16	r4, 0xff05
 c1 24                 ldi8	r5, 0x24
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 11                 ldi8	r4, 0x11
 a5                    xor	r5, r5
 c2 1e                 ldi8	r6, 0x1e
 c7 02 ff              ldi16	r7, 0xff02
 d5 47                 call8	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 d1 3d                 brne8	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 ff ff              ldi16	r4, 0xffff
 c1 66                 ldi8	r5, 0x66
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 12                 ldi8	r4, 0x12
 f0 00 01              ldi8	r0, 0x1
 c2 78                 ldi8	r6, 0x78
 c3 3c                 ldi8	r7, 0x3c
 f1 24                 mov	r5, r0
 d5 29                 call8	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 d1 1f                 brne8	avm_test_main+603
 d6 fd                 adjsp	-0x3
 c4 ff ff              ldi16	r4, 0xffff
 c1 99                 ldi8	r5, 0x99
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 13                 ldi8	r4, 0x13
 a5                    xor	r5, r5
 c6 38 ff              ldi16	r6, 0xff38
 0e                    mov	r7, r6
 d5 0f                 call8	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 d1 05                 brne8	avm_test_main+603
 e1 0c 01              call16	check_round_trip
 f1 04                 mov	r0, r4
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<check_case>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f1 1f                 mov	r3, r7
 f1 06                 mov	r0, r6
 f4 71                 stsp16	[sp+0xc], r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 1d 1e              ldsp8u	r5, [sp+0x1e]
 f1 23                 mov	r4, r3
 f0 3d 10              stsp16	[sp+0x10], r5
 11                    add	r4, r5
 f0 01 40              ldi8	r1, 0x40
 cc 40                 cmpi.s8	r4, 0x40
 fd 0c                 cmov.slt	r1, r4
 aa                    xor	r6, r6
 f0 0f 01              cmpi.s8	r3, 0x1
 f1 16                 mov	r2, r6
 fd 53                 cmov.sge	r2, r3
 f0 0c 01              cmpi.s8	r0, 0x1
 fd 70                 cmov.sge	r6, r0
 f0 1c 1d              ldsp8u	r4, [sp+0x1d]
 f1 24                 mov	r5, r0
 f4 78                 stsp16	[sp+0xe], r4
 14                    add	r5, r4
 c3 80                 ldi8	r7, 0x80
 37                    cmp	r5, r7
 fd 3d                 cmov.slt	r7, r5
 f0 1c 1f              ldsp8u	r4, [sp+0x1f]
 f4 62                 stsp16	[sp+0x8], r6
 f4 53                 stsp16	[sp+0x4], r7
 3b                    cmp	r6, r7
 d9 04                 brsge8	check_case+70
 f5 11                 cmp	r2, r1
 d3 09                 brslt8	check_case+79
 a5                    xor	r5, r5
 f1 0d                 mov	r1, r5
 f4 51                 stsp16	[sp+0x4], r5
 f1 15                 mov	r2, r5
 f4 61                 stsp16	[sp+0x8], r5
 f4 68                 stsp16	[sp+0xa], r4
 e1 43 01              call16	prepare_memory
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 2c                 tst16	r4
 d0 0d                 breq8	check_case+103
 f1 20                 mov	r4, r0
 f1 27                 mov	r5, r3
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 d7 27                 sys	draw_filled_rect_white
 d4 0b                 jmp8	check_case+114
 f1 20                 mov	r4, r0
 f1 27                 mov	r5, r3
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 d7 28                 sys	draw_filled_rect_black
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 29                 ldsp16	r5, [sp+0xa]
 e1 62 01              call16	check_guards
 c1 01                 ldi8	r5, 0x1
 f4 a4                 tst8	r4
 d1 7f                 brne8	check_case+254
 a0                    xor	r4, r4
 c5 f8 07              ldi16	r5, 0x7f8
 f4 49                 stsp16	[sp+0x2], r5
 c1 25                 ldi8	r5, 0x25
 f4 59                 stsp16	[sp+0x6], r5
 f0 00 7f              ldi8	r0, 0x7f
 08                    mov	r6, r4
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 06                    mov	r5, r6
 0e                    mov	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 fe 2e                 mul16	r5, r6
 0b                    mov	r6, r7
 fa 92                 lsr16i	r6, 0x2
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 f4 23                 ldsp16	r7, [sp+0x8]
 3b                    cmp	r6, r7
 f2 4b                 sub	r3, r3
 d2 20                 brult8	check_case+200
 f4 13                 ldsp16	r7, [sp+0x4]
 3b                    cmp	r6, r7
 d9 1b                 brsge8	check_case+200
 f4 0a                 ldsp16	r6, [sp+0x2]
 82                    and	r4, r6
 f1 2b                 mov	r6, r3
 0c                    mov	r7, r4
 1e                    add	r7, r6
 f5 2e                 cmp	r7, r2
 d2 0a                 brult8	check_case+194
 f5 2d                 cmp	r7, r1
 d9 06                 brsge8	check_case+194
 c3 01                 ldi8	r7, 0x1
 fa 0e                 shl16v	r7, r6
 f9 7d                 or	r3, r7
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
 d1 ea                 brne8	check_case+178
 f4 38                 ldsp16	r4, [sp+0xe]
 a4                    xor	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 a4                    xor	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 f9 8e                 xor	r4, r3
 f9 75                 or	r3, r5
 81                    and	r4, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 f6 2d                 tst16	r5
 fb 1c                 cmov.eq	r3, r4
 c5 00 05              ldi16	r5, 0x500
 f0 36 10              ldsp16	r6, [sp+0x10]
 16                    add	r5, r6
 f1 73                 zext8	r3
 4d                    ld8u	r7, [r5]
 f5 2f                 cmp	r7, r3
 d1 0b                 brne8	check_case+245
 f4 ae                 inc16	r6
 c4 00 04              ldi16	r4, 0x400
 38                    cmp	r6, r4
 d1 9b                 brne8	check_case+141
 a5                    xor	r5, r5
 d4 09                 jmp8	check_case+254
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 2b                 mov	r6, r3
 e1 37 01              call16	fail_case
 c1 01                 ldi8	r5, 0x1
 01                    mov	r4, r5
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_round_trip>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f0 00 5d              ldi8	r0, 0x5d
 f1 20                 mov	r4, r0
 e1 84 00              call16	prepare_memory
 f0 02 25              ldi8	r2, 0x25
 c0 25                 ldi8	r4, 0x25
 c1 06                 ldi8	r5, 0x6
 c2 2b                 ldi8	r6, 0x2b
 c3 1b                 ldi8	r7, 0x1b
 d7 27                 sys	draw_filled_rect_white
 d7 28                 sys	draw_filled_rect_black
 c0 14                 ldi8	r4, 0x14
 f1 24                 mov	r5, r0
 e1 b2 00              call16	check_guards
 f0 01 01              ldi8	r1, 0x1
 f4 a4                 tst8	r4
 d1 5f                 brne8	check_round_trip+137
 aa                    xor	r6, r6
 02                    mov	r4, r6
 fe 22                 mul16	r4, r2
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 c1 7f                 ldi8	r5, 0x7f
 86                    and	r5, r6
 f4 52                 stsp16	[sp+0x4], r6
 fa 94                 lsr16i	r6, 0x4
 c9 db                 addi.s8	r5, -0x25
 cd 2b                 cmpi.s8	r5, 0x2b
 d8 27                 bruge8	check_round_trip+101
 f4 43                 stsp16	[sp+0x0], r7
 f4 48                 stsp16	[sp+0x2], r4
 c5 f8 07              ldi16	r5, 0x7f8
 89                    and	r6, r5
 ca fa                 addi.s8	r6, -0x6
 a5                    xor	r5, r5
 0d                    mov	r7, r5
 02                    mov	r4, r6
 13                    add	r4, r7
 cc 1b                 cmpi.s8	r4, 0x1b
 d8 05                 bruge8	check_round_trip+85
 c0 01                 ldi8	r4, 0x1
 fa 03                 shl16v	r4, r7
 94                    or	r5, r4
 f4 af                 inc16	r7
 cf 08                 cmpi.s8	r7, 0x8
 d1 ef                 brne8	check_round_trip+74
 c4 ff ff              ldi16	r4, 0xffff
 a4                    xor	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d4 02                 jmp8	check_round_trip+103
 c1 ff                 ldi8	r5, 0xff
 a3                    xor	r4, r7
 f9 82                 xor	r4, r0
 81                    and	r4, r5
 c5 00 05              ldi16	r5, 0x500
 f4 12                 ldsp16	r6, [sp+0x4]
 16                    add	r5, r6
 4d                    ld8u	r7, [r5]
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 d1 0c                 brne8	check_round_trip+131
 f4 ae                 inc16	r6
 c4 00 04              ldi16	r4, 0x400
 38                    cmp	r6, r4
 d1 ac                 brne8	check_round_trip+43
 f2 39                 sub	r1, r1
 d4 06                 jmp8	check_round_trip+137
 08                    mov	r6, r4
 c0 14                 ldi8	r4, 0x14
 e1 a4 00              call16	fail_case
 f1 21                 mov	r4, r1
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<prepare_memory>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 02 5a              ldi8	r2, 0x5a
 c1 a5                 ldi8	r5, 0xa5
 f0 04 00 09           ldi16	r0, 0x900
 f0 05 fc 04           ldi16	r1, 0x4fc
 c3 04                 ldi8	r7, 0x4
 09                    mov	r6, r5
 a8                    xor	r6, r4
 f0 6d c3              st8	[r1+], r6
 f1 2a                 mov	r6, r2
 a8                    xor	r6, r4
 f0 6d c1              st8	[r0+], r6
 c9 11                 addi.s8	r5, 0x11
 f0 0a 1d              addi.s8	r2, 0x1d
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 ea                 brne8	prepare_memory+18
 f0 04 00 05           ldi16	r0, 0x500
 af                    xor	r7, r7
 07                    mov	r5, r7
 0b                    mov	r6, r7
 fa 92                 lsr16i	r6, 0x2
 a9                    xor	r6, r5
 a8                    xor	r6, r4
 f0 6d c1              st8	[r0+], r6
 c9 25                 addi.s8	r5, 0x25
 f4 af                 inc16	r7
 c6 00 04              ldi16	r6, 0x400
 3e                    cmp	r7, r6
 d1 ee                 brne8	prepare_memory+46
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<check_guards>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 04 fc 04           ldi16	r0, 0x4fc
 f0 01 a5              ldi8	r1, 0xa5
 f1 10                 mov	r2, r0
 f1 29                 mov	r6, r1
 a9                    xor	r6, r5
 f1 76                 zext8	r6
 ed e4 20              ld8u	r7, [r2+0]
 3e                    cmp	r7, r6
 d1 37                 brne8	check_guards+78
 f4 a8                 inc16	r0
 f4 aa                 inc16	r2
 f0 09 11              addi.s8	r1, 0x11
 f1 29                 mov	r6, r1
 f1 76                 zext8	r6
 c3 e9                 ldi8	r7, 0xe9
 3b                    cmp	r6, r7
 d1 e5                 brne8	check_guards+12
 f0 04 00 09           ldi16	r0, 0x900
 f0 01 5a              ldi8	r1, 0x5a
 f1 10                 mov	r2, r0
 f1 29                 mov	r6, r1
 a9                    xor	r6, r5
 f1 76                 zext8	r6
 ed e4 20              ld8u	r7, [r2+0]
 3e                    cmp	r7, r6
 d1 13                 brne8	check_guards+78
 f4 a8                 inc16	r0
 f4 aa                 inc16	r2
 f0 09 1d              addi.s8	r1, 0x1d
 f1 29                 mov	r6, r1
 f1 76                 zext8	r6
 c3 ce                 ldi8	r7, 0xce
 3b                    cmp	r6, r7
 d1 e5                 brne8	check_guards+48
 a0                    xor	r4, r4
 d4 06                 jmp8	check_guards+84
 f1 24                 mov	r5, r0
 d5 06                 call8	fail_case
 c0 01                 ldi8	r4, 0x1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<fail_case>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 5b                 stsp16	[sp+0x6], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 48                 stsp16	[sp+0x2], r4
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	fail_case+19
 f4 0b                 ldsp16	r7, [sp+0x2]
 03                    mov	r4, r7
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 f0 00 30              ldi8	r0, 0x30
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 21                 cmp	r4, r1
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 02 0f              ldi8	r2, 0xf
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 2f                 cmp	r7, r3
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 c7 06 01              ldi16	r7, 0x106
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	fail_case+125
 f4 12                 ldsp16	r6, [sp+0x4]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 4b                 stsp16	[sp+0x2], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 f5 2b                 cmp	r6, r3
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 c7 0b 01              ldi16	r7, 0x10b
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	fail_case+217
 f4 21                 ldsp16	r5, [sp+0x8]
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 1b                 ldsp16	r7, [sp+0x6]
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 f4 60                 stsp16	[sp+0x8], r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f9 c1                 or	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 c8 37                 addi.s8	r4, 0x37
 f5 2d                 cmp	r7, r1
 f4 22                 ldsp16	r6, [sp+0x8]
 fc 26                 cmov.ult	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f9 e8                 and	r7, r2
 f9 1d                 or	r0, r7
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 38                 cmov.ult	r7, r0
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 d7 00                 sys	debug_putc
 c0 4f                 ldi8	r4, 0x4f
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
