
placement_new.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 placement_new.cpp
00000100 l     O .data	00000002 constructed
00000102 l     O .data	00000002 destroyed
00000000 l    df *ABS*	00000000 runtime.c
000003af l       .init_array	00000000 .hidden __init_array_end
000003af l       .init_array	00000000 .hidden __init_array_start
000003af l       .fini_array	00000000 .hidden __fini_array_start
000003af l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000009a avm_test_main
000003ad g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000372  w    F .text	00000018 object::object(int)
0000038a  w    F .text	00000011 object::~object()
0000039b  w    F .text	00000009 operator delete(void*, void*)
000003a4  w    F .text	00000009 operator delete[](void*, void*)

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
 e1 8f 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 af 03              ldi16	r4, 0x3af
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 af 03              ldi16	r6, 0x3af
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 af 03           ldi16	r0, 0x3af
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 af 03           ldi16	r2, 0x3af
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
 c4 af 03              ldi16	r4, 0x3af
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 af 03              ldi16	r6, 0x3af
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 af 03           ldi16	r2, 0x3af
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 af 03           ldi16	r0, 0x3af
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
 d6 ee                 adjsp	-0x12
 f0 14 0e              leasp	r4, 0xe
 f4 70                 stsp16	[sp+0xc], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 40                 stsp16	[sp+0x0], r4
 c1 2a                 ldi8	r5, 0x2a
 e1 8b 00              call16	_ZN6objectC2Ei
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 68                 stsp16	[sp+0xa], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 31                    cmp	r4, r5
 d1 15                 brne8	avm_test_main+48
 d4 00                 jmp8	avm_test_main+29
 f4 28                 ldsp16	r4, [sp+0xa]
 60                    ld16	r4, [r4]
 cc 2a                 cmpi.s8	r4, 0x2a
 d1 0c                 brne8	avm_test_main+48
 d4 00                 jmp8	avm_test_main+38
 f0 54 00 01           ldm16	r4, [0x100]
 cc 01                 cmpi.s8	r4, 0x1
 d0 09                 breq8	avm_test_main+55
 d4 00                 jmp8	avm_test_main+48
 c0 01                 ldi8	r4, 0x1
 f0 3c 10              stsp16	[sp+0x10], r4
 d4 5d                 jmp8	avm_test_main+148
 f4 28                 ldsp16	r4, [sp+0xa]
 d5 78                 call8	_ZN6objectD2Ev
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 e1 82 00              call16	_ZdlPvS_
 f0 54 02 01           ldm16	r4, [0x102]
 cc 01                 cmpi.s8	r4, 0x1
 d0 09                 breq8	avm_test_main+83
 d4 00                 jmp8	avm_test_main+76
 c0 02                 ldi8	r4, 0x2
 f0 3c 10              stsp16	[sp+0x10], r4
 d4 41                 jmp8	avm_test_main+148
 f0 14 06              leasp	r4, 0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 07                 ldi8	r5, 0x7
 71                    st16	[r4], r5
 c1 08                 ldi8	r5, 0x8
 ee b8 22              st16	[r4+2], r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 31                    cmp	r4, r5
 d1 16                 brne8	avm_test_main+129
 d4 00                 jmp8	avm_test_main+109
 f4 08                 ldsp16	r4, [sp+0x2]
 60                    ld16	r4, [r4]
 cc 07                 cmpi.s8	r4, 0x7
 d1 0d                 brne8	avm_test_main+129
 d4 00                 jmp8	avm_test_main+118
 f4 08                 ldsp16	r4, [sp+0x2]
 ed 98 22              ld16	r4, [r4+2]
 cc 08                 cmpi.s8	r4, 0x8
 d0 09                 breq8	avm_test_main+136
 d4 00                 jmp8	avm_test_main+129
 c0 03                 ldi8	r4, 0x3
 f0 3c 10              stsp16	[sp+0x10], r4
 d4 0c                 jmp8	avm_test_main+148
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 d5 3f                 call8	_ZdaPvS_
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 d4 00                 jmp8	avm_test_main+148
 f0 34 10              ldsp16	r4, [sp+0x10]
 d6 12                 adjsp	0x12
 ef                    ret
 00                    nop

<object::object(int)>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 01                 ldsp16	r5, [sp+0x0]
 71                    st16	[r4], r5
 f0 54 00 01           ldm16	r4, [0x100]
 f4 ac                 inc16	r4
 f0 5c 00 01           stm16	[0x100], r4
 d6 04                 adjsp	0x4
 ef                    ret

<object::~object()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f0 54 02 01           ldm16	r4, [0x102]
 f4 ac                 inc16	r4
 f0 5c 02 01           stm16	[0x102], r4
 d6 02                 adjsp	0x2
 ef                    ret

<operator delete(void*, void*)>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 d6 04                 adjsp	0x4
 ef                    ret

<operator delete[](void*, void*)>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 d6 04                 adjsp	0x4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
