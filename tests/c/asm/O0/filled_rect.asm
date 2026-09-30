
filled_rect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 filled_rect.c
00000608 l     F .text	0000011d check_case
00000725 l     F .text	000000ef check_round_trip
00000814 l     F .text	000000a4 clip_rect
000008b8 l     F .text	00000064 prepare_memory
0000091c l     F .text	0000009a check_guards
000009b6 l     F .text	00000018 initial_byte
000009ce l     F .text	00000081 byte_mask
00000a4f l     F .text	0000002d fail_case
00000a7c l     F .text	00000016 guard_before_byte
00000a92 l     F .text	00000016 guard_after_byte
00000100 l     O .data	00000005 .L.str
00000aa8 l     F .text	00000019 test_line16
00000105 l     O .data	00000005 .L.str.1
0000010a l     O .data	00000005 .L.str.2
0000010f l     O .data	00000004 .L.str.3
00000ac1 l     F .text	00000022 test_puts
00000ae3 l     F .text	0000000b test_putc
00000aee l     F .text	0000000f test_hex16
00000afd l     F .text	00000019 test_hex8
00000b16 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00000b44 l       .init_array	00000000 .hidden __init_array_end
00000b44 l       .init_array	00000000 .hidden __init_array_start
00000b44 l       .fini_array	00000000 .hidden __fini_array_start
00000b44 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000331 avm_test_main
00000b42 g     F .text	00000002 avm_halt
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
 e1 24 09              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 44 0b              ldi16	r4, 0xb44
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 44 0b              ldi16	r6, 0xb44
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 44 0b           ldi16	r0, 0xb44
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 44 0b           ldi16	r2, 0xb44
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
 c4 44 0b              ldi16	r4, 0xb44
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 44 0b              ldi16	r6, 0xb44
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 44 0b           ldi16	r2, 0xb44
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 44 0b           ldi16	r0, 0xb44
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
 d6 fe                 adjsp	-0x2
 d6 fd                 adjsp	-0x3
 c0 31                 ldi8	r4, 0x31
 f1 38                 stsp8	[sp+0x2], r4
 c3 08                 ldi8	r7, 0x8
 f1 37                 stsp8	[sp+0x1], r7
 c0 0d                 ldi8	r4, 0xd
 f1 30                 stsp8	[sp+0x0], r4
 a0                    xor	r4, r4
 c1 01                 ldi8	r5, 0x1
 c2 0a                 ldi8	r6, 0xa
 e1 19 03              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+39
 d4 00                 jmp8	avm_test_main+32
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 05 03              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 c7                 ldi8	r4, 0xc7
 f1 38                 stsp8	[sp+0x2], r4
 c3 08                 ldi8	r7, 0x8
 f1 37                 stsp8	[sp+0x1], r7
 c0 0d                 ldi8	r4, 0xd
 f1 30                 stsp8	[sp+0x0], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 c2 0a                 ldi8	r6, 0xa
 e1 f4 02              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+76
 d4 00                 jmp8	avm_test_main+69
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 e0 02              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 5a                 ldi8	r4, 0x5a
 f1 38                 stsp8	[sp+0x2], r4
 c0 13                 ldi8	r4, 0x13
 f1 34                 stsp8	[sp+0x1], r4
 c0 11                 ldi8	r4, 0x11
 f1 30                 stsp8	[sp+0x0], r4
 c0 02                 ldi8	r4, 0x2
 c1 01                 ldi8	r5, 0x1
 c2 14                 ldi8	r6, 0x14
 c3 05                 ldi8	r7, 0x5
 e1 cc 02              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+116
 d4 00                 jmp8	avm_test_main+109
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 b8 02              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 a5                 ldi8	r4, 0xa5
 f1 38                 stsp8	[sp+0x2], r4
 c0 13                 ldi8	r4, 0x13
 f1 34                 stsp8	[sp+0x1], r4
 c0 11                 ldi8	r4, 0x11
 f1 30                 stsp8	[sp+0x0], r4
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 c2 14                 ldi8	r6, 0x14
 c3 05                 ldi8	r7, 0x5
 e1 a5 02              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+155
 d4 00                 jmp8	avm_test_main+148
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 91 02              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 96                 ldi8	r4, 0x96
 f1 38                 stsp8	[sp+0x2], r4
 c0 0a                 ldi8	r4, 0xa
 f1 34                 stsp8	[sp+0x1], r4
 c0 0c                 ldi8	r4, 0xc
 f1 30                 stsp8	[sp+0x0], r4
 c0 04                 ldi8	r4, 0x4
 c1 01                 ldi8	r5, 0x1
 c6 f9 ff              ldi16	r6, 0xfff9
 c7 fd ff              ldi16	r7, 0xfffd
 e1 7b 02              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+197
 d4 00                 jmp8	avm_test_main+190
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 67 02              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 69                 ldi8	r4, 0x69
 f1 38                 stsp8	[sp+0x2], r4
 c0 14                 ldi8	r4, 0x14
 f1 34                 stsp8	[sp+0x1], r4
 f1 30                 stsp8	[sp+0x0], r4
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 c2 7c                 ldi8	r6, 0x7c
 c3 3c                 ldi8	r7, 0x3c
 e1 56 02              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+234
 d4 00                 jmp8	avm_test_main+227
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 42 02              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 3c                 ldi8	r4, 0x3c
 f1 38                 stsp8	[sp+0x2], r4
 c0 02                 ldi8	r4, 0x2
 f1 34                 stsp8	[sp+0x1], r4
 c0 09                 ldi8	r4, 0x9
 f1 30                 stsp8	[sp+0x0], r4
 c0 06                 ldi8	r4, 0x6
 c1 01                 ldi8	r5, 0x1
 c2 28                 ldi8	r6, 0x28
 c3 07                 ldi8	r7, 0x7
 e1 2e 02              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+274
 d4 00                 jmp8	avm_test_main+267
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 1a 02              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 c3                 ldi8	r4, 0xc3
 f1 38                 stsp8	[sp+0x2], r4
 c0 01                 ldi8	r4, 0x1
 f1 34                 stsp8	[sp+0x1], r4
 f1 30                 stsp8	[sp+0x0], r4
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 c2 7f                 ldi8	r6, 0x7f
 c3 3f                 ldi8	r7, 0x3f
 e1 09 02              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+311
 d4 00                 jmp8	avm_test_main+304
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 f5 01              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 55                 ldi8	r4, 0x55
 f1 38                 stsp8	[sp+0x2], r4
 c0 ff                 ldi8	r4, 0xff
 f1 34                 stsp8	[sp+0x1], r4
 f1 30                 stsp8	[sp+0x0], r4
 c0 08                 ldi8	r4, 0x8
 c1 01                 ldi8	r5, 0x1
 c6 81 ff              ldi16	r6, 0xff81
 c7 41 ff              ldi16	r7, 0xff41
 e1 e1 01              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+351
 d4 00                 jmp8	avm_test_main+344
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 cd 01              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 aa                 ldi8	r4, 0xaa
 f1 38                 stsp8	[sp+0x2], r4
 c0 40                 ldi8	r4, 0x40
 f1 34                 stsp8	[sp+0x1], r4
 c0 80                 ldi8	r4, 0x80
 f1 30                 stsp8	[sp+0x0], r4
 c0 09                 ldi8	r4, 0x9
 af                    xor	r7, r7
 07                    mov	r5, r7
 0b                    mov	r6, r7
 e1 bc 01              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+388
 d4 00                 jmp8	avm_test_main+381
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 a8 01              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 0f                 ldi8	r4, 0xf
 f1 38                 stsp8	[sp+0x2], r4
 c0 11                 ldi8	r4, 0x11
 f1 34                 stsp8	[sp+0x1], r4
 a0                    xor	r4, r4
 f1 30                 stsp8	[sp+0x0], r4
 c0 0a                 ldi8	r4, 0xa
 c1 01                 ldi8	r5, 0x1
 c2 1e                 ldi8	r6, 0x1e
 c3 0c                 ldi8	r7, 0xc
 e1 95 01              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+427
 d4 00                 jmp8	avm_test_main+420
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 81 01              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 f0                 ldi8	r4, 0xf0
 f1 38                 stsp8	[sp+0x2], r4
 a5                    xor	r5, r5
 f1 35                 stsp8	[sp+0x1], r5
 c0 11                 ldi8	r4, 0x11
 f1 30                 stsp8	[sp+0x0], r4
 c0 0b                 ldi8	r4, 0xb
 c2 1e                 ldi8	r6, 0x1e
 c3 0c                 ldi8	r7, 0xc
 e1 70 01              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+464
 d4 00                 jmp8	avm_test_main+457
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 5c 01              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 87                 ldi8	r4, 0x87
 f1 38                 stsp8	[sp+0x2], r4
 c0 09                 ldi8	r4, 0x9
 f1 34                 stsp8	[sp+0x1], r4
 c0 11                 ldi8	r4, 0x11
 f1 30                 stsp8	[sp+0x0], r4
 c1 01                 ldi8	r5, 0x1
 c2 80                 ldi8	r6, 0x80
 c3 0c                 ldi8	r7, 0xc
 03                    mov	r4, r7
 e1 49 01              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+503
 d4 00                 jmp8	avm_test_main+496
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 35 01              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 78                 ldi8	r4, 0x78
 f1 38                 stsp8	[sp+0x2], r4
 c0 09                 ldi8	r4, 0x9
 f1 34                 stsp8	[sp+0x1], r4
 c0 14                 ldi8	r4, 0x14
 f1 30                 stsp8	[sp+0x0], r4
 c0 0d                 ldi8	r4, 0xd
 a5                    xor	r5, r5
 c6 ec ff              ldi16	r6, 0xffec
 c3 0c                 ldi8	r7, 0xc
 e1 21 01              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+543
 d4 00                 jmp8	avm_test_main+536
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 0d 01              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c2 1e                 ldi8	r6, 0x1e
 f1 3a                 stsp8	[sp+0x2], r6
 c0 09                 ldi8	r4, 0x9
 f1 34                 stsp8	[sp+0x1], r4
 c0 11                 ldi8	r4, 0x11
 f1 30                 stsp8	[sp+0x0], r4
 c0 0e                 ldi8	r4, 0xe
 c1 01                 ldi8	r5, 0x1
 c7 f7 ff              ldi16	r7, 0xfff7
 e1 fa 00              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+582
 d4 00                 jmp8	avm_test_main+575
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 e6 00              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 e1                 ldi8	r4, 0xe1
 f1 38                 stsp8	[sp+0x2], r4
 c0 09                 ldi8	r4, 0x9
 f1 34                 stsp8	[sp+0x1], r4
 c0 11                 ldi8	r4, 0x11
 f1 30                 stsp8	[sp+0x0], r4
 c0 0f                 ldi8	r4, 0xf
 a5                    xor	r5, r5
 c2 1e                 ldi8	r6, 0x1e
 c3 40                 ldi8	r7, 0x40
 e1 d3 00              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+621
 d4 00                 jmp8	avm_test_main+614
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 bf 00              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 42                 ldi8	r4, 0x42
 f1 38                 stsp8	[sp+0x2], r4
 c0 09                 ldi8	r4, 0x9
 f1 34                 stsp8	[sp+0x1], r4
 c0 ff                 ldi8	r4, 0xff
 f1 30                 stsp8	[sp+0x0], r4
 c0 10                 ldi8	r4, 0x10
 c1 01                 ldi8	r5, 0x1
 c6 02 ff              ldi16	r6, 0xff02
 c3 0b                 ldi8	r7, 0xb
 e1 aa 00              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+662
 d4 00                 jmp8	avm_test_main+655
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 96 00              jmp16	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 24                 ldi8	r4, 0x24
 f1 38                 stsp8	[sp+0x2], r4
 c0 ff                 ldi8	r4, 0xff
 f1 34                 stsp8	[sp+0x1], r4
 c0 05                 ldi8	r4, 0x5
 f1 30                 stsp8	[sp+0x0], r4
 c0 11                 ldi8	r4, 0x11
 a5                    xor	r5, r5
 c2 1e                 ldi8	r6, 0x1e
 c7 02 ff              ldi16	r7, 0xff02
 e1 82 00              call16	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+701
 d4 00                 jmp8	avm_test_main+695
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 6f                 jmp8	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 66                 ldi8	r4, 0x66
 f1 38                 stsp8	[sp+0x2], r4
 c0 ff                 ldi8	r4, 0xff
 f1 34                 stsp8	[sp+0x1], r4
 f1 30                 stsp8	[sp+0x0], r4
 c0 12                 ldi8	r4, 0x12
 c1 01                 ldi8	r5, 0x1
 c2 78                 ldi8	r6, 0x78
 c3 3c                 ldi8	r7, 0x3c
 d5 5e                 call8	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+737
 d4 00                 jmp8	avm_test_main+731
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 4b                 jmp8	avm_test_main+812
 d6 fd                 adjsp	-0x3
 c0 99                 ldi8	r4, 0x99
 f1 38                 stsp8	[sp+0x2], r4
 c0 ff                 ldi8	r4, 0xff
 f1 34                 stsp8	[sp+0x1], r4
 f1 30                 stsp8	[sp+0x0], r4
 c0 13                 ldi8	r4, 0x13
 a5                    xor	r5, r5
 c7 38 ff              ldi16	r7, 0xff38
 0b                    mov	r6, r7
 d5 3b                 call8	check_case
 d6 03                 adjsp	0x3
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+772
 d4 00                 jmp8	avm_test_main+766
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 28                 jmp8	avm_test_main+812
 d6 fe                 adjsp	-0x2
 c0 5d                 ldi8	r4, 0x5d
 f1 34                 stsp8	[sp+0x1], r4
 c0 1b                 ldi8	r4, 0x1b
 f1 30                 stsp8	[sp+0x0], r4
 c0 14                 ldi8	r4, 0x14
 c1 25                 ldi8	r5, 0x25
 c2 06                 ldi8	r6, 0x6
 c3 2b                 ldi8	r7, 0x2b
 e1 35 01              call16	check_round_trip
 d6 02                 adjsp	0x2
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+807
 d4 00                 jmp8	avm_test_main+801
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 05                 jmp8	avm_test_main+812
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	avm_test_main+812
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 02                 adjsp	0x2
 ef                    ret

