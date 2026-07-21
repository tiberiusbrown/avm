
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/pointer_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 pointer_walk.c
00000100 l     O .data	00000080 source
00000180 l     O .data	00000080 destination
00000200 l     O .data	00000002 pointer_walk_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000015 _start
00000315 g     F .text	00000056 avm_test_main
0000036b g     F .text	00000002 avm_halt

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
 d5 56                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 a5                    xor	r5, r5
 c2 07                 ldi8	r6, 0x7
 c0 80                 ldi8	r4, 0x80
 c7 00 01              ldi16	r7, 0x100
 1d                    add	r7, r5
 5e                    st8	[r7], r6
 ca 0b                 addi.s8	r6, 0xb
 f4 ad                 inc16	r5
 34                    cmp	r5, r4
 d1 f4                 brne8	avm_test_main+9
 c1 5a                 ldi8	r5, 0x5a
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
 0e                    mov	r7, r6
 f1 06                 mov	r0, r6
 f1 0e                 mov	r1, r6
 f0 06 00 01           ldi16	r2, 0x100
 f2 11                 add	r2, r1
 f0 6c 44              ld8u	r2, [r2]
 f2 26                 add	r5, r2
 f9 56                 xor	r2, r5
 f0 07 80 01           ldi16	r3, 0x180
 f2 19                 add	r3, r1
 f0 6d 46              st8	[r3], r2
 f1 72                 zext8	r2
 f2 02                 add	r0, r2
 f4 a9                 inc16	r1
 f5 0c                 cmp	r1, r4
 d1 e0                 brne8	avm_test_main+31
 f4 af                 inc16	r7
 f1 0f                 mov	r1, r7
 f1 71                 zext8	r1
 f0 0d 10              cmpi.s8	r1, 0x10
 d1 d3                 brne8	avm_test_main+29
 f0 58 00 02           stm16	[0x200], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
