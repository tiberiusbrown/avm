
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sys_strlen_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sys_strlen_p.c
0000025a l     O .rodata	00000001 length0
0000025b l     O .rodata	00000002 length1
0000025d l     O .rodata	00000009 length8
00000266 l     O .rodata	00000021 length32
00000287 l     O .rodata	00000101 length256
00000100 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000043 avm_test_main
00000258 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 43                 call8	avm_halt

<avm_test_main>:
 d7 01                 sys	debug_break
 c4 5a 02              ldi16	r4, 0x25a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d7 15                 sys	strlen_p
 c6 5b 02              ldi16	r6, 0x25b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 b4                    push16	r4
 d7 15                 sys	strlen_p
 04                    mov	r5, r4
 bc                    pop16	r4
 14                    add	r5, r4
 c6 5d 02              ldi16	r6, 0x25d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d7 15                 sys	strlen_p
 11                    add	r4, r5
 c6 66 02              ldi16	r6, 0x266
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 b4                    push16	r4
 d7 15                 sys	strlen_p
 04                    mov	r5, r4
 bc                    pop16	r4
 14                    add	r5, r4
 c6 87 02              ldi16	r6, 0x287
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d7 15                 sys	strlen_p
 11                    add	r4, r5
 f0 5c 00 01           stm16	[0x100], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
