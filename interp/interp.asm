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

#define INSTR_ALIGN 6

#define ZERO          r2
#define C_INSTR_ALIGN r7

#define VM_FLAGS r5

#define VM_PC  r24
#define VM_PCL r24
#define VM_PCH r25

#define VM_SP_INITIAL_VALUE 0x0900
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

#include "device.h"

.section .vectors,"ax",@progbits
.global __vectors
.type __vectors, @function

; ATmega32U4 interrupt vector table.
; Each vector is one 16-bit RJMP instruction.  The table contains the reset
; vector followed by the 31 device interrupt vectors, in datasheet order.
__vectors:
    jmp reset_handler       ;  0 RESET
    jmp default_isr         ;  1 INT0
    jmp default_isr         ;  2 INT1
    jmp default_isr         ;  3 INT2
    jmp default_isr         ;  4 INT3
    jmp default_isr         ;  5 INT6
    jmp default_isr         ;  6 PCINT0
    jmp default_isr         ;  7 USB GENERAL
    jmp default_isr         ;  8 USB ENDPOINT/COM
    jmp default_isr         ;  9 WDT
    jmp default_isr         ; 10 TIMER1 CAPTURE
    jmp default_isr         ; 11 TIMER1 COMPA
    jmp default_isr         ; 12 TIMER1 COMPB
    jmp default_isr         ; 13 TIMER1 COMPC
    jmp default_isr         ; 14 TIMER1 OVERFLOW
    jmp default_isr         ; 15 TIMER0 COMPA
    jmp default_isr         ; 16 TIMER0 COMPB
    jmp default_isr         ; 17 TIMER0 OVERFLOW
    jmp default_isr         ; 18 SPI
    jmp default_isr         ; 19 USART1 RX
    jmp default_isr         ; 20 USART1 UDRE
    jmp default_isr         ; 21 USART1 TX
    jmp default_isr         ; 22 ANALOG COMPARATOR
    jmp default_isr         ; 23 ADC
    jmp default_isr         ; 24 EEPROM READY
    jmp default_isr         ; 25 TIMER3 CAPTURE
    jmp default_isr         ; 26 TIMER3 COMPA
    jmp default_isr         ; 27 TIMER3 COMPB
    jmp default_isr         ; 28 TIMER3 COMPC
    jmp default_isr         ; 29 TIMER3 OVERFLOW
    jmp default_isr         ; 30 TWI
    jmp default_isr         ; 31 SPM READY

.size __vectors, .-__vectors

default_isr:
    rjmp default_isr

reset_handler:
    ; initialize registers for VM
    clr  ZERO
    ldi  r24, (1<<(INSTR_ALIGN-1))
    mov  C_INSTR_ALIGN, r24
    ldi  VM_SPL, lo8(VM_SP_INITIAL_VALUE)
    ldi  VM_SPH, hi8(VM_SP_INITIAL_VALUE)
reset_loop:
    rjmp reset_loop

.section .text
.align 8

; 18-cycle cadence, needs 8 cycles from start of instruction
.macro dispatch
    in   r6, SPDR
    out  SPDR, ZERO
    adiw VM_PC, 1
    mul  r6, C_INSTR_ALIGN
    movw r30, r0
    inc  r30
    ijmp
.endm

; 17-cycle cadence but needs 5 cycles from start of instruction
.macro dispatch_reverse_noalign
    adiw VM_PC, 1
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei
    mul  r6, C_INSTR_ALIGN
    movw r30, r0
    inc  r30
    ijmp
.endm

.macro dispatch_reverse
    dispatch_reverse_noalign
    .align INSTR_ALIGN
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

abvm_interp:

I_00__CLR_c0:
    delay_3
    clr  VM_C0L
    clr  VM_C0H
    dispatch_reverse

I_01__MOV_c0_c1:
    delay_4
    movw VM_C0, VM_C1
    dispatch_reverse

I_02__MOV_c0_c2:
    delay_4
    movw VM_C0, VM_C2
    dispatch_reverse

I_03__MOV_c0_c3:
    delay_4
    movw VM_C0, VM_C3
    dispatch_reverse

I_04__MOV_c1_c0:
    delay_4
    movw VM_C1, VM_C0
    dispatch_reverse

I_05__CLR_c1:
    delay_3
    clr  VM_C1L
    clr  VM_C1H
    dispatch_reverse

