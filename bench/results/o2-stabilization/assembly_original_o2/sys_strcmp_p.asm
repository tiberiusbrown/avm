
C:/tmp/avm-original-o2-root/build/bench/c/sys_strcmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strcmp_p.c
00000100 l     O .data	00000041 .L.str
00000141 l     O .data	00000041 lhs
000002a2 l     O .rodata	00000001 p_empty
00000182 l     O .data	00000001 .L.str.1
00000325 l     O .rodata	00000041 p_last_diff
000002e4 l     O .rodata	00000041 p_first_diff
000002a3 l     O .rodata	00000041 p_equal
00000366 l     O .rodata	00000011 p_prefix
00000183 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000008a avm_test_main
000002a0 g     F .text	00000002 avm_halt

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
 e1 8a 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 c4 00 01              ldi16	r4, 0x100
 c5 41 01              ldi16	r5, 0x141
 c2 40                 ldi8	r6, 0x40
 f7 07                 ld8u	r7, [r4+]
 f6 0f                 st8	[r5+], r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+14
 a5                    xor	r5, r5
 f0 4d 81 01           stm8	[0x181], r5
 d7 01                 sys	debug_break
 c6 a2 02              ldi16	r6, 0x2a2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 82 01              ldi16	r4, 0x182
 d7 14                 sys	strcmp_p
 f1 14                 mov	r2, r4
 c6 25 03              ldi16	r6, 0x325
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 41 01              ldi16	r4, 0x141
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 14                 sys	strcmp_p
 f1 1c                 mov	r3, r4
 c6 e4 02              ldi16	r6, 0x2e4
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 14                 sys	strcmp_p
 f1 0c                 mov	r1, r4
 c6 a3 02              ldi16	r6, 0x2a3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 14                 sys	strcmp_p
 f1 04                 mov	r0, r4
 f0 4d 51 01           stm8	[0x151], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 14                 sys	strcmp_p
 c2 61                 ldi8	r6, 0x61
 f0 4e 51 01           stm8	[0x151], r6
 f2 02                 add	r0, r2
 f2 01                 add	r0, r1
 f2 03                 add	r0, r3
 f2 04                 add	r0, r4
 c6 66 03              ldi16	r6, 0x366
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 14                 sys	strcmp_p
 f2 20                 add	r4, r0
 f0 5c 83 01           stm16	[0x183], r4
 d7 01                 sys	debug_break
 01                    mov	r4, r5
 d6 02                 adjsp	avm_test_main+135
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
