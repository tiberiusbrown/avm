;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Interpreter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ; ------------------------------------------------------------
;; ; Native dispatch and interpreter state
;; ; ------------------------------------------------------------
;; 
;; AVR r0-r1      Native MUL result
;;                Dispatch table offset
;;                General temporary scratch
;; 
;; AVR r2         Permanent zero
;;                SPI dummy-transmit byte
;; 
;; AVR r3         Interpreter scratch
;; 
;; AVR r4         Interpreter scratch
;; 
;; AVR r5         AVM FLAGS
;; 
;; AVR r6         Current bytecode opcode
;;                Operand or secondary-opcode scratch
;; 
;; AVR r7         Constant
;;                Dispatch-slot stride in AVR words
;; 
;; ; ------------------------------------------------------------
;; ; AVM general-purpose register file
;; ; ------------------------------------------------------------
;; 
;; AVR r8-r9      AVM r0
;; AVR r10-r11    AVM r1
;; AVR r12-r13    AVM r2
;; AVR r14-r15    AVM r3
;; 
;; AVR r16-r17    AVM r4 = c0
;; AVR r18-r19    AVM r5 = c1
;; AVR r20-r21    AVM r6 = c2
;; AVR r22-r23    AVM r7 = c3
;; 
;; ; ------------------------------------------------------------
;; ; Addressing and dispatch
;; ; ------------------------------------------------------------
;; 
;; AVR r24-r25    AVM PC
;; 
;; AVR r26-r27    X
;;                General interpreter address scratch
;; 
;; AVR r28-r29    Y
;;                AVM SP
;; 
;; AVR r30-r31    Z
;;                Dispatch target
;;                Secondary-table target
;;                General address scratch
;; 
;; ; ------------------------------------------------------------
;; ; Persistent bank state
;; ; ------------------------------------------------------------
;; 
;; GPIOR1         CB
;; GPIOR2         PB

#define DISPATCH_ORG             0x0200
#define DISPATCH_SLOT_LOG2       6
#define DISPATCH_STRIDE_WORDS    (1 << (DISPATCH_SLOT_LOG2 - 1))
#define C_DISPATCH_STRIDE_WORDS  r7

#define ZERO r2

#define VM_FLAGS r5

#define VM_CB GPIOR1
#define VM_PB GPIOR2

#define VM_PC  r24
#define VM_PCL r24
#define VM_PCH r25

#define VM_SP_INITIAL_VALUE 0x0A00
#define VM_SP  r28
#define VM_SPL r28
#define VM_SPH r29

#define VM_R0  r8
#define VM_R1  r10
#define VM_R2  r12
#define VM_R3  r14
#define VM_R4  r16
#define VM_R5  r18
#define VM_R6  r20
#define VM_R7  r22

#define VM_R0L  r8
#define VM_R1L  r10
#define VM_R2L  r12
#define VM_R3L  r14
#define VM_R4L  r16
#define VM_R5L  r18
#define VM_R6L  r20
#define VM_R7L  r22

#define VM_R0H  r9
#define VM_R1H  r11
#define VM_R2H  r13
#define VM_R3H  r15
#define VM_R4H  r17
#define VM_R5H  r19
#define VM_R6H  r21
#define VM_R7H  r23

#define VM_C0  VM_R4
#define VM_C1  VM_R5
#define VM_C2  VM_R6
#define VM_C3  VM_R7

#define VM_C0L  VM_R4L
#define VM_C1L  VM_R5L
#define VM_C2L  VM_R6L
#define VM_C3L  VM_R7L

#define VM_C0H  VM_R4H
#define VM_C1H  VM_R5H
#define VM_C2H  VM_R6H
#define VM_C3H  VM_R7H

#include "32u4.h"

#if (DISPATCH_ORG & 0xFF) != 0
#error "Dispatch calculation requires lo8(DISPATCH_ORG) == 0x00"
#endif

.section .text,"ax",@progbits
.org 0x0000
.global __vectors

