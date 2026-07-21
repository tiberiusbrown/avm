
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/switch.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 switch.c
00000250 l     F .text	00000046 dense_dispatch
00000296 l     F .text	00000033 sparse_dispatch
00000100 l     O .data	00000002 switch_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000003a avm_test_main
000002c9 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 b3 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c5 5a 5a              ldi16	r5, 0x5a5a
 f0 04 00 02           ldi16	r0, 0x200
 f0 01 00              ldi8	r1, 0x0
 d7 01                 sys	debug_break
 f0 02 07              ldi8	r2, 0x7
 f1 19                 mov	r3, r1
 f1 21                 mov	r4, r1
 f9 88                 and	r4, r2
 d5 1f                 call8	dense_dispatch
 04                    mov	r5, r4
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 d5 5e                 call8	sparse_dispatch
 04                    mov	r5, r4
 f4 a9                 inc16	r1
 f0 0b 25              addi.s8	r3, 0x25
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 e7                 brne8	avm_test_main+21
 f0 5d 00 01           stm16	[0x100], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<dense_dispatch>:
 c2 03                 ldi8	r6, 0x3
 38                    cmp	r6, r4
 d3 0d                 brslt8	dense_dispatch+18
 c2 01                 ldi8	r6, 0x1
 38                    cmp	r6, r4
 d3 15                 brslt8	dense_dispatch+31
 f4 a4                 tst8	r4
 d1 24                 brne8	dense_dispatch+50
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 ef                    ret
 c2 05                 ldi8	r6, 0x5
 38                    cmp	r6, r4
 d3 11                 brslt8	dense_dispatch+40
 cc 04                 cmpi.s8	r4, 0x4
 d1 1b                 brne8	dense_dispatch+54
 fa 81                 lsr16i	r5, 0x1
 01                    mov	r4, r5
 ef                    ret
 cc 02                 cmpi.s8	r4, 0x2
 d1 19                 brne8	dense_dispatch+60
 c4 aa 55              ldi16	r4, 0x55aa
 d4 1b                 jmp8	dense_dispatch+67
 cc 06                 cmpi.s8	r4, 0x6
 d1 14                 brne8	dense_dispatch+64
 c4 7f 7f              ldi16	r4, 0x7f7f
 84                    and	r5, r4
 01                    mov	r4, r5
 ef                    ret
 c9 fd                 addi.s8	r5, -0x3
 01                    mov	r4, r5
 ef                    ret
 c4 01 01              ldi16	r4, 0x101
 94                    or	r5, r4
 01                    mov	r4, r5
 ef                    ret
 fa 41                 lsl16i	r5, 0x1
 01                    mov	r4, r5
 ef                    ret
 c4 ff ff              ldi16	r4, 0xffff
 a4                    xor	r5, r4
 01                    mov	r4, r5
 ef                    ret

<sparse_dispatch>:
 c2 3f                 ldi8	r6, 0x3f
 38                    cmp	r6, r4
 d9 12                 brsge8	sparse_dispatch+23
 cc 40                 cmpi.s8	r4, 0x40
 d0 1c                 breq8	sparse_dispatch+37
 cc 7f                 cmpi.s8	r4, 0x7f
 d0 1c                 breq8	sparse_dispatch+41
 c2 c8                 ldi8	r6, 0xc8
 32                    cmp	r4, r6
 d1 1a                 brne8	sparse_dispatch+44
 01                    mov	r4, r5
 fa 35                 lsl16i	r4, 0x5
 d4 0b                 jmp8	sparse_dispatch+34
 cc 03                 cmpi.s8	r4, 0x3
 d0 14                 breq8	sparse_dispatch+47
 cc 13                 cmpi.s8	r4, 0x13
 d1 0d                 brne8	sparse_dispatch+44
 c4 34 12              ldi16	r4, 0x1234
 a4                    xor	r5, r4
 01                    mov	r4, r5
 ef                    ret
 c9 e3                 addi.s8	r5, -0x1d
 01                    mov	r4, r5
 ef                    ret
 01                    mov	r4, r5
 fa 73                 lsr16i	r4, 0x3
 14                    add	r5, r4
 01                    mov	r4, r5
 ef                    ret
 c9 11                 addi.s8	r5, 0x11
 01                    mov	r4, r5
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
