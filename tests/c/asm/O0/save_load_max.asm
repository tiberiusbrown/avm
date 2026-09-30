
save_load_max.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000051e l     F .text	0000004a avm_run_constructors
00000568 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 save_load_max.c
000006f5 l     F .text	00000007 call_save_exists
000006fc l     F .text	0000002f fill_saved
0000072b l     F .text	00000003 call_save
0000072e l     F .text	00000007 call_load
00000735 l     F .text	00000045 check_saved
0000077a l     F .text	00000023 test_line16_chars
0000079d l     F .text	0000001a pattern_byte
00000100 l     O .saved	00000400 saved_state
000007b7 l     F .text	0000000b test_putc
000007c2 l     F .text	0000000f test_hex16
000007d1 l     F .text	00000019 test_hex8
000007ea l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00000818 l       .init_array	00000000 .hidden __init_array_end
00000818 l       .init_array	00000000 .hidden __init_array_start
00000818 l       .fini_array	00000000 .hidden __fini_array_start
00000818 l       .fini_array	00000000 .hidden __fini_array_end
00000500 g     F .text	0000001e _start
000005d7 g     F .text	0000011e avm_test_main
00000816 g     F .text	00000002 avm_halt
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
 e1 f8 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 18 08              ldi16	r4, 0x818
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 18 08              ldi16	r6, 0x818
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 18 08           ldi16	r0, 0x818
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 18 08           ldi16	r2, 0x818
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
 e1 81 fa              call16	-1407
 c4 18 08              ldi16	r4, 0x818
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 18 08              ldi16	r6, 0x818
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 18 08           ldi16	r2, 0x818
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 18 08           ldi16	r0, 0x818
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
 e1 30 fa              call16	-1488
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 d6 e9                 adjsp	-0x17
 e1 19 01              call16	call_save_exists
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f0 2d 16              stsp8	[sp+0x16], r5
 f0 2c 15              stsp8	[sp+0x15], r4
 d4 00                 jmp8	avm_test_main+17
 f0 1c 15              ldsp8u	r4, [sp+0x15]
 cc 05                 cmpi.s8	r4, 0x5
 d9 17                 brsge8	avm_test_main+47
 d4 00                 jmp8	avm_test_main+26
 f0 1c 15              ldsp8u	r4, [sp+0x15]
 e1 05 01              call16	fill_saved
 e1 31 01              call16	call_save
 d4 00                 jmp8	avm_test_main+37
 f0 1c 15              ldsp8u	r4, [sp+0x15]
 f4 ac                 inc16	r4
 f0 2c 15              stsp8	[sp+0x15], r4
 d4 e2                 jmp8	avm_test_main+17
 e1 ec 00              call16	call_save_exists
 c1 01                 ldi8	r5, 0x1
 f4 71                 stsp16	[sp+0xc], r5
 81                    and	r4, r5
 f0 2c 14              stsp8	[sp+0x14], r4
 c0 ee                 ldi8	r4, 0xee
 e1 e6 00              call16	fill_saved
 e1 15 01              call16	call_load
 f4 31                 ldsp16	r5, [sp+0xc]
 81                    and	r4, r5
 f0 2c 13              stsp8	[sp+0x13], r4
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 e1 0f 01              call16	check_saved
 f4 31                 ldsp16	r5, [sp+0xc]
 81                    and	r4, r5
 f0 2c 12              stsp8	[sp+0x12], r4
 c0 dd                 ldi8	r4, 0xdd
 e1 cb 00              call16	fill_saved
 e1 fa 00              call16	call_load
 f4 32                 ldsp16	r6, [sp+0xc]
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 86                    and	r5, r6
 f0 2d 11              stsp8	[sp+0x11], r5
 e1 f5 00              call16	check_saved
 04                    mov	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 84                    and	r5, r4
 f0 2d 10              stsp8	[sp+0x10], r5
 f0 1e 16              ldsp8u	r6, [sp+0x16]
 88                    and	r6, r4
 c0 45                 ldi8	r4, 0x45
 f4 48                 stsp16	[sp+0x2], r4
 c1 30                 ldi8	r5, 0x30
 e1 26 01              call16	test_line16_chars
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 1e 14              ldsp8u	r6, [sp+0x14]
 89                    and	r6, r5
 c1 31                 ldi8	r5, 0x31
 f4 51                 stsp16	[sp+0x4], r5
 e1 17 01              call16	test_line16_chars
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 1e 13              ldsp8u	r6, [sp+0x13]
 88                    and	r6, r4
 c0 4c                 ldi8	r4, 0x4c
 f4 58                 stsp16	[sp+0x6], r4
 e1 08 01              call16	test_line16_chars
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 1e 12              ldsp8u	r6, [sp+0x12]
 88                    and	r6, r4
 c0 43                 ldi8	r4, 0x43
 f4 60                 stsp16	[sp+0x8], r4
 e1 f9 00              call16	test_line16_chars
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 1e 11              ldsp8u	r6, [sp+0x11]
 89                    and	r6, r5
 c1 32                 ldi8	r5, 0x32
 f4 69                 stsp16	[sp+0xa], r5
 e1 ea 00              call16	test_line16_chars
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 1e 10              ldsp8u	r6, [sp+0x10]
 8b                    and	r6, r7
 e1 dd 00              call16	test_line16_chars
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 1d 16              ldsp8u	r5, [sp+0x16]
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 78                 stsp16	[sp+0xe], r4
 d1 44                 brne8	avm_test_main+278
 d4 00                 jmp8	avm_test_main+212
 f0 1d 14              ldsp8u	r5, [sp+0x14]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 78                 stsp16	[sp+0xe], r4
 d0 36                 breq8	avm_test_main+278
 d4 00                 jmp8	avm_test_main+226
 f0 1d 13              ldsp8u	r5, [sp+0x13]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 78                 stsp16	[sp+0xe], r4
 d0 28                 breq8	avm_test_main+278
 d4 00                 jmp8	avm_test_main+240
 f0 1d 12              ldsp8u	r5, [sp+0x12]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 78                 stsp16	[sp+0xe], r4
 d0 1a                 breq8	avm_test_main+278
 d4 00                 jmp8	avm_test_main+254
 f0 1d 11              ldsp8u	r5, [sp+0x11]
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 78                 stsp16	[sp+0xe], r4
 d0 0c                 breq8	avm_test_main+278
 d4 00                 jmp8	avm_test_main+268
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 c1 01                 ldi8	r5, 0x1
 a1                    xor	r4, r5
 f4 78                 stsp16	[sp+0xe], r4
 d4 00                 jmp8	avm_test_main+278
 f4 38                 ldsp16	r4, [sp+0xe]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 17                 adjsp	0x17
 ef                    ret

