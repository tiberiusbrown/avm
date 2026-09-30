
state_machine.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 state_machine.c
00000100 l     O .data	00000080 input
00000180 l     O .data	00000002 state_machine_result
00000000 l    df *ABS*	00000000 runtime.c
0000039d l       .init_array	00000000 .hidden __init_array_end
0000039d l       .init_array	00000000 .hidden __init_array_start
0000039d l       .fini_array	00000000 .hidden __fini_array_start
0000039d l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000d4 avm_test_main
0000039b g     F .text	00000002 avm_halt
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
 e1 7d 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 9d 03              ldi16	r4, 0x39d
 c1 00                 ldi8	r5, 0x0
 c6 9d 03              ldi16	r6, 0x39d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 9d 03           ldi16	r0, 0x39d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 9d 03           ldi16	r2, 0x39d
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 9d 03              ldi16	r4, 0x39d
 c1 00                 ldi8	r5, 0x0
 c6 9d 03              ldi16	r6, 0x39d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 9d 03           ldi16	r2, 0x39d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 9d 03           ldi16	r0, 0x39d
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
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
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 25                 addi.s8	r5, 0x25
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+13
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 c0 80                 ldi8	r4, 0x80
 f4 40                 stsp16	[sp+0x0], r4
 f1 26                 mov	r5, r2
 f1 22                 mov	r4, r2
 f0 01 03              ldi8	r1, 0x3
 d4 0b                 jmp8	avm_test_main+51
 f4 aa                 inc16	r2
 f1 2a                 mov	r6, r2
 f1 76                 zext8	r6
 ce 40                 cmpi.s8	r6, 0x40
 da 90 00              breq16	avm_test_main+195
 f0 07 00 01           ldi16	r3, 0x100
 f4 02                 ldsp16	r6, [sp+0x0]
 d4 13                 jmp8	avm_test_main+78
 07                    mov	r5, r7
 fa 85                 lsr16i	r5, 0x5
 c0 03                 ldi8	r4, 0x3
 81                    and	r4, r5
 c1 05                 ldi8	r5, 0x5
 f3 1d                 mulu8.w	r7, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 17                    add	r5, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 da                 breq8	avm_test_main+40
 f0 6c e7              ld8u	r7, [r3+]
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d9 20                 brsge8	avm_test_main+119
 f4 a4                 tst8	r4
 d0 3d                 breq8	avm_test_main+152
 f4 49                 stsp16	[sp+0x2], r5
 cc 01                 cmpi.s8	r4, 0x1
 d1 da                 brne8	avm_test_main+59
 f0 00 a0              ldi8	r0, 0xa0
 a0                    xor	r4, r4
 f5 07                 cmp	r0, r7
 fc 21                 cmov.ult	r4, r1
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f4 09                 ldsp16	r5, [sp+0x2]
 a7                    xor	r5, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 d9                 brne8	avm_test_main+78
 d4 b1                 jmp8	avm_test_main+40
 f4 49                 stsp16	[sp+0x2], r5
 cc 02                 cmpi.s8	r4, 0x2
 d0 2e                 breq8	avm_test_main+171
 cc 03                 cmpi.s8	r4, 0x3
 d1 ba                 brne8	avm_test_main+59
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f4 a7                 tst8	r7
 fb 25                 cmov.eq	r4, r5
 f4 0b                 ldsp16	r7, [sp+0x2]
 07                    mov	r5, r7
 fa 8f                 lsr16i	r5, 0xf
 1f                    add	r7, r7
 9d                    or	r7, r5
 07                    mov	r5, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 b8                 brne8	avm_test_main+78
 d4 90                 jmp8	avm_test_main+40
 17                    add	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f9 1c                 and	r0, r7
 c0 02                 ldi8	r4, 0x2
 f2 50                 sub	r4, r0
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 a6                 brne8	avm_test_main+78
 e0 7d ff              jmp16	avm_test_main+40
 c1 30                 ldi8	r5, 0x30
 87                    and	r5, r7
 c0 01                 ldi8	r4, 0x1
 f0 00 04              ldi8	r0, 0x4
 cd 30                 cmpi.s8	r5, 0x30
 fb 20                 cmov.eq	r4, r0
 f4 09                 ldsp16	r5, [sp+0x2]
 27                    sub	r5, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 8e                 brne8	avm_test_main+78
 e0 65 ff              jmp16	avm_test_main+40
 f1 74                 zext8	r4
 a4                    xor	r5, r4
 f0 5d 80 01           stm16	[0x180], r5
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
