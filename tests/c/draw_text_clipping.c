#include <avm.h>

#include <stdint.h>

#include "test_hex_output.h"

#define FRAMEBUFFER ((uint8_t *)(uintptr_t)0x0500u)
#define FRAMEBUFFER_WIDTH 128
#define FRAMEBUFFER_HEIGHT 64
#define FRAMEBUFFER_SIZE 1024u

#define GUARD_BEFORE ((volatile uint8_t *)(uintptr_t)0x04fcu)
#define GUARD_AFTER ((volatile uint8_t *)(uintptr_t)0x0900u)
#define GUARD_SIZE 4u

/*
 * This test intentionally defines raw packed font blobs instead of using
 * avm_font_glyph_t. The interpreter under test uses the optimized seven-byte
 * record format:
 *
 *   h, yoff, w, xoff, imageOffsetLo, imageOffsetHi, xadv
 *
 * imageOffset is relative to the glyph-table base (font + 3).
 */
typedef struct __attribute__((packed)) {
    uint8_t h;
    int8_t yoff;
    uint8_t w;
    int8_t xoff;
    uint8_t image_offset[2];
    uint8_t xadv;
} test_glyph_record_t;

typedef struct __attribute__((packed)) {
    uint8_t line_height;
    uint8_t glyph_first;
    uint8_t num_glyphs;
    test_glyph_record_t glyphs[2];
    uint8_t images[7];
} single_page_font_storage_t;

typedef struct __attribute__((packed)) {
    uint8_t line_height;
    uint8_t glyph_first;
    uint8_t num_glyphs;
    test_glyph_record_t glyphs[2];
    uint8_t images[17];
} multi_page_font_storage_t;

#define U16_LE(value)                                                        \
    {                                                                        \
        (uint8_t)((value) & 0xffu),                                          \
        (uint8_t)(((value) >> 8) & 0xffu),                                   \
    }

enum {
    GLYPH_TABLE_BYTES = 2 * 7,

    SINGLE_A_IMAGE_OFFSET = GLYPH_TABLE_BYTES,
    SINGLE_B_IMAGE_OFFSET = SINGLE_A_IMAGE_OFFSET + 3,

    MULTI_A_IMAGE_OFFSET = GLYPH_TABLE_BYTES,
    MULTI_B_IMAGE_OFFSET = MULTI_A_IMAGE_OFFSET + 8,
};

static single_page_font_storage_t const AVM_PROGMEM single_page_font = {
    10, 'A', 2,
    {
        /* A: one partial source page, negative left bearing. */
        {7, -6, 3, -1, U16_LE(SINGLE_A_IMAGE_OFFSET), 4},

        /* B: one aligned source page, positive left bearing. */
        {8, -4, 4, 1, U16_LE(SINGLE_B_IMAGE_OFFSET), 6},
    },
    {
        /* A, page 0. */
        0x7f, 0x09, 0x7f,

        /* B, page 0. */
        0xff, 0x91, 0x91, 0x6e,
    },
};

static multi_page_font_storage_t const AVM_PROGMEM multi_page_font = {
    19, 'A', 2,
    {
        /* A: two source pages, partial final page, negative left bearing. */
        {13, -10, 4, -1, U16_LE(MULTI_A_IMAGE_OFFSET), 5},

        /* B: three source pages, partial final page, positive left bearing. */
        {17, -8, 3, 1, U16_LE(MULTI_B_IMAGE_OFFSET), 5},
    },
    {
        /* A, page 0. */
        0x81, 0x42, 0x24, 0x18,
        /* A, page 1: only low five bits are part of the glyph. */
        0x1f, 0x11, 0x0a, 0x04,

        /* B, page 0. */
        0xff, 0x81, 0xff,
        /* B, page 1. */
        0x18, 0x3c, 0x7e,
        /* B, page 2: only bit zero is part of the glyph. */
        0x01, 0x00, 0x01,
    },
};

_Static_assert(sizeof(test_glyph_record_t) == 7,
               "optimized glyph records must be seven bytes");
_Static_assert(sizeof(single_page_font.glyphs) == GLYPH_TABLE_BYTES,
               "single-page font glyph-table size mismatch");
_Static_assert(sizeof(multi_page_font.glyphs) == GLYPH_TABLE_BYTES,
               "multi-page font glyph-table size mismatch");

