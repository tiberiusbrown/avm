//===--- tilemap.h - AVM tile map drawing ---------------------------------===//

#ifndef __AVM_TILEMAP_H
#define __AVM_TILEMAP_H

#include <stdbool.h>
#include <stdint.h>

/*
 * Tile map drawing with the sprite selected by avm_set_sprite().
 *
 * Each function draws a window of cols by rows map entries with one system call.
 * The entry tiles[row * stride + col] is the frame drawn at
 * (x + col * width, y + row * height), where width and height are those of the
 * selected sprite. stride is the number of entries from the start of one map row
 * to the start of the next; it is usually the width of the stored map, and it may
 * be negative. The result is that of drawing each entry in row-major order with
 * the single-sprite function of the same mode, except that drawing ends at the
 * first row below the screen. Coordinates wrap modulo 65536, as int16_t
 * arithmetic does.
 *
 * Naming:
 *   avm_draw_tilemap_<mode>          uint16_t entries
 *   avm_draw_tilemap_u8_<mode>       uint8_t entries
 *   ..._skip                         all-ones entries (0xFFFF or 0xFF) are not
 *                                    drawn
 *
 * tiles is an ordinary pointer: RAM, or a const array in the AS0 flash window.
 * avm_draw_tilemap_ex() takes the mode, the entry width and the skip behavior
 * as arguments.
 */

typedef enum {
    AVM_DRAW_MODE_OVERWRITE = 0,
    AVM_DRAW_MODE_PLUS_MASK = 1,
    AVM_DRAW_MODE_SELF_MASKED = 2,
    AVM_DRAW_MODE_ERASE = 3,
} avm_draw_mode_t;

/* Arguments of the __avm_draw_tilemap builtin: the grid dimensions share one
   word, and the flags hold the draw mode in the low byte. */
#define __AVM_TILEMAP_DIMS(cols, rows) \
    ((uint16_t)((uint16_t)(uint8_t)(rows) << 8 | (uint8_t)(cols)))
#define __AVM_TILEMAP_U16 0x0100u
#define __AVM_TILEMAP_SKIP 0x0200u
#define __AVM_TILEMAP_FLAGS(mode, tiles_u16, skip)    \
    ((uint16_t)((uint8_t)(mode) |                     \
                ((tiles_u16) ? __AVM_TILEMAP_U16 : 0) | \
                ((skip) ? __AVM_TILEMAP_SKIP : 0)))

#ifdef __cplusplus
extern "C" {
#endif

/* The raw form. tiles points at uint16_t entries when tiles_u16 is true and at
   uint8_t entries otherwise. */

static __inline__ void avm_draw_tilemap_ex(
    int16_t x,
    int16_t y,
    void const* tiles,
    uint8_t cols,
    uint8_t rows,
    int16_t stride,
    avm_draw_mode_t mode,
    bool tiles_u16,
    bool skip_all_ones)
{
    __avm_draw_tilemap(x, y, tiles, __AVM_TILEMAP_DIMS(cols, rows),
        (uint16_t)stride, __AVM_TILEMAP_FLAGS(mode, tiles_u16, skip_all_ones));
}

/* The named functions, one per mode, entry width and skip behavior. */
#define __AVM_TILEMAP_FUNCTION(name, entry, mode, tiles_u16, skip)    \
    static __inline__ void name(                                     \
        int16_t x,                                                   \
        int16_t y,                                                   \
        entry const* tiles,                                          \
        uint8_t cols,                                                \
        uint8_t rows,                                                \
        int16_t stride)                                              \
    {                                                                \
        __avm_draw_tilemap(x, y, tiles, __AVM_TILEMAP_DIMS(cols, rows), \
            (uint16_t)stride, __AVM_TILEMAP_FLAGS(mode, tiles_u16, skip)); \
    }
#define __AVM_TILEMAP_FAMILY(suffix, mode)                                       \
    __AVM_TILEMAP_FUNCTION(avm_draw_tilemap_##suffix, uint16_t, mode, 1, 0)      \
    __AVM_TILEMAP_FUNCTION(avm_draw_tilemap_##suffix##_skip, uint16_t, mode, 1, 1) \
    __AVM_TILEMAP_FUNCTION(avm_draw_tilemap_u8_##suffix, uint8_t, mode, 0, 0)    \
    __AVM_TILEMAP_FUNCTION(                                                      \
        avm_draw_tilemap_u8_##suffix##_skip, uint8_t, mode, 0, 1)

/*
 * Defines, for each mode:
 *   avm_draw_tilemap_overwrite        avm_draw_tilemap_u8_overwrite
 *   avm_draw_tilemap_overwrite_skip   avm_draw_tilemap_u8_overwrite_skip
 * and the same for plus_mask, self_masked and erase.
 */
__AVM_TILEMAP_FAMILY(overwrite, AVM_DRAW_MODE_OVERWRITE)
__AVM_TILEMAP_FAMILY(plus_mask, AVM_DRAW_MODE_PLUS_MASK)
__AVM_TILEMAP_FAMILY(self_masked, AVM_DRAW_MODE_SELF_MASKED)
__AVM_TILEMAP_FAMILY(erase, AVM_DRAW_MODE_ERASE)

#undef __AVM_TILEMAP_FAMILY
#undef __AVM_TILEMAP_FUNCTION

#ifdef __cplusplus
}
#endif

#endif /* __AVM_TILEMAP_H */
