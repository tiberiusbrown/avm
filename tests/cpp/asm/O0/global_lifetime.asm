
global_lifetime.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 global_lifetime.cpp
000002d7 l     F .text	0000000a early_constructor()
00000100 l     O .data	00000002 stage
000002e1 l     F .text	0000000b avm_debug_putc(unsigned char)
000002ec l     F .text	0000000e late_destructor()
000002fa l     F .text	0000001a __cxx_global_var_init
00000102 l     O .data	00000001 second
0000034b l     F .text	0000001a __dtor__ZL6second
00000365 l     F .text	0000001a __cxx_global_var_init.1
00000103 l     O .data	00000001 object
000003ba l     F .text	0000001a __dtor__ZL6object
000003f0 l     F .text	00000003 _GLOBAL__I_000200
000003f3 l     F .text	00000003 _GLOBAL__I_000300
000003f6 l     F .text	00000001 _GLOBAL__sub_I_global_lifetime.cpp
00000000 l    df *ABS*	00000000 runtime.c
00000405 l       .init_array	00000000 .hidden __init_array_end
000003f9 l       .init_array	00000000 .hidden __init_array_start
00000405 l       .fini_array	00000000 .hidden __fini_array_start
0000040e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000003d4 g     F .text	0000001c avm_test_main
000003f7 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000314  w    F .text	0000001c second_object::second_object()
00000000  w      *UND*	00000000 __avm_note_global_ctor
00000330  w    F .text	0000001b second_object::~second_object()
00000000  w      *UND*	00000000 __avm_before_global_dtor
00000380  w    F .text	0000001d global_object::global_object()
0000039e  w    F .text	0000001c global_object::~global_object()

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 ce 01              call16	avm_test_main
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
 e1 d9 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 05 04              ldi16	r4, 0x405
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f9 03              ldi16	r6, 0x3f9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 f9 03           ldi16	r0, 0x3f9
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 05 04           ldi16	r2, 0x405
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
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 05 04              ldi16	r4, 0x405
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 0e 04              ldi16	r6, 0x40e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 0e 04           ldi16	r2, 0x40e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 05 04           ldi16	r0, 0x405
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
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<early_constructor()>:
 c0 01                 ldi8	r4, 0x1
 f0 5c 00 01           stm16	[0x100], r4
 c0 41                 ldi8	r4, 0x41
 d4 00                 jmp8	_ZL14avm_debug_putch

<avm_debug_putc(unsigned char)>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 d6 01                 adjsp	0x1
 ef                    ret

<late_destructor()>:
 f0 56 00 01           ldm16	r6, [0x100]
 c0 58                 ldi8	r4, 0x58
 c1 5a                 ldi8	r5, 0x5a
 ce 05                 cmpi.s8	r6, 0x5
 fb 25                 cmov.eq	r4, r5
 d4 e7                 jmp8	_ZL14avm_debug_putch

<__cxx_global_var_init>:
 c4 02 01              ldi16	r4, 0x102
 d5 15                 call8	_ZN13second_objectC2Ev
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 06                 breq8	__cxx_global_var_init+25
 d4 00                 jmp8	__cxx_global_var_init+21
 e1 ee fc              call16	-786
 ef                    ret
 ef                    ret

<second_object::second_object()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f0 56 00 01           ldm16	r6, [0x100]
 c4 ff ff              ldi16	r4, 0xffff
 c1 03                 ldi8	r5, 0x3
 ce 02                 cmpi.s8	r6, 0x2
 fb 25                 cmov.eq	r4, r5
 f0 5c 00 01           stm16	[0x100], r4
 c0 42                 ldi8	r4, 0x42
 d5 b4                 call8	_ZL14avm_debug_putch
 d6 02                 adjsp	0x2
 ef                    ret

<second_object::~second_object()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f0 56 00 01           ldm16	r6, [0x100]
 c0 58                 ldi8	r4, 0x58
 c1 45                 ldi8	r5, 0x45
 ce 03                 cmpi.s8	r6, 0x3
 fb 25                 cmov.eq	r4, r5
 d5 9f                 call8	_ZL14avm_debug_putch
 c0 04                 ldi8	r4, 0x4
 f0 5c 00 01           stm16	[0x100], r4
 d6 02                 adjsp	0x2
 ef                    ret

<__dtor__ZL6second>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 07                 breq8	__dtor__ZL6second+21
 d4 00                 jmp8	__dtor__ZL6second+16
 e1 a2 fc              call16	-862
 d4 00                 jmp8	__dtor__ZL6second+21
 c4 02 01              ldi16	r4, 0x102
 d4 cb                 jmp8	_ZN13second_objectD2Ev

<__cxx_global_var_init.1>:
 c4 03 01              ldi16	r4, 0x103
 d5 16                 call8	_ZN13global_objectC2Ev
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 06                 breq8	__cxx_global_var_init.1+25
 d4 00                 jmp8	__cxx_global_var_init.1+21
 e1 83 fc              call16	-893
 ef                    ret
 ef                    ret
 00                    nop

<global_object::global_object()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f0 56 00 01           ldm16	r6, [0x100]
 c4 ff ff              ldi16	r4, 0xffff
 c1 02                 ldi8	r5, 0x2
 ce 01                 cmpi.s8	r6, 0x1
 fb 25                 cmov.eq	r4, r5
 f0 5c 00 01           stm16	[0x100], r4
 c0 43                 ldi8	r4, 0x43
 e1 47 ff              call16	_ZL14avm_debug_putch
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<global_object::~global_object()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f0 56 00 01           ldm16	r6, [0x100]
 c0 58                 ldi8	r4, 0x58
 c1 44                 ldi8	r5, 0x44
 ce 04                 cmpi.s8	r6, 0x4
 fb 25                 cmov.eq	r4, r5
 e1 30 ff              call16	_ZL14avm_debug_putch
 c0 05                 ldi8	r4, 0x5
 f0 5c 00 01           stm16	[0x100], r4
 d6 02                 adjsp	0x2
 ef                    ret

<__dtor__ZL6object>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 07                 breq8	__dtor__ZL6object+21
 d4 00                 jmp8	__dtor__ZL6object+16
 e1 33 fc              call16	-973
 d4 00                 jmp8	__dtor__ZL6object+21
 c4 03 01              ldi16	r4, 0x103
 d4 ca                 jmp8	_ZN13global_objectD2Ev

<avm_test_main>:
 d6 fe                 adjsp	-0x2
 f0 54 00 01           ldm16	r4, [0x100]
 cc 03                 cmpi.s8	r4, 0x3
 d0 08                 breq8	avm_test_main+18
 d4 00                 jmp8	avm_test_main+12
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 05                 jmp8	avm_test_main+23
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	avm_test_main+23
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 02                 adjsp	0x2
 ef                    ret

<_GLOBAL__I_000200>:
 e0 72 ff              jmp16	__cxx_global_var_init.1

<_GLOBAL__I_000300>:
 e0 04 ff              jmp16	__cxx_global_var_init

<_GLOBAL__sub_I_global_lifetime.cpp>:
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