enum font_kind {
    FONT_SINGLE_PAGE,
    FONT_MULTI_PAGE,
};

enum draw_api {
    DRAW_RAM,
    DRAW_PROGRAM,
    DRAW_FORMATTED,
};

enum text_id {
    TEXT_A,
    TEXT_B,
    TEXT_AB,
    TEXT_BA,
    TEXT_A_NEWLINE_B,
};

typedef struct {
    uint8_t h;
    int8_t yoff;
    uint8_t w;
    int8_t xoff;
    uint8_t xadv;
} reference_glyph_t;

/* Data-space copies used only by the independent reference renderer. */
static uint8_t single_a_image[] = {0x7f, 0x09, 0x7f};
static uint8_t single_b_image[] = {0xff, 0x91, 0x91, 0x6e};

static uint8_t multi_a_image[] = {
    0x81, 0x42, 0x24, 0x18,
    0x1f, 0x11, 0x0a, 0x04,
};

static uint8_t multi_b_image[] = {
    0xff, 0x81, 0xff,
    0x18, 0x3c, 0x7e,
    0x01, 0x00, 0x01,
};

static char ram_a[] = "A";
static char ram_b[] = "B";
static char ram_ab[] = "AB";
static char ram_ba[] = "BA";
static char ram_a_newline_b[] = "A\nB";

static char const AVM_PROGMEM program_a[] = "A";
static char const AVM_PROGMEM program_b[] = "B";
static char const AVM_PROGMEM program_ab[] = "AB";
static char const AVM_PROGMEM program_ba[] = "BA";
static char const AVM_PROGMEM program_a_newline_b[] = "A\nB";

static char format_one[] = "%c";
static char format_two[] = "%c%c";
static char format_newline[] = "%c\n%c";

static uint8_t initial_byte(uint16_t index, uint8_t seed)
{
    return (uint8_t)((uint8_t)(index * 37u) ^
                     (uint8_t)(index >> 2) ^ seed);
}

static uint8_t guard_before_byte(uint8_t index, uint8_t seed)
{
    return (uint8_t)(seed ^ (uint8_t)(0xa5u + index * 17u));
}

static uint8_t guard_after_byte(uint8_t index, uint8_t seed)
{
    return (uint8_t)(seed ^ (uint8_t)(0x5au + index * 29u));
}

static void prepare_memory(uint8_t seed)
{
    uint16_t i;
    uint8_t guard;

    for(guard = 0; guard != GUARD_SIZE; ++guard) {
        GUARD_BEFORE[guard] = guard_before_byte(guard, seed);
        GUARD_AFTER[guard] = guard_after_byte(guard, seed);
    }

    for(i = 0; i != FRAMEBUFFER_SIZE; ++i)
        FRAMEBUFFER[i] = initial_byte(i, seed);
}

static int fail_byte(uint16_t case_index, uint16_t address,
                     uint8_t expected, uint8_t actual)
{
    test_line16("CASE", case_index);
    test_line16("ADDR", address);
    test_line16("WANT", expected);
    test_line16("GOT", actual);
    return 1;
}

static int fail_cursor(uint16_t case_index,
                       int16_t expected_x, int16_t actual_x,
                       int16_t expected_y, int16_t actual_y)
{
    test_line16("CASE", case_index);
    test_line16("XWANT", (uint16_t)expected_x);
    test_line16("XGOT", (uint16_t)actual_x);
    test_line16("YWANT", (uint16_t)expected_y);
    test_line16("YGOT", (uint16_t)actual_y);
    return 1;
}

static int check_guards(uint16_t case_index, uint8_t seed)
{
    uint8_t i;

    for(i = 0; i != GUARD_SIZE; ++i) {
        uint8_t expected = guard_before_byte(i, seed);
        uint8_t actual = GUARD_BEFORE[i];
        if(actual != expected)
            return fail_byte(case_index, (uint16_t)(0x04fcu + i),
                             expected, actual);
    }

    for(i = 0; i != GUARD_SIZE; ++i) {
        uint8_t expected = guard_after_byte(i, seed);
        uint8_t actual = GUARD_AFTER[i];
        if(actual != expected)
            return fail_byte(case_index, (uint16_t)(0x0900u + i),
                             expected, actual);
    }

    return 0;
}

