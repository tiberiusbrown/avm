;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Interpreter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; avr-libc/libm-derived floating-point snippets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; The BSD-licensed notice below applies to the portions of this file derived
; from avr-libc/libm. It is included here because those routines are embedded
; directly in the interpreter for local optimization and manual relaxation.
;
; Copyright (c) 2002  Michael Stumpf  <mistumpf@de.pepperl-fuchs.com>
; Copyright (c) 2006  Dmitry Xmelkov
; Copyright (c) 2025  Georg-Johann Lay
; All rights reserved.
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
;
; * Redistributions of source code must retain the above copyright
;   notice, this list of conditions and the following disclaimer.
; * Redistributions in binary form must reproduce the above copyright
;   notice, this list of conditions and the following disclaimer in
;   the documentation and/or other materials provided with the
;   distribution.
; * Neither the name of the copyright holders nor the names of
;   contributors may be used to endorse or promote products derived
;   from this software without specific prior written permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; POSSIBILITY OF SUCH DAMAGE.


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
; inputs. Startup resets and configures the OLED controller, clears the
; framebuffer, and performs one display update so controller RAM starts blank.
; Later framebuffer transfers are performed by SYS display.

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
; AVR r2        normally zero; SPI dummy-transmit byte; direct-FP temporary
; AVR r3        permanent one
; AVR r4:r6     24-bit VM program counter, little-endian
; AVR r7        permanent four; primary-table stride in AVR words
; AVR r8:r23    AVM architectural registers r0-r7
; AVR r24:r27   general interpreter scratch (X is r26:r27)
; AVR r28:r29   AVM stack pointer (Y)
; AVR r30:r31   general scratch and dispatch target (Z)
; GPIOR0        architectural VM_FLAGS
;
; r3 and r7 are initialized once and remain immutable. Direct FMIN/FMAX/FCMP
; and rounding temporarily use r2 for control, but clear it before entering any
; shared interpreter path. Native r0:r1 have no ABI zero-register requirement.

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

; FF table-free decoder scratch allocation. The secondary and trailing
; specifier are consumed in r24. Extended operations are normalized to 0-9 in
; r25, and r26 is used to validate reserved specifier bits.
#define FF_SECONDARY               r24
#define FF_SPEC                    r24
#define FF_OPERATION               r25
#define FF_VALIDATE                r26

; Shared FF/libm bridge ABI. Callers load a helper target into native Z and
; place the encoded operand descriptor in FF_BRIDGE_DESC before jumping to one
; of the typed bridge entries below. GPIOR1 retains the architectural
; destination across helper calls; GPIOR2 carries direct floating-operation
; control while the in-register min/max/compare and rounding cores execute.
#define FF_BRIDGE_DESC             r24
#define FF_BRIDGE_META             r25
#define FF_BRIDGE_INDEX            r26
#define FF_BRIDGE_XH               r27
#define FF_BRIDGE_META_IO          GPIOR1
#define FF_DIRECT_CONTROL_IO       GPIOR2

#define FF_BRIDGE_RESULT_Q32       0x00
#define FF_BRIDGE_RESULT_R16       0x40
#define FF_BRIDGE_RESULT_FCMP      0x80

; Shared F0 operand-fetch ABI. The one-byte helper returns the consumed byte in
; F0_OPERAND_LO. The two-byte helper returns a little-endian operand in
; F0_OPERAND_HI:F0_OPERAND_LO. F0_SPEC aliases the one-byte result for RRSPEC
; and future program-space operand specifiers.
#define F0_OPERAND_LO              r24
#define F0_OPERAND_HI              r25
#define F0_SPEC                    r24
#define F0_DECODE_SCRATCH          r25
; F0 69-6B keep the trailing pre-scaled RRSPEC in native r25. The secondary
; opcode is normalized in r24 to 0=CMP32, 1=LD32, 2=ST32 before this byte is read.
#define F0_COLD32_SPEC             r25
; F0 6C-6D keep dddWaaaP in native r1 after the reverse-order fetch.
; Native r1 has no ABI zero-register requirement in this assembly-only runtime.
#define F0_COLDMEM_SPEC            r1

; ED-EE displaced-memory decoder scratch. The second byte remains in r25 so
; width bit 4 survives the exact offset-byte handoff; the fetched biased
; displacement replaces the no-longer-needed primary/secondary scratch in r24.
#define DISPLACED_SPEC             r25
#define DISPLACED_OFFSET           r24

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
#define SYS_SINF                0x04
#define SYS_COSF                0x05
#define SYS_ATAN2F              0x06
#define SYS_TANF                0x07
#define SYS_EXPF                0x08
#define SYS_LOGF                0x09
#define SYS_LOG2F               0x0A
#define SYS_LOG10F              0x0B
#define SYS_POWF                0x0C
#define SYS_HYPOTF              0x0D
#define SYS_FMODF               0x0E
#define SYS_MEMCPY              0x0F
#define SYS_MEMCPY_P            0x10
#define SYS_MEMSET              0x11
#define SYS_MEMMOVE             0x12
#define SYS_MEMCMP_P            0x13
#define SYS_STRCMP_P            0x14
#define SYS_STRLEN_P            0x15
#define SYS_STRNCPY_P           0x16
#define SYS_STRNCAT_P           0x17
#define SYS_MEMCMP              0x18
#define SYS_STRCMP              0x19
#define SYS_STRLEN              0x1A
#define SYS_STRNCPY             0x1B
#define SYS_STRNCAT             0x1C
#define SYS_DISPLAY             0x1D
#define SYS_DRAW_SPRITE_OVERWRITE   0x1E
#define SYS_DRAW_SPRITE_PLUS_MASK   0x1F
#define SYS_DRAW_SPRITE_SELF_MASKED 0x20
#define SYS_DRAW_SPRITE_ERASE       0x21

#define SPRITE_MODE_OVERWRITE    0
#define SPRITE_MODE_PLUS_MASK    1
#define SPRITE_MODE_SELF_MASKED  2
#define SPRITE_MODE_ERASE        3

#define SPRITE_FLAG_TOP          0
#define SPRITE_FLAG_BOTTOM       1
#define SPRITE_FLAG_RESEEK       2
#define SPRITE_FLAG_PARTIAL      3

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
; 0xEC: source-preserving 16-bit division and remainder
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Encoding: EC oo ddd sss
;   bits 7:6  00=UDIV16, 01=UREM16, 10=SDIV16, 11=SREM16
;   bits 5:3  destination/dividend rD
;   bits 2:0  source/divisor rS
;
; The primary slot forwards to a table-free runtime decoder. The secondary
; byte is already in flight when the slot begins.

primary_EC_divrem16_page:
    rjmp  ec_divrem16_entry
    nop
    nop
    nop
    assert_primary_slot_width primary_EC_divrem16_page

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xED-0xEE: full-register biased-displacement data-space memory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Encoding:
;   ED dddWaaa0 off8    LD8U/LD16 rD,[rA+disp]
;   EE dddWaaa0 off8    ST8/ST16 [rA+disp],rS
;
;   ddd   data register r0-r7
;   W     0=byte, 1=word
;   aaa   address register r0-r7
;   bit 0 reserved and required to be zero
;   disp  = unsigned(off8) - 32, giving -32..+223
;
; The primary opcode remains in r24 on entry to the out-of-line handler. Its
; bit 1 distinguishes ED (load, zero) from EE (store, one), and is copied to
; native SREG.T before r24 is reused. The primary slots advance VM_PC by two
; bytes from the primary opcode to the biased-offset byte and leave the
; high-byte carry update to the common entry.

primary_ED_displaced_load:
    ldi  DISPLACED_SPEC, 2
    add  VM_PCL, DISPLACED_SPEC
    adc  VM_PCM, ZERO
    rjmp displaced_memory_entry
    assert_primary_slot_width primary_ED_displaced_load

primary_EE_displaced_store:
    ldi  DISPLACED_SPEC, 2
    add  VM_PCL, DISPLACED_SPEC
    adc  VM_PCM, ZERO
    rjmp displaced_memory_entry
    assert_primary_slot_width primary_EE_displaced_store

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
; entries. F0 uses one-word veneers; secondaries 00-6D are implemented.
; F0 bound 0x6E, one-word veneer slots.
emit_primary_bounded_page primary_F0_cold_veneer_page, 0x6E, f0_veneer_table, secondary_width_1_stub
; F1 bound 0x90, two-word slots.
emit_primary_bounded_page primary_F1_dense_2word_page, 0x90, f1_table, bounded_width_2_decode
; F2 bound 0x6C, three-word slots.
emit_primary_bounded_page primary_F2_dense_3word_page_a, 0x6C, f2_table, secondary_width_3_stub
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
; 0xFF: table-free floating-point page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; The secondary byte is already in flight. The dedicated decoder consumes it,
; rejects reserved ranges, and fetches the trailing specifier for C0-C9.

primary_FF_floating_page:
    rjmp  ff_decode
    nop
    nop
    nop
    assert_primary_slot_width primary_FF_floating_page

primary_table_end:
.if (primary_table_end - primary_table) != (256 * PRIMARY_STRIDE_BYTES)
    .error "primary dispatch table is not exactly 256 four-word slots"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ED-EE full-register biased-displacement data-space memory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Entry state:
;   * VM_PC names the third-byte biased offset.
;   * The specifier byte is completing in SPDR.
;   * PRIMARY_OPCODE still contains ED or EE; bit 1 selects load/store.
;
; The primary slot reaches this entry on cycle 14 after the OUT that started
; the specifier transfer. The standard IN/OUT handoff consumes the specifier on
; cycle 17 and starts the biased offset byte on cycle 18. While that byte is in
; flight, the handler validates bit 0, captures the original base address,
; decodes the data-register pointer, and applies the constant -32 bias. CLI/OUT
; then lands exactly on cycle 35, seventeen cycles after the offset transfer
; began. The final offset add and memory operation execute while the following
; primary opcode is in flight.
;
; Capturing the base before destination writeback makes every ordinary load
; alias legal, including rD == rA. Stores read the original source only after
; the base is captured, so rS == rA is also legal. Architectural VM_FLAGS are
; preserved.

displaced_memory_start:
displaced_memory_entry:
    adc   VM_PCH, ZERO
    bst   PRIMARY_OPCODE, 1      ; ED=load (0), EE=store (1)
    clr   r27                    ; XH for register-file addressing
    in    DISPLACED_SPEC, SPDR
    out   SPDR, ZERO             ; begin biased-offset transfer

    ; Bit zero is reserved. Reject malformed specifiers before any architectural
    ; destination writeback or data-space memory access.
    sbrc  DISPLACED_SPEC, 0
    rjmp  invalid_secondary_instruction_func

    ; Decode aaa into X and load the complete original base directly into Z.
    ; aaa is already positioned as twice the architectural register index.
    mov   r26, DISPLACED_SPEC
    andi  r26, 0x0e
    subi  r26, -8
    ld    r30, X+
    ld    r31, X

    ; Decode ddd into X. Swapping places ddd in bits 3:1, already pre-scaled
    ; for the native register-file byte address.
    mov   r26, DISPLACED_SPEC
    swap  r26
    andi  r26, 0x0e
    subi  r26, -8

    ; Apply the fixed bias while the offset byte is still transferring. SBIW's
    ; immediate range includes 32, so this costs one word and two cycles.
    sbiw  r30, 32

    cli
    out   SPDR, ZERO             ; exact cycle 35: following-primary transfer
    in    DISPLACED_OFFSET, SPDR
    sei

    ; Complete effectiveAddress = originalBase + unsigned(off8) - 32.
    add   r30, DISPLACED_OFFSET
    adc   r31, ZERO

    ; T was set by the primary opcode and survives all intervening work.
    brts  displaced_memory_store

displaced_memory_load:
    ; Load through Z before touching the dynamically selected destination in X.
    ; Byte loads leave r1 cleared; word loads conditionally replace it.
    ld    r0, Z+
    clr   r1
    sbrc  DISPLACED_SPEC, 4
    ld    r1, Z
    st    X+, r0
    st    X,  r1
    rjmp  cluster_a_tail_18

displaced_memory_store:
    ; Capture the complete original source before writing memory. A byte store
    ; still reads the high byte, allowing one compact shared byte/word body.
    ld    r0, X+
    ld    r1, X
    st    Z+, r0
    sbrc  DISPLACED_SPEC, 4
    st    Z,  r1
    rjmp  cluster_a_tail_18

displaced_memory_end:
.if (displaced_memory_end - displaced_memory_start) != 74
    .error "ED-EE displaced-memory handler must occupy exactly 37 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FF table-free floating-point decoder scaffolding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Entry state:
;   * VM_PC names the FF primary opcode.
;   * The secondary byte is completing in SPDR.
;
; The primary slot reaches ff_decode on cycle 11 after the preceding SPI OUT.
; Five one-cycle instructions fill cycles 11-15, allowing the exact cycle-17
; reverse handoff. That handoff starts either the following primary-opcode
; transfer for a two-byte instruction or the trailing-specifier transfer for
; C0-C9.
;
; FADD, FSUB, FMUL, FDIV, FSQRT, and C0-C7 conversions use the shared
; embedded-libm bridge. FMIN, FMAX, FCMP, and the four integral-rounding
; operations execute in interpreter-native register code. FNEG and FABS modify
; the selected sign byte directly, while FCLASS classifies its binary32 source
; inline. Reserved secondary ranges and malformed operand specifiers enter the
; architectural invalid-secondary trap.

ff_decode:
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO
    clr   r27
    ldi   r30, lo8(ff_binary_helper_targets)
    cli
    out   SPDR, ZERO
    in    FF_SECONDARY, SPDR
    sei

    ; 00-7B are defined two-byte operations. 7C-BF and CA-FF are reserved.
    ; C0-C9 consume one additional operand-specifier byte.
    cpi   FF_SECONDARY, 0x7C
    brlo  ff_defined_short
    cpi   FF_SECONDARY, 0xC0
    brsh  .Lff_check_extended
    rjmp  ff_invalid
.Lff_check_extended:
    cpi   FF_SECONDARY, 0xCA
    brlo  ff_extended
    rjmp  ff_invalid

ff_defined_short:
    ; FADD/FSUB/FMUL/FDIV/FMIN/FMAX occupy 00-5F. The high nibble selects a
    ; compact helper-target entry and the low nibble remains the ddss bridge
    ; descriptor. FNEG/FABS occupy 60-67; bit 2 selects FABS and bits 1:0
    ; select qD. The five unary-helper groups occupy 68-7B in four-opcode
    ; blocks: FSQRT, FTRUNC, FFLOOR, FCEIL, and FROUND.
    cpi   FF_SECONDARY, 0x60
    brlo  ff_binary_arithmetic
    cpi   FF_SECONDARY, 0x68
    brlo  ff_sign_operation
    rjmp  ff_unary_math

ff_sign_operation:

    ; Native register addresses for q0-q3 sign bytes are r11, r15, r19, r23.
    ; r27 was cleared before the reverse SPI handoff, so X addresses the native
    ; register file directly. Load before modifying to keep every qD legal.
    mov   r26, FF_SECONDARY
    andi  r26, 0x03
    lsl   r26
    lsl   r26
    subi  r26, -11
    ld    r25, X

    ; Subtracting 0x80 toggles only the sign bit. FABS instead clears it.
    sbrc  FF_SECONDARY, 2
    rjmp  ff_fabs_apply
    subi  r25, 0x80
    rjmp  ff_store_sign_byte

ff_fabs_apply:
    andi  r25, 0x7F

ff_store_sign_byte:
    st    X, r25

    ; The following opcode was launched at cycle 17 and is legally readable
    ; from cycle 34. FABS reaches the standard tail's IN at cycle 43; FNEG
    ; reaches it at cycle 44. The tail advances VM_PC from the secondary byte
    ; to that following opcode before entering its primary-table slot.
    rjmp  cluster_tail_18

ff_unary_math:
    ; 68-7B consists of five four-opcode groups. Group zero is FSQRT and still
    ; uses the heavy embedded-libm bridge. Groups one through four are the
    ; interpreter-native trunc/floor/ceil/round core; normalize them to modes
    ; 0-3 and retain qD in GPIOR1.
    mov   FF_BRIDGE_INDEX, FF_SECONDARY
    subi  FF_BRIDGE_INDEX, 0x68
    lsr   FF_BRIDGE_INDEX
    lsr   FF_BRIDGE_INDEX
    tst   FF_BRIDGE_INDEX
    brne  .Lff_direct_round_prepare

    ldi   r30, lo8(pm(sqrtf))
    ldi   r31, hi8(pm(sqrtf))
    jmp   ff_bridge_unary_q_to_q

.Lff_direct_round_prepare:
    dec   FF_BRIDGE_INDEX
    out   FF_DIRECT_CONTROL_IO, FF_BRIDGE_INDEX
    mov   FF_BRIDGE_META, FF_SECONDARY
    andi  FF_BRIDGE_META, 0x03
    out   FF_BRIDGE_META_IO, FF_BRIDGE_META
    jmp   ff_direct_round_load_q

ff_binary_arithmetic:
    ; 00-3F use embedded-libm arithmetic helpers. 40-5F are direct FMIN/FMAX:
    ; preserve qD separately, encode ddss plus the max/min selector in GPIOR2,
    ; and load both operands without touching architectural registers.
    mov   FF_BRIDGE_INDEX, FF_SECONDARY
    swap  FF_BRIDGE_INDEX
    andi  FF_BRIDGE_INDEX, 0x07
    cpi   FF_BRIDGE_INDEX, 4
    brsh  .Lff_direct_minmax_prepare

    ; r30 was preloaded during the cadence-filling decoder setup.
    ldi   r31, hi8(ff_binary_helper_targets)
    rcall ff_load_helper_target
    jmp   ff_bridge_binary_q_to_q

.Lff_direct_minmax_prepare:
    mov   FF_BRIDGE_META, FF_SECONDARY
    andi  FF_BRIDGE_META, 0x0F
    sbrc  FF_SECONDARY, 4
    ori   FF_BRIDGE_META, 0x40     ; bit 6: FMAX rather than FMIN
    out   FF_DIRECT_CONTROL_IO, FF_BRIDGE_META

    mov   FF_BRIDGE_META, FF_SECONDARY
    lsr   FF_BRIDGE_META
    lsr   FF_BRIDGE_META
    andi  FF_BRIDGE_META, 0x03
    out   FF_BRIDGE_META_IO, FF_BRIDGE_META
    jmp   ff_direct_load_left_q

ff_extended:
    ; The reverse handoff above started the trailing-specifier transfer on
    ; cycle 17. The range checks reach this path on cycle 28. Advance VM_PC to
    ; the specifier, retain a normalized operation index, and consume the
    ; specifier with the earliest legal standard IN/OUT handoff on cycles
    ; 34/35.
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO
    mov   FF_OPERATION, FF_SECONDARY
    subi  FF_OPERATION, 0xC0
    nop
    in    FF_SPEC, SPDR
    out   SPDR, ZERO

    ; Validate the finalized architectural specifier forms:
    ;   C0-C3, C9 RQSPEC:  0rrr00qq
    ;   C4-C7     QQSPEC:  0000ddss
    ;   C8       RQQSPEC:  0dddllrr
    mov   FF_VALIDATE, FF_SPEC
    cpi   FF_OPERATION, 4
    brlo  .Lff_validate_rqspec
    cpi   FF_OPERATION, 8
    brlo  .Lff_validate_qqspec
    cpi   FF_OPERATION, 9
    brlo  .Lff_validate_rqqspec

    ; C9 uses RQSPEC like C0-C3.
.Lff_validate_rqspec:
    andi  FF_VALIDATE, 0x8C
    rjmp  .Lff_validate_done
.Lff_validate_qqspec:
    andi  FF_VALIDATE, 0xF0
    rjmp  .Lff_validate_done
.Lff_validate_rqqspec:
    andi  FF_VALIDATE, 0x80
.Lff_validate_done:
    brne  ff_invalid

    ; C0-C7 are conversions. The low two operation bits select one of four
    ; libm helpers shared by the 16-bit and 32-bit forms:
    ;   0 __floatsisf, 1 __floatunsisf, 2 __fixsfsi, 3 __fixunssfsi.
    ; C8 uses the interpreter-native compare core. C9 classifies its binary32
    ; source inline without entering the embedded-libm bridge.
    cpi   FF_OPERATION, 8
    breq  ff_compare
    brsh  ff_classify
    mov   FF_BRIDGE_INDEX, FF_OPERATION
    andi  FF_BRIDGE_INDEX, 0x03
    ldi   r30, lo8(ff_conversion_helper_targets)
    ldi   r31, hi8(ff_conversion_helper_targets)
    rcall ff_load_helper_target

    ; C4-C7 use QQSPEC and all marshal qS to A, returning qD.
    cpi   FF_OPERATION, 4
    brsh  .Lff_conversion_q_to_q

    ; C0-C3 use RQSPEC. C0-C1 extend rS into A and return qD; C2-C3
    ; marshal qS into A and retain the low 16 result bits in rD.
    cpi   FF_OPERATION, 2
    brsh  .Lff_conversion_q_to_r16
    sbrc  FF_OPERATION, 0
    jmp   ff_bridge_r16_to_q_u
    jmp   ff_bridge_r16_to_q_s
.Lff_conversion_q_to_r16:
    jmp   ff_bridge_q_to_r16
.Lff_conversion_q_to_q:
    jmp   ff_bridge_q_to_q

ff_invalid:
    rjmp  invalid_secondary_instruction_func

ff_compare:
    ; RQQSPEC is 0dddllrr. Store rD in GPIOR1 and mark direct-control bit 7;
    ; bits 3:0 retain qL:qR for the shared two-operand loader.
    mov   FF_BRIDGE_META, FF_SPEC
    swap  FF_BRIDGE_META
    andi  FF_BRIDGE_META, 0x07
    out   FF_BRIDGE_META_IO, FF_BRIDGE_META

    mov   FF_BRIDGE_META, FF_SPEC
    andi  FF_BRIDGE_META, 0x0F
    ori   FF_BRIDGE_META, 0x80
    out   FF_DIRECT_CONTROL_IO, FF_BRIDGE_META
    jmp   ff_direct_load_left_q

ff_classify:
    ; RQSPEC is 0ddd00ss. Retain rD in ZL, then capture all four source bytes
    ; before writing the result so every rD/qS overlap is well-defined. q0-q3
    ; begin at native register addresses r8, r12, r16, and r20.
    mov   r30, FF_SPEC
    swap  r30
    andi  r30, 0x07

    mov   r26, FF_SPEC
    andi  r26, 0x03
    lsl   r26
    lsl   r26
    subi  r26, -8
    clr   r27
    ld    r0, X+
    ld    r1, X+
    ld    r25, X+
    ld    r26, X

    ; r26 is sign/exponent[7:1], r25 is exponent[0]/fraction[22:16], and
    ; r1:r0 are fraction[15:0]. Reduce the complete fraction to zero/nonzero
    ; in r0, then assemble the eight-bit exponent in r24.
    mov   r24, r25
    andi  r24, 0x7F
    or    r0, r1
    or    r0, r24

    mov   r24, r26
    lsl   r24
    sbrc  r25, 7
    ori   r24, 1
    breq  .Lff_class_exp_zero
    cpi   r24, 0xFF
    breq  .Lff_class_exp_max

    ldi   r25, 8                 ; +normal
    rjmp  .Lff_class_numeric

.Lff_class_exp_zero:
    ldi   r25, 6                 ; +zero
    tst   r0
    breq  .Lff_class_numeric
    inc   r25                    ; +subnormal
    rjmp  .Lff_class_numeric

.Lff_class_exp_max:
    tst   r0
    brne  .Lff_class_nan
    ldi   r25, 9                 ; +infinity
    rjmp  .Lff_class_numeric

.Lff_class_nan:
    ; NaN classes ignore the sign. Fraction bit 22 distinguishes quiet from
    ; signaling NaNs and becomes the one-bit class index directly.
    bst   r25, 6
    clr   r25                    ; signaling NaN index 0
    bld   r25, 0                 ; quiet NaN index 1
    rjmp  .Lff_class_build_mask

.Lff_class_numeric:
    ; Positive numeric classes are indices 6-9. Their corresponding negative
    ; classes are 11-index: +Inf 9 -> -Inf 2 through +zero 6 -> -zero 5.
    sbrs  r26, 7
    rjmp  .Lff_class_build_mask
    neg   r25
    subi  r25, -11

    ; Convert class index 0-9 into the architectural one-hot mask. The loop
    ; executes at most nine shifts and is smaller than a 20-byte mask table.
.Lff_class_build_mask:
    ldi   r24, 1
    clr   r26
    inc   r25
