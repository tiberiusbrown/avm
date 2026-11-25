#include <avm/pgmspace.h>
#include <stddef.h>
#include <stdint.h>

#include "test_hex_output.h"

/* The interpreter draws a sprite that lies completely on screen, starts on a
   framebuffer page boundary (y % 8 == 0) and, for overwrite, has a whole number
   of pages through a dedicated streaming path. Every other sprite takes the
   general clipping renderer. This test checks both paths against an
   independent per-pixel model of the documented drawing semantics: sprites of
   many sizes and both modes, drawn with explicit and cached pointers at
   positions that sit on, just inside, and just outside the conditions of the
   dedicated path, over a framebuffer of non-trivial background data. */

extern void __avm_set_sprite(const void AVM_PROGMEM *sprite);
extern void __avm_draw_sprite_overwrite(
    int x, int y, const void AVM_PROGMEM *sprite, unsigned int frame);
extern void __avm_draw_sprite_plus_mask(
    int x, int y, const void AVM_PROGMEM *sprite, unsigned int frame);
extern void __avm_draw_overwrite(int x, int y, unsigned int frame);
extern void __avm_draw_plus_mask(int x, int y, unsigned int frame);

#define FRAMEBUFFER ((uint8_t *)(uintptr_t)0x0500u)

enum { MODE_OVERWRITE = 0, MODE_PLUS_MASK = 1 };

/* Deterministic sprite data. Overwrite frames use any bits, including the
   padding bits of a partial final page. Plus-mask pairs satisfy
   image & ~mask == 0 and keep padding bits zero through the valid-bit mask v. */
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
#define PV1(i, v) ((uint8_t)(G(i) & M(i) & (v))), ((uint8_t)(M(i) & (v)))
#define PV2(i, v) PV1(i, v), PV1((i) + 1, v)
#define PV4(i, v) PV2(i, v), PV2((i) + 2, v)
#define PV8(i, v) PV4(i, v), PV4((i) + 4, v)
#define PV16(i, v) PV8(i, v), PV8((i) + 8, v)
#define PV32(i, v) PV16(i, v), PV16((i) + 16, v)
#define PV64(i, v) PV32(i, v), PV32((i) + 32, v)
#define PV128(i, v) PV64(i, v), PV64((i) + 64, v)

/* Overwrite sheets: width, height, frame data. */
static const uint8_t AVM_PROGMEM ow_1x8[2 + 3] = {1, 8, OW2(0), OW1(2)};
static const uint8_t AVM_PROGMEM ow_3x8[2 + 6] = {3, 8, OW4(0), OW2(4)};
static const uint8_t AVM_PROGMEM ow_8x8[2 + 16] = {8, 8, OW16(0)};
static const uint8_t AVM_PROGMEM ow_16x16[2 + 96] = {16, 16, OW64(0), OW32(64)};
static const uint8_t AVM_PROGMEM ow_5x24[2 + 30] = {5, 24, OW16(0), OW8(16), OW4(24), OW2(28)};
static const uint8_t AVM_PROGMEM ow_32x8[2 + 64] = {32, 8, OW64(0)};
static const uint8_t AVM_PROGMEM ow_128x8[2 + 128] = {128, 8, OW128(0)};
static const uint8_t AVM_PROGMEM ow_16x64[2 + 128] = {16, 64, OW128(0)};
/* A partial final page takes the general path in overwrite mode. */
static const uint8_t AVM_PROGMEM ow_7x11[2 + 28] = {7, 11, OW16(0), OW8(16), OW4(24)};

/* Plus-mask sheets: image and mask bytes interleaved per column. */
static const uint8_t AVM_PROGMEM pm_1x8[2 + 4] = {1, 8, PV2(0, 0xff)};
static const uint8_t AVM_PROGMEM pm_8x8[2 + 32] = {8, 8, PV16(0, 0xff)};
static const uint8_t AVM_PROGMEM pm_16x16[2 + 128] = {16, 16, PV32(0, 0xff), PV32(32, 0xff)};
static const uint8_t AVM_PROGMEM pm_5x24[2 + 30] = {5, 24, PV8(0, 0xff), PV4(8, 0xff), PV2(12, 0xff), PV1(14, 0xff)};
static const uint8_t AVM_PROGMEM pm_32x8[2 + 64] = {32, 8, PV32(0, 0xff)};
static const uint8_t AVM_PROGMEM pm_128x8[2 + 256] = {128, 8, PV128(0, 0xff)};
static const uint8_t AVM_PROGMEM pm_16x64[2 + 256] = {16, 64, PV128(0, 0xff)};
/* Partial final pages: padding bits are zero in both bytes. */
static const uint8_t AVM_PROGMEM pm_16x9[2 + 128] = {
    16, 9, PV16(0, 0xff), PV16(16, 0x01), PV16(32, 0xff), PV16(48, 0x01)};
