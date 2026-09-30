
sprite_cached_plus_mask.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sprite_cached_plus_mask.c
000008de l     O .rodata	0000003e sprite_a
00000421 l     F .text	000000f8 compare_one
00000519 l     F .text	0000010d test_repeated_draws_one_binding
00000626 l     F .text	00000125 test_rebinding
0000074b l     F .text	00000129 test_explicit_draw_does_not_rebind
0000091c l     O .rodata	00000002 sprite_zero_width
00000874 l     F .text	00000068 test_zero_dimension
0000091e l     O .rodata	00000002 sprite_zero_height
00000920 l     O .rodata	00000026 sprite_b
00000100 l     O .data	00000005 .L.str
00000000 l    df *ABS*	00000000 runtime.c
00000946 l       .init_array	00000000 .hidden __init_array_end
00000946 l       .init_array	00000000 .hidden __init_array_start
00000946 l       .fini_array	00000000 .hidden __fini_array_start
00000946 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000014a avm_test_main
000008dc g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 be 06              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 46 09              ldi16	r4, 0x946
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 46 09              ldi16	r6, 0x946
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 46 09           ldi16	r0, 0x946
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 46 09           ldi16	r2, 0x946
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 46 09              ldi16	r4, 0x946
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 46 09              ldi16	r6, 0x946
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 46 09           ldi16	r2, 0x946
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 46 09           ldi16	r0, 0x946
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 05 00 04           ldi16	r1, 0x400
 f0 00 a6              ldi8	r0, 0xa6
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 c1 a6                 ldi8	r5, 0xa6
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 f0 06 de 08           ldi16	r2, 0x8de
 f0 03 00              ldi8	r3, 0x0
 f2 69                 mov32	q2, q1
 d7 22                 sys	set_sprite
 43                    ld8u	r4, [r7]
 f5 20                 cmp	r4, r0
 db f7 00              brne16	avm_test_main+286
 f4 af                 inc16	r7
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f2                 brne8	avm_test_main+33
 d6 fb                 adjsp	-0x5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 2b 02              stsp8	[sp+0x2], r3
 a5                    xor	r5, r5
 f4 4d                 stsp16	[sp+0x3], r5
 f0 00 01              ldi8	r0, 0x1
 c2 0a                 ldi8	r6, 0xa
 c3 08                 ldi8	r7, 0x8
 f1 20                 mov	r4, r0
 e1 04 01              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 db f6 00              brne16	avm_test_main+323
 d6 fb                 adjsp	-0x5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 2b 02              stsp8	[sp+0x2], r3
 f0 00 01              ldi8	r0, 0x1
 f0 38 03              stsp16	[sp+0x3], r0
 f0 01 02              ldi8	r1, 0x2
 c1 a5                 ldi8	r5, 0xa5
 c2 0a                 ldi8	r6, 0xa
 c3 08                 ldi8	r7, 0x8
 f1 21                 mov	r4, r1
 e1 e1 00              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 db d3 00              brne16	avm_test_main+323
 d6 fb                 adjsp	-0x5
 f0 39 03              stsp16	[sp+0x3], r1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 2b 02              stsp8	[sp+0x2], r3
 c1 3c                 ldi8	r5, 0x3c
 c2 1b                 ldi8	r6, 0x1b
 c0 03                 ldi8	r4, 0x3
 0c                    mov	r7, r4
 e1 c5 00              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 db b7 00              brne16	avm_test_main+323
 d6 fb                 adjsp	-0x5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 2b 02              stsp8	[sp+0x2], r3
 f0 00 01              ldi8	r0, 0x1
 f0 38 03              stsp16	[sp+0x3], r0
 c0 04                 ldi8	r4, 0x4
 c1 96                 ldi8	r5, 0x96
 c6 fe ff              ldi16	r6, 0xfffe
 c7 fb ff              ldi16	r7, 0xfffb
 e1 a3 00              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 db 95 00              brne16	avm_test_main+323
 d6 fb                 adjsp	-0x5
 f0 39 03              stsp16	[sp+0x3], r1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 2b 02              stsp8	[sp+0x2], r3
 c0 05                 ldi8	r4, 0x5
 c1 69                 ldi8	r5, 0x69
 c2 7e                 ldi8	r6, 0x7e
 c3 3a                 ldi8	r7, 0x3a
 e1 86 00              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 d1 79                 brne8	avm_test_main+323
 e1 75 01              call16	test_repeated_draws_one_binding
 f4 a4                 tst8	r4
 d1 72                 brne8	avm_test_main+323
 e1 7b 02              call16	test_rebinding
 f4 a4                 tst8	r4
 d1 6b                 brne8	avm_test_main+323
 e1 99 03              call16	test_explicit_draw_does_not_rebind
 f4 a4                 tst8	r4
 d1 64                 brne8	avm_test_main+323
 c6 1c 09              ldi16	r6, 0x91c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c0 09                 ldi8	r4, 0x9
 e1 b2 04              call16	test_zero_dimension
 f4 a4                 tst8	r4
 d1 54                 brne8	avm_test_main+323
 c6 1e 09              ldi16	r6, 0x91e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c0 0a                 ldi8	r4, 0xa
 e1 a2 04              call16	test_zero_dimension
 f4 a4                 tst8	r4
 d1 44                 brne8	avm_test_main+323
 d6 fb                 adjsp	-0x5
 c0 01                 ldi8	r4, 0x1
 f4 4c                 stsp16	[sp+0x3], r4
 c4 20 09              ldi16	r4, 0x920
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0b                 ldi8	r4, 0xb
 c1 c3                 ldi8	r5, 0xc3
 c2 80                 ldi8	r6, 0x80
 c3 40                 ldi8	r7, 0x40
 d5 32                 call8	compare_one
 d6 05                 adjsp	0x5
 f1 04                 mov	r0, r4
 d4 25                 jmp8	avm_test_main+323
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+291
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 00 01              ldi8	r0, 0x1
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<compare_one>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f4 7b                 stsp16	[sp+0xe], r7
 f1 0e                 mov	r1, r6
 f4 40                 stsp16	[sp+0x0], r4
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 32 1b              ldsp16	r2, [sp+0x1b]
 f0 1b 1d              ldsp8u	r3, [sp+0x1d]
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 f4 59                 stsp16	[sp+0x6], r5
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 f0 39 0a              stsp16	[sp+0xa], r1
 f1 21                 mov	r4, r1
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f4 63                 stsp16	[sp+0x8], r7
 0b                    mov	r6, r7
 d7 1f                 sys	draw_sprite_plus_mask
 c7 37 9e              ldi16	r7, 0x9e37
 c4 1c 81              ldi16	r4, 0x811c
 f2 4b                 sub	r3, r3
 f1 13                 mov	r2, r3
 f0 6c a1              ld8u	r5, [r0+]
 1d                    add	r7, r5
 08                    mov	r6, r4
 fa 9b                 lsr16i	r6, 0xb
 fa 35                 lsl16i	r4, 0x5
 92                    or	r4, r6
 f2 26                 add	r5, r2
 a1                    xor	r4, r5
 f2 2f                 add	r7, r3
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 fa 67                 lsl16i	r7, 0x7
 9d                    or	r7, r5
 f4 aa                 inc16	r2
 ac                    xor	r7, r4
 f0 0b 02              addi.s8	r3, 0x2
 c5 00 08              ldi16	r5, 0x800
 f5 1d                 cmp	r3, r5
 d1 de                 brne8	compare_one+62
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
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 d7 24                 sys	draw_plus_mask
 c5 37 9e              ldi16	r5, 0x9e37
 c6 1c 81              ldi16	r6, 0x811c
 f2 42                 sub	r2, r2
 f1 1a                 mov	r3, r2
 f0 6c 21              ld8u	r1, [r0+]
 f2 25                 add	r5, r1
 f4 7a                 stsp16	[sp+0xe], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 fa 7b                 lsr16i	r4, 0xb
 f4 78                 stsp16	[sp+0xe], r4
 fa 55                 lsl16i	r6, 0x5
 f4 38                 ldsp16	r4, [sp+0xe]
 98                    or	r6, r4
 f2 0b                 add	r1, r3
 f9 c6                 xor	r6, r1
 c4 00 08              ldi16	r4, 0x800
 f1 0c                 mov	r1, r4
 f2 26                 add	r5, r2
 01                    mov	r4, r5
 fa 79                 lsr16i	r4, 0x9
 fa 47                 lsl16i	r5, 0x7
 94                    or	r5, r4
 f4 ab                 inc16	r3
 a6                    xor	r5, r6
 f0 0a 02              addi.s8	r2, 0x2
 f5 11                 cmp	r2, r1
 d1 d3                 brne8	compare_one+135
 f4 30                 ldsp16	r4, [sp+0xc]
 32                    cmp	r4, r6
 d1 06                 brne8	compare_one+191
 3d                    cmp	r7, r5
 d1 03                 brne8	compare_one+191
 a0                    xor	r4, r4
 d4 32                 jmp8	compare_one+241
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	compare_one+196
 c0 30                 ldi8	r4, 0x30
 f4 01                 ldsp16	r5, [sp+0x0]
 91                    or	r4, r5
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
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
 d6 10                 adjsp	0x10
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
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 af                    xor	r7, r7
 f0 06 de 08           ldi16	r2, 0x8de
 f0 03 00              ldi8	r3, 0x0
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 c0 04                 ldi8	r4, 0x4
 c1 05                 ldi8	r5, 0x5
 aa                    xor	r6, r6
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d7 1f                 sys	draw_sprite_plus_mask
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 c0 1f                 ldi8	r4, 0x1f
 c1 0a                 ldi8	r5, 0xa
 c2 01                 ldi8	r6, 0x1
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d7 1f                 sys	draw_sprite_plus_mask
 c0 44                 ldi8	r4, 0x44
 c1 13                 ldi8	r5, 0x13
 c2 02                 ldi8	r6, 0x2
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d7 1f                 sys	draw_sprite_plus_mask
 f1 17                 mov	r2, r7
 c7 37 9e              ldi16	r7, 0x9e37
 c6 1c 81              ldi16	r6, 0x811c
 f1 02                 mov	r0, r2
 f0 6c a3              ld8u	r5, [r1+]
 1d                    add	r7, r5
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f2 24                 add	r5, r0
 a9                    xor	r6, r5
 f2 2e                 add	r7, r2
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 fa 67                 lsl16i	r7, 0x7
 9d                    or	r7, r5
 f4 a8                 inc16	r0
 ae                    xor	r7, r6
 f0 0a 02              addi.s8	r2, 0x2
 c4 00 08              ldi16	r4, 0x800
 f5 14                 cmp	r2, r4
 d1 de                 brne8	test_repeated_draws_one_binding+88
 f4 4a                 stsp16	[sp+0x2], r6
 c4 de 08              ldi16	r4, 0x8de
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f0 06 00 05           ldi16	r2, 0x500
 f1 22                 mov	r4, r2
 c1 3c                 ldi8	r5, 0x3c
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 f2 39                 sub	r1, r1
 c0 04                 ldi8	r4, 0x4
 c1 05                 ldi8	r5, 0x5
 aa                    xor	r6, r6
 d7 24                 sys	draw_plus_mask
 c0 1f                 ldi8	r4, 0x1f
 c1 0a                 ldi8	r5, 0xa
 c2 01                 ldi8	r6, 0x1
 d7 24                 sys	draw_plus_mask
 c0 44                 ldi8	r4, 0x44
 c1 13                 ldi8	r5, 0x13
 c2 02                 ldi8	r6, 0x2
 d7 24                 sys	draw_plus_mask
 c4 37 9e              ldi16	r4, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f1 19                 mov	r3, r1
 f0 6c 05              ld8u	r0, [r2+]
 f2 20                 add	r4, r0
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f2 03                 add	r0, r3
 f9 a2                 xor	r5, r0
 f2 21                 add	r4, r1
 08                    mov	r6, r4
 fa 99                 lsr16i	r6, 0x9
 fa 37                 lsl16i	r4, 0x7
 92                    or	r4, r6
 f4 ab                 inc16	r3
 a1                    xor	r4, r5
 f0 09 02              addi.s8	r1, 0x2
 c6 00 08              ldi16	r6, 0x800
 f5 0e                 cmp	r1, r6
 d1 dc                 brne8	test_repeated_draws_one_binding+177
 f4 0a                 ldsp16	r6, [sp+0x2]
 39                    cmp	r6, r5
 d1 06                 brne8	test_repeated_draws_one_binding+224
 3c                    cmp	r7, r4
 d1 03                 brne8	test_repeated_draws_one_binding+224
 a0                    xor	r4, r4
 d4 26                 jmp8	test_repeated_draws_one_binding+262
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	test_repeated_draws_one_binding+229
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
 f4 00                 ldsp16	r4, [sp+0x0]
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
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 de 08           ldi16	r2, 0x8de
 f0 03 00              ldi8	r3, 0x0
 c0 02                 ldi8	r4, 0x2
 c1 07                 ldi8	r5, 0x7
 c2 01                 ldi8	r6, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 f2 39                 sub	r1, r1
 f0 06 20 09           ldi16	r2, 0x920
 f0 03 00              ldi8	r3, 0x0
 c0 36                 ldi8	r4, 0x36
 c1 17                 ldi8	r5, 0x17
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 aa                    xor	r6, r6
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 d7 1f                 sys	draw_sprite_plus_mask
 c0 65                 ldi8	r4, 0x65
 c1 31                 ldi8	r5, 0x31
 c6 de 08              ldi16	r6, 0x8de
 c3 00                 ldi8	r7, 0x0
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1f                 sys	draw_sprite_plus_mask
 c7 37 9e              ldi16	r7, 0x9e37
 c6 1c 81              ldi16	r6, 0x811c
 f1 19                 mov	r3, r1
 f0 6c a1              ld8u	r5, [r0+]
 1d                    add	r7, r5
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f2 27                 add	r5, r3
 a9                    xor	r6, r5
 f2 2d                 add	r7, r1
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 fa 67                 lsl16i	r7, 0x7
 9d                    or	r7, r5
 f4 ab                 inc16	r3
 ae                    xor	r7, r6
 f0 09 02              addi.s8	r1, 0x2
 c4 00 08              ldi16	r4, 0x800
 f5 0c                 cmp	r1, r4
 d1 de                 brne8	test_rebinding+89
 f4 4a                 stsp16	[sp+0x2], r6
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c4 de 08              ldi16	r4, 0x8de
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 c0 02                 ldi8	r4, 0x2
 c1 07                 ldi8	r5, 0x7
 c2 01                 ldi8	r6, 0x1
 d7 24                 sys	draw_plus_mask
 c4 20 09              ldi16	r4, 0x920
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f2 42                 sub	r2, r2
 c0 36                 ldi8	r4, 0x36
 c1 17                 ldi8	r5, 0x17
 aa                    xor	r6, r6
 d7 24                 sys	draw_plus_mask
 c4 de 08              ldi16	r4, 0x8de
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 c0 65                 ldi8	r4, 0x65
 c1 31                 ldi8	r5, 0x31
 c2 02                 ldi8	r6, 0x2
 d7 24                 sys	draw_plus_mask
 c4 37 9e              ldi16	r4, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f1 1a                 mov	r3, r2
 f0 6c 21              ld8u	r1, [r0+]
 f2 21                 add	r4, r1
 f4 51                 stsp16	[sp+0x4], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 9b                 lsr16i	r6, 0xb
 f4 52                 stsp16	[sp+0x4], r6
 fa 45                 lsl16i	r5, 0x5
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 f2 0b                 add	r1, r3
 f9 a6                 xor	r5, r1
 c6 00 08              ldi16	r6, 0x800
 f1 0e                 mov	r1, r6
 f2 22                 add	r4, r2
 08                    mov	r6, r4
 fa 99                 lsr16i	r6, 0x9
 fa 37                 lsl16i	r4, 0x7
 92                    or	r4, r6
 f4 ab                 inc16	r3
 a1                    xor	r4, r5
 f0 0a 02              addi.s8	r2, 0x2
 f5 11                 cmp	r2, r1
 d1 d3                 brne8	test_rebinding+192
 f4 0a                 ldsp16	r6, [sp+0x2]
 39                    cmp	r6, r5
 d1 06                 brne8	test_rebinding+248
 3c                    cmp	r7, r4
 d1 03                 brne8	test_rebinding+248
 a0                    xor	r4, r4
 d4 26                 jmp8	test_rebinding+286
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	test_rebinding+253
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
 f4 00                 ldsp16	r4, [sp+0x0]
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
 d6 f8                 adjsp	-0x8
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 c1 96                 ldi8	r5, 0x96
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 f2 39                 sub	r1, r1
 f0 06 de 08           ldi16	r2, 0x8de
 f0 03 00              ldi8	r3, 0x0
 c0 06                 ldi8	r4, 0x6
 c1 04                 ldi8	r5, 0x4
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 aa                    xor	r6, r6
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 d7 1f                 sys	draw_sprite_plus_mask
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 c6 20 09              ldi16	r6, 0x920
 c3 00                 ldi8	r7, 0x0
 c0 2f                 ldi8	r4, 0x2f
 c1 1a                 ldi8	r5, 0x1a
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 c0 5c                 ldi8	r4, 0x5c
 c1 2b                 ldi8	r5, 0x2b
 c6 de 08              ldi16	r6, 0x8de
 c3 00                 ldi8	r7, 0x0
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1f                 sys	draw_sprite_plus_mask
 c7 37 9e              ldi16	r7, 0x9e37
 c6 1c 81              ldi16	r6, 0x811c
 f1 19                 mov	r3, r1
 f0 6c a1              ld8u	r5, [r0+]
 1d                    add	r7, r5
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f2 27                 add	r5, r3
 a9                    xor	r6, r5
 f2 2d                 add	r7, r1
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 fa 67                 lsl16i	r7, 0x7
 9d                    or	r7, r5
 f4 ab                 inc16	r3
 ae                    xor	r7, r6
 f0 09 02              addi.s8	r1, 0x2
 c4 00 08              ldi16	r4, 0x800
 f5 0c                 cmp	r1, r4
 d1 de                 brne8	test_explicit_draw_does_not_rebind+89
 f4 4a                 stsp16	[sp+0x2], r6
 c4 00 05              ldi16	r4, 0x500
 c1 96                 ldi8	r5, 0x96
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c4 de 08              ldi16	r4, 0x8de
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 c0 06                 ldi8	r4, 0x6
 c1 04                 ldi8	r5, 0x4
 aa                    xor	r6, r6
 d7 24                 sys	draw_plus_mask
 c0 2f                 ldi8	r4, 0x2f
 c1 1a                 ldi8	r5, 0x1a
 f0 06 20 09           ldi16	r2, 0x920
 f0 03 00              ldi8	r3, 0x0
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 05 00 05           ldi16	r1, 0x500
 c2 01                 ldi8	r6, 0x1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 d7 1f                 sys	draw_sprite_plus_mask
 f2 42                 sub	r2, r2
 c0 5c                 ldi8	r4, 0x5c
 c1 2b                 ldi8	r5, 0x2b
 c2 02                 ldi8	r6, 0x2
 d7 24                 sys	draw_plus_mask
 c4 37 9e              ldi16	r4, 0x9e37
 c5 1c 81              ldi16	r5, 0x811c
 f1 1a                 mov	r3, r2
 f0 6c 03              ld8u	r0, [r1+]
 f2 20                 add	r4, r0
 f4 51                 stsp16	[sp+0x4], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 9b                 lsr16i	r6, 0xb
 f4 52                 stsp16	[sp+0x4], r6
 fa 45                 lsl16i	r5, 0x5
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 f2 03                 add	r0, r3
 f9 a2                 xor	r5, r0
 f2 22                 add	r4, r2
 08                    mov	r6, r4
 fa 99                 lsr16i	r6, 0x9
 fa 37                 lsl16i	r4, 0x7
 92                    or	r4, r6
 f4 ab                 inc16	r3
 a1                    xor	r4, r5
 f0 0a 02              addi.s8	r2, 0x2
 c6 00 08              ldi16	r6, 0x800
 f5 16                 cmp	r2, r6
 d1 d5                 brne8	test_explicit_draw_does_not_rebind+198
 f4 0a                 ldsp16	r6, [sp+0x2]
 39                    cmp	r6, r5
 d1 06                 brne8	test_explicit_draw_does_not_rebind+252
 3c                    cmp	r7, r4
 d1 03                 brne8	test_explicit_draw_does_not_rebind+252
 a0                    xor	r4, r4
 d4 26                 jmp8	test_explicit_draw_does_not_rebind+290
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	test_explicit_draw_does_not_rebind+257
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
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_zero_dimension>:
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d7 22                 sys	set_sprite
 f0 05 00 04           ldi16	r1, 0x400
 c7 00 05              ldi16	r7, 0x500
 03                    mov	r4, r7
 c1 5a                 ldi8	r5, 0x5a
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c4 db ff              ldi16	r4, 0xffdb
 c1 1d                 ldi8	r5, 0x1d
 c6 34 12              ldi16	r6, 0x1234
 d7 24                 sys	draw_plus_mask
 a0                    xor	r4, r4
 47                    ld8u	r5, [r7]
 cd 5a                 cmpi.s8	r5, 0x5a
 d1 0a                 brne8	test_zero_dimension+49
 f4 af                 inc16	r7
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f3                 brne8	test_zero_dimension+34
 d4 34                 jmp8	test_zero_dimension+101
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	test_zero_dimension+54
 c0 30                 ldi8	r4, 0x30
 f9 81                 or	r4, r0
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 08 37              addi.s8	r0, 0x37
 fc 04                 cmov.ult	r0, r4
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
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
