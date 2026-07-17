;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Interpreter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; SRAM:
;;     0x0100–0x04FF  static storage (.saved + .data, including zero-initialized bytes)
;;     0x0500–0x08FF  framebuffer
;;     0x0900–0x09FF  VM stack
;;     0x0A00-0x0A03  FX image/save page
;;     0x0A04-0x0A05  requested save size
;;     0x0A06         startup flags
;;     0x0A07–0x0A0A  millisecond counter (little-endian uint32)
;;     0x0A0B–0x0AFF  interpreter-private

#define data_globals    0x0100
#define data_display    0x0500
#define data_stack      0x0900
#define data_page_data      0x0A00
#define data_page_save      (data_page_data+2)
#define data_save_size      (data_page_save+2)
#define data_startup_flags  (data_save_size+2)
#define data_millis         (data_startup_flags+1)

#define STARTUP_SAVE_PAGE_VALID  0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Hardware configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Select at most one complete device preset on the assembler command line:
;
;   -DAVM_DEVICE_ARDUBOY_FX    Arduboy FX; FX chip select is SDA/PD1.
;   -DAVM_DEVICE_ARDUBOY_MINI  Arduboy Mini; FX chip select is HWB/PE2.
;   -DAVM_DEVICE_ARDUBOY_FXC   Arduboy FX-C; FX chip select is HWB/PE2.
;
; AVM_DEVICE_ARDUBOY_FX is the default so existing builds retain their current
; flash wiring. Presets provide defaults only: any individual AVM_* definition
; supplied by the build overrides the corresponding preset/default value.
;
; Supported SPI display controller selections (choose at most one):
;
;   -DAVM_DISPLAY_SSD1306      Default for all standard device presets.
;   -DAVM_DISPLAY_SSD1309
;   -DAVM_DISPLAY_SH1106
;   -DAVM_OLED_CONTRAST=value  Default: 0xCF.
;
; Arduboy2-compatible OLED_SSD1306, OLED_SSD1309, OLED_SH1106, and
; OLED_CONTRAST definitions are also accepted. I2C display definitions are
; intentionally rejected; this interpreter startup supports SPI displays only.
;
; Pin overrides are triples consisting of PORT, DDR, and bit definitions:
;
;   AVM_OLED_CS_PORT / AVM_OLED_CS_DDR / AVM_OLED_CS_BIT
;   AVM_OLED_DC_PORT / AVM_OLED_DC_DDR / AVM_OLED_DC_BIT
;   AVM_OLED_RST_PORT / AVM_OLED_RST_DDR / AVM_OLED_RST_BIT
;   AVM_FX_PORT / AVM_FX_DDR / AVM_FX_BIT
;   AVM_BUTTON_{LEFT,RIGHT,UP,DOWN,A,B}_{PORT,DDR,BIT}
;   AVM_LED_{RED,GREEN,BLUE,TX,RX}_{PORT,DDR,BIT}
;   AVM_RANDOM_SEED_PORT / AVM_RANDOM_SEED_DDR / AVM_RANDOM_SEED_BIT
;
; The hardware SPI pins are fixed by the ATmega32U4: PB1=SCK, PB2=MOSI, and
; PB3=MISO. Set AVM_INIT_RGB_LED or AVM_INIT_TX_RX_LEDS to 0 to omit those
; outputs. Set AVM_INIT_BUTTONS or AVM_INIT_RANDOM_SEED_ADC to 0 to omit those
; inputs. Startup resets and configures the OLED controller, but deliberately
; does not clear the framebuffer or OLED display RAM; the future display SYS
; service will own the first screen update.

#if !defined(AVM_DEVICE_ARDUBOY_FX) && \
    !defined(AVM_DEVICE_ARDUBOY_MINI) && \
    !defined(AVM_DEVICE_ARDUBOY_FXC)
#  define AVM_DEVICE_ARDUBOY_FX
#endif

#if (defined(AVM_DEVICE_ARDUBOY_FX) + \
     defined(AVM_DEVICE_ARDUBOY_MINI) + \
     defined(AVM_DEVICE_ARDUBOY_FXC)) > 1
#  error "Select only one AVM_DEVICE_* preset"
#endif

; Normalize Arduboy2/homemade display-selection names.
#if defined(OLED_SSD1306) && !defined(AVM_DISPLAY_SSD1306)
#  define AVM_DISPLAY_SSD1306
#endif
#if defined(OLED_SSD1309) && !defined(AVM_DISPLAY_SSD1309)
#  define AVM_DISPLAY_SSD1309
#endif
#if defined(OLED_SH1106) && !defined(AVM_DISPLAY_SH1106)
#  define AVM_DISPLAY_SH1106
#endif

#if defined(OLED_SSD1306_I2C) || defined(OLED_SSD1306_I2CX) || \
    defined(OLED_SH1106_I2C) || defined(AVM_DISPLAY_I2C)
#  error "I2C displays are not supported by interpreter startup"
#endif

#if !defined(AVM_DISPLAY_SSD1306) && \
    !defined(AVM_DISPLAY_SSD1309) && \
    !defined(AVM_DISPLAY_SH1106)
#  define AVM_DISPLAY_SSD1306
#endif

#if (defined(AVM_DISPLAY_SSD1306) + \
     defined(AVM_DISPLAY_SSD1309) + \
     defined(AVM_DISPLAY_SH1106)) > 1
#  error "Select only one SPI AVM_DISPLAY_* controller"
#endif

#ifndef AVM_OLED_CONTRAST
#  ifdef OLED_CONTRAST
#    define AVM_OLED_CONTRAST OLED_CONTRAST
#  else
#    define AVM_OLED_CONTRAST 0xCF
#  endif
#endif

#ifndef AVM_INIT_RGB_LED
#  define AVM_INIT_RGB_LED 1
#endif
#ifndef AVM_INIT_TX_RX_LEDS
#  define AVM_INIT_TX_RX_LEDS 1
#endif
#ifndef AVM_INIT_BUTTONS
#  define AVM_INIT_BUTTONS 1
#endif
#ifndef AVM_INIT_RANDOM_SEED_ADC
#  define AVM_INIT_RANDOM_SEED_ADC 1
#endif

; Common OLED wiring for the supported device presets.
#ifndef AVM_OLED_CS_PORT
#  define AVM_OLED_CS_PORT PORTD
#endif
#ifndef AVM_OLED_CS_DDR
#  define AVM_OLED_CS_DDR DDRD
#endif
#ifndef AVM_OLED_CS_BIT
#  define AVM_OLED_CS_BIT PORTD6
#endif

#ifndef AVM_OLED_DC_PORT
#  define AVM_OLED_DC_PORT PORTD
#endif
#ifndef AVM_OLED_DC_DDR
#  define AVM_OLED_DC_DDR DDRD
#endif
#ifndef AVM_OLED_DC_BIT
#  define AVM_OLED_DC_BIT PORTD4
#endif

#ifndef AVM_OLED_RST_PORT
#  define AVM_OLED_RST_PORT PORTD
#endif
#ifndef AVM_OLED_RST_DDR
#  define AVM_OLED_RST_DDR DDRD
#endif
#ifndef AVM_OLED_RST_BIT
#  define AVM_OLED_RST_BIT PORTD7
#endif

; Device-specific serial-flash chip select.
#ifndef AVM_FX_PORT
#  if defined(AVM_DEVICE_ARDUBOY_FX)
#    define AVM_FX_PORT PORTD
#  else
#    define AVM_FX_PORT PORTE
#  endif
#endif
#ifndef AVM_FX_DDR
#  if defined(AVM_DEVICE_ARDUBOY_FX)
#    define AVM_FX_DDR DDRD
#  else
#    define AVM_FX_DDR DDRE
#  endif
#endif
#ifndef AVM_FX_BIT
#  if defined(AVM_DEVICE_ARDUBOY_FX)
#    define AVM_FX_BIT PORTD1
#  else
#    define AVM_FX_BIT PORTE2
#  endif
#endif

; Common button wiring for the supported device presets.
#ifndef AVM_BUTTON_LEFT_PORT
#  define AVM_BUTTON_LEFT_PORT PORTF
#endif
#ifndef AVM_BUTTON_LEFT_DDR
#  define AVM_BUTTON_LEFT_DDR DDRF
#endif
#ifndef AVM_BUTTON_LEFT_BIT
#  define AVM_BUTTON_LEFT_BIT PORTF5
#endif
#ifndef AVM_BUTTON_RIGHT_PORT
#  define AVM_BUTTON_RIGHT_PORT PORTF
#endif
#ifndef AVM_BUTTON_RIGHT_DDR
#  define AVM_BUTTON_RIGHT_DDR DDRF
#endif
#ifndef AVM_BUTTON_RIGHT_BIT
#  define AVM_BUTTON_RIGHT_BIT PORTF6
#endif
#ifndef AVM_BUTTON_UP_PORT
#  define AVM_BUTTON_UP_PORT PORTF
#endif
#ifndef AVM_BUTTON_UP_DDR
#  define AVM_BUTTON_UP_DDR DDRF
#endif
#ifndef AVM_BUTTON_UP_BIT
#  define AVM_BUTTON_UP_BIT PORTF7
#endif
#ifndef AVM_BUTTON_DOWN_PORT
#  define AVM_BUTTON_DOWN_PORT PORTF
#endif
#ifndef AVM_BUTTON_DOWN_DDR
#  define AVM_BUTTON_DOWN_DDR DDRF
#endif
#ifndef AVM_BUTTON_DOWN_BIT
#  define AVM_BUTTON_DOWN_BIT PORTF4
#endif
#ifndef AVM_BUTTON_A_PORT
#  define AVM_BUTTON_A_PORT PORTE
#endif
#ifndef AVM_BUTTON_A_DDR
#  define AVM_BUTTON_A_DDR DDRE
#endif
#ifndef AVM_BUTTON_A_BIT
#  define AVM_BUTTON_A_BIT PORTE6
#endif
#ifndef AVM_BUTTON_B_PORT
#  define AVM_BUTTON_B_PORT PORTB
#endif
#ifndef AVM_BUTTON_B_DDR
#  define AVM_BUTTON_B_DDR DDRB
#endif
#ifndef AVM_BUTTON_B_BIT
#  define AVM_BUTTON_B_BIT PORTB4
#endif

; Standard active-low RGB and USB activity LEDs.
#ifndef AVM_LED_RED_PORT
#  define AVM_LED_RED_PORT PORTB
#endif
#ifndef AVM_LED_RED_DDR
#  define AVM_LED_RED_DDR DDRB
#endif
#ifndef AVM_LED_RED_BIT
#  define AVM_LED_RED_BIT PORTB6
#endif
#ifndef AVM_LED_GREEN_PORT
#  define AVM_LED_GREEN_PORT PORTB
#endif
#ifndef AVM_LED_GREEN_DDR
#  define AVM_LED_GREEN_DDR DDRB
#endif
#ifndef AVM_LED_GREEN_BIT
#  define AVM_LED_GREEN_BIT PORTB7
#endif
#ifndef AVM_LED_BLUE_PORT
#  define AVM_LED_BLUE_PORT PORTB
#endif
#ifndef AVM_LED_BLUE_DDR
#  define AVM_LED_BLUE_DDR DDRB
#endif
#ifndef AVM_LED_BLUE_BIT
#  define AVM_LED_BLUE_BIT PORTB5
#endif
#ifndef AVM_LED_TX_PORT
#  define AVM_LED_TX_PORT PORTD
#endif
#ifndef AVM_LED_TX_DDR
#  define AVM_LED_TX_DDR DDRD
#endif
#ifndef AVM_LED_TX_BIT
#  define AVM_LED_TX_BIT PORTD5
#endif
#ifndef AVM_LED_RX_PORT
#  define AVM_LED_RX_PORT PORTB
#endif
#ifndef AVM_LED_RX_DDR
#  define AVM_LED_RX_DDR DDRB
#endif
#ifndef AVM_LED_RX_BIT
#  define AVM_LED_RX_BIT PORTB0
#endif

#ifndef AVM_RANDOM_SEED_PORT
#  define AVM_RANDOM_SEED_PORT PORTF
#endif
#ifndef AVM_RANDOM_SEED_DDR
#  define AVM_RANDOM_SEED_DDR DDRF
#endif
#ifndef AVM_RANDOM_SEED_BIT
#  define AVM_RANDOM_SEED_BIT PORTF1
#endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Native register allocation and architectural state
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AVR r0:r1     MUL result and unrestricted interpreter scratch
; AVR r2        permanent zero; SPI dummy-transmit byte
; AVR r3        permanent one
; AVR r4:r6     24-bit VM program counter, little-endian
; AVR r7        permanent four; primary-table stride in AVR words
; AVR r8:r23    AVM architectural registers r0-r7
; AVR r24:r27   general interpreter scratch (X is r26:r27)
; AVR r28:r29   AVM stack pointer (Y)
; AVR r30:r31   general scratch and dispatch target (Z)
; GPIOR0        architectural VM_FLAGS
;
; r2, r3, and r7 are initialized once and are immutable thereafter. Native
; r0:r1 have no ABI zero-register requirement; this runtime is assembly-only.

#define PRIMARY_TABLE_ORG          0x0200
#define PRIMARY_STRIDE_WORDS       4
#define PRIMARY_STRIDE_BYTES       (2 * PRIMARY_STRIDE_WORDS)
#define PRIMARY_OPCODE             r24

; Generic bounded-secondary decoder scratch allocation. PRIMARY_OPCODE and
; SECONDARY_OPCODE deliberately alias r24: once a prefix slot has been entered,
; the primary opcode is no longer needed except by specialized prefix handlers.
#define SECONDARY_OPCODE           r24
#define SECONDARY_LIMIT            r25
#define SECONDARY_MULTIPLIER       r26

; Shared F0 operand-fetch ABI. The one-byte helper returns the consumed byte in
; F0_OPERAND_LO. The two-byte helper returns a little-endian operand in
; F0_OPERAND_HI:F0_OPERAND_LO. F0_SPEC aliases the one-byte result for RRSPEC
; and future program-space operand specifiers.
#define F0_OPERAND_LO              r24
#define F0_OPERAND_HI              r25
#define F0_SPEC                    r24
#define F0_DECODE_SCRATCH          r25
; F0 6C-6D keep dddWaaaP in native r1 after the reverse-order fetch.
; Native r1 has no ABI zero-register requirement in this assembly-only runtime.
#define F0_COLDMEM_SPEC            r1

; FB-FD shared conditional-move gate scratch allocation.
#define CMOV_TEST                  r25
#define CMOV_SECONDARY             r26
#define CMOV_MASK                  r27

#define ZERO                       r2
#define ONE                        r3
#define FOUR                       r7

#define VM_PCL                     r4
#define VM_PCM                     r5
#define VM_PCH                     r6

#define VM_FLAGS                   GPIOR0

#define VM_SP_INITIAL_VALUE        0x0A00
#define VM_SP                      r28
#define VM_SPL                     r28
#define VM_SPH                     r29

#define VM_R0                      r8
#define VM_R1                      r10
#define VM_R2                      r12
#define VM_R3                      r14
#define VM_R4                      r16
#define VM_R5                      r18
#define VM_R6                      r20
#define VM_R7                      r22

#define VM_R0L                     r8
#define VM_R1L                     r10
#define VM_R2L                     r12
#define VM_R3L                     r14
#define VM_R4L                     r16
#define VM_R5L                     r18
#define VM_R6L                     r20
#define VM_R7L                     r22

#define VM_R0H                     r9
#define VM_R1H                     r11
#define VM_R2H                     r13
#define VM_R3H                     r15
#define VM_R4H                     r17
#define VM_R5H                     r19
#define VM_R6H                     r21
#define VM_R7H                     r23

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

#if (PRIMARY_TABLE_ORG & 0x1FF) != 0
#  error "Primary dispatch requires 256-word (512-byte) alignment"
#endif
; OLED display control. All supported controllers use active-low CS and reset,
; with D/C low for commands and high for display data.
.macro display_enable
    cbi  AVM_OLED_CS_PORT, AVM_OLED_CS_BIT
.endm

.macro display_disable
    sbi  AVM_OLED_CS_PORT, AVM_OLED_CS_BIT
.endm

.macro display_command_mode
    cbi  AVM_OLED_DC_PORT, AVM_OLED_DC_BIT
.endm

.macro display_data_mode
    sbi  AVM_OLED_DC_PORT, AVM_OLED_DC_BIT
.endm

; Generic GPIO setup helpers. PORT is written before DDR for outputs so OLED,
; flash, and active-low LED pins never glitch through an unintended level.
.macro pin_output_high port, ddr, bit
    sbi  \port, \bit
    sbi  \ddr,  \bit
.endm

.macro pin_output_low port, ddr, bit
    cbi  \port, \bit
    sbi  \ddr,  \bit
.endm

.macro pin_input_pullup port, ddr, bit
    cbi  \ddr,  \bit
    sbi  \port, \bit
.endm

.macro pin_input_floating port, ddr, bit
    cbi  \ddr,  \bit
    cbi  \port, \bit
.endm

; Serial Flash Commands (W25Q128)
#define SFC_READ               0x03
#define SFC_WRITE_ENABLE       0x06
#define SFC_WRITE              0x02
#define SFC_ERASE              0x20
#define SFC_RELEASE_POWERDOWN  0xAB

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
#define AVM_RUNTIME_VERSION          0x01
#define AVM_HEADER_DATA_SIZE_OFFSET 0x08
#define AVM_HEADER_SAVE_SIZE_OFFSET 0x0A
#define AVM_DATA_IMAGE_OFFSET         0x0100

; The mandatory eight-byte image tail occupies the final eight bytes of the
; linked image. Only the first six bytes are needed by startup:
;   41 56 54 01, imagePageCountLo, imagePageCountHi
#define AVM_TAIL_MAGIC0         0x41
#define AVM_TAIL_MAGIC1         0x56
#define AVM_TAIL_MAGIC2         0x54
#define AVM_TAIL_MAGIC3         0x01
#define AVM_TAIL_OFFSET_IN_PAGE 0xF8

; Arduboy system ABI service identifiers.
#define SYS_DEBUG_PUTC          0x00
#define SYS_DEBUG_BREAK         0x01
#define SYS_MILLIS              0x02
#define SYS_MILLIS32            0x03

; Development/emulator images either end at the end of the 16 MiB flash or
; end immediately before a final 4 KiB save sector.
#define FX_DEV_TAIL_NOSAVE_HI   0xFF
#define FX_DEV_TAIL_NOSAVE_MID  0xFF
#define FX_DEV_TAIL_SAVE_HI     0xFF
#define FX_DEV_TAIL_SAVE_MID    0xEF
#define FX_DEV_SAVE_PAGE_LO     0xF0
#define FX_DEV_SAVE_PAGE_HI     0xFF

.macro fx_enable
cbi  AVM_FX_PORT, AVM_FX_BIT
.endm

.macro fx_disable
sbi  AVM_FX_PORT, AVM_FX_BIT
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Shared F0 register-file decode macros
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; These macros convert architectural register indices or pre-scaled RRSPEC
; offsets into native AVR data-space pointers. They intentionally inline at the
; eventual cold handler so decoding adds no RCALL/RET overhead. All
; architectural registers occupy native r8-r23, below data-space address 0x100.
;
; The input scratch register must be in r16-r31 because ANDI/SUBI are used. The
; macro may be called with scratch == pointer-low; the explicit MOV remains
; valid in that case. Native flags are clobbered.

.macro f0_decode_r_index_to_ptr scratch, ptrl, ptrh
    andi  \scratch, 0x07
    lsl   \scratch
    subi  \scratch, -8
    mov   \ptrl, \scratch
    mov   \ptrh, ZERO
.endm

.macro f0_decode_q_index_to_ptr scratch, ptrl, ptrh
    andi  \scratch, 0x03
    lsl   \scratch
    lsl   \scratch
    subi  \scratch, -8
    mov   \ptrl, \scratch
    mov   \ptrh, ZERO
.endm

; Decode dddWaaaP used by F0 6C-6D. X receives the data-register pointer from
; bits 7:5 and Z receives the address-register pointer from bits 3:1. The
; encoded fields are already positioned as doubled native-register indices,
; so no shift or range validation is required. W and P remain in the preserved
; specifier. Native flags are clobbered.
.macro f0_decode_general_pointer_spec spec
    mov   r26, \spec
    swap  r26
    andi  r26, 0x0e
    subi  r26, -8
    mov   r27, ZERO

    mov   r30, \spec
    andi  r30, 0x0e
    subi  r30, -8
    mov   r31, ZERO
.endm


; Decode the pre-scaled nibble offsets used by F0 69-6B. X receives the high
; nibble operand and Z the low nibble operand. Alignment validation remains the
; responsibility of the operation-specific handler. F0_DECODE_SCRATCH is
; clobbered.
.macro f0_decode_prescaled_pair_spec spec
    mov   F0_DECODE_SCRATCH, \spec
    swap  F0_DECODE_SCRATCH
    andi  F0_DECODE_SCRATCH, 0x0f
    subi  F0_DECODE_SCRATCH, -8
    mov   r26, F0_DECODE_SCRATCH
    mov   r27, ZERO

    mov   F0_DECODE_SCRATCH, \spec
    andi  F0_DECODE_SCRATCH, 0x0f
    subi  F0_DECODE_SCRATCH, -8
    mov   r30, F0_DECODE_SCRATCH
    mov   r31, ZERO
.endm

; Sign-extend a fetched byte in F0_OPERAND_LO into F0_OPERAND_HI.
.macro f0_sign_extend_operand
    clr   F0_OPERAND_HI
    sbrc  F0_OPERAND_LO, 7
    com   F0_OPERAND_HI
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
    jmp timer0_compa_isr    ; 21 TIMER0 COMPA
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

; Timer0 compare-A fires once per millisecond. Preserve the interrupted native
; state; the VM register file may be live in any AVR register when this runs.
timer0_compa_isr:
    push r0
    in   r0, SREG
    push r0

    lds  r0, data_millis+0
    inc  r0
    sts  data_millis+0, r0
    brne timer0_compa_isr_done

    lds  r0, data_millis+1
    inc  r0
    sts  data_millis+1, r0
    brne timer0_compa_isr_done

    lds  r0, data_millis+2
    inc  r0
    sts  data_millis+2, r0
    brne timer0_compa_isr_done

    lds  r0, data_millis+3
    inc  r0
    sts  data_millis+3, r0

timer0_compa_isr_done:
    pop  r0
    out  SREG, r0
    pop  r0
    reti

reset_handler:
    ; Keep the vector area small. The complete startup path is placed after
    ; the fixed-stride dispatch table so it cannot collide with .org 0x0200.
    jmp startup_func


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Primary dispatch machinery
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; The primary table has 256 fixed four-word slots. A completed short handler
; ends with RJMP to a shared cadence tail; a longer primary handler may use its
; fourth word to forward to an out-of-line continuation. All defined non-prefix
; primary opcodes through 0xEF are implemented below. The implemented secondary
; pages use the decoder and cadence infrastructure after the primary table;
; reserved encodings trap as invalid.

; Standard 18-cycle sequential dispatch. Advance the low PC byte before
; reading the completed opcode. IN and OUT preserve carry, so the middle and
; high-byte updates remain a valid 24-bit increment after the handoff. Moving
; this one instruction before OUT makes the selected primary slot begin on
; cycle 9 after OUT.
.macro dispatch
    add  VM_PCL, ONE
    in   PRIMARY_OPCODE, SPDR
    out  SPDR, ZERO
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    mul  PRIMARY_OPCODE, FOUR
    movw r30, r0
    subi r31, hi8(-(pm(primary_table)))
    ijmp
.endm

; Reverse-order 17-cycle sequential dispatch. Complete the entire 24-bit PC
; increment before the protected SPDR handoff. CLI, OUT, IN, and SEI preserve
; the arithmetic flags, including carry; the shorter post-OUT path makes the
; selected primary slot begin on cycle 9 after OUT, matching standard dispatch.
.macro dispatch_reverse
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei
    mul  PRIMARY_OPCODE, FOUR
    movw r30, r0
    subi r31, hi8(-(pm(primary_table)))
    ijmp
.endm

; A skeleton slot is exactly four AVR words. The three unreachable NOPs reserve
; the words that a future direct handler or setup sequence may occupy.
.macro emit_primary_stub label, target
\label:
    rjmp \target
    nop
    nop
    nop
.Lprimary_stub_end_\@:
    .if (.Lprimary_stub_end_\@ - \label) != PRIMARY_STRIDE_BYTES
        .error "primary dispatch slot is not exactly four words"
    .endif
.endm


; All direct primary-emission macros below produce exactly four AVR words.
; Padding after an unconditional RJMP is unreachable and exists only to retain
; the fixed primary-table stride.

.macro assert_primary_slot_width label
.Lprimary_slot_end_\@:
    .if (.Lprimary_slot_end_\@ - \label) != PRIMARY_STRIDE_BYTES
        .error "implemented primary dispatch slot is not exactly four words"
    .endif
.endm

; 3 handler cycles plus one landing-pad cycle -> 17-cycle cadence.
.macro emit_primary_mov label, dst, src
\label:
    movw \dst, \src
    rjmp cluster_tail_17_delay_1
    nop
    nop
    assert_primary_slot_width \label
.endm

; 4 handler cycles -> 17-cycle cadence.
.macro emit_primary_binary label, lowop, highop, dstl, dsth, srcl, srch
\label:
    \lowop  \dstl, \srcl
    \highop \dsth, \srch
    rjmp cluster_tail_17
    nop
    assert_primary_slot_width \label
.endm

; Capture native SREG in PRIMARY_OPCODE and commit it to architectural
; VM_FLAGS through a dedicated 18-cycle dispatch landing.
.macro emit_primary_cmp label, lhsl, lhsh, rhsl, rhsh
\label:
    cp   \lhsl, \rhsl
    cpc  \lhsh, \rhsh
    in   PRIMARY_OPCODE, SREG
    rjmp flags_commit_18_delay_1
    assert_primary_slot_width \label
.endm

; Capture the address in X before overwriting the destination. This preserves
; the specified alias behavior when rD == rA.
.macro emit_primary_ld8u label, dstl, dsth, addr
\label:
    movw r26, \addr
    ld   \dstl, X
    clr  \dsth
    rjmp cluster_tail_18_delay_1
    assert_primary_slot_width \label
