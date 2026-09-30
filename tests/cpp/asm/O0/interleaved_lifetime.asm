
interleaved_lifetime.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 interleaved_lifetime.cpp
000002d7 l     F .text	0000001a __cxx_global_var_init
0000010f l     O .data	00000001 first
000003a1 l     F .text	00000027 activate_early()
000003c8 l     F .text	0000000b avm_debug_putc(unsigned char)
0000030e l     F .text	0000001a __dtor__ZL5first
00000328 l     F .text	0000001a __cxx_global_var_init.1
00000110 l     O .data	00000001 second
000003f9 l     F .text	00000027 activate_middle()
0000035b l     F .text	0000001a __dtor__ZL6second
00000379 l     F .text	00000028 activate_late()
00000116 l     O .data	00000001 guard variable for activate_late()::object
00000115 l     O .data	00000001 activate_late()::object
00000425 l     F .text	00000005 __dtor__ZZL13activate_latevE6object
0000010a l     O .data	00000005 __dtor__ZZL13activate_latevE6object.avm_dtor_slot
00000112 l     O .data	00000001 guard variable for activate_early()::object
00000111 l     O .data	00000001 activate_early()::object
000003f4 l     F .text	00000005 __dtor__ZZL14activate_earlyvE6object
00000100 l     O .data	00000005 __dtor__ZZL14activate_earlyvE6object.avm_dtor_slot
00000114 l     O .data	00000001 guard variable for activate_middle()::object
00000113 l     O .data	00000001 activate_middle()::object
00000420 l     F .text	00000005 __dtor__ZZL15activate_middlevE6object
00000105 l     O .data	00000005 __dtor__ZZL15activate_middlevE6object.avm_dtor_slot
0000042a l     F .text	00000006 _GLOBAL__sub_I_interleaved_lifetime.cpp
00000000 l    df *ABS*	00000000 local_dtor.c
00000117 l     O .data	00000002 next_slot
00000119 l     O .data	00000002 global_phase
00000000 l    df *ABS*	00000000 runtime.c
000004c6 l       .init_array	00000000 .hidden __init_array_end
000004c3 l       .init_array	00000000 .hidden __init_array_start
000004c6 l       .fini_array	00000000 .hidden __fini_array_start
000004cc l       .fini_array	00000000 .hidden __fini_array_end
0000010f l       *ABS*	00000000 .hidden __avm_local_dtor_slots_end
00000100 l       *ABS*	00000000 .hidden __avm_local_dtor_slots_start
00000200 g     F .text	0000001e _start
00000375 g     F .text	00000004 avm_test_main
000004c1 g     F .text	00000002 avm_halt
00000459 g     F .text	0000002d __avm_run_local_dtors
000002f2  w    F .text	0000000f first_global::first_global()
0000044e g     F .text	0000000b __avm_note_global_ctor
00000302  w    F .text	0000000c first_global::~first_global()
00000486 g     F .text	0000003b __avm_before_global_dtor
00000342  w    F .text	0000000e second_global::second_global()
00000350  w    F .text	0000000b second_global::~second_global()
000003d4  w    F .text	00000014 local_object::local_object(char, char)
00000430 g     F .text	0000001e __avm_register_local_dtor
000003e8  w    F .text	0000000c local_object::~local_object()

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 6f 01              call16	avm_test_main
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
 e1 a3 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 c6 04              ldi16	r4, 0x4c6
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 c3 04              ldi16	r6, 0x4c3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 c3 04           ldi16	r0, 0x4c3
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 c6 04           ldi16	r2, 0x4c6
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
 c4 59 04              ldi16	r4, 0x459
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 da 01              call16	__avm_run_local_dtors
 c4 c6 04              ldi16	r4, 0x4c6
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cc 04              ldi16	r6, 0x4cc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 cc 04           ldi16	r2, 0x4cc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 c6 04           ldi16	r0, 0x4c6
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
 c4 59 04              ldi16	r4, 0x459
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 89 01              call16	__avm_run_local_dtors
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__cxx_global_var_init>:
 c4 0f 01              ldi16	r4, 0x10f
 d5 16                 call8	_ZN12first_globalC2Ev
 c4 4e 04              ldi16	r4, 0x44e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 06                 breq8	__cxx_global_var_init+25
 d4 00                 jmp8	__cxx_global_var_init+21
 e1 5f 01              call16	__avm_note_global_ctor
 ef                    ret
 ef                    ret
 00                    nop