<check_case>:
 b0                    push16	r0
 d6 df                 adjsp	-0x21
 f0 18 28              ldsp8u	r0, [sp+0x28]
 f0 18 27              ldsp8u	r0, [sp+0x27]
 f0 18 26              ldsp8u	r0, [sp+0x26]
 f0 3c 1d              stsp16	[sp+0x1d], r4
 f0 3d 1b              stsp16	[sp+0x1b], r5
 f0 3e 19              stsp16	[sp+0x19], r6
 f0 3f 17              stsp16	[sp+0x17], r7
 f0 35 19              ldsp16	r5, [sp+0x19]
 f0 36 17              ldsp16	r6, [sp+0x17]
 f0 1f 26              ldsp8u	r7, [sp+0x26]
 f0 1c 27              ldsp8u	r4, [sp+0x27]
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f0 14 10              leasp	r4, 0x10
 e1 de 01              call16	clip_rect
 d6 01                 adjsp	0x1
 f0 1c 28              ldsp8u	r4, [sp+0x28]
 e1 7a 02              call16	prepare_memory
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 f6 2c                 tst16	r4
 d0 12                 breq8	check_case+79
 d4 00                 jmp8	check_case+63
 f0 34 19              ldsp16	r4, [sp+0x19]
 f0 35 17              ldsp16	r5, [sp+0x17]
 f0 1e 26              ldsp8u	r6, [sp+0x26]
 f0 1f 27              ldsp8u	r7, [sp+0x27]
 d7 27                 sys	draw_filled_rect_white
 d4 10                 jmp8	check_case+95
 f0 34 19              ldsp16	r4, [sp+0x19]
 f0 35 17              ldsp16	r5, [sp+0x17]
 f0 1e 26              ldsp8u	r6, [sp+0x26]
 f0 1f 27              ldsp8u	r7, [sp+0x27]
 d7 28                 sys	draw_filled_rect_black
 d4 00                 jmp8	check_case+95
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 f0 1d 28              ldsp8u	r5, [sp+0x28]
 e1 ac 02              call16	check_guards
 f6 2c                 tst16	r4
 d0 0a                 breq8	check_case+118
 d4 00                 jmp8	check_case+110
 c0 01                 ldi8	r4, 0x1
 f0 3c 1f              stsp16	[sp+0x1f], r4
 e0 a0 00              jmp16	check_case+278
 a0                    xor	r4, r4
 f4 74                 stsp16	[sp+0xd], r4
 d4 00                 jmp8	check_case+123
 f4 34                 ldsp16	r4, [sp+0xd]
 c5 00 04              ldi16	r5, 0x400
 31                    cmp	r4, r5
 da 8c 00              breq16	check_case+272
 d4 00                 jmp8	check_case+134
 f4 34                 ldsp16	r4, [sp+0xd]
 f0 1d 28              ldsp8u	r5, [sp+0x28]
 e1 20 03              call16	initial_byte
 f1 60                 stsp8	[sp+0xc], r4
 f4 34                 ldsp16	r4, [sp+0xd]
 f0 1d 16              ldsp8u	r5, [sp+0x16]
 f1 55                 stsp8	[sp+0x9], r5
 f0 1d 15              ldsp8u	r5, [sp+0x15]
 f1 51                 stsp8	[sp+0x8], r5
 f0 1d 14              ldsp8u	r5, [sp+0x14]
 f1 4d                 stsp8	[sp+0x7], r5
 f0 1d 13              ldsp8u	r5, [sp+0x13]
 f1 49                 stsp8	[sp+0x6], r5
 f0 1d 12              ldsp8u	r5, [sp+0x12]
 f1 45                 stsp8	[sp+0x5], r5
 f0 1d 11              ldsp8u	r5, [sp+0x11]
 f1 41                 stsp8	[sp+0x4], r5
 f0 1d 10              ldsp8u	r5, [sp+0x10]
 f1 3d                 stsp8	[sp+0x3], r5
 f3 7d                 ldsp8u	r5, [sp+0xf]
 f1 39                 stsp8	[sp+0x2], r5
 f0 15 02              leasp	r5, 0x2
 e1 07 03              call16	byte_mask
 f1 5c                 stsp8	[sp+0xb], r4
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 f6 2c                 tst16	r4
 d0 0b                 breq8	check_case+211
 d4 00                 jmp8	check_case+202
 f3 70                 ldsp8u	r4, [sp+0xc]
 f3 6d                 ldsp8u	r5, [sp+0xb]
 91                    or	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 d4 0c                 jmp8	check_case+223
 f3 70                 ldsp8u	r4, [sp+0xc]
 f3 6d                 ldsp8u	r5, [sp+0xb]
 c2 ff                 ldi8	r6, 0xff
 a6                    xor	r5, r6
 81                    and	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	check_case+223
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 58                 stsp8	[sp+0xa], r4
 f4 34                 ldsp16	r4, [sp+0xd]
 c5 00 05              ldi16	r5, 0x500
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f3 69                 ldsp8u	r5, [sp+0xa]
 31                    cmp	r4, r5
 d0 16                 breq8	check_case+261
 d4 00                 jmp8	check_case+241
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 f4 35                 ldsp16	r5, [sp+0xd]
 c6 00 05              ldi16	r6, 0x500
 16                    add	r5, r6
 f3 6a                 ldsp8u	r6, [sp+0xa]
 4d                    ld8u	r7, [r5]
 e1 47 03              call16	fail_case
 f0 3c 1f              stsp16	[sp+0x1f], r4
 d4 11                 jmp8	check_case+278
 d4 00                 jmp8	check_case+263
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 ac                 inc16	r4
 f4 74                 stsp16	[sp+0xd], r4
 e0 6b ff              jmp16	check_case+123
 a0                    xor	r4, r4
 f0 3c 1f              stsp16	[sp+0x1f], r4
 d4 00                 jmp8	check_case+278
 f0 34 1f              ldsp16	r4, [sp+0x1f]
 d6 21                 adjsp	0x21
 b8                    pop16	r0
 ef                    ret

