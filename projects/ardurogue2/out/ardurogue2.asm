
ardurogue2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0.c
0000020a l     F .text	0000004a avm_run_constructors
00000254 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 main.cpp
000003b7 l     O .rodata	0000000b .L.avm.flashstr.0
00000104 l     O .data	0000000b .L.str
00000000 l    df *ABS*	00000000 avm.c
00000110 l     O .data	00000001 just_rendered
0000010f l     O .data	00000001 frame_duration_ms
00000111 l     O .data	00000001 frame_start
00000000 l    df *ABS*	00000000 font_5x7.c
00000000 l    df *ABS*	00000000 runtime.c
00000839 l       .init_array	00000000 .hidden __init_array_end
00000839 l       .init_array	00000000 .hidden __init_array_start
00000839 l       .fini_array	00000000 .hidden __fini_array_start
00000839 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000000a _start
000002c3 g     F .text	000000a3 main
000003b5 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000500 g       *ABS*	00000000 __avm_framebuffer
00000382 g     F .text	00000033 avm_next_frame
00000102 g     O .data	00000002 y
00000100 g     O .data	00000002 x
00000366 g     F .text	0000001c avm_set_frame_rate
000003c2 g     O .rodata	00000477 _avm_font_5x7_storage

Disassembly of section .text:

<_start>:
 d5 08                 call8	avm_run_constructors
 e1 be 00              call16	main
 d5 4d                 call8	avm_run_destructors
 e1 ab 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 39 08              ldi16	r4, 0x839
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 39 08              ldi16	r6, 0x839
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 39 08           ldi16	r0, 0x839
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 39 08           ldi16	r2, 0x839
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
 e1 95 fd              call16	-619
 c4 39 08              ldi16	r4, 0x839
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 39 08              ldi16	r6, 0x839
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 39 08           ldi16	r2, 0x839
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 39 08           ldi16	r0, 0x839
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
 e1 44 fd              call16	-700
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<main>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 c0 32                 ldi8	r4, 0x32
 e1 99 00              call16	avm_set_frame_rate
 c4 c2 03              ldi16	r4, 0x3c2
 c1 00                 ldi8	r5, 0x0
 d7 31                 sys	set_text_font
 f0 00 01              ldi8	r0, 0x1
 c0 80                 ldi8	r4, 0x80
 f4 48                 stsp16	[sp+0x2], r4
 c0 10                 ldi8	r4, 0x10
 f4 40                 stsp16	[sp+0x0], r4
 f0 03 60              ldi8	r3, 0x60
 d4 37                 jmp8	main+88
 f0 55 02 01           ldm16	r5, [0x102]
 f4 51                 stsp16	[sp+0x4], r5
 03                    mov	r4, r7
 c2 14                 ldi8	r6, 0x14
 c3 14                 ldi8	r7, 0x14
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 27                 sys	draw_filled_rect_white
 d7 02                 sys	millis
 f4 60                 stsp16	[sp+0x8], r4
 f0 12 08              leasp	r2, 0x8
 c0 0a                 ldi8	r4, 0xa
 c1 32                 ldi8	r5, 0x32
 c6 b7 03              ldi16	r6, 0x3b7
 c3 00                 ldi8	r7, 0x0
 d7 36                 sys	draw_textfv_p
 d7 02                 sys	millis
 f4 58                 stsp16	[sp+0x6], r4
 f0 17 06              leasp	r7, 0x6
 c0 0a                 ldi8	r4, 0xa
 c1 3c                 ldi8	r5, 0x3c
 c6 04 01              ldi16	r6, 0x104
 f1 17                 mov	r2, r7
 d7 35                 sys	draw_textfv
 c0 01                 ldi8	r4, 0x1
 d7 1d                 sys	display
 d5 65                 call8	avm_next_frame
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d0 f8                 breq8	main+88
 d7 29                 sys	buttons
 04                    mov	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 0a                 breq8	main+116
 f0 55 02 01           ldm16	r5, [0x102]
 f4 b5                 dec16	r5
 f0 5d 02 01           stm16	[0x102], r5
 04                    mov	r5, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 0a                 breq8	main+134
 f0 55 02 01           ldm16	r5, [0x102]
 f4 ad                 inc16	r5
 f0 5d 02 01           stm16	[0x102], r5
 04                    mov	r5, r4
 fa 86                 lsr16i	r5, 0x6
 f9 a0                 and	r5, r0
 08                    mov	r6, r4
 fa 5a                 lsl16i	r6, 0xa
 fa df                 asr16i	r6, 0xf
 19                    add	r6, r5
 f0 57 00 01           ldm16	r7, [0x100]
 1e                    add	r7, r6
 f9 8c                 and	r4, r3
 f4 a4                 tst8	r4
 d0 85                 breq8	main+33
 f0 5f 00 01           stm16	[0x100], r7
 e0 7e ff              jmp16	main+33

<avm_set_frame_rate>:
 c1 01                 ldi8	r5, 0x1
 f0 4d 10 01           stm8	[0x110], r5
 c1 04                 ldi8	r5, 0x4
 cc 05                 cmpi.s8	r4, 0x5
 fc 6c                 cmov.uge	r5, r4
 c4 e8 03              ldi16	r4, 0x3e8
 ec 25                 udiv16	r4, r5
 f0 4c 0f 01           stm8	[0x10f], r4
 d7 02                 sys	millis
 f0 4c 11 01           stm8	[0x111], r4
 ef                    ret

<avm_next_frame>:
 f0 44 10 01           ldm8u	r4, [0x110]
 cc 01                 cmpi.s8	r4, 0x1
 d1 03                 brne8	avm_next_frame+11
 a0                    xor	r4, r4
 d4 23                 jmp8	avm_next_frame+46
 d7 02                 sys	millis
 f0 46 11 01           ldm8u	r6, [0x111]
 04                    mov	r5, r4
 26                    sub	r5, r6
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f0 46 0f 01           ldm8u	r6, [0x10f]
 3e                    cmp	r7, r6
 d8 0b                 bruge8	avm_next_frame+40
 a0                    xor	r4, r4
 f4 ad                 inc16	r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 d8 0d                 bruge8	avm_next_frame+50
 d7 2a                 sys	idle
 ef                    ret
 f0 4c 11 01           stm8	[0x111], r4
 c0 01                 ldi8	r4, 0x1
 f0 4c 10 01           stm8	[0x110], r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
