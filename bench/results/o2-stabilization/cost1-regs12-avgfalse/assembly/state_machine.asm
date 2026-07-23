
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/state_machine.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 state_machine.c
00000100 l     O .data	00000080 input
00000180 l     O .data	00000002 state_machine_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000ba avm_test_main
000002d0 g     F .text	00000002 avm_halt

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
 e1 ba 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 c0 80                 ldi8	r4, 0x80
 c1 0b                 ldi8	r5, 0xb
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 25                 addi.s8	r5, 0x25
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+13
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 00 80              ldi8	r0, 0x80
 f1 21                 mov	r4, r1
 f4 40                 stsp16	[sp+0x0], r4
 f1 25                 mov	r5, r1
 d4 0a                 jmp8	avm_test_main+48
 f4 a9                 inc16	r1
 f1 29                 mov	r6, r1
 f1 76                 zext8	r6
 ce 40                 cmpi.s8	r6, 0x40
 d0 77                 breq8	avm_test_main+167
 f0 06 00 01           ldi16	r2, 0x100
 f1 28                 mov	r6, r0
 d4 15                 jmp8	avm_test_main+77
 03                    mov	r4, r7
 fa 75                 lsr16i	r4, 0x5
 c1 03                 ldi8	r5, 0x3
 84                    and	r5, r4
 c0 05                 ldi8	r4, 0x5
 f3 1c                 mulu8.w	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 13                    add	r4, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 d9                 breq8	avm_test_main+38
 f0 6c e5              ld8u	r7, [r2+]
 f1 75                 zext8	r5
 cd 02                 cmpi.s8	r5, 0x2
 d9 19                 brsge8	avm_test_main+111
 f4 a5                 tst8	r5
 d0 2f                 breq8	avm_test_main+137
 cd 01                 cmpi.s8	r5, 0x1
 d1 da                 brne8	avm_test_main+56
 c0 a0                 ldi8	r4, 0xa0
 a5                    xor	r5, r5
 f0 03 03              ldi8	r3, 0x3
 33                    cmp	r4, r7
 fc 2b                 cmov.ult	r5, r3
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 a3                    xor	r4, r7
 d4 d6                 jmp8	avm_test_main+69
 cd 02                 cmpi.s8	r5, 0x2
 d0 23                 breq8	avm_test_main+150
 cd 03                 cmpi.s8	r5, 0x3
 d1 c1                 brne8	avm_test_main+56
 c1 04                 ldi8	r5, 0x4
 a0                    xor	r4, r4
 f4 a7                 tst8	r7
 fb 2c                 cmov.eq	r5, r4
 f4 03                 ldsp16	r7, [sp+0x0]
 03                    mov	r4, r7
 fa 7f                 lsr16i	r4, 0xf
 1f                    add	r7, r7
 9c                    or	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 d4 be                 jmp8	avm_test_main+71
 f4 00                 ldsp16	r4, [sp+0x0]
 13                    add	r4, r7
 f4 40                 stsp16	[sp+0x0], r4
 c0 01                 ldi8	r4, 0x1
 83                    and	r4, r7
 c1 02                 ldi8	r5, 0x2
 24                    sub	r5, r4
 d4 b1                 jmp8	avm_test_main+71
 c0 30                 ldi8	r4, 0x30
 83                    and	r4, r7
 c1 01                 ldi8	r5, 0x1
 f0 03 04              ldi8	r3, 0x4
 cc 30                 cmpi.s8	r4, 0x30
 fb 2b                 cmov.eq	r5, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 23                    sub	r4, r7
 d4 9e                 jmp8	avm_test_main+69
 f1 75                 zext8	r5
 f4 00                 ldsp16	r4, [sp+0x0]
 a1                    xor	r4, r5
 f0 5c 80 01           stm16	[0x180], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	avm_test_main+183
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
