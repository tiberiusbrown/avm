
save_load.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 save_load.c
000004c0 l     F .text	0000002d fill_saved
00000140 l     O .data	00000002 ordinary_data
000004ed l     F .text	00000007 call_save_exists
000004f4 l     F .text	00000007 call_load
000004fb l     F .text	00000043 check_saved
0000053e l     F .text	00000003 call_save
00000142 l     O .data	00000003 .L.str
00000541 l     F .text	00000019 test_line16
00000145 l     O .data	00000003 .L.str.1
00000148 l     O .data	00000003 .L.str.2
0000014b l     O .data	00000003 .L.str.3
0000014e l     O .data	00000003 .L.str.4
00000151 l     O .data	00000003 .L.str.5
00000154 l     O .data	00000003 .L.str.6
00000157 l     O .data	00000003 .L.str.7
0000015a l     O .data	00000003 .L.str.8
0000015d l     O .data	00000003 .L.str.9
00000160 l     O .data	00000003 .L.str.10
0000055a l     F .text	0000001a pattern_byte
00000100 l     O .saved	00000040 saved_state
00000574 l     F .text	00000022 test_puts
00000596 l     F .text	0000000b test_putc
000005a1 l     F .text	0000000f test_hex16
000005b0 l     F .text	00000019 test_hex8
000005c9 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
000005f7 l       .init_array	00000000 .hidden __init_array_end
000005f7 l       .init_array	00000000 .hidden __init_array_start
000005f7 l       .fini_array	00000000 .hidden __fini_array_start
000005f7 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000001e9 avm_test_main
000005f5 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 d7 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f7 05              ldi16	r4, 0x5f7
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f7 05              ldi16	r6, 0x5f7
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 f7 05           ldi16	r0, 0x5f7
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f7 05           ldi16	r2, 0x5f7
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
 c4 f7 05              ldi16	r4, 0x5f7
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f7 05              ldi16	r6, 0x5f7
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 f7 05           ldi16	r2, 0x5f7
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f7 05           ldi16	r0, 0x5f7
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
 d6 e7                 adjsp	-0x19
 c0 11                 ldi8	r4, 0x11
 f4 58                 stsp16	[sp+0x6], r4
 e1 e0 01              call16	fill_saved
 c4 68 24              ldi16	r4, 0x2468
 f0 5c 40 01           stm16	[0x140], r4
 e1 03 02              call16	call_save_exists
 c1 01                 ldi8	r5, 0x1
 f4 69                 stsp16	[sp+0xa], r5
 81                    and	r4, r5
 f0 2c 18              stsp8	[sp+0x18], r4
 e1 ff 01              call16	call_load
 f4 2a                 ldsp16	r6, [sp+0xa]
 04                    mov	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 86                    and	r5, r6
 f0 2d 17              stsp8	[sp+0x17], r5
 e1 fa 01              call16	check_saved
 f4 29                 ldsp16	r5, [sp+0xa]
 81                    and	r4, r5
 f0 2c 16              stsp8	[sp+0x16], r4
 e1 34 02              call16	call_save
 e1 e0 01              call16	call_save_exists
 f4 29                 ldsp16	r5, [sp+0xa]
 81                    and	r4, r5
 f0 2c 15              stsp8	[sp+0x15], r4
 c0 22                 ldi8	r4, 0x22
 e1 a8 01              call16	fill_saved
 c4 9c 36              ldi16	r4, 0x369c
 f4 60                 stsp16	[sp+0x8], r4
 f0 5c 40 01           stm16	[0x140], r4
 e1 d0 01              call16	call_load
 f4 2a                 ldsp16	r6, [sp+0xa]
 04                    mov	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 86                    and	r5, r6
 f0 2d 14              stsp8	[sp+0x14], r5
 e1 cb 01              call16	check_saved
 f4 22                 ldsp16	r6, [sp+0x8]
 04                    mov	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 84                    and	r5, r4
 f0 2d 13              stsp8	[sp+0x13], r5
 f0 55 40 01           ldm16	r5, [0x140]
 36                    cmp	r5, r6
 f8 05                 cset.eq	r5
 f0 2d 12              stsp8	[sp+0x12], r5
 f0 3c 10              stsp16	[sp+0x10], r4
 d4 00                 jmp8	avm_test_main+113
 f0 34 10              ldsp16	r4, [sp+0x10]
 cc 47                 cmpi.s8	r4, 0x47
 d8 22                 bruge8	avm_test_main+154
 d4 00                 jmp8	avm_test_main+122
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 e1 69 01              call16	fill_saved
 f0 34 10              ldsp16	r4, [sp+0x10]
 c5 00 40              ldi16	r5, 0x4000
 11                    add	r4, r5
 f0 5c 40 01           stm16	[0x140], r4
 e1 d9 01              call16	call_save
 d4 00                 jmp8	avm_test_main+144
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 ac                 inc16	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 d4 d7                 jmp8	avm_test_main+113
 c0 ee                 ldi8	r4, 0xee
 e1 4a 01              call16	fill_saved
 c4 ef be              ldi16	r4, 0xbeef
 f4 40                 stsp16	[sp+0x0], r4
 f0 5c 40 01           stm16	[0x140], r4
 e1 6b 01              call16	call_save_exists
 c1 01                 ldi8	r5, 0x1
 f4 49                 stsp16	[sp+0x2], r5
 81                    and	r4, r5
 f1 6c                 stsp8	[sp+0xf], r4
 e1 68 01              call16	call_load
 f4 09                 ldsp16	r5, [sp+0x2]
 81                    and	r4, r5
 f1 68                 stsp8	[sp+0xe], r4
 c0 46                 ldi8	r4, 0x46
 e1 65 01              call16	check_saved
 f4 02                 ldsp16	r6, [sp+0x0]
 04                    mov	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 84                    and	r5, r4
 f1 65                 stsp8	[sp+0xd], r5
 f0 55 40 01           ldm16	r5, [0x140]
 36                    cmp	r5, r6
 f8 05                 cset.eq	r5
 f1 61                 stsp8	[sp+0xc], r5
 f0 1d 18              ldsp8u	r5, [sp+0x18]
 84                    and	r5, r4
 c4 42 01              ldi16	r4, 0x142
 e1 90 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 1d 17              ldsp8u	r5, [sp+0x17]
 84                    and	r5, r4
 c4 45 01              ldi16	r4, 0x145
 e1 84 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 1d 16              ldsp8u	r5, [sp+0x16]
 84                    and	r5, r4
 c4 48 01              ldi16	r4, 0x148
 e1 78 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 1d 15              ldsp8u	r5, [sp+0x15]
 84                    and	r5, r4
 c4 4b 01              ldi16	r4, 0x14b
 e1 6c 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 1d 14              ldsp8u	r5, [sp+0x14]
 84                    and	r5, r4
 c4 4e 01              ldi16	r4, 0x14e
 e1 60 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 1d 13              ldsp8u	r5, [sp+0x13]
 84                    and	r5, r4
 c4 51 01              ldi16	r4, 0x151
 e1 54 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 1d 12              ldsp8u	r5, [sp+0x12]
 84                    and	r5, r4
 c4 54 01              ldi16	r4, 0x154
 e1 48 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 7d                 ldsp8u	r5, [sp+0xf]
 84                    and	r5, r4
 c4 57 01              ldi16	r4, 0x157
 e1 3d 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 79                 ldsp8u	r5, [sp+0xe]
 84                    and	r5, r4
 c4 5a 01              ldi16	r4, 0x15a
 e1 32 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 75                 ldsp8u	r5, [sp+0xd]
 84                    and	r5, r4
 c4 5d 01              ldi16	r4, 0x15d
 e1 27 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 71                 ldsp8u	r5, [sp+0xc]
 84                    and	r5, r4
 c4 60 01              ldi16	r4, 0x160
 e1 1c 01              call16	test_line16
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 1d 18              ldsp8u	r5, [sp+0x18]
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 50                 stsp16	[sp+0x4], r4
 db 86 00              brne16	avm_test_main+481
 d4 00                 jmp8	avm_test_main+349
 f0 1d 17              ldsp8u	r5, [sp+0x17]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 50                 stsp16	[sp+0x4], r4
 d1 78                 brne8	avm_test_main+481
 d4 00                 jmp8	avm_test_main+363
 f0 1d 16              ldsp8u	r5, [sp+0x16]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 6a                 breq8	avm_test_main+481
 d4 00                 jmp8	avm_test_main+377
 f0 1d 15              ldsp8u	r5, [sp+0x15]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 5c                 breq8	avm_test_main+481
 d4 00                 jmp8	avm_test_main+391
 f0 1d 14              ldsp8u	r5, [sp+0x14]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 4e                 breq8	avm_test_main+481
 d4 00                 jmp8	avm_test_main+405
 f0 1d 13              ldsp8u	r5, [sp+0x13]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 40                 breq8	avm_test_main+481
 d4 00                 jmp8	avm_test_main+419
 f0 1d 12              ldsp8u	r5, [sp+0x12]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 32                 breq8	avm_test_main+481
 d4 00                 jmp8	avm_test_main+433
 f3 7d                 ldsp8u	r5, [sp+0xf]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 25                 breq8	avm_test_main+481
 d4 00                 jmp8	avm_test_main+446
 f3 79                 ldsp8u	r5, [sp+0xe]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 18                 breq8	avm_test_main+481
 d4 00                 jmp8	avm_test_main+459
 f3 75                 ldsp8u	r5, [sp+0xd]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 0b                 breq8	avm_test_main+481
 d4 00                 jmp8	avm_test_main+472
 f3 70                 ldsp8u	r4, [sp+0xc]
 c1 01                 ldi8	r5, 0x1
 a1                    xor	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	avm_test_main+481
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 19                 adjsp	0x19
 ef                    ret

