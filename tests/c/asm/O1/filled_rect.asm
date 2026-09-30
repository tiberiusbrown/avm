
filled_rect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 filled_rect.c
00000536 l     F .text	00000189 check_case
000006bf l     F .text	0000010c check_round_trip
000007cb l     F .text	00000157 fail_case
00000100 l     O .data	00000005 .L.str
00000105 l     O .data	00000005 .L.str.1
0000010a l     O .data	00000005 .L.str.2
0000010f l     O .data	00000004 .L.str.3
00000000 l    df *ABS*	00000000 runtime.c
00000924 l       .init_array	00000000 .hidden __init_array_end
00000924 l       .init_array	00000000 .hidden __init_array_start
00000924 l       .fini_array	00000000 .hidden __fini_array_start
00000924 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000025f avm_test_main
00000922 g     F .text	00000002 avm_halt
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
 e1 04 07              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 24 09              ldi16	r4, 0x924
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 24 09              ldi16	r6, 0x924
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 24 09           ldi16	r0, 0x924
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 24 09           ldi16	r2, 0x924
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
 c4 24 09              ldi16	r4, 0x924
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 24 09              ldi16	r6, 0x924
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 24 09           ldi16	r0, 0x924
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
 e1 8f 01              call16	check_round_trip
 f1 04                 mov	r0, r4
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<check_case>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f4 69                 stsp16	[sp+0xa], r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 1d 22              ldsp8u	r5, [sp+0x22]
 03                    mov	r4, r7
 f4 71                 stsp16	[sp+0xc], r5
 11                    add	r4, r5
 f0 00 40              ldi8	r0, 0x40
 cc 40                 cmpi.s8	r4, 0x40
 fd 04                 cmov.slt	r0, r4
 f2 39                 sub	r1, r1
 cf 01                 cmpi.s8	r7, 0x1
 f1 11                 mov	r2, r1
 f4 7b                 stsp16	[sp+0xe], r7
 fd 57                 cmov.sge	r2, r7
 ce 01                 cmpi.s8	r6, 0x1
 f1 21                 mov	r4, r1
 fd 66                 cmov.sge	r4, r6
 f0 1f 21              ldsp8u	r7, [sp+0x21]
 f4 52                 stsp16	[sp+0x4], r6
 06                    mov	r5, r6
 f4 4b                 stsp16	[sp+0x2], r7
 17                    add	r5, r7
 c3 80                 ldi8	r7, 0x80
 37                    cmp	r5, r7
 fd 3d                 cmov.slt	r7, r5
 f0 1d 23              ldsp8u	r5, [sp+0x23]
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 5b                 stsp16	[sp+0x6], r7
 33                    cmp	r4, r7
 d9 04                 brsge8	check_case+71
 f5 10                 cmp	r2, r0
 d3 0a                 brslt8	check_case+81
 f1 01                 mov	r0, r1
 f0 39 06              stsp16	[sp+0x6], r1
 f1 11                 mov	r2, r1
 f0 39 08              stsp16	[sp+0x8], r1
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 38 12              stsp16	[sp+0x12], r0
 c1 04                 ldi8	r5, 0x4
 c7 00 09              ldi16	r7, 0x900
 f0 05 fc 04           ldi16	r1, 0x4fc
 f0 00 5a              ldi8	r0, 0x5a
 f0 02 a5              ldi8	r2, 0xa5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f1 1a                 mov	r3, r2
 f9 7a                 xor	r3, r6
 f0 6d 63              st8	[r1+], r3
 f1 20                 mov	r4, r0
 a2                    xor	r4, r6
 f6 1c                 st8	[r7+], r4
 f0 0a 11              addi.s8	r2, 0x11
 f0 08 1d              addi.s8	r0, 0x1d
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 e8                 brne8	check_case+105
 f0 04 00 05           ldi16	r0, 0x500
 a5                    xor	r5, r5
 01                    mov	r4, r5
 f0 05 00 04           ldi16	r1, 0x400
 0d                    mov	r7, r5
 fa a2                 lsr16i	r7, 0x2
 ac                    xor	r7, r4
 ae                    xor	r7, r6
 f0 6d e1              st8	[r0+], r7
 c8 25                 addi.s8	r4, 0x25
 f4 ad                 inc16	r5
 f5 25                 cmp	r5, r1
 d1 f0                 brne8	check_case+139
 f4 28                 ldsp16	r4, [sp+0xa]
 f6 2c                 tst16	r4
 f0 32 14              ldsp16	r2, [sp+0x14]
 d0 0c                 breq8	check_case+176
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 33                 ldsp16	r7, [sp+0xc]
 d7 27                 sys	draw_filled_rect_white
 d4 0a                 jmp8	check_case+186
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 33                 ldsp16	r7, [sp+0xc]
 d7 28                 sys	draw_filled_rect_black
 c1 a5                 ldi8	r5, 0xa5
 f0 04 fc 04           ldi16	r0, 0x4fc
 f1 20                 mov	r4, r0
 f0 07 00 05           ldi16	r3, 0x500
 09                    mov	r6, r5
 f0 37 10              ldsp16	r7, [sp+0x10]
 ab                    xor	r6, r7
 f1 76                 zext8	r6
 4c                    ld8u	r7, [r4]
 3e                    cmp	r7, r6
 db a1 00              brne16	check_case+371
 c9 11                 addi.s8	r5, 0x11
 f4 ac                 inc16	r4
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 ea                 brne8	check_case+198
 c1 5a                 ldi8	r5, 0x5a
 f0 04 00 09           ldi16	r0, 0x900
 f1 20                 mov	r4, r0
 09                    mov	r6, r5
 f0 37 10              ldsp16	r7, [sp+0x10]
 ab                    xor	r6, r7
 f1 76                 zext8	r6
 4c                    ld8u	r7, [r4]
 3e                    cmp	r7, r6
 db 83 00              brne16	check_case+371
 c9 1d                 addi.s8	r5, 0x1d
 f4 ac                 inc16	r4
 f4 a8                 inc16	r0
 c6 04 09              ldi16	r6, 0x904
 f5 06                 cmp	r0, r6
 d1 e7                 brne8	check_case+228
 a0                    xor	r4, r4
 08                    mov	r6, r4
 0e                    mov	r7, r6
 fa a4                 lsr16i	r7, 0x4
 c0 25                 ldi8	r4, 0x25
 06                    mov	r5, r6
 fe 2c                 mul16	r5, r4
 02                    mov	r4, r6
 fa 72                 lsr16i	r4, 0x2
 f4 70                 stsp16	[sp+0xc], r4
 c0 7f                 ldi8	r4, 0x7f
 f4 7a                 stsp16	[sp+0xe], r6
 82                    and	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 32                    cmp	r4, r6
 f2 30                 sub	r0, r0
 d2 31                 brult8	check_case+329
 f4 1a                 ldsp16	r6, [sp+0x6]
 32                    cmp	r4, r6
 d9 2c                 brsge8	check_case+329
 c4 f8 07              ldi16	r4, 0x7f8
 8c                    and	r7, r4
 f1 28                 mov	r6, r0
 03                    mov	r4, r7
 12                    add	r4, r6
 f5 22                 cmp	r4, r2
 d2 05                 brult8	check_case+302
 d4 0f                 jmp8	check_case+314
 f0 32 14              ldsp16	r2, [sp+0x14]
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
 d0 15                 breq8	check_case+329
 03                    mov	r4, r7
 12                    add	r4, r6
 f5 22                 cmp	r4, r2
 d2 f4                 brult8	check_case+302
 f0 32 12              ldsp16	r2, [sp+0x12]
 f5 22                 cmp	r4, r2
 d9 ea                 brsge8	check_case+299
 c0 01                 ldi8	r4, 0x1
 fa 02                 shl16v	r4, r6
 f9 11                 or	r0, r4
 d4 e2                 jmp8	check_case+299
 f4 30                 ldsp16	r4, [sp+0xc]
 a4                    xor	r5, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 a4                    xor	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 f9 82                 xor	r4, r0
 f9 15                 or	r0, r5
 81                    and	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 2d                 tst16	r5
 fb 04                 cmov.eq	r0, r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 06                    mov	r5, r6
 f2 27                 add	r5, r3
 f1 70                 zext8	r0
 4d                    ld8u	r7, [r5]
 f5 2c                 cmp	r7, r0
 d1 19                 brne8	check_case+387
 f4 ae                 inc16	r6
 f5 29                 cmp	r6, r1
 d1 8f                 brne8	check_case+255
 a0                    xor	r4, r4
 d4 09                 jmp8	check_case+380
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 24                 mov	r5, r0
 e1 1b 01              call16	fail_case
 c0 01                 ldi8	r4, 0x1
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 28                 mov	r6, r0
 d4 ee                 jmp8	check_case+375

