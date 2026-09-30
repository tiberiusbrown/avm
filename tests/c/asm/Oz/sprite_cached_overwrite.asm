
sprite_cached_overwrite.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sprite_cached_overwrite.c
000006e8 l     O .rodata	00000020 sprite_a
0000064c l     F .text	0000001f framebuffer_is_filled_with
000005a1 l     F .text	0000007c compare_one
00000699 l     F .text	0000004d digest_framebuffer
0000070c l     O .rodata	00000014 sprite_b
00000708 l     O .rodata	00000002 sprite_zero_width
0000061d l     F .text	0000002f test_zero_dimension
0000070a l     O .rodata	00000002 sprite_zero_height
0000066b l     F .text	0000002e fail_case
00000100 l     O .data	00000005 .L.str
00000000 l    df *ABS*	00000000 runtime.c
00000720 l       .init_array	00000000 .hidden __init_array_end
00000720 l       .init_array	00000000 .hidden __init_array_start
00000720 l       .fini_array	00000000 .hidden __fini_array_start
00000720 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000002ca avm_test_main
000006e6 g     F .text	00000002 avm_halt
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
 e1 c8 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 20 07              ldi16	r4, 0x720
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 20 07              ldi16	r6, 0x720
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 20 07           ldi16	r0, 0x720
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 20 07           ldi16	r2, 0x720
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
 c4 20 07              ldi16	r4, 0x720
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 20 07              ldi16	r6, 0x720
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 20 07           ldi16	r2, 0x720
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 20 07           ldi16	r0, 0x720
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
 d6 f4                 adjsp	-0xc
 c3 a6                 ldi8	r7, 0xa6
 f0 06 00 05           ldi16	r2, 0x500
 f1 22                 mov	r4, r2
 c1 a6                 ldi8	r5, 0xa6
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 03                    mov	r4, r7
 e1 55 03              call16	framebuffer_is_filled_with
 f4 a4                 tst8	r4
 da 86 02              breq16	avm_test_main+683
 d6 fb                 adjsp	-0x5
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 a5                    xor	r5, r5
 f4 4d                 stsp16	[sp+0x3], r5
 f0 00 01              ldi8	r0, 0x1
 c2 0a                 ldi8	r6, 0xa
 c3 08                 ldi8	r7, 0x8
 f1 20                 mov	r4, r0
 e1 8b 02              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 db 6c 02              brne16	avm_test_main+690
 d6 fb                 adjsp	-0x5
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f0 00 01              ldi8	r0, 0x1
 f0 38 03              stsp16	[sp+0x3], r0
 f0 01 02              ldi8	r1, 0x2
 c1 a5                 ldi8	r5, 0xa5
 c2 0a                 ldi8	r6, 0xa
 c3 08                 ldi8	r7, 0x8
 f1 21                 mov	r4, r1
 e1 65 02              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 db 46 02              brne16	avm_test_main+690
 d6 fb                 adjsp	-0x5
 f0 39 03              stsp16	[sp+0x3], r1
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c1 3c                 ldi8	r5, 0x3c
 c2 1b                 ldi8	r6, 0x1b
 c0 03                 ldi8	r4, 0x3
 0c                    mov	r7, r4
 e1 46 02              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 db 27 02              brne16	avm_test_main+690
 d6 fb                 adjsp	-0x5
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f0 00 01              ldi8	r0, 0x1
 f0 38 03              stsp16	[sp+0x3], r0
 c0 04                 ldi8	r4, 0x4
 c1 96                 ldi8	r5, 0x96
 c6 fe ff              ldi16	r6, 0xfffe
 c7 fb ff              ldi16	r7, 0xfffb
 e1 21 02              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 db 02 02              brne16	avm_test_main+690
 d6 fb                 adjsp	-0x5
 f0 39 03              stsp16	[sp+0x3], r1
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 05                 ldi8	r4, 0x5
 c1 69                 ldi8	r5, 0x69
 c2 7e                 ldi8	r6, 0x7e
 c3 3a                 ldi8	r7, 0x3a
 e1 01 02              call16	compare_one
 d6 05                 adjsp	0x5
 f4 a4                 tst8	r4
 db e2 01              brne16	avm_test_main+690
 f1 22                 mov	r4, r2
 c1 3c                 ldi8	r5, 0x3c
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 f1 0a                 mov	r1, r2
 f2 66                 mov32	q1, q2
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 c0 04                 ldi8	r4, 0x4
 c1 05                 ldi8	r5, 0x5
 aa                    xor	r6, r6
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d7 1e                 sys	draw_sprite_overwrite
 f0 00 01              ldi8	r0, 0x1
 c0 1f                 ldi8	r4, 0x1f
 c1 0a                 ldi8	r5, 0xa
 c2 01                 ldi8	r6, 0x1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d7 1e                 sys	draw_sprite_overwrite
 c0 44                 ldi8	r4, 0x44
 c1 13                 ldi8	r5, 0x13
 c2 02                 ldi8	r6, 0x2
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d7 1e                 sys	draw_sprite_overwrite
 f0 14 0a              leasp	r4, 0xa
 f0 15 08              leasp	r5, 0x8
 e1 a5 02              call16	digest_framebuffer
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c0 04                 ldi8	r4, 0x4
 c1 05                 ldi8	r5, 0x5
 aa                    xor	r6, r6
 d7 23                 sys	draw_overwrite
 c0 1f                 ldi8	r4, 0x1f
 c1 0a                 ldi8	r5, 0xa
 c2 01                 ldi8	r6, 0x1
 d7 23                 sys	draw_overwrite
 c0 44                 ldi8	r4, 0x44
 c1 13                 ldi8	r5, 0x13
 c2 02                 ldi8	r6, 0x2
 d7 23                 sys	draw_overwrite
 f0 14 06              leasp	r4, 0x6
 f0 15 04              leasp	r5, 0x4
 e1 75 02              call16	digest_framebuffer
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 2b                 ldsp16	r7, [sp+0xa]
 3e                    cmp	r7, r6
 db 62 01              brne16	avm_test_main+699
 34                    cmp	r5, r4
 db 5e 01              brne16	avm_test_main+699
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c6 e8 06              ldi16	r6, 0x6e8
 c3 00                 ldi8	r7, 0x0
 c0 02                 ldi8	r4, 0x2
 c1 07                 ldi8	r5, 0x7
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 0c 07              ldi16	r6, 0x70c
 c3 00                 ldi8	r7, 0x0
 c0 36                 ldi8	r4, 0x36
 c1 17                 ldi8	r5, 0x17
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c0 65                 ldi8	r4, 0x65
 c1 31                 ldi8	r5, 0x31
 c6 e8 06              ldi16	r6, 0x6e8
 c3 00                 ldi8	r7, 0x0
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1e                 sys	draw_sprite_overwrite
 f0 14 0a              leasp	r4, 0xa
 f0 15 08              leasp	r5, 0x8
 e1 27 02              call16	digest_framebuffer
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 c0 02                 ldi8	r4, 0x2
 c1 07                 ldi8	r5, 0x7
 c2 01                 ldi8	r6, 0x1
 d7 23                 sys	draw_overwrite
 c4 0c 07              ldi16	r4, 0x70c
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 c0 36                 ldi8	r4, 0x36
 c1 17                 ldi8	r5, 0x17
 aa                    xor	r6, r6
 d7 23                 sys	draw_overwrite
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 c0 65                 ldi8	r4, 0x65
 c1 31                 ldi8	r5, 0x31
 c2 02                 ldi8	r6, 0x2
 d7 23                 sys	draw_overwrite
 f0 14 06              leasp	r4, 0x6
 f0 15 04              leasp	r5, 0x4
 e1 e9 01              call16	digest_framebuffer
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 2b                 ldsp16	r7, [sp+0xa]
 3e                    cmp	r7, r6
 db da 00              brne16	avm_test_main+703
 34                    cmp	r5, r4
 db d6 00              brne16	avm_test_main+703
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c6 e8 06              ldi16	r6, 0x6e8
 c3 00                 ldi8	r7, 0x0
 c0 06                 ldi8	r4, 0x6
 c1 04                 ldi8	r5, 0x4
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 0c 07              ldi16	r6, 0x70c
 c3 00                 ldi8	r7, 0x0
 c0 2f                 ldi8	r4, 0x2f
 c1 1a                 ldi8	r5, 0x1a
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c0 5c                 ldi8	r4, 0x5c
 c1 2b                 ldi8	r5, 0x2b
 c6 e8 06              ldi16	r6, 0x6e8
 c3 00                 ldi8	r7, 0x0
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1e                 sys	draw_sprite_overwrite
 f0 14 0a              leasp	r4, 0xa
 f0 15 08              leasp	r5, 0x8
 e1 9b 01              call16	digest_framebuffer
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c4 e8 06              ldi16	r4, 0x6e8
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 c0 06                 ldi8	r4, 0x6
 c1 04                 ldi8	r5, 0x4
 aa                    xor	r6, r6
 d7 23                 sys	draw_overwrite
 c0 2f                 ldi8	r4, 0x2f
 c1 1a                 ldi8	r5, 0x1a
 f0 06 0c 07           ldi16	r2, 0x70c
 f0 03 00              ldi8	r3, 0x0
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c0 5c                 ldi8	r4, 0x5c
 c1 2b                 ldi8	r5, 0x2b
 c2 02                 ldi8	r6, 0x2
 d7 23                 sys	draw_overwrite
 f0 14 06              leasp	r4, 0x6
 f0 15 04              leasp	r5, 0x4
 e1 64 01              call16	digest_framebuffer
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 2b                 ldsp16	r7, [sp+0xa]
 3e                    cmp	r7, r6
 d1 5a                 brne8	avm_test_main+707
 34                    cmp	r5, r4
 d1 57                 brne8	avm_test_main+707
 c6 08 07              ldi16	r6, 0x708
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c0 09                 ldi8	r4, 0x9
 e1 ce 00              call16	test_zero_dimension
 f4 a4                 tst8	r4
 d1 36                 brne8	avm_test_main+690
 c6 0a 07              ldi16	r6, 0x70a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c0 0a                 ldi8	r4, 0xa
 e1 be 00              call16	test_zero_dimension
 f4 a4                 tst8	r4
 d1 26                 brne8	avm_test_main+690
 d6 fb                 adjsp	-0x5
 c0 01                 ldi8	r4, 0x1
 f4 4c                 stsp16	[sp+0x3], r4
 c4 0c 07              ldi16	r4, 0x70c
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c0 0b                 ldi8	r4, 0xb
 c1 c3                 ldi8	r5, 0xc3
 c2 80                 ldi8	r6, 0x80
 c3 40                 ldi8	r7, 0x40
 d5 25                 call8	compare_one
 d6 05                 adjsp	0x5
 f1 04                 mov	r0, r4
 d4 07                 jmp8	avm_test_main+690
 a0                    xor	r4, r4
 e1 e5 00              call16	fail_case
 f0 00 01              ldi8	r0, 0x1
 f1 20                 mov	r4, r0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 06                 ldi8	r4, 0x6
 d4 06                 jmp8	avm_test_main+709
 c0 07                 ldi8	r4, 0x7
 d4 02                 jmp8	avm_test_main+709
 c0 08                 ldi8	r4, 0x8
 e1 cc 00              call16	fail_case
 d4 e8                 jmp8	avm_test_main+690