<call_save_exists>:
 d7 2e                 sys	save_exists
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<fill_saved>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	fill_saved+9
 f4 01                 ldsp16	r5, [sp+0x0]
 c4 ff 03              ldi16	r4, 0x3ff
 31                    cmp	r4, r5
 d2 1b                 brult8	fill_saved+44
 d4 00                 jmp8	fill_saved+19
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 01                 ldsp16	r5, [sp+0x0]
 e1 87 00              call16	pattern_byte
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 00 01              ldi16	r6, 0x100
 12                    add	r4, r6
 51                    st8	[r4], r5
 d4 00                 jmp8	fill_saved+36
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 dd                 jmp8	fill_saved+9
 d6 03                 adjsp	0x3
 ef                    ret

<call_save>:
 d7 2c                 sys	save
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
 f4 09                 ldsp16	r5, [sp+0x2]
 c4 ff 03              ldi16	r4, 0x3ff
 31                    cmp	r4, r5
 d2 29                 brult8	check_saved+58
 d4 00                 jmp8	check_saved+19
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 00 01              ldi16	r6, 0x100
 01                    mov	r4, r5
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f4 40                 stsp16	[sp+0x0], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 d5 47                 call8	pattern_byte
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 75                 zext8	r5
 31                    cmp	r4, r5
 d0 07                 breq8	check_saved+48
 d4 00                 jmp8	check_saved+43
 a0                    xor	r4, r4
 f1 44                 stsp8	[sp+0x5], r4
 d4 10                 jmp8	check_saved+64
 d4 00                 jmp8	check_saved+50
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 cf                 jmp8	check_saved+9
 c0 01                 ldi8	r4, 0x1
 f1 44                 stsp8	[sp+0x5], r4
 d4 00                 jmp8	check_saved+64
 f3 54                 ldsp8u	r4, [sp+0x5]
 d6 06                 adjsp	0x6
 ef                    ret

<test_line16_chars>:
 d6 fc                 adjsp	-0x4
 f1 3c                 stsp8	[sp+0x3], r4
 f1 39                 stsp8	[sp+0x2], r5
 f4 42                 stsp16	[sp+0x0], r6
 f3 4c                 ldsp8u	r4, [sp+0x3]
 f6 44                 sext8	r4
 d5 2f                 call8	test_putc
 f3 48                 ldsp8u	r4, [sp+0x2]
 f6 44                 sext8	r4
 d5 29                 call8	test_putc
 c0 3d                 ldi8	r4, 0x3d
 d5 25                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 2c                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d5 1d                 call8	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<pattern_byte>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f3 48                 ldsp8u	r4, [sp+0x2]
 c1 2b                 ldi8	r5, 0x2b
 f3 11                 mulu8.w	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 c3 0d                 ldi8	r7, 0xd
 09                    mov	r6, r5
 fe 37                 mul16	r6, r7
 12                    add	r4, r6
 fa 83                 lsr16i	r5, 0x3
 11                    add	r4, r5
 d6 03                 adjsp	0x3
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
