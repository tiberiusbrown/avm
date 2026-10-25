
constant_arith.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 constant_arith.c
00000100 l     O .data	00000002 constant_arith_result
00000102 l     O .data	00000080 values
00000000 l    df *ABS*	00000000 runtime.c
00000414 l       .init_array	00000000 .hidden __init_array_end
00000414 l       .init_array	00000000 .hidden __init_array_start
00000414 l       .fini_array	00000000 .hidden __fini_array_start
00000414 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000cb avm_test_main
00000392 g     F .text	00000002 avm_halt
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
 e1 74 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 14 04              ldi16	r4, 0x414
 c1 00                 ldi8	r5, 0x0
 c6 14 04              ldi16	r6, 0x414
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 14 04           ldi16	r0, 0x414
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 14 04           ldi16	r2, 0x414
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
 c4 14 04              ldi16	r4, 0x414
 c1 00                 ldi8	r5, 0x0
 c6 14 04              ldi16	r6, 0x414
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 14 04           ldi16	r2, 0x414
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 14 04           ldi16	r0, 0x414
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
 d6 f0                 adjsp	-0x10
 c4 02 01              ldi16	r4, 0x102
 c6 94 03              ldi16	r6, 0x394
 c3 00                 ldi8	r7, 0x0
 c1 80                 ldi8	r5, 0x80
 d7 10                 sys	memcpy_p
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 f0 01 07              ldi8	r1, 0x7
 c3 0a                 ldi8	r7, 0xa
 f0 00 1f              ldi8	r0, 0x1f
 09                    mov	r6, r5
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 04              stsp16	[sp+0x4], r0
<L0>:
 f4 4a                 stsp16	[sp+0x2], r6
 f0 33 00              ldsp16	r3, [sp+0x0]
 c4 02 01              ldi16	r4, 0x102
 08                    mov	r6, r4
<L1>:
 f7 34                 ld16	r4, [r6+]
 f4 7a                 stsp16	[sp+0xe], r6
 08                    mov	r6, r4
 1a                    add	r6, r6
 18                    add	r6, r4
 19                    add	r6, r5
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 14                    add	r5, r4
 a6                    xor	r5, r6
 08                    mov	r6, r4
 fe 31                 mul16	r6, r1
 19                    add	r6, r5
 04                    mov	r5, r4
 fe 2f                 mul16	r5, r7
 a6                    xor	r5, r6
 08                    mov	r6, r4
 fe 30                 mul16	r6, r0
 19                    add	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 04                    mov	r5, r4
 ec 2f                 udiv16	r5, r7
 c6 f6 ff              ldi16	r6, 0xfff6
 0d                    mov	r7, r5
 fe 3e                 mul16	r7, r6
 1c                    add	r7, r4
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f0 01 05              ldi8	r1, 0x5
 04                    mov	r5, r4
 ec 29                 udiv16	r5, r1
 c6 fb ff              ldi16	r6, 0xfffb
 0d                    mov	r7, r5
 fe 3e                 mul16	r7, r6
 1c                    add	r7, r4
 1d                    add	r7, r5
 f4 63                 stsp16	[sp+0x8], r7
 c2 03                 ldi8	r6, 0x3
 04                    mov	r5, r4
 ec 2e                 udiv16	r5, r6
 f0 04 fd ff           ldi16	r0, 0xfffd
 09                    mov	r6, r5
 fe 30                 mul16	r6, r0
 18                    add	r6, r4
 19                    add	r6, r5
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 14                    add	r5, r4
 f4 2b                 ldsp16	r7, [sp+0xa]
 a7                    xor	r5, r7
 f0 06 00 80           ldi16	r2, 0x8000
 f9 52                 xor	r2, r4
 f1 02                 mov	r0, r2
 ec c1                 srem16	r0, r1
 c3 03                 ldi8	r7, 0x3
 ec 97                 sdiv16	r2, r7
 f0 01 01              ldi8	r1, 0x1
 f9 30                 and	r1, r4
 f4 8c                 lsr16.1	r4
 f2 21                 add	r4, r1
 11                    add	r4, r5
 a2                    xor	r4, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 f4 21                 ldsp16	r5, [sp+0x8]
 11                    add	r4, r5
 f0 31 06              ldsp16	r1, [sp+0x6]
 f4 31                 ldsp16	r5, [sp+0xc]
 a1                    xor	r4, r5
 f2 22                 add	r4, r2
 f9 82                 xor	r4, r0
 f0 30 04              ldsp16	r0, [sp+0x4]
 c3 0a                 ldi8	r7, 0xa
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 04                    mov	r5, r4
 db 7e ff              brne16	-0x82 <L1>
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 ce 20                 cmpi.s8	r6, 0x20
 04                    mov	r5, r4
 db 6b ff              brne16	-0x95 <L0>
 f0 5c 00 01           stm16	[0x100], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