; ATmega32U4 interrupt vector table.
; Each vector is one 32-bit JMP instruction. The table contains the reset
; vector followed by the device interrupt vectors, including reserved slots,
; in datasheet order.
__vectors:
    jmp reset_handler       ;  0 RESET
    jmp default_isr         ;  1 INT0
    jmp default_isr         ;  2 INT1
    jmp default_isr         ;  3 INT2
    jmp default_isr         ;  4 INT3
    jmp default_isr         ;  5 RESERVED
    jmp default_isr         ;  6 RESERVED
    jmp default_isr         ;  7 INT6
    jmp default_isr         ;  8 RESERVED
    jmp default_isr         ;  9 PCINT0
    jmp default_isr         ; 10 USB GENERAL
    jmp default_isr         ; 11 USB ENDPOINT
    jmp default_isr         ; 12 WDT
    jmp default_isr         ; 13 RESERVED
    jmp default_isr         ; 14 RESERVED
    jmp default_isr         ; 15 RESERVED
    jmp default_isr         ; 16 TIMER1 CAPTURE
    jmp default_isr         ; 17 TIMER1 COMPA
    jmp default_isr         ; 18 TIMER1 COMPB
    jmp default_isr         ; 19 TIMER1 COMPC
    jmp default_isr         ; 20 TIMER1 OVERFLOW
    jmp default_isr         ; 21 TIMER0 COMPA
    jmp default_isr         ; 22 TIMER0 COMPB
    jmp default_isr         ; 23 TIMER0 OVERFLOW
    jmp default_isr         ; 24 SPI
    jmp default_isr         ; 25 USART1 RX
    jmp default_isr         ; 26 USART1 UDRE
    jmp default_isr         ; 27 USART1 TX
    jmp default_isr         ; 28 ANALOG COMPARATOR
    jmp default_isr         ; 29 ADC
    jmp default_isr         ; 30 EEPROM READY
    jmp default_isr         ; 31 TIMER3 CAPTURE
    jmp default_isr         ; 32 TIMER3 COMPA
    jmp default_isr         ; 33 TIMER3 COMPB
    jmp default_isr         ; 34 TIMER3 COMPC
    jmp default_isr         ; 35 TIMER3 OVERFLOW
    jmp default_isr         ; 36 TWI
    jmp default_isr         ; 37 SPM READY
    jmp default_isr         ; 38 TIMER4 COMPA
    jmp default_isr         ; 39 TIMER4 COMPB
    jmp default_isr         ; 40 TIMER4 COMPD
    jmp default_isr         ; 41 TIMER4 OVERFLOW
    jmp default_isr         ; 42 TIMER4 FPF

.size __vectors, .-__vectors

default_isr:
    rjmp default_isr

reset_handler:

    ; Initialize registers for VM
    clr  ZERO
    ldi  r26, DISPATCH_STRIDE_WORDS
    mov  C_DISPATCH_STRIDE_WORDS, r26
    ldi  VM_SPL, lo8(VM_SP_INITIAL_VALUE)
    ldi  VM_SPH, hi8(VM_SP_INITIAL_VALUE)
    clr  VM_FLAGS
    out  VM_CB, ZERO
    out  VM_PB, ZERO

    ; Initialize SPI.
    ; Bytecode streaming uses fixed timing rather than polling SPIF.
    ; SPIE must remain clear. ISRs must not access SPI.


    ; Dispatch always runs with interrupts enabled
    sei

reset_loop:
    rjmp reset_loop

; 18-cycle cadence, needs 8 cycles from start of instruction
.macro dispatch
    in   r6, SPDR
    out  SPDR, ZERO
    adiw VM_PC, 1
    mul  r6, C_DISPATCH_STRIDE_WORDS
    movw r30, r0
    subi r31, hi8(-(DISPATCH_ORG))
    ijmp
.endm

; 17-cycle cadence but needs 5 cycles from start of instruction
.macro dispatch_reverse
    adiw VM_PC, 1
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei
    mul  r6, C_DISPATCH_STRIDE_WORDS
    movw r30, r0
    subi r31, hi8(-(DISPATCH_ORG))
    ijmp
.endm

.macro handler_begin opcode, label
    .org (((\opcode) << DISPATCH_SLOT_LOG2) + DISPATCH_ORG)