I_06__MOV_c1_c2:
    delay_4
    movw VM_C1, VM_C2
    dispatch_reverse

I_07__MOV_c1_c3:
    delay_4
    movw VM_C1, VM_C3
    dispatch_reverse

I_08__MOV_c2_c0:
    delay_4
    movw VM_C2, VM_C0
    dispatch_reverse

I_09__MOV_c2_c1:
    delay_4
    movw VM_C2, VM_C1
    dispatch_reverse

I_0A__CLR_c2:
    delay_3
    clr  VM_C2L
    clr  VM_C2H
    dispatch_reverse

I_0B__MOV_c2_c3:
    delay_4
    movw VM_C2, VM_C3
    dispatch_reverse

I_0C__MOV_c3_c0:
    delay_4
    movw VM_C3, VM_C0
    dispatch_reverse

I_0D__MOV_c3_c1:
    delay_4
    movw VM_C3, VM_C1
    dispatch_reverse

I_0E__MOV_c3_c2:
    delay_4
    movw VM_C3, VM_C2
    dispatch_reverse

I_0F__CLR_c3:
    delay_3
    clr  VM_C3L
    clr  VM_C3H
    dispatch_reverse

I_10__LD8_c0_c0:
    delay_1
    movw r26, VM_C0
    ld   VM_C0L, X
    clr  VM_C0H
    dispatch_reverse

I_11__LD8_c0_c1:
    delay_1
    movw r26, VM_C1
    ld   VM_C0L, X
    clr  VM_C0H
    dispatch_reverse

I_12__LD8_c0_c2:
    delay_1
    movw r26, VM_C2
    ld   VM_C0L, X
    clr  VM_C0H
    dispatch_reverse

I_13__LD8_c0_c3:
    delay_1
    movw r26, VM_C3
    ld   VM_C0L, X
    clr  VM_C0H
    dispatch_reverse

I_14__LD8_c1_c0:
    delay_1
    movw r26, VM_C0
    ld   VM_C1L, X
    clr  VM_C1H
    dispatch_reverse

I_15__LD8_c1_c1:
    delay_1
    movw r26, VM_C1
    ld   VM_C1L, X
    clr  VM_C1H
    dispatch_reverse

I_16__LD8_c1_c2:
    delay_1
    movw r26, VM_C2
    ld   VM_C1L, X
    clr  VM_C1H
    dispatch_reverse

I_17__LD8_c1_c3:
    delay_1
    movw r26, VM_C3
    ld   VM_C1L, X
    clr  VM_C1H
    dispatch_reverse

I_18__LD8_c2_c0:
    delay_1
    movw r26, VM_C0
    ld   VM_C2L, X
    clr  VM_C2H
    dispatch_reverse

I_19__LD8_c2_c1:
    delay_1
    movw r26, VM_C1
    ld   VM_C2L, X
    clr  VM_C2H
    dispatch_reverse

I_1A__LD8_c2_c2:
    delay_1
    movw r26, VM_C2
    ld   VM_C2L, X
    clr  VM_C2H
    dispatch_reverse

I_1B__LD8_c2_c3:
    delay_1
    movw r26, VM_C3
    ld   VM_C2L, X
    clr  VM_C2H
    dispatch_reverse

I_1C__LD8_c3_c0:
    delay_1
    movw r26, VM_C0
    ld   VM_C3L, X
    clr  VM_C3H
    dispatch_reverse

I_1D__LD8_c3_c1:
    delay_1
    movw r26, VM_C1
    ld   VM_C3L, X
    clr  VM_C3H
    dispatch_reverse

I_1E__LD8_c3_c2:
    delay_1
    movw r26, VM_C2
    ld   VM_C3L, X
    clr  VM_C3H
    dispatch_reverse

I_1F__LD8_c3_c3:
    delay_1
    movw r26, VM_C3
    ld   VM_C3L, X
    clr  VM_C3H
    dispatch_reverse

I_20__ST8_c0_c0:
    delay_2
    movw r26, VM_C0
    st   X, VM_C0
    dispatch_reverse

I_21__ST8_c0_c1:
    delay_2
    movw r26, VM_C0
    st   X, VM_C1
    dispatch_reverse

I_22__ST8_c0_c2:
    delay_2
    movw r26, VM_C0
    st   X, VM_C2
    dispatch_reverse

