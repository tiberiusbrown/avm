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

#define VM_PC  r24
#define VM_PCL r24
#define VM_PCH r25

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
    clr  ZERO
    ldi  r24, (1<<(INSTR_ALIGN-1))
    mov  C_INSTR_ALIGN, r24
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