\label:
.endm

.macro handler_end opcode
    .org ((((\opcode) + 1) << DISPATCH_SLOT_LOG2) + DISPATCH_ORG)
.endm

.macro delay_1
    nop
.endm

.macro delay_2
    .word 0xC000   ; rjmp .+0
.endm

.macro delay_3
    lpm
.endm

.macro delay_4
    delay_2
    delay_2
.endm

.org DISPATCH_ORG
.global abvm_interp
abvm_interp:

.macro emit_mov_or_clr opcode, label, dst, dstl, dsth, src, same=0
    handler_begin \opcode, \label
    .if \same
        delay_3
        clr  \dstl
        clr  \dsth
    .else
        delay_4
        movw \dst, \src
    .endif
    dispatch_reverse
    handler_end \opcode
.endm

emit_mov_or_clr 0x00, I_00__CLR_c0,     VM_C0, VM_C0L, VM_C0H, VM_C0, 1
emit_mov_or_clr 0x01, I_01__MOV_c0_c1,  VM_C0, VM_C0L, VM_C0H, VM_C1
emit_mov_or_clr 0x02, I_02__MOV_c0_c2,  VM_C0, VM_C0L, VM_C0H, VM_C2
emit_mov_or_clr 0x03, I_03__MOV_c0_c3,  VM_C0, VM_C0L, VM_C0H, VM_C3

emit_mov_or_clr 0x04, I_04__MOV_c1_c0,  VM_C1, VM_C1L, VM_C1H, VM_C0
emit_mov_or_clr 0x05, I_05__CLR_c1,     VM_C1, VM_C1L, VM_C1H, VM_C1, 1
emit_mov_or_clr 0x06, I_06__MOV_c1_c2,  VM_C1, VM_C1L, VM_C1H, VM_C2
emit_mov_or_clr 0x07, I_07__MOV_c1_c3,  VM_C1, VM_C1L, VM_C1H, VM_C3

emit_mov_or_clr 0x08, I_08__MOV_c2_c0,  VM_C2, VM_C2L, VM_C2H, VM_C0
emit_mov_or_clr 0x09, I_09__MOV_c2_c1,  VM_C2, VM_C2L, VM_C2H, VM_C1
emit_mov_or_clr 0x0A, I_0A__CLR_c2,     VM_C2, VM_C2L, VM_C2H, VM_C2, 1
emit_mov_or_clr 0x0B, I_0B__MOV_c2_c3,  VM_C2, VM_C2L, VM_C2H, VM_C3

emit_mov_or_clr 0x0C, I_0C__MOV_c3_c0,  VM_C3, VM_C3L, VM_C3H, VM_C0
emit_mov_or_clr 0x0D, I_0D__MOV_c3_c1,  VM_C3, VM_C3L, VM_C3H, VM_C1
emit_mov_or_clr 0x0E, I_0E__MOV_c3_c2,  VM_C3, VM_C3L, VM_C3H, VM_C2
emit_mov_or_clr 0x0F, I_0F__CLR_c3,     VM_C3, VM_C3L, VM_C3H, VM_C3, 1

.macro emit_ld8 opcode, label, dstl, dsth, src
    handler_begin \opcode, \label
    delay_1
    movw r26, \src
    ld   \dstl, X
    clr  \dsth
    dispatch_reverse
    handler_end \opcode
.endm

emit_ld8 0x10, I_10__LD8_c0_c0, VM_C0L, VM_C0H, VM_C0
emit_ld8 0x11, I_11__LD8_c0_c1, VM_C0L, VM_C0H, VM_C1
emit_ld8 0x12, I_12__LD8_c0_c2, VM_C0L, VM_C0H, VM_C2
emit_ld8 0x13, I_13__LD8_c0_c3, VM_C0L, VM_C0H, VM_C3

emit_ld8 0x14, I_14__LD8_c1_c0, VM_C1L, VM_C1H, VM_C0
emit_ld8 0x15, I_15__LD8_c1_c1, VM_C1L, VM_C1H, VM_C1
emit_ld8 0x16, I_16__LD8_c1_c2, VM_C1L, VM_C1H, VM_C2
emit_ld8 0x17, I_17__LD8_c1_c3, VM_C1L, VM_C1H, VM_C3

