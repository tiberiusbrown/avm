<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 c0 80                 ldi8	r4, 0x80
 c1 11                 ldi8	r5, 0x11
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 1d                 addi.s8	r5, 0x1d
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+9
 c6 ff ff              ldi16	r6, 0xffff
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f1 08                 mov	r1, r0
 f1 2c                 mov	r7, r0
 c5 00 01              ldi16	r5, 0x100
 17                    add	r5, r7
 45                    ld8u	r5, [r5]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 a1                    xor	r4, r5
 10                    add	r4, r4
 c5 90 01              ldi16	r5, 0x190
 14                    add	r5, r4
 61                    ld16	r4, [r5]
 fa 58                 lsl16i	r6, 0x8
 a8                    xor	r6, r4
 f4 af                 inc16	r7
 c0 80                 ldi8	r4, 0x80
 3c                    cmp	r7, r4
 d1 e7                 brne8	avm_test_main+30
 f4 a9                 inc16	r1
 f1 2d                 mov	r7, r1
 f1 77                 zext8	r7
 cf 08                 cmpi.s8	r7, 0x8
 d1 db                 brne8	avm_test_main+28
 f0 5e 80 01           stm16	[0x180], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

