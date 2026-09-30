
sprite_cached_self_masked.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sprite_cached_self_masked.c
00000442 l     F .text	00000031 test_set_sprite_preserves_framebuffer
00000959 l     O .rodata	00000020 sprite_a
00000473 l     F .text	0000008b compare_one
000004fe l     F .text	000000df test_repeated_draws_one_binding
000005dd l     F .text	000000db test_rebinding
000006b8 l     F .text	000000d2 test_explicit_draw_does_not_rebind
00000979 l     O .rodata	00000002 sprite_zero_width
0000078a l     F .text	0000003f test_zero_dimension
0000097b l     O .rodata	00000002 sprite_zero_height
0000097d l     O .rodata	00000014 sprite_b
000007c9 l     F .text	00000011 prepare_framebuffer
000007da l     F .text	0000003b framebuffer_is_filled_with
00000815 l     F .text	00000010 fail_case
000008bf l     F .text	0000006f digest_framebuffer
0000092e l     F .text	00000029 digest_matches
00000100 l     O .data	00000005 .L.str
00000825 l     F .text	00000019 test_line16
0000083e l     F .text	00000022 test_puts
00000860 l     F .text	0000000b test_putc
0000086b l     F .text	0000000f test_hex16
0000087a l     F .text	00000019 test_hex8
00000893 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00000991 l       .init_array	00000000 .hidden __init_array_end
00000991 l       .init_array	00000000 .hidden __init_array_start
00000991 l       .fini_array	00000000 .hidden __fini_array_start
00000991 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000016b avm_test_main
00000957 g     F .text	00000002 avm_halt
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
 e1 39 07              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 91 09              ldi16	r4, 0x991
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 91 09              ldi16	r6, 0x991
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 91 09           ldi16	r0, 0x991
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 91 09           ldi16	r2, 0x991
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
 c4 91 09              ldi16	r4, 0x991
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 91 09              ldi16	r6, 0x991
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 91 09           ldi16	r2, 0x991
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 91 09           ldi16	r0, 0x991
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
 d6 fe                 adjsp	-0x2
 e1 66 01              call16	test_set_sprite_preserves_framebuffer
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+18
 d4 00                 jmp8	avm_test_main+11
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 54 01              jmp16	avm_test_main+358
 d6 fb                 adjsp	-0x5
 a5                    xor	r5, r5
 f4 4d                 stsp16	[sp+0x3], r5
 c6 59 09              ldi16	r6, 0x959
 c3 00                 ldi8	r7, 0x0
 f4 42                 stsp16	[sp+0x0], r6
 f1 3b                 stsp8	[sp+0x2], r7
 c0 01                 ldi8	r4, 0x1
 c2 0a                 ldi8	r6, 0xa
 c3 08                 ldi8	r7, 0x8
 e1 73 01              call16	compare_one
 d6 05                 adjsp	0x5
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+56
 d4 00                 jmp8	avm_test_main+49
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 2e 01              jmp16	avm_test_main+358
 d6 fb                 adjsp	-0x5
 c0 01                 ldi8	r4, 0x1
 f4 4c                 stsp16	[sp+0x3], r4
 c4 59 09              ldi16	r4, 0x959
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 02                 ldi8	r4, 0x2
 c1 a5                 ldi8	r5, 0xa5
 c2 0a                 ldi8	r6, 0xa
 c3 08                 ldi8	r7, 0x8
 e1 4a 01              call16	compare_one
 d6 05                 adjsp	0x5
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+97
 d4 00                 jmp8	avm_test_main+90
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 05 01              jmp16	avm_test_main+358
 d6 fb                 adjsp	-0x5
 c0 02                 ldi8	r4, 0x2
 f4 4c                 stsp16	[sp+0x3], r4
 c4 59 09              ldi16	r4, 0x959
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c1 3c                 ldi8	r5, 0x3c
 c2 1b                 ldi8	r6, 0x1b
 c3 03                 ldi8	r7, 0x3
 03                    mov	r4, r7
 e1 22 01              call16	compare_one
 d6 05                 adjsp	0x5
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+137
 d4 00                 jmp8	avm_test_main+130
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 dd 00              jmp16	avm_test_main+358
 d6 fb                 adjsp	-0x5
 c0 01                 ldi8	r4, 0x1
 f4 4c                 stsp16	[sp+0x3], r4
 c4 59 09              ldi16	r4, 0x959
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 04                 ldi8	r4, 0x4
 c1 96                 ldi8	r5, 0x96
 c6 fe ff              ldi16	r6, 0xfffe
 c7 fb ff              ldi16	r7, 0xfffb
 e1 f7 00              call16	compare_one
 d6 05                 adjsp	0x5
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+180
 d4 00                 jmp8	avm_test_main+173
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 b2 00              jmp16	avm_test_main+358
 d6 fb                 adjsp	-0x5
 c0 02                 ldi8	r4, 0x2
 f4 4c                 stsp16	[sp+0x3], r4
 c4 59 09              ldi16	r4, 0x959
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 05                 ldi8	r4, 0x5
 c1 69                 ldi8	r5, 0x69
 c2 7e                 ldi8	r6, 0x7e
 c3 3a                 ldi8	r7, 0x3a
 e1 ce 00              call16	compare_one
 d6 05                 adjsp	0x5
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+221
 d4 00                 jmp8	avm_test_main+214
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 89 00              jmp16	avm_test_main+358
 e1 47 01              call16	test_repeated_draws_one_binding
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+236
 d4 00                 jmp8	avm_test_main+230
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 7a                 jmp8	avm_test_main+358
 e1 17 02              call16	test_rebinding
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+251
 d4 00                 jmp8	avm_test_main+245
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 6b                 jmp8	avm_test_main+358
 e1 e3 02              call16	test_explicit_draw_does_not_rebind
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+266
 d4 00                 jmp8	avm_test_main+260
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 5c                 jmp8	avm_test_main+358
 c6 79 09              ldi16	r6, 0x979
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c0 09                 ldi8	r4, 0x9
 e1 9d 03              call16	test_zero_dimension
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+290
 d4 00                 jmp8	avm_test_main+284
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 44                 jmp8	avm_test_main+358
 c6 7b 09              ldi16	r6, 0x97b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c0 0a                 ldi8	r4, 0xa
 e1 85 03              call16	test_zero_dimension
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+314
 d4 00                 jmp8	avm_test_main+308
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 2c                 jmp8	avm_test_main+358
 d6 fb                 adjsp	-0x5
 c0 01                 ldi8	r4, 0x1
 f4 4c                 stsp16	[sp+0x3], r4
 c4 7d 09              ldi16	r4, 0x97d
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0b                 ldi8	r4, 0xb
 c1 c3                 ldi8	r5, 0xc3
 c2 80                 ldi8	r6, 0x80
 c3 40                 ldi8	r7, 0x40
 d5 49                 call8	compare_one
 d6 05                 adjsp	0x5
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+353
 d4 00                 jmp8	avm_test_main+347
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 05                 jmp8	avm_test_main+358
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	avm_test_main+358
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 02                 adjsp	0x2
 ef                    ret

