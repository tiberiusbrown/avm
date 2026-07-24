
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
00000316 g     F .text	000000bd avm_test_main
000003d3 g     F .text	00000002 avm_halt

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
 e1 bd 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 a0                    xor	r4, r4
 c1 07                 ldi8	r5, 0x7
 c6 00 01              ldi16	r6, 0x100
 18                    add	r6, r4
 59                    st8	[r6], r5
 c6 40 01              ldi16	r6, 0x140
 18                    add	r6, r4
 59                    st8	[r6], r5
 c6 80 01              ldi16	r6, 0x180
 18                    add	r6, r4
 59                    st8	[r6], r5
 c6 c0 01              ldi16	r6, 0x1c0
 18                    add	r6, r4
 59                    st8	[r6], r5
 c9 0d                 addi.s8	r5, 0xd
 f4 ac                 inc16	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 e4                 brne8	avm_test_main+7
 c0 80                 ldi8	r4, 0x80
 f0 45 80 01           ldm8u	r5, [0x180]
 a4                    xor	r5, r4
 f0 4d 80 01           stm8	[0x180], r5
 c0 01                 ldi8	r4, 0x1
 f0 45 ff 01           ldm8u	r5, [0x1ff]
 a4                    xor	r5, r4
 f0 4d ff 01           stm8	[0x1ff], r5
 d7 01                 sys	debug_break
 c7 40 01              ldi16	r7, 0x140
 c4 00 01              ldi16	r4, 0x100
 f0 55 00 02           ldm16	r5, [0x200]
 f1 0c                 mov	r1, r4
 b4                    push16	r4
 f1 21                 mov	r4, r1
 09                    mov	r6, r5
 07                    mov	r5, r7
 d7 18                 sys	memcmp
 f1 0c                 mov	r1, r4
 bc                    pop16	r4
 f0 50 02 02           ldm16	r0, [0x202]
 04                    mov	r5, r4
 b4                    push16	r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 d7 18                 sys	memcmp
 04                    mov	r5, r4
 bc                    pop16	r4
 f0 50 04 02           ldm16	r0, [0x204]
 f1 1c                 mov	r3, r4
 b4                    push16	r4
 b5                    push16	r5
 f1 23                 mov	r4, r3
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 d7 18                 sys	memcmp
 f1 1c                 mov	r3, r4
 bd                    pop16	r5
 bc                    pop16	r4
 f0 04 80 01           ldi16	r0, 0x180
 f0 56 04 02           ldm16	r6, [0x204]
 f1 14                 mov	r2, r4
 b4                    push16	r4
 b5                    push16	r5
 f1 22                 mov	r4, r2
 f1 24                 mov	r5, r0
 d7 18                 sys	memcmp
 f1 14                 mov	r2, r4
 bd                    pop16	r5
 bc                    pop16	r4
 f0 04 c0 01           ldi16	r0, 0x1c0
 f0 57 04 02           ldm16	r7, [0x204]
 08                    mov	r6, r4
 b4                    push16	r4
 b5                    push16	r5
 02                    mov	r4, r6
 f1 24                 mov	r5, r0
 0b                    mov	r6, r7
 d7 18                 sys	memcmp
 08                    mov	r6, r4
 bd                    pop16	r5
 bc                    pop16	r4
 f0 57 06 02           ldm16	r7, [0x206]
 b5                    push16	r5
 b6                    push16	r6
 f1 24                 mov	r5, r0
 0b                    mov	r6, r7
 d7 18                 sys	memcmp
 be                    pop16	r6
 bd                    pop16	r5
 f2 25                 add	r5, r1
 f2 27                 add	r5, r3
 f2 26                 add	r5, r2
 16                    add	r5, r6
 14                    add	r5, r4
 f0 5d 08 02           stm16	[0x208], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
