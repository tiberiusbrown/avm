
idle_random.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 idle_random.c
0000032a l     F .text	00000003 call_millis
0000032d l     F .text	00000003 call_idle
00000330 l     F .text	00000003 call_generate_random_seed
00000100 l     O .data	00000003 .L.str
00000333 l     F .text	00000019 test_line16
00000103 l     O .data	00000003 .L.str.1
0000034c l     F .text	00000022 test_puts
0000036e l     F .text	0000000b test_putc
00000379 l     F .text	0000000f test_hex16
00000388 l     F .text	00000019 test_hex8
000003a1 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
000003cf l       .init_array	00000000 .hidden __init_array_end
000003cf l       .init_array	00000000 .hidden __init_array_start
000003cf l       .fini_array	00000000 .hidden __fini_array_start
000003cf l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000053 avm_test_main
000003cd g     F .text	00000002 avm_halt
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
 e1 af 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 cf 03              ldi16	r4, 0x3cf
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cf 03              ldi16	r6, 0x3cf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 cf 03           ldi16	r0, 0x3cf
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 cf 03           ldi16	r2, 0x3cf
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
 c4 cf 03              ldi16	r4, 0x3cf
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cf 03              ldi16	r6, 0x3cf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 cf 03           ldi16	r2, 0x3cf
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 cf 03           ldi16	r0, 0x3cf
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
 d6 f4                 adjsp	-0xc
 d5 4f                 call8	call_millis
 f4 68                 stsp16	[sp+0xa], r4
 d5 4e                 call8	call_idle
 d5 49                 call8	call_millis
 f4 60                 stsp16	[sp+0x8], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 31                    cmp	r4, r5
 f8 0c                 cset.ne	r4
 f4 58                 stsp16	[sp+0x6], r4
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	avm_test_main+28
 f4 08                 ldsp16	r4, [sp+0x2]
 cc 04                 cmpi.s8	r4, 0x4
 d8 14                 bruge8	avm_test_main+54
 d4 00                 jmp8	avm_test_main+36
 d5 33                 call8	call_generate_random_seed
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 a1                    xor	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	avm_test_main+46
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 e6                 jmp8	avm_test_main+28
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 19                 ldsp16	r5, [sp+0x6]
 c4 00 01              ldi16	r4, 0x100
 d5 19                 call8	test_line16
 c4 03 01              ldi16	r4, 0x103
 c1 04                 ldi8	r5, 0x4
 d5 12                 call8	test_line16
 f4 18                 ldsp16	r4, [sp+0x6]
 cc 01                 cmpi.s8	r4, 0x1
 f8 0c                 cset.ne	r4
 d6 0c                 adjsp	0xc
 ef                    ret

<call_millis>:
 d7 02                 sys	millis
 ef                    ret

<call_idle>:
 d7 2a                 sys	idle
 ef                    ret

<call_generate_random_seed>:
 d7 2b                 sys	generate_random_seed
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
