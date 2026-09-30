
separate_compilation.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 separate_compilation.cpp
0000034e l     F .text	00000038 call_method(SeparateBase*, int (SeparateBase::*)(int) const, int)
00000000 l    df *ABS*	00000000 separate_compilation_impl.cpp
00000100 l     O .data	00000002 destructor_count
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 cxxabi.cpp
0000042e l       .init_array	00000000 .hidden __init_array_end
0000042e l       .init_array	00000000 .hidden __init_array_start
0000042e l       .fini_array	00000000 .hidden __fini_array_start
0000042e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000077 avm_test_main
0000040c g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000407 g     F .text	00000005 separate_destructor_count()
000003b6 g     F .text	0000000c SeparateDerived::SeparateDerived(int)
000003fb g     F .text	0000000c separate_method()
000003c8 g     F .text	00000013 SeparateDerived::~SeparateDerived()
00000386 g     F .text	00000004 SeparateBase::value(int) const
0000038a g     F .text	00000013 SeparateBase::~SeparateBase()
00000410 g     O .rodata	0000000f vtable for SeparateBase
0000039e g     F .text	00000017 SeparateBase::~SeparateBase()
0000040e  w    F .text	00000002 operator delete(void*, unsigned int)
000003b6 g     F .text	0000000c SeparateDerived::SeparateDerived(int)
0000041f g     O .rodata	0000000f vtable for SeparateDerived
000003c2 g     F .text	00000005 SeparateDerived::value(int) const
000003c8 g     F .text	00000013 SeparateDerived::~SeparateDerived()
000003dc g     F .text	0000001f SeparateDerived::~SeparateDerived()
0000038a g     F .text	00000013 SeparateBase::~SeparateBase()

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
 e1 ee 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 2e 04              ldi16	r4, 0x42e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 2e 04              ldi16	r6, 0x42e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 2e 04           ldi16	r0, 0x42e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 2e 04           ldi16	r2, 0x42e
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
 c4 2e 04              ldi16	r4, 0x42e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 2e 04              ldi16	r6, 0x42e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 2e 04           ldi16	r2, 0x42e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 2e 04           ldi16	r0, 0x42e
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

<avm_test_main>:
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 e1 2a 01              call16	_Z25separate_destructor_countv
 f6 2c                 tst16	r4
 d0 04                 breq8	avm_test_main+14
 c0 01                 ldi8	r4, 0x1
 d4 65                 jmp8	avm_test_main+115
 f0 10 0f              leasp	r0, 0xf
 c1 11                 ldi8	r5, 0x11
 f1 20                 mov	r4, r0
 e1 c7 00              call16	_ZN15SeparateDerivedC2Ei
 f0 14 0a              leasp	r4, 0xa
 e1 06 01              call16	_Z15separate_methodv
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 73                 ldsp8u	r7, [sp+0xc]
 f4 56                 stsp16	[sp+0x5], r6
 f1 4f                 stsp8	[sp+0x7], r7
 06                    mov	r5, r6
 f1 31                 stsp8	[sp+0x0], r5
 f4 4c                 stsp16	[sp+0x3], r4
 f4 60                 stsp16	[sp+0x8], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 44                 stsp16	[sp+0x1], r4
 f0 15 00              leasp	r5, 0x0
 f1 20                 mov	r4, r0
 d5 3d                 call8	_ZL11call_methodP12SeparateBaseMS_KFiiEi
 cc 16                 cmpi.s8	r4, 0x16
 d1 25                 brne8	avm_test_main+99
 f4 3c                 ldsp16	r4, [sp+0xf]
 f0 1d 11              ldsp8u	r5, [sp+0x11]
 f0 63 c8              ldp24	q3, [q2]
 f0 14 0f              leasp	r4, 0xf
 c1 06                 ldi8	r5, 0x6
 eb                    callp	q3
 cc 17                 cmpi.s8	r4, 0x17
 d1 18                 brne8	avm_test_main+104
 f0 14 0f              leasp	r4, 0xf
 e1 9b 00              call16	_ZN15SeparateDerivedD2Ev
 e1 d7 00              call16	_Z25separate_destructor_countv
 04                    mov	r5, r4
 c0 04                 ldi8	r4, 0x4
 aa                    xor	r6, r6
 cd 02                 cmpi.s8	r5, 0x2
 fb 26                 cmov.eq	r4, r6
 d4 10                 jmp8	avm_test_main+115
 f0 00 02              ldi8	r0, 0x2
 d4 03                 jmp8	avm_test_main+107
 f0 00 03              ldi8	r0, 0x3
 f0 14 0f              leasp	r4, 0xf
 e1 80 00              call16	_ZN15SeparateDerivedD2Ev
 f1 20                 mov	r4, r0
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 ef                    ret

<call_method(SeparateBase*, int (SeparateBase::*)(int) const, int)>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 ed 9a 23              ld16	r4, [r5+3]
 12                    add	r4, r6
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d0 12                 breq8	_ZL11call_methodP12SeparateBaseMS_KFiiEi+48
 04                    mov	r5, r4
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 f7 63                 add32	q0, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 c1 05                 ldi8	r5, 0x5
 eb                    callp	q3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<SeparateBase::value(int) const>:
 01                    mov	r4, r5
 f4 ac                 inc16	r4
 ef                    ret

<SeparateBase::~SeparateBase()>:
 c6 16 04              ldi16	r6, 0x416
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 f0 54 00 01           ldm16	r4, [0x100]
 f4 ac                 inc16	r4
 f0 5c 00 01           stm16	[0x100], r4
 ef                    ret
 00                    nop

<SeparateBase::~SeparateBase()>:
 c6 16 04              ldi16	r6, 0x416
 c3 00                 ldi8	r7, 0x0
 04                    mov	r5, r4
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 f0 55 00 01           ldm16	r5, [0x100]
 f4 ad                 inc16	r5
 f0 5d 00 01           stm16	[0x100], r5
 c1 03                 ldi8	r5, 0x3
 d4 59                 jmp8	_ZdlPvj
 00                    nop

<SeparateDerived::SeparateDerived(int)>:
 ee b8 23              st16	[r4+3], r5
 c6 25 04              ldi16	r6, 0x425
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 ef                    ret

<SeparateDerived::value(int) const>:
 ed 98 23              ld16	r4, [r4+3]
 11                    add	r4, r5
 ef                    ret
 00                    nop

<SeparateDerived::~SeparateDerived()>:
 f0 55 00 01           ldm16	r5, [0x100]
 c6 16 04              ldi16	r6, 0x416
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 c9 02                 addi.s8	r5, 0x2
 f0 5d 00 01           stm16	[0x100], r5
 ef                    ret
 00                    nop

<SeparateDerived::~SeparateDerived()>:
 b1                    push16	r1
 b0                    push16	r0
 f0 55 00 01           ldm16	r5, [0x100]
 f0 04 16 04           ldi16	r0, 0x416
 f0 01 00              ldi8	r1, 0x0
 08                    mov	r6, r4
 f7 50                 st16	[r6+], r0
 f3 09                 st8	[r6], r1
 c9 02                 addi.s8	r5, 0x2
 f0 5d 00 01           stm16	[0x100], r5
 c1 05                 ldi8	r5, 0x5
 d5 16                 call8	_ZdlPvj
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<separate_method()>:
 a5                    xor	r5, r5
 ee b8 23              st16	[r4+3], r5
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 04                    mov	r5, r4
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 ef                    ret

<separate_destructor_count()>:
 f0 54 00 01           ldm16	r4, [0x100]
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<operator delete(void*, unsigned int)>:
 d5 fc                 call8	avm_halt
