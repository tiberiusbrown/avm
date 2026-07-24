
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strcmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strcmp_p.c
00000100 l     O .data	00000041 .L.str
00000141 l     O .data	00000041 lhs
000002a5 l     O .rodata	00000001 p_empty
00000182 l     O .data	00000001 .L.str.1
00000328 l     O .rodata	00000041 p_last_diff
000002e7 l     O .rodata	00000041 p_first_diff
000002a6 l     O .rodata	00000041 p_equal
00000369 l     O .rodata	00000011 p_prefix
00000183 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000008d avm_test_main
000002a3 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 8d 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 01              ldi16	r4, 0x100
 c5 41 01              ldi16	r5, 0x141
 c2 40                 ldi8	r6, 0x40
 f7 07                 ld8u	r7, [r4+]
 f6 0f                 st8	[r5+], r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+14
 a0                    xor	r4, r4
 f0 4c 81 01           stm8	[0x181], r4
 d7 01                 sys	debug_break
 c6 a5 02              ldi16	r6, 0x2a5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 82 01              ldi16	r4, 0x182
 d7 14                 sys	strcmp_p
 f4 48                 stsp16	[sp+0x2], r4
 c6 28 03              ldi16	r6, 0x328
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 04 41 01           ldi16	r0, 0x141
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 f4 40                 stsp16	[sp+0x0], r4
 c6 e7 02              ldi16	r6, 0x2e7
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 f1 0c                 mov	r1, r4
 f0 06 a6 02           ldi16	r2, 0x2a6
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f1 20                 mov	r4, r0
 f2 6b                 mov32	q3, q1
 d7 14                 sys	strcmp_p
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 4c 51 01           stm8	[0x151], r4
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 c2 61                 ldi8	r6, 0x61
 f0 4e 51 01           stm8	[0x151], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 16                    add	r5, r6
 f2 25                 add	r5, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 16                    add	r5, r6
 14                    add	r5, r4
 c6 69 03              ldi16	r6, 0x369
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 11                    add	r4, r5
 f0 5c 83 01           stm16	[0x183], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
