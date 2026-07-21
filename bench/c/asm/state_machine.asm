
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/state_machine.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 state_machine.c
00000100 l     O .data	00000080 input
00000180 l     O .data	00000002 state_machine_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000b8 avm_test_main
000002ce g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 b8 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 c0 80                 ldi8	r4, 0x80
 c1 0b                 ldi8	r5, 0xb
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 25                 addi.s8	r5, 0x25
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+13
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 80                 ldi8	r4, 0x80
 f4 40                 stsp16	[sp+0x0], r4
 01                    mov	r4, r5
 f1 0d                 mov	r1, r5
 f4 49                 stsp16	[sp+0x2], r5
 c7 00 01              ldi16	r7, 0x100
 f0 30 00              ldsp16	r0, [sp+0x0]
 f7 1e                 ld8u	r6, [r7+]
 f1 71                 zext8	r1
 f0 0d 02              cmpi.s8	r1, 0x2
 d9 1a                 brsge8	avm_test_main+76
 f4 a1                 tst8	r1
 d0 40                 breq8	avm_test_main+118
 f0 0d 01              cmpi.s8	r1, 0x1
 d1 2c                 brne8	avm_test_main+103
 f0 03 a0              ldi8	r3, 0xa0
 f2 39                 sub	r1, r1
 f0 02 03              ldi8	r2, 0x3
 f5 1e                 cmp	r3, r6
 fc 0a                 cmov.ult	r1, r2
 fa 53                 lsl16i	r6, 0x3
 a2                    xor	r4, r6
 d4 48                 jmp8	avm_test_main+148
 f0 0d 02              cmpi.s8	r1, 0x2
 d0 32                 breq8	avm_test_main+131
 f0 0d 03              cmpi.s8	r1, 0x3
 d1 11                 brne8	avm_test_main+103
 f0 01 04              ldi8	r1, 0x4
 f2 42                 sub	r2, r2
 f4 a6                 tst8	r6
 fb 0a                 cmov.eq	r1, r2
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 fa 31                 lsl16i	r4, 0x1
 92                    or	r4, r6
 d4 2d                 jmp8	avm_test_main+148
 06                    mov	r5, r6
 fa 85                 lsr16i	r5, 0x5
 f0 01 03              ldi8	r1, 0x3
 f9 34                 and	r1, r5
 c1 05                 ldi8	r5, 0x5
 f3 19                 mulu8.w	r6, r5
 12                    add	r4, r6
 d4 1e                 jmp8	avm_test_main+148
 12                    add	r4, r6
 f0 03 01              ldi8	r3, 0x1
 f9 78                 and	r3, r6
 f0 01 02              ldi8	r1, 0x2
 f2 3b                 sub	r1, r3
 d4 11                 jmp8	avm_test_main+148
 f0 02 30              ldi8	r2, 0x30
 f9 58                 and	r2, r6
 f0 01 01              ldi8	r1, 0x1
 f0 03 04              ldi8	r3, 0x4
 f0 0e 30              cmpi.s8	r2, 0x30
 fb 0b                 cmov.eq	r1, r3
 22                    sub	r4, r6
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 8f                 brne8	avm_test_main+41
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 09                    mov	r6, r5
 f1 76                 zext8	r6
 ce 40                 cmpi.s8	r6, 0x40
 db 7b ff              brne16	avm_test_main+33
 f1 71                 zext8	r1
 f9 86                 xor	r4, r1
 f0 5c 80 01           stm16	[0x180], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+183
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
