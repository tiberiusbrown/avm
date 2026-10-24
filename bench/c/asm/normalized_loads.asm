
normalized_loads.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 normalized_loads.c
00000100 l     O .data	00000020 values
00000370 l     O .rodata	0000000c table
00000358 l     F .text	00000005 mix_byte
0000035d l     F .text	00000011 read_page
00000120 l     O .data	00000002 normalized_loads_result
0000037c l     O .rodata	00000020 pages
00000000 l    df *ABS*	00000000 runtime.c
000003bc l       .init_array	00000000 .hidden __init_array_end
000003bc l       .init_array	00000000 .hidden __init_array_start
000003bc l       .fini_array	00000000 .hidden __fini_array_start
000003bc l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000091 avm_test_main
0000036e g     F .text	00000002 avm_halt
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
 e1 50 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 bc 03              ldi16	r4, 0x3bc
 c1 00                 ldi8	r5, 0x0
 c6 bc 03              ldi16	r6, 0x3bc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 bc 03           ldi16	r0, 0x3bc
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 bc 03           ldi16	r2, 0x3bc
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
 c4 bc 03              ldi16	r4, 0x3bc
 c1 00                 ldi8	r5, 0x0
 c6 bc 03              ldi16	r6, 0x3bc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 bc 03           ldi16	r2, 0x3bc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 bc 03           ldi16	r0, 0x3bc
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
 d6 f4                 adjsp	-0xc
 f0 05 00 01           ldi16	r1, 0x100
 f1 21                 mov	r4, r1
 c6 9c 03              ldi16	r6, 0x39c
 c3 00                 ldi8	r7, 0x0
 c1 20                 ldi8	r5, 0x20
 d7 10                 sys	memcpy_p
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c2 1f                 ldi8	r6, 0x1f
 c3 03                 ldi8	r7, 0x3
 f0 06 70 03           ldi16	r2, 0x370
 f0 03 00              ldi8	r3, 0x0
 01                    mov	r4, r5
 f1 05                 mov	r0, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
<L0>:
 f0 38 04              stsp16	[sp+0x4], r0
 f2 30                 sub	r0, r0
 f4 60                 stsp16	[sp+0x8], r4
<L1>:
 f0 38 0a              stsp16	[sp+0xa], r0
 f4 20                 ldsp16	r4, [sp+0x8]
 f2 20                 add	r4, r0
 82                    and	r4, r6
 f2 21                 add	r4, r1
 40                    ld8u	r4, [r4]
 f4 12                 ldsp16	r6, [sp+0x4]
 18                    add	r6, r4
 8b                    and	r6, r7
 0e                    mov	r7, r6
 1f                    add	r7, r7
 1e                    add	r7, r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f2 61                 mov32	q0, q1
 f7 67                 add32	q1, q3
 f0 63 44              ldp24	q1, [q1]
 d5 43                 call8	mix_byte
 f4 58                 stsp16	[sp+0x6], r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 f1 76                 zext8	r6
 f2 69                 mov32	q2, q1
 f2 64                 mov32	q1, q0
 f0 30 0a              ldsp16	r0, [sp+0xa]
 d5 39                 call8	read_page
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f4 18                 ldsp16	r4, [sp+0x6]
 14                    add	r5, r4
 f0 05 00 01           ldi16	r1, 0x100
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 f4 20                 ldsp16	r4, [sp+0x8]
 d1 ba                 brne8	-0x46 <L1>
 f4 ac                 inc16	r4
 f0 30 04              ldsp16	r0, [sp+0x4]
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 a7                 brne8	-0x59 <L0>
 f0 5d 20 01           stm16	[0x120], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_byte>:
 09                    mov	r6, r5
 1a                    add	r6, r6
 19                    add	r6, r5
 12                    add	r4, r6
 ef                    ret

<read_page>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f7 62                 add32	q0, q2
 f0 60 80              ldp8u	r4, [q0]
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
