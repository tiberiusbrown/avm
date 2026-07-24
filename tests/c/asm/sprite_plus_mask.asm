
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_plus_mask.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_plus_mask.c
00000aeb l     O .rodata	0000003e sprite_5x13
00006e0b l     O .rodata	00000400 expected_00
00000b29 l     O .rodata	00000400 expected_01
00000f29 l     O .rodata	00000400 expected_02
00001329 l     O .rodata	00000400 expected_03
00001729 l     O .rodata	00000400 expected_04
00001b29 l     O .rodata	00000400 expected_05
00001f29 l     O .rodata	00000400 expected_06
00002329 l     O .rodata	00000206 sprite_1x1_many_frames
0000252f l     O .rodata	00000400 expected_07
0000292f l     O .rodata	00000014 sprite_9x8
00002943 l     O .rodata	00000400 expected_08
00002d43 l     O .rodata	00000400 expected_09
00003143 l     O .rodata	00000032 sprite_4x17
00003175 l     O .rodata	00000400 expected_10
00003575 l     O .rodata	00000400 expected_11
00003975 l     O .rodata	00000412 sprite_130x9
00003d87 l     O .rodata	00000400 expected_12
00004187 l     O .rodata	00000080 sprite_7x65
00004207 l     O .rodata	00000400 expected_13
00004607 l     O .rodata	00000400 expected_14
00004a07 l     O .rodata	00000400 expected_15
00004e07 l     O .rodata	00000400 expected_16
00005207 l     O .rodata	00000400 expected_17
00005607 l     O .rodata	00000002 sprite_zero_width
00005609 l     O .rodata	00000400 expected_18
00005a09 l     O .rodata	00000002 sprite_zero_height
00005a0b l     O .rodata	00000400 expected_19
00005e0b l     O .rodata	00000400 expected_20
0000620b l     O .rodata	00000400 expected_21
0000660b l     O .rodata	00000400 expected_22
00006a0b l     O .rodata	00000400 expected_23
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
 d7 1f                 sys	draw_sprite_plus_mask
 bf                    pop16	r7
 bc                    pop16	r4
 b8                    pop16	r0
 f0 06 0b 6e           ldi16	r2, 0x6e0b
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 29 0b              ldi16	r6, 0xb29
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 29 0f              ldi16	r6, 0xf29
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 29 13              ldi16	r6, 0x1329
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 29 17              ldi16	r6, 0x1729
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 29 1b              ldi16	r6, 0x1b29
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 29 1f              ldi16	r6, 0x1f29
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
 c6 29 23              ldi16	r6, 0x2329
 c3 00                 ldi8	r7, 0x0
 f0 03 3f              ldi8	r3, 0x3f
 c1 7f                 ldi8	r5, 0x7f
 b0                    push16	r0
 b4                    push16	r4
 01                    mov	r4, r5
 f1 27                 mov	r5, r3
 f1 02                 mov	r0, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 2f 25              ldi16	r6, 0x252f
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
 f0 06 2f 29           ldi16	r2, 0x292f
 f0 03 00              ldi8	r3, 0x0
 c1 07                 ldi8	r5, 0x7
 c6 fc ff              ldi16	r6, 0xfffc
 b0                    push16	r0
 b4                    push16	r4
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 43 29              ldi16	r6, 0x2943
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
 f0 06 2f 29           ldi16	r2, 0x292f
 f0 03 00              ldi8	r3, 0x0
 c1 3b                 ldi8	r5, 0x3b
 c2 7d                 ldi8	r6, 0x7d
 b0                    push16	r0
 b4                    push16	r4
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 43 2d              ldi16	r6, 0x2d43
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
 c6 43 31              ldi16	r6, 0x3143
 c3 00                 ldi8	r7, 0x0
 c5 f7 ff              ldi16	r5, 0xfff7
 f0 03 14              ldi8	r3, 0x14
 b0                    push16	r0
 b4                    push16	r4
 f1 04                 mov	r0, r4
 f1 23                 mov	r4, r3
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 75 31              ldi16	r6, 0x3175
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
 c6 43 31              ldi16	r6, 0x3143
 c3 00                 ldi8	r7, 0x0
 f0 02 37              ldi8	r2, 0x37
 c1 01                 ldi8	r5, 0x1
 b0                    push16	r0
 b4                    push16	r4
 f1 23                 mov	r4, r3
 f1 05                 mov	r0, r5
 f1 26                 mov	r5, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 75 35              ldi16	r6, 0x3575
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
 f0 06 75 39           ldi16	r2, 0x3975
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 87 3d              ldi16	r6, 0x3d87
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
 c6 87 41              ldi16	r6, 0x4187
 c3 00                 ldi8	r7, 0x0
 c1 3c                 ldi8	r5, 0x3c
 f0 06 ff ff           ldi16	r2, 0xffff
 b0                    push16	r0
 b4                    push16	r4
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 f1 26                 mov	r5, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 07 42              ldi16	r6, 0x4207
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 07 46              ldi16	r6, 0x4607
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 07 4a              ldi16	r6, 0x4a07
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 07 4e              ldi16	r6, 0x4e07
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
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 07 52              ldi16	r6, 0x5207
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
 c6 07 56              ldi16	r6, 0x5607
 c3 00                 ldi8	r7, 0x0
 b0                    push16	r0
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 d7 1f                 sys	draw_sprite_plus_mask
 b8                    pop16	r0
 c6 09 56              ldi16	r6, 0x5609
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
 c6 09 5a              ldi16	r6, 0x5a09
 c3 00                 ldi8	r7, 0x0
 b0                    push16	r0
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 d7 1f                 sys	draw_sprite_plus_mask
 b8                    pop16	r0
 c6 0b 5a              ldi16	r6, 0x5a0b
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
 f0 06 75 39           ldi16	r2, 0x3975
 f0 03 00              ldi8	r3, 0x0
 c1 18                 ldi8	r5, 0x18
 c6 7f ff              ldi16	r6, 0xff7f
 b0                    push16	r0
 b4                    push16	r4
 f1 2f                 mov	r7, r3
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 0b 5e              ldi16	r6, 0x5e0b
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
 c6 87 41              ldi16	r6, 0x4187
 c3 00                 ldi8	r7, 0x0
 c5 c0 ff              ldi16	r5, 0xffc0
 f0 02 49              ldi8	r2, 0x49
 b0                    push16	r0
 b4                    push16	r4
 f1 04                 mov	r0, r4
 f1 22                 mov	r4, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 0b 62              ldi16	r6, 0x620b
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
 c6 87 41              ldi16	r6, 0x4187
 c3 00                 ldi8	r7, 0x0
 c1 3f                 ldi8	r5, 0x3f
 b0                    push16	r0
 b4                    push16	r4
 f1 04                 mov	r0, r4
 f1 22                 mov	r4, r2
 d7 1f                 sys	draw_sprite_plus_mask
 bc                    pop16	r4
 b8                    pop16	r0
 c6 0b 66              ldi16	r6, 0x660b
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
 c6 75 39              ldi16	r6, 0x3975
 c3 00                 ldi8	r7, 0x0
 c1 04                 ldi8	r5, 0x4
 b0                    push16	r0
 f1 04                 mov	r0, r4
 d7 1f                 sys	draw_sprite_plus_mask
 b8                    pop16	r0
 c6 0b 6a              ldi16	r6, 0x6a0b
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
