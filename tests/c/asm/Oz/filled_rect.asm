
filled_rect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 filled_rect.c
000005d2 l     F .text	000000cb check_case
000006e0 l     F .text	0000004e prepare_memory
0000072e l     F .text	00000062 check_guards
00000790 l     F .text	0000003d byte_mask
000007cd l     F .text	00000028 fail_case
0000069d l     F .text	00000043 clip_rect
00000100 l     O .data	00000005 .L.str
000007f5 l     F .text	00000026 test_line16
00000105 l     O .data	00000005 .L.str.1
0000010a l     O .data	00000005 .L.str.2
0000010f l     O .data	00000004 .L.str.3
0000081b l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
00000841 l       .init_array	00000000 .hidden __init_array_end
00000841 l       .init_array	00000000 .hidden __init_array_start
00000841 l       .fini_array	00000000 .hidden __fini_array_start
00000841 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000002fb avm_test_main
0000083f g     F .text	00000002 avm_halt
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
 e1 21 06              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 41 08              ldi16	r4, 0x841
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 41 08              ldi16	r6, 0x841
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 41 08           ldi16	r0, 0x841
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 41 08           ldi16	r2, 0x841
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
 c4 41 08              ldi16	r4, 0x841
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 41 08              ldi16	r6, 0x841
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 41 08           ldi16	r2, 0x841
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 41 08           ldi16	r0, 0x841
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
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
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
 e1 dd 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db cd 02              brne16	avm_test_main+754
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
 e1 be 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db ae 02              brne16	avm_test_main+754
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
 e1 9e 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 8e 02              brne16	avm_test_main+754
 d6 fd                 adjsp	-0x3
 c4 11 13              ldi16	r4, 0x1311
 c1 a5                 ldi8	r5, 0xa5
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 c2 14                 ldi8	r6, 0x14
 c3 05                 ldi8	r7, 0x5
 e1 82 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 72 02              brne16	avm_test_main+754
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
 e1 60 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 50 02              brne16	avm_test_main+754
 d6 fd                 adjsp	-0x3
 c4 14 14              ldi16	r4, 0x1414
 c1 69                 ldi8	r5, 0x69
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 c2 7c                 ldi8	r6, 0x7c
 c3 3c                 ldi8	r7, 0x3c
 e1 44 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 34 02              brne16	avm_test_main+754
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
 e1 24 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 14 02              brne16	avm_test_main+754
 d6 fd                 adjsp	-0x3
 c4 01 01              ldi16	r4, 0x101
 c1 c3                 ldi8	r5, 0xc3
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 c2 7f                 ldi8	r6, 0x7f
 c3 3f                 ldi8	r7, 0x3f
 e1 08 02              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db f8 01              brne16	avm_test_main+754
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
 e1 e6 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db d6 01              brne16	avm_test_main+754
 d6 fd                 adjsp	-0x3
 c4 80 40              ldi16	r4, 0x4080
 c1 aa                 ldi8	r5, 0xaa
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 09                    mov	r6, r5
 0d                    mov	r7, r5
 e1 cc 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db bc 01              brne16	avm_test_main+754
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
 e1 ac 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 9c 01              brne16	avm_test_main+754
 d6 fd                 adjsp	-0x3
 c0 11                 ldi8	r4, 0x11
 c1 f0                 ldi8	r5, 0xf0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0b                 ldi8	r4, 0xb
 a5                    xor	r5, r5
 c2 1e                 ldi8	r6, 0x1e
 c3 0c                 ldi8	r7, 0xc
 e1 91 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 81 01              brne16	avm_test_main+754
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
 e1 72 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 62 01              brne16	avm_test_main+754
 d6 fd                 adjsp	-0x3
 c4 14 09              ldi16	r4, 0x914
 c1 78                 ldi8	r5, 0x78
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0d                 ldi8	r4, 0xd
 a5                    xor	r5, r5
 c6 ec ff              ldi16	r6, 0xffec
 c3 0c                 ldi8	r7, 0xc
 e1 55 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 45 01              brne16	avm_test_main+754
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
 e1 34 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 24 01              brne16	avm_test_main+754
 d6 fd                 adjsp	-0x3
 c4 11 09              ldi16	r4, 0x911
 c1 e1                 ldi8	r5, 0xe1
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0f                 ldi8	r4, 0xf
 a5                    xor	r5, r5
 c2 1e                 ldi8	r6, 0x1e
 c3 40                 ldi8	r7, 0x40
 e1 18 01              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 08 01              brne16	avm_test_main+754
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
 e1 f7 00              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db e7 00              brne16	avm_test_main+754
 d6 fd                 adjsp	-0x3
 c4 05 ff              ldi16	r4, 0xff05
 c1 24                 ldi8	r5, 0x24
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 11                 ldi8	r4, 0x11
 a5                    xor	r5, r5
 c2 1e                 ldi8	r6, 0x1e
 c7 02 ff              ldi16	r7, 0xff02
 e1 da 00              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db ca 00              brne16	avm_test_main+754
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
 e1 ba 00              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db aa 00              brne16	avm_test_main+754
 d6 fd                 adjsp	-0x3
 c4 ff ff              ldi16	r4, 0xffff
 c1 99                 ldi8	r5, 0x99
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 13                 ldi8	r4, 0x13
 a5                    xor	r5, r5
 c6 38 ff              ldi16	r6, 0xff38
 0e                    mov	r7, r6
 e1 9e 00              call16	check_case
 d6 03                 adjsp	0x3
 f4 a4                 tst8	r4
 db 8e 00              brne16	avm_test_main+754
 c0 50                 ldi8	r4, 0x50
 c1 21                 ldi8	r5, 0x21
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c0 25                 ldi8	r4, 0x25
 c1 06                 ldi8	r5, 0x6
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 02 5d              ldi8	r2, 0x5d
 f1 22                 mov	r4, r2
 e1 8b 01              call16	prepare_memory
 c0 25                 ldi8	r4, 0x25
 c1 06                 ldi8	r5, 0x6
 c2 2b                 ldi8	r6, 0x2b
 c3 1b                 ldi8	r7, 0x1b
 d7 27                 sys	draw_filled_rect_white
 d7 28                 sys	draw_filled_rect_black
 c0 14                 ldi8	r4, 0x14
 f1 26                 mov	r5, r2
 e1 c6 01              call16	check_guards
 f0 00 01              ldi8	r0, 0x1
 f4 a4                 tst8	r4
 d1 5a                 brne8	avm_test_main+754
 f0 07 00 05           ldi16	r3, 0x500
 a0                    xor	r4, r4
 f1 0c                 mov	r1, r4
 f4 48                 stsp16	[sp+0x2], r4
 c4 00 04              ldi16	r4, 0x400
 f4 09                 ldsp16	r5, [sp+0x2]
 34                    cmp	r5, r4
 d0 3a                 breq8	avm_test_main+739
 f0 15 0c              leasp	r5, 0xc
 f0 17 04              leasp	r7, 0x4
 03                    mov	r4, r7
 f4 41                 stsp16	[sp+0x0], r5
 c2 08                 ldi8	r6, 0x8
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 0f                 sys	memcpy
 f4 08                 ldsp16	r4, [sp+0x2]
 08                    mov	r6, r4
 fa 92                 lsr16i	r6, 0x2
 f9 c6                 xor	r6, r1
 f9 ca                 xor	r6, r2
 f4 42                 stsp16	[sp+0x0], r6
 07                    mov	r5, r7
 e1 f2 01              call16	byte_mask
 c6 ff ff              ldi16	r6, 0xffff
 a8                    xor	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 88                    and	r6, r4
 f1 76                 zext8	r6
 ed e6 20              ld8u	r7, [r3+0]
 3e                    cmp	r7, r6
 d1 11                 brne8	avm_test_main+743
 f0 09 25              addi.s8	r1, 0x25
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f4 48                 stsp16	[sp+0x2], r4
 f4 ab                 inc16	r3
 d4 be                 jmp8	avm_test_main+673
 f2 30                 sub	r0, r0
 d4 0b                 jmp8	avm_test_main+754
 c4 00 05              ldi16	r4, 0x500
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 c0 14                 ldi8	r4, 0x14
 e1 04 02              call16	fail_case
 f1 20                 mov	r4, r0
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_case>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	-0x1a
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 1a 27              ldsp8u	r2, [sp+0x27]
 f0 1b 25              ldsp8u	r3, [sp+0x25]
 f0 1c 26              ldsp8u	r4, [sp+0x26]
 d6 ff                 adjsp	-0x1
 f4 5c                 stsp16	[sp+0x7], r4
 f1 30                 stsp8	[sp+0x0], r4
 f0 14 13              leasp	r4, 0x13
 f1 24                 mov	r5, r0
 f4 67                 stsp16	[sp+0x9], r7
 0b                    mov	r6, r7
 f1 2f                 mov	r7, r3
 e1 a3 00              call16	clip_rect
 d6 01                 adjsp	0x1
 f0 3a 04              stsp16	[sp+0x4], r2
 f1 22                 mov	r4, r2
 e1 dc 00              call16	prepare_memory
 f0 39 02              stsp16	[sp+0x2], r1
 f1 20                 mov	r4, r0
 f6 29                 tst16	r1
 d0 0a                 breq8	check_case+69
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 2b                 mov	r6, r3
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 d4 08                 jmp8	check_case+77
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 2b                 mov	r6, r3
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 28                 sys	draw_filled_rect_black
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 e1 08 01              call16	check_guards
 c1 01                 ldi8	r5, 0x1
 f4 a4                 tst8	r4
 d1 69                 brne8	check_case+195
 af                    xor	r7, r7
 f0 04 00 05           ldi16	r0, 0x500
 f0 07 00 04           ldi16	r3, 0x400
 f1 0f                 mov	r1, r7
 f5 2f                 cmp	r7, r3
 d0 4a                 breq8	check_case+179
 f0 15 12              leasp	r5, 0x12
 f0 12 0a              leasp	r2, 0xa
 f1 22                 mov	r4, r2
 f4 60                 stsp16	[sp+0x8], r4
 f4 59                 stsp16	[sp+0x6], r5
 c2 08                 ldi8	r6, 0x8
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 19                 ldsp16	r5, [sp+0x6]
 d7 0f                 sys	memcpy
 0b                    mov	r6, r7
 fa 92                 lsr16i	r6, 0x2
 f9 c6                 xor	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 a8                    xor	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 03                    mov	r4, r7
 f1 26                 mov	r5, r2
 e1 2f 01              call16	byte_mask
 08                    mov	r6, r4
 c4 ff ff              ldi16	r4, 0xffff
 a2                    xor	r4, r6
 f4 19                 ldsp16	r5, [sp+0x6]
 99                    or	r6, r5
 81                    and	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f6 2d                 tst16	r5
 fb 34                 cmov.eq	r6, r4
 f1 76                 zext8	r6
 ed e0 20              ld8u	r7, [r0+0]
 3e                    cmp	r7, r6
 d1 10                 brne8	check_case+182
 f0 09 25              addi.s8	r1, 0x25
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 af                 inc16	r7
 f4 a8                 inc16	r0
 f5 2f                 cmp	r7, r3
 d1 b6                 brne8	check_case+105
 a5                    xor	r5, r5
 d4 0d                 jmp8	check_case+195
 c4 00 05              ldi16	r4, 0x500
 f4 21                 ldsp16	r5, [sp+0x8]
 14                    add	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 e1 3a 01              call16	fail_case
 c1 01                 ldi8	r5, 0x1
 01                    mov	r4, r5
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<clip_rect>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 1d                    add	r7, r5
 f0 00 80              ldi8	r0, 0x80
 f5 2c                 cmp	r7, r0
 fd 07                 cmov.slt	r0, r7
 f3 67                 ldsp8u	r7, [sp+0x9]
 1e                    add	r7, r6
 f0 01 40              ldi8	r1, 0x40
 cf 40                 cmpi.s8	r7, 0x40
 fd 0f                 cmov.slt	r1, r7
 f2 42                 sub	r2, r2
 cd 01                 cmpi.s8	r5, 0x1
 f1 2e                 mov	r7, r2
 fd 7d                 cmov.sge	r7, r5
 ce 01                 cmpi.s8	r6, 0x1
 fd 56                 cmov.sge	r2, r6
 04                    mov	r5, r4
 ee 58 22              st16	[r4+2], r2
 73                    st16	[r4], r7
 ee 38 26              st16	[r4+6], r1
 ee 18 24              st16	[r4+4], r0
 f5 2c                 cmp	r7, r0
 d9 04                 brsge8	clip_rect+52
 f5 11                 cmp	r2, r1
 d3 0a                 brslt8	clip_rect+62
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 6b c8              st32	[r4], q3
 c8 04                 addi.s8	r4, 0x4
 f0 6b c8              st32	[r4], q3
 01                    mov	r4, r5
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
 f0 04 fc 04           ldi16	r0, 0x4fc
 f0 05 00 09           ldi16	r1, 0x900
 c3 04                 ldi8	r7, 0x4
 f6 2f                 tst16	r7
 d0 16                 breq8	prepare_memory+44
 09                    mov	r6, r5
 a8                    xor	r6, r4
 f0 6d c1              st8	[r0+], r6
 f1 2a                 mov	r6, r2
 a8                    xor	r6, r4
 f0 6d c3              st8	[r1+], r6
 f4 b7                 dec16	r7
 c9 11                 addi.s8	r5, 0x11
 f0 0a 1d              addi.s8	r2, 0x1d
 f6 2f                 tst16	r7
 d1 ea                 brne8	prepare_memory+22
 a5                    xor	r5, r5
 f0 04 00 05           ldi16	r0, 0x500
 0d                    mov	r7, r5
 c6 00 04              ldi16	r6, 0x400
 36                    cmp	r5, r6
 d0 12                 breq8	prepare_memory+74
 09                    mov	r6, r5
 fa 92                 lsr16i	r6, 0x2
 ab                    xor	r6, r7
 a8                    xor	r6, r4
 f0 6d c1              st8	[r0+], r6
 cb 25                 addi.s8	r7, 0x25
 f4 ad                 inc16	r5
 c6 00 04              ldi16	r6, 0x400
 36                    cmp	r5, r6
 d1 ee                 brne8	prepare_memory+56
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<check_guards>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 04 fb 04           ldi16	r0, 0x4fb
 f0 05 fc 04           ldi16	r1, 0x4fc
 f0 02 a5              ldi8	r2, 0xa5
 f0 03 e9              ldi8	r3, 0xe9
 f1 2a                 mov	r6, r2
 f1 76                 zext8	r6
 f5 2b                 cmp	r6, r3
 d0 14                 breq8	check_guards+46
 f0 6c e3              ld8u	r7, [r1+]
 f1 2a                 mov	r6, r2
 a9                    xor	r6, r5
 f0 0a 11              addi.s8	r2, 0x11
 f4 a8                 inc16	r0
 f1 76                 zext8	r6
 3e                    cmp	r7, r6
 d0 e8                 breq8	check_guards+18
 f1 24                 mov	r5, r0
 d4 28                 jmp8	check_guards+86
 f0 05 ff 08           ldi16	r1, 0x8ff
 f0 06 00 09           ldi16	r2, 0x900
 f0 03 5a              ldi8	r3, 0x5a
 f2 30                 sub	r0, r0
 f1 2b                 mov	r6, r3
 f1 76                 zext8	r6
 c3 ce                 ldi8	r7, 0xce
 3b                    cmp	r6, r7
 d0 17                 breq8	check_guards+91
 f0 6c e5              ld8u	r7, [r2+]
 f1 2b                 mov	r6, r3
 a9                    xor	r6, r5
 f0 0b 1d              addi.s8	r3, 0x1d
 f4 a9                 inc16	r1
 f1 76                 zext8	r6
 3e                    cmp	r7, r6
 d0 e7                 breq8	check_guards+59
 f1 25                 mov	r5, r1
 d5 47                 call8	fail_case
 f0 00 01              ldi8	r0, 0x1
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<byte_mask>:
 b1                    push16	r1
 b0                    push16	r0
 c3 7f                 ldi8	r7, 0x7f
 8c                    and	r7, r4
 f2 39                 sub	r1, r1
 69                    ld16	r6, [r5]
 3e                    cmp	r7, r6
 d3 2d                 brslt8	byte_mask+56
 ed da 24              ld16	r6, [r5+4]
 3e                    cmp	r7, r6
 d9 27                 brsge8	byte_mask+56
 fa 74                 lsr16i	r4, 0x4
 c6 f8 0f              ldi16	r6, 0xff8
 88                    and	r6, r4
 ed 1a 26              ld16	r0, [r5+6]
 ed ba 22              ld16	r5, [r5+2]
 f1 21                 mov	r4, r1
 cc 08                 cmpi.s8	r4, 0x8
 d0 15                 breq8	byte_mask+56
 0e                    mov	r7, r6
 1c                    add	r7, r4
 3d                    cmp	r7, r5
 d3 0a                 brslt8	byte_mask+50
 f5 2c                 cmp	r7, r0
 d9 06                 brsge8	byte_mask+50
 c3 01                 ldi8	r7, 0x1
 fa 0c                 shl16v	r7, r4
 f9 3d                 or	r1, r7
 f4 ac                 inc16	r4
 cc 08                 cmpi.s8	r4, 0x8
 d1 eb                 brne8	byte_mask+35
 f1 21                 mov	r4, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<fail_case>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
 f1 15                 mov	r2, r5
 04                    mov	r5, r4
 c4 00 01              ldi16	r4, 0x100
 d5 19                 call8	test_line16
 c4 05 01              ldi16	r4, 0x105
 f1 26                 mov	r5, r2
 d5 12                 call8	test_line16
 c4 0a 01              ldi16	r4, 0x10a
 f1 25                 mov	r5, r1
 d5 0b                 call8	test_line16
 c4 0f 01              ldi16	r4, 0x10f
 f1 24                 mov	r5, r0
 d5 04                 call8	test_line16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<test_line16>:
 d6 fe                 adjsp	-0x2
 08                    mov	r6, r4
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 06                 breq8	test_line16+14
 d7 00                 sys	debug_putc
 f4 ae                 inc16	r6
 d4 f5                 jmp8	test_line16+3
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 41                 stsp16	[sp+0x0], r5
 d5 0d                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 07                 call8	test_hex8
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 b0                    push16	r0
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 f0 00 30              ldi8	r0, 0x30
 0d                    mov	r7, r5
 f9 e1                 or	r7, r0
 c9 37                 addi.s8	r5, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 2f                 cmov.ult	r5, r7
 c2 0f                 ldi8	r6, 0xf
 88                    and	r6, r4
 f9 19                 or	r0, r6
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 30                 cmov.ult	r6, r0
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
