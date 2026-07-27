
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_cached_erase.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_cached_erase.c
00000989 l     O .rodata	00000020 sprite_a
00000489 l     F .text	0000010e compare_one
00000597 l     F .text	0000010b test_repeated_draws_one_binding
000006a2 l     F .text	0000012d test_rebinding
000007cf l     F .text	00000149 test_explicit_draw_does_not_rebind
000009a9 l     O .rodata	00000002 sprite_zero_width
00000918 l     F .text	0000006f test_zero_dimension
000009ab l     O .rodata	00000002 sprite_zero_height
000009ad l     O .rodata	00000014 sprite_b
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000373 avm_test_main
00000987 g     F .text	00000002 avm_halt
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
 e1 71 08              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f0 04 00 04           ldi16	r0, 0x400
 f0 01 a6              ldi8	r1, 0xa6
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 43                    ld8u	r4, [r7]
 f5 21                 cmp	r4, r1
 db 80 02              brne16	avm_test_main+676
 f4 af                 inc16	r7
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 f2                 brne8	avm_test_main+30
 c6 00 04              ldi16	r6, 0x400
 f2 30                 sub	r0, r0
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 f0 06 89 09           ldi16	r2, 0x989
 f0 03 00              ldi8	r3, 0x0
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f1 28                 mov	r6, r0
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d7 21                 sys	draw_sprite_erase
 c7 37 9e              ldi16	r7, 0x9e37
 c4 1c 81              ldi16	r4, 0x811c
 f1 18                 mov	r3, r0
 f0 6c c3              ld8u	r6, [r1+]
 1e                    add	r7, r6
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f2 2b                 add	r6, r3
 a2                    xor	r4, r6
 f2 2c                 add	r7, r0
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 fa 67                 lsl16i	r7, 0x7
 9d                    or	r7, r5
 f4 ab                 inc16	r3
 ac                    xor	r7, r4
 f0 08 02              addi.s8	r0, 0x2
 c5 00 08              ldi16	r5, 0x800
 f5 05                 cmp	r0, r5
 d1 de                 brne8	avm_test_main+94
 f4 40                 stsp16	[sp+0x0], r4
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f2 4b                 sub	r3, r3
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f1 27                 mov	r5, r3
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 f1 2b                 mov	r6, r3
 d7 26                 sys	draw_erase
 c6 37 9e              ldi16	r6, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f1 13                 mov	r2, r3
 f0 6c 03              ld8u	r0, [r1+]
 f2 28                 add	r6, r0
 f4 49                 stsp16	[sp+0x2], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 fa 7b                 lsr16i	r4, 0xb
 f4 48                 stsp16	[sp+0x2], r4
 fa 45                 lsl16i	r5, 0x5
 f4 08                 ldsp16	r4, [sp+0x2]
 94                    or	r5, r4
 f2 02                 add	r0, r2
 f9 a2                 xor	r5, r0
 f0 04 00 08           ldi16	r0, 0x800
 f2 2b                 add	r6, r3
 02                    mov	r4, r6
 fa 79                 lsr16i	r4, 0x9
 fa 57                 lsl16i	r6, 0x7
 98                    or	r6, r4
 f4 aa                 inc16	r2
 a9                    xor	r6, r5
 f0 0b 02              addi.s8	r3, 0x2
 f5 18                 cmp	r3, r0
 d1 d4                 brne8	avm_test_main+168
 f4 00                 ldsp16	r4, [sp+0x0]
 31                    cmp	r4, r5
 db ec 01              brne16	avm_test_main+710
 3e                    cmp	r7, r6
 db e8 01              brne16	avm_test_main+710
 c1 a5                 ldi8	r5, 0xa5
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c2 01                 ldi8	r6, 0x1
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 f0 06 89 09           ldi16	r2, 0x989
 f0 03 00              ldi8	r3, 0x0
 d7 21                 sys	draw_sprite_erase
 c7 37 9e              ldi16	r7, 0x9e37
 c4 1c 81              ldi16	r4, 0x811c
 f2 4b                 sub	r3, r3
 f1 13                 mov	r2, r3
 f0 6c c3              ld8u	r6, [r1+]
 1e                    add	r7, r6
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f2 2a                 add	r6, r2
 a2                    xor	r4, r6
 f2 2f                 add	r7, r3
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 fa 67                 lsl16i	r7, 0x7
 9d                    or	r7, r5
 f4 aa                 inc16	r2
 ac                    xor	r7, r4
 f0 0b 02              addi.s8	r3, 0x2
 f5 18                 cmp	r3, r0
 d1 e1                 brne8	avm_test_main+260
 f4 40                 stsp16	[sp+0x0], r4
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 c1 a5                 ldi8	r5, 0xa5
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 c2 01                 ldi8	r6, 0x1
 d7 26                 sys	draw_erase
 c6 37 9e              ldi16	r6, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f2 4b                 sub	r3, r3
 f1 13                 mov	r2, r3
 f0 6c 21              ld8u	r1, [r0+]
 f2 29                 add	r6, r1
 f4 49                 stsp16	[sp+0x2], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 fa 7b                 lsr16i	r4, 0xb
 f4 48                 stsp16	[sp+0x2], r4
 fa 45                 lsl16i	r5, 0x5
 f4 08                 ldsp16	r4, [sp+0x2]
 94                    or	r5, r4
 f2 0a                 add	r1, r2
 f9 a6                 xor	r5, r1
 f2 2b                 add	r6, r3
 02                    mov	r4, r6
 fa 79                 lsr16i	r4, 0x9
 fa 57                 lsl16i	r6, 0x7
 98                    or	r6, r4
 f4 aa                 inc16	r2
 a9                    xor	r6, r5
 f0 0b 02              addi.s8	r3, 0x2
 c4 00 08              ldi16	r4, 0x800
 f5 1c                 cmp	r3, r4
 d1 d5                 brne8	avm_test_main+331
 f4 00                 ldsp16	r4, [sp+0x0]
 31                    cmp	r4, r5
 db 77 01              brne16	avm_test_main+755
 3e                    cmp	r7, r6
 db 73 01              brne16	avm_test_main+755
 c1 3c                 ldi8	r5, 0x3c
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 f0 01 02              ldi8	r1, 0x2
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 f0 06 89 09           ldi16	r2, 0x989
 f0 03 00              ldi8	r3, 0x0
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f1 29                 mov	r6, r1
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d7 21                 sys	draw_sprite_erase
 c7 37 9e              ldi16	r7, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f2 39                 sub	r1, r1
 f1 11                 mov	r2, r1
 f0 07 00 08           ldi16	r3, 0x800
 f0 6c 81              ld8u	r4, [r0+]
 1c                    add	r7, r4
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f2 22                 add	r4, r2
 a4                    xor	r5, r4
 f2 2d                 add	r7, r1
 03                    mov	r4, r7
 fa 79                 lsr16i	r4, 0x9
 fa 67                 lsl16i	r7, 0x7
 9c                    or	r7, r4
 f4 aa                 inc16	r2
 ad                    xor	r7, r5
 f0 09 02              addi.s8	r1, 0x2
 f5 0b                 cmp	r1, r3
 d1 e1                 brne8	avm_test_main+441
 f4 41                 stsp16	[sp+0x0], r5
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 c1 3c                 ldi8	r5, 0x3c
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c0 1b                 ldi8	r4, 0x1b
 c1 03                 ldi8	r5, 0x3
 c2 02                 ldi8	r6, 0x2
 d7 26                 sys	draw_erase
 c6 37 9e              ldi16	r6, 0x9e37
 c4 1c 81              ldi16	r4, 0x811c
 f2 4b                 sub	r3, r3
 f1 13                 mov	r2, r3
 f0 6c 21              ld8u	r1, [r0+]
 f2 29                 add	r6, r1
 f4 48                 stsp16	[sp+0x2], r4
 f4 09                 ldsp16	r5, [sp+0x2]
 fa 8b                 lsr16i	r5, 0xb
 f4 49                 stsp16	[sp+0x2], r5
 fa 35                 lsl16i	r4, 0x5
 f4 09                 ldsp16	r5, [sp+0x2]
 91                    or	r4, r5
 f2 0a                 add	r1, r2
 f9 86                 xor	r4, r1
 f2 2b                 add	r6, r3
 06                    mov	r5, r6
 fa 89                 lsr16i	r5, 0x9
 fa 57                 lsl16i	r6, 0x7
 99                    or	r6, r5
 f4 aa                 inc16	r2
 a8                    xor	r6, r4
 f0 0b 02              addi.s8	r3, 0x2
 c5 00 08              ldi16	r5, 0x800
 f5 1d                 cmp	r3, r5
 d1 d5                 brne8	avm_test_main+512
 f4 01                 ldsp16	r5, [sp+0x0]
 34                    cmp	r5, r4
 db ea 00              brne16	avm_test_main+795
 3e                    cmp	r7, r6
 db e6 00              brne16	avm_test_main+795
 d6 fb                 adjsp	-0x5
 f0 06 89 09           ldi16	r2, 0x989
 f0 03 00              ldi8	r3, 0x0
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 2b 02              stsp8	[sp+0x2], r3
 c0 01                 ldi8	r4, 0x1
 f1 04                 mov	r0, r4
 f4 4c                 stsp16	[sp+0x3], r4
 c0 04                 ldi8	r4, 0x4
 c1 96                 ldi8	r5, 0x96
 c6 fe ff              ldi16	r6, 0xfffe
 c7 fb ff              ldi16	r7, 0xfffb
 e1 1c 01              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 d1 43                 brne8	avm_test_main+672
 d6 fb                 adjsp	-0x5
 c0 02                 ldi8	r4, 0x2
 f4 4c                 stsp16	[sp+0x3], r4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 2b 02              stsp8	[sp+0x2], r3
 c0 05                 ldi8	r4, 0x5
 c1 69                 ldi8	r5, 0x69
 c2 7e                 ldi8	r6, 0x7e
 c3 3a                 ldi8	r7, 0x3a
 e1 ff 00              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 d1 26                 brne8	avm_test_main+672
 e1 04 02              call16	test_repeated_draws_one_binding
 f4 a4                 tst8	r4
 d1 1f                 brne8	avm_test_main+672
 e1 08 03              call16	test_rebinding
 f4 a4                 tst8	r4
 d1 18                 brne8	avm_test_main+672
 e1 2e 04              call16	test_explicit_draw_does_not_rebind
 f4 a4                 tst8	r4
 d1 11                 brne8	avm_test_main+672
 c6 a9 09              ldi16	r6, 0x9a9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c0 09                 ldi8	r4, 0x9
 e1 67 05              call16	test_zero_dimension
 f4 a4                 tst8	r4
 da a3 00              breq16	avm_test_main+835
 f1 20                 mov	r4, r0
 d4 48                 jmp8	avm_test_main+748
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
 c0 0a                 ldi8	r4, 0xa
 d4 22                 jmp8	avm_test_main+744
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
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
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
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 d4 d1                 jmp8	avm_test_main+748
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
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 d4 a9                 jmp8	avm_test_main+748
 c6 ab 09              ldi16	r6, 0x9ab
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c0 0a                 ldi8	r4, 0xa
 e1 b3 04              call16	test_zero_dimension
 f4 a4                 tst8	r4
 f1 20                 mov	r4, r0
 d1 97                 brne8	avm_test_main+748
 d6 fb                 adjsp	-0x5
 c0 01                 ldi8	r4, 0x1
 f4 4c                 stsp16	[sp+0x3], r4
 c4 ad 09              ldi16	r4, 0x9ad
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0b                 ldi8	r4, 0xb
 c1 c3                 ldi8	r5, 0xc3
 c2 80                 ldi8	r6, 0x80
 c3 40                 ldi8	r7, 0x40
 d5 05                 call8	compare_one
 d6 05                 adjsp	0x5
 e0 79 ff              jmp16	avm_test_main+748

