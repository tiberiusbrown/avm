
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_memcmp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_memcmp.c
000001c0 l     O .data	00000040 last_diff
00000180 l     O .data	00000040 first_diff
00000140 l     O .data	00000040 equal
00000100 l     O .data	00000040 lhs
00000200 l     O .data	00000002 n0
00000202 l     O .data	00000002 n1
00000204 l     O .data	00000002 n64
00000206 l     O .data	00000002 n16
00000208 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000a2 avm_test_main
000003b8 g     F .text	00000002 avm_halt

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
 e1 a2 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 c4 c0 01              ldi16	r4, 0x1c0
 c5 80 01              ldi16	r5, 0x180
 c6 40 01              ldi16	r6, 0x140
 c7 00 01              ldi16	r7, 0x100
 f0 00 40              ldi8	r0, 0x40
 f0 01 07              ldi8	r1, 0x7
 f6 19                 st8	[r7+], r1
 f6 11                 st8	[r6+], r1
 f6 09                 st8	[r5+], r1
 f6 01                 st8	[r4+], r1
 f0 09 0d              addi.s8	r1, 0xd
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 d1 ef                 brne8	avm_test_main+24
 c0 80                 ldi8	r4, 0x80
 f0 45 80 01           ldm8u	r5, [0x180]
 a4                    xor	r5, r4
 f0 4d 80 01           stm8	[0x180], r5
 c0 01                 ldi8	r4, 0x1
 f0 45 ff 01           ldm8u	r5, [0x1ff]
 a4                    xor	r5, r4
 f0 4d ff 01           stm8	[0x1ff], r5
 d7 01                 sys	debug_break
 c5 40 01              ldi16	r5, 0x140
 c4 00 01              ldi16	r4, 0x100
 f0 56 00 02           ldm16	r6, [0x200]
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 18                 sys	memcmp
 f1 04                 mov	r0, r4
 f0 54 02 02           ldm16	r4, [0x202]
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 18                 sys	memcmp
 f1 0c                 mov	r1, r4
 f0 56 04 02           ldm16	r6, [0x204]
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 18                 sys	memcmp
 f1 14                 mov	r2, r4
 c5 80 01              ldi16	r5, 0x180
 f0 56 04 02           ldm16	r6, [0x204]
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 18                 sys	memcmp
 0c                    mov	r7, r4
 c5 c0 01              ldi16	r5, 0x1c0
 f0 54 04 02           ldm16	r4, [0x204]
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 18                 sys	memcmp
 f1 1c                 mov	r3, r4
 f0 56 06 02           ldm16	r6, [0x206]
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 18                 sys	memcmp
 f2 08                 add	r1, r0
 f2 0a                 add	r1, r2
 f2 0f                 add	r1, r7
 f2 0b                 add	r1, r3
 f2 0c                 add	r1, r4
 f0 59 08 02           stm16	[0x208], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	avm_test_main+159
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