static const uint8_t AVM_PROGMEM pm_7x3[2 + 28] = {7, 3, PV8(0, 0x07), PV4(8, 0x07), PV2(12, 0x07)};

struct sheet {
    const uint8_t AVM_PROGMEM *data;
    uint8_t mode;
    uint8_t frames;
};

static const struct sheet sheets[] = {
    {ow_1x8, MODE_OVERWRITE, 3},   {ow_3x8, MODE_OVERWRITE, 2},
    {ow_8x8, MODE_OVERWRITE, 2},   {ow_16x16, MODE_OVERWRITE, 3},
    {ow_5x24, MODE_OVERWRITE, 2},  {ow_32x8, MODE_OVERWRITE, 2},
    {ow_128x8, MODE_OVERWRITE, 1}, {ow_16x64, MODE_OVERWRITE, 1},
    {ow_7x11, MODE_OVERWRITE, 2},  {pm_1x8, MODE_PLUS_MASK, 2},
    {pm_8x8, MODE_PLUS_MASK, 2},   {pm_16x16, MODE_PLUS_MASK, 2},
    {pm_5x24, MODE_PLUS_MASK, 1},  {pm_32x8, MODE_PLUS_MASK, 1},
    {pm_128x8, MODE_PLUS_MASK, 1}, {pm_16x64, MODE_PLUS_MASK, 1},
    {pm_16x9, MODE_PLUS_MASK, 2},  {pm_7x3, MODE_PLUS_MASK, 2},
};

/* The background lives in program memory so that the framebuffer can be filled
   and its untouched areas compared with memcpy_P and memcmp_P; comparing all
   1024 bytes in guest code would dominate the test. */
static const uint8_t AVM_PROGMEM background[1024] = {
    OW128(300), OW128(428), OW128(556), OW128(684),
    OW128(1111), OW128(1239), OW128(1367), OW128(1495)};

/* Bands just below and just above the framebuffer, unused by this program (its
   data ends far below the first, and its stack stays far above the second),
   catch writes that run past a screen edge. */
#define GUARD_BYTES 64u
#define GUARD_BEFORE ((uint8_t *)(uintptr_t)(0x0500u - GUARD_BYTES))
#define GUARD_AFTER ((uint8_t *)(uintptr_t)0x0900u)

static void fill_background(void)
{
    memcpy_P(FRAMEBUFFER, background, 1024u);
    memcpy_P(GUARD_BEFORE, background, GUARD_BYTES);
    memcpy_P(GUARD_AFTER, background, GUARD_BYTES);
}

static int guards_intact(void)
{
    return memcmp_P(GUARD_BEFORE, background, GUARD_BYTES) == 0 &&
           memcmp_P(GUARD_AFTER, background, GUARD_BYTES) == 0;
}

/* The byte that the framebuffer should hold at (column, page) after drawing
   the sprite at (x, y), computed pixel by pixel from the documented semantics. */
static uint8_t expected_byte(uint8_t column, uint8_t page, int x, int y, uint8_t width,
                             uint8_t height, uint8_t mode,
                             const uint8_t AVM_PROGMEM *frame_data)
{
    uint8_t value = background[(uint16_t)page * 128u + column];
    uint8_t source_column = (uint8_t)((int)column - x);
    int first_row = (int)page * 8 - y;
    for(uint8_t bit = 0; bit != 8; ++bit) {
        int source_row = first_row + bit;
        if(source_row < 0 || source_row >= height)
            continue;
        uint8_t source_page = (uint8_t)((uint8_t)source_row >> 3);
        uint8_t source_bit = (uint8_t)(source_row & 7);
        uint16_t index = (uint16_t)(source_page * width + source_column);
        uint8_t mask_bit = 1;
        uint8_t image_bit;
        if(mode == MODE_PLUS_MASK) {
            image_bit = (uint8_t)((frame_data[2u * index] >> source_bit) & 1u);
            mask_bit = (uint8_t)((frame_data[2u * index + 1u] >> source_bit) & 1u);
        } else {
            image_bit = (uint8_t)((frame_data[index] >> source_bit) & 1u);
        }
        uint8_t keep = (uint8_t)(1u << bit);
        if(mask_bit)
            value = (uint8_t)((value & ~keep) | (image_bit ? keep : 0u));
    }
    return value;
}