I_23__ST8_c0_c3:
    delay_2
    movw r26, VM_C0
    st   X, VM_C3
    dispatch_reverse

I_24__ST8_c1_c0:
    delay_2
    movw r26, VM_C1
    st   X, VM_C0
    dispatch_reverse

I_25__ST8_c1_c1:
    delay_2
    movw r26, VM_C1
    st   X, VM_C1
    dispatch_reverse

I_26__ST8_c1_c2:
    delay_2
    movw r26, VM_C1
    st   X, VM_C2
    dispatch_reverse

I_27__ST8_c1_c3:
    delay_2
    movw r26, VM_C1
    st   X, VM_C3
    dispatch_reverse

I_28__ST8_c2_c0:
    delay_2
    movw r26, VM_C2
    st   X, VM_C0
    dispatch_reverse

I_29__ST8_c2_c1:
    delay_2
    movw r26, VM_C2
    st   X, VM_C1
    dispatch_reverse

I_2A__ST8_c2_c2:
    delay_2
    movw r26, VM_C2
    st   X, VM_C2
    dispatch_reverse

I_2B__ST8_c2_c3:
    delay_2
    movw r26, VM_C2
    st   X, VM_C3
    dispatch_reverse

I_2C__ST8_c3_c0:
    delay_2
    movw r26, VM_C3
    st   X, VM_C0
    dispatch_reverse

I_2D__ST8_c3_c1:
    delay_2
    movw r26, VM_C3
    st   X, VM_C1
    dispatch_reverse

I_2E__ST8_c3_c2:
    delay_2
    movw r26, VM_C3
    st   X, VM_C2
    dispatch_reverse

I_2F__ST8_c3_c3:
    delay_2
    movw r26, VM_C3
    st   X, VM_C3
    dispatch_reverse

I_30__LD16_c0_c0:
    movw r26, VM_C0
    ld   VM_C0L, X+
    ld   VM_C0H, X
    dispatch_reverse

I_31__LD16_c0_c1:
    movw r26, VM_C1
    ld   VM_C0L, X+
    ld   VM_C0H, X
    dispatch_reverse

I_32__LD16_c0_c2:
    movw r26, VM_C2
    ld   VM_C0L, X+
    ld   VM_C0H, X
    dispatch_reverse

I_33__LD16_c0_c3:
    movw r26, VM_C3
    ld   VM_C0L, X+
    ld   VM_C0H, X
    dispatch_reverse

I_34__LD16_c1_c0:
    movw r26, VM_C0
    ld   VM_C1L, X+
    ld   VM_C1H, X
    dispatch_reverse

I_35__LD16_c1_c1:
    movw r26, VM_C1
    ld   VM_C1L, X+
    ld   VM_C1H, X
    dispatch_reverse

I_36__LD16_c1_c2:
    movw r26, VM_C2
    ld   VM_C1L, X+
    ld   VM_C1H, X
    dispatch_reverse

I_37__LD16_c1_c3:
    movw r26, VM_C3
    ld   VM_C1L, X+
    ld   VM_C1H, X
    dispatch_reverse

I_38__LD16_c2_c0:
    movw r26, VM_C0
    ld   VM_C2L, X+
    ld   VM_C2H, X
    dispatch_reverse

I_39__LD16_c2_c1:
    movw r26, VM_C1
    ld   VM_C2L, X+
    ld   VM_C2H, X
    dispatch_reverse

I_3A__LD16_c2_c2:
    movw r26, VM_C2
    ld   VM_C2L, X+
    ld   VM_C2H, X
    dispatch_reverse

I_3B__LD16_c2_c3:
    movw r26, VM_C3
    ld   VM_C2L, X+
    ld   VM_C2H, X
    dispatch_reverse

I_3C__LD16_c3_c0:
    movw r26, VM_C0
    ld   VM_C3L, X+
    ld   VM_C3H, X
    dispatch_reverse

I_3D__LD16_c3_c1:
    movw r26, VM_C1
    ld   VM_C3L, X+
    ld   VM_C3H, X
    dispatch_reverse

I_3E__LD16_c3_c2:
    movw r26, VM_C2
    ld   VM_C3L, X+
    ld   VM_C3H, X
    dispatch_reverse

I_3F__LD16_c3_c3:
    movw r26, VM_C3
    ld   VM_C3L, X+
    ld   VM_C3H, X
    dispatch_reverse