.Lff_class_shift_loop:
    dec   r25
    breq  .Lff_class_store
    lsl   r24
    rol   r26
    rjmp  .Lff_class_shift_loop

.Lff_class_store:
    ; r30 still holds rD. Store only after classification, preserving every
    ; nondestination architectural register even when rD overlaps qS.
    lsl   r30
    subi  r30, -8
    clr   r31
    st    Z+, r24
    st    Z,  r26
    rjmp  cluster_a_tail_18

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EC dedicated runtime-decoded 16-bit division/remainder page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Encoding: EC oo ddd sss
;   oo=00  UDIV16 rD,rS
;   oo=01  UREM16 rD,rS
;   oo=10  SDIV16 rD,rS
;   oo=11  SREM16 rD,rS
;
; rD supplies the dividend and receives the selected result. rS is preserved,
; and rD == rS is legal because both complete operands are captured before
; writeback. Architectural VM_FLAGS are preserved.
;
; Two restoring cores compute quotient and remainder together. Magnitudes
; that fit in eight bits use a dedicated byte core; all others use the word
; core. Both cores perform two quotient-bit iterations per loop branch.
; r24:r25 is the shifting dividend/quotient, r26:r27 is the unsigned divisor
; magnitude, and r0:r1 is the partial remainder. r30 retains the destination
; register-file address; its otherwise-unused high bits carry operation
; metadata:
;
;   bit 7  signed operation
;   bit 6  select remainder rather than quotient
;   bit 5  negate the selected signed result
;
; Division by zero is deterministic: DIV returns 0xFFFF and REM returns the
; original dividend. Signed INT_MIN / -1 returns INT_MIN with remainder zero.
;
; Primary-slot entry occurs on cycle 9 after the secondary-byte OUT. The slot
; RJMP reaches this handler on cycle 11. Clearing XH and ZH fills cycles 14 and
; 15, allowing the speculative following-primary OUT to land exactly on cycle
; 17. The long arithmetic body then finishes through a late standard tail.

ec_divrem16_entry:
    ; Consume the secondary byte in the VM PC and start the speculative
    ; following-primary transfer at the exact reverse-handoff boundary.
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO
    mov   r27, ZERO
    mov   r31, ZERO
    cli
    out   SPDR, ZERO
    in    SECONDARY_OPCODE, SPDR
    sei

    ; Z = native register-file address of destination/dividend rD.
    mov   r30, SECONDARY_OPCODE
    lsr   r30
    lsr   r30
    andi  r30, 0x0e
    subi  r30, -8

    ; X = native register-file address of preserved source/divisor rS.
    mov   r26, SECONDARY_OPCODE
    lsl   r26
    andi  r26, 0x0e
    subi  r26, -8

    ; Capture the original dividend without advancing Z. This permits rD == rS.
    ld    r0, Z
    ldd   r1, Z+1

    ; Preserve oo in the unused high bits of the destination address.
    andi  SECONDARY_OPCODE, 0xc0
    or    r30, SECONDARY_OPCODE

    ; Capture the complete divisor before any destination writeback, then move
    ; both operands into the divider's working allocation.
    ld    r24, X+
    ld    r25, X
    movw  r26, r24
    movw  r24, r0

    ; Define division by zero without entering the 16-iteration loop.
    mov   r31, r26
    or    r31, r27
    breq  .Lec_divrem16_zero

    ; Signed forms convert both inputs to unsigned magnitudes. For quotient,
    ; the correction sign is dividend_sign XOR divisor_sign; for remainder it
    ; is the original dividend sign, matching C/LLVM truncation semantics.
    sbrs  r30, 7
    rjmp  .Lec_divrem16_magnitudes_ready

    mov   r31, r25
    sbrs  r30, 6
    eor   r31, r27
    sbrc  r31, 7
    ori   r30, 0x20

    sbrs  r25, 7
    rjmp  .Lec_divrem16_dividend_positive
    neg   r24
    adc   r25, ZERO
    neg   r25
.Lec_divrem16_dividend_positive:

    sbrs  r27, 7
    rjmp  .Lec_divrem16_magnitudes_ready
    neg   r26
    adc   r27, ZERO
    neg   r27

.Lec_divrem16_magnitudes_ready:
    clr   r0
    clr   r1

    ; Magnitudes with zero high bytes use the dedicated eight-bit core. The
    ; true 16-bit path pays only this three-cycle not-taken test.
    mov   r31, r25
    or    r31, r27
    breq  .Lec_divrem16_8bit

    ; Eight groups perform the sixteen word-wide quotient-bit iterations.
    ldi   r31, 8

.Lec_divrem16_loop16:
    ; First quotient bit in this group.
    lsl   r24
    rol   r25
    rol   r0
    rol   r1
    cp    r0, r26
    cpc   r1, r27
    brlo  .Lec_divrem16_no_subtract16_a
    sub   r0, r26
    sbc   r1, r27
    ori   r24, 1
.Lec_divrem16_no_subtract16_a:

    ; Second quotient bit in this group.
    lsl   r24
    rol   r25
    rol   r0
    rol   r1
    cp    r0, r26
    cpc   r1, r27
    brlo  .Lec_divrem16_no_subtract16_b
    sub   r0, r26
    sbc   r1, r27
    ori   r24, 1
.Lec_divrem16_no_subtract16_b:
    dec   r31
    brne  .Lec_divrem16_loop16

.Lec_divrem16_select_result:
    ; Select quotient or remainder in constant time.
    sbrc  r30, 6
    movw  r24, r0

    ; Correct the sign of the selected signed result when required.
    sbrs  r30, 5
    rjmp  .Lec_divrem16_store
    neg   r24
    adc   r25, ZERO
    neg   r25
    rjmp  .Lec_divrem16_store

.Lec_divrem16_zero:
    ; r24:r25 still contains the original dividend. REM keeps it; DIV returns
    ; all ones for both signed and unsigned forms.
    sbrc  r30, 6
    rjmp  .Lec_divrem16_store
    ser   r24
    ser   r25

.Lec_divrem16_store:
    andi  r30, 0x1f
    mov   r31, ZERO
    st    Z+, r24
    st    Z,  r25
    rjmp  cluster_a_tail_18

    ; Out-of-line byte-magnitude path. Four groups perform eight quotient-bit
    ; iterations. r25, r27, and r1 remain zero, so common 16-bit result
    ; selection and signed correction can be reused unchanged.
.Lec_divrem16_8bit:
    ldi   r31, 4

.Lec_divrem16_loop8:
    ; First quotient bit in this group.
    lsl   r24
    rol   r0
    cp    r0, r26
    brlo  .Lec_divrem16_no_subtract8_a
    sub   r0, r26
    ori   r24, 1
.Lec_divrem16_no_subtract8_a:

    ; Second quotient bit in this group.
    lsl   r24
    rol   r0
    cp    r0, r26
    brlo  .Lec_divrem16_no_subtract8_b
    sub   r0, r26
    ori   r24, 1
.Lec_divrem16_no_subtract8_b:
    dec   r31
    brne  .Lec_divrem16_loop8
    rjmp  .Lec_divrem16_select_result

ec_divrem16_end:
.if (ec_divrem16_end - ec_divrem16_entry) != 214
    .error "EC 16-bit division/remainder handler must occupy exactly 107 AVR words"
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
; All defined non-prefix primary opcodes 00-EC and EF are complete. The generic
; bounded-page decoder, secondary cadence clusters, and every specified
; executable secondary table are present. The fixed-width self-contained F1-F8
; pages, the dedicated EC division and F9 runtime bitwise decoders, the FA immediate/variable
; shift page, the FB-FD shared conditional-move gate/table, and the FE MUL16
; page are implemented. FF now has secondary/specifier fetch and validation
; scaffolding; its defined operations still enter the development trap. F0 has shared operand-fetch/register-decode
; infrastructure and all valid secondaries 00-6D are implemented, including
; program-space loads, cold 32-bit forms, and general-pointer data-space forms.

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
.if (SYS_SINF != 0x04) || (SYS_COSF != 0x05) || (SYS_ATAN2F != 0x06) || \
    (SYS_TANF != 0x07) || (SYS_EXPF != 0x08) || (SYS_LOGF != 0x09) || \
    (SYS_LOG2F != 0x0A) || (SYS_LOG10F != 0x0B) || (SYS_POWF != 0x0C) || \
    (SYS_HYPOTF != 0x0D) || (SYS_FMODF != 0x0E)
    .error "libm SYS services must occupy contiguous entries 0x04-0x0E"
.endif
.if (SYS_MEMCPY != 0x0F) || (SYS_MEMCPY_P != 0x10) || \
    (SYS_MEMSET != 0x11) || (SYS_MEMMOVE != 0x12) || \
    (SYS_MEMCMP_P != 0x13) || (SYS_STRCMP_P != 0x14) || \
    (SYS_STRLEN_P != 0x15) || (SYS_STRNCPY_P != 0x16) || \
    (SYS_STRNCAT_P != 0x17) || (SYS_MEMCMP != 0x18) || \
    (SYS_STRCMP != 0x19) || (SYS_STRLEN != 0x1A) || \
    (SYS_STRNCPY != 0x1B) || (SYS_STRNCAT != 0x1C)
    .error "memory SYS services must occupy contiguous entries 0x0F-0x1C"
.endif
.if (SYS_DISPLAY != 0x1D)
    .error "SYS_DISPLAY must occupy dispatch-table entry 0x1D"
.endif
.if (SYS_DRAW_SPRITE_OVERWRITE != 0x1E) || \
    (SYS_DRAW_SPRITE_PLUS_MASK != 0x1F) || \
    (SYS_DRAW_SPRITE_SELF_MASKED != 0x20) || \
    (SYS_DRAW_SPRITE_ERASE != 0x21)
    .error "sprite SYS services must occupy contiguous entries 0x1E-0x21"
.endif

; One AVR word per service number. The service byte therefore indexes this
; table directly in program-memory word-address space.
sys_dispatch_table:
    sys_entries 1,   sys_debug_putc_func
    sys_entries 1,   sys_debug_break_func
    sys_entries 1,   sys_millis_func
    sys_entries 1,   sys_millis32_func
    sys_entries 11,  sys_libm_func
    sys_entries 1,   sys_memcpy_func
    sys_entries 1,   sys_memcpy_p_func
    sys_entries 1,   sys_memset_func
    sys_entries 1,   sys_memmove_func
    sys_entries 1,   sys_memcmp_p_impl
    sys_entries 1,   sys_strcmp_p_impl
    sys_entries 1,   sys_strlen_p_impl
    sys_entries 1,   sys_strncpy_p_impl
    sys_entries 1,   sys_strncat_p_impl
    sys_entries 1,   sys_memcmp_impl
    sys_entries 1,   sys_strcmp_impl
    sys_entries 1,   sys_strlen_impl
    sys_entries 1,   sys_strncpy_impl
    sys_entries 1,   sys_strncat_impl
    sys_entries 1,   sys_display_impl
    sys_entries 4,   sys_draw_sprite_func
    sys_entries 222, invalid_syscall_func
sys_dispatch_table_end:

.if (sys_dispatch_table_end - sys_dispatch_table) != (256 * 2)
    .error "SYS dispatch table must contain exactly 256 one-word entries"
.endif

; Keep the one-word SYS table within RJMP reach while placing the larger memory
; implementations after the existing interpreter body. Absolute veneers limit
; movement of the carefully range-constrained code below to eight AVR words.
sys_memcpy_func:
    jmp   sys_memcpy_impl
sys_memcpy_p_func:
    jmp   sys_memcpy_p_impl
sys_memset_func:
    jmp   sys_memset_impl
sys_memmove_func:
    jmp   sys_memmove_impl

; The four contiguous sprite service IDs normalize directly to mode 0-3. A
; single four-word absolute veneer keeps movement of the range-constrained code
; below within the existing eight-word placement allowance.
sys_draw_sprite_func:
    subi  PRIMARY_OPCODE, SYS_DRAW_SPRITE_OVERWRITE
    mov   r27, PRIMARY_OPCODE
    jmp   sys_draw_sprite_header_impl

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

; Shared avr-libc/libm SYS ABI:
;   unary argument / result: q2 (native r16-r19)
;   binary second argument:  q3 (native r20-r23)
;
; Every listed service uses the same bridge. Unary routines simply ignore the
; B argument copied from q3. The standard AVR ABI preserves native r2-r17 and
; Y. q2 is replaced by the result, while the bridge explicitly preserves q3
; across the helper call.
sys_libm_func:
    subi PRIMARY_OPCODE, SYS_SINF
    lsl  PRIMARY_OPCODE
    ldi  r30, lo8(sys_libm_target_table)
    ldi  r31, hi8(sys_libm_target_table)
    add  r30, PRIMARY_OPCODE
    adc  r31, ZERO
    lpm  r0, Z+
    lpm  r31, Z
    mov  r30, r0

    push r20
    push r21
    push r22
    push r23

    ; Marshal q2 into avr-libc argument A (r22-r25) and q3 into argument B
    ; (r18-r21). The order avoids destroying q2 high or q3 high while the
    ; native register ranges overlap.
    movw r24, VM_R5       ; q2 high half
    movw r18, VM_R6       ; q3 low half
    movw r20, VM_R7       ; q3 high half
    movw r22, VM_R4       ; q2 low half
    icall

    movw VM_R4, r22
    movw VM_R5, r24

    pop  r23
    pop  r22
    pop  r21
    pop  r20
    rjmp cluster_tail_18

; Program-memory word addresses consumed by ICALL. Keep this order identical
; to SYS_SINF through SYS_FMODF above.
sys_libm_target_table:
    .word pm(sinf)
    .word pm(cosf)
    .word pm(atan2f)
    .word pm(tanf)
    .word pm(expf)
    .word pm(logf)
    .word pm(log2f)
    .word pm(log10f)
    .word pm(powf)
    .word pm(hypotf)
    .word pm(fmodf)

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

    ; SFC_READ and each address byte are meaningful transmitted data, so
    ; command-to-address-high also requires the 18-cycle OUT-to-OUT cadence.
    rcall interp_delay_11
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

; Development-only unimplemented-instruction trap. No valid F0 veneer uses it.
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
; F1-F8 use their exact operand-specialized native sequences. Every valid F0
; veneer forwards to an implemented cold body. FA traps reserved values through
; its immediate body-jump table.

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

.macro emit_f2_mov32 dst0, dst2, src0, src2
.Lf2_mov32_start_\@:
    movw  \dst0, \src0
    movw  \dst2, \src2
    rjmp  cluster_a_tail_17
.Lf2_mov32_end_\@:
    .if (.Lf2_mov32_end_\@ - .Lf2_mov32_start_\@) != 6
        .error "F2 MOV32 slot is not exactly three words"
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
; Shared FF helper target lookup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Compact target tables and the nearby LPM loader remain beside Cluster A so
; FF decoding can use RCALL without disturbing fixed-layout secondary tables.
; The expanded typed bridges and interpreter-native FP cores are placed near
; the embedded-libm routines and entered with explicit far JMP instructions.

ff_binary_helper_targets:
    .word pm(__addsf3)
    .word pm(__subsf3)
    .word pm(__mulsf3)
    .word pm(__divsf3)

; C0/C4, C1/C5, C2/C6, and C3/C7 share these helpers respectively.
ff_conversion_helper_targets:
    .word pm(__floatsisf)
    .word pm(__floatunsisf)
    .word pm(__fixsfsi)
    .word pm(__fixunssfsi)

ff_load_helper_target:
    lsl   FF_BRIDGE_INDEX
    add   r30, FF_BRIDGE_INDEX
    adc   r31, ZERO
    lpm   r0, Z+
    lpm   FF_BRIDGE_INDEX, Z
    mov   r30, r0
    mov   r31, FF_BRIDGE_INDEX
    ret

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
; F0 60-68: program-space loads
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Each instruction is followed by PSPEC. Scalar forms require an even high
; nibble; pair forms require a four-byte-aligned high nibble. The low nibble
; always selects a four-byte-aligned qA pair. Any other PSPEC is invalid.
;
; Every operation-specific body uses f0_fetch_spec, which consumes PSPEC at
; the earliest legal cycle, launches a speculative following-primary fetch,
; and leaves VM_PC naming PSPEC. f0_program_prepare_func validates and decodes
; PSPEC, advances VM_PC to the following primary, captures the original
; canonical 24-bit qA source before any destination write, performs any
; postincrement, and tail-jumps directly to fx_read_program_bytes_func with:
;
;   r24:r25:r26  original image-relative program pointer
;   Z            destination register-file address
;   r0:r1        nonzero byte count
;
; Native H selects scalar (clear) versus pair (set) destination validation.
; Native T selects ordinary (clear) versus postincrement (set) semantics.
; Both bits are set after PSPEC fetch. H is consumed before arithmetic can
; clobber it; T survives the prepare sequence. Ordinary forms permit complete
; destination/source overlap. Postincrement scalar forms reject either
; component register of qA as rD; pair forms reject qD == qA.

f0_program_loads_start:

; F0 60 PSPEC: LDP8U rD,[qA]
f0_ldp8u_body:
    rcall f0_fetch_spec
    mov   r0, ONE
    clh
    clt
    rcall f0_program_prepare_func
    std   Z+1, ZERO
    rjmp  seek_and_dispatch_func

; F0 61 PSPEC: LDP8S rD,[qA]
f0_ldp8s_body:
    rcall f0_fetch_spec
    mov   r0, ONE
    clh
    clt
    rcall f0_program_prepare_func
    lsl   r27
    sbc   r27, r27
    std   Z+1, r27
    rjmp  seek_and_dispatch_func

; F0 62 PSPEC: LDP16 rD,[qA]
f0_ldp16_body:
    rcall f0_fetch_spec
    mov   r0, ONE
    lsl   r0
    clh
    clt
    rcall f0_program_prepare_func
    rjmp  seek_and_dispatch_func

; F0 63 PSPEC: LDP24 qD,[qA]
f0_ldp24_body:
    rcall f0_fetch_spec
    mov   r0, FOUR
    dec   r0
    seh
    clt
    rcall f0_program_prepare_func
    std   Z+1, ZERO
    rjmp  seek_and_dispatch_func

; F0 64 PSPEC: LDP32 qD,[qA]
f0_ldp32_body:
    rcall f0_fetch_spec
    mov   r0, FOUR
    seh
    clt
    rcall f0_program_prepare_func
    rjmp  seek_and_dispatch_func

; F0 65 PSPEC: LDP8U rD,[qA+]
f0_ldp8u_post_body:
    rcall f0_fetch_spec
    mov   r0, ONE
    clh
    set
    rcall f0_program_prepare_func
    std   Z+1, ZERO
    rjmp  seek_and_dispatch_func

; F0 66 PSPEC: LDP16 rD,[qA+]
f0_ldp16_post_body:
    rcall f0_fetch_spec
    mov   r0, ONE
    lsl   r0
    clh
    set
    rcall f0_program_prepare_func
    rjmp  seek_and_dispatch_func

; F0 67 PSPEC: LDP24 qD,[qA+]
f0_ldp24_post_body:
    rcall f0_fetch_spec
    mov   r0, FOUR
    dec   r0
    seh
    set
    rcall f0_program_prepare_func
    std   Z+1, ZERO
    rjmp  seek_and_dispatch_func

; F0 68 PSPEC: LDP32 qD,[qA+]
f0_ldp32_post_body:
    rcall f0_fetch_spec
    mov   r0, FOUR
    seh
    set
    rcall f0_program_prepare_func
    rjmp  seek_and_dispatch_func

; Inputs:
;   F0_SPEC  trailing PSPEC
;   r0       byte count 1-4; native r1 is zero on entry
;   H        0=scalar destination, 1=pair destination
;   T        0=ordinary, 1=postincrement
;
; On success, tail-jumps to fx_read_program_bytes_func using the ABI described
; above. The reader's RET returns directly to the operation-specific body through
; the return address established by that body's RCALL to this helper. The
; destination register-file byte address temporarily occupies r1 while qA is
; captured and, for postincrement forms, updated in place.
f0_program_prepare_func:
    ; Common validity requires qA alignment and high-code bit zero. Pair
    ; destinations additionally require high-code bit one to be zero.
    mov   r25, F0_SPEC
    brhc  .Lf0_program_scalar_spec
    andi  r25, 0x33
    rjmp  .Lf0_program_spec_checked
.Lf0_program_scalar_spec:
    andi  r25, 0x13
.Lf0_program_spec_checked:
    brne  f0_program_invalid

    ; f0_fetch_spec left VM_PC naming PSPEC. The stream will be restarted at
    ; the following primary after the independent program-data transaction.
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO

    ; Save the destination register-file byte address in native r1.
    mov   r25, F0_SPEC
    swap  r25
    andi  r25, 0x0f
    subi  r25, -8
    mov   r1, r25

    ; Z = native register-file byte address of qA.
    mov   r30, F0_SPEC
    andi  r30, 0x0f
    subi  r30, -8
    mov   r31, ZERO

    ; Postincrement destinations may not overlap either 16-bit component of
    ; qA. For pair destinations the second comparison can never match because
    ; qD is four-byte aligned, so this uniform check implements both rules.
    brtc  .Lf0_program_alias_valid
    cp    r1, r30
    breq  f0_program_invalid
    mov   r25, r30
    subi  r25, -2
    cp    r1, r25
    breq  f0_program_invalid
.Lf0_program_alias_valid:

    ; Capture the complete original qA before the reader writes its destination.
    ; The fourth byte must be zero for a canonical 24-bit program pointer.
    ld    r24, Z+
    ld    r25, Z+
    ld    r26, Z+
    ld    r27, Z
    tst   r27
    brne  f0_program_invalid

    ; For postincrement, update qA by count while retaining the original source
    ; in r24:r25:r26. MOV and ST preserve carry between the three byte updates.
    brtc  .Lf0_program_no_update
    subi  r30, 3
    mov   r27, r24
    add   r27, r0
    st    Z+, r27
    mov   r27, r25
    adc   r27, ZERO
    st    Z+, r27
    mov   r27, r26
    adc   r27, ZERO
    st    Z,  r27
.Lf0_program_no_update:

    ; Restore destination Z and the zero high byte of the reader count.
    mov   r30, r1
    mov   r31, ZERO
    mov   r1, ZERO
    rjmp  fx_read_program_bytes_func

f0_program_invalid:
    rjmp  invalid_secondary_instruction_func

f0_program_loads_end:
.if (f0_program_loads_end - f0_program_loads_start) != 224
    .error "F0 program-space load subsystem must occupy exactly 112 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Shared image-relative program-space byte reader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Inputs:
;   r24:r25:r26  image-relative source address, low:middle:high
;   r30:r31      destination SRAM address (native Z)
;   r0:r1        nonzero byte count, little-endian
;
; The physical W25Q128 address is (data_page_data << 8) + source, modulo
; 24 bits. The routine opens an independent SFC_READ transaction, copies the
; requested bytes, disables FX chip select, and returns. It deliberately does
; not handle count == 0.
;
; Outputs/clobbers:
;   r0:r1        zero
;   r24          original source low byte, preserved
;   r25:r26      physical middle/high address bytes
;   r27          scratch and final byte read
;   Z            points at the final destination byte (not one past it)
;   native SREG  clobbered; architectural VM_FLAGS is untouched
;
; Meaningful command/address transmit bytes use an 18-cycle OUT-to-OUT
; cadence. Dummy transfers use the 17-cycle minimum. For every nonfinal data
; byte, CLI/OUT/IN/SEI performs the exact reverse-order handoff: the next dummy
; transfer starts as soon as the previous receive byte is ready.
; The final byte is read without launching an unnecessary following transfer.
; All delay entries below avoid LPM/delay_3 because native r0 holds count.

fx_read_program_bytes_start:
fx_read_program_bytes_func:
    ; Keep the fixed-count entry's command launch in-line. The shared address
    ; phase begins through RCALL while the command is already transferring, so
    ; factoring it adds no cycles to F0 program loads or SYS memcpy_P.
    fx_disable
    ldi   r27, SFC_READ
    fx_enable
    out   SPDR, r27
    rcall fx_read_program_start_after_command_func

    ; The shared start returns five cycles after launching the first data-byte
    ; transfer. Predecrement the guaranteed-nonzero count. A multi-byte read
    ; takes the branch into the seven-cycle loop landing; count==1 jumps to the
    ; short final landing. Both paths consume the first byte on cycle 17.
    sub   r0, ONE
    sbc   r1, ZERO
    brne  .Lfx_read_program_loop
    rjmp  .Lfx_read_program_final_short

