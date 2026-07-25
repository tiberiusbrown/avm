
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strcmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strcmp_p.c
00000100 l     O .data	00000041 .L.str
00000141 l     O .data	00000041 lhs
000002b0 l     O .rodata	00000001 p_empty
00000182 l     O .data	00000001 .L.str.1
00000333 l     O .rodata	00000041 p_last_diff
000002f2 l     O .rodata	00000041 p_first_diff
000002b1 l     O .rodata	00000041 p_equal
00000374 l     O .rodata	00000011 p_prefix
00000183 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000098 avm_test_main
000002ae g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 98 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
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
 c6 b0 02              ldi16	r6, 0x2b0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 82 01              ldi16	r4, 0x182
 d7 14                 sys	strcmp_p
 f4 50                 stsp16	[sp+0x4], r4
 c6 33 03              ldi16	r6, 0x333
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 41 01              ldi16	r5, 0x141
 01                    mov	r4, r5
 d7 14                 sys	strcmp_p
 f1 0c                 mov	r1, r4
 c6 f2 02              ldi16	r6, 0x2f2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 01                    mov	r4, r5
 d7 14                 sys	strcmp_p
 f1 04                 mov	r0, r4
 f0 06 b1 02           ldi16	r2, 0x2b1
 f0 03 00              ldi8	r3, 0x0
 f2 6b                 mov32	q3, q1
 f1 77                 zext8	r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 01                    mov	r4, r5
 d7 14                 sys	strcmp_p
 f1 1c                 mov	r3, r4
 f2 42                 sub	r2, r2
 f0 4a 51 01           stm8	[0x151], r2
 01                    mov	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d7 14                 sys	strcmp_p
 c3 61                 ldi8	r7, 0x61
 f0 4f 51 01           stm8	[0x151], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f2 1f                 add	r3, r7
 f2 18                 add	r3, r0
 f2 19                 add	r3, r1
 f2 1c                 add	r3, r4
 f0 04 74 03           ldi16	r0, 0x374
 f0 01 00              ldi8	r1, 0x0
 f2 6a                 mov32	q3, q0
 f1 77                 zext8	r7
 01                    mov	r4, r5
 d7 14                 sys	strcmp_p
 f2 23                 add	r4, r3
 f0 5c 83 01           stm16	[0x183], r4
 d7 01                 sys	debug_break
 f1 22                 mov	r4, r2
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