<first_global::first_global()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 e1 a8 00              call16	_ZL14activate_earlyv
 c0 41                 ldi8	r4, 0x41
 e1 ca 00              call16	_ZL14avm_debug_putch
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<first_global::~first_global()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 61                 ldi8	r4, 0x61
 e1 bd 00              call16	_ZL14avm_debug_putch
 d6 02                 adjsp	0x2
 ef                    ret

<__dtor__ZL5first>:
 c4 86 04              ldi16	r4, 0x486
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 07                 breq8	__dtor__ZL5first+21
 d4 00                 jmp8	__dtor__ZL5first+16
 e1 65 01              call16	__avm_before_global_dtor
 d4 00                 jmp8	__dtor__ZL5first+21
 c4 0f 01              ldi16	r4, 0x10f
 d4 da                 jmp8	_ZN12first_globalD2Ev

<__cxx_global_var_init.1>:
 c4 10 01              ldi16	r4, 0x110
 d5 15                 call8	_ZN13second_globalC2Ev
 c4 4e 04              ldi16	r4, 0x44e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 06                 breq8	__cxx_global_var_init.1+25
 d4 00                 jmp8	__cxx_global_var_init.1+21
 e1 0e 01              call16	__avm_note_global_ctor
 ef                    ret
 ef                    ret

<second_global::second_global()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 e1 b0 00              call16	_ZL15activate_middlev
 c0 42                 ldi8	r4, 0x42
 d5 7b                 call8	_ZL14avm_debug_putch
 d6 02                 adjsp	0x2
 ef                    ret

<second_global::~second_global()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 62                 ldi8	r4, 0x62
 d5 70                 call8	_ZL14avm_debug_putch
 d6 02                 adjsp	0x2
 ef                    ret

<__dtor__ZL6second>:
 c4 86 04              ldi16	r4, 0x486
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 07                 breq8	__dtor__ZL6second+21
 d4 00                 jmp8	__dtor__ZL6second+16
 e1 18 01              call16	__avm_before_global_dtor
 d4 00                 jmp8	__dtor__ZL6second+21
 c4 10 01              ldi16	r4, 0x110
 d4 db                 jmp8	_ZN13second_globalD2Ev

<avm_test_main>:
 d5 02                 call8	_ZL13activate_latev
 a0                    xor	r4, r4
 ef                    ret

<activate_late()>:
 f0 44 16 01           ldm8u	r4, [0x116]
 f4 a4                 tst8	r4
 d1 1f                 brne8	_ZL13activate_latev+39
 d4 00                 jmp8	_ZL13activate_latev+10
 c4 15 01              ldi16	r4, 0x115
 c1 74                 ldi8	r5, 0x74
 c2 54                 ldi8	r6, 0x54
 d5 48                 call8	_ZN12local_objectC2Ecc
 c4 25 04              ldi16	r4, 0x425
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 0a 01              ldi16	r6, 0x10a
 e1 97 00              call16	__avm_register_local_dtor
 c0 01                 ldi8	r4, 0x1
 f0 4c 16 01           stm8	[0x116], r4
 ef                    ret
 ef                    ret

<activate_early()>:
 f0 44 12 01           ldm8u	r4, [0x112]
 f4 a4                 tst8	r4
 d1 1e                 brne8	_ZL14activate_earlyv+38
 d4 00                 jmp8	_ZL14activate_earlyv+10
 c4 11 01              ldi16	r4, 0x111
 c1 73                 ldi8	r5, 0x73
 c2 53                 ldi8	r6, 0x53
 d5 20                 call8	_ZN12local_objectC2Ecc
 c4 f4 03              ldi16	r4, 0x3f4
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 00 01              ldi16	r6, 0x100
 d5 70                 call8	__avm_register_local_dtor
 c0 01                 ldi8	r4, 0x1
 f0 4c 12 01           stm8	[0x112], r4
 ef                    ret
 ef                    ret