.Lfx_read_program_loop:
    ; Seven-cycle call plus CLI places OUT at the minimum legal boundary.
    rcall fx_read_program_delay_7
    cli
    out   SPDR, ZERO             ; begin the next data-byte transfer
    in    r27, SPDR              ; consume the completed previous byte
    sei
    st    Z+, r27

    sub   r0, ONE
    sbc   r1, ZERO
    brne  .Lfx_read_program_loop

    ; A loop exit occurs one cycle earlier than the count==1 jump reaches the
    ; short landing. This two-cycle delay aligns both paths at the shared
    ; seven-cycle final wait without changing existing reader latency.
    delay_2
.Lfx_read_program_final_short:
    rcall fx_read_program_delay_7
    in    r27, SPDR
    st    Z, r27
    fx_disable
    ret

; Alternate entry used only by the new program-memory SYS services. Their
; caller has already established a return address, so this path launches the
; command and tail-jumps into the shared address phase. The one-cycle landing
; aligns it with the fixed reader's RCALL entry without delaying either path.
fx_start_program_read_func:
    fx_disable
    ldi   r27, SFC_READ
    fx_enable
    out   SPDR, r27
    rjmp  fx_read_program_start_tail_entry

fx_read_program_start_tail_entry:
    nop
fx_read_program_start_after_command_func:
    ; Entry is cycle 4 after the command OUT on both paths. Convert the
    ; image-relative source into a physical flash address while the command is
    ; in flight. The source low byte is unchanged.
    lds   r27, data_page_data+0
    add   r25, r27
    lds   r27, data_page_data+1
    adc   r26, r27

    ; The seven-cycle delay and one NOP put the high-address OUT at cycle 18.
    ; Remaining meaningful bytes retain the 18-cycle cadence; the first dummy
    ; transfer uses the minimum 17-cycle cadence.
    rcall fx_read_program_delay_7
    nop
    out   SPDR, r26
    rcall fx_read_program_delay_17
    out   SPDR, r25
    rcall fx_read_program_delay_17
    out   SPDR, r24
    rcall fx_read_program_delay_16
    out   SPDR, ZERO             ; begin first data-byte transfer
    ret

; Local fixed-delay ladder. Each label is the complete cycle count from the
; calling RCALL through the returning RET. It uses only NOP and RJMP .+0.
fx_read_program_delay_17:
    nop
fx_read_program_delay_16:
    delay_4
    nop
fx_read_program_delay_11:
    delay_2
fx_read_program_delay_9:
    delay_2
fx_read_program_delay_7:
    ret

fx_read_program_bytes_end:
.if (fx_read_program_bytes_end - fx_read_program_bytes_start) != 106
    .error "shared program-space readers must occupy exactly fifty-three AVR words"
.endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Program-memory string and comparison SYS services
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Common ABI:
;   q3[23:0] = image-relative program pointer; q3[31:24] is ignored/preserved
;   r4 = RAM operand/destination, except strlen_P where r4 is result only
;   r5 = uint16_t bound for memcmp_P, strncpy_P, and strncat_P
;
; Results:
;   memcmp_P / strcmp_P return -1, 0, or +1 in r4
;   strlen_P returns the uint16_t length in r4
;   strncpy_P / strncat_P preserve the original destination in r4
;
; Each service opens one independent SFC_READ transaction and restarts the VM
; instruction stream afterward. Their streaming loops launch every successive
; dummy transfer exactly seventeen cycles after the preceding OUT. The current
; fixed-count reader is not routed through these loops, preserving existing F0
; and memcpy_P performance.

sys_progmem_services_start:

; Consume the service byte in VM_PC, copy only q3[23:0] into native source
; scratch, and tail-enter the alternate shared transaction start. q3[31:24]
; is neither inspected nor modified. The three NOPs preserve the established
; transaction-start timing and code layout of the former canonicality check.
; Called with RCALL; the transaction start's RET returns directly to the service
; body five cycles after the first data-byte OUT. Z and r0:r1 are preserved;
; r24:r27 are clobbered.
sys_progmem_prepare_func:
    nop
    nop
    nop
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO
    movw  r24, VM_R6
    mov   r26, VM_R7L
    rjmp  fx_start_program_read_func

; Shared comparison results. CP is always RAM byte minus program byte, so C
; means the RAM operand is lexicographically smaller.
.Lsys_progmem_compare_mismatch:
    brlo  .Lsys_progmem_compare_less
    mov   VM_R4L, ONE
    mov   VM_R4H, ZERO
    rjmp  .Lsys_progmem_finish
.Lsys_progmem_compare_less:
    ser   VM_R4L
    ser   VM_R4H
    rjmp  .Lsys_progmem_finish
.Lsys_progmem_compare_equal:
    clr   VM_R4L
    clr   VM_R4H
.Lsys_progmem_finish:
    fx_disable
    rjmp  seek_and_dispatch_func

; int memcmp_P(void const *lhs, progptr/uint24_t rhs, uint16_t n)
;   r4 = RAM lhs/result, q3 = program rhs, r5 = n
sys_memcmp_p_impl:
    movw  r0, VM_R5
    mov   r27, r0
    or    r27, r1
    breq  .Lsys_memcmp_p_zero

    movw  r30, VM_R4             ; Z = RAM lhs
    rcall sys_progmem_prepare_func

    ; The start returns at cycle 5. Preload the first RAM byte, then use the
    ; seven-cycle delay and RJMP to reach the first exact cycle-17 handoff.
    ld    r24, Z+
    rcall fx_read_program_delay_7
    rjmp  .Lsys_memcmp_p_loop

.Lsys_memcmp_p_loop:
    cli
    out   SPDR, ZERO
    in    r27, SPDR
    sei

    cp    r24, r27
    brne  .Lsys_progmem_compare_mismatch
    sub   r0, ONE
    sbc   r1, ZERO
    breq  .Lsys_progmem_compare_equal
    ld    r24, Z+
    delay_4
    rjmp  .Lsys_memcmp_p_loop

.Lsys_memcmp_p_zero:
    clr   VM_R4L
    clr   VM_R4H
    rjmp  cluster_tail_18

; int strcmp_P(char const *lhs, progptr/uint24_t rhs)
;   r4 = RAM lhs/result, q3 = program rhs
sys_strcmp_p_impl:
    movw  r30, VM_R4             ; Z = RAM lhs
    rcall sys_progmem_prepare_func

    ld    r0, Z+
    rcall fx_read_program_delay_7
    rjmp  .Lsys_strcmp_p_loop

.Lsys_strcmp_p_loop:
    cli
    out   SPDR, ZERO
    in    r27, SPDR
    sei

    cp    r0, r27
    brne  .Lsys_progmem_compare_mismatch
    tst   r27
    breq  .Lsys_progmem_compare_equal
    ld    r0, Z+
    delay_4
    nop
    rjmp  .Lsys_strcmp_p_loop

; uint16_t strlen_P(progptr/uint24_t src)
;   q3 = program src, r4 = result
sys_strlen_p_impl:
    clr   VM_R4L
    clr   VM_R4H
    rcall sys_progmem_prepare_func

    rcall fx_read_program_delay_9
    rjmp  .Lsys_strlen_p_loop

.Lsys_strlen_p_loop:
    cli
    out   SPDR, ZERO
    in    r27, SPDR
    sei

    tst   r27
    breq  .Lsys_strlen_p_finish_wait
    add   VM_R4L, ONE
    adc   VM_R4H, ZERO
    rcall fx_read_program_delay_7
    rjmp  .Lsys_strlen_p_loop

; The NUL path is two cycles shorter than the other program-memory terminal
; paths. This one-word landing delays the stream restart until the preceding
; dummy transfer has completed at the required seventeen-cycle SPI boundary.
.Lsys_strlen_p_finish_wait:
    rjmp  .Lsys_progmem_finish

; Shared bounded copy-until-NUL engine for strncpy_P and strncat_P.
; Inputs: Z=destination, r0:r1=nonzero maximum count, q3=source.
; Output: Z one past copied bytes, r0:r1 remaining count, T=1 iff a NUL was
; copied. The transaction is disabled before RET. The nonterminal path from
; one data OUT to the next is exactly seventeen cycles.
fx_copy_program_string_n_func:
    clt
    rcall sys_progmem_prepare_func
    rcall fx_read_program_delay_9
    rjmp  .Lfx_copy_program_string_n_loop

.Lfx_copy_program_string_n_loop:
    cli
    out   SPDR, ZERO
    in    r27, SPDR
    sei

    st    Z+, r27
    sub   r0, ONE
    sbc   r1, ZERO

    ; CPSE does not disturb the count's Z flag. For a nonzero byte, the RJMP
    ; reaches the count test; for NUL, skip it, set T, and finish.
    cpse  r27, ZERO
    rjmp  .Lfx_copy_program_string_n_nonzero
    set
    rjmp  .Lfx_copy_program_string_n_done

.Lfx_copy_program_string_n_nonzero:
    breq  .Lfx_copy_program_string_n_done
    delay_2
    nop
    rjmp  .Lfx_copy_program_string_n_loop

.Lfx_copy_program_string_n_done:
    fx_disable
    ret

; char *strncpy_P(char *dst, progptr/uint24_t src, uint16_t n)
;   r4 = dst/result, q3 = src, r5 = n
sys_strncpy_p_impl:
    movw  r0, VM_R5
    mov   r27, r0
    or    r27, r1
    breq  .Lsys_strncpy_p_zero

    movw  r30, VM_R4
    rcall fx_copy_program_string_n_func

    ; A nonzero remainder exists only when the source NUL was copied. Pad all
    ; remaining destination bytes as required by strncpy.
    mov   r24, r0
    or    r24, r1
    breq  .Lsys_strncpy_p_done
.Lsys_strncpy_p_pad:
    st    Z+, ZERO
    sub   r0, ONE
    sbc   r1, ZERO
    brne  .Lsys_strncpy_p_pad
.Lsys_strncpy_p_done:
    rjmp  seek_and_dispatch_func
.Lsys_strncpy_p_zero:
    rjmp  cluster_tail_18

; char *strncat_P(char *dst, progptr/uint24_t src, uint16_t n)
;   r4 = dst/result, q3 = src, r5 = n
sys_strncat_p_impl:
    movw  r0, VM_R5
    mov   r27, r0
    or    r27, r1
    breq  .Lsys_strncat_p_zero

    ; Find the existing RAM terminator. Z is left one past it, then moved back
    ; so the program string overwrites that terminator.
    movw  r30, VM_R4
.Lsys_strncat_p_scan:
    ld    r24, Z+
    tst   r24
    brne  .Lsys_strncat_p_scan
    sbiw  r30, 1

    rcall fx_copy_program_string_n_func
    brts  .Lsys_strncat_p_done
    st    Z, ZERO                ; count exhausted before source NUL
.Lsys_strncat_p_done:
    rjmp  seek_and_dispatch_func
.Lsys_strncat_p_zero:
    rjmp  cluster_tail_18

sys_progmem_services_end:
.if (sys_progmem_services_end - sys_progmem_services_start) != 258
    .error "program-memory SYS subsystem must occupy exactly 129 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Data-memory string and comparison SYS services
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Calling conventions:
;   memcmp:   r4=lhs/result, r5=rhs, r6=n
;   strcmp:   r4=lhs/result, r5=rhs
;   strlen:   r4=string/result
;   strncpy:  r4=dst/result, r5=src, r6=n
;   strncat:  r4=dst/result, r5=src, r6=n
;
; Comparison services return the exact signed unsigned-byte difference.
; strncpy and strncat retain the original destination in r4. The bounded copy
; engine is shared by both string-copy services and returns NUL status in T.
; All services preserve VM_FLAGS and every nondestination architectural input.

sys_ram_string_services_start:

; Shared exact comparison result. The byte loops use SUB lhs,rhs. Its low
; byte and carry are the complete signed 16-bit difference of two unsigned
; chars: clear the high byte without disturbing carry, then borrow into it.
.Lsys_ram_compare_store_difference:
    mov   VM_R4L, r0
    clr   VM_R4H
    sbc   VM_R4H, ZERO
    rjmp  cluster_tail_18
.Lsys_ram_compare_zero:
    sub   r0, r0                 ; zero r0 and clear carry
    rjmp  .Lsys_ram_compare_store_difference

; int memcmp(void const *lhs, void const *rhs, uint16_t n)
;   r4 = lhs/result, r5 = rhs, r6 = n
sys_memcmp_impl:
    movw  r26, VM_R4             ; X = lhs
    movw  r30, VM_R5             ; Z = rhs
    movw  r24, VM_R6             ; remaining count
    sbiw  r24, 0
    breq  .Lsys_ram_compare_zero
.Lsys_memcmp_loop:
    ld    r0, X+
    ld    r1, Z+
    sub   r0, r1
    brne  .Lsys_ram_compare_store_difference
    sbiw  r24, 1
    brne  .Lsys_memcmp_loop
    rjmp  .Lsys_ram_compare_store_difference

; int strcmp(char const *lhs, char const *rhs)
;   r4 = lhs/result, r5 = rhs
sys_strcmp_impl:
    movw  r26, VM_R4             ; X = lhs
    movw  r30, VM_R5             ; Z = rhs
.Lsys_strcmp_loop:
    ld    r0, X+
    ld    r1, Z+
    sub   r0, r1
    brne  .Lsys_ram_compare_store_difference
    tst   r1
    brne  .Lsys_strcmp_loop
    rjmp  .Lsys_ram_compare_store_difference

; uint16_t strlen(char const *src)
;   r4 = src/result
sys_strlen_impl:
    movw  r26, VM_R4             ; X = source
    clr   r24
    clr   r25
.Lsys_strlen_loop:
    ld    r0, X+
    tst   r0
    breq  .Lsys_strlen_done
    adiw  r24, 1
    rjmp  .Lsys_strlen_loop
.Lsys_strlen_done:
    movw  VM_R4, r24
    rjmp  cluster_tail_18

; Shared bounded RAM copy-until-NUL engine for strncpy and strncat.
; Inputs: X=source, Z=destination, r24:r25=nonzero maximum count.
; Outputs: X/Z one past copied bytes, r24:r25 unused count, T=1 iff a NUL
; was copied. CPSE preserves the native Z flag produced by SBIW.
sys_copy_string_n_func:
    clt
.Lsys_copy_string_n_loop:
    ld    r0, X+
    st    Z+, r0
    sbiw  r24, 1
    cpse  r0, ZERO
    rjmp  .Lsys_copy_string_n_nonzero
    set
    ret
.Lsys_copy_string_n_nonzero:
    brne  .Lsys_copy_string_n_loop
    ret

; char *strncpy(char *dst, char const *src, uint16_t n)
;   r4 = dst/result, r5 = src, r6 = n
sys_strncpy_impl:
    movw  r24, VM_R6
    sbiw  r24, 0
    breq  .Lsys_ram_string_done
    movw  r26, VM_R5
    movw  r30, VM_R4
    rcall sys_copy_string_n_func

    ; The helper returns with native Z still reflecting the remaining count.
    ; A nonzero remainder exists only when a source NUL was copied.
    breq  .Lsys_ram_string_done
.Lsys_strncpy_pad:
    st    Z+, ZERO
    sbiw  r24, 1
    brne  .Lsys_strncpy_pad
    rjmp  .Lsys_ram_string_done

; char *strncat(char *dst, char const *src, uint16_t n)
;   r4 = dst/result, r5 = src, r6 = n
sys_strncat_impl:
    movw  r24, VM_R6
    sbiw  r24, 0
    breq  .Lsys_ram_string_done

    ; Find and overwrite the existing destination terminator.
    movw  r30, VM_R4
.Lsys_strncat_scan:
    ld    r0, Z+
    tst   r0
    brne  .Lsys_strncat_scan
    sbiw  r30, 1

    movw  r26, VM_R5
    rcall sys_copy_string_n_func
    brts  .Lsys_ram_string_done
    st    Z, ZERO                ; count exhausted before source NUL
.Lsys_ram_string_done:
    rjmp  cluster_tail_18

sys_ram_string_services_end:
.if (sys_ram_string_services_end - sys_ram_string_services_start) != 142
    .error "data-memory string SYS subsystem must occupy exactly 71 AVR words"
.endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OLED framebuffer display function and SYS service
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Shared native function:
;   display_update_func
;   input:  r16 / VM_R4L = clear (zero leaves framebuffer bytes unchanged;
;                                nonzero clears each byte after transfer)
;   precondition: FX flash is deselected and no SPI transfer is active
;   output: OLED and FX flash deselected; transfer fully complete
;   clobbers: r0, r24:r26, Z, native SREG
;   preserves: r16 and all other architectural registers
;
; SYS ABI:
;   void display(bool clear)
;   r4 low byte / native r16 = clear
;
; The SYS wrapper advances VM_PC, drains the speculative FX transfer, calls the
; shared function, and restarts the instruction stream. Startup calls the same
; function directly after zeroing the framebuffer.

sys_display_service_start:
sys_display_impl:
    ; VM_PC names the service byte. Advance to the following primary now so the
    ; common seek path can restart the instruction stream after the OLED owns
    ; the shared SPI bus.
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO

    ; SYS decode already launched a speculative read of the following primary.
    ; Wait for that transfer to complete before deselecting the FX flash, then
    ; read SPDR to complete the hardware SPIF-clear sequence.
.Lsys_display_wait_fx:
    in    r24, SPSR
    sbrs  r24, SPIF
    rjmp  .Lsys_display_wait_fx
    in    r24, SPDR
    fx_disable

    rcall display_update_func
    rjmp  seek_and_dispatch_func

; Transfer the complete framebuffer to the configured OLED controller. This is
; a normal native AVR function so startup and SYS display share one body.
display_update_func:
    ldi   r30, lo8(data_display)
    ldi   r31, hi8(data_display)

#if defined(AVM_DISPLAY_SH1106)
    ; Arduboy2-derived SH1106 page-mode transfer. Every command and data OUT is
    ; separated by at least the 18 cycles required at f_CPU/2. The visible
    ; 128-column window begins at column two; startup set the low column command
    ; to 0x02, and each page resets only page and high-column state here.
    display_command_mode
    display_enable
    ldi   r25, 0xB0               ; page 0 command

.Ldisplay_sh1106_page:
    ldi   r24, 0x10               ; high column address = 0
    ldi   r26, 6
    display_command_mode

    out   SPDR, r25
.Ldisplay_sh1106_command_wait:
    dec   r26
    brne  .Ldisplay_sh1106_command_wait
    out   SPDR, r24

    ldi   r24, 128
    inc   r24                     ; 129: predecrement loop entry
    rjmp  .Ldisplay_sh1106_data_entry

.Ldisplay_sh1106_data_loop:
    lpm   r26, Z                  ; timing-only internal-flash read
    ld    r26, Z
    display_data_mode
    out   SPDR, r26
    cpse  VM_R4L, ZERO
    mov   r26, ZERO
    st    Z+, r26

.Ldisplay_sh1106_data_entry:
    lpm   r26, Z                  ; timing-only internal-flash read
    dec   r24
    brne  .Ldisplay_sh1106_data_loop

    inc   r25
    cpi   r25, 0xB8              ; eight 128-byte pages
    brne  .Ldisplay_sh1106_page

    ; Match the reference final-transfer delay before releasing chip select.
    lpm   r26, Z
#else
    ; Arduboy2-derived SSD1306/SSD1309 data-only transfer. A doubled count makes
    ; the SBIW/parity delay loop execute twice per framebuffer byte, yielding
    ; an exact 18-cycle OUT-to-OUT cadence while also providing constant-time
    ; optional clearing.
    display_data_mode
    display_enable
    ldi   r24, lo8(2048)
    ldi   r25, hi8(2048)

.Ldisplay_ssd_loop:
    ld    r0, Z
    out   SPDR, r0
    cpse  VM_R4L, ZERO
    mov   r0, ZERO
.Ldisplay_ssd_delay:
    sbiw  r24, 1
    sbrc  r24, 0
    rjmp  .Ldisplay_ssd_delay
    st    Z+, r0
    brne  .Ldisplay_ssd_loop
#endif

    ; Complete and acknowledge the final transfer before releasing chip select.
    in    r24, SPSR
    in    r24, SPDR
    display_disable
    fx_disable
    ret

sys_display_service_end:
#if defined(AVM_DISPLAY_SH1106)
.if (sys_display_service_end - sys_display_service_start) != 88
    .error "SH1106 display SYS wrapper/function must occupy exactly 44 AVR words"
.endif
#else
.if (sys_display_service_end - sys_display_service_start) != 60
    .error "SSD1306/SSD1309 display SYS wrapper/function must occupy exactly 30 AVR words"
.endif
#endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; F0 69-6B: shared cold 32-bit forms
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; RRSPEC contains two pre-scaled native register-file offsets:
;   bits 7:4  high operand: qL / qD / qS
;   bits 3:0  low operand:  qR / rA
;
; Valid q offsets are 0,4,8,12 and valid r offsets are 0,2,...,14. Common
; validation rejects a non-q high operand or an odd low operand; CMP32 also
; rejects a low operand that is not q-aligned. X addresses the high operand
; and Z addresses the low operand.
;
; The generic width-one F0 decoder launches RRSPEC at cycle 9 after F0-slot
; entry and reaches this one-word veneer body at cycle 23. The one required
; cadence slot normalizes secondary 69-6B to operation indices 0-2. The ADD,
; CLI, and OUT then launch the following primary at cycle 26, exactly 17 cycles
; after RRSPEC. This current-decoder adaptation is one word smaller than the
; guide's three-cycle landing while preserving the same shared organization.
;
; Memory forms capture the complete 16-bit effective address before touching
; the selected q pair, so LD32 and ST32 permit q/address-register overlap.
; CMP32 captures the complete left operand before reusing XL as scratch, so
; qL == qR is fully defined.

f0_cold32_start:
f0_cold32_delay_1:
    subi  SECONDARY_OPCODE, 0x69  ; 0=CMP32, 1=LD32, 2=ST32
f0_cold32:
    add   VM_PCL, ONE
    cli
    out   SPDR, ZERO
    in    F0_COLD32_SPEC, SPDR
    sei
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO

    ; Common validity: high operand must be q-aligned and low operand r-aligned.
    mov   r26, F0_COLD32_SPEC
    andi  r26, 0x31
    brne  f0_cold32_invalid

    ; X = native register-file pointer for the high operand.
    mov   r26, F0_COLD32_SPEC
    swap  r26
    andi  r26, 0x0f
    subi  r26, -8
    mov   r27, ZERO

    ; Z = native register-file pointer for the low operand.
    mov   r30, F0_COLD32_SPEC
    andi  r30, 0x0f
    subi  r30, -8
    mov   r31, ZERO

    ; Operation index zero selects CMP32; memory forms share address capture.
    tst   SECONDARY_OPCODE
    breq  f0_cold32_cmp32

    ; Capture the effective data-space address before reading/writing a
    ; potentially overlapping q operand.
    ld    r0, Z+
    ld    r1, Z
    movw  Z, r0

    ; Operation index one is LD32; index two falls through to ST32.
    cpi   SECONDARY_OPCODE, 1
    breq  f0_cold32_ld32

f0_cold32_st32:
    ld    r24, X+
    st    Z+, r24
    ld    r24, X+
    st    Z+, r24
    ld    r24, X+
    st    Z+, r24
    ld    r24, X
    st    Z,  r24
    rjmp  cluster_a_tail_18

f0_cold32_ld32:
    ld    r24, Z+
    st    X+, r24
    ld    r24, Z+
    st    X+, r24
    ld    r24, Z+
    st    X+, r24
    ld    r24, Z
    st    X,  r24
    rjmp  cluster_a_tail_18

f0_cold32_cmp32:
    ; CMP32 additionally requires the low operand to be q-aligned.
    sbrc  F0_COLD32_SPEC, 1
    rjmp  f0_cold32_invalid

    ; Preserve all four left bytes before XL is reused as right-byte scratch.
    ld    r0,  X+
    ld    r1,  X+
    ld    r24, X+
    ld    r25, X

    ld    r26, Z+
    cp    r0,  r26
    ld    r26, Z+
    cpc   r1,  r26
    ld    r26, Z+
    cpc   r24, r26
    ld    r26, Z
    cpc   r25, r26

    in    r24, SREG
    out   VM_FLAGS, r24
    rjmp  cluster_a_tail_18

f0_cold32_invalid:
    rjmp  invalid_secondary_instruction_func

f0_cold32_end:
.if (f0_cold32_end - f0_cold32_start) != 126
    .error "F0 cold-32 subsystem must occupy exactly sixty-three AVR words"
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