<check_round_trip>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c0 04                 ldi8	r4, 0x4
 f0 05 00 09           ldi16	r1, 0x900
 f0 06 fc 04           ldi16	r2, 0x4fc
 c3 5a                 ldi8	r7, 0x5a
 c2 a5                 ldi8	r6, 0xa5
 f0 00 5d              ldi8	r0, 0x5d
 06                    mov	r5, r6
 f9 a2                 xor	r5, r0
 f0 6d a5              st8	[r2+], r5
 07                    mov	r5, r7
 f9 a2                 xor	r5, r0
 f0 6d a3              st8	[r1+], r5
 ca 11                 addi.s8	r6, 0x11
 cb 1d                 addi.s8	r7, 0x1d
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 ea                 brne8	check_round_trip+23
 c4 00 05              ldi16	r4, 0x500
 a5                    xor	r5, r5
 09                    mov	r6, r5
 f0 07 00 04           ldi16	r3, 0x400
 0d                    mov	r7, r5
 fa a2                 lsr16i	r7, 0x2
 ae                    xor	r7, r6
 f9 e2                 xor	r7, r0
 f6 07                 st8	[r4+], r7
 ca 25                 addi.s8	r6, 0x25
 f4 ad                 inc16	r5
 f5 27                 cmp	r5, r3
 d1 f0                 brne8	check_round_trip+54
 c0 25                 ldi8	r4, 0x25
 f4 40                 stsp16	[sp+0x0], r4
 c1 06                 ldi8	r5, 0x6
 c2 2b                 ldi8	r6, 0x2b
 c3 1b                 ldi8	r7, 0x1b
 d7 27                 sys	draw_filled_rect_white
 d7 28                 sys	draw_filled_rect_black
 c0 a5                 ldi8	r4, 0xa5
 f0 05 fc 04           ldi16	r1, 0x4fc
 f1 25                 mov	r5, r1
 f0 06 00 05           ldi16	r2, 0x500
 08                    mov	r6, r4
 f9 c2                 xor	r6, r0
 f1 76                 zext8	r6
 4d                    ld8u	r7, [r5]
 3e                    cmp	r7, r6
 db 8f 00              brne16	check_round_trip+249
 c8 11                 addi.s8	r4, 0x11
 f4 ad                 inc16	r5
 f4 a9                 inc16	r1
 f5 0a                 cmp	r1, r2
 d1 ec                 brne8	check_round_trip+96
 f0 01 5a              ldi8	r1, 0x5a
 c5 00 09              ldi16	r5, 0x900
 01                    mov	r4, r5
 f1 29                 mov	r6, r1
 f9 c2                 xor	r6, r0
 f1 76                 zext8	r6
 4c                    ld8u	r7, [r4]
 3e                    cmp	r7, r6
 d1 7a                 brne8	check_round_trip+255
 f0 09 1d              addi.s8	r1, 0x1d
 f4 ac                 inc16	r4
 f4 ad                 inc16	r5
 c6 04 09              ldi16	r6, 0x904
 36                    cmp	r5, r6
 d1 e9                 brne8	check_round_trip+123
 a0                    xor	r4, r4
 f0 31 00              ldsp16	r1, [sp+0x0]
 04                    mov	r5, r4
 fe 29                 mul16	r5, r1
 f4 59                 stsp16	[sp+0x6], r5
 0c                    mov	r7, r4
 fa a2                 lsr16i	r7, 0x2
 c1 7f                 ldi8	r5, 0x7f
 84                    and	r5, r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 c9 db                 addi.s8	r5, -0x25
 cd 2b                 cmpi.s8	r5, 0x2b
 d8 2b                 bruge8	check_round_trip+213
 f4 4b                 stsp16	[sp+0x2], r7
 f4 50                 stsp16	[sp+0x4], r4
 c5 f8 07              ldi16	r5, 0x7f8
 89                    and	r6, r5
 ca fa                 addi.s8	r6, -0x6
 a5                    xor	r5, r5
 0d                    mov	r7, r5
 02                    mov	r4, r6
 13                    add	r4, r7
 cc 1b                 cmpi.s8	r4, 0x1b
 d2 0c                 brult8	check_round_trip+200
 f4 af                 inc16	r7
 cf 08                 cmpi.s8	r7, 0x8
 d0 17                 breq8	check_round_trip+217
 02                    mov	r4, r6
 13                    add	r4, r7
 cc 1b                 cmpi.s8	r4, 0x1b
 d8 f4                 bruge8	check_round_trip+188
 c0 01                 ldi8	r4, 0x1
 fa 03                 shl16v	r4, r7
 94                    or	r5, r4
 f4 af                 inc16	r7
 cf 08                 cmpi.s8	r7, 0x8
 d1 ef                 brne8	check_round_trip+194
 d4 04                 jmp8	check_round_trip+217
 c1 ff                 ldi8	r5, 0xff
 d4 08                 jmp8	check_round_trip+225
 c4 ff ff              ldi16	r4, 0xffff
 a4                    xor	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 1a                 ldsp16	r6, [sp+0x6]
 ab                    xor	r6, r7
 f9 c2                 xor	r6, r0
 89                    and	r6, r5
 04                    mov	r5, r4
 f2 26                 add	r5, r2
 4d                    ld8u	r7, [r5]
 f1 76                 zext8	r6
 3e                    cmp	r7, r6
 d1 0f                 brne8	check_round_trip+255
 f4 ac                 inc16	r4
 f5 23                 cmp	r4, r3
 d1 a0                 brne8	check_round_trip+150
 a0                    xor	r4, r4
 d4 0c                 jmp8	check_round_trip+261
 c0 14                 ldi8	r4, 0x14
 f1 25                 mov	r5, r1
 d4 02                 jmp8	check_round_trip+257
 c0 14                 ldi8	r4, 0x14
 d5 09                 call8	fail_case
 c0 01                 ldi8	r4, 0x1
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fail_case>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 63                 stsp16	[sp+0x8], r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 48                 stsp16	[sp+0x2], r4
 c0 43                 ldi8	r4, 0x43
 c6 01 01              ldi16	r6, 0x101
 f7 17                 ld8u	r7, [r6+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a7                 tst8	r7
 03                    mov	r4, r7
 d1 f5                 brne8	fail_case+19
 f4 0a                 ldsp16	r6, [sp+0x2]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 f0 00 30              ldi8	r0, 0x30
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 22                 cmp	r4, r2
 fc 3d                 cmov.ult	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 f0 01 0f              ldi8	r1, 0xf
 06                    mov	r5, r6
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 2b                 cmp	r6, r3
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
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
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e4                 and	r7, r1
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
 f9 c4                 and	r6, r1
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
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 f5 2a                 cmp	r6, r2
 fc 2c                 cmov.ult	r5, r4
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 c7 10 01              ldi16	r7, 0x110
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	fail_case+278
 f4 22                 ldsp16	r6, [sp+0x8]
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 f5 2a                 cmp	r6, r2
 fc 2c                 cmov.ult	r5, r4
 f9 38                 and	r1, r6
 f9 05                 or	r0, r1
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 08                 cmov.ult	r1, r0
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
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
