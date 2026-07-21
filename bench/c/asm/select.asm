
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/select.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 select.c
00000100 l     O .data	00000040 signed_a
00000140 l     O .data	00000040 signed_b
00000180 l     O .data	00000040 unsigned_values
0000028a l     F .text	00000022 select_kernel
000001c0 l     O .data	00000002 select_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000074 avm_test_main
000002ac g     F .text	00000002 avm_halt

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
 e1 96 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 02 03              ldi8	r2, 0x3
 c4 a0 f6              ldi16	r4, 0xf6a0
 c5 00 01              ldi16	r5, 0x100
 c6 08 07              ldi16	r6, 0x708
 c7 40 01              ldi16	r7, 0x140
 f0 04 80 01           ldi16	r0, 0x180
 f0 01 ad              ldi8	r1, 0xad
 f1 1a                 mov	r3, r2
 f7 4c                 st16	[r7+], r4
 f2 21                 add	r4, r1
 f7 5e                 st16	[r7+], r6
 f0 06 01 01           ldi16	r2, 0x101
 f2 13                 add	r2, r3
 f0 6d 71              st16	[r0+], r3
 ca 81                 addi.s8	r6, -0x7f
 f0 07 40 0c           ldi16	r3, 0xc40
 f5 23                 cmp	r4, r3
 d1 e5                 brne8	avm_test_main+26
 f0 00 00              ldi8	r0, 0x0
 d7 01                 sys	debug_break
 f1 10                 mov	r2, r0
 f1 08                 mov	r1, r0
 f1 18                 mov	r3, r0
 c4 00 01              ldi16	r4, 0x100
 f2 23                 add	r4, r3
 60                    ld16	r4, [r4]
 c5 40 01              ldi16	r5, 0x140
 f2 27                 add	r5, r3
 65                    ld16	r5, [r5]
 c6 80 01              ldi16	r6, 0x180
 f2 2b                 add	r6, r3
 6a                    ld16	r6, [r6]
 d5 20                 call8	select_kernel
 f2 0c                 add	r1, r4
 f0 0b 02              addi.s8	r3, 0x2
 f0 0f 40              cmpi.s8	r3, 0x40
 d1 e2                 brne8	avm_test_main+64
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 d6                 brne8	avm_test_main+62
 f0 59 c0 01           stm16	[0x1c0], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<select_kernel>:
 34                    cmp	r5, r4
 0d                    mov	r7, r5
 fd 3c                 cmov.slt	r7, r4
 31                    cmp	r4, r5
 fd 2c                 cmov.slt	r5, r4
 c4 18 fc              ldi16	r4, 0xfc18
 31                    cmp	r4, r5
 fd 25                 cmov.slt	r4, r5
 c5 e8 03              ldi16	r5, 0x3e8
 31                    cmp	r4, r5
 fd 2c                 cmov.slt	r5, r4
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 f6 2c                 tst16	r4
 fb 3d                 cmov.eq	r7, r5
 02                    mov	r4, r6
 fa 3e                 lsl16i	r4, 0xe
 fa bf                 asr16i	r4, 0xf
 82                    and	r4, r6
 a3                    xor	r4, r7
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