static avm_font_t const AVM_PROGMEM *font_pointer(uint8_t font)
{
    if(font == FONT_SINGLE_PAGE)
        return (avm_font_t const AVM_PROGMEM *)&single_page_font;
    return (avm_font_t const AVM_PROGMEM *)&multi_page_font;
}

static uint8_t font_line_height(uint8_t font)
{
    return font == FONT_SINGLE_PAGE ? 10u : 19u;
}

static void reference_glyph(uint8_t font, char ch, reference_glyph_t *glyph)
{
    if(font == FONT_SINGLE_PAGE) {
        if(ch == 'A') {
            glyph->h = 7;
            glyph->yoff = -6;
            glyph->w = 3;
            glyph->xoff = -1;
            glyph->xadv = 4;
        }
        else {
            glyph->h = 8;
            glyph->yoff = -4;
            glyph->w = 4;
            glyph->xoff = 1;
            glyph->xadv = 6;
        }
    }
    else {
        if(ch == 'A') {
            glyph->h = 13;
            glyph->yoff = -10;
            glyph->w = 4;
            glyph->xoff = -1;
            glyph->xadv = 5;
        }
        else {
            glyph->h = 17;
            glyph->yoff = -8;
            glyph->w = 3;
            glyph->xoff = 1;
            glyph->xadv = 5;
        }
    }
}

static uint8_t reference_image_byte(
    uint8_t font, char ch, uint8_t page, uint8_t column)
{
    if(font == FONT_SINGLE_PAGE) {
        if(ch == 'A')
            return single_a_image[column];
        return single_b_image[column];
    }

    if(ch == 'A')
        return multi_a_image[(uint8_t)(page * 4u + column)];
    return multi_b_image[(uint8_t)(page * 3u + column)];
}

static uint8_t logical_length(uint8_t text)
{
    switch(text) {
    case TEXT_A:
    case TEXT_B:
        return 1;
    case TEXT_AB:
    case TEXT_BA:
        return 2;
    default:
        return 3;
    }
}

static char logical_char(uint8_t text, uint8_t index)
{
    switch(text) {
    case TEXT_A:
        return 'A';
    case TEXT_B:
        return 'B';
    case TEXT_AB:
        return index == 0 ? 'A' : 'B';
    case TEXT_BA:
        return index == 0 ? 'B' : 'A';
    default:
        if(index == 0)
            return 'A';
        if(index == 1)
            return '\n';
        return 'B';
    }
}

static char *ram_text(uint8_t text)
{
    switch(text) {
    case TEXT_A:
        return ram_a;
    case TEXT_B:
        return ram_b;
    case TEXT_AB:
        return ram_ab;
    case TEXT_BA:
        return ram_ba;
    default:
        return ram_a_newline_b;
    }
}

static char const AVM_PROGMEM *program_text(uint8_t text)
{
    switch(text) {
    case TEXT_A:
        return program_a;
    case TEXT_B:
        return program_b;
    case TEXT_AB:
        return program_ab;
    case TEXT_BA:
        return program_ba;
    default:
        return program_a_newline_b;
    }
}

static avm_text_cursor_t invoke_draw(
    uint8_t api, uint8_t text, int16_t x, int16_t baseline_y)
{
    if(api == DRAW_RAM)
        return avm_draw_text(x, baseline_y, ram_text(text));

    if(api == DRAW_PROGRAM)
        return avm_draw_text_P(x, baseline_y, program_text(text));

    switch(text) {
    case TEXT_A:
        return avm_draw_textf(x, baseline_y, format_one, 'A');
    case TEXT_B:
        return avm_draw_textf(x, baseline_y, format_one, 'B');
    case TEXT_AB:
        return avm_draw_textf(x, baseline_y, format_two, 'A', 'B');
    case TEXT_BA:
        return avm_draw_textf(x, baseline_y, format_two, 'B', 'A');
    default:
        return avm_draw_textf(x, baseline_y, format_newline, 'A', 'B');
    }
}

