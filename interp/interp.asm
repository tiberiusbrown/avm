;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Interpreter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; SRAM:
;;     0x0100–0x04FF  globals
;;     0x0500–0x08FF  framebuffer
;;     0x0900–0x09FF  VM stack
;;     0x0A00-0x0A03  FX image/save page
;;     0x0A04-0x0A05  requested save size
;;     0x0A06         startup flags
;;     0x0A07–0x0AFF  interpreter-private

#define data_globals    0x0100
#define data_display    0x0500
#define data_stack      0x0900
#define data_page_data      0x0A00
#define data_page_save      (data_page_data+2)
#define data_save_size      (data_page_save+2)
#define data_startup_flags  (data_save_size+2)

#define STARTUP_SAVE_PAGE_VALID  0

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
;; AVR r3         AVM FLAGS
;; 
;; AVR r4         Interpreter scratch
;; 
;; AVR r5         Interpreter scratch
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
#define DISPATCH_STRIDE_WORDS    16
#define DISPATCH_STRIDE_BYTES    (2 * (DISPATCH_STRIDE_WORDS))
#define C_DISPATCH_STRIDE_WORDS  r7

#define ZERO r2

#define VM_FLAGS r3

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

#define __SFR_OFFSET 0
#include <avr/io.h>
#ifndef SREG_C
#  define SREG_C  (0)
#endif
#ifndef SREG_Z
#  define SREG_Z  (1)
#endif
#ifndef SREG_N
#  define SREG_N  (2)
#endif
#ifndef SREG_V
#  define SREG_V  (3)
#endif
#ifndef SREG_S
#  define SREG_S  (4)
#endif
#ifndef SREG_H
#  define SREG_H  (5)
#endif
#ifndef SREG_T
#  define SREG_T  (6)
#endif
#ifndef SREG_I
#  define SREG_I  (7)
#endif

#if (DISPATCH_ORG & 0x1FF) != 0
#error "Dispatch calculation requires lo8(DISPATCH_ORG/2) == 0x00"
#endif

; display
#define CS_PORT  PORTD
#define CS_BIT   PORTD6

.macro display_enable
cbi  CS_PORT, CS_BIT
.endm

.macro display_disable
sbi  CS_PORT, CS_BIT
.endm

; Serial Flash Commands (W25Q128)
#define SFC_READ               0x03
#define SFC_WRITE_ENABLE       0x06
#define SFC_WRITE              0x02
#define SFC_ERASE              0x20
#define SFC_RELEASE_POWERDOWN  0xAB

#define FX_PORT  PORTD
#define FX_BIT   PORTD2

#define FX_VECTOR_KEY_POINTER       0x0014
#define FX_DATA_VECTOR_PAGE_POINTER 0x0016
#define FX_SAVE_VECTOR_KEY_POINTER  0x0018
#define FX_SAVE_VECTOR_PAGE_POINTER 0x001A
#define FX_VECTOR_KEY               0x9518

; AVM linked-image header constants.
#define AVM_HEADER_MAGIC0       0x41
#define AVM_HEADER_MAGIC1       0x56
#define AVM_HEADER_MAGIC2       0x4D
#define AVM_HEADER_MAGIC3       0x01
#define AVM_RUNTIME_VERSION     0x01
#define AVM_DATA_IMAGE_OFFSET   0x0100

; The mandatory eight-byte image tail occupies the final eight bytes of the
; linked image. Only the first six bytes are needed by startup:
;   41 56 54 01, imagePageCountLo, imagePageCountHi
#define AVM_TAIL_MAGIC0         0x41
#define AVM_TAIL_MAGIC1         0x56
#define AVM_TAIL_MAGIC2         0x54
#define AVM_TAIL_MAGIC3         0x01
#define AVM_TAIL_OFFSET_IN_PAGE 0xF8

; Development/emulator images either end at the end of the 16 MiB flash or
; end immediately before a final 4 KiB save sector.
#define FX_DEV_TAIL_NOSAVE_HI   0xFF
#define FX_DEV_TAIL_NOSAVE_MID  0xFF
#define FX_DEV_TAIL_SAVE_HI     0xFF
#define FX_DEV_TAIL_SAVE_MID    0xEF
#define FX_DEV_SAVE_PAGE_LO     0xF0
#define FX_DEV_SAVE_PAGE_HI     0xFF

.macro fx_enable
cbi  FX_PORT, FX_BIT
.endm

.macro fx_disable
sbi  FX_PORT, FX_BIT
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
    ; Keep the vector area small. The complete startup path is placed after
    ; the fixed-stride dispatch table so it cannot collide with .org 0x0200.
    jmp startup_func

; 18-cycle cadence, needs 8 cycles from start of instruction
.macro dispatch
    in   r6, SPDR
    out  SPDR, ZERO
    adiw VM_PC, 1
    mul  r6, C_DISPATCH_STRIDE_WORDS
    movw r30, r0
    subi r31, hi8(-(pm(DISPATCH_ORG)))
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
    subi r31, hi8(-(pm(DISPATCH_ORG)))
    ijmp
.endm

.macro handler_begin opcode, label
    .org (((\opcode) * DISPATCH_STRIDE_BYTES) + DISPATCH_ORG)
\label:
.endm

.macro handler_end opcode
    .org ((((\opcode) + 1) * DISPATCH_STRIDE_BYTES) + DISPATCH_ORG)
.endm

.org DISPATCH_ORG
.global abvm_interp
abvm_interp:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x00-0x0F: MOV cD, cS / CLR cD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x10-0x1F: LD8 cD, [cS]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x20-0x2F: ST8 [cD], cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x30-0x3F: LD16 cD, [cS]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x40-0x4F: ST16 [cD], cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x50-0x6F: Reserved (pending usage based on profiling)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_reserved opcode, label
    handler_begin \opcode, \label
    rjmp \label
    handler_end \opcode
.endm

