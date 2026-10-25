
mixed_width.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 mixed_width.c
00000140 l     O .data	00000040 signed_words
00000180 l     O .data	00000080 wide_values
00000100 l     O .data	00000020 signed_bytes
00000120 l     O .data	00000020 unsigned_bytes
00000200 l     O .data	00000004 mixed_width_result
00000000 l    df *ABS*	00000000 runtime.c
000004ba l       .init_array	00000000 .hidden __init_array_end
000004ba l       .init_array	00000000 .hidden __init_array_start
000004ba l       .fini_array	00000000 .hidden __fini_array_start
000004ba l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	000000f1 avm_test_main
000004b8 g     F .text	00000002 avm_halt
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
 e1 9a 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ba 04              ldi16	r4, 0x4ba
 c1 00                 ldi8	r5, 0x0
 c6 ba 04              ldi16	r6, 0x4ba
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 ba 04           ldi16	r0, 0x4ba
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ba 04           ldi16	r2, 0x4ba
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
 e1 89 fc              call16	-887 <__avm_run_local_dtors>
<L0>:
 c4 ba 04              ldi16	r4, 0x4ba
 c1 00                 ldi8	r5, 0x0
 c6 ba 04              ldi16	r6, 0x4ba
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 ba 04           ldi16	r2, 0x4ba
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ba 04           ldi16	r0, 0x4ba
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
 e1 40 fc              call16	-960 <__avm_run_local_dtors>
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
 d6 f8                 adjsp	-0x8
 f2 39                 sub	r1, r1
 c1 f0                 ldi8	r5, 0xf0
 c4 60 f0              ldi16	r4, 0xf060
 c7 40 01              ldi16	r7, 0x140
 c6 80 01              ldi16	r6, 0x180
 f0 06 00 01           ldi16	r2, 0x100
 f0 07 20 01           ldi16	r3, 0x120
 f1 01                 mov	r0, r1
<L0>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 59                 stsp16	[sp+0x6], r5
 08                    mov	r6, r4
 f1 21                 mov	r4, r1
 f2 22                 add	r4, r2
 51                    st8	[r4], r5
 f1 21                 mov	r4, r1
 f2 23                 add	r4, r3
 f0 38 02              stsp16	[sp+0x2], r0
 f3 00                 st8	[r4], r0
 f7 5e                 st16	[r7+], r6
 c0 fb                 ldi8	r4, 0xfb
 12                    add	r4, r6
 f1 25                 mov	r5, r1
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f0 06 ec ff           ldi16	r2, 0xffec
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 64                 add32	q1, q0
 f1 0d                 mov	r1, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 6b 4c              st32	[r6], q1
 f0 07 20 01           ldi16	r3, 0x120
 f0 06 00 01           ldi16	r2, 0x100
 ca 04                 addi.s8	r6, 0x4
 f4 ad                 inc16	r5
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 08 05              addi.s8	r0, 0x5
 f4 a9                 inc16	r1
 f0 0d 20              cmpi.s8	r1, 0x20
 d1 b6                 brne8	-0x4a <L0>
 aa                    xor	r6, r6
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 0e                    mov	r7, r6
<L1>:
 f4 43                 stsp16	[sp+0x0], r7
 f0 05 80 01           ldi16	r1, 0x180
 c6 40 01              ldi16	r6, 0x140
 f4 5a                 stsp16	[sp+0x6], r6
 f2 30                 sub	r0, r0
<L2>:
 f1 28                 mov	r6, r0
 f2 2a                 add	r6, r2
 4e                    ld8u	r7, [r6]
 f1 28                 mov	r6, r0
 f2 2b                 add	r6, r3
 f5 3a                 ld8u	r2, [r6]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ed d6 20              ld16	r6, [r3+0]
 f4 52                 stsp16	[sp+0x4], r6
 f0 6c d7              ld16	r6, [r3+]
 f4 4a                 stsp16	[sp+0x2], r6
 f0 3b 06              stsp16	[sp+0x6], r3
 f6 47                 sext8	r7
 0b                    mov	r6, r7
 fa 58                 lsl16i	r6, 0x8
 1b                    add	r6, r7
 fa ef                 asr16i	r7, 0xf
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f7 67                 add32	q1, q3
 f4 08                 ldsp16	r4, [sp+0x2]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f0 07 20 01           ldi16	r3, 0x120
 f0 06 00 01           ldi16	r2, 0x100
 f0 6a c2              ld32	q3, [r1]
 f6 46                 sext8	r6
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 6e                 add32	q3, q2
 f0 6a 82              ld32	q2, [r1]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 f0 09 04              addi.s8	r1, 0x4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 a4                 brne8	-0x5c <L2>
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 d1 8c                 brne8	-0x74 <L1>
 c6 00 02              ldi16	r6, 0x200
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
