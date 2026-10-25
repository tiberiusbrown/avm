
bounded_shifts.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 bounded_shifts.c
0000038e l     F .text	0000004f small
000003dd l     F .text	0000001a large
000003f7 l     F .text	0000007b full
00000100 l     O .data	00000004 result
00000104 l     O .data	00000010 values
00000114 l     O .data	00000010 counts
00000000 l    df *ABS*	00000000 runtime.c
00000474 l       .init_array	00000000 .hidden __init_array_end
00000474 l       .init_array	00000000 .hidden __init_array_start
00000474 l       .fini_array	00000000 .hidden __fini_array_start
00000474 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000c7 avm_test_main
00000472 g     F .text	00000002 avm_halt
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
 e1 54 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 74 04              ldi16	r4, 0x474
 c1 00                 ldi8	r5, 0x0
 c6 74 04              ldi16	r6, 0x474
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 74 04           ldi16	r0, 0x474
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 74 04           ldi16	r2, 0x474
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
 c4 74 04              ldi16	r4, 0x474
 c1 00                 ldi8	r5, 0x0
 c6 74 04              ldi16	r6, 0x474
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 74 04           ldi16	r2, 0x474
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 74 04           ldi16	r0, 0x474
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
 c4 67 45              ldi16	r4, 0x4567
 c5 23 81              ldi16	r5, 0x8123
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 ff ff              ldi16	r5, 0xffff
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 00 80              ldi16	r5, 0x8000
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 f0 5d 14 01           stm16	[0x114], r5
 c0 05                 ldi8	r4, 0x5
 f0 5c 16 01           stm16	[0x116], r4
 c0 0a                 ldi8	r4, 0xa
 f0 5c 18 01           stm16	[0x118], r4
 c0 0f                 ldi8	r4, 0xf
 f0 5c 1a 01           stm16	[0x11a], r4
 c0 14                 ldi8	r4, 0x14
 f0 5c 1c 01           stm16	[0x11c], r4
 c0 19                 ldi8	r4, 0x19
 f0 5c 1e 01           stm16	[0x11e], r4
 c0 1e                 ldi8	r4, 0x1e
 f0 5c 20 01           stm16	[0x120], r4
 c0 23                 ldi8	r4, 0x23
 f0 5c 22 01           stm16	[0x122], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c7 14 01              ldi16	r7, 0x114
 d7 01                 sys	debug_break
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
<L0>:
 f4 61                 stsp16	[sp+0x8], r5
 01                    mov	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f7 3e                 ld16	r6, [r7+]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 5b                 stsp16	[sp+0x6], r7
 d5 3b                 call8	small
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f2 68                 mov32	q2, q0
 f4 2a                 ldsp16	r6, [sp+0xa]
 d5 7a                 call8	large
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f4 2a                 ldsp16	r6, [sp+0xa]
 e1 87 00              call16	full
 f4 1b                 ldsp16	r7, [sp+0x6]
 f2 62                 mov32	q0, q2
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 61                 add32	q0, q1
 f4 ad                 inc16	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 ba                 brne8	-0x46 <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<small>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c3 0f                 ldi8	r7, 0xf
 8b                    and	r6, r7
 f4 5a                 stsp16	[sp+0x6], r6
 ae                    xor	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 fa 1b                 lsr16v	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 09                    mov	r6, r5
 f4 1b                 ldsp16	r7, [sp+0x6]
 fa 0b                 shl16v	r6, r7
 0e                    mov	r7, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 9e                    or	r7, r6
 f4 4b                 stsp16	[sp+0x2], r7
 0c                    mov	r7, r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 0e                 shl16v	r7, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
 09                    mov	r6, r5
 1a                    add	r6, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 0b                 shl16v	r6, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 fa 13                 lsr16v	r4, r7
 92                    or	r4, r6
 09                    mov	r6, r5
 fa 1b                 lsr16v	r6, r7
 f1 14                 mov	r2, r4
 f1 1e                 mov	r3, r6
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 0b                    mov	r6, r7
 fa 26                 asr16v	r5, r6
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<large>:
 b1                    push16	r1
 b0                    push16	r0
 c3 0f                 ldi8	r7, 0xf
 8e                    and	r7, r6
 fa 03                 shl16v	r4, r7
 09                    mov	r6, r5
 fa 1b                 lsr16v	r6, r7
 f1 06                 mov	r0, r6
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 fa 23                 asr16v	r4, r7
 fa cf                 asr16i	r5, 0xf
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<full>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 06                 mov	r0, r6
 c3 0f                 ldi8	r7, 0xf
 8b                    and	r6, r7
 f4 62                 stsp16	[sp+0x8], r6
 ae                    xor	r7, r6
 09                    mov	r6, r5
 1a                    add	r6, r6
 fa 0b                 shl16v	r6, r7
 f4 5a                 stsp16	[sp+0x6], r6
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 fa 1b                 lsr16v	r6, r7
 f4 52                 stsp16	[sp+0x4], r6
 0d                    mov	r7, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 fa 0e                 shl16v	r7, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 9e                    or	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 0c                    mov	r7, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 fa 1e                 lsr16v	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 9e                    or	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 01 10              ldi8	r1, 0x10
 f9 20                 and	r1, r0
 f4 23                 ldsp16	r7, [sp+0x8]
 fa 03                 shl16v	r4, r7
 09                    mov	r6, r5
 fa 1b                 lsr16v	r6, r7
 f4 4a                 stsp16	[sp+0x2], r6
 09                    mov	r6, r5
 fa 2b                 asr16v	r6, r7
 fa cf                 asr16i	r5, 0xf
 f4 a1                 tst8	r1
 f4 1b                 ldsp16	r7, [sp+0x6]
 fb 7e                 cmov.ne	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 fb 75                 cmov.ne	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 11                 ldsp16	r5, [sp+0x4]
 fb 6c                 cmov.ne	r5, r4
 f2 30                 sub	r0, r0
 fb 60                 cmov.ne	r4, r0
 f4 a1                 tst8	r1
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 1b                 ldsp16	r7, [sp+0x6]
 fb 7e                 cmov.ne	r7, r6
 fb 70                 cmov.ne	r6, r0
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 01                 ldsp16	r5, [sp+0x0]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