<compare_one>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f0 3f 10              stsp16	[sp+0x10], r7
 f1 1e                 mov	r3, r6
 f4 40                 stsp16	[sp+0x0], r4
 f0 37 20              ldsp16	r7, [sp+0x20]
 f0 30 1d              ldsp16	r0, [sp+0x1d]
 f0 19 1f              ldsp8u	r1, [sp+0x1f]
 c6 00 04              ldi16	r6, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 59                 stsp16	[sp+0x6], r5
 d7 11                 sys	memset
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 23                 mov	r4, r3
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f2 64                 mov32	q1, q0
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 63                 stsp16	[sp+0x8], r7
 0b                    mov	r6, r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 d7 21                 sys	draw_sprite_erase
 f0 06 00 05           ldi16	r2, 0x500
 c7 37 9e              ldi16	r7, 0x9e37
 c4 1c 81              ldi16	r4, 0x811c
 f2 30                 sub	r0, r0
 f1 08                 mov	r1, r0
 f0 6c a5              ld8u	r5, [r2+]
 1d                    add	r7, r5
 08                    mov	r6, r4
 fa 9b                 lsr16i	r6, 0xb
 fa 35                 lsl16i	r4, 0x5
 92                    or	r4, r6
 f2 25                 add	r5, r1
 a1                    xor	r4, r5
 f2 2c                 add	r7, r0
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 fa 67                 lsl16i	r7, 0x7
 9d                    or	r7, r5
 f4 a9                 inc16	r1
 ac                    xor	r7, r4
 f0 08 02              addi.s8	r0, 0x2
 c5 00 08              ldi16	r5, 0x800
 f5 05                 cmp	r0, r5
 d1 de                 brne8	compare_one+79
 f4 70                 stsp16	[sp+0xc], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 22                 sys	set_sprite
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 22                 ldsp16	r6, [sp+0x8]
 d7 26                 sys	draw_erase
 c5 37 9e              ldi16	r5, 0x9e37
 c6 1c 81              ldi16	r6, 0x811c
 f2 39                 sub	r1, r1
 f1 11                 mov	r2, r1
 f0 6c 61              ld8u	r3, [r0+]
 f2 27                 add	r5, r3
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 fa 7b                 lsr16i	r4, 0xb
 f0 3c 10              stsp16	[sp+0x10], r4
 fa 55                 lsl16i	r6, 0x5
 f0 34 10              ldsp16	r4, [sp+0x10]
 98                    or	r6, r4
 f2 1a                 add	r3, r2
 f9 ce                 xor	r6, r3
 c4 00 08              ldi16	r4, 0x800
 f1 1c                 mov	r3, r4
 f2 25                 add	r5, r1
 01                    mov	r4, r5
 fa 79                 lsr16i	r4, 0x9
 fa 47                 lsl16i	r5, 0x7
 94                    or	r5, r4
 f4 aa                 inc16	r2
 a6                    xor	r5, r6
 f0 09 02              addi.s8	r1, 0x2
 f5 0b                 cmp	r1, r3
 d1 cf                 brne8	compare_one+153
 f4 30                 ldsp16	r4, [sp+0xc]
 32                    cmp	r4, r6
 d1 06                 brne8	compare_one+213
 3d                    cmp	r7, r5
 d1 03                 brne8	compare_one+213
 a0                    xor	r4, r4
 d4 32                 jmp8	compare_one+263
 c0 30                 ldi8	r4, 0x30
 f4 01                 ldsp16	r5, [sp+0x0]
 91                    or	r4, r5
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
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
 01                    mov	r4, r5
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_repeated_draws_one_binding>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 c6 00 04              ldi16	r6, 0x400
 c1 3c                 ldi8	r5, 0x3c
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 f2 30                 sub	r0, r0
 f0 06 89 09           ldi16	r2, 0x989
 f0 03 00              ldi8	r3, 0x0
 c1 05                 ldi8	r5, 0x5
 c0 04                 ldi8	r4, 0x4
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f1 28                 mov	r6, r0
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d7 21                 sys	draw_sprite_erase
 c2 01                 ldi8	r6, 0x1
 c1 0a                 ldi8	r5, 0xa
 c0 1f                 ldi8	r4, 0x1f
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d7 21                 sys	draw_sprite_erase
 c2 02                 ldi8	r6, 0x2
 c1 13                 ldi8	r5, 0x13
 c0 44                 ldi8	r4, 0x44
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d7 21                 sys	draw_sprite_erase
 c4 37 9e              ldi16	r4, 0x9e37
 c6 1c 81              ldi16	r6, 0x811c
 f1 18                 mov	r3, r0
 f0 6c a3              ld8u	r5, [r1+]
 11                    add	r4, r5
 0e                    mov	r7, r6
 fa ab                 lsr16i	r7, 0xb
 fa 55                 lsl16i	r6, 0x5
 9b                    or	r6, r7
 f2 27                 add	r5, r3
 a9                    xor	r6, r5
 f2 20                 add	r4, r0
 04                    mov	r5, r4
 fa 89                 lsr16i	r5, 0x9
 fa 37                 lsl16i	r4, 0x7
 91                    or	r4, r5
 f4 ab                 inc16	r3
 a2                    xor	r4, r6
 f0 08 02              addi.s8	r0, 0x2
 c5 00 08              ldi16	r5, 0x800
 f5 05                 cmp	r0, r5
 d1 de                 brne8	test_repeated_draws_one_binding+84
 f4 42                 stsp16	[sp+0x0], r6
 f4 48                 stsp16	[sp+0x2], r4
 f1 05                 mov	r0, r5
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 f2 4b                 sub	r3, r3
 c0 04                 ldi8	r4, 0x4
 c1 05                 ldi8	r5, 0x5
 f1 2b                 mov	r6, r3
 d7 26                 sys	draw_erase
 c0 1f                 ldi8	r4, 0x1f
 c1 0a                 ldi8	r5, 0xa
 c2 01                 ldi8	r6, 0x1
 d7 26                 sys	draw_erase
 c0 44                 ldi8	r4, 0x44
 c1 13                 ldi8	r5, 0x13
 c2 02                 ldi8	r6, 0x2
 d7 26                 sys	draw_erase
 c5 37 9e              ldi16	r5, 0x9e37
 c7 1c 81              ldi16	r7, 0x811c
 f1 13                 mov	r2, r3
 f0 6c 83              ld8u	r4, [r1+]
 14                    add	r5, r4
 0b                    mov	r6, r7
 fa 9b                 lsr16i	r6, 0xb
 fa 65                 lsl16i	r7, 0x5
 9e                    or	r7, r6
 f2 22                 add	r4, r2
 ac                    xor	r7, r4
 f2 27                 add	r5, r3
 01                    mov	r4, r5
 fa 79                 lsr16i	r4, 0x9
 fa 47                 lsl16i	r5, 0x7
 94                    or	r5, r4
 f4 aa                 inc16	r2
 a7                    xor	r5, r7
 f0 0b 02              addi.s8	r3, 0x2
 f5 18                 cmp	r3, r0
 d1 e1                 brne8	test_repeated_draws_one_binding+178
 f4 00                 ldsp16	r4, [sp+0x0]
 33                    cmp	r4, r7
 f4 08                 ldsp16	r4, [sp+0x2]
 d1 06                 brne8	test_repeated_draws_one_binding+222
 31                    cmp	r4, r5
 d1 03                 brne8	test_repeated_draws_one_binding+222
 a0                    xor	r4, r4
 d4 26                 jmp8	test_repeated_draws_one_binding+260
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
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_rebinding>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c6 00 04              ldi16	r6, 0x400
 c1 69                 ldi8	r5, 0x69
 c4 00 05              ldi16	r4, 0x500
 f4 58                 stsp16	[sp+0x6], r4
 d7 11                 sys	memset
 c2 01                 ldi8	r6, 0x1
 f0 06 89 09           ldi16	r2, 0x989
 f0 03 00              ldi8	r3, 0x0
 c1 07                 ldi8	r5, 0x7
 c0 02                 ldi8	r4, 0x2
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d7 21                 sys	draw_sprite_erase
 f2 30                 sub	r0, r0
 f0 06 ad 09           ldi16	r2, 0x9ad
 f0 03 00              ldi8	r3, 0x0
 c1 17                 ldi8	r5, 0x17
 c0 36                 ldi8	r4, 0x36
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f1 28                 mov	r6, r0
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d7 21                 sys	draw_sprite_erase
 c1 31                 ldi8	r5, 0x31
 c0 65                 ldi8	r4, 0x65
 c6 89 09              ldi16	r6, 0x989
 c3 00                 ldi8	r7, 0x0
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 21                 sys	draw_sprite_erase
 c4 37 9e              ldi16	r4, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f1 08                 mov	r1, r0
 f0 06 00 08           ldi16	r2, 0x800
 f4 1a                 ldsp16	r6, [sp+0x6]
 f7 17                 ld8u	r7, [r6+]
 f4 5a                 stsp16	[sp+0x6], r6
 13                    add	r4, r7
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f2 2d                 add	r7, r1
 a7                    xor	r5, r7
 f2 20                 add	r4, r0
 08                    mov	r6, r4
 fa 99                 lsr16i	r6, 0x9
 fa 37                 lsl16i	r4, 0x7
 92                    or	r4, r6
 f4 a9                 inc16	r1
 a1                    xor	r4, r5
 f0 08 02              addi.s8	r0, 0x2
 f5 02                 cmp	r0, r2
 d1 de                 brne8	test_rebinding+101
 f4 49                 stsp16	[sp+0x2], r5
 f4 58                 stsp16	[sp+0x6], r4
 f0 07 00 05           ldi16	r3, 0x500
 f1 23                 mov	r4, r3
 f4 40                 stsp16	[sp+0x0], r4
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 c6 00 04              ldi16	r6, 0x400
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 c0 02                 ldi8	r4, 0x2
 0c                    mov	r7, r4
 c1 07                 ldi8	r5, 0x7
 c2 01                 ldi8	r6, 0x1
 d7 26                 sys	draw_erase
 c4 ad 09              ldi16	r4, 0x9ad
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f2 39                 sub	r1, r1
 c0 36                 ldi8	r4, 0x36
 c1 17                 ldi8	r5, 0x17
 f1 29                 mov	r6, r1
 d7 26                 sys	draw_erase
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 c0 65                 ldi8	r4, 0x65
 c1 31                 ldi8	r5, 0x31
 0b                    mov	r6, r7
 d7 26                 sys	draw_erase
 c7 37 9e              ldi16	r7, 0x9e37
 c6 1c 81              ldi16	r6, 0x811c
 f1 01                 mov	r0, r1
 f0 6c 87              ld8u	r4, [r3+]
 1c                    add	r7, r4
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f2 20                 add	r4, r0
 a8                    xor	r6, r4
 f2 2d                 add	r7, r1
 03                    mov	r4, r7
 fa 79                 lsr16i	r4, 0x9
 fa 67                 lsl16i	r7, 0x7
 9c                    or	r7, r4
 f4 a8                 inc16	r0
 ae                    xor	r7, r6
 f0 09 02              addi.s8	r1, 0x2
 f5 0a                 cmp	r1, r2
 d1 e1                 brne8	test_rebinding+212
 f4 08                 ldsp16	r4, [sp+0x2]
 32                    cmp	r4, r6
 f4 18                 ldsp16	r4, [sp+0x6]
 d1 06                 brne8	test_rebinding+256
 33                    cmp	r4, r7
 d1 03                 brne8	test_rebinding+256
 a0                    xor	r4, r4
 d4 26                 jmp8	test_rebinding+294
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
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_explicit_draw_does_not_rebind>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 c6 00 04              ldi16	r6, 0x400
 c1 96                 ldi8	r5, 0x96
 c4 00 05              ldi16	r4, 0x500
 f4 70                 stsp16	[sp+0xc], r4
 d7 11                 sys	memset
 f2 30                 sub	r0, r0
 f0 06 89 09           ldi16	r2, 0x989
 f0 03 00              ldi8	r3, 0x0
 c1 04                 ldi8	r5, 0x4
 c0 06                 ldi8	r4, 0x6
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 28                 mov	r6, r0
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d7 21                 sys	draw_sprite_erase
 f0 01 01              ldi8	r1, 0x1
 f0 06 ad 09           ldi16	r2, 0x9ad
 f0 03 00              ldi8	r3, 0x0
 c1 1a                 ldi8	r5, 0x1a
 c0 2f                 ldi8	r4, 0x2f
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 29                 mov	r6, r1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d7 21                 sys	draw_sprite_erase
 c2 02                 ldi8	r6, 0x2
 c1 2b                 ldi8	r5, 0x2b
 c0 5c                 ldi8	r4, 0x5c
 f4 60                 stsp16	[sp+0x8], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 19                 ldsp16	r5, [sp+0x6]
 d7 21                 sys	draw_sprite_erase
 c4 37 9e              ldi16	r4, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f1 08                 mov	r1, r0
 f4 32                 ldsp16	r6, [sp+0xc]
 f7 17                 ld8u	r7, [r6+]
 f4 72                 stsp16	[sp+0xc], r6
 13                    add	r4, r7
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f2 2d                 add	r7, r1
 a7                    xor	r5, r7
 f2 20                 add	r4, r0
 08                    mov	r6, r4
 fa 99                 lsr16i	r6, 0x9
 fa 37                 lsl16i	r4, 0x7
 92                    or	r4, r6
 f4 a9                 inc16	r1
 a1                    xor	r4, r5
 f0 08 02              addi.s8	r0, 0x2
 c7 00 08              ldi16	r7, 0x800
 f5 07                 cmp	r0, r7
 d1 db                 brne8	test_explicit_draw_does_not_rebind+108
 f4 61                 stsp16	[sp+0x8], r5
 f4 70                 stsp16	[sp+0xc], r4
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 f4 58                 stsp16	[sp+0x6], r4
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 c6 00 04              ldi16	r6, 0x400
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 11                 sys	memset
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f2 39                 sub	r1, r1
 c0 06                 ldi8	r4, 0x6
 c1 04                 ldi8	r5, 0x4
 f1 29                 mov	r6, r1
 d7 26                 sys	draw_erase
 c0 2f                 ldi8	r4, 0x2f
 f4 58                 stsp16	[sp+0x6], r4
 c0 1a                 ldi8	r4, 0x1a
 04                    mov	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 06 ad 09           ldi16	r2, 0x9ad
 f0 03 00              ldi8	r3, 0x0
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 c2 01                 ldi8	r6, 0x1
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d7 21                 sys	draw_sprite_erase
 f1 18                 mov	r3, r0
 f1 17                 mov	r2, r7
 c0 5c                 ldi8	r4, 0x5c
 c1 2b                 ldi8	r5, 0x2b
 c2 02                 ldi8	r6, 0x2
 d7 26                 sys	draw_erase
 c7 37 9e              ldi16	r7, 0x9e37
 c6 1c 81              ldi16	r6, 0x811c
 f1 01                 mov	r0, r1
 f0 6c 87              ld8u	r4, [r3+]
 1c                    add	r7, r4
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f2 20                 add	r4, r0
 a8                    xor	r6, r4
 f2 2d                 add	r7, r1
 03                    mov	r4, r7
 fa 79                 lsr16i	r4, 0x9
 fa 67                 lsl16i	r7, 0x7
 9c                    or	r7, r4
 f4 a8                 inc16	r0
 ae                    xor	r7, r6
 f0 09 02              addi.s8	r1, 0x2
 f5 0a                 cmp	r1, r2
 d1 e1                 brne8	test_explicit_draw_does_not_rebind+240
 f4 20                 ldsp16	r4, [sp+0x8]
 32                    cmp	r4, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 d1 06                 brne8	test_explicit_draw_does_not_rebind+284
 33                    cmp	r4, r7
 d1 03                 brne8	test_explicit_draw_does_not_rebind+284
 a0                    xor	r4, r4
 d4 26                 jmp8	test_explicit_draw_does_not_rebind+322
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
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_zero_dimension>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d7 22                 sys	set_sprite
 f0 05 00 04           ldi16	r1, 0x400
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 c1 5a                 ldi8	r5, 0x5a
 f4 41                 stsp16	[sp+0x0], r5
 f1 29                 mov	r6, r1
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 11                 sys	memset
 c4 db ff              ldi16	r4, 0xffdb
 c1 1d                 ldi8	r5, 0x1d
 c6 34 12              ldi16	r6, 0x1234
 d7 26                 sys	draw_erase
 a0                    xor	r4, r4
 4b                    ld8u	r6, [r7]
 ce 5a                 cmpi.s8	r6, 0x5a
 d1 0a                 brne8	test_zero_dimension+54
 f4 af                 inc16	r7
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f3                 brne8	test_zero_dimension+39
 d4 34                 jmp8	test_zero_dimension+106
 c0 30                 ldi8	r4, 0x30
 f9 81                 or	r4, r0
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
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
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
