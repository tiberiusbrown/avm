
float_comparisons.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 float_comparisons.c
00000100 l     O .data	00000002 float_comparisons_result
00000102 l     O .data	00000040 first
00000142 l     O .data	00000040 second
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
000003bf l       .init_array	00000000 .hidden __init_array_end
000003bf l       .init_array	00000000 .hidden __init_array_start
000003bf l       .fini_array	00000000 .hidden __fini_array_start
000003bf l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000f1 avm_test_main
0000035a g     F .text	00000065 __avm_terminate
00000358 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 44 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 35 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 bf 03              ldi16	r4, 0x3bf
 c1 00                 ldi8	r5, 0x0
 c6 bf 03              ldi16	r6, 0x3bf
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 bf 03           ldi16	r0, 0x3bf
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 bf 03           ldi16	r2, 0x3bf
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

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c4 fa ff              ldi16	r4, 0xfffa
 f4 78                 stsp16	[sp+0xe], r4
 f2 42                 sub	r2, r2
 f0 04 f8 ff           ldi16	r0, 0xfff8
 c4 02 01              ldi16	r4, 0x102
 f4 70                 stsp16	[sp+0xc], r4
 c4 42 01              ldi16	r4, 0x142
 aa                    xor	r6, r6
 c7 c0 3e              ldi16	r7, 0x3ec0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
<L0>:
 f4 68                 stsp16	[sp+0xa], r4
 f1 20                 mov	r4, r0
 ff 0c                 s16tof
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 02                 fmul
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f0 6b 82              st32	[r1], q2
 c1 0d                 ldi8	r5, 0xd
 f1 22                 mov	r4, r2
 ec 65                 urem16	r4, r5
 f2 52                 sub	r4, r2
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 23                 add	r4, r3
 ff 0c                 s16tof
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f4 2a                 ldsp16	r6, [sp+0xa]
 f0 6b 8c              st32	[r6], q2
 02                    mov	r4, r6
 c8 04                 addi.s8	r4, 0x4
 f0 09 04              addi.s8	r1, 0x4
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 0a 07              addi.s8	r2, 0x7
 f0 0b 07              addi.s8	r3, 0x7
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 a8                 inc16	r0
 f0 0c 08              cmpi.s8	r0, 0x8
 d1 bb                 brne8	-0x45 <L0>
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 08                    mov	r6, r4
 04                    mov	r5, r4
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 c4 42 01              ldi16	r4, 0x142
 04                    mov	r5, r4
 c4 02 01              ldi16	r4, 0x102
 0c                    mov	r7, r4
 a0                    xor	r4, r4
 f4 78                 stsp16	[sp+0xe], r4
<L2>:
 f4 5a                 stsp16	[sp+0x6], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 71                 stsp16	[sp+0xc], r5
 f0 6a 4e              ld32	q1, [r7]
 f0 6a 0a              ld32	q0, [r5]
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 f4 4a                 stsp16	[sp+0x2], r6
 ce 01                 cmpi.s8	r6, 0x1
 f2 68                 mov32	q2, q0
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 c0 07                 ldi8	r4, 0x7
 f4 39                 ldsp16	r5, [sp+0xe]
 81                    and	r4, r5
 ce 02                 cmpi.s8	r6, 0x2
 f8 15                 cset.ult	r5
 fa 04                 shl16v	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 cc ff                 cmpi.s8	r4, -0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 f8 0a                 cset.ne	r2
 f2 14                 add	r2, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ce ff                 cmpi.s8	r6, -0x1
 f8 06                 cset.eq	r6
 f2 2a                 add	r6, r2
 f4 10                 ldsp16	r4, [sp+0x4]
 a8                    xor	r6, r4
 c9 04                 addi.s8	r5, 0x4
 cb 04                 addi.s8	r7, 0x4
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 ac                 inc16	r4
 f4 78                 stsp16	[sp+0xe], r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 9d                 brne8	-0x63 <L2>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 18                 cmpi.s8	r5, 0x18
 d1 88                 brne8	-0x78 <L1>
 f0 5e 00 01           stm16	[0x100], r6
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

<__avm_terminate>:
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
 e1 91 fc              call16	-879 <__avm_run_local_dtors>
<L0>:
 c4 bf 03              ldi16	r4, 0x3bf
 c1 00                 ldi8	r5, 0x0
 c6 bf 03              ldi16	r6, 0x3bf
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 bf 03           ldi16	r2, 0x3bf
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 bf 03           ldi16	r0, 0x3bf
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
 e1 48 fc              call16	-952 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
