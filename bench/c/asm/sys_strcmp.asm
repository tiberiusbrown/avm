
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strcmp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strcmp.c
00000100 l     O .data	00000041 equal_lhs
00000141 l     O .data	00000041 equal_rhs
00000182 l     O .data	00000041 first_diff
000001c3 l     O .data	00000041 last_diff
00000204 l     O .data	00000011 prefix
00000215 l     O .data	00000001 empty
00000216 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000c9 avm_test_main
000003df g     F .text	00000002 avm_halt

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
 e1 c9 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 00 61              ldi8	r0, 0x61
 a0                    xor	r4, r4
 c1 4f                 ldi8	r5, 0x4f
 f4 49                 stsp16	[sp+0x2], r5
 c1 1a                 ldi8	r5, 0x1a
 f4 41                 stsp16	[sp+0x0], r5
 04                    mov	r5, r4
 d4 0a                 jmp8	avm_test_main+31
 f4 ac                 inc16	r4
 f4 a8                 inc16	r0
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d0 37                 breq8	avm_test_main+86
 0c                    mov	r7, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 1e                 mulu8.w	r7, r6
 fa ab                 lsr16i	r7, 0xb
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 1e                 mulu8.w	r7, r6
 08                    mov	r6, r4
 2b                    sub	r6, r7
 28                    sub	r6, r4
 f2 28                 add	r6, r0
 c7 00 01              ldi16	r7, 0x100
 1d                    add	r7, r5
 5e                    st8	[r7], r6
 c7 41 01              ldi16	r7, 0x141
 1d                    add	r7, r5
 5e                    st8	[r7], r6
 c7 82 01              ldi16	r7, 0x182
 1d                    add	r7, r5
 5e                    st8	[r7], r6
 c7 c3 01              ldi16	r7, 0x1c3
 1d                    add	r7, r5
 5e                    st8	[r7], r6
 cd 10                 cmpi.s8	r5, 0x10
 d8 ce                 bruge8	avm_test_main+21
 c7 04 02              ldi16	r7, 0x204
 1d                    add	r7, r5
 5e                    st8	[r7], r6
 f4 ac                 inc16	r4
 f4 a8                 inc16	r0
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d1 c9                 brne8	avm_test_main+31
 c0 7a                 ldi8	r4, 0x7a
 f0 4c 82 01           stm8	[0x182], r4
 f0 5c 02 02           stm16	[0x202], r4
 f2 30                 sub	r0, r0
 f0 48 81 01           stm8	[0x181], r0
 f0 48 40 01           stm8	[0x140], r0
 f0 48 c2 01           stm8	[0x1c2], r0
 f0 48 14 02           stm8	[0x214], r0
 f0 48 15 02           stm8	[0x215], r0
 d7 01                 sys	debug_break
 c5 15 02              ldi16	r5, 0x215
 01                    mov	r4, r5
 d7 19                 sys	strcmp
 f1 0c                 mov	r1, r4
 f0 06 41 01           ldi16	r2, 0x141
 f0 07 00 01           ldi16	r3, 0x100
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 d7 19                 sys	strcmp
 0c                    mov	r7, r4
 f2 2d                 add	r7, r1
 c5 82 01              ldi16	r5, 0x182
 f4 49                 stsp16	[sp+0x2], r5
 f1 23                 mov	r4, r3
 f4 09                 ldsp16	r5, [sp+0x2]
 d7 19                 sys	strcmp
 08                    mov	r6, r4
 1b                    add	r6, r7
 c5 c3 01              ldi16	r5, 0x1c3
 f1 23                 mov	r4, r3
 d7 19                 sys	strcmp
 0c                    mov	r7, r4
 1e                    add	r7, r6
 f0 05 04 02           ldi16	r1, 0x204
 f1 21                 mov	r4, r1
 f1 26                 mov	r5, r2
 d7 19                 sys	strcmp
 08                    mov	r6, r4
 1b                    add	r6, r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 19                 sys	strcmp
 12                    add	r4, r6
 f0 5c 16 02           stm16	[0x216], r4
 d7 01                 sys	debug_break
 f1 20                 mov	r4, r0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
