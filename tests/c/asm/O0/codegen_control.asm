
codegen_control.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_control.c
000003e8 l     F .text	00000081 dense_switch
00000100 l     O .data	0000000c .L__const.avm_test_main.sparse_inputs
00000469 l     F .text	00000018 rotate_left
00000481 l     F .text	00000066 sparse_switch
000004e7 l     F .text	0000004e loop_control
00000535 l     F .text	0000009b run_state_machine
000005d0 l     F .text	00000057 select_mix
0000010c l     O .data	00000003 .L.str
00000627 l     F .text	00000019 test_line16
0000010f l     O .data	00000003 .L.str.1
00000112 l     O .data	00000003 .L.str.2
00000115 l     O .data	00000003 .L.str.3
00000118 l     O .data	00000003 .L.str.4
00000640 l     F .text	00000022 test_puts
00000662 l     F .text	0000000b test_putc
0000066d l     F .text	0000000f test_hex16
0000067c l     F .text	00000019 test_hex8
00000695 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
000006c3 l       .init_array	00000000 .hidden __init_array_end
000006c3 l       .init_array	00000000 .hidden __init_array_start
000006c3 l       .fini_array	00000000 .hidden __fini_array_start
000006c3 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000111 avm_test_main
000006c1 g     F .text	00000002 avm_halt
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
 e1 a3 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 c3 06              ldi16	r4, 0x6c3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 c3 06              ldi16	r6, 0x6c3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 c3 06           ldi16	r0, 0x6c3
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 c3 06           ldi16	r2, 0x6c3
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
 c4 c3 06              ldi16	r4, 0x6c3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 c3 06              ldi16	r6, 0x6c3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 c3 06           ldi16	r2, 0x6c3
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 c3 06           ldi16	r0, 0x6c3
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
 d6 e0                 adjsp	-0x20
 a0                    xor	r4, r4
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 2c 1d              stsp8	[sp+0x1d], r4
 d4 00                 jmp8	avm_test_main+11
 f0 1c 1d              ldsp8u	r4, [sp+0x1d]
 cc 0c                 cmpi.s8	r4, 0xc
 d9 20                 brsge8	avm_test_main+50
 d4 00                 jmp8	avm_test_main+20
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f4 58                 stsp16	[sp+0x6], r4
 f0 1c 1d              ldsp8u	r4, [sp+0x1d]
 e1 f2 00              call16	dense_switch
 04                    mov	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 11                    add	r4, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 d4 00                 jmp8	avm_test_main+40
 f0 1c 1d              ldsp8u	r4, [sp+0x1d]
 f4 ac                 inc16	r4
 f0 2c 1d              stsp8	[sp+0x1d], r4
 d4 d9                 jmp8	avm_test_main+11
 c5 00 01              ldi16	r5, 0x100
 c2 0c                 ldi8	r6, 0xc
 f0 14 11              leasp	r4, 0x11
 d7 0f                 sys	memcpy
 c4 0f 0f              ldi16	r4, 0xf0f
 f4 7c                 stsp16	[sp+0xf], r4
 a0                    xor	r4, r4
 f1 68                 stsp8	[sp+0xe], r4
 d4 00                 jmp8	avm_test_main+70
 f3 78                 ldsp8u	r4, [sp+0xe]
 cc 06                 cmpi.s8	r4, 0x6
 d9 26                 brsge8	avm_test_main+114
 d4 00                 jmp8	avm_test_main+78
 f4 3c                 ldsp16	r4, [sp+0xf]
 c1 01                 ldi8	r5, 0x1
 e1 3d 01              call16	rotate_left
 f4 50                 stsp16	[sp+0x4], r4
 f3 79                 ldsp8u	r5, [sp+0xe]
 15                    add	r5, r5
 f0 14 11              leasp	r4, 0x11
 11                    add	r4, r5
 60                    ld16	r4, [r4]
 e1 48 01              call16	sparse_switch
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 a1                    xor	r4, r5
 f4 7c                 stsp16	[sp+0xf], r4
 d4 00                 jmp8	avm_test_main+106
 f3 78                 ldsp8u	r4, [sp+0xe]
 f4 ac                 inc16	r4
 f1 68                 stsp8	[sp+0xe], r4
 d4 d4                 jmp8	avm_test_main+70
 c4 2b 6d              ldi16	r4, 0x6d2b
 e1 98 01              call16	loop_control
 f4 70                 stsp16	[sp+0xc], r4
 c0 07                 ldi8	r4, 0x7
 e1 df 01              call16	run_state_machine
 f4 68                 stsp16	[sp+0xa], r4
 d6 ff                 adjsp	-0x1
 c0 01                 ldi8	r4, 0x1
 f4 44                 stsp16	[sp+0x1], r4
 f1 30                 stsp8	[sp+0x0], r4
 c4 38 ff              ldi16	r4, 0xff38
 c1 7b                 ldi8	r5, 0x7b
 c6 34 12              ldi16	r6, 0x1234
 c7 0d f0              ldi16	r7, 0xf00d
 e1 62 02              call16	select_mix
 d6 01                 adjsp	0x1
 f4 60                 stsp16	[sp+0x8], r4
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 c4 0c 01              ldi16	r4, 0x10c
 e1 ac 02              call16	test_line16
 f4 3d                 ldsp16	r5, [sp+0xf]
 c4 0f 01              ldi16	r4, 0x10f
 e1 a4 02              call16	test_line16
 f4 31                 ldsp16	r5, [sp+0xc]
 c4 12 01              ldi16	r4, 0x112
 e1 9c 02              call16	test_line16
 f4 29                 ldsp16	r5, [sp+0xa]
 c4 15 01              ldi16	r4, 0x115
 e1 94 02              call16	test_line16
 f4 21                 ldsp16	r5, [sp+0x8]
 c4 18 01              ldi16	r4, 0x118
 e1 8c 02              call16	test_line16
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 c6 c0 04              ldi16	r6, 0x4c0
 36                    cmp	r5, r6
 f4 48                 stsp16	[sp+0x2], r4
 d1 38                 brne8	avm_test_main+265
 d4 00                 jmp8	avm_test_main+211
 f4 3d                 ldsp16	r5, [sp+0xf]
 c0 01                 ldi8	r4, 0x1
 c6 bc 44              ldi16	r6, 0x44bc
 36                    cmp	r5, r6
 f4 48                 stsp16	[sp+0x2], r4
 d1 2a                 brne8	avm_test_main+265
 d4 00                 jmp8	avm_test_main+225
 f4 31                 ldsp16	r5, [sp+0xc]
 c0 01                 ldi8	r4, 0x1
 c6 e4 41              ldi16	r6, 0x41e4
 36                    cmp	r5, r6
 f4 48                 stsp16	[sp+0x2], r4
 d1 1c                 brne8	avm_test_main+265
 d4 00                 jmp8	avm_test_main+239
 f4 29                 ldsp16	r5, [sp+0xa]
 c0 01                 ldi8	r4, 0x1
 c6 10 e6              ldi16	r6, 0xe610
 36                    cmp	r5, r6
 f4 48                 stsp16	[sp+0x2], r4
 d1 0e                 brne8	avm_test_main+265
 d4 00                 jmp8	avm_test_main+253
 f4 20                 ldsp16	r4, [sp+0x8]
 c5 9f a5              ldi16	r5, 0xa59f
 31                    cmp	r4, r5
 f8 0c                 cset.ne	r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	avm_test_main+265
 f4 08                 ldsp16	r4, [sp+0x2]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 20                 adjsp	0x20
 ef                    ret