emit_reserved 0x50, I_50__RESERVED
emit_reserved 0x51, I_51__RESERVED
emit_reserved 0x52, I_52__RESERVED
emit_reserved 0x53, I_53__RESERVED
emit_reserved 0x54, I_54__RESERVED
emit_reserved 0x55, I_55__RESERVED
emit_reserved 0x56, I_56__RESERVED
emit_reserved 0x57, I_57__RESERVED
emit_reserved 0x58, I_58__RESERVED
emit_reserved 0x59, I_59__RESERVED
emit_reserved 0x5A, I_5A__RESERVED
emit_reserved 0x5B, I_5B__RESERVED
emit_reserved 0x5C, I_5C__RESERVED
emit_reserved 0x5D, I_5D__RESERVED
emit_reserved 0x5E, I_5E__RESERVED
emit_reserved 0x5F, I_5F__RESERVED

emit_reserved 0x60, I_60__RESERVED
emit_reserved 0x61, I_61__RESERVED
emit_reserved 0x62, I_62__RESERVED
emit_reserved 0x63, I_63__RESERVED
emit_reserved 0x64, I_64__RESERVED
emit_reserved 0x65, I_65__RESERVED
emit_reserved 0x66, I_66__RESERVED
emit_reserved 0x67, I_67__RESERVED
emit_reserved 0x68, I_68__RESERVED
emit_reserved 0x69, I_69__RESERVED
emit_reserved 0x6A, I_6A__RESERVED
emit_reserved 0x6B, I_6B__RESERVED
emit_reserved 0x6C, I_6C__RESERVED
emit_reserved 0x6D, I_6D__RESERVED
emit_reserved 0x6E, I_6E__RESERVED
emit_reserved 0x6F, I_6F__RESERVED

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x70-0x77: PUSH16 rS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_push16 opcode, label, srcl, srch
    handler_begin \opcode, \label
    delay_1
    st   -Y, \srch
    st   -Y, \srcl
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x78-0x7F: POP16 rD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_pop16 opcode, label, dstl, dsth
    handler_begin \opcode, \label
    delay_1
    ld   \dstl, Y+
    ld   \dsth, Y+
    dispatch_reverse
    handler_end \opcode
.endm

emit_pop16 0x78, I_78__POP16_r0, VM_R0L, VM_R0H
emit_pop16 0x79, I_79__POP16_r1, VM_R1L, VM_R1H
emit_pop16 0x7A, I_7A__POP16_r2, VM_R2L, VM_R2H
emit_pop16 0x7B, I_7B__POP16_r3, VM_R3L, VM_R3H
emit_pop16 0x7C, I_7C__POP16_r4, VM_R4L, VM_R4H
emit_pop16 0x7D, I_7D__POP16_r5, VM_R5L, VM_R5H
emit_pop16 0x7E, I_7E__POP16_r6, VM_R6L, VM_R6H
emit_pop16 0x7F, I_7F__POP16_r7, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x80-0x9F: ADD/SUB cD, cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xA0-0xAF: CMP16 / TST16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_cmp16_or_tst opcode, label, dstl, dsth, srcl, srch, same=0
    handler_begin \opcode, \label

    .if \same
        ; TST16 updates Z/N/V/S but preserves the old AVM carry.
        ;
        ; BST copies VM_FLAGS.C into native SREG.T.
        ; CP/CPC do not modify T.
        ; BLD restores that saved bit after SREG is captured.
        bst  VM_FLAGS, 0
        cp   \dstl, ZERO
        cpc  \dsth, ZERO
        in   VM_FLAGS, SREG
        bld  VM_FLAGS, 0
    .else
        ; 2-cycle padding + CP + CPC + IN = 5 cycles.
        delay_2
        cp   \dstl, \srcl
        cpc  \dsth, \srch
        in   VM_FLAGS, SREG
    .endif

    dispatch_reverse
    handler_end \opcode
.endm

emit_cmp16_or_tst 0xA0, I_A0__TST16_c0,     VM_C0L, VM_C0H, VM_C0L, VM_C0H, 1
emit_cmp16_or_tst 0xA1, I_A1__CMP16_c0_c1,  VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_cmp16_or_tst 0xA2, I_A2__CMP16_c0_c2,  VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_cmp16_or_tst 0xA3, I_A3__CMP16_c0_c3,  VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_cmp16_or_tst 0xA4, I_A4__CMP16_c1_c0,  VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_cmp16_or_tst 0xA5, I_A5__TST16_c1,     VM_C1L, VM_C1H, VM_C1L, VM_C1H, 1
emit_cmp16_or_tst 0xA6, I_A6__CMP16_c1_c2,  VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_cmp16_or_tst 0xA7, I_A7__CMP16_c1_c3,  VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_cmp16_or_tst 0xA8, I_A8__CMP16_c2_c0,  VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_cmp16_or_tst 0xA9, I_A9__CMP16_c2_c1,  VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_cmp16_or_tst 0xAA, I_AA__TST16_c2,     VM_C2L, VM_C2H, VM_C2L, VM_C2H, 1
emit_cmp16_or_tst 0xAB, I_AB__CMP16_c2_c3,  VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_cmp16_or_tst 0xAC, I_AC__CMP16_c3_c0,  VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_cmp16_or_tst 0xAD, I_AD__CMP16_c3_c1,  VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_cmp16_or_tst 0xAE, I_AE__CMP16_c3_c2,  VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_cmp16_or_tst 0xAF, I_AF__TST16_c3,     VM_C3L, VM_C3H, VM_C3L, VM_C3H, 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xB0-0xBF: CMP8 / TST8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_cmp8_or_tst opcode, label, dstl, srcl, same=0
    handler_begin \opcode, \label

    .if \same
        ; TST8 updates Z/N/V/S but preserves the old AVM carry.
        ;
        ; N is derived from bit 7 and V is cleared by TST,
        ; so S = N as required for an 8-bit zero test.
        delay_1
        bst  VM_FLAGS, 0
        tst  \dstl
        in   VM_FLAGS, SREG
        bld  VM_FLAGS, 0
    .else
        ; 3-cycle padding + CP + IN = 5 cycles.
        delay_3
        cp   \dstl, \srcl
        in   VM_FLAGS, SREG
    .endif

    dispatch_reverse
    handler_end \opcode
.endm

