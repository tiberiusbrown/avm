
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/progmem_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 progmem_walk.c
00000283 l     O .rodata	00000080 program_bytes
00000100 l     O .data	00000002 progmem_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000006c avm_test_main
00000281 g     F .text	00000002 avm_halt

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
 d5 6c                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c1 80                 ldi8	r5, 0x80
 f4 41                 stsp16	[sp+0x0], r5
 f1 0c                 mov	r1, r4
 f4 48                 stsp16	[sp+0x2], r4
 c6 83 02              ldi16	r6, 0x283
 c3 00                 ldi8	r7, 0x0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 65 4c              ldp8u	r2, [q3+]
 f2 0a                 add	r1, r2
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 f5                 brne8	avm_test_main+25
 f0 00 00              ldi8	r0, 0x0
 f1 18                 mov	r3, r0
 f1 29                 mov	r6, r1
 f2 2b                 add	r6, r3
 f0 02 7f              ldi8	r2, 0x7f
 f9 58                 and	r2, r6
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 c4 83 02              ldi16	r4, 0x283
 c1 00                 ldi8	r5, 0x0
 f7 6b                 add32	q2, q3
 c3 07                 ldi8	r7, 0x7
 f9 e0                 and	r7, r0
 f0 60 c8              ldp8u	r6, [q2]
 02                    mov	r4, r6
 fa 03                 shl16v	r4, r7
 f9 32                 xor	r1, r4
 f0 0b 0d              addi.s8	r3, 0xd
 f4 a8                 inc16	r0
 c0 80                 ldi8	r4, 0x80
 f5 04                 cmp	r0, r4
 d1 d8                 brne8	avm_test_main+43
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 d1 b1                 brne8	avm_test_main+15
 f0 59 00 01           stm16	[0x100], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+107
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
