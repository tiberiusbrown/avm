
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
00000316 g     F .text	000000ca avm_test_main
000003e0 g     F .text	00000002 avm_halt

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
 e1 ca 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 af                    xor	r7, r7
 f0 04 00 01           ldi16	r0, 0x100
 f0 06 41 01           ldi16	r2, 0x141
 f0 07 82 01           ldi16	r3, 0x182
 c5 c3 01              ldi16	r5, 0x1c3
 f0 05 04 02           ldi16	r1, 0x204
 c0 4f                 ldi8	r4, 0x4f
 f4 48                 stsp16	[sp+0x2], r4
 d4 13                 jmp8	avm_test_main+51
 f4 a9                 inc16	r1
 f4 ad                 inc16	r5
 f4 ab                 inc16	r3
 f4 aa                 inc16	r2
 f4 a8                 inc16	r0
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 d0 25                 breq8	avm_test_main+88
 0b                    mov	r6, r7
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 18                 mulu8.w	r6, r4
 fa 9b                 lsr16i	r6, 0xb
 c0 1a                 ldi8	r4, 0x1a
 f3 18                 mulu8.w	r6, r4
 03                    mov	r4, r7
 22                    sub	r4, r6
 c8 61                 addi.s8	r4, 0x61
 ee 80 20              st8	[r0+0], r4
 ee 84 20              st8	[r2+0], r4
 ee 86 20              st8	[r3+0], r4
 54                    st8	[r5], r4
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 d8 cd                 bruge8	avm_test_main+32
 ee 82 20              st8	[r1+0], r4
 d4 c8                 jmp8	avm_test_main+32
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
 08                    mov	r6, r4
 c5 41 01              ldi16	r5, 0x141
 c7 00 01              ldi16	r7, 0x100
 03                    mov	r4, r7
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 19                 sys	strcmp
 0c                    mov	r7, r4
 1e                    add	r7, r6
 c5 82 01              ldi16	r5, 0x182
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 19                 sys	strcmp
 08                    mov	r6, r4
 1b                    add	r6, r7
 c5 c3 01              ldi16	r5, 0x1c3
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 19                 sys	strcmp
 f1 0c                 mov	r1, r4
 f2 0e                 add	r1, r6
 c6 04 02              ldi16	r6, 0x204
 02                    mov	r4, r6
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 19                 sys	strcmp
 0c                    mov	r7, r4
 f2 2d                 add	r7, r1
 06                    mov	r5, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 19                 sys	strcmp
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 13                    add	r4, r7
 f0 5c 16 02           stm16	[0x216], r4
 d7 01                 sys	debug_break
 f1 20                 mov	r4, r0
 d6 04                 adjsp	avm_test_main+201
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
