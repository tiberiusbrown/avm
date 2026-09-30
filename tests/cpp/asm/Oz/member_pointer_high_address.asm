
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
000002e0 g     F .text	00000112 avm_test_main
000003f2 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002d8 g     F .text	00000003 First::first()
000002dc g     F .text	00000004 Target::fallback(int)
000101f6 g     F .high_member_text	00000005 Target::run(int)
00001000  w    O .rodata	00000012 vtable for Derived
00000100 g     O .data	00000005 nonvirtual_method
00000108 g     O .data	00000005 virtual_method

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 da 00              call16	avm_test_main
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
 e1 d4 01              call16	avm_halt

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
 c0 01                 ldi8	r4, 0x1
 ef                    ret
 00                    nop

<Target::fallback(int)>:
 01                    mov	r4, r5
 c8 03                 addi.s8	r4, 0x3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 c0 11                 ldi8	r4, 0x11
 f4 70                 stsp16	[sp+0xc], r4
 c4 0f 10              ldi16	r4, 0x100f
 c1 00                 ldi8	r5, 0x0
 f4 64                 stsp16	[sp+0x9], r4
 f1 5d                 stsp8	[sp+0xb], r5
 c4 06 10              ldi16	r4, 0x1006
 c1 00                 ldi8	r5, 0x0
 f4 58                 stsp16	[sp+0x6], r4
 f1 51                 stsp8	[sp+0x8], r5
 c0 01                 ldi8	r4, 0x1
 f0 57 03 01           ldm16	r7, [0x103]
 f0 16 09              leasp	r6, 0x9
 c5 00 01              ldi16	r5, 0x100
 f7 2a                 ld16	r2, [r5+]
 f5 37                 ld8u	r3, [r5]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 da d5 00              breq16	avm_test_main+267
 f4 42                 stsp16	[sp+0x0], r6
 02                    mov	r4, r6
 f4 53                 stsp16	[sp+0x4], r7
 13                    add	r4, r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f2 6b                 mov32	q3, q1
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f8 05                 cset.eq	r5
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 d1 04                 brne8	avm_test_main+96
 f2 6b                 mov32	q3, q1
 d4 0b                 jmp8	avm_test_main+107
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f7 6d                 add32	q3, q1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 c1 05                 ldi8	r5, 0x5
 eb                    callp	q3
 cc 16                 cmpi.s8	r4, 0x16
 c0 01                 ldi8	r4, 0x1
 db 96 00              brne16	avm_test_main+267
 f0 30 02              ldsp16	r0, [sp+0x2]
 f9 10                 and	r0, r4
 f0 14 06              leasp	r4, 0x6
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 c8 03                 addi.s8	r4, 0x3
 f4 a0                 tst8	r0
 d1 13                 brne8	avm_test_main+153
 04                    mov	r5, r4
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f7 6d                 add32	q3, q1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 6c                 add32	q3, q0
 f0 63 4c              ldp24	q1, [q3]
 c1 06                 ldi8	r5, 0x6
 e9                    callp	q1
 cc 17                 cmpi.s8	r4, 0x17
 d1 25                 brne8	avm_test_main+197
 f0 54 0b 01           ldm16	r4, [0x10b]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 50                 stsp16	[sp+0x4], r4
 18                    add	r6, r4
 c4 08 01              ldi16	r4, 0x108
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 62                 mov32	q0, q2
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 09                 brne8	avm_test_main+201
 02                    mov	r4, r6
 f2 6b                 mov32	q3, q1
 d4 18                 jmp8	avm_test_main+221
 c0 02                 ldi8	r4, 0x2
 d4 42                 jmp8	avm_test_main+267
 06                    mov	r5, r6
 02                    mov	r4, r6
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f7 6d                 add32	q3, q1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 c1 05                 ldi8	r5, 0x5
 eb                    callp	q3
 cc 08                 cmpi.s8	r4, 0x8
 d1 25                 brne8	avm_test_main+265
 f0 54 03 01           ldm16	r4, [0x103]
 f2 30                 sub	r0, r0
 c1 04                 ldi8	r5, 0x4
 f4 12                 ldsp16	r6, [sp+0x4]
 38                    cmp	r6, r4
 f1 08                 mov	r1, r0
 fb 0d                 cmov.eq	r1, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fb 0d                 cmov.eq	r1, r5
 c5 00 01              ldi16	r5, 0x100
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 f0 69 4c              cmp32	q1, q3
 f1 20                 mov	r4, r0
 fb 21                 cmov.eq	r4, r1
 d4 02                 jmp8	avm_test_main+267
 c0 03                 ldi8	r4, 0x3
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

Disassembly of section .high_member_text:

<Target::run(int)>:
 ed 98 23              ld16	r4, [r4+3]
 11                    add	r4, r5
 ef                    ret
