
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
00000316 g     F .text	000000c6 avm_test_main
000003dc g     F .text	00000002 avm_halt

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
 e1 c6 00              call16	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main
 c0 61                 ldi8	r4, 0x61
 af                    xor	r7, r7
 c1 4f                 ldi8	r5, 0x4f
 f4 49                 stsp16	[sp+0x2], r5
 c1 1a                 ldi8	r5, 0x1a
 f4 41                 stsp16	[sp+0x0], r5
 f1 07                 mov	r0, r7
 d4 0b                 jmp8	avm_test_main+30
 f4 af                 inc16	r7
 f4 ac                 inc16	r4
 f4 a8                 inc16	r0
 f0 0c 40              cmpi.s8	r0, 0x40
 d0 34                 breq8	avm_test_main+82
 0b                    mov	r6, r7
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 19                 mulu8.w	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 19                 mulu8.w	r6, r5
 07                    mov	r5, r7
 26                    sub	r5, r6
 27                    sub	r5, r7
 14                    add	r5, r4
 c6 00 01              ldi16	r6, 0x100
 f2 28                 add	r6, r0
 59                    st8	[r6], r5
 c6 41 01              ldi16	r6, 0x141
 f2 28                 add	r6, r0
 59                    st8	[r6], r5
 c6 82 01              ldi16	r6, 0x182
 f2 28                 add	r6, r0
 59                    st8	[r6], r5
 c6 c3 01              ldi16	r6, 0x1c3
 f2 28                 add	r6, r0
 59                    st8	[r6], r5
 f0 0c 10              cmpi.s8	r0, 0x10
 d8 c9                 bruge8	avm_test_main+19
 c6 04 02              ldi16	r6, 0x204
 f2 28                 add	r6, r0
 59                    st8	[r6], r5
 d4 c1                 jmp8	avm_test_main+19
 c0 7a                 ldi8	r4, 0x7a
 f0 4c 82 01           stm8	[0x182], r4
 f0 5c 02 02           stm16	[0x202], r4
 aa                    xor	r6, r6
 f0 4e 81 01           stm8	[0x181], r6
 f0 4e 40 01           stm8	[0x140], r6
 f0 4e c2 01           stm8	[0x1c2], r6
 f0 4e 14 02           stm8	[0x214], r6
 f0 4e 15 02           stm8	[0x215], r6
 d7 01                 sys	debug_break
 c5 15 02              ldi16	r5, 0x215
 01                    mov	r4, r5
 d7 19                 sys	strcmp
 f1 04                 mov	r0, r4
 c5 41 01              ldi16	r5, 0x141
 c7 00 01              ldi16	r7, 0x100
 03                    mov	r4, r7
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 19                 sys	strcmp
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 c5 82 01              ldi16	r5, 0x182
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 19                 sys	strcmp
 0c                    mov	r7, r4
 f2 2d                 add	r7, r1
 c5 c3 01              ldi16	r5, 0x1c3
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 19                 sys	strcmp
 f1 0c                 mov	r1, r4
 f2 0f                 add	r1, r7
 c7 04 02              ldi16	r7, 0x204
 03                    mov	r4, r7
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 19                 sys	strcmp
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 07                    mov	r5, r7
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 19                 sys	strcmp
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 20                 add	r4, r0
 f0 5c 16 02           stm16	[0x216], r4
 d7 01                 sys	debug_break
 02                    mov	r4, r6
 d6 04                 adjsp	avm_halt+1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