<fill_saved>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	fill_saved+9
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 40                 cmpi.s8	r4, 0x40
 d8 1b                 bruge8	fill_saved+42
 d4 00                 jmp8	fill_saved+17
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 01                 ldsp16	r5, [sp+0x0]
 e1 82 00              call16	pattern_byte
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 00 01              ldi16	r6, 0x100
 12                    add	r4, r6
 51                    st8	[r4], r5
 d4 00                 jmp8	fill_saved+34
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 df                 jmp8	fill_saved+9
 d6 03                 adjsp	0x3
 ef                    ret

<call_save_exists>:
 d7 2e                 sys	save_exists
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<call_load>:
 d7 2d                 sys	load
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<check_saved>:
 d6 fa                 adjsp	-0x6
 f1 40                 stsp8	[sp+0x4], r4
 a0                    xor	r4, r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	check_saved+9
 f4 08                 ldsp16	r4, [sp+0x2]
 cc 40                 cmpi.s8	r4, 0x40
 d8 29                 bruge8	check_saved+56
 d4 00                 jmp8	check_saved+17
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 00 01              ldi16	r6, 0x100
 01                    mov	r4, r5
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f4 40                 stsp16	[sp+0x0], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 d5 40                 call8	pattern_byte
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 75                 zext8	r5
 31                    cmp	r4, r5
 d0 07                 breq8	check_saved+46
 d4 00                 jmp8	check_saved+41
 a0                    xor	r4, r4
 f1 44                 stsp8	[sp+0x5], r4
 d4 10                 jmp8	check_saved+62
 d4 00                 jmp8	check_saved+48
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 d1                 jmp8	check_saved+9
 c0 01                 ldi8	r4, 0x1
 f1 44                 stsp8	[sp+0x5], r4
 d4 00                 jmp8	check_saved+62
 f3 54                 ldsp8u	r4, [sp+0x5]
 d6 06                 adjsp	0x6
 ef                    ret

