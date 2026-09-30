
tilesrect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	00000044 avm_run_constructors
00000162 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 tilesrect.c
00000000 l    df *ABS*	00000000 runtime.c
000003df l       .init_array	00000000 .hidden __init_array_end
000003df l       .init_array	00000000 .hidden __init_array_start
000003df l       .fini_array	00000000 .hidden __fini_array_start
000003df l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
000001c7 g     F .text	00000216 avm_test_main
000003dd g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 bf 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 df 03              ldi16	r4, 0x3df
 c1 00                 ldi8	r5, 0x0
 c6 df 03              ldi16	r6, 0x3df
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 df 03           ldi16	r0, 0x3df
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 df 03           ldi16	r2, 0x3df
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fe              call16	-375
 c4 df 03              ldi16	r4, 0x3df
 c1 00                 ldi8	r5, 0x0
 c6 df 03              ldi16	r6, 0x3df
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 df 03           ldi16	r2, 0x3df
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 df 03           ldi16	r0, 0x3df
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fe              call16	-448
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b0                    push16	r0
 d7 01                 sys	debug_break
 f2 30                 sub	r0, r0
 a5                    xor	r5, r5
 c2 08                 ldi8	r6, 0x8
 c3 08                 ldi8	r7, 0x8
 a0                    xor	r4, r4
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 c0 02                 ldi8	r4, 0x2
 d7 28                 sys	draw_filled_rect_black
 c0 03                 ldi8	r4, 0x3
 d7 27                 sys	draw_filled_rect_white
 c0 04                 ldi8	r4, 0x4
 d7 28                 sys	draw_filled_rect_black
 c0 05                 ldi8	r4, 0x5
 d7 27                 sys	draw_filled_rect_white
 c0 06                 ldi8	r4, 0x6
 d7 28                 sys	draw_filled_rect_black
 c0 07                 ldi8	r4, 0x7
 d7 27                 sys	draw_filled_rect_white
 c0 08                 ldi8	r4, 0x8
 d7 28                 sys	draw_filled_rect_black
 c0 09                 ldi8	r4, 0x9
 d7 27                 sys	draw_filled_rect_white
 c0 0a                 ldi8	r4, 0xa
 d7 28                 sys	draw_filled_rect_black
 c0 0b                 ldi8	r4, 0xb
 d7 27                 sys	draw_filled_rect_white
 c0 0c                 ldi8	r4, 0xc
 d7 28                 sys	draw_filled_rect_black
 c0 0d                 ldi8	r4, 0xd
 d7 27                 sys	draw_filled_rect_white
 c0 0e                 ldi8	r4, 0xe
 d7 28                 sys	draw_filled_rect_black
 c0 0f                 ldi8	r4, 0xf
 d7 27                 sys	draw_filled_rect_white
 c1 01                 ldi8	r5, 0x1
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 c0 02                 ldi8	r4, 0x2
 d7 27                 sys	draw_filled_rect_white
 c0 03                 ldi8	r4, 0x3
 d7 28                 sys	draw_filled_rect_black
 c0 04                 ldi8	r4, 0x4
 d7 27                 sys	draw_filled_rect_white
 c0 05                 ldi8	r4, 0x5
 d7 28                 sys	draw_filled_rect_black
 c0 06                 ldi8	r4, 0x6
 d7 27                 sys	draw_filled_rect_white
 c0 07                 ldi8	r4, 0x7
 d7 28                 sys	draw_filled_rect_black
 c0 08                 ldi8	r4, 0x8
 d7 27                 sys	draw_filled_rect_white
 c0 09                 ldi8	r4, 0x9
 d7 28                 sys	draw_filled_rect_black
 c0 0a                 ldi8	r4, 0xa
 d7 27                 sys	draw_filled_rect_white
 c0 0b                 ldi8	r4, 0xb
 d7 28                 sys	draw_filled_rect_black
 c0 0c                 ldi8	r4, 0xc
 d7 27                 sys	draw_filled_rect_white
 c0 0d                 ldi8	r4, 0xd
 d7 28                 sys	draw_filled_rect_black
 c0 0e                 ldi8	r4, 0xe
 d7 27                 sys	draw_filled_rect_white
 c0 0f                 ldi8	r4, 0xf
 d7 28                 sys	draw_filled_rect_black
 c1 02                 ldi8	r5, 0x2
 a0                    xor	r4, r4
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 c0 02                 ldi8	r4, 0x2
 d7 28                 sys	draw_filled_rect_black
 c0 03                 ldi8	r4, 0x3
 d7 27                 sys	draw_filled_rect_white
 c0 04                 ldi8	r4, 0x4
 d7 28                 sys	draw_filled_rect_black
 c0 05                 ldi8	r4, 0x5
 d7 27                 sys	draw_filled_rect_white
 c0 06                 ldi8	r4, 0x6
 d7 28                 sys	draw_filled_rect_black
 c0 07                 ldi8	r4, 0x7
 d7 27                 sys	draw_filled_rect_white
 c0 08                 ldi8	r4, 0x8
 d7 28                 sys	draw_filled_rect_black
 c0 09                 ldi8	r4, 0x9
 d7 27                 sys	draw_filled_rect_white
 c0 0a                 ldi8	r4, 0xa
 d7 28                 sys	draw_filled_rect_black
 c0 0b                 ldi8	r4, 0xb
 d7 27                 sys	draw_filled_rect_white
 c0 0c                 ldi8	r4, 0xc
 d7 28                 sys	draw_filled_rect_black
 c0 0d                 ldi8	r4, 0xd
 d7 27                 sys	draw_filled_rect_white
 c0 0e                 ldi8	r4, 0xe
 d7 28                 sys	draw_filled_rect_black
 c0 0f                 ldi8	r4, 0xf
 d7 27                 sys	draw_filled_rect_white
 c1 03                 ldi8	r5, 0x3
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 c0 02                 ldi8	r4, 0x2
 d7 27                 sys	draw_filled_rect_white
 c0 03                 ldi8	r4, 0x3
 d7 28                 sys	draw_filled_rect_black
 c0 04                 ldi8	r4, 0x4
 d7 27                 sys	draw_filled_rect_white
 c0 05                 ldi8	r4, 0x5
 d7 28                 sys	draw_filled_rect_black
 c0 06                 ldi8	r4, 0x6
 d7 27                 sys	draw_filled_rect_white
 c0 07                 ldi8	r4, 0x7
 d7 28                 sys	draw_filled_rect_black
 c0 08                 ldi8	r4, 0x8
 d7 27                 sys	draw_filled_rect_white
 c0 09                 ldi8	r4, 0x9
 d7 28                 sys	draw_filled_rect_black
 c0 0a                 ldi8	r4, 0xa
 d7 27                 sys	draw_filled_rect_white
 c0 0b                 ldi8	r4, 0xb
 d7 28                 sys	draw_filled_rect_black
 c0 0c                 ldi8	r4, 0xc
 d7 27                 sys	draw_filled_rect_white
 c0 0d                 ldi8	r4, 0xd
 d7 28                 sys	draw_filled_rect_black
 c0 0e                 ldi8	r4, 0xe
 d7 27                 sys	draw_filled_rect_white
 c0 0f                 ldi8	r4, 0xf
 d7 28                 sys	draw_filled_rect_black
 c1 04                 ldi8	r5, 0x4
 a0                    xor	r4, r4
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 c0 02                 ldi8	r4, 0x2
 d7 28                 sys	draw_filled_rect_black
 c0 03                 ldi8	r4, 0x3
 d7 27                 sys	draw_filled_rect_white
 c0 04                 ldi8	r4, 0x4
 d7 28                 sys	draw_filled_rect_black
 c0 05                 ldi8	r4, 0x5
 d7 27                 sys	draw_filled_rect_white
 c0 06                 ldi8	r4, 0x6
 d7 28                 sys	draw_filled_rect_black
 c0 07                 ldi8	r4, 0x7
 d7 27                 sys	draw_filled_rect_white
 c0 08                 ldi8	r4, 0x8
 d7 28                 sys	draw_filled_rect_black
 c0 09                 ldi8	r4, 0x9
 d7 27                 sys	draw_filled_rect_white
 c0 0a                 ldi8	r4, 0xa
 d7 28                 sys	draw_filled_rect_black
 c0 0b                 ldi8	r4, 0xb
 d7 27                 sys	draw_filled_rect_white
 c0 0c                 ldi8	r4, 0xc
 d7 28                 sys	draw_filled_rect_black
 c0 0d                 ldi8	r4, 0xd
 d7 27                 sys	draw_filled_rect_white
 c0 0e                 ldi8	r4, 0xe
 d7 28                 sys	draw_filled_rect_black
 c0 0f                 ldi8	r4, 0xf
 d7 27                 sys	draw_filled_rect_white
 c1 05                 ldi8	r5, 0x5
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 c0 02                 ldi8	r4, 0x2
 d7 27                 sys	draw_filled_rect_white
 c0 03                 ldi8	r4, 0x3
 d7 28                 sys	draw_filled_rect_black
 c0 04                 ldi8	r4, 0x4
 d7 27                 sys	draw_filled_rect_white
 c0 05                 ldi8	r4, 0x5
 d7 28                 sys	draw_filled_rect_black
 c0 06                 ldi8	r4, 0x6
 d7 27                 sys	draw_filled_rect_white
 c0 07                 ldi8	r4, 0x7
 d7 28                 sys	draw_filled_rect_black
 c0 08                 ldi8	r4, 0x8
 d7 27                 sys	draw_filled_rect_white
 c0 09                 ldi8	r4, 0x9
 d7 28                 sys	draw_filled_rect_black
 c0 0a                 ldi8	r4, 0xa
 d7 27                 sys	draw_filled_rect_white
 c0 0b                 ldi8	r4, 0xb
 d7 28                 sys	draw_filled_rect_black
 c0 0c                 ldi8	r4, 0xc
 d7 27                 sys	draw_filled_rect_white
 c0 0d                 ldi8	r4, 0xd
 d7 28                 sys	draw_filled_rect_black
 c0 0e                 ldi8	r4, 0xe
 d7 27                 sys	draw_filled_rect_white
 c0 0f                 ldi8	r4, 0xf
 d7 28                 sys	draw_filled_rect_black
 c1 06                 ldi8	r5, 0x6
 a0                    xor	r4, r4
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 c0 02                 ldi8	r4, 0x2
 d7 28                 sys	draw_filled_rect_black
 c0 03                 ldi8	r4, 0x3
 d7 27                 sys	draw_filled_rect_white
 c0 04                 ldi8	r4, 0x4
 d7 28                 sys	draw_filled_rect_black
 c0 05                 ldi8	r4, 0x5
 d7 27                 sys	draw_filled_rect_white
 c0 06                 ldi8	r4, 0x6
 d7 28                 sys	draw_filled_rect_black
 c0 07                 ldi8	r4, 0x7
 d7 27                 sys	draw_filled_rect_white
 c0 08                 ldi8	r4, 0x8
 d7 28                 sys	draw_filled_rect_black
 c0 09                 ldi8	r4, 0x9
 d7 27                 sys	draw_filled_rect_white
 c0 0a                 ldi8	r4, 0xa
 d7 28                 sys	draw_filled_rect_black
 c0 0b                 ldi8	r4, 0xb
 d7 27                 sys	draw_filled_rect_white
 c0 0c                 ldi8	r4, 0xc
 d7 28                 sys	draw_filled_rect_black
 c0 0d                 ldi8	r4, 0xd
 d7 27                 sys	draw_filled_rect_white
 c0 0e                 ldi8	r4, 0xe
 d7 28                 sys	draw_filled_rect_black
 c0 0f                 ldi8	r4, 0xf
 d7 27                 sys	draw_filled_rect_white
 c1 07                 ldi8	r5, 0x7
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 c0 02                 ldi8	r4, 0x2
 d7 27                 sys	draw_filled_rect_white
 c0 03                 ldi8	r4, 0x3
 d7 28                 sys	draw_filled_rect_black
 c0 04                 ldi8	r4, 0x4
 d7 27                 sys	draw_filled_rect_white
 c0 05                 ldi8	r4, 0x5
 d7 28                 sys	draw_filled_rect_black
 c0 06                 ldi8	r4, 0x6
 d7 27                 sys	draw_filled_rect_white
 c0 07                 ldi8	r4, 0x7
 d7 28                 sys	draw_filled_rect_black
 c0 08                 ldi8	r4, 0x8
 d7 27                 sys	draw_filled_rect_white
 c0 09                 ldi8	r4, 0x9
 d7 28                 sys	draw_filled_rect_black
 c0 0a                 ldi8	r4, 0xa
 d7 27                 sys	draw_filled_rect_white
 c0 0b                 ldi8	r4, 0xb
 d7 28                 sys	draw_filled_rect_black
 c0 0c                 ldi8	r4, 0xc
 d7 27                 sys	draw_filled_rect_white
 c0 0d                 ldi8	r4, 0xd
 d7 28                 sys	draw_filled_rect_black
 c0 0e                 ldi8	r4, 0xe
 d7 27                 sys	draw_filled_rect_white
 c0 0f                 ldi8	r4, 0xf
 d7 28                 sys	draw_filled_rect_black
 d7 01                 sys	debug_break
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