emit_ld8 0x18, I_18__LD8_c2_c0, VM_C2L, VM_C2H, VM_C0
emit_ld8 0x19, I_19__LD8_c2_c1, VM_C2L, VM_C2H, VM_C1
emit_ld8 0x1A, I_1A__LD8_c2_c2, VM_C2L, VM_C2H, VM_C2
emit_ld8 0x1B, I_1B__LD8_c2_c3, VM_C2L, VM_C2H, VM_C3

emit_ld8 0x1C, I_1C__LD8_c3_c0, VM_C3L, VM_C3H, VM_C0
emit_ld8 0x1D, I_1D__LD8_c3_c1, VM_C3L, VM_C3H, VM_C1
emit_ld8 0x1E, I_1E__LD8_c3_c2, VM_C3L, VM_C3H, VM_C2
emit_ld8 0x1F, I_1F__LD8_c3_c3, VM_C3L, VM_C3H, VM_C3

.macro emit_st8 opcode, label, dst, srcl
    handler_begin \opcode, \label
    delay_2
    movw r26, \dst
    st   X, \srcl
    dispatch_reverse
    handler_end \opcode
.endm

emit_st8 0x20, I_20__ST8_c0_c0, VM_C0, VM_C0L
emit_st8 0x21, I_21__ST8_c0_c1, VM_C0, VM_C1L
emit_st8 0x22, I_22__ST8_c0_c2, VM_C0, VM_C2L
emit_st8 0x23, I_23__ST8_c0_c3, VM_C0, VM_C3L

emit_st8 0x24, I_24__ST8_c1_c0, VM_C1, VM_C0L
emit_st8 0x25, I_25__ST8_c1_c1, VM_C1, VM_C1L
emit_st8 0x26, I_26__ST8_c1_c2, VM_C1, VM_C2L
emit_st8 0x27, I_27__ST8_c1_c3, VM_C1, VM_C3L

emit_st8 0x28, I_28__ST8_c2_c0, VM_C2, VM_C0L
emit_st8 0x29, I_29__ST8_c2_c1, VM_C2, VM_C1L
emit_st8 0x2A, I_2A__ST8_c2_c2, VM_C2, VM_C2L
emit_st8 0x2B, I_2B__ST8_c2_c3, VM_C2, VM_C3L

emit_st8 0x2C, I_2C__ST8_c3_c0, VM_C3, VM_C0L
emit_st8 0x2D, I_2D__ST8_c3_c1, VM_C3, VM_C1L
emit_st8 0x2E, I_2E__ST8_c3_c2, VM_C3, VM_C2L
emit_st8 0x2F, I_2F__ST8_c3_c3, VM_C3, VM_C3L

.macro emit_ld16 opcode, label, dstl, dsth, src
    handler_begin \opcode, \label
    movw r26, \src
    ld   \dstl, X+
    ld   \dsth, X
    dispatch_reverse
    handler_end \opcode
.endm

emit_ld16 0x30, I_30__LD16_c0_c0, VM_C0L, VM_C0H, VM_C0
emit_ld16 0x31, I_31__LD16_c0_c1, VM_C0L, VM_C0H, VM_C1
emit_ld16 0x32, I_32__LD16_c0_c2, VM_C0L, VM_C0H, VM_C2
emit_ld16 0x33, I_33__LD16_c0_c3, VM_C0L, VM_C0H, VM_C3

emit_ld16 0x34, I_34__LD16_c1_c0, VM_C1L, VM_C1H, VM_C0
emit_ld16 0x35, I_35__LD16_c1_c1, VM_C1L, VM_C1H, VM_C1
emit_ld16 0x36, I_36__LD16_c1_c2, VM_C1L, VM_C1H, VM_C2
emit_ld16 0x37, I_37__LD16_c1_c3, VM_C1L, VM_C1H, VM_C3

