
constant_arith_result.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 constant_arith_result.c
00000100 l     O .data	00000080 values
00000000 l    df *ABS*	00000000 runtime.c
000003ff l       .init_array	00000000 .hidden __init_array_end
000003ff l       .init_array	00000000 .hidden __init_array_start
000003ff l       .fini_array	00000000 .hidden __fini_array_start
000003ff l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000126 avm_test_main
000003fd g     F .text	00000002 avm_halt
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
 e1 df 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ff 03              ldi16	r4, 0x3ff
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ff 03              ldi16	r6, 0x3ff
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 ff 03           ldi16	r0, 0x3ff
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ff 03           ldi16	r2, 0x3ff
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
 c4 ff 03              ldi16	r4, 0x3ff
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ff 03              ldi16	r6, 0x3ff
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 ff 03           ldi16	r2, 0x3ff
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ff 03           ldi16	r0, 0x3ff
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
 f0 07 01 01           ldi16	r3, 0x101
 c6 bb 40              ldi16	r6, 0x40bb
 f7 4c                 st16	[r5+], r4
 f2 23                 add	r4, r3
 32                    cmp	r4, r6
 d1 f9                 brne8	avm_test_main+18
 af                    xor	r7, r7
 c0 40                 ldi8	r4, 0x40
 f4 40                 stsp16	[sp+0x0], r4
 07                    mov	r5, r7
 f4 49                 stsp16	[sp+0x2], r5
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 05 00 01           ldi16	r1, 0x100
 f0 6c b3              ld16	r5, [r1+]
 f0 39 06              stsp16	[sp+0x6], r1
 c2 03                 ldi8	r6, 0x3
 01                    mov	r4, r5
 fe 26                 mul16	r4, r6
 f1 16                 mov	r2, r6
 13                    add	r4, r7
 c3 05                 ldi8	r7, 0x5
 09                    mov	r6, r5
 fe 37                 mul16	r6, r7
 a8                    xor	r6, r4
 c0 07                 ldi8	r4, 0x7
 0d                    mov	r7, r5
 fe 3c                 mul16	r7, r4
 1e                    add	r7, r6
 c2 0a                 ldi8	r6, 0xa
 01                    mov	r4, r5
 fe 26                 mul16	r4, r6
 a3                    xor	r4, r7
 09                    mov	r6, r5
 ec 32                 udiv16	r6, r2
 f0 06 fd ff           ldi16	r2, 0xfffd
 0e                    mov	r7, r6
 fe 3a                 mul16	r7, r2
 1d                    add	r7, r5
 1e                    add	r7, r6
 f0 01 1f              ldi8	r1, 0x1f
 09                    mov	r6, r5
 fe 29                 mul16	r5, r1
 14                    add	r5, r4
 02                    mov	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 fe 33                 mul16	r6, r3
 a9                    xor	r6, r5
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 fa 71                 lsr16i	r4, 0x1
 11                    add	r4, r5
 12                    add	r4, r6
 a3                    xor	r4, r7
 f0 07 00 80           ldi16	r3, 0x8000
 f4 23                 ldsp16	r7, [sp+0x8]
 f9 7e                 xor	r3, r7
 f1 13                 mov	r2, r3
 c1 03                 ldi8	r5, 0x3
 ec 95                 sdiv16	r2, r5
 c2 05                 ldi8	r6, 0x5
 ec de                 srem16	r3, r6
 07                    mov	r5, r7
 ec 2e                 udiv16	r5, r6
 f0 05 fb ff           ldi16	r1, 0xfffb
 09                    mov	r6, r5
 fe 31                 mul16	r6, r1
 1b                    add	r6, r7
 19                    add	r6, r5
 c1 0a                 ldi8	r5, 0xa
 ec 3d                 udiv16	r7, r5
 f0 05 f6 ff           ldi16	r1, 0xfff6
 f4 53                 stsp16	[sp+0x4], r7
 fe 39                 mul16	r7, r1
 f4 21                 ldsp16	r5, [sp+0x8]
 1d                    add	r7, r5
 18                    add	r6, r4
 f0 31 06              ldsp16	r1, [sp+0x6]
 f4 10                 ldsp16	r4, [sp+0x4]
 1c                    add	r7, r4
 ae                    xor	r7, r6
 f2 2e                 add	r7, r2
 f9 ee                 xor	r7, r3
 f0 07 01 01           ldi16	r3, 0x101
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 db 79 ff              brne16	avm_test_main+40
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 db 64 ff              brne16	avm_test_main+31
 07                    mov	r5, r7
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 f0 01 30              ldi8	r1, 0x30
 08                    mov	r6, r4
 f9 c5                 or	r6, r1
 c8 37                 addi.s8	r4, 0x37
 f4 60                 stsp16	[sp+0x8], r4
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 fc 26                 cmov.ult	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f0 00 0f              ldi8	r0, 0xf
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 f4 58                 stsp16	[sp+0x6], r4
 c9 37                 addi.s8	r5, 0x37
 c4 00 a0              ldi16	r4, 0xa000
 3c                    cmp	r7, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 fc 2c                 cmov.ult	r5, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 f9 3d                 or	r1, r7
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 39                 cmov.ult	r7, r1
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