I_40__ST16_c0_c0:
    movw r26, VM_C0
    st   X+, VM_C0L
    st   X, VM_C0H
    dispatch_reverse

I_41__ST16_c0_c1:
    movw r26, VM_C0
    st   X+, VM_C1L
    st   X, VM_C1H
    dispatch_reverse

I_42__ST16_c0_c2:
    movw r26, VM_C0
    st   X+, VM_C2L
    st   X, VM_C2H
    dispatch_reverse

I_43__ST16_c0_c3:
    movw r26, VM_C0
    st   X+, VM_C3L
    st   X, VM_C3H
    dispatch_reverse

I_44__ST16_c1_c0:
    movw r26, VM_C1
    st   X+, VM_C0L
    st   X, VM_C0H
    dispatch_reverse

I_45__ST16_c1_c1:
    movw r26, VM_C1
    st   X+, VM_C1L
    st   X, VM_C1H
    dispatch_reverse

I_46__ST16_c1_c2:
    movw r26, VM_C1
    st   X+, VM_C2L
    st   X, VM_C2H
    dispatch_reverse

I_47__ST16_c1_c3:
    movw r26, VM_C1
    st   X+, VM_C3L
    st   X, VM_C3H
    dispatch_reverse

I_48__ST16_c2_c0:
    movw r26, VM_C2
    st   X+, VM_C0L
    st   X, VM_C0H
    dispatch_reverse

I_49__ST16_c2_c1:
    movw r26, VM_C2
    st   X+, VM_C1L
    st   X, VM_C1H
    dispatch_reverse

I_4A__ST16_c2_c2:
    movw r26, VM_C2
    st   X+, VM_C2L
    st   X, VM_C2H
    dispatch_reverse

I_4B__ST16_c2_c3:
    movw r26, VM_C2
    st   X+, VM_C3L
    st   X, VM_C3H
    dispatch_reverse

I_4C__ST16_c3_c0:
    movw r26, VM_C3
    st   X+, VM_C0L
    st   X, VM_C0H
    dispatch_reverse

I_4D__ST16_c3_c1:
    movw r26, VM_C3
    st   X+, VM_C1L
    st   X, VM_C1H
    dispatch_reverse

I_4E__ST16_c3_c2:
    movw r26, VM_C3
    st   X+, VM_C2L
    st   X, VM_C2H
    dispatch_reverse

I_4F__ST16_c3_c3:
    movw r26, VM_C3
    st   X+, VM_C3L
    st   X, VM_C3H
    dispatch_reverse

I_50__LDI1_c0:
    delay_3
    ldi  VM_C0L, lo8(1)
    ldi  VM_C0H, hi8(1)
    dispatch_reverse

I_51__LD8_POST_c0_c1:
    movw r26, VM_C0
    ld   VM_C1L, X+
    clr  VM_C1H
    movw VM_C0, r26
    dispatch_reverse

I_52__LD8_POST_c0_c2:
    movw r26, VM_C0
    ld   VM_C2L, X+
    clr  VM_C2H
    movw VM_C0, r26
    dispatch_reverse

I_53__LD8_POST_c0_c3:
    movw r26, VM_C0
    ld   VM_C3L, X+
    clr  VM_C3H
    movw VM_C0, r26
    dispatch_reverse

I_54__LD8_POST_c1_c0:
    movw r26, VM_C1
    ld   VM_C0L, X+
    clr  VM_C0H
    movw VM_C1, r26
    dispatch_reverse

I_55__LDI1_c1:
    delay_3
    ldi  VM_C1L, lo8(1)
    ldi  VM_C1H, hi8(1)
    dispatch_reverse

I_56__LD8_POST_c1_c2:
    movw r26, VM_C1
    ld   VM_C2L, X+
    clr  VM_C2H
    movw VM_C1, r26
    dispatch_reverse

I_57__LD8_POST_c1_c3:
    movw r26, VM_C1
    ld   VM_C3L, X+
    clr  VM_C3H
    movw VM_C1, r26
    dispatch_reverse

I_58__LD8_POST_c2_c0:
    movw r26, VM_C2
    ld   VM_C0L, X+
    clr  VM_C0H
    movw VM_C2, r26
    dispatch_reverse

I_59__LD8_POST_c2_c1:
    movw r26, VM_C2
    ld   VM_C1L, X+
    clr  VM_C1H
    movw VM_C2, r26
    dispatch_reverse