static void reference_cursor(
    uint8_t font, uint8_t text, int16_t initial_x, int16_t initial_baseline,
    int16_t *final_x, int16_t *final_baseline)
{
    int16_t cursor_x = initial_x;
    int16_t baseline_y = initial_baseline;
    uint8_t i;

    for(i = 0; i != logical_length(text); ++i) {
        char ch = logical_char(text, i);
        reference_glyph_t glyph;

        if(ch == '\n') {
            cursor_x = initial_x;
            baseline_y =
                (int16_t)(baseline_y + (int16_t)font_line_height(font));
            continue;
        }

        reference_glyph(font, ch, &glyph);
        cursor_x = (int16_t)(cursor_x + (int16_t)glyph.xadv);
    }

    *final_x = cursor_x;
    *final_baseline = baseline_y;
}

static uint8_t expected_byte(
    uint8_t font, uint8_t mode, uint8_t text,
    int16_t initial_x, int16_t initial_baseline,
    uint16_t framebuffer_index, uint8_t seed)
{
    uint8_t value = initial_byte(framebuffer_index, seed);
    int target_x = (int)(framebuffer_index & 127u);
    int page_top = (int)(framebuffer_index >> 7) * 8;
    int16_t cursor_x = initial_x;
    int16_t baseline_y = initial_baseline;
    uint8_t text_index;

    for(text_index = 0; text_index != logical_length(text); ++text_index) {
        char ch = logical_char(text, text_index);
        reference_glyph_t glyph;
        int glyph_x;
        int glyph_y;
        uint8_t source_x;

        if(ch == '\n') {
            cursor_x = initial_x;
            baseline_y =
                (int16_t)(baseline_y + (int16_t)font_line_height(font));
            continue;
        }

        reference_glyph(font, ch, &glyph);
        glyph_x = (int)cursor_x + (int)glyph.xoff;
        glyph_y = (int)baseline_y + (int)glyph.yoff;

        for(source_x = 0; source_x != glyph.w; ++source_x) {
            int screen_x = glyph_x + (int)source_x;
            uint8_t source_y;

            if(screen_x != target_x)
                continue;

            for(source_y = 0; source_y != glyph.h; ++source_y) {
                int screen_y = glyph_y + (int)source_y;
                uint8_t source_byte;
                uint8_t source_mask;
                uint8_t framebuffer_mask;
                int source_set;

                if(screen_y < page_top || screen_y >= page_top + 8)
                    continue;
                if(screen_y < 0 || screen_y >= FRAMEBUFFER_HEIGHT)
                    continue;

                source_byte = reference_image_byte(
                    font, ch, (uint8_t)(source_y >> 3), source_x);
                source_mask = (uint8_t)(1u << (source_y & 7u));
                source_set = (source_byte & source_mask) != 0;
                framebuffer_mask =
                    (uint8_t)(1u << (uint8_t)(screen_y - page_top));

                if(mode == AVM_TEXT_OVERWRITE) {
                    if(source_set)
                        value |= framebuffer_mask;
                    else
                        value &= (uint8_t)~framebuffer_mask;
                }
                else if(mode == AVM_TEXT_WHITE_TRANSPARENT) {
                    if(source_set)
                        value |= framebuffer_mask;
                }
                else {
                    if(source_set)
                        value &= (uint8_t)~framebuffer_mask;
                }
            }
        }

        cursor_x = (int16_t)(cursor_x + (int16_t)glyph.xadv);
    }

    return value;
}

static int check_case(
    uint16_t case_index,
    uint8_t font,
    uint8_t mode,
    uint8_t api,
    uint8_t text,
    int16_t x,
    int16_t baseline_y,
    uint8_t seed)
{
    avm_text_cursor_t cursor;
    int16_t expected_x;
    int16_t expected_y;
    uint16_t i;

    prepare_memory(seed);
    avm_set_text_font(font_pointer(font));
    avm_set_text_mode((avm_text_mode_t)mode);
    cursor = invoke_draw(api, text, x, baseline_y);

    reference_cursor(
        font, text, x, baseline_y, &expected_x, &expected_y);
    if(cursor.x != expected_x || cursor.baseline_y != expected_y)
        return fail_cursor(
            case_index, expected_x, cursor.x, expected_y, cursor.baseline_y);

    if(check_guards(case_index, seed))
        return 1;

    for(i = 0; i != FRAMEBUFFER_SIZE; ++i) {
        uint8_t expected =
            expected_byte(font, mode, text, x, baseline_y, i, seed);
        uint8_t actual = FRAMEBUFFER[i];

        if(actual != expected)
            return fail_byte(case_index, (uint16_t)(0x0500u + i),
                             expected, actual);
    }

    return 0;
}

