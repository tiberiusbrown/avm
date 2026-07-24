
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_erase.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_erase.c
00000a0d l     O .rodata	00000020 sprite_5x13
00000a2d l     O .rodata	00000400 expected_00
00000e2d l     O .rodata	00000400 expected_01
0000122d l     O .rodata	00000400 expected_02
0000162d l     O .rodata	00000400 expected_03
00001a2d l     O .rodata	00000400 expected_04
00001e2d l     O .rodata	00000400 expected_05
0000222d l     O .rodata	00000400 expected_06
0000262d l     O .rodata	00000104 sprite_1x1_many_frames
00002731 l     O .rodata	00000400 expected_07
00002b31 l     O .rodata	0000000b sprite_9x8
00002b3c l     O .rodata	00000400 expected_08
00002f3c l     O .rodata	00000400 expected_09
0000333c l     O .rodata	0000001a sprite_4x17
00003356 l     O .rodata	00000400 expected_10
00003756 l     O .rodata	00000400 expected_11
00003b56 l     O .rodata	0000020a sprite_130x9
00003d60 l     O .rodata	00000400 expected_12
00004160 l     O .rodata	00000041 sprite_7x65
000041a1 l     O .rodata	00000400 expected_13
000045a1 l     O .rodata	00000400 expected_14
000049a1 l     O .rodata	00000400 expected_15
00004da1 l     O .rodata	00000400 expected_16
000051a1 l     O .rodata	00000400 expected_17
000055a1 l     O .rodata	00000002 sprite_zero_width
000055a3 l     O .rodata	00000400 expected_18
000059a3 l     O .rodata	00000002 sprite_zero_height
000059a5 l     O .rodata	00000400 expected_19
00005da5 l     O .rodata	00000400 expected_20
000061a5 l     O .rodata	00000400 expected_21
000065a5 l     O .rodata	00000400 expected_22
000069a5 l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000008f5 avm_test_main
00000a0b g     F .text	00000002 avm_halt
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
 e1 f5 08              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	avm_test_main
 c7 00 04              ldi16	r7, 0x400
 f2 30                 sub	r0, r0
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 ff                 ldi8	r4, 0xff
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 0d 0a              ldi16	r4, 0xa0d
 c1 00                 ldi8	r5, 0x0
 f0 02 08              ldi8	r2, 0x8
 f0 03 0a              ldi8	r3, 0xa
 b7                    push16	r7
 08                    mov	r6, r4
 f1 23                 mov	r4, r3
 0d                    mov	r7, r5
 f1 26                 mov	r5, r2
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 2d 0a           ldi16	r0, 0xa2d
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+102
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
 e0 33 04              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 a5                 ldi8	r4, 0xa5
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 f0 00 01              ldi8	r0, 0x1
 c4 0d 0a              ldi16	r4, 0xa0d
 c1 00                 ldi8	r5, 0x0
 b7                    push16	r7
 08                    mov	r6, r4
 f1 23                 mov	r4, r3
 0d                    mov	r7, r5
 f1 26                 mov	r5, r2
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f1 10                 mov	r2, r0
 f0 04 2d 0e           ldi16	r0, 0xe2d
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+196
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
 e0 d5 03              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 3c                 ldi8	r4, 0x3c
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c1 02                 ldi8	r5, 0x2
 f0 04 0d 0a           ldi16	r0, 0xa0d
 f0 01 00              ldi8	r1, 0x0
 c2 03                 ldi8	r6, 0x3
 c0 1b                 ldi8	r4, 0x1b
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 b5                    push16	r5
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 b8                    pop16	r0
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 2d 12           ldi16	r0, 0x122d
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+294
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
 e0 73 03              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 f0 04 0d 0a           ldi16	r0, 0xa0d
 f0 01 00              ldi8	r1, 0x0
 c2 13                 ldi8	r6, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 b7                    push16	r7
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 02                 mov	r0, r2
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 2d 16           ldi16	r0, 0x162d
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+391
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
 e0 12 03              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 f2 42                 sub	r2, r2
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 26                 mov	r5, r2
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 f0 04 0d 0a           ldi16	r0, 0xa0d
 f0 01 00              ldi8	r1, 0x0
 c2 11                 ldi8	r6, 0x11
 c0 7e                 ldi8	r4, 0x7e
 c1 02                 ldi8	r5, 0x2
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 b5                    push16	r5
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 b8                    pop16	r0
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 2d 1a           ldi16	r0, 0x1a2d
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+492
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
 e0 ad 02              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 26                 mov	r5, r2
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 c3                 ldi8	r4, 0xc3
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 0d 0a              ldi16	r4, 0xa0d
 c1 00                 ldi8	r5, 0x0
 f0 04 fb ff           ldi16	r0, 0xfffb
 c2 28                 ldi8	r6, 0x28
 b7                    push16	r7
 0d                    mov	r7, r5
 f1 24                 mov	r5, r0
 f1 02                 mov	r0, r2
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 29                 mov	r6, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 2d 1e           ldi16	r0, 0x1e2d
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+592
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
 e0 49 02              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 5a                 ldi8	r4, 0x5a
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 f0 04 0d 0a           ldi16	r0, 0xa0d
 f0 01 00              ldi8	r1, 0x0
 c2 3a                 ldi8	r6, 0x3a
 c0 46                 ldi8	r4, 0x46
 c1 01                 ldi8	r5, 0x1
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 b5                    push16	r5
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 b8                    pop16	r0
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 2d 22           ldi16	r0, 0x222d
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+690
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
 e0 e7 01              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 26                 mov	r5, r2
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 ff                 ldi8	r4, 0xff
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 f0 04 01 01           ldi16	r0, 0x101
 c4 2d 26              ldi16	r4, 0x262d
 c1 00                 ldi8	r5, 0x0
 f0 01 3f              ldi8	r1, 0x3f
 c2 7f                 ldi8	r6, 0x7f
 b7                    push16	r7
 0d                    mov	r7, r5
 f1 25                 mov	r5, r1
 b4                    push16	r4
 02                    mov	r4, r6
 be                    pop16	r6
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 31 27           ldi16	r0, 0x2731
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+789
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
 e0 84 01              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 26                 mov	r5, r2
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c1 3c                 ldi8	r5, 0x3c
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 f0 04 31 2b           ldi16	r0, 0x2b31
 f0 01 00              ldi8	r1, 0x0
 c2 07                 ldi8	r6, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 b7                    push16	r7
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 02                 mov	r0, r2
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 3c 2b           ldi16	r0, 0x2b3c
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+886
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
 e0 23 01              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 26                 mov	r5, r2
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 c3                 ldi8	r4, 0xc3
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 f0 04 31 2b           ldi16	r0, 0x2b31
 f0 01 00              ldi8	r1, 0x0
 c2 3b                 ldi8	r6, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 b7                    push16	r7
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 02                 mov	r0, r2
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 3c 2f           ldi16	r0, 0x2f3c
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+983
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
 e0 c2 00              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 26                 mov	r5, r2
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 3c 33              ldi16	r4, 0x333c
 c1 00                 ldi8	r5, 0x0
 c6 f7 ff              ldi16	r6, 0xfff7
 f0 00 14              ldi8	r0, 0x14
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 20                 mov	r4, r0
 f1 02                 mov	r0, r2
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 56 33           ldi16	r0, 0x3356
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 22                 breq8	avm_test_main+1081
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 f4 50                 stsp16	[sp+0x4], r4
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
 f4 10                 ldsp16	r4, [sp+0x4]
 d4 60                 jmp8	avm_test_main+1177
 f0 06 00 04           ldi16	r2, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 2a                 mov	r6, r2
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 3c 33              ldi16	r4, 0x333c
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c1 37                 ldi8	r5, 0x37
 f0 00 01              ldi8	r0, 0x1
 c0 14                 ldi8	r4, 0x14
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d7 21                 sys	draw_sprite_erase
 f0 04 56 37           ldi16	r0, 0x3756
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 26                 mov	r5, r2
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 30                 breq8	avm_test_main+1195
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
 f0 02 01              ldi8	r2, 0x1
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d6 06                 adjsp	avm_test_main+1196
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c7 00 04              ldi16	r7, 0x400
 f2 42                 sub	r2, r2
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 26                 mov	r5, r2
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 5a                 ldi8	r4, 0x5a
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 56 3b              ldi16	r4, 0x3b56
 c1 00                 ldi8	r5, 0x0
 c2 1f                 ldi8	r6, 0x1f
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 00 01              ldi8	r0, 0x1
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 21                 mov	r4, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 60 3d           ldi16	r0, 0x3d60
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 0b                 breq8	avm_test_main+1273
 c0 43                 ldi8	r4, 0x43
 f4 50                 stsp16	[sp+0x4], r4
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 e0 26 ff              jmp16	avm_test_main+1055
 c6 00 04              ldi16	r6, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 26                 mov	r5, r2
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 a5                 ldi8	r4, 0xa5
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 60 41              ldi16	r4, 0x4160
 c1 00                 ldi8	r5, 0x0
 c2 3c                 ldi8	r6, 0x3c
 c7 ff ff              ldi16	r7, 0xffff
 f1 02                 mov	r0, r2
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 29                 mov	r6, r1
 f1 0d                 mov	r1, r5
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 21                 sys	draw_sprite_erase
 f0 04 a1 41           ldi16	r0, 0x41a1
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c5 00 04              ldi16	r5, 0x400
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1373
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
 e0 3c ff              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 26                 mov	r5, r2
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 3c                 ldi8	r4, 0x3c
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 0d 0a              ldi16	r4, 0xa0d
 c1 00                 ldi8	r5, 0x0
 c2 80                 ldi8	r6, 0x80
 b7                    push16	r7
 0d                    mov	r7, r5
 f1 27                 mov	r5, r3
 f1 02                 mov	r0, r2
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 29                 mov	r6, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 a1 45           ldi16	r0, 0x45a1
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 13                 breq8	avm_test_main+1455
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 f4 50                 stsp16	[sp+0x4], r4
 e0 78 fe              jmp16	avm_test_main+1063
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 c3                 ldi8	r4, 0xc3
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 0d 0a              ldi16	r4, 0xa0d
 c1 00                 ldi8	r5, 0x0
 f0 00 01              ldi8	r0, 0x1
 c6 fb ff              ldi16	r6, 0xfffb
 b7                    push16	r7
 0d                    mov	r7, r5
 f1 27                 mov	r5, r3
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 29                 mov	r6, r1
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 a1 49           ldi16	r0, 0x49a1
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1552
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
 e0 89 fe              jmp16	avm_test_main+1177
 c7 00 04              ldi16	r7, 0x400
 aa                    xor	r6, r6
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 16                 mov	r2, r6
 06                    mov	r5, r6
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 0d 0a              ldi16	r4, 0xa0d
 c1 00                 ldi8	r5, 0x0
 c6 f3 ff              ldi16	r6, 0xfff3
 f0 00 02              ldi8	r0, 0x2
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 23                 mov	r4, r3
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 a1 4d           ldi16	r0, 0x4da1
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1649
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
 f4 50                 stsp16	[sp+0x4], r4
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 c2 fd              jmp16	avm_test_main+1075
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 02                 mov	r0, r2
 f1 24                 mov	r5, r0
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 0d 0a              ldi16	r4, 0xa0d
 c1 00                 ldi8	r5, 0x0
 c2 40                 ldi8	r6, 0x40
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 23                 mov	r4, r3
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 a1 51           ldi16	r0, 0x51a1
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1742
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
 e0 cb fd              jmp16	avm_test_main+1177
 f0 04 00 04           ldi16	r0, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 0a                 mov	r1, r2
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 5a                 ldi8	r4, 0x5a
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 7b                 ldi8	r4, 0x7b
 c6 a1 55              ldi16	r6, 0x55a1
 c3 00                 ldi8	r7, 0x0
 b0                    push16	r0
 f1 25                 mov	r5, r1
 f1 04                 mov	r0, r4
 f1 21                 mov	r4, r1
 d7 21                 sys	draw_sprite_erase
 b8                    pop16	r0
 c6 a3 55              ldi16	r6, 0x55a3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1833
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
 e0 f6 f9              jmp16	avm_test_main+287
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 0a                 mov	r1, r2
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 a5                 ldi8	r4, 0xa5
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 c8 01              ldi16	r4, 0x1c8
 c6 a3 59              ldi16	r6, 0x59a3
 c3 00                 ldi8	r7, 0x0
 b0                    push16	r0
 f1 25                 mov	r5, r1
 f1 04                 mov	r0, r4
 f1 21                 mov	r4, r1
 d7 21                 sys	draw_sprite_erase
 b8                    pop16	r0
 c6 a5 59              ldi16	r6, 0x59a5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1921
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
 e0 ff f9              jmp16	avm_test_main+384
 f0 07 00 04           ldi16	r3, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 2e                 mov	r7, r2
 07                    mov	r5, r7
 f1 2b                 mov	r6, r3
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 ff                 ldi8	r4, 0xff
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 f0 04 56 3b           ldi16	r0, 0x3b56
 f0 01 00              ldi8	r1, 0x0
 c2 18                 ldi8	r6, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 07                 mov	r0, r7
 f1 2d                 mov	r7, r1
 d7 21                 sys	draw_sprite_erase
 c6 a5 5d              ldi16	r6, 0x5da5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 27                 mov	r5, r3
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+2015
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
 e0 06 fa              jmp16	avm_test_main+485
 f0 05 00 04           ldi16	r1, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 2e                 mov	r7, r2
 07                    mov	r5, r7
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 0f                 ldi8	r4, 0xf
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 60 41              ldi16	r4, 0x4160
 c1 00                 ldi8	r5, 0x0
 c6 c0 ff              ldi16	r6, 0xffc0
 f0 00 49              ldi8	r0, 0x49
 b0                    push16	r0
 f1 1c                 mov	r3, r4
 f1 20                 mov	r4, r0
 f1 07                 mov	r0, r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 f1 2b                 mov	r6, r3
 d7 21                 sys	draw_sprite_erase
 b8                    pop16	r0
 c6 a5 61              ldi16	r6, 0x61a5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+2113
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
 e0 08 fa              jmp16	avm_test_main+585
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 2e                 mov	r7, r2
 07                    mov	r5, r7
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 ff                 ldi8	r4, 0xff
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 60 41              ldi16	r4, 0x4160
 c1 00                 ldi8	r5, 0x0
 c2 3f                 ldi8	r6, 0x3f
 f1 1c                 mov	r3, r4
 f1 20                 mov	r4, r0
 f1 07                 mov	r0, r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 f1 2b                 mov	r6, r3
 d7 21                 sys	draw_sprite_erase
 c6 a5 65              ldi16	r6, 0x65a5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+2201
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
 e0 12 fa              jmp16	avm_test_main+683
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 26                 mov	r5, r2
 0b                    mov	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 aa                 ldi8	r4, 0xaa
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c4 56 3b              ldi16	r4, 0x3b56
 c1 00                 ldi8	r5, 0x0
 c2 04                 ldi8	r6, 0x4
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 22                 mov	r4, r2
 f1 02                 mov	r0, r2
 d7 21                 sys	draw_sprite_erase
 bf                    pop16	r7
 f0 04 a5 69           ldi16	r0, 0x69a5
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 da cc fb              breq16	avm_test_main+1186
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
 e0 19 fa              jmp16	avm_test_main+782

<avm_halt>:
 d4 fe                 jmp8	avm_halt
