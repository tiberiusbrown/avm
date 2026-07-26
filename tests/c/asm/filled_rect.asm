
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/filled_rect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 filled_rect.c
00000375 l     F .text	0000028c check_case
00000601 l     F .text	00000194 check_round_trip
00000795 l     F .text	00000174 fail_case
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000025f avm_test_main
00000909 g     F .text	00000002 avm_halt
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
 e1 f3 07              call16	avm_halt

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
 e1 92 02              call16	check_round_trip
 f1 04                 mov	r0, r4
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<check_case>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 1d 2c              ldsp8u	r5, [sp+0x2c]
 03                    mov	r4, r7
 f0 3d 1a              stsp16	[sp+0x1a], r5
 11                    add	r4, r5
 c1 40                 ldi8	r5, 0x40
 cc 40                 cmpi.s8	r4, 0x40
 f1 05                 mov	r0, r5
 fd 04                 cmov.slt	r0, r4
 a5                    xor	r5, r5
 cf 01                 cmpi.s8	r7, 0x1
 f1 15                 mov	r2, r5
 f0 3f 1c              stsp16	[sp+0x1c], r7
 fd 57                 cmov.sge	r2, r7
 ce 01                 cmpi.s8	r6, 0x1
 f1 1d                 mov	r3, r5
 fd 5e                 cmov.sge	r3, r6
 f0 1f 2b              ldsp8u	r7, [sp+0x2b]
 f0 3e 18              stsp16	[sp+0x18], r6
 02                    mov	r4, r6
 f0 3f 16              stsp16	[sp+0x16], r7
 13                    add	r4, r7
 c3 80                 ldi8	r7, 0x80
 33                    cmp	r4, r7
 fd 3c                 cmov.slt	r7, r4
 f0 19 2d              ldsp8u	r1, [sp+0x2d]
 f5 1f                 cmp	r3, r7
 d9 04                 brsge8	check_case+71
 f5 10                 cmp	r2, r0
 d3 07                 brslt8	check_case+78
 f1 05                 mov	r0, r5
 0d                    mov	r7, r5
 f1 15                 mov	r2, r5
 f1 1d                 mov	r3, r5
 f4 5b                 stsp16	[sp+0x6], r7
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 06 a5 ff           ldi16	r2, 0xffa5
 f9 46                 xor	r2, r1
 c4 fc 04              ldi16	r4, 0x4fc
 f3 02                 st8	[r4], r2
 c0 5a                 ldi8	r4, 0x5a
 f9 86                 xor	r4, r1
 c6 00 09              ldi16	r6, 0x900
 f4 60                 stsp16	[sp+0x8], r4
 58                    st8	[r6], r4
 f0 07 b6 ff           ldi16	r3, 0xffb6
 f9 66                 xor	r3, r1
 c4 fd 04              ldi16	r4, 0x4fd
 f3 03                 st8	[r4], r3
 c0 77                 ldi8	r4, 0x77
 f9 86                 xor	r4, r1
 c6 01 09              ldi16	r6, 0x901
 f4 50                 stsp16	[sp+0x4], r4
 58                    st8	[r6], r4
 c4 c7 ff              ldi16	r4, 0xffc7
 f9 86                 xor	r4, r1
 c6 fe 04              ldi16	r6, 0x4fe
 f0 3c 12              stsp16	[sp+0x12], r4
 58                    st8	[r6], r4
 c4 94 ff              ldi16	r4, 0xff94
 f9 86                 xor	r4, r1
 c6 02 09              ldi16	r6, 0x902
 f4 48                 stsp16	[sp+0x2], r4
 58                    st8	[r6], r4
 c4 b1 ff              ldi16	r4, 0xffb1
 f9 86                 xor	r4, r1
 c6 d8 ff              ldi16	r6, 0xffd8
 f9 c6                 xor	r6, r1
 c7 ff 04              ldi16	r7, 0x4ff
 f4 72                 stsp16	[sp+0xc], r6
 5e                    st8	[r7], r6
 c6 03 09              ldi16	r6, 0x903
 f4 40                 stsp16	[sp+0x0], r4
 58                    st8	[r6], r4
 c7 00 05              ldi16	r7, 0x500
 09                    mov	r6, r5
 f0 04 00 04           ldi16	r0, 0x400
 01                    mov	r4, r5
 fa 72                 lsr16i	r4, 0x2
 a2                    xor	r4, r6
 f9 86                 xor	r4, r1
 f6 1c                 st8	[r7+], r4
 ca 25                 addi.s8	r6, 0x25
 f4 ad                 inc16	r5
 f5 24                 cmp	r5, r0
 d1 f0                 brne8	check_case+184
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f6 2c                 tst16	r4
 d0 10                 breq8	check_case+223
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 d7 27                 sys	draw_filled_rect_white
 d4 0e                 jmp8	check_case+237
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 d7 28                 sys	draw_filled_rect_black
 c5 fc 04              ldi16	r5, 0x4fc
 4d                    ld8u	r7, [r5]
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 6f 01              brne16	check_case+616
 c5 fd 04              ldi16	r5, 0x4fd
 4d                    ld8u	r7, [r5]
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 f1 13                 mov	r2, r3
 db 61 01              brne16	check_case+616
 c5 fe 04              ldi16	r5, 0x4fe
 4d                    ld8u	r7, [r5]
 f0 32 12              ldsp16	r2, [sp+0x12]
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 52 01              brne16	check_case+616
 c5 ff 04              ldi16	r5, 0x4ff
 4d                    ld8u	r7, [r5]
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 43 01              brne16	check_case+616
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 c5 00 09              ldi16	r5, 0x900
 4d                    ld8u	r7, [r5]
 f4 22                 ldsp16	r6, [sp+0x8]
 3e                    cmp	r7, r6
 db 4a 01              brne16	check_case+636
 c5 01 09              ldi16	r5, 0x901
 4d                    ld8u	r7, [r5]
 f4 12                 ldsp16	r6, [sp+0x4]
 3e                    cmp	r7, r6
 db 40 01              brne16	check_case+636
 c5 02 09              ldi16	r5, 0x902
 4d                    ld8u	r7, [r5]
 f4 0a                 ldsp16	r6, [sp+0x2]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 33 01              brne16	check_case+636
 c5 03 09              ldi16	r5, 0x903
 4d                    ld8u	r7, [r5]
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 26 01              brne16	check_case+636
 c4 00 05              ldi16	r4, 0x500
 af                    xor	r7, r7
 c2 7f                 ldi8	r6, 0x7f
 f4 72                 stsp16	[sp+0xc], r6
 f1 1f                 mov	r3, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 26                 mov	r5, r2
 f1 16                 mov	r2, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 03                    mov	r4, r7
 fa 72                 lsr16i	r4, 0x2
 f0 3b 12              stsp16	[sp+0x12], r3
 f9 8e                 xor	r4, r3
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f4 30                 ldsp16	r4, [sp+0xc]
 8c                    and	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 3c                    cmp	r7, r4
 aa                    xor	r6, r6
 dc ba 00              brult16	check_case+571
 f5 2e                 cmp	r7, r2
 df b5 00              brsge16	check_case+571
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 fa 74                 lsr16i	r4, 0x4
 f4 60                 stsp16	[sp+0x8], r4
 c5 f8 07              ldi16	r5, 0x7f8
 84                    and	r5, r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 34                    cmp	r5, r4
 f1 1c                 mov	r3, r4
 f8 27                 cset.slt	r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 34                    cmp	r5, r4
 f8 1e                 cset.uge	r6
 8b                    and	r6, r7
 c3 01                 ldi8	r7, 0x1
 9d                    or	r7, r5
 c1 02                 ldi8	r5, 0x2
 f1 16                 mov	r2, r6
 f9 55                 or	r2, r5
 f5 2f                 cmp	r7, r3
 f1 1e                 mov	r3, r6
 fd 1a                 cmov.slt	r3, r2
 f0 34 10              ldsp16	r4, [sp+0x10]
 3c                    cmp	r7, r4
 fc 73                 cmov.uge	r6, r3
 f0 33 16              ldsp16	r3, [sp+0x16]
 f9 ad                 or	r5, r3
 f0 02 04              ldi8	r2, 0x4
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 f4 3b                 ldsp16	r7, [sp+0xe]
 37                    cmp	r5, r7
 0e                    mov	r7, r6
 fd 3c                 cmov.slt	r7, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 34                    cmp	r5, r4
 fc 77                 cmov.uge	r6, r7
 c0 03                 ldi8	r4, 0x3
 f9 8d                 or	r4, r3
 c1 08                 ldi8	r5, 0x8
 96                    or	r5, r6
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f5 23                 cmp	r4, r3
 0e                    mov	r7, r6
 fd 3d                 cmov.slt	r7, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 31                    cmp	r4, r5
 fc 77                 cmov.uge	r6, r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f9 51                 or	r2, r4
 c0 10                 ldi8	r4, 0x10
 92                    or	r4, r6
 f1 2f                 mov	r7, r3
 f5 17                 cmp	r2, r7
 06                    mov	r5, r6
 fd 2c                 cmov.slt	r5, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f5 14                 cmp	r2, r4
 fc 75                 cmov.uge	r6, r5
 c0 05                 ldi8	r4, 0x5
 f0 33 16              ldsp16	r3, [sp+0x16]
 f9 8d                 or	r4, r3
 c1 20                 ldi8	r5, 0x20
 96                    or	r5, r6
 33                    cmp	r4, r7
 0e                    mov	r7, r6
 fd 3d                 cmov.slt	r7, r5
 f0 32 10              ldsp16	r2, [sp+0x10]
 f5 22                 cmp	r4, r2
 fc 77                 cmov.uge	r6, r7
 c0 06                 ldi8	r4, 0x6
 f9 8d                 or	r4, r3
 06                    mov	r5, r6
 c3 40                 ldi8	r7, 0x40
 97                    or	r5, r7
 f4 3b                 ldsp16	r7, [sp+0xe]
 33                    cmp	r4, r7
 0e                    mov	r7, r6
 fd 3d                 cmov.slt	r7, r5
 f1 1a                 mov	r3, r2
 f5 23                 cmp	r4, r3
 fc 77                 cmov.uge	r6, r7
 c0 07                 ldi8	r4, 0x7
 f4 21                 ldsp16	r5, [sp+0x8]
 91                    or	r4, r5
 c5 80 ff              ldi16	r5, 0xff80
 96                    or	r5, r6
 f4 3b                 ldsp16	r7, [sp+0xe]
 33                    cmp	r4, r7
 f0 32 06              ldsp16	r2, [sp+0x6]
 0e                    mov	r7, r6
 fd 3d                 cmov.slt	r7, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f5 23                 cmp	r4, r3
 fc 77                 cmov.uge	r6, r7
 f0 37 18              ldsp16	r7, [sp+0x18]
 f9 e6                 xor	r7, r1
 c4 ff ff              ldi16	r4, 0xffff
 a2                    xor	r4, r6
 9b                    or	r6, r7
 83                    and	r4, r7
 f6 2d                 tst16	r5
 fb 34                 cmov.eq	r6, r4
 f1 76                 zext8	r6
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 4c                    ld8u	r7, [r4]
 3e                    cmp	r7, r6
 d1 30                 brne8	check_case+643
 aa                    xor	r6, r6
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 0b 25              addi.s8	r3, 0x25
 f4 ac                 inc16	r4
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f4 af                 inc16	r7
 f5 2c                 cmp	r7, r0
 db 00 ff              brne16	check_case+358
 d4 0c                 jmp8	check_case+628
 f1 72                 zext8	r2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f1 2a                 mov	r6, r2
 e1 ae 01              call16	fail_case
 c2 01                 ldi8	r6, 0x1
 02                    mov	r4, r6
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f1 76                 zext8	r6
 f0 34 14              ldsp16	r4, [sp+0x14]
 d4 ec                 jmp8	check_case+623
 c4 00 05              ldi16	r4, 0x500
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 14                    add	r5, r4
 d4 f2                 jmp8	check_case+638