<check_round_trip>:
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 f0 18 24              ldsp8u	r0, [sp+0x24]
 f0 18 23              ldsp8u	r0, [sp+0x23]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 2f 15              stsp8	[sp+0x15], r7
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 1f 15              ldsp8u	r7, [sp+0x15]
 f0 1c 23              ldsp8u	r4, [sp+0x23]
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f0 14 0e              leasp	r4, 0xe
 e1 c4 00              call16	clip_rect
 d6 01                 adjsp	0x1
 f0 1c 24              ldsp8u	r4, [sp+0x24]
 e1 60 01              call16	prepare_memory
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 1e 15              ldsp8u	r6, [sp+0x15]
 f0 1f 23              ldsp8u	r7, [sp+0x23]
 d7 27                 sys	draw_filled_rect_white
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 1e 15              ldsp8u	r6, [sp+0x15]
 f0 1f 23              ldsp8u	r7, [sp+0x23]
 d7 28                 sys	draw_filled_rect_black
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 1d 24              ldsp8u	r5, [sp+0x24]
 e1 9f 01              call16	check_guards
 f6 2c                 tst16	r4
 d0 0a                 breq8	check_round_trip+102
 d4 00                 jmp8	check_round_trip+94
 c0 01                 ldi8	r4, 0x1
 f0 3c 1c              stsp16	[sp+0x1c], r4
 e0 82 00              jmp16	check_round_trip+232
 a0                    xor	r4, r4
 f4 6c                 stsp16	[sp+0xb], r4
 d4 00                 jmp8	check_round_trip+107
 f4 2c                 ldsp16	r4, [sp+0xb]
 c5 00 04              ldi16	r5, 0x400
 31                    cmp	r4, r5
 d0 6f                 breq8	check_round_trip+226
 d4 00                 jmp8	check_round_trip+117
 f4 2c                 ldsp16	r4, [sp+0xb]
 f0 1d 24              ldsp8u	r5, [sp+0x24]
 e1 14 02              call16	initial_byte
 f4 40                 stsp16	[sp+0x0], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f0 1d 14              ldsp8u	r5, [sp+0x14]
 f1 55                 stsp8	[sp+0x9], r5
 f0 1d 13              ldsp8u	r5, [sp+0x13]
 f1 51                 stsp8	[sp+0x8], r5
 f0 1d 12              ldsp8u	r5, [sp+0x12]
 f1 4d                 stsp8	[sp+0x7], r5
 f0 1d 11              ldsp8u	r5, [sp+0x11]
 f1 49                 stsp8	[sp+0x6], r5
 f0 1d 10              ldsp8u	r5, [sp+0x10]
 f1 45                 stsp8	[sp+0x5], r5
 f3 7d                 ldsp8u	r5, [sp+0xf]
 f1 41                 stsp8	[sp+0x4], r5
 f3 79                 ldsp8u	r5, [sp+0xe]
 f1 3d                 stsp8	[sp+0x3], r5
 f3 75                 ldsp8u	r5, [sp+0xd]
 f1 39                 stsp8	[sp+0x2], r5
 f0 15 02              leasp	r5, 0x2
 e1 fd 01              call16	byte_mask
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 ff ff              ldi16	r6, 0xffff
 a6                    xor	r5, r6
 81                    and	r4, r5
 f1 58                 stsp8	[sp+0xa], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 c5 00 05              ldi16	r5, 0x500
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f3 69                 ldsp8u	r5, [sp+0xa]
 31                    cmp	r4, r5
 d0 16                 breq8	check_round_trip+216
 d4 00                 jmp8	check_round_trip+196
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f4 2d                 ldsp16	r5, [sp+0xb]
 c6 00 05              ldi16	r6, 0x500
 16                    add	r5, r6
 f3 6a                 ldsp8u	r6, [sp+0xa]
 4d                    ld8u	r7, [r5]
 e1 57 02              call16	fail_case
 f0 3c 1c              stsp16	[sp+0x1c], r4
 d4 10                 jmp8	check_round_trip+232
 d4 00                 jmp8	check_round_trip+218
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 ac                 inc16	r4
 f4 6c                 stsp16	[sp+0xb], r4
 d4 89                 jmp8	check_round_trip+107
 a0                    xor	r4, r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 d4 00                 jmp8	check_round_trip+232
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 ef                    ret