<compare_one>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f1 1f                 mov	r3, r7
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 16                 mov	r2, r6
 f0 3a 08              stsp16	[sp+0x8], r2
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 37 22              ldsp16	r7, [sp+0x22]
 f4 53                 stsp16	[sp+0x4], r7
 f0 30 1f              ldsp16	r0, [sp+0x1f]
 f0 19 21              ldsp8u	r1, [sp+0x21]
 c4 00 05              ldi16	r4, 0x500
 f4 49                 stsp16	[sp+0x2], r5
 c6 00 04              ldi16	r6, 0x400
 f4 09                 ldsp16	r5, [sp+0x2]
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 f2 64                 mov32	q1, q0
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 f0 14 12              leasp	r4, 0x12
 f0 15 10              leasp	r5, 0x10
 e1 bb 00              call16	digest_framebuffer
 f2 68                 mov32	q2, q0
 d7 22                 sys	set_sprite
 c4 00 05              ldi16	r4, 0x500
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 d7 23                 sys	draw_overwrite
 f0 14 0e              leasp	r4, 0xe
 f0 15 0c              leasp	r5, 0xc
 e1 9c 00              call16	digest_framebuffer
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 12              ldsp16	r7, [sp+0x12]
 3e                    cmp	r7, r6
 d1 06                 brne8	compare_one+111
 34                    cmp	r5, r4
 d1 03                 brne8	compare_one+111
 a0                    xor	r4, r4
 d4 06                 jmp8	compare_one+117
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 57                 call8	fail_case
 c0 01                 ldi8	r4, 0x1
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_zero_dimension>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d7 22                 sys	set_sprite
 c3 5a                 ldi8	r7, 0x5a
 c4 00 05              ldi16	r4, 0x500
 c1 5a                 ldi8	r5, 0x5a
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c4 db ff              ldi16	r4, 0xffdb
 c1 1d                 ldi8	r5, 0x1d
 c6 34 12              ldi16	r6, 0x1234
 d7 23                 sys	draw_overwrite
 03                    mov	r4, r7
 d5 0f                 call8	framebuffer_is_filled_with
 f4 a4                 tst8	r4
 d0 03                 breq8	test_zero_dimension+39
 a0                    xor	r4, r4
 d4 06                 jmp8	test_zero_dimension+45
 f1 20                 mov	r4, r0
 d5 23                 call8	fail_case
 c0 01                 ldi8	r4, 0x1
 b8                    pop16	r0
 ef                    ret

