#include <avm.h>
#include <avm/pgmspace.h>
#include <stdint.h>
#include <string.h>

#include "test_hex_output.h"

/* Every tile map function draws a map window with one system call. This test
   compares the framebuffer each produces, over a background of non-trivial data,
   with the one produced by the documented equivalent: a loop of single cached
   draws over the rows, ending at the first row below the screen, that skips
   all-ones entries when asked. It covers every named function and the raw form,
   RAM and flash-window maps, sheets of several sizes, clipped and unaligned
   windows, rows wider than the screen, negative and overlapping strides, empty
   grids, an unselected sprite, and preservation of the registers. */

#define FRAMEBUFFER ((uint8_t *)(uintptr_t)0x0500u)

/* Deterministic sprite data. Overwrite frames use any bits; plus-mask pairs
   satisfy image & ~mask == 0; self-masked, erase and plus-mask frames keep the
   padding bits of a partial final page zero through the valid-bit mask v. */
#define G(i) ((uint8_t)(((i) * 73u + ((i) >> 3) * 41u + 17u) ^ ((i) * 5u)))
#define M(i) ((uint8_t)(((i) * 29u + ((i) >> 2) * 53u + 91u) | ((i) * 3u)))
#define OW1(i) G(i)
#define OW2(i) OW1(i), OW1((i) + 1)
#define OW4(i) OW2(i), OW2((i) + 2)
#define OW8(i) OW4(i), OW4((i) + 4)
#define OW16(i) OW8(i), OW8((i) + 8)
#define OW32(i) OW16(i), OW16((i) + 16)
#define OW64(i) OW32(i), OW32((i) + 32)
#define OW128(i) OW64(i), OW64((i) + 64)
#define OW256(i) OW128(i), OW128((i) + 128)
#define OW512(i) OW256(i), OW256((i) + 256)
#define OW1024(i) OW512(i), OW512((i) + 512)
#define V1(i, v) ((uint8_t)(G(i) & (v)))
#define V4(i, v) V1(i, v), V1((i) + 1, v), V1((i) + 2, v), V1((i) + 3, v)
#define V16(i, v) V4(i, v), V4((i) + 4, v), V4((i) + 8, v), V4((i) + 12, v)
#define PV1(i, v) ((uint8_t)(G(i) & M(i) & (v))), ((uint8_t)(M(i) & (v)))
#define PV4(i, v) PV1(i, v), PV1((i) + 1, v), PV1((i) + 2, v), PV1((i) + 3, v)
#define PV12(i, v) PV4(i, v), PV4((i) + 4, v), PV4((i) + 8, v)
#define PV16(i, v) PV12(i, v), PV4((i) + 12, v)
#define PV64(i, v) PV16(i, v), PV16((i) + 16, v), PV16((i) + 32, v), PV16((i) + 48, v)

/* Overwrite sheets. The 8 x 8 sheet has 256 frames, so 0xFF is a real frame. */
static const uint8_t AVM_PROGMEM ow_16x16[2 + 128] = {16, 16, OW128(0)};
static const uint8_t AVM_PROGMEM ow_8x8[2 + 2048] = {8, 8, OW1024(0), OW1024(1024)};
static const uint8_t AVM_PROGMEM ow_4x8[2 + 16] = {4, 8, OW16(3)};
/* Plus-mask sheets: 16 x 16 and 12 x 12 with a partial final page. */
static const uint8_t AVM_PROGMEM pm_16x16[2 + 256] = {16, 16, PV64(0, 0xFF), PV64(64, 0xFF)};
#define PM12(i) PV12(i, 0xFF), PV12((i) + 12, 0x0F)
static const uint8_t AVM_PROGMEM pm_12x12[2 + 192] = {
    12, 12, PM12(5), PM12(29), PM12(53), PM12(77)};
