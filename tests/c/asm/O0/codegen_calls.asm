
codegen_calls.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_calls.c
000003bf l     F .text	00000050 many_arguments
00000425 l     F .text	0000000e add_values
0000040f l     F .text	00000016 call_indirect
00000433 l     F .text	00000018 xor_values
0000044b l     F .text	00000076 make_u32
000004c1 l     F .text	0000000d return_u8
000004ce l     F .text	0000000b return_i8
00000100 l     O .data	00000003 .L.str
000004d9 l     F .text	00000019 test_line16
00000103 l     O .data	00000003 .L.str.1
00000106 l     O .data	00000003 .L.str.2
000004f2 l     F .text	0000001e test_line32
00000109 l     O .data	00000003 .L.str.3
00000510 l     F .text	00000018 rotate_left16
00000528 l     F .text	00000022 test_puts
0000054a l     F .text	0000000b test_putc
00000555 l     F .text	0000000f test_hex16
000005a9 l     F .text	00000011 test_hex32
00000564 l     F .text	00000019 test_hex8
0000057d l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
000005bc l       .init_array	00000000 .hidden __init_array_end
000005bc l       .init_array	00000000 .hidden __init_array_start
000005bc l       .fini_array	00000000 .hidden __fini_array_start
000005bc l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000000e8 avm_test_main
000005ba g     F .text	00000002 avm_halt
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
 e1 9c 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 bc 05              ldi16	r4, 0x5bc
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 bc 05              ldi16	r6, 0x5bc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 bc 05           ldi16	r0, 0x5bc
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 bc 05           ldi16	r2, 0x5bc
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
 c4 bc 05              ldi16	r4, 0x5bc
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 bc 05              ldi16	r6, 0x5bc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 bc 05           ldi16	r2, 0x5bc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 bc 05           ldi16	r0, 0x5bc
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
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 d6 f8                 adjsp	-0x8
 c1 08                 ldi8	r5, 0x8
 f4 59                 stsp16	[sp+0x6], r5
 c1 07                 ldi8	r5, 0x7
 f4 51                 stsp16	[sp+0x4], r5
 c1 06                 ldi8	r5, 0x6
 f4 49                 stsp16	[sp+0x2], r5
 c1 05                 ldi8	r5, 0x5
 f4 41                 stsp16	[sp+0x0], r5
 c1 02                 ldi8	r5, 0x2
 c2 03                 ldi8	r6, 0x3
 c3 04                 ldi8	r7, 0x4
 e1 bf 00              call16	many_arguments
 d6 08                 adjsp	0x8
 f0 3c 10              stsp16	[sp+0x10], r4
 c4 25 04              ldi16	r4, 0x425
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 34 12              ldi16	r6, 0x1234
 c7 67 45              ldi16	r7, 0x4567
 e1 fa 00              call16	call_indirect
 f4 40                 stsp16	[sp+0x0], r4
 c4 33 04              ldi16	r4, 0x433
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cd ab              ldi16	r6, 0xabcd
 c7 0f 0f              ldi16	r7, 0xf0f
 e1 e8 00              call16	call_indirect
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 a1                    xor	r4, r5
 f4 78                 stsp16	[sp+0xe], r4
 c4 57 13              ldi16	r4, 0x1357
 c5 df 9b              ldi16	r5, 0x9bdf
 e1 15 01              call16	make_u32
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c4 ef be              ldi16	r4, 0xbeef
 e1 81 01              call16	return_u8
 f1 74                 zext8	r4
 f4 48                 stsp16	[sp+0x2], r4
 c4 2e fb              ldi16	r4, 0xfb2e
 e1 84 01              call16	return_i8
 04                    mov	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 fa 48                 lsl16i	r5, 0x8
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f0 35 10              ldsp16	r5, [sp+0x10]
 c4 00 01              ldi16	r4, 0x100
 e1 7e 01              call16	test_line16
 f4 39                 ldsp16	r5, [sp+0xe]
 c4 03 01              ldi16	r4, 0x103
 e1 76 01              call16	test_line16
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 c4 06 01              ldi16	r4, 0x106
 e1 85 01              call16	test_line32
 f4 21                 ldsp16	r5, [sp+0x8]
 c4 09 01              ldi16	r4, 0x109
 e1 64 01              call16	test_line16
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 35 10              ldsp16	r5, [sp+0x10]
 c6 c6 01              ldi16	r6, 0x1c6
 36                    cmp	r5, r6
 f4 58                 stsp16	[sp+0x6], r4
 d1 33                 brne8	avm_test_main+222
 d4 00                 jmp8	avm_test_main+173
 f4 39                 ldsp16	r5, [sp+0xe]
 c0 01                 ldi8	r4, 0x1
 c6 2e 84              ldi16	r6, 0x842e
 36                    cmp	r5, r6
 f4 58                 stsp16	[sp+0x6], r4
 d1 25                 brne8	avm_test_main+222
 d4 00                 jmp8	avm_test_main+187
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 c0 01                 ldi8	r4, 0x1
 f0 04 11 67           ldi16	r0, 0x6711
 f0 05 8d b8           ldi16	r1, 0xb88d
 f0 69 c0              cmp32	q3, q0
 f4 58                 stsp16	[sp+0x6], r4
 d1 0e                 brne8	avm_test_main+222
 d4 00                 jmp8	avm_test_main+210
 f4 20                 ldsp16	r4, [sp+0x8]
 c5 51 65              ldi16	r5, 0x6551
 31                    cmp	r4, r5
 f8 0c                 cset.ne	r4
 f4 58                 stsp16	[sp+0x6], r4
 d4 00                 jmp8	avm_test_main+222
 f4 18                 ldsp16	r4, [sp+0x6]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<many_arguments>:
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 30 13              ldsp16	r0, [sp+0x13]
 f0 30 11              ldsp16	r0, [sp+0x11]
 f0 30 0f              ldsp16	r0, [sp+0xf]
 f0 30 0d              ldsp16	r0, [sp+0xd]
 f4 58                 stsp16	[sp+0x6], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 11                 ldsp16	r5, [sp+0x4]
 c2 03                 ldi8	r6, 0x3
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 c2 05                 ldi8	r6, 0x5
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 c2 07                 ldi8	r6, 0x7
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f4 35                 ldsp16	r5, [sp+0xd]
 c2 0b                 ldi8	r6, 0xb
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f4 3d                 ldsp16	r5, [sp+0xf]
 c2 0d                 ldi8	r6, 0xd
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f0 35 11              ldsp16	r5, [sp+0x11]
 c2 11                 ldi8	r6, 0x11
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f0 35 13              ldsp16	r5, [sp+0x13]
 c2 13                 ldi8	r6, 0x13
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 ef                    ret