; F0 retains one-word veneers for every cold form. All valid secondaries
; 00-6D are implemented above; the local F0 trap remains before the group for
; short RJMP reach and for any future development-only scaffolding.
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

    ; 60-68: program-space loads; trailing byte is PSPEC.
    rjmp  f0_ldp8u_body
    rjmp  f0_ldp8s_body
    rjmp  f0_ldp16_body
    rjmp  f0_ldp24_body
    rjmp  f0_ldp32_body
    rjmp  f0_ldp8u_post_body
    rjmp  f0_ldp16_post_body
    rjmp  f0_ldp24_post_body
    rjmp  f0_ldp32_post_body

    ; 69-6B: CMP32 / LD32 / ST32; trailing byte is pre-scaled RRSPEC.
    rjmp  f0_cold32_delay_1
    rjmp  f0_cold32_delay_1
    rjmp  f0_cold32_delay_1

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
    ; F2: bounded three-word ADD/SUB/MOV32 table
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

    ; F2 60-6B: MOV32 in contiguous QPAIR12 order. Upper-pair to
    ; upper-pair copies are omitted because the assembler expands them to two
    ; one-byte upper-register MOV instructions.
    emit_f2_mov32 r8,  r10, r8,  r10  ; q0,q0
    emit_f2_mov32 r8,  r10, r12, r14  ; q0,q1
    emit_f2_mov32 r8,  r10, r16, r18  ; q0,q2
    emit_f2_mov32 r8,  r10, r20, r22  ; q0,q3
    emit_f2_mov32 r12, r14, r8,  r10  ; q1,q0
    emit_f2_mov32 r12, r14, r12, r14  ; q1,q1
    emit_f2_mov32 r12, r14, r16, r18  ; q1,q2
    emit_f2_mov32 r12, r14, r20, r22  ; q1,q3
    emit_f2_mov32 r16, r18, r8,  r10  ; q2,q0
    emit_f2_mov32 r16, r18, r12, r14  ; q2,q1
    emit_f2_mov32 r20, r22, r8,  r10  ; q3,q0
    emit_f2_mov32 r20, r22, r12, r14  ; q3,q1
f2_table_end:
.if (f2_table_end - f2_table) != (2 * 0x6C * 3)
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

; The active secondary executable tables must occupy exactly 7,374 bytes.
.if ((f0_veneer_table_end - f0_veneer_table) + (f1_table_end - f1_table) + (f2_table_end - f2_table) + (f3_table_end - f3_table) + (f4_table_end - f4_table) + (f5_table_end - f5_table) + (f6_table_end - f6_table) + (f7_table_end - f7_table) + (f8_table_end - f8_table) + (fa_immediate_jump_table_end - fa_immediate_jump_table) + (fa_forward_table_end - fa_forward_table) + (cmov_table_end - cmov_table) + (fe_forward_table_end - fe_forward_table)) != 7374
    .error "secondary executable tables must occupy exactly 7374 bytes"
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

    ; Reset and configure the selected SPI OLED controller. Pixel data is sent
    ; only after the application data image has been initialized below.
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
    ; The framebuffer is outside the application data image. Clear all 1024
    ; bytes, then invoke the same native display-update function used by SYS
    ; display.
    ldi   r30, lo8(data_display)
    ldi   r31, hi8(data_display)
    ldi   r24, lo8(1024)
    ldi   r25, hi8(1024)
startup_clear_framebuffer_loop:
    st    Z+, ZERO
    sbiw  r24, 1
    brne  startup_clear_framebuffer_loop

    mov   VM_R4L, ZERO
    call  display_update_func

    ; Timer0 is initialized only after the data image copy and initial display
    ; blanking. Its compare interrupt becomes globally active at the SEI below.
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
.p2align 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Far FF typed bridges and interpreter-native floating-point cores
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; This code is deliberately placed outside the Cluster-A-to-secondary-table
; window. Entry and dispatch-tail transfers use explicit JMP instructions;
; internal control flow remains relative.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Direct FMIN/FMAX/FCMP operand loading and comparison
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; GPIOR2 bits:
;   7     FCMP
;   6     FMAX (clear selects FMIN)
;   3:2   left q
;   1:0   right q
;
; Scratch representation after loading:
;   left  low/high = r26:r27 / r24:r25
;   right low/high = r0:r1   / r30:r31
;
; The source selectors use fixed MOVW operations, so no architectural register
; is modified and every source/destination overlap is naturally safe.

ff_direct_load_left_q:
    in    r30, FF_DIRECT_CONTROL_IO
    lsr   r30
    lsr   r30
    andi  r30, 0x03
    sbrc  r30, 1
    rjmp  .Lff_direct_left_high
    sbrc  r30, 0
    rjmp  .Lff_direct_left_q1

.Lff_direct_left_q0:
    movw  r26, r8
    movw  r24, r10
    rjmp  ff_direct_load_right_q

.Lff_direct_left_q1:
    movw  r26, r12
    movw  r24, r14
    rjmp  ff_direct_load_right_q

.Lff_direct_left_high:
    sbrc  r30, 0
    rjmp  .Lff_direct_left_q3

.Lff_direct_left_q2:
    movw  r26, r16
    movw  r24, r18
    rjmp  ff_direct_load_right_q

.Lff_direct_left_q3:
    movw  r26, r20
    movw  r24, r22

ff_direct_load_right_q:
    in    r30, FF_DIRECT_CONTROL_IO
    andi  r30, 0x03
    sbrc  r30, 1
    rjmp  .Lff_direct_right_high
    sbrc  r30, 0
    rjmp  .Lff_direct_right_q1

.Lff_direct_right_q0:
    movw  r0, r8
    movw  r30, r10
    rjmp  ff_direct_operands_ready

.Lff_direct_right_q1:
    movw  r0, r12
    movw  r30, r14
    rjmp  ff_direct_operands_ready

.Lff_direct_right_high:
    sbrc  r30, 0
    rjmp  .Lff_direct_right_q3

.Lff_direct_right_q2:
    movw  r0, r16
    movw  r30, r18
    rjmp  ff_direct_operands_ready

.Lff_direct_right_q3:
    movw  r0, r20
    movw  r30, r22

ff_direct_operands_ready:
    ; Temporarily use permanent ZERO as the operation-control byte. No calls or
    ; SPI handoffs occur before every exit restores r2 with CLR.
    in    r2, FF_DIRECT_CONTROL_IO

    ; Detect a NaN left operand while restoring every temporarily masked bit.
    bst   r25, 7
    andi  r25, 0x7F
    cpi   r25, 0x7F
    brne  .Lff_direct_left_not_nan
    sbrs  r24, 7
    rjmp  .Lff_direct_left_not_nan
    andi  r24, 0x7F
    clr   r25
    or    r25, r26
    or    r25, r27
    or    r25, r24
    breq  .Lff_direct_left_nan_fraction_zero
    ori   r24, 0x80
    ldi   r25, 0x7F
    bld   r25, 7
    rjmp  .Lff_direct_left_nan
.Lff_direct_left_nan_fraction_zero:
    ori   r24, 0x80
    ldi   r25, 0x7F
    bld   r25, 7
    rjmp  .Lff_direct_check_right_nan
.Lff_direct_left_not_nan:
    bld   r25, 7
    rjmp  .Lff_direct_check_right_nan

.Lff_direct_left_nan:
    sbrc  r2, 7
    rjmp  .Lff_direct_cmp_unordered
    ; Number-preferred min/max returns the second operand when the left is NaN,
    ; including the both-NaN case; payload and signaling state remain exact.
    rjmp  .Lff_direct_select_right

.Lff_direct_check_right_nan:
    bst   r31, 7
    andi  r31, 0x7F
    cpi   r31, 0x7F
    brne  .Lff_direct_right_not_nan
    sbrs  r30, 7
    rjmp  .Lff_direct_right_not_nan
    andi  r30, 0x7F
    clr   r31
    or    r31, r0
    or    r31, r1
    or    r31, r30
    breq  .Lff_direct_right_nan_fraction_zero
    ori   r30, 0x80
    ldi   r31, 0x7F
    bld   r31, 7
    rjmp  .Lff_direct_right_nan
.Lff_direct_right_nan_fraction_zero:
    ori   r30, 0x80
    ldi   r31, 0x7F
    bld   r31, 7
    rjmp  .Lff_direct_compare_numeric
.Lff_direct_right_not_nan:
    bld   r31, 7
    rjmp  .Lff_direct_compare_numeric

.Lff_direct_right_nan:
    sbrc  r2, 7
    rjmp  .Lff_direct_cmp_unordered
    rjmp  .Lff_direct_select_left

.Lff_direct_compare_numeric:
    ; FCMP treats both signed zeros as equal. FMIN/FMAX deliberately continue
    ; through sign ordering so -0 wins FMIN and +0 wins FMAX.
    sbrs  r2, 7
    rjmp  .Lff_direct_compare_signs

    tst   r26
    brne  .Lff_direct_compare_signs
    tst   r27
    brne  .Lff_direct_compare_signs
    tst   r24
    brne  .Lff_direct_compare_signs
    cpi   r25, 0x00
    breq  .Lff_direct_left_zero
    cpi   r25, 0x80
    brne  .Lff_direct_compare_signs
.Lff_direct_left_zero:
    tst   r0
    brne  .Lff_direct_compare_signs
    tst   r1
    brne  .Lff_direct_compare_signs
    tst   r30
    brne  .Lff_direct_compare_signs
    cpi   r31, 0x00
    breq  .Lff_direct_equal
    cpi   r31, 0x80
    breq  .Lff_direct_equal

.Lff_direct_compare_signs:
    sbrc  r25, 7
    rjmp  .Lff_direct_left_negative
    sbrc  r31, 7
    rjmp  .Lff_direct_greater
    rjmp  .Lff_direct_compare_positive

.Lff_direct_left_negative:
    sbrs  r31, 7
    rjmp  .Lff_direct_less

    ; Both negative: larger raw magnitude is numerically smaller.
    cp    r25, r31
    brlo  .Lff_direct_greater
    brne  .Lff_direct_less
    cp    r24, r30
    brlo  .Lff_direct_greater
    brne  .Lff_direct_less
    cp    r27, r1
    brlo  .Lff_direct_greater
    brne  .Lff_direct_less
    cp    r26, r0
    brlo  .Lff_direct_greater
    brne  .Lff_direct_less
    rjmp  .Lff_direct_equal

.Lff_direct_compare_positive:
    cp    r25, r31
    brlo  .Lff_direct_less
    brne  .Lff_direct_greater
    cp    r24, r30
    brlo  .Lff_direct_less
    brne  .Lff_direct_greater
    cp    r27, r1
    brlo  .Lff_direct_less
    brne  .Lff_direct_greater
    cp    r26, r0
    brlo  .Lff_direct_less
    brne  .Lff_direct_greater

.Lff_direct_equal:
    sbrc  r2, 7
    rjmp  .Lff_direct_cmp_equal
    rjmp  .Lff_direct_select_left

.Lff_direct_less:
    sbrc  r2, 7
    rjmp  .Lff_direct_cmp_less
    sbrc  r2, 6
    rjmp  .Lff_direct_select_right
    rjmp  .Lff_direct_select_left

.Lff_direct_greater:
    sbrc  r2, 7
    rjmp  .Lff_direct_cmp_greater
    sbrc  r2, 6
    rjmp  .Lff_direct_select_left
    rjmp  .Lff_direct_select_right

.Lff_direct_select_right:
    movw  r26, r0
    movw  r24, r30
.Lff_direct_select_left:
    clr   r2
    in    r30, FF_BRIDGE_META_IO
    rjmp  ff_store_q_result

.Lff_direct_cmp_less:
    ldi   r24, 0xFF
    ldi   r25, 0xFF
    rjmp  .Lff_direct_cmp_store
.Lff_direct_cmp_equal:
    clr   r24
    clr   r25
    rjmp  .Lff_direct_cmp_store
.Lff_direct_cmp_greater:
    ldi   r24, 1
    clr   r25
    rjmp  .Lff_direct_cmp_store
.Lff_direct_cmp_unordered:
    ldi   r24, 2
    clr   r25
.Lff_direct_cmp_store:
    clr   r2
    in    r30, FF_BRIDGE_META_IO
    rjmp  ff_bridge_store_r16

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Direct FTRUNC/FFLOOR/FCEIL/FROUND
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Mode in GPIOR2:
;   0 trunc toward zero
;   1 floor
;   2 ceil
;   3 round halfway away from zero
;
; The selected q value is loaded into the same canonical result representation
; used by the q writer: low half r26:r27, high half r24:r25.
; Partial-byte masks are generated by a loop bounded to seven shifts.
ff_direct_round_load_q:
    in    r0, FF_BRIDGE_META_IO
    sbrc  r0, 1
    rjmp  .Lff_direct_round_high
    sbrc  r0, 0
    rjmp  .Lff_direct_round_q1

.Lff_direct_round_q0:
    movw  r26, r8
    movw  r24, r10
    rjmp  ff_direct_round_ready

.Lff_direct_round_q1:
    movw  r26, r12
    movw  r24, r14
    rjmp  ff_direct_round_ready

.Lff_direct_round_high:
    sbrc  r0, 0
    rjmp  .Lff_direct_round_q3

.Lff_direct_round_q2:
    movw  r26, r16
    movw  r24, r18
    rjmp  ff_direct_round_ready

.Lff_direct_round_q3:
    movw  r26, r20
    movw  r24, r22

ff_direct_round_ready:
    in    r2, FF_DIRECT_CONTROL_IO

    ; Assemble the unbiased-field source exponent E in r30. E >= 150 means the
    ; binary32 value has no fractional bit; this also returns infinities and
    ; NaNs unchanged.
    mov   r30, r25
    lsl   r30
    sbrc  r24, 7
    ori   r30, 1
    cpi   r30, 150
    brlo  .Lff_direct_round_not_integral
    rjmp  .Lff_direct_round_finish
.Lff_direct_round_not_integral:
    cpi   r30, 127
    brsh  .Lff_direct_round_fractional_integer

    ; |x| < 1. Preserve exact signed zero. All other small inputs reduce to
    ; signed zero or signed one according to mode and sign.
    mov   r31, r25
    andi  r31, 0x7F
    or    r31, r24
    or    r31, r27
    or    r31, r26
    brne  .Lff_direct_round_small_nonzero
    rjmp  .Lff_direct_round_finish
.Lff_direct_round_small_nonzero:
    tst   r2
    breq  .Lff_direct_round_make_zero
    sbrc  r2, 1
    rjmp  .Lff_direct_round_small_high_mode

    ; Mode 1: FLOOR.
    sbrs  r25, 7
    rjmp  .Lff_direct_round_make_zero
    rjmp  .Lff_direct_round_make_one

.Lff_direct_round_small_high_mode:
    sbrc  r2, 0
    rjmp  .Lff_direct_round_small_round

    ; Mode 2: CEIL.
    sbrc  r25, 7
    rjmp  .Lff_direct_round_make_zero
    rjmp  .Lff_direct_round_make_one

.Lff_direct_round_small_round:
    ; Mode 3: E == 126 is exactly the [0.5,1) binade.
    cpi   r30, 126
    brlo  .Lff_direct_round_make_zero

.Lff_direct_round_make_one:
    clr   r26
    clr   r27
    ldi   r24, 0x80
    andi  r25, 0x80
    ori   r25, 0x3F
    rjmp  .Lff_direct_round_finish

.Lff_direct_round_make_zero:
    clr   r26
    clr   r27
    clr   r24
    andi  r25, 0x80
    rjmp  .Lff_direct_round_finish

.Lff_direct_round_fractional_integer:
    ; n = 150-E is the number of low raw-magnitude bits to discard (1-23).
    ; Preserve the sign in T and operate on the unsigned magnitude. Split n
    ; into a byte group and a within-byte shift count. The common path builds
    ; its mask in at most seven shifts, examines the discarded fraction, and
    ; clears the low bits without shifting the complete value away and back.
    ldi   r31, 150
    sub   r31, r30
    bst   r25, 7
    andi  r25, 0x7F

    mov   r30, r31
    andi  r30, 0x07             ; within-byte bit count
    cpi   r31, 8
    brlo  .Lff_direct_round_compact_low
    cpi   r31, 16
    brlo  .Lff_direct_round_compact_mid

.Lff_direct_round_compact_high:
    mov   r2, ONE
    lsl   r2                    ; ULP is in r24
    mov   r0, r24               ; partial-byte source
    mov   r1, r26
    or    r1, r27               ; all lower discarded bytes
    tst   r30
    brne  .Lff_direct_round_compact_partial
    mov   r0, r27               ; boundary halfway bit is r27.7
    rjmp  .Lff_direct_round_compact_boundary

.Lff_direct_round_compact_mid:
    mov   r2, ONE               ; ULP is in r27
    mov   r0, r27               ; partial-byte source
    mov   r1, r26               ; lower discarded byte
    tst   r30
    brne  .Lff_direct_round_compact_partial
    mov   r0, r26               ; boundary halfway bit is r26.7
    rjmp  .Lff_direct_round_compact_boundary

.Lff_direct_round_compact_low:
    clr   r2                    ; ULP is in r26; n cannot be a boundary
    mov   r0, r26
    clr   r1

.Lff_direct_round_compact_partial:
    ; r31 = 1 << (n & 7), generated by a loop bounded to seven iterations.
    ldi   r31, 1
.Lff_direct_round_compact_mask_loop:
    lsl   r31
    dec   r30
    brne  .Lff_direct_round_compact_mask_loop

    ; Result flags in r30: bit 0 means any discarded fraction and bit 1 means
    ; the halfway bit is set. r1 already contains all fully discarded bytes.
    mov   r30, r31
    lsr   r30
    and   r30, r0
    breq  .Lff_direct_round_compact_no_half
    ldi   r30, 0x02
    rjmp  .Lff_direct_round_compact_half_done
.Lff_direct_round_compact_no_half:
    clr   r30
.Lff_direct_round_compact_half_done:
    dec   r31                   ; mask below the retained ULP
    and   r0, r31
    or    r1, r0
    breq  .Lff_direct_round_compact_no_discard
    ori   r30, 0x01
.Lff_direct_round_compact_no_discard:

    ; Clear the discarded bits. Convert the low mask to a keep mask, apply it
    ; to the selected byte, and clear all complete lower bytes.
    com   r31
    tst   r2
    breq  .Lff_direct_round_compact_clear_low
    cp    r2, ONE
    breq  .Lff_direct_round_compact_clear_mid

.Lff_direct_round_compact_clear_high:
    and   r24, r31
    clr   r27
    clr   r26
    rjmp  .Lff_direct_round_compact_restore_ulp

.Lff_direct_round_compact_clear_mid:
    and   r27, r31
    clr   r26
    rjmp  .Lff_direct_round_compact_restore_ulp

.Lff_direct_round_compact_clear_low:
    and   r26, r31

.Lff_direct_round_compact_restore_ulp:
    com   r31
    inc   r31                   ; restore 1 << (n & 7)
    rjmp  .Lff_direct_round_decide_increment

.Lff_direct_round_compact_boundary:
    ; n is 8 or 16. The ULP is bit zero of the selected byte, and r0 contains
    ; the preceding byte whose top bit is the halfway bit. r1 is the OR of all
    ; discarded bytes, including r0.
    ldi   r31, 1
    clr   r30
    sbrc  r0, 7
    ori   r30, 0x02
    tst   r1
    breq  .Lff_direct_round_compact_boundary_no_discard
    ori   r30, 0x01
.Lff_direct_round_compact_boundary_no_discard:
    cp    r2, ONE
    breq  .Lff_direct_round_compact_boundary_mid
    clr   r27                   ; n == 16
.Lff_direct_round_compact_boundary_mid:
    clr   r26

.Lff_direct_round_decide_increment:
    ; No discarded fraction means every mode returns the masked value.
    sbrs  r30, 0
    rjmp  .Lff_direct_round_restore_sign

    in    r0, FF_DIRECT_CONTROL_IO
    tst   r0
    breq  .Lff_direct_round_restore_sign
    sbrc  r0, 1
    rjmp  .Lff_direct_round_high_mode_increment

    ; Mode 1: floor.
    brtc  .Lff_direct_round_restore_sign
    rjmp  .Lff_direct_round_apply_direct_ulp

.Lff_direct_round_high_mode_increment:
    sbrc  r0, 0
    rjmp  .Lff_direct_round_round_increment

    ; Mode 2: ceil.
    brts  .Lff_direct_round_restore_sign
    rjmp  .Lff_direct_round_apply_direct_ulp

.Lff_direct_round_round_increment:
    ; Mode 3: round halfway away from zero.
    sbrs  r30, 1
    rjmp  .Lff_direct_round_restore_sign

.Lff_direct_round_apply_direct_ulp:
    clr   r1
    tst   r2
    breq  .Lff_direct_round_add_low
    cp    r2, ONE
    breq  .Lff_direct_round_add_mid

.Lff_direct_round_add_high:
    add   r24, r31
    adc   r25, r1
    rjmp  .Lff_direct_round_restore_sign

.Lff_direct_round_add_mid:
    add   r27, r31
    adc   r24, r1
    adc   r25, r1
    rjmp  .Lff_direct_round_restore_sign

.Lff_direct_round_add_low:
    add   r26, r31
    adc   r27, r1
    adc   r24, r1
    adc   r25, r1

.Lff_direct_round_restore_sign:
    bld   r25, 7
    rjmp  .Lff_direct_round_finish

.Lff_direct_round_finish:
    clr   r2
    in    r30, FF_BRIDGE_META_IO
    rjmp  ff_store_q_result

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Embedded-libm typed bridges
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Binary qD,qS -> qD. The low descriptor nibble has ddss format.
; The destination bits directly choose the save class; no metadata write or
; post-helper destination decode is needed because each table row targets a
; destination-specific call/restore/writeback continuation.
ff_bridge_binary_q_to_q:
    sbrc  FF_BRIDGE_DESC, 3
    rjmp  .Lff_bridge_heavy_binary_high_dest

.Lff_bridge_heavy_binary_save_full:
    push  r18
    push  r19
    push  r20
    push  r21
    push  r22
    push  r23
    rjmp  .Lff_bridge_heavy_binary_saved

.Lff_bridge_heavy_binary_high_dest:
    sbrc  FF_BRIDGE_DESC, 2
    rjmp  .Lff_bridge_heavy_binary_save_q3

.Lff_bridge_heavy_binary_save_q2:
    push  r20
    push  r21
    push  r22
    push  r23
    rjmp  .Lff_bridge_heavy_binary_saved

.Lff_bridge_heavy_binary_save_q3:
    push  r18
    push  r19

.Lff_bridge_heavy_binary_saved:
    movw  r26, r30

    ; Multiply the ddss table index by five in AVR word-address space.
    mov   FF_BRIDGE_META, FF_BRIDGE_DESC
    andi  FF_BRIDGE_META, 0x0F
    ldi   r30, 5
    mul   FF_BRIDGE_META, r30
    ldi   r30, lo8(pm(ff_binary_marshal_table))
    ldi   r31, hi8(pm(ff_binary_marshal_table))
    add   r30, r0
    adc   r31, ZERO
    ijmp

; Emit one alias-safe binary marshalling slot. The four MOVW operations place
; qS in fplib operand B (r18-r21) and qD in operand A (r22-r25).
.macro emit_ff_binary_marshal label, target, d0, s0, d1, s1, d2, s2, d3, s3
\label:
    movw  \d0, \s0
    movw  \d1, \s1
    movw  \d2, \s2
    movw  \d3, \s3
    rjmp  \target
.Lff_binary_marshal_end_\@:
    .if (.Lff_binary_marshal_end_\@ - \label) != 10
        .error "FF binary marshal slot must occupy exactly five AVR words"
    .endif
.endm

ff_binary_marshal_table:
    emit_ff_binary_marshal .Lff_bin_q0_q0, ff_bridge_call_heavy_q0_result, r18, r8,  r20, r10, r22, r8,  r24, r10
    emit_ff_binary_marshal .Lff_bin_q0_q1, ff_bridge_call_heavy_q0_result, r18, r12, r20, r14, r22, r8,  r24, r10
    emit_ff_binary_marshal .Lff_bin_q0_q2, ff_bridge_call_heavy_q0_result, r20, r18, r18, r16, r22, r8,  r24, r10
    emit_ff_binary_marshal .Lff_bin_q0_q3, ff_bridge_call_heavy_q0_result, r18, r20, r20, r22, r22, r8,  r24, r10

    emit_ff_binary_marshal .Lff_bin_q1_q0, ff_bridge_call_heavy_q1_result, r18, r8,  r20, r10, r22, r12, r24, r14
    emit_ff_binary_marshal .Lff_bin_q1_q1, ff_bridge_call_heavy_q1_result, r18, r12, r20, r14, r22, r12, r24, r14
    emit_ff_binary_marshal .Lff_bin_q1_q2, ff_bridge_call_heavy_q1_result, r20, r18, r18, r16, r22, r12, r24, r14
    emit_ff_binary_marshal .Lff_bin_q1_q3, ff_bridge_call_heavy_q1_result, r18, r20, r20, r22, r22, r12, r24, r14

    emit_ff_binary_marshal .Lff_bin_q2_q0, ff_bridge_call_heavy_q2_result, r20, r10, r22, r16, r24, r18, r18, r8
    emit_ff_binary_marshal .Lff_bin_q2_q1, ff_bridge_call_heavy_q2_result, r20, r14, r22, r16, r24, r18, r18, r12
    emit_ff_binary_marshal .Lff_bin_q2_q2, ff_bridge_call_heavy_q2_result, r20, r18, r18, r16, r22, r16, r24, r20
    emit_ff_binary_marshal .Lff_bin_q2_q3, ff_bridge_call_heavy_q2_result, r24, r18, r18, r20, r20, r22, r22, r16

    emit_ff_binary_marshal .Lff_bin_q3_q0, ff_bridge_call_heavy_q3_result, r18, r8,  r24, r22, r22, r20, r20, r10
    emit_ff_binary_marshal .Lff_bin_q3_q1, ff_bridge_call_heavy_q3_result, r18, r12, r24, r22, r22, r20, r20, r14
    emit_ff_binary_marshal .Lff_bin_q3_q2, ff_bridge_call_heavy_q3_result, r24, r22, r22, r20, r20, r18, r18, r16
    emit_ff_binary_marshal .Lff_bin_q3_q3, ff_bridge_call_heavy_q3_result, r18, r20, r20, r22, r22, r18, r24, r20
