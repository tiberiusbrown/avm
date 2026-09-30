
constant_arith_result.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 constant_arith_result.c
00000100 l     O .data	00000080 values
000003c2 l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
000003e8 l       .init_array	00000000 .hidden __init_array_end
000003e8 l       .init_array	00000000 .hidden __init_array_start
000003e8 l       .fini_array	00000000 .hidden __fini_array_start
000003e8 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000000eb avm_test_main
000003e6 g     F .text	00000002 avm_halt
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
 e1 c8 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e8 03              ldi16	r4, 0x3e8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 e8 03              ldi16	r6, 0x3e8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 e8 03           ldi16	r0, 0x3e8
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e8 03           ldi16	r2, 0x3e8
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
 c4 e8 03              ldi16	r4, 0x3e8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 e8 03              ldi16	r6, 0x3e8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 e8 03           ldi16	r2, 0x3e8
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e8 03           ldi16	r0, 0x3e8
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
 d6 f6                 adjsp	-0xa
 c0 7b                 ldi8	r4, 0x7b
 c5 00 01              ldi16	r5, 0x100
 c6 bb 40              ldi16	r6, 0x40bb
 c7 01 01              ldi16	r7, 0x101
 32                    cmp	r4, r6
 d0 06                 breq8	avm_test_main+26
 f7 4c                 st16	[r5+], r4
 13                    add	r4, r7
 32                    cmp	r4, r6
 d1 fa                 brne8	avm_test_main+20
 a0                    xor	r4, r4
 0c                    mov	r7, r4
 f4 40                 stsp16	[sp+0x0], r4
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 da a1 00              breq16	avm_test_main+198
 f0 01 40              ldi8	r1, 0x40
 c4 00 01              ldi16	r4, 0x100
 f4 58                 stsp16	[sp+0x6], r4
 f6 29                 tst16	r1
 da 8d 00              breq16	avm_test_main+191
 f4 18                 ldsp16	r4, [sp+0x6]
 f7 25                 ld16	r5, [r4+]
 f4 58                 stsp16	[sp+0x6], r4
 c2 03                 ldi8	r6, 0x3
 01                    mov	r4, r5
 fe 26                 mul16	r4, r6
 f1 16                 mov	r2, r6
 13                    add	r4, r7
 f0 00 05              ldi8	r0, 0x5
 09                    mov	r6, r5
 fe 30                 mul16	r6, r0
 a8                    xor	r6, r4
 c0 07                 ldi8	r4, 0x7
 0d                    mov	r7, r5
 fe 3c                 mul16	r7, r4
 1e                    add	r7, r6
 01                    mov	r4, r5
 09                    mov	r6, r5
 f0 39 04              stsp16	[sp+0x4], r1
 c1 0a                 ldi8	r5, 0xa
 f1 0d                 mov	r1, r5
 fe 21                 mul16	r4, r1
 a3                    xor	r4, r7
 06                    mov	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 ec 32                 udiv16	r6, r2
 f0 06 fd ff           ldi16	r2, 0xfffd
 0e                    mov	r7, r6
 fe 3a                 mul16	r7, r2
 1d                    add	r7, r5
 1e                    add	r7, r6
 c2 1f                 ldi8	r6, 0x1f
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 14                    add	r5, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 c4 01 01              ldi16	r4, 0x101
 fe 34                 mul16	r6, r4
 a9                    xor	r6, r5
 f0 02 01              ldi8	r2, 0x1
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 54                 and	r2, r5
 01                    mov	r4, r5
 fa 71                 lsr16i	r4, 0x1
 f2 22                 add	r4, r2
 12                    add	r4, r6
 a3                    xor	r4, r7
 f0 06 00 80           ldi16	r2, 0x8000
 0d                    mov	r7, r5
 f9 5e                 xor	r2, r7
 f1 1a                 mov	r3, r2
 c1 03                 ldi8	r5, 0x3
 ec 9d                 sdiv16	r3, r5
 ec d0                 srem16	r2, r0
 07                    mov	r5, r7
 ec 28                 udiv16	r5, r0
 f0 04 fb ff           ldi16	r0, 0xfffb
 09                    mov	r6, r5
 fe 30                 mul16	r6, r0
 1b                    add	r6, r7
 19                    add	r6, r5
 ec 39                 udiv16	r7, r1
 f4 4b                 stsp16	[sp+0x2], r7
 f0 04 f6 ff           ldi16	r0, 0xfff6
 fe 38                 mul16	r7, r0
 f0 31 04              ldsp16	r1, [sp+0x4]
 f4 21                 ldsp16	r5, [sp+0x8]
 1d                    add	r7, r5
 18                    add	r6, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 1c                    add	r7, r4
 ae                    xor	r7, r6
 f2 2f                 add	r7, r3
 f9 ea                 xor	r7, r2
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 db 73 ff              brne16	avm_test_main+50
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 e0 56 ff              jmp16	avm_test_main+28
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 63                 stsp16	[sp+0x8], r7
 d5 12                 call8	test_hex8
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 d5 0c                 call8	test_hex8
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_hex8>:
 b0                    push16	r0
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 f0 00 30              ldi8	r0, 0x30
 0d                    mov	r7, r5
 f9 e1                 or	r7, r0
 c9 37                 addi.s8	r5, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 2f                 cmov.ult	r5, r7
 c2 0f                 ldi8	r6, 0xf
 88                    and	r6, r4
 f9 19                 or	r0, r6
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 30                 cmov.ult	r6, r0
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