.endm

.macro emit_primary_st8 label, addr, srcl
\label:
    movw r26, \addr
    st   X, \srcl
    rjmp cluster_tail_18_delay_2
    nop
    assert_primary_slot_width \label
.endm

.macro emit_primary_ld16 label, dstl, dsth, addr
\label:
    movw r26, \addr
    ld   \dstl, X+
    ld   \dsth, X
    rjmp cluster_tail_18
    assert_primary_slot_width \label
.endm

.macro emit_primary_st16 label, addr, srcl, srch
\label:
    movw r26, \addr
    st   X+, \srcl
    st   X,  \srch
    rjmp cluster_tail_18
    assert_primary_slot_width \label
.endm

; The VM stack grows downward. PUSH stores high then low so VM_SP points at
; the little-endian low byte; POP reverses the operation.
.macro emit_primary_push16 label, srcl, srch
\label:
    st   -Y, \srch
    st   -Y, \srcl
    rjmp cluster_tail_18_delay_1
    nop
    assert_primary_slot_width \label
.endm

.macro emit_primary_pop16 label, dstl, dsth
\label:
    ld   \dstl, Y+
    ld   \dsth, Y+
    rjmp cluster_tail_18_delay_1
    nop
    assert_primary_slot_width \label
.endm

; Multi-byte primary slots preload a destination-specific apply address in Z,
; then forward to a family-shared operand-fetch continuation. The fourth word
; is padding so every slot retains the fixed four-word primary stride.
.macro emit_primary_immediate label, apply, fetch
\label:
    ldi  r30, lo8(pm(\apply))
    ldi  r31, hi8(pm(\apply))
    nop
    rjmp \fetch
    assert_primary_slot_width \label
.endm

; Generic bounded-page prefix. The slot preloads the page bound and table base,
; then forwards either to a width stub or directly to a specialized decoder.
.macro emit_primary_bounded_page label, limit, table, width_stub
\label:
    ldi  SECONDARY_LIMIT, \limit
    ldi  r30, lo8(pm(\table))
    ldi  r31, hi8(pm(\table))
    rjmp \width_stub
    assert_primary_slot_width \label
.endm

; FB-FD each preload a one-bit architectural-condition mask and the shared
; two-word CMOV table address. The secondary byte is already in flight.
.macro emit_primary_cmov_page label, mask
\label:
    ldi  CMOV_MASK, \mask
    ldi  r30, lo8(pm(cmov_table))
    ldi  r31, hi8(pm(cmov_table))
    rjmp cmov_gate
    assert_primary_slot_width \label
.endm