<test_set_sprite_preserves_framebuffer>:
 d6 fc                 adjsp	-0x4
 c0 a6                 ldi8	r4, 0xa6
 f4 40                 stsp16	[sp+0x0], r4
 e1 7e 03              call16	prepare_framebuffer
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 59 09              ldi16	r6, 0x959
 c3 00                 ldi8	r7, 0x0
 b4                    push16	r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d7 22                 sys	set_sprite
 bc                    pop16	r4
 e1 7f 03              call16	framebuffer_is_filled_with
 f6 2c                 tst16	r4
 d1 0a                 brne8	test_set_sprite_preserves_framebuffer+39
 d4 00                 jmp8	test_set_sprite_preserves_framebuffer+31
 a0                    xor	r4, r4
 e1 b0 03              call16	fail_case
 f4 48                 stsp16	[sp+0x2], r4
 d4 05                 jmp8	test_set_sprite_preserves_framebuffer+44
 a0                    xor	r4, r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	test_set_sprite_preserves_framebuffer+44
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 04                 adjsp	0x4
 ef                    ret

<compare_one>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 f0 1d 1f              ldsp8u	r5, [sp+0x1f]
 f0 39 10              stsp16	[sp+0x10], r1
 f0 28 0f              stsp8	[sp+0xf], r0
 f4 76                 stsp16	[sp+0xd], r6
 f4 6f                 stsp16	[sp+0xb], r7
 f4 60                 stsp16	[sp+0x8], r4
 f1 59                 stsp8	[sp+0xa], r5
 f3 7c                 ldsp8u	r4, [sp+0xf]
 e1 31 03              call16	prepare_framebuffer
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 2d                 ldsp16	r5, [sp+0xb]
 f4 22                 ldsp16	r6, [sp+0x8]
 f3 6b                 ldsp8u	r7, [sp+0xa]
 f0 30 20              ldsp16	r0, [sp+0x20]
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 20                 sys	draw_sprite_self_masked
 bb                    pop16	r3
 f0 14 06              leasp	r4, 0x6
 f0 15 04              leasp	r5, 0x4
 e1 09 04              call16	digest_framebuffer
 f4 20                 ldsp16	r4, [sp+0x8]
 f3 69                 ldsp8u	r5, [sp+0xa]
 d7 22                 sys	set_sprite
 f3 7c                 ldsp8u	r4, [sp+0xf]
 e1 08 03              call16	prepare_framebuffer
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 2d                 ldsp16	r5, [sp+0xb]
 f0 36 20              ldsp16	r6, [sp+0x20]
 d7 25                 sys	draw_self_masked
 f0 14 02              leasp	r4, 0x2
 f0 15 00              leasp	r5, 0x0
 e1 ec 03              call16	digest_framebuffer
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 e1 50 04              call16	digest_matches
 f6 2c                 tst16	r4
 d1 0d                 brne8	compare_one+124
 d4 00                 jmp8	compare_one+113
 f0 34 10              ldsp16	r4, [sp+0x10]
 e1 2b 03              call16	fail_case
 f0 3c 12              stsp16	[sp+0x12], r4
 d4 06                 jmp8	compare_one+130
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 d4 00                 jmp8	compare_one+130
 f0 34 12              ldsp16	r4, [sp+0x12]
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<test_repeated_draws_one_binding>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 c0 3c                 ldi8	r4, 0x3c
 f4 58                 stsp16	[sp+0x6], r4
 e1 be 02              call16	prepare_framebuffer
 c6 59 09              ldi16	r6, 0x959
 c3 00                 ldi8	r7, 0x0
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 a0                    xor	r4, r4
 f4 60                 stsp16	[sp+0x8], r4
 f0 03 05              ldi8	r3, 0x5
 f0 02 04              ldi8	r2, 0x4
 b2                    push16	r2
 b3                    push16	r3
 b6                    push16	r6
 f1 27                 mov	r5, r3
 f1 1f                 mov	r3, r7
 f1 04                 mov	r0, r4
 f1 22                 mov	r4, r2
 f1 16                 mov	r2, r6
 f1 28                 mov	r6, r0
 d7 20                 sys	draw_sprite_self_masked
 f0 01 01              ldi8	r1, 0x1
 c1 0a                 ldi8	r5, 0xa
 be                    pop16	r6
 bb                    pop16	r3
 ba                    pop16	r2
 f4 41                 stsp16	[sp+0x0], r5
 c0 1f                 ldi8	r4, 0x1f
 f4 68                 stsp16	[sp+0xa], r4
 b2                    push16	r2
 b3                    push16	r3
 b6                    push16	r6
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 29                 mov	r6, r1
 d7 20                 sys	draw_sprite_self_masked
 f0 00 02              ldi8	r0, 0x2
 be                    pop16	r6
 bb                    pop16	r3
 ba                    pop16	r2
 f0 38 0c              stsp16	[sp+0xc], r0
 c1 13                 ldi8	r5, 0x13
 f4 79                 stsp16	[sp+0xe], r5
 c0 44                 ldi8	r4, 0x44
 f0 3c 10              stsp16	[sp+0x10], r4
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 20                 sys	draw_sprite_self_masked
 bb                    pop16	r3
 ba                    pop16	r2
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 14 18              leasp	r4, 0x18
 f0 15 16              leasp	r5, 0x16
 e1 4e 03              call16	digest_framebuffer
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 18                 ldsp16	r4, [sp+0x6]
 b4                    push16	r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d7 22                 sys	set_sprite
 bc                    pop16	r4
 e1 49 02              call16	prepare_framebuffer
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 b5                    push16	r5
 b6                    push16	r6
 f1 27                 mov	r5, r3
 08                    mov	r6, r4
 f1 22                 mov	r4, r2
 d7 25                 sys	draw_self_masked
 be                    pop16	r6
 bd                    pop16	r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 b4                    push16	r4
 b5                    push16	r5
 b6                    push16	r6
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 d7 25                 sys	draw_self_masked
 be                    pop16	r6
 bd                    pop16	r5
 bc                    pop16	r4
 d7 25                 sys	draw_self_masked
 f0 14 14              leasp	r4, 0x14
 f0 15 12              leasp	r5, 0x12
 e1 11 03              call16	digest_framebuffer
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e1 71 03              call16	digest_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	test_repeated_draws_one_binding+207
 d4 00                 jmp8	test_repeated_draws_one_binding+197
 c0 06                 ldi8	r4, 0x6
 e1 4d 02              call16	fail_case
 f0 3c 1a              stsp16	[sp+0x1a], r4
 d4 06                 jmp8	test_repeated_draws_one_binding+213
 a0                    xor	r4, r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 d4 00                 jmp8	test_repeated_draws_one_binding+213
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d6 1c                 adjsp	0x1c
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
 d6 e4                 adjsp	-0x1c
 c0 69                 ldi8	r4, 0x69
 f4 40                 stsp16	[sp+0x0], r4
 e1 df 01              call16	prepare_framebuffer
 f0 04 59 09           ldi16	r0, 0x959
 f0 01 00              ldi8	r1, 0x0
 c2 01                 ldi8	r6, 0x1
 f4 4a                 stsp16	[sp+0x2], r6
 c1 07                 ldi8	r5, 0x7
 f4 51                 stsp16	[sp+0x4], r5
 c0 02                 ldi8	r4, 0x2
 f4 60                 stsp16	[sp+0x8], r4
 f1 10                 mov	r2, r0
 f1 19                 mov	r3, r1
 d7 20                 sys	draw_sprite_self_masked
 c6 7d 09              ldi16	r6, 0x97d
 c3 00                 ldi8	r7, 0x0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f2 4b                 sub	r3, r3
 f0 02 17              ldi8	r2, 0x17
 c0 36                 ldi8	r4, 0x36
 f4 58                 stsp16	[sp+0x6], r4
 b2                    push16	r2
 b3                    push16	r3
 f1 26                 mov	r5, r2
 f1 16                 mov	r2, r6
 f1 2b                 mov	r6, r3
 f1 1f                 mov	r3, r7
 d7 20                 sys	draw_sprite_self_masked
 bb                    pop16	r3
 ba                    pop16	r2
 f4 22                 ldsp16	r6, [sp+0x8]
 c1 31                 ldi8	r5, 0x31
 f4 79                 stsp16	[sp+0xe], r5
 c0 65                 ldi8	r4, 0x65
 f0 3c 10              stsp16	[sp+0x10], r4
 b2                    push16	r2
 b3                    push16	r3
 f1 10                 mov	r2, r0
 f1 19                 mov	r3, r1
 d7 20                 sys	draw_sprite_self_masked
 bb                    pop16	r3
 ba                    pop16	r2
 f0 14 18              leasp	r4, 0x18
 f0 15 16              leasp	r5, 0x16
 e1 7e 02              call16	digest_framebuffer
 f4 00                 ldsp16	r4, [sp+0x0]
 e1 83 01              call16	prepare_framebuffer
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 22                 ldsp16	r6, [sp+0x8]
 b4                    push16	r4
 b5                    push16	r5
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 22                 sys	set_sprite
 bd                    pop16	r5
 bc                    pop16	r4
 b6                    push16	r6
 b4                    push16	r4
 02                    mov	r4, r6
 09                    mov	r6, r5
 bd                    pop16	r5
 d7 25                 sys	draw_self_masked
 be                    pop16	r6
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 d7 22                 sys	set_sprite
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 34 10              ldsp16	r4, [sp+0x10]
 b4                    push16	r4
 b5                    push16	r5
 b6                    push16	r6
 03                    mov	r4, r7
 f1 26                 mov	r5, r2
 f1 2b                 mov	r6, r3
 d7 25                 sys	draw_self_masked
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 22                 sys	set_sprite
 be                    pop16	r6
 bd                    pop16	r5
 bc                    pop16	r4
 d7 25                 sys	draw_self_masked
 f0 14 14              leasp	r4, 0x14
 f0 15 12              leasp	r5, 0x12
 e1 36 02              call16	digest_framebuffer
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e1 96 02              call16	digest_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	test_rebinding+203
 d4 00                 jmp8	test_rebinding+193
 c0 07                 ldi8	r4, 0x7
 e1 72 01              call16	fail_case
 f0 3c 1a              stsp16	[sp+0x1a], r4
 d4 06                 jmp8	test_rebinding+209
 a0                    xor	r4, r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 d4 00                 jmp8	test_rebinding+209
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d6 1c                 adjsp	0x1c
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
 d6 e0                 adjsp	-0x20
 c0 96                 ldi8	r4, 0x96
 f4 48                 stsp16	[sp+0x2], r4
 e1 04 01              call16	prepare_framebuffer
 c6 59 09              ldi16	r6, 0x959
 c3 00                 ldi8	r7, 0x0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 30                 sub	r0, r0
 f0 38 08              stsp16	[sp+0x8], r0
 c1 04                 ldi8	r5, 0x4
 f4 71                 stsp16	[sp+0xc], r5
 c0 06                 ldi8	r4, 0x6
 f4 78                 stsp16	[sp+0xe], r4
 b6                    push16	r6
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 20                 sys	draw_sprite_self_masked
 f0 06 7d 09           ldi16	r2, 0x97d
 f0 03 00              ldi8	r3, 0x0
 f0 01 01              ldi8	r1, 0x1
 c1 1a                 ldi8	r5, 0x1a
 be                    pop16	r6
 f4 41                 stsp16	[sp+0x0], r5
 c0 2f                 ldi8	r4, 0x2f
 f4 68                 stsp16	[sp+0xa], r4
 b6                    push16	r6
 f1 29                 mov	r6, r1
 d7 20                 sys	draw_sprite_self_masked
 f0 00 02              ldi8	r0, 0x2
 be                    pop16	r6
 f0 38 10              stsp16	[sp+0x10], r0
 c1 2b                 ldi8	r5, 0x2b
 f0 3d 12              stsp16	[sp+0x12], r5
 c0 5c                 ldi8	r4, 0x5c
 f0 3c 14              stsp16	[sp+0x14], r4
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 20                 sys	draw_sprite_self_masked
 bb                    pop16	r3
 ba                    pop16	r2
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 14 1c              leasp	r4, 0x1c
 f0 15 1a              leasp	r5, 0x1a
 e1 9a 01              call16	digest_framebuffer
 f4 08                 ldsp16	r4, [sp+0x2]
 e1 9f 00              call16	prepare_framebuffer
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 d7 22                 sys	set_sprite
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 25                 sys	draw_self_masked
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 34 14              ldsp16	r4, [sp+0x14]
 b4                    push16	r4
 b5                    push16	r5
 b6                    push16	r6
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 d7 20                 sys	draw_sprite_self_masked
 be                    pop16	r6
 bd                    pop16	r5
 bc                    pop16	r4
 d7 25                 sys	draw_self_masked
 f0 14 18              leasp	r4, 0x18
 f0 15 16              leasp	r5, 0x16
 e1 64 01              call16	digest_framebuffer
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 16              ldsp16	r7, [sp+0x16]
 e1 c4 01              call16	digest_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	test_explicit_draw_does_not_rebind+194
 d4 00                 jmp8	test_explicit_draw_does_not_rebind+184
 c0 08                 ldi8	r4, 0x8
 e1 a0 00              call16	fail_case
 f0 3c 1e              stsp16	[sp+0x1e], r4
 d4 06                 jmp8	test_explicit_draw_does_not_rebind+200
 a0                    xor	r4, r4
 f0 3c 1e              stsp16	[sp+0x1e], r4
 d4 00                 jmp8	test_explicit_draw_does_not_rebind+200
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_zero_dimension>:
 d6 f7                 adjsp	-0x9
 f4 54                 stsp16	[sp+0x5], r4
 f4 4a                 stsp16	[sp+0x2], r6
 f1 43                 stsp8	[sp+0x4], r7
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 51                 ldsp8u	r5, [sp+0x4]
 d7 22                 sys	set_sprite
 c0 5a                 ldi8	r4, 0x5a
 f4 40                 stsp16	[sp+0x0], r4
 d5 2b                 call8	prepare_framebuffer
 f4 00                 ldsp16	r4, [sp+0x0]
 c7 34 12              ldi16	r7, 0x1234
 c2 1d                 ldi8	r6, 0x1d
 c5 db ff              ldi16	r5, 0xffdb
 b4                    push16	r4
 01                    mov	r4, r5
 06                    mov	r5, r6
 0b                    mov	r6, r7
 d7 25                 sys	draw_self_masked
 bc                    pop16	r4
 d5 29                 call8	framebuffer_is_filled_with
 f6 2c                 tst16	r4
 d1 0a                 brne8	test_zero_dimension+53
 d4 00                 jmp8	test_zero_dimension+45
 f4 14                 ldsp16	r4, [sp+0x5]
 d5 5a                 call8	fail_case
 f4 5c                 stsp16	[sp+0x7], r4
 d4 05                 jmp8	test_zero_dimension+58
 a0                    xor	r4, r4
 f4 5c                 stsp16	[sp+0x7], r4
 d4 00                 jmp8	test_zero_dimension+58
 f4 1c                 ldsp16	r4, [sp+0x7]
 d6 09                 adjsp	0x9
 ef                    ret

