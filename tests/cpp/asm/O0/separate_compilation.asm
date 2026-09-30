
separate_compilation.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 separate_compilation.cpp
0000039b l     F .text	0000007a call_method(SeparateBase*, int (SeparateBase::*)(int) const, int)
00000000 l    df *ABS*	00000000 separate_compilation_impl.cpp
00000100 l     O .data	00000002 destructor_count
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 cxxabi.cpp
0000051e l       .init_array	00000000 .hidden __init_array_end
0000051e l       .init_array	00000000 .hidden __init_array_start
0000051e l       .fini_array	00000000 .hidden __fini_array_start
0000051e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000000c4 avm_test_main
000004fc g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000004f7 g     F .text	00000005 separate_destructor_count()
00000454 g     F .text	0000001f SeparateDerived::SeparateDerived(int)
000004cb g     F .text	0000002c separate_method()
00000498 g     F .text	0000001f SeparateDerived::~SeparateDerived()
00000416 g     F .text	0000000d SeparateBase::value(int) const
00000424 g     F .text	0000001b SeparateBase::~SeparateBase()
00000500 g     O .rodata	0000000f vtable for SeparateBase
00000440 g     F .text	00000014 SeparateBase::~SeparateBase()
00000424 g     F .text	0000001b SeparateBase::~SeparateBase()
000004fe  w    F .text	00000002 operator delete(void*, unsigned int)
00000454 g     F .text	0000001f SeparateDerived::SeparateDerived(int)
00000474  w    F .text	00000011 SeparateBase::SeparateBase()
0000050f g     O .rodata	0000000f vtable for SeparateDerived
00000486 g     F .text	00000011 SeparateDerived::value(int) const
00000498 g     F .text	0000001f SeparateDerived::~SeparateDerived()
000004b8 g     F .text	00000013 SeparateDerived::~SeparateDerived()

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
 e1 de 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 1e 05              ldi16	r4, 0x51e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 1e 05              ldi16	r6, 0x51e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 1e 05           ldi16	r0, 0x51e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 1e 05           ldi16	r2, 0x51e
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
 c4 1e 05              ldi16	r4, 0x51e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 1e 05              ldi16	r6, 0x51e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 1e 05           ldi16	r2, 0x51e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 1e 05           ldi16	r0, 0x51e
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
 d6 e0                 adjsp	-0x20
 e1 1b 02              call16	_Z25separate_destructor_countv
 f6 2c                 tst16	r4
 d0 0a                 breq8	avm_test_main+19
 d4 00                 jmp8	avm_test_main+11
 c0 01                 ldi8	r4, 0x1
 f0 3c 1e              stsp16	[sp+0x1e], r4
 e0 ab 00              jmp16	avm_test_main+190
 f0 14 19              leasp	r4, 0x19
 f4 40                 stsp16	[sp+0x0], r4
 c1 11                 ldi8	r5, 0x11
 e1 60 01              call16	_ZN15SeparateDerivedC2Ei
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 3c 17              stsp16	[sp+0x17], r4
 f0 34 17              ldsp16	r4, [sp+0x17]
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 12              leasp	r4, 0x12
 e1 c7 01              call16	_Z15separate_methodv
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 1f 14              ldsp8u	r7, [sp+0x14]
 f0 35 15              ldsp16	r5, [sp+0x15]
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 76                 stsp16	[sp+0xd], r6
 f1 6f                 stsp8	[sp+0xf], r7
 f0 1d 11              ldsp8u	r5, [sp+0x11]
 f1 51                 stsp8	[sp+0x8], r5
 f0 1d 10              ldsp8u	r5, [sp+0x10]
 f1 4d                 stsp8	[sp+0x7], r5
 f3 7d                 ldsp8u	r5, [sp+0xf]
 f1 49                 stsp8	[sp+0x6], r5
 f3 79                 ldsp8u	r5, [sp+0xe]
 f1 45                 stsp8	[sp+0x5], r5
 f3 75                 ldsp8u	r5, [sp+0xd]
 f1 41                 stsp8	[sp+0x4], r5
 f0 15 04              leasp	r5, 0x4
 c2 05                 ldi8	r6, 0x5
 d5 68                 call8	_ZL11call_methodP12SeparateBaseMS_KFiiEi
 cc 16                 cmpi.s8	r4, 0x16
 d0 10                 breq8	avm_test_main+112
 d4 00                 jmp8	avm_test_main+98
 c0 02                 ldi8	r4, 0x2
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 64                 stsp16	[sp+0x9], r4
 f4 6d                 stsp16	[sp+0xb], r5
 d4 29                 jmp8	avm_test_main+153
 f0 34 17              ldsp16	r4, [sp+0x17]
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 63 cc              ldp24	q3, [q3]
 c1 06                 ldi8	r5, 0x6
 eb                    callp	q3
 cc 17                 cmpi.s8	r4, 0x17
 d0 10                 breq8	avm_test_main+145
 d4 00                 jmp8	avm_test_main+131
 c0 03                 ldi8	r4, 0x3
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 64                 stsp16	[sp+0x9], r4
 f4 6d                 stsp16	[sp+0xb], r5
 d4 08                 jmp8	avm_test_main+153
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 64                 stsp16	[sp+0x9], r4
 f4 6d                 stsp16	[sp+0xb], r5
 d4 00                 jmp8	avm_test_main+153
 f0 14 19              leasp	r4, 0x19
 e1 22 01              call16	_ZN15SeparateDerivedD2Ev
 f4 24                 ldsp16	r4, [sp+0x9]
 f4 2d                 ldsp16	r5, [sp+0xb]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	avm_test_main+174
 d4 00                 jmp8	avm_test_main+172
 d4 10                 jmp8	avm_test_main+190
 e1 6f 01              call16	_Z25separate_destructor_countv
 08                    mov	r6, r4
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 ce 02                 cmpi.s8	r6, 0x2
 fb 25                 cmov.eq	r4, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 d4 00                 jmp8	avm_test_main+190
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d6 20                 adjsp	0x20
 ef                    ret

