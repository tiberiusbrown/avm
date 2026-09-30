
local_static_lifetime.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 local_static_lifetime.cpp
00000112 l     O .data	00000001 guard variable for second()::object
00000114 l     O .data	00000001 guard variable for first()::object
0000010f l     O .data	00000002 initialize_unused
00000116 l     O .data	00000001 guard variable for unused()::object
00000111 l     O .data	00000001 second()::object (.0)
000003a4 l     F .text	0000000f __dtor__ZZL6secondvE6object
00000100 l     O .data	00000005 __dtor__ZZL6secondvE6object.avm_dtor_slot
00000113 l     O .data	00000001 first()::object (.0)
000003b3 l     F .text	0000000f __dtor__ZZL5firstvE6object
00000105 l     O .data	00000005 __dtor__ZZL5firstvE6object.avm_dtor_slot
00000115 l     O .data	00000001 unused()::object (.0)
000003c2 l     F .text	0000000f __dtor__ZZL6unusedvE6object
0000010a l     O .data	00000005 __dtor__ZZL6unusedvE6object.avm_dtor_slot
00000000 l    df *ABS*	00000000 local_dtor.c
00000117 l     O .data	00000002 next_slot
00000119 l     O .data	00000002 global_phase
00000000 l    df *ABS*	00000000 runtime.c
0000041e l       .init_array	00000000 .hidden __init_array_end
0000041e l       .init_array	00000000 .hidden __init_array_start
0000041e l       .fini_array	00000000 .hidden __fini_array_start
0000041e l       .fini_array	00000000 .hidden __fini_array_end
0000010f l       *ABS*	00000000 .hidden __avm_local_dtor_slots_end
00000100 l       *ABS*	00000000 .hidden __avm_local_dtor_slots_start
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000000cd avm_test_main
0000041c g     F .text	00000002 avm_halt
000003ef g     F .text	0000002d __avm_run_local_dtors
000003d1 g     F .text	0000001e __avm_register_local_dtor

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 fe 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 1e 04              ldi16	r4, 0x41e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 1e 04              ldi16	r6, 0x41e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 1e 04           ldi16	r0, 0x41e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 1e 04           ldi16	r2, 0x41e
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
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
 c4 ef 03              ldi16	r4, 0x3ef
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 70 01              call16	__avm_run_local_dtors
 c4 1e 04              ldi16	r4, 0x41e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 1e 04              ldi16	r6, 0x41e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 1e 04           ldi16	r2, 0x41e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 1e 04           ldi16	r0, 0x41e
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 ef 03              ldi16	r4, 0x3ef
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 1f 01              call16	__avm_run_local_dtors
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b0                    push16	r0
 f0 44 12 01           ldm8u	r4, [0x112]
 f4 a4                 tst8	r4
 d0 30                 breq8	avm_test_main+57
 f0 44 14 01           ldm8u	r4, [0x114]
 f4 a4                 tst8	r4
 d0 46                 breq8	avm_test_main+87
 f0 54 0f 01           ldm16	r4, [0x10f]
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+34
 f0 44 16 01           ldm8u	r4, [0x116]
 f4 a4                 tst8	r4
 da 8d 00              breq16	avm_test_main+175
 f0 44 12 01           ldm8u	r4, [0x112]
 f4 a4                 tst8	r4
 d0 4b                 breq8	avm_test_main+117
 f0 44 14 01           ldm8u	r4, [0x114]
 f4 a4                 tst8	r4
 d0 60                 breq8	avm_test_main+146
 c0 4d                 ldi8	r4, 0x4d
 d7 00                 sys	debug_putc
 a0                    xor	r4, r4
 b8                    pop16	r0
 ef                    ret
 f0 00 01              ldi8	r0, 0x1
 f0 48 11 01           stm8	[0x111], r0
 c0 42                 ldi8	r4, 0x42
 d7 00                 sys	debug_putc
 c4 a4 03              ldi16	r4, 0x3a4
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 00 01              ldi16	r6, 0x100
 e1 a9 00              call16	__avm_register_local_dtor
 f0 48 12 01           stm8	[0x112], r0
 d4 b2                 jmp8	avm_test_main+9
 f0 00 01              ldi8	r0, 0x1
 f0 48 13 01           stm8	[0x113], r0
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c4 b3 03              ldi16	r4, 0x3b3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 05 01              ldi16	r6, 0x105
 e1 8b 00              call16	__avm_register_local_dtor
 f0 48 14 01           stm8	[0x114], r0
 d4 9c                 jmp8	avm_test_main+17
 f0 00 01              ldi8	r0, 0x1
 f0 48 11 01           stm8	[0x111], r0
 c0 42                 ldi8	r4, 0x42
 d7 00                 sys	debug_putc
 c4 a4 03              ldi16	r4, 0x3a4
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 00 01              ldi16	r6, 0x100
 d5 6e                 call8	__avm_register_local_dtor
 f0 48 12 01           stm8	[0x112], r0
 d4 98                 jmp8	avm_test_main+42
 f0 00 01              ldi8	r0, 0x1
 f0 48 13 01           stm8	[0x113], r0
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c4 b3 03              ldi16	r4, 0x3b3
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 05 01              ldi16	r6, 0x105
 d5 51                 call8	__avm_register_local_dtor
 f0 48 14 01           stm8	[0x114], r0
 d4 83                 jmp8	avm_test_main+50
 f0 00 01              ldi8	r0, 0x1
 f0 48 15 01           stm8	[0x115], r0
 c0 55                 ldi8	r4, 0x55
 d7 00                 sys	debug_putc
 c4 c2 03              ldi16	r4, 0x3c2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 0a 01              ldi16	r6, 0x10a
 d5 34                 call8	__avm_register_local_dtor
 f0 48 16 01           stm8	[0x116], r0
 e0 55 ff              jmp16	avm_test_main+34