/* Self-masked and erase sheets: 8 x 8 and 16 x 9. */
static const uint8_t AVM_PROGMEM sm_8x8[2 + 32] = {8, 8, OW32(7)};
#define SM169(i) V16(i, 0xFF), V16((i) + 16, 0x01)
static const uint8_t AVM_PROGMEM sm_16x9[2 + 128] = {
    16, 9, SM169(11), SM169(43), SM169(75), SM169(107)};

static const uint8_t AVM_PROGMEM background[1024] = {OW1024(101)};

/* The same 96 entries in the flash window and, copied at startup, in RAM. */
static const uint8_t map8_window[96] = {
      1, 255,   3,   2,  17, 128,   1,   0,   0,   2,   1,   0,   3,   3,   2,   2,
      0,   2,   1,   2, 254,   1, 255,   0,   3,   2,   2,   1,   3,   3,   3, 255,
      0, 255, 255,   0,   1,   2,   1,   0,   2, 255,   2,   3,   2,   3,   3,   2,
      1,   1,   4,   2,   3,   0, 255,   0,   1,   0, 254,   3,   2,   3,   2, 200,
      3, 255,   0,   2, 255, 255,   2,   3,   2, 200,   2,   0,   2,   2,   0,   0,
      1,   1, 255,   3,   2,   2,   0, 255,   2,   1, 255,   1,   2,   3,   0, 128,
};
static const uint16_t map16_window[96] = {
    0x0002, 0x0002, 0x0000, 0x0002, 0x0002, 0x0001, 0x0101, 0x0000,
    0x0002, 0x0001, 0x0000, 0x0001, 0xFFFF, 0xFF00, 0x0001, 0x0002,
    0x0003, 0x0000, 0x0003, 0x0002, 0x0001, 0x0001, 0xFFFF, 0x00FF,
    0xFFFF, 0x0002, 0x0001, 0xFFFF, 0x0002, 0x0001, 0x0101, 0x00FF,
    0x0003, 0xFFFF, 0x0002, 0x0000, 0x0001, 0xFFFE, 0x0001, 0x0001,
    0x0003, 0x0000, 0xFFFF, 0x0003, 0x0000, 0x0000, 0x0003, 0xFFFF,
    0x0001, 0x0003, 0x0003, 0xFFFF, 0x0002, 0x0003, 0x0002, 0x0003,
    0x0000, 0xFFFF, 0xFFFF, 0x0001, 0x0000, 0x0002, 0x0001, 0x0003,
    0x0003, 0xFFFF, 0x0002, 0x0002, 0x0002, 0xFFFF, 0x0000, 0x0003,
    0x0001, 0x0003, 0x0000, 0x0001, 0x0003, 0x0001, 0x0001, 0x0003,
    0x0001, 0x0002, 0x0003, 0x0001, 0x0000, 0x0001, 0x0000, 0x0000,
    0x0001, 0x0001, 0xFFFF, 0xFFFF, 0x0002, 0x0001, 0xFFFF, 0x0002,
};
static uint8_t map8_ram[96];
static uint16_t map16_ram[96];

enum { SOURCE_RAM, SOURCE_WINDOW };

struct geometry {
    int16_t x, y;
    uint8_t cols, rows;
    int16_t stride;
    uint8_t base; /* first drawn entry */
};

static const struct geometry geometries[] = {
    {0, 0, 9, 5, 11, 0},      /* page aligned, past the right and bottom edges */
    {-5, -3, 9, 5, 11, 3},    /* unaligned, clipped on every side */
    {100, 40, 6, 4, 7, 10},   /* partly off the right and bottom */
    {-30, 8, 40, 2, 41, 0},   /* rows wider than the screen */
    {2, -8, 9, 5, -11, 60},   /* negative stride */
    {60, -40, 3, 8, 2, 4},    /* rows above the screen, overlapping rows */
    {0, 0, 0, 3, 5, 0},       /* no columns */
    {40, -100, 2, 20, 4, 0},  /* many rows, most above the screen */
    {8, 48, 4, 3, 5, 20},     /* last rows below the screen */
    {5, 7, 3, 0, 3, 30},      /* no rows */
};
#define GEOMETRIES (sizeof(geometries) / sizeof(geometries[0]))