emit_ld16 0x38, I_38__LD16_c2_c0, VM_C2L, VM_C2H, VM_C0
emit_ld16 0x39, I_39__LD16_c2_c1, VM_C2L, VM_C2H, VM_C1
emit_ld16 0x3A, I_3A__LD16_c2_c2, VM_C2L, VM_C2H, VM_C2
emit_ld16 0x3B, I_3B__LD16_c2_c3, VM_C2L, VM_C2H, VM_C3

emit_ld16 0x3C, I_3C__LD16_c3_c0, VM_C3L, VM_C3H, VM_C0
emit_ld16 0x3D, I_3D__LD16_c3_c1, VM_C3L, VM_C3H, VM_C1
emit_ld16 0x3E, I_3E__LD16_c3_c2, VM_C3L, VM_C3H, VM_C2
emit_ld16 0x3F, I_3F__LD16_c3_c3, VM_C3L, VM_C3H, VM_C3

.macro emit_st16 opcode, label, dst, srcl, srch
    handler_begin \opcode, \label
    movw r26, \dst
    st   X+, \srcl
    st   X, \srch
    dispatch_reverse
    handler_end \opcode
.endm

emit_st16 0x40, I_40__ST16_c0_c0, VM_C0, VM_C0L, VM_C0H
emit_st16 0x41, I_41__ST16_c0_c1, VM_C0, VM_C1L, VM_C1H
emit_st16 0x42, I_42__ST16_c0_c2, VM_C0, VM_C2L, VM_C2H
emit_st16 0x43, I_43__ST16_c0_c3, VM_C0, VM_C3L, VM_C3H

emit_st16 0x44, I_44__ST16_c1_c0, VM_C1, VM_C0L, VM_C0H
emit_st16 0x45, I_45__ST16_c1_c1, VM_C1, VM_C1L, VM_C1H
emit_st16 0x46, I_46__ST16_c1_c2, VM_C1, VM_C2L, VM_C2H
emit_st16 0x47, I_47__ST16_c1_c3, VM_C1, VM_C3L, VM_C3H

emit_st16 0x48, I_48__ST16_c2_c0, VM_C2, VM_C0L, VM_C0H
emit_st16 0x49, I_49__ST16_c2_c1, VM_C2, VM_C1L, VM_C1H
emit_st16 0x4A, I_4A__ST16_c2_c2, VM_C2, VM_C2L, VM_C2H
emit_st16 0x4B, I_4B__ST16_c2_c3, VM_C2, VM_C3L, VM_C3H

emit_st16 0x4C, I_4C__ST16_c3_c0, VM_C3, VM_C0L, VM_C0H
emit_st16 0x4D, I_4D__ST16_c3_c1, VM_C3, VM_C1L, VM_C1H
emit_st16 0x4E, I_4E__ST16_c3_c2, VM_C3, VM_C2L, VM_C2H
emit_st16 0x4F, I_4F__ST16_c3_c3, VM_C3, VM_C3L, VM_C3H

.macro emit_ld8_post opcode, label, dstl, dsth, src, imm=0
    handler_begin \opcode, \label
    .if \imm
        delay_3
        ldi  \dstl, lo8(1)
        ldi  \dsth, hi8(1)
    .else
        movw r26, \src
        ld   \dstl, X+
        clr  \dsth
        movw \src, r26
    .endif
    dispatch_reverse
    handler_end \opcode
.endm

emit_ld8_post 0x50, I_50__LDI1_c0,        VM_C0L, VM_C0H, VM_C0, 1
emit_ld8_post 0x51, I_51__LD8_POST_c0_c1, VM_C0L, VM_C0H, VM_C1
emit_ld8_post 0x52, I_52__LD8_POST_c0_c2, VM_C0L, VM_C0H, VM_C2
emit_ld8_post 0x53, I_53__LD8_POST_c0_c3, VM_C0L, VM_C0H, VM_C3

emit_ld8_post 0x54, I_54__LD8_POST_c1_c0, VM_C1L, VM_C1H, VM_C0
emit_ld8_post 0x55, I_55__LDI1_c1,        VM_C1L, VM_C1H, VM_C1, 1
emit_ld8_post 0x56, I_56__LD8_POST_c1_c2, VM_C1L, VM_C1H, VM_C2
emit_ld8_post 0x57, I_57__LD8_POST_c1_c3, VM_C1L, VM_C1H, VM_C3