ff_binary_marshal_table_end:
.if (ff_binary_marshal_table_end - ff_binary_marshal_table) != 160
    .error "FF binary marshal table must occupy exactly eighty AVR words"
.endif

; Unary qD -> qD SQRT uses the heavy helper class.
ff_bridge_unary_q_to_q:
    mov   FF_BRIDGE_META, FF_BRIDGE_DESC
    andi  FF_BRIDGE_META, 0x03
    out   FF_BRIDGE_META_IO, FF_BRIDGE_META
    clr   r1
    rjmp  ff_bridge_save_heavy_q_source

; qS -> qD conversions use the light helper class.
ff_bridge_q_to_q:
    mov   FF_BRIDGE_META, FF_BRIDGE_DESC
    lsr   FF_BRIDGE_META
    lsr   FF_BRIDGE_META
    andi  FF_BRIDGE_META, 0x03
    out   FF_BRIDGE_META_IO, FF_BRIDGE_META
    mov   r1, ONE
    rjmp  ff_bridge_save_light_q_source

; qS -> rD conversions use the light helper class.
ff_bridge_q_to_r16:
    mov   FF_BRIDGE_META, FF_BRIDGE_DESC
    swap  FF_BRIDGE_META
    andi  FF_BRIDGE_META, 0x07
    out   FF_BRIDGE_META_IO, FF_BRIDGE_META
    mov   r1, ONE
    lsl   r1                      ; result-kind 2: light r16
    rjmp  ff_bridge_save_light_q_source

ff_bridge_save_heavy_q_source:
    cpi   FF_BRIDGE_META, 2
    breq  .Lff_bridge_heavy_q_source_save_q2
    brsh  .Lff_bridge_heavy_q_source_save_q3

.Lff_bridge_heavy_q_source_save_full:
    push  r18
    push  r19
    push  r20
    push  r21
    push  r22
    push  r23
    rjmp  .Lff_bridge_q_source_saved

.Lff_bridge_heavy_q_source_save_q2:
    push  r20
    push  r21
    push  r22
    push  r23
    rjmp  .Lff_bridge_q_source_saved

.Lff_bridge_heavy_q_source_save_q3:
    push  r18
    push  r19
    rjmp  .Lff_bridge_q_source_saved

ff_bridge_save_light_q_source:
    ; r1 bit 1 selects r16 result metadata; otherwise metadata is qD.
    sbrc  r1, 1
    rjmp  .Lff_bridge_light_q_source_check_r16
    cpi   FF_BRIDGE_META, 3
    breq  .Lff_bridge_q_source_saved
    push  r22
    push  r23
    rjmp  .Lff_bridge_q_source_saved

.Lff_bridge_light_q_source_check_r16:
    cpi   FF_BRIDGE_META, 7
    breq  .Lff_bridge_q_source_saved
    push  r22
    push  r23

.Lff_bridge_q_source_saved:
    movw  r26, r30
    andi  FF_BRIDGE_DESC, 0x03
    sbrc  FF_BRIDGE_DESC, 1
    rjmp  .Lff_q_source_high
    sbrc  FF_BRIDGE_DESC, 0
    rjmp  .Lff_q_source_q1

.Lff_q_source_q0:
    movw  r22, r8
    movw  r24, r10
    rjmp  ff_bridge_q_source_ready

.Lff_q_source_q1:
    movw  r22, r12
    movw  r24, r14
    rjmp  ff_bridge_q_source_ready

.Lff_q_source_high:
    sbrc  FF_BRIDGE_DESC, 0
    rjmp  .Lff_q_source_q3

.Lff_q_source_q2:
    movw  r22, r16
    movw  r24, r18
    rjmp  ff_bridge_q_source_ready

.Lff_q_source_q3:
    movw  r24, r22
    movw  r22, r20

ff_bridge_q_source_ready:
    tst   r1
    brne  .Lff_bridge_q_source_light_result
    rjmp  ff_bridge_call_heavy_q_result
.Lff_bridge_q_source_light_result:
    sbrc  r1, 1
    rjmp  ff_bridge_call_light_r16_result
    rjmp  ff_bridge_call_light_q_result

; Signed/unsigned rS -> qD conversions retain the generic source decoder.
ff_bridge_r16_to_q_s:
    mov   FF_BRIDGE_META, FF_BRIDGE_DESC
    andi  FF_BRIDGE_META, 0x03
    out   FF_BRIDGE_META_IO, FF_BRIDGE_META
    clr   r1
    rjmp  ff_bridge_save_light_r16_source

ff_bridge_r16_to_q_u:
    mov   FF_BRIDGE_META, FF_BRIDGE_DESC
    andi  FF_BRIDGE_META, 0x03
    out   FF_BRIDGE_META_IO, FF_BRIDGE_META
    mov   r1, ONE

ff_bridge_save_light_r16_source:
    cpi   FF_BRIDGE_META, 3
    breq  .Lff_bridge_light_r16_source_saved
    push  r22
    push  r23
.Lff_bridge_light_r16_source_saved:
    sbrc  r1, 0
    rjmp  ff_bridge_marshal_r16_u

ff_bridge_marshal_r16_s:
    mov   FF_BRIDGE_INDEX, FF_BRIDGE_DESC
    swap  FF_BRIDGE_INDEX
    andi  FF_BRIDGE_INDEX, 0x07
    lsl   FF_BRIDGE_INDEX
    subi  FF_BRIDGE_INDEX, -9
    clr   FF_BRIDGE_XH
    ld    r23, X
    ld    r22, -X
    mov   r24, r23
    lsl   r24
    sbc   r24, r24
    mov   r25, r24
    movw  r26, r30
    rjmp  ff_bridge_call_light_q_result

ff_bridge_marshal_r16_u:
    mov   FF_BRIDGE_INDEX, FF_BRIDGE_DESC
    swap  FF_BRIDGE_INDEX
    andi  FF_BRIDGE_INDEX, 0x07
    lsl   FF_BRIDGE_INDEX
    subi  FF_BRIDGE_INDEX, -9
    clr   FF_BRIDGE_XH
    ld    r23, X
    ld    r22, -X
    clr   r24
    clr   r25
    movw  r26, r30
    rjmp  ff_bridge_call_light_q_result

; Binary helpers use destination-specific call/restore/writeback paths.
; This removes both destination decodes from the binary hot path while still
; omitting destination-owned saves for q2 and q3.
ff_bridge_call_heavy_q0_result:
    movw  r30, r26
    icall
    movw  r8, r22
    movw  r10, r24
    pop   r23
    pop   r22
    pop   r21
    pop   r20
    pop   r19
    pop   r18
    rjmp  ff_cluster_tail_18

ff_bridge_call_heavy_q1_result:
    movw  r30, r26
    icall
    movw  r12, r22
    movw  r14, r24
    pop   r23
    pop   r22
    pop   r21
    pop   r20
    pop   r19
    pop   r18
    rjmp  ff_cluster_tail_18

ff_bridge_call_heavy_q2_result:
    movw  r30, r26
    icall
    movw  r16, r22
    movw  r18, r24
    pop   r23
    pop   r22
    pop   r21
    pop   r20
    rjmp  ff_cluster_tail_18

ff_bridge_call_heavy_q3_result:
    movw  r30, r26
    icall
    movw  r20, r22
    movw  r22, r24
    pop   r19
    pop   r18
    rjmp  ff_cluster_tail_18

; Unary heavy helpers (currently FSQRT) retain the metadata-selected finish.
ff_bridge_call_heavy_q_result:
    movw  r30, r26
    icall
    in    r30, FF_BRIDGE_META_IO
    movw  r26, r22

    cpi   r30, 2
    breq  .Lff_bridge_restore_heavy_q2
    brsh  .Lff_bridge_restore_heavy_q3

.Lff_bridge_restore_heavy_full:
    pop   r23
    pop   r22
    pop   r21
    pop   r20
    pop   r19
    pop   r18
    rjmp  ff_store_q_result

.Lff_bridge_restore_heavy_q2:
    pop   r23
    pop   r22
    pop   r21
    pop   r20
    rjmp  ff_store_q_result

.Lff_bridge_restore_heavy_q3:
    pop   r19
    pop   r18
    rjmp  ff_store_q_result

; Light q helper result: only r22-r23 need restoration, except for q3.
ff_bridge_call_light_q_result:
    movw  r30, r26
    icall
    in    r30, FF_BRIDGE_META_IO
    movw  r26, r22
    cpi   r30, 3
    breq  ff_store_q_result
    pop   r23
    pop   r22

; Canonical q result is low r26:r27, high r24:r25; r30 is qD.
ff_store_q_result:
    sbrc  r30, 1
    rjmp  .Lff_store_q_high
    sbrc  r30, 0
    rjmp  .Lff_store_q1

.Lff_store_q0:
    movw  r8, r26
    movw  r10, r24

ff_cluster_tail_18:
    dispatch

.Lff_store_q1:
    movw  r12, r26
    movw  r14, r24
    rjmp  ff_cluster_tail_18

.Lff_store_q_high:
    sbrc  r30, 0
    rjmp  .Lff_store_q3

.Lff_store_q2:
    movw  r16, r26
    movw  r18, r24
    rjmp  ff_cluster_tail_18

.Lff_store_q3:
    movw  r20, r26
    movw  r22, r24
    rjmp  ff_cluster_tail_18

; Light r16 helper result: generic rD address/store is retained.
ff_bridge_call_light_r16_result:
    movw  r30, r26
    icall
    in    r30, FF_BRIDGE_META_IO
    movw  r24, r22
    cpi   r30, 7
    breq  ff_bridge_store_r16
    pop   r23
    pop   r22

ff_bridge_store_r16:
    andi  r30, 0x07
    lsl   r30
    subi  r30, -8
    clr   r31
    st    Z+, r24
    st    Z,  r25
    rjmp  ff_cluster_tail_18


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Embedded avr-libc/libm-derived binary32 routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; The instruction bodies below were transcribed from the exact avr-libc/libm
; and fplib closure present in interp(1).lst. Address-derived local labels keep
; cross-routine control flow unambiguous. Every original in-range absolute
; CALL/JMP has been manually relaxed to RCALL/RJMP; linker relaxation remains
; disabled so the interpreter's fixed-layout dispatch structures are untouched.
;
; Public entry labels retain the names used by the FF helper tables. The block
; includes all shared packing, splitting, normalization, comparison, conversion,
; arithmetic, rounding, and square-root routines reachable from those entries.
; ZERO supplies constant-zero operands; native r1 is free for MUL results and
; sqrtf trial-bit state and is not required to be zero at routine boundaries.

.p2align 1
__subsf3:
    subi  r21, 0x80
__addsf3:
    eor   r27, r27
    eor   r26, r26
    rcall __addsf3x
    rjmp  __fp_round
.L__addsf3_special_cases:
    rcall __fp_pscA
    brcs  .L__addsf3_nan
    rcall __fp_pscB
    brcs  .L__addsf3_nan
    brne  .L__addsf3_infinity
    cpi   r25, 0xFF
    brne  .L__addsf3_infinity_b
    brtc  .L__addsf3_infinity
.L__addsf3_nan:
    rjmp  __fp_nan
.L__addsf3_infinity_b:
    brtc  .L__addsf3_infinity
    com   r30
.L__addsf3_infinity:
    bst   r30, 7
    rjmp  __fp_inf
__addsf3x:
    mov   r30, r25
    rcall __fp_split3
    brcs  .L__addsf3_special_cases
    cp    r27, r26
    cpc   r22, r18
    cpc   r23, r19
    cpc   r24, r20
    cpc   r25, r21
    brcs  .L__addsf3x_swap_operands
    brne  .L__addsf3x_align_mantissas
    brtc  .L__addsf3x_add_mantissas
    rjmp  __fp_zero
.L__addsf3x_swap_operands:
    brtc  .L__addsf3x_swap_values
    com   r30
.L__addsf3x_swap_values:
    mov   r0, r27
    mov   r27, r26
    mov   r26, r0
    movw  r0, r22
    movw  r22, r18
    movw  r18, r0
    movw  r0, r24
    movw  r24, r20
    movw  r20, r0
.L__addsf3x_align_mantissas:
    eor   r31, r31
    sub   r21, r25
.L__addsf3x_align_bytes:
    breq  .L__addsf3x_combine_mantissas
    cpi   r21, 0xF9
    brcc  .L__addsf3x_align_bits
    cpi   r21, 0xE0
    brcs  .L__addsf3x_pack_result
    cp    ZERO, r26
    sbci  r31, 0x00
    mov   r26, r18
    mov   r18, r19
    mov   r19, r20
    eor   r20, r20
    subi  r21, 0xF8
    rjmp  .L__addsf3x_align_bytes
.L__addsf3x_align_bits:
    lsr   r20
    ror   r19
    ror   r18
    ror   r26
    sbci  r31, 0x00
    inc   r21
    brne  .L__addsf3x_align_bits
.L__addsf3x_combine_mantissas:
    brtc  .L__addsf3x_add_mantissas
    cp    ZERO, r31
    sbc   r27, r26
    sbc   r22, r18
    sbc   r23, r19
    sbc   r24, r20
    brmi  .L__addsf3x_pack_result
.L__addsf3x_normalize_difference:
    subi  r25, 0x01
    breq  .L__addsf3x_increment_exponent
    add   r31, r31
    adc   r27, r27
    adc   r22, r22
    adc   r23, r23
    adc   r24, r24
    brpl  .L__addsf3x_normalize_difference
    rjmp  .L__addsf3x_pack_result
.L__addsf3x_add_mantissas:
    add   r27, r26
    adc   r22, r18
    adc   r23, r19
    adc   r24, r20
    brcc  .L__addsf3x_pack_result
    ror   r24
    ror   r23
    ror   r22
    ror   r27
    ror   r31
    cpi   r25, 0xFE
    brcs  .L__addsf3x_increment_exponent
    rjmp  .L__addsf3_infinity
.L__addsf3x_increment_exponent:
    inc   r25
.L__addsf3x_pack_result:
    add   r24, r24
    brcs  .L__addsf3x_apply_sign
    eor   r25, r25
.L__addsf3x_apply_sign:
    add   r30, r30
    ror   r25
    ror   r24
    ret
__divsf3:
    rcall __divsf3x
    rjmp  __fp_round
.L__divsf3_special_cases:
    rcall __fp_pscB
    brcs  .L__divsf3_nan
    rcall __fp_pscA
    brcs  .L__divsf3_nan
    brne  .L__divsf3_szero
    cpi   r21, 0xFF
    breq  .L__divsf3_nan
.L__divsf3_infinity:
    rjmp  __fp_inf
.L__divsf3_zero_numerator:
    cpse  r21, ZERO
.L__divsf3_szero:
    rjmp  __fp_szero
.L__divsf3_nan:
    rjmp  __fp_nan
__divsf3x:
    rcall __fp_split3
    brcs  .L__divsf3_special_cases
__divsf3_pse:
    and   r25, r25
    breq  .L__divsf3_zero_numerator
    and   r21, r21
    breq  .L__divsf3_infinity
    sub   r25, r21
    sbc   r21, r21
    eor   r27, r27
    eor   r26, r26
.L__divsf3_normalize_divisor:
    cp    r22, r18
    cpc   r23, r19
    cpc   r24, r20
    brcs  .L__divsf3_begin_quotient
    subi  r25, 0xFF
    sbci  r21, 0xFF
    add   r18, r18
    adc   r19, r19
    adc   r20, r20
    adc   r26, r26
    breq  .L__divsf3_normalize_divisor
.L__divsf3_begin_quotient:
    rcall .L__divsf3_divide_byte
    mov   r0, r30
    brmi  .L__divsf3_build_remaining_quotient
.L__divsf3_build_leading_quotient:
    ldi   r30, 0x80
    rcall .L__divsf3_divide_bit
    subi  r25, 0x01
    sbci  r21, 0x00
    lsr   r30
    adc   r0, r0
    brpl  .L__divsf3_build_leading_quotient
.L__divsf3_build_remaining_quotient:
    rcall .L__divsf3_divide_byte
    mov   r31, r30
    rcall .L__divsf3_divide_byte
    add   r22, r22
    adc   r23, r23
    adc   r24, r24
    adc   r27, r27
    cp    r18, r22
    cpc   r19, r23
    cpc   r20, r24
    cpc   r26, r27
    ldi   r27, 0x80
    breq  .L__divsf3_finish_quotient
    sbc   r27, r27
.L__divsf3_finish_quotient:
    mov   r24, r0
    movw  r22, r30
    eor   r31, r31
    subi  r25, 0x83
    sbci  r21, 0xFF
    brmi  .L__divsf3_prepare_denormal
    cpi   r25, 0xFE
    cpc   r21, ZERO
    brcs  .L__divsf3_pack_result
    rjmp  __fp_inf
.L__divsf3_underflow_zero:
    rjmp  __fp_szero
.L__divsf3_prepare_denormal:
    cpi   r21, 0xFF
    brlt  .L__divsf3_underflow_zero
    cpi   r25, 0xE8
    brlt  .L__divsf3_underflow_zero
.L__divsf3_denormalize:
    lsr   r24
    ror   r23
    ror   r22
    ror   r27
    ror   r31
    subi  r25, 0xFF
    brne  .L__divsf3_denormalize
.L__divsf3_pack_result:
    add   r24, r24
    adc   r25, ZERO
    lsr   r25
    ror   r24
    bld   r25, 7
    ret
.L__divsf3_divide_byte:
    ldi   r30, 0x01
.L__divsf3_divide_bit:
    add   r22, r22
    adc   r23, r23
    adc   r24, r24
    adc   r27, r27
    cp    r22, r18
    cpc   r23, r19
    cpc   r24, r20
    cpc   r27, r26
    brcs  .L__divsf3_divide_emit_bit
    sub   r22, r18
    sbc   r23, r19
    sbc   r24, r20
    sbc   r27, r26
.L__divsf3_divide_emit_bit:
    adc   r30, r30
    brcc  .L__divsf3_divide_bit
    com   r30
    ret
__fixsfsi:
    rcall __fixunssfsi
    set
    cpse  r27, ZERO
    rjmp  __fp_szero
    ret
__fixunssfsi:
    rcall __fp_splitA
    brcs  .L__fixunssfsi_error
    subi  r25, 0x7F
    brcs  .L__fixunssfsi_zero
    mov   r27, r25
    eor   r25, r25
    subi  r27, 0x17
    brcs  .L__fixunssfsi_select_right_shift
    breq  .L__fixunssfsi_apply_sign
.L__fixunssfsi_shift_left:
    add   r22, r22
    adc   r23, r23
    adc   r24, r24
    adc   r25, r25
    brmi  .L__fixunssfsi_check_signed_overflow
    dec   r27
    brne  .L__fixunssfsi_shift_left
    rjmp  .L__fixunssfsi_apply_sign
.L__fixunssfsi_check_signed_overflow:
    cpi   r27, 0x01
    breq  .L__fixunssfsi_apply_sign
.L__fixunssfsi_error:
    rcall __fp_zero
    ldi   r27, 0x01
    ret
.L__fixunssfsi_zero:
    rjmp  __fp_zero
.L__fixunssfsi_shift_right_byte:
    mov   r22, r23
    mov   r23, r24
    eor   r24, r24
    subi  r27, 0xF8
    breq  .L__fixunssfsi_apply_sign
.L__fixunssfsi_select_right_shift:
    cpi   r27, 0xF9
    brlt  .L__fixunssfsi_shift_right_byte
.L__fixunssfsi_shift_right_bit:
    lsr   r24
    ror   r23
    ror   r22
    inc   r27
    brne  .L__fixunssfsi_shift_right_bit
.L__fixunssfsi_apply_sign:
    brtc  .L__fixunssfsi_return
    com   r25
    com   r24
    com   r23
    neg   r22
    sbci  r23, 0xFF
    sbci  r24, 0xFF
    sbci  r25, 0xFF
.L__fixunssfsi_return:
    ret
__floatunsisf:
    clt
    rjmp  .L__floatsisf_magnitude_ready
__floatsisf:
    bst   r25, 7
    brtc  .L__floatsisf_magnitude_ready
    com   r25
    com   r24
    com   r23
    neg   r22
    sbci  r23, 0xFF
    sbci  r24, 0xFF
    sbci  r25, 0xFF
.L__floatsisf_magnitude_ready:
    and   r25, r25
    breq  .L__floatsisf_check_middle_byte
    mov   r31, r25
    ldi   r25, 0x96
    eor   r27, r27
.L__floatsisf_shift_right:
    inc   r25
    lsr   r31
    ror   r24
    ror   r23
    ror   r22
    ror   r27
    cpse  r31, ZERO
    rjmp  .L__floatsisf_shift_right
    brpl  .L__floatsisf_pack
    add   r27, r27
    brne  .L__floatsisf_round_up
    sbrs  r22, 0
    rjmp  .L__floatsisf_pack
.L__floatsisf_round_up:
    subi  r22, 0xFF
    sbci  r23, 0xFF
    sbci  r24, 0xFF
    sbci  r25, 0xFF
    rjmp  .L__floatsisf_pack
.L__floatsisf_check_middle_byte:
    and   r24, r24
    breq  .L__floatsisf_check_low_word
    ldi   r25, 0x96
    rjmp  .L__floatsisf_continue_left_shift
.L__floatsisf_check_low_word:
    and   r23, r23
    breq  .L__floatsisf_check_low_byte
    ldi   r25, 0x8E
    mov   r24, r23
    mov   r23, r22
    rjmp  .L__floatsisf_prepare_left_shift
.L__floatsisf_check_low_byte:
    and   r22, r22
    breq  .L__floatsisf_return
    ldi   r25, 0x86
    mov   r24, r22
    ldi   r23, 0x00
.L__floatsisf_prepare_left_shift:
    ldi   r22, 0x00
    brmi  .L__floatsisf_pack
.L__floatsisf_shift_left:
    dec   r25
    add   r22, r22
    adc   r23, r23
    adc   r24, r24
.L__floatsisf_continue_left_shift:
    brpl  .L__floatsisf_shift_left
.L__floatsisf_pack:
    add   r24, r24
    lsr   r25
    ror   r24
    bld   r25, 7
.L__floatsisf_return:
    ret
__fp_inf:
    bld   r25, 7
    ori   r25, 0x7F
    ldi   r24, 0x80
    ldi   r23, 0x00
    ldi   r22, 0x00
    ret
__fp_mpack:
    cpi   r25, 0xFF
    breq  .L__fp_mpack_pack_common
__fp_mpack_finite:
    subi  r25, 0x01
    brcc  .L__fp_mpack_pack_common
    ror   r24
    ror   r23
    ror   r22
    ror   r27
.L__fp_mpack_pack_common:
    add   r24, r24
    adc   r25, ZERO
    lsr   r25
    ror   r24
    bld   r25, 7
    ret
__fp_nan:
    ldi   r25, 0xFF
    ldi   r24, 0xC0
    ret
__fp_pscA:
    eor   r0, r0
    dec   r0
    cp    ZERO, r22
    cpc   ZERO, r23
    cpc   ZERO, r24
    cpc   r0, r25
    ret
__fp_pscB:
    eor   r0, r0
    dec   r0
    cp    ZERO, r18
    cpc   ZERO, r19
    cpc   ZERO, r20
    cpc   r0, r21
    ret
__fp_round:
    mov   r0, r25
    inc   r0
    add   r0, r0
    brne  .L__fp_round_check_rounding
    and   r24, r24
    brmi  .L__fp_round_return