<clip_rect>:
 b0                    push16	r0
 d6 f5                 adjsp	-0xb
 f4 40                 stsp16	[sp+0x0], r4
 f1 04                 mov	r0, r4
 f0 38 02              stsp16	[sp+0x2], r0
 f0 18 10              ldsp8u	r0, [sp+0x10]
 f4 64                 stsp16	[sp+0x9], r4
 f4 5d                 stsp16	[sp+0x7], r5
 f4 56                 stsp16	[sp+0x5], r6
 f1 43                 stsp8	[sp+0x4], r7
 f4 1d                 ldsp16	r5, [sp+0x7]
 71                    st16	[r4], r5
 f4 15                 ldsp16	r5, [sp+0x5]
 ee b8 22              st16	[r4+2], r5
 f4 1d                 ldsp16	r5, [sp+0x7]
 f3 52                 ldsp8u	r6, [sp+0x4]
 16                    add	r5, r6
 ee b8 24              st16	[r4+4], r5
 f4 15                 ldsp16	r5, [sp+0x5]
 f0 1e 10              ldsp8u	r6, [sp+0x10]
 16                    add	r5, r6
 ee b8 26              st16	[r4+6], r5
 60                    ld16	r4, [r4]
 f6 2c                 tst16	r4
 d9 08                 brsge8	clip_rect+59
 d4 00                 jmp8	clip_rect+53
 f4 00                 ldsp16	r4, [sp+0x0]
 a5                    xor	r5, r5
 71                    st16	[r4], r5
 d4 00                 jmp8	clip_rect+59
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 22              ld16	r4, [r4+2]
 f6 2c                 tst16	r4
 d9 0a                 brsge8	clip_rect+78
 d4 00                 jmp8	clip_rect+70
 f4 00                 ldsp16	r4, [sp+0x0]
 a5                    xor	r5, r5
 ee b8 22              st16	[r4+2], r5
 d4 00                 jmp8	clip_rect+78
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 24              ld16	r4, [r4+4]
 c1 81                 ldi8	r5, 0x81
 31                    cmp	r4, r5
 d3 0b                 brslt8	clip_rect+99
 d4 00                 jmp8	clip_rect+90
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 80                 ldi8	r5, 0x80
 ee b8 24              st16	[r4+4], r5
 d4 00                 jmp8	clip_rect+99
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 98 26              ld16	r4, [r4+6]
 cc 41                 cmpi.s8	r4, 0x41
 d3 0b                 brslt8	clip_rect+119
 d4 00                 jmp8	clip_rect+110
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 40                 ldi8	r5, 0x40
 ee b8 26              st16	[r4+6], r5
 d4 00                 jmp8	clip_rect+119
 f4 01                 ldsp16	r5, [sp+0x0]
 61                    ld16	r4, [r5]
 ed ba 24              ld16	r5, [r5+4]
 31                    cmp	r4, r5
 d9 0f                 brsge8	clip_rect+143
 d4 00                 jmp8	clip_rect+130
 f4 01                 ldsp16	r5, [sp+0x0]
 ed 9a 22              ld16	r4, [r5+2]
 ed ba 26              ld16	r5, [r5+6]
 31                    cmp	r4, r5
 d3 11                 brslt8	clip_rect+158
 d4 00                 jmp8	clip_rect+143
 f4 00                 ldsp16	r4, [sp+0x0]
 a5                    xor	r5, r5
 71                    st16	[r4], r5
 ee b8 22              st16	[r4+2], r5
 ee b8 24              st16	[r4+4], r5
 ee b8 26              st16	[r4+6], r5
 d4 00                 jmp8	clip_rect+158
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 0b                 adjsp	0xb
 b8                    pop16	r0
 ef                    ret

