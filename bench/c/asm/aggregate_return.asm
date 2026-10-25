
aggregate_return.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 aggregate_return.c
00000100 l     O .data	00000002 aggregate_seed
0000033d l     F .text	0000003f advance
00000102 l     O .data	00000004 aggregate_return_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
000003cf l       .init_array	00000000 .hidden __init_array_end
000003cf l       .init_array	00000000 .hidden __init_array_start
000003cf l       .fini_array	00000000 .hidden __fini_array_start
000003cf l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000076 avm_test_main
0000037c g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000037e g     F .text	00000051 __avm_umulhisi3

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
 e1 5e 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 cf 03              ldi16	r4, 0x3cf
 c1 00                 ldi8	r5, 0x0
 c6 cf 03              ldi16	r6, 0x3cf
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 cf 03           ldi16	r0, 0x3cf
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 cf 03           ldi16	r2, 0x3cf
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
 c4 cf 03              ldi16	r4, 0x3cf
 c1 00                 ldi8	r5, 0x0
 c6 cf 03              ldi16	r6, 0x3cf
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 cf 03           ldi16	r2, 0x3cf
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 cf 03           ldi16	r0, 0x3cf
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
 d6 ef                 adjsp	-0x11
 d7 01                 sys	debug_break
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 07                 ldi8	r4, 0x7
 f0 2c 10              stsp8	[sp+0x10], r4
 c4 aa 55              ldi16	r4, 0x55aa
 f4 78                 stsp16	[sp+0xe], r4
 f0 54 00 01           ldm16	r4, [0x100]
 f4 70                 stsp16	[sp+0xc], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c1 03                 ldi8	r5, 0x3
 c4 03 01              ldi16	r4, 0x103
 f4 58                 stsp16	[sp+0x6], r4
<L0>:
 f4 41                 stsp16	[sp+0x0], r5
 f0 14 08              leasp	r4, 0x8
 d5 42                 call8	advance
 f4 30                 ldsp16	r4, [sp+0xc]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f7 6e                 add32	q3, q2
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f1 01                 mov	r0, r1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 1e 10              ldsp8u	r6, [sp+0x10]
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 f4 18                 ldsp16	r4, [sp+0x6]
 34                    cmp	r5, r4
 d1 cf                 brne8	-0x31 <L0>
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 c6 02 01              ldi16	r6, 0x102
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 11                 adjsp	0x11
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<advance>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 ed 50 24              ld16	r2, [r0+4]
 f1 22                 mov	r4, r2
 d5 31                 call8	__avm_umulhisi3
 f0 6a c0              ld32	q3, [r0]
 f7 6e                 add32	q3, q2
 f2 11                 add	r2, r1
 ed 80 28              ld8u	r4, [r0+8]
 f2 14                 add	r2, r4
 f2 21                 add	r4, r1
 ee 80 28              st8	[r0+8], r4
 ee 50 24              st16	[r0+4], r2
 f0 6b c0              st32	[r0], q3
 02                    mov	r4, r6
 fa 79                 lsr16i	r4, 0x9
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 fa 37                 lsl16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 91                    or	r4, r5
 ed b0 26              ld16	r5, [r0+6]
 a4                    xor	r5, r4
 ee b0 26              st16	[r0+6], r5
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_umulhisi3>:
 d6 f8                 adjsp	-0x8
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 4a                 stsp16	[sp+0x2], r6
 f1 75                 zext8	r5
 f4 41                 stsp16	[sp+0x0], r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 1b                 mulu8.w	r6, r7
 fa 78                 lsr16i	r4, 0x8
 f4 58                 stsp16	[sp+0x6], r4
 f4 09                 ldsp16	r5, [sp+0x2]
 0c                    mov	r7, r4
 f3 1d                 mulu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 1d                    add	r7, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 49                 stsp16	[sp+0x2], r5
 18                    add	r6, r4
 fa 38                 lsl16i	r4, 0x8
 f4 58                 stsp16	[sp+0x6], r4
 f4 13                 ldsp16	r7, [sp+0x4]
 04                    mov	r5, r4
 17                    add	r5, r7
 f4 59                 stsp16	[sp+0x6], r5
 0d                    mov	r7, r5
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 fa 58                 lsl16i	r6, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 19                    add	r6, r5
 3b                    cmp	r6, r7
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 08                 adjsp	0x8
 ef                    ret
