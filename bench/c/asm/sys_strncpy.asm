
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strncpy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strncpy.c
00000104 l     O .data	00000009 source8
00000100 l     O .data	00000004 source3
0000010d l     O .data	00000021 source32
0000012e l     O .data	00000001 destination0
0000012f l     O .data	00000002 n0
00000131 l     O .data	00000002 destination1
00000133 l     O .data	00000002 n1
00000135 l     O .data	00000008 destination_pad8
0000013d l     O .data	00000002 n8
0000013f l     O .data	00000008 destination_exact8
00000147 l     O .data	00000008 destination_trunc8
0000014f l     O .data	00000020 destination_pad32
0000016f l     O .data	00000002 n32
00000171 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000ca avm_test_main
000002e0 g     F .text	00000002 avm_halt

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
 e1 ca 00              call16	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 c4 65 66              ldi16	r4, 0x6665
 c5 67 68              ldi16	r5, 0x6867
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 61 62              ldi16	r4, 0x6261
 c5 63 64              ldi16	r5, 0x6463
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 61 62              ldi16	r4, 0x6261
 c1 63                 ldi8	r5, 0x63
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 c4 0d 01              ldi16	r4, 0x10d
 a5                    xor	r5, r5
 f0 4d 0c 01           stm8	[0x10c], r5
 f0 00 27              ldi8	r0, 0x27
 f0 01 41              ldi8	r1, 0x41
 09                    mov	r6, r5
 cd 1a                 cmpi.s8	r5, 0x1a
 f1 2c                 mov	r7, r0
 fc 39                 cmov.ult	r7, r1
 1e                    add	r7, r6
 f6 07                 st8	[r4+], r7
 f4 ae                 inc16	r6
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 ef                 brne8	avm_test_main+52
 a0                    xor	r4, r4
 f0 4c 2d 01           stm8	[0x12d], r4
 d7 01                 sys	debug_break
 c5 0d 01              ldi16	r5, 0x10d
 c6 2e 01              ldi16	r6, 0x12e
 f0 57 2f 01           ldm16	r7, [0x12f]
 b4                    push16	r4
 02                    mov	r4, r6
 0b                    mov	r6, r7
 d7 1b                 sys	strncpy
 bc                    pop16	r4
 c6 31 01              ldi16	r6, 0x131
 f0 57 33 01           ldm16	r7, [0x133]
 b4                    push16	r4
 02                    mov	r4, r6
 0b                    mov	r6, r7
 d7 1b                 sys	strncpy
 bc                    pop16	r4
 f0 04 00 01           ldi16	r0, 0x100
 c7 35 01              ldi16	r7, 0x135
 f0 56 3d 01           ldm16	r6, [0x13d]
 b4                    push16	r4
 b5                    push16	r5
 03                    mov	r4, r7
 f1 24                 mov	r5, r0
 d7 1b                 sys	strncpy
 bd                    pop16	r5
 bc                    pop16	r4
 f0 05 04 01           ldi16	r1, 0x104
 c7 3f 01              ldi16	r7, 0x13f
 f0 56 3d 01           ldm16	r6, [0x13d]
 b4                    push16	r4
 b5                    push16	r5
 03                    mov	r4, r7
 f1 25                 mov	r5, r1
 d7 1b                 sys	strncpy
 bd                    pop16	r5
 bc                    pop16	r4
 c6 47 01              ldi16	r6, 0x147
 f0 57 3d 01           ldm16	r7, [0x13d]
 b4                    push16	r4
 02                    mov	r4, r6
 0b                    mov	r6, r7
 d7 1b                 sys	strncpy
 bc                    pop16	r4
 c5 4f 01              ldi16	r5, 0x14f
 f0 56 6f 01           ldm16	r6, [0x16f]
 b4                    push16	r4
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 1b                 sys	strncpy
 bc                    pop16	r4
 f0 45 3c 01           ldm8u	r5, [0x13c]
 f0 46 31 01           ldm8u	r6, [0x131]
 19                    add	r6, r5
 f0 45 4e 01           ldm8u	r5, [0x14e]
 16                    add	r5, r6
 f0 46 6e 01           ldm8u	r6, [0x16e]
 19                    add	r6, r5
 ca 06                 addi.s8	r6, 0x6
 f0 5e 71 01           stm16	[0x171], r6
 d7 01                 sys	debug_break
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