emit_cmp8_or_tst 0xB0, I_B0__TST8_c0,     VM_C0L, VM_C0L, 1
emit_cmp8_or_tst 0xB1, I_B1__CMP8_c0_c1,  VM_C0L, VM_C1L
emit_cmp8_or_tst 0xB2, I_B2__CMP8_c0_c2,  VM_C0L, VM_C2L
emit_cmp8_or_tst 0xB3, I_B3__CMP8_c0_c3,  VM_C0L, VM_C3L
emit_cmp8_or_tst 0xB4, I_B4__CMP8_c1_c0,  VM_C1L, VM_C0L
emit_cmp8_or_tst 0xB5, I_B5__TST8_c1,     VM_C1L, VM_C1L, 1
emit_cmp8_or_tst 0xB6, I_B6__CMP8_c1_c2,  VM_C1L, VM_C2L
emit_cmp8_or_tst 0xB7, I_B7__CMP8_c1_c3,  VM_C1L, VM_C3L
emit_cmp8_or_tst 0xB8, I_B8__CMP8_c2_c0,  VM_C2L, VM_C0L
emit_cmp8_or_tst 0xB9, I_B9__CMP8_c2_c1,  VM_C2L, VM_C1L
emit_cmp8_or_tst 0xBA, I_BA__TST8_c2,     VM_C2L, VM_C2L, 1
emit_cmp8_or_tst 0xBB, I_BB__CMP8_c2_c3,  VM_C2L, VM_C3L
emit_cmp8_or_tst 0xBC, I_BC__CMP8_c3_c0,  VM_C3L, VM_C0L
emit_cmp8_or_tst 0xBD, I_BD__CMP8_c3_c1,  VM_C3L, VM_C1L
emit_cmp8_or_tst 0xBE, I_BE__CMP8_c3_c2,  VM_C3L, VM_C2L
emit_cmp8_or_tst 0xBF, I_BF__TST8_c3,     VM_C3L, VM_C3L, 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC0-0xDF: BEQ.S / BNE.S
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; One-byte short equality branches.  The displacement is relative to nextPC,
; so the taken path first advances PC past the opcode and then adds disp.
;
; The untaken path retains the sequential SPI stream and is padded to the same
; five pre-dispatch cycles used by the surrounding one-byte handlers.
;
; A taken branch discards the speculative sequential byte, seeks the flash to
; CB:PC, primes a read of the target opcode, and dispatches it without changing
; PC again (PC already names the target opcode).
.macro emit_branch_short opcode, label, skip, disp
    handler_begin \opcode, \label

    \skip VM_FLAGS, SREG_Z
    rjmp branch_short_dispatch_reverse_func

    adiw VM_PC, 1
    subi VM_PCL, lo8(-(\disp))
    sbci VM_PCH, hi8(-(\disp))

    rcall fx_seek_to_pc
    in   r6, SPDR
    out  SPDR, ZERO
    mul  r6, C_DISPATCH_STRIDE_WORDS
    movw r30, r0
    subi r31, hi8(-(DISPATCH_ORG))
    ijmp

    handler_end \opcode
.endm

emit_branch_short 0xC0, I_C0__BEQ_S_m8, sbrs, -8
emit_branch_short 0xC1, I_C1__BEQ_S_m7, sbrs, -7
emit_branch_short 0xC2, I_C2__BEQ_S_m6, sbrs, -6
emit_branch_short 0xC3, I_C3__BEQ_S_m5, sbrs, -5
emit_branch_short 0xC4, I_C4__BEQ_S_m4, sbrs, -4
emit_branch_short 0xC5, I_C5__BEQ_S_m3, sbrs, -3
emit_branch_short 0xC6, I_C6__BEQ_S_m2, sbrs, -2
emit_branch_short 0xC7, I_C7__BEQ_S_m1, sbrs, -1
emit_branch_short 0xC8, I_C8__BEQ_S_p1, sbrs,  1
emit_branch_short 0xC9, I_C9__BEQ_S_p2, sbrs,  2
emit_branch_short 0xCA, I_CA__BEQ_S_p3, sbrs,  3
emit_branch_short 0xCB, I_CB__BEQ_S_p4, sbrs,  4
emit_branch_short 0xCC, I_CC__BEQ_S_p5, sbrs,  5
emit_branch_short 0xCD, I_CD__BEQ_S_p6, sbrs,  6
emit_branch_short 0xCE, I_CE__BEQ_S_p7, sbrs,  7
emit_branch_short 0xCF, I_CF__BEQ_S_p8, sbrs,  8

emit_branch_short 0xD0, I_D0__BNE_S_m8, sbrc, -8
emit_branch_short 0xD1, I_D1__BNE_S_m7, sbrc, -7
emit_branch_short 0xD2, I_D2__BNE_S_m6, sbrc, -6
emit_branch_short 0xD3, I_D3__BNE_S_m5, sbrc, -5
emit_branch_short 0xD4, I_D4__BNE_S_m4, sbrc, -4
emit_branch_short 0xD5, I_D5__BNE_S_m3, sbrc, -3
emit_branch_short 0xD6, I_D6__BNE_S_m2, sbrc, -2
emit_branch_short 0xD7, I_D7__BNE_S_m1, sbrc, -1
emit_branch_short 0xD8, I_D8__BNE_S_p1, sbrc,  1
emit_branch_short 0xD9, I_D9__BNE_S_p2, sbrc,  2
emit_branch_short 0xDA, I_DA__BNE_S_p3, sbrc,  3
emit_branch_short 0xDB, I_DB__BNE_S_p4, sbrc,  4
emit_branch_short 0xDC, I_DC__BNE_S_p5, sbrc,  5
emit_branch_short 0xDD, I_DD__BNE_S_p6, sbrc,  6
emit_branch_short 0xDE, I_DE__BNE_S_p7, sbrc,  7
emit_branch_short 0xDF, I_DF__BNE_S_p8, sbrc,  8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE0-0xEF: INC16/DEC16 rN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_inc_or_dec opcode, label, dstl, dsth, opl, oph
    handler_begin \opcode, \label

    ; INC16/DEC16 preserve architectural C while updating Z/N/V/S.
    ; Save the old AVM carry in native SREG.T, which ADD/ADC preserve.
    bst  VM_FLAGS, SREG_C

    ldi  r26, 1
    \opl \dstl, r26
    \oph \dsth, ZERO

    in   VM_FLAGS, SREG
    bld  VM_FLAGS, SREG_C

    rjmp dispatch_func
    handler_end \opcode
