
sys_strlen_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 sys_strlen_p.c
00000305 l     O .rodata	00000001 length0
00000306 l     O .rodata	00000002 length1
00000308 l     O .rodata	00000009 length8
00000311 l     O .rodata	00000021 length32
00000332 l     O .rodata	00000101 length256
00000100 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000433 l       .init_array	00000000 .hidden __init_array_end
00000433 l       .init_array	00000000 .hidden __init_array_start
00000433 l       .fini_array	00000000 .hidden __fini_array_start
00000433 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000003c avm_test_main
00000303 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 e5 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 33 04              ldi16	r4, 0x433
 c1 00                 ldi8	r5, 0x0
 c6 33 04              ldi16	r6, 0x433
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 33 04           ldi16	r0, 0x433
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 33 04           ldi16	r2, 0x433
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 33 04              ldi16	r4, 0x433
 c1 00                 ldi8	r5, 0x0
 c6 33 04              ldi16	r6, 0x433
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 33 04           ldi16	r2, 0x433
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 33 04           ldi16	r0, 0x433
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b0                    push16	r0
 d7 01                 sys	debug_break
 c6 05 03              ldi16	r6, 0x305
 c3 00                 ldi8	r7, 0x0
 d7 15                 sys	strlen_p
 f1 04                 mov	r0, r4
 c6 06 03              ldi16	r6, 0x306
 c3 00                 ldi8	r7, 0x0
 d7 15                 sys	strlen_p
 04                    mov	r5, r4
 f2 24                 add	r5, r0
 c6 08 03              ldi16	r6, 0x308
 c3 00                 ldi8	r7, 0x0
 d7 15                 sys	strlen_p
 f1 04                 mov	r0, r4
 f2 05                 add	r0, r5
 c6 11 03              ldi16	r6, 0x311
 c3 00                 ldi8	r7, 0x0
 d7 15                 sys	strlen_p
 04                    mov	r5, r4
 f2 24                 add	r5, r0
 c6 32 03              ldi16	r6, 0x332
 c3 00                 ldi8	r7, 0x0
 d7 15                 sys	strlen_p
 11                    add	r4, r5
 f0 5c 00 01           stm16	[0x100], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