.L__fp_round_check_rounding:
    add   r27, r27
    brcc  .L__fp_round_return
    or    r27, r31
    brne  .L__fp_round_increment
    sbrs  r22, 0
    rjmp  .L__fp_round_return
.L__fp_round_increment:
    subi  r22, 0xFF
    sbci  r23, 0xFF
    sbci  r24, 0xFF
    sbci  r25, 0xFF
.L__fp_round_return:
    ret
__fp_split3:
    sbrc  r21, 7
    subi  r25, 0x80
    add   r20, r20
    adc   r21, r21
    breq  .L__fp_split3_b_zero_or_subnormal
    cpi   r21, 0xFF
    breq  .L__fp_split3_b_nonfinite
.L__fp_split3_restore_b_mantissa:
    ror   r20
__fp_splitA:
    add   r24, r24
    bst   r25, 7
    adc   r25, r25
    breq  .L__fp_splitA_zero_or_subnormal
    cpi   r25, 0xFF
    breq  .L__fp_splitA_nonfinite
.L__fp_splitA_restore_mantissa:
    ror   r24
    ret
.L__fp_split3_b_zero_or_subnormal:
    cp    ZERO, r18
    cpc   ZERO, r19
    cpc   ZERO, r20
    adc   r21, r21
    rjmp  .L__fp_split3_restore_b_mantissa
.L__fp_split3_b_nonfinite:
    lsr   r20
    rcall __fp_splitA
    rjmp  .L__fp_splitA_return_nonfinite
.L__fp_splitA_zero_or_subnormal:
    cp    ZERO, r22
    cpc   ZERO, r23
    cpc   ZERO, r24
    adc   r25, r25
    rjmp  .L__fp_splitA_restore_mantissa
.L__fp_splitA_nonfinite:
    lsr   r24
    cpc   r23, ZERO
    cpc   r22, ZERO
.L__fp_splitA_return_nonfinite:
    sec
    ret
__fp_zero:
    clt
__fp_szero:
    eor   r27, r27
    eor   r22, r22
    eor   r23, r23
    movw  r24, r22
    bld   r25, 7
    ret
__mulsf3:
    rcall __mulsf3x
    rjmp  __fp_round
.L__mulsf3_special_cases:
    rcall __fp_pscA
    brcs  .L__mulsf3_nan
    rcall __fp_pscB
    brcs  .L__mulsf3_nan
    and   r25, r21
    breq  .L__mulsf3_nan
    rjmp  __fp_inf
.L__mulsf3_nan:
    rjmp  __fp_nan
.L__mulsf3_szero:
    rjmp  __fp_szero
__mulsf3x:
    rcall __fp_split3
    brcs  .L__mulsf3_special_cases
__mulsf3_pse:
    mul   r25, r21
    breq  .L__mulsf3_szero
    add   r25, r21
    ldi   r21, 0x00
    adc   r21, r21
    mul   r22, r18
    movw  r30, r0
    mul   r23, r18
    eor   r27, r27
    add   r31, r0
    adc   r27, r1
    mul   r22, r19
    eor   r26, r26
    add   r31, r0
    adc   r27, r1
    adc   r26, r26
    mul   r22, r20
    eor   r22, r22
    add   r27, r0
    adc   r26, r1
    adc   r22, r22
    mul   r24, r18
    eor   r18, r18
    add   r27, r0
    adc   r26, r1
    adc   r22, r18
    mul   r23, r19
    add   r27, r0
    adc   r26, r1
    adc   r22, r18
    mul   r24, r19
    add   r26, r0
    adc   r22, r1
    adc   r18, r18
    mul   r23, r20
    eor   r19, r19
    add   r26, r0
    adc   r22, r1
    adc   r18, r19
    mul   r24, r20
    add   r22, r0
    adc   r18, r1
    mov   r24, r18
    mov   r23, r22
    mov   r22, r26
    subi  r25, 0x7F
    sbci  r21, 0x00
    brmi  .L__mulsf3_prepare_denormal
    breq  .L__mulsf3_pack_result
.L__mulsf3_normalize:
    and   r24, r24
    brmi  .L__mulsf3_check_overflow
    add   r30, r30
    adc   r31, r31
    adc   r27, r27
    adc   r22, r22
    adc   r23, r23
    adc   r24, r24
    subi  r25, 0x01
    sbci  r21, 0x00
    brne  .L__mulsf3_normalize
.L__mulsf3_check_overflow:
    cpi   r25, 0xFE
    cpc   r21, ZERO
    brcs  .L__mulsf3_pack_result
    rjmp  __fp_inf
.L__mulsf3_underflow_zero:
    rjmp  __fp_szero
.L__mulsf3_prepare_denormal:
    cpi   r21, 0xFF
    brlt  .L__mulsf3_underflow_zero
    cpi   r25, 0xE8
    brlt  .L__mulsf3_underflow_zero
.L__mulsf3_denormalize:
    lsr   r24
    ror   r23
    ror   r22
    ror   r27
    ror   r31
    ror   r30
    subi  r25, 0xFF
    brne  .L__mulsf3_denormalize
.L__mulsf3_pack_result:
    or    r31, r30
    add   r24, r24
    adc   r25, ZERO
    lsr   r25
    ror   r24
    bld   r25, 7
    ret
.L_sqrtf_nonfinite:
    brne  .L_sqrtf_pack
    brtc  .L_sqrtf_pack
.L_sqrtf_nan:
    rjmp  __fp_nan
.L_sqrtf_pack:
    rjmp  __fp_mpack
sqrt:
sqrtf:
    rcall __fp_splitA
    brcs  .L_sqrtf_nonfinite
    and   r25, r25
    breq  .L_sqrtf_pack
    brts  .L_sqrtf_nan
    subi  r25, 0x7F
    sbc   r21, r21
    sbrs  r24, 7
    rcall __fp_norm2
    eor   r0, r0
    mov   r1, ZERO
    ldi   r26, 0x60
    ldi   r20, 0xA0
    movw  r18, r0
    subi  r24, 0x80
    lsr   r21
    ror   r25
    brcc  .L_sqrtf_compare_trial
    subi  r24, 0xC0
.L_sqrtf_digit_loop:
    add   r22, r22
    adc   r23, r23
    adc   r24, r24
    brcs  .L_sqrtf_accept_trial
.L_sqrtf_compare_trial:
    cp    r18, r22
    cpc   r19, r23
    cpc   r20, r24
    brcc  .L_sqrtf_advance_digit
.L_sqrtf_accept_trial:
    sub   r22, r18
    sbc   r23, r19
    sbc   r24, r20
    or    r18, r0
    or    r19, r1
    or    r20, r26
.L_sqrtf_advance_digit:
    lsr   r26
    ror   r1
    ror   r0
    eor   r18, r0
    eor   r19, r1
    eor   r20, r26
    brcc  .L_sqrtf_digit_loop
.L_sqrtf_rounding_loop:
    add   r22, r22
    adc   r23, r23
    adc   r24, r24
    brcs  .L_sqrtf_accept_rounding_bit
    cp    r18, r22
    cpc   r19, r23
    cpc   r20, r24
    brcc  .L_sqrtf_advance_rounding
.L_sqrtf_accept_rounding_bit:
    sbc   r22, r18
    sbc   r23, r19
    sbc   r24, r20
    add   r18, r0
    adc   r19, r1
    adc   r20, r1
.L_sqrtf_advance_rounding:
    com   r26
    brne  .L_sqrtf_rounding_loop
    movw  r22, r18
    mov   r24, r20
    subi  r25, 0x81
    add   r24, r24
    lsr   r25
    ror   r24
    ret
__fp_norm2:
    subi  r25, 0x01
    sbci  r21, 0x00
    add   r22, r22
    adc   r23, r23
    adc   r24, r24
    brpl  __fp_norm2
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Additional avr-libc/libm-derived transcendental and remainder routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Calling convention within this block is the avr-libc fplib convention:
;   A/result = r25:r24:r23:r22, extension r27
;   B        = r21:r20:r19:r18, extension r26
;
; Constant tables remain in .text so ordinary LPM byte addresses are valid on
; the ATmega32U4. Cross-routine transfers start in absolute form and are
; manually relaxed after final layout validation.

; float squaref(float A)
squaref:
    movw  r18, r22
    movw  r20, r24
    rjmp   __mulsf3

; float __inversef(float A) = 1.0f / A
__inversef:
    movw  r18, r22
    movw  r20, r24
    ldi   r22, 0x00
    ldi   r23, 0x00
    ldi   r24, 0x80
    ldi   r25, 0x3f
    rjmp   __divsf3

; Evaluate a table-driven polynomial in A. The first table byte is the degree;
; the leading coefficient is binary32 and each remaining coefficient is the
; five-byte internal fplib format.
__fp_powser:
    push  r29
    push  r28
    push  r17
    push  r16
    push  r15
    push  r14
    push  r13
    movw  r14, r22
    movw  r16, r24
    set
    rjmp  .L__fp_powser_load_coefficient

.L__fp_powser_capture_degree:
    mov   r13, r26

.L__fp_powser_multiply_loop:
    movw  r28, r30
    rcall  __mulsf3x
    movw  r30, r28
    clt

.L__fp_powser_load_coefficient:
    lpm   r26, Z+
    lpm   r18, Z+
    lpm   r19, Z+
    lpm   r20, Z+
    lpm   r21, Z+
    brts  .L__fp_powser_capture_degree

    movw  r28, r30
    rcall  __addsf3x
    movw  r30, r28
    movw  r18, r14
    movw  r20, r16
    dec   r13
    brne  .L__fp_powser_multiply_loop

    pop   r13
    pop   r14
    pop   r15
    pop   r16
    pop   r17
    pop   r28
    pop   r29
    ret

; Evaluate an odd-power polynomial and return a rounded binary32 result.
__fp_powsodd:
    push  r25
    push  r24
    push  r23
    push  r22
    push  r31
    push  r30
    movw  r18, r22
    movw  r20, r24
    rcall  __mulsf3
    pop   r30
    pop   r31
    rcall  __fp_powser
    pop   r18
    pop   r19
    pop   r20
    pop   r21
    rjmp   __mulsf3

; Reduce |A| modulo pi/2. Returns the five-byte internal remainder and the low
; quotient byte in r30.
__fp_rempio2:
    rcall  __fp_splitA
    brcc  .L__fp_rempio2_finite
    rjmp   __fp_nan

.L__fp_rempio2_finite:
    clt
    ldi   r30, 0
    clr   r27
    subi  r25, 0x7f
    brlo  .L__fp_rempio2_pack
    ldi   r18, 0xda
    ldi   r19, 0x0f
    ldi   r20, 0xc9
    rjmp  .L__fp_rempio2_compare

.L__fp_rempio2_loop:
    lsl   r30
    lsl   r27
    rol   r22
    rol   r23
    rol   r24
    brcs  .L__fp_rempio2_subtract

.L__fp_rempio2_compare:
    cpi   r27, 0xa2
    cpc   r22, r18
    cpc   r23, r19
    cpc   r24, r20
    brlo  .L__fp_rempio2_advance

.L__fp_rempio2_subtract:
    subi  r27, 0xa2
    sbc   r22, r18
    sbc   r23, r19
    sbc   r24, r20
    inc   r30

.L__fp_rempio2_advance:
    dec   r25
    brpl  .L__fp_rempio2_loop
    cpi   r24, 0x80
    brsh  .L__fp_rempio2_pack

.L__fp_rempio2_normalize:
    dec   r25
    lsl   r27
    rol   r22
    rol   r23
    rol   r24
    brpl  .L__fp_rempio2_normalize

.L__fp_rempio2_pack:
    sbci  r25, 0x80
    rjmp   __fp_mpack_finite

; Shared sine/cosine kernel. r30 contains the reduced quadrant number.
__fp_sinus:
    push  r30
    sbrs  r30, 0
    rjmp  .L__fp_sinus_round_remainder
    ldi   r26, 0xa2
    ldi   r18, 0xda
    ldi   r19, 0x0f
    ldi   r20, 0xc9
    ldi   r21, 0xbf
    rcall  __addsf3x

.L__fp_sinus_round_remainder:
    rcall  __fp_round
    pop   r0
    inc   r0
    sbrc  r0, 1
    subi  r25, 0x80
    ldi   r30, lo8(sinf_coefficients)
    ldi   r31, hi8(sinf_coefficients)
    rjmp   __fp_powsodd

; float sinf(float A)
sinf:
    push  r25
    rcall  __fp_rempio2
    pop   r0
    sbrc  r0, 7
    subi  r30, -2
    rjmp   __fp_sinus

; float cosf(float A)
cosf:
    rcall  __fp_rempio2
    inc   r30
    rjmp   __fp_sinus

; float atanf(float A)
atanf:
    push  r29
    clr   r29
    mov   r27, r25
    andi  r27, 0x7f
    ldi   r20, 0x80
    ldi   r21, 0x3f
    cp    ZERO, r22
    cpc   ZERO, r23
    cpc   r20, r24
    cpc   r21, r27
    brsh  .Latanf_reduced
    mov   r29, r25
    rcall  __inversef

.Latanf_reduced:
    push  r25
    push  r24
    push  r23
    push  r22
    rcall  squaref
    ldi   r30, lo8(atanf_coefficients)
    ldi   r31, hi8(atanf_coefficients)
    rcall  __fp_powser
    rcall  __fp_round
    pop   r18
    pop   r19
    pop   r20
    pop   r21
    rcall  __mulsf3x
    tst   r29
    breq  .Latanf_finish
    subi  r25, 0x80
    ldi   r26, 0xa2
    ldi   r18, 0xda
    ldi   r19, 0x0f
    ldi   r20, 0xc9
    ldi   r21, 0x3f
    andi  r29, 0x80
    eor   r21, r29
    rcall  __addsf3x

.Latanf_finish:
    pop   r29
    rjmp   __fp_round

; float atan2f(float y=A, float x=B)
atan2f:
    mov   r30, r25
    andi  r30, 0x80
    rcall  __fp_split3
    brcc  .Latan2f_operands_finite
    rjmp  .Latan2f_nonfinite

.Latan2f_operands_finite:
    mov   r0, r25
    or    r0, r21
    breq  .Latan2f_zero_result

.Latan2f_compare_magnitudes:
    cp    r18, r22
    cpc   r19, r23
    cpc   r20, r24
    cpc   r21, r25
    brlo  .Latan2f_swap_operands

    mov   r0, r30
    bld   r0, 7
    eor   r30, r0
    breq  .Latan2f_divide
    eor   r30, r0
    ori   r30, 0x40
    rjmp  .Latan2f_divide

.Latan2f_swap_operands:
    ori   r30, 0x3f
    bld   r0, 7
    com   r0
    bst   r0, 7
    movw  r26, r22
    movw  r22, r18
    movw  r18, r26
    movw  r26, r24
    movw  r24, r20
    movw  r20, r26

.Latan2f_divide:
    push  r30
    rcall  __divsf3_pse
    rcall  __fp_round
    rcall  atanf
    pop   r21
    tst   r21
    breq  .Latan2f_return
    ldi   r18, 0xdb
    ldi   r19, 0x0f
    ldi   r20, 0x49
    sbrc  r21, 0
    ldi   r20, 0xc9
    rjmp   __addsf3

.Latan2f_return:
    ret

.Latan2f_nonfinite:
    rcall  __fp_pscA
    brcs  .Latan2f_nan_result
    ldi   r24, 0x80
    ldi   r25, 0x01
    brne  .Latan2f_nonfinite_a_ready
    ldi   r25, 0xfe

.Latan2f_nonfinite_a_ready:
    rcall  __fp_pscB
    brcs  .Latan2f_nan_result
    ldi   r20, 0x80
    ldi   r21, 0x01
    brne  .Latan2f_compare_magnitudes
    ldi   r21, 0xfe
    rjmp  .Latan2f_compare_magnitudes

.Latan2f_nan_result:
    rjmp   __fp_nan

.Latan2f_zero_result:
    rjmp   __fp_zero

; float tanf(float A)
tanf:
    push  r29
    mov   r29, r25
    rcall  __fp_rempio2
    lsr   r30
    ror   r29
    ldi   r18, 0xda
    ldi   r19, 0x0f
    ldi   r20, 0x49
    ldi   r21, 0x3f
    cpi   r27, 0xa3
    cpc   r22, r18
    cpc   r23, r19
    cpc   r24, r20
    cpc   r25, r21
    ror   r29
    brmi  .Ltanf_reduced
    ldi   r26, 0xa2
    ldi   r20, 0xc9
    ori   r25, 0x80
    rcall  __addsf3x
    rcall  __fp_round

.Ltanf_reduced:
    ldi   r30, lo8(tanf_coefficients)
    ldi   r31, hi8(tanf_coefficients)
    rcall  __fp_powsodd
    lsl   r29
    brvs  .Ltanf_no_inverse
    rcall  __inversef

.Ltanf_no_inverse:
    lsl   r29
    brvc  .Ltanf_restore_saved_register
    subi  r25, 0x80

.Ltanf_restore_saved_register:
    pop   r29
    ret

; float modff(float A, float *iptr in r21:r20)
modff:
    movw  r30, r20
    movw  r26, r24
    lsl   r26
    rol   r27
    movw  r18, r22
    movw  r20, r24
    subi  r27, 127
    brsh  .Lmodff_has_integral_part
    clr   r18
    clr   r19
    clr   r20
    andi  r21, 0x80
    rjmp  .Lmodff_write_integral

.Lmodff_has_integral_part:
    subi  r27, 23
    brsh  .Lmodff_large_or_nonfinite
    mov   r26, r27
    clr   r0

.Lmodff_scan_fraction:
    lsr   r20
    ror   r19
    ror   r18
    adc   r0, ZERO
    inc   r26
    brmi  .Lmodff_scan_fraction
    tst   r0
    breq  .Lmodff_no_fraction

.Lmodff_restore_integral:
    lsl   r18
    rol   r19
    rol   r20
    inc   r27
    brmi  .Lmodff_restore_integral
    rcall .Lmodff_write_integral
    rjmp   __subsf3

.Lmodff_large_or_nonfinite:
    cpi   r22, 1
    cpc   r23, ZERO
    ldi   r26, 0x80
    cpc   r24, r26
    sbci  r27, 105
    brsh  .Lmodff_write_integral

.Lmodff_no_fraction:
    movw  r18, r22
    movw  r20, r24
    clr   r22
    clr   r23
    clr   r24
    andi  r25, 0x80

.Lmodff_write_integral:
    adiw  r30, 0
    breq  .Lmodff_return
    st    Z, r18
    std   Z+1, r19
    std   Z+2, r20
    std   Z+3, r21

.Lmodff_return:
    ret

; float ldexpf(float A, int exponent in r21:r20)
ldexpf:
    rcall  __fp_splitA
    brcc  .Lldexpf_finite
    rjmp   __fp_mpack

.Lldexpf_finite:
    tst   r25
    brne  .Lldexpf_add_exponent
    rjmp   __fp_mpack

.Lldexpf_add_exponent:
    add   r25, r20
    adc   r21, ZERO
    brvc  .Lldexpf_check_low_exponent
    rjmp   __fp_inf

.Lldexpf_check_low_exponent:
    subi  r25, 1
    sbci  r21, 0
    brlt  .Lldexpf_denormalize
    breq  .Lldexpf_pack

.Lldexpf_normalize:
    tst   r24
    brmi  .Lldexpf_check_overflow
    lsl   r22
    rol   r23
    rol   r24
    subi  r25, 1
    sbci  r21, 0
    brne  .Lldexpf_normalize

.Lldexpf_check_overflow:
    cpi   r25, 254
    cpc   r21, ZERO
    brlt  .Lldexpf_pack
    rjmp   __fp_inf

.Lldexpf_pack:
    lsl   r24
    adc   r25, ZERO
    lsr   r25
    ror   r24
    bld   r25, 7
    ret

.Lldexpf_denormalize:
    cpi   r21, 0xff
    brne  .Lldexpf_zero
    cpi   r25, 0xe8
    brlo  .Lldexpf_zero
    clr   r27

.Lldexpf_denormalize_loop:
    lsr   r24
    ror   r23
    ror   r22
    ror   r27
    brcc  .Lldexpf_denormalize_no_sticky
    ori   r27, 1

.Lldexpf_denormalize_no_sticky:
    inc   r25
    brne  .Lldexpf_denormalize_loop
    lsl   r27
    brcc  .Lldexpf_pack
    brne  .Lldexpf_round_up
    sbrs  r22, 0
    rjmp  .Lldexpf_pack

.Lldexpf_round_up:
    subi  r22, -1
    sbci  r23, -1
    sbci  r24, -1
    sbci  r25, -1
    rjmp  .Lldexpf_pack

.Lldexpf_zero:
    rjmp   __fp_szero

; float expf(float A)
expf:
    rcall  __fp_splitA
    brcc  .Lexpf_finite
    brne  .Lexpf_nan
    brts  .Lexpf_zero
    rjmp   __fp_inf

.Lexpf_nan:
    rjmp   __fp_nan

.Lexpf_zero:
    rjmp   __fp_zero

.Lexpf_finite:
    cpi   r25, 0x86
    brlo  .Lexpf_in_range
    brts  .Lexpf_zero
    rjmp   __fp_inf

.Lexpf_in_range:
    bld   r0, 7
    push  r0
    clt
    ldi   r18, 0x3b
    ldi   r19, 0xaa
    ldi   r20, 0xb8
    ldi   r21, 0x7f
    rcall  __mulsf3_pse
    push  r0
    push  r0
    push  r0
    in    r20, SPL
    in    r21, SPH
    push  r0
    rcall  modff
    ldi   r30, lo8(expf_coefficients)
    ldi   r31, hi8(expf_coefficients)
    rcall  __fp_powser
    pop   r20
    pop   r21
    pop   r30
    pop   r31
    asr   r30
    rol   r30
    rol   r31
    breq  .Lexpf_scale_ready
    subi  r31, 0x7e
    ori   r30, 0x80
    clr   r20

.Lexpf_extract_integer_loop:
    lsl   r30
    rol   r20
    dec   r31
    brne  .Lexpf_extract_integer_loop
    neg   r20
    sbc   r21, r21

.Lexpf_scale_ready:
    rcall  ldexpf
    pop   r0
    sbrc  r0, 7
    ret
    rjmp   __inversef

; float log2f(float A)
log2f:
    rcall  __fp_splitA
    brcc  .Llog2f_finite
    brts  .Llog2f_nan
    rjmp   __fp_mpack

.Llog2f_nan:
    rjmp   __fp_nan

.Llog2f_negative_infinity:
    set
    rjmp   __fp_inf

.Llog2f_finite:
    tst   r25
    breq  .Llog2f_negative_infinity
    brts  .Llog2f_nan
    push  r29
    push  r28
    mov   r28, r25
    clr   r29
    tst   r24
    brmi  .Llog2f_mantissa_normalized

.Llog2f_normalize_subnormal:
    sbiw  r28, 1
    lsl   r22
    rol   r23
    rol   r24
    brpl  .Llog2f_normalize_subnormal

.Llog2f_mantissa_normalized:
    ldi   r18, 0x00
    ldi   r19, 0x00
    ldi   r20, 0x80
    ldi   r21, 0xbf
    ldi   r25, 0x3f
    cpi   r24, 0xc0
    brsh  .Llog2f_high_interval
    rcall  __addsf3
    ldi   r30, lo8(log2f_low_coefficients)
    ldi   r31, hi8(log2f_low_coefficients)
    rjmp  .Llog2f_evaluate_polynomial

.Llog2f_high_interval:
    andi  r24, 0x7f
    adiw  r28, 1
    rcall  __addsf3
    ldi   r30, lo8(log2f_high_coefficients)
    ldi   r31, hi8(log2f_high_coefficients)

.Llog2f_evaluate_polynomial:
    rcall  __fp_powser
    push  r27
    push  r23
    push  r22
    movw  r22, r28
    movw  r28, r24
    subi  r22, 127
    sbci  r23, 0
    rol   r23
    sbc   r24, r24
    sbc   r25, r25
    ror   r23
    rcall  __floatsisf
    pop   r18
    pop   r19
    pop   r26
    movw  r20, r28
    pop   r28
    pop   r29
    clr   r27
    rcall  __addsf3x
    rjmp   __fp_round

; float logf(float A)
logf:
    rcall  log2f
    ldi   r18, 0x18
    ldi   r19, 0x72
    ldi   r20, 0x31
    ldi   r21, 0x3f
    rjmp   __mulsf3

; float log10f(float A)
log10f:
    rcall  log2f
    ldi   r18, 0x9b
    ldi   r19, 0x20
    ldi   r20, 0x9a
    ldi   r21, 0x3e
    rjmp   __mulsf3