<dense_switch>:
 d6 fb                 adjsp	-0x5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 a4                 tst8	r4
 d0 3a                 breq8	dense_switch+70
 d4 00                 jmp8	dense_switch+14
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d0 38                 breq8	dense_switch+76
 d4 00                 jmp8	dense_switch+22
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 02                 cmpi.s8	r4, 0x2
 d0 36                 breq8	dense_switch+82
 d4 00                 jmp8	dense_switch+30
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 03                 cmpi.s8	r4, 0x3
 d0 34                 breq8	dense_switch+88
 d4 00                 jmp8	dense_switch+38
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 04                 cmpi.s8	r4, 0x4
 d0 32                 breq8	dense_switch+94
 d4 00                 jmp8	dense_switch+46
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 05                 cmpi.s8	r4, 0x5
 d0 30                 breq8	dense_switch+100
 d4 00                 jmp8	dense_switch+54
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 06                 cmpi.s8	r4, 0x6
 d0 2e                 breq8	dense_switch+106
 d4 00                 jmp8	dense_switch+62
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 07                 cmpi.s8	r4, 0x7
 d0 2c                 breq8	dense_switch+112
 d4 30                 jmp8	dense_switch+118
 c0 10                 ldi8	r4, 0x10
 f4 4c                 stsp16	[sp+0x3], r4
 d4 30                 jmp8	dense_switch+124
 c0 21                 ldi8	r4, 0x21
 f4 4c                 stsp16	[sp+0x3], r4
 d4 2a                 jmp8	dense_switch+124
 c0 32                 ldi8	r4, 0x32
 f4 4c                 stsp16	[sp+0x3], r4
 d4 24                 jmp8	dense_switch+124
 c0 43                 ldi8	r4, 0x43
 f4 4c                 stsp16	[sp+0x3], r4
 d4 1e                 jmp8	dense_switch+124
 c0 54                 ldi8	r4, 0x54
 f4 4c                 stsp16	[sp+0x3], r4
 d4 18                 jmp8	dense_switch+124
 c0 65                 ldi8	r4, 0x65
 f4 4c                 stsp16	[sp+0x3], r4
 d4 12                 jmp8	dense_switch+124
 c0 76                 ldi8	r4, 0x76
 f4 4c                 stsp16	[sp+0x3], r4
 d4 0c                 jmp8	dense_switch+124
 c0 87                 ldi8	r4, 0x87
 f4 4c                 stsp16	[sp+0x3], r4
 d4 06                 jmp8	dense_switch+124
 c0 99                 ldi8	r4, 0x99
 f4 4c                 stsp16	[sp+0x3], r4
 d4 00                 jmp8	dense_switch+124
 f4 0c                 ldsp16	r4, [sp+0x3]
 d6 05                 adjsp	0x5
 ef                    ret