<prepare_framebuffer>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 41                 ldsp8u	r5, [sp+0x0]
 c6 00 04              ldi16	r6, 0x400
 c4 00 05              ldi16	r4, 0x500
 d7 11                 sys	memset
 d6 01                 adjsp	0x1
 ef                    ret

<framebuffer_is_filled_with>:
 d6 fb                 adjsp	-0x5
 f1 38                 stsp8	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	framebuffer_is_filled_with+9
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 00 04              ldi16	r5, 0x400
 31                    cmp	r4, r5
 d0 1f                 breq8	framebuffer_is_filled_with+48
 d4 00                 jmp8	framebuffer_is_filled_with+19
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 00 05              ldi16	r5, 0x500
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f3 49                 ldsp8u	r5, [sp+0x2]
 31                    cmp	r4, r5
 d0 07                 breq8	framebuffer_is_filled_with+38
 d4 00                 jmp8	framebuffer_is_filled_with+33
 a0                    xor	r4, r4
 f4 4c                 stsp16	[sp+0x3], r4
 d4 10                 jmp8	framebuffer_is_filled_with+54
 d4 00                 jmp8	framebuffer_is_filled_with+40
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 d9                 jmp8	framebuffer_is_filled_with+9
 c0 01                 ldi8	r4, 0x1
 f4 4c                 stsp16	[sp+0x3], r4
 d4 00                 jmp8	framebuffer_is_filled_with+54
 f4 0c                 ldsp16	r4, [sp+0x3]
 d6 05                 adjsp	0x5
 ef                    ret

