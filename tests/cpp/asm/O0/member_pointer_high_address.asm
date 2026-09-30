
member_pointer_high_address.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 member_pointer_high_address.cpp
00000000 l    df *ABS*	00000000 runtime.c
00000100 l       .data	00000000 .hidden __init_array_end
00000100 l       .data	00000000 .hidden __init_array_start
00000100 l       .data	00000000 .hidden __fini_array_start
00000100 l       .data	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002ef g     F .text	0000020a avm_test_main
00000547 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002d8 g     F .text	00000009 First::first()
000002e2 g     F .text	0000000d Target::fallback(int)
000101f6 g     F .high_member_text	00000011 Target::run(int)
000004fa  w    F .text	00000029 Derived::Derived()
00000100 g     O .data	00000005 nonvirtual_method
00000105 g     O .data	00000005 virtual_method
00000524  w    F .text	00000011 First::First()
00000536  w    F .text	00000011 Target::Target()
00001012  w    O .rodata	00000012 vtable for Derived
00001000 g     O .rodata	00000009 vtable for First
00001009 g     O .rodata	00000009 vtable for Target

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 e9 00              call16	avm_test_main
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
 e1 29 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 01              ldi16	r4, 0x100
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 00 01              ldi16	r6, 0x100
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 00 01           ldi16	r0, 0x100
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 00 01           ldi16	r2, 0x100
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
 c4 00 01              ldi16	r4, 0x100
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 00 01              ldi16	r6, 0x100
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 00 01           ldi16	r2, 0x100
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 00 01           ldi16	r0, 0x100
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
 00                    nop