struct tile_case {
    const struct geometry *where;
    const uint8_t AVM_PROGMEM *sheet;
    uint8_t mode, u16, skip, source;
};
static struct tile_case current;

static void fill_background(void)
{
    memcpy_P(FRAMEBUFFER, background, 1024);
}

static uint32_t checksum(void)
{
    uint16_t a = 1, b = 0;
    for(uint16_t i = 0; i < 1024; ++i) {
        a = (uint16_t)(a + FRAMEBUFFER[i]);
        b = (uint16_t)(b + a);
    }
    return (uint32_t)a << 16 | b;
}

/* The documented equivalent of the tile map functions. */
__attribute__((noinline)) static void draw_reference(void)
{
    const struct geometry *g = current.where;
    uint8_t width = current.sheet[0], height = current.sheet[1];
    for(uint8_t row = 0; row < g->rows; ++row) {
        int16_t y = (int16_t)((uint16_t)g->y + (uint16_t)row * height);
        if(y >= 64)
            break;
        for(uint8_t col = 0; col < g->cols; ++col) {
            uint16_t index = (uint16_t)(g->base + (uint16_t)row * (uint16_t)g->stride + col);
            uint16_t entry = current.u16 ? map16_ram[index] : map8_ram[index];
            if(current.skip && entry == (current.u16 ? 0xFFFFu : 0x00FFu))
                continue;
            int16_t x = (int16_t)((uint16_t)g->x + (uint16_t)col * width);
            switch(current.mode) {
            case 0: avm_draw_overwrite(x, y, entry); break;
            case 1: avm_draw_plus_mask(x, y, entry); break;
            case 2: avm_draw_self_masked(x, y, entry); break;
            default: avm_draw_erase(x, y, entry); break;
            }
        }
    }
}

#define KEY(mode, u16, skip) ((mode) * 4 + (u16) * 2 + (skip))
#define DRAW(mode, u16, skip, name, map)                                \
    case KEY(mode, u16, skip):                                          \
        name(g->x, g->y, map, g->cols, g->rows, g->stride);             \
        break;
