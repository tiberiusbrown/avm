
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/save_load_max.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000051e l     F .text	0000004a avm_run_constructors
00000568 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 save_load_max.c
00000100 l     O .saved	00000400 saved_state
000007c9 l     F .text	00000007 call_save_exists
000007d0 l     F .text	00000003 call_save
000007d3 l     F .text	00000007 call_load
00000000 l    df *ABS*	00000000 runtime.c
000007dc l       .init_array	00000000 .hidden __init_array_end
000007dc l       .init_array	00000000 .hidden __init_array_start
000007dc l       .fini_array	00000000 .hidden __fini_array_start
000007dc l       .fini_array	00000000 .hidden __fini_array_end
00000500 g     F .text	0000001e _start
000005d7 g     F .text	000001f2 avm_test_main
000007da g     F .text	00000002 avm_halt
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
 e1 bc 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 dc 07              ldi16	r4, 0x7dc
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 dc 07              ldi16	r6, 0x7dc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 dc 07           ldi16	r0, 0x7dc
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 dc 07           ldi16	r2, 0x7dc
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
 c4 dc 07              ldi16	r4, 0x7dc
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 dc 07              ldi16	r6, 0x7dc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 dc 07           ldi16	r2, 0x7dc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 dc 07           ldi16	r0, 0x7dc
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
 d6 f4                 adjsp	-0xc
 a0                    xor	r4, r4
 f4 60                 stsp16	[sp+0x8], r4
 f0 04 00 01           ldi16	r0, 0x100
 f0 01 2b              ldi8	r1, 0x2b
 e1 df 01              call16	call_save_exists
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 68                 stsp16	[sp+0xa], r4
 f0 06 00 04           ldi16	r2, 0x400
 01                    mov	r4, r5
 fa 73                 lsr16i	r4, 0x3
 f2 21                 add	r4, r1
 f0 6d 81              st8	[r0+], r4
 f0 09 0d              addi.s8	r1, 0xd
 f4 ad                 inc16	r5
 f5 26                 cmp	r5, r2
 d1 ef                 brne8	avm_test_main+27
 e1 ca 01              call16	call_save
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 c2 56                 ldi8	r6, 0x56
 0c                    mov	r7, r4
 fa a3                 lsr16i	r7, 0x3
 1e                    add	r7, r6
 f6 0f                 st8	[r5+], r7
 ca 0d                 addi.s8	r6, 0xd
 f4 ac                 inc16	r4
 f5 22                 cmp	r4, r2
 d1 f2                 brne8	avm_test_main+53
 e1 b3 01              call16	call_save
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 c2 81                 ldi8	r6, 0x81
 0c                    mov	r7, r4
 fa a3                 lsr16i	r7, 0x3
 1e                    add	r7, r6
 f6 0f                 st8	[r5+], r7
 ca 0d                 addi.s8	r6, 0xd
 f4 ac                 inc16	r4
 f5 22                 cmp	r4, r2
 d1 f2                 brne8	avm_test_main+76
 e1 9c 01              call16	call_save
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 c2 ac                 ldi8	r6, 0xac
 0c                    mov	r7, r4
 fa a3                 lsr16i	r7, 0x3
 1e                    add	r7, r6
 f6 0f                 st8	[r5+], r7
 ca 0d                 addi.s8	r6, 0xd
 f4 ac                 inc16	r4
 f5 22                 cmp	r4, r2
 d1 f2                 brne8	avm_test_main+99
 e1 85 01              call16	call_save
 a0                    xor	r4, r4
 f4 58                 stsp16	[sp+0x6], r4
 f0 04 00 01           ldi16	r0, 0x100
 f0 01 fa              ldi8	r1, 0xfa
 e1 71 01              call16	call_save_exists
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 60                 stsp16	[sp+0x8], r4
 01                    mov	r4, r5
 fa 73                 lsr16i	r4, 0x3
 f2 21                 add	r4, r1
 f0 6d 81              st8	[r0+], r4
 f0 09 0d              addi.s8	r1, 0xd
 f4 ad                 inc16	r5
 f5 26                 cmp	r5, r2
 d1 ef                 brne8	avm_test_main+133
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f0 02 ac              ldi8	r2, 0xac
 f0 07 00 01           ldi16	r3, 0x100
 e1 59 01              call16	call_load
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 58                 stsp16	[sp+0x6], r4
 02                    mov	r4, r6
 f0 05 ff 03           ldi16	r1, 0x3ff
 f0 6c 07              ld8u	r0, [r3+]
 06                    mov	r5, r6
 fa 83                 lsr16i	r5, 0x3
 f2 26                 add	r5, r2
 f0 0a 0d              addi.s8	r2, 0xd
 f4 ac                 inc16	r4
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 d1 05                 brne8	avm_test_main+196
 f5 29                 cmp	r6, r1
 08                    mov	r6, r4
 d1 e8                 brne8	avm_test_main+172
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 c2 1f                 ldi8	r6, 0x1f
 f0 06 00 04           ldi16	r2, 0x400
 0c                    mov	r7, r4
 fa a3                 lsr16i	r7, 0x3
 1e                    add	r7, r6
 f6 0f                 st8	[r5+], r7
 ca 0d                 addi.s8	r6, 0xd
 f4 ac                 inc16	r4
 f5 22                 cmp	r4, r2
 d1 f2                 brne8	avm_test_main+208
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 02 ac              ldi8	r2, 0xac
 f0 07 00 01           ldi16	r3, 0x100
 e1 11 01              call16	call_load
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 50                 stsp16	[sp+0x4], r4
 01                    mov	r4, r5
 f0 6c c7              ld8u	r6, [r3+]
 0d                    mov	r7, r5
 fa a3                 lsr16i	r7, 0x3
 f2 2e                 add	r7, r2
 f0 0a 0d              addi.s8	r2, 0xd
 f4 ac                 inc16	r4
 f1 77                 zext8	r7
 3e                    cmp	r7, r6
 d1 05                 brne8	avm_test_main+263
 f5 25                 cmp	r5, r1
 04                    mov	r5, r4
 d1 e9                 brne8	avm_test_main+240
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f0 01 30              ldi8	r1, 0x30
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f0 02 01              ldi8	r2, 0x1
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 f9 88                 and	r4, r2
 f9 85                 or	r4, r1
 d7 00                 sys	debug_putc
 3e                    cmp	r7, r6
 f8 03                 cset.eq	r3
 f4 08                 ldsp16	r4, [sp+0x2]
 f5 20                 cmp	r4, r0
 f8 01                 cset.eq	r1
 c6 ff ff              ldi16	r6, 0xffff
 a9                    xor	r6, r5
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f4 21                 ldsp16	r5, [sp+0x8]
 89                    and	r6, r5
 f4 1b                 ldsp16	r7, [sp+0x6]
 8b                    and	r6, r7
 f9 c4                 and	r6, r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 c0                 and	r6, r0
 f9 cc                 and	r6, r3
 f9 a8                 and	r5, r2
 f9 e8                 and	r7, r2
 f9 08                 and	r0, r2
 f9 ca                 xor	r6, r2
 f0 02 30              ldi8	r2, 0x30
 f9 a9                 or	r5, r2
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
 f1 26                 mov	r5, r2
 9d                    or	r7, r5
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
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f9 35                 or	r1, r5
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
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 f9 15                 or	r0, r5
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
 f9 75                 or	r3, r5
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d6 0c                 adjsp	0xc
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

<call_save>:
 d7 2c                 sys	save
 ef                    ret

<call_load>:
 d7 2d                 sys	load
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
