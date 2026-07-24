
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_plus_mask.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_plus_mask.c
00000ab5 l     O .rodata	0000003e sprite_5x13
00006dd5 l     O .rodata	00000400 expected_00
00000af3 l     O .rodata	00000400 expected_01
00000ef3 l     O .rodata	00000400 expected_02
000012f3 l     O .rodata	00000400 expected_03
000016f3 l     O .rodata	00000400 expected_04
00001af3 l     O .rodata	00000400 expected_05
00001ef3 l     O .rodata	00000400 expected_06
000022f3 l     O .rodata	00000206 sprite_1x1_many_frames
000024f9 l     O .rodata	00000400 expected_07
000028f9 l     O .rodata	00000014 sprite_9x8
0000290d l     O .rodata	00000400 expected_08
00002d0d l     O .rodata	00000400 expected_09
0000310d l     O .rodata	00000032 sprite_4x17
0000313f l     O .rodata	00000400 expected_10
0000353f l     O .rodata	00000400 expected_11
0000393f l     O .rodata	00000412 sprite_130x9
00003d51 l     O .rodata	00000400 expected_12
00004151 l     O .rodata	00000080 sprite_7x65
000041d1 l     O .rodata	00000400 expected_13
000045d1 l     O .rodata	00000400 expected_14
000049d1 l     O .rodata	00000400 expected_15
00004dd1 l     O .rodata	00000400 expected_16
000051d1 l     O .rodata	00000400 expected_17
000055d1 l     O .rodata	00000002 sprite_zero_width
000055d3 l     O .rodata	00000400 expected_18
000059d3 l     O .rodata	00000002 sprite_zero_height
000059d5 l     O .rodata	00000400 expected_19
00005dd5 l     O .rodata	00000400 expected_20
000061d5 l     O .rodata	00000400 expected_21
000065d5 l     O .rodata	00000400 expected_22
000069d5 l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000099d avm_test_main
00000ab3 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 9d 09              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 c6 00 04              ldi16	r6, 0x400
 f2 30                 sub	r0, r0
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f0 06 b5 0a           ldi16	r2, 0xab5
 f0 03 00              ldi8	r3, 0x0
 c1 08                 ldi8	r5, 0x8
 f0 01 0a              ldi8	r1, 0xa
 b6                    push16	r6
 b7                    push16	r7
 f1 21                 mov	r4, r1
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 be                    pop16	r6
 f0 06 d5 6d           ldi16	r2, 0x6dd5
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 b5                    push16	r5
 b6                    push16	r6
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 bd                    pop16	r5
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+103
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 e0 26 09              jmp16	avm_test_main+2445
 03                    mov	r4, r7
 b5                    push16	r5
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c3 a5                 ldi8	r7, 0xa5
 c4 00 05              ldi16	r4, 0x500
 07                    mov	r5, r7
 d7 11                 sys	memset
 c7 00 05              ldi16	r7, 0x500
 c0 01                 ldi8	r4, 0x1
 bd                    pop16	r5
 f0 06 b5 0a           ldi16	r2, 0xab5
 f0 03 00              ldi8	r3, 0x0
 b0                    push16	r0
 b6                    push16	r6
 b7                    push16	r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 f1 21                 mov	r4, r1
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 be                    pop16	r6
 b8                    pop16	r0
 f0 06 f3 0a           ldi16	r2, 0xaf3
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 c5 00 04              ldi16	r5, 0x400
 b6                    push16	r6
 b7                    push16	r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+208
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 e0 bd 08              jmp16	avm_test_main+2445
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 3c                 ldi8	r5, 0x3c
 03                    mov	r4, r7
 d7 11                 sys	memset
 c1 02                 ldi8	r5, 0x2
 f0 06 b5 0a           ldi16	r2, 0xab5
 f0 03 00              ldi8	r3, 0x0
 c0 03                 ldi8	r4, 0x3
 c2 1b                 ldi8	r6, 0x1b
 b0                    push16	r0
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 b8                    pop16	r0
 f0 06 f3 0e           ldi16	r2, 0xef3
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 c6 00 04              ldi16	r6, 0x400
 b6                    push16	r6
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+308
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 e0 59 08              jmp16	avm_test_main+2445
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 96                 ldi8	r5, 0x96
 03                    mov	r4, r7
 d7 11                 sys	memset
 f0 06 b5 0a           ldi16	r2, 0xab5
 f0 03 00              ldi8	r3, 0x0
 c0 13                 ldi8	r4, 0x13
 c6 fe ff              ldi16	r6, 0xfffe
 c1 01                 ldi8	r5, 0x1
 b0                    push16	r0
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 b8                    pop16	r0
 f0 06 f3 12           ldi16	r2, 0x12f3
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 c6 00 04              ldi16	r6, 0x400
 b6                    push16	r6
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+409
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 e0 f4 07              jmp16	avm_test_main+2445
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 69                 ldi8	r5, 0x69
 03                    mov	r4, r7
 d7 11                 sys	memset
 f0 06 b5 0a           ldi16	r2, 0xab5
 f0 03 00              ldi8	r3, 0x0
 c0 11                 ldi8	r4, 0x11
 c2 7e                 ldi8	r6, 0x7e
 c1 02                 ldi8	r5, 0x2
 b0                    push16	r0
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 b8                    pop16	r0
 f0 06 f3 16           ldi16	r2, 0x16f3
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 c6 00 04              ldi16	r6, 0x400
 b6                    push16	r6
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+509
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 e0 90 07              jmp16	avm_test_main+2445
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 c3                 ldi8	r5, 0xc3
 03                    mov	r4, r7
 d7 11                 sys	memset
 f0 06 b5 0a           ldi16	r2, 0xab5
 f0 03 00              ldi8	r3, 0x0
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 b6                    push16	r6
 b7                    push16	r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 be                    pop16	r6
 f0 06 f3 1a           ldi16	r2, 0x1af3
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 b6                    push16	r6
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+601
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 e0 34 07              jmp16	avm_test_main+2445
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 03                    mov	r4, r7
 d7 11                 sys	memset
 f0 06 b5 0a           ldi16	r2, 0xab5
 f0 03 00              ldi8	r3, 0x0
 c0 3a                 ldi8	r4, 0x3a
 c2 46                 ldi8	r6, 0x46
 c1 01                 ldi8	r5, 0x1
 b0                    push16	r0
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1f                 sys	draw_sprite_plus_mask
 c5 00 04              ldi16	r5, 0x400
 bf                    pop16	r7
 b8                    pop16	r0
 f0 06 f3 1e           ldi16	r2, 0x1ef3
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 b7                    push16	r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+698
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 d7 00                 sys	debug_putc
 e0 d3 06              jmp16	avm_test_main+2445
 03                    mov	r4, r7
 09                    mov	r6, r5
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c4 01 01              ldi16	r4, 0x101
 f0 06 f3 22           ldi16	r2, 0x22f3
 f0 03 00              ldi8	r3, 0x0
 c1 3f                 ldi8	r5, 0x3f
 c2 7f                 ldi8	r6, 0x7f
 b0                    push16	r0
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 b8                    pop16	r0
 f0 06 f9 24           ldi16	r2, 0x24f9
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 c6 00 04              ldi16	r6, 0x400
 b6                    push16	r6
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+794
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 37                 ldi8	r4, 0x37
 d7 00                 sys	debug_putc
 e0 73 06              jmp16	avm_test_main+2445
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 03                    mov	r4, r7
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 f0 06 f9 28           ldi16	r2, 0x28f9
 f0 03 00              ldi8	r3, 0x0
 c0 07                 ldi8	r4, 0x7
 c6 fc ff              ldi16	r6, 0xfffc
 b7                    push16	r7
 04                    mov	r5, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 f0 06 0d 29           ldi16	r2, 0x290d
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 c6 00 04              ldi16	r6, 0x400
 b6                    push16	r6
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+889
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 38                 ldi8	r4, 0x38
 d7 00                 sys	debug_putc
 e0 14 06              jmp16	avm_test_main+2445
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 03                    mov	r4, r7
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 f0 06 f9 28           ldi16	r2, 0x28f9
 f0 03 00              ldi8	r3, 0x0
 c0 3b                 ldi8	r4, 0x3b
 c2 7d                 ldi8	r6, 0x7d
 b7                    push16	r7
 04                    mov	r5, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 1f                 sys	draw_sprite_plus_mask
 c6 00 04              ldi16	r6, 0x400
 bf                    pop16	r7
 f0 06 0d 2d           ldi16	r2, 0x2d0d
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 b6                    push16	r6
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+983
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 39                 ldi8	r4, 0x39
 d7 00                 sys	debug_putc
 e0 b6 05              jmp16	avm_test_main+2445
 f1 0e                 mov	r1, r6
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 03                    mov	r4, r7
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 f0 06 0d 31           ldi16	r2, 0x310d
 f0 03 00              ldi8	r3, 0x0
 c4 f7 ff              ldi16	r4, 0xfff7
 c1 14                 ldi8	r5, 0x14
 b7                    push16	r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 f0 06 3f 31           ldi16	r2, 0x313f
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 28                 breq8	avm_test_main+1082
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 f4 40                 stsp16	[sp+0x0], r4
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 53 05              jmp16	avm_test_main+2445
 c7 00 04              ldi16	r7, 0x400
 f1 0f                 mov	r1, r7
 f1 29                 mov	r6, r1
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 03                    mov	r4, r7
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 f0 06 0d 31           ldi16	r2, 0x310d
 f0 03 00              ldi8	r3, 0x0
 c1 37                 ldi8	r5, 0x37
 c0 01                 ldi8	r4, 0x1
 c2 14                 ldi8	r6, 0x14
 b0                    push16	r0
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 b8                    pop16	r0
 f0 06 3f 35           ldi16	r2, 0x353f
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+1188
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 42                 ldi8	r4, 0x42
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 e9 04              jmp16	avm_test_main+2445
 c7 00 04              ldi16	r7, 0x400
 f1 0f                 mov	r1, r7
 f1 29                 mov	r6, r1
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 03                    mov	r4, r7
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 f0 06 3f 39           ldi16	r2, 0x393f
 f0 03 00              ldi8	r3, 0x0
 c0 1f                 ldi8	r4, 0x1f
 c5 ff ff              ldi16	r5, 0xffff
 c2 01                 ldi8	r6, 0x1
 b0                    push16	r0
 b5                    push16	r5
 b7                    push16	r7
 f1 2f                 mov	r7, r3
 f1 06                 mov	r0, r6
 f1 2a                 mov	r6, r2
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 bd                    pop16	r5
 b8                    pop16	r0
 f0 06 51 3d           ldi16	r2, 0x3d51
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 b5                    push16	r5
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 bd                    pop16	r5
 f6 2c                 tst16	r4
 d0 28                 breq8	avm_test_main+1305
 c0 43                 ldi8	r4, 0x43
 f4 40                 stsp16	[sp+0x0], r4
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 74 04              jmp16	avm_test_main+2445
 c7 00 04              ldi16	r7, 0x400
 0b                    mov	r6, r7
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 b5                    push16	r5
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 bd                    pop16	r5
 f1 21                 mov	r4, r1
 c3 a5                 ldi8	r7, 0xa5
 b5                    push16	r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bd                    pop16	r5
 f0 06 51 41           ldi16	r2, 0x4151
 f0 03 00              ldi8	r3, 0x0
 c0 3c                 ldi8	r4, 0x3c
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 1f                 sys	draw_sprite_plus_mask
 f0 06 d1 41           ldi16	r2, 0x41d1
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+1407
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 0e 04              jmp16	avm_test_main+2445
 c4 00 04              ldi16	r4, 0x400
 08                    mov	r6, r4
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c4 b5 0a              ldi16	r4, 0xab5
 c1 00                 ldi8	r5, 0x0
 c2 80                 ldi8	r6, 0x80
 c3 0a                 ldi8	r7, 0xa
 f1 14                 mov	r2, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 f1 15                 mov	r2, r5
 07                    mov	r5, r7
 f1 2e                 mov	r7, r2
 d7 1f                 sys	draw_sprite_plus_mask
 f0 06 d1 45           ldi16	r2, 0x45d1
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 28                 breq8	avm_test_main+1508
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 f4 40                 stsp16	[sp+0x0], r4
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 a9 03              jmp16	avm_test_main+2445
 c7 00 04              ldi16	r7, 0x400
 0b                    mov	r6, r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c4 b5 0a              ldi16	r4, 0xab5
 c1 00                 ldi8	r5, 0x0
 c2 0a                 ldi8	r6, 0xa
 c3 01                 ldi8	r7, 0x1
 f0 06 fb ff           ldi16	r2, 0xfffb
 b0                    push16	r0
 f1 07                 mov	r0, r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 22                 mov	r4, r2
 d7 1f                 sys	draw_sprite_plus_mask
 b8                    pop16	r0
 f0 06 d1 49           ldi16	r2, 0x49d1
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+1610
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 43 03              jmp16	avm_test_main+2445
 c4 00 04              ldi16	r4, 0x400
 08                    mov	r6, r4
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 f0 06 b5 0a           ldi16	r2, 0xab5
 f0 03 00              ldi8	r3, 0x0
 c6 f3 ff              ldi16	r6, 0xfff3
 c3 0a                 ldi8	r7, 0xa
 c0 02                 ldi8	r4, 0x2
 b0                    push16	r0
 b7                    push16	r7
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 f1 04                 mov	r0, r4
 03                    mov	r4, r7
 f1 2f                 mov	r7, r3
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 b8                    pop16	r0
 f0 06 d1 4d           ldi16	r2, 0x4dd1
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 b7                    push16	r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 29                 breq8	avm_test_main+1721
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c1 31                 ldi8	r5, 0x31
 b4                    push16	r4
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 bc                    pop16	r4
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 d4 02              jmp16	avm_test_main+2445
 c4 00 04              ldi16	r4, 0x400
 08                    mov	r6, r4
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c4 b5 0a              ldi16	r4, 0xab5
 c1 00                 ldi8	r5, 0x0
 c2 40                 ldi8	r6, 0x40
 f1 14                 mov	r2, r4
 03                    mov	r4, r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 1f                 sys	draw_sprite_plus_mask
 f0 06 d1 51           ldi16	r2, 0x51d1
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+1815
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 76 02              jmp16	avm_test_main+2445
 f1 0d                 mov	r1, r5
 f1 29                 mov	r6, r1
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 03                    mov	r4, r7
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c0 7b                 ldi8	r4, 0x7b
 f0 06 d1 55           ldi16	r2, 0x55d1
 f0 03 00              ldi8	r3, 0x0
 b0                    push16	r0
 b7                    push16	r7
 f1 24                 mov	r5, r0
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 14                 mov	r2, r4
 f1 20                 mov	r4, r0
 f1 02                 mov	r0, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 b8                    pop16	r0
 f0 06 d3 55           ldi16	r2, 0x55d3
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 28                 breq8	avm_test_main+1921
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 0c 02              jmp16	avm_test_main+2445
 c5 00 04              ldi16	r5, 0x400
 f1 0d                 mov	r1, r5
 f1 29                 mov	r6, r1
 c5 00 05              ldi16	r5, 0x500
 01                    mov	r4, r5
 b5                    push16	r5
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 bd                    pop16	r5
 01                    mov	r4, r5
 c3 a5                 ldi8	r7, 0xa5
 b5                    push16	r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 c4 c8 01              ldi16	r4, 0x1c8
 bd                    pop16	r5
 f0 06 d3 59           ldi16	r2, 0x59d3
 f0 03 00              ldi8	r3, 0x0
 b0                    push16	r0
 b5                    push16	r5
 f1 24                 mov	r5, r0
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 14                 mov	r2, r4
 f1 20                 mov	r4, r0
 f1 02                 mov	r0, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bd                    pop16	r5
 b8                    pop16	r0
 f0 06 d5 59           ldi16	r2, 0x59d5
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 01                    mov	r4, r5
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 28                 breq8	avm_test_main+2036
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 99 01              jmp16	avm_test_main+2445
 c7 00 04              ldi16	r7, 0x400
 f1 0f                 mov	r1, r7
 f1 29                 mov	r6, r1
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c0 f0                 ldi8	r4, 0xf0
 07                    mov	r5, r7
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 f0 06 3f 39           ldi16	r2, 0x393f
 f0 03 00              ldi8	r3, 0x0
 c2 18                 ldi8	r6, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 b7                    push16	r7
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 f0 06 d5 5d           ldi16	r2, 0x5dd5
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 28                 breq8	avm_test_main+2144
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 2d 01              jmp16	avm_test_main+2445
 c7 00 04              ldi16	r7, 0x400
 f1 0f                 mov	r1, r7
 f1 29                 mov	r6, r1
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c0 0f                 ldi8	r4, 0xf
 07                    mov	r5, r7
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 f0 06 51 41           ldi16	r2, 0x4151
 f0 03 00              ldi8	r3, 0x0
 c4 c0 ff              ldi16	r4, 0xffc0
 c1 49                 ldi8	r5, 0x49
 b5                    push16	r5
 b7                    push16	r7
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 bd                    pop16	r5
 f0 06 d5 61           ldi16	r2, 0x61d5
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 03                    mov	r4, r7
 b5                    push16	r5
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 bd                    pop16	r5
 f6 2c                 tst16	r4
 d0 28                 breq8	avm_test_main+2260
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 e0 b9 00              jmp16	avm_test_main+2445
 f0 06 00 04           ldi16	r2, 0x400
 f1 2a                 mov	r6, r2
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 b5                    push16	r5
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c0 55                 ldi8	r4, 0x55
 bd                    pop16	r5
 f1 2d                 mov	r7, r1
 b5                    push16	r5
 04                    mov	r5, r4
 03                    mov	r4, r7
 d7 11                 sys	memset
 bd                    pop16	r5
 c6 51 41              ldi16	r6, 0x4151
 c3 00                 ldi8	r7, 0x0
 c0 3f                 ldi8	r4, 0x3f
 f1 1c                 mov	r3, r4
 01                    mov	r4, r5
 f1 27                 mov	r5, r3
 d7 1f                 sys	draw_sprite_plus_mask
 c6 d5 65              ldi16	r6, 0x65d5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 26                 mov	r5, r2
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+2358
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 d4 57                 jmp8	avm_test_main+2445
 f1 2a                 mov	r6, r2
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c0 aa                 ldi8	r4, 0xaa
 f1 25                 mov	r5, r1
 f1 1c                 mov	r3, r4
 01                    mov	r4, r5
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c4 3f 39              ldi16	r4, 0x393f
 c1 00                 ldi8	r5, 0x0
 c2 04                 ldi8	r6, 0x4
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 20                 mov	r4, r0
 d7 1f                 sys	draw_sprite_plus_mask
 c6 d5 69              ldi16	r6, 0x69d5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 26                 mov	r5, r2
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 2c                 breq8	avm_test_main+2452
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
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 37                 ldi8	r4, 0x37
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 f0 00 01              ldi8	r0, 0x1
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 02                 adjsp	avm_test_main+2458
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
