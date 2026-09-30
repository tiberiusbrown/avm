
draw_text_clipping.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 draw_text_clipping.c
00000530 l     F .text	00000a16 check_case
000010c5 l     O .rodata	00000022 multi_page_font
000010ad l     O .rodata	00000018 single_page_font
00000110 l     O .data	00000002 ram_b
000010e9 l     O .rodata	00000002 program_b
00000100 l     O .data	00000003 format_one
00000115 l     O .data	00000003 ram_ba
000010ee l     O .rodata	00000003 program_ba
00000118 l     O .data	00000004 ram_a_newline_b
000010f1 l     O .rodata	00000004 program_a_newline_b
0000010e l     O .data	00000002 ram_a
00000112 l     O .data	00000003 ram_ab
000010e7 l     O .rodata	00000002 program_a
000010eb l     O .rodata	00000003 program_ab
00000108 l     O .data	00000006 format_newline
00000103 l     O .data	00000005 format_two
0000012b l     O .data	00000009 multi_b_image
00000123 l     O .data	00000008 multi_a_image
0000011c l     O .data	00000003 single_a_image
0000011f l     O .data	00000004 single_b_image
00000f46 l     F .text	00000165 fail_byte
00000000 l    df *ABS*	00000000 runtime.c
000010f5 l       .init_array	00000000 .hidden __init_array_end
000010f5 l       .init_array	00000000 .hidden __init_array_start
000010f5 l       .fini_array	00000000 .hidden __fini_array_start
000010f5 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000259 avm_test_main
000010ab g     F .text	00000002 avm_halt
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
 e1 8d 0e              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f5 10              ldi16	r4, 0x10f5
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f5 10              ldi16	r6, 0x10f5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 f5 10           ldi16	r0, 0x10f5
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f5 10           ldi16	r2, 0x10f5
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
 c4 f5 10              ldi16	r4, 0x10f5
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f5 10              ldi16	r6, 0x10f5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 f5 10           ldi16	r2, 0x10f5
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f5 10           ldi16	r0, 0x10f5
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
 d6 fa                 adjsp	-0x6
 c0 31                 ldi8	r4, 0x31
 f1 44                 stsp8	[sp+0x5], r4
 c0 06                 ldi8	r4, 0x6
 c1 0c                 ldi8	r5, 0xc
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 01 02              ldi8	r1, 0x2
 f0 29 00              stsp8	[sp+0x0], r1
 a0                    xor	r4, r4
 04                    mov	r5, r4
 08                    mov	r6, r4
 0c                    mov	r7, r4
 e1 3a 02              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 d0 06                 breq8	avm_test_main+43
 f0 00 01              ldi8	r0, 0x1
 e0 27 02              jmp16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 c7                 ldi8	r4, 0xc7
 f1 44                 stsp8	[sp+0x5], r4
 c4 fe ff              ldi16	r4, 0xfffe
 c1 09                 ldi8	r5, 0x9
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 29 00              stsp8	[sp+0x0], r1
 a5                    xor	r5, r5
 f0 00 01              ldi8	r0, 0x1
 f1 20                 mov	r4, r0
 f1 29                 mov	r6, r1
 f1 2c                 mov	r7, r0
 e1 0f 02              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 01 02              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 5a                 ldi8	r4, 0x5a
 f1 44                 stsp8	[sp+0x5], r4
 c0 7d                 ldi8	r4, 0x7d
 c1 0b                 ldi8	r5, 0xb
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 c2 03                 ldi8	r6, 0x3
 f1 32                 stsp8	[sp+0x0], r6
 f2 39                 sub	r1, r1
 c0 02                 ldi8	r4, 0x2
 f1 25                 mov	r5, r1
 0c                    mov	r7, r4
 e1 ec 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db de 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 96                 ldi8	r4, 0x96
 f1 44                 stsp8	[sp+0x5], r4
 c0 1f                 ldi8	r4, 0x1f
 c1 03                 ldi8	r5, 0x3
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 29 00              stsp8	[sp+0x0], r1
 f0 02 03              ldi8	r2, 0x3
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 f1 29                 mov	r6, r1
 f1 2d                 mov	r7, r1
 e1 c6 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db b8 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 a5                 ldi8	r4, 0xa5
 f1 44                 stsp8	[sp+0x5], r4
 c0 4b                 ldi8	r4, 0x4b
 c1 3f                 ldi8	r5, 0x3f
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 00 01              ldi8	r0, 0x1
 f0 28 00              stsp8	[sp+0x0], r0
 f0 01 04              ldi8	r1, 0x4
 a5                    xor	r5, r5
 c2 02                 ldi8	r6, 0x2
 f1 21                 mov	r4, r1
 f1 2c                 mov	r7, r0
 e1 9e 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 90 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 69                 ldi8	r4, 0x69
 f1 44                 stsp8	[sp+0x5], r4
 c4 fd ff              ldi16	r4, 0xfffd
 c1 02                 ldi8	r5, 0x2
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2a 00              stsp8	[sp+0x0], r2
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f0 03 02              ldi8	r3, 0x2
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 e1 78 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 6a 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 3c                 ldi8	r4, 0x3c
 f1 44                 stsp8	[sp+0x5], r4
 c0 08                 ldi8	r4, 0x8
 c1 18                 ldi8	r5, 0x18
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2b 00              stsp8	[sp+0x0], r3
 c0 06                 ldi8	r4, 0x6
 f0 00 01              ldi8	r0, 0x1
 aa                    xor	r6, r6
 f1 24                 mov	r5, r0
 0e                    mov	r7, r6
 e1 54 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 46 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 c3                 ldi8	r4, 0xc3
 f1 44                 stsp8	[sp+0x5], r4
 c4 fe ff              ldi16	r4, 0xfffe
 c1 16                 ldi8	r5, 0x16
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2b 00              stsp8	[sp+0x0], r3
 c0 07                 ldi8	r4, 0x7
 f0 00 01              ldi8	r0, 0x1
 f1 24                 mov	r5, r0
 f1 2b                 mov	r6, r3
 f1 2c                 mov	r7, r0
 e1 2d 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 1f 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 55                 ldi8	r4, 0x55
 f1 44                 stsp8	[sp+0x5], r4
 c0 7d                 ldi8	r4, 0x7d
 c1 18                 ldi8	r5, 0x18
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2a 00              stsp8	[sp+0x0], r2
 c0 08                 ldi8	r4, 0x8
 f0 00 01              ldi8	r0, 0x1
 c3 02                 ldi8	r7, 0x2
 f1 24                 mov	r5, r0
 f1 2a                 mov	r6, r2
 e1 07 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db f9 00              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 aa                 ldi8	r4, 0xaa
 f1 44                 stsp8	[sp+0x5], r4
 c0 30                 ldi8	r4, 0x30
 c1 05                 ldi8	r5, 0x5
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 aa                    xor	r6, r6
 f1 32                 stsp8	[sp+0x0], r6
 c0 09                 ldi8	r4, 0x9
 f0 00 01              ldi8	r0, 0x1
 f1 24                 mov	r5, r0
 0e                    mov	r7, r6
 e1 e4 00              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db d6 00              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 0f                 ldi8	r4, 0xf
 f1 44                 stsp8	[sp+0x5], r4
 c0 40                 ldi8	r4, 0x40
 c1 3c                 ldi8	r5, 0x3c
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 00 01              ldi8	r0, 0x1
 f0 28 00              stsp8	[sp+0x0], r0
 c0 0a                 ldi8	r4, 0xa
 f0 02 02              ldi8	r2, 0x2
 f1 24                 mov	r5, r0
 f1 2a                 mov	r6, r2
 f1 2c                 mov	r7, r0
 e1 bb 00              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db ad 00              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 f0                 ldi8	r4, 0xf0
 f1 44                 stsp8	[sp+0x5], r4
 c0 7e                 ldi8	r4, 0x7e
 c1 3d                 ldi8	r5, 0x3d
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2a 00              stsp8	[sp+0x0], r2
 c0 0b                 ldi8	r4, 0xb
 f0 00 01              ldi8	r0, 0x1
 c2 03                 ldi8	r6, 0x3
 f1 24                 mov	r5, r0
 f1 2e                 mov	r7, r2
 e1 95 00              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 87 00              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 87                 ldi8	r4, 0x87
 f1 44                 stsp8	[sp+0x5], r4
 c0 14                 ldi8	r4, 0x14
 c1 0e                 ldi8	r5, 0xe
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 29 00              stsp8	[sp+0x0], r1
 c0 0c                 ldi8	r4, 0xc
 f0 00 01              ldi8	r0, 0x1
 aa                    xor	r6, r6
 f1 24                 mov	r5, r0
 0e                    mov	r7, r6
 d5 72                 call8	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 d1 65                 brne8	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 78                 ldi8	r4, 0x78
 f1 44                 stsp8	[sp+0x5], r4
 c0 0c                 ldi8	r4, 0xc
 c5 ec ff              ldi16	r5, 0xffec
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2a 00              stsp8	[sp+0x0], r2
 c0 0d                 ldi8	r4, 0xd
 f0 00 01              ldi8	r0, 0x1
 f1 24                 mov	r5, r0
 f1 2a                 mov	r6, r2
 f1 2c                 mov	r7, r0
 d5 4d                 call8	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 d1 40                 brne8	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 1e                 ldi8	r4, 0x1e
 f1 44                 stsp8	[sp+0x5], r4
 c0 82                 ldi8	r4, 0x82
 c1 14                 ldi8	r5, 0x14
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2a 00              stsp8	[sp+0x0], r2
 c0 0e                 ldi8	r4, 0xe
 a5                    xor	r5, r5
 c2 03                 ldi8	r6, 0x3
 f1 2e                 mov	r7, r2
 d5 2d                 call8	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 d1 20                 brne8	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 e1                 ldi8	r4, 0xe1
 f1 44                 stsp8	[sp+0x5], r4
 c4 ff ff              ldi16	r4, 0xffff
 c5 fe ff              ldi16	r5, 0xfffe
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 29 00              stsp8	[sp+0x0], r1
 c0 0f                 ldi8	r4, 0xf
 c1 01                 ldi8	r5, 0x1
 aa                    xor	r6, r6
 c3 02                 ldi8	r7, 0x2
 d5 0b                 call8	check_case
 d6 06                 adjsp	0x6
 f1 04                 mov	r0, r4
 f1 20                 mov	r4, r0
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
 d6 bc                 adjsp	-0x44
 f0 3e 30              stsp16	[sp+0x30], r6
 f1 15                 mov	r2, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 07 a5 ff           ldi16	r3, 0xffa5
 f0 18 54              ldsp8u	r0, [sp+0x54]
 f9 62                 xor	r3, r0
 f0 34 52              ldsp16	r4, [sp+0x52]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 34 50              ldsp16	r4, [sp+0x50]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 1c 4f              ldsp8u	r4, [sp+0x4f]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c4 fc 04              ldi16	r4, 0x4fc
 f3 03                 st8	[r4], r3
 c0 5a                 ldi8	r4, 0x5a
 f9 82                 xor	r4, r0
 c5 00 09              ldi16	r5, 0x900
 f0 3c 2c              stsp16	[sp+0x2c], r4
 54                    st8	[r5], r4
 c4 b6 ff              ldi16	r4, 0xffb6
 f9 82                 xor	r4, r0
 c5 fd 04              ldi16	r5, 0x4fd
 f0 3c 34              stsp16	[sp+0x34], r4
 54                    st8	[r5], r4
 c0 77                 ldi8	r4, 0x77
 f9 82                 xor	r4, r0
 c5 01 09              ldi16	r5, 0x901
 f0 3c 2a              stsp16	[sp+0x2a], r4
 54                    st8	[r5], r4
 c4 c7 ff              ldi16	r4, 0xffc7
 f9 82                 xor	r4, r0
 c5 fe 04              ldi16	r5, 0x4fe
 f0 3c 32              stsp16	[sp+0x32], r4
 54                    st8	[r5], r4
 c4 94 ff              ldi16	r4, 0xff94
 f9 82                 xor	r4, r0
 c5 02 09              ldi16	r5, 0x902
 f0 3c 28              stsp16	[sp+0x28], r4
 54                    st8	[r5], r4
 c4 d8 ff              ldi16	r4, 0xffd8
 f9 82                 xor	r4, r0
 c5 ff 04              ldi16	r5, 0x4ff
 f0 3c 2e              stsp16	[sp+0x2e], r4
 54                    st8	[r5], r4
 c4 b1 ff              ldi16	r4, 0xffb1
 f9 82                 xor	r4, r0
 c5 03 09              ldi16	r5, 0x903
 f0 3c 26              stsp16	[sp+0x26], r4
 54                    st8	[r5], r4
 c5 00 05              ldi16	r5, 0x500
 a0                    xor	r4, r4
 f1 0c                 mov	r1, r4
 08                    mov	r6, r4
 fa 92                 lsr16i	r6, 0x2
 f9 c6                 xor	r6, r1
 f9 c2                 xor	r6, r0
 f6 0e                 st8	[r5+], r6
 f0 09 25              addi.s8	r1, 0x25
 f4 ac                 inc16	r4
 c6 00 04              ldi16	r6, 0x400
 32                    cmp	r4, r6
 d1 ec                 brne8	check_case+134
 f0 38 18              stsp16	[sp+0x18], r0
 c4 c5 10              ldi16	r4, 0x10c5
 c1 00                 ldi8	r5, 0x0
 f0 04 ad 10           ldi16	r0, 0x10ad
 f0 01 00              ldi8	r1, 0x0
 f4 a2                 tst8	r2
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d7 31                 sys	set_text_font
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 32                 sys	set_text_mode
 cf 01                 cmpi.s8	r7, 0x1
 f0 3a 14              stsp16	[sp+0x14], r2
 d0 1b                 breq8	check_case+216
 f4 a7                 tst8	r7
 d1 30                 brne8	check_case+241
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 cc 02                 cmpi.s8	r4, 0x2
 f0 30 18              ldsp16	r0, [sp+0x18]
 d9 47                 brsge8	check_case+274
 f4 a4                 tst8	r4
 d0 7c                 breq8	check_case+331
 cc 01                 cmpi.s8	r4, 0x1
 d1 6c                 brne8	check_case+319
 c6 10 01              ldi16	r6, 0x110
 d4 7b                 jmp8	check_case+339
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 cc 02                 cmpi.s8	r4, 0x2
 d9 40                 brsge8	check_case+287
 f4 a4                 tst8	r4
 f0 30 18              ldsp16	r0, [sp+0x18]
 d0 77                 breq8	check_case+349
 cc 01                 cmpi.s8	r4, 0x1
 d1 5a                 brne8	check_case+324
 c6 e9 10              ldi16	r6, 0x10e9
 c3 00                 ldi8	r7, 0x0
 d4 78                 jmp8	check_case+361
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 cc 02                 cmpi.s8	r4, 0x2
 f0 30 18              ldsp16	r0, [sp+0x18]
 d9 36                 brsge8	check_case+305
 f4 a4                 tst8	r4
 da 93 00              breq16	check_case+403
 cc 01                 cmpi.s8	r4, 0x1
 d1 7d                 brne8	check_case+385
 c0 42                 ldi8	r4, 0x42
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 17 40              leasp	r7, 0x40
 c6 00 01              ldi16	r6, 0x100
 e0 a4 00              jmp16	check_case+438
 cc 02                 cmpi.s8	r4, 0x2
 d0 3a                 breq8	check_case+336
 cc 03                 cmpi.s8	r4, 0x3
 d1 25                 brne8	check_case+319
 c6 15 01              ldi16	r6, 0x115
 d4 34                 jmp8	check_case+339
 cc 02                 cmpi.s8	r4, 0x2
 f0 30 18              ldsp16	r0, [sp+0x18]
 d0 3e                 breq8	check_case+356
 cc 03                 cmpi.s8	r4, 0x3
 d1 1a                 brne8	check_case+324
 c6 ee 10              ldi16	r6, 0x10ee
 c3 00                 ldi8	r7, 0x0
 d4 38                 jmp8	check_case+361
 cc 02                 cmpi.s8	r4, 0x2
 d0 71                 breq8	check_case+422
 cc 03                 cmpi.s8	r4, 0x3
 d1 48                 brne8	check_case+385
 c0 42                 ldi8	r4, 0x42
 c1 41                 ldi8	r5, 0x41
 d4 6b                 jmp8	check_case+426
 c6 18 01              ldi16	r6, 0x118
 d4 0f                 jmp8	check_case+339
 c6 f1 10              ldi16	r6, 0x10f1
 c3 00                 ldi8	r7, 0x0
 d4 1e                 jmp8	check_case+361
 c6 0e 01              ldi16	r6, 0x10e
 d4 03                 jmp8	check_case+339
 c6 12 01              ldi16	r6, 0x112
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 d7 33                 sys	draw_text
 d4 14                 jmp8	check_case+369
 c6 e7 10              ldi16	r6, 0x10e7
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	check_case+361
 c6 eb 10              ldi16	r6, 0x10eb
 c3 00                 ldi8	r7, 0x0
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 d7 34                 sys	draw_text_p
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 3d 38              stsp16	[sp+0x38], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 d4 50                 jmp8	check_case+465
 c0 41                 ldi8	r4, 0x41
 c1 42                 ldi8	r5, 0x42
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 17 40              leasp	r7, 0x40
 c6 08 01              ldi16	r6, 0x108
 d4 23                 jmp8	check_case+438
 c0 41                 ldi8	r4, 0x41
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 12 40              leasp	r2, 0x40
 c6 00 01              ldi16	r6, 0x100
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 d4 18                 jmp8	check_case+446
 c0 41                 ldi8	r4, 0x41
 c1 42                 ldi8	r5, 0x42
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 17 40              leasp	r7, 0x40
 c6 03 01              ldi16	r6, 0x103
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f1 17                 mov	r2, r7
 d7 35                 sys	draw_textfv
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 3d 38              stsp16	[sp+0x38], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 32 14              ldsp16	r2, [sp+0x14]
 c1 13                 ldi8	r5, 0x13
 c0 0a                 ldi8	r4, 0xa
 f4 a2                 tst8	r2
 fb 2c                 cmov.eq	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 d0 14                 breq8	check_case+497
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 cc 02                 cmpi.s8	r4, 0x2
 d2 23                 brult8	check_case+519
 c8 fe                 addi.s8	r4, -0x2
 cc 02                 cmpi.s8	r4, 0x2
 d8 46                 bruge8	check_case+560
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 0a                 addi.s8	r4, 0xa
 d4 1b                 jmp8	check_case+524
 c0 06                 ldi8	r4, 0x6
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 cc 02                 cmpi.s8	r4, 0x2
 d9 14                 brsge8	check_case+529
 f4 a4                 tst8	r4
 d0 4d                 breq8	check_case+590
 cc 01                 cmpi.s8	r4, 0x1
 d1 3a                 brne8	check_case+575
 d4 4c                 jmp8	check_case+595
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 05                 addi.s8	r4, 0x5
 f0 3c 3a              stsp16	[sp+0x3a], r4
 d4 4c                 jmp8	check_case+605
 cc 02                 cmpi.s8	r4, 0x2
 da c5 07              breq16	check_case+2523
 cc 03                 cmpi.s8	r4, 0x3
 d1 25                 brne8	check_case+575
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 c0 04                 ldi8	r4, 0x4
 f0 3c 3a              stsp16	[sp+0x3a], r4
 c0 06                 ldi8	r4, 0x6
 e0 b9 07              jmp16	check_case+2537
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 05                 addi.s8	r4, 0x5
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c8 13                 addi.s8	r4, 0x13
 d4 21                 jmp8	check_case+608
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 06                 addi.s8	r4, 0x6
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c8 0a                 addi.s8	r4, 0xa
 d4 12                 jmp8	check_case+608
 c0 04                 ldi8	r4, 0x4
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 14                    add	r5, r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 36 36              ldsp16	r6, [sp+0x36]
 f0 37 38              ldsp16	r7, [sp+0x38]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 36                    cmp	r5, r6
 f0 01 01              ldi8	r1, 0x1
 db d9 04              brne16	check_case+1865
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 32                    cmp	r4, r6
 db cf 04              brne16	check_case+1865
 c5 fc 04              ldi16	r5, 0x4fc
 4d                    ld8u	r7, [r5]
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 42 07              brne16	check_case+2504
 c5 fd 04              ldi16	r5, 0x4fd
 4d                    ld8u	r7, [r5]
 f0 33 34              ldsp16	r3, [sp+0x34]
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 33 07              brne16	check_case+2504
 c5 fe 04              ldi16	r5, 0x4fe
 4d                    ld8u	r7, [r5]
 f0 33 32              ldsp16	r3, [sp+0x32]
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 24 07              brne16	check_case+2504
 c5 ff 04              ldi16	r5, 0x4ff
 4d                    ld8u	r7, [r5]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 15 07              brne16	check_case+2504
 c5 00 09              ldi16	r5, 0x900
 4d                    ld8u	r7, [r5]
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 3e                    cmp	r7, r6
 db 48 07              brne16	check_case+2566
 c5 01 09              ldi16	r5, 0x901
 4d                    ld8u	r7, [r5]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 3e                    cmp	r7, r6
 db 3d 07              brne16	check_case+2566
 c5 02 09              ldi16	r5, 0x902
 4d                    ld8u	r7, [r5]
 f0 36 28              ldsp16	r6, [sp+0x28]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 2f 07              brne16	check_case+2566
 c5 03 09              ldi16	r5, 0x903
 4d                    ld8u	r7, [r5]
 f0 36 26              ldsp16	r6, [sp+0x26]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 21 07              brne16	check_case+2566
 aa                    xor	r6, r6
 c0 25                 ldi8	r4, 0x25
 f4 50                 stsp16	[sp+0x4], r4
 c0 7f                 ldi8	r4, 0x7f
 f4 48                 stsp16	[sp+0x2], r4
 c4 f8 07              ldi16	r4, 0x7f8
 f4 40                 stsp16	[sp+0x0], r4
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 02                    mov	r4, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 fe 25                 mul16	r4, r5
 06                    mov	r5, r6
 fa 82                 lsr16i	r5, 0x2
 a4                    xor	r5, r4
 f9 a2                 xor	r5, r0
 f0 3d 3a              stsp16	[sp+0x3a], r5
 06                    mov	r5, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 84                    and	r5, r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f4 5a                 stsp16	[sp+0x6], r6
 fa 94                 lsr16i	r6, 0x4
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 88                    and	r6, r4
 f0 3e 36              stsp16	[sp+0x36], r6
 ca 08                 addi.s8	r6, 0x8
 f0 3e 34              stsp16	[sp+0x34], r6
 f4 a2                 tst8	r2
 da ba 01              breq16	check_case+1244
 c0 03                 ldi8	r4, 0x3
 f4 60                 stsp16	[sp+0x8], r4
 c0 02                 ldi8	r4, 0x2
 f4 68                 stsp16	[sp+0xa], r4
 a0                    xor	r4, r4
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 71                 stsp16	[sp+0xc], r5
 e0 9a 01              jmp16	check_case+1229
 f0 34 12              ldsp16	r4, [sp+0x12]
 c8 05                 addi.s8	r4, 0x5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 0d 02              cmpi.s8	r1, 0x2
 d2 13                 brult8	check_case+863
 f1 25                 mov	r5, r1
 c9 fe                 addi.s8	r5, -0x2
 cd 02                 cmpi.s8	r5, 0x2
 d8 16                 bruge8	check_case+874
 f4 2a                 ldsp16	r6, [sp+0xa]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 da cd 03              breq16	check_case+1834
 d4 14                 jmp8	check_case+883
 c2 01                 ldi8	r6, 0x1
 04                    mov	r5, r4
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 da c2 03              breq16	check_case+1834
 d4 09                 jmp8	check_case+883
 f4 22                 ldsp16	r6, [sp+0x8]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 da b7 03              breq16	check_case+1834
 c3 01                 ldi8	r7, 0x1
 f0 0d 02              cmpi.s8	r1, 0x2
 08                    mov	r6, r4
 f4 ae                 inc16	r6
 f0 3e 10              stsp16	[sp+0x10], r6
 d9 11                 brsge8	check_case+913
 f4 a1                 tst8	r1
 0b                    mov	r6, r7
 d0 33                 breq8	check_case+952
 f0 0d 01              cmpi.s8	r1, 0x1
 d0 27                 breq8	check_case+945
 f4 a4                 tst8	r4
 0b                    mov	r6, r7
 d0 29                 breq8	check_case+952
 d4 15                 jmp8	check_case+934
 f0 0d 02              cmpi.s8	r1, 0x2
 d0 1e                 breq8	check_case+948
 f0 0d 03              cmpi.s8	r1, 0x3
 d1 06                 brne8	check_case+929
 f4 a4                 tst8	r4
 f8 0e                 cset.ne	r6
 d4 17                 jmp8	check_case+952
 f4 a4                 tst8	r4
 0b                    mov	r6, r7
 d0 12                 breq8	check_case+952
 cd 01                 cmpi.s8	r5, 0x1
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 30 18              ldsp16	r0, [sp+0x18]
 da 12 01              breq16	check_case+1219
 aa                    xor	r6, r6
 d4 04                 jmp8	check_case+952
 f4 a4                 tst8	r4
 f8 06                 cset.eq	r6
 f4 a6                 tst8	r6
 f0 07 2b 01           ldi16	r3, 0x12b
 c4 23 01              ldi16	r4, 0x123
 fb 5c                 cmov.ne	r3, r4
 f0 3b 2c              stsp16	[sp+0x2c], r3
 c4 ff ff              ldi16	r4, 0xffff
 fb 7c                 cmov.ne	r7, r4
 c5 f8 ff              ldi16	r5, 0xfff8
 c4 f6 ff              ldi16	r4, 0xfff6
 fb 6c                 cmov.ne	r5, r4
 c0 03                 ldi8	r4, 0x3
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f4 a6                 tst8	r6
 08                    mov	r6, r4
 c0 04                 ldi8	r4, 0x4
 fb 74                 cmov.ne	r6, r4
 f0 00 11              ldi8	r0, 0x11
 c0 0d                 ldi8	r4, 0xd
 fb 44                 cmov.ne	r0, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 14                    add	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 1c                    add	r7, r4
 f0 3f 24              stsp16	[sp+0x24], r7
 f2 42                 sub	r2, r2
 f1 70                 zext8	r0
 f1 76                 zext8	r6
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3a 28              stsp16	[sp+0x28], r2
 d4 13                 jmp8	check_case+1044
 f4 aa                 inc16	r2
 f0 34 28              ldsp16	r4, [sp+0x28]
 f4 ac                 inc16	r4
 f0 3c 28              stsp16	[sp+0x28], r4
 f1 74                 zext8	r4
 f0 35 22              ldsp16	r5, [sp+0x22]
 31                    cmp	r4, r5
 da 1f ff              breq16	check_case+819
 f0 34 24              ldsp16	r4, [sp+0x24]
 f2 22                 add	r4, r2
 f0 35 26              ldsp16	r5, [sp+0x26]
 31                    cmp	r4, r5
 d1 e2                 brne8	check_case+1025
 aa                    xor	r6, r6
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 0f 40              cmpi.s8	r3, 0x40
 d9 13                 brsge8	check_case+1083
 d4 21                 jmp8	check_case+1099
 f4 a7                 tst8	r7
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d0 07                 breq8	check_case+1080
 f0 36 32              ldsp16	r6, [sp+0x32]
 92                    or	r4, r6
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f4 ab                 inc16	r3
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f5 04                 cmp	r0, r4
 d0 bb                 breq8	check_case+1025
 f0 0f 40              cmpi.s8	r3, 0x40
 d9 f0                 brsge8	check_case+1083
 f0 34 36              ldsp16	r4, [sp+0x36]
 f5 1c                 cmp	r3, r4
 d3 e9                 brslt8	check_case+1083
 f0 34 34              ldsp16	r4, [sp+0x34]
 f5 1c                 cmp	r3, r4
 d9 e2                 brsge8	check_case+1083
 f0 3e 3c              stsp16	[sp+0x3c], r6
 fa 93                 lsr16i	r6, 0x3
 c3 1f                 ldi8	r7, 0x1f
 8e                    and	r7, r6
 0b                    mov	r6, r7
 c0 03                 ldi8	r4, 0x3
 f3 18                 mulu8.w	r6, r4
 1f                    add	r7, r7
 1f                    add	r7, r7
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 a4                 tst8	r4
 fb 77                 cmov.ne	r6, r7
 f2 2a                 add	r6, r2
 f1 76                 zext8	r6
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 18                    add	r6, r4
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 c0 f8                 ldi8	r4, 0xf8
 8c                    and	r7, r4
 f0 3f 32              stsp16	[sp+0x32], r7
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 c3 07                 ldi8	r7, 0x7
 83                    and	r4, r7
 f5 39                 ld8u	r1, [r6]
 c2 01                 ldi8	r6, 0x1
 0e                    mov	r7, r6
 fa 0c                 shl16v	r7, r4
 f9 e4                 and	r7, r1
 f1 23                 mov	r4, r3
 f0 35 32              ldsp16	r5, [sp+0x32]
 21                    sub	r4, r5
 f0 31 30              ldsp16	r1, [sp+0x30]
 f1 74                 zext8	r4
 fa 08                 shl16v	r6, r4
 f0 3e 32              stsp16	[sp+0x32], r6
 f0 0d 02              cmpi.s8	r1, 0x2
 d0 86                 breq8	check_case+1066
 f4 a1                 tst8	r1
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d1 09                 brne8	check_case+1204
 f4 a7                 tst8	r7
 d1 82                 brne8	check_case+1073
 c6 ff ff              ldi16	r6, 0xffff
 d4 07                 jmp8	check_case+1211
 f4 a7                 tst8	r7
 d0 80                 breq8	check_case+1080
 c6 ff ff              ldi16	r6, 0xffff
 f0 37 32              ldsp16	r7, [sp+0x32]
 ae                    xor	r7, r6
 83                    and	r4, r7
 e0 72 ff              jmp16	check_case+1077
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 31                 ldsp16	r5, [sp+0xc]
 14                    add	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 0d 02              cmpi.s8	r1, 0x2
 dd 73 fe              bruge16	check_case+844
 e0 83 fe              jmp16	check_case+863
 a0                    xor	r4, r4
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 0d 02              cmpi.s8	r1, 0x2
 d2 39                 brult8	check_case+1316
 d4 19                 jmp8	check_case+1286
 f0 33 24              ldsp16	r3, [sp+0x24]
 f0 34 20              ldsp16	r4, [sp+0x20]
 f2 1c                 add	r3, r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 0d 02              cmpi.s8	r1, 0x2
 d2 1e                 brult8	check_case+1316
 f1 25                 mov	r5, r1
 c9 fe                 addi.s8	r5, -0x2
 cd 02                 cmpi.s8	r5, 0x2
 d8 0b                 bruge8	check_case+1305
 c1 02                 ldi8	r5, 0x2
 08                    mov	r6, r4
 f1 76                 zext8	r6
 39                    cmp	r6, r5
 da 13 02              breq16	check_case+1834
 d4 14                 jmp8	check_case+1325
 c1 03                 ldi8	r5, 0x3
 08                    mov	r6, r4
 f1 76                 zext8	r6
 39                    cmp	r6, r5
 da 08 02              breq16	check_case+1834
 d4 09                 jmp8	check_case+1325
 c1 01                 ldi8	r5, 0x1
 08                    mov	r6, r4
 f1 76                 zext8	r6
 39                    cmp	r6, r5
 da fd 01              breq16	check_case+1834
 c1 01                 ldi8	r5, 0x1
 f0 0d 02              cmpi.s8	r1, 0x2
 0c                    mov	r7, r4
 f4 af                 inc16	r7
 d9 13                 brsge8	check_case+1354
 f4 a1                 tst8	r1
 f1 05                 mov	r0, r5
 d0 47                 breq8	check_case+1412
 f0 0d 01              cmpi.s8	r1, 0x1
 d0 3b                 breq8	check_case+1405
 f4 a4                 tst8	r4
 f1 24                 mov	r5, r0
 d0 3c                 breq8	check_case+1412
 d4 18                 jmp8	check_case+1378
 f1 05                 mov	r0, r5
 f0 0d 02              cmpi.s8	r1, 0x2
 d0 2f                 breq8	check_case+1408
 f0 0d 03              cmpi.s8	r1, 0x3
 d1 06                 brne8	check_case+1372
 f4 a4                 tst8	r4
 f8 0d                 cset.ne	r5
 d4 28                 jmp8	check_case+1412
 f4 a4                 tst8	r4
 f1 24                 mov	r5, r0
 d0 22                 breq8	check_case+1412
 ce 01                 cmpi.s8	r6, 0x1
 d1 17                 brne8	check_case+1405
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 12              ldsp16	r5, [sp+0x12]
 14                    add	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 03                    mov	r4, r7
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 0d 02              cmpi.s8	r1, 0x2
 d8 8b                 bruge8	check_case+1286
 d4 a7                 jmp8	check_case+1316
 a5                    xor	r5, r5
 d4 04                 jmp8	check_case+1412
 f4 a4                 tst8	r4
 f8 05                 cset.eq	r5
 f0 3f 22              stsp16	[sp+0x22], r7
 c3 06                 ldi8	r7, 0x6
 f4 a5                 tst8	r5
 c0 04                 ldi8	r4, 0x4
 08                    mov	r6, r4
 fb 7e                 cmov.ne	r7, r6
 f0 3f 20              stsp16	[sp+0x20], r7
 c0 03                 ldi8	r4, 0x3
 fb 74                 cmov.ne	r6, r4
 c7 fc ff              ldi16	r7, 0xfffc
 c4 fa ff              ldi16	r4, 0xfffa
 f4 a5                 tst8	r5
 fb 7c                 cmov.ne	r7, r4
 f0 01 08              ldi8	r1, 0x8
 c0 07                 ldi8	r4, 0x7
 fb 4c                 cmov.ne	r1, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 1c                    add	r7, r4
 f0 3f 28              stsp16	[sp+0x28], r7
 c4 ff ff              ldi16	r4, 0xffff
 fb 44                 cmov.ne	r0, r4
 f0 3b 24              stsp16	[sp+0x24], r3
 f2 03                 add	r0, r3
 f4 a5                 tst8	r5
 f1 76                 zext8	r6
 f0 3e 32              stsp16	[sp+0x32], r6
 f1 71                 zext8	r1
 f0 38 3c              stsp16	[sp+0x3c], r0
 f2 4b                 sub	r3, r3
 f1 2b                 mov	r6, r3
 d1 1a                 brne8	check_case+1509
 e0 c5 00              jmp16	check_case+1683
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f4 ab                 inc16	r3
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f0 35 32              ldsp16	r5, [sp+0x32]
 31                    cmp	r4, r5
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 da 08 ff              breq16	check_case+1261
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f1 23                 mov	r4, r3
 f2 20                 add	r4, r0
 f0 35 26              ldsp16	r5, [sp+0x26]
 31                    cmp	r4, r5
 f0 3b 2a              stsp16	[sp+0x2a], r3
 d1 d9                 brne8	check_case+1486
 f2 42                 sub	r2, r2
 c5 1c 01              ldi16	r5, 0x11c
 f2 1d                 add	r3, r5
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 0c 40              cmpi.s8	r0, 0x40
 d9 0d                 brsge8	check_case+1553
 d4 1c                 jmp8	check_case+1570
 f4 a5                 tst8	r5
 d0 68                 breq8	check_case+1650
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 94                    or	r5, r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f4 a8                 inc16	r0
 f4 aa                 inc16	r2
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f5 0d                 cmp	r1, r5
 d0 b1                 breq8	check_case+1486
 f0 0c 40              cmpi.s8	r0, 0x40
 d9 ef                 brsge8	check_case+1553
 f0 35 36              ldsp16	r5, [sp+0x36]
 f5 05                 cmp	r0, r5
 d3 e8                 brslt8	check_case+1553
 f0 35 34              ldsp16	r5, [sp+0x34]
 f5 05                 cmp	r0, r5
 d9 e1                 brsge8	check_case+1553
 f1 26                 mov	r5, r2
 c2 07                 ldi8	r6, 0x7
 86                    and	r5, r6
 c0 01                 ldi8	r4, 0x1
 08                    mov	r6, r4
 fa 09                 shl16v	r6, r5
 ed a6 20              ld8u	r5, [r3+0]
 86                    and	r5, r6
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 c3 f8                 ldi8	r7, 0xf8
 8b                    and	r6, r7
 f1 2c                 mov	r7, r0
 2e                    sub	r7, r6
 f1 77                 zext8	r7
 fa 03                 shl16v	r4, r7
 f0 36 30              ldsp16	r6, [sp+0x30]
 f4 a6                 tst8	r6
 d0 b4                 breq8	check_case+1542
 ce 02                 cmpi.s8	r6, 0x2
 d1 13                 brne8	check_case+1641
 f4 a5                 tst8	r5
 d1 b0                 brne8	check_case+1546
 f4 a8                 inc16	r0
 f4 aa                 inc16	r2
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f5 0d                 cmp	r1, r5
 d1 b7                 brne8	check_case+1565
 e0 65 ff              jmp16	check_case+1486
 f4 a5                 tst8	r5
 d0 a4                 breq8	check_case+1553
 c5 ff ff              ldi16	r5, 0xffff
 d4 03                 jmp8	check_case+1653
 c5 ff ff              ldi16	r5, 0xffff
 a1                    xor	r4, r5
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 84                    and	r5, r4
 d4 92                 jmp8	check_case+1550
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f4 ab                 inc16	r3
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f0 35 32              ldsp16	r5, [sp+0x32]
 31                    cmp	r4, r5
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 da 5a fe              breq16	check_case+1261
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f1 23                 mov	r4, r3
 f2 20                 add	r4, r0
 f0 35 26              ldsp16	r5, [sp+0x26]
 31                    cmp	r4, r5
 f0 3b 2a              stsp16	[sp+0x2a], r3
 d1 d9                 brne8	check_case+1660
 f2 42                 sub	r2, r2
 c5 1f 01              ldi16	r5, 0x11f
 f2 1d                 add	r3, r5
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 0c 40              cmpi.s8	r0, 0x40
 d9 0d                 brsge8	check_case+1727
 d4 1c                 jmp8	check_case+1744
 f4 a5                 tst8	r5
 d0 68                 breq8	check_case+1824
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 94                    or	r5, r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f4 a8                 inc16	r0
 f4 aa                 inc16	r2
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f5 0d                 cmp	r1, r5
 d0 b1                 breq8	check_case+1660
 f0 0c 40              cmpi.s8	r0, 0x40
 d9 ef                 brsge8	check_case+1727
 f0 35 36              ldsp16	r5, [sp+0x36]
 f5 05                 cmp	r0, r5
 d3 e8                 brslt8	check_case+1727
 f0 35 34              ldsp16	r5, [sp+0x34]
 f5 05                 cmp	r0, r5
 d9 e1                 brsge8	check_case+1727
 f1 26                 mov	r5, r2
 c2 07                 ldi8	r6, 0x7
 86                    and	r5, r6
 c0 01                 ldi8	r4, 0x1
 08                    mov	r6, r4
 fa 09                 shl16v	r6, r5
 ed a6 20              ld8u	r5, [r3+0]
 86                    and	r5, r6
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 c3 f8                 ldi8	r7, 0xf8
 8b                    and	r6, r7
 f1 2c                 mov	r7, r0
 2e                    sub	r7, r6
 f1 77                 zext8	r7
 fa 03                 shl16v	r4, r7
 f0 36 30              ldsp16	r6, [sp+0x30]
 f4 a6                 tst8	r6
 d0 b4                 breq8	check_case+1716
 ce 02                 cmpi.s8	r6, 0x2
 d1 13                 brne8	check_case+1815
 f4 a5                 tst8	r5
 d1 b0                 brne8	check_case+1720
 f4 a8                 inc16	r0
 f4 aa                 inc16	r2
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f5 0d                 cmp	r1, r5
 d1 b7                 brne8	check_case+1739
 e0 65 ff              jmp16	check_case+1660
 f4 a5                 tst8	r5
 d0 a4                 breq8	check_case+1727
 c5 ff ff              ldi16	r5, 0xffff
 d4 03                 jmp8	check_case+1827
 c5 ff ff              ldi16	r5, 0xffff
 a1                    xor	r4, r5
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 84                    and	r5, r4
 d4 92                 jmp8	check_case+1724
 c5 00 05              ldi16	r5, 0x500
 f4 18                 ldsp16	r4, [sp+0x6]
 14                    add	r5, r4
 4d                    ld8u	r7, [r5]
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f1 76                 zext8	r6
 3e                    cmp	r7, r6
 c4 00 04              ldi16	r4, 0x400
 db d0 02              brne16	check_case+2573
 af                    xor	r7, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 ae                 inc16	r6
 38                    cmp	r6, r4
 db b0 fb              brne16	check_case+758
 e0 8a 02              jmp16	check_case+2515
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f0 3f 3e              stsp16	[sp+0x3e], r7
 f1 75                 zext8	r5
 09                    mov	r6, r5
 fa 94                 lsr16i	r6, 0x4
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 03 30              ldi8	r3, 0x30
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f0 00 a0              ldi8	r0, 0xa0
 f5 24                 cmp	r5, r0
 fc 34                 cmov.ult	r6, r4
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 09                    mov	r6, r5
 f1 76                 zext8	r6
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 ed                 or	r7, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 34 36              ldsp16	r4, [sp+0x36]
 f0 35 38              ldsp16	r5, [sp+0x38]
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 3d 38              stsp16	[sp+0x38], r5
 08                    mov	r6, r4
 f1 76                 zext8	r6
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 ed                 or	r7, r3
 c8 37                 addi.s8	r4, 0x37
 f5 28                 cmp	r6, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 0e                    mov	r7, r6
 f9 ed                 or	r7, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 37                 cmov.ult	r6, r7
 f0 3e 32              stsp16	[sp+0x32], r6
 f0 00 0f              ldi8	r0, 0xf
 f0 35 16              ldsp16	r5, [sp+0x16]
 01                    mov	r4, r5
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 2a              stsp16	[sp+0x2a], r4
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 26              stsp16	[sp+0x26], r4
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 c8 37                 addi.s8	r4, 0x37
 f1 11                 mov	r2, r1
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 25                 cmp	r5, r1
 fc 26                 cmov.ult	r4, r6
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 01                    mov	r4, r5
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 28              stsp16	[sp+0x28], r4
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 24              stsp16	[sp+0x24], r4
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 c8 37                 addi.s8	r4, 0x37
 f5 25                 cmp	r5, r1
 fc 26                 cmov.ult	r4, r6
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 36 36              ldsp16	r6, [sp+0x36]
 f0 37 38              ldsp16	r7, [sp+0x38]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 3a              stsp16	[sp+0x3a], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 36 34              ldsp16	r6, [sp+0x34]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 36              stsp16	[sp+0x36], r4
 02                    mov	r4, r6
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 16              stsp16	[sp+0x16], r5
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 f9 a0                 and	r5, r0
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 c9 37                 addi.s8	r5, 0x37
 cc a0                 cmpi.s8	r4, -0x60
 fc 2e                 cmov.ult	r5, r6
 f0 3d 18              stsp16	[sp+0x18], r5
 f5 21                 cmp	r4, r1
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 06                    mov	r5, r6
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 08                    mov	r6, r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 f9 71                 or	r3, r4
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 23                 cmov.ult	r4, r3
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 58                 ldi8	r4, 0x58
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 58                 ldi8	r4, 0x58
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 d7 00                 sys	debug_putc
 c0 4f                 ldi8	r4, 0x4f
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 59                 ldi8	r4, 0x59
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 59                 ldi8	r4, 0x59
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 d7 00                 sys	debug_putc
 c0 4f                 ldi8	r4, 0x4f
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 2e                 mov	r7, r2
 d4 0b                 jmp8	check_case+2515
 f1 73                 zext8	r3
 f0 34 16              ldsp16	r4, [sp+0x16]
 f1 2b                 mov	r6, r3
 d5 45                 call8	fail_byte
 f1 2d                 mov	r7, r1
 03                    mov	r4, r7
 d6 44                 adjsp	0x44
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f0 3f 3e              stsp16	[sp+0x3e], r7
 c0 04                 ldi8	r4, 0x4
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 12                    add	r4, r6
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 14                    add	r5, r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f0 3f 3e              stsp16	[sp+0x3e], r7
 e0 5a f8              jmp16	check_case+608
 f1 76                 zext8	r6
 f0 34 16              ldsp16	r4, [sp+0x16]
 d4 c2                 jmp8	check_case+2511
 f0 34 16              ldsp16	r4, [sp+0x16]
 d5 04                 call8	fail_byte
 c3 01                 ldi8	r7, 0x1
 d4 bd                 jmp8	check_case+2515

