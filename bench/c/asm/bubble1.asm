
bubble1.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 bubble1.c
00000000 l    df *ABS*	00000000 runtime.c
0000036d l       .init_array	00000000 .hidden __init_array_end
0000036d l       .init_array	00000000 .hidden __init_array_start
0000036d l       .fini_array	00000000 .hidden __fini_array_start
0000036d l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000064 avm_test_main
0000032b g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000100 g     O .data	00000040 A

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
 e1 0d 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 6d 03              ldi16	r4, 0x36d
 c1 00                 ldi8	r5, 0x0
 c6 6d 03              ldi16	r6, 0x36d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 6d 03           ldi16	r0, 0x36d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 6d 03           ldi16	r2, 0x36d
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
 c4 6d 03              ldi16	r4, 0x36d
 c1 00                 ldi8	r5, 0x0
 c6 6d 03              ldi16	r6, 0x36d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 6d 03           ldi16	r2, 0x36d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 6d 03           ldi16	r0, 0x36d
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
 c4 00 01              ldi16	r4, 0x100
 c6 2d 03              ldi16	r6, 0x32d
 c3 00                 ldi8	r7, 0x0
 c1 40                 ldi8	r5, 0x40
 d7 10                 sys	memcpy_p
 f0 03 40              ldi8	r3, 0x40
 d7 01                 sys	debug_break
 f2 39                 sub	r1, r1
 f0 02 01              ldi8	r2, 0x1
 d4 08                 jmp8	0x8 <L1>
<L0>:
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 38                 brult8	0x38 <L4>
<L1>:
 f1 73                 zext8	r3
 f4 b3                 dec16	r3
 f1 2f                 mov	r7, r3
 f1 22                 mov	r4, r2
 c6 01 01              ldi16	r6, 0x101
 f1 19                 mov	r3, r1
 d4 0a                 jmp8	0xa <L3>
<L2>:
 f4 ac                 inc16	r4
 f4 ae                 inc16	r6
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d0 df                 breq8	-0x21 <L0>
<L3>:
 46                    ld8u	r5, [r6]
 f6 45                 sext8	r5
 ed 0c 1f              ld8u	r0, [r6-1]
 f6 40                 sext8	r0
 f5 24                 cmp	r5, r0
 d9 ea                 brsge8	-0x16 <L2>
 f3 08                 st8	[r6], r0
 ee ac 1f              st8	[r6-1], r5
 f1 1c                 mov	r3, r4
 f4 ac                 inc16	r4
 f4 ae                 inc16	r6
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 e3                 brne8	-0x1d <L3>
 d4 c0                 jmp8	-0x40 <L0>
<L4>:
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