.endm

emit_inc_or_dec 0xE0, I_E0__INC16_r0, VM_R0L, VM_R0H, add, adc
emit_inc_or_dec 0xE1, I_E1__INC16_r1, VM_R1L, VM_R1H, add, adc
emit_inc_or_dec 0xE2, I_E2__INC16_r2, VM_R2L, VM_R2H, add, adc
emit_inc_or_dec 0xE3, I_E3__INC16_r3, VM_R3L, VM_R3H, add, adc
emit_inc_or_dec 0xE4, I_E4__INC16_r4, VM_R4L, VM_R4H, add, adc
emit_inc_or_dec 0xE5, I_E5__INC16_r5, VM_R5L, VM_R5H, add, adc
emit_inc_or_dec 0xE6, I_E6__INC16_r6, VM_R6L, VM_R6H, add, adc
emit_inc_or_dec 0xE7, I_E7__INC16_r7, VM_R7L, VM_R7H, add, adc
emit_inc_or_dec 0xE8, I_E8__DEC16_r0, VM_R0L, VM_R0H, sub, sbc
emit_inc_or_dec 0xE9, I_E9__DEC16_r1, VM_R1L, VM_R1H, sub, sbc
emit_inc_or_dec 0xEA, I_EA__DEC16_r2, VM_R2L, VM_R2H, sub, sbc
emit_inc_or_dec 0xEB, I_EB__DEC16_r3, VM_R3L, VM_R3H, sub, sbc
emit_inc_or_dec 0xEC, I_EC__DEC16_r4, VM_R4L, VM_R4H, sub, sbc
emit_inc_or_dec 0xED, I_ED__DEC16_r5, VM_R5L, VM_R5H, sub, sbc
emit_inc_or_dec 0xEE, I_EE__DEC16_r6, VM_R6L, VM_R6H, sub, sbc
emit_inc_or_dec 0xEF, I_EF__DEC16_r7, VM_R7L, VM_R7H, sub, sbc

.macro emit_ldi8 opcode, label, dstl, dsth
    handler_begin \opcode, \label

    ; The immediate transfer was started by the preceding dispatch.
    ;
    ; Previous OUT-to-handler-entry latency is 9 cycles. These eight
    ; cycles place this OUT exactly 17 cycles after the previous OUT:
    ;
    ;     delay_4 + delay_3 + CLI = 8
    ;
    ; OUT starts fetching the next opcode; IN reads the completed immediate.
    delay_4
    delay_3
    cli
    out  SPDR, ZERO
    in   \dstl, SPDR
    sei

    ; Account for the immediate byte and zero-extend the value.
    ; dispatch_reverse accounts for the opcode byte.
    adiw VM_PC, 1
    clr  \dsth

    rjmp ldi8_dispatch_reverse_func

    handler_end \opcode
.endm

emit_ldi8 0xF0, I_F0__LDI8_c0, VM_C0L, VM_C0H
emit_ldi8 0xF1, I_F1__LDI8_c1, VM_C1L, VM_C1H
emit_ldi8 0xF2, I_F2__LDI8_c2, VM_C2L, VM_C2H
emit_ldi8 0xF3, I_F3__LDI8_c3, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xF4: ALU, Control, System, and Relocated-Core Extension
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xF4, I_F4__ext_alu_ctrl_sys_core

    ; The secondary-opcode transfer was started by the preceding dispatch.
    ; Account for the secondary byte, then fetch it while starting the first
    ; secondary operand (or the following primary opcode for a two-byte form).
    adiw VM_PC, 1
    delay_3
    rjmp f4_extension_decode_func

    handler_end 0xF4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xF5-0xFC: General Conditional Branches, rel8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Each condition has a dedicated primary opcode.  At handler entry SPDR is
; transferring the signed displacement byte and VM_PC names the primary
; opcode.  The prefix below:
;
;   * advances VM_PC to the displacement byte,
;   * reads the displacement into r6,
;   * starts fetching the speculative fallthrough opcode, and
;   * performs a condition-specific test of saved AVM FLAGS.
;
; The not-taken path preserves the sequential SPI stream.  The taken path
; discards it, computes nextPC + sign_extend(rel8), and seeks to the target.
.macro emit_branch_rel8_bit opcode, label, skip, flag
    handler_begin \opcode, \label

    ; Previous OUT-to-handler-entry latency is nine cycles.  These eight
    ; cycles place this OUT exactly 17 cycles after the preceding OUT.
    adiw VM_PC, 1
    delay_4
    delay_1
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ; For branch-on-set use SBRS; for branch-on-clear use SBRC.  A satisfied
    ; condition skips the not-taken jump.
    \skip VM_FLAGS, \flag
    rjmp branch_rel8_not_taken_func
    rjmp branch_rel8_taken_func

    handler_end \opcode
.endm

.macro emit_branch_rel8_mask opcode, label, take_branch
    handler_begin \opcode, \label

    adiw VM_PC, 1
    delay_4
    delay_1
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ; ULE and UGT depend on C|Z.  r26 is interpreter scratch and supports
    ; ANDI directly.
    mov  r26, VM_FLAGS
    andi r26, (_BV(SREG_C) | _BV(SREG_Z))
    \take_branch 1f
    rjmp branch_rel8_not_taken_func
1:
    rjmp branch_rel8_taken_func

    handler_end \opcode
.endm

