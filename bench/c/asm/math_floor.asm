
math_floor.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_floor.c
000003e2 l     O .rodata	00000040 rounding_bits
00000100 l     O .data	00000004 result
00000104 l     O .data	00000080 rounding_inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_floor.c
00000422 l       .init_array	00000000 .hidden __init_array_end
00000422 l       .init_array	00000000 .hidden __init_array_start
00000422 l       .fini_array	00000000 .hidden __fini_array_start
00000422 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000006a avm_test_main
00000331 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000333 g     F .text	000000af floorf

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
 e1 13 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 22 04              ldi16	r4, 0x422
 c1 00                 ldi8	r5, 0x0
 c6 22 04              ldi16	r6, 0x422
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 22 04           ldi16	r0, 0x422
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 22 04           ldi16	r2, 0x422
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
 c4 22 04              ldi16	r4, 0x422
 c1 00                 ldi8	r5, 0x0
 c6 22 04              ldi16	r6, 0x422
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 22 04           ldi16	r2, 0x422
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 22 04           ldi16	r0, 0x422
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
 d6 fe                 adjsp	-0x2
 af                    xor	r7, r7
 c5 08 01              ldi16	r5, 0x108
 c4 00 80              ldi16	r4, 0x8000
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 e2 03           ldi16	r2, 0x3e2
 f0 03 00              ldi8	r3, 0x0
<L0>:
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 03                    mov	r4, r7
 10                    add	r4, r4
 10                    add	r4, r4
 f1 04                 mov	r0, r4
 f1 0e                 mov	r1, r6
 f7 61                 add32	q0, q1
 f0 64 00              ldp32	q0, [q0]
 01                    mov	r4, r5
 c8 fc                 addi.s8	r4, -0x4
 f0 6b 08              st32	[r4], q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f9 31                 or	r1, r4
 f0 6b 0a              st32	[r5], q0
 c9 08                 addi.s8	r5, 0x8
 f4 af                 inc16	r7
 cf 10                 cmpi.s8	r7, 0x10
 d1 dc                 brne8	-0x24 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 07 04 01           ldi16	r3, 0x104
<L1>:
 f1 22                 mov	r4, r2
 f2 23                 add	r4, r3
 f0 6a 88              ld32	q2, [r4]
 d5 1d                 call8	floorf
 ff 02                 fadd	q0, q2
 f0 0a 04              addi.s8	r2, 0x4
 c0 80                 ldi8	r4, 0x80
 f5 14                 cmp	r2, r4
 d1 ec                 brne8	-0x14 <L1>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<floorf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 05                 mov	r0, r5
 c7 ff 7f              ldi16	r7, 0x7fff
 f9 e0                 and	r7, r0
 c6 7f 3f              ldi16	r6, 0x3f7f
 3b                    cmp	r6, r7
 d2 14                 brult8	0x14 <L0>
 9c                    or	r7, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 10                 and	r0, r4
 c4 80 bf              ldi16	r4, 0xbf80
 f6 2f                 tst16	r7
 fb 20                 cmov.eq	r4, r0
 f6 28                 tst16	r0
 fb 20                 cmov.eq	r4, r0
 af                    xor	r7, r7
 d4 7f                 jmp8	0x7f <L4>
<L0>:
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 f4 4a                 stsp16	[sp+0x2], r6
 ca 81                 addi.s8	r6, -0x7f
 f4 52                 stsp16	[sp+0x4], r6
 c6 ff 42              ldi16	r6, 0x42ff
 3b                    cmp	r6, r7
 d2 2a                 brult8	0x2a <L1>
 c3 7f                 ldi8	r7, 0x7f
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 1e                 lsr16v	r7, r6
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 d0 64                 breq8	0x64 <L5>
 c6 80 ff              ldi16	r6, 0xff80
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 43                 stsp16	[sp+0x0], r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 fa 2e                 asr16v	r7, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 01                    mov	r4, r5
 fa bf                 asr16i	r4, 0xf
 82                    and	r4, r6
 f2 20                 add	r4, r0
 07                    mov	r5, r7
 81                    and	r4, r5
 af                    xor	r7, r7
 d4 46                 jmp8	0x46 <L4>
<L1>:
 c6 ff 4a              ldi16	r6, 0x4aff
 3b                    cmp	r6, r7
 d2 28                 brult8	0x28 <L2>
 c6 7a ff              ldi16	r6, 0xff7a
 f4 0b                 ldsp16	r7, [sp+0x2]
 1e                    add	r7, r6
 0b                    mov	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 fa 1e                 lsr16v	r7, r6
 0b                    mov	r6, r7
 88                    and	r6, r4
 f6 2e                 tst16	r6
 d0 30                 breq8	0x30 <L5>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 48              cmp32	q1, q2
 d9 18                 brsge8	0x18 <L3>
 c5 ff ff              ldi16	r5, 0xffff
 ad                    xor	r7, r5
 8c                    and	r7, r4
 f1 20                 mov	r4, r0
 d4 18                 jmp8	0x18 <L4>
<L2>:
 f2 62                 mov32	q0, q2
 ff 00                 fadd	q0, q0
 c2 80                 ldi8	r6, 0x80
 f4 13                 ldsp16	r7, [sp+0x4]
 3e                    cmp	r7, r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d4 0b                 jmp8	0xb <L5>
<L3>:
 9c                    or	r7, r4
 f4 af                 inc16	r7
 f6 2f                 tst16	r7
 f8 04                 cset.eq	r4
 f2 20                 add	r4, r0
<L4>:
 04                    mov	r5, r4
 03                    mov	r4, r7
<L5>:
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