.org PRIMARY_TABLE_ORG
.global primary_table
.global abvm_interp
primary_table:
abvm_interp:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x00-0x0F: MOV rD,rS (rD,rS in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_mov primary_00, VM_R4, VM_R4
emit_primary_mov primary_01, VM_R4, VM_R5
emit_primary_mov primary_02, VM_R4, VM_R6
emit_primary_mov primary_03, VM_R4, VM_R7
emit_primary_mov primary_04, VM_R5, VM_R4
emit_primary_mov primary_05, VM_R5, VM_R5
emit_primary_mov primary_06, VM_R5, VM_R6
emit_primary_mov primary_07, VM_R5, VM_R7
emit_primary_mov primary_08, VM_R6, VM_R4
emit_primary_mov primary_09, VM_R6, VM_R5
emit_primary_mov primary_0A, VM_R6, VM_R6
emit_primary_mov primary_0B, VM_R6, VM_R7
emit_primary_mov primary_0C, VM_R7, VM_R4
emit_primary_mov primary_0D, VM_R7, VM_R5
emit_primary_mov primary_0E, VM_R7, VM_R6
emit_primary_mov primary_0F, VM_R7, VM_R7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x10-0x1F: ADD rD,rS (rD,rS in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_binary primary_10, add, adc, VM_R4L, VM_R4H, VM_R4L, VM_R4H
emit_primary_binary primary_11, add, adc, VM_R4L, VM_R4H, VM_R5L, VM_R5H
emit_primary_binary primary_12, add, adc, VM_R4L, VM_R4H, VM_R6L, VM_R6H
emit_primary_binary primary_13, add, adc, VM_R4L, VM_R4H, VM_R7L, VM_R7H
emit_primary_binary primary_14, add, adc, VM_R5L, VM_R5H, VM_R4L, VM_R4H
emit_primary_binary primary_15, add, adc, VM_R5L, VM_R5H, VM_R5L, VM_R5H
emit_primary_binary primary_16, add, adc, VM_R5L, VM_R5H, VM_R6L, VM_R6H
emit_primary_binary primary_17, add, adc, VM_R5L, VM_R5H, VM_R7L, VM_R7H
emit_primary_binary primary_18, add, adc, VM_R6L, VM_R6H, VM_R4L, VM_R4H
emit_primary_binary primary_19, add, adc, VM_R6L, VM_R6H, VM_R5L, VM_R5H
emit_primary_binary primary_1A, add, adc, VM_R6L, VM_R6H, VM_R6L, VM_R6H
emit_primary_binary primary_1B, add, adc, VM_R6L, VM_R6H, VM_R7L, VM_R7H
emit_primary_binary primary_1C, add, adc, VM_R7L, VM_R7H, VM_R4L, VM_R4H
emit_primary_binary primary_1D, add, adc, VM_R7L, VM_R7H, VM_R5L, VM_R5H
emit_primary_binary primary_1E, add, adc, VM_R7L, VM_R7H, VM_R6L, VM_R6H
emit_primary_binary primary_1F, add, adc, VM_R7L, VM_R7H, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x20-0x2F: SUB rD,rS (rD,rS in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_binary primary_20, sub, sbc, VM_R4L, VM_R4H, VM_R4L, VM_R4H
emit_primary_binary primary_21, sub, sbc, VM_R4L, VM_R4H, VM_R5L, VM_R5H
emit_primary_binary primary_22, sub, sbc, VM_R4L, VM_R4H, VM_R6L, VM_R6H
emit_primary_binary primary_23, sub, sbc, VM_R4L, VM_R4H, VM_R7L, VM_R7H
emit_primary_binary primary_24, sub, sbc, VM_R5L, VM_R5H, VM_R4L, VM_R4H
emit_primary_binary primary_25, sub, sbc, VM_R5L, VM_R5H, VM_R5L, VM_R5H
emit_primary_binary primary_26, sub, sbc, VM_R5L, VM_R5H, VM_R6L, VM_R6H
emit_primary_binary primary_27, sub, sbc, VM_R5L, VM_R5H, VM_R7L, VM_R7H
emit_primary_binary primary_28, sub, sbc, VM_R6L, VM_R6H, VM_R4L, VM_R4H
emit_primary_binary primary_29, sub, sbc, VM_R6L, VM_R6H, VM_R5L, VM_R5H
emit_primary_binary primary_2A, sub, sbc, VM_R6L, VM_R6H, VM_R6L, VM_R6H
emit_primary_binary primary_2B, sub, sbc, VM_R6L, VM_R6H, VM_R7L, VM_R7H
emit_primary_binary primary_2C, sub, sbc, VM_R7L, VM_R7H, VM_R4L, VM_R4H
emit_primary_binary primary_2D, sub, sbc, VM_R7L, VM_R7H, VM_R5L, VM_R5H
emit_primary_binary primary_2E, sub, sbc, VM_R7L, VM_R7H, VM_R6L, VM_R6H
emit_primary_binary primary_2F, sub, sbc, VM_R7L, VM_R7H, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x30-0x3F: CMP rL,rR (rL,rR in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_cmp primary_30, VM_R4L, VM_R4H, VM_R4L, VM_R4H
emit_primary_cmp primary_31, VM_R4L, VM_R4H, VM_R5L, VM_R5H
emit_primary_cmp primary_32, VM_R4L, VM_R4H, VM_R6L, VM_R6H
emit_primary_cmp primary_33, VM_R4L, VM_R4H, VM_R7L, VM_R7H
emit_primary_cmp primary_34, VM_R5L, VM_R5H, VM_R4L, VM_R4H
emit_primary_cmp primary_35, VM_R5L, VM_R5H, VM_R5L, VM_R5H
emit_primary_cmp primary_36, VM_R5L, VM_R5H, VM_R6L, VM_R6H
emit_primary_cmp primary_37, VM_R5L, VM_R5H, VM_R7L, VM_R7H
emit_primary_cmp primary_38, VM_R6L, VM_R6H, VM_R4L, VM_R4H
emit_primary_cmp primary_39, VM_R6L, VM_R6H, VM_R5L, VM_R5H
emit_primary_cmp primary_3A, VM_R6L, VM_R6H, VM_R6L, VM_R6H
emit_primary_cmp primary_3B, VM_R6L, VM_R6H, VM_R7L, VM_R7H
emit_primary_cmp primary_3C, VM_R7L, VM_R7H, VM_R4L, VM_R4H
emit_primary_cmp primary_3D, VM_R7L, VM_R7H, VM_R5L, VM_R5H
emit_primary_cmp primary_3E, VM_R7L, VM_R7H, VM_R6L, VM_R6H
emit_primary_cmp primary_3F, VM_R7L, VM_R7H, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x40-0x4F: LD8U rD,[rA] (rD,rA in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_ld8u primary_40, VM_R4L, VM_R4H, VM_R4
emit_primary_ld8u primary_41, VM_R4L, VM_R4H, VM_R5
emit_primary_ld8u primary_42, VM_R4L, VM_R4H, VM_R6
emit_primary_ld8u primary_43, VM_R4L, VM_R4H, VM_R7
emit_primary_ld8u primary_44, VM_R5L, VM_R5H, VM_R4
emit_primary_ld8u primary_45, VM_R5L, VM_R5H, VM_R5
emit_primary_ld8u primary_46, VM_R5L, VM_R5H, VM_R6
emit_primary_ld8u primary_47, VM_R5L, VM_R5H, VM_R7
emit_primary_ld8u primary_48, VM_R6L, VM_R6H, VM_R4
emit_primary_ld8u primary_49, VM_R6L, VM_R6H, VM_R5
emit_primary_ld8u primary_4A, VM_R6L, VM_R6H, VM_R6
emit_primary_ld8u primary_4B, VM_R6L, VM_R6H, VM_R7
emit_primary_ld8u primary_4C, VM_R7L, VM_R7H, VM_R4
emit_primary_ld8u primary_4D, VM_R7L, VM_R7H, VM_R5
emit_primary_ld8u primary_4E, VM_R7L, VM_R7H, VM_R6
emit_primary_ld8u primary_4F, VM_R7L, VM_R7H, VM_R7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x50-0x5F: ST8 [rA],rS (rA,rS in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_st8 primary_50, VM_R4, VM_R4L
emit_primary_st8 primary_51, VM_R4, VM_R5L
emit_primary_st8 primary_52, VM_R4, VM_R6L
emit_primary_st8 primary_53, VM_R4, VM_R7L
emit_primary_st8 primary_54, VM_R5, VM_R4L
emit_primary_st8 primary_55, VM_R5, VM_R5L
emit_primary_st8 primary_56, VM_R5, VM_R6L
emit_primary_st8 primary_57, VM_R5, VM_R7L
emit_primary_st8 primary_58, VM_R6, VM_R4L
emit_primary_st8 primary_59, VM_R6, VM_R5L
emit_primary_st8 primary_5A, VM_R6, VM_R6L
emit_primary_st8 primary_5B, VM_R6, VM_R7L
emit_primary_st8 primary_5C, VM_R7, VM_R4L
emit_primary_st8 primary_5D, VM_R7, VM_R5L
emit_primary_st8 primary_5E, VM_R7, VM_R6L
emit_primary_st8 primary_5F, VM_R7, VM_R7L

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x60-0x6F: LD16 rD,[rA] (rD,rA in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_ld16 primary_60, VM_R4L, VM_R4H, VM_R4
emit_primary_ld16 primary_61, VM_R4L, VM_R4H, VM_R5
emit_primary_ld16 primary_62, VM_R4L, VM_R4H, VM_R6
emit_primary_ld16 primary_63, VM_R4L, VM_R4H, VM_R7
emit_primary_ld16 primary_64, VM_R5L, VM_R5H, VM_R4
emit_primary_ld16 primary_65, VM_R5L, VM_R5H, VM_R5
emit_primary_ld16 primary_66, VM_R5L, VM_R5H, VM_R6
emit_primary_ld16 primary_67, VM_R5L, VM_R5H, VM_R7
emit_primary_ld16 primary_68, VM_R6L, VM_R6H, VM_R4
emit_primary_ld16 primary_69, VM_R6L, VM_R6H, VM_R5
emit_primary_ld16 primary_6A, VM_R6L, VM_R6H, VM_R6
emit_primary_ld16 primary_6B, VM_R6L, VM_R6H, VM_R7
emit_primary_ld16 primary_6C, VM_R7L, VM_R7H, VM_R4
emit_primary_ld16 primary_6D, VM_R7L, VM_R7H, VM_R5
emit_primary_ld16 primary_6E, VM_R7L, VM_R7H, VM_R6
emit_primary_ld16 primary_6F, VM_R7L, VM_R7H, VM_R7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x70-0x7F: ST16 [rA],rS (rA,rS in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_st16 primary_70, VM_R4, VM_R4L, VM_R4H
emit_primary_st16 primary_71, VM_R4, VM_R5L, VM_R5H
emit_primary_st16 primary_72, VM_R4, VM_R6L, VM_R6H
emit_primary_st16 primary_73, VM_R4, VM_R7L, VM_R7H
emit_primary_st16 primary_74, VM_R5, VM_R4L, VM_R4H
emit_primary_st16 primary_75, VM_R5, VM_R5L, VM_R5H
emit_primary_st16 primary_76, VM_R5, VM_R6L, VM_R6H
emit_primary_st16 primary_77, VM_R5, VM_R7L, VM_R7H
emit_primary_st16 primary_78, VM_R6, VM_R4L, VM_R4H
emit_primary_st16 primary_79, VM_R6, VM_R5L, VM_R5H
emit_primary_st16 primary_7A, VM_R6, VM_R6L, VM_R6H
emit_primary_st16 primary_7B, VM_R6, VM_R7L, VM_R7H
emit_primary_st16 primary_7C, VM_R7, VM_R4L, VM_R4H
emit_primary_st16 primary_7D, VM_R7, VM_R5L, VM_R5H
emit_primary_st16 primary_7E, VM_R7, VM_R6L, VM_R6H
emit_primary_st16 primary_7F, VM_R7, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x80-0x8F: AND rD,rS (rD,rS in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_binary primary_80, and, and, VM_R4L, VM_R4H, VM_R4L, VM_R4H
emit_primary_binary primary_81, and, and, VM_R4L, VM_R4H, VM_R5L, VM_R5H
emit_primary_binary primary_82, and, and, VM_R4L, VM_R4H, VM_R6L, VM_R6H
emit_primary_binary primary_83, and, and, VM_R4L, VM_R4H, VM_R7L, VM_R7H
emit_primary_binary primary_84, and, and, VM_R5L, VM_R5H, VM_R4L, VM_R4H
emit_primary_binary primary_85, and, and, VM_R5L, VM_R5H, VM_R5L, VM_R5H
emit_primary_binary primary_86, and, and, VM_R5L, VM_R5H, VM_R6L, VM_R6H
emit_primary_binary primary_87, and, and, VM_R5L, VM_R5H, VM_R7L, VM_R7H
emit_primary_binary primary_88, and, and, VM_R6L, VM_R6H, VM_R4L, VM_R4H
emit_primary_binary primary_89, and, and, VM_R6L, VM_R6H, VM_R5L, VM_R5H
emit_primary_binary primary_8A, and, and, VM_R6L, VM_R6H, VM_R6L, VM_R6H
emit_primary_binary primary_8B, and, and, VM_R6L, VM_R6H, VM_R7L, VM_R7H
emit_primary_binary primary_8C, and, and, VM_R7L, VM_R7H, VM_R4L, VM_R4H
emit_primary_binary primary_8D, and, and, VM_R7L, VM_R7H, VM_R5L, VM_R5H
emit_primary_binary primary_8E, and, and, VM_R7L, VM_R7H, VM_R6L, VM_R6H
emit_primary_binary primary_8F, and, and, VM_R7L, VM_R7H, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x90-0x9F: OR rD,rS (rD,rS in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_binary primary_90, or, or, VM_R4L, VM_R4H, VM_R4L, VM_R4H
emit_primary_binary primary_91, or, or, VM_R4L, VM_R4H, VM_R5L, VM_R5H
emit_primary_binary primary_92, or, or, VM_R4L, VM_R4H, VM_R6L, VM_R6H
emit_primary_binary primary_93, or, or, VM_R4L, VM_R4H, VM_R7L, VM_R7H
emit_primary_binary primary_94, or, or, VM_R5L, VM_R5H, VM_R4L, VM_R4H
emit_primary_binary primary_95, or, or, VM_R5L, VM_R5H, VM_R5L, VM_R5H
emit_primary_binary primary_96, or, or, VM_R5L, VM_R5H, VM_R6L, VM_R6H
emit_primary_binary primary_97, or, or, VM_R5L, VM_R5H, VM_R7L, VM_R7H
emit_primary_binary primary_98, or, or, VM_R6L, VM_R6H, VM_R4L, VM_R4H
emit_primary_binary primary_99, or, or, VM_R6L, VM_R6H, VM_R5L, VM_R5H
emit_primary_binary primary_9A, or, or, VM_R6L, VM_R6H, VM_R6L, VM_R6H
emit_primary_binary primary_9B, or, or, VM_R6L, VM_R6H, VM_R7L, VM_R7H
emit_primary_binary primary_9C, or, or, VM_R7L, VM_R7H, VM_R4L, VM_R4H
emit_primary_binary primary_9D, or, or, VM_R7L, VM_R7H, VM_R5L, VM_R5H
emit_primary_binary primary_9E, or, or, VM_R7L, VM_R7H, VM_R6L, VM_R6H
emit_primary_binary primary_9F, or, or, VM_R7L, VM_R7H, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xA0-0xAF: XOR rD,rS (rD,rS in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_binary primary_A0, eor, eor, VM_R4L, VM_R4H, VM_R4L, VM_R4H
emit_primary_binary primary_A1, eor, eor, VM_R4L, VM_R4H, VM_R5L, VM_R5H
emit_primary_binary primary_A2, eor, eor, VM_R4L, VM_R4H, VM_R6L, VM_R6H
emit_primary_binary primary_A3, eor, eor, VM_R4L, VM_R4H, VM_R7L, VM_R7H
emit_primary_binary primary_A4, eor, eor, VM_R5L, VM_R5H, VM_R4L, VM_R4H
emit_primary_binary primary_A5, eor, eor, VM_R5L, VM_R5H, VM_R5L, VM_R5H
emit_primary_binary primary_A6, eor, eor, VM_R5L, VM_R5H, VM_R6L, VM_R6H
emit_primary_binary primary_A7, eor, eor, VM_R5L, VM_R5H, VM_R7L, VM_R7H
emit_primary_binary primary_A8, eor, eor, VM_R6L, VM_R6H, VM_R4L, VM_R4H
emit_primary_binary primary_A9, eor, eor, VM_R6L, VM_R6H, VM_R5L, VM_R5H
emit_primary_binary primary_AA, eor, eor, VM_R6L, VM_R6H, VM_R6L, VM_R6H
emit_primary_binary primary_AB, eor, eor, VM_R6L, VM_R6H, VM_R7L, VM_R7H
emit_primary_binary primary_AC, eor, eor, VM_R7L, VM_R7H, VM_R4L, VM_R4H
emit_primary_binary primary_AD, eor, eor, VM_R7L, VM_R7H, VM_R5L, VM_R5H
emit_primary_binary primary_AE, eor, eor, VM_R7L, VM_R7H, VM_R6L, VM_R6H
emit_primary_binary primary_AF, eor, eor, VM_R7L, VM_R7H, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xB0-0xB7: PUSH16 rN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_push16 primary_B0_push16_r0, VM_R0L, VM_R0H
emit_primary_push16 primary_B1_push16_r1, VM_R1L, VM_R1H
emit_primary_push16 primary_B2_push16_r2, VM_R2L, VM_R2H
emit_primary_push16 primary_B3_push16_r3, VM_R3L, VM_R3H
emit_primary_push16 primary_B4_push16_r4, VM_R4L, VM_R4H
emit_primary_push16 primary_B5_push16_r5, VM_R5L, VM_R5H
emit_primary_push16 primary_B6_push16_r6, VM_R6L, VM_R6H
emit_primary_push16 primary_B7_push16_r7, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xB8-0xBF: POP16 rN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_pop16 primary_B8_pop16_r0, VM_R0L, VM_R0H
emit_primary_pop16 primary_B9_pop16_r1, VM_R1L, VM_R1H
emit_primary_pop16 primary_BA_pop16_r2, VM_R2L, VM_R2H
emit_primary_pop16 primary_BB_pop16_r3, VM_R3L, VM_R3H
emit_primary_pop16 primary_BC_pop16_r4, VM_R4L, VM_R4H
emit_primary_pop16 primary_BD_pop16_r5, VM_R5L, VM_R5H
emit_primary_pop16 primary_BE_pop16_r6, VM_R6L, VM_R6H
emit_primary_pop16 primary_BF_pop16_r7, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC0-0xC3: LDI8 rD,imm8 (rD in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_immediate primary_R4_ldi8_r4, ldi8_r4_apply, fetch_imm8_then_ijmp
emit_primary_immediate primary_R5_ldi8_r5, ldi8_r5_apply, fetch_imm8_then_ijmp
emit_primary_immediate primary_R6_ldi8_r6, ldi8_r6_apply, fetch_imm8_then_ijmp
emit_primary_immediate primary_R7_ldi8_r7, ldi8_r7_apply, fetch_imm8_then_ijmp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC4-0xC7: LDI16 rD,imm16 (rD in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_immediate primary_C4_ldi16_r4, ldi16_r4_apply, fetch_imm16_then_ijmp
emit_primary_immediate primary_C5_ldi16_r5, ldi16_r5_apply, fetch_imm16_then_ijmp
emit_primary_immediate primary_C6_ldi16_r6, ldi16_r6_apply, fetch_imm16_then_ijmp
emit_primary_immediate primary_C7_ldi16_r7, ldi16_r7_apply, fetch_imm16_then_ijmp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC8-0xCB: ADDI.S8 rD,simm8 (rD in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_immediate primary_C8_addi_s8_r4, addi_s8_r4_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_C9_addi_s8_r5, addi_s8_r5_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_CA_addi_s8_r6, addi_s8_r6_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_CB_addi_s8_r7, addi_s8_r7_apply, fetch_simm8_then_ijmp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xCC-0xCF: CMPI.S8 rL,simm8 (rL in r4-r7)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_immediate primary_CC_cmpi_s8_r4, cmpi_s8_r4_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_CD_cmpi_s8_r5, cmpi_s8_r5_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_CE_cmpi_s8_r6, cmpi_s8_r6_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_CF_cmpi_s8_r7, cmpi_s8_r7_apply, fetch_simm8_then_ijmp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xD0-0xD3: conditional branches
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; All D0-D6 and D8-D9 instructions have one signed byte operand. The primary
; slot advances VM_PC from the opcode to that operand and forwards to an
; out-of-line continuation. This exactly fills the fixed four-word primary
; slot.

.macro emit_primary_rel8 label, target
\label:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rjmp \target
    assert_primary_slot_width \label
.endm

emit_primary_rel8 primary_D0_breq8_rel8,  breq8_rel8_decode_func
emit_primary_rel8 primary_D1_brne8_rel8,  brne8_rel8_decode_func
emit_primary_rel8 primary_D2_brult8_rel8, brult8_rel8_decode_func
emit_primary_rel8 primary_D3_brslt8_rel8, brslt8_rel8_decode_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xD4-0xD7: relative control, ADJSP, and SYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_rel8 primary_D4_jmp8_rel8,  jmp8_rel8_func
emit_primary_rel8 primary_D5_call8_rel8, call8_rel8_func
emit_primary_rel8 primary_D6_adjsp,     adjsp_simm8_func

; Account for the service byte in the 24-bit VM PC. The out-of-line decoder
; reads that byte from SPDR and immediately starts fetching the following
; primary opcode. This setup plus the final RJMP exactly fills the four-word
; primary slot.
primary_D7_sys:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rjmp sys_decode_func
primary_D7_sys_end:
.if (primary_D7_sys_end - primary_D7_sys) != PRIMARY_STRIDE_BYTES
    .error "SYS primary dispatch slot is not exactly four words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xD8-0xD9: inverted conditional branches
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_rel8 primary_D8_bruge8_rel8, bruge8_rel8_decode_func
emit_primary_rel8 primary_D9_brsge8_rel8, brsge8_rel8_decode_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xDA-0xDF: 16-bit conditional branches
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Each slot preloads the selected architectural-flag mask, advances VM_PC from
; the opcode to rel16[7:0], and forwards to the shared decoder. Opcode bit 0
; selects the inverted condition within each flag pair.

.macro emit_primary_branch16 label, mask
\label:
    ldi  r25, \mask
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    rjmp branch_rel16_decode_func
    assert_primary_slot_width \label
.endm

emit_primary_branch16 primary_DA_breq16_rel16,  (1 << SREG_Z)
emit_primary_branch16 primary_DB_brne16_rel16,  (1 << SREG_Z)
emit_primary_branch16 primary_DC_brult16_rel16, (1 << SREG_C)
emit_primary_branch16 primary_DD_bruge16_rel16, (1 << SREG_C)
emit_primary_branch16 primary_DE_brslt16_rel16, (1 << SREG_S)
emit_primary_branch16 primary_DF_brsge16_rel16, (1 << SREG_S)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE0-0xE3: direct near/far control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; JMP16/CALL16 consume a little-endian signed 16-bit displacement relative to
; the address immediately following the three-byte instruction. Their primary
; slots advance VM_PC from the opcode to the low displacement byte.
;
; JMPF/CALLF consume a little-endian absolute 24-bit image-relative target.
; JMPF does not need the sequential VM_PC, so its slot spends the same three
; setup cycles as the other direct-control slots only to preserve the first-byte
; SPI read timing. CALLF advances directly from the opcode to nextPC with FOUR
; so the return address is ready to push while later target bytes are fetched.

.macro emit_primary_rel16 label, target
\label:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rjmp \target
    assert_primary_slot_width \label
.endm

emit_primary_rel16 primary_E0_jmp16,  jmp_call_rel16_func
emit_primary_rel16 primary_E1_call16, jmp_call_rel16_func

primary_E2_jmpf:
    nop
    nop
    nop
    rjmp jmp_call_far_func
    assert_primary_slot_width primary_E2_jmpf

primary_E3_callf:
    add  VM_PCL, FOUR
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rjmp jmp_call_far_func
    assert_primary_slot_width primary_E3_callf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE4-0xE7: JMPP qN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; A program pointer uses the first register of qN for bits 15:0 and the low
; byte of the second register for bits 23:16. The unused top byte of qN is
; ignored. Each primary slot installs that 24-bit address as the current VM PC
; and forwards to the shared stream-seek/primary-dispatch handler.

.macro emit_primary_jmpp label, ptr16, ptr23_16
\label:
    movw VM_PCL, \ptr16
    mov  VM_PCH, \ptr23_16
    delay_2
    rjmp jmpp_seek_and_dispatch_func
    assert_primary_slot_width \label
.endm

emit_primary_jmpp primary_E4_jmpp_q0, VM_R0, VM_R1L
emit_primary_jmpp primary_E5_jmpp_q1, VM_R2, VM_R3L
emit_primary_jmpp primary_E6_jmpp_q2, VM_R4, VM_R5L
emit_primary_jmpp primary_E7_jmpp_q3, VM_R6, VM_R7L

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE8-0xEB: CALLP qN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; VM_PC names the CALLP opcode at primary-slot entry. Preserve the selected
; 24-bit target in scratch, begin advancing VM_PC to the sequential return
; address in the otherwise-unused fourth slot word, then let the shared
; prologue finish the carry chain before pushing PC+1 and installing the target.

.macro emit_primary_callp label, ptr16, ptr23_16
\label:
    movw r24, \ptr16
    mov  r26, \ptr23_16
    add  VM_PCL, ONE
    rjmp push_pc_seek_and_dispatch_func
    assert_primary_slot_width \label
.endm

emit_primary_callp primary_E8_callp_q0, VM_R0, VM_R1L
emit_primary_callp primary_E9_callp_q1, VM_R2, VM_R3L
emit_primary_callp primary_EA_callp_q2, VM_R4, VM_R5L
emit_primary_callp primary_EB_callp_q3, VM_R6, VM_R7L

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xEC-0xEE: reserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_EC_reserved, invalid_primary_instruction_func
emit_primary_stub primary_ED_reserved, invalid_primary_instruction_func
emit_primary_stub primary_EE_reserved, invalid_primary_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xEF: RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Return addresses are stored little-endian at VM_SP: low, middle, high. RET
; restores the complete 24-bit VM PC directly in its four-word primary slot and
; enters the common stream-restart handler. No forwarding body or delay is
; required; the three two-cycle loads already outlast the discarded speculative
; byte transfer before flash chip select is toggled.

primary_EF_ret:
    ld   VM_PCL, Y+
    ld   VM_PCM, Y+
    ld   VM_PCH, Y+
    rjmp seek_and_dispatch_func
    assert_primary_slot_width primary_EF_ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xF0-0xFE: secondary-page prefixes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Each bounded page advertises its architectural upper bound and uses its
; final natural slot width. F1-F9, FA, FB-FD, and FE execute implemented
; entries. F0 uses one-word veneers; secondaries 00-5F are implemented.
; F0 bound 0x6E, one-word veneer slots.
emit_primary_bounded_page primary_F0_cold_veneer_page, 0x6E, f0_veneer_table, secondary_width_1_stub
; F1 bound 0x90, two-word slots.
emit_primary_bounded_page primary_F1_dense_2word_page, 0x90, f1_table, bounded_width_2_decode
; F2 bound 0x60, three-word slots.
emit_primary_bounded_page primary_F2_dense_3word_page_a, 0x60, f2_table, secondary_width_3_stub
; F3 bound 0x80, three-word slots.
emit_primary_bounded_page primary_F3_dense_3word_page_b, 0x80, f3_table, secondary_width_3_stub
; F4 bound 0xB8, three-word slots.
emit_primary_bounded_page primary_F4_dense_3word_page_c, 0xB8, f4_table, secondary_width_3_stub
; F5 bound 0x60, four-word slots.
emit_primary_bounded_page primary_F5_dense_4word_page_a, 0x60, f5_table, secondary_width_4_stub
; F6 bound 0x50, four-word slots.
emit_primary_bounded_page primary_F6_dense_4word_page_b, 0x50, f6_table, secondary_width_4_stub
; F7 bound 0x90, five-word slots.
emit_primary_bounded_page primary_F7_dense_5word_page_a, 0x90, f7_table, secondary_width_5_stub
; F8 bound 0x30, five-word slots.
emit_primary_bounded_page primary_F8_simple_condition_page, 0x30, f8_table, secondary_width_5_stub

; F9 is a dedicated table-free runtime decoder. Primary slots now begin on
; cycle 9 after the preceding SPI OUT. The direct RJMP reaches the handler on
; cycle 11; two independent pointer-high clears then fill the remaining slack
; so the reverse OUT still lands exactly on cycle 17.
primary_F9_runtime_bitwise_page:
    rjmp  f9_bitop_entry
    nop
    nop
    nop
    assert_primary_slot_width primary_F9_runtime_bitwise_page

; FA 00-2F retains the original register-count shifts, FA 30-EF adds
; immediate-count shifts, and F0-FF is reserved. The slot preloads the complete
; register-forwarding-table address. The immediate path derives its own full
; 16-bit table address from that base, so the FA tables no longer require page
; alignment.
primary_FA_shift_page:
    nop
    ldi  r30, lo8(pm(fa_forward_table))
    ldi  r31, hi8(pm(fa_forward_table))
    rjmp fa_shift_decode
    assert_primary_slot_width primary_FA_shift_page

; FB-FD share one condition gate and one 64-entry operand table. Bit 6 of the
; secondary byte selects the inverse condition; bit 7 is reserved.
emit_primary_cmov_page primary_FB_cmov_eq_ne_page,  (1 << SREG_Z)
emit_primary_cmov_page primary_FC_cmov_ult_uge_page, (1 << SREG_C)
emit_primary_cmov_page primary_FD_cmov_slt_sge_page, (1 << SREG_S)
; FE bound 0x40, two-word forwarding slots.
emit_primary_bounded_page primary_FE_mul16_page, 0x40, fe_forward_table, bounded_width_2_decode

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFF: reserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_FF_reserved, invalid_primary_instruction_func

primary_table_end:
.if (primary_table_end - primary_table) != (256 * PRIMARY_STRIDE_BYTES)
    .error "primary dispatch table is not exactly 256 four-word slots"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; F9 dedicated runtime-decoded full-register bitwise page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Encoding: F9 dddsssoo
;   bits 7:5  destination register r0-r7
;   bits 4:2  source register r0-r7
;   bits 1:0  00=AND, 01=OR, 10=XOR, 11=invalid
;
; Primary-slot execution begins on cycle 9 after the OUT that started the
; secondary byte. The slot RJMP reaches this handler on cycle 11. Clearing XH
; and ZH is independent of the secondary byte, so those two useful instructions
; fill cycles 14 and 15 before CLI/OUT on cycles 16/17. Both architectural
; operands are loaded before writeback, so destination/source aliasing is fully
; defined.

f9_bitop_entry:
    ; Consume the secondary byte in the VM PC and immediately start the
    ; speculative following-primary transfer. Pre-clear the register-file
    ; pointer high bytes while the secondary transfer is still in flight.
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO
    mov   r27, ZERO
    mov   r31, ZERO
    cli
    out   SPDR, ZERO
    in    SECONDARY_OPCODE, SPDR
    sei

    ; X = native register-file address of destination rD.
    mov   r26, SECONDARY_OPCODE
    swap  r26
    andi  r26, 0x0e
    subi  r26, -8

    ; Z = native register-file address of source rS.
    mov   r30, SECONDARY_OPCODE
    lsr   r30
    andi  r30, 0x0e
    subi  r30, -8

    ; Preserve operation bits without another scratch register:
    ; carry = original bit 0, SECONDARY_OPCODE bit 0 = original bit 1.
    lsr   SECONDARY_OPCODE

    ; Capture both complete original operands before modifying rD.
    ld    r0,  X+
    ld    r1,  X
    ld    r25, Z+
    ld    r27, Z

    ; SECONDARY_OPCODE bit 0 selects low (AND/OR) versus high
    ; (XOR/invalid) operation groups.
    sbrc  SECONDARY_OPCODE, 0
    rjmp  .Lf9_high_operation

    ; Low group: carry selects AND=0 or OR=1.
    brcc  .Lf9_and
    or    r0, r25
    or    r1, r27
    rjmp  .Lf9_store

.Lf9_and:
    and   r0, r25
    and   r1, r27

.Lf9_store:
    ; Loading source high into r27 temporarily replaced XH. All architectural
    ; register-file addresses are below 0x100, so restore XH to zero.
    mov   r27, ZERO
    st    X,  r1
    st    -X, r0
    rjmp  cluster_a_tail_18

.Lf9_high_operation:
    ; High group: carry selects XOR=0 or invalid=1.
    brcs  .Lf9_invalid
    eor   r0, r25
    eor   r1, r27
    rjmp  .Lf9_store

.Lf9_invalid:
    rjmp  invalid_secondary_instruction_func

f9_bitop_end:
.if (f9_bitop_end - f9_bitop_entry) != 78
    .error "dedicated F9 runtime bitwise handler must occupy exactly 39 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FA combined immediate/register-count shift decoder
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Encoding:
;   FA 00-2F  original register-count encodings
;   FA 30-EF  immediate count; subtract 0x30, then bits 7:6 select the
;             operation, bits 5:4 the destination, and bits 3:0 the count
;   FA F0-FF  reserved
;
; The primary slot reaches this decoder on cycle 14. The following primary
; opcode is launched with the exact cycle-17 reverse handoff. Register-count
; forms enter their forwarding entry on cycle 29 and the shared shift body on
; cycle 32, preserving their previous latency. Immediate forms enter the shared
; body on cycle 34 because their full 16-bit table-address calculation adds two
; cycles.
;
; Z contains the complete word address of fa_forward_table. Register-count
; forms index that table with full carry propagation at the original latency.
; Immediate forms subtract sixteen words to obtain the pre-biased immediate
; base, then perform a full 16-bit add. This removes all table-alignment
; constraints at a two-cycle cost to immediate forms only.
fa_shift_decode_start:
fa_shift_decode:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    cli
    out  SPDR, ZERO
    in   SECONDARY_OPCODE, SPDR
    sei
    adc  VM_PCH, ZERO

    cpi  SECONDARY_OPCODE, 0x30
    brlo .Lfa_register_count

    ; Immediate form. Preserve the complete secondary in r26; the shared body
    ; masks it to the low four-bit count. The high nibble directly selects one
    ; of twelve body jumps through a base pre-biased by three entries. A high
    ; nibble of 0xF selects the thirteenth, invalid entry.
    mov   r26, SECONDARY_OPCODE
    swap  SECONDARY_OPCODE
    andi  SECONDARY_OPCODE, 0x0f
    sbiw  r30, 16
    add   r30, SECONDARY_OPCODE
    adc   r31, ZERO
    ijmp

.Lfa_register_count:
    ; Original 00-2F encoding. Multiplying the two-word slot index by two and
    ; propagating carry through ZH takes the same three cycles as the previous
    ; pair of low-byte ADDs plus balancing NOP, so variable-shift latency is
    ; unchanged even when the forwarding table crosses a page boundary.
    lsl   SECONDARY_OPCODE
    add   r30, SECONDARY_OPCODE
    adc   r31, ZERO
    ijmp
fa_shift_decode_end:
.if (fa_shift_decode_end - fa_shift_decode_start) != 40
    .error "dedicated FA shift decoder must occupy exactly 20 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generic bounded-secondary decoders
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; F1 and FE use two-word executable-table slots. Their primary prefix
; slots preload the entry limit and table base, then jump directly to the
; shared width-two decoder below. FA uses the dedicated combined shift decoder
; above. Bypassing a multiplier-loading stub leaves
; enough time to use the exact 17-cycle reverse SPI handoff.
;
; F0 and F2-F8 use the generic multiplier decoder. Their primary prefix slots
; preload the entry limit and word-address table base in Z, then one of the
; four remaining width stubs supplies the natural slot width.

bounded_width_2_decode_start:
bounded_width_2_decode:
    ; The primary slot reaches this path on cycle 14. Advance the low and
    ; middle PC bytes before CLI so the reverse OUT lands exactly on cycle 17;
    ; CLI/OUT/IN/SEI preserve carry into the high-byte ADC after the handoff.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    cli
    out  SPDR, ZERO
    in   SECONDARY_OPCODE, SPDR
    sei
    adc  VM_PCH, ZERO

    ; Both shared width-two pages have a contiguous valid range beginning at 0.
    cp   SECONDARY_OPCODE, SECONDARY_LIMIT
    brsh invalid_secondary

    ; Z += 2 * secondary in AVR word-address space. Two complete 16-bit
    ; additions are required because F1 includes entries 0x80-0x8F; a bare
    ; LSL would lose the ninth offset bit when the index crosses 0x7f.
    add  r30, SECONDARY_OPCODE
    adc  r31, ZERO
    add  r30, SECONDARY_OPCODE
    adc  r31, ZERO
    ijmp
bounded_width_2_decode_end:
.if (bounded_width_2_decode_end - bounded_width_2_decode_start) != 28
    .error "shared width-two bounded decoder must occupy 14 AVR words"
.endif

bounded_page_decoder_start:
secondary_width_1_stub:
    ldi  SECONDARY_MULTIPLIER, 1
    rjmp bounded_page_decode
secondary_width_1_stub_end:
.if (secondary_width_1_stub_end - secondary_width_1_stub) != 4
    .error "one-word secondary-width stub is not exactly two AVR words"
.endif

secondary_width_3_stub:
    ldi  SECONDARY_MULTIPLIER, 3
    rjmp bounded_page_decode
secondary_width_3_stub_end:
.if (secondary_width_3_stub_end - secondary_width_3_stub) != 4
    .error "three-word secondary-width stub is not exactly two AVR words"
.endif

secondary_width_4_stub:
    ldi  SECONDARY_MULTIPLIER, 4
    rjmp bounded_page_decode
secondary_width_4_stub_end:
.if (secondary_width_4_stub_end - secondary_width_4_stub) != 4
    .error "four-word secondary-width stub is not exactly two AVR words"
.endif

secondary_width_5_stub:
    ldi  SECONDARY_MULTIPLIER, 5
    rjmp bounded_page_decode
secondary_width_5_stub_end:
.if (secondary_width_5_stub_end - secondary_width_5_stub) != 4
    .error "five-word secondary-width stub is not exactly two AVR words"
.endif

bounded_page_decode:
    ; The setup/stub path reaches this IN at the first legal read cycle. Read
    ; the completed secondary byte, then immediately launch speculative fetch
    ; of the following primary opcode with the standard 18-cycle handoff.
    in   SECONDARY_OPCODE, SPDR
    out  SPDR, ZERO

    ; The PC currently names the prefix opcode. Advance it to the secondary
    ; byte after launching the next transfer so this work overlaps SPI.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO

    cp   SECONDARY_OPCODE, SECONDARY_LIMIT
    brsh invalid_secondary

bounded_page_valid:
    ; Z already contains the table's AVR word address. MUL produces a word
    ; offset because SECONDARY_MULTIPLIER is the slot width in AVR words.
    mul  SECONDARY_OPCODE, SECONDARY_MULTIPLIER
    add  r30, r0
    adc  r31, r1
    ijmp

invalid_secondary:
    rjmp invalid_secondary_instruction_func

bounded_page_decoder_end:
.if (bounded_page_decoder_end - bounded_page_decoder_start) != 40
    .error "generic bounded decoder and four width stubs must occupy 20 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FB-FD shared conditional-move gate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Entry state:
;   * CMOV_MASK identifies Z, C, or S for the selected prefix.
;   * Z contains the AVR word address of cmov_table.
;   * The secondary byte is completing in SPDR.
;
; The gate consumes that byte with the standard cycle-17/18 IN/OUT handoff,
; applies bit-6 inversion, and indexes the table only when the selected
; condition is true. Bit 7 is invalid. Architectural VM_FLAGS is read but never
; modified.
cmov_gate:
    ; The prefix slot reaches this gate on cycle 14. Complete the PC increment
    ; during cycles 14-16, then use the standard IN/OUT handoff on cycles 17/18.
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO
    in    CMOV_SECONDARY, SPDR
    out   SPDR, ZERO

    cpi   CMOV_SECONDARY, 0x80
    brsh  cmov_invalid

    in    CMOV_TEST, VM_FLAGS
    sbrc  CMOV_SECONDARY, 6
    com   CMOV_TEST
    and   CMOV_TEST, CMOV_MASK
    breq  cmov_no_move

    andi  CMOV_SECONDARY, 0x3F
    lsl   CMOV_SECONDARY
    add   r30, CMOV_SECONDARY
    adc   r31, ZERO
    ijmp

cmov_no_move:
    rjmp  cluster_a_tail

cmov_invalid:
    rjmp  invalid_secondary

cmov_gate_end:
.if (cmov_gate_end - cmov_gate) != 38
    .error "FB-FD shared condition gate must occupy exactly 19 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Post-table migration scaffolding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; All defined non-prefix primary opcodes 00-EF are complete. The generic
; bounded-page decoder, secondary cadence clusters, and every specified
; executable secondary table are present. The fixed-width self-contained F1-F8
; pages, the dedicated F9 runtime bitwise decoder, the FA immediate/variable
; shift page, the FB-FD shared conditional-move gate/table, and the FE MUL16
; page are implemented. F0 has shared operand-fetch/register-decode
; infrastructure, secondaries 00-5F are implemented, and 6C-6D provide the
; shared general-pointer data-space forms. Remaining F0 veneers still trap.

; Direct 00-BF handlers use these exact cadence landings. Later secondary
; pages may add local copies when required by layout or RJMP reach.

; CMP captures native SREG in PRIMARY_OPCODE (r24). The one-cycle landing pad
; plus OUT and the standard dispatch body produce an exact 18-cycle cadence.
flags_commit_18_delay_1:
    nop
flags_commit_18:
    out  VM_FLAGS, PRIMARY_OPCODE
    dispatch

; CMPI.S8 captures native SREG in PRIMARY_OPCODE, commits it here, then
; uses the one-cycle landing below to reach an exact reverse-order handoff.
cmpi_s8_flags_commit_17:
    out  VM_FLAGS, PRIMARY_OPCODE
cluster_tail_17_delay_1:
    nop
cluster_tail_17:
    dispatch_reverse

cluster_tail_18_delay_3:
    nop
cluster_tail_18_delay_2:
    rjmp cluster_tail_18
cluster_tail_18_delay_1:
    nop
cluster_tail_18:
    dispatch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; C0-CF upper-register immediate instructions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; At entry to each fetch continuation, the first immediate byte was started by
; the dispatch that selected the primary slot. Z contains the word address of
; the destination-specialized apply stub. PRIMARY_OPCODE (r24) carries imm8 or
; the low byte of imm16; r25 carries the sign extension or imm16 high byte.
;
; The fetch paths leave VM PC naming the final immediate byte. Their final OUT
; starts the following primary opcode. The apply stubs use the available slack
; to reach an exact reverse-order 17-cycle handoff for that opcode.

; Consume one unsigned immediate byte and start the following primary opcode.
; From primary-slot entry to the OUT is eight cycles; including the preceding
; dispatch, this preserves the normal 17/18-cycle SPI byte cadence.
fetch_imm8_then_ijmp:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    in   PRIMARY_OPCODE, SPDR
    out  SPDR, ZERO
    ijmp

; Consume one signed immediate byte, start the following primary opcode, and
; form its 16-bit sign extension in r25 before entering the selected apply stub.
fetch_simm8_then_ijmp:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    in   PRIMARY_OPCODE, SPDR
    out  SPDR, ZERO
    clr  r25
    sbrc PRIMARY_OPCODE, 7
    com  r25
    ijmp

; Consume a little-endian 16-bit immediate. The low-byte handoff uses the
; standard 18-cycle IN/OUT schedule. While the high byte transfers, complete
; the second PC increment, use a callable delay for the remaining slack, and
; perform an exact reverse-order 17-cycle handoff for the following opcode.
fetch_imm16_then_ijmp:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    in   PRIMARY_OPCODE, SPDR
    out  SPDR, ZERO

    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rcall interp_delay_12
    cli
    out  SPDR, ZERO
    in   r25, SPDR
    sei
    ijmp

; The apply paths have enough slack to use the reverse-order dispatch. These
; shared entries contribute exactly six, four, or three cycles before entering
; cluster_tail_17, whose PC update and protected OUT place the next transfer at
; the exact 17-cycle boundary.
immediate_result_tail_reverse_delay_6:
    delay_2
immediate_result_tail_reverse_delay_4:
    nop
immediate_result_tail_reverse_delay_3:
    nop
    rjmp cluster_tail_17

.macro emit_ldi8_apply label, dstl, dsth
\label:
    mov  \dstl, PRIMARY_OPCODE
    clr  \dsth
    rjmp immediate_result_tail_reverse_delay_6
.endm

.macro emit_ldi16_apply label, dstl, dsth
\label:
    mov  \dstl, PRIMARY_OPCODE
    mov  \dsth, r25
    rjmp immediate_result_tail_reverse_delay_4
.endm

.macro emit_addi_s8_apply label, dstl, dsth
\label:
    add  \dstl, PRIMARY_OPCODE
    adc  \dsth, r25
    rjmp immediate_result_tail_reverse_delay_3
.endm

.macro emit_cmpi_s8_apply label, lhsl, lhsh
\label:
    cp   \lhsl, PRIMARY_OPCODE
    cpc  \lhsh, r25
    in   PRIMARY_OPCODE, SREG
    rjmp cmpi_s8_flags_commit_17
.endm

emit_ldi8_apply ldi8_r4_apply, VM_R4L, VM_R4H
emit_ldi8_apply ldi8_r5_apply, VM_R5L, VM_R5H
emit_ldi8_apply ldi8_r6_apply, VM_R6L, VM_R6H
emit_ldi8_apply ldi8_r7_apply, VM_R7L, VM_R7H

emit_ldi16_apply ldi16_r4_apply, VM_R4L, VM_R4H
emit_ldi16_apply ldi16_r5_apply, VM_R5L, VM_R5H
emit_ldi16_apply ldi16_r6_apply, VM_R6L, VM_R6H
emit_ldi16_apply ldi16_r7_apply, VM_R7L, VM_R7H

emit_addi_s8_apply addi_s8_r4_apply, VM_R4L, VM_R4H
emit_addi_s8_apply addi_s8_r5_apply, VM_R5L, VM_R5H
emit_addi_s8_apply addi_s8_r6_apply, VM_R6L, VM_R6H
emit_addi_s8_apply addi_s8_r7_apply, VM_R7L, VM_R7H

emit_cmpi_s8_apply cmpi_s8_r4_apply, VM_R4L, VM_R4H
emit_cmpi_s8_apply cmpi_s8_r5_apply, VM_R5L, VM_R5H
emit_cmpi_s8_apply cmpi_s8_r6_apply, VM_R6L, VM_R6H
emit_cmpi_s8_apply cmpi_s8_r7_apply, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; D0-D6 relative control and stack adjustment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; At entry to each continuation, VM_PC points at the signed operand byte and
; SPDR contains that byte. Conditional branches immediately start a speculative
; fetch of the fallthrough opcode. A not-taken branch preserves that stream;
; a taken branch discards it and restarts at nextPC + sign_extend(rel8).

.macro emit_branch_rel8_decode label, skipop, flag
\label:
    ; The primary slot now reaches this continuation on cycle 14 after the
    ; operand-starting OUT. A two-cycle landing followed by the protected
    ; reverse handoff places the speculative fallthrough OUT exactly on 17.
    delay_2
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei

    ; A satisfied condition skips the not-taken jump. SBIS implements a
    ; branch-on-set condition; SBIC implements a branch-on-clear condition.
    \skipop VM_FLAGS, \flag
    rjmp branch_rel8_not_taken_func
    rjmp branch_rel8_taken_func
.endm

emit_branch_rel8_decode breq8_rel8_decode_func,  sbis, SREG_Z
emit_branch_rel8_decode brne8_rel8_decode_func,  sbic, SREG_Z
emit_branch_rel8_decode brult8_rel8_decode_func, sbis, SREG_C
emit_branch_rel8_decode brslt8_rel8_decode_func, sbis, SREG_S
emit_branch_rel8_decode bruge8_rel8_decode_func, sbic, SREG_C
emit_branch_rel8_decode brsge8_rel8_decode_func, sbic, SREG_S

branch_rel8_not_taken_func:
    ; PRIMARY_OPCODE contains the ignored displacement and VM_PC still names
    ; that byte. Six inline cycles of padding route through the reverse-order
    ; dispatch body, with the next OUT occurring 18 cycles after the speculative
    ; fallthrough OUT.
    delay_4
    delay_2
    rjmp cluster_tail_17

branch_rel8_taken_func:
    ; Form the signed high extension only on the taken path. Both sign cases
    ; take two cycles, which also lets the speculative fallthrough transfer
    ; finish before seek_and_dispatch_func toggles flash chip select.
    clr  r25
    sbrc PRIMARY_OPCODE, 7
    com  r25

    ; Convert the operand address to nextPC, then add the signed displacement
    ; in the full modulo-2^24 program address space.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    add  VM_PCL, PRIMARY_OPCODE
    adc  VM_PCM, r25
    adc  VM_PCH, r25
    rjmp seek_and_dispatch_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DA-DF 16-bit conditional branches
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Primary-slot entry begins on cycle 9 after the OUT that started rel16[7:0].
; The slot and common prologue place a reverse handoff on cycle 17, launching
; rel16[15:8]. The condition is resolved while that byte transfers.
;
; A false condition launches the fallthrough opcode at the next cycle-17
; boundary and reuses the rel8 not-taken continuation. A true condition advances
; VM_PC to nextPC and enters the existing signed-rel16 target-add suffix, so its
; seek timing matches JMP16/CALL16.
branch_rel16_decode_func:
    ; Complete the carry chain started in the primary slot, capture the saved
    ; architectural flags, and launch rel16[15:8] exactly on cycle 17.
    adc  VM_PCH, ZERO
    in   r27, VM_FLAGS
    cli
    out  SPDR, ZERO
    in   r26, SPDR
    sei

    ; VM_PC named rel16[7:0] on entry. Advance it to rel16[15:8] while the high
    ; byte transfers. Opcode bit 0 requests the inverse condition; complementing
    ; the flag byte before masking makes all six conditions share one test.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    sbrc PRIMARY_OPCODE, 0
    com  r27
    and  r27, r25
    brne branch_rel16_taken_func

branch_rel16_not_taken_func:
    ; The false path begins on cycle 27. Six cycles of delay place a reverse
    ; handoff on cycle 34, launching the fallthrough primary opcode. VM_PC still
    ; names the high displacement byte, matching branch_rel8_not_taken_func's
    ; expected final-operand state.
    delay_4
    delay_2
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei
    rjmp branch_rel8_not_taken_func

branch_rel16_taken_func:
    ; The taken path begins on cycle 28. Advance from the high displacement byte
    ; to nextPC, then arrive at rel16_read_high with CLR on cycle 33 and IN on
    ; cycle 34, exactly matching the JMP16/CALL16 high-byte schedule.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rjmp rel16_read_high

branch_rel16_block_end:
.if (branch_rel16_block_end - branch_rel16_decode_func) != (25 * 2)
    .error "16-bit conditional branch subsystem must occupy exactly 50 bytes"
.endif

; D4 and D5 use fully specialized continuations. Duplicating the operand
; fetch, sign extension, next-PC calculation, and target addition removes the
; shared opcode test and avoids RCALL/RET overhead on CALL8.
jmp8_rel8_func:
    ; The operand transfer was started by the preceding primary dispatch. The
    ; continuation now begins one cycle earlier, so a three-cycle delay places
    ; this read at the first legal SPI byte boundary.
    delay_3
    in   r26, SPDR

    clr  r25
    sbrc r26, 7
    com  r25

    ; VM_PC currently names the displacement byte. Advance to nextPC, apply
    ; the signed displacement in modulo-2^24 arithmetic, and restart the stream.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    add  VM_PCL, r26
    adc  VM_PCM, r25
    adc  VM_PCH, r25
    rjmp seek_and_dispatch_func

call8_rel8_func:
    ; Fetch and sign-extend the displacement exactly as for JMP8 rel8.
    delay_3
    in   r26, SPDR

    clr  r25
    sbrc r26, 7
    com  r25

    ; Advance to nextPC and push that 24-bit return address in the canonical
    ; little-endian stack layout: [SP+0]=PCL, [SP+1]=PCM, [SP+2]=PCH.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    st   -Y, VM_PCH
    st   -Y, VM_PCM
    st   -Y, VM_PCL

    ; Form the branch target only after preserving nextPC, then restart the
    ; external-flash stream at that target.
    add  VM_PCL, r26
    adc  VM_PCM, r25
    adc  VM_PCH, r25
    rjmp seek_and_dispatch_func

adjsp_simm8_func:
    ; Read simm8 while starting the following primary opcode. VM_PC remains on
    ; the operand byte so dispatch_reverse advances it exactly once afterward.
    ; The continuation begins on cycle 14, so the two-cycle landing makes the
    ; reverse OUT occur exactly 17 cycles after the operand-starting OUT.
    delay_2
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei

    clr  r25
    sbrc PRIMARY_OPCODE, 7
    com  r25
    add  VM_SPL, PRIMARY_OPCODE
    adc  VM_SPH, r25

    ; Preserve the sequential stream and architectural VM_FLAGS. This delay
    ; makes the next SPI OUT occur at the reverse-order 17-cycle cadence.
    delay_4
    rjmp cluster_tail_17

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; E0-E3 direct near/far control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; The first operand byte was started by the primary dispatch. Each paired
; JMP/CALL continuation reaches the exact 17-cycle boundary with useful work,
; then uses CLI/OUT/IN/SEI to launch the next operand byte. Opcode bit 0 selects
; the call path, but its conditional return-address push is completely hidden
; inside operand-transfer slack, so the paired forms retain equal latency.
; Remaining idle intervals use the shared callable delay ladder.

jmp_call_rel16_func:
    ; Fetch rel16[7:0] and launch rel16[15:8] with the exact reverse-order
    ; 17-cycle handoff. VM_PC initially names rel16[7:0].
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    cli
    out  SPDR, ZERO
    in   r26, SPDR
    sei
    adc  VM_PCH, ZERO

    ; Advance through rel16[15:8] to nextPC. Opcode bit 0 distinguishes CALL16
    ; from JMP16. Both paths consume the same nine-cycle transfer slack:
    ; CALL16 uses a three-cycle skip plus three two-cycle stores, while JMP16
    ; uses a four-cycle test/JMP plus a three-cycle delay and two-cycle RJMP.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    sbrs PRIMARY_OPCODE, 0
    jmp  jmp_rel16_wait

    ; CALL16: preserve nextPC before applying the signed displacement.
    st   -Y, VM_PCH
    st   -Y, VM_PCM
    st   -Y, VM_PCL

rel16_read_high:
    ; CLR is independent of the high displacement byte and fills the final
    ; cycle before that byte becomes readable.
    clr  r25
    in   r27, SPDR

    ; Add sign_extend(rel16) to nextPC in modulo-2^24 arithmetic.
    sbrc r27, 7
    com  r25
    add  VM_PCL, r26
    adc  VM_PCM, r27
    adc  VM_PCH, r25
    rjmp seek_and_dispatch_func

jmp_rel16_wait:
    delay_3
    rjmp rel16_read_high

jmp_call_far_func:
    ; Preserve opcode bit 0 before target[7:0] replaces PRIMARY_OPCODE. The MOV
    ; occupies the same one-cycle landing used by the specialized handlers, so
    ; target[15:8] still launches at the exact first 17-cycle boundary.
    mov  r27, PRIMARY_OPCODE
    nop
    cli
    out  SPDR, ZERO
    in   r24, SPDR
    sei

    ; E3 CALLF has already advanced VM_PC to nextPC in its primary slot. The
    ; CALL path uses the middle-byte transfer slack to push it. The E2 JMPF
    ; path uses an equal-time wait, so both launch target[23:16] at cycle 17.
    sbrs r27, 0
    jmp  jmp_far_wait
    st   -Y, VM_PCH
    st   -Y, VM_PCM
    st   -Y, VM_PCL
    delay_4

far_launch_high:
    cli
    out  SPDR, ZERO
    in   r25, SPDR
    sei

    ; No further byte must be launched. Read target[23:16] at its earliest
    ; legal cycle, then install the complete absolute image-relative target.
    rcall interp_delay_14
    in   r26, SPDR
    mov  VM_PCL, r24
    mov  VM_PCM, r25
    mov  VM_PCH, r26
    rjmp seek_and_dispatch_func

jmp_far_wait:
    rcall interp_delay_7
    rjmp far_launch_high

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SYS service dispatch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Entry state:
;   * VM PC points at the following primary opcode.
;   * SPDR contains the completed service byte.
;   * The byte following the service has not yet been started.
;
; The protected SPDR handoff starts fetching the following primary opcode and
; captures the service ID. Each service returns through a cadence-appropriate
; cluster tail, which consumes that opcode, starts its following byte, advances
; the PC, and enters its four-word primary slot.
sys_decode_func:
    ; The D7 primary slot reaches this continuation on cycle 14. Preloading the
    ; dispatch-table base fills cycles 14 and 15, then the reverse OUT lands on
    ; cycle 17 without a pure delay.
    ldi  r30, lo8(pm(sys_dispatch_table))
    ldi  r31, hi8(pm(sys_dispatch_table))
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei

sys_dispatch_func:
    add  r30, PRIMARY_OPCODE
    adc  r31, ZERO
    ijmp

.macro sys_entries count, target
    .rept \count
        rjmp \target
    .endr
.endm

.if (SYS_DEBUG_PUTC != 0x00)
    .error "SYS_DEBUG_PUTC must occupy dispatch-table entry 0"
.endif
.if (SYS_DEBUG_BREAK != 0x01)
    .error "SYS_DEBUG_BREAK must occupy dispatch-table entry 1"
.endif
.if (SYS_MILLIS != 0x02)
    .error "SYS_MILLIS must occupy dispatch-table entry 2"
.endif
.if (SYS_MILLIS32 != 0x03)
    .error "SYS_MILLIS32 must occupy dispatch-table entry 3"
.endif

; One AVR word per service number. The service byte therefore indexes this
; table directly in program-memory word-address space.
sys_dispatch_table:
    sys_entries 1,   sys_debug_putc_func
    sys_entries 1,   sys_debug_break_func
    sys_entries 1,   sys_millis_func
    sys_entries 1,   sys_millis32_func
    sys_entries 252, invalid_syscall_func
sys_dispatch_table_end:

.if (sys_dispatch_table_end - sys_dispatch_table) != (256 * 2)
    .error "SYS dispatch table must contain exactly 256 one-word entries"
.endif

sys_debug_putc_func:
    ; DEBUG_PUTC writes low8(r4) to the emulator/debug USB endpoint register.
    ; STS plus the table dispatch leaves the reverse tail ready to launch the
    ; byte after the following opcode exactly 17 cycles after its prior OUT.
    sts  UEDATX, VM_R4L
    rjmp cluster_tail_17

sys_debug_break_func:
    ; BREAK is one cycle shorter than DEBUG_PUTC's STS. Use the existing
    ; one-cycle reverse landing so its next OUT also occurs at cycle 17.
    break
    rjmp cluster_tail_17_delay_1

; Return a coherent low 16-bit snapshot of the millisecond counter in r4.
sys_millis_func:
    cli
    lds  VM_R4L, data_millis+0
    lds  VM_R4H, data_millis+1
    sei
    rjmp cluster_tail_18

; Return a coherent 32-bit snapshot with the low half in r4 and high half in
; r5. Timer0 cannot update the counter during the four-byte snapshot.
sys_millis32_func:
    cli
    lds  VM_R4L, data_millis+0
    lds  VM_R4H, data_millis+1
    lds  VM_R5L, data_millis+2
    lds  VM_R5H, data_millis+3
    sei
    rjmp cluster_tail_18

; JMPP reaches this one-word forwarding landing on cycle 15; its RJMP enters
; the seek handler on cycle 17, after the discarded speculative byte completes.
jmpp_seek_and_dispatch_func:
    rjmp seek_and_dispatch_func

; CALLP shared prologue. The primary slot preserved the selected target in
; r26:r25:r24 and performed the low-byte increment from the CALLP opcode to its
; sequential return address. Finish the 24-bit carry chain, push PC+1 in
; canonical little-endian stack layout, install the target, and fall through
; directly into the common seek handler.
push_pc_seek_and_dispatch_func:
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    st   -Y, VM_PCH
    st   -Y, VM_PCM
    st   -Y, VM_PCL
    movw VM_PCL, r24
    mov  VM_PCH, r26

; Shared continuation for JMPP, CALLP, RET, and taken control-flow instructions.
; On entry, VM_PCH:VM_PCM:VM_PCL is the new image-relative program counter.
; Seek the external-flash stream to VM_PC, consume the target primary opcode,
; start its following-byte fetch, and dispatch directly to that primary slot.
seek_and_dispatch_func:
    fx_disable
    ldi  r30, SFC_READ
    fx_enable
    out  SPDR, r30

    lds  r26, data_page_data+0
    add  r26, VM_PCM
    lds  r27, data_page_data+1
    adc  r27, VM_PCH

    rcall interp_delay_10
    out  SPDR, r27
    rcall interp_delay_17
    out  SPDR, r26
    rcall interp_delay_17
    out  SPDR, VM_PCL
    rcall interp_delay_16
    out  SPDR, ZERO
    rcall interp_delay_15
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei
    mul  PRIMARY_OPCODE, FOUR
    movw r30, r0
    subi r31, hi8(-(pm(primary_table)))
    ijmp

; Local fixed-delay ladder for pre-table interpreter paths. The large dense
; secondary tables place the original fx_seek_delay_* ladder outside RCALL's
; signed 12-bit word displacement. Each entry retains the same total delay,
; measured from the calling RCALL through the returning RET.
interp_delay_17:
    nop
interp_delay_16:
    nop
interp_delay_15:
    nop
interp_delay_14:
    nop
interp_delay_13:
    nop
interp_delay_12:
    nop
interp_delay_11:
    nop
interp_delay_10:
    nop
interp_delay_9:
    delay_2
interp_delay_7:
    ret

; Valid but not-yet-implemented F0 veneer entries ultimately stop here.
unimplemented_instruction_func:
    rjmp unimplemented_instruction_func

; Reserved primary encodings stop here.
invalid_primary_instruction_func:
    rjmp invalid_primary_instruction_func

; Reserved secondary encodings and unknown SYS services use these shared traps.
invalid_secondary_instruction_func:
    rjmp invalid_secondary_instruction_func

invalid_syscall_func:
    rjmp invalid_syscall_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fixed-width secondary tables and F0 veneer scaffolding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; F1-F8 use their exact operand-specialized native sequences. F0 uses one-word
; veneers that either forward to implemented cold bodies or jump to the nearby
; unimplemented-instruction trap. FA traps reserved values through its immediate
; body-jump table.

.macro emit_secondary_trap_table label, end_label, count, width, trap
\label:
    .rept \count
        rjmp \trap
        .rept (\width - 1)
            nop
        .endr
    .endr
\end_label:
    .if (\end_label - \label) != (2 * \count * \width)
        .error "secondary trap table has incorrect size"
    .endif
.endm


; Exact fixed-width slot emitters for F1-F8. Each macro expands to the native
; sequence specified by the ISA implementation plan and asserts its natural
; AVR word count. No slot contains padding except reserved postincrement-load
; aliases, which remain same-width invalid-instruction entries.

.macro emit_f1_mov dst, src
.Lf1_mov_start_\@:
    movw  \dst, \src
    rjmp  cluster_a_tail_17_delay_1
.Lf1_mov_end_\@:
    .if (.Lf1_mov_end_\@ - .Lf1_mov_start_\@) != 4
        .error "F1 MOV slot is not exactly two words"
    .endif
.endm

.macro emit_f1_stsp8 src, q
.Lf1_stsp8_start_\@:
    std   Y+\q, \src
    rjmp  cluster_a_tail_17
.Lf1_stsp8_end_\@:
    .if (.Lf1_stsp8_end_\@ - .Lf1_stsp8_start_\@) != 4
        .error "F1 STSP8 slot is not exactly two words"
    .endif
.endm

.macro emit_f1_zext8 dsth
.Lf1_zext8_start_\@:
    clr   \dsth
    rjmp  cluster_a_tail_17_delay_1
.Lf1_zext8_end_\@:
    .if (.Lf1_zext8_end_\@ - .Lf1_zext8_start_\@) != 4
        .error "F1 ZEXT8 slot is not exactly two words"
    .endif
.endm

.macro emit_f1_swap8 dstl
.Lf1_swap8_start_\@:
    swap  \dstl
    rjmp  cluster_a_tail_17_delay_1
.Lf1_swap8_end_\@:
    .if (.Lf1_swap8_end_\@ - .Lf1_swap8_start_\@) != 4
        .error "F1 SWAP8 slot is not exactly two words"
    .endif
.endm

.macro emit_f1_getsp dst
.Lf1_getsp_start_\@:
    movw  \dst, VM_SP
    rjmp  cluster_a_tail_17_delay_1
.Lf1_getsp_end_\@:
    .if (.Lf1_getsp_end_\@ - .Lf1_getsp_start_\@) != 4
        .error "F1 GETSP slot is not exactly two words"
    .endif
.endm

.macro emit_f1_setsp src
.Lf1_setsp_start_\@:
    movw  VM_SP, \src
    rjmp  cluster_a_tail_17_delay_1
.Lf1_setsp_end_\@:
    .if (.Lf1_setsp_end_\@ - .Lf1_setsp_start_\@) != 4
        .error "F1 SETSP slot is not exactly two words"
    .endif
.endm

.macro emit_f2_add dstl, dsth, srcl, srch
.Lf2_add_start_\@:
    add   \dstl, \srcl
    adc   \dsth, \srch
    rjmp  cluster_a_tail_17
.Lf2_add_end_\@:
    .if (.Lf2_add_end_\@ - .Lf2_add_start_\@) != 6
        .error "F2 ADD slot is not exactly three words"
    .endif
.endm

.macro emit_f2_sub dstl, dsth, srcl, srch
.Lf2_sub_start_\@:
    sub   \dstl, \srcl
    sbc   \dsth, \srch
    rjmp  cluster_a_tail_17
.Lf2_sub_end_\@:
    .if (.Lf2_sub_end_\@ - .Lf2_sub_start_\@) != 6
        .error "F2 SUB slot is not exactly three words"
    .endif
.endm

.macro emit_f3_st8 addr, srcl
.Lf3_st8_start_\@:
    movw  r26, \addr
    st    X, \srcl
    rjmp  cluster_a_tail_18_delay_1
.Lf3_st8_end_\@:
    .if (.Lf3_st8_end_\@ - .Lf3_st8_start_\@) != 6
        .error "F3 ST8 slot is not exactly three words"
    .endif
.endm

.macro emit_f3_mul op, dstl, srcl
.Lf3_mul_start_\@:
    \op   \dstl, \srcl
    movw  \dstl, r0
    rjmp  cluster_a_tail_18_delay_1
.Lf3_mul_end_\@:
    .if (.Lf3_mul_end_\@ - .Lf3_mul_start_\@) != 6
        .error "F3 widening multiply slot is not exactly three words"
    .endif
.endm

.macro emit_f3_ldsp8u dstl, dsth, q
.Lf3_ldsp8u_start_\@:
    ldd   \dstl, Y+\q
    clr   \dsth
    rjmp  cluster_a_tail_18_delay_1
.Lf3_ldsp8u_end_\@:
    .if (.Lf3_ldsp8u_end_\@ - .Lf3_ldsp8u_start_\@) != 6
        .error "F3 LDSP8U slot is not exactly three words"
    .endif
.endm

.macro emit_f4_ldsp16 dstl, dsth, q0, q1
.Lf4_ldsp16_start_\@:
    ldd   \dstl, Y+\q0
    ldd   \dsth, Y+\q1
    rjmp  cluster_b_tail_18
.Lf4_ldsp16_end_\@:
    .if (.Lf4_ldsp16_end_\@ - .Lf4_ldsp16_start_\@) != 6
        .error "F4 LDSP16 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_stsp16 srcl, srch, q0, q1
.Lf4_stsp16_start_\@:
    std   Y+\q0, \srcl
    std   Y+\q1, \srch
    rjmp  cluster_b_tail_18
.Lf4_stsp16_end_\@:
    .if (.Lf4_stsp16_end_\@ - .Lf4_stsp16_start_\@) != 6
        .error "F4 STSP16 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_shift op_hi, op_lo, dstl, dsth
.Lf4_shift_start_\@:
    \op_hi \dsth
    \op_lo \dstl
    rjmp  cluster_b_tail_17
.Lf4_shift_end_\@:
    .if (.Lf4_shift_end_\@ - .Lf4_shift_start_\@) != 6
        .error "F4 shift slot is not exactly three words"
    .endif
.endm

.macro emit_f4_lsl16 dstl, dsth
.Lf4_lsl16_start_\@:
    lsl   \dstl
    rol   \dsth
    rjmp  cluster_b_tail_17
.Lf4_lsl16_end_\@:
    .if (.Lf4_lsl16_end_\@ - .Lf4_lsl16_start_\@) != 6
        .error "F4 LSL16 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_not16 dstl, dsth
.Lf4_not16_start_\@:
    com   \dstl
    com   \dsth
    rjmp  cluster_b_tail_17
.Lf4_not16_end_\@:
    .if (.Lf4_not16_end_\@ - .Lf4_not16_start_\@) != 6
        .error "F4 NOT16 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_tst8 dstl
.Lf4_tst8_start_\@:
    cp    \dstl, ZERO
    in    SECONDARY_OPCODE, SREG
    rjmp  flags_commit_b_18_delay_1
.Lf4_tst8_end_\@:
    .if (.Lf4_tst8_end_\@ - .Lf4_tst8_start_\@) != 6
        .error "F4 TST8 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_inc16 dstl, dsth
.Lf4_inc16_start_\@:
    add   \dstl, ONE
    adc   \dsth, ZERO
    rjmp  cluster_b_tail_17
.Lf4_inc16_end_\@:
    .if (.Lf4_inc16_end_\@ - .Lf4_inc16_start_\@) != 6
        .error "F4 INC16 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_dec16 dstl, dsth
.Lf4_dec16_start_\@:
    sub   \dstl, ONE
    sbc   \dsth, ZERO
    rjmp  cluster_b_tail_17
.Lf4_dec16_end_\@:
    .if (.Lf4_dec16_end_\@ - .Lf4_dec16_start_\@) != 6
        .error "F4 DEC16 slot is not exactly three words"
    .endif
.endm

.macro emit_f5_cmp lhsl, lhsh, rhsl, rhsh
.Lf5_cmp_start_\@:
    cp    \lhsl, \rhsl
    cpc   \lhsh, \rhsh
    in    SECONDARY_OPCODE, SREG
    rjmp  flags_commit_b_18_delay_1
.Lf5_cmp_end_\@:
    .if (.Lf5_cmp_end_\@ - .Lf5_cmp_start_\@) != 8
        .error "F5 CMP slot is not exactly four words"
    .endif
.endm

.macro emit_f5_ld8u dstl, dsth, addr
.Lf5_ld8u_start_\@:
    movw  r26, \addr
    ld    \dstl, X
    clr   \dsth
    rjmp  cluster_b_tail_18
.Lf5_ld8u_end_\@:
    .if (.Lf5_ld8u_end_\@ - .Lf5_ld8u_start_\@) != 8
        .error "F5 LD8U slot is not exactly four words"
    .endif
.endm

.macro emit_f5_ld16 dstl, dsth, addr
.Lf5_ld16_start_\@:
    movw  r26, \addr
    ld    \dstl, X+
    ld    \dsth, X
    rjmp  cluster_b_tail_18
.Lf5_ld16_end_\@:
    .if (.Lf5_ld16_end_\@ - .Lf5_ld16_start_\@) != 8
        .error "F5 LD16 slot is not exactly four words"
    .endif
.endm

.macro emit_f5_st16 addr, srcl, srch
.Lf5_st16_start_\@:
    movw  r26, \addr
    st    X+, \srcl
    st    X, \srch
    rjmp  cluster_b_tail_18
.Lf5_st16_end_\@:
    .if (.Lf5_st16_end_\@ - .Lf5_st16_start_\@) != 8
        .error "F5 ST16 slot is not exactly four words"
    .endif
.endm

.macro emit_f6_st8_post addr, srcl
.Lf6_st8_post_start_\@:
    movw  r26, \addr
    st    X+, \srcl
    movw  \addr, r26
    rjmp  cluster_b_tail_18
.Lf6_st8_post_end_\@:
    .if (.Lf6_st8_post_end_\@ - .Lf6_st8_post_start_\@) != 8
        .error "F6 ST8 postincrement slot is not exactly four words"
    .endif
.endm

.macro emit_f6_bswap16 dstl, dsth
.Lf6_bswap16_start_\@:
    mov   SECONDARY_OPCODE, \dstl
    mov   \dstl, \dsth
    mov   \dsth, SECONDARY_OPCODE
    rjmp  cluster_b_tail_18_delay_1
.Lf6_bswap16_end_\@:
    .if (.Lf6_bswap16_end_\@ - .Lf6_bswap16_start_\@) != 8
        .error "F6 BSWAP16 slot is not exactly four words"
    .endif
.endm

.macro emit_f6_tst16 dstl, dsth
.Lf6_tst16_start_\@:
    cp    \dstl, ZERO
    cpc   \dsth, ZERO
    in    SECONDARY_OPCODE, SREG
    rjmp  flags_commit_b_18_delay_1
.Lf6_tst16_end_\@:
    .if (.Lf6_tst16_end_\@ - .Lf6_tst16_start_\@) != 8
        .error "F6 TST16 slot is not exactly four words"
    .endif
.endm

.macro emit_f6_mul8 dstl, dsth, srcl
.Lf6_mul8_start_\@:
    mul   \dstl, \srcl
    mov   \dstl, r0
    clr   \dsth
    rjmp  cluster_b_tail_18
.Lf6_mul8_end_\@:
    .if (.Lf6_mul8_end_\@ - .Lf6_mul8_start_\@) != 8
        .error "F6 MUL8 slot is not exactly four words"
    .endif
.endm

.macro emit_f6_sext8 dstl, dsth
.Lf6_sext8_start_\@:
    clr   \dsth
    sbrc  \dstl, 7
    dec   \dsth
    rjmp  cluster_b_tail_18_delay_1
.Lf6_sext8_end_\@:
    .if (.Lf6_sext8_end_\@ - .Lf6_sext8_start_\@) != 8
        .error "F6 SEXT8 slot is not exactly four words"
    .endif
.endm

.macro emit_f6_neg16 dstl, dsth
.Lf6_neg16_start_\@:
    neg   \dstl
    adc   \dsth, ZERO
    neg   \dsth
    rjmp  cluster_b_tail_18_delay_1
.Lf6_neg16_end_\@:
    .if (.Lf6_neg16_end_\@ - .Lf6_neg16_start_\@) != 8
        .error "F6 NEG16 slot is not exactly four words"
    .endif
.endm

.macro emit_f7_ld8u_post dstl, dsth, addr
.Lf7_ld8u_post_start_\@:
    movw  r26, \addr
    ld    \dstl, X+
    movw  \addr, r26
    clr   \dsth
    rjmp  cluster_c_tail_18
.Lf7_ld8u_post_end_\@:
    .if (.Lf7_ld8u_post_end_\@ - .Lf7_ld8u_post_start_\@) != 10
        .error "F7 LD8U postincrement slot is not exactly five words"
    .endif
.endm

.macro emit_f7_ld16_post dstl, dsth, addr
.Lf7_ld16_post_start_\@:
    movw  r26, \addr
    ld    \dstl, X+
    ld    \dsth, X+
    movw  \addr, r26
    rjmp  cluster_c_tail_18
.Lf7_ld16_post_end_\@:
    .if (.Lf7_ld16_post_end_\@ - .Lf7_ld16_post_start_\@) != 10
        .error "F7 LD16 postincrement slot is not exactly five words"
    .endif
.endm

.macro emit_f7_st16_post addr, srcl, srch
.Lf7_st16_post_start_\@:
    movw  r26, \addr
    st    X+, \srcl
    st    X+, \srch
    movw  \addr, r26
    rjmp  cluster_c_tail_18
.Lf7_st16_post_end_\@:
    .if (.Lf7_st16_post_end_\@ - .Lf7_st16_post_start_\@) != 10
        .error "F7 ST16 postincrement slot is not exactly five words"
    .endif
.endm

.macro emit_f7_add32 d0, d1, d2, d3, s0, s1, s2, s3
.Lf7_add32_start_\@:
    add   \d0, \s0
    adc   \d1, \s1
    adc   \d2, \s2
    adc   \d3, \s3
    rjmp  cluster_c_tail_18
.Lf7_add32_end_\@:
    .if (.Lf7_add32_end_\@ - .Lf7_add32_start_\@) != 10
        .error "F7 ADD32 slot is not exactly five words"
    .endif
.endm

.macro emit_f7_sub32 d0, d1, d2, d3, s0, s1, s2, s3
.Lf7_sub32_start_\@:
    sub   \d0, \s0
    sbc   \d1, \s1
    sbc   \d2, \s2
    sbc   \d3, \s3
    rjmp  cluster_c_tail_18
.Lf7_sub32_end_\@:
    .if (.Lf7_sub32_end_\@ - .Lf7_sub32_start_\@) != 10
        .error "F7 SUB32 slot is not exactly five words"
    .endif
.endm

.macro emit_f7_lsr32 d0, d1, d2, d3
.Lf7_lsr32_start_\@:
    lsr   \d3
    ror   \d2
    ror   \d1
    ror   \d0
    rjmp  cluster_c_tail_18
.Lf7_lsr32_end_\@:
    .if (.Lf7_lsr32_end_\@ - .Lf7_lsr32_start_\@) != 10
        .error "F7 LSR32 slot is not exactly five words"
    .endif
.endm

.macro emit_f7_asr32 d0, d1, d2, d3
.Lf7_asr32_start_\@:
    asr   \d3
    ror   \d2
    ror   \d1
    ror   \d0
    rjmp  cluster_c_tail_18
.Lf7_asr32_end_\@:
    .if (.Lf7_asr32_end_\@ - .Lf7_asr32_start_\@) != 10
        .error "F7 ASR32 slot is not exactly five words"
    .endif
.endm

.macro emit_f7_bool dstl, dsth
.Lf7_bool_start_\@:
    or    \dstl, \dsth
    clr   \dsth
    cpse  \dstl, ZERO
    mov   \dstl, ONE
    rjmp  cluster_c_tail_18
.Lf7_bool_end_\@:
    .if (.Lf7_bool_end_\@ - .Lf7_bool_start_\@) != 10
        .error "F7 BOOL slot is not exactly five words"
    .endif
.endm

.macro emit_f7_invalid trap
.Lf7_invalid_start_\@:
    rjmp  \trap
    nop
    nop
    nop
    nop
.Lf7_invalid_end_\@:
    .if (.Lf7_invalid_end_\@ - .Lf7_invalid_start_\@) != 10
        .error "F7 reserved slot is not exactly five words"
    .endif
.endm

.macro emit_f8_cset dstl, dsth, flag_bit, skipop
.Lf8_cset_start_\@:
    clr   \dstl
    clr   \dsth
    \skipop VM_FLAGS, \flag_bit
    mov   \dstl, ONE
    rjmp  cluster_c_tail_18
.Lf8_cset_end_\@:
    .if (.Lf8_cset_end_\@ - .Lf8_cset_start_\@) != 10
        .error "F8 CSET slot is not exactly five words"
    .endif
.endm

.macro emit_cmov_entry dst, src
.Lcmov_start_\@:
    movw  \dst, \src
    rjmp  cmov_tail
.Lcmov_end_\@:
    .if (.Lcmov_end_\@ - .Lcmov_start_\@) != 4
        .error "FB-FD CMOV entry is not exactly two AVR words"
    .endif
.endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Secondary-page cadence clusters and table insertion anchors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; These copies are intentionally separate from the one-byte primary tails.
; Future secondary tables are inserted at the marked anchors so every slot's
; final RJMP remains comfortably within range without changing these sequences.

; Cluster A serves F0/F1/F2/F3, the dedicated F9 decoder, cold F0 bodies,
; and the FB-FD condition gate/table. FA and FE shared bodies use Cluster C.
; The CMOV false path reaches this landing twelve cycles after launching the
; following-primary transfer. NOP plus the two-cycle RJMP supply exactly three
; cycles, so the reverse tail's OUT lands on cycle 17. The two-cycle F1 landing
; shares the RJMP. Keep both entries outside the measured 24-word cluster.
cluster_a_tail:
    nop
cluster_a_tail_17_delay_2:
    rjmp cluster_a_tail_17
cluster_a_start:
cluster_a_tail_17_delay_1:
    nop
cluster_a_tail_17:
    dispatch_reverse

cluster_a_tail_18_delay_2:
    rjmp cluster_a_tail_18
flags_commit_a_18_delay_1:
    out  VM_FLAGS, SECONDARY_OPCODE
cluster_a_tail_18_delay_1:
    nop
cluster_a_tail_18:
    dispatch
cluster_a_end:
.if (cluster_a_end - cluster_a_start) != 48
    .error "secondary cadence Cluster A must occupy 24 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Shared F0 trailing-operand fetch helpers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; The generic F0 decoder reads the secondary at cycle 17 and launches the first
; trailing operand at cycle 18. Decoder completion, IJMP, and a one-word veneer
; place an operation-specific body at cycle 32. When RCALL is the body's first
; instruction, these helpers begin at cycle 35, the first legal IN cycle for
; that transfer. A body may perform setup before RCALL; that only delays the
; standard IN/OUT handoff and remains safe.
;
; Both helpers return with VM_PC naming the final consumed operand and with the
; following primary opcode already in flight. The operation body must finish by
; entering an appropriate cadence tail, which advances VM_PC from the final
; operand to the following opcode.

f0_fetch_u8_start:
f0_fetch_spec:
f0_fetch_s8:
f0_fetch_u8:
    in   F0_OPERAND_LO, SPDR
    out  SPDR, ZERO
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    ret
f0_fetch_u8_end:
.if (f0_fetch_u8_end - f0_fetch_u8_start) != 12
    .error "shared F0 one-byte fetch helper must occupy exactly six AVR words"
.endif

; Fetch a stack displacement while preserving the F0 secondary long enough
; to decode its low three bits into an architectural-register pointer in X.
; Z receives SP+u8 without modifying SP. The following primary opcode is
; launched before both address calculations, so all useful decode work overlaps
; its SPI transfer.
f0_fetch_stack_u8_decode_r_to_xz_start:
f0_fetch_stack_u8_decode_r_to_xz:
    mov  r26, SECONDARY_OPCODE
    in   F0_OPERAND_LO, SPDR
    out  SPDR, ZERO
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    andi r26, 0x07
    lsl  r26
    subi r26, -8
    mov  r27, ZERO
    movw r30, VM_SP
    add  r30, F0_OPERAND_LO
    adc  r31, ZERO
    ret
f0_fetch_stack_u8_decode_r_to_xz_end:
.if (f0_fetch_stack_u8_decode_r_to_xz_end - f0_fetch_stack_u8_decode_r_to_xz_start) != 28
    .error "shared F0 stack fetch/decode helper must occupy exactly fourteen AVR words"
.endif

; Fetch a little-endian 16-bit operand. The low byte is read at cycle 35 and
; the high-byte transfer starts at cycle 36. Advancing VM_PC by two consumes
; both operand bytes; three four-cycle delays place the high-byte IN at cycle
; 53 and the speculative following-primary OUT at cycle 54.
f0_fetch_u16_start:
f0_fetch_addr16:
f0_fetch_imm16:
f0_fetch_u16:
    in   F0_OPERAND_LO, SPDR
    out  SPDR, ZERO
    ldi  F0_OPERAND_HI, 2
    add  VM_PCL, F0_OPERAND_HI
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    delay_4
    delay_4
    delay_4
    in   F0_OPERAND_HI, SPDR
    out  SPDR, ZERO
    ret
f0_fetch_u16_end:
.if (f0_fetch_u16_end - f0_fetch_u16_start) != 30
    .error "shared F0 two-byte fetch helper must occupy exactly fifteen AVR words"
.endif

; Fetch a little-endian absolute data-space address and decode the F0
; secondary's low three bits into an architectural-register pointer in X.
; The width-one decoder leaves secondary*1 in r0, so the helper can read the
; low address byte at the earliest legal cycle without first preserving r24.
; Register decoding and the remaining delay execute while the high address
; byte transfers. On return, Z is addr16, X selects rN, VM_PC names addr16[15:8],
; and the following primary opcode is already in flight.
f0_fetch_addr16_decode_r_to_xz_start:
f0_fetch_addr16_decode_r_to_xz:
    in    r30, SPDR
    out   SPDR, ZERO
    ldi   F0_OPERAND_HI, 2
    add   VM_PCL, F0_OPERAND_HI
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO

    mov   r26, r0
    andi  r26, 0x07
    lsl   r26
    subi  r26, -8
    mov   r27, ZERO

    delay_4
    delay_3
    in    r31, SPDR
    out   SPDR, ZERO
    ret
f0_fetch_addr16_decode_r_to_xz_end:
.if (f0_fetch_addr16_decode_r_to_xz_end - f0_fetch_addr16_decode_r_to_xz_start) != 34
    .error "shared F0 absolute-address fetch/decode helper must occupy exactly seventeen AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; F0 00-0F: lower-register immediate instructions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Each one-word F0 veneer RJMPs directly to a destination-specialized body. The
; body's first instruction is RCALL to one of the shared trailing-operand fetch
; helpers above. One-byte forms fetch imm8 at cycle 35 and launch the following
; primary opcode at cycle 36; two-byte forms read imm16[15:8] at cycle 53 and
; launch the following primary opcode at cycle 54. The apply stubs then use the
; same reverse or standard cadence tails as the upper-register primary immediates.

.macro emit_f0_ldi8_body label, dstl, dsth
\label:
    rcall f0_fetch_u8
    mov   \dstl, F0_OPERAND_LO
    clr   \dsth
    rjmp  cluster_tail_17_delay_1
.endm

.macro emit_f0_ldi16_body label, dstl, dsth
\label:
    rcall f0_fetch_u16
    mov   \dstl, F0_OPERAND_LO
    mov   \dsth, F0_OPERAND_HI
    rjmp  immediate_result_tail_reverse_delay_4
.endm

.macro emit_f0_addi_s8_body label, dstl, dsth
\label:
    rcall f0_fetch_s8
    clr   F0_OPERAND_HI
    sbrc  F0_OPERAND_LO, 7
    com   F0_OPERAND_HI
    add   \dstl, F0_OPERAND_LO
    adc   \dsth, F0_OPERAND_HI
    rjmp  cluster_tail_18_delay_1
.endm

.macro emit_f0_cmpi_s8_body label, lhsl, lhsh
\label:
    rcall f0_fetch_s8
    clr   F0_OPERAND_HI
    sbrc  F0_OPERAND_LO, 7
    com   F0_OPERAND_HI
    cp    \lhsl, F0_OPERAND_LO
    cpc   \lhsh, F0_OPERAND_HI
    in    PRIMARY_OPCODE, SREG
    rjmp  flags_commit_18
.endm

emit_f0_ldi8_body    f0_ldi8_r0_body,    VM_R0L, VM_R0H
emit_f0_ldi8_body    f0_ldi8_r1_body,    VM_R1L, VM_R1H
emit_f0_ldi8_body    f0_ldi8_r2_body,    VM_R2L, VM_R2H
emit_f0_ldi8_body    f0_ldi8_r3_body,    VM_R3L, VM_R3H

emit_f0_ldi16_body   f0_ldi16_r0_body,   VM_R0L, VM_R0H
emit_f0_ldi16_body   f0_ldi16_r1_body,   VM_R1L, VM_R1H
emit_f0_ldi16_body   f0_ldi16_r2_body,   VM_R2L, VM_R2H
emit_f0_ldi16_body   f0_ldi16_r3_body,   VM_R3L, VM_R3H

emit_f0_addi_s8_body f0_addi_s8_r0_body, VM_R0L, VM_R0H
emit_f0_addi_s8_body f0_addi_s8_r1_body, VM_R1L, VM_R1H
emit_f0_addi_s8_body f0_addi_s8_r2_body, VM_R2L, VM_R2H
emit_f0_addi_s8_body f0_addi_s8_r3_body, VM_R3L, VM_R3H

emit_f0_cmpi_s8_body f0_cmpi_s8_r0_body, VM_R0L, VM_R0H
emit_f0_cmpi_s8_body f0_cmpi_s8_r1_body, VM_R1L, VM_R1H
emit_f0_cmpi_s8_body f0_cmpi_s8_r2_body, VM_R2L, VM_R2H
emit_f0_cmpi_s8_body f0_cmpi_s8_r3_body, VM_R3L, VM_R3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; F0 10-3F: stack-relative forms
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; All six families share the stack fetch/decode helper. On return, X addresses
; the selected architectural register, Z is SP+u8, VM_PC names the displacement,
; and the following primary opcode is already in flight. SP itself is unchanged.

f0_leasp_r_body:
    rcall f0_fetch_stack_u8_decode_r_to_xz
    st    X+, r30
    st    X,  r31
    rjmp  cluster_tail_18

f0_ldsp8u_r_body:
    rcall f0_fetch_stack_u8_decode_r_to_xz
    ld    r0, Z
    st    X+, r0
    st    X,  ZERO
    rjmp  cluster_tail_18

f0_ldsp8s_r_body:
    rcall f0_fetch_stack_u8_decode_r_to_xz
    ld    r0, Z
    st    X+, r0
    lsl   r0
    sbc   r0, r0
    st    X, r0
    rjmp  cluster_tail_18

f0_stsp8_r_body:
    rcall f0_fetch_stack_u8_decode_r_to_xz
    ld    r0, X
    st    Z, r0
    rjmp  cluster_tail_18

f0_ldsp16_r_body:
    rcall f0_fetch_stack_u8_decode_r_to_xz
    ld    r0, Z+
    ld    r1, Z
    st    X+, r0
    st    X,  r1
    rjmp  cluster_tail_18

f0_stsp16_r_body:
    rcall f0_fetch_stack_u8_decode_r_to_xz
    ld    r0, X+
    ld    r1, X
    st    Z+, r0
    st    Z,  r1
    rjmp  cluster_tail_18

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; F0 40-5F: absolute data-space forms
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; All four families share the absolute-address fetch/decode helper. The helper
; launches the following primary opcode before returning. The selected tail
; padding makes the subsequent SPDR read occur exactly seventeen cycles later
; for every byte and word operation.

; STM8 has the shortest operation body and therefore needs five cycles of
; landing delay before the standard dispatch body.
f0_absolute_bodies_start:
f0_absolute_tail_18_delay_5:
    delay_2
    rjmp  cluster_tail_18_delay_1

f0_ldm8u_r_body:
    rcall f0_fetch_addr16_decode_r_to_xz
    ld    r0, Z
    st    X+, r0
    st    X,  ZERO
    rjmp  cluster_tail_18_delay_3

f0_stm8_r_body:
    rcall f0_fetch_addr16_decode_r_to_xz
    ld    r0, X
    st    Z, r0
    rjmp  f0_absolute_tail_18_delay_5

f0_ldm16_r_body:
    rcall f0_fetch_addr16_decode_r_to_xz
    ld    r0, Z+
    ld    r1, Z
    st    X+, r0
    st    X,  r1
    rjmp  cluster_tail_18_delay_1

f0_stm16_r_body:
    rcall f0_fetch_addr16_decode_r_to_xz
    ld    r0, X+
    ld    r1, X
    st    Z+, r0
    st    Z,  r1
    rjmp  cluster_tail_18_delay_1
f0_absolute_bodies_end:
.if (f0_absolute_bodies_end - f0_absolute_bodies_start) != 46
    .error "F0 absolute data-space bodies must occupy exactly twenty-three AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; F0 6C-6D: general-pointer data-space forms
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; RRSPEC is dddWaaaP:
;   bits 7:5  data register rD/rS
;   bit  4    width: 0=byte, 1=word
;   bits 3:1  pointer register rA
;   bit  0    update: 0=ordinary, 1=postincrement
;
; Section 9.5 uses an independent reverse-order RRSPEC consume/restart entry.
; In this interpreter the generic width-one F0 decoder reaches its veneer two
; cycles later than the guide's original layout. One cycle is still required
; before the exact handoff, so BST uses that cadence slot to preserve secondary
; bit 0 in native T: the decoder launches RRSPEC at cycle 9 after F0-slot
; entry, and this entry launches the following primary at cycle 26, exactly 17
; cycles later. r0 still contains secondary*1 at the BST.
;
; Ordinary loads capture the effective address before writing rD. Stores
; capture the complete selected source before reading rA. These orderings make
; ordinary load overlap and every store overlap legal. Postincrement load
; aliases with rD == rA remain architecturally reserved as specified by the
; ISA; valid encodings follow the reference Section 9.5 paths below.

f0_coldmem_start:
f0_coldmem_delay_1:
    bst   r0, 0                 ; T=0 for F0 6C load, T=1 for F0 6D store
f0_coldmem:
    add   VM_PCL, ONE
    cli
    out   SPDR, ZERO
    in    F0_COLDMEM_SPEC, SPDR
    sei
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO

    ; X = data-register file pointer; Z = pointer-register file pointer.
    f0_decode_general_pointer_spec F0_COLDMEM_SPEC

    ; The cadence-slot BST preserved secondary bit 0 in native T. Branching
    ; to the store body now costs one word and saves one cycle on both families.
    brts  f0_coldmem_store

f0_coldmem_load:
    ; Preserve the architectural pointer's register-file address.
    mov   r0, r30

    ; Capture the effective data-space address before writing rD.
    ld    r24, Z+
    ld    r25, Z
    movw  Z, r24

    ; Load one byte, zero-extend, and conditionally load the high byte.
    ld    r24, Z+
    clr   r25
    sbrc  F0_COLDMEM_SPEC, 4
    ld    r25, Z+

    ; Write the selected byte or word result.
    st    X+, r24
    st    X,  r25

    ; P=0 discards native Z advancement. P=1 writes it back to rA.
    sbrs  F0_COLDMEM_SPEC, 0
    rjmp  cluster_a_tail_18
    mov   r26, r0
    ; XH is still zero on the load path; fall through.

f0_coldmem_post_writeback:
    st    X+, r30
    st    X,  r31
    rjmp  cluster_a_tail_18

f0_coldmem_store:
    ; Capture both source bytes before reading rA, preserving every
    ; source/pointer overlap case. Byte stores simply leave r25 unused.
    ld    r0, X+
    ld    r25, X

    ; Z still addresses architectural rA. Load its effective data-space address
    ; directly into X; after the first load, Z points at rA's high byte.
    ld    r26, Z+
    ld    r27, Z

    ; Store through X, leaving X advanced by the selected width.
    st    X+, r0
    sbrc  F0_COLDMEM_SPEC, 4
    st    X+, r25

    ; P=0 discards the advanced X value. For P=1, Z still points at rA's high
    ; byte, so write back high then predecrement and write low.
    sbrs  F0_COLDMEM_SPEC, 0
    rjmp  cluster_a_tail_18
    st    Z,  r27
    st    -Z, r26
    rjmp  cluster_a_tail_18

f0_coldmem_end:
.if (f0_coldmem_end - f0_coldmem_start) != 92
    .error "F0 general-pointer subsystem must occupy exactly forty-six AVR words"
.endif

; F0 retains one-word veneers for the remaining cold forms. Secondaries 00-5F
; and 6C-6D are implemented above; the local F0 trap remains before the group
; for short RJMP reach.
secondary_tables_before_cluster_b:
secondary_unimplemented_a_func:
    rjmp unimplemented_instruction_func

f0_veneer_table:
    rjmp  f0_ldi8_r0_body
    rjmp  f0_ldi8_r1_body
    rjmp  f0_ldi8_r2_body
    rjmp  f0_ldi8_r3_body

    rjmp  f0_ldi16_r0_body
    rjmp  f0_ldi16_r1_body
    rjmp  f0_ldi16_r2_body
    rjmp  f0_ldi16_r3_body

    rjmp  f0_addi_s8_r0_body
    rjmp  f0_addi_s8_r1_body
    rjmp  f0_addi_s8_r2_body
    rjmp  f0_addi_s8_r3_body

    rjmp  f0_cmpi_s8_r0_body
    rjmp  f0_cmpi_s8_r1_body
    rjmp  f0_cmpi_s8_r2_body
    rjmp  f0_cmpi_s8_r3_body

    ; 10-17: LEASP r0-r7,u8
    .rept 8
        rjmp f0_leasp_r_body
    .endr

    ; 18-1F: LDSP8U r0-r7,[SP+u8]
    .rept 8
        rjmp f0_ldsp8u_r_body
    .endr

    ; 20-27: LDSP8S r0-r7,[SP+u8]
    .rept 8
        rjmp f0_ldsp8s_r_body
    .endr

    ; 28-2F: STSP8 [SP+u8],r0-r7
    .rept 8
        rjmp f0_stsp8_r_body
    .endr

    ; 30-37: LDSP16 r0-r7,[SP+u8]
    .rept 8
        rjmp f0_ldsp16_r_body
    .endr

    ; 38-3F: STSP16 [SP+u8],r0-r7
    .rept 8
        rjmp f0_stsp16_r_body
    .endr

    ; 40-47: LDM8U r0-r7,addr16
    .rept 8
        rjmp f0_ldm8u_r_body
    .endr

    ; 48-4F: STM8 addr16,r0-r7
    .rept 8
        rjmp f0_stm8_r_body
    .endr

    ; 50-57: LDM16 r0-r7,addr16
    .rept 8
        rjmp f0_ldm16_r_body
    .endr

    ; 58-5F: STM16 addr16,r0-r7
    .rept 8
        rjmp f0_stm16_r_body
    .endr

    ; 60-6B: program-space and cold-32 forms remain unimplemented.
    .rept (0x6C - 0x60)
        rjmp secondary_unimplemented_a_func
    .endr

    ; 6C-6D: general-pointer load/store; trailing byte is dddWaaaP.
    rjmp  f0_coldmem_delay_1
    rjmp  f0_coldmem_delay_1
f0_veneer_table_end:
.if (f0_veneer_table_end - f0_veneer_table) != (2 * 0x6E)
    .error "F0 veneer table has incorrect size"
.endif

f1_table:
    ; F1: bounded two-word dense table
    emit_f1_mov r8, r8
    emit_f1_mov r8, r10
    emit_f1_mov r8, r12
    emit_f1_mov r8, r14
    emit_f1_mov r8, r16
    emit_f1_mov r8, r18
    emit_f1_mov r8, r20
    emit_f1_mov r8, r22
    emit_f1_mov r10, r8
    emit_f1_mov r10, r10
    emit_f1_mov r10, r12
    emit_f1_mov r10, r14
    emit_f1_mov r10, r16
    emit_f1_mov r10, r18
    emit_f1_mov r10, r20
    emit_f1_mov r10, r22
    emit_f1_mov r12, r8
    emit_f1_mov r12, r10
    emit_f1_mov r12, r12
    emit_f1_mov r12, r14
    emit_f1_mov r12, r16
    emit_f1_mov r12, r18
    emit_f1_mov r12, r20
    emit_f1_mov r12, r22
    emit_f1_mov r14, r8
    emit_f1_mov r14, r10
    emit_f1_mov r14, r12
    emit_f1_mov r14, r14
    emit_f1_mov r14, r16
    emit_f1_mov r14, r18
    emit_f1_mov r14, r20
    emit_f1_mov r14, r22
    emit_f1_mov r16, r8
    emit_f1_mov r16, r10
    emit_f1_mov r16, r12
    emit_f1_mov r16, r14
    emit_f1_mov r18, r8
    emit_f1_mov r18, r10
    emit_f1_mov r18, r12
    emit_f1_mov r18, r14
    emit_f1_mov r20, r8
    emit_f1_mov r20, r10
    emit_f1_mov r20, r12
    emit_f1_mov r20, r14
    emit_f1_mov r22, r8
    emit_f1_mov r22, r10
    emit_f1_mov r22, r12
    emit_f1_mov r22, r14
    emit_f1_stsp8 r16, 0
    emit_f1_stsp8 r18, 0
    emit_f1_stsp8 r20, 0
    emit_f1_stsp8 r22, 0
    emit_f1_stsp8 r16, 1
    emit_f1_stsp8 r18, 1
    emit_f1_stsp8 r20, 1
    emit_f1_stsp8 r22, 1
    emit_f1_stsp8 r16, 2
    emit_f1_stsp8 r18, 2
    emit_f1_stsp8 r20, 2
    emit_f1_stsp8 r22, 2
    emit_f1_stsp8 r16, 3
    emit_f1_stsp8 r18, 3
    emit_f1_stsp8 r20, 3
    emit_f1_stsp8 r22, 3
    emit_f1_stsp8 r16, 4
    emit_f1_stsp8 r18, 4
    emit_f1_stsp8 r20, 4
    emit_f1_stsp8 r22, 4
    emit_f1_stsp8 r16, 5
    emit_f1_stsp8 r18, 5
    emit_f1_stsp8 r20, 5
    emit_f1_stsp8 r22, 5
    emit_f1_stsp8 r16, 6
    emit_f1_stsp8 r18, 6
    emit_f1_stsp8 r20, 6
    emit_f1_stsp8 r22, 6
    emit_f1_stsp8 r16, 7
    emit_f1_stsp8 r18, 7
    emit_f1_stsp8 r20, 7
    emit_f1_stsp8 r22, 7
    emit_f1_stsp8 r16, 8
    emit_f1_stsp8 r18, 8
    emit_f1_stsp8 r20, 8
    emit_f1_stsp8 r22, 8
    emit_f1_stsp8 r16, 9
    emit_f1_stsp8 r18, 9
    emit_f1_stsp8 r20, 9
    emit_f1_stsp8 r22, 9
    emit_f1_stsp8 r16, 10
    emit_f1_stsp8 r18, 10
    emit_f1_stsp8 r20, 10
    emit_f1_stsp8 r22, 10
    emit_f1_stsp8 r16, 11
    emit_f1_stsp8 r18, 11
    emit_f1_stsp8 r20, 11
    emit_f1_stsp8 r22, 11
    emit_f1_stsp8 r16, 12
    emit_f1_stsp8 r18, 12
    emit_f1_stsp8 r20, 12
    emit_f1_stsp8 r22, 12
    emit_f1_stsp8 r16, 13
    emit_f1_stsp8 r18, 13
    emit_f1_stsp8 r20, 13
    emit_f1_stsp8 r22, 13
    emit_f1_stsp8 r16, 14
    emit_f1_stsp8 r18, 14
    emit_f1_stsp8 r20, 14
    emit_f1_stsp8 r22, 14
    emit_f1_stsp8 r16, 15
    emit_f1_stsp8 r18, 15
    emit_f1_stsp8 r20, 15
    emit_f1_stsp8 r22, 15
    emit_f1_zext8 r9
    emit_f1_zext8 r11
    emit_f1_zext8 r13
    emit_f1_zext8 r15
    emit_f1_zext8 r17
    emit_f1_zext8 r19
    emit_f1_zext8 r21
    emit_f1_zext8 r23
    emit_f1_swap8 r8
    emit_f1_swap8 r10
    emit_f1_swap8 r12
    emit_f1_swap8 r14
    emit_f1_swap8 r16
    emit_f1_swap8 r18
    emit_f1_swap8 r20
    emit_f1_swap8 r22
    emit_f1_getsp r8
    emit_f1_getsp r10
    emit_f1_getsp r12
    emit_f1_getsp r14
    emit_f1_getsp r16
    emit_f1_getsp r18
    emit_f1_getsp r20
    emit_f1_getsp r22
    emit_f1_setsp r8
    emit_f1_setsp r10
    emit_f1_setsp r12
    emit_f1_setsp r14
    emit_f1_setsp r16
    emit_f1_setsp r18
    emit_f1_setsp r20
    emit_f1_setsp r22
f1_table_end:
.if (f1_table_end - f1_table) != (2 * 0x90 * 2)
    .error "f1_table has incorrect size"
.endif

f2_table:
    ; F2: bounded three-word ADD/SUB table
    emit_f2_add r8, r9, r8, r9
    emit_f2_add r8, r9, r10, r11
    emit_f2_add r8, r9, r12, r13
    emit_f2_add r8, r9, r14, r15
    emit_f2_add r8, r9, r16, r17
    emit_f2_add r8, r9, r18, r19
    emit_f2_add r8, r9, r20, r21
    emit_f2_add r8, r9, r22, r23
    emit_f2_add r10, r11, r8, r9
    emit_f2_add r10, r11, r10, r11
    emit_f2_add r10, r11, r12, r13
    emit_f2_add r10, r11, r14, r15
    emit_f2_add r10, r11, r16, r17
    emit_f2_add r10, r11, r18, r19
    emit_f2_add r10, r11, r20, r21
    emit_f2_add r10, r11, r22, r23
    emit_f2_add r12, r13, r8, r9
    emit_f2_add r12, r13, r10, r11
    emit_f2_add r12, r13, r12, r13
    emit_f2_add r12, r13, r14, r15
    emit_f2_add r12, r13, r16, r17
    emit_f2_add r12, r13, r18, r19
    emit_f2_add r12, r13, r20, r21
    emit_f2_add r12, r13, r22, r23
    emit_f2_add r14, r15, r8, r9
    emit_f2_add r14, r15, r10, r11
    emit_f2_add r14, r15, r12, r13
    emit_f2_add r14, r15, r14, r15
    emit_f2_add r14, r15, r16, r17
    emit_f2_add r14, r15, r18, r19
    emit_f2_add r14, r15, r20, r21
    emit_f2_add r14, r15, r22, r23
    emit_f2_add r16, r17, r8, r9
    emit_f2_add r16, r17, r10, r11
    emit_f2_add r16, r17, r12, r13
    emit_f2_add r16, r17, r14, r15
    emit_f2_add r18, r19, r8, r9
    emit_f2_add r18, r19, r10, r11
    emit_f2_add r18, r19, r12, r13
    emit_f2_add r18, r19, r14, r15
    emit_f2_add r20, r21, r8, r9
    emit_f2_add r20, r21, r10, r11
    emit_f2_add r20, r21, r12, r13
    emit_f2_add r20, r21, r14, r15
    emit_f2_add r22, r23, r8, r9
    emit_f2_add r22, r23, r10, r11
    emit_f2_add r22, r23, r12, r13
    emit_f2_add r22, r23, r14, r15
    emit_f2_sub r8, r9, r8, r9
    emit_f2_sub r8, r9, r10, r11
    emit_f2_sub r8, r9, r12, r13
    emit_f2_sub r8, r9, r14, r15
    emit_f2_sub r8, r9, r16, r17
    emit_f2_sub r8, r9, r18, r19
    emit_f2_sub r8, r9, r20, r21
    emit_f2_sub r8, r9, r22, r23
    emit_f2_sub r10, r11, r8, r9
    emit_f2_sub r10, r11, r10, r11
    emit_f2_sub r10, r11, r12, r13
    emit_f2_sub r10, r11, r14, r15
    emit_f2_sub r10, r11, r16, r17
    emit_f2_sub r10, r11, r18, r19
    emit_f2_sub r10, r11, r20, r21
    emit_f2_sub r10, r11, r22, r23
    emit_f2_sub r12, r13, r8, r9
    emit_f2_sub r12, r13, r10, r11
    emit_f2_sub r12, r13, r12, r13
    emit_f2_sub r12, r13, r14, r15
    emit_f2_sub r12, r13, r16, r17
    emit_f2_sub r12, r13, r18, r19
    emit_f2_sub r12, r13, r20, r21
    emit_f2_sub r12, r13, r22, r23
    emit_f2_sub r14, r15, r8, r9
    emit_f2_sub r14, r15, r10, r11
    emit_f2_sub r14, r15, r12, r13
    emit_f2_sub r14, r15, r14, r15
    emit_f2_sub r14, r15, r16, r17
    emit_f2_sub r14, r15, r18, r19
    emit_f2_sub r14, r15, r20, r21
    emit_f2_sub r14, r15, r22, r23
    emit_f2_sub r16, r17, r8, r9
    emit_f2_sub r16, r17, r10, r11
    emit_f2_sub r16, r17, r12, r13
    emit_f2_sub r16, r17, r14, r15
    emit_f2_sub r18, r19, r8, r9
    emit_f2_sub r18, r19, r10, r11
    emit_f2_sub r18, r19, r12, r13
    emit_f2_sub r18, r19, r14, r15
    emit_f2_sub r20, r21, r8, r9
    emit_f2_sub r20, r21, r10, r11
    emit_f2_sub r20, r21, r12, r13
    emit_f2_sub r20, r21, r14, r15
    emit_f2_sub r22, r23, r8, r9
    emit_f2_sub r22, r23, r10, r11
    emit_f2_sub r22, r23, r12, r13
    emit_f2_sub r22, r23, r14, r15
f2_table_end:
.if (f2_table_end - f2_table) != (2 * 0x60 * 3)
    .error "f2_table has incorrect size"
.endif

f3_table:
    ; F3: bounded three-word memory and widening-multiply table
    emit_f3_st8 r16, r8
    emit_f3_st8 r16, r10
    emit_f3_st8 r16, r12
    emit_f3_st8 r16, r14
    emit_f3_st8 r18, r8
    emit_f3_st8 r18, r10
    emit_f3_st8 r18, r12
    emit_f3_st8 r18, r14
    emit_f3_st8 r20, r8
    emit_f3_st8 r20, r10
    emit_f3_st8 r20, r12
    emit_f3_st8 r20, r14
    emit_f3_st8 r22, r8
    emit_f3_st8 r22, r10
    emit_f3_st8 r22, r12
    emit_f3_st8 r22, r14
    emit_f3_mul mul, r16, r16
    emit_f3_mul mul, r16, r18
    emit_f3_mul mul, r16, r20
    emit_f3_mul mul, r16, r22
    emit_f3_mul mul, r18, r16
    emit_f3_mul mul, r18, r18
    emit_f3_mul mul, r18, r20
    emit_f3_mul mul, r18, r22
    emit_f3_mul mul, r20, r16
    emit_f3_mul mul, r20, r18
    emit_f3_mul mul, r20, r20
    emit_f3_mul mul, r20, r22
    emit_f3_mul mul, r22, r16
    emit_f3_mul mul, r22, r18
    emit_f3_mul mul, r22, r20
    emit_f3_mul mul, r22, r22
    emit_f3_mul muls, r16, r16
    emit_f3_mul muls, r16, r18
    emit_f3_mul muls, r16, r20
    emit_f3_mul muls, r16, r22
    emit_f3_mul muls, r18, r16
    emit_f3_mul muls, r18, r18
    emit_f3_mul muls, r18, r20
    emit_f3_mul muls, r18, r22
    emit_f3_mul muls, r20, r16
    emit_f3_mul muls, r20, r18
    emit_f3_mul muls, r20, r20
    emit_f3_mul muls, r20, r22
    emit_f3_mul muls, r22, r16
    emit_f3_mul muls, r22, r18
    emit_f3_mul muls, r22, r20
    emit_f3_mul muls, r22, r22
    emit_f3_mul mulsu, r16, r16
    emit_f3_mul mulsu, r16, r18
    emit_f3_mul mulsu, r16, r20
    emit_f3_mul mulsu, r16, r22
    emit_f3_mul mulsu, r18, r16
    emit_f3_mul mulsu, r18, r18
    emit_f3_mul mulsu, r18, r20
    emit_f3_mul mulsu, r18, r22
    emit_f3_mul mulsu, r20, r16
    emit_f3_mul mulsu, r20, r18
    emit_f3_mul mulsu, r20, r20
    emit_f3_mul mulsu, r20, r22
    emit_f3_mul mulsu, r22, r16
    emit_f3_mul mulsu, r22, r18
    emit_f3_mul mulsu, r22, r20
    emit_f3_mul mulsu, r22, r22
    emit_f3_ldsp8u r16, r17, 0
    emit_f3_ldsp8u r18, r19, 0
    emit_f3_ldsp8u r20, r21, 0
    emit_f3_ldsp8u r22, r23, 0
    emit_f3_ldsp8u r16, r17, 1
    emit_f3_ldsp8u r18, r19, 1
    emit_f3_ldsp8u r20, r21, 1
    emit_f3_ldsp8u r22, r23, 1
    emit_f3_ldsp8u r16, r17, 2
    emit_f3_ldsp8u r18, r19, 2
    emit_f3_ldsp8u r20, r21, 2
    emit_f3_ldsp8u r22, r23, 2
    emit_f3_ldsp8u r16, r17, 3
    emit_f3_ldsp8u r18, r19, 3
    emit_f3_ldsp8u r20, r21, 3
    emit_f3_ldsp8u r22, r23, 3
    emit_f3_ldsp8u r16, r17, 4
    emit_f3_ldsp8u r18, r19, 4
    emit_f3_ldsp8u r20, r21, 4
    emit_f3_ldsp8u r22, r23, 4
    emit_f3_ldsp8u r16, r17, 5
    emit_f3_ldsp8u r18, r19, 5
    emit_f3_ldsp8u r20, r21, 5
    emit_f3_ldsp8u r22, r23, 5
    emit_f3_ldsp8u r16, r17, 6
    emit_f3_ldsp8u r18, r19, 6
    emit_f3_ldsp8u r20, r21, 6
    emit_f3_ldsp8u r22, r23, 6
    emit_f3_ldsp8u r16, r17, 7
    emit_f3_ldsp8u r18, r19, 7
    emit_f3_ldsp8u r20, r21, 7
    emit_f3_ldsp8u r22, r23, 7
    emit_f3_ldsp8u r16, r17, 8
    emit_f3_ldsp8u r18, r19, 8
    emit_f3_ldsp8u r20, r21, 8
    emit_f3_ldsp8u r22, r23, 8
    emit_f3_ldsp8u r16, r17, 9
    emit_f3_ldsp8u r18, r19, 9
    emit_f3_ldsp8u r20, r21, 9
    emit_f3_ldsp8u r22, r23, 9
    emit_f3_ldsp8u r16, r17, 10
    emit_f3_ldsp8u r18, r19, 10
    emit_f3_ldsp8u r20, r21, 10
    emit_f3_ldsp8u r22, r23, 10
    emit_f3_ldsp8u r16, r17, 11
    emit_f3_ldsp8u r18, r19, 11
    emit_f3_ldsp8u r20, r21, 11
    emit_f3_ldsp8u r22, r23, 11
    emit_f3_ldsp8u r16, r17, 12
    emit_f3_ldsp8u r18, r19, 12
    emit_f3_ldsp8u r20, r21, 12
    emit_f3_ldsp8u r22, r23, 12
    emit_f3_ldsp8u r16, r17, 13
    emit_f3_ldsp8u r18, r19, 13
    emit_f3_ldsp8u r20, r21, 13
    emit_f3_ldsp8u r22, r23, 13
    emit_f3_ldsp8u r16, r17, 14
    emit_f3_ldsp8u r18, r19, 14
    emit_f3_ldsp8u r20, r21, 14
    emit_f3_ldsp8u r22, r23, 14
    emit_f3_ldsp8u r16, r17, 15
    emit_f3_ldsp8u r18, r19, 15
    emit_f3_ldsp8u r20, r21, 15
    emit_f3_ldsp8u r22, r23, 15
f3_table_end:
.if (f3_table_end - f3_table) != (2 * 0x80 * 3)
    .error "f3_table has incorrect size"
.endif

; Cluster B serves F4-F6 and provides both one- and two-cycle flag-commit
; landings needed by TST8, CMP, and TST16 families.
cluster_b_start:
cluster_b_tail_17_delay_1:
    nop
cluster_b_tail_17:
    dispatch_reverse

flags_commit_b_18_delay_2:
    out  VM_FLAGS, SECONDARY_OPCODE
cluster_b_tail_18_delay_2:
    rjmp cluster_b_tail_18
flags_commit_b_18_delay_1:
    out  VM_FLAGS, SECONDARY_OPCODE
cluster_b_tail_18_delay_1:
    nop
cluster_b_tail:
cluster_b_tail_18:
    dispatch
cluster_b_end:
.if (cluster_b_end - cluster_b_start) != 50
    .error "secondary cadence Cluster B must occupy 25 AVR words"
.endif

; F4-F7 contain their exact native slots. A nearby invalid-secondary shim is
; used only by the reserved postincrement-load alias entries in F7.
secondary_tables_before_cluster_c:
secondary_unimplemented_b_func:
    rjmp secondary_unimplemented_a_func
secondary_invalid_b_func:
    rjmp invalid_secondary_instruction_func

f4_table:
    ; F4: bounded three-word stack, unary, and fixed-shift table
    emit_f4_ldsp16 r16, r17, 0, 1
    emit_f4_ldsp16 r18, r19, 0, 1
    emit_f4_ldsp16 r20, r21, 0, 1
    emit_f4_ldsp16 r22, r23, 0, 1
    emit_f4_ldsp16 r16, r17, 1, 2
    emit_f4_ldsp16 r18, r19, 1, 2
    emit_f4_ldsp16 r20, r21, 1, 2
    emit_f4_ldsp16 r22, r23, 1, 2
    emit_f4_ldsp16 r16, r17, 2, 3
    emit_f4_ldsp16 r18, r19, 2, 3
    emit_f4_ldsp16 r20, r21, 2, 3
    emit_f4_ldsp16 r22, r23, 2, 3
    emit_f4_ldsp16 r16, r17, 3, 4
    emit_f4_ldsp16 r18, r19, 3, 4
    emit_f4_ldsp16 r20, r21, 3, 4
    emit_f4_ldsp16 r22, r23, 3, 4
    emit_f4_ldsp16 r16, r17, 4, 5
    emit_f4_ldsp16 r18, r19, 4, 5
    emit_f4_ldsp16 r20, r21, 4, 5
    emit_f4_ldsp16 r22, r23, 4, 5
    emit_f4_ldsp16 r16, r17, 5, 6
    emit_f4_ldsp16 r18, r19, 5, 6
    emit_f4_ldsp16 r20, r21, 5, 6
    emit_f4_ldsp16 r22, r23, 5, 6
    emit_f4_ldsp16 r16, r17, 6, 7
    emit_f4_ldsp16 r18, r19, 6, 7
    emit_f4_ldsp16 r20, r21, 6, 7
    emit_f4_ldsp16 r22, r23, 6, 7
    emit_f4_ldsp16 r16, r17, 7, 8
    emit_f4_ldsp16 r18, r19, 7, 8
    emit_f4_ldsp16 r20, r21, 7, 8
    emit_f4_ldsp16 r22, r23, 7, 8
    emit_f4_ldsp16 r16, r17, 8, 9
    emit_f4_ldsp16 r18, r19, 8, 9
    emit_f4_ldsp16 r20, r21, 8, 9
    emit_f4_ldsp16 r22, r23, 8, 9
    emit_f4_ldsp16 r16, r17, 9, 10
    emit_f4_ldsp16 r18, r19, 9, 10
    emit_f4_ldsp16 r20, r21, 9, 10
    emit_f4_ldsp16 r22, r23, 9, 10
    emit_f4_ldsp16 r16, r17, 10, 11
    emit_f4_ldsp16 r18, r19, 10, 11
    emit_f4_ldsp16 r20, r21, 10, 11
    emit_f4_ldsp16 r22, r23, 10, 11
    emit_f4_ldsp16 r16, r17, 11, 12
    emit_f4_ldsp16 r18, r19, 11, 12
    emit_f4_ldsp16 r20, r21, 11, 12
    emit_f4_ldsp16 r22, r23, 11, 12
    emit_f4_ldsp16 r16, r17, 12, 13
    emit_f4_ldsp16 r18, r19, 12, 13
    emit_f4_ldsp16 r20, r21, 12, 13
    emit_f4_ldsp16 r22, r23, 12, 13
    emit_f4_ldsp16 r16, r17, 13, 14
    emit_f4_ldsp16 r18, r19, 13, 14
    emit_f4_ldsp16 r20, r21, 13, 14
    emit_f4_ldsp16 r22, r23, 13, 14
    emit_f4_ldsp16 r16, r17, 14, 15
    emit_f4_ldsp16 r18, r19, 14, 15
    emit_f4_ldsp16 r20, r21, 14, 15
    emit_f4_ldsp16 r22, r23, 14, 15
    emit_f4_ldsp16 r16, r17, 15, 16
    emit_f4_ldsp16 r18, r19, 15, 16
    emit_f4_ldsp16 r20, r21, 15, 16
    emit_f4_ldsp16 r22, r23, 15, 16
    emit_f4_stsp16 r16, r17, 0, 1
    emit_f4_stsp16 r18, r19, 0, 1
    emit_f4_stsp16 r20, r21, 0, 1
    emit_f4_stsp16 r22, r23, 0, 1
    emit_f4_stsp16 r16, r17, 1, 2
    emit_f4_stsp16 r18, r19, 1, 2
    emit_f4_stsp16 r20, r21, 1, 2
    emit_f4_stsp16 r22, r23, 1, 2
    emit_f4_stsp16 r16, r17, 2, 3
    emit_f4_stsp16 r18, r19, 2, 3
    emit_f4_stsp16 r20, r21, 2, 3
    emit_f4_stsp16 r22, r23, 2, 3
    emit_f4_stsp16 r16, r17, 3, 4
    emit_f4_stsp16 r18, r19, 3, 4
    emit_f4_stsp16 r20, r21, 3, 4
    emit_f4_stsp16 r22, r23, 3, 4
    emit_f4_stsp16 r16, r17, 4, 5
    emit_f4_stsp16 r18, r19, 4, 5
    emit_f4_stsp16 r20, r21, 4, 5
    emit_f4_stsp16 r22, r23, 4, 5
    emit_f4_stsp16 r16, r17, 5, 6
    emit_f4_stsp16 r18, r19, 5, 6
    emit_f4_stsp16 r20, r21, 5, 6
    emit_f4_stsp16 r22, r23, 5, 6
    emit_f4_stsp16 r16, r17, 6, 7
    emit_f4_stsp16 r18, r19, 6, 7
    emit_f4_stsp16 r20, r21, 6, 7
    emit_f4_stsp16 r22, r23, 6, 7
    emit_f4_stsp16 r16, r17, 7, 8
    emit_f4_stsp16 r18, r19, 7, 8
    emit_f4_stsp16 r20, r21, 7, 8
    emit_f4_stsp16 r22, r23, 7, 8
    emit_f4_stsp16 r16, r17, 8, 9
    emit_f4_stsp16 r18, r19, 8, 9
    emit_f4_stsp16 r20, r21, 8, 9
    emit_f4_stsp16 r22, r23, 8, 9
    emit_f4_stsp16 r16, r17, 9, 10
    emit_f4_stsp16 r18, r19, 9, 10
    emit_f4_stsp16 r20, r21, 9, 10
    emit_f4_stsp16 r22, r23, 9, 10
    emit_f4_stsp16 r16, r17, 10, 11
    emit_f4_stsp16 r18, r19, 10, 11
    emit_f4_stsp16 r20, r21, 10, 11
    emit_f4_stsp16 r22, r23, 10, 11
    emit_f4_stsp16 r16, r17, 11, 12
    emit_f4_stsp16 r18, r19, 11, 12
    emit_f4_stsp16 r20, r21, 11, 12
    emit_f4_stsp16 r22, r23, 11, 12
    emit_f4_stsp16 r16, r17, 12, 13
    emit_f4_stsp16 r18, r19, 12, 13
    emit_f4_stsp16 r20, r21, 12, 13
    emit_f4_stsp16 r22, r23, 12, 13
    emit_f4_stsp16 r16, r17, 13, 14
    emit_f4_stsp16 r18, r19, 13, 14
    emit_f4_stsp16 r20, r21, 13, 14
    emit_f4_stsp16 r22, r23, 13, 14
    emit_f4_stsp16 r16, r17, 14, 15
    emit_f4_stsp16 r18, r19, 14, 15
    emit_f4_stsp16 r20, r21, 14, 15
    emit_f4_stsp16 r22, r23, 14, 15
    emit_f4_stsp16 r16, r17, 15, 16
    emit_f4_stsp16 r18, r19, 15, 16
    emit_f4_stsp16 r20, r21, 15, 16
    emit_f4_stsp16 r22, r23, 15, 16
    emit_f4_lsl16 r8, r9
    emit_f4_lsl16 r10, r11
    emit_f4_lsl16 r12, r13
    emit_f4_lsl16 r14, r15
    emit_f4_lsl16 r16, r17
    emit_f4_lsl16 r18, r19
    emit_f4_lsl16 r20, r21
    emit_f4_lsl16 r22, r23
    emit_f4_shift lsr, ror, r8, r9
    emit_f4_shift lsr, ror, r10, r11
    emit_f4_shift lsr, ror, r12, r13
    emit_f4_shift lsr, ror, r14, r15
    emit_f4_shift lsr, ror, r16, r17
    emit_f4_shift lsr, ror, r18, r19
    emit_f4_shift lsr, ror, r20, r21
    emit_f4_shift lsr, ror, r22, r23
    emit_f4_shift asr, ror, r8, r9
    emit_f4_shift asr, ror, r10, r11
    emit_f4_shift asr, ror, r12, r13
    emit_f4_shift asr, ror, r14, r15
    emit_f4_shift asr, ror, r16, r17
    emit_f4_shift asr, ror, r18, r19
    emit_f4_shift asr, ror, r20, r21
    emit_f4_shift asr, ror, r22, r23
    emit_f4_not16 r8, r9
    emit_f4_not16 r10, r11
    emit_f4_not16 r12, r13
    emit_f4_not16 r14, r15
    emit_f4_not16 r16, r17
    emit_f4_not16 r18, r19
    emit_f4_not16 r20, r21
    emit_f4_not16 r22, r23
    emit_f4_tst8 r8
    emit_f4_tst8 r10
    emit_f4_tst8 r12
    emit_f4_tst8 r14
    emit_f4_tst8 r16
    emit_f4_tst8 r18
    emit_f4_tst8 r20
    emit_f4_tst8 r22
    emit_f4_inc16 r8, r9
    emit_f4_inc16 r10, r11
    emit_f4_inc16 r12, r13
    emit_f4_inc16 r14, r15
    emit_f4_inc16 r16, r17
    emit_f4_inc16 r18, r19
    emit_f4_inc16 r20, r21
    emit_f4_inc16 r22, r23
    emit_f4_dec16 r8, r9
    emit_f4_dec16 r10, r11
    emit_f4_dec16 r12, r13
    emit_f4_dec16 r14, r15
    emit_f4_dec16 r16, r17
    emit_f4_dec16 r18, r19
    emit_f4_dec16 r20, r21
    emit_f4_dec16 r22, r23
f4_table_end:
.if (f4_table_end - f4_table) != (2 * 0xB8 * 3)
    .error "f4_table has incorrect size"
.endif

f5_table:
    ; F5: bounded four-word compare and ordinary upper-register-pointer memory table
    emit_f5_cmp r8, r9, r8, r9
    emit_f5_cmp r8, r9, r10, r11
    emit_f5_cmp r8, r9, r12, r13
    emit_f5_cmp r8, r9, r14, r15
    emit_f5_cmp r8, r9, r16, r17
    emit_f5_cmp r8, r9, r18, r19
    emit_f5_cmp r8, r9, r20, r21
    emit_f5_cmp r8, r9, r22, r23
    emit_f5_cmp r10, r11, r8, r9
    emit_f5_cmp r10, r11, r10, r11
    emit_f5_cmp r10, r11, r12, r13
    emit_f5_cmp r10, r11, r14, r15
    emit_f5_cmp r10, r11, r16, r17
    emit_f5_cmp r10, r11, r18, r19
    emit_f5_cmp r10, r11, r20, r21
    emit_f5_cmp r10, r11, r22, r23
    emit_f5_cmp r12, r13, r8, r9
    emit_f5_cmp r12, r13, r10, r11
    emit_f5_cmp r12, r13, r12, r13
    emit_f5_cmp r12, r13, r14, r15
    emit_f5_cmp r12, r13, r16, r17
    emit_f5_cmp r12, r13, r18, r19
    emit_f5_cmp r12, r13, r20, r21
    emit_f5_cmp r12, r13, r22, r23
    emit_f5_cmp r14, r15, r8, r9
    emit_f5_cmp r14, r15, r10, r11
    emit_f5_cmp r14, r15, r12, r13
    emit_f5_cmp r14, r15, r14, r15
    emit_f5_cmp r14, r15, r16, r17
    emit_f5_cmp r14, r15, r18, r19
    emit_f5_cmp r14, r15, r20, r21
    emit_f5_cmp r14, r15, r22, r23
    emit_f5_cmp r16, r17, r8, r9
    emit_f5_cmp r16, r17, r10, r11
    emit_f5_cmp r16, r17, r12, r13
    emit_f5_cmp r16, r17, r14, r15
    emit_f5_cmp r18, r19, r8, r9
    emit_f5_cmp r18, r19, r10, r11
    emit_f5_cmp r18, r19, r12, r13
    emit_f5_cmp r18, r19, r14, r15
    emit_f5_cmp r20, r21, r8, r9
    emit_f5_cmp r20, r21, r10, r11
    emit_f5_cmp r20, r21, r12, r13
    emit_f5_cmp r20, r21, r14, r15
    emit_f5_cmp r22, r23, r8, r9
    emit_f5_cmp r22, r23, r10, r11
    emit_f5_cmp r22, r23, r12, r13
    emit_f5_cmp r22, r23, r14, r15
    emit_f5_ld8u r8, r9, r16
    emit_f5_ld8u r10, r11, r16
    emit_f5_ld8u r12, r13, r16
    emit_f5_ld8u r14, r15, r16
    emit_f5_ld8u r8, r9, r18
    emit_f5_ld8u r10, r11, r18
    emit_f5_ld8u r12, r13, r18
    emit_f5_ld8u r14, r15, r18
    emit_f5_ld8u r8, r9, r20
    emit_f5_ld8u r10, r11, r20
    emit_f5_ld8u r12, r13, r20
    emit_f5_ld8u r14, r15, r20
    emit_f5_ld8u r8, r9, r22
    emit_f5_ld8u r10, r11, r22
    emit_f5_ld8u r12, r13, r22
    emit_f5_ld8u r14, r15, r22
    emit_f5_ld16 r8, r9, r16
    emit_f5_ld16 r10, r11, r16
    emit_f5_ld16 r12, r13, r16
    emit_f5_ld16 r14, r15, r16
    emit_f5_ld16 r8, r9, r18
    emit_f5_ld16 r10, r11, r18
    emit_f5_ld16 r12, r13, r18
    emit_f5_ld16 r14, r15, r18
    emit_f5_ld16 r8, r9, r20
    emit_f5_ld16 r10, r11, r20
    emit_f5_ld16 r12, r13, r20
    emit_f5_ld16 r14, r15, r20
    emit_f5_ld16 r8, r9, r22
    emit_f5_ld16 r10, r11, r22
    emit_f5_ld16 r12, r13, r22
    emit_f5_ld16 r14, r15, r22
    emit_f5_st16 r16, r8, r9
    emit_f5_st16 r16, r10, r11
    emit_f5_st16 r16, r12, r13
    emit_f5_st16 r16, r14, r15
    emit_f5_st16 r18, r8, r9
    emit_f5_st16 r18, r10, r11
    emit_f5_st16 r18, r12, r13
    emit_f5_st16 r18, r14, r15
    emit_f5_st16 r20, r8, r9
    emit_f5_st16 r20, r10, r11
    emit_f5_st16 r20, r12, r13
    emit_f5_st16 r20, r14, r15
    emit_f5_st16 r22, r8, r9
    emit_f5_st16 r22, r10, r11
    emit_f5_st16 r22, r12, r13
    emit_f5_st16 r22, r14, r15
f5_table_end:
.if (f5_table_end - f5_table) != (2 * 0x60 * 4)
    .error "f5_table has incorrect size"
.endif

f6_table:
    ; F6: bounded four-word postincrement-store and unary table
    emit_f6_st8_post r16, r8
    emit_f6_st8_post r16, r10
    emit_f6_st8_post r16, r12
    emit_f6_st8_post r16, r14
    emit_f6_st8_post r16, r16
    emit_f6_st8_post r16, r18
    emit_f6_st8_post r16, r20
    emit_f6_st8_post r16, r22
    emit_f6_st8_post r18, r8
    emit_f6_st8_post r18, r10
    emit_f6_st8_post r18, r12
    emit_f6_st8_post r18, r14
    emit_f6_st8_post r18, r16
    emit_f6_st8_post r18, r18
    emit_f6_st8_post r18, r20
    emit_f6_st8_post r18, r22
    emit_f6_st8_post r20, r8
    emit_f6_st8_post r20, r10
    emit_f6_st8_post r20, r12
    emit_f6_st8_post r20, r14
    emit_f6_st8_post r20, r16
    emit_f6_st8_post r20, r18
    emit_f6_st8_post r20, r20
    emit_f6_st8_post r20, r22
    emit_f6_st8_post r22, r8
    emit_f6_st8_post r22, r10
    emit_f6_st8_post r22, r12
    emit_f6_st8_post r22, r14
    emit_f6_st8_post r22, r16
    emit_f6_st8_post r22, r18
    emit_f6_st8_post r22, r20
    emit_f6_st8_post r22, r22
    emit_f6_bswap16 r8, r9
    emit_f6_bswap16 r10, r11
    emit_f6_bswap16 r12, r13
    emit_f6_bswap16 r14, r15
    emit_f6_bswap16 r16, r17
    emit_f6_bswap16 r18, r19
    emit_f6_bswap16 r20, r21
    emit_f6_bswap16 r22, r23
    emit_f6_tst16 r8, r9
    emit_f6_tst16 r10, r11
    emit_f6_tst16 r12, r13
    emit_f6_tst16 r14, r15
    emit_f6_tst16 r16, r17
    emit_f6_tst16 r18, r19
    emit_f6_tst16 r20, r21
    emit_f6_tst16 r22, r23
    emit_f6_mul8 r16, r17, r16
    emit_f6_mul8 r16, r17, r18
    emit_f6_mul8 r16, r17, r20
    emit_f6_mul8 r16, r17, r22
    emit_f6_mul8 r18, r19, r16
    emit_f6_mul8 r18, r19, r18
    emit_f6_mul8 r18, r19, r20
    emit_f6_mul8 r18, r19, r22
    emit_f6_mul8 r20, r21, r16
    emit_f6_mul8 r20, r21, r18
    emit_f6_mul8 r20, r21, r20
    emit_f6_mul8 r20, r21, r22
    emit_f6_mul8 r22, r23, r16
    emit_f6_mul8 r22, r23, r18
    emit_f6_mul8 r22, r23, r20
    emit_f6_mul8 r22, r23, r22
    emit_f6_sext8 r8, r9
    emit_f6_sext8 r10, r11
    emit_f6_sext8 r12, r13
    emit_f6_sext8 r14, r15
    emit_f6_sext8 r16, r17
    emit_f6_sext8 r18, r19
    emit_f6_sext8 r20, r21
    emit_f6_sext8 r22, r23
    emit_f6_neg16 r8, r9
    emit_f6_neg16 r10, r11
    emit_f6_neg16 r12, r13
    emit_f6_neg16 r14, r15
    emit_f6_neg16 r16, r17
    emit_f6_neg16 r18, r19
    emit_f6_neg16 r20, r21
    emit_f6_neg16 r22, r23
f6_table_end:
.if (f6_table_end - f6_table) != (2 * 0x50 * 4)
    .error "f6_table has incorrect size"
.endif

f7_table:
    ; F7: bounded five-word postincrement, 32-bit, and BOOL table
    emit_f7_ld8u_post r8, r9, r16
    emit_f7_ld8u_post r10, r11, r16
    emit_f7_ld8u_post r12, r13, r16
    emit_f7_ld8u_post r14, r15, r16
    emit_f7_invalid secondary_invalid_b_func
    emit_f7_ld8u_post r18, r19, r16
    emit_f7_ld8u_post r20, r21, r16
    emit_f7_ld8u_post r22, r23, r16
    emit_f7_ld8u_post r8, r9, r18
    emit_f7_ld8u_post r10, r11, r18
    emit_f7_ld8u_post r12, r13, r18
    emit_f7_ld8u_post r14, r15, r18
    emit_f7_ld8u_post r16, r17, r18
    emit_f7_invalid secondary_invalid_b_func
    emit_f7_ld8u_post r20, r21, r18
    emit_f7_ld8u_post r22, r23, r18
    emit_f7_ld8u_post r8, r9, r20
    emit_f7_ld8u_post r10, r11, r20
    emit_f7_ld8u_post r12, r13, r20
    emit_f7_ld8u_post r14, r15, r20
    emit_f7_ld8u_post r16, r17, r20
    emit_f7_ld8u_post r18, r19, r20
    emit_f7_invalid secondary_invalid_b_func
    emit_f7_ld8u_post r22, r23, r20
    emit_f7_ld8u_post r8, r9, r22
    emit_f7_ld8u_post r10, r11, r22
    emit_f7_ld8u_post r12, r13, r22
    emit_f7_ld8u_post r14, r15, r22
    emit_f7_ld8u_post r16, r17, r22
    emit_f7_ld8u_post r18, r19, r22
    emit_f7_ld8u_post r20, r21, r22
    emit_f7_invalid secondary_invalid_b_func
    emit_f7_ld16_post r8, r9, r16
    emit_f7_ld16_post r10, r11, r16
    emit_f7_ld16_post r12, r13, r16
    emit_f7_ld16_post r14, r15, r16
    emit_f7_invalid secondary_invalid_b_func
    emit_f7_ld16_post r18, r19, r16
    emit_f7_ld16_post r20, r21, r16
    emit_f7_ld16_post r22, r23, r16
    emit_f7_ld16_post r8, r9, r18
    emit_f7_ld16_post r10, r11, r18
    emit_f7_ld16_post r12, r13, r18
    emit_f7_ld16_post r14, r15, r18
    emit_f7_ld16_post r16, r17, r18
    emit_f7_invalid secondary_invalid_b_func
    emit_f7_ld16_post r20, r21, r18
    emit_f7_ld16_post r22, r23, r18
    emit_f7_ld16_post r8, r9, r20
    emit_f7_ld16_post r10, r11, r20
    emit_f7_ld16_post r12, r13, r20
    emit_f7_ld16_post r14, r15, r20
    emit_f7_ld16_post r16, r17, r20
    emit_f7_ld16_post r18, r19, r20
    emit_f7_invalid secondary_invalid_b_func
    emit_f7_ld16_post r22, r23, r20
    emit_f7_ld16_post r8, r9, r22
    emit_f7_ld16_post r10, r11, r22
    emit_f7_ld16_post r12, r13, r22
    emit_f7_ld16_post r14, r15, r22
    emit_f7_ld16_post r16, r17, r22
    emit_f7_ld16_post r18, r19, r22
    emit_f7_ld16_post r20, r21, r22
    emit_f7_invalid secondary_invalid_b_func
    emit_f7_st16_post r16, r8, r9
    emit_f7_st16_post r16, r10, r11
    emit_f7_st16_post r16, r12, r13
    emit_f7_st16_post r16, r14, r15
    emit_f7_st16_post r16, r16, r17
    emit_f7_st16_post r16, r18, r19
    emit_f7_st16_post r16, r20, r21
    emit_f7_st16_post r16, r22, r23
    emit_f7_st16_post r18, r8, r9
    emit_f7_st16_post r18, r10, r11
    emit_f7_st16_post r18, r12, r13
    emit_f7_st16_post r18, r14, r15
    emit_f7_st16_post r18, r16, r17
    emit_f7_st16_post r18, r18, r19
    emit_f7_st16_post r18, r20, r21
    emit_f7_st16_post r18, r22, r23
    emit_f7_st16_post r20, r8, r9
    emit_f7_st16_post r20, r10, r11
    emit_f7_st16_post r20, r12, r13
    emit_f7_st16_post r20, r14, r15
    emit_f7_st16_post r20, r16, r17
    emit_f7_st16_post r20, r18, r19
    emit_f7_st16_post r20, r20, r21
    emit_f7_st16_post r20, r22, r23
    emit_f7_st16_post r22, r8, r9
    emit_f7_st16_post r22, r10, r11
    emit_f7_st16_post r22, r12, r13
    emit_f7_st16_post r22, r14, r15
    emit_f7_st16_post r22, r16, r17
    emit_f7_st16_post r22, r18, r19
    emit_f7_st16_post r22, r20, r21
    emit_f7_st16_post r22, r22, r23
    emit_f7_add32 r8, r9, r10, r11, r8, r9, r10, r11
    emit_f7_add32 r8, r9, r10, r11, r12, r13, r14, r15
    emit_f7_add32 r8, r9, r10, r11, r16, r17, r18, r19
    emit_f7_add32 r8, r9, r10, r11, r20, r21, r22, r23
    emit_f7_add32 r12, r13, r14, r15, r8, r9, r10, r11
    emit_f7_add32 r12, r13, r14, r15, r12, r13, r14, r15
    emit_f7_add32 r12, r13, r14, r15, r16, r17, r18, r19
    emit_f7_add32 r12, r13, r14, r15, r20, r21, r22, r23
    emit_f7_add32 r16, r17, r18, r19, r8, r9, r10, r11
    emit_f7_add32 r16, r17, r18, r19, r12, r13, r14, r15
    emit_f7_add32 r16, r17, r18, r19, r16, r17, r18, r19
    emit_f7_add32 r16, r17, r18, r19, r20, r21, r22, r23
    emit_f7_add32 r20, r21, r22, r23, r8, r9, r10, r11
    emit_f7_add32 r20, r21, r22, r23, r12, r13, r14, r15
    emit_f7_add32 r20, r21, r22, r23, r16, r17, r18, r19
    emit_f7_add32 r20, r21, r22, r23, r20, r21, r22, r23
    emit_f7_sub32 r8, r9, r10, r11, r8, r9, r10, r11
    emit_f7_sub32 r8, r9, r10, r11, r12, r13, r14, r15
    emit_f7_sub32 r8, r9, r10, r11, r16, r17, r18, r19
    emit_f7_sub32 r8, r9, r10, r11, r20, r21, r22, r23
    emit_f7_sub32 r12, r13, r14, r15, r8, r9, r10, r11
    emit_f7_sub32 r12, r13, r14, r15, r12, r13, r14, r15
    emit_f7_sub32 r12, r13, r14, r15, r16, r17, r18, r19
    emit_f7_sub32 r12, r13, r14, r15, r20, r21, r22, r23
    emit_f7_sub32 r16, r17, r18, r19, r8, r9, r10, r11
    emit_f7_sub32 r16, r17, r18, r19, r12, r13, r14, r15
    emit_f7_sub32 r16, r17, r18, r19, r16, r17, r18, r19
    emit_f7_sub32 r16, r17, r18, r19, r20, r21, r22, r23
    emit_f7_sub32 r20, r21, r22, r23, r8, r9, r10, r11
    emit_f7_sub32 r20, r21, r22, r23, r12, r13, r14, r15
    emit_f7_sub32 r20, r21, r22, r23, r16, r17, r18, r19
    emit_f7_sub32 r20, r21, r22, r23, r20, r21, r22, r23
    emit_f7_lsr32 r8, r9, r10, r11
    emit_f7_lsr32 r12, r13, r14, r15
    emit_f7_lsr32 r16, r17, r18, r19
    emit_f7_lsr32 r20, r21, r22, r23
    emit_f7_asr32 r8, r9, r10, r11
    emit_f7_asr32 r12, r13, r14, r15
    emit_f7_asr32 r16, r17, r18, r19
    emit_f7_asr32 r20, r21, r22, r23
    emit_f7_bool r8, r9
    emit_f7_bool r10, r11
    emit_f7_bool r12, r13
    emit_f7_bool r14, r15
    emit_f7_bool r16, r17
    emit_f7_bool r18, r19
    emit_f7_bool r20, r21
    emit_f7_bool r22, r23
f7_table_end:
.if (f7_table_end - f7_table) != (2 * 0x90 * 5)
    .error "f7_table has incorrect size"
.endif

; Cluster C serves F7/F8 and the late forwarding/shared-body pages.
cluster_c_start:
cluster_c_tail_17_delay_1:
    nop
cluster_c_tail_17:
    dispatch_reverse

cluster_c_tail_18_delay_2:
    rjmp cluster_c_tail_18
cluster_c_tail_18_delay_1:
    nop
cluster_c_tail:
cmov_tail:
cluster_c_tail_18:
    dispatch
cluster_c_end:
.if (cluster_c_end - cluster_c_start) != 46
    .error "secondary cadence Cluster C must occupy 23 AVR words"
.endif

; F8 contains its exact CSET slots. FA contains immediate body jumps,
; register-count forwarding entries, and destination-specialized shift bodies;
; FE contains forwarding entries and destination-specialized multiplication
; bodies. FB-FD validate secondary < 0x80 in the shared condition gate,
; then use bits 5:0 to select one of the 64 two-word MOVW entries below.
secondary_tables_after_cluster_c:
f8_table:
    ; F8: bounded five-word simple-condition materialization table
    emit_f8_cset r8, r9, SREG_Z, sbic
    emit_f8_cset r10, r11, SREG_Z, sbic
    emit_f8_cset r12, r13, SREG_Z, sbic
    emit_f8_cset r14, r15, SREG_Z, sbic
    emit_f8_cset r16, r17, SREG_Z, sbic
    emit_f8_cset r18, r19, SREG_Z, sbic
    emit_f8_cset r20, r21, SREG_Z, sbic
    emit_f8_cset r22, r23, SREG_Z, sbic
    emit_f8_cset r8, r9, SREG_Z, sbis
    emit_f8_cset r10, r11, SREG_Z, sbis
    emit_f8_cset r12, r13, SREG_Z, sbis
    emit_f8_cset r14, r15, SREG_Z, sbis
    emit_f8_cset r16, r17, SREG_Z, sbis
    emit_f8_cset r18, r19, SREG_Z, sbis
    emit_f8_cset r20, r21, SREG_Z, sbis
    emit_f8_cset r22, r23, SREG_Z, sbis
    emit_f8_cset r8, r9, SREG_C, sbic
    emit_f8_cset r10, r11, SREG_C, sbic
    emit_f8_cset r12, r13, SREG_C, sbic
    emit_f8_cset r14, r15, SREG_C, sbic
    emit_f8_cset r16, r17, SREG_C, sbic
    emit_f8_cset r18, r19, SREG_C, sbic
    emit_f8_cset r20, r21, SREG_C, sbic
    emit_f8_cset r22, r23, SREG_C, sbic
    emit_f8_cset r8, r9, SREG_C, sbis
    emit_f8_cset r10, r11, SREG_C, sbis
    emit_f8_cset r12, r13, SREG_C, sbis
    emit_f8_cset r14, r15, SREG_C, sbis
    emit_f8_cset r16, r17, SREG_C, sbis
    emit_f8_cset r18, r19, SREG_C, sbis
    emit_f8_cset r20, r21, SREG_C, sbis
    emit_f8_cset r22, r23, SREG_C, sbis
    emit_f8_cset r8, r9, SREG_S, sbic
    emit_f8_cset r10, r11, SREG_S, sbic
    emit_f8_cset r12, r13, SREG_S, sbic
    emit_f8_cset r14, r15, SREG_S, sbic
    emit_f8_cset r16, r17, SREG_S, sbic
    emit_f8_cset r18, r19, SREG_S, sbic
    emit_f8_cset r20, r21, SREG_S, sbic
    emit_f8_cset r22, r23, SREG_S, sbic
    emit_f8_cset r8, r9, SREG_S, sbis
    emit_f8_cset r10, r11, SREG_S, sbis
    emit_f8_cset r12, r13, SREG_S, sbis
    emit_f8_cset r14, r15, SREG_S, sbis
    emit_f8_cset r16, r17, SREG_S, sbis
    emit_f8_cset r18, r19, SREG_S, sbis
    emit_f8_cset r20, r21, SREG_S, sbis
    emit_f8_cset r22, r23, SREG_S, sbis
f8_table_end:
.if (f8_table_end - f8_table) != (2 * 0x30 * 5)
    .error "f8_table has incorrect size"
.endif

; FA contains a thirteen-entry immediate body-jump table, 48 two-word
; register-count forwarding entries, and twelve destination-specialized shared
; shift bodies. Register entries copy low4(count) to native r26 before the
; destination can be overwritten, so rD == rCount remains valid. Immediate
; forms place the encoded count in r26 before entering the same bodies.

.macro emit_fa_shift_forward countl, target
.Lfa_forward_start_\@:
    mov   r26, \countl
    rjmp  \target
.Lfa_forward_end_\@:
    .if (.Lfa_forward_end_\@ - .Lfa_forward_start_\@) != 4
        .error "FA shift forwarding entry is not exactly two AVR words"
    .endif
.endm

.macro emit_fa_shl_body label, dstl, dsth
\label:
    andi  r26, 15
    sbrs  r26, 3
    rjmp  .Lfa_shl_no8_\@
    mov   \dsth, \dstl
    clr   \dstl
    andi  r26, 7
.Lfa_shl_no8_\@:
    breq  .Lfa_shl_done_\@
.Lfa_shl_loop_\@:
    lsl   \dstl
    rol   \dsth
    dec   r26
    brne  .Lfa_shl_loop_\@
.Lfa_shl_done_\@:
    rjmp  cluster_c_tail_18
.Lfa_shl_end_\@:
    .if (.Lfa_shl_end_\@ - \label) != 24
        .error "FA SHL16V shared body is not exactly twelve AVR words"
    .endif
.endm

.macro emit_fa_lsr_body label, dstl, dsth
\label:
    andi  r26, 15
    sbrs  r26, 3
    rjmp  .Lfa_lsr_no8_\@
    mov   \dstl, \dsth
    clr   \dsth
    andi  r26, 7
.Lfa_lsr_no8_\@:
    breq  .Lfa_lsr_done_\@
.Lfa_lsr_loop_\@:
    lsr   \dsth
    ror   \dstl
    dec   r26
    brne  .Lfa_lsr_loop_\@
.Lfa_lsr_done_\@:
    rjmp  cluster_c_tail_18
.Lfa_lsr_end_\@:
    .if (.Lfa_lsr_end_\@ - \label) != 24
        .error "FA LSR16V shared body is not exactly twelve AVR words"
    .endif
.endm

.macro emit_fa_asr_body label, dstl, dsth
\label:
    andi  r26, 15
    sbrs  r26, 3
    rjmp  .Lfa_asr_no8_\@
    mov   \dstl, \dsth
    lsl   \dsth
    sbc   \dsth, \dsth
    andi  r26, 7
.Lfa_asr_no8_\@:
    breq  .Lfa_asr_done_\@
.Lfa_asr_loop_\@:
    asr   \dsth
    ror   \dstl
    dec   r26
    brne  .Lfa_asr_loop_\@
.Lfa_asr_done_\@:
    rjmp  cluster_c_tail_18
.Lfa_asr_end_\@:
    .if (.Lfa_asr_end_\@ - \label) != 26
        .error "FA ASR16V shared body is not exactly thirteen AVR words"
    .endif
.endm

fa_immediate_jump_table:
    rjmp  fa_shl_r4
    rjmp  fa_shl_r5
    rjmp  fa_shl_r6
    rjmp  fa_shl_r7
    rjmp  fa_lsr_r4
    rjmp  fa_lsr_r5
    rjmp  fa_lsr_r6
    rjmp  fa_lsr_r7
    rjmp  fa_asr_r4
    rjmp  fa_asr_r5
    rjmp  fa_asr_r6
    rjmp  fa_asr_r7
fa_immediate_invalid:
    rjmp  fa_immediate_invalid
fa_immediate_jump_table_end:
.if (fa_immediate_jump_table_end - fa_immediate_jump_table) != (13 * 2)
    .error "FA immediate jump table must occupy exactly thirteen AVR words"
.endif

fa_forward_table:
    emit_fa_shift_forward r16, fa_shl_r4
    emit_fa_shift_forward r18, fa_shl_r4
    emit_fa_shift_forward r20, fa_shl_r4
    emit_fa_shift_forward r22, fa_shl_r4
    emit_fa_shift_forward r16, fa_shl_r5
    emit_fa_shift_forward r18, fa_shl_r5
    emit_fa_shift_forward r20, fa_shl_r5
    emit_fa_shift_forward r22, fa_shl_r5
    emit_fa_shift_forward r16, fa_shl_r6
    emit_fa_shift_forward r18, fa_shl_r6
    emit_fa_shift_forward r20, fa_shl_r6
    emit_fa_shift_forward r22, fa_shl_r6
    emit_fa_shift_forward r16, fa_shl_r7
    emit_fa_shift_forward r18, fa_shl_r7
    emit_fa_shift_forward r20, fa_shl_r7
    emit_fa_shift_forward r22, fa_shl_r7
    emit_fa_shift_forward r16, fa_lsr_r4
    emit_fa_shift_forward r18, fa_lsr_r4
    emit_fa_shift_forward r20, fa_lsr_r4
    emit_fa_shift_forward r22, fa_lsr_r4
    emit_fa_shift_forward r16, fa_lsr_r5
    emit_fa_shift_forward r18, fa_lsr_r5
    emit_fa_shift_forward r20, fa_lsr_r5
    emit_fa_shift_forward r22, fa_lsr_r5
    emit_fa_shift_forward r16, fa_lsr_r6
    emit_fa_shift_forward r18, fa_lsr_r6
    emit_fa_shift_forward r20, fa_lsr_r6
    emit_fa_shift_forward r22, fa_lsr_r6
    emit_fa_shift_forward r16, fa_lsr_r7
    emit_fa_shift_forward r18, fa_lsr_r7
    emit_fa_shift_forward r20, fa_lsr_r7
    emit_fa_shift_forward r22, fa_lsr_r7
    emit_fa_shift_forward r16, fa_asr_r4
    emit_fa_shift_forward r18, fa_asr_r4
    emit_fa_shift_forward r20, fa_asr_r4
    emit_fa_shift_forward r22, fa_asr_r4
    emit_fa_shift_forward r16, fa_asr_r5
    emit_fa_shift_forward r18, fa_asr_r5
    emit_fa_shift_forward r20, fa_asr_r5
    emit_fa_shift_forward r22, fa_asr_r5
    emit_fa_shift_forward r16, fa_asr_r6
    emit_fa_shift_forward r18, fa_asr_r6
    emit_fa_shift_forward r20, fa_asr_r6
    emit_fa_shift_forward r22, fa_asr_r6
    emit_fa_shift_forward r16, fa_asr_r7
    emit_fa_shift_forward r18, fa_asr_r7
    emit_fa_shift_forward r20, fa_asr_r7
    emit_fa_shift_forward r22, fa_asr_r7
fa_forward_table_end:
.if (fa_forward_table_end - fa_forward_table) != (2 * 0x30 * 2)
    .error "fa_forward_table has incorrect size"
.endif

; The shift-by-eight path reduces counts 8-15 to a byte transfer followed by
; at most seven single-bit iterations. Counts 0-7 use only the loop.
emit_fa_shl_body fa_shl_r4, r16, r17
emit_fa_shl_body fa_shl_r5, r18, r19
emit_fa_shl_body fa_shl_r6, r20, r21
emit_fa_shl_body fa_shl_r7, r22, r23
emit_fa_lsr_body fa_lsr_r4, r16, r17
emit_fa_lsr_body fa_lsr_r5, r18, r19
emit_fa_lsr_body fa_lsr_r6, r20, r21
emit_fa_lsr_body fa_lsr_r7, r22, r23
emit_fa_asr_body fa_asr_r4, r16, r17
emit_fa_asr_body fa_asr_r5, r18, r19
emit_fa_asr_body fa_asr_r6, r20, r21
emit_fa_asr_body fa_asr_r7, r22, r23

fa_shift_bodies_end:
.if (fa_shift_bodies_end - fa_forward_table_end) != ((8 * 12 + 4 * 13) * 2)
    .error "FA shared shift bodies must occupy exactly 296 bytes"
.endif

cmov_table:
    emit_cmov_entry r8, r8
    emit_cmov_entry r8, r10
    emit_cmov_entry r8, r12
    emit_cmov_entry r8, r14
    emit_cmov_entry r8, r16
    emit_cmov_entry r8, r18
    emit_cmov_entry r8, r20
    emit_cmov_entry r8, r22
    emit_cmov_entry r10, r8
    emit_cmov_entry r10, r10
    emit_cmov_entry r10, r12
    emit_cmov_entry r10, r14
    emit_cmov_entry r10, r16
    emit_cmov_entry r10, r18
    emit_cmov_entry r10, r20
    emit_cmov_entry r10, r22
    emit_cmov_entry r12, r8
    emit_cmov_entry r12, r10
    emit_cmov_entry r12, r12
    emit_cmov_entry r12, r14
    emit_cmov_entry r12, r16
    emit_cmov_entry r12, r18
    emit_cmov_entry r12, r20
    emit_cmov_entry r12, r22
    emit_cmov_entry r14, r8
    emit_cmov_entry r14, r10
    emit_cmov_entry r14, r12
    emit_cmov_entry r14, r14
    emit_cmov_entry r14, r16
    emit_cmov_entry r14, r18
    emit_cmov_entry r14, r20
    emit_cmov_entry r14, r22
    emit_cmov_entry r16, r8
    emit_cmov_entry r16, r10
    emit_cmov_entry r16, r12
    emit_cmov_entry r16, r14
    emit_cmov_entry r16, r16
    emit_cmov_entry r16, r18
    emit_cmov_entry r16, r20
    emit_cmov_entry r16, r22
    emit_cmov_entry r18, r8
    emit_cmov_entry r18, r10
    emit_cmov_entry r18, r12
    emit_cmov_entry r18, r14
    emit_cmov_entry r18, r16
    emit_cmov_entry r18, r18
    emit_cmov_entry r18, r20
    emit_cmov_entry r18, r22
    emit_cmov_entry r20, r8
    emit_cmov_entry r20, r10
    emit_cmov_entry r20, r12
    emit_cmov_entry r20, r14
    emit_cmov_entry r20, r16
    emit_cmov_entry r20, r18
    emit_cmov_entry r20, r20
    emit_cmov_entry r20, r22
    emit_cmov_entry r22, r8
    emit_cmov_entry r22, r10
    emit_cmov_entry r22, r12
    emit_cmov_entry r22, r14
    emit_cmov_entry r22, r16
    emit_cmov_entry r22, r18
    emit_cmov_entry r22, r20
    emit_cmov_entry r22, r22
cmov_table_end:
.if (cmov_table_end - cmov_table) != (2 * 0x40 * 2)
    .error "cmov_table has incorrect size"
.endif

; FE contains a 64-entry two-word forwarding table followed by eight
; destination-specialized MUL16 bodies. Each forwarding entry preserves the
; complete source operand in native X before the selected body captures and
; overwrites the architectural destination. This makes every source/destination
; alias legal, including MUL16 rD,rD.

.macro emit_fe_mul16_forward src, target
.Lfe_forward_start_\@:
    movw  r26, \src
    rjmp  \target
.Lfe_forward_end_\@:
    .if (.Lfe_forward_end_\@ - .Lfe_forward_start_\@) != 4
        .error "FE MUL16 forwarding entry is not exactly two AVR words"
    .endif
.endm

.macro emit_fe_mul16_body label, dstl, dsth
\label:
    movw  r30, \dstl       ; preserve original destination aL:aH

    mul   r30, r26          ; aL * bL
    movw  \dstl, r0       ; low product supplies result bits 15:0

    mul   r31, r26          ; aH * bL
    add   \dsth, r0       ; add its low byte into result high byte

    mul   r30, r27          ; aL * bH
    add   \dsth, r0       ; add its low byte into result high byte

    rjmp  cluster_c_tail_18
.Lfe_body_end_\@:
    .if (.Lfe_body_end_\@ - \label) != 16
        .error "FE MUL16 shared body is not exactly eight AVR words"
    .endif
.endm

fe_forward_table:
    emit_fe_mul16_forward r8, fe_mul16_r0
    emit_fe_mul16_forward r10, fe_mul16_r0
    emit_fe_mul16_forward r12, fe_mul16_r0
    emit_fe_mul16_forward r14, fe_mul16_r0
    emit_fe_mul16_forward r16, fe_mul16_r0
    emit_fe_mul16_forward r18, fe_mul16_r0
    emit_fe_mul16_forward r20, fe_mul16_r0
    emit_fe_mul16_forward r22, fe_mul16_r0
    emit_fe_mul16_forward r8, fe_mul16_r1
    emit_fe_mul16_forward r10, fe_mul16_r1
    emit_fe_mul16_forward r12, fe_mul16_r1
    emit_fe_mul16_forward r14, fe_mul16_r1
    emit_fe_mul16_forward r16, fe_mul16_r1
    emit_fe_mul16_forward r18, fe_mul16_r1
    emit_fe_mul16_forward r20, fe_mul16_r1
    emit_fe_mul16_forward r22, fe_mul16_r1
    emit_fe_mul16_forward r8, fe_mul16_r2
    emit_fe_mul16_forward r10, fe_mul16_r2
    emit_fe_mul16_forward r12, fe_mul16_r2
    emit_fe_mul16_forward r14, fe_mul16_r2
    emit_fe_mul16_forward r16, fe_mul16_r2
    emit_fe_mul16_forward r18, fe_mul16_r2
    emit_fe_mul16_forward r20, fe_mul16_r2
    emit_fe_mul16_forward r22, fe_mul16_r2
    emit_fe_mul16_forward r8, fe_mul16_r3
    emit_fe_mul16_forward r10, fe_mul16_r3
    emit_fe_mul16_forward r12, fe_mul16_r3
    emit_fe_mul16_forward r14, fe_mul16_r3
    emit_fe_mul16_forward r16, fe_mul16_r3
    emit_fe_mul16_forward r18, fe_mul16_r3
    emit_fe_mul16_forward r20, fe_mul16_r3
    emit_fe_mul16_forward r22, fe_mul16_r3
    emit_fe_mul16_forward r8, fe_mul16_r4
    emit_fe_mul16_forward r10, fe_mul16_r4
    emit_fe_mul16_forward r12, fe_mul16_r4
    emit_fe_mul16_forward r14, fe_mul16_r4
    emit_fe_mul16_forward r16, fe_mul16_r4
    emit_fe_mul16_forward r18, fe_mul16_r4
    emit_fe_mul16_forward r20, fe_mul16_r4
    emit_fe_mul16_forward r22, fe_mul16_r4
    emit_fe_mul16_forward r8, fe_mul16_r5
    emit_fe_mul16_forward r10, fe_mul16_r5
    emit_fe_mul16_forward r12, fe_mul16_r5
    emit_fe_mul16_forward r14, fe_mul16_r5
    emit_fe_mul16_forward r16, fe_mul16_r5
    emit_fe_mul16_forward r18, fe_mul16_r5
    emit_fe_mul16_forward r20, fe_mul16_r5
    emit_fe_mul16_forward r22, fe_mul16_r5
    emit_fe_mul16_forward r8, fe_mul16_r6
    emit_fe_mul16_forward r10, fe_mul16_r6
    emit_fe_mul16_forward r12, fe_mul16_r6
    emit_fe_mul16_forward r14, fe_mul16_r6
    emit_fe_mul16_forward r16, fe_mul16_r6
    emit_fe_mul16_forward r18, fe_mul16_r6
    emit_fe_mul16_forward r20, fe_mul16_r6
    emit_fe_mul16_forward r22, fe_mul16_r6
    emit_fe_mul16_forward r8, fe_mul16_r7
    emit_fe_mul16_forward r10, fe_mul16_r7
    emit_fe_mul16_forward r12, fe_mul16_r7
    emit_fe_mul16_forward r14, fe_mul16_r7
    emit_fe_mul16_forward r16, fe_mul16_r7
    emit_fe_mul16_forward r18, fe_mul16_r7
    emit_fe_mul16_forward r20, fe_mul16_r7
    emit_fe_mul16_forward r22, fe_mul16_r7
fe_forward_table_end:
.if (fe_forward_table_end - fe_forward_table) != (2 * 0x40 * 2)
    .error "fe_forward_table has incorrect size"
.endif

; Each body is eight words and twelve native cycles including its final RJMP.
; The omitted aH*bH term contributes only above result bit 15.
emit_fe_mul16_body fe_mul16_r0, r8, r9
emit_fe_mul16_body fe_mul16_r1, r10, r11
emit_fe_mul16_body fe_mul16_r2, r12, r13
emit_fe_mul16_body fe_mul16_r3, r14, r15
emit_fe_mul16_body fe_mul16_r4, r16, r17
emit_fe_mul16_body fe_mul16_r5, r18, r19
emit_fe_mul16_body fe_mul16_r6, r20, r21
emit_fe_mul16_body fe_mul16_r7, r22, r23

fe_mul16_bodies_end:
.if (fe_mul16_bodies_end - fe_forward_table_end) != (8 * 8 * 2)
    .error "FE MUL16 shared bodies must occupy exactly 128 bytes"
.endif

; The active secondary executable tables must occupy exactly 7,302 bytes.
.if ((f0_veneer_table_end - f0_veneer_table) + (f1_table_end - f1_table) + (f2_table_end - f2_table) + (f3_table_end - f3_table) + (f4_table_end - f4_table) + (f5_table_end - f5_table) + (f6_table_end - f6_table) + (f7_table_end - f7_table) + (f8_table_end - f8_table) + (fa_immediate_jump_table_end - fa_immediate_jump_table) + (fa_forward_table_end - fa_forward_table) + (cmov_table_end - cmov_table) + (fe_forward_table_end - fe_forward_table)) != 7302
    .error "secondary executable tables must occupy exactly 7302 bytes"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; External-flash bytecode stream positioning
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Seek to the current 24-bit image-relative VM PC and prime one byte. The
; physical W25Q128 address is (data_page_data << 8) + VM_PC, modulo 24 bits.
fx_seek_to_pc:
    fx_disable
    ldi  r30, SFC_READ
    fx_enable
    out  SPDR, r30

    lds  r26, data_page_data+0
    add  r26, VM_PCM
    lds  r27, data_page_data+1
    adc  r27, VM_PCH

    rcall fx_seek_delay_10
    out  SPDR, r27
    rcall fx_seek_delay_17
    out  SPDR, r26
    rcall fx_seek_delay_17
    out  SPDR, VM_PCL
    rcall fx_seek_delay_17
    out  SPDR, ZERO

    ; Wait 16 cycles: 2 + 10 + 4 from RET. The addressed byte is ready in
    ; SPDR when this routine returns.
    delay_2
    rcall fx_seek_delay_10
    ret

; Fixed delay ladder. Each name denotes total cycles from the calling RCALL
; through the returning RET, matching the cadence used by the SPI pipeline.
; Entries 7 and 9-14 cover the operand-fetch slack used below without
; repeated inline delay sequences. No current path requires an 8-cycle call.
fx_seek_delay_17:
    nop
fx_seek_delay_16:
    delay_2
fx_seek_delay_14:
    nop
fx_seek_delay_13:
    nop
fx_seek_delay_12:
    nop
fx_seek_delay_11:
    nop
fx_seek_delay_10:
    nop
fx_seek_delay_9:
    delay_2
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

    ; Establish the immutable interpreter constants before any helper runs.
    clr  ZERO
    ldi  r26, 1
    mov  ONE, r26
    ldi  r26, 4
    mov  FOUR, r26

    ; Application static storage is initialized by copying the complete data
    ; image below. There is no separate .bss region or SRAM-clear pass. Clear
    ; only interpreter-private state that is not supplied by the image.
    sts  data_startup_flags, ZERO
    sts  data_millis+0, ZERO
    sts  data_millis+1, ZERO
    sts  data_millis+2, ZERO
    sts  data_millis+3, ZERO

    ; Initialize persistent architectural state. VM_FLAGS lives in low-I/O
    ; GPIOR0; VM PC is loaded from the image header below.
    ldi  VM_SPL, lo8(VM_SP_INITIAL_VALUE)
    ldi  VM_SPH, hi8(VM_SP_INITIAL_VALUE)
    out  VM_FLAGS, ZERO

    ; Configure the complete Arduboy GPIO set before enabling SPI. This leaves
    ; the OLED selected and held in reset, while keeping the FX flash deselected.
    rcall hardware_init_pins_func

    ; Initialize SPI. Startup uses SPIF polling; the bytecode interpreter uses
    ; the fixed-cadence transfer pipeline after the first opcode is primed.
    ; Mode 0, MSB first, f_CPU/2 matches Arduboy2 bootSPI().
    ldi  r26, (_BV(SPE) | _BV(MSTR))
    out  SPCR, r26
    ldi  r26, _BV(SPI2X)
    out  SPSR, r26

    ; Reset and configure the selected SPI OLED controller. This intentionally
    ; does not write pixel data or clear either display RAM or data_display.
    rcall oled_startup_init_func

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

    ; entryPoint, packed little-endian 24-bit image-relative address.
    rcall fx_startup_read_byte
    mov  VM_PCL, r30
    rcall fx_startup_read_byte
    mov  VM_PCM, r30
    rcall fx_startup_read_byte
    mov  VM_PCH, r30

    ; dataSize at header offset 0x08. This is the complete .saved + .data
    ; image size, including bytes whose initial value is zero. It is also the
    ; number of bytes copied from image offset 0x0100 to SRAM address 0x0100.
    rcall fx_startup_read_byte
    mov  r16, r30
    rcall fx_startup_read_byte
    mov  r17, r30

    ; saveSize at header offset 0x0A, retained for the system ABI.
    rcall fx_startup_read_byte
    mov  r20, r30
    sts  data_save_size+0, r30
    rcall fx_startup_read_byte
    mov  r21, r30
    sts  data_save_size+1, r30
    fx_disable

    ; saveSize <= dataSize because the saved region is part of the data image
    ; copied into SRAM.
    cp   r16, r20
    cpc  r17, r21
    brsh 1f
    rjmp startup_invalid_image
1:

    ; dataSize <= 1024. Values below 0x0400 are accepted; 0x0400 itself is
    ; accepted only when the low byte is zero.
    cpi  r17, 0x04
    brlo 1f
    breq 2f
    rjmp startup_invalid_image
2:
    tst  r16
    breq 1f
    rjmp startup_invalid_image
1:

    ; A nonzero save request requires either a keyed flashcart save page or the
    ; development layout with a final 4 KiB save sector. The preceding checks
    ; already imply saveSize <= 1024.
    cp   r20, ZERO
    cpc  r21, ZERO
    breq 3f
    lds  r26, data_startup_flags
    sbrs r26, STARTUP_SAVE_PAGE_VALID
    rjmp startup_invalid_image
3:

    ; Copy the complete data image, including explicitly stored zero bytes.
    ; No separate .bss clear is performed.
startup_copy_data:
    cp   r16, ZERO
    cpc  r17, ZERO
    breq startup_enter_image

    ; Static initializers always begin at image offset 0x0100, one page after
    ; the header.
    lds  r27, data_page_data+0
    lds  r22, data_page_data+1
    inc  r27
    brne 4f
    inc  r22
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
    ; Timer0 is initialized only after the data image copy. Its compare
    ; interrupt becomes globally active at the SEI below.
    rcall timer0_init_func

    ; VM_PCH:VM_PCM:VM_PCL already contains the image entry point. Seek to
    ; it, consume the first primary opcode, and start the following transfer.
    rcall fx_seek_to_pc
    in   PRIMARY_OPCODE, SPDR
    out  SPDR, ZERO
    sei
    delay_1
    mul  PRIMARY_OPCODE, FOUR
    movw r30, r0
    subi r31, hi8(-(pm(primary_table)))
    ijmp

startup_invalid_image:
    cli
    fx_disable
startup_invalid_image_loop:
    rjmp startup_invalid_image_loop

; Configure Timer0 for a 1 kHz compare-A interrupt at f_CPU = 16 MHz:
;   CTC mode, prescaler 64, OCR0A = 249.
; Global interrupts remain disabled until startup_enter_image executes SEI.
timer0_init_func:
    ; Stop Timer0 and mask its interrupts while replacing any bootloader state.
    out  TCCR0B, ZERO
    sts  TIMSK0, ZERO

    ldi  r26, _BV(WGM01)
    out  TCCR0A, r26
    out  TCNT0, ZERO
    ldi  r26, 249
    out  OCR0A, r26

    ; Clear a stale compare-A flag before unmasking the interrupt.
    ldi  r26, _BV(OCF0A)
    out  TIFR0, r26
    ldi  r26, _BV(OCIE0A)
    sts  TIMSK0, r26

    ; Start Timer0 at f_CPU/64.
    ldi  r26, (_BV(CS01) | _BV(CS00))
    out  TCCR0B, r26
    ret

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Device pin and OLED startup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Establish the same supported-device idle levels used by Arduboy2 bootPins,
; while changing only explicitly configured pins rather than replacing complete
; PORT/DDR registers. The speaker pins remain untouched, as in Arduboy2.
hardware_init_pins_func:
    ; Shared ATmega32U4 hardware SPI bus: SCK and MOSI outputs low, MISO input
    ; without a pull-up. These pins cannot be remapped by a device preset.
    pin_output_low    PORTB, DDRB, PORTB1
    pin_output_low    PORTB, DDRB, PORTB2
    pin_input_floating PORTB, DDRB, PORTB3

    ; Keep the serial flash inactive while the display is reset and configured.
    pin_output_high AVM_FX_PORT, AVM_FX_DDR, AVM_FX_BIT

    ; Arduboy2 starts with OLED CS asserted, D/C high, and reset asserted low.
    pin_output_low  AVM_OLED_CS_PORT,  AVM_OLED_CS_DDR,  AVM_OLED_CS_BIT
    pin_output_high AVM_OLED_DC_PORT,  AVM_OLED_DC_DDR,  AVM_OLED_DC_BIT
    pin_output_low  AVM_OLED_RST_PORT, AVM_OLED_RST_DDR, AVM_OLED_RST_BIT

#if AVM_INIT_RGB_LED
    ; Active-low RGB channels off.
    pin_output_high AVM_LED_RED_PORT,   AVM_LED_RED_DDR,   AVM_LED_RED_BIT
    pin_output_high AVM_LED_GREEN_PORT, AVM_LED_GREEN_DDR, AVM_LED_GREEN_BIT
    pin_output_high AVM_LED_BLUE_PORT,  AVM_LED_BLUE_DDR,  AVM_LED_BLUE_BIT
#endif

#if AVM_INIT_TX_RX_LEDS
    ; Active-low USB activity LEDs off.
    pin_output_high AVM_LED_TX_PORT, AVM_LED_TX_DDR, AVM_LED_TX_BIT
    pin_output_high AVM_LED_RX_PORT, AVM_LED_RX_DDR, AVM_LED_RX_BIT
#endif

#if AVM_INIT_BUTTONS
    ; All six buttons are active low and use internal pull-ups.
    pin_input_pullup AVM_BUTTON_LEFT_PORT,  AVM_BUTTON_LEFT_DDR,  AVM_BUTTON_LEFT_BIT
    pin_input_pullup AVM_BUTTON_RIGHT_PORT, AVM_BUTTON_RIGHT_DDR, AVM_BUTTON_RIGHT_BIT
    pin_input_pullup AVM_BUTTON_UP_PORT,    AVM_BUTTON_UP_DDR,    AVM_BUTTON_UP_BIT
    pin_input_pullup AVM_BUTTON_DOWN_PORT,  AVM_BUTTON_DOWN_DDR,  AVM_BUTTON_DOWN_BIT
    pin_input_pullup AVM_BUTTON_A_PORT,     AVM_BUTTON_A_DDR,     AVM_BUTTON_A_BIT
    pin_input_pullup AVM_BUTTON_B_PORT,     AVM_BUTTON_B_DDR,     AVM_BUTTON_B_BIT
#endif

#if AVM_INIT_RANDOM_SEED_ADC
    ; Match Arduboy2's floating ADC1 random-seed input and initial mux choice.
    pin_input_floating AVM_RANDOM_SEED_PORT, AVM_RANDOM_SEED_DDR, AVM_RANDOM_SEED_BIT
    ldi  r26, (_BV(REFS0) | _BV(REFS1) | _BV(MUX0))
    sts  ADMUX, r26
#endif
    ret

; Approximately 5 ms at 16 MHz. Startup timing is intentionally conservative
; and is not part of the bytecode interpreter's cycle contract.
oled_reset_delay_5ms_func:
    ldi  r24, 104
1:
    clr  r25
2:
    dec  r25
    brne 2b
    dec  r24
    brne 1b
    ret

; Blocking SPI transfer used while Z walks the OLED command table.
; Input/output: r26. Clobbers r27; preserves Z.
oled_spi_transfer_blocking_func:
    out  SPDR, r26
1:
    in   r27, SPSR
    sbrs r27, SPIF
    rjmp 1b
    in   r26, SPDR
    ret

; Reset the OLED and send the Arduboy2-derived controller boot sequence.
; No display RAM is written here.
oled_startup_init_func:
    rcall oled_reset_delay_5ms_func
    sbi   AVM_OLED_RST_PORT, AVM_OLED_RST_BIT
    rcall oled_reset_delay_5ms_func

    display_enable
    display_command_mode

    ldi  r30, lo8(oled_boot_program)
    ldi  r31, hi8(oled_boot_program)
    ldi  r24, lo8(oled_boot_program_end - oled_boot_program)
1:
    lpm  r26, Z+
    rcall oled_spi_transfer_blocking_func
    dec  r24
    brne 1b

    ; Leave the shared SPI bus idle and ready for the FX flash transaction.
    display_data_mode
    display_disable
    fx_disable
    ret

; Commands follow Arduboy2's lcdBootProgram for the corresponding SPI display.
oled_boot_program:
#if defined(AVM_DISPLAY_SH1106)
    .byte 0x8D, 0x14                 ; enable charge pump
    .byte 0xA1                       ; segment remap
    .byte 0xC8                       ; COM scan direction
    .byte 0x81, AVM_OLED_CONTRAST    ; contrast
    .byte 0xD9, 0xF1                 ; precharge
    .byte 0x02                       ; SH1106 visible column starts at 2
    .byte 0xAF                       ; display on
#else
    .byte 0xD5, 0xF0                 ; display clock divisor
#  if defined(AVM_DISPLAY_SSD1309)
    .byte 0xE3, 0xE3                 ; SSD1309 has no charge-pump command
#  else
    .byte 0x8D, 0x14                 ; SSD1306 charge pump on
#  endif
    .byte 0xA1                       ; segment remap
    .byte 0xC8                       ; COM scan direction
    .byte 0x81, AVM_OLED_CONTRAST    ; contrast
    .byte 0xD9, 0xF1                 ; precharge
    .byte 0xAF                       ; display on
    .byte 0x20, 0x00                 ; horizontal addressing mode
#endif
oled_boot_program_end:
