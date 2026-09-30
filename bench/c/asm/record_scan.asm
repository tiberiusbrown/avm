
record_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	0000004a avm_run_constructors
00000368 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 record_scan.c
00000100 l     O .data	00000120 records
00000220 l     O .data	00000002 record_result
00000000 l    df *ABS*	00000000 runtime.c
000004a8 l       .init_array	00000000 .hidden __init_array_end
000004a8 l       .init_array	00000000 .hidden __init_array_start
000004a8 l       .fini_array	00000000 .hidden __fini_array_start
000004a8 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003d7 g     F .text	000000cf avm_test_main
000004a6 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 88 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 a8 04              ldi16	r4, 0x4a8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 a8 04              ldi16	r6, 0x4a8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 a8 04           ldi16	r0, 0x4a8
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 a8 04           ldi16	r2, 0x4a8
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fc              call16	-895
 c4 a8 04              ldi16	r4, 0x4a8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 a8 04              ldi16	r6, 0x4a8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 a8 04           ldi16	r2, 0x4a8
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 a8 04           ldi16	r0, 0x4a8
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fc              call16	-976
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 07 e8 03           ldi16	r3, 0x3e8
 f0 04 02 01           ldi16	r0, 0x102
 c3 fa                 ldi8	r7, 0xfa
 a5                    xor	r5, r5
 f0 01 fb              ldi8	r1, 0xfb
 f0 02 03              ldi8	r2, 0x3
 c0 75                 ldi8	r4, 0x75
 f4 40                 stsp16	[sp+0x0], r4
 f4 4b                 stsp16	[sp+0x2], r7
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 01                    mov	r4, r5
 23                    sub	r4, r7
 c2 fe                 ldi8	r6, 0xfe
 88                    and	r6, r4
 f4 8e                 lsr16.1	r6
 1b                    add	r6, r7
 fa 93                 lsr16i	r6, 0x3
 c0 0b                 ldi8	r4, 0xb
 f3 18                 mulu8.w	r6, r4
 c0 4f                 ldi8	r4, 0x4f
 0d                    mov	r7, r5
 f3 1c                 mulu8.w	r7, r4
 fa aa                 lsr16i	r7, 0xa
 c0 0d                 ldi8	r4, 0xd
 f3 1c                 mulu8.w	r7, r4
 c0 5a                 ldi8	r4, 0x5a
 a1                    xor	r4, r5
 ee 80 20              st8	[r0+0], r4
 01                    mov	r4, r5
 23                    sub	r4, r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 21                    sub	r4, r5
 13                    add	r4, r7
 ee 80 1e              st8	[r0-2], r4
 01                    mov	r4, r5
 22                    sub	r4, r6
 21                    sub	r4, r5
 f2 21                 add	r4, r1
 ee 80 1f              st8	[r0-1], r4
 ee 40 21              st8	[r0+1], r2
 f0 0a 07              addi.s8	r2, 0x7
 f4 a9                 inc16	r1
 f4 ad                 inc16	r5
 f4 af                 inc16	r7
 ee 70 22              st16	[r0+2], r3
 f0 08 06              addi.s8	r0, 0x6
 f0 0b 1d              addi.s8	r3, 0x1d
 c4 58 09              ldi16	r4, 0x958
 f5 1c                 cmp	r3, r4
 d1 ab                 brne8	avm_test_main+27
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f1 21                 mov	r4, r1
 f1 11                 mov	r2, r1
 f1 19                 mov	r3, r1
 d4 0a                 jmp8	avm_test_main+134
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 cd 20                 cmpi.s8	r5, 0x20
 d0 37                 breq8	avm_test_main+189
 c2 30                 ldi8	r6, 0x30
 c5 00 01              ldi16	r5, 0x100
 d4 12                 jmp8	avm_test_main+159
 0c                    mov	r7, r4
 ed 9a 24              ld16	r4, [r5+4]
 f4 b4                 dec16	r4
 ee 9a 24              st16	[r5+4], r4
 a3                    xor	r4, r7
 c9 06                 addi.s8	r5, 0x6
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 d0 dd                 breq8	avm_test_main+124
 ed ea 21              ld8u	r7, [r5+1]
 f6 47                 sext8	r7
 f2 17                 add	r2, r7
 4d                    ld8u	r7, [r5]
 f6 47                 sext8	r7
 f2 1f                 add	r3, r7
 ed ea 22              ld8u	r7, [r5+2]
 f0 00 01              ldi8	r0, 0x1
 f9 1c                 and	r0, r7
 f4 a0                 tst8	r0
 d0 d6                 breq8	avm_test_main+141
 ed ea 23              ld8u	r7, [r5+3]
 13                    add	r4, r7
 d4 d0                 jmp8	avm_test_main+141
 f9 4e                 xor	r2, r3
 f9 52                 xor	r2, r4
 f0 5a 20 02           stm16	[0x220], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
