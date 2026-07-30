#ifndef _AVM_RUNTIME_AVM_H
#define _AVM_RUNTIME_AVM_H

#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include <avm/framebuffer.h>
#include <avm/pgmspace.h>

#define AVM_SYS_INLINE static __inline__

#ifdef __cplusplus
#define AVM_CONSTANT constexpr
extern "C" {
#else
#define AVM_CONSTANT static const
#endif

/* Debugging */

AVM_SYS_INLINE void avm_debug_putc(uint8_t value)
{
    __avm_debug_putc(value);
}

AVM_SYS_INLINE void avm_debug_break(void)
{
    __avm_debug_break();
}

/* Time */

AVM_SYS_INLINE uint16_t avm_millis(void)
{
    return __avm_millis();
}

AVM_SYS_INLINE uint32_t avm_millis32(void)
{
    return __avm_millis32();
}

void avm_set_frame_rate(uint8_t rate_hz);
void avm_set_frame_duration(uint8_t duration_ms);
bool avm_next_frame();

/* Display */

AVM_CONSTANT bool AVM_CLEAR_BUFFER = true;

AVM_SYS_INLINE void avm_display(bool clear)
{
    __avm_display(clear);
}

/* Explicit-pointer sprite drawing */

AVM_SYS_INLINE void avm_draw_sprite_overwrite(
    int16_t x,
    int16_t y,
    void const AVM_PROGMEM *sprite,
    uint16_t frame)
{
    __avm_draw_sprite_overwrite(x, y, sprite, frame);
}

AVM_SYS_INLINE void avm_draw_sprite_plus_mask(
    int16_t x,
    int16_t y,
    void const AVM_PROGMEM *sprite,
    uint16_t frame)
{
    __avm_draw_sprite_plus_mask(x, y, sprite, frame);
}

AVM_SYS_INLINE void avm_draw_sprite_self_masked(
    int16_t x,
    int16_t y,
    void const AVM_PROGMEM *sprite,
    uint16_t frame)
{
    __avm_draw_sprite_self_masked(x, y, sprite, frame);
}

AVM_SYS_INLINE void avm_draw_sprite_erase(
    int16_t x,
    int16_t y,
    void const AVM_PROGMEM *sprite,
    uint16_t frame)
{
    __avm_draw_sprite_erase(x, y, sprite, frame);
}

/* Selected-sprite drawing */

AVM_SYS_INLINE void avm_set_sprite(void const AVM_PROGMEM *sprite)
{
    __avm_set_sprite(sprite);
}

AVM_SYS_INLINE void avm_draw_overwrite(
    int16_t x,
    int16_t y,
    uint16_t frame)
{
    __avm_draw_overwrite(x, y, frame);
}

AVM_SYS_INLINE void avm_draw_plus_mask(
    int16_t x,
    int16_t y,
    uint16_t frame)
{
    __avm_draw_plus_mask(x, y, frame);
}

AVM_SYS_INLINE void avm_draw_self_masked(
    int16_t x,
    int16_t y,
    uint16_t frame)
{
    __avm_draw_self_masked(x, y, frame);
}

AVM_SYS_INLINE void avm_draw_erase(
    int16_t x,
    int16_t y,
    uint16_t frame)
{
    __avm_draw_erase(x, y, frame);
}

/* Filled rectangles */

AVM_SYS_INLINE void avm_draw_filled_rect_white(
    int16_t x,
    int16_t y,
    uint8_t width,
    uint8_t height)
{
    __avm_draw_filled_rect_white(x, y, width, height);
}

AVM_SYS_INLINE void avm_draw_filled_rect_black(
    int16_t x,
    int16_t y,
    uint8_t width,
    uint8_t height)
{
    __avm_draw_filled_rect_black(x, y, width, height);
}

/* Platform services */

AVM_CONSTANT uint8_t AVM_BUTTON_A = (1 << 3);
AVM_CONSTANT uint8_t AVM_BUTTON_B = (1 << 2);
AVM_CONSTANT uint8_t AVM_BUTTON_U = (1 << 7);
AVM_CONSTANT uint8_t AVM_BUTTON_D = (1 << 4);
AVM_CONSTANT uint8_t AVM_BUTTON_L = (1 << 5);
AVM_CONSTANT uint8_t AVM_BUTTON_R = (1 << 6);

AVM_SYS_INLINE uint8_t avm_buttons(void)
{
    return __avm_buttons();
}

AVM_SYS_INLINE bool avm_pressed(uint8_t buttons)
{
    return (avm_buttons() & buttons) == buttons;
}
AVM_SYS_INLINE bool avm_any_pressed(uint8_t buttons)
{
    return (avm_buttons() & buttons) != 0;
}
AVM_SYS_INLINE bool avm_not_pressed(uint8_t buttons)
{
    return (avm_buttons() & buttons) == 0;
}

void avm_poll_buttons(void);
bool avm_just_pressed(uint8_t button);
bool avm_just_released(uint8_t button);

AVM_SYS_INLINE void avm_idle(void)
{
    __avm_idle();
}

AVM_SYS_INLINE uint16_t avm_generate_random_seed(void)
{
    return __avm_generate_random_seed();
}

void avm_init_random_seed(void);
uint16_t avm_random(void);

/* Persistent save data */

AVM_SYS_INLINE void avm_save(void)
{
    __avm_save();
}

AVM_SYS_INLINE bool avm_load(void)
{
    return __avm_load();
}

AVM_SYS_INLINE bool avm_save_exists(void)
{
    return __avm_save_exists();
}

/* Text drawing */

typedef struct __attribute__((packed)) {
  uint8_t h;
  int8_t  yoff;
  uint8_t w;
  int8_t  xoff;
  uint8_t image_offset[3]; /* Relative to the glyph-table base: font + 3. */
  uint8_t xadv;
} avm_font_glyph_t;

/* The packed program-space object contains this three-byte header, followed by
   num_glyphs avm_font_glyph_t records and then the page-major glyph images. */
typedef struct __attribute__((packed)) {
  uint8_t line_height;
  uint8_t glyph_first;
  uint8_t num_glyphs;
  uint8_t data[]; /* glyph table and image data */
} avm_font_t;

extern uint8_t const AVM_PROGMEM _avm_font_5x7_storage[];

#define AVM_FONT_5X7 ((avm_font_t const AVM_PROGMEM*)_avm_font_5x7_storage)

typedef enum {
  AVM_TEXT_OVERWRITE = 0,
  AVM_TEXT_WHITE_TRANSPARENT = 2,
  AVM_TEXT_BLACK_TRANSPARENT = 3,
} avm_text_mode_t;

typedef struct {
  int16_t x;
  int16_t baseline_y;
} avm_text_cursor_t;

AVM_SYS_INLINE avm_text_cursor_t
__avm_text_cursor_from_u32(uint32_t packed) {
  avm_text_cursor_t result;
  result.x = (int16_t)(uint16_t)packed;
  result.baseline_y = (int16_t)(uint16_t)(packed >> 16);
  return result;
}

AVM_SYS_INLINE void
avm_set_text_font(avm_font_t const AVM_PROGMEM *font) {
  __avm_set_text_font(font);
}

AVM_SYS_INLINE void avm_set_text_mode(avm_text_mode_t mode) {
  __avm_set_text_mode((uint8_t)mode);
}

AVM_SYS_INLINE avm_text_cursor_t
avm_draw_text(int16_t x, int16_t baseline_y, char const *str) {
  return __avm_text_cursor_from_u32(
      __avm_draw_text(x, baseline_y, str));
}

AVM_SYS_INLINE avm_text_cursor_t
avm_draw_text_P(int16_t x, int16_t baseline_y, char const AVM_PROGMEM* str) {
  return __avm_text_cursor_from_u32(
      __avm_draw_text_P(x, baseline_y, str));
}

AVM_SYS_INLINE avm_text_cursor_t
avm_draw_textfv(int16_t x, int16_t baseline_y, char const *fmt, va_list args) {
  return __avm_text_cursor_from_u32(
      __avm_draw_textfv(x, baseline_y, fmt, args));
}

AVM_SYS_INLINE avm_text_cursor_t
avm_draw_textfv_P(int16_t x, int16_t baseline_y, char const AVM_PROGMEM* fmt,
              va_list args) {
  return __avm_text_cursor_from_u32(
      __avm_draw_textfv_P(x, baseline_y, fmt, args));
}

/* A C function cannot forward unnamed arguments without constructing a
   va_list. Expand the true-variadic compiler builtin directly at the caller. */
#define avm_draw_textf(...)                                                   \
  __avm_text_cursor_from_u32(__avm_draw_textf(__VA_ARGS__))
#define avm_draw_textf_P(...)                                                 \
  __avm_text_cursor_from_u32(__avm_draw_textf_P(__VA_ARGS__))

#ifdef __cplusplus
}
#endif

#endif
