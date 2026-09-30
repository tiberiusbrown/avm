
save_load_max.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000051e l     F .text	0000004a avm_run_constructors
00000568 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 save_load_max.c
000006ff l     F .text	00000007 call_save_exists
00000706 l     F .text	00000021 fill_saved
00000727 l     F .text	00000003 call_save
0000072a l     F .text	00000007 call_load
00000731 l     F .text	00000039 check_saved
00000100 l     O .saved	00000400 saved_state
00000000 l    df *ABS*	00000000 runtime.c
0000076c l       .init_array	00000000 .hidden __init_array_end
0000076c l       .init_array	00000000 .hidden __init_array_start
0000076c l       .fini_array	00000000 .hidden __fini_array_start
0000076c l       .fini_array	00000000 .hidden __fini_array_end
00000500 g     F .text	0000001e _start
000005d7 g     F .text	00000128 avm_test_main
0000076a g     F .text	00000002 avm_halt
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
 e1 4c 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 6c 07              ldi16	r4, 0x76c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 6c 07              ldi16	r6, 0x76c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 6c 07           ldi16	r0, 0x76c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 6c 07           ldi16	r2, 0x76c
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
 e1 81 fa              call16	-1407
 c4 6c 07              ldi16	r4, 0x76c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 6c 07              ldi16	r6, 0x76c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 6c 07           ldi16	r2, 0x76c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 6c 07           ldi16	r0, 0x76c
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
 e1 30 fa              call16	-1488
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
 d6 fc                 adjsp	-0x4
 f0 01 01              ldi8	r1, 0x1
 e1 1c 01              call16	call_save_exists
 f1 04                 mov	r0, r4
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 cc 05                 cmpi.s8	r4, 0x5
 d0 0a                 breq8	avm_test_main+32
 e1 16 01              call16	fill_saved
 e1 34 01              call16	call_save
 f4 a9                 inc16	r1
 d4 ee                 jmp8	avm_test_main+14
 e1 05 01              call16	call_save_exists
 f1 1c                 mov	r3, r4
 c0 ee                 ldi8	r4, 0xee
 e1 05 01              call16	fill_saved
 e1 26 01              call16	call_load
 f1 14                 mov	r2, r4
 e1 28 01              call16	check_saved
 f4 48                 stsp16	[sp+0x2], r4
 c0 dd                 ldi8	r4, 0xdd
 e1 f6 00              call16	fill_saved
 c0 01                 ldi8	r4, 0x1
 f1 08                 mov	r1, r0
 f9 30                 and	r1, r4
 c0 30                 ldi8	r4, 0x30
 f9 31                 or	r1, r4
 e1 0d 01              call16	call_load
 f4 40                 stsp16	[sp+0x0], r4
 e1 0f 01              call16	check_saved
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
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c3 01                 ldi8	r7, 0x1
 f9 1e                 xor	r0, r7
 f9 0c                 and	r0, r3
 f9 08                 and	r0, r2
 f4 0a                 ldsp16	r6, [sp+0x2]
 f9 18                 and	r0, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f9 10                 and	r0, r4
 f9 14                 and	r0, r5
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 22                 xor	r1, r0
 f9 7c                 and	r3, r7
 f9 5c                 and	r2, r7
 8b                    and	r6, r7
 83                    and	r4, r7
 f1 04                 mov	r0, r4
 f9 3c                 and	r1, r7
 87                    and	r5, r7
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c3 30                 ldi8	r7, 0x30
 f9 7d                 or	r3, r7
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f9 5d                 or	r2, r7
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
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
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 9b                    or	r6, r7
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 f9 1d                 or	r0, r7
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 97                    or	r5, r7
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d6 04                 adjsp	0x4
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

<fill_saved>:
 b0                    push16	r0
 c1 2b                 ldi8	r5, 0x2b
 f3 11                 mulu8.w	r4, r5
 af                    xor	r7, r7
 c6 00 01              ldi16	r6, 0x100
 f0 04 00 04           ldi16	r0, 0x400
 f5 2c                 cmp	r7, r0
 d0 0e                 breq8	fill_saved+31
 07                    mov	r5, r7
 fa 83                 lsr16i	r5, 0x3
 14                    add	r5, r4
 f6 15                 st8	[r6+], r5
 c8 0d                 addi.s8	r4, 0xd
 f4 af                 inc16	r7
 f5 2c                 cmp	r7, r0
 d1 f2                 brne8	fill_saved+17
 b8                    pop16	r0
 ef                    ret

<call_save>:
 d7 2c                 sys	save
 ef                    ret

<call_load>:
 d7 2d                 sys	load
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<check_saved>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 af                    xor	r7, r7
 f0 07 00 01           ldi16	r3, 0x100
 c1 9f                 ldi8	r5, 0x9f
 c4 ff ff              ldi16	r4, 0xffff
 f0 04 00 04           ldi16	r0, 0x400
 f1 0f                 mov	r1, r7
 f5 08                 cmp	r1, r0
 d0 15                 breq8	check_saved+45
 f0 6c 47              ld8u	r2, [r3+]
 c9 0d                 addi.s8	r5, 0xd
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 fa 93                 lsr16i	r6, 0x3
 19                    add	r6, r5
 f1 2d                 mov	r7, r1
 f4 af                 inc16	r7
 f1 76                 zext8	r6
 f5 2a                 cmp	r6, r2
 d0 e5                 breq8	check_saved+18
 c4 ff 03              ldi16	r4, 0x3ff
 f5 21                 cmp	r4, r1
 f8 14                 cset.ult	r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
