
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strcmp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strcmp.c
00000141 l     O .data	00000041 equal_rhs
00000182 l     O .data	00000041 first_diff
000001c3 l     O .data	00000041 last_diff
00000100 l     O .data	00000041 equal_lhs
00000204 l     O .data	00000011 prefix
00000215 l     O .data	00000001 empty
00000216 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000d0 avm_test_main
000003e6 g     F .text	00000002 avm_halt

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
 e1 d0 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f0 01 61              ldi8	r1, 0x61
 a0                    xor	r4, r4
 c1 4f                 ldi8	r5, 0x4f
 f4 49                 stsp16	[sp+0x2], r5
 c1 1a                 ldi8	r5, 0x1a
 f4 41                 stsp16	[sp+0x0], r5
 f0 07 41 01           ldi16	r3, 0x141
 f0 06 82 01           ldi16	r2, 0x182
 f0 04 c3 01           ldi16	r0, 0x1c3
 0c                    mov	r7, r4
 d4 0c                 jmp8	avm_test_main+45
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 ac                 inc16	r4
 f4 a9                 inc16	r1
 f4 af                 inc16	r7
 cf 40                 cmpi.s8	r7, 0x40
 d0 3e                 breq8	avm_test_main+107
 04                    mov	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 16                 mulu8.w	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 16                 mulu8.w	r5, r6
 08                    mov	r6, r4
 29                    sub	r6, r5
 f4 50                 stsp16	[sp+0x4], r4
 28                    sub	r6, r4
 f2 29                 add	r6, r1
 07                    mov	r5, r7
 c4 00 01              ldi16	r4, 0x100
 14                    add	r5, r4
 56                    st8	[r5], r6
 07                    mov	r5, r7
 f2 27                 add	r5, r3
 56                    st8	[r5], r6
 07                    mov	r5, r7
 f2 26                 add	r5, r2
 56                    st8	[r5], r6
 07                    mov	r5, r7
 f2 24                 add	r5, r0
 56                    st8	[r5], r6
 cf 10                 cmpi.s8	r7, 0x10
 d8 cc                 bruge8	avm_test_main+33
 07                    mov	r5, r7
 f1 22                 mov	r4, r2
 f1 10                 mov	r2, r0
 f1 03                 mov	r0, r3
 f0 07 04 02           ldi16	r3, 0x204
 f2 27                 add	r5, r3
 f1 18                 mov	r3, r0
 f1 02                 mov	r0, r2
 f1 14                 mov	r2, r4
 56                    st8	[r5], r6
 d4 b6                 jmp8	avm_test_main+33
 c0 7a                 ldi8	r4, 0x7a
 f0 4c 82 01           stm8	[0x182], r4
 f0 5c 02 02           stm16	[0x202], r4
 a0                    xor	r4, r4
 f0 4c 81 01           stm8	[0x181], r4
 f0 4c 40 01           stm8	[0x140], r4
 f0 4c c2 01           stm8	[0x1c2], r4
 f0 4c 14 02           stm8	[0x214], r4
 f0 4c 15 02           stm8	[0x215], r4
 d7 01                 sys	debug_break
 c5 15 02              ldi16	r5, 0x215
 01                    mov	r4, r5
 d7 19                 sys	strcmp
 0c                    mov	r7, r4
 f0 05 00 01           ldi16	r1, 0x100
 f1 21                 mov	r4, r1
 f1 27                 mov	r5, r3
 d7 19                 sys	strcmp
 08                    mov	r6, r4
 1b                    add	r6, r7
 f1 21                 mov	r4, r1
 f1 26                 mov	r5, r2
 d7 19                 sys	strcmp
 0c                    mov	r7, r4
 1e                    add	r7, r6
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 19                 sys	strcmp
 08                    mov	r6, r4
 1b                    add	r6, r7
 f0 04 04 02           ldi16	r0, 0x204
 f1 20                 mov	r4, r0
 f1 27                 mov	r5, r3
 d7 19                 sys	strcmp
 0c                    mov	r7, r4
 1e                    add	r7, r6
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 19                 sys	strcmp
 13                    add	r4, r7
 f0 5c 16 02           stm16	[0x216], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
