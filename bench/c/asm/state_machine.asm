
state_machine.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 state_machine.c
00000100 l     O .data	00000002 state_machine_result
00000102 l     O .data	00000080 input
00000000 l    df *ABS*	00000000 runtime.c
00000396 l       .init_array	00000000 .hidden __init_array_end
00000396 l       .init_array	00000000 .hidden __init_array_start
00000396 l       .fini_array	00000000 .hidden __fini_array_start
00000396 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000cd avm_test_main
00000394 g     F .text	00000002 avm_halt
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
 e1 76 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 96 03              ldi16	r4, 0x396
 c1 00                 ldi8	r5, 0x0
 c6 96 03              ldi16	r6, 0x396
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 96 03           ldi16	r0, 0x396
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 96 03           ldi16	r2, 0x396
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
 c4 96 03              ldi16	r4, 0x396
 c1 00                 ldi8	r5, 0x0
 c6 96 03              ldi16	r6, 0x396
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 96 03           ldi16	r2, 0x396
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 96 03           ldi16	r0, 0x396
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
 d6 fc                 adjsp	-0x4
 c0 80                 ldi8	r4, 0x80
 c1 0b                 ldi8	r5, 0xb
 c6 02 01              ldi16	r6, 0x102
<L0>:
 f6 15                 st8	[r6+], r5
 c9 25                 addi.s8	r5, 0x25
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	-0xa <L0>
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 c0 80                 ldi8	r4, 0x80
 f4 40                 stsp16	[sp+0x0], r4
 f1 17                 mov	r2, r7
 03                    mov	r4, r7
 f0 01 03              ldi8	r1, 0x3
 d4 08                 jmp8	0x8 <L2>
<L1>:
 f4 aa                 inc16	r2
 f0 0e 40              cmpi.s8	r2, 0x40
 da 8e 00              breq16	0x8e <L8>
<L2>:
 f0 07 02 01           ldi16	r3, 0x102
 f4 01                 ldsp16	r5, [sp+0x0]
 d4 13                 jmp8	0x13 <L4>
<L3>:
 0e                    mov	r7, r6
 fa a5                 lsr16i	r7, 0x5
 c0 03                 ldi8	r4, 0x3
 83                    and	r4, r7
 c3 05                 ldi8	r7, 0x5
 f3 1b                 mulu8.w	r6, r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 1e                    add	r7, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d0 dd                 breq8	-0x23 <L1>
<L4>:
 f0 6c c7              ld8u	r6, [r3+]
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d9 20                 brsge8	0x20 <L5>
 f4 a4                 tst8	r4
 d0 3c                 breq8	0x3c <L6>
 f4 4b                 stsp16	[sp+0x2], r7
 cc 01                 cmpi.s8	r4, 0x1
 d1 da                 brne8	-0x26 <L3>
 f0 00 a0              ldi8	r0, 0xa0
 a0                    xor	r4, r4
 f5 06                 cmp	r0, r6
 fc 21                 cmov.ult	r4, r1
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 0b                 ldsp16	r7, [sp+0x2]
 ae                    xor	r7, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 d9                 brne8	-0x27 <L4>
 d4 b4                 jmp8	-0x4c <L1>
<L5>:
 f4 4b                 stsp16	[sp+0x2], r7
 cc 02                 cmpi.s8	r4, 0x2
 d0 2c                 breq8	0x2c <L7>
 cc 03                 cmpi.s8	r4, 0x3
 d1 ba                 brne8	-0x46 <L3>
 c0 04                 ldi8	r4, 0x4
 af                    xor	r7, r7
 f4 a6                 tst8	r6
 fb 27                 cmov.eq	r4, r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 fa 9f                 lsr16i	r6, 0xf
 1f                    add	r7, r7
 9e                    or	r7, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 b9                 brne8	-0x47 <L4>
 d4 94                 jmp8	-0x6c <L1>
<L6>:
 1e                    add	r7, r6
 f0 00 01              ldi8	r0, 0x1
 f9 18                 and	r0, r6
 c0 02                 ldi8	r4, 0x2
 f2 50                 sub	r4, r0
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 a7                 brne8	-0x59 <L4>
 d4 82                 jmp8	-0x7e <L1>
<L7>:
 c3 30                 ldi8	r7, 0x30
 8e                    and	r7, r6
 c0 01                 ldi8	r4, 0x1
 f0 00 04              ldi8	r0, 0x4
 cf 30                 cmpi.s8	r7, 0x30
 fb 20                 cmov.eq	r4, r0
 f4 0b                 ldsp16	r7, [sp+0x2]
 2e                    sub	r7, r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 90                 brne8	-0x70 <L4>
 e0 6a ff              jmp16	-150 <L1>
<L8>:
 f1 74                 zext8	r4
 ac                    xor	r7, r4
 f0 5f 00 01           stm16	[0x100], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
