
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/progmem_widen_ldp32_bytes.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 progmem_widen_ldp32_bytes.c
000002eb l     O .rodata	000000a0 program_bytes
0000024c l     F .text	0000009d sum_bytes
00000100 l     O .data	00000006 results
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000036 avm_test_main
000002e9 g     F .text	00000002 avm_halt

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
 e1 d3 00              call16	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 04 eb 02           ldi16	r0, 0x2eb
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
 c4 ec 02              ldi16	r4, 0x2ec
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
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	avm_test_main+48
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 42                 sub	r2, r2
 c0 01                 ldi8	r4, 0x1
 f4 5a                 stsp16	[sp+0x6], r6
 82                    and	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f1 2a                 mov	r6, r2
 f1 22                 mov	r4, r2
 d4 14                 jmp8	sum_bytes+45
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 10                    add	r4, r4
 92                    or	r4, r6
 f9 8a                 xor	r4, r2
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 ae                 inc16	r6
 f1 16                 mov	r2, r6
 f1 72                 zext8	r2
 f0 0e 08              cmpi.s8	r2, 0x8
 d0 69                 breq8	sum_bytes+150
 f4 6a                 stsp16	[sp+0xa], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d1 0b                 brne8	sum_bytes+64
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 d4 0f                 jmp8	sum_bytes+79
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 65 c0              ldp8u	r6, [q0+]
 12                    add	r4, r6
 f0 33 06              ldsp16	r3, [sp+0x6]
 f4 b3                 dec16	r3
 f1 2b                 mov	r6, r3
 ca fe                 addi.s8	r6, -0x2
 c3 02                 ldi8	r7, 0x2
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 19                 brne8	sum_bytes+115
 f0 66 e0              ldp16	r7, [q0+]
 f4 63                 stsp16	[sp+0x8], r7
 f4 23                 ldsp16	r7, [sp+0x8]
 f1 77                 zext8	r7
 13                    add	r4, r7
 f4 23                 ldsp16	r7, [sp+0x8]
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f0 0b fe              addi.s8	r3, -0x2
 03                    mov	r4, r7
 ce 02                 cmpi.s8	r6, 0x2
 d2 a8                 brult8	sum_bytes+25
 d4 05                 jmp8	sum_bytes+120
 0c                    mov	r7, r4
 ce 02                 cmpi.s8	r6, 0x2
 d2 a1                 brult8	sum_bytes+25
 f0 68 80              ldp32	q2, [q0+]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 1b                    add	r6, r7
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 01                    mov	r4, r5
 a5                    xor	r5, r5
 08                    mov	r6, r4
 f1 76                 zext8	r6
 1b                    add	r6, r7
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f0 0b fc              addi.s8	r3, -0x4
 f6 2b                 tst16	r3
 0c                    mov	r7, r4
 d1 e4                 brne8	sum_bytes+120
 d4 83                 jmp8	sum_bytes+25
 d6 0c                 adjsp	avm_halt+7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
