#ifndef __AVM_H
#define __AVM_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include <avm/framebuffer.h>
#include <avm/pgmspace.h>

#define AVM_SYS_INLINE static inline

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

#ifdef __cplusplus
}
#endif

#endif
