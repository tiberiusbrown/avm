
register_cleanup.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 register_cleanup.c
0000035b l     F .text	00000065 run
00000100 l     O .data	00000004 register_cleanup_result
000003c0 l     F .text	0000003a step
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000428 l       .init_array	00000000 .hidden __init_array_end
00000428 l       .init_array	00000000 .hidden __init_array_start
00000428 l       .fini_array	00000000 .hidden __fini_array_start
00000428 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000094 avm_test_main
000003fa g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000003fc g     F .text	0000002c __avm_ashlsi3

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
 e1 dc 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 28 04              ldi16	r4, 0x428
 c1 00                 ldi8	r5, 0x0
 c6 28 04              ldi16	r6, 0x428
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 28 04           ldi16	r0, 0x428
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 28 04           ldi16	r2, 0x428
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
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
 d0 03                 breq8	0x3 <L0>
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 28 04              ldi16	r4, 0x428
 c1 00                 ldi8	r5, 0x0
 c6 28 04              ldi16	r6, 0x428
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 28 04           ldi16	r2, 0x428
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 28 04           ldi16	r0, 0x428
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
<L3>:
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
 d7 01                 sys	debug_break
 c4 01 01              ldi16	r4, 0x101
 e1 88 00              call16	run
 f2 66                 mov32	q1, q2
 c4 20 01              ldi16	r4, 0x120
 e1 80 00              call16	run
 f2 62                 mov32	q0, q2
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c4 3f 01              ldi16	r4, 0x13f
 d5 75                 call8	run
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c4 5e 01              ldi16	r4, 0x15e
 d5 6a                 call8	run
 f2 62                 mov32	q0, q2
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c4 7d 01              ldi16	r4, 0x17d
 d5 5f                 call8	run
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c4 9c 01              ldi16	r4, 0x19c
 d5 54                 call8	run
 f2 62                 mov32	q0, q2
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c4 bb 01              ldi16	r4, 0x1bb
 d5 49                 call8	run
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c4 da 01              ldi16	r4, 0x1da
 d5 3e                 call8	run
 f2 62                 mov32	q0, q2
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c4 f9 01              ldi16	r4, 0x1f9
 d5 33                 call8	run
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c4 18 02              ldi16	r4, 0x218
 d5 28                 call8	run
 f2 62                 mov32	q0, q2
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c4 37 02              ldi16	r4, 0x237
 d5 1d                 call8	run
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c4 56 02              ldi16	r4, 0x256
 d5 12                 call8	run
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<run>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f1 04                 mov	r0, r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 c0 30                 ldi8	r4, 0x30
 f1 24                 mov	r5, r0
 c9 17                 addi.s8	r5, 0x17
<L0>:
 f4 41                 stsp16	[sp+0x0], r5
 f4 50                 stsp16	[sp+0x4], r4
 f0 11 06              leasp	r1, 0x6
 f1 21                 mov	r4, r1
 d5 3c                 call8	step
 f2 04                 add	r0, r4
 f0 38 02              stsp16	[sp+0x2], r0
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d5 31                 call8	step
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f7 63                 add32	q0, q3
 f4 01                 ldsp16	r5, [sp+0x0]
 a4                    xor	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 30 02              ldsp16	r0, [sp+0x2]
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 c9                 brne8	-0x37 <L0>
 f4 18                 ldsp16	r4, [sp+0x6]
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f7 69                 add32	q2, q1
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<step>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 c0 07                 ldi8	r4, 0x7
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 af                    xor	r7, r7
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 d5 29                 call8	__avm_ashlsi3
 f1 28                 mov	r6, r0
 ca 04                 addi.s8	r6, 0x4
 f0 6a 4c              ld32	q1, [r6]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f0 6b 4c              st32	[r6], q1
 ed b0 20              ld16	r5, [r0+0]
 f2 25                 add	r5, r1
 ed 90 22              ld16	r4, [r0+2]
 14                    add	r5, r4
 c8 07                 addi.s8	r4, 0x7
 f1 74                 zext8	r4
 ee 90 22              st16	[r0+2], r4
 ee b0 20              st16	[r0+0], r5
 a1                    xor	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_ashlsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0c                    mov	r7, r4
 fa 06                 shl16v	r5, r6
 fa 02                 shl16v	r4, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 1e                 lsr16v	r7, r6
 97                    or	r5, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 02                 shl16v	r4, r6
 04                    mov	r5, r4
 c0 00                 ldi8	r4, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret
