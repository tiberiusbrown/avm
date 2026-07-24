
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_overwrite.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_overwrite.c
000009cd l     O .rodata	00000020 sprite_5x13
00006965 l     O .rodata	00000400 expected_00
000009ed l     O .rodata	00000400 expected_01
00000ded l     O .rodata	00000400 expected_02
000011ed l     O .rodata	00000400 expected_03
000015ed l     O .rodata	00000400 expected_04
000019ed l     O .rodata	00000400 expected_05
00001ded l     O .rodata	00000400 expected_06
000021ed l     O .rodata	00000104 sprite_1x1_many_frames
000022f1 l     O .rodata	00000400 expected_07
000026f1 l     O .rodata	0000000b sprite_9x8
000026fc l     O .rodata	00000400 expected_08
00002afc l     O .rodata	00000400 expected_09
00002efc l     O .rodata	0000001a sprite_4x17
00002f16 l     O .rodata	00000400 expected_10
00003316 l     O .rodata	00000400 expected_11
00003716 l     O .rodata	0000020a sprite_130x9
00003920 l     O .rodata	00000400 expected_12
00003d20 l     O .rodata	00000041 sprite_7x65
00003d61 l     O .rodata	00000400 expected_13
00004161 l     O .rodata	00000400 expected_14
00004561 l     O .rodata	00000400 expected_15
00004961 l     O .rodata	00000400 expected_16
00004d61 l     O .rodata	00000400 expected_17
00005161 l     O .rodata	00000002 sprite_zero_width
00005163 l     O .rodata	00000400 expected_18
00005563 l     O .rodata	00000002 sprite_zero_height
00005565 l     O .rodata	00000400 expected_19
00005965 l     O .rodata	00000400 expected_20
00005d65 l     O .rodata	00000400 expected_21
00006165 l     O .rodata	00000400 expected_22
00006565 l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000008b5 avm_test_main
000009cb g     F .text	00000002 avm_halt
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
 e1 b5 08              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 c7 00 04              ldi16	r7, 0x400
 f2 30                 sub	r0, r0
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 24                 mov	r5, r0
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 cd 09              ldi16	r4, 0x9cd
 c1 00                 ldi8	r5, 0x0
 f0 03 08              ldi8	r3, 0x8
 f0 02 0a              ldi8	r2, 0xa
 b7                    push16	r7
 08                    mov	r6, r4
 f1 22                 mov	r4, r2
 0d                    mov	r7, r5
 f1 27                 mov	r5, r3
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 65 69           ldi16	r0, 0x6965
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+95
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
 e0 fa 03              jmp16	avm_test_main+1113
 f0 05 00 04           ldi16	r1, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 29                 mov	r6, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 a5                 ldi8	r4, 0xa5
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 f0 00 01              ldi8	r0, 0x1
 c6 cd 09              ldi16	r6, 0x9cd
 c3 00                 ldi8	r7, 0x0
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 1e                 sys	draw_sprite_overwrite
 c6 ed 09              ldi16	r6, 0x9ed
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+182
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
 e0 a3 03              jmp16	avm_test_main+1113
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 3c                 ldi8	r4, 0x3c
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 f0 03 02              ldi8	r3, 0x2
 f0 04 cd 09           ldi16	r0, 0x9cd
 f0 01 00              ldi8	r1, 0x0
 c2 03                 ldi8	r6, 0x3
 c0 1b                 ldi8	r4, 0x1b
 b7                    push16	r7
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 ed 0d           ldi16	r0, 0xded
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+281
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
 e0 40 03              jmp16	avm_test_main+1113
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 f0 04 cd 09           ldi16	r0, 0x9cd
 f0 01 00              ldi8	r1, 0x0
 c2 13                 ldi8	r6, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 c1 01                 ldi8	r5, 0x1
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 b5                    push16	r5
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 b8                    pop16	r0
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 ed 11           ldi16	r0, 0x11ed
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+380
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
 e0 dd 02              jmp16	avm_test_main+1113
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 f0 04 cd 09           ldi16	r0, 0x9cd
 f0 01 00              ldi8	r1, 0x0
 c2 11                 ldi8	r6, 0x11
 c0 7e                 ldi8	r4, 0x7e
 b7                    push16	r7
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f1 03                 mov	r0, r3
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 ed 15           ldi16	r0, 0x15ed
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+476
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
 e0 7d 02              jmp16	avm_test_main+1113
 f0 07 00 04           ldi16	r3, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 af                    xor	r7, r7
 07                    mov	r5, r7
 f1 2b                 mov	r6, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 c3                 ldi8	r4, 0xc3
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 cd 09              ldi16	r4, 0x9cd
 c1 00                 ldi8	r5, 0x0
 f0 04 fb ff           ldi16	r0, 0xfffb
 c2 28                 ldi8	r6, 0x28
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 29                 mov	r6, r1
 f1 0d                 mov	r1, r5
 f1 24                 mov	r5, r0
 f1 07                 mov	r0, r7
 f1 2d                 mov	r7, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 04 ed 19           ldi16	r0, 0x19ed
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f1 27                 mov	r5, r3
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+580
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
 e0 15 02              jmp16	avm_test_main+1113
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 5a                 ldi8	r4, 0x5a
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 f0 04 cd 09           ldi16	r0, 0x9cd
 f0 01 00              ldi8	r1, 0x0
 c2 3a                 ldi8	r6, 0x3a
 c0 46                 ldi8	r4, 0x46
 c1 01                 ldi8	r5, 0x1
 b7                    push16	r7
 f1 2d                 mov	r7, r1
 f1 1d                 mov	r3, r5
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 03                 mov	r0, r3
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 ed 1d           ldi16	r0, 0x1ded
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+680
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
 e0 b1 01              jmp16	avm_test_main+1113
 f0 05 00 04           ldi16	r1, 0x400
 f2 30                 sub	r0, r0
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 01 01              ldi16	r4, 0x101
 c6 ed 21              ldi16	r6, 0x21ed
 c3 00                 ldi8	r7, 0x0
 f0 03 3f              ldi8	r3, 0x3f
 c1 7f                 ldi8	r5, 0x7f
 b0                    push16	r0
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 f1 27                 mov	r5, r3
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c6 f1 22              ldi16	r6, 0x22f1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+771
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
 e0 56 01              jmp16	avm_test_main+1113
 f0 07 00 04           ldi16	r3, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 24                 mov	r5, r0
 f1 2b                 mov	r6, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c1 3c                 ldi8	r5, 0x3c
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c6 f1 26              ldi16	r6, 0x26f1
 c3 00                 ldi8	r7, 0x0
 c1 07                 ldi8	r5, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 d7 1e                 sys	draw_sprite_overwrite
 c6 fc 26              ldi16	r6, 0x26fc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 27                 mov	r5, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+856
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
 e0 01 01              jmp16	avm_test_main+1113
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 24                 mov	r5, r0
 f1 2b                 mov	r6, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 c3                 ldi8	r4, 0xc3
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c6 f1 26              ldi16	r6, 0x26f1
 c3 00                 ldi8	r7, 0x0
 c1 3b                 ldi8	r5, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 d7 1e                 sys	draw_sprite_overwrite
 c6 fc 2a              ldi16	r6, 0x2afc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 27                 mov	r5, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+937
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
 e0 b0 00              jmp16	avm_test_main+1113
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 24                 mov	r5, r0
 f1 2b                 mov	r6, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c6 fc 2e              ldi16	r6, 0x2efc
 c3 00                 ldi8	r7, 0x0
 c5 f7 ff              ldi16	r5, 0xfff7
 f0 01 14              ldi8	r1, 0x14
 f1 21                 mov	r4, r1
 d7 1e                 sys	draw_sprite_overwrite
 c6 16 2f              ldi16	r6, 0x2f16
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 27                 mov	r5, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 22                 breq8	avm_test_main+1023
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
 d4 5a                 jmp8	avm_test_main+1113
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 fc 2e              ldi16	r4, 0x2efc
 c1 00                 ldi8	r5, 0x0
 c2 37                 ldi8	r6, 0x37
 f0 00 01              ldi8	r0, 0x1
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 21                 mov	r4, r1
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 16 33           ldi16	r0, 0x3316
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 30                 breq8	avm_test_main+1131
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
 f0 03 01              ldi8	r3, 0x1
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d6 02                 adjsp	avm_test_main+1128
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c7 00 04              ldi16	r7, 0x400
 f2 4b                 sub	r3, r3
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 27                 mov	r5, r3
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 5a                 ldi8	r4, 0x5a
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 16 37              ldi16	r4, 0x3716
 c1 00                 ldi8	r5, 0x0
 c2 1f                 ldi8	r6, 0x1f
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 00 01              ldi8	r0, 0x1
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 21                 mov	r4, r1
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 20 39           ldi16	r0, 0x3920
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 0b                 breq8	avm_test_main+1209
 c0 43                 ldi8	r4, 0x43
 f4 40                 stsp16	[sp+0x0], r4
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 e0 2c ff              jmp16	avm_test_main+997
 c6 00 04              ldi16	r6, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 27                 mov	r5, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 a5                 ldi8	r4, 0xa5
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 20 3d              ldi16	r4, 0x3d20
 c1 00                 ldi8	r5, 0x0
 c2 3c                 ldi8	r6, 0x3c
 c7 ff ff              ldi16	r7, 0xffff
 f1 03                 mov	r0, r3
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 29                 mov	r6, r1
 f1 0d                 mov	r1, r5
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 1e                 sys	draw_sprite_overwrite
 f0 04 61 3d           ldi16	r0, 0x3d61
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c5 00 04              ldi16	r5, 0x400
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1309
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
 e0 3c ff              jmp16	avm_test_main+1113
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 27                 mov	r5, r3
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 3c                 ldi8	r4, 0x3c
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 cd 09              ldi16	r4, 0x9cd
 c1 00                 ldi8	r5, 0x0
 c2 80                 ldi8	r6, 0x80
 b7                    push16	r7
 0d                    mov	r7, r5
 f1 26                 mov	r5, r2
 f1 03                 mov	r0, r3
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 29                 mov	r6, r1
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 61 41           ldi16	r0, 0x4161
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 13                 breq8	avm_test_main+1391
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 f4 40                 stsp16	[sp+0x0], r4
 e0 7e fe              jmp16	avm_test_main+1005
 c7 00 04              ldi16	r7, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 c3                 ldi8	r4, 0xc3
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 cd 09              ldi16	r4, 0x9cd
 c1 00                 ldi8	r5, 0x0
 f0 00 01              ldi8	r0, 0x1
 c6 fb ff              ldi16	r6, 0xfffb
 b7                    push16	r7
 0d                    mov	r7, r5
 f1 26                 mov	r5, r2
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 f1 29                 mov	r6, r1
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 61 45           ldi16	r0, 0x4561
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1488
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
 e0 89 fe              jmp16	avm_test_main+1113
 c7 00 04              ldi16	r7, 0x400
 aa                    xor	r6, r6
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 1e                 mov	r3, r6
 06                    mov	r5, r6
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 cd 09              ldi16	r4, 0x9cd
 c1 00                 ldi8	r5, 0x0
 c6 f3 ff              ldi16	r6, 0xfff3
 f0 00 02              ldi8	r0, 0x2
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 22                 mov	r4, r2
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 61 49           ldi16	r0, 0x4961
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1585
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
 f4 40                 stsp16	[sp+0x0], r4
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 c8 fd              jmp16	avm_test_main+1017
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 03                 mov	r0, r3
 f1 24                 mov	r5, r0
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 cd 09              ldi16	r4, 0x9cd
 c1 00                 ldi8	r5, 0x0
 c2 40                 ldi8	r6, 0x40
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 22                 mov	r4, r2
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 61 4d           ldi16	r0, 0x4d61
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1678
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
 e0 cb fd              jmp16	avm_test_main+1113
 f0 04 00 04           ldi16	r0, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 0b                 mov	r1, r3
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 5a                 ldi8	r4, 0x5a
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 7b                 ldi8	r4, 0x7b
 c6 61 51              ldi16	r6, 0x5161
 c3 00                 ldi8	r7, 0x0
 b0                    push16	r0
 f1 25                 mov	r5, r1
 f1 04                 mov	r0, r4
 f1 21                 mov	r4, r1
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c6 63 51              ldi16	r6, 0x5163
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1769
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
 e0 29 fa              jmp16	avm_test_main+274
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 0b                 mov	r1, r3
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 a5                 ldi8	r4, 0xa5
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 c8 01              ldi16	r4, 0x1c8
 c6 63 55              ldi16	r6, 0x5563
 c3 00                 ldi8	r7, 0x0
 b0                    push16	r0
 f1 25                 mov	r5, r1
 f1 04                 mov	r0, r4
 f1 21                 mov	r4, r1
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c6 65 55              ldi16	r6, 0x5565
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 24                 mov	r5, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1857
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
 e0 34 fa              jmp16	avm_test_main+373
 f0 06 00 04           ldi16	r2, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 2f                 mov	r7, r3
 07                    mov	r5, r7
 f1 2a                 mov	r6, r2
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 f0                 ldi8	r4, 0xf0
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 f0 04 16 37           ldi16	r0, 0x3716
 f0 01 00              ldi8	r1, 0x0
 c2 18                 ldi8	r6, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 f1 07                 mov	r0, r7
 f1 2d                 mov	r7, r1
 d7 1e                 sys	draw_sprite_overwrite
 c6 65 59              ldi16	r6, 0x5965
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 26                 mov	r5, r2
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1951
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
 e0 36 fa              jmp16	avm_test_main+469
 f0 05 00 04           ldi16	r1, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 2f                 mov	r7, r3
 07                    mov	r5, r7
 f1 29                 mov	r6, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 0f                 ldi8	r4, 0xf
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 20 3d              ldi16	r4, 0x3d20
 c1 00                 ldi8	r5, 0x0
 c6 c0 ff              ldi16	r6, 0xffc0
 f0 00 49              ldi8	r0, 0x49
 b0                    push16	r0
 f1 14                 mov	r2, r4
 f1 20                 mov	r4, r0
 f1 07                 mov	r0, r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 1e                 sys	draw_sprite_overwrite
 b8                    pop16	r0
 c6 65 5d              ldi16	r6, 0x5d65
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+2049
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
 e0 3c fa              jmp16	avm_test_main+573
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 2f                 mov	r7, r3
 07                    mov	r5, r7
 f1 29                 mov	r6, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 55                 ldi8	r4, 0x55
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 20 3d              ldi16	r4, 0x3d20
 c1 00                 ldi8	r5, 0x0
 c2 3f                 ldi8	r6, 0x3f
 f1 14                 mov	r2, r4
 f1 20                 mov	r4, r0
 f1 07                 mov	r0, r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 1e                 sys	draw_sprite_overwrite
 c6 65 61              ldi16	r6, 0x6165
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+2137
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
 e0 48 fa              jmp16	avm_test_main+673
 c7 00 04              ldi16	r7, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 40                 stsp16	[sp+0x0], r4
 f1 27                 mov	r5, r3
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c0 aa                 ldi8	r4, 0xaa
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 16 37              ldi16	r4, 0x3716
 c1 00                 ldi8	r5, 0x0
 c2 04                 ldi8	r6, 0x4
 b7                    push16	r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 08                    mov	r6, r4
 f1 23                 mov	r4, r3
 f1 03                 mov	r0, r3
 d7 1e                 sys	draw_sprite_overwrite
 bf                    pop16	r7
 f0 04 65 65           ldi16	r0, 0x6565
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 da cc fb              breq16	avm_test_main+1122
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
 e0 47 fa              jmp16	avm_test_main+764

<avm_halt>:
 d4 fe                 jmp8	avm_halt
