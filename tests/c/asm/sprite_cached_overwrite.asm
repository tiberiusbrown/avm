
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_cached_overwrite.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_cached_overwrite.c
000009ba l     O .rodata	00000020 sprite_a
00000487 l     F .text	0000010e compare_one
00000595 l     F .text	00000110 test_repeated_draws_one_binding
000006a5 l     F .text	0000014a test_rebinding
000007ef l     F .text	0000015d test_explicit_draw_does_not_rebind
000009da l     O .rodata	00000002 sprite_zero_width
0000094c l     F .text	0000006c test_zero_dimension
000009dc l     O .rodata	00000002 sprite_zero_height
000009de l     O .rodata	00000014 sprite_b
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000371 avm_test_main
000009b8 g     F .text	00000002 avm_halt
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
 e1 a2 08              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f0 04 00 04           ldi16	r0, 0x400
 f0 01 a6              ldi8	r1, 0xa6
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 f1 25                 mov	r5, r1
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 f0 06 ba 09           ldi16	r2, 0x9ba
 f0 03 00              ldi8	r3, 0x0
 f2 69                 mov32	q2, q1
 d7 22                 sys	set_sprite
 43                    ld8u	r4, [r7]
 f5 21                 cmp	r4, r1
 db 7a 02              brne16	avm_test_main+674
 f4 af                 inc16	r7
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 f2                 brne8	avm_test_main+34
 c6 00 04              ldi16	r6, 0x400
 f2 39                 sub	r1, r1
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f1 29                 mov	r6, r1
 d7 1e                 sys	draw_sprite_overwrite
 c7 37 9e              ldi16	r7, 0x9e37
 c4 1c 81              ldi16	r4, 0x811c
 f1 19                 mov	r3, r1
 f0 6c c1              ld8u	r6, [r0+]
 1e                    add	r7, r6
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f2 2b                 add	r6, r3
 a2                    xor	r4, r6
 f2 2d                 add	r7, r1
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 fa 67                 lsl16i	r7, 0x7
 9d                    or	r7, r5
 f4 ab                 inc16	r3
 ac                    xor	r7, r4
 f0 09 02              addi.s8	r1, 0x2
 c5 00 08              ldi16	r5, 0x800
 f5 0d                 cmp	r1, r5
 d1 de                 brne8	avm_test_main+85
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 22                 sys	set_sprite
 f2 30                 sub	r0, r0
 f0 07 00 05           ldi16	r3, 0x500
 f1 23                 mov	r4, r3
 f1 24                 mov	r5, r0
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 f1 28                 mov	r6, r0
 d7 23                 sys	draw_overwrite
 c6 37 9e              ldi16	r6, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f1 08                 mov	r1, r0
 f0 6c 47              ld8u	r2, [r3+]
 f2 2a                 add	r6, r2
 f4 59                 stsp16	[sp+0x6], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 fa 7b                 lsr16i	r4, 0xb
 f4 58                 stsp16	[sp+0x6], r4
 fa 45                 lsl16i	r5, 0x5
 f4 18                 ldsp16	r4, [sp+0x6]
 94                    or	r5, r4
 f2 11                 add	r2, r1
 f9 aa                 xor	r5, r2
 f0 06 00 08           ldi16	r2, 0x800
 f2 28                 add	r6, r0
 02                    mov	r4, r6
 fa 79                 lsr16i	r4, 0x9
 fa 57                 lsl16i	r6, 0x7
 98                    or	r6, r4
 f4 a9                 inc16	r1
 a9                    xor	r6, r5
 f0 08 02              addi.s8	r0, 0x2
 f5 02                 cmp	r0, r2
 d1 d4                 brne8	avm_test_main+158
 f4 00                 ldsp16	r4, [sp+0x0]
 31                    cmp	r4, r5
 db f4 01              brne16	avm_test_main+708
 3e                    cmp	r7, r6
 db f0 01              brne16	avm_test_main+708
 c1 a5                 ldi8	r5, 0xa5
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c2 01                 ldi8	r6, 0x1
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 f1 2e                 mov	r7, r2
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d7 1e                 sys	draw_sprite_overwrite
 f1 17                 mov	r2, r7
 c7 37 9e              ldi16	r7, 0x9e37
 c4 1c 81              ldi16	r4, 0x811c
 f2 4b                 sub	r3, r3
 f1 0b                 mov	r1, r3
 f0 6c c1              ld8u	r6, [r0+]
 1e                    add	r7, r6
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f2 29                 add	r6, r1
 a2                    xor	r4, r6
 f2 2f                 add	r7, r3
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 fa 67                 lsl16i	r7, 0x7
 9d                    or	r7, r5
 f4 a9                 inc16	r1
 ac                    xor	r7, r4
 f0 0b 02              addi.s8	r3, 0x2
 f5 1a                 cmp	r3, r2
 d1 e1                 brne8	avm_test_main+265
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 22                 sys	set_sprite
 f0 06 00 05           ldi16	r2, 0x500
 f1 22                 mov	r4, r2
 c1 a5                 ldi8	r5, 0xa5
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 c2 01                 ldi8	r6, 0x1
 d7 23                 sys	draw_overwrite
 c6 37 9e              ldi16	r6, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f2 30                 sub	r0, r0
 f1 08                 mov	r1, r0
 f0 6c 65              ld8u	r3, [r2+]
 f2 2b                 add	r6, r3
 f4 59                 stsp16	[sp+0x6], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 fa 7b                 lsr16i	r4, 0xb
 f4 58                 stsp16	[sp+0x6], r4
 fa 45                 lsl16i	r5, 0x5
 f4 18                 ldsp16	r4, [sp+0x6]
 94                    or	r5, r4
 f2 19                 add	r3, r1
 f9 ae                 xor	r5, r3
 f2 28                 add	r6, r0
 02                    mov	r4, r6
 fa 79                 lsr16i	r4, 0x9
 fa 57                 lsl16i	r6, 0x7
 98                    or	r6, r4
 f4 a9                 inc16	r1
 a9                    xor	r6, r5
 f0 08 02              addi.s8	r0, 0x2
 c4 00 08              ldi16	r4, 0x800
 f5 04                 cmp	r0, r4
 d1 d5                 brne8	avm_test_main+335
 f4 00                 ldsp16	r4, [sp+0x0]
 31                    cmp	r4, r5
 db 71 01              brne16	avm_test_main+753
 3e                    cmp	r7, r6
 db 6d 01              brne16	avm_test_main+753
 c1 3c                 ldi8	r5, 0x3c
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c2 02                 ldi8	r6, 0x2
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d7 1e                 sys	draw_sprite_overwrite
 f1 1f                 mov	r3, r7
 c7 37 9e              ldi16	r7, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f2 39                 sub	r1, r1
 f1 01                 mov	r0, r1
 f0 06 00 08           ldi16	r2, 0x800
 f0 6c c7              ld8u	r6, [r3+]
 1e                    add	r7, r6
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f2 28                 add	r6, r0
 a6                    xor	r5, r6
 f2 2d                 add	r7, r1
 03                    mov	r4, r7
 fa 79                 lsr16i	r4, 0x9
 fa 67                 lsl16i	r7, 0x7
 9c                    or	r7, r4
 f4 a8                 inc16	r0
 ad                    xor	r7, r5
 f0 09 02              addi.s8	r1, 0x2
 f5 0a                 cmp	r1, r2
 d1 e1                 brne8	avm_test_main+441
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 22                 sys	set_sprite
 f0 06 00 05           ldi16	r2, 0x500
 f1 22                 mov	r4, r2
 c1 3c                 ldi8	r5, 0x3c
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c0 1b                 ldi8	r4, 0x1b
 c1 03                 ldi8	r5, 0x3
 c2 02                 ldi8	r6, 0x2
 d7 23                 sys	draw_overwrite
 c6 37 9e              ldi16	r6, 0x9e37
 c4 1c 81              ldi16	r4, 0x811c
 f2 30                 sub	r0, r0
 f1 08                 mov	r1, r0
 f0 6c 65              ld8u	r3, [r2+]
 f2 2b                 add	r6, r3
 f4 58                 stsp16	[sp+0x6], r4
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 8b                 lsr16i	r5, 0xb
 f4 59                 stsp16	[sp+0x6], r5
 fa 35                 lsl16i	r4, 0x5
 f4 19                 ldsp16	r5, [sp+0x6]
 91                    or	r4, r5
 f2 19                 add	r3, r1
 f9 8e                 xor	r4, r3
 f2 28                 add	r6, r0
 06                    mov	r5, r6
 fa 89                 lsr16i	r5, 0x9
 fa 57                 lsl16i	r6, 0x7
 99                    or	r6, r5
 f4 a9                 inc16	r1
 a8                    xor	r6, r4
 f0 08 02              addi.s8	r0, 0x2
 c5 00 08              ldi16	r5, 0x800
 f5 05                 cmp	r0, r5
 d1 d5                 brne8	avm_test_main+511
 f4 01                 ldsp16	r5, [sp+0x0]
 34                    cmp	r5, r4
 db e9 00              brne16	avm_test_main+793
 3e                    cmp	r7, r6
 db e5 00              brne16	avm_test_main+793
 d6 fb                 adjsp	-0x5
 f0 30 07              ldsp16	r0, [sp+0x7]
 f0 31 09              ldsp16	r1, [sp+0x9]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 29 02              stsp8	[sp+0x2], r1
 c0 01                 ldi8	r4, 0x1
 f1 14                 mov	r2, r4
 f4 4c                 stsp16	[sp+0x3], r4
 c0 04                 ldi8	r4, 0x4
 c1 96                 ldi8	r5, 0x96
 c6 fe ff              ldi16	r6, 0xfffe
 c7 fb ff              ldi16	r7, 0xfffb
 e1 1c 01              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 d1 43                 brne8	avm_test_main+670
 d6 fb                 adjsp	-0x5
 c0 02                 ldi8	r4, 0x2
 f4 4c                 stsp16	[sp+0x3], r4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 29 02              stsp8	[sp+0x2], r1
 c0 05                 ldi8	r4, 0x5
 c1 69                 ldi8	r5, 0x69
 c2 7e                 ldi8	r6, 0x7e
 c3 3a                 ldi8	r7, 0x3a
 e1 ff 00              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 d1 26                 brne8	avm_test_main+670
 e1 04 02              call16	test_repeated_draws_one_binding
 f4 a4                 tst8	r4
 d1 1f                 brne8	avm_test_main+670
 e1 0d 03              call16	test_rebinding
 f4 a4                 tst8	r4
 d1 18                 brne8	avm_test_main+670
 e1 50 04              call16	test_explicit_draw_does_not_rebind
 f4 a4                 tst8	r4
 d1 11                 brne8	avm_test_main+670
 c6 da 09              ldi16	r6, 0x9da
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c0 09                 ldi8	r4, 0x9
 e1 9d 05              call16	test_zero_dimension
 f4 a4                 tst8	r4
 da a3 00              breq16	avm_test_main+833
 f1 22                 mov	r4, r2
 d4 48                 jmp8	avm_test_main+746
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
 d4 22                 jmp8	avm_test_main+742
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
 d6 0a                 adjsp	0xa
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
 d4 d1                 jmp8	avm_test_main+746
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
 d4 a9                 jmp8	avm_test_main+746
 c6 dc 09              ldi16	r6, 0x9dc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c0 0a                 ldi8	r4, 0xa
 e1 e9 04              call16	test_zero_dimension
 f4 a4                 tst8	r4
 f1 22                 mov	r4, r2
 d1 97                 brne8	avm_test_main+746
 d6 fb                 adjsp	-0x5
 c0 01                 ldi8	r4, 0x1
 f4 4c                 stsp16	[sp+0x3], r4
 c4 de 09              ldi16	r4, 0x9de
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0b                 ldi8	r4, 0xb
 c1 c3                 ldi8	r5, 0xc3
 c2 80                 ldi8	r6, 0x80
 c3 40                 ldi8	r7, 0x40
 d5 05                 call8	compare_one
 d6 05                 adjsp	0x5
 e0 79 ff              jmp16	avm_test_main+746

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
 d7 1e                 sys	draw_sprite_overwrite
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
 d7 23                 sys	draw_overwrite
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
 c2 30                 ldi8	r6, 0x30
 f4 03                 ldsp16	r7, [sp+0x0]
 07                    mov	r5, r7
 96                    or	r5, r6
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
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
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
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
 d6 f6                 adjsp	-0xa
 c6 00 04              ldi16	r6, 0x400
 c1 3c                 ldi8	r5, 0x3c
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 f2 30                 sub	r0, r0
 f0 06 ba 09           ldi16	r2, 0x9ba
 f0 03 00              ldi8	r3, 0x0
 c1 05                 ldi8	r5, 0x5
 c0 04                 ldi8	r4, 0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f1 28                 mov	r6, r0
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d7 1e                 sys	draw_sprite_overwrite
 c2 01                 ldi8	r6, 0x1
 c1 0a                 ldi8	r5, 0xa
 c0 1f                 ldi8	r4, 0x1f
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d7 1e                 sys	draw_sprite_overwrite
 c2 02                 ldi8	r6, 0x2
 c1 13                 ldi8	r5, 0x13
 c0 44                 ldi8	r4, 0x44
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d7 1e                 sys	draw_sprite_overwrite
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
 d1 de                 brne8	test_repeated_draws_one_binding+90
 f4 52                 stsp16	[sp+0x4], r6
 f4 58                 stsp16	[sp+0x6], r4
 f1 05                 mov	r0, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d7 22                 sys	set_sprite
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 f2 42                 sub	r2, r2
 c0 04                 ldi8	r4, 0x4
 c1 05                 ldi8	r5, 0x5
 f1 2a                 mov	r6, r2
 d7 23                 sys	draw_overwrite
 c0 1f                 ldi8	r4, 0x1f
 c1 0a                 ldi8	r5, 0xa
 c2 01                 ldi8	r6, 0x1
 d7 23                 sys	draw_overwrite
 c0 44                 ldi8	r4, 0x44
 c1 13                 ldi8	r5, 0x13
 c2 02                 ldi8	r6, 0x2
 d7 23                 sys	draw_overwrite
 c5 37 9e              ldi16	r5, 0x9e37
 c7 1c 81              ldi16	r7, 0x811c
 f1 1a                 mov	r3, r2
 f0 6c 83              ld8u	r4, [r1+]
 14                    add	r5, r4
 0b                    mov	r6, r7
 fa 9b                 lsr16i	r6, 0xb
 fa 65                 lsl16i	r7, 0x5
 9e                    or	r7, r6
 f2 23                 add	r4, r3
 ac                    xor	r7, r4
 f2 26                 add	r5, r2
 01                    mov	r4, r5
 fa 79                 lsr16i	r4, 0x9
 fa 47                 lsl16i	r5, 0x7
 94                    or	r5, r4
 f4 ab                 inc16	r3
 a7                    xor	r5, r7
 f0 0a 02              addi.s8	r2, 0x2
 f5 10                 cmp	r2, r0
 d1 e1                 brne8	test_repeated_draws_one_binding+183
 f4 10                 ldsp16	r4, [sp+0x4]
 33                    cmp	r4, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 d1 06                 brne8	test_repeated_draws_one_binding+227
 31                    cmp	r4, r5
 d1 03                 brne8	test_repeated_draws_one_binding+227
 a0                    xor	r4, r4
 d4 26                 jmp8	test_repeated_draws_one_binding+265
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
 d6 0a                 adjsp	0xa
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
 d6 f0                 adjsp	-0x10
 c6 00 04              ldi16	r6, 0x400
 c1 69                 ldi8	r5, 0x69
 c4 00 05              ldi16	r4, 0x500
 d7 11                 sys	memset
 c2 01                 ldi8	r6, 0x1
 f0 06 ba 09           ldi16	r2, 0x9ba
 f0 03 00              ldi8	r3, 0x0
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 c1 07                 ldi8	r5, 0x7
 c0 02                 ldi8	r4, 0x2
 f4 78                 stsp16	[sp+0xe], r4
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d7 1e                 sys	draw_sprite_overwrite
 c4 00 05              ldi16	r4, 0x500
 f4 78                 stsp16	[sp+0xe], r4
 f2 30                 sub	r0, r0
 c6 de 09              ldi16	r6, 0x9de
 c3 00                 ldi8	r7, 0x0
 f0 02 17              ldi8	r2, 0x17
 f0 01 36              ldi8	r1, 0x36
 f1 21                 mov	r4, r1
 f1 26                 mov	r5, r2
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f2 67                 mov32	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f1 28                 mov	r6, r0
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d7 1e                 sys	draw_sprite_overwrite
 c2 31                 ldi8	r6, 0x31
 c3 65                 ldi8	r7, 0x65
 03                    mov	r4, r7
 f4 58                 stsp16	[sp+0x6], r4
 06                    mov	r5, r6
 f4 41                 stsp16	[sp+0x0], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f2 66                 mov32	q1, q2
 c2 02                 ldi8	r6, 0x2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 1e                 sys	draw_sprite_overwrite
 c4 37 9e              ldi16	r4, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f1 08                 mov	r1, r0
 f0 06 00 08           ldi16	r2, 0x800
 f4 3a                 ldsp16	r6, [sp+0xe]
 f7 17                 ld8u	r7, [r6+]
 f4 7a                 stsp16	[sp+0xe], r6
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
 d1 de                 brne8	test_rebinding+133
 f4 59                 stsp16	[sp+0x6], r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 07 00 05           ldi16	r3, 0x500
 f1 23                 mov	r4, r3
 f4 40                 stsp16	[sp+0x0], r4
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 c6 00 04              ldi16	r6, 0x400
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 11                 sys	memset
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 d7 22                 sys	set_sprite
 c0 02                 ldi8	r4, 0x2
 0c                    mov	r7, r4
 c1 07                 ldi8	r5, 0x7
 c2 01                 ldi8	r6, 0x1
 d7 23                 sys	draw_overwrite
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 22                 sys	set_sprite
 f2 39                 sub	r1, r1
 c0 36                 ldi8	r4, 0x36
 c1 17                 ldi8	r5, 0x17
 f1 29                 mov	r6, r1
 d7 23                 sys	draw_overwrite
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 d7 22                 sys	set_sprite
 c0 65                 ldi8	r4, 0x65
 c1 31                 ldi8	r5, 0x31
 0b                    mov	r6, r7
 d7 23                 sys	draw_overwrite
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
 d1 e1                 brne8	test_rebinding+241
 f4 18                 ldsp16	r4, [sp+0x6]
 32                    cmp	r4, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 d1 06                 brne8	test_rebinding+285
 33                    cmp	r4, r7
 d1 03                 brne8	test_rebinding+285
 a0                    xor	r4, r4
 d4 26                 jmp8	test_rebinding+323
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
 d6 10                 adjsp	0x10
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
 d6 ee                 adjsp	-0x12
 c6 00 04              ldi16	r6, 0x400
 c1 96                 ldi8	r5, 0x96
 c4 00 05              ldi16	r4, 0x500
 f0 3c 10              stsp16	[sp+0x10], r4
 d7 11                 sys	memset
 f2 30                 sub	r0, r0
 f0 06 ba 09           ldi16	r2, 0x9ba
 f0 03 00              ldi8	r3, 0x0
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 c1 04                 ldi8	r5, 0x4
 c0 06                 ldi8	r4, 0x6
 f4 68                 stsp16	[sp+0xa], r4
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f1 28                 mov	r6, r0
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d7 1e                 sys	draw_sprite_overwrite
 f0 06 de 09           ldi16	r2, 0x9de
 f0 03 00              ldi8	r3, 0x0
 c1 1a                 ldi8	r5, 0x1a
 c0 2f                 ldi8	r4, 0x2f
 f4 68                 stsp16	[sp+0xa], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 c2 01                 ldi8	r6, 0x1
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d7 1e                 sys	draw_sprite_overwrite
 c2 02                 ldi8	r6, 0x2
 c3 2b                 ldi8	r7, 0x2b
 c0 5c                 ldi8	r4, 0x5c
 f4 68                 stsp16	[sp+0xa], r4
 07                    mov	r5, r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 66                 mov32	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 1e                 sys	draw_sprite_overwrite
 c4 37 9e              ldi16	r4, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f1 08                 mov	r1, r0
 f0 36 10              ldsp16	r6, [sp+0x10]
 f7 17                 ld8u	r7, [r6+]
 f0 3e 10              stsp16	[sp+0x10], r6
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
 d1 d9                 brne8	test_explicit_draw_does_not_rebind+130
 f4 69                 stsp16	[sp+0xa], r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f4 50                 stsp16	[sp+0x4], r4
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 c6 00 04              ldi16	r6, 0x400
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 d7 22                 sys	set_sprite
 f2 30                 sub	r0, r0
 c0 06                 ldi8	r4, 0x6
 c1 04                 ldi8	r5, 0x4
 f1 28                 mov	r6, r0
 d7 23                 sys	draw_overwrite
 c0 2f                 ldi8	r4, 0x2f
 f4 70                 stsp16	[sp+0xc], r4
 c0 1a                 ldi8	r4, 0x1a
 04                    mov	r5, r4
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 c2 01                 ldi8	r6, 0x1
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d7 1e                 sys	draw_sprite_overwrite
 f1 19                 mov	r3, r1
 f1 17                 mov	r2, r7
 c0 5c                 ldi8	r4, 0x5c
 c1 2b                 ldi8	r5, 0x2b
 c2 02                 ldi8	r6, 0x2
 d7 23                 sys	draw_overwrite
 c7 37 9e              ldi16	r7, 0x9e37
 c6 1c 81              ldi16	r6, 0x811c
 f1 08                 mov	r1, r0
 f0 6c 87              ld8u	r4, [r3+]
 1c                    add	r7, r4
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f2 21                 add	r4, r1
 a8                    xor	r6, r4
 f2 2c                 add	r7, r0
 03                    mov	r4, r7
 fa 79                 lsr16i	r4, 0x9
 fa 67                 lsl16i	r7, 0x7
 9c                    or	r7, r4
 f4 a9                 inc16	r1
 ae                    xor	r7, r6
 f0 08 02              addi.s8	r0, 0x2
 f5 02                 cmp	r0, r2
 d1 e1                 brne8	test_explicit_draw_does_not_rebind+259
 f4 28                 ldsp16	r4, [sp+0xa]
 32                    cmp	r4, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 d1 06                 brne8	test_explicit_draw_does_not_rebind+304
 33                    cmp	r4, r7
 d1 03                 brne8	test_explicit_draw_does_not_rebind+304
 a0                    xor	r4, r4
 d4 26                 jmp8	test_explicit_draw_does_not_rebind+342
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
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_zero_dimension>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d7 22                 sys	set_sprite
 f0 05 00 04           ldi16	r1, 0x400
 c1 5a                 ldi8	r5, 0x5a
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 f1 29                 mov	r6, r1
 d7 11                 sys	memset
 f0 06 34 12           ldi16	r2, 0x1234
 c1 1d                 ldi8	r5, 0x1d
 c4 db ff              ldi16	r4, 0xffdb
 f1 2a                 mov	r6, r2
 d7 23                 sys	draw_overwrite
 a0                    xor	r4, r4
 47                    ld8u	r5, [r7]
 cd 5a                 cmpi.s8	r5, 0x5a
 d1 0a                 brne8	test_zero_dimension+52
 f4 af                 inc16	r7
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f3                 brne8	test_zero_dimension+37
 d4 34                 jmp8	test_zero_dimension+104
 c2 30                 ldi8	r6, 0x30
 f1 24                 mov	r5, r0
 96                    or	r5, r6
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 05                 cmov.ult	r0, r5
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
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