emit_ld8_post 0x58, I_58__LD8_POST_c2_c0, VM_C2L, VM_C2H, VM_C0
emit_ld8_post 0x59, I_59__LD8_POST_c2_c1, VM_C2L, VM_C2H, VM_C1
emit_ld8_post 0x5A, I_5A__LDI1_c2,        VM_C2L, VM_C2H, VM_C2, 1
emit_ld8_post 0x5B, I_5B__LD8_POST_c2_c3, VM_C2L, VM_C2H, VM_C3

emit_ld8_post 0x5C, I_5C__LD8_POST_c3_c0, VM_C3L, VM_C3H, VM_C0
emit_ld8_post 0x5D, I_5D__LD8_POST_c3_c1, VM_C3L, VM_C3H, VM_C1
emit_ld8_post 0x5E, I_5E__LD8_POST_c3_c2, VM_C3L, VM_C3H, VM_C2
emit_ld8_post 0x5F, I_5F__LDI1_c3,        VM_C3L, VM_C3H, VM_C3, 1

.macro emit_st8_post opcode, label, dst, srcl
    handler_begin \opcode, \label
    delay_1
    movw r26, \dst
    st   X+, \srcl
    movw \dst, r26
    dispatch_reverse
    handler_end \opcode
.endm

emit_st8_post 0x60, I_60__ST8_POST_c0_c0, VM_C0, VM_C0L
emit_st8_post 0x61, I_61__ST8_POST_c0_c1, VM_C0, VM_C1L
emit_st8_post 0x62, I_62__ST8_POST_c0_c2, VM_C0, VM_C2L
emit_st8_post 0x63, I_63__ST8_POST_c0_c3, VM_C0, VM_C3L

emit_st8_post 0x64, I_64__ST8_POST_c1_c0, VM_C1, VM_C0L
emit_st8_post 0x65, I_65__ST8_POST_c1_c1, VM_C1, VM_C1L
emit_st8_post 0x66, I_66__ST8_POST_c1_c2, VM_C1, VM_C2L
emit_st8_post 0x67, I_67__ST8_POST_c1_c3, VM_C1, VM_C3L

emit_st8_post 0x68, I_68__ST8_POST_c2_c0, VM_C2, VM_C0L
emit_st8_post 0x69, I_69__ST8_POST_c2_c1, VM_C2, VM_C1L
emit_st8_post 0x6A, I_6A__ST8_POST_c2_c2, VM_C2, VM_C2L
emit_st8_post 0x6B, I_6B__ST8_POST_c2_c3, VM_C2, VM_C3L

emit_st8_post 0x6C, I_6C__ST8_POST_c3_c0, VM_C3, VM_C0L
emit_st8_post 0x6D, I_6D__ST8_POST_c3_c1, VM_C3, VM_C1L
emit_st8_post 0x6E, I_6E__ST8_POST_c3_c2, VM_C3, VM_C2L
emit_st8_post 0x6F, I_6F__ST8_POST_c3_c3, VM_C3, VM_C3L

.macro emit_push16 opcode, label, srcl, srch
    handler_begin \opcode, \label
    delay_1
    st   -Y, \srch
    st   -Y, \srcl
    dispatch_reverse
    handler_end \opcode
.endm

.macro emit_pop16 opcode, label, dstl, dsth
    handler_begin \opcode, \label
    delay_1
    ld   \dstl, Y+
    ld   \dsth, Y+
    dispatch_reverse
    handler_end \opcode
.endm

emit_push16 0x70, I_70__PUSH16_r0, VM_R0L, VM_R0H
emit_push16 0x71, I_71__PUSH16_r1, VM_R1L, VM_R1H
emit_push16 0x72, I_72__PUSH16_r2, VM_R2L, VM_R2H
emit_push16 0x73, I_73__PUSH16_r3, VM_R3L, VM_R3H
emit_push16 0x74, I_74__PUSH16_r4, VM_R4L, VM_R4H
emit_push16 0x75, I_75__PUSH16_r5, VM_R5L, VM_R5H
emit_push16 0x76, I_76__PUSH16_r6, VM_R6L, VM_R6H
emit_push16 0x77, I_77__PUSH16_r7, VM_R7L, VM_R7H