; float powf(float x=A, float y=B)
powf:
    movw  r30, r20
    lsl   r30
    rol   r31
    adiw  r30, 0
    cpc   r18, ZERO
    cpc   r19, ZERO
    breq  .Lpowf_return_one
    cp    r22, ZERO
    cpc   r23, ZERO
    brne  .Lpowf_check_sign
    cpi   r24, 0x80
    ldi   r27, 0x3f
    cpc   r25, r27
    breq  .Lpowf_return
    set
    cpi   r25, 0x80
    cpc   r24, ZERO
    breq  .Lpowf_integer_exponent_check
    cpi   r24, 0x80
    ldi   r27, 0xff
    cpc   r25, r27
    breq  .Lpowf_integer_exponent_check

.Lpowf_check_sign:
    tst   r25
    brpl  .Lpowf_compute
    cpi   r31, 0xff
    cpc   r30, ZERO
    cpc   r19, ZERO
    cpc   r18, ZERO
    breq  .Lpowf_replace_infinite_exponent
    clt

.Lpowf_integer_exponent_check:
    sec
    ror   r30
    movw  r26, r18

.Lpowf_find_low_nonzero_byte:
    tst   r26
    brne  .Lpowf_find_low_nonzero_bit
    mov   r26, r27
    mov   r27, r30
    subi  r31, -8
    brcs  .Lpowf_find_low_nonzero_byte
    rjmp  .Lpowf_nonintegral_exponent

.Lpowf_find_low_nonzero_bit:
    subi  r31, -1
    brcc  .Lpowf_nonintegral_exponent
    lsr   r26
    brcc  .Lpowf_find_low_nonzero_bit
    cpi   r31, 0x97
    brlo  .Lpowf_nonintegral_exponent
    breq  .Lpowf_odd_integer_exponent
    cpi   r31, 0xaf
    brsh  .Lpowf_nonintegral_exponent
    andi  r25, 0x7f

.Lpowf_odd_integer_exponent:
    push  r25
    rcall .Lpowf_compute
    pop   r0
    sbrc  r0, 7
    subi  r25, 0x80

.Lpowf_return:
    ret

.Lpowf_nonintegral_exponent:
    brts  .Lpowf_compute
    rjmp   __fp_nan

.Lpowf_return_one:
    ldi   r22, 0x00
    ldi   r23, 0x00
    ldi   r24, 0x80
    ldi   r25, 0x3f
    ret

.Lpowf_replace_infinite_exponent:
    ldi   r20, 0x7f

.Lpowf_compute:
    andi  r25, 0x7f
    push  r21
    push  r20
    push  r19
    push  r18
    rcall  logf
    pop   r18
    pop   r19
    pop   r20
    pop   r21
    rcall  __mulsf3
    rjmp   expf

; float hypotf(float A, float B)
hypotf:
    andi  r25, 0x7f
    andi  r21, 0x7f
    rcall  __fp_split3
    brcc  .Lhypotf_finite
    rjmp  .Lhypotf_nonfinite

.Lhypotf_finite:
    tst   r25
    brne  .Lhypotf_a_nonzero
    rjmp  .Lhypotf_return_b
.Lhypotf_a_nonzero:
    tst   r21
    brne  .Lhypotf_b_nonzero
    rjmp  .Lhypotf_return_a
.Lhypotf_b_nonzero:
    clr   r31
    cp    r25, r21
    brsh  .Lhypotf_a_exponent_larger
    mov   r30, r21
    sub   r30, r25
    cpi   r30, 13
    brlo  .Lhypotf_a_relevant
    rjmp  .Lhypotf_return_b
.Lhypotf_a_relevant:
    cpi   r21, 190
    brlo  .Lhypotf_a_small_check
    ldi   r31, 65
    rjmp  .Lhypotf_scale

.Lhypotf_a_small_check:
    cpi   r25, 64
    brsh  .Lhypotf_scale_ready
    rjmp  .Lhypotf_normalize_subnormals

.Lhypotf_a_exponent_larger:
    mov   r30, r25
    sub   r30, r21
    cpi   r30, 13
    brlo  .Lhypotf_b_relevant
    rjmp  .Lhypotf_return_a
.Lhypotf_b_relevant:
    cpi   r25, 190
    brlo  .Lhypotf_b_small_check
    ldi   r31, 65
    rjmp  .Lhypotf_scale

.Lhypotf_b_small_check:
    cpi   r21, 64
    brsh  .Lhypotf_scale_ready

.Lhypotf_normalize_subnormals:
    ldi   r31, 0xa9
    tst   r24
    brmi  .Lhypotf_normalize_b

.Lhypotf_normalize_a:
    dec   r25
    lsl   r22
    rol   r23
    rol   r24
    brpl  .Lhypotf_normalize_a

.Lhypotf_normalize_b:
    tst   r20
    brmi  .Lhypotf_scale

.Lhypotf_normalize_b_loop:
    dec   r21
    lsl   r18
    rol   r19
    rol   r20
    brpl  .Lhypotf_normalize_b_loop

.Lhypotf_scale:
    sub   r25, r31
    sub   r21, r31

.Lhypotf_scale_ready:
    push  r31
    push  r17
    push  r16
    push  r15
    push  r14
    movw  r14, r18
    movw  r16, r20
    clr   r27
    mov   r26, r27
    movw  r18, r22
    movw  r20, r24
    rcall  __mulsf3_pse
    movw  r18, r14
    movw  r20, r16
    push  r27
    movw  r14, r22
    movw  r16, r24
    clr   r26
    mov   r27, r26
    movw  r22, r18
    movw  r24, r20
    rcall  __mulsf3_pse
    pop   r26
    movw  r18, r14
    movw  r20, r16
    pop   r14
    pop   r15
    pop   r16
    pop   r17
    rcall  __addsf3x
    rcall  __fp_round
    rcall  sqrtf
    pop   r20
    sbrs  r20, 0
    ret
    clr   r21
    sbrc  r20, 7
    com   r21
    rjmp   ldexpf

.Lhypotf_return_b:
    movw  r22, r18
    movw  r24, r20

.Lhypotf_return_a:
    rjmp   __fp_mpack

.Lhypotf_nonfinite:
    rcall  __fp_pscA
    breq  .Lhypotf_infinity
    rcall  __fp_pscB
    breq  .Lhypotf_infinity
    rjmp   __fp_nan

.Lhypotf_infinity:
    rjmp   __fp_inf

; float fmodf(float A, float B)
fmodf:
    mov   r30, r25
    rcall  __fp_split3
    brcc  .Lfmodf_finite
    rjmp  .Lfmodf_nonfinite

.Lfmodf_finite:
    tst   r21
    brne  .Lfmodf_compare_magnitudes
    rjmp  .Lfmodf_nan

.Lfmodf_compare_magnitudes:
    bst   r30, 7
    cp    r22, r18
    cpc   r23, r19
    cpc   r24, r20
    cpc   r25, r21
    brlo  .Lfmodf_pack
    brne  .Lfmodf_magnitudes_differ
    rjmp  .Lfmodf_signed_zero
.Lfmodf_magnitudes_differ:
    mov   r30, r25
    clr   r31
    tst   r24
    brmi  .Lfmodf_a_normalized

.Lfmodf_normalize_a:
    sbiw  r30, 1
    lsl   r22
    rol   r23
    rol   r24
    brpl  .Lfmodf_normalize_a

.Lfmodf_a_normalized:
    mov   r25, r21
    clr   r21
    tst   r20
    brmi  .Lfmodf_b_normalized

.Lfmodf_normalize_b:
    subi  r25, 1
    sbci  r21, 0
    lsl   r18
    rol   r19
    rol   r20
    brpl  .Lfmodf_normalize_b

.Lfmodf_b_normalized:
    clr   r27
    sub   r30, r25
    sbc   r31, r21

.Lfmodf_remainder_loop:
    sub   r22, r18
    sbc   r23, r19
    sbc   r24, r20
    sbc   r27, ZERO
    breq  .Lfmodf_signed_zero
    brpl  .Lfmodf_subtraction_kept
    add   r22, r18
    adc   r23, r19
    adc   r24, r20
    adc   r27, ZERO

.Lfmodf_subtraction_kept:
    sbiw  r30, 1
    brmi  .Lfmodf_prepare_pack
    lsl   r22
    rol   r23
    rol   r24
    rol   r27
    rjmp  .Lfmodf_remainder_loop

.Lfmodf_prepare_pack:
    subi  r25, 1
    sbci  r21, 0
    brmi  .Lfmodf_denormalize
    breq  .Lfmodf_pack_normal

.Lfmodf_renormalize:
    tst   r24
    brmi  .Lfmodf_pack_normal
    lsl   r22
    rol   r23
    rol   r24
    subi  r25, 1
    sbci  r21, 0
    brne  .Lfmodf_renormalize

.Lfmodf_pack_normal:
    inc   r25

.Lfmodf_pack:
    rjmp   __fp_mpack

.Lfmodf_denormalize:
    lsr   r24
    ror   r23
    ror   r22
    subi  r25, -1
    brne  .Lfmodf_denormalize
    rjmp  .Lfmodf_pack_normal

.Lfmodf_nonfinite:
    rcall  __fp_pscA
    brcs  .Lfmodf_nan
    breq  .Lfmodf_nan
    rcall  __fp_pscB
    brcs  .Lfmodf_nan
    rjmp  .Lfmodf_compare_magnitudes

.Lfmodf_nan:
    rjmp   __fp_nan

.Lfmodf_signed_zero:
    rjmp   __fp_szero

; Polynomial coefficient tables. The first byte is the degree; the next four
; bytes are the leading binary32 coefficient; remaining entries are five-byte
; extended coefficients.
sinf_coefficients:
    .byte 5
    .byte 0xa8,0x4c,0xcd,0xb2
    .byte 0xd4,0x4e,0xb9,0x38,0x36
    .byte 0xa9,0x02,0x0c,0x50,0xb9
    .byte 0x91,0x86,0x88,0x08,0x3c
    .byte 0xa6,0xaa,0xaa,0x2a,0xbe
    .byte 0x00,0x00,0x00,0x80,0x3f

atanf_coefficients:
    .byte 8
    .byte 0x4a,0xd7,0x3b,0x3b
    .byte 0xce,0x01,0x6e,0x84,0xbc
    .byte 0xbf,0xfd,0xc1,0x2f,0x3d
    .byte 0x6c,0x74,0x31,0x9a,0xbd
    .byte 0x56,0x83,0x3d,0xda,0x3d
    .byte 0x00,0xc7,0x7f,0x11,0xbe
    .byte 0xd9,0xe4,0xbb,0x4c,0x3e
    .byte 0x91,0x6b,0xaa,0xaa,0xbe
    .byte 0x00,0x00,0x00,0x80,0x3f

tanf_coefficients:
    .byte 6
    .byte 0x64,0xec,0x1b,0x3c
    .byte 0x04,0xbc,0x16,0x3e,0x3b
    .byte 0xe5,0xb9,0x3c,0xc9,0x3c
    .byte 0x37,0xc2,0x9e,0x5a,0x3d
    .byte 0x66,0x04,0x98,0x08,0x3e
    .byte 0xea,0x69,0xaa,0xaa,0x3e
    .byte 0x00,0x00,0x00,0x80,0x3f

expf_coefficients:
    .byte 7
    .byte 0x63,0x42,0x36,0xb7
    .byte 0x9b,0xd8,0xa7,0x1a,0x39
    .byte 0x68,0x56,0x18,0xae,0xba
    .byte 0xab,0x55,0x8c,0x1d,0x3c
    .byte 0xb7,0xcc,0x57,0x63,0xbd
    .byte 0x6d,0xed,0xfd,0x75,0x3e
    .byte 0xf6,0x17,0x72,0x31,0xbf
    .byte 0x00,0x00,0x00,0x80,0x3f

log2f_low_coefficients:
    .byte 8
    .byte 0x9c,0x1a,0x22,0xbd
    .byte 0xa0,0x92,0x20,0x00,0x3e
    .byte 0xbe,0xcc,0xd5,0x58,0xbe
    .byte 0x94,0xde,0xa0,0x90,0x3e
    .byte 0xa0,0xa5,0x4b,0xb8,0xbe
    .byte 0x20,0xa9,0x32,0xf6,0x3e
    .byte 0x80,0x2a,0xaa,0x38,0xbf
    .byte 0x22,0x3b,0xaa,0xb8,0x3f
    .byte 0x00,0x00,0x00,0x00,0x00

log2f_high_coefficients:
    .byte 8
    .byte 0x3c,0x5b,0xf7,0xbe
    .byte 0xda,0xd7,0xaa,0x71,0x3d
    .byte 0x8c,0x77,0x86,0x8c,0xbe
    .byte 0x2e,0xee,0x93,0x91,0x3e
    .byte 0x7a,0x9f,0xce,0xb8,0xbe
    .byte 0x10,0x24,0x37,0xf6,0x3e
    .byte 0xfa,0x3c,0xaa,0x38,0xbf
    .byte 0x28,0x3b,0xaa,0xb8,0x3f
    .byte 0x00,0x00,0x00,0x00,0x00

.p2align 1

avrlibm_embedded_end:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SYS memory services
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; These handlers preserve all architectural input registers and VM_FLAGS.
; r4 therefore remains the destination pointer and the returned void*. Native
; scratch registers and native SREG are not architectural state.

; void *memmove(void *dst, void const *src, uint16_t n)
;   r4 = dst/result, r5 = src, r6 = n
; Copy backward exactly when dst > src and unsigned(dst - src) < n.
; The forward cases enter memcpy's shared forward-copy loop below.
sys_memmove_impl:
    movw  r30, VM_R4             ; Z = destination
    movw  r26, VM_R5             ; X = source
    movw  r24, VM_R6             ; r25:r24 = remaining count

    mov   r0, r24
    or    r0, r25
    breq  .Lsys_memcpy_done

    cp    r30, r26
    cpc   r31, r27
    breq  .Lsys_memcpy_done
    brlo  .Lsys_memcpy_loop

    movw  r0, r30                ; distance = dst - src
    sub   r0, r26
    sbc   r1, r27
    cp    r0, r24
    cpc   r1, r25
    brsh  .Lsys_memcpy_loop

    add   r26, r24               ; X = src + n
    adc   r27, r25
    add   r30, r24               ; Z = dst + n
    adc   r31, r25
.Lsys_memmove_backward_loop:
    ld    r0, -X
    st    -Z, r0
    sbiw  r24, 1
    brne  .Lsys_memmove_backward_loop
    rjmp  .Lsys_memcpy_done

; void *memcpy(void *dst, void const *src, uint16_t n)
;   r4 = dst/result, r5 = src, r6 = n
sys_memcpy_impl:
    movw  r30, VM_R4             ; Z = destination
    movw  r26, VM_R5             ; X = source
    movw  r24, VM_R6             ; r25:r24 = remaining count
    mov   r1, r24
    or    r1, r25
    breq  .Lsys_memcpy_done
.Lsys_memcpy_loop:
    ld    r0, X+
    st    Z+, r0
    sbiw  r24, 1
    brne  .Lsys_memcpy_loop
.Lsys_memcpy_done:
    jmp   cluster_tail_18

; void *memcpy_P(void *dst, progptr/uint24_t src, uint16_t n)
;   r4 = dst/result, q3[23:0] = src, r5 = n
;   q3[31:24] is ignored and preserved. This three-cycle landing retains the
;   previous successful-path timing; the skipped NOPs retain the four-word
;   layout so no later range-constrained code moves.
sys_memcpy_p_impl:
    rjmp  .Lsys_memcpy_p_padding_done
    nop
    nop
.Lsys_memcpy_p_padding_done:
    nop
    movw  r0, VM_R5              ; shared reader count
    mov   r27, r0
    or    r27, r1
    breq  .Lsys_memcpy_p_done

    add   VM_PCL, ONE            ; service byte -> following primary opcode
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO

    movw  r30, VM_R4             ; shared reader destination
    movw  r24, VM_R6             ; source bits 15:0
    mov   r26, VM_R7L            ; source bits 23:16
    call  fx_read_program_bytes_func
    jmp   seek_and_dispatch_func
.Lsys_memcpy_p_done:
    jmp   cluster_tail_18

; void *memset(void *dst, int16_t val, uint16_t n)
;   r4 = dst/result, r5 = val, r6 = n
sys_memset_impl:
    movw  r30, VM_R4             ; Z = destination
    movw  r24, VM_R6             ; r25:r24 = remaining count
    mov   r0, VM_R5L             ; low8(val), as required by C memset
    mov   r1, r24
    or    r1, r25
    breq  .Lsys_memset_done
.Lsys_memset_loop:
    st    Z+, r0
    sbiw  r24, 1
    brne  .Lsys_memset_loop
.Lsys_memset_done:
    jmp   cluster_tail_18

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SYS FX sprite drawing services
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Public SYS ABI for all four services:
;   r4 = int16_t x
;   r5 = int16_t y
;   q3 = image-relative program pointer to { width, height, frame bytes... }
;   r0 = uint16_t frame index
;
; The frame data is page-major. OVERWRITE, SELF_MASKED, and ERASE use one
; source byte per column. PLUS_MASK uses interleaved image,mask byte pairs.
; The frame stride is width * ceil(height/8), doubled for PLUS_MASK. For a
; height not divisible by eight, OVERWRITE masks the final source page in the
; renderer. The other modes require unused high bits in that page to be zero
; (both image and mask bytes for PLUS_MASK).
;
; The header wrapper consumes the speculative bytecode transfer, reads the
; two-byte header, calculates the selected-frame pointer, and enters the raw
; renderer through the documented native ABI below. Architectural registers
; and VM_FLAGS are preserved. The raw renderer returns to its caller; the SYS
; wrapper alone restarts the bytecode stream.

sys_draw_sprite_header_impl:
    out   GPIOR1, r27              ; retain mode across header read/MULs

    ; The instruction stream must be restarted after the sprite has owned SPI.
    ; Advance VM_PC from the service byte to the following primary opcode now.
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO

    movw  r24, VM_R6
    mov   r26, VM_R7L

    fx_disable

    ; Read width and height at q3. The shared address-phase helper is suitable
    ; for this fixed two-byte header read; the selected-frame seek below is a
    ; separate sprite-specific transaction whose command interval contains the
    ; clipping and render preparation.
    call  fx_start_program_read_func

    ; The helper returns five cycles after launching the width transfer. Twelve
    ; more cycles put the standard IN/OUT handoff at cycles 17/18.
    rcall sprite_delay_12
    in    r0, SPDR                  ; width
    out   SPDR, ZERO                ; begin height transfer

    ; Establish the unframed data pointer while height is in flight.
    movw  r24, VM_R6
    mov   r26, VM_R7L
    adiw  r24, 2
    adc   r26, ZERO
    out   GPIOR2, r0                ; retain width across MULs

.Lsys_sprite_wait_height:
    in    r27, SPSR
    sbrs  r27, SPIF
    rjmp  .Lsys_sprite_wait_height
    in    r1, SPDR                  ; height
    fx_disable

    ; Preserve height while r0:r1 are used by the four partial products.
    push  r1

    ; pages = ceil(height / 8); stride = width * pages.
    in    r30, GPIOR2
    mov   r31, r1
    mov   r27, r31
    andi  r27, 0x07
    lsr   r31
    lsr   r31
    lsr   r31
    cpse  r27, ZERO
    inc   r31
    mul   r30, r31
    movw  r30, r0

    in    r27, GPIOR1
    cpi   r27, SPRITE_MODE_PLUS_MASK
    brne  .Lsys_sprite_stride_ready
    lsl   r30
    rol   r31
.Lsys_sprite_stride_ready:

    ; Add low24(frame * stride) to sprite+2. Frame zero is overwhelmingly
    ; common and skips all partial products. Frames below 256 skip the two
    ; high-frame-byte products. q3[31:24] is ignored.
    mov   r27, VM_R0L
    or    r27, VM_R0H
    breq  .Lsys_sprite_frame_offset_done

    mul   VM_R0L, r30
    add   r24, r0
    adc   r25, r1
    adc   r26, ZERO

    mul   VM_R0L, r31
    add   r25, r0
    adc   r26, r1

    tst   VM_R0H
    breq  .Lsys_sprite_frame_offset_done

    mul   VM_R0H, r30
    add   r25, r0
    adc   r26, r1

    mul   VM_R0H, r31
    add   r26, r0

.Lsys_sprite_frame_offset_done:
    pop   r1                         ; native raw-renderer height
    in    r0, GPIOR2                 ; native raw-renderer width
    in    r27, GPIOR1                ; native raw-renderer mode
    rcall draw_bitmap_seek_func
    jmp   seek_and_dispatch_func


; Reusable raw page-bitmap renderer ABI.
;
; Entry:
;   r0              width in pixels
;   r1              height in pixels
;   r24:r25:r26     selected frame's image-relative data pointer
;   r27             SPRITE_MODE_*
;   AVM r4          int16_t x
;   AVM r5          int16_t y
;   FX deselected; no SPI transfer active
;
; Return:
;   RET with FX deselected and no SPI transfer active. The caller owns any
;   bytecode-stream restart. This makes the routine suitable for repeated calls
;   from a larger SYS service such as a text renderer.
;
; Data layout and semantics match the four sprite SYS services. This entry is
; deliberately exported so future text/glyph SYS services can prepare their
; own width, height, and bitmap pointer, then reuse clipping and rendering.
;
; Preservation:
;   Pushes and restores all native r8-r23 (the complete AVM register file).
;   VM_PC, VM_FLAGS, VM_SP, and the permanent constants are untouched. Native
;   r0:r1, r24:r27, r30:r31, GPIOR1:GPIOR2, and SREG are call-clobbered.
;
; Persistent working allocation after the pushes:
;   r8              source width during setup; overwrite row-valid mask
;   r9              source height during setup; overwrite low preserve mask
;   r10:r11         full source-row stride in bytes
;   r12             visible source rows remaining
;   r13             drawing mode during one-time setup
;   r14             framebuffer row advance (128-visibleColumns)
;   r15             overwrite final-source-page valid-bit mask
;   r16             visible column count
;   r17             framebuffer x during setup; loop counter while rendering
;   r18             vertical shift coefficient
;   r19             signed destination page during setup; high mask/temporary
;   r20:r21:r22     current visible source-row image-relative pointer
;   r23             top/bottom/surviving-partial flags
;   SREG.T          horizontal clipping requires a source-row reseek
;   GPIOR1:GPIOR2   selected mode-specific row-dispatch word address
;   X               current framebuffer page pointer
;   Z               adjacent framebuffer page pointer or dispatch target
;   r24:r25,r0:r1   stream and framebuffer temporaries
;
.Lsprite_raw_reject:
    ret
.global draw_bitmap_seek_func
draw_bitmap_seek_func:
    ; Reject invisible or empty bitmaps before touching architectural state or
    ; opening the sprite transaction.
    tst   r0
    breq  .Lsprite_raw_reject
    tst   r1
    breq  .Lsprite_raw_reject

    cpi   VM_R4L, 128
    cpc   VM_R4H, ZERO
    brge  .Lsprite_raw_reject
    cpi   VM_R5L, 64
    cpc   VM_R5H, ZERO
    brge  .Lsprite_raw_reject

    movw  r30, VM_R4
    add   r30, r0
    adc   r31, ZERO
    cp    ZERO, r30
    cpc   ZERO, r31
    brge  .Lsprite_raw_reject

    movw  r30, VM_R5
    add   r30, r1
    adc   r31, ZERO
    cp    ZERO, r30
    cpc   ZERO, r31
    brge  .Lsprite_raw_reject

.Lsprite_raw_visible:
    ; Start the selected-frame command before preserving architectural inputs.
    ; The sixteen pushes and the clipping work occupy the command-transfer
    ; interval. Because the exact cycle-17 boundary is intentionally missed,
    ; the eventual address-high handoff drains SPDR before transmitting.
    fx_disable
    ldi   r30, SFC_READ
    fx_enable
    out   SPDR, r30

    push  r8
    push  r9
    push  r10
    push  r11
    push  r12
    push  r13
    push  r14
    push  r15
    push  r16
    push  r17
    push  r18
    push  r19
    push  r20
    push  r21
    push  r22
    push  r23

    mov   r8, r0                    ; source width, later current row mask
    mov   r9, r1                    ; source height, later overwrite low mask
    movw  r20, r24
    mov   r22, r26                  ; selected frame pointer
    mov   r13, r27                  ; drawing mode (setup only)

    ; Full source-row stride in bytes.
    mov   r10, r8
    clr   r11
    mov   r24, r13
    cpi   r24, SPRITE_MODE_PLUS_MASK
    brne  .Lsprite_stride_ready
    lsl   r10
    rol   r11
