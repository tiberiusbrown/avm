
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/select.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 select.c
00000100 l     O .data	00000040 signed_a
00000140 l     O .data	00000040 signed_b
00000180 l     O .data	00000040 unsigned_values
00000293 l     F .text	00000022 select_kernel
000001c0 l     O .data	00000002 select_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000007d avm_test_main
000002b5 g     F .text	00000002 avm_halt

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
 e1 9f 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 c3 03                 ldi8	r7, 0x3
 c4 a0 f6              ldi16	r4, 0xf6a0
 f0 04 00 01           ldi16	r0, 0x100
 c6 08 07              ldi16	r6, 0x708
 f0 06 40 01           ldi16	r2, 0x140
 f0 05 80 01           ldi16	r1, 0x180
 c1 ad                 ldi8	r5, 0xad
 f4 49                 stsp16	[sp+0x2], r5
 f1 1f                 mov	r3, r7
 f0 6d 91              st16	[r0+], r4
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f0 6d d5              st16	[r2+], r6
 c7 01 01              ldi16	r7, 0x101
 f2 2f                 add	r7, r3
 f0 6d 73              st16	[r1+], r3
 ca 81                 addi.s8	r6, -0x7f
 c5 40 0c              ldi16	r5, 0xc40
 31                    cmp	r4, r5
 d1 e5                 brne8	avm_test_main+30
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 09                    mov	r6, r5
 f4 41                 stsp16	[sp+0x0], r5
 f0 06 00 01           ldi16	r2, 0x100
 f0 07 40 01           ldi16	r3, 0x140
 f0 04 80 01           ldi16	r0, 0x180
 f0 01 20              ldi8	r1, 0x20
 f4 4a                 stsp16	[sp+0x2], r6
 f0 6c 95              ld16	r4, [r2+]
 f0 6c b7              ld16	r5, [r3+]
 f0 6c d1              ld16	r6, [r0+]
 d5 22                 call8	select_kernel
 f4 0a                 ldsp16	r6, [sp+0x2]
 18                    add	r6, r4
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 ea                 brne8	avm_test_main+78
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 ce                 brne8	avm_test_main+61
 f0 5e c0 01           stm16	[0x1c0], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+124
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
 f4 a4                 tst8	r4
 fb 3d                 cmov.eq	r7, r5
 02                    mov	r4, r6
 fa 3e                 lsl16i	r4, 0xe
 fa bf                 asr16i	r4, 0xf
 82                    and	r4, r6
 a3                    xor	r4, r7
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
