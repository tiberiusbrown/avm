
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/draw_text_clipping.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 draw_text_clipping.c
0000046f l     F .text	00000860 check_case
00000e4e l     O .rodata	00000022 multi_page_font
00000e36 l     O .rodata	00000018 single_page_font
00000110 l     O .data	00000002 ram_b
00000e72 l     O .rodata	00000002 program_b
00000100 l     O .data	00000003 format_one
00000115 l     O .data	00000003 ram_ba
00000e77 l     O .rodata	00000003 program_ba
00000103 l     O .data	00000005 format_two
00000118 l     O .data	00000004 ram_a_newline_b
00000e7a l     O .rodata	00000004 program_a_newline_b
0000010e l     O .data	00000002 ram_a
00000112 l     O .data	00000003 ram_ab
00000e70 l     O .rodata	00000002 program_a
00000e74 l     O .rodata	00000003 program_ab
00000108 l     O .data	00000006 format_newline
0000011f l     O .data	00000004 single_b_image
0000011c l     O .data	00000003 single_a_image
00000123 l     O .data	00000008 multi_a_image
0000012b l     O .data	00000009 multi_b_image
00000ccf l     F .text	00000165 fail_byte
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000259 avm_test_main
00000e34 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 1e 0c              call16	avm_halt

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
 d6 ba                 adjsp	-0x46
 f1 16                 mov	r2, r6
 f0 3d 38              stsp16	[sp+0x38], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 c5 a5 ff              ldi16	r5, 0xffa5
 f0 19 56              ldsp8u	r1, [sp+0x56]
 f9 a6                 xor	r5, r1
 f0 34 54              ldsp16	r4, [sp+0x54]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 34 52              ldsp16	r4, [sp+0x52]
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 1c 51              ldsp8u	r4, [sp+0x51]
 f0 3c 26              stsp16	[sp+0x26], r4
 c4 fc 04              ldi16	r4, 0x4fc
 f0 3d 32              stsp16	[sp+0x32], r5
 51                    st8	[r4], r5
 c0 5a                 ldi8	r4, 0x5a
 f9 86                 xor	r4, r1
 c5 00 09              ldi16	r5, 0x900
 f0 3c 2a              stsp16	[sp+0x2a], r4
 54                    st8	[r5], r4
 c4 b6 ff              ldi16	r4, 0xffb6
 f9 86                 xor	r4, r1
 c5 fd 04              ldi16	r5, 0x4fd
 f0 3c 30              stsp16	[sp+0x30], r4
 54                    st8	[r5], r4
 c0 77                 ldi8	r4, 0x77
 f9 86                 xor	r4, r1
 c5 01 09              ldi16	r5, 0x901
 f0 3c 28              stsp16	[sp+0x28], r4
 54                    st8	[r5], r4
 c4 c7 ff              ldi16	r4, 0xffc7
 f9 86                 xor	r4, r1
 c5 fe 04              ldi16	r5, 0x4fe
 f0 3c 2e              stsp16	[sp+0x2e], r4
 54                    st8	[r5], r4
 c4 94 ff              ldi16	r4, 0xff94
 f9 86                 xor	r4, r1
 c5 02 09              ldi16	r5, 0x902
 f0 3c 22              stsp16	[sp+0x22], r4
 54                    st8	[r5], r4
 c4 d8 ff              ldi16	r4, 0xffd8
 f9 86                 xor	r4, r1
 c5 ff 04              ldi16	r5, 0x4ff
 f0 3c 2c              stsp16	[sp+0x2c], r4
 54                    st8	[r5], r4
 c4 b1 ff              ldi16	r4, 0xffb1
 f9 86                 xor	r4, r1
 c5 03 09              ldi16	r5, 0x903
 f0 3c 20              stsp16	[sp+0x20], r4
 54                    st8	[r5], r4
 f0 04 00 05           ldi16	r0, 0x500
 aa                    xor	r6, r6
 02                    mov	r4, r6
 06                    mov	r5, r6
 fa 82                 lsr16i	r5, 0x2
 a4                    xor	r5, r4
 f9 a6                 xor	r5, r1
 f0 6d a1              st8	[r0+], r5
 c8 25                 addi.s8	r4, 0x25
 f4 ae                 inc16	r6
 c5 00 04              ldi16	r5, 0x400
 39                    cmp	r6, r5
 d1 ed                 brne8	check_case+135
 f0 39 10              stsp16	[sp+0x10], r1
 c4 4e 0e              ldi16	r4, 0xe4e
 c1 00                 ldi8	r5, 0x0
 f0 04 36 0e           ldi16	r0, 0xe36
 f0 01 00              ldi8	r1, 0x0
 f0 36 38              ldsp16	r6, [sp+0x38]
 f4 a6                 tst8	r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d7 31                 sys	set_text_font
 f1 22                 mov	r4, r2
 d7 32                 sys	set_text_mode
 cf 01                 cmpi.s8	r7, 0x1
 d0 1e                 breq8	check_case+218
 f4 a7                 tst8	r7
 f0 31 24              ldsp16	r1, [sp+0x24]
 f0 34 26              ldsp16	r4, [sp+0x26]
 d1 2f                 brne8	check_case+245
 cc 02                 cmpi.s8	r4, 0x2
 d9 49                 brsge8	check_case+275
 f4 a4                 tst8	r4
 da 93 00              breq16	check_case+354
 cc 01                 cmpi.s8	r4, 0x1
 db 82 00              brne16	check_case+342
 c6 10 01              ldi16	r6, 0x110
 e0 90 00              jmp16	check_case+362
 f0 34 26              ldsp16	r4, [sp+0x26]
 cc 02                 cmpi.s8	r4, 0x2
 f0 31 24              ldsp16	r1, [sp+0x24]
 d9 3c                 brsge8	check_case+288
 f4 a4                 tst8	r4
 da 8c 00              breq16	check_case+373
 cc 01                 cmpi.s8	r4, 0x1
 d1 6e                 brne8	check_case+347
 c6 72 0e              ldi16	r6, 0xe72
 c3 00                 ldi8	r7, 0x0
 e0 8c 00              jmp16	check_case+385
 cc 02                 cmpi.s8	r4, 0x2
 d9 36                 brsge8	check_case+303
 f4 a4                 tst8	r4
 da bc 00              breq16	check_case+442
 f1 2e                 mov	r7, r2
 cc 01                 cmpi.s8	r4, 0x1
 db 87 00              brne16	check_case+396
 c0 42                 ldi8	r4, 0x42
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 12 42              leasp	r2, 0x42
 c6 00 01              ldi16	r6, 0x100
 e0 89 00              jmp16	check_case+412
 cc 02                 cmpi.s8	r4, 0x2
 d0 50                 breq8	check_case+359
 cc 03                 cmpi.s8	r4, 0x3
 d1 3b                 brne8	check_case+342
 c6 15 01              ldi16	r6, 0x115
 d4 4a                 jmp8	check_case+362
 cc 02                 cmpi.s8	r4, 0x2
 d0 58                 breq8	check_case+380
 cc 03                 cmpi.s8	r4, 0x3
 d1 33                 brne8	check_case+347
 c6 77 0e              ldi16	r6, 0xe77
 c3 00                 ldi8	r7, 0x0
 d4 52                 jmp8	check_case+385
 cc 02                 cmpi.s8	r4, 0x2
 da 93 00              breq16	check_case+455
 f1 2e                 mov	r7, r2
 cc 03                 cmpi.s8	r4, 0x3
 d1 52                 brne8	check_case+396
 c0 42                 ldi8	r4, 0x42
 c1 41                 ldi8	r5, 0x41
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 3d 44              stsp16	[sp+0x44], r5
 f0 12 42              leasp	r2, 0x42
 f0 31 24              ldsp16	r1, [sp+0x24]
 f1 21                 mov	r4, r1
 f0 33 14              ldsp16	r3, [sp+0x14]
 f1 27                 mov	r5, r3
 c6 03 01              ldi16	r6, 0x103
 d4 50                 jmp8	check_case+422
 c6 18 01              ldi16	r6, 0x118
 d4 0f                 jmp8	check_case+362
 c6 7a 0e              ldi16	r6, 0xe7a
 c3 00                 ldi8	r7, 0x0
 d4 1f                 jmp8	check_case+385
 c6 0e 01              ldi16	r6, 0x10e
 d4 03                 jmp8	check_case+362
 c6 12 01              ldi16	r6, 0x112
 f1 21                 mov	r4, r1
 f0 33 14              ldsp16	r3, [sp+0x14]
 f1 27                 mov	r5, r3
 d7 33                 sys	draw_text
 d4 74                 jmp8	check_case+489
 c6 70 0e              ldi16	r6, 0xe70
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	check_case+385
 c6 74 0e              ldi16	r6, 0xe74
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 f0 33 14              ldsp16	r3, [sp+0x14]
 f1 27                 mov	r5, r3
 d7 34                 sys	draw_text_p
 d4 5d                 jmp8	check_case+489
 c0 41                 ldi8	r4, 0x41
 c1 42                 ldi8	r5, 0x42
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 3d 44              stsp16	[sp+0x44], r5
 f0 12 42              leasp	r2, 0x42
 c6 08 01              ldi16	r6, 0x108
 f0 31 24              ldsp16	r1, [sp+0x24]
 f1 21                 mov	r4, r1
 f0 33 14              ldsp16	r3, [sp+0x14]
 f1 27                 mov	r5, r3
 d7 35                 sys	draw_textfv
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f1 17                 mov	r2, r7
 d4 3d                 jmp8	check_case+503
 c0 41                 ldi8	r4, 0x41
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 10 42              leasp	r0, 0x42
 c6 00 01              ldi16	r6, 0x100
 d4 10                 jmp8	check_case+471
 c0 41                 ldi8	r4, 0x41
 c1 42                 ldi8	r5, 0x42
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 3d 44              stsp16	[sp+0x44], r5
 f0 10 42              leasp	r0, 0x42
 c6 03 01              ldi16	r6, 0x103
 f0 31 24              ldsp16	r1, [sp+0x24]
 f1 21                 mov	r4, r1
 f0 33 14              ldsp16	r3, [sp+0x14]
 f1 27                 mov	r5, r3
 f1 2e                 mov	r7, r2
 f1 10                 mov	r2, r0
 d7 35                 sys	draw_textfv
 f1 17                 mov	r2, r7
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 c2 13                 ldi8	r6, 0x13
 c0 0a                 ldi8	r4, 0xa
 f0 35 38              ldsp16	r5, [sp+0x38]
 f4 a5                 tst8	r5
 fb 34                 cmov.eq	r6, r4
 f0 3e 16              stsp16	[sp+0x16], r6
 aa                    xor	r6, r6
 f0 00 01              ldi8	r0, 0x1
 f0 34 26              ldsp16	r4, [sp+0x26]
 04                    mov	r5, r4
 c9 fe                 addi.s8	r5, -0x2
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f1 27                 mov	r5, r3
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f1 25                 mov	r5, r1
 d4 1b                 jmp8	check_case+566
 f4 a6                 tst8	r6
 d0 02                 breq8	check_case+545
 c3 04                 ldi8	r7, 0x4
 c1 05                 ldi8	r5, 0x5
 f0 34 38              ldsp16	r4, [sp+0x38]
 f4 a4                 tst8	r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 31 24              ldsp16	r1, [sp+0x24]
 fb 2f                 cmov.eq	r5, r7
 f0 37 40              ldsp16	r7, [sp+0x40]
 17                    add	r5, r7
 f4 ae                 inc16	r6
 f0 3d 40              stsp16	[sp+0x40], r5
 cc 02                 cmpi.s8	r4, 0x2
 f1 2c                 mov	r7, r0
 d2 13                 brult8	check_case+594
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 cd 02                 cmpi.s8	r5, 0x2
 d8 0a                 bruge8	check_case+592
 c3 02                 ldi8	r7, 0x2
 06                    mov	r5, r6
 f1 75                 zext8	r5
 37                    cmp	r5, r7
 d0 44                 breq8	check_case+658
 d4 08                 jmp8	check_case+600
 c3 03                 ldi8	r7, 0x3
 06                    mov	r5, r6
 f1 75                 zext8	r5
 37                    cmp	r5, r7
 d0 3a                 breq8	check_case+658
 c3 06                 ldi8	r7, 0x6
 cc 02                 cmpi.s8	r4, 0x2
 d9 0e                 brsge8	check_case+620
 f4 a4                 tst8	r4
 d0 bd                 breq8	check_case+543
 cc 01                 cmpi.s8	r4, 0x1
 d0 bb                 breq8	check_case+545
 f4 a6                 tst8	r6
 d0 b5                 breq8	check_case+543
 d4 12                 jmp8	check_case+638
 cc 03                 cmpi.s8	r4, 0x3
 d0 ab                 breq8	check_case+539
 cc 02                 cmpi.s8	r4, 0x2
 d1 06                 brne8	check_case+634
 f4 a6                 tst8	r6
 d1 a9                 brne8	check_case+545
 d4 a5                 jmp8	check_case+543
 f4 a6                 tst8	r6
 d0 a1                 breq8	check_case+543
 cd 01                 cmpi.s8	r5, 0x1
 d1 9f                 brne8	check_case+545
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 1d                    add	r7, r5
 f0 3f 3e              stsp16	[sp+0x3e], r7
 f4 ae                 inc16	r6
 f1 25                 mov	r5, r1
 d4 a4                 jmp8	check_case+566
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f0 36 40              ldsp16	r6, [sp+0x40]
 38                    cmp	r6, r4
 db 39 03              brne16	check_case+1496
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 38                    cmp	r6, r4
 db 2c 03              brne16	check_case+1496
 c5 fc 04              ldi16	r5, 0x4fc
 4d                    ld8u	r7, [r5]
 f0 36 32              ldsp16	r6, [sp+0x32]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 8f 05              brne16	check_case+2121
 c5 fd 04              ldi16	r5, 0x4fd
 4d                    ld8u	r7, [r5]
 f0 36 30              ldsp16	r6, [sp+0x30]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 81 05              brne16	check_case+2121
 c5 fe 04              ldi16	r5, 0x4fe
 4d                    ld8u	r7, [r5]
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 73 05              brne16	check_case+2121
 c5 ff 04              ldi16	r5, 0x4ff
 4d                    ld8u	r7, [r5]
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 65 05              brne16	check_case+2121
 c5 00 09              ldi16	r5, 0x900
 4d                    ld8u	r7, [r5]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 3e                    cmp	r7, r6
 db 5a 05              brne16	check_case+2121
 c5 01 09              ldi16	r5, 0x901
 4d                    ld8u	r7, [r5]
 f0 36 28              ldsp16	r6, [sp+0x28]
 3e                    cmp	r7, r6
 db 4f 05              brne16	check_case+2121
 c5 02 09              ldi16	r5, 0x902
 4d                    ld8u	r7, [r5]
 f0 36 22              ldsp16	r6, [sp+0x22]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 41 05              brne16	check_case+2121
 c5 03 09              ldi16	r5, 0x903
 4d                    ld8u	r7, [r5]
 f0 36 20              ldsp16	r6, [sp+0x20]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 33 05              brne16	check_case+2121
 a0                    xor	r4, r4
 c1 25                 ldi8	r5, 0x25
 f4 51                 stsp16	[sp+0x4], r5
 c1 7f                 ldi8	r5, 0x7f
 f4 49                 stsp16	[sp+0x2], r5
 c5 f8 07              ldi16	r5, 0x7f8
 f4 41                 stsp16	[sp+0x0], r5
 08                    mov	r6, r4
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 3a 18              stsp16	[sp+0x18], r2
 02                    mov	r4, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 fe 25                 mul16	r4, r5
 06                    mov	r5, r6
 fa 82                 lsr16i	r5, 0x2
 a4                    xor	r5, r4
 f9 a2                 xor	r5, r0
 f0 3d 40              stsp16	[sp+0x40], r5
 06                    mov	r5, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 84                    and	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 5a                 stsp16	[sp+0x6], r6
 fa 94                 lsr16i	r6, 0x4
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 88                    and	r6, r4
 f0 3e 3e              stsp16	[sp+0x3e], r6
 ca 08                 addi.s8	r6, 0x8
 f0 3e 3a              stsp16	[sp+0x3a], r6
 a0                    xor	r4, r4
 f0 35 14              ldsp16	r5, [sp+0x14]
 f4 61                 stsp16	[sp+0x8], r5
 e0 57 02              jmp16	check_case+1458
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f4 28                 ldsp16	r4, [sp+0xa]
 f2 0c                 add	r1, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 35 26              ldsp16	r5, [sp+0x26]
 cd 02                 cmpi.s8	r5, 0x2
 d2 12                 brult8	check_case+896
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 cd 02                 cmpi.s8	r5, 0x2
 d8 16                 bruge8	check_case+907
 c2 02                 ldi8	r6, 0x2
 04                    mov	r5, r4
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 da 3a 02              breq16	check_case+1464
 d4 14                 jmp8	check_case+916
 c2 01                 ldi8	r6, 0x1
 04                    mov	r5, r4
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 da 2f 02              breq16	check_case+1464
 d4 09                 jmp8	check_case+916
 c2 03                 ldi8	r6, 0x3
 04                    mov	r5, r4
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 da 24 02              breq16	check_case+1464
 c2 01                 ldi8	r6, 0x1
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 ce 02                 cmpi.s8	r6, 0x2
 0c                    mov	r7, r4
 f4 af                 inc16	r7
 d9 0e                 brsge8	check_case+945
 f4 a6                 tst8	r6
 d0 2b                 breq8	check_case+978
 ce 01                 cmpi.s8	r6, 0x1
 d0 1d                 breq8	check_case+968
 f4 a4                 tst8	r4
 d0 23                 breq8	check_case+978
 d4 12                 jmp8	check_case+963
 ce 02                 cmpi.s8	r6, 0x2
 d0 16                 breq8	check_case+971
 ce 03                 cmpi.s8	r6, 0x3
 d1 06                 brne8	check_case+959
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 d4 10                 jmp8	check_case+975
 f4 a4                 tst8	r4
 d0 0f                 breq8	check_case+978
 cd 01                 cmpi.s8	r5, 0x1
 da e1 01              breq16	check_case+1449
 a0                    xor	r4, r4
 d4 04                 jmp8	check_case+975
 f4 a4                 tst8	r4
 f8 04                 cset.eq	r4
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 f4 a4                 tst8	r4
 c2 07                 ldi8	r6, 0x7
 f4 73                 stsp16	[sp+0xc], r7
 d0 25                 breq8	check_case+1026
 f1 16                 mov	r2, r6
 c3 03                 ldi8	r7, 0x3
 c0 04                 ldi8	r4, 0x4
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 a5                 tst8	r5
 fb 7c                 cmov.ne	r7, r4
 f0 04 f8 ff           ldi16	r0, 0xfff8
 c4 f6 ff              ldi16	r4, 0xfff6
 fb 44                 cmov.ne	r0, r4
 f0 03 11              ldi8	r3, 0x11
 c0 0d                 ldi8	r4, 0xd
 f4 a5                 tst8	r5
 fb 5c                 cmov.ne	r3, r4
 c0 05                 ldi8	r4, 0x5
 f4 68                 stsp16	[sp+0xa], r4
 d4 23                 jmp8	check_case+1061
 c0 06                 ldi8	r4, 0x6
 c3 04                 ldi8	r7, 0x4
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 a5                 tst8	r5
 fb 67                 cmov.ne	r4, r7
 f4 68                 stsp16	[sp+0xa], r4
 c0 03                 ldi8	r4, 0x3
 fb 7c                 cmov.ne	r7, r4
 f0 04 fc ff           ldi16	r0, 0xfffc
 c4 fa ff              ldi16	r4, 0xfffa
 f4 a5                 tst8	r5
 fb 44                 cmov.ne	r0, r4
 f0 03 08              ldi8	r3, 0x8
 f1 16                 mov	r2, r6
 fb 5e                 cmov.ne	r3, r6
 c2 01                 ldi8	r6, 0x1
 f4 a5                 tst8	r5
 c4 1f 01              ldi16	r4, 0x11f
 04                    mov	r5, r4
 c4 1c 01              ldi16	r4, 0x11c
 fb 6c                 cmov.ne	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c4 ff ff              ldi16	r4, 0xffff
 06                    mov	r5, r6
 fb 6c                 cmov.ne	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f2 04                 add	r0, r4
 f0 39 0e              stsp16	[sp+0xe], r1
 f2 25                 add	r5, r1
 f0 3d 20              stsp16	[sp+0x20], r5
 a5                    xor	r5, r5
 f1 73                 zext8	r3
 f1 77                 zext8	r7
 09                    mov	r6, r5
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 38 32              stsp16	[sp+0x32], r0
 f0 3b 30              stsp16	[sp+0x30], r3
 d4 18                 jmp8	check_case+1136
 f1 2a                 mov	r6, r2
 f1 16                 mov	r2, r6
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f4 ae                 inc16	r6
 f0 35 28              ldsp16	r5, [sp+0x28]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 f0 37 22              ldsp16	r7, [sp+0x22]
 33                    cmp	r4, r7
 da eb fe              breq16	check_case+859
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 34 20              ldsp16	r4, [sp+0x20]
 12                    add	r4, r6
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 31                    cmp	r4, r5
 f0 3e 2c              stsp16	[sp+0x2c], r6
 d1 d8                 brne8	check_case+1112
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 12                    add	r4, r6
 f0 3c 34              stsp16	[sp+0x34], r4
 f2 39                 sub	r1, r1
 f1 20                 mov	r4, r0
 f1 2a                 mov	r6, r2
 f0 32 18              ldsp16	r2, [sp+0x18]
 cc 40                 cmpi.s8	r4, 0x40
 d9 10                 brsge8	check_case+1188
 d4 1e                 jmp8	check_case+1204
 f4 a7                 tst8	r7
 da cd 00              breq16	check_case+1384
 f0 35 40              ldsp16	r5, [sp+0x40]
 96                    or	r5, r6
 f0 3d 40              stsp16	[sp+0x40], r5
 c2 07                 ldi8	r6, 0x7
 f4 ac                 inc16	r4
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 1d                 cmp	r3, r5
 d0 aa                 breq8	check_case+1114
 cc 40                 cmpi.s8	r4, 0x40
 d9 f0                 brsge8	check_case+1188
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 31                    cmp	r4, r5
 d3 ea                 brslt8	check_case+1188
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 31                    cmp	r4, r5
 d9 e4                 brsge8	check_case+1188
 f1 1a                 mov	r3, r2
 f0 02 f8              ldi8	r2, 0xf8
 f1 2d                 mov	r7, r1
 f9 e8                 and	r7, r2
 f0 35 38              ldsp16	r5, [sp+0x38]
 f4 a5                 tst8	r5
 f0 30 34              ldsp16	r0, [sp+0x34]
 d0 26                 breq8	check_case+1273
 fa a3                 lsr16i	r7, 0x3
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 a5                 tst8	r5
 d0 0d                 breq8	check_case+1257
 1f                    add	r7, r7
 1f                    add	r7, r7
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 1d                    add	r7, r5
 f1 77                 zext8	r7
 c5 23 01              ldi16	r5, 0x123
 d4 0d                 jmp8	check_case+1270
 c1 03                 ldi8	r5, 0x3
 f3 1d                 mulu8.w	r7, r5
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 1d                    add	r7, r5
 f1 77                 zext8	r7
 c5 2b 01              ldi16	r5, 0x12b
 1d                    add	r7, r5
 f1 07                 mov	r0, r7
 f1 25                 mov	r5, r1
 86                    and	r5, r6
 c2 01                 ldi8	r6, 0x1
 fa 09                 shl16v	r6, r5
 ed e0 20              ld8u	r7, [r0+0]
 8e                    and	r7, r6
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f9 54                 and	r2, r5
 04                    mov	r5, r4
 f2 56                 sub	r5, r2
 f1 75                 zext8	r5
 c2 01                 ldi8	r6, 0x1
 fa 09                 shl16v	r6, r5
 f1 13                 mov	r2, r3
 f0 0e 02              cmpi.s8	r2, 0x2
 d0 2c                 breq8	check_case+1349
 f4 a2                 tst8	r2
 f0 30 32              ldsp16	r0, [sp+0x32]
 f0 33 30              ldsp16	r3, [sp+0x30]
 da 72 ff              breq16	check_case+1174
 f4 a7                 tst8	r7
 d0 6f                 breq8	check_case+1431
 c5 ff ff              ldi16	r5, 0xffff
 a9                    xor	r6, r5
 f0 35 40              ldsp16	r5, [sp+0x40]
 86                    and	r5, r6
 f0 3d 40              stsp16	[sp+0x40], r5
 c2 07                 ldi8	r6, 0x7
 f4 ac                 inc16	r4
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 1d                 cmp	r3, r5
 db 6e ff              brne16	check_case+1200
 e0 15 ff              jmp16	check_case+1114
 f4 a7                 tst8	r7
 f0 30 32              ldsp16	r0, [sp+0x32]
 f0 33 30              ldsp16	r3, [sp+0x30]
 d0 36                 breq8	check_case+1413
 f0 35 40              ldsp16	r5, [sp+0x40]
 96                    or	r5, r6
 f0 3d 40              stsp16	[sp+0x40], r5
 c2 07                 ldi8	r6, 0x7
 f4 ac                 inc16	r4
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 1d                 cmp	r3, r5
 db 4b ff              brne16	check_case+1200
 e0 f2 fe              jmp16	check_case+1114
 c5 ff ff              ldi16	r5, 0xffff
 a9                    xor	r6, r5
 f0 35 40              ldsp16	r5, [sp+0x40]
 86                    and	r5, r6
 f0 3d 40              stsp16	[sp+0x40], r5
 c2 07                 ldi8	r6, 0x7
 f4 ac                 inc16	r4
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 1d                 cmp	r3, r5
 db 2e ff              brne16	check_case+1200
 e0 d5 fe              jmp16	check_case+1114
 c2 07                 ldi8	r6, 0x7
 f4 ac                 inc16	r4
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 1d                 cmp	r3, r5
 db 1c ff              brne16	check_case+1200
 e0 c3 fe              jmp16	check_case+1114
 c2 07                 ldi8	r6, 0x7
 f4 ac                 inc16	r4
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f5 1d                 cmp	r3, r5
 db 0a ff              brne16	check_case+1200
 e0 b1 fe              jmp16	check_case+1114
 f0 34 16              ldsp16	r4, [sp+0x16]
 f4 21                 ldsp16	r5, [sp+0x8]
 14                    add	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 03                    mov	r4, r7
 f0 31 24              ldsp16	r1, [sp+0x24]
 e0 af fd              jmp16	check_case+871
 c5 00 05              ldi16	r5, 0x500
 f4 1b                 ldsp16	r7, [sp+0x6]
 17                    add	r5, r7
 f5 35                 ld8u	r1, [r5]
 f0 36 40              ldsp16	r6, [sp+0x40]
 f1 76                 zext8	r6
 f5 0e                 cmp	r1, r6
 db 8f 02              brne16	check_case+2137
 a0                    xor	r4, r4
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 c5 00 04              ldi16	r5, 0x400
 39                    cmp	r6, r5
 db 56 fd              brne16	check_case+811
 e0 7a 02              jmp16	check_case+2130
 f0 36 12              ldsp16	r6, [sp+0x12]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 f0 02 30              ldi8	r2, 0x30
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 00 a0              ldi8	r0, 0xa0
 f5 2c                 cmp	r7, r0
 fc 25                 cmov.ult	r4, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 35 40              ldsp16	r5, [sp+0x40]
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 04                    mov	r5, r4
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 04                    mov	r5, r4
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 00 0f              ldi8	r0, 0xf
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 2a              stsp16	[sp+0x2a], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 36 40              ldsp16	r6, [sp+0x40]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 28              stsp16	[sp+0x28], r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 06                    mov	r5, r6
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 40              stsp16	[sp+0x40], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 09                    mov	r6, r5
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 34              stsp16	[sp+0x34], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f5 25                 cmp	r5, r1
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f0 37 3c              ldsp16	r7, [sp+0x3c]
 06                    mov	r5, r6
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 09                    mov	r6, r5
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 f9 51                 or	r2, r4
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 22                 cmov.ult	r4, r2
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
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
 f0 34 1c              ldsp16	r4, [sp+0x1c]
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
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
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
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
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
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d4 07                 jmp8	check_case+2128
 f1 76                 zext8	r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 d5 10                 call8	fail_byte
 c0 01                 ldi8	r4, 0x1
 d6 46                 adjsp	0x46
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 34 12              ldsp16	r4, [sp+0x12]
 f1 2d                 mov	r7, r1
 d4 ee                 jmp8	check_case+2126

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