<fail_case>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 c4 00 01              ldi16	r4, 0x100
 d5 05                 call8	test_line16
 c0 01                 ldi8	r4, 0x1
 d6 02                 adjsp	0x2
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 0f                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 2d                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 34                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d5 25                 call8	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<test_puts>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_puts+6
 f4 00                 ldsp16	r4, [sp+0x0]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d0 10                 breq8	test_puts+31
 d4 00                 jmp8	test_puts+17
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f4 41                 stsp16	[sp+0x0], r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 d5 05                 call8	test_putc
 d4 e7                 jmp8	test_puts+6
 d6 02                 adjsp	0x2
 ef                    ret

<test_putc>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex16>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 d5 07                 call8	test_hex8
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 03                 call8	test_hex8
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 fa 74                 lsr16i	r4, 0x4
 d5 0f                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d8                 call8	test_putc
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 07                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d0                 call8	test_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex_digit>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 0a                 cmpi.s8	r4, 0xa
 d9 0c                 brsge8	test_hex_digit+29
 d4 00                 jmp8	test_hex_digit+19
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 30                 addi.s8	r4, 0x30
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 0a                 jmp8	test_hex_digit+39
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 37                 addi.s8	r4, 0x37
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_hex_digit+39
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 03                 adjsp	0x3
 ef                    ret

