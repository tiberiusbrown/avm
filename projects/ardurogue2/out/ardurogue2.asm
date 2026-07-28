
C:/Users/Brown/Documents/GitHub/avm/build/projects/ardurogue2/ardurogue2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0.c
00000000 l    df *ABS*	00000000 main.cpp
00000000 l    df *ABS*	00000000 avm.c
00000103 l     O .data	00000001 just_rendered
00000102 l     O .data	00000001 frame_duration_ms
00000104 l     O .data	00000001 frame_start
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000004 _start
00000204 g     F .text	00000028 main
00000275 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer
00000242 g     F .text	00000033 avm_next_frame
00000100 g     O .data	00000002 x
0000022c g     F .text	00000016 avm_set_frame_rate

Disassembly of section .text:

<_start>:
 d5 02                 call8	main
 d5 71                 call8	avm_halt

<main>:
 b0                    push16	r0
 c0 14                 ldi8	r4, 0x14
 d5 23                 call8	avm_set_frame_rate
 f0 00 01              ldi8	r0, 0x1
 d5 34                 call8	avm_next_frame
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d0 f8                 breq8	main+8
 f0 54 00 01           ldm16	r4, [0x100]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f0 5d 00 01           stm16	[0x100], r5
 c1 0a                 ldi8	r5, 0xa
 c2 14                 ldi8	r6, 0x14
 0e                    mov	r7, r6
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 1d                 sys	display
 d4 e0                 jmp8	main+8

<avm_set_frame_rate>:
 c1 01                 ldi8	r5, 0x1
 f0 4d 03 01           stm8	[0x103], r5
 c5 e8 03              ldi16	r5, 0x3e8
 ec 2c                 udiv16	r5, r4
 f0 4d 02 01           stm8	[0x102], r5
 d7 02                 sys	millis
 f0 4c 04 01           stm8	[0x104], r4
 ef                    ret

<avm_next_frame>:
 f0 44 03 01           ldm8u	r4, [0x103]
 cc 01                 cmpi.s8	r4, 0x1
 d1 03                 brne8	avm_next_frame+11
 a0                    xor	r4, r4
 d4 23                 jmp8	avm_next_frame+46
 d7 02                 sys	millis
 f0 46 04 01           ldm8u	r6, [0x104]
 04                    mov	r5, r4
 26                    sub	r5, r6
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f0 46 02 01           ldm8u	r6, [0x102]
 3e                    cmp	r7, r6
 d8 0b                 bruge8	avm_next_frame+40
 a0                    xor	r4, r4
 f4 ad                 inc16	r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 d8 0d                 bruge8	avm_next_frame+50
 d7 2a                 sys	idle
 ef                    ret
 f0 4c 04 01           stm8	[0x104], r4
 c0 01                 ldi8	r4, 0x1
 f0 4c 03 01           stm8	[0x103], r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
