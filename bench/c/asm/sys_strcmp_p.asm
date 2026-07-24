
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strcmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strcmp_p.c
00000100 l     O .data	00000041 .L.str
00000141 l     O .data	00000041 lhs
000002ae l     O .rodata	00000001 p_empty
00000182 l     O .data	00000001 .L.str.1
00000331 l     O .rodata	00000041 p_last_diff
000002f0 l     O .rodata	00000041 p_first_diff
000002af l     O .rodata	00000041 p_equal
00000372 l     O .rodata	00000011 p_prefix
00000183 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000096 avm_test_main
000002ac g     F .text	00000002 avm_halt

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
 e1 96 00              call16	avm_halt

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
 a0                    xor	r4, r4
 f0 4c 81 01           stm8	[0x181], r4
 d7 01                 sys	debug_break
 c6 ae 02              ldi16	r6, 0x2ae
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 82 01              ldi16	r4, 0x182
 d7 14                 sys	strcmp_p
 f4 40                 stsp16	[sp+0x0], r4
 c6 31 03              ldi16	r6, 0x331
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 41 01              ldi16	r5, 0x141
 01                    mov	r4, r5
 d7 14                 sys	strcmp_p
 f1 0c                 mov	r1, r4
 c6 f0 02              ldi16	r6, 0x2f0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 01                    mov	r4, r5
 d7 14                 sys	strcmp_p
 f1 04                 mov	r0, r4
 f0 06 af 02           ldi16	r2, 0x2af
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 01                    mov	r4, r5
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 14                 sys	strcmp_p
 08                    mov	r6, r4
 a0                    xor	r4, r4
 f0 4c 51 01           stm8	[0x151], r4
 01                    mov	r4, r5
 b6                    push16	r6
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 d7 14                 sys	strcmp_p
 c3 61                 ldi8	r7, 0x61
 be                    pop16	r6
 f0 4f 51 01           stm8	[0x151], r7
 f4 03                 ldsp16	r7, [sp+0x0]
 1b                    add	r6, r7
 f2 28                 add	r6, r0
 f2 29                 add	r6, r1
 18                    add	r6, r4
 f0 04 72 03           ldi16	r0, 0x372
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 01                    mov	r4, r5
 b6                    push16	r6
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 d7 14                 sys	strcmp_p
 be                    pop16	r6
 12                    add	r4, r6
 f0 5c 83 01           stm16	[0x183], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	avm_test_main+147
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