<__dtor__ZZL6secondvE6object>:
 f0 44 11 01           ldm8u	r4, [0x111]
 a5                    xor	r5, r5
 c2 62                 ldi8	r6, 0x62
 f4 a4                 tst8	r4
 01                    mov	r4, r5
 fb 66                 cmov.ne	r4, r6
 d7 00                 sys	debug_putc
 ef                    ret

<__dtor__ZZL5firstvE6object>:
 f0 44 13 01           ldm8u	r4, [0x113]
 a5                    xor	r5, r5
 c2 61                 ldi8	r6, 0x61
 f4 a4                 tst8	r4
 01                    mov	r4, r5
 fb 66                 cmov.ne	r4, r6
 d7 00                 sys	debug_putc
 ef                    ret

<__dtor__ZZL6unusedvE6object>:
 f0 44 15 01           ldm8u	r4, [0x115]
 a5                    xor	r5, r5
 c2 75                 ldi8	r6, 0x75
 f4 a4                 tst8	r4
 01                    mov	r4, r5
 fb 66                 cmov.ne	r4, r6
 d7 00                 sys	debug_putc
 ef                    ret

<__avm_register_local_dtor>:
 f0 56 17 01           ldm16	r6, [0x117]
 c7 0f 01              ldi16	r7, 0x10f
 3b                    cmp	r6, r7
 d0 12                 breq8	__avm_register_local_dtor+28
 0e                    mov	r7, r6
 f7 5c                 st16	[r7+], r4
 5d                    st8	[r7], r5
 f0 54 19 01           ldm16	r4, [0x119]
 ee 9c 23              st16	[r6+3], r4
 ca 05                 addi.s8	r6, 0x5
 f0 5e 17 01           stm16	[0x117], r6
 ef                    ret
 d5 2d                 call8	avm_halt

<__avm_run_local_dtors>:
 b0                    push16	r0
 f0 54 17 01           ldm16	r4, [0x117]
 c5 00 01              ldi16	r5, 0x100
 31                    cmp	r4, r5
 d0 20                 breq8	__avm_run_local_dtors+43
 f0 04 00 01           ldi16	r0, 0x100
 ed b8 1e              ld16	r5, [r4-2]
 f0 56 19 01           ldm16	r6, [0x119]
 36                    cmp	r5, r6
 d1 12                 brne8	__avm_run_local_dtors+43
 c8 fb                 addi.s8	r4, -0x5
 f0 5c 17 01           stm16	[0x117], r4
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 eb                    callp	q3
 f0 54 17 01           ldm16	r4, [0x117]
 f5 20                 cmp	r4, r0
 d1 e4                 brne8	__avm_run_local_dtors+15
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
