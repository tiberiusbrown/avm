
tile_cache_render.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 tile_cache_render.c
000002ba l     F .text	000000aa render_tile_cache
000003cb l     O .rodata	00000042 SPRITES
00000100 l     O .data	00000002 camera_x
00000102 l     O .data	00000002 camera_y
00000104 l     O .data	0000002d tile_cache
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
0000040d l       .init_array	00000000 .hidden __init_array_end
0000040d l       .init_array	00000000 .hidden __init_array_start
0000040d l       .fini_array	00000000 .hidden __fini_array_start
0000040d l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000053 avm_test_main
00000366 g     F .text	00000065 __avm_terminate
00000364 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 50 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 41 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 0d 04              ldi16	r4, 0x40d
 c1 00                 ldi8	r5, 0x0
 c6 0d 04              ldi16	r6, 0x40d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 0d 04           ldi16	r0, 0x40d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 0d 04           ldi16	r2, 0x40d
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f0 06 04 01           ldi16	r2, 0x104
 af                    xor	r7, r7
 c2 2d                 ldi8	r6, 0x2d
 c4 a3 ff              ldi16	r4, 0xffa3
 f4 40                 stsp16	[sp+0x0], r4
 f0 00 01              ldi8	r0, 0x1
 f0 05 ff ff           ldi16	r1, 0xffff
<L0>:
 03                    mov	r4, r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f6 31                 mul8	r4, r5
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 cc 18                 cmpi.s8	r4, 0x18
 fc 29                 cmov.ult	r5, r1
 f0 6d a5              st8	[r2+], r5
 f4 af                 inc16	r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 e9                 brne8	-0x17 <L0>
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
<L1>:
 f4 40                 stsp16	[sp+0x0], r4
 fa 72                 lsr16i	r4, 0x2
 f0 5c 02 01           stm16	[0x102], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 5c 00 01           stm16	[0x100], r4
 d5 11                 call8	render_tile_cache
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 e8                 brne8	-0x18 <L1>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<render_tile_cache>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 51 02 01           ldm16	r1, [0x102]
 f0 56 00 01           ldm16	r6, [0x100]
 c4 cb 03              ldi16	r4, 0x3cb
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f0 0d c1              cmpi.s8	r1, -0x3f
 de 8e 00              brslt16	0x8e <L10>
 c0 0f                 ldi8	r4, 0xf
 88                    and	r6, r4
 f2 42                 sub	r2, r2
 f1 02                 mov	r0, r2
 f2 36                 sub	r0, r6
 f2 41                 sub	r2, r1
 c7 04 01              ldi16	r7, 0x104
 f0 01 ff              ldi8	r1, 0xff
<L0>:
 4b                    ld8u	r6, [r7]
 f5 29                 cmp	r6, r1
 f1 20                 mov	r4, r0
 d0 04                 breq8	0x4 <L1>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L1>:
 ed ce 21              ld8u	r6, [r7+1]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L2>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L2>:
 ed ce 22              ld8u	r6, [r7+2]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L3>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L3>:
 ed ce 23              ld8u	r6, [r7+3]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L4>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L4>:
 ed ce 24              ld8u	r6, [r7+4]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L5>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L5>:
 ed ce 25              ld8u	r6, [r7+5]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L6>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L6>:
 ed ce 26              ld8u	r6, [r7+6]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L7>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L7>:
 ed ce 27              ld8u	r6, [r7+7]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L8>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L8>:
 ed ce 28              ld8u	r6, [r7+8]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L9>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L9>:
 cb 09                 addi.s8	r7, 0x9
 f0 0e 30              cmpi.s8	r2, 0x30
 f0 0a 10              addi.s8	r2, 0x10
 d3 83                 brslt8	-0x7d <L0>
<L10>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_terminate>:
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
 d0 03                 breq8	0x3 <L0>
 e1 85 fc              call16	-891 <__avm_run_local_dtors>
<L0>:
 c4 0d 04              ldi16	r4, 0x40d
 c1 00                 ldi8	r5, 0x0
 c6 0d 04              ldi16	r6, 0x40d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 0d 04           ldi16	r2, 0x40d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 0d 04           ldi16	r0, 0x40d
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 3c fc              call16	-964 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