<prepare_memory>:
 d6 fc                 adjsp	-0x4
 f1 3c                 stsp8	[sp+0x3], r4
 a0                    xor	r4, r4
 f1 30                 stsp8	[sp+0x0], r4
 d4 00                 jmp8	prepare_memory+9
 f3 40                 ldsp8u	r4, [sp+0x0]
 cc 04                 cmpi.s8	r4, 0x4
 d0 2a                 breq8	prepare_memory+57
 d4 00                 jmp8	prepare_memory+17
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 4d                 ldsp8u	r5, [sp+0x3]
 e1 ac 01              call16	guard_before_byte
 04                    mov	r5, r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 c6 fc 04              ldi16	r6, 0x4fc
 12                    add	r4, r6
 51                    st8	[r4], r5
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 4d                 ldsp8u	r5, [sp+0x3]
 e1 b3 01              call16	guard_after_byte
 04                    mov	r5, r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 c6 00 09              ldi16	r6, 0x900
 92                    or	r4, r6
 51                    st8	[r4], r5
 d4 00                 jmp8	prepare_memory+49
 f3 40                 ldsp8u	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f1 30                 stsp8	[sp+0x0], r4
 d4 d0                 jmp8	prepare_memory+9
 a0                    xor	r4, r4
 f4 44                 stsp16	[sp+0x1], r4
 d4 00                 jmp8	prepare_memory+62
 f4 04                 ldsp16	r4, [sp+0x1]
 c5 00 04              ldi16	r5, 0x400
 31                    cmp	r4, r5
 d0 1b                 breq8	prepare_memory+97
 d4 00                 jmp8	prepare_memory+72
 f4 04                 ldsp16	r4, [sp+0x1]
 f3 4d                 ldsp8u	r5, [sp+0x3]
 e1 af 00              call16	initial_byte
 04                    mov	r5, r4
 f4 04                 ldsp16	r4, [sp+0x1]
 c6 00 05              ldi16	r6, 0x500
 12                    add	r4, r6
 51                    st8	[r4], r5
 d4 00                 jmp8	prepare_memory+89
 f4 04                 ldsp16	r4, [sp+0x1]
 f4 ac                 inc16	r4
 f4 44                 stsp16	[sp+0x1], r4
 d4 dd                 jmp8	prepare_memory+62
 d6 04                 adjsp	0x4
 ef                    ret

