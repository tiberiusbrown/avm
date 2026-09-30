
constant_arith_result.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 constant_arith_result.c
00000100 l     O .data	00000080 values
00000180 l     O .data	00000003 .L.str
00000000 l    df *ABS*	00000000 runtime.c
0000040b l       .init_array	00000000 .hidden __init_array_end
0000040b l       .init_array	00000000 .hidden __init_array_start
0000040b l       .fini_array	00000000 .hidden __fini_array_start
0000040b l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000132 avm_test_main
00000409 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 eb 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 0b 04              ldi16	r4, 0x40b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 0b 04              ldi16	r6, 0x40b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 0b 04           ldi16	r0, 0x40b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 0b 04           ldi16	r2, 0x40b
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
 c4 0b 04              ldi16	r4, 0x40b
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 0b 04              ldi16	r6, 0x40b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 0b 04           ldi16	r2, 0x40b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 0b 04           ldi16	r0, 0x40b
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
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c0 7b                 ldi8	r4, 0x7b
 c5 00 01              ldi16	r5, 0x100
 f0 04 01 01           ldi16	r0, 0x101
 c6 bb 40              ldi16	r6, 0x40bb
 f7 4c                 st16	[r5+], r4
 f2 20                 add	r4, r0
 32                    cmp	r4, r6
 d1 f9                 brne8	avm_test_main+18
 a5                    xor	r5, r5
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 09                    mov	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 c4 00 01              ldi16	r4, 0x100
 f4 5a                 stsp16	[sp+0x6], r6
 f7 22                 ld16	r2, [r4+]
 f4 50                 stsp16	[sp+0x4], r4
 f0 01 03              ldi8	r1, 0x3
 f1 22                 mov	r4, r2
 fe 21                 mul16	r4, r1
 11                    add	r4, r5
 c3 05                 ldi8	r7, 0x5
 f1 2a                 mov	r6, r2
 fe 37                 mul16	r6, r7
 a8                    xor	r6, r4
 f0 03 07              ldi8	r3, 0x7
 f1 22                 mov	r4, r2
 fe 23                 mul16	r4, r3
 12                    add	r4, r6
 c1 0a                 ldi8	r5, 0xa
 f1 1a                 mov	r3, r2
 fe 1d                 mul16	r3, r5
 f9 72                 xor	r3, r4
 f1 22                 mov	r4, r2
 ec 21                 udiv16	r4, r1
 c5 fd ff              ldi16	r5, 0xfffd
 08                    mov	r6, r4
 fe 35                 mul16	r6, r5
 f2 2a                 add	r6, r2
 18                    add	r6, r4
 c0 1f                 ldi8	r4, 0x1f
 f1 26                 mov	r5, r2
 fe 2c                 mul16	r5, r4
 f2 27                 add	r5, r3
 f1 1a                 mov	r3, r2
 fe 18                 mul16	r3, r0
 f9 76                 xor	r3, r5
 c1 01                 ldi8	r5, 0x1
 f9 a8                 and	r5, r2
 f1 22                 mov	r4, r2
 f4 8c                 lsr16.1	r4
 11                    add	r4, r5
 f2 23                 add	r4, r3
 a2                    xor	r4, r6
 f0 07 00 80           ldi16	r3, 0x8000
 f9 6a                 xor	r3, r2
 f1 2b                 mov	r6, r3
 ec b1                 sdiv16	r6, r1
 ec df                 srem16	r3, r7
 f1 26                 mov	r5, r2
 ec 2f                 udiv16	r5, r7
 f0 05 fb ff           ldi16	r1, 0xfffb
 0d                    mov	r7, r5
 fe 39                 mul16	r7, r1
 f2 2e                 add	r7, r2
 1d                    add	r7, r5
 f1 0a                 mov	r1, r2
 c1 0a                 ldi8	r5, 0xa
 ec 0d                 udiv16	r1, r5
 f0 04 f6 ff           ldi16	r0, 0xfff6
 f1 25                 mov	r5, r1
 fe 28                 mul16	r5, r0
 f0 04 01 01           ldi16	r0, 0x101
 f2 26                 add	r5, r2
 1c                    add	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f2 25                 add	r5, r1
 a7                    xor	r5, r7
 16                    add	r5, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f9 ae                 xor	r5, r3
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 db 74 ff              brne16	avm_test_main+38
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 db 61 ff              brne16	avm_test_main+31
 c0 43                 ldi8	r4, 0x43
 c7 81 01              ldi16	r7, 0x181
 f7 18                 ld8u	r0, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a0                 tst8	r0
 f1 20                 mov	r4, r0
 d1 f4                 brne8	avm_test_main+195
 09                    mov	r6, r5
 f1 76                 zext8	r6
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 f0 01 30              ldi8	r1, 0x30
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 c8 37                 addi.s8	r4, 0x37
 f4 58                 stsp16	[sp+0x6], r4
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 fc 27                 cmov.ult	r4, r7
 f4 58                 stsp16	[sp+0x6], r4
 f0 00 0f              ldi8	r0, 0xf
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 f4 50                 stsp16	[sp+0x4], r4
 ca 37                 addi.s8	r6, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 34                    cmp	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 f9 35                 or	r1, r5
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 29                 cmov.ult	r5, r1
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