<First::first()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c0 01                 ldi8	r4, 0x1
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Target::fallback(int)>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 03                 addi.s8	r4, 0x3
 d6 04                 adjsp	0x4
 ef                    ret

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c8                 adjsp	-0x38
 f0 14 2e              leasp	r4, 0x2e
 e1 00 02              call16	_ZN7DerivedC2Ev
 c0 11                 ldi8	r4, 0x11
 f0 3c 34              stsp16	[sp+0x34], r4
 c6 00 01              ldi16	r6, 0x100
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 f0 56 03 01           ldm16	r6, [0x103]
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3c 29              stsp16	[sp+0x29], r4
 f0 2d 2b              stsp8	[sp+0x2b], r5
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 1d 2b              ldsp8u	r5, [sp+0x2b]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 73                 breq8	avm_test_main+163
 d4 00                 jmp8	avm_test_main+50
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 16 2e              leasp	r6, 0x2e
 18                    add	r6, r4
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 1d 2b              ldsp8u	r5, [sp+0x2b]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 ca 03                 addi.s8	r6, 0x3
 f0 3e 22              stsp16	[sp+0x22], r6
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 26                 breq8	avm_test_main+124
 d4 00                 jmp8	avm_test_main+88
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 30 22              ldsp16	r0, [sp+0x22]
 f0 6c d1              ld16	r6, [r0+]
 ed e0 20              ld8u	r7, [r0+0]
 f7 6b                 add32	q2, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 d4 15                 jmp8	avm_test_main+145
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 c6 ff ff              ldi16	r6, 0xffff
 c3 ff                 ldi8	r7, 0xff
 82                    and	r4, r6
 87                    and	r5, r7
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 d4 00                 jmp8	avm_test_main+145
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 c1 05                 ldi8	r5, 0x5
 eb                    callp	q3
 cc 16                 cmpi.s8	r4, 0x16
 d0 0a                 breq8	avm_test_main+171
 d4 00                 jmp8	avm_test_main+163
 c0 01                 ldi8	r4, 0x1
 f0 3c 36              stsp16	[sp+0x36], r4
 e0 56 01              jmp16	avm_test_main+513
 f0 36 29              ldsp16	r6, [sp+0x29]
 f0 1f 2b              ldsp8u	r7, [sp+0x2b]
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 c8 03                 addi.s8	r4, 0x3
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 2f 26              stsp8	[sp+0x26], r7
 f0 3c 27              stsp16	[sp+0x27], r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 1d 26              ldsp8u	r5, [sp+0x26]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 37 27              ldsp16	r7, [sp+0x27]
 f0 16 2e              leasp	r6, 0x2e
 1b                    add	r6, r7
 f0 3e 18              stsp16	[sp+0x18], r6
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 26                 breq8	avm_test_main+263
 d4 00                 jmp8	avm_test_main+227
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 6c d1              ld16	r6, [r0+]
 ed e0 20              ld8u	r7, [r0+0]
 f7 6b                 add32	q2, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 d4 15                 jmp8	avm_test_main+284
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 c6 ff ff              ldi16	r6, 0xffff
 c3 ff                 ldi8	r7, 0xff
 82                    and	r4, r6
 87                    and	r5, r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 d4 00                 jmp8	avm_test_main+284
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 c1 06                 ldi8	r5, 0x6
 eb                    callp	q3
 cc 17                 cmpi.s8	r4, 0x17
 d0 0a                 breq8	avm_test_main+310
 d4 00                 jmp8	avm_test_main+302
 c0 02                 ldi8	r4, 0x2
 f0 3c 36              stsp16	[sp+0x36], r4
 e0 cb 00              jmp16	avm_test_main+513
 c6 05 01              ldi16	r6, 0x105
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 f0 56 08 01           ldm16	r6, [0x108]
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3c 29              stsp16	[sp+0x29], r4
 f0 2d 2b              stsp8	[sp+0x2b], r5
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 16 2e              leasp	r6, 0x2e
 18                    add	r6, r4
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 1d 2b              ldsp8u	r5, [sp+0x2b]
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 ca 03                 addi.s8	r6, 0x3
 f4 7a                 stsp16	[sp+0xe], r6
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 22                 breq8	avm_test_main+396
 d4 00                 jmp8	avm_test_main+364
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 6c d1              ld16	r6, [r0+]
 ed e0 20              ld8u	r7, [r0+0]
 f7 6b                 add32	q2, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 d4 11                 jmp8	avm_test_main+413
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 c6 ff ff              ldi16	r6, 0xffff
 c3 ff                 ldi8	r7, 0xff
 82                    and	r4, r6
 87                    and	r5, r7
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 d4 00                 jmp8	avm_test_main+413
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 c1 05                 ldi8	r5, 0x5
 eb                    callp	q3
 cc 08                 cmpi.s8	r4, 0x8
 d0 09                 breq8	avm_test_main+435
 d4 00                 jmp8	avm_test_main+428
 c0 03                 ldi8	r4, 0x3
 f0 3c 36              stsp16	[sp+0x36], r4
 d4 4e                 jmp8	avm_test_main+513
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 1d 2b              ldsp8u	r5, [sp+0x2b]
 f0 04 00 01           ldi16	r0, 0x100
 f0 6c d1              ld16	r6, [r0+]
 ed e0 20              ld8u	r7, [r0+0]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 52 03 01           ldm16	r2, [0x103]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f8 00                 cset.eq	r0
 f5 0a                 cmp	r1, r2
 f8 01                 cset.eq	r1
 f9 05                 or	r0, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 69 8c              cmp32	q2, q3
 d1 14                 brne8	avm_test_main+507
 d4 00                 jmp8	avm_test_main+489
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 09                 breq8	avm_test_main+507
 d4 00                 jmp8	avm_test_main+500
 c0 04                 ldi8	r4, 0x4
 f0 3c 36              stsp16	[sp+0x36], r4
 d4 06                 jmp8	avm_test_main+513
 a0                    xor	r4, r4
 f0 3c 36              stsp16	[sp+0x36], r4
 d4 00                 jmp8	avm_test_main+513
 f0 34 36              ldsp16	r4, [sp+0x36]
 d6 38                 adjsp	0x38
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
 00                    nop

<Derived::Derived()>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 40                 stsp16	[sp+0x0], r4
 d5 20                 call8	_ZN5FirstC2Ev
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 03                 addi.s8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 d5 2a                 call8	_ZN6TargetC2Ev
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 08                 ldsp16	r4, [sp+0x2]
 c6 18 10              ldi16	r6, 0x1018
 c3 00                 ldi8	r7, 0x0
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 c6 21 10              ldi16	r6, 0x1021
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 06                 adjsp	0x6
 ef                    ret
 00                    nop

<First::First()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 06 10              ldi16	r6, 0x1006
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret
 00                    nop

<Target::Target()>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c6 0f 10              ldi16	r6, 0x100f
 c3 00                 ldi8	r7, 0x0
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 d6 02                 adjsp	0x2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

Disassembly of section .high_member_text:

<Target::run(int)>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 00                 ldsp16	r4, [sp+0x0]
 ed ba 23              ld16	r5, [r5+3]
 11                    add	r4, r5
 d6 04                 adjsp	0x4
 ef                    ret
