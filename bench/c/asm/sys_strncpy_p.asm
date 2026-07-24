
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strncpy_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strncpy_p.c
000002aa l     O .rodata	00000021 source32
00000100 l     O .data	00000001 destination0
00000101 l     O .data	00000002 n0
00000103 l     O .data	00000002 destination1
00000105 l     O .data	00000002 n1
000002cb l     O .rodata	00000004 source3
00000107 l     O .data	00000008 destination_pad8
0000010f l     O .data	00000002 n8
000002cf l     O .rodata	00000009 source8
00000111 l     O .data	00000008 destination_exact8
00000119 l     O .data	00000008 destination_trunc8
00000121 l     O .data	00000020 destination_pad32
00000141 l     O .data	00000002 n32
00000143 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000092 avm_test_main
000002a8 g     F .text	00000002 avm_halt

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
 e1 92 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 04 aa 02           ldi16	r0, 0x2aa
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c6 00 01              ldi16	r6, 0x100
 f0 57 01 01           ldm16	r7, [0x101]
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 16                 sys	strncpy_p
 c6 03 01              ldi16	r6, 0x103
 f0 57 05 01           ldm16	r7, [0x105]
 02                    mov	r4, r6
 f1 28                 mov	r6, r0
 07                    mov	r5, r7
 f1 2d                 mov	r7, r1
 d7 16                 sys	strncpy_p
 f0 06 cb 02           ldi16	r2, 0x2cb
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 c4 07 01              ldi16	r4, 0x107
 f0 56 0f 01           ldm16	r6, [0x10f]
 f1 2f                 mov	r7, r3
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 16                 sys	strncpy_p
 c6 cf 02              ldi16	r6, 0x2cf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 11 01              ldi16	r5, 0x111
 f0 54 0f 01           ldm16	r4, [0x10f]
 b4                    push16	r4
 01                    mov	r4, r5
 bd                    pop16	r5
 d7 16                 sys	strncpy_p
 c4 19 01              ldi16	r4, 0x119
 f0 55 0f 01           ldm16	r5, [0x10f]
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 d7 16                 sys	strncpy_p
 c4 21 01              ldi16	r4, 0x121
 f0 55 41 01           ldm16	r5, [0x141]
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 16                 sys	strncpy_p
 f0 44 0e 01           ldm8u	r4, [0x10e]
 f0 45 03 01           ldm8u	r5, [0x103]
 14                    add	r5, r4
 f0 44 20 01           ldm8u	r4, [0x120]
 11                    add	r4, r5
 f0 45 40 01           ldm8u	r5, [0x140]
 14                    add	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f0 5d 43 01           stm16	[0x143], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