#define DRAW_MODE(m, mode_name)                                    \
    DRAW(m, 1, 0, avm_draw_tilemap_##mode_name, map16)             \
    DRAW(m, 1, 1, avm_draw_tilemap_##mode_name##_skip, map16)      \
    DRAW(m, 0, 0, avm_draw_tilemap_u8_##mode_name, map8)           \
    DRAW(m, 0, 1, avm_draw_tilemap_u8_##mode_name##_skip, map8)

__attribute__((noinline)) static void draw_named(void)
{
    const struct geometry *g = current.where;
    const uint16_t *map16 =
        (current.source == SOURCE_RAM ? map16_ram : map16_window) + g->base;
    const uint8_t *map8 =
        (current.source == SOURCE_RAM ? map8_ram : map8_window) + g->base;
    switch(KEY(current.mode, current.u16, current.skip)) {
        DRAW_MODE(0, overwrite)
        DRAW_MODE(1, plus_mask)
        DRAW_MODE(2, self_masked)
        DRAW_MODE(3, erase)
    default: break;
    }
}

__attribute__((noinline)) static void draw_raw(void)
{
    const struct geometry *g = current.where;
    const void *map = current.u16
        ? (const void *)((current.source == SOURCE_RAM ? map16_ram : map16_window) + g->base)
        : (const void *)((current.source == SOURCE_RAM ? map8_ram : map8_window) + g->base);
    avm_draw_tilemap_ex(g->x, g->y, map, g->cols, g->rows, g->stride,
        (avm_draw_mode_t)current.mode, current.u16 != 0, current.skip != 0);
}

static const uint8_t AVM_PROGMEM *sheet_for(uint8_t mode, uint8_t which)
{
    if(mode == 0)
        return which % 3 == 0 ? ow_16x16 : which % 3 == 1 ? ow_8x8 : ow_4x8;
    if(mode == 1)
        return which % 2 == 0 ? pm_16x16 : pm_12x12;
    return which % 2 == 0 ? sm_8x8 : sm_16x9;
}

static uint16_t changed;

static int check_case(uint16_t index, int raw)
{
    avm_set_sprite(current.sheet);
    fill_background();
    uint32_t blank = checksum();
    draw_reference();
    uint32_t expected = checksum();
    if(expected != blank)
        ++changed;
    fill_background();
    if(raw)
        draw_raw();
    else
        draw_named();
    if(checksum() != expected) {
        test_line16("CASE", index);
        return 1;
    }
    return 0;
}

/* No sprite is selected yet, so nothing may be drawn. */
static int check_unselected(void)
{
    fill_background();
    uint32_t blank = checksum();
    avm_draw_tilemap_u8_overwrite(0, 0, map8_window, 4, 4, 4);
    avm_draw_tilemap_overwrite(-3, 5, map16_window, 4, 4, 4);
    return checksum() == blank ? 0 : 1;
}

/* The system call preserves every register, including its inputs. */
__attribute__((noinline)) static int check_registers(void)
{
    uint16_t r0 = 0x0201, r1 = 0x1111, r2 = 5, r3 = 0x3333;
    int16_t r4 = -3, r5 = 9;
    const uint8_t *r6 = map8_window;
    uint16_t r7 = 3 << 8 | 4;
    avm_set_sprite(pm_12x12);
    __asm__ volatile("sys draw_tilemap"
        : "+{r0}"(r0), "+{r1}"(r1), "+{r2}"(r2), "+{r3}"(r3), "+{r4}"(r4), "+{r5}"(r5),
          "+{r6}"(r6), "+{r7}"(r7)
        :
        : "memory");
    return r0 == 0x0201 && r1 == 0x1111 && r2 == 5 && r3 == 0x3333 && r4 == -3 && r5 == 9 &&
           r6 == map8_window && r7 == (3 << 8 | 4) ? 0 : 1;
}

int avm_test_main(void)
{
    memcpy(map8_ram, map8_window, sizeof(map8_ram));
    memcpy(map16_ram, map16_window, sizeof(map16_ram));
    if((uintptr_t)map8_window < 0x0B00u || (uintptr_t)map16_window < 0x0B00u) {
        test_line16("CASE", 0xFFFF);
        return 1;
    }
    if(check_unselected()) {
        test_line16("CASE", 0xFFFE);
        return 1;
    }
    if(check_registers()) {
        test_line16("CASE", 0xFFFD);
        return 1;
    }

    uint16_t index = 0;
    /* Every named function over every geometry, from RAM and from the flash
       window, rotating through the sheets. */
    for(uint8_t key = 0; key < 16; ++key) {
        for(uint8_t g = 0; g < GEOMETRIES; ++g) {
            for(uint8_t source = SOURCE_RAM; source <= SOURCE_WINDOW; ++source, ++index) {
                current.where = &geometries[g];
                current.mode = (uint8_t)(key >> 2);
                current.u16 = (key >> 1) & 1;
                current.skip = key & 1;
                current.source = source;
                current.sheet = sheet_for(current.mode, (uint8_t)(g + key + source));
                if(check_case(index, 0))
                    return 1;
            }
        }
    }
    /* The raw form, over every combination of its settings. */
    for(uint8_t key = 0; key < 32; ++key, ++index) {
        current.where = &geometries[key & 1 ? 1 : 0];
        current.mode = (uint8_t)(key >> 3);
        current.u16 = (key >> 2) & 1;
        current.skip = (key >> 1) & 1;
        current.source = key & 1 ? SOURCE_WINDOW : SOURCE_RAM;
        current.sheet = sheet_for(current.mode, (uint8_t)(key >> 1));
        if(check_case(index, 1))
            return 1;
    }
    /* Guard against a test that compares two blank results. */
    if(changed < index / 2) {
        test_line16("DRAWN", changed);
        return 1;
    }
    return 0;
}