<avm_debug_putc(unsigned char)>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 d6 01                 adjsp	0x1
 ef                    ret
 00                    nop

<local_object::local_object(char, char)>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f1 35                 stsp8	[sp+0x1], r5
 f1 32                 stsp8	[sp+0x0], r6
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 41                 ldsp8u	r5, [sp+0x0]
 51                    st8	[r4], r5
 f3 44                 ldsp8u	r4, [sp+0x1]
 d5 e3                 call8	_ZL14avm_debug_putch
 d6 04                 adjsp	0x4
 ef                    ret

<local_object::~local_object()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 40                    ld8u	r4, [r4]
 d5 d7                 call8	_ZL14avm_debug_putch
 d6 02                 adjsp	0x2
 ef                    ret

<__dtor__ZZL14activate_earlyvE6object>:
 c4 11 01              ldi16	r4, 0x111
 d4 ef                 jmp8	_ZN12local_objectD2Ev

<activate_middle()>:
 f0 44 14 01           ldm8u	r4, [0x114]
 f4 a4                 tst8	r4
 d1 1e                 brne8	_ZL15activate_middlev+38
 d4 00                 jmp8	_ZL15activate_middlev+10
 c4 13 01              ldi16	r4, 0x113
 c1 6d                 ldi8	r5, 0x6d
 c2 4d                 ldi8	r6, 0x4d
 d5 c8                 call8	_ZN12local_objectC2Ecc
 c4 20 04              ldi16	r4, 0x420
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 05 01              ldi16	r6, 0x105
 d5 18                 call8	__avm_register_local_dtor
 c0 01                 ldi8	r4, 0x1
 f0 4c 14 01           stm8	[0x114], r4
 ef                    ret
 ef                    ret

<__dtor__ZZL15activate_middlevE6object>:
 c4 13 01              ldi16	r4, 0x113
 d4 c3                 jmp8	_ZN12local_objectD2Ev

<__dtor__ZZL13activate_latevE6object>:
 c4 15 01              ldi16	r4, 0x115
 d4 be                 jmp8	_ZN12local_objectD2Ev

<_GLOBAL__sub_I_interleaved_lifetime.cpp>:
 e1 aa fe              call16	__cxx_global_var_init
 e0 f8 fe              jmp16	__cxx_global_var_init.1

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
 d5 73                 call8	avm_halt

<__avm_note_global_ctor>:
 f0 54 19 01           ldm16	r4, [0x119]
 f4 ac                 inc16	r4
 f0 5c 19 01           stm16	[0x119], r4
 ef                    ret

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

<__avm_before_global_dtor>:
 b0                    push16	r0
 f0 54 17 01           ldm16	r4, [0x117]
 c5 00 01              ldi16	r5, 0x100
 31                    cmp	r4, r5
 d0 20                 breq8	__avm_before_global_dtor+43
 f0 04 00 01           ldi16	r0, 0x100
 ed d8 1e              ld16	r6, [r4-2]
 f0 55 19 01           ldm16	r5, [0x119]
 39                    cmp	r6, r5
 d1 16                 brne8	__avm_before_global_dtor+47
 c8 fb                 addi.s8	r4, -0x5
 f0 5c 17 01           stm16	[0x117], r4
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 eb                    callp	q3
 f0 54 17 01           ldm16	r4, [0x117]
 f5 20                 cmp	r4, r0
 d1 e4                 brne8	__avm_before_global_dtor+15
 f0 55 19 01           ldm16	r5, [0x119]
 f6 2d                 tst16	r5
 d0 06                 breq8	__avm_before_global_dtor+57
 f4 b5                 dec16	r5
 f0 5d 19 01           stm16	[0x119], r5
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