I_5A__LDI1_c2:
    delay_3
    ldi  VM_C2L, lo8(1)
    ldi  VM_C2H, hi8(1)
    dispatch_reverse

I_5B__LD8_POST_c2_c3:
    movw r26, VM_C2
    ld   VM_C3L, X+
    clr  VM_C3H
    movw VM_C2, r26
    dispatch_reverse

I_5C__LD8_POST_c3_c0:
    movw r26, VM_C3
    ld   VM_C0L, X+
    clr  VM_C0H
    movw VM_C3, r26
    dispatch_reverse

I_5D__LD8_POST_c3_c1:
    movw r26, VM_C3
    ld   VM_C1L, X+
    clr  VM_C1H
    movw VM_C3, r26
    dispatch_reverse

I_5E__LD8_POST_c3_c2:
    movw r26, VM_C3
    ld   VM_C2L, X+
    clr  VM_C2H
    movw VM_C3, r26
    dispatch_reverse

I_5F__LDI1_c3:
    delay_3
    ldi  VM_C3L, lo8(1)
    ldi  VM_C3H, hi8(1)
    dispatch_reverse

I_60__ST8_POST_c0_c0:
    delay_1
    movw r26, VM_C0
    st   X+, VM_C0
    movw VM_C0, r26
    dispatch_reverse

I_61__ST8_POST_c0_c1:
    delay_1
    movw r26, VM_C0
    st   X+, VM_C1
    movw VM_C0, r26
    dispatch_reverse

I_62__ST8_POST_c0_c2:
    delay_1
    movw r26, VM_C0
    st   X+, VM_C2
    movw VM_C0, r26
    dispatch_reverse

I_63__ST8_POST_c0_c3:
    delay_1
    movw r26, VM_C0
    st   X+, VM_C3
    movw VM_C0, r26
    dispatch_reverse

I_64__ST8_POST_c1_c0:
    delay_1
    movw r26, VM_C1
    st   X+, VM_C0
    movw VM_C1, r26
    dispatch_reverse

I_65__ST8_POST_c1_c1:
    delay_1
    movw r26, VM_C1
    st   X+, VM_C1
    movw VM_C1, r26
    dispatch_reverse

I_66__ST8_POST_c1_c2:
    delay_1
    movw r26, VM_C1
    st   X+, VM_C2
    movw VM_C1, r26
    dispatch_reverse

I_67__ST8_POST_c1_c3:
    delay_1
    movw r26, VM_C1
    st   X+, VM_C3
    movw VM_C1, r26
    dispatch_reverse

I_68__ST8_POST_c2_c0:
    delay_1
    movw r26, VM_C2
    st   X+, VM_C0
    movw VM_C2, r26
    dispatch_reverse

I_69__ST8_POST_c2_c1:
    delay_1
    movw r26, VM_C2
    st   X+, VM_C1
    movw VM_C2, r26
    dispatch_reverse

I_6A__ST8_POST_c2_c2:
    delay_1
    movw r26, VM_C2
    st   X+, VM_C2
    movw VM_C2, r26
    dispatch_reverse

I_6B__ST8_POST_c2_c3:
    delay_1
    movw r26, VM_C2
    st   X+, VM_C3
    movw VM_C2, r26
    dispatch_reverse

I_6C__ST8_POST_c3_c0:
    delay_1
    movw r26, VM_C3
    st   X+, VM_C0
    movw VM_C3, r26
    dispatch_reverse

I_6D__ST8_POST_c3_c1:
    delay_1
    movw r26, VM_C3
    st   X+, VM_C1
    movw VM_C3, r26
    dispatch_reverse

I_6E__ST8_POST_c3_c2:
    delay_1
    movw r26, VM_C3
    st   X+, VM_C2
    movw VM_C3, r26
    dispatch_reverse

I_6F__ST8_POST_c3_c3:
    delay_1
    movw r26, VM_C3
    st   X+, VM_C3
    movw VM_C3, r26
    dispatch_reverse

I_70__PUSH16_r0:
    delay_1
    st   -Y, VM_R0H
    st   -Y, VM_R0L
    dispatch_reverse

I_71__PUSH16_r1:
    delay_1
    st   -Y, VM_R1H
    st   -Y, VM_R1L
    dispatch_reverse

