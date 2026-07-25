
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_memcmp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_memcmp.c
00000100 l     O .data	00000040 lhs
00000140 l     O .data	00000040 equal
00000180 l     O .data	00000040 first_diff
000001c0 l     O .data	00000040 last_diff
00000200 l     O .data	00000002 n0
00000202 l     O .data	00000002 n1
00000204 l     O .data	00000002 n64
00000206 l     O .data	00000002 n16
00000208 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	0000009d avm_test_main
000003b3 g     F .text	00000002 avm_halt

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
 e1 9d 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 aa                    xor	r6, r6
 c0 07                 ldi8	r4, 0x7
 f0 05 00 01           ldi16	r1, 0x100
 c7 40 01              ldi16	r7, 0x140
 f0 06 80 01           ldi16	r2, 0x180
 f0 04 c0 01           ldi16	r0, 0x1c0
 06                    mov	r5, r6
 f2 25                 add	r5, r1
 54                    st8	[r5], r4
 06                    mov	r5, r6
 17                    add	r5, r7
 54                    st8	[r5], r4
 06                    mov	r5, r6
 f2 26                 add	r5, r2
 54                    st8	[r5], r4
 06                    mov	r5, r6
 f2 24                 add	r5, r0
 54                    st8	[r5], r4
 c8 0d                 addi.s8	r4, 0xd
 f4 ae                 inc16	r6
 ce 40                 cmpi.s8	r6, 0x40
 d1 e9                 brne8	avm_test_main+24
 c0 80                 ldi8	r4, 0x80
 f0 45 80 01           ldm8u	r5, [0x180]
 a4                    xor	r5, r4
 f0 4d 80 01           stm8	[0x180], r5
 c0 01                 ldi8	r4, 0x1
 f0 45 ff 01           ldm8u	r5, [0x1ff]
 a4                    xor	r5, r4
 f0 4d ff 01           stm8	[0x1ff], r5
 d7 01                 sys	debug_break
 f0 56 00 02           ldm16	r6, [0x200]
 f1 21                 mov	r4, r1
 07                    mov	r5, r7
 d7 18                 sys	memcmp
 f4 40                 stsp16	[sp+0x0], r4
 f0 56 02 02           ldm16	r6, [0x202]
 f1 21                 mov	r4, r1
 d7 18                 sys	memcmp
 0c                    mov	r7, r4
 f0 56 04 02           ldm16	r6, [0x204]
 f1 21                 mov	r4, r1
 d7 18                 sys	memcmp
 f1 1c                 mov	r3, r4
 f0 54 04 02           ldm16	r4, [0x204]
 f1 21                 mov	r4, r1
 f1 26                 mov	r5, r2
 d7 18                 sys	memcmp
 f1 14                 mov	r2, r4
 f0 54 04 02           ldm16	r4, [0x204]
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 18                 sys	memcmp
 f1 04                 mov	r0, r4
 f0 56 06 02           ldm16	r6, [0x206]
 f1 21                 mov	r4, r1
 d7 18                 sys	memcmp
 f4 01                 ldsp16	r5, [sp+0x0]
 1d                    add	r7, r5
 f2 2f                 add	r7, r3
 f2 2e                 add	r7, r2
 f2 2c                 add	r7, r0
 1c                    add	r7, r4
 f0 5f 08 02           stm16	[0x208], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