<call_save>:
 d7 2c                 sys	save
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 29                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 47                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 4e                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d5 3f                 call8	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<pattern_byte>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f3 48                 ldsp8u	r4, [sp+0x2]
 c1 1d                 ldi8	r5, 0x1d
 f3 11                 mulu8.w	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 c3 11                 ldi8	r7, 0x11
 09                    mov	r6, r5
 fe 37                 mul16	r6, r7
 12                    add	r4, r6
 f4 8d                 lsr16.1	r5
 11                    add	r4, r5
 d6 03                 adjsp	0x3
 ef                    ret

<test_puts>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_puts+6
 f4 00                 ldsp16	r4, [sp+0x0]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d0 10                 breq8	test_puts+31
 d4 00                 jmp8	test_puts+17
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f4 41                 stsp16	[sp+0x0], r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 d5 05                 call8	test_putc
 d4 e7                 jmp8	test_puts+6
 d6 02                 adjsp	0x2
 ef                    ret

<test_putc>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex16>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 d5 07                 call8	test_hex8
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 03                 call8	test_hex8
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 fa 74                 lsr16i	r4, 0x4
 d5 0f                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d8                 call8	test_putc
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 07                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d0                 call8	test_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex_digit>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 0a                 cmpi.s8	r4, 0xa
 d9 0c                 brsge8	test_hex_digit+29
 d4 00                 jmp8	test_hex_digit+19
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 30                 addi.s8	r4, 0x30
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 0a                 jmp8	test_hex_digit+39
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 37                 addi.s8	r4, 0x37
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_hex_digit+39
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 03                 adjsp	0x3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