int avm_test_main(void)
{
    /*
     * Single-page font. Each public drawing path is exercised, including
     * unaligned placement and clipping on every framebuffer edge.
     */
    if(check_case(0u, FONT_SINGLE_PAGE, AVM_TEXT_OVERWRITE,
                  DRAW_RAM, TEXT_AB, 6, 12, 0x31u))
        return 1;
    if(check_case(1u, FONT_SINGLE_PAGE, AVM_TEXT_WHITE_TRANSPARENT,
                  DRAW_PROGRAM, TEXT_AB, -2, 9, 0xc7u))
        return 1;
    if(check_case(2u, FONT_SINGLE_PAGE, AVM_TEXT_BLACK_TRANSPARENT,
                  DRAW_FORMATTED, TEXT_BA, 125, 11, 0x5au))
        return 1;
    if(check_case(3u, FONT_SINGLE_PAGE, AVM_TEXT_OVERWRITE,
                  DRAW_RAM, TEXT_A, 31, 3, 0x96u))
        return 1;
    if(check_case(4u, FONT_SINGLE_PAGE, AVM_TEXT_WHITE_TRANSPARENT,
                  DRAW_PROGRAM, TEXT_B, 75, 63, 0xa5u))
        return 1;
    if(check_case(5u, FONT_SINGLE_PAGE, AVM_TEXT_BLACK_TRANSPARENT,
                  DRAW_FORMATTED, TEXT_BA, -3, 2, 0x69u))
        return 1;

    /*
     * Multi-page font. The left-clipped cases force source-row reseeks, while
     * top and bottom cases remove complete and partial source pages.
     */
    if(check_case(6u, FONT_MULTI_PAGE, AVM_TEXT_OVERWRITE,
                  DRAW_RAM, TEXT_AB, 8, 24, 0x3cu))
        return 1;
    if(check_case(7u, FONT_MULTI_PAGE, AVM_TEXT_WHITE_TRANSPARENT,
                  DRAW_PROGRAM, TEXT_AB, -2, 22, 0xc3u))
        return 1;
    if(check_case(8u, FONT_MULTI_PAGE, AVM_TEXT_BLACK_TRANSPARENT,
                  DRAW_FORMATTED, TEXT_BA, 125, 24, 0x55u))
        return 1;
    if(check_case(9u, FONT_MULTI_PAGE, AVM_TEXT_OVERWRITE,
                  DRAW_RAM, TEXT_A, 48, 5, 0xaau))
        return 1;
    if(check_case(10u, FONT_MULTI_PAGE, AVM_TEXT_WHITE_TRANSPARENT,
                  DRAW_PROGRAM, TEXT_B, 64, 60, 0x0fu))
        return 1;
    if(check_case(11u, FONT_MULTI_PAGE, AVM_TEXT_BLACK_TRANSPARENT,
                  DRAW_FORMATTED, TEXT_AB, 126, 61, 0xf0u))
        return 1;

    /* Newline/cursor behavior with unaligned multi-page rendering. */
    if(check_case(12u, FONT_MULTI_PAGE, AVM_TEXT_OVERWRITE,
                  DRAW_RAM, TEXT_A_NEWLINE_B, 20, 14, 0x87u))
        return 1;

    /* Fully clipped draws must still apply glyph advances to the cursor. */
    if(check_case(13u, FONT_MULTI_PAGE, AVM_TEXT_WHITE_TRANSPARENT,
                  DRAW_PROGRAM, TEXT_AB, 12, -20, 0x78u))
        return 1;
    if(check_case(14u, FONT_SINGLE_PAGE, AVM_TEXT_BLACK_TRANSPARENT,
                  DRAW_FORMATTED, TEXT_AB, 130, 20, 0x1eu))
        return 1;

    /*
     * One formatted call combines top clipping, left clipping, a newline, and
     * a later visible multi-page glyph.
     */
    if(check_case(15u, FONT_MULTI_PAGE, AVM_TEXT_OVERWRITE,
                  DRAW_FORMATTED, TEXT_A_NEWLINE_B, -1, -2, 0xe1u))
        return 1;

    return 0;
}