<check_guards>:
 d6 f6                 adjsp	-0xa
 f4 58                 stsp16	[sp+0x6], r4
 f1 45                 stsp8	[sp+0x5], r5
 a0                    xor	r4, r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 00                 jmp8	check_guards+11
 f3 50                 ldsp8u	r4, [sp+0x4]
 cc 04                 cmpi.s8	r4, 0x4
 d0 3a                 breq8	check_guards+75
 d4 00                 jmp8	check_guards+19
 f3 50                 ldsp8u	r4, [sp+0x4]
 f3 55                 ldsp8u	r5, [sp+0x5]
 e1 46 01              call16	guard_before_byte
 f1 3c                 stsp8	[sp+0x3], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 c5 fc 04              ldi16	r5, 0x4fc
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 f3 4d                 ldsp8u	r5, [sp+0x3]
 31                    cmp	r4, r5
 d0 15                 breq8	check_guards+65
 d4 00                 jmp8	check_guards+46
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 51                 ldsp8u	r5, [sp+0x4]
 c6 fc 04              ldi16	r6, 0x4fc
 16                    add	r5, r6
 f3 4e                 ldsp8u	r6, [sp+0x3]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 e1 f6 00              call16	fail_case
 f4 60                 stsp16	[sp+0x8], r4
 d4 54                 jmp8	check_guards+149
 d4 00                 jmp8	check_guards+67
 f3 50                 ldsp8u	r4, [sp+0x4]
 f4 ac                 inc16	r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 c0                 jmp8	check_guards+11
 a0                    xor	r4, r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 00                 jmp8	check_guards+80
 f3 50                 ldsp8u	r4, [sp+0x4]
 cc 04                 cmpi.s8	r4, 0x4
 d0 3a                 breq8	check_guards+144
 d4 00                 jmp8	check_guards+88
 f3 50                 ldsp8u	r4, [sp+0x4]
 f3 55                 ldsp8u	r5, [sp+0x5]
 e1 17 01              call16	guard_after_byte
 f1 34                 stsp8	[sp+0x1], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 c5 00 09              ldi16	r5, 0x900
 91                    or	r4, r5
 40                    ld8u	r4, [r4]
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 45                 ldsp8u	r5, [sp+0x1]
 31                    cmp	r4, r5
 d0 15                 breq8	check_guards+134
 d4 00                 jmp8	check_guards+115
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 51                 ldsp8u	r5, [sp+0x4]
 c6 00 09              ldi16	r6, 0x900
 96                    or	r5, r6
 f3 46                 ldsp8u	r6, [sp+0x1]
 f3 43                 ldsp8u	r7, [sp+0x0]
 e1 b1 00              call16	fail_case
 f4 60                 stsp16	[sp+0x8], r4
 d4 0f                 jmp8	check_guards+149
 d4 00                 jmp8	check_guards+136
 f3 50                 ldsp8u	r4, [sp+0x4]
 f4 ac                 inc16	r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 c0                 jmp8	check_guards+80
 a0                    xor	r4, r4
 f4 60                 stsp16	[sp+0x8], r4
 d4 00                 jmp8	check_guards+149
 f4 20                 ldsp16	r4, [sp+0x8]
 d6 0a                 adjsp	0xa
 ef                    ret

