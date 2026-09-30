
progmem_widen_ldp16.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 progmem_widen_ldp16.c
00000351 l     O .rodata	000000a0 program_bytes
000002f4 l     F .text	0000005b sum_byte_pairs
00000100 l     O .data	00000006 results
00000000 l    df *ABS*	00000000 runtime.c
000003f1 l       .init_array	00000000 .hidden __init_array_end
000003f1 l       .init_array	00000000 .hidden __init_array_start
000003f1 l       .fini_array	00000000 .hidden __fini_array_start
000003f1 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000002d avm_test_main
0000034f g     F .text	00000002 avm_halt
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
 e1 31 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f1 03              ldi16	r4, 0x3f1
 c1 00                 ldi8	r5, 0x0
 c6 f1 03              ldi16	r6, 0x3f1
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 f1 03           ldi16	r0, 0x3f1
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f1 03           ldi16	r2, 0x3f1
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
 c4 f1 03              ldi16	r4, 0x3f1
 c1 00                 ldi8	r5, 0x0
 c6 f1 03              ldi16	r6, 0x3f1
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 f1 03           ldi16	r2, 0x3f1
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f1 03           ldi16	r0, 0x3f1
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
 d7 01                 sys	debug_break
 c4 51 03              ldi16	r4, 0x351
 c1 00                 ldi8	r5, 0x0
 c2 40                 ldi8	r6, 0x40
 d5 22                 call8	sum_byte_pairs
 f0 5c 00 01           stm16	[0x100], r4
 c4 52 03              ldi16	r4, 0x352
 c1 00                 ldi8	r5, 0x0
 c2 3f                 ldi8	r6, 0x3f
 d5 15                 call8	sum_byte_pairs
 f0 5c 02 01           stm16	[0x102], r4
 c4 53 03              ldi16	r4, 0x353
 c1 00                 ldi8	r5, 0x0
 c2 41                 ldi8	r6, 0x41
 d5 08                 call8	sum_byte_pairs
 f0 5c 04 01           stm16	[0x104], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 ef                    ret

<sum_byte_pairs>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 a0                    xor	r4, r4
 c3 01                 ldi8	r7, 0x1
 f4 5a                 stsp16	[sp+0x6], r6
 8e                    and	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 08                    mov	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d1 0a                 brne8	sum_byte_pairs+37
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 d4 11                 jmp8	sum_byte_pairs+54
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 66 40              ldp16	r2, [q0+]
 f2 14                 add	r2, r4
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 b7                 dec16	r7
 f1 22                 mov	r4, r2
 f0 68 40              ldp32	q1, [q0+]
 f1 2a                 mov	r6, r2
 18                    add	r6, r4
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 12                    add	r4, r6
 cb fe                 addi.s8	r7, -0x2
 f6 2f                 tst16	r7
 d1 f0                 brne8	sum_byte_pairs+54
 0c                    mov	r7, r4
 fa af                 lsr16i	r7, 0xf
 10                    add	r4, r4
 93                    or	r4, r7
 f4 22                 ldsp16	r6, [sp+0x8]
 a2                    xor	r4, r6
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
 d1 bf                 brne8	sum_byte_pairs+19
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