<rotate_left>:
 d6 fd                 adjsp	-0x3
 f4 44                 stsp16	[sp+0x1], r4
 f1 31                 stsp8	[sp+0x0], r5
 f4 05                 ldsp16	r5, [sp+0x1]
 f3 43                 ldsp8u	r7, [sp+0x0]
 01                    mov	r4, r5
 fa 03                 shl16v	r4, r7
 c2 10                 ldi8	r6, 0x10
 2b                    sub	r6, r7
 f1 76                 zext8	r6
 fa 16                 lsr16v	r5, r6
 91                    or	r4, r5
 d6 03                 adjsp	0x3
 ef                    ret

<sparse_switch>:
 d6 fa                 adjsp	-0x6
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 c5 00 80              ldi16	r5, 0x8000
 31                    cmp	r4, r5
 d0 42                 breq8	sparse_switch+80
 d4 00                 jmp8	sparse_switch+16
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d0 1e                 breq8	sparse_switch+52
 d4 00                 jmp8	sparse_switch+24
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 11                 cmpi.s8	r4, 0x11
 d0 1d                 breq8	sparse_switch+59
 d4 00                 jmp8	sparse_switch+32
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 01 01              ldi16	r5, 0x101
 31                    cmp	r4, r5
 d0 1a                 breq8	sparse_switch+66
 d4 00                 jmp8	sparse_switch+42
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 00 10              ldi16	r5, 0x1000
 31                    cmp	r4, r5
 d0 17                 breq8	sparse_switch+73
 d4 23                 jmp8	sparse_switch+87
 c4 11 11              ldi16	r4, 0x1111
 f4 50                 stsp16	[sp+0x4], r4
 d4 26                 jmp8	sparse_switch+97
 c4 22 22              ldi16	r4, 0x2222
 f4 50                 stsp16	[sp+0x4], r4
 d4 1f                 jmp8	sparse_switch+97
 c4 33 33              ldi16	r4, 0x3333
 f4 50                 stsp16	[sp+0x4], r4
 d4 18                 jmp8	sparse_switch+97
 c4 44 44              ldi16	r4, 0x4444
 f4 50                 stsp16	[sp+0x4], r4
 d4 11                 jmp8	sparse_switch+97
 c4 55 55              ldi16	r4, 0x5555
 f4 50                 stsp16	[sp+0x4], r4
 d4 0a                 jmp8	sparse_switch+97
 f4 08                 ldsp16	r4, [sp+0x2]
 c5 5a a5              ldi16	r5, 0xa55a
 a1                    xor	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	sparse_switch+97
 f4 10                 ldsp16	r4, [sp+0x4]
 d6 06                 adjsp	0x6
 ef                    ret

