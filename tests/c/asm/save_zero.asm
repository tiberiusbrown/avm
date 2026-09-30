
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/save_zero.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	0000004a avm_run_constructors
00000168 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 save_zero.c
000002a6 l     F .text	00000007 call_save_exists
000002ad l     F .text	00000007 call_load
000002b4 l     F .text	00000003 call_save
00000000 l    df *ABS*	00000000 runtime.c
000002b9 l       .init_array	00000000 .hidden __init_array_end
000002b9 l       .init_array	00000000 .hidden __init_array_start
000002b9 l       .fini_array	00000000 .hidden __fini_array_start
000002b9 l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
000001d7 g     F .text	000000cf avm_test_main
000002b7 g     F .text	00000002 avm_halt
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
 e1 99 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 b9 02              ldi16	r4, 0x2b9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 b9 02              ldi16	r6, 0x2b9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 b9 02           ldi16	r0, 0x2b9
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 b9 02           ldi16	r2, 0x2b9
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
 e1 81 fe              call16	-383
 c4 b9 02              ldi16	r4, 0x2b9
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 b9 02              ldi16	r6, 0x2b9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 b9 02           ldi16	r2, 0x2b9
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 b9 02           ldi16	r0, 0x2b9
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
 e1 30 fe              call16	-464
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
 e1 c8 00              call16	call_save_exists
 f1 1c                 mov	r3, r4
 e1 ca 00              call16	call_load
 f1 0c                 mov	r1, r4
 e1 cc 00              call16	call_save
 e1 c9 00              call16	call_save
 c0 01                 ldi8	r4, 0x1
 f1 03                 mov	r0, r3
 f9 10                 and	r0, r4
 c0 30                 ldi8	r4, 0x30
 f9 11                 or	r0, r4
 e1 ae 00              call16	call_save_exists
 f1 14                 mov	r2, r4
 e1 b0 00              call16	call_load
 04                    mov	r5, r4
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f9 65                 or	r3, r1
 c0 01                 ldi8	r4, 0x1
 f9 30                 and	r1, r4
 f9 69                 or	r3, r2
 f9 75                 or	r3, r5
 f9 50                 and	r2, r4
 84                    and	r5, r4
 f9 70                 and	r3, r4
 c2 30                 ldi8	r6, 0x30
 f9 39                 or	r1, r6
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f9 59                 or	r2, r6
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 96                    or	r5, r6
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<call_save_exists>:
 d7 2e                 sys	save_exists
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<call_load>:
 d7 2d                 sys	load
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<call_save>:
 d7 2c                 sys	save
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
