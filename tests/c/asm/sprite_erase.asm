
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_erase.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_erase.c
00000ab7 l     O .rodata	00000020 sprite_5x13
00000ad7 l     O .rodata	00000400 expected_00
00000ed7 l     O .rodata	00000400 expected_01
000012d7 l     O .rodata	00000400 expected_02
000016d7 l     O .rodata	00000400 expected_03
00001ad7 l     O .rodata	00000400 expected_04
00001ed7 l     O .rodata	00000400 expected_05
000022d7 l     O .rodata	00000400 expected_06
000026d7 l     O .rodata	00000104 sprite_1x1_many_frames
000027db l     O .rodata	00000400 expected_07
00002bdb l     O .rodata	0000000b sprite_9x8
00002be6 l     O .rodata	00000400 expected_08
00002fe6 l     O .rodata	00000400 expected_09
000033e6 l     O .rodata	0000001a sprite_4x17
00003400 l     O .rodata	00000400 expected_10
00003800 l     O .rodata	00000400 expected_11
00003c00 l     O .rodata	0000020a sprite_130x9
00003e0a l     O .rodata	00000400 expected_12
0000420a l     O .rodata	00000041 sprite_7x65
0000424b l     O .rodata	00000400 expected_13
0000464b l     O .rodata	00000400 expected_14
00004a4b l     O .rodata	00000400 expected_15
00004e4b l     O .rodata	00000400 expected_16
0000524b l     O .rodata	00000400 expected_17
0000564b l     O .rodata	00000002 sprite_zero_width
0000564d l     O .rodata	00000400 expected_18
00005a4d l     O .rodata	00000002 sprite_zero_height
00005a4f l     O .rodata	00000400 expected_19
00005e4f l     O .rodata	00000400 expected_20
0000624f l     O .rodata	00000400 expected_21
0000664f l     O .rodata	00000400 expected_22
00006a4f l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000099f avm_test_main
00000ab5 g     F .text	00000002 avm_halt
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
 e1 9f 09              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 c7 00 04              ldi16	r7, 0x400
 f2 4b                 sub	r3, r3
 f0 06 00 05           ldi16	r2, 0x500
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c1 ff                 ldi8	r5, 0xff
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 c1 08                 ldi8	r5, 0x8
 c2 0a                 ldi8	r6, 0xa
 b6                    push16	r6
 b7                    push16	r7
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 be                    pop16	r6
 f0 04 d7 0a           ldi16	r0, 0xad7
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b5                    push16	r5
 b6                    push16	r6
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 bd                    pop16	r5
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+113
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
 e0 1f 09              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 b5                    push16	r5
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c3 a5                 ldi8	r7, 0xa5
 bd                    pop16	r5
 f1 22                 mov	r4, r2
 b5                    push16	r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 c7 00 04              ldi16	r7, 0x400
 c2 0a                 ldi8	r6, 0xa
 c0 01                 ldi8	r4, 0x1
 bd                    pop16	r5
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 b6                    push16	r6
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 01                 mov	r0, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 be                    pop16	r6
 f0 04 d7 0e           ldi16	r0, 0xed7
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b6                    push16	r6
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 be                    pop16	r6
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+221
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
 e0 b3 08              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c1 3c                 ldi8	r5, 0x3c
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 c1 02                 ldi8	r5, 0x2
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 c2 1b                 ldi8	r6, 0x1b
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 05                 mov	r0, r5
 f1 25                 mov	r5, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 d7 12           ldi16	r0, 0x12d7
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+323
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
 c2 0a                 ldi8	r6, 0xa
 e0 4d 08              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c1 96                 ldi8	r5, 0x96
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 c0 13                 ldi8	r4, 0x13
 c6 fe ff              ldi16	r6, 0xfffe
 c1 01                 ldi8	r5, 0x1
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 05                 mov	r0, r5
 f1 25                 mov	r5, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 d7 16           ldi16	r0, 0x16d7
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+426
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
 c2 0a                 ldi8	r6, 0xa
 e0 e6 07              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c1 69                 ldi8	r5, 0x69
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 c0 11                 ldi8	r4, 0x11
 c2 7e                 ldi8	r6, 0x7e
 c1 02                 ldi8	r5, 0x2
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 05                 mov	r0, r5
 f1 25                 mov	r5, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 d7 1a           ldi16	r0, 0x1ad7
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+528
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
 c2 0a                 ldi8	r6, 0xa
 e0 80 07              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c1 c3                 ldi8	r5, 0xc3
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 b7                    push16	r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 d7 1e           ldi16	r0, 0x1ed7
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+624
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
 c2 0a                 ldi8	r6, 0xa
 e0 20 07              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 c0 3a                 ldi8	r4, 0x3a
 c2 46                 ldi8	r6, 0x46
 c1 01                 ldi8	r5, 0x1
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 05                 mov	r0, r5
 f1 25                 mov	r5, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 d7 22           ldi16	r0, 0x22d7
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+726
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
 c2 0a                 ldi8	r6, 0xa
 e0 ba 06              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 ff                 ldi8	r5, 0xff
 f4 02                 ldsp16	r6, [sp+0x0]
 d7 11                 sys	memset
 c4 01 01              ldi16	r4, 0x101
 f0 04 d7 26           ldi16	r0, 0x26d7
 f0 01 00              ldi8	r1, 0x0
 c1 3f                 ldi8	r5, 0x3f
 c2 7f                 ldi8	r6, 0x7f
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 01                 mov	r0, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 db 27           ldi16	r0, 0x27db
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+831
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
 c2 0a                 ldi8	r6, 0xa
 e0 51 06              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 f0 04 db 2b           ldi16	r0, 0x2bdb
 f0 01 00              ldi8	r1, 0x0
 c0 07                 ldi8	r4, 0x7
 c6 fc ff              ldi16	r6, 0xfffc
 b7                    push16	r7
 04                    mov	r5, r4
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 e6 2b           ldi16	r0, 0x2be6
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+929
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
 c2 0a                 ldi8	r6, 0xa
 e0 ef 05              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 f0 04 db 2b           ldi16	r0, 0x2bdb
 f0 01 00              ldi8	r1, 0x0
 c0 3b                 ldi8	r4, 0x3b
 c2 7d                 ldi8	r6, 0x7d
 b7                    push16	r7
 04                    mov	r5, r4
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 e6 2f           ldi16	r0, 0x2fe6
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1026
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
 c2 0a                 ldi8	r6, 0xa
 e0 8e 05              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 f0 04 e6 33           ldi16	r0, 0x33e6
 f0 01 00              ldi8	r1, 0x0
 c4 f7 ff              ldi16	r4, 0xfff7
 c1 14                 ldi8	r5, 0x14
 b7                    push16	r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 00 34           ldi16	r0, 0x3400
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1129
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
 c2 0a                 ldi8	r6, 0xa
 e0 27 05              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 f0 04 e6 33           ldi16	r0, 0x33e6
 f0 01 00              ldi8	r1, 0x0
 c1 37                 ldi8	r5, 0x37
 c0 01                 ldi8	r4, 0x1
 c2 14                 ldi8	r6, 0x14
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 01                 mov	r0, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 00 38           ldi16	r0, 0x3800
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1229
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
 c2 0a                 ldi8	r6, 0xa
 e0 c3 04              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 f0 04 00 3c           ldi16	r0, 0x3c00
 f0 01 00              ldi8	r1, 0x0
 c0 1f                 ldi8	r4, 0x1f
 c5 ff ff              ldi16	r5, 0xffff
 c2 01                 ldi8	r6, 0x1
 b5                    push16	r5
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 f1 0e                 mov	r1, r6
 f1 28                 mov	r6, r0
 f1 01                 mov	r0, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 bd                    pop16	r5
 f0 04 0a 3e           ldi16	r0, 0x3e0a
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b5                    push16	r5
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bd                    pop16	r5
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1338
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
 c2 0a                 ldi8	r6, 0xa
 e0 56 04              jmp16	avm_test_main+2448
 c4 00 04              ldi16	r4, 0x400
 08                    mov	r6, r4
 f1 22                 mov	r4, r2
 b5                    push16	r5
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 bd                    pop16	r5
 f1 22                 mov	r4, r2
 c3 a5                 ldi8	r7, 0xa5
 b5                    push16	r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bd                    pop16	r5
 f0 04 0a 42           ldi16	r0, 0x420a
 f0 01 00              ldi8	r1, 0x0
 c0 3c                 ldi8	r4, 0x3c
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 d7 21                 sys	draw_sprite_erase
 f0 04 4b 42           ldi16	r0, 0x424b
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 c5 00 04              ldi16	r5, 0x400
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1437
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
 c2 0a                 ldi8	r6, 0xa
 e0 f3 03              jmp16	avm_test_main+2448
 c7 00 04              ldi16	r7, 0x400
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 c2 80                 ldi8	r6, 0x80
 c0 0a                 ldi8	r4, 0xa
 b7                    push16	r7
 04                    mov	r5, r4
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 4b 46           ldi16	r0, 0x464b
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1539
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
 c2 0a                 ldi8	r6, 0xa
 e0 8d 03              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c4 b7 0a              ldi16	r4, 0xab7
 c1 00                 ldi8	r5, 0x0
 c2 0a                 ldi8	r6, 0xa
 c3 01                 ldi8	r7, 0x1
 f0 04 fb ff           ldi16	r0, 0xfffb
 b6                    push16	r6
 f1 0c                 mov	r1, r4
 f1 20                 mov	r4, r0
 f1 07                 mov	r0, r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 f1 29                 mov	r6, r1
 d7 21                 sys	draw_sprite_erase
 be                    pop16	r6
 f0 04 4b 4a           ldi16	r0, 0x4a4b
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 c5 00 04              ldi16	r5, 0x400
 b6                    push16	r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 be                    pop16	r6
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+1640
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
 e0 28 03              jmp16	avm_test_main+2448
 09                    mov	r6, r5
 f1 22                 mov	r4, r2
 b5                    push16	r5
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 bd                    pop16	r5
 f1 22                 mov	r4, r2
 c3 69                 ldi8	r7, 0x69
 b5                    push16	r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bd                    pop16	r5
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 c6 f3 ff              ldi16	r6, 0xfff3
 c0 0a                 ldi8	r4, 0xa
 c3 02                 ldi8	r7, 0x2
 b5                    push16	r5
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 07                 mov	r0, r7
 f1 2d                 mov	r7, r1
 d7 21                 sys	draw_sprite_erase
 bd                    pop16	r5
 f0 04 4b 4e           ldi16	r0, 0x4e4b
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 28                 breq8	avm_test_main+1744
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
 c2 0a                 ldi8	r6, 0xa
 e0 c0 02              jmp16	avm_test_main+2448
 09                    mov	r6, r5
 f1 22                 mov	r4, r2
 b5                    push16	r5
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 bd                    pop16	r5
 f1 22                 mov	r4, r2
 c3 96                 ldi8	r7, 0x96
 b5                    push16	r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 bd                    pop16	r5
 f0 04 b7 0a           ldi16	r0, 0xab7
 f0 01 00              ldi8	r1, 0x0
 c2 40                 ldi8	r6, 0x40
 c0 0a                 ldi8	r4, 0xa
 b5                    push16	r5
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 d7 21                 sys	draw_sprite_erase
 bd                    pop16	r5
 f0 04 4b 52           ldi16	r0, 0x524b
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1842
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
 c2 0a                 ldi8	r6, 0xa
 e0 5e 02              jmp16	avm_test_main+2448
 09                    mov	r6, r5
 f1 22                 mov	r4, r2
 b5                    push16	r5
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 bd                    pop16	r5
 f1 22                 mov	r4, r2
 c3 5a                 ldi8	r7, 0x5a
 b5                    push16	r5
 07                    mov	r5, r7
 d7 11                 sys	memset
 c0 7b                 ldi8	r4, 0x7b
 bd                    pop16	r5
 f0 04 4b 56           ldi16	r0, 0x564b
 f0 01 00              ldi8	r1, 0x0
 b5                    push16	r5
 f1 27                 mov	r5, r3
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 04                 mov	r0, r4
 f1 23                 mov	r4, r3
 d7 21                 sys	draw_sprite_erase
 bd                    pop16	r5
 f0 04 4d 56           ldi16	r0, 0x564d
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1943
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
 c2 0a                 ldi8	r6, 0xa
 e0 f9 01              jmp16	avm_test_main+2448
 c7 00 04              ldi16	r7, 0x400
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c4 c8 01              ldi16	r4, 0x1c8
 f0 04 4d 5a           ldi16	r0, 0x5a4d
 f0 01 00              ldi8	r1, 0x0
 b7                    push16	r7
 f1 27                 mov	r5, r3
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 04                 mov	r0, r4
 f1 23                 mov	r4, r3
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 4f 5a           ldi16	r0, 0x5a4f
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+2046
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
 c2 0a                 ldi8	r6, 0xa
 e0 92 01              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 ff                 ldi8	r5, 0xff
 d7 11                 sys	memset
 f0 04 00 3c           ldi16	r0, 0x3c00
 f0 01 00              ldi8	r1, 0x0
 c2 18                 ldi8	r6, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 b7                    push16	r7
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 4f 5e           ldi16	r0, 0x5e4f
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+2145
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
 c2 0a                 ldi8	r6, 0xa
 e0 2f 01              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c0 0f                 ldi8	r4, 0xf
 f1 26                 mov	r5, r2
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f0 04 0a 42           ldi16	r0, 0x420a
 f0 01 00              ldi8	r1, 0x0
 c4 c0 ff              ldi16	r4, 0xffc0
 c1 49                 ldi8	r5, 0x49
 b7                    push16	r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 4f 62           ldi16	r0, 0x624f
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+2253
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
 c2 0a                 ldi8	r6, 0xa
 e0 c3 00              jmp16	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 ff                 ldi8	r5, 0xff
 d7 11                 sys	memset
 f0 04 0a 42           ldi16	r0, 0x420a
 f0 01 00              ldi8	r1, 0x0
 c0 3f                 ldi8	r4, 0x3f
 c1 49                 ldi8	r5, 0x49
 b7                    push16	r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 f1 25                 mov	r5, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 4f 66           ldi16	r0, 0x664f
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 b7                    push16	r7
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 bf                    pop16	r7
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+2354
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
 c2 0a                 ldi8	r6, 0xa
 d4 5e                 jmp8	avm_test_main+2448
 0b                    mov	r6, r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 11                 sys	memset
 c0 aa                 ldi8	r4, 0xaa
 f1 26                 mov	r5, r2
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c4 00 3c              ldi16	r4, 0x3c00
 c1 00                 ldi8	r5, 0x0
 c2 04                 ldi8	r6, 0x4
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 23                 mov	r4, r3
 f1 03                 mov	r0, r3
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 4f 6a           ldi16	r0, 0x6a4f
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 22                 mov	r4, r2
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 2a                 breq8	avm_test_main+2454
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
 c2 0a                 ldi8	r6, 0xa
 f0 03 01              ldi8	r3, 0x1
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d6 02                 adjsp	avm_test_main+2460
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