<loop_control>:
 d6 fb                 adjsp	-0x5
 f4 4c                 stsp16	[sp+0x3], r4
 f4 0c                 ldsp16	r4, [sp+0x3]
 f4 44                 stsp16	[sp+0x1], r4
 a0                    xor	r4, r4
 f1 30                 stsp8	[sp+0x0], r4
 d4 00                 jmp8	loop_control+13
 f3 40                 ldsp8u	r4, [sp+0x0]
 cc 40                 cmpi.s8	r4, 0x40
 d9 36                 brsge8	loop_control+73
 d4 00                 jmp8	loop_control+21
 f3 40                 ldsp8u	r4, [sp+0x0]
 c1 03                 ldi8	r5, 0x3
 81                    and	r4, r5
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	loop_control+34
 d4 00                 jmp8	loop_control+32
 d4 1f                 jmp8	loop_control+65
 f4 04                 ldsp16	r4, [sp+0x1]
 c1 01                 ldi8	r5, 0x1
 e1 59 ff              call16	rotate_left
 f3 41                 ldsp8u	r5, [sp+0x0]
 c6 23 01              ldi16	r6, 0x123
 fe 2e                 mul16	r5, r6
 c9 55                 addi.s8	r5, 0x55
 a1                    xor	r4, r5
 f4 44                 stsp16	[sp+0x1], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 cc 25                 cmpi.s8	r4, 0x25
 d1 04                 brne8	loop_control+63
 d4 00                 jmp8	loop_control+61
 d4 0a                 jmp8	loop_control+73
 d4 00                 jmp8	loop_control+65
 f3 40                 ldsp8u	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f1 30                 stsp8	[sp+0x0], r4
 d4 c4                 jmp8	loop_control+13
 f4 04                 ldsp16	r4, [sp+0x1]
 d6 05                 adjsp	0x5
 ef                    ret