<initial_byte>:
 d6 fd                 adjsp	-0x3
 f4 44                 stsp16	[sp+0x1], r4
 f1 31                 stsp8	[sp+0x0], r5
 f4 05                 ldsp16	r5, [sp+0x1]
 c2 25                 ldi8	r6, 0x25
 01                    mov	r4, r5
 fe 26                 mul16	r4, r6
 fa 82                 lsr16i	r5, 0x2
 a1                    xor	r4, r5
 f1 74                 zext8	r4
 f3 41                 ldsp8u	r5, [sp+0x0]
 a1                    xor	r4, r5
 d6 03                 adjsp	0x3
 ef                    ret

<byte_mask>:
 d6 f3                 adjsp	-0xd
 f4 41                 stsp16	[sp+0x0], r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 c2 7f                 ldi8	r6, 0x7f
 82                    and	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 fa 74                 lsr16i	r4, 0x4
 c6 f8 0f              ldi16	r6, 0xff8
 82                    and	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 a0                    xor	r4, r4
 f1 44                 stsp8	[sp+0x5], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 65                    ld16	r5, [r5]
 31                    cmp	r4, r5
 d3 0e                 brslt8	byte_mask+46
 d4 00                 jmp8	byte_mask+34
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 20                 ldsp16	r4, [sp+0x8]
 ed ba 24              ld16	r5, [r5+4]
 31                    cmp	r4, r5
 d3 07                 brslt8	byte_mask+51
 d4 00                 jmp8	byte_mask+46
 a0                    xor	r4, r4
 f1 60                 stsp8	[sp+0xc], r4
 d4 49                 jmp8	byte_mask+124
 a0                    xor	r4, r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 00                 jmp8	byte_mask+56
 f3 50                 ldsp8u	r4, [sp+0x4]
 cc 08                 cmpi.s8	r4, 0x8
 d0 38                 breq8	byte_mask+118
 d4 00                 jmp8	byte_mask+64
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 52                 ldsp8u	r6, [sp+0x4]
 12                    add	r4, r6
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 ed ba 22              ld16	r5, [r5+2]
 31                    cmp	r4, r5
 d3 1b                 brslt8	byte_mask+108
 d4 00                 jmp8	byte_mask+83
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 08                 ldsp16	r4, [sp+0x2]
 ed ba 26              ld16	r5, [r5+6]
 31                    cmp	r4, r5
 d9 0f                 brsge8	byte_mask+108
 d4 00                 jmp8	byte_mask+95
 f3 50                 ldsp8u	r4, [sp+0x4]
 c1 01                 ldi8	r5, 0x1
 fa 04                 shl16v	r5, r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 91                    or	r4, r5
 f1 44                 stsp8	[sp+0x5], r4
 d4 00                 jmp8	byte_mask+108
 d4 00                 jmp8	byte_mask+110
 f3 50                 ldsp8u	r4, [sp+0x4]
 f4 ac                 inc16	r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 c2                 jmp8	byte_mask+56
 f3 54                 ldsp8u	r4, [sp+0x5]
 f1 60                 stsp8	[sp+0xc], r4
 d4 00                 jmp8	byte_mask+124
 f3 70                 ldsp8u	r4, [sp+0xc]
 d6 0d                 adjsp	0xd
 ef                    ret