emit_pop16 0x78, I_78__POP16_r0, VM_R0L, VM_R0H
emit_pop16 0x79, I_79__POP16_r1, VM_R1L, VM_R1H
emit_pop16 0x7A, I_7A__POP16_r2, VM_R2L, VM_R2H
emit_pop16 0x7B, I_7B__POP16_r3, VM_R3L, VM_R3H
emit_pop16 0x7C, I_7C__POP16_r4, VM_R4L, VM_R4H
emit_pop16 0x7D, I_7D__POP16_r5, VM_R5L, VM_R5H
emit_pop16 0x7E, I_7E__POP16_r6, VM_R6L, VM_R6H
emit_pop16 0x7F, I_7F__POP16_r7, VM_R7L, VM_R7H

.macro emit_add_or_sub opcode, label, lowop, highop, dstl, dsth, srcl, srch
    handler_begin \opcode, \label
    delay_2
    \lowop \dstl, \srcl
    \highop \dsth, \srch
    in   VM_FLAGS, SREG
    dispatch_reverse
    handler_end \opcode
.endm

emit_add_or_sub 0x80, I_80__ADD_c0_c0, add, adc, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_add_or_sub 0x81, I_81__ADD_c0_c1, add, adc, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_add_or_sub 0x82, I_82__ADD_c0_c2, add, adc, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_add_or_sub 0x83, I_83__ADD_c0_c3, add, adc, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_add_or_sub 0x84, I_84__ADD_c1_c0, add, adc, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_add_or_sub 0x85, I_85__ADD_c1_c1, add, adc, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_add_or_sub 0x86, I_86__ADD_c1_c2, add, adc, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_add_or_sub 0x87, I_87__ADD_c1_c3, add, adc, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_add_or_sub 0x88, I_88__ADD_c2_c0, add, adc, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_add_or_sub 0x89, I_89__ADD_c2_c1, add, adc, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_add_or_sub 0x8A, I_8A__ADD_c2_c2, add, adc, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_add_or_sub 0x8B, I_8B__ADD_c2_c3, add, adc, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_add_or_sub 0x8C, I_8C__ADD_c3_c0, add, adc, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_add_or_sub 0x8D, I_8D__ADD_c3_c1, add, adc, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_add_or_sub 0x8E, I_8E__ADD_c3_c2, add, adc, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_add_or_sub 0x8F, I_8F__ADD_c3_c3, add, adc, VM_C3L, VM_C3H, VM_C3L, VM_C3H

emit_add_or_sub 0x90, I_90__SUB_c0_c0, sub, sbc, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_add_or_sub 0x91, I_91__SUB_c0_c1, sub, sbc, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_add_or_sub 0x92, I_92__SUB_c0_c2, sub, sbc, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_add_or_sub 0x93, I_93__SUB_c0_c3, sub, sbc, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_add_or_sub 0x94, I_94__SUB_c1_c0, sub, sbc, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_add_or_sub 0x95, I_95__SUB_c1_c1, sub, sbc, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_add_or_sub 0x96, I_96__SUB_c1_c2, sub, sbc, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_add_or_sub 0x97, I_97__SUB_c1_c3, sub, sbc, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_add_or_sub 0x98, I_98__SUB_c2_c0, sub, sbc, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_add_or_sub 0x99, I_99__SUB_c2_c1, sub, sbc, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_add_or_sub 0x9A, I_9A__SUB_c2_c2, sub, sbc, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_add_or_sub 0x9B, I_9B__SUB_c2_c3, sub, sbc, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_add_or_sub 0x9C, I_9C__SUB_c3_c0, sub, sbc, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_add_or_sub 0x9D, I_9D__SUB_c3_c1, sub, sbc, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_add_or_sub 0x9E, I_9E__SUB_c3_c2, sub, sbc, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_add_or_sub 0x9F, I_9F__SUB_c3_c3, sub, sbc, VM_C3L, VM_C3H, VM_C3L, VM_C3H