<run_state_machine>:
 d6 f9                 adjsp	-0x7
 f1 48                 stsp8	[sp+0x6], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 c1 05                 ldi8	r5, 0x5
 ec 65                 urem16	r4, r5
 f1 44                 stsp8	[sp+0x5], r4
 c4 34 12              ldi16	r4, 0x1234
 f4 4c                 stsp16	[sp+0x3], r4
 a0                    xor	r4, r4
 f1 38                 stsp8	[sp+0x2], r4
 d4 00                 jmp8	run_state_machine+22
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 17                 cmpi.s8	r4, 0x17
 d9 77                 brsge8	run_state_machine+147
 d4 00                 jmp8	run_state_machine+30
 f3 54                 ldsp8u	r4, [sp+0x5]
 f4 40                 stsp16	[sp+0x0], r4
 f4 a4                 tst8	r4
 d0 1a                 breq8	run_state_machine+64
 d4 00                 jmp8	run_state_machine+40
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d0 20                 breq8	run_state_machine+78
 d4 00                 jmp8	run_state_machine+48
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 02                 cmpi.s8	r4, 0x2
 d0 26                 breq8	run_state_machine+92
 d4 00                 jmp8	run_state_machine+56
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 03                 cmpi.s8	r4, 0x3
 d0 2c                 breq8	run_state_machine+106
 d4 38                 jmp8	run_state_machine+120
 f4 0c                 ldsp16	r4, [sp+0x3]
 c5 11 01              ldi16	r5, 0x111
 11                    add	r4, r5
 f4 4c                 stsp16	[sp+0x3], r4
 c0 03                 ldi8	r4, 0x3
 f1 44                 stsp8	[sp+0x5], r4
 d4 3b                 jmp8	run_state_machine+137
 f4 0c                 ldsp16	r4, [sp+0x3]
 c5 22 22              ldi16	r5, 0x2222
 a1                    xor	r4, r5
 f4 4c                 stsp16	[sp+0x3], r4
 c0 04                 ldi8	r4, 0x4
 f1 44                 stsp8	[sp+0x5], r4
 d4 2d                 jmp8	run_state_machine+137
 f4 0c                 ldsp16	r4, [sp+0x3]
 c1 03                 ldi8	r5, 0x3
 e1 d1 fe              call16	rotate_left
 f4 4c                 stsp16	[sp+0x3], r4
 a0                    xor	r4, r4
 f1 44                 stsp8	[sp+0x5], r4
 d4 1f                 jmp8	run_state_machine+137
 f4 0c                 ldsp16	r4, [sp+0x3]
 c5 cd fc              ldi16	r5, 0xfccd
 11                    add	r4, r5
 f4 4c                 stsp16	[sp+0x3], r4
 c0 01                 ldi8	r4, 0x1
 f1 44                 stsp8	[sp+0x5], r4
 d4 11                 jmp8	run_state_machine+137
 f4 0c                 ldsp16	r4, [sp+0x3]
 f3 49                 ldsp8u	r5, [sp+0x2]
 c2 11                 ldi8	r6, 0x11
 f3 16                 mulu8.w	r5, r6
 11                    add	r4, r5
 f4 4c                 stsp16	[sp+0x3], r4
 c0 02                 ldi8	r4, 0x2
 f1 44                 stsp8	[sp+0x5], r4
 d4 00                 jmp8	run_state_machine+137
 d4 00                 jmp8	run_state_machine+139
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f1 38                 stsp8	[sp+0x2], r4
 d4 83                 jmp8	run_state_machine+22
 f4 0c                 ldsp16	r4, [sp+0x3]
 f3 55                 ldsp8u	r5, [sp+0x5]
 a1                    xor	r4, r5
 d6 07                 adjsp	0x7
 ef                    ret

<select_mix>:
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f0 18 15              ldsp8u	r0, [sp+0x15]
 f4 78                 stsp16	[sp+0xe], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 31                 ldsp16	r5, [sp+0xc]
 31                    cmp	r4, r5
 d9 08                 brsge8	select_mix+29
 d4 00                 jmp8	select_mix+23
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 48                 stsp16	[sp+0x2], r4
 d4 06                 jmp8	select_mix+35
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	select_mix+35
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 20                 ldsp16	r4, [sp+0x8]
 31                    cmp	r4, r5
 d8 08                 bruge8	select_mix+54
 d4 00                 jmp8	select_mix+48
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 40                 stsp16	[sp+0x0], r4
 d4 06                 jmp8	select_mix+60
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	select_mix+60
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 50                 stsp16	[sp+0x4], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 11                 ldsp16	r5, [sp+0x4]
 a1                    xor	r4, r5
 f0 1f 15              ldsp8u	r7, [sp+0x15]
 c5 55 55              ldi16	r5, 0x5555
 c6 aa aa              ldi16	r6, 0xaaaa
 f4 a7                 tst8	r7
 fb 6e                 cmov.ne	r5, r6
 a1                    xor	r4, r5
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 0f                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 2d                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 34                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d5 25                 call8	test_putc
 d6 04                 adjsp	0x4
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