<call_method(SeparateBase*, int (SeparateBase::*)(int) const, int)>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ed                 adjsp	-0x13
 0d                    mov	r7, r5
 f1 04                 mov	r0, r4
 f1 0f                 mov	r1, r7
 f0 6c 93              ld16	r4, [r1+]
 ed a2 20              ld8u	r5, [r1+0]
 ed fe 23              ld16	r7, [r7+3]
 f0 38 11              stsp16	[sp+0x11], r0
 f4 7f                 stsp16	[sp+0xf], r7
 f4 70                 stsp16	[sp+0xc], r4
 f1 69                 stsp8	[sp+0xe], r5
 f4 6a                 stsp16	[sp+0xa], r6
 f0 36 11              ldsp16	r6, [sp+0x11]
 f4 30                 ldsp16	r4, [sp+0xc]
 f3 79                 ldsp8u	r5, [sp+0xe]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 3f                 ldsp16	r7, [sp+0xf]
 1b                    add	r6, r7
 f4 62                 stsp16	[sp+0x8], r6
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 22                 breq8	_ZL11call_methodP12SeparateBaseMS_KFiiEi+91
 d4 00                 jmp8	_ZL11call_methodP12SeparateBaseMS_KFiiEi+59
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 6c d1              ld16	r6, [r0+]
 ed e0 20              ld8u	r7, [r0+0]
 f7 6b                 add32	q2, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d4 11                 jmp8	_ZL11call_methodP12SeparateBaseMS_KFiiEi+108
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 ff ff              ldi16	r6, 0xffff
 c3 ff                 ldi8	r7, 0xff
 82                    and	r4, r6
 87                    and	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d4 00                 jmp8	_ZL11call_methodP12SeparateBaseMS_KFiiEi+108
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 29                 ldsp16	r5, [sp+0xa]
 eb                    callp	q3
 d6 13                 adjsp	0x13
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 00                    nop

<SeparateBase::value(int) const>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 d6 04                 adjsp	0x4
 ef                    ret
 00                    nop

<SeparateBase::~SeparateBase()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 06 05              ldi16	r6, 0x506
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 f0 54 00 01           ldm16	r4, [0x100]
 f4 ac                 inc16	r4
 f0 5c 00 01           stm16	[0x100], r4
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<SeparateBase::~SeparateBase()>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 d5 da                 call8	_ZN12SeparateBaseD2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 03                 ldi8	r5, 0x3
 e1 ad 00              call16	_ZdlPvj
 d6 04                 adjsp	0x4
 ef                    ret

<SeparateDerived::SeparateDerived(int)>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 40                 stsp16	[sp+0x0], r4
 d5 14                 call8	_ZN12SeparateBaseC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 15 05              ldi16	r6, 0x515
 c3 00                 ldi8	r7, 0x0
 04                    mov	r5, r4
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 f4 09                 ldsp16	r5, [sp+0x2]
 ee b8 23              st16	[r4+3], r5
 d6 06                 adjsp	0x6
 ef                    ret
 00                    nop

<SeparateBase::SeparateBase()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 06 05              ldi16	r6, 0x506
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<SeparateDerived::value(int) const>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 00                 ldsp16	r4, [sp+0x0]
 ed ba 23              ld16	r5, [r5+3]
 11                    add	r4, r5
 d6 04                 adjsp	0x4
 ef                    ret
 00                    nop

<SeparateDerived::~SeparateDerived()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 15 05              ldi16	r6, 0x515
 c3 00                 ldi8	r7, 0x0
 04                    mov	r5, r4
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 f0 55 00 01           ldm16	r5, [0x100]
 f4 ad                 inc16	r5
 f0 5d 00 01           stm16	[0x100], r5
 e1 70 ff              call16	_ZN12SeparateBaseD2Ev
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<SeparateDerived::~SeparateDerived()>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 d5 d6                 call8	_ZN15SeparateDerivedD2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 05                 ldi8	r5, 0x5
 d5 36                 call8	_ZdlPvj
 d6 04                 adjsp	0x4
 ef                    ret

<separate_method()>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 04                    mov	r5, r4
 01                    mov	r4, r5
 f4 41                 stsp16	[sp+0x0], r5
 aa                    xor	r6, r6
 ee da 23              st16	[r5+3], r6
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 09                    mov	r6, r5
 f7 50                 st16	[r6+], r0
 f3 09                 st8	[r6], r1
 f1 05                 mov	r0, r5
 f0 6c d1              ld16	r6, [r0+]
 ed e0 20              ld8u	r7, [r0+0]
 ed 1a 23              ld16	r0, [r5+3]
 ee 1a 23              st16	[r5+3], r0
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<separate_destructor_count()>:
 f0 54 00 01           ldm16	r4, [0x100]
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<operator delete(void*, unsigned int)>:
 d5 fc                 call8	avm_halt