.Lsprite_stride_ready:

    ; Compute pages = ceil(height/8) for every mode. Only OVERWRITE needs a
    ; valid-bit mask for the final source page; PLUS_MASK, SELF_MASKED, and
    ; ERASE require unused high bits in their source data to be zero.
    ; r23 retains top, bottom, and overwrite-partial-row flags. Horizontal
    ; reseek state is kept in native SREG.T instead of this byte.
    clr   r23
    mov   r25, r9
    lsr   r25
    lsr   r25
    lsr   r25
    mov   r24, r9
    andi  r24, 0x07                 ; height remainder
    breq  .Lsprite_height_aligned

    inc   r25
    tst   r13                       ; only mode 0 (OVERWRITE) masks padding
    brne  .Lsprite_nonoverwrite_unaligned
    ori   r23, (1 << SPRITE_FLAG_PARTIAL)
    ldi   r30, 1
.Lsprite_final_mask_loop:
    lsl   r30
    dec   r24
    brne  .Lsprite_final_mask_loop
    dec   r30
    rjmp  .Lsprite_final_mask_ready

.Lsprite_nonoverwrite_unaligned:
.Lsprite_height_aligned:
    ldi   r30, 0xFF
.Lsprite_final_mask_ready:
    mov   r15, r30                  ; overwrite final-page valid-bit mask
    mov   r12, r25                  ; total source pages

    ; pageStart = arithmetic y / 8. Visibility checks constrain y to the range
    ; in which the compact low-byte continuation is exact.
    mov   r24, VM_R5L
    asr   VM_R5H
    ror   r24
    asr   r24
    asr   r24

    ; Skip complete source pages above the display. With a nonzero bit shift,
    ; pageStart == -1 remains visible through its high contribution; aligned
    ; sprites skip that otherwise-empty row as well.
    mov   r25, VM_R5L
    andi  r25, 0x07
    breq  .Lsprite_top_clip_aligned

    cpi   r24, 0xFF
    brge  .Lsprite_top_clip_done
    mov   r25, r24
    com   r25                       ; skip = -pageStart - 1
    rjmp  .Lsprite_apply_top_skip

.Lsprite_top_clip_aligned:
    tst   r24
    brpl  .Lsprite_top_clip_done
    mov   r25, r24
    neg   r25                       ; skip = -pageStart

.Lsprite_apply_top_skip:
    ; source += skip * rowStride; pages -= skip; pageStart += skip.
    movw  r30, r10
    mul   r25, r30
    add   r20, r0
    adc   r21, r1
    adc   r22, ZERO
    mul   r25, r31
    add   r21, r0
    adc   r22, r1
    sub   r12, r25
    add   r24, r25

.Lsprite_top_clip_done:
    mov   r19, r24                  ; clipped signed destination page index

    ; Horizontal clipping. r16 becomes visible columns and r17 start X.
    mov   r25, VM_R4L
    sbrs  VM_R4H, 7
    rjmp  .Lsprite_x_nonnegative

    neg   r25                       ; leftSkip = -x, guaranteed < width
    mov   r16, r8
    sub   r16, r25
    clr   r17

    ; source += leftSkip * bytesPerColumn.
    mov   r30, r25
    clr   r31
    mov   r24, r13
    cpi   r24, SPRITE_MODE_PLUS_MASK
    brne  .Lsprite_left_skip_ready
    lsl   r30
    rol   r31
.Lsprite_left_skip_ready:
    add   r20, r30
    adc   r21, r31
    adc   r22, ZERO
    rjmp  .Lsprite_clip_right

.Lsprite_x_nonnegative:
    mov   r17, r25                  ; framebuffer x
    mov   r16, r8

.Lsprite_clip_right:
    ldi   r24, 128
    sub   r24, r17                  ; columns available on screen
    cp    r16, r24
    brlo  .Lsprite_right_clip_done
    breq  .Lsprite_right_clip_done
    mov   r16, r24
.Lsprite_right_clip_done:

    cpi   r19, 0xFF
    brne  .Lsprite_not_top_row
    ori   r23, (1 << SPRITE_FLAG_TOP)
.Lsprite_not_top_row:

    ; Convert the finalized visible source-row address to a physical FX address.
    ; The command transfer has long since completed, so use the legal late
    ; standard handoff: drain the command response, then transmit address high.
    mov   r25, r21
    mov   r30, r22
    lds   r0, data_page_data+0
    add   r25, r0
    lds   r0, data_page_data+1
    adc   r30, r0

    out   SPDR, r30                  ; physical address high

    ; Preserve y low while r18 is reused as the unsigned 128 operand for the
    ; signed page-index multiply below.
    mov   r9, VM_R5L

    ; Compute X = framebuffer + pageStart*128 + x with signed MULSU. A top
    ; source row therefore begins one page before the framebuffer and is moved
    ; forward by 128 in the common row dispatcher before its high contribution.
    ldi   r18, 128
    mulsu r19, r18
    ldi   r26, lo8(data_display)
    ldi   r27, hi8(data_display)
    add   r26, r0
    adc   r27, r1
    add   r26, r17
    adc   r27, ZERO

    ; Clip source rows against the bottom. If the original final source page is
    ; removed, its partial-page mask is no longer relevant.
    ldi   r24, 8
    sub   r24, r19                  ; maximum visible source rows
    cp    r12, r24
    brlo  .Lsprite_bottom_count_ready
    breq  .Lsprite_bottom_count_ready
    mov   r12, r24
    andi  r23, 0xF7                 ; clear SPRITE_FLAG_PARTIAL
.Lsprite_bottom_count_ready:

    mov   r24, r19
    add   r24, r12

    out   SPDR, r25                  ; physical address middle

    cpi   r24, 8
    brne  .Lsprite_not_bottom_row
    ori   r23, (1 << SPRITE_FLAG_BOTTOM)
.Lsprite_not_bottom_row:

    ; The retained source pointer is needed only when horizontal clipping means
    ; the visible bytes do not end at the next source row. Store that condition
    ; in native T, which survives all renderer arithmetic and protected SPI
    ; handoffs while architectural flags remain in GPIOR0.
    clt
    cpse  r16, r8
    set

    ldi   r24, 128
    sub   r24, r16
    mov   r14, r24                  ; framebuffer row advance

    ; Fixed-time coefficient construction overlaps the middle-address byte.
    mov   r24, r9
    ldi   r18, 1
    sbrc  r24, 1
    ldi   r18, 4
    sbrc  r24, 0
    lsl   r18
    sbrc  r24, 2
    swap  r18                        ; r18 = 1 << (y & 7)

    out   SPDR, r20                  ; physical address low

    ; Select one mode-specific row dispatcher once. GPIOR1:GPIOR2 are free
    ; after address-low is launched and retain its AVR word address for every
    ; source row. Invalid raw-entry modes retain the historical erase fallback.
    mov   r24, r13
    tst   r24
    brne  .Lsprite_select_not_overwrite

    ldi   r30, lo8(pm(sprite_overwrite_row_dispatch))
    ldi   r31, hi8(pm(sprite_overwrite_row_dispatch))
    ; Precompute overwrite preservation masks for every full source row:
    ;   r9  = preserve bits below the shifted source contribution
    ;   r19 = preserve bits above the shifted source contribution
    ; Other modes reuse these registers as rendering temporaries.
    ldi   r24, 0xFF
    mul   r24, r18
    com   r0
    com   r1
    mov   r9, r0
    mov   r19, r1
    rjmp  .Lsprite_store_mode_dispatch

.Lsprite_select_not_overwrite:
    cpi   r24, SPRITE_MODE_PLUS_MASK
    breq  .Lsprite_select_plus_dispatch
    cpi   r24, SPRITE_MODE_SELF_MASKED
    breq  .Lsprite_select_self_dispatch
    ldi   r30, lo8(pm(sprite_erase_row_dispatch))
    ldi   r31, hi8(pm(sprite_erase_row_dispatch))
    delay_2
    rjmp  .Lsprite_store_mode_dispatch
.Lsprite_select_plus_dispatch:
    ldi   r30, lo8(pm(sprite_plus_row_dispatch))
    ldi   r31, hi8(pm(sprite_plus_row_dispatch))
    delay_2
    delay_2
    rjmp  .Lsprite_store_mode_dispatch
.Lsprite_select_self_dispatch:
    ldi   r30, lo8(pm(sprite_self_row_dispatch))
    ldi   r31, hi8(pm(sprite_self_row_dispatch))
    delay_3
.Lsprite_store_mode_dispatch:
    out   GPIOR1, r30
    out   GPIOR2, r31

    ; The setup above occupies the address-low transfer window. Start the first
    ; data-byte transfer with a legal late standard handoff.
    out   SPDR, ZERO
    rjmp  .Lsprite_row_dispatch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Sprite row dispatch and streaming loops
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Each selected mode has a compact row-kind dispatcher. OVERWRITE alone
; distinguishes the one possible partial final source row. The other modes
; always use their full-row loops and rely on canonical zero padding.
.macro emit_sprite_overwrite_dispatch label, top_full, top_partial, middle_full, middle_partial, bottom_full, bottom_partial
\label:
    sbrs  r24, SPRITE_FLAG_PARTIAL
    rjmp  .Lsprite_overwrite_kind_\@
    cp    r12, ONE
    brne  .Lsprite_overwrite_kind_\@
    mov   r8, r15
    ori   r24, 0x80
.Lsprite_overwrite_kind_\@:
    sbrc  r24, SPRITE_FLAG_TOP
    rjmp  .Lsprite_overwrite_top_\@
    cp    r12, ONE
    brne  .Lsprite_overwrite_middle_\@
    sbrc  r24, SPRITE_FLAG_BOTTOM
    rjmp  .Lsprite_overwrite_bottom_\@
.Lsprite_overwrite_middle_\@:
    movw  r30, r26
    subi  r30, 0x80
    sbci  r31, 0xFF
    sbrc  r24, 7
    rjmp  \middle_partial
    rjmp  \middle_full
.Lsprite_overwrite_top_\@:
    sbrc  r24, 7
    rjmp  \top_partial
    rjmp  \top_full
.Lsprite_overwrite_bottom_\@:
    sbrc  r24, 7
    rjmp  \bottom_partial
    rjmp  \bottom_full
.endm

.macro emit_sprite_full_dispatch label, top_full, middle_full, bottom_full
\label:
    sbrc  r24, SPRITE_FLAG_TOP
    rjmp  \top_full
    cp    r12, ONE
    brne  .Lsprite_full_middle_\@
    sbrc  r24, SPRITE_FLAG_BOTTOM
    rjmp  \bottom_full
.Lsprite_full_middle_\@:
    movw  r30, r26
    subi  r30, 0x80
    sbci  r31, 0xFF
    rjmp  \middle_full
.endm

emit_sprite_overwrite_dispatch sprite_overwrite_row_dispatch, \
    .Lsprite_top_overwrite_full, .Lsprite_top_overwrite_partial, \
    .Lsprite_middle_overwrite_full, .Lsprite_middle_overwrite_partial, \
    .Lsprite_bottom_overwrite_full, .Lsprite_bottom_overwrite_partial

emit_sprite_full_dispatch sprite_plus_row_dispatch, \
    .Lsprite_top_plus_full, .Lsprite_middle_plus_full, .Lsprite_bottom_plus_full

emit_sprite_full_dispatch sprite_self_row_dispatch, \
    .Lsprite_top_self_full, .Lsprite_middle_self_full, .Lsprite_bottom_self_full

emit_sprite_full_dispatch sprite_erase_row_dispatch, \
    .Lsprite_top_erase_full, .Lsprite_middle_erase_full, .Lsprite_bottom_erase_full

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OVERWRITE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Full top and bottom rows use exact 18-cycle standard handoffs.
.Lsprite_top_overwrite_full:
.Lsprite_top_overwrite_full_loop:
    in    r24, SPDR
    out   SPDR, ZERO
    mul   r24, r18
    ld    r25, X
    and   r25, r19
    or    r25, r1
    st    X+, r25
    delay_4
    nop
    dec   r17
    brne  .Lsprite_top_overwrite_full_loop
    rjmp  .Lsprite_top_done

.Lsprite_bottom_overwrite_full:
.Lsprite_bottom_overwrite_full_loop:
    in    r24, SPDR
    out   SPDR, ZERO
    mul   r24, r18
    ld    r25, X
    and   r25, r9
    or    r25, r0
    st    X+, r25
    delay_4
    nop
    dec   r17
    brne  .Lsprite_bottom_overwrite_full_loop
    rjmp  .Lsprite_bottom_done

; Partial top/bottom rows derive their preserve mask once.  The extra source
; mask consumes the cycle otherwise used by the full-row NOP, retaining the
; same exact 18-cycle standard cadence.
.Lsprite_top_overwrite_partial:
    mul   r8, r18
    com   r1
    mov   r19, r1
.Lsprite_top_overwrite_partial_loop:
    in    r24, SPDR
    out   SPDR, ZERO
    and   r24, r8
    mul   r24, r18
    ld    r25, X
    and   r25, r19
    or    r25, r1
    st    X+, r25
    delay_4
    dec   r17
    brne  .Lsprite_top_overwrite_partial_loop
    rjmp  .Lsprite_top_done

.Lsprite_bottom_overwrite_partial:
    mul   r8, r18
    com   r0
    mov   r9, r0
.Lsprite_bottom_overwrite_partial_loop:
    in    r24, SPDR
    out   SPDR, ZERO
    and   r24, r8
    mul   r24, r18
    ld    r25, X
    and   r25, r9
    or    r25, r0
    st    X+, r25
    delay_4
    dec   r17
    brne  .Lsprite_bottom_overwrite_partial_loop
    rjmp  .Lsprite_bottom_done

; Full middle rows are two-column unrolled. The first byte of each pair loads
; both framebuffer pages and preloads the next low-page byte; the second byte
; consumes that preload. Each source-byte OUT-to-OUT interval is exactly 18
; cycles, and odd widths use one correctly aligned prefix column.
.Lsprite_middle_overwrite_full:
    mov   r17, r16
    lsr   r17                        ; pair count
    brcc  .Lsprite_middle_overwrite_pair_loop
    inc   r17
    rjmp  .Lsprite_middle_overwrite_one

.Lsprite_middle_overwrite_pair_loop:
    ; First column of the pair: sixteen cycles after OUT.
    in    r24, SPDR
    out   SPDR, ZERO
    ld    r25, X
    mul   r24, r18
    and   r25, r9
    or    r25, r0
    st    X+, r25
    ld    r25, Z
    and   r25, r19
    or    r25, r1
    st    Z+, r25
.Lsprite_middle_overwrite_one:
    ld    r25, X                    ; preload second low-page byte

    ; Second column: twelve pixel cycles plus NOP/DEC/BRNE = sixteen.
    in    r24, SPDR
    out   SPDR, ZERO
    mul   r24, r18
    and   r25, r9
    or    r25, r0
    st    X+, r25
    ld    r25, Z
    and   r25, r19
    or    r25, r1
    st    Z+, r25
    nop
    dec   r17
    brne  .Lsprite_middle_overwrite_pair_loop
    rjmp  .Lsprite_middle_done

; The single possible partial middle row keeps the compact generic body. With
; the row mask resident in r8 it is 20 cycles/byte rather than the old 21.
.Lsprite_middle_overwrite_partial:
    mul   r8, r18
    com   r0
    com   r1
    mov   r9, r0
    mov   r19, r1
.Lsprite_middle_overwrite_partial_loop:
    in    r24, SPDR
    out   SPDR, ZERO
    and   r24, r8
    mul   r24, r18
    ld    r25, X
    and   r25, r9
    or    r25, r0
    st    X+, r25
    ld    r25, Z
    and   r25, r19
    or    r25, r1
    st    Z+, r25
    dec   r17
    brne  .Lsprite_middle_overwrite_partial_loop
    rjmp  .Lsprite_middle_done

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PLUS_MASK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Full top and bottom rows use a standard first image->mask handoff, then the
; proven 17/17 reverse schedule. Each column consumes image then mask.
.Lsprite_top_plus_full:
.Lsprite_top_plus_full_loop:
    cli
    out   SPDR, ZERO                 ; begin mask
    in    r0, SPDR                   ; image
    sei
    mul   r0, r18
    mov   r24, r1
    rcall sprite_delay_10
    cli
    out   SPDR, ZERO                 ; begin next image
    in    r0, SPDR                   ; mask
    sei
    mul   r0, r18
    mov   r25, r1
    ld    r19, X
    com   r25
    and   r19, r25
    or    r19, r24
    st    X+, r19
    dec   r17
    brne  .Lsprite_top_plus_full_loop
    rjmp  .Lsprite_top_done

.Lsprite_bottom_plus_full:
.Lsprite_bottom_plus_full_loop:
    cli
    out   SPDR, ZERO                 ; begin mask
    in    r0, SPDR                   ; image
    sei
    mul   r0, r18
    mov   r24, r0
    rcall sprite_delay_10
    cli
    out   SPDR, ZERO                 ; begin next image
    in    r0, SPDR                   ; mask
    sei
    mul   r0, r18
    mov   r25, r0
    ld    r19, X
    com   r25
    and   r19, r25
    or    r19, r24
    st    X+, r19
    dec   r17
    brne  .Lsprite_bottom_plus_full
    rjmp  .Lsprite_bottom_done

; Full middle rows use 17 cycles from image OUT to mask OUT and 18 cycles from
; mask OUT to the next image OUT after the first standard priming handoff.
.Lsprite_middle_plus_full:
.Lsprite_middle_plus_full_loop:
    cli
    out   SPDR, ZERO                 ; begin mask
    in    r0, SPDR                   ; image
    sei
    mul   r0, r18
    movw  r24, r0
    ld    r9, X
    ld    r19, Z
    rcall sprite_delay_7
    in    r0, SPDR                   ; mask
    out   SPDR, ZERO                 ; begin next image
    mul   r0, r18
    com   r0
    com   r1
    and   r9, r0
    or    r9, r24
    st    X+, r9
    and   r19, r1
    or    r19, r25
    st    Z+, r19
    dec   r17
    brne  .Lsprite_middle_plus_full_loop
    rjmp  .Lsprite_middle_done

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SELF_MASKED
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Top/bottom rows use exact 18-cycle standard handoffs.
; Middle rows retain their existing 18-cycle streaming bodies.
.Lsprite_top_self_full:
.Lsprite_top_self_full_loop:
    in    r24, SPDR
    out   SPDR, ZERO
    mul   r24, r18
    ld    r25, X
    or    r25, r1
    st    X+, r25
    delay_3
    delay_3
    dec   r17
    brne  .Lsprite_top_self_full_loop
    rjmp  .Lsprite_top_done

.Lsprite_bottom_self_full:
.Lsprite_bottom_self_full_loop:
    in    r24, SPDR
    out   SPDR, ZERO
    mul   r24, r18
    ld    r25, X
    or    r25, r0
    st    X+, r25
    delay_3
    delay_3
    dec   r17
    brne  .Lsprite_bottom_self_full_loop
    rjmp  .Lsprite_bottom_done

; Full middle rows remain 18 cycles/byte with one balancing NOP.
.Lsprite_middle_self_full:
.Lsprite_middle_self_full_loop:
    in    r24, SPDR
    out   SPDR, ZERO
    mul   r24, r18
    ld    r25, X
    or    r25, r0
    st    X+, r25
    ld    r25, Z
    or    r25, r1
    st    Z+, r25
    nop
    dec   r17
    brne  .Lsprite_middle_self_full_loop
    rjmp  .Lsprite_middle_done

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ERASE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Top/bottom rows use exact 18-cycle standard handoffs.
; The middle path remains the 19-cycle drawBasicFX schedule.
.Lsprite_top_erase_full:
.Lsprite_top_erase_full_loop:
    cli
    out   SPDR, ZERO
    in    r24, SPDR
    sei
    mul   r24, r18
    com   r1
    ld    r25, X
    and   r25, r1
    st    X+, r25
    delay_2
    dec   r17
    brne  .Lsprite_top_erase_full_loop
    rjmp  .Lsprite_top_done

.Lsprite_bottom_erase_full:
.Lsprite_bottom_erase_full_loop:
    cli
    out   SPDR, ZERO
    in    r24, SPDR
    sei
    mul   r24, r18
    com   r0
    ld    r25, X
    and   r25, r0
    st    X+, r25
    delay_2
    dec   r17
    brne  .Lsprite_bottom_erase_full_loop
    rjmp  .Lsprite_bottom_done

.Lsprite_middle_erase_full:
.Lsprite_middle_erase_full_loop:
    in    r24, SPDR
    out   SPDR, ZERO
    mul   r24, r18
    com   r0
    com   r1
    ld    r25, X
    and   r25, r0
    st    X+, r25
    ld    r25, Z
    and   r25, r1
    st    Z+, r25
    dec   r17
    brne  .Lsprite_middle_erase_full_loop
    rjmp  .Lsprite_middle_done

.Lsprite_row_dispatch:
    ; Preserve this row's top/bottom/overwrite-partial metadata before the
    ; persistent top flag is cleared. Only the overwrite dispatcher interprets
    ; SPRITE_FLAG_PARTIAL or uses r8/r15.
    mov   r24, r23
    mov   r17, r16                    ; visible-column counter

    ; For pageStart==-1, X names one page before the framebuffer. Move it to
    ; page zero for the single top-row high-contribution loop, then clear the
    ; persistent top flag so subsequent rows use the normal page pointer.
    sbrs  r24, SPRITE_FLAG_TOP
    rjmp  .Lsprite_row_pointer_ready
    andi  r23, 0xFE
    subi  r26, 0x80
    sbci  r27, 0xFF
.Lsprite_row_pointer_ready:

    in    r30, GPIOR1
    in    r31, GPIOR2
    ijmp


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Sprite row progression, reseek, and restoration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.Lsprite_top_done:
    ; X advanced across page zero. Reset it to the same visible page start for
    ; the following row's low contribution.
    sub   r26, r16
    sbc   r27, ZERO
    rjmp  .Lsprite_row_complete

.Lsprite_middle_done:
    ; X advanced across the visible columns of the low page. Advance to the
    ; same x coordinate on the following framebuffer page.
    mov   r24, r14
    add   r26, r24
    adc   r27, ZERO

.Lsprite_row_complete:
    dec   r12
    breq  .Lsprite_finish

    ; Contiguous full-width rows continue directly in the existing transaction.
    ; Only clipped rows retain and advance r20:r21:r22 for a fresh seek.
    brtc  .Lsprite_row_dispatch

    fx_disable
    rcall sprite_start_row_read_func
    rjmp  .Lsprite_row_dispatch

.Lsprite_bottom_done:
    ; Bottom is necessarily the last visible source row.

.Lsprite_finish:
    pop   r23
    pop   r22
    pop   r21
    pop   r20
    pop   r19
    pop   r18
    pop   r17
    pop   r16
    pop   r15
    pop   r14
    pop   r13
    pop   r12
    pop   r11
    pop   r10
    pop   r9
    pop   r8
    fx_disable
    ret


; Start streaming at the following visible source row without disturbing X.
; This helper is used only when native T indicates horizontal clipping. It
; advances the retained row pointer after launching SFC_READ, hiding the four
; pointer-update cycles in the command interval. Z and r24:r25 are scratch; the
; first data byte is in flight on return.
sprite_start_row_read_func:
    fx_disable
    ldi   r24, SFC_READ
    fx_enable
    out   SPDR, r24

    ; Advance to the same visible x position in the following source row.
    movw  r24, r10
    add   r20, r24
    adc   r21, r25
    adc   r22, ZERO

    mov   r25, r21
    mov   r30, r22
    lds   r31, data_page_data+0
    add   r25, r31
    lds   r31, data_page_data+1
    adc   r30, r31

    ; The twelve useful setup cycles after command launch leave exactly four
    ; cycles before the legal cycle-17 IN / cycle-18 OUT address-high handoff.
    delay_3
    delay_2
    out   SPDR, r30

    ; Remaining meaningful bytes use exact 18-cycle standard handoffs.
    rcall sprite_delay_17
    out   SPDR, r25
    rcall sprite_delay_17
    out   SPDR, r20
    rcall sprite_delay_17
    out   SPDR, ZERO
    ret


; Local complete-cycle delay ladder. Each entry is the total cycle count from
; the calling RCALL through the returning RET. NOP-only fallthrough entries do
; not clobber MUL results or renderer state.
sprite_delay_17:
    nop
sprite_delay_16:
    nop
sprite_delay_15:
    nop
sprite_delay_14:
    nop
sprite_delay_13:
    nop
sprite_delay_12:
    nop
sprite_delay_11:
    nop
sprite_delay_10:
    nop
sprite_delay_9:
    nop
sprite_delay_8:
    nop
sprite_delay_7:
    ret
