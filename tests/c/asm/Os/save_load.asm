
save_load.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 save_load.c
00000100 l     O .saved	00000040 saved_state
00000586 l     F .text	00000007 call_save_exists
0000058d l     F .text	00000007 call_load
00000594 l     F .text	00000003 call_save
00000000 l    df *ABS*	00000000 runtime.c
00000599 l       .init_array	00000000 .hidden __init_array_end
00000599 l       .init_array	00000000 .hidden __init_array_start
00000599 l       .fini_array	00000000 .hidden __fini_array_start
00000599 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000002af avm_test_main
00000597 g     F .text	00000002 avm_halt
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
 e1 79 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 99 05              ldi16	r4, 0x599
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 99 05              ldi16	r6, 0x599
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 99 05           ldi16	r0, 0x599
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 99 05           ldi16	r2, 0x599
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
 c4 99 05              ldi16	r4, 0x599
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 99 05              ldi16	r6, 0x599
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 99 05           ldi16	r2, 0x599
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 99 05           ldi16	r0, 0x599
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
 d6 ec                 adjsp	-0x14
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 c2 ed                 ldi8	r6, 0xed
 0c                    mov	r7, r4
 fa a1                 lsr16i	r7, 0x1
 1e                    add	r7, r6
 f6 0f                 st8	[r5+], r7
 ca 11                 addi.s8	r6, 0x11
 f4 ac                 inc16	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 f2                 brne8	avm_test_main+12
 e1 92 02              call16	call_save_exists
 f4 70                 stsp16	[sp+0xc], r4
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 01 ed              ldi8	r1, 0xed
 f0 06 00 01           ldi16	r2, 0x100
 e1 89 02              call16	call_load
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 3c 10              stsp16	[sp+0x10], r4
 03                    mov	r4, r7
 f0 6c a5              ld8u	r5, [r2+]
 0b                    mov	r6, r7
 fa 91                 lsr16i	r6, 0x1
 f2 29                 add	r6, r1
 f0 09 11              addi.s8	r1, 0x11
 f4 ac                 inc16	r4
 f1 76                 zext8	r6
 39                    cmp	r6, r5
 d1 05                 brne8	avm_test_main+75
 cf 3f                 cmpi.s8	r7, 0x3f
 0c                    mov	r7, r4
 d1 e9                 brne8	avm_test_main+52
 f4 62                 stsp16	[sp+0x8], r6
 f4 69                 stsp16	[sp+0xa], r5
 e1 6b 02              call16	call_save
 a0                    xor	r4, r4
 f4 78                 stsp16	[sp+0xe], r4
 f0 04 00 01           ldi16	r0, 0x100
 f0 01 da              ldi8	r1, 0xda
 e1 50 02              call16	call_save_exists
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 3c 12              stsp16	[sp+0x12], r4
 01                    mov	r4, r5
 fa 71                 lsr16i	r4, 0x1
 f2 21                 add	r4, r1
 f0 6d 81              st8	[r0+], r4
 f0 09 11              addi.s8	r1, 0x11
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d1 ef                 brne8	avm_test_main+100
 a0                    xor	r4, r4
 f4 58                 stsp16	[sp+0x6], r4
 f0 02 ed              ldi8	r2, 0xed
 f0 07 00 01           ldi16	r3, 0x100
 e1 34 02              call16	call_load
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 78                 stsp16	[sp+0xe], r4
 02                    mov	r4, r6
 f0 6c 27              ld8u	r1, [r3+]
 06                    mov	r5, r6
 fa 81                 lsr16i	r5, 0x1
 f2 26                 add	r5, r2
 f0 0a 11              addi.s8	r2, 0x11
 f4 ac                 inc16	r4
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 d1 05                 brne8	avm_test_main+159
 ce 3f                 cmpi.s8	r6, 0x3f
 08                    mov	r6, r4
 d1 e8                 brne8	avm_test_main+135
 f4 49                 stsp16	[sp+0x2], r5
 f0 02 01              ldi8	r2, 0x1
 f0 03 1d              ldi8	r3, 0x1d
 f2 30                 sub	r0, r0
 f1 23                 mov	r4, r3
 c5 00 01              ldi16	r5, 0x100
 f1 28                 mov	r6, r0
 0e                    mov	r7, r6
 fa a1                 lsr16i	r7, 0x1
 1c                    add	r7, r4
 f6 0f                 st8	[r5+], r7
 c8 11                 addi.s8	r4, 0x11
 f4 ae                 inc16	r6
 ce 40                 cmpi.s8	r6, 0x40
 d1 f2                 brne8	avm_test_main+176
 e1 fc 01              call16	call_save
 f0 0b 1d              addi.s8	r3, 0x1d
 f4 aa                 inc16	r2
 f0 0e 47              cmpi.s8	r2, 0x47
 d1 de                 brne8	avm_test_main+169
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 c2 f6                 ldi8	r6, 0xf6
 0c                    mov	r7, r4
 fa a1                 lsr16i	r7, 0x1
 1e                    add	r7, r6
 f6 0f                 st8	[r5+], r7
 ca 11                 addi.s8	r6, 0x11
 f4 ac                 inc16	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 f2                 brne8	avm_test_main+209
 e1 cd 01              call16	call_save_exists
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 02 ee              ldi8	r2, 0xee
 f0 04 00 01           ldi16	r0, 0x100
 e1 c5 01              call16	call_load
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 58                 stsp16	[sp+0x6], r4
 01                    mov	r4, r5
 f0 6c 61              ld8u	r3, [r0+]
 0d                    mov	r7, r5
 fa a1                 lsr16i	r7, 0x1
 f2 2e                 add	r7, r2
 f0 0a 11              addi.s8	r2, 0x11
 f4 ac                 inc16	r4
 f1 77                 zext8	r7
 f5 2f                 cmp	r7, r3
 d1 05                 brne8	avm_test_main+270
 cd 3f                 cmpi.s8	r5, 0x3f
 04                    mov	r5, r4
 d1 e8                 brne8	avm_test_main+246
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f0 00 30              ldi8	r0, 0x30
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c2 01                 ldi8	r6, 0x1
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 82                    and	r4, r6
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 f5 21                 cmp	r4, r1
 f8 01                 cset.eq	r1
 f0 39 02              stsp16	[sp+0x2], r1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f9 a1                 or	r5, r0
 c6 ff ff              ldi16	r6, 0xffff
 a9                    xor	r6, r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 21                 ldsp16	r5, [sp+0x8]
 34                    cmp	r5, r4
 f8 05                 cset.eq	r5
 f5 2f                 cmp	r7, r3
 f8 02                 cset.eq	r2
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 03 01              ldi8	r3, 0x1
 f9 0c                 and	r0, r3
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 f9 11                 or	r0, r4
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
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 89                    and	r6, r5
 f0 37 12              ldsp16	r7, [sp+0x12]
 8b                    and	r6, r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f9 c0                 and	r6, r0
 f9 c4                 and	r6, r1
 f0 31 04              ldsp16	r1, [sp+0x4]
 f9 c4                 and	r6, r1
 f1 23                 mov	r4, r3
 8c                    and	r7, r4
 f9 10                 and	r0, r4
 f9 30                 and	r1, r4
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 cc                 and	r6, r3
 f9 70                 and	r3, r4
 f9 c8                 and	r6, r2
 a8                    xor	r6, r4
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 55                 ldi8	r4, 0x55
 d7 00                 sys	debug_putc
 f0 02 30              ldi8	r2, 0x30
 f9 a9                 or	r5, r2
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f9 e9                 or	r7, r2
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
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
 f9 09                 or	r0, r2
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
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 0b                 ldsp16	r7, [sp+0x2]
 f9 e9                 or	r7, r2
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
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
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
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
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f9 29                 or	r1, r2
 c0 52                 ldi8	r4, 0x52
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
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 f9 69                 or	r3, r2
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 f4 33                 ldsp16	r7, [sp+0xc]
 f9 e9                 or	r7, r2
 c0 52                 ldi8	r4, 0x52
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
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
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
 02                    mov	r4, r6
 d6 14                 adjsp	0x14
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