<framebuffer_is_filled_with>:
 b1                    push16	r1
 b0                    push16	r0
 f1 0c                 mov	r1, r4
 c6 00 05              ldi16	r6, 0x500
 c7 00 04              ldi16	r7, 0x400
 c0 01                 ldi8	r4, 0x1
 f2 30                 sub	r0, r0
 f6 2f                 tst16	r7
 d0 0a                 breq8	framebuffer_is_filled_with+28
 f7 15                 ld8u	r5, [r6+]
 f4 b7                 dec16	r7
 f5 25                 cmp	r5, r1
 d0 f4                 breq8	framebuffer_is_filled_with+14
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<fail_case>:
 04                    mov	r5, r4
 c7 00 01              ldi16	r7, 0x100
 43                    ld8u	r4, [r7]
 f4 a4                 tst8	r4
 d0 06                 breq8	fail_case+15
 d7 00                 sys	debug_putc
 f4 af                 inc16	r7
 d4 f5                 jmp8	fail_case+4
 c0 30                 ldi8	r4, 0x30
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
 ef                    ret

<digest_framebuffer>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 49                 stsp16	[sp+0x2], r5
 f4 40                 stsp16	[sp+0x0], r4
 c5 1c 81              ldi16	r5, 0x811c
 c6 37 9e              ldi16	r6, 0x9e37
 f0 04 00 05           ldi16	r0, 0x500
 f2 39                 sub	r1, r1
 c4 00 04              ldi16	r4, 0x400
 f1 19                 mov	r3, r1
 f5 1c                 cmp	r3, r4
 d0 21                 breq8	digest_framebuffer+64
 f2 29                 add	r6, r1
 f0 6c 41              ld8u	r2, [r0+]
 f2 2a                 add	r6, r2
 0d                    mov	r7, r5
 fa ab                 lsr16i	r7, 0xb
 fa 45                 lsl16i	r5, 0x5
 97                    or	r5, r7
 f2 13                 add	r2, r3
 f9 aa                 xor	r5, r2
 0e                    mov	r7, r6
 fa a9                 lsr16i	r7, 0x9
 fa 57                 lsl16i	r6, 0x7
 9b                    or	r6, r7
 f0 09 02              addi.s8	r1, 0x2
 f4 ab                 inc16	r3
 a9                    xor	r6, r5
 f5 1c                 cmp	r3, r4
 d1 df                 brne8	digest_framebuffer+31
 f4 00                 ldsp16	r4, [sp+0x0]
 71                    st16	[r4], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 72                    st16	[r4], r6
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
