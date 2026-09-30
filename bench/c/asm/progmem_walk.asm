
progmem_walk.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 progmem_walk.c
0000036b l     O .rodata	00000080 program_bytes
00000100 l     O .data	00000002 progmem_result
00000000 l    df *ABS*	00000000 runtime.c
000003eb l       .init_array	00000000 .hidden __init_array_end
000003eb l       .init_array	00000000 .hidden __init_array_start
000003eb l       .fini_array	00000000 .hidden __fini_array_start
000003eb l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000092 avm_test_main
00000369 g     F .text	00000002 avm_halt
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
 e1 4b 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 eb 03              ldi16	r4, 0x3eb
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 eb 03              ldi16	r6, 0x3eb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 eb 03           ldi16	r0, 0x3eb
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 eb 03           ldi16	r2, 0x3eb
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
 c4 eb 03              ldi16	r4, 0x3eb
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 eb 03              ldi16	r6, 0x3eb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 eb 03           ldi16	r2, 0x3eb
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 eb 03           ldi16	r0, 0x3eb
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
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 04 6b 03           ldi16	r0, 0x36b
 f0 01 00              ldi8	r1, 0x0
 0c                    mov	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 f2 64                 mov32	q1, q0
 f2 30                 sub	r0, r0
 f0 68 c4              ldp32	q3, [q1+]
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 1c                    add	r7, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 01                    mov	r4, r5
 a5                    xor	r5, r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 1e                    add	r7, r6
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f0 08 02              addi.s8	r0, 0x2
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 da                 brne8	avm_test_main+23
 f2 42                 sub	r2, r2
 f1 1a                 mov	r3, r2
 0c                    mov	r7, r4
 f0 04 6b 03           ldi16	r0, 0x36b
 f0 01 00              ldi8	r1, 0x0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 2f                 add	r7, r3
 c2 7f                 ldi8	r6, 0x7f
 8b                    and	r6, r7
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 f7 6b                 add32	q2, q3
 c2 07                 ldi8	r6, 0x7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f9 c8                 and	r6, r2
 f4 5a                 stsp16	[sp+0x6], r6
 f0 60 e8              ldp8u	r7, [q2]
 0b                    mov	r6, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 fa 08                 shl16v	r6, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 a2                    xor	r4, r6
 f0 0b 0d              addi.s8	r3, 0xd
 f4 aa                 inc16	r2
 c2 80                 ldi8	r6, 0x80
 f5 16                 cmp	r2, r6
 d1 d0                 brne8	avm_test_main+73
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 d1 8d                 brne8	avm_test_main+17
 f0 5c 00 01           stm16	[0x100], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