static int framebuffer_matches(const struct sheet *sheet, int x, int y, unsigned int frame)
{
    const uint8_t AVM_PROGMEM *data = sheet->data;
    uint8_t width = data[0], height = data[1];
    uint8_t mode = sheet->mode;
    uint8_t pages = (uint8_t)((height + 7u) >> 3);
    uint16_t stride = (uint16_t)((uint16_t)width * pages * (mode == MODE_PLUS_MASK ? 2u : 1u));
    const uint8_t AVM_PROGMEM *frame_data = data + 2 + (uint16_t)frame * stride;
    int first = x < 0 ? 0 : x;
    int end = x + width > 128 ? 128 : x + width;
    for(uint8_t page = 0; page != 8; ++page) {
        uint16_t base = (uint16_t)page * 128u;
        int page_top = page * 8;
        if(first >= end || page_top + 8 <= y || page_top >= y + height) {
            if(memcmp_P(FRAMEBUFFER + base, background + base, 128u) != 0)
                return 0;
            continue;
        }
        if(memcmp_P(FRAMEBUFFER + base, background + base, (size_t)first) != 0 ||
           memcmp_P(FRAMEBUFFER + base + end, background + base + end, (size_t)(128 - end)) != 0)
            return 0;
        for(uint8_t column = (uint8_t)first; column != (uint8_t)end; ++column) {
            if(FRAMEBUFFER[base + column] !=
               expected_byte(column, page, x, y, width, height, mode, frame_data))
                return 0;
        }
    }
    return 1;
}

static void draw_explicit(const struct sheet *sheet, int x, int y, unsigned int frame)
{
    if(sheet->mode == MODE_PLUS_MASK)
        __avm_draw_sprite_plus_mask(x, y, sheet->data, frame);
    else
        __avm_draw_sprite_overwrite(x, y, sheet->data, frame);
}

static void draw_cached(const struct sheet *sheet, int x, int y, unsigned int frame)
{
    __avm_set_sprite(sheet->data);
    if(sheet->mode == MODE_PLUS_MASK)
        __avm_draw_plus_mask(x, y, frame);
    else
        __avm_draw_overwrite(x, y, frame);
}

static int fail_case(uint16_t index)
{
    test_line16("CASE", index);
    return 1;
}

static int check(uint16_t index, const struct sheet *sheet, int x, int y, unsigned int frame,
                 int cached)
{
    fill_background();
    if(cached)
        draw_cached(sheet, x, y, frame);
    else
        draw_explicit(sheet, x, y, frame);
    if(!guards_intact() || !framebuffer_matches(sheet, x, y, frame))
        return fail_case(index);
    return 0;
}

int avm_test_main(void)
{
    uint16_t index = 0;
    for(uint8_t s = 0; s != sizeof(sheets) / sizeof(sheets[0]); ++s) {
        const struct sheet *sheet = &sheets[s];
        int width = sheet->data[0], height = sheet->data[1];
        int last_x = 128 - width;
        int last_y = (64 - height) & ~7;       /* lowest aligned row that is fully on screen */
        unsigned int frame = sheet->frames > 1 ? 1u : 0u;
        int positions[][2] = {
            {0, 0},                            /* top-left corner, on screen */
            {last_x, last_y},                  /* bottom-right corner, on screen */
            {last_x / 2, last_y > 8 ? 8 : 0},  /* middle */
            {last_x + 1, 0},                   /* one column off the right edge */
            {-1, last_y},                      /* one column off the left edge */
            {0, last_y + 8},                   /* one page off the bottom edge */
            {last_x, -8},                      /* one page above the top edge */
            {0, 1},                            /* one row below a page boundary */
            {last_x, last_y > 0 ? last_y - 1 : 7},
            {width < 128 ? 129 - width + 1 : 0, 8},
        };
        /* Every position with an explicit pointer; the on-screen corner and
           middle positions again through the cached pointer and a later frame. */
        for(uint8_t p = 0; p != sizeof(positions) / sizeof(positions[0]); ++p) {
            if(check(index, sheet, positions[p][0], positions[p][1], 0, 0))
                return 1;
            ++index;
            if(p < 3) {
                if(check(index, sheet, positions[p][0], positions[p][1], frame, 1))
                    return 1;
                ++index;
            }
        }
    }
    return 0;
}
