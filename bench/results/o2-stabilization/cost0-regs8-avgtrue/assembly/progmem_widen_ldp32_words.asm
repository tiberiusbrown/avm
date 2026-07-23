
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/progmem_widen_ldp32_words.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 progmem_widen_ldp32_words.c
000002b1 l     O .rodata	000000a0 program_words
0000024c l     F .text	00000063 sum_words
00000100 l     O .data	00000006 results
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000036 avm_test_main
000002af g     F .text	00000002 avm_halt

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
 e1 99 00              call16	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 04 b1 02           ldi16	r0, 0x2b1
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c2 40                 ldi8	r6, 0x40
 f2 68                 mov32	q2, q0
 d5 23                 call8	sum_words
 f0 5c 00 01           stm16	[0x100], r4
 c2 41                 ldi8	r6, 0x41
 f2 68                 mov32	q2, q0
 d5 19                 call8	sum_words
 f0 5c 02 01           stm16	[0x102], r4
 c4 b3 02              ldi16	r4, 0x2b3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c2 3f                 ldi8	r6, 0x3f
 d5 0a                 call8	sum_words
 f0 5c 04 01           stm16	[0x104], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sum_words>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	avm_test_main+48
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 af                    xor	r7, r7
 c0 01                 ldi8	r4, 0x1
 f4 5a                 stsp16	[sp+0x6], r6
 82                    and	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 0b                    mov	r6, r7
 03                    mov	r4, r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 f4 6b                 stsp16	[sp+0xa], r7
 d1 0a                 brne8	sum_words+40
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 d4 11                 jmp8	sum_words+57
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 66 40              ldp16	r2, [q0+]
 f2 14                 add	r2, r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 b6                 dec16	r6
 f1 22                 mov	r4, r2
 f0 68 40              ldp32	q1, [q0+]
 f1 2e                 mov	r7, r2
 1c                    add	r7, r4
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 13                    add	r4, r7
 ca fe                 addi.s8	r6, -0x2
 f6 2e                 tst16	r6
 d1 f0                 brne8	sum_words+57
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 10                    add	r4, r4
 92                    or	r4, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 a2                    xor	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 ae                 inc16	r6
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 cf 08                 cmpi.s8	r7, 0x8
 d1 b8                 brne8	sum_words+20
 d6 0c                 adjsp	avm_halt+7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
