
sys_strlen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	0000004a avm_run_constructors
00000368 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sys_strlen.c
00000103 l     O .data	00000009 length8
0000010c l     O .data	00000021 length32
00000101 l     O .data	00000002 length1
00000100 l     O .data	00000001 length0
0000012d l     O .data	00000101 length256
0000022e l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
0000047d l       .init_array	00000000 .hidden __init_array_end
0000047d l       .init_array	00000000 .hidden __init_array_start
0000047d l       .fini_array	00000000 .hidden __fini_array_start
0000047d l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003d7 g     F .text	000000a4 avm_test_main
0000047b g     F .text	00000002 avm_halt
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
 e1 5d 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 7d 04              ldi16	r4, 0x47d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 7d 04              ldi16	r6, 0x47d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 7d 04           ldi16	r0, 0x47d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 7d 04           ldi16	r2, 0x47d
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
 c4 7d 04              ldi16	r4, 0x47d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 7d 04              ldi16	r6, 0x47d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 7d 04           ldi16	r2, 0x47d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 7d 04           ldi16	r0, 0x47d
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
 c4 63 63              ldi16	r4, 0x6363
 c5 63 63              ldi16	r5, 0x6363
 c6 07 01              ldi16	r6, 0x107
 f0 6b 8c              st32	[r6], q2
 f0 06 03 01           ldi16	r2, 0x103
 f0 6b 84              st32	[r2], q2
 f0 04 64 64           ldi16	r0, 0x6464
 f0 05 64 64           ldi16	r1, 0x6464
 c4 28 01              ldi16	r4, 0x128
 f0 6b 08              st32	[r4], q0
 c4 24 01              ldi16	r4, 0x124
 f0 6b 08              st32	[r4], q0
 c4 20 01              ldi16	r4, 0x120
 f0 6b 08              st32	[r4], q0
 c4 1c 01              ldi16	r4, 0x11c
 f0 6b 08              st32	[r4], q0
 c4 18 01              ldi16	r4, 0x118
 f0 6b 08              st32	[r4], q0
 c4 14 01              ldi16	r4, 0x114
 f0 6b 08              st32	[r4], q0
 c4 10 01              ldi16	r4, 0x110
 f0 6b 08              st32	[r4], q0
 f0 07 0c 01           ldi16	r3, 0x10c
 f0 6b 06              st32	[r3], q0
 c0 62                 ldi8	r4, 0x62
 f0 5c 01 01           stm16	[0x101], r4
 aa                    xor	r6, r6
 f0 4e 00 01           stm8	[0x100], r6
 f0 4e 0b 01           stm8	[0x10b], r6
 f0 4e 2c 01           stm8	[0x12c], r6
 c7 00 01              ldi16	r7, 0x100
 c5 2d 01              ldi16	r5, 0x12d
 c0 65                 ldi8	r4, 0x65
 f6 0c                 st8	[r5+], r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f8                 brne8	avm_test_main+107
 f0 4e 2d 02           stm8	[0x22d], r6
 d7 01                 sys	debug_break
 c4 00 01              ldi16	r4, 0x100
 d7 1a                 sys	strlen
 04                    mov	r5, r4
 c4 01 01              ldi16	r4, 0x101
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 1d                    add	r7, r5
 f1 22                 mov	r4, r2
 d7 1a                 sys	strlen
 04                    mov	r5, r4
 17                    add	r5, r7
 f1 23                 mov	r4, r3
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 1d                    add	r7, r5
 c4 2d 01              ldi16	r4, 0x12d
 d7 1a                 sys	strlen
 13                    add	r4, r7
 f0 5c 2e 02           stm16	[0x22e], r4
 d7 01                 sys	debug_break
 02                    mov	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