emit_branch_rel8_bit  0xF5, I_F5__BREQ_rel8,  sbrs, SREG_Z
emit_branch_rel8_bit  0xF6, I_F6__BRNE_rel8,  sbrc, SREG_Z
emit_branch_rel8_bit  0xF7, I_F7__BRULT_rel8, sbrs, SREG_C
emit_branch_rel8_bit  0xF8, I_F8__BRUGE_rel8, sbrc, SREG_C
emit_branch_rel8_bit  0xF9, I_F9__BRSLT_rel8, sbrs, SREG_S
emit_branch_rel8_bit  0xFA, I_FA__BRSGE_rel8, sbrc, SREG_S
emit_branch_rel8_mask 0xFB, I_FB__BRULE_rel8, brne
emit_branch_rel8_mask 0xFC, I_FC__BRUGT_rel8, breq

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFD: Memory and Program-Space Extension
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xFD, I_FD__ext_memory_program

    ; The secondary-opcode transfer was started by the preceding dispatch.
    ; Account for the secondary byte, then fetch it while starting the first
    ; secondary operand (or the following primary opcode for a two-byte form).
    adiw VM_PC, 1
    delay_3
    rjmp fd_extension_decode_func

    handler_end 0xFD

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFE: Direct Far Control (JMPF/CALLF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xFE, I_FE__JMPF_CALLF

    handler_end 0xFE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFF: RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xFF, I_FF__RET

    handler_end 0xFF


ldi8_dispatch_reverse_func:
    delay_4
branch_short_dispatch_reverse_func:
    delay_2
dispatch_reverse_func:
    dispatch_reverse

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xF4 secondary dispatch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Emit a run of one-word secondary-table entries.  Keeping the runs grouped by
; ISA family makes the complete 256-entry maps reviewable without changing the
; table representation used at run time.
.macro secondary_entries count, target
    .rept \count
        rjmp \target
    .endr
.endm

f4_extension_decode_func:
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ; Each table entry is one AVR word, so the secondary opcode is already the
    ; word offset required by IJMP.
    ldi  r30, lo8(pm(f4_secondary_table))
    ldi  r31, hi8(pm(f4_secondary_table))
    add  r30, r6
    adc  r31, ZERO
    ijmp

f4_secondary_table:
    secondary_entries 8, f4_not16_family
    secondary_entries 8, f4_neg16_family
    secondary_entries 8, f4_lsl16_family
    secondary_entries 8, f4_lsr16_family
    secondary_entries 8, f4_asr16_family
    secondary_entries 8, f4_lsr8_family
    secondary_entries 8, f4_asr8_family
    secondary_entries 8, f4_zext8_family
    secondary_entries 8, f4_sext8_family
    secondary_entries 8, f4_swap8_family
    secondary_entries 8, f4_getsp_family
    secondary_entries 8, f4_setsp_family
    secondary_entries 1, f4_and_family
    secondary_entries 1, f4_or_family
    secondary_entries 1, f4_xor_family
    secondary_entries 1, f4_bic_family
    secondary_entries 1, f4_adc_family
    secondary_entries 1, f4_sbc_family
    secondary_entries 1, f4_cmp8_family
    secondary_entries 1, f4_cpc16_family
    secondary_entries 1, f4_mulu8_family
    secondary_entries 1, f4_muls8_family
    secondary_entries 1, f4_mulsu8_family
    secondary_entries 1, f4_shl16v_family
    secondary_entries 1, f4_lsr16v_family
    secondary_entries 1, f4_asr16v_family
    secondary_entries 2, invalid_secondary_instruction_func
    secondary_entries 8, f4_ldi16_family
    secondary_entries 8, f4_ldi8_family
    secondary_entries 8, f4_addi16_family
    secondary_entries 8, f4_subi16_family
    secondary_entries 8, f4_andi16_family
    secondary_entries 8, f4_ori16_family
    secondary_entries 8, f4_xori16_family
    secondary_entries 8, f4_cmpi16_family
    secondary_entries 8, f4_cmpi8_family
    secondary_entries 1, f4_mov_family
    secondary_entries 1, f4_add_family
    secondary_entries 1, f4_sub_family
    secondary_entries 1, f4_cmp16_family
    secondary_entries 1, f4_cmpi6_decode_func
    secondary_entries 1, f4_jmp_rel8_family
    secondary_entries 1, f4_call_rel8_family
    secondary_entries 1, f4_adjsp_family
    secondary_entries 8, f4_jmpr_family
    secondary_entries 8, f4_callr_family
    secondary_entries 8, f4_jmpp_family
    secondary_entries 8, f4_callp_family
    secondary_entries 8, f4_mtpb_family
    secondary_entries 8, f4_mfpb_family
    secondary_entries 1, f4_ldpbi_family
    secondary_entries 1, f4_jmp16_family
    secondary_entries 1, f4_call16_family
    secondary_entries 1, f4_nop_family
    secondary_entries 1, f4_sys_family
    secondary_entries 4, invalid_secondary_instruction_func
    secondary_entries 1, f4_ldsp_compact_family
    secondary_entries 1, f4_stsp_compact_family
    secondary_entries 5, invalid_secondary_instruction_func
f4_secondary_table_end:

.if ((f4_secondary_table_end - f4_secondary_table) != (256 * 2))
    .error "F4 secondary dispatch table must contain exactly 256 words"
.endif

; Valid families intentionally remain skeletons.  Consecutive labels alias one
; nearby veneer so every table RJMP stays comfortably within range.
f4_not16_family:
f4_neg16_family:
f4_lsl16_family:
f4_lsr16_family:
f4_asr16_family:
f4_lsr8_family:
f4_asr8_family:
f4_zext8_family:
f4_sext8_family:
f4_swap8_family:
f4_getsp_family:
f4_setsp_family:
f4_and_family:
f4_or_family:
f4_xor_family:
f4_bic_family:
f4_adc_family:
f4_sbc_family:
f4_cmp8_family:
f4_cpc16_family:
f4_mulu8_family:
f4_muls8_family:
f4_mulsu8_family:
f4_shl16v_family:
f4_lsr16v_family:
f4_asr16v_family:
f4_ldi16_family:
f4_ldi8_family:
f4_addi16_family:
f4_subi16_family:
f4_andi16_family:
f4_ori16_family:
f4_xori16_family:
f4_cmpi16_family:
f4_cmpi8_family:
f4_mov_family:
f4_add_family:
f4_sub_family:
f4_cmp16_family:
f4_jmp_rel8_family:
f4_call_rel8_family:
f4_adjsp_family:
f4_jmpr_family:
f4_callr_family:
f4_jmpp_family:
f4_callp_family:
f4_mtpb_family:
f4_mfpb_family:
f4_ldpbi_family:
f4_jmp16_family:
f4_call16_family:
f4_nop_family:
f4_sys_family:
f4_ldsp_compact_family:
f4_stsp_compact_family:
    rjmp unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFD secondary dispatch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

fd_extension_decode_func:
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ldi  r30, lo8(pm(fd_secondary_table))
    ldi  r31, hi8(pm(fd_secondary_table))
    add  r30, r6
    adc  r31, ZERO
    ijmp

fd_secondary_table:
    secondary_entries 1, fd_ld8_indirect_family
    secondary_entries 1, fd_st8_indirect_family
    secondary_entries 1, fd_ld16_indirect_family
    secondary_entries 1, fd_st16_indirect_family
    secondary_entries 1, fd_ld8_post_family
    secondary_entries 1, fd_st8_post_family
    secondary_entries 1, fd_ld16_post_family
    secondary_entries 1, fd_st16_post_family
    secondary_entries 1, fd_lea_displaced_family
    secondary_entries 1, fd_ld8_displaced_family
    secondary_entries 1, fd_st8_displaced_family
    secondary_entries 1, fd_ld16_displaced_family
    secondary_entries 1, fd_st16_displaced_family
    secondary_entries 3, invalid_secondary_instruction_func
    secondary_entries 8, fd_ldsp8_family
    secondary_entries 8, fd_stsp8_family
    secondary_entries 8, fd_ldsp16_family
    secondary_entries 8, fd_stsp16_family
    secondary_entries 8, fd_ldm8_family
    secondary_entries 8, fd_stm8_family
    secondary_entries 8, fd_ldm16_family
    secondary_entries 8, fd_stm16_family
    secondary_entries 48, invalid_secondary_instruction_func
    secondary_entries 1, fd_ldp8_family
    secondary_entries 1, fd_ldp16_family
    secondary_entries 1, fd_ldp8_displaced_family
    secondary_entries 1, fd_ldp16_displaced_family
    secondary_entries 124, invalid_secondary_instruction_func
fd_secondary_table_end:

.if ((fd_secondary_table_end - fd_secondary_table) != (256 * 2))
    .error "FD secondary dispatch table must contain exactly 256 words"
.endif

fd_ld8_indirect_family:
fd_st8_indirect_family:
fd_ld16_indirect_family:
fd_st16_indirect_family:
fd_ld8_post_family:
fd_st8_post_family:
fd_ld16_post_family:
fd_st16_post_family:
fd_lea_displaced_family:
fd_ld8_displaced_family:
fd_st8_displaced_family:
fd_ld16_displaced_family:
fd_st16_displaced_family:
fd_ldsp8_family:
fd_stsp8_family:
fd_ldsp16_family:
fd_stsp16_family:
fd_ldm8_family:
fd_stm8_family:
fd_ldm16_family:
fd_stm16_family:
fd_ldp8_family:
fd_ldp16_family:
fd_ldp8_displaced_family:
fd_ldp16_displaced_family:
    rjmp unimplemented_instruction_func

f4_cmpi6_decode_func:
    ; VM_PC currently names the secondary opcode.  Advance it to the CMPI6
    ; operand so the final dispatch advances to the following primary opcode.
    adiw VM_PC, 1

    ; The first OUT above started the CMPI6 operand transfer.  Including the
    ; secondary-table dispatch above, this padding places the next OUT 17
    ; cycles later.  It starts fetching the following primary opcode while IN
    ; reads the completed CMPI6 operand.
    delay_4
    delay_2
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ; Operand encoding:
    ;   bits 7:2 = signed six-bit immediate
    ;   bits 1:0 = compact register
    ;
    ; Construct the native data-space address of cN:
    ;   address = 16 + 2 * (operand & 3)
    mov  r26, r6
    andi r26, 0x03
    lsl  r26
    subi r26, -16
    clr  r27

    ; Convert [simm6:6][cN:2] into a signed eight-bit immediate.
    asr  r6
    asr  r6

    ; Load the selected compact register through data space.
    ld   r4, X+
    ld   r5, X

    ; Sign-extend the immediate from r6 into r0:r6.
    mov  r0, r6
    lsl  r0
    sbc  r0, r0

    ; Compare selected cN against sign_extend(simm6).
    cp   r4, r6
    cpc  r5, r0
    in   VM_FLAGS, SREG

    ; The following primary opcode has completed transferring.
    rjmp dispatch_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; General rel8 branch continuations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

branch_rel8_not_taken_func:
    ; The shortest condition path reaches here five cycles after the OUT that
    ; started fetching the fallthrough opcode. dispatch_reverse executes three
    ; cycles before its OUT, so pad nine cycles to maintain the 17-cycle
    ; OUT-to-OUT SPI cadence.
    rcall fx_seek_delay_7
    rjmp dispatch_reverse_func

branch_rel8_taken_func:
    ; The primary handler advanced PC to the displacement byte.  Advance once
    ; more to nextPC, then add the signed displacement in r6.
    adiw VM_PC, 1
    add  VM_PCL, r6
    adc  VM_PCH, ZERO
    sbrc r6, 7
    dec  VM_PCH

    ; Discard the speculative fallthrough byte and restart the stream at the
    ; branch target.  PC already names the target opcode, so do not increment
    ; it before entering the target handler.
    rcall fx_seek_to_pc
    in   r6, SPDR
    out  SPDR, ZERO
    mul  r6, C_DISPATCH_STRIDE_WORDS
    movw r30, r0
    subi r31, hi8(-(DISPATCH_ORG))
    ijmp

unimplemented_instruction_func:
    rjmp unimplemented_instruction_func

invalid_secondary_instruction_func:
    rjmp invalid_secondary_instruction_func

; The next opcode has long since completed transferring.
dispatch_func:
    dispatch

; seek to PC (CB/PC)
fx_seek_to_pc:
    fx_disable
    ldi  r30, SFC_READ
    fx_enable
    out  SPDR, r30
    lds  r26, data_page_data+0
    add  r26, VM_PCH
    lds  r27, data_page_data+1
    in   r30, VM_CB
    adc  r27, r30
    rcall fx_seek_delay_10
    out  SPDR, r27
    rcall fx_seek_delay_17
    out  SPDR, r26
    rcall fx_seek_delay_17
    out  SPDR, VM_PCL
    rcall fx_seek_delay_17
    out  SPDR, r2
    ; wait 16 cycles: 2 + 10 + 4 (from ret)
    ; this way, the next byte is ready to read when this method returns
    delay_2
    rcall fx_seek_delay_10
    ret

fx_seek_delay_17:
    rcall fx_seek_delay_7
fx_seek_delay_10:
    lpm
fx_seek_delay_7:
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reset/startup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Startup supports both Arduboy FX flashcart launches and development/emulator
; placement at the end of the 16 MiB FX address space.
;
; Flashcart mode:
;   * reserved interrupt-vector slots contain 0x9518 keys
;   * data/save page numbers follow each key in big-endian byte order
;
; Development mode:
;   * check the AVM tail at 0xFFFFF8 (no save sector)
;   * otherwise check 0xFFEFF8 (final 4 KiB is the save sector)
;   * imageBasePage = tailPage + 1 - imagePageCount
;
; Normal startup validates only the fields needed for safe initialization.
startup_func:
    cli

    ; Native AVR hardware stack. The VM stack is held separately in Y.
    ldi  r26, lo8(RAMEND)
    out  SPL, r26
    ldi  r26, hi8(RAMEND)
    out  SPH, r26

    ; Initialize persistent interpreter state.
    clr  ZERO
    ldi  r26, DISPATCH_STRIDE_WORDS
    mov  C_DISPATCH_STRIDE_WORDS, r26
    ldi  VM_SPL, lo8(VM_SP_INITIAL_VALUE)
    ldi  VM_SPH, hi8(VM_SP_INITIAL_VALUE)
    clr  VM_FLAGS
    out  VM_CB, ZERO
    out  VM_PB, ZERO
    sts  data_page_data+0, ZERO
    sts  data_page_data+1, ZERO
    sts  data_page_save+0, ZERO
    sts  data_page_save+1, ZERO
    sts  data_save_size+0, ZERO
    sts  data_save_size+1, ZERO
    sts  data_startup_flags, ZERO

    ; Initialize SPI. Startup uses SPIF polling; the bytecode interpreter uses
    ; the fixed-cadence transfer pipeline after the first opcode is primed.
    ldi  r26, (_BV(SPE) | _BV(MSTR))
    out  SPCR, r26
    ldi  r26, _BV(SPI2X)
    out  SPSR, r26

    display_disable
    fx_disable

    ; Release the W25Q128 from power-down.
    fx_enable
    ldi  r30, SFC_RELEASE_POWERDOWN
    rcall fx_spi_transfer_blocking
    fx_disable
    rcall fx_startup_wake_delay

    ; Prefer the page values installed by the FX flashcart bootloader.
    ldi  r30, lo8(FX_VECTOR_KEY_POINTER)
    ldi  r31, hi8(FX_VECTOR_KEY_POINTER)
    lpm  r20, Z+
    lpm  r21, Z+
    cpi  r20, lo8(FX_VECTOR_KEY)
    brne startup_find_development_image
    cpi  r21, hi8(FX_VECTOR_KEY)
    brne startup_find_development_image

    ; The flashcart stores page words high byte first in program flash.
    lpm  r27, Z+
    lpm  r26, Z+
    sts  data_page_data+0, r26
    sts  data_page_data+1, r27

    ; A save page is independently keyed and may be absent.
    lpm  r20, Z+
    lpm  r21, Z+
    cpi  r20, lo8(FX_VECTOR_KEY)
    brne startup_read_header
    cpi  r21, hi8(FX_VECTOR_KEY)
    brne startup_read_header
    lpm  r27, Z+
    lpm  r26, Z+
    sts  data_page_save+0, r26
    sts  data_page_save+1, r27
    ldi  r26, _BV(STARTUP_SAVE_PAGE_VALID)
    sts  data_startup_flags, r26
    rjmp startup_read_header

startup_find_development_image:
    ; First try an image whose tail is at the physical end of flash. This form
    ; has no following save sector.
    ldi  r22, FX_DEV_TAIL_NOSAVE_HI
    ldi  r27, FX_DEV_TAIL_NOSAVE_MID
    ldi  r26, AVM_TAIL_OFFSET_IN_PAGE
    clr  r20                      ; tailPage + 1 = 0x0000
    clr  r21
    rcall startup_try_tail
    brcs startup_read_header

    ; Then try an image ending immediately before the final 4 KiB save sector.
    ldi  r22, FX_DEV_TAIL_SAVE_HI
    ldi  r27, FX_DEV_TAIL_SAVE_MID
    ldi  r26, AVM_TAIL_OFFSET_IN_PAGE
    ldi  r20, FX_DEV_SAVE_PAGE_LO ; tailPage + 1 = save page
    ldi  r21, FX_DEV_SAVE_PAGE_HI
    rcall startup_try_tail
    brcs 1f
    rjmp startup_invalid_image
1:

    ldi  r26, FX_DEV_SAVE_PAGE_LO
    ldi  r27, FX_DEV_SAVE_PAGE_HI
    sts  data_page_save+0, r26
    sts  data_page_save+1, r27
    ldi  r26, _BV(STARTUP_SAVE_PAGE_VALID)
    sts  data_startup_flags, r26

startup_read_header:
    ; Begin a read at imageBase + 0x000000.
    clr  r26
    lds  r27, data_page_data+0
    lds  r22, data_page_data+1
    rcall fx_startup_begin_read

    ; magic[4]
    rcall fx_startup_read_byte
    cpi  r30, AVM_HEADER_MAGIC0
    breq 1f
    rjmp startup_invalid_image
1:
    rcall fx_startup_read_byte
    cpi  r30, AVM_HEADER_MAGIC1
    breq 1f
    rjmp startup_invalid_image
1:
    rcall fx_startup_read_byte
    cpi  r30, AVM_HEADER_MAGIC2
    breq 1f
    rjmp startup_invalid_image
1:
    rcall fx_startup_read_byte
    cpi  r30, AVM_HEADER_MAGIC3
    breq 1f
    rjmp startup_invalid_image
1:

    ; One coarse compatibility byte covers the ISA, ABI, and runtime services.
    rcall fx_startup_read_byte
    cpi  r30, AVM_RUNTIME_VERSION
    breq 1f
    rjmp startup_invalid_image
1:

    ; entryPoint, packed little-endian 24-bit logical address.
    rcall fx_startup_read_byte
    mov  VM_PCL, r30
    rcall fx_startup_read_byte
    mov  VM_PCH, r30
    rcall fx_startup_read_byte
    out  VM_CB, r30

    ; dataSize in r16:r17.
    rcall fx_startup_read_byte
    mov  r16, r30
    rcall fx_startup_read_byte
    mov  r17, r30

    ; staticSize in r18:r19.
    rcall fx_startup_read_byte
    mov  r18, r30
    rcall fx_startup_read_byte
    mov  r19, r30

    ; saveSize is retained for the system ABI.
    rcall fx_startup_read_byte
    mov  r20, r30
    sts  data_save_size+0, r30
    rcall fx_startup_read_byte
    mov  r21, r30
    sts  data_save_size+1, r30
    fx_disable

    ; dataSize <= staticSize.
    cp   r18, r16
    cpc  r19, r17
    brsh 1f
    rjmp startup_invalid_image
1:

    ; staticSize <= 1024. Values below 0x0400 are accepted; 0x0400 itself is
    ; accepted only when the low byte is zero.
    cpi  r19, 0x04
    brlo 1f
    breq 2f
    rjmp startup_invalid_image
2:
    tst  r18
    breq 1f
    rjmp startup_invalid_image
1:

    ; saveSize <= 1024.
    cpi  r21, 0x04
    brlo 2f
    breq 3f
    rjmp startup_invalid_image
3:
    tst  r20
    breq 2f
    rjmp startup_invalid_image
2:

    ; A nonzero save request requires either a keyed flashcart save page or the
    ; development layout with a final 4 KiB save sector.
    cp   r20, ZERO
    cpc  r21, ZERO
    breq 3f
    lds  r26, data_startup_flags
    sbrs r26, STARTUP_SAVE_PAGE_VALID
    rjmp startup_invalid_image
3:

    ; Clear all static SRAM first. The initializer copy below overwrites the
    ; first dataSize bytes, leaving the remaining bytes as zeroed .bss.
    ldi  r26, lo8(data_globals)
    ldi  r27, hi8(data_globals)
    movw r20, r18
    cp   r20, ZERO
    cpc  r21, ZERO
    breq startup_copy_data
startup_clear_static_loop:
    st   X+, ZERO
    subi r20, 1
    sbci r21, 0
    brne startup_clear_static_loop

startup_copy_data:
    cp   r16, ZERO
    cpc  r17, ZERO
    breq startup_enter_image

    ; .data initializers always begin one page after the header.
    lds  r27, data_page_data+0
    lds  r22, data_page_data+1
    inc  r27
    brne 4f
    inc  r4
4:
    clr  r26
    rcall fx_startup_begin_read
    ldi  r26, lo8(data_globals)
    ldi  r27, hi8(data_globals)
startup_copy_data_loop:
    rcall fx_startup_read_byte
    st   X+, r30
    subi r16, 1
    sbci r17, 0
    brne startup_copy_data_loop
    fx_disable

startup_enter_image:
    ; PB starts at zero. CB:PC already contains entryPoint.
    out  VM_PB, ZERO

    ; Seek to entryPoint and prime both the opcode and following-byte transfer.
    rcall fx_seek_to_pc
    in   r6, SPDR
    out  SPDR, ZERO
    sei
    delay_1
    mul  r6, C_DISPATCH_STRIDE_WORDS
    movw r30, r0
    subi r31, hi8(-((DISPATCH_ORG)>>1))
    ijmp

startup_invalid_image:
    cli
    fx_disable
startup_invalid_image_loop:
    rjmp startup_invalid_image_loop

; Try a development tail.
;
; Input:
;   r22:r27:r26 = physical address of tail magic
;   r21:r20     = page immediately following the tail page
;
; Output:
;   C = 1 and data_page_data installed when valid
;   C = 0 otherwise
startup_try_tail:
    rcall fx_startup_begin_read
    rcall fx_startup_read_byte
    cpi  r30, AVM_TAIL_MAGIC0
    brne startup_try_tail_fail
    rcall fx_startup_read_byte
    cpi  r30, AVM_TAIL_MAGIC1
    brne startup_try_tail_fail
    rcall fx_startup_read_byte
    cpi  r30, AVM_TAIL_MAGIC2
    brne startup_try_tail_fail
    rcall fx_startup_read_byte
    cpi  r30, AVM_TAIL_MAGIC3
    brne startup_try_tail_fail

    ; imagePageCount, little-endian. Zero is never valid.
    rcall fx_startup_read_byte
    mov  r0, r30
    rcall fx_startup_read_byte
    mov  r1, r30
    fx_disable
    cp   r0, ZERO
    cpc  r1, ZERO
    breq startup_try_tail_fail_disabled

    ; imageBasePage = pageAfterTail - imagePageCount.
    mov  r26, r20
    mov  r27, r21
    sub  r26, r0
    sbc  r27, r1
    sts  data_page_data+0, r26
    sts  data_page_data+1, r27
    sec
    ret

startup_try_tail_fail:
    fx_disable
startup_try_tail_fail_disabled:
    clc
    ret

; Begin a blocking SFC_READ command.
;
; Input physical byte address: r22:r27:r26 (high:middle:low).
fx_startup_begin_read:
    fx_disable
    fx_enable
    ldi  r30, SFC_READ
    rcall fx_spi_transfer_blocking
    mov  r30, r22
    rcall fx_spi_transfer_blocking
    mov  r30, r27
    rcall fx_spi_transfer_blocking
    mov  r30, r26
    rcall fx_spi_transfer_blocking
    ret

; Read one byte from an already-open startup read stream.
; Result is returned in r30.
fx_startup_read_byte:
    mov  r30, ZERO
    rjmp fx_spi_transfer_blocking

; Blocking SPI byte transfer. Input/output: r30. Clobbers r31.
fx_spi_transfer_blocking:
    out  SPDR, r30
1:
    in   r31, SPSR
    sbrs r31, SPIF
    rjmp 1b
    in   r30, SPDR
    ret

; Conservative post-wakeup delay. Startup is not cycle critical.
fx_startup_wake_delay:
    ldi  r26, 32
1:
    dec  r26
    brne 1b
    ret