<check_round_trip>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 01 f8              ldi8	r1, 0xf8
 f0 04 fc 04           ldi16	r0, 0x4fc
 ee 20 20              st8	[r0+0], r1
 c1 07                 ldi8	r5, 0x7
 c4 00 09              ldi16	r4, 0x900
 51                    st8	[r4], r5
 c0 eb                 ldi8	r4, 0xeb
 c5 fd 04              ldi16	r5, 0x4fd
 54                    st8	[r5], r4
 c0 2a                 ldi8	r4, 0x2a
 c5 01 09              ldi16	r5, 0x901
 54                    st8	[r5], r4
 c0 9a                 ldi8	r4, 0x9a
 c5 fe 04              ldi16	r5, 0x4fe
 54                    st8	[r5], r4
 c0 c9                 ldi8	r4, 0xc9
 c5 02 09              ldi16	r5, 0x902
 54                    st8	[r5], r4
 c0 85                 ldi8	r4, 0x85
 c5 ff 04              ldi16	r5, 0x4ff
 54                    st8	[r5], r4
 c0 ec                 ldi8	r4, 0xec
 c5 03 09              ldi16	r5, 0x903
 54                    st8	[r5], r4
 c7 00 05              ldi16	r7, 0x500
 aa                    xor	r6, r6
 f0 02 5d              ldi8	r2, 0x5d
 f0 07 00 04           ldi16	r3, 0x400
 06                    mov	r5, r6
 02                    mov	r4, r6
 fa 72                 lsr16i	r4, 0x2
 a1                    xor	r4, r5
 f9 8a                 xor	r4, r2
 f6 1c                 st8	[r7+], r4
 c9 25                 addi.s8	r5, 0x25
 f4 ae                 inc16	r6
 f5 2b                 cmp	r6, r3
 d1 f0                 brne8	check_round_trip+70
 c3 1b                 ldi8	r7, 0x1b
 c2 2b                 ldi8	r6, 0x2b
 c1 06                 ldi8	r5, 0x6
 c0 25                 ldi8	r4, 0x25
 d7 27                 sys	draw_filled_rect_white
 d7 28                 sys	draw_filled_rect_black
 ed e0 20              ld8u	r7, [r0+0]
 f5 2d                 cmp	r7, r1
 db 11 01              brne16	check_round_trip+379
 f0 04 fd 04           ldi16	r0, 0x4fd
 ed e0 20              ld8u	r7, [r0+0]
 f0 01 eb              ldi8	r1, 0xeb
 f5 2d                 cmp	r7, r1
 db 02 01              brne16	check_round_trip+379
 f0 04 fe 04           ldi16	r0, 0x4fe
 ed e0 20              ld8u	r7, [r0+0]
 f0 01 9a              ldi8	r1, 0x9a
 f5 2d                 cmp	r7, r1
 db f3 00              brne16	check_round_trip+379
 f0 04 ff 04           ldi16	r0, 0x4ff
 ed e0 20              ld8u	r7, [r0+0]
 f0 01 85              ldi8	r1, 0x85
 f5 2d                 cmp	r7, r1
 db e4 00              brne16	check_round_trip+379
 c5 00 09              ldi16	r5, 0x900
 4d                    ld8u	r7, [r5]
 cf 07                 cmpi.s8	r7, 0x7
 c2 07                 ldi8	r6, 0x7
 db ee 00              brne16	check_round_trip+400
 c5 01 09              ldi16	r5, 0x901
 4d                    ld8u	r7, [r5]
 cf 2a                 cmpi.s8	r7, 0x2a
 c2 2a                 ldi8	r6, 0x2a
 db e3 00              brne16	check_round_trip+400
 c5 02 09              ldi16	r5, 0x902
 4d                    ld8u	r7, [r5]
 c2 c9                 ldi8	r6, 0xc9
 3e                    cmp	r7, r6
 db d9 00              brne16	check_round_trip+400
 c5 03 09              ldi16	r5, 0x903
 4d                    ld8u	r7, [r5]
 c2 ec                 ldi8	r6, 0xec
 3e                    cmp	r7, r6
 db cf 00              brne16	check_round_trip+400
 f0 04 00 05           ldi16	r0, 0x500
 a5                    xor	r5, r5
 c0 7f                 ldi8	r4, 0x7f
 f4 58                 stsp16	[sp+0x6], r4
 0d                    mov	r7, r5
 09                    mov	r6, r5
 fa 92                 lsr16i	r6, 0x2
 f4 6b                 stsp16	[sp+0xa], r7
 ab                    xor	r6, r7
 f9 ca                 xor	r6, r2
 01                    mov	r4, r5
 f4 1b                 ldsp16	r7, [sp+0x6]
 83                    and	r4, r7
 c8 db                 addi.s8	r4, -0x25
 cc 2b                 cmpi.s8	r4, 0x2b
 dd 85 00              bruge16	check_round_trip+355
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 f4 48                 stsp16	[sp+0x2], r4
 c7 f8 07              ldi16	r7, 0x7f8
 8c                    and	r7, r4
 f4 63                 stsp16	[sp+0x8], r7
 03                    mov	r4, r7
 f4 b4                 dec16	r4
 f4 40                 stsp16	[sp+0x0], r4
 cc 20                 cmpi.s8	r4, 0x20
 f8 14                 cset.ult	r4
 f0 38 04              stsp16	[sp+0x4], r0
 f0 00 02              ldi8	r0, 0x2
 f9 11                 or	r0, r4
 f0 05 00 02           ldi16	r1, 0x200
 f5 25                 cmp	r5, r1
 f1 0c                 mov	r1, r4
 fc 08                 cmov.ult	r1, r0
 f4 23                 ldsp16	r7, [sp+0x8]
 f6 2f                 tst16	r7
 f8 0f                 cset.ne	r7
 f4 a7                 tst8	r7
 fb 61                 cmov.ne	r4, r1
 f0 00 04              ldi8	r0, 0x4
 f9 11                 or	r0, r4
 f0 31 08              ldsp16	r1, [sp+0x8]
 f1 2d                 mov	r7, r1
 cb fc                 addi.s8	r7, -0x4
 cf 1b                 cmpi.s8	r7, 0x1b
 fc 20                 cmov.ult	r4, r0
 f0 00 08              ldi8	r0, 0x8
 f9 11                 or	r0, r4
 f1 2d                 mov	r7, r1
 cb fd                 addi.s8	r7, -0x3
 cf 1b                 cmpi.s8	r7, 0x1b
 fc 20                 cmov.ult	r4, r0
 f0 00 10              ldi8	r0, 0x10
 f9 11                 or	r0, r4
 f1 2d                 mov	r7, r1
 cb fe                 addi.s8	r7, -0x2
 cf 1b                 cmpi.s8	r7, 0x1b
 fc 20                 cmov.ult	r4, r0
 f0 00 20              ldi8	r0, 0x20
 f9 11                 or	r0, r4
 f4 03                 ldsp16	r7, [sp+0x0]
 cf 1b                 cmpi.s8	r7, 0x1b
 fc 20                 cmov.ult	r4, r0
 c3 40                 ldi8	r7, 0x40
 9c                    or	r7, r4
 f0 0d 1b              cmpi.s8	r1, 0x1b
 fc 27                 cmov.ult	r4, r7
 f0 00 07              ldi8	r0, 0x7
 f4 0b                 ldsp16	r7, [sp+0x2]
 f9 1d                 or	r0, r7
 c7 80 ff              ldi16	r7, 0xff80
 9c                    or	r7, r4
 f0 0c 21              cmpi.s8	r0, 0x21
 f0 30 04              ldsp16	r0, [sp+0x4]
 fc 27                 cmov.ult	r4, r7
 c7 ff ff              ldi16	r7, 0xffff
 ac                    xor	r7, r4
 8b                    and	r6, r7
 ed e0 20              ld8u	r7, [r0+0]
 f1 76                 zext8	r6
 3e                    cmp	r7, r6
 d1 21                 brne8	check_round_trip+396
 a0                    xor	r4, r4
 f4 2b                 ldsp16	r7, [sp+0xa]
 cb 25                 addi.s8	r7, 0x25
 f4 a8                 inc16	r0
 f4 ad                 inc16	r5
 f5 27                 cmp	r5, r3
 db 52 ff              brne16	check_round_trip+203
 d4 0a                 jmp8	check_round_trip+389
 c0 14                 ldi8	r4, 0x14
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 d5 11                 call8	fail_case
 c0 01                 ldi8	r4, 0x1
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 00 05              ldi16	r4, 0x500
 14                    add	r5, r4
 c0 14                 ldi8	r4, 0x14
 d4 ed                 jmp8	check_round_trip+385

<fail_case>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f0 3f 14              stsp16	[sp+0x14], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 59                 stsp16	[sp+0x6], r5
 f0 01 0f              ldi8	r1, 0xf
 08                    mov	r6, r4
 f9 c4                 and	r6, r1
 f0 00 30              ldi8	r0, 0x30
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 f9 c1                 or	r6, r0
 cb 37                 addi.s8	r7, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 26                 cmp	r5, r2
 fc 3e                 cmov.ult	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 c6 00 a0              ldi16	r6, 0xa000
 32                    cmp	r4, r6
 fc 3d                 cmov.ult	r7, r5
 f4 6b                 stsp16	[sp+0xa], r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 07                    mov	r5, r7
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 3e                    cmp	r7, r6
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2e                 cmp	r7, r2
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c1                 or	r6, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 26                 cmov.ult	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0d                    mov	r7, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 22                 cmp	r4, r2
 fc 35                 cmov.ult	r6, r5
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 f0 03 41              ldi8	r3, 0x41
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f0 01 3d              ldi8	r1, 0x3d
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 02 0a              ldi8	r2, 0xa
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c1 54                 ldi8	r5, 0x54
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 d7 00                 sys	debug_putc
 c0 4f                 ldi8	r4, 0x4f
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