<fail_case>:
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 36                 stsp8	[sp+0x1], r6
 f1 33                 stsp8	[sp+0x0], r7
 f4 11                 ldsp16	r5, [sp+0x4]
 c4 00 01              ldi16	r4, 0x100
 d5 47                 call8	test_line16
 f4 09                 ldsp16	r5, [sp+0x2]
 c4 05 01              ldi16	r4, 0x105
 d5 40                 call8	test_line16
 f3 45                 ldsp8u	r5, [sp+0x1]
 c4 0a 01              ldi16	r4, 0x10a
 d5 39                 call8	test_line16
 f3 41                 ldsp8u	r5, [sp+0x0]
 c4 0f 01              ldi16	r4, 0x10f
 d5 32                 call8	test_line16
 c0 01                 ldi8	r4, 0x1
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 ef                    ret

<guard_before_byte>:
 d6 fe                 adjsp	-0x2
 f1 34                 stsp8	[sp+0x1], r4
 f1 31                 stsp8	[sp+0x0], r5
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 45                 ldsp8u	r5, [sp+0x1]
 c2 11                 ldi8	r6, 0x11
 f3 16                 mulu8.w	r5, r6
 c9 a5                 addi.s8	r5, -0x5b
 f1 75                 zext8	r5
 a1                    xor	r4, r5
 d6 02                 adjsp	0x2
 ef                    ret

<guard_after_byte>:
 d6 fe                 adjsp	-0x2
 f1 34                 stsp8	[sp+0x1], r4
 f1 31                 stsp8	[sp+0x0], r5
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 45                 ldsp8u	r5, [sp+0x1]
 c2 1d                 ldi8	r6, 0x1d
 f3 16                 mulu8.w	r5, r6
 c9 5a                 addi.s8	r5, 0x5a
 f1 75                 zext8	r5
 a1                    xor	r4, r5
 d6 02                 adjsp	0x2
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
