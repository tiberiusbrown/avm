
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_overwrite.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_overwrite.c
00000aeb l     O .rodata	00000020 sprite_5x13
00006a83 l     O .rodata	00000400 expected_00
00000b0b l     O .rodata	00000400 expected_01
00000f0b l     O .rodata	00000400 expected_02
0000130b l     O .rodata	00000400 expected_03
0000170b l     O .rodata	00000400 expected_04
00001b0b l     O .rodata	00000400 expected_05
00001f0b l     O .rodata	00000400 expected_06
0000230b l     O .rodata	00000104 sprite_1x1_many_frames
0000240f l     O .rodata	00000400 expected_07
0000280f l     O .rodata	0000000b sprite_9x8
0000281a l     O .rodata	00000400 expected_08
00002c1a l     O .rodata	00000400 expected_09
0000301a l     O .rodata	0000001a sprite_4x17
00003034 l     O .rodata	00000400 expected_10
00003434 l     O .rodata	00000400 expected_11
00003834 l     O .rodata	0000020a sprite_130x9
00003a3e l     O .rodata	00000400 expected_12
00003e3e l     O .rodata	00000041 sprite_7x65
00003e7f l     O .rodata	00000400 expected_13
0000427f l     O .rodata	00000400 expected_14
0000467f l     O .rodata	00000400 expected_15
00004a7f l     O .rodata	00000400 expected_16
00004e7f l     O .rodata	00000400 expected_17
0000527f l     O .rodata	00000002 sprite_zero_width
00005281 l     O .rodata	00000400 expected_18
00005681 l     O .rodata	00000002 sprite_zero_height
00005683 l     O .rodata	00000400 expected_19
00005a83 l     O .rodata	00000400 expected_20
00005e83 l     O .rodata	00000400 expected_21
00006283 l     O .rodata	00000400 expected_22
00006683 l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000009d3 avm_test_main
00000ae9 g     F .text	00000002 avm_halt
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
 e1 d3 09              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 f0 05 00 04           ldi16	r1, 0x400
 a0                    xor	r4, r4
 f0 04 00 05           ldi16	r0, 0x500
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 29                 mov	r6, r1
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 eb 0a           ldi16	r2, 0xaeb
 f0 03 00              ldi8	r3, 0x0
 c1 08                 ldi8	r5, 0x8
 c3 0a                 ldi8	r7, 0xa
 b0                    push16	r0
 b4                    push16	r4
 b7                    push16	r7
 f1 2a                 mov	r6, r2
 f1 04                 mov	r0, r4
 03                    mov	r4, r7
 f1 2f                 mov	r7, r3
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 bc                    pop16	r4
 b8                    pop16	r0
 f0 06 83 6a           ldi16	r2, 0x6a83
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f1 28                 mov	r6, r0
 b4                    push16	r4
 b5                    push16	r5
 b7                    push16	r7
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 08                    mov	r6, r4
 bf                    pop16	r7
 bd                    pop16	r5
 bc                    pop16	r4
 f6 2e                 tst16	r6
 d0 21                 breq8	avm_test_main+118
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
 e0 4f 09              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 17                 mov	r2, r7
 f1 2c                 mov	r7, r0
 b4                    push16	r4
 b5                    push16	r5
 04                    mov	r5, r4
 03                    mov	r4, r7
 d7 11                 sys	memset
 f0 03 a5              ldi8	r3, 0xa5
 bd                    pop16	r5
 bc                    pop16	r4
 f1 2c                 mov	r7, r0
 b4                    push16	r4
 b5                    push16	r5
 03                    mov	r4, r7
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f0 03 01              ldi8	r3, 0x1
 bd                    pop16	r5
 bc                    pop16	r4
 c6 eb 0a              ldi16	r6, 0xaeb
 c3 00                 ldi8	r7, 0x0
 b0                    push16	r0
 b4                    push16	r4
 f1 22                 mov	r4, r2
 f1 03                 mov	r0, r3
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 0b 0b              ldi16	r6, 0xb0b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+222
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
 c3 0a                 ldi8	r7, 0xa
 e0 e7 08              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c1 3c                 ldi8	r5, 0x3c
 bc                    pop16	r4
 f1 2c                 mov	r7, r0
 b4                    push16	r4
 03                    mov	r4, r7
 d7 11                 sys	memset
 f0 02 02              ldi8	r2, 0x2
 bc                    pop16	r4
 c6 eb 0a              ldi16	r6, 0xaeb
 c3 00                 ldi8	r7, 0x0
 c1 03                 ldi8	r5, 0x3
 f0 03 1b              ldi8	r3, 0x1b
 b0                    push16	r0
 b4                    push16	r4
 f1 23                 mov	r4, r3
 f1 02                 mov	r0, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 0b 0f              ldi16	r6, 0xf0b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+325
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
 c3 0a                 ldi8	r7, 0xa
 e0 80 08              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c3 96                 ldi8	r7, 0x96
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 eb 0a           ldi16	r2, 0xaeb
 f0 03 00              ldi8	r3, 0x0
 c1 13                 ldi8	r5, 0x13
 c6 fe ff              ldi16	r6, 0xfffe
 c3 01                 ldi8	r7, 0x1
 b0                    push16	r0
 b4                    push16	r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 f1 07                 mov	r0, r7
 f1 2f                 mov	r7, r3
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 0b 13              ldi16	r6, 0x130b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+433
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
 c3 0a                 ldi8	r7, 0xa
 e0 14 08              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c3 69                 ldi8	r7, 0x69
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 eb 0a           ldi16	r2, 0xaeb
 f0 03 00              ldi8	r3, 0x0
 c1 11                 ldi8	r5, 0x11
 c2 7e                 ldi8	r6, 0x7e
 c3 02                 ldi8	r7, 0x2
 b0                    push16	r0
 b4                    push16	r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 f1 07                 mov	r0, r7
 f1 2f                 mov	r7, r3
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 0b 17              ldi16	r6, 0x170b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+540
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
 c3 0a                 ldi8	r7, 0xa
 e0 a9 07              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c3 c3                 ldi8	r7, 0xc3
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 c6 eb 0a              ldi16	r6, 0xaeb
 c3 00                 ldi8	r7, 0x0
 f0 06 fb ff           ldi16	r2, 0xfffb
 c1 28                 ldi8	r5, 0x28
 b0                    push16	r0
 b4                    push16	r4
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 0b 1b              ldi16	r6, 0x1b0b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+643
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
 c3 0a                 ldi8	r7, 0xa
 e0 42 07              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c3 5a                 ldi8	r7, 0x5a
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 eb 0a           ldi16	r2, 0xaeb
 f0 03 00              ldi8	r3, 0x0
 c1 3a                 ldi8	r5, 0x3a
 c3 46                 ldi8	r7, 0x46
 c2 01                 ldi8	r6, 0x1
 b0                    push16	r0
 b4                    push16	r4
 03                    mov	r4, r7
 f1 2f                 mov	r7, r3
 f1 06                 mov	r0, r6
 f1 2a                 mov	r6, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 0b 1f              ldi16	r6, 0x1f0b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+750
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
 c3 0a                 ldi8	r7, 0xa
 e0 d7 06              jmp16	avm_test_main+2501
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 29                 mov	r6, r1
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 f0 06 01 01           ldi16	r2, 0x101
 bc                    pop16	r4
 c6 0b 23              ldi16	r6, 0x230b
 c3 00                 ldi8	r7, 0x0
 f0 03 3f              ldi8	r3, 0x3f
 c1 7f                 ldi8	r5, 0x7f
 b0                    push16	r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 27                 mov	r5, r3
 f1 02                 mov	r0, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 0f 24              ldi16	r6, 0x240f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+846
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
 c3 0a                 ldi8	r7, 0xa
 e0 77 06              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 3c                 ldi8	r7, 0x3c
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 0f 28           ldi16	r2, 0x280f
 f0 03 00              ldi8	r3, 0x0
 c1 07                 ldi8	r5, 0x7
 c6 fc ff              ldi16	r6, 0xfffc
 b0                    push16	r0
 b4                    push16	r4
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 1a 28              ldi16	r6, 0x281a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+952
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
 c3 0a                 ldi8	r7, 0xa
 e0 0d 06              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 c3                 ldi8	r7, 0xc3
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 0f 28           ldi16	r2, 0x280f
 f0 03 00              ldi8	r3, 0x0
 c1 3b                 ldi8	r5, 0x3b
 c2 7d                 ldi8	r6, 0x7d
 b0                    push16	r0
 b4                    push16	r4
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 1a 2c              ldi16	r6, 0x2c1a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+1057
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
 c3 0a                 ldi8	r7, 0xa
 e0 a4 05              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 69                 ldi8	r7, 0x69
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 c6 1a 30              ldi16	r6, 0x301a
 c3 00                 ldi8	r7, 0x0
 c5 f7 ff              ldi16	r5, 0xfff7
 f0 03 14              ldi8	r3, 0x14
 b0                    push16	r0
 b4                    push16	r4
 f1 04                 mov	r0, r4
 f1 23                 mov	r4, r3
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 34 30              ldi16	r6, 0x3034
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 27                 breq8	avm_test_main+1161
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
 c3 0a                 ldi8	r7, 0xa
 e0 3c 05              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 96                 ldi8	r7, 0x96
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 c6 1a 30              ldi16	r6, 0x301a
 c3 00                 ldi8	r7, 0x0
 f0 02 37              ldi8	r2, 0x37
 c1 01                 ldi8	r5, 0x1
 b0                    push16	r0
 b4                    push16	r4
 f1 23                 mov	r4, r3
 f1 05                 mov	r0, r5
 f1 26                 mov	r5, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 34 34              ldi16	r6, 0x3434
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+1264
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
 c3 0a                 ldi8	r7, 0xa
 e0 d5 04              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 5a                 ldi8	r7, 0x5a
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 34 38           ldi16	r2, 0x3834
 f0 03 00              ldi8	r3, 0x0
 c1 1f                 ldi8	r5, 0x1f
 c7 ff ff              ldi16	r7, 0xffff
 c2 01                 ldi8	r6, 0x1
 b0                    push16	r0
 b4                    push16	r4
 03                    mov	r4, r7
 f1 2f                 mov	r7, r3
 f1 06                 mov	r0, r6
 f1 2a                 mov	r6, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 3e 3a              ldi16	r6, 0x3a3e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 27                 breq8	avm_test_main+1374
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
 c3 0a                 ldi8	r7, 0xa
 e0 67 04              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 a5                 ldi8	r7, 0xa5
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 c6 3e 3e              ldi16	r6, 0x3e3e
 c3 00                 ldi8	r7, 0x0
 c1 3c                 ldi8	r5, 0x3c
 f0 06 ff ff           ldi16	r2, 0xffff
 b0                    push16	r0
 b4                    push16	r4
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 7f 3e              ldi16	r6, 0x3e7f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+1477
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
 c3 0a                 ldi8	r7, 0xa
 e0 00 04              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 3c                 ldi8	r7, 0x3c
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 eb 0a           ldi16	r2, 0xaeb
 f0 03 00              ldi8	r3, 0x0
 c1 80                 ldi8	r5, 0x80
 c2 0a                 ldi8	r6, 0xa
 b0                    push16	r0
 b4                    push16	r4
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 7f 42              ldi16	r6, 0x427f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 27                 breq8	avm_test_main+1585
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
 c3 0a                 ldi8	r7, 0xa
 e0 94 03              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 c3                 ldi8	r7, 0xc3
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 c6 eb 0a              ldi16	r6, 0xaeb
 c3 00                 ldi8	r7, 0x0
 c1 0a                 ldi8	r5, 0xa
 f0 02 01              ldi8	r2, 0x1
 f0 07 fb ff           ldi16	r3, 0xfffb
 b0                    push16	r0
 b4                    push16	r4
 f1 23                 mov	r4, r3
 f1 02                 mov	r0, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 7f 46              ldi16	r6, 0x467f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+1690
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
 c3 0a                 ldi8	r7, 0xa
 e0 2b 03              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 69                 ldi8	r7, 0x69
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 eb 0a           ldi16	r2, 0xaeb
 f0 03 00              ldi8	r3, 0x0
 c5 f3 ff              ldi16	r5, 0xfff3
 c2 0a                 ldi8	r6, 0xa
 c3 02                 ldi8	r7, 0x2
 b0                    push16	r0
 b4                    push16	r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 f1 07                 mov	r0, r7
 f1 2f                 mov	r7, r3
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 7f 4a              ldi16	r6, 0x4a7f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 28                 breq8	avm_test_main+1801
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
 c3 0a                 ldi8	r7, 0xa
 e0 bc 02              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 96                 ldi8	r7, 0x96
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 eb 0a           ldi16	r2, 0xaeb
 f0 03 00              ldi8	r3, 0x0
 c1 40                 ldi8	r5, 0x40
 c2 0a                 ldi8	r6, 0xa
 b0                    push16	r0
 b4                    push16	r4
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 7f 4e              ldi16	r6, 0x4e7f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 25                 breq8	avm_test_main+1906
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
 c3 0a                 ldi8	r7, 0xa
 e0 53 02              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 5a                 ldi8	r7, 0x5a
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 c1 7b                 ldi8	r5, 0x7b
 bc                    pop16	r4
 c6 7f 52              ldi16	r6, 0x527f
 c3 00                 ldi8	r7, 0x0
 b0                    push16	r0
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c6 81 52              ldi16	r6, 0x5281
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 27                 breq8	avm_test_main+2003
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
 c3 0a                 ldi8	r7, 0xa
 e0 f2 01              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 bc                    pop16	r4
 f1 24                 mov	r5, r0
 c3 a5                 ldi8	r7, 0xa5
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 c5 c8 01              ldi16	r5, 0x1c8
 bc                    pop16	r4
 c6 81 56              ldi16	r6, 0x5681
 c3 00                 ldi8	r7, 0x0
 b0                    push16	r0
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c6 83 56              ldi16	r6, 0x5683
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 27                 breq8	avm_test_main+2101
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
 c3 0a                 ldi8	r7, 0xa
 e0 90 01              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c1 f0                 ldi8	r5, 0xf0
 bc                    pop16	r4
 f1 2c                 mov	r7, r0
 b4                    push16	r4
 03                    mov	r4, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 f0 06 34 38           ldi16	r2, 0x3834
 f0 03 00              ldi8	r3, 0x0
 c1 18                 ldi8	r5, 0x18
 c6 7f ff              ldi16	r6, 0xff7f
 b0                    push16	r0
 b4                    push16	r4
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 83 5a              ldi16	r6, 0x5a83
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 27                 breq8	avm_test_main+2208
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
 c3 0a                 ldi8	r7, 0xa
 e0 25 01              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c1 0f                 ldi8	r5, 0xf
 bc                    pop16	r4
 f1 2c                 mov	r7, r0
 b4                    push16	r4
 03                    mov	r4, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 c6 3e 3e              ldi16	r6, 0x3e3e
 c3 00                 ldi8	r7, 0x0
 c5 c0 ff              ldi16	r5, 0xffc0
 f0 02 49              ldi8	r2, 0x49
 b0                    push16	r0
 b4                    push16	r4
 f1 04                 mov	r0, r4
 f1 22                 mov	r4, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 83 5e              ldi16	r6, 0x5e83
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 27                 breq8	avm_test_main+2311
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
 c3 0a                 ldi8	r7, 0xa
 e0 be 00              jmp16	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 1c                 mov	r3, r4
 01                    mov	r4, r5
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c1 55                 ldi8	r5, 0x55
 bc                    pop16	r4
 f1 2c                 mov	r7, r0
 b4                    push16	r4
 03                    mov	r4, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 c6 3e 3e              ldi16	r6, 0x3e3e
 c3 00                 ldi8	r7, 0x0
 c1 3f                 ldi8	r5, 0x3f
 b0                    push16	r0
 b4                    push16	r4
 f1 04                 mov	r0, r4
 f1 22                 mov	r4, r2
 d7 1e                 sys	draw_sprite_overwrite
 bc                    pop16	r4
 b8                    pop16	r0
 c6 83 62              ldi16	r6, 0x6283
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 04                    mov	r5, r4
 bc                    pop16	r4
 f6 2d                 tst16	r5
 d0 26                 breq8	avm_test_main+2409
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
 c3 0a                 ldi8	r7, 0xa
 d4 5c                 jmp8	avm_test_main+2501
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 b4                    push16	r4
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c1 aa                 ldi8	r5, 0xaa
 bc                    pop16	r4
 f1 2c                 mov	r7, r0
 b4                    push16	r4
 03                    mov	r4, r7
 d7 11                 sys	memset
 bc                    pop16	r4
 c6 34 38              ldi16	r6, 0x3834
 c3 00                 ldi8	r7, 0x0
 c1 04                 ldi8	r5, 0x4
 b0                    push16	r0
 f1 04                 mov	r0, r4
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c6 83 66              ldi16	r6, 0x6683
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 b4                    push16	r4
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f1 04                 mov	r0, r4
 bc                    pop16	r4
 f6 28                 tst16	r0
 d0 2b                 breq8	avm_test_main+2508
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
 c3 0a                 ldi8	r7, 0xa
 c0 01                 ldi8	r4, 0x1
 b4                    push16	r4
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 bc                    pop16	r4
 d6 02                 adjsp	avm_test_main+2512
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