I_72__PUSH16_r2:
    delay_1
    st   -Y, VM_R2H
    st   -Y, VM_R2L
    dispatch_reverse

I_73__PUSH16_r3:
    delay_1
    st   -Y, VM_R3H
    st   -Y, VM_R3L
    dispatch_reverse

I_74__PUSH16_r4:
    delay_1
    st   -Y, VM_R4H
    st   -Y, VM_R4L
    dispatch_reverse

I_75__PUSH16_r5:
    delay_1
    st   -Y, VM_R5H
    st   -Y, VM_R5L
    dispatch_reverse

I_76__PUSH16_r6:
    delay_1
    st   -Y, VM_R6H
    st   -Y, VM_R6L
    dispatch_reverse

I_77__PUSH16_r7:
    delay_1
    st   -Y, VM_R7H
    st   -Y, VM_R7L
    dispatch_reverse

I_78__POP16_r0:
    delay_1
    ld   VM_R0L, Y+
    ld   VM_R0H, Y+
    dispatch_reverse

I_79__POP16_r1:
    delay_1
    ld   VM_R1L, Y+
    ld   VM_R1H, Y+
    dispatch_reverse

I_7A__POP16_r2:
    delay_1
    ld   VM_R2L, Y+
    ld   VM_R2H, Y+
    dispatch_reverse

I_7B__POP16_r3:
    delay_1
    ld   VM_R3L, Y+
    ld   VM_R3H, Y+
    dispatch_reverse

I_7C__POP16_r4:
    delay_1
    ld   VM_R4L, Y+
    ld   VM_R4H, Y+
    dispatch_reverse

I_7D__POP16_r5:
    delay_1
    ld   VM_R5L, Y+
    ld   VM_R5H, Y+
    dispatch_reverse

I_7E__POP16_r6:
    delay_1
    ld   VM_R6L, Y+
    ld   VM_R6H, Y+
    dispatch_reverse

I_7F__POP16_r7:
    delay_1
    ld   VM_R7L, Y+
    ld   VM_R7H, Y+
    dispatch_reverse

I_80__ADD_c0_c0:
    delay_2
    add  VM_C0L, VM_C0L
    adc  VM_C0H, VM_C0H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_81__ADD_c0_c1:
    delay_2
    add  VM_C0L, VM_C1L
    adc  VM_C0H, VM_C1H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_82__ADD_c0_c2:
    delay_2
    add  VM_C0L, VM_C2L
    adc  VM_C0H, VM_C2H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_83__ADD_c0_c3:
    delay_2
    add  VM_C0L, VM_C3L
    adc  VM_C0H, VM_C3H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_84__ADD_c1_c0:
    delay_2
    add  VM_C1L, VM_C0L
    adc  VM_C1H, VM_C0H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_85__ADD_c1_c1:
    delay_2
    add  VM_C1L, VM_C1L
    adc  VM_C1H, VM_C1H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_86__ADD_c1_c2:
    delay_2
    add  VM_C1L, VM_C2L
    adc  VM_C1H, VM_C2H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_87__ADD_c1_c3:
    delay_2
    add  VM_C1L, VM_C3L
    adc  VM_C1H, VM_C3H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_88__ADD_c2_c0:
    delay_2
    add  VM_C2L, VM_C0L
    adc  VM_C2H, VM_C0H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_89__ADD_c2_c1:
    delay_2
    add  VM_C2L, VM_C1L
    adc  VM_C2H, VM_C1H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_8A__ADD_c2_c2:
    delay_2
    add  VM_C2L, VM_C2L
    adc  VM_C2H, VM_C2H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_8B__ADD_c2_c3:
    delay_2
    add  VM_C2L, VM_C3L
    adc  VM_C2H, VM_C3H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_8C__ADD_c3_c0:
    delay_2
    add  VM_C3L, VM_C0L
    adc  VM_C3H, VM_C0H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_8D__ADD_c3_c1:
    delay_2
    add  VM_C3L, VM_C1L
    adc  VM_C3H, VM_C1H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_8E__ADD_c3_c2:
    delay_2
    add  VM_C3L, VM_C2L
    adc  VM_C3H, VM_C2H
    in   VM_FLAGS, SREG
    dispatch_reverse

I_8F__ADD_c3_c3:
    delay_2
    add  VM_C3L, VM_C3L
    adc  VM_C3H, VM_C3H
    in   VM_FLAGS, SREG
    dispatch_reverse