<digest_framebuffer>:
 d6 f4                 adjsp	-0xc
 f4 68                 stsp16	[sp+0xa], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 1c 81              ldi16	r4, 0x811c
 f4 58                 stsp16	[sp+0x6], r4
 c4 37 9e              ldi16	r4, 0x9e37
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	digest_framebuffer+21
 f4 08                 ldsp16	r4, [sp+0x2]
 c5 00 04              ldi16	r5, 0x400
 31                    cmp	r4, r5
 d0 45                 breq8	digest_framebuffer+98
 d4 00                 jmp8	digest_framebuffer+31
 f4 08                 ldsp16	r4, [sp+0x2]
 c5 00 05              ldi16	r5, 0x500
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f4 40                 stsp16	[sp+0x0], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 08                 ldsp16	r4, [sp+0x2]
 14                    add	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 a1                    xor	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 15                    add	r5, r5
 11                    add	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 fa 89                 lsr16i	r5, 0x9
 fa 37                 lsl16i	r4, 0x7
 91                    or	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 10                 ldsp16	r4, [sp+0x4]
 a1                    xor	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	digest_framebuffer+90
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f4 48                 stsp16	[sp+0x2], r4
 d4 b3                 jmp8	digest_framebuffer+21
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 28                 ldsp16	r4, [sp+0xa]
 71                    st16	[r4], r5
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 71                    st16	[r4], r5
 d6 0c                 adjsp	0xc
 ef                    ret

<digest_matches>:
 d6 f6                 adjsp	-0xa
 f4 60                 stsp16	[sp+0x8], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 12                 ldsp16	r6, [sp+0x4]
 a0                    xor	r4, r4
 36                    cmp	r5, r6
 f4 40                 stsp16	[sp+0x0], r4
 d1 0d                 brne8	digest_matches+33
 d4 00                 jmp8	digest_matches+22
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 09                 ldsp16	r5, [sp+0x2]
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	digest_matches+33
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 0a                 adjsp	0xa
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