<call_indirect>:
 d6 f9                 adjsp	-0x7
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 5b                 ldsp8u	r7, [sp+0x6]
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 01                 ldsp16	r5, [sp+0x0]
 eb                    callp	q3
 d6 07                 adjsp	0x7
 ef                    ret

<add_values>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 d6 04                 adjsp	0x4
 ef                    ret

<xor_values>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 c1 03                 ldi8	r5, 0x3
 e1 cc 00              call16	rotate_left16
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 a1                    xor	r4, r5
 d6 06                 adjsp	0x6
 ef                    ret

<make_u32>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f4 78                 stsp16	[sp+0xe], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 a5                    xor	r5, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 af                    xor	r7, r7
 92                    or	r4, r6
 97                    or	r5, r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f1 28                 mov	r6, r0
 02                    mov	r4, r6
 fa 79                 lsr16i	r4, 0x9
 f1 01                 mov	r0, r1
 f2 39                 sub	r1, r1
 f1 2c                 mov	r7, r0
 fa 67                 lsl16i	r7, 0x7
 9c                    or	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f1 0f                 mov	r1, r7
 f2 30                 sub	r0, r0
 fa 57                 lsl16i	r6, 0x7
 af                    xor	r7, r7
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 0b                    mov	r6, r7
 af                    xor	r7, r7
 02                    mov	r4, r6
 08                    mov	r6, r4
 fa 55                 lsl16i	r6, 0x5
 96                    or	r5, r6
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 7b                 lsr16i	r4, 0xb
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<return_u8>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 a1                    xor	r4, r5
 d6 02                 adjsp	0x2
 ef                    ret

<return_i8>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 fa b3                 asr16i	r4, 0x3
 d6 02                 adjsp	0x2
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 45                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 63                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 6a                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d5 5b                 call8	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<test_line32>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d5 2a                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 48                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e1 a0 00              call16	test_hex32
 c0 0a                 ldi8	r4, 0xa
 d5 3d                 call8	test_putc
 d6 06                 adjsp	0x6
 ef                    ret

<rotate_left16>:
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

<test_hex32>:
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 a2                 call8	test_hex16
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 9e                 call8	test_hex16
 d6 04                 adjsp	0x4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