<fail_byte>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 59                 stsp16	[sp+0x6], r5
 f0 01 0f              ldi8	r1, 0xf
 0c                    mov	r7, r4
 f9 e4                 and	r7, r1
 f0 00 30              ldi8	r0, 0x30
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 14              stsp16	[sp+0x14], r7
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 09                    mov	r6, r5
 fa 94                 lsr16i	r6, 0x4
 0e                    mov	r7, r6
 f9 e1                 or	r7, r0
 ca 37                 addi.s8	r6, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 26                 cmp	r5, r2
 fc 37                 cmov.ult	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 33                    cmp	r4, r7
 fc 35                 cmov.ult	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 02                    mov	r4, r6
 f1 74                 zext8	r4
 08                    mov	r6, r4
 04                    mov	r5, r4
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 f5 26                 cmp	r5, r2
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 23                 ldsp16	r7, [sp+0x8]
 03                    mov	r4, r7
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f5 2e                 cmp	r7, r2
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 0b                    mov	r6, r7
 f0 35 10              ldsp16	r5, [sp+0x10]
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 f5 26                 cmp	r5, r2
 fc 3c                 cmov.ult	r7, r4
 f9 a4                 and	r5, r1
 f9 15                 or	r0, r5
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 28                 cmov.ult	r5, r0
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
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
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
