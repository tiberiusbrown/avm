
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/progmem_widen_ldp32_bytes.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 progmem_widen_ldp32_bytes.c
0000027d l     O .rodata	000000a0 program_bytes
0000024b l     F .text	00000030 sum_bytes
00000100 l     O .data	00000006 results
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000036 avm_test_main
0000027b g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 66                 call8	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 04 7d 02           ldi16	r0, 0x27d
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 c2 80                 ldi8	r6, 0x80
 f2 68                 mov32	q2, q0
 d5 23                 call8	sum_bytes
 f0 5c 00 01           stm16	[0x100], r4
 c2 82                 ldi8	r6, 0x82
 f2 68                 mov32	q2, q0
 d5 19                 call8	sum_bytes
 f0 5c 02 01           stm16	[0x102], r4
 c4 7e 02              ldi16	r4, 0x27e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c2 7f                 ldi8	r6, 0x7f
 d5 0a                 call8	sum_bytes
 f0 5c 04 01           stm16	[0x104], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sum_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 fc                 adjsp	sum_bytes+1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 04                    mov	r5, r4
 0e                    mov	r7, r6
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 65 04              ldp8u	r0, [q1+]
 f2 20                 add	r4, r0
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f5                 brne8	sum_bytes+18
 0c                    mov	r7, r4
 fa af                 lsr16i	r7, 0xf
 fa 31                 lsl16i	r4, 0x1
 93                    or	r4, r7
 a1                    xor	r4, r5
 f4 ad                 inc16	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 e1                 brne8	sum_bytes+11
 d6 04                 adjsp	avm_halt
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
