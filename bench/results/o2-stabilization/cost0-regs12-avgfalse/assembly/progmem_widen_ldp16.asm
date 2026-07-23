
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/progmem_widen_ldp16.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 progmem_widen_ldp16.c
000002a8 l     O .rodata	000000a0 program_bytes
00000249 l     F .text	0000005d sum_byte_pairs
00000100 l     O .data	00000006 results
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000033 avm_test_main
000002a6 g     F .text	00000002 avm_halt

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
 e1 90 00              call16	avm_halt

<avm_test_main>:
 d7 01                 sys	debug_break
 c4 a8 02              ldi16	r4, 0x2a8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c2 40                 ldi8	r6, 0x40
 d5 26                 call8	sum_byte_pairs
 f0 5c 00 01           stm16	[0x100], r4
 c4 a9 02              ldi16	r4, 0x2a9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c2 3f                 ldi8	r6, 0x3f
 d5 17                 call8	sum_byte_pairs
 f0 5c 02 01           stm16	[0x102], r4
 c4 aa 02              ldi16	r4, 0x2aa
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c2 41                 ldi8	r6, 0x41
 d5 08                 call8	sum_byte_pairs
 f0 5c 04 01           stm16	[0x104], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 ef                    ret

<sum_byte_pairs>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	avm_test_main+47
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 a0                    xor	r4, r4
 c3 01                 ldi8	r7, 0x1
 f4 5a                 stsp16	[sp+0x6], r6
 8e                    and	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 08                    mov	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d1 0b                 brne8	sum_byte_pairs+38
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 d4 10                 jmp8	sum_byte_pairs+54
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 66 e0              ldp16	r7, [q0+]
 1c                    add	r7, r4
 f0 33 06              ldsp16	r3, [sp+0x6]
 f4 b3                 dec16	r3
 03                    mov	r4, r7
 f0 68 c0              ldp32	q3, [q0+]
 f1 16                 mov	r2, r6
 f2 14                 add	r2, r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f2 22                 add	r4, r2
 f0 0b fe              addi.s8	r3, -0x2
 f6 2b                 tst16	r3
 d1 ee                 brne8	sum_byte_pairs+54
 0c                    mov	r7, r4
 fa af                 lsr16i	r7, 0xf
 10                    add	r4, r4
 93                    or	r4, r7
 f4 22                 ldsp16	r6, [sp+0x8]
 a2                    xor	r4, r6
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
 d1 bd                 brne8	sum_byte_pairs+19
 d6 0a                 adjsp	avm_halt+5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
