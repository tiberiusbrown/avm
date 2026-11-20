#include <avm.h>

static int check_glyph(const avm_font_t AVM_PROGMEM *font, const char *text,
                       int x, int y, unsigned advance, unsigned line_height,
                       unsigned width, unsigned pages, const uint8_t *bitmap)
{
    avm_set_text_font(font);
    for (unsigned i = 0; i < sizeof(__avm_framebuffer); ++i)
        __avm_framebuffer[i] = 0;

    avm_text_cursor_t cursor = avm_draw_text(x, y, text);
    if (cursor.x != x + (int)advance || cursor.baseline_y != y)
        return 1;

    // The selected baseline and origin put the glyph at framebuffer (8, 0).
    for (unsigned page = 0; page < 8; ++page) {
        for (unsigned column = 0; column < 128; ++column) {
            uint8_t expected = 0;
            if (page < pages && column >= 8 && column < 8 + width)
                expected = bitmap[page * width + column - 8];
            if (__avm_framebuffer[page * 128 + column] != expected)
                return 2;
        }
    }

    cursor = avm_draw_text(x, y, "\n");
    return cursor.x != x || cursor.baseline_y != y + (int)line_height ? 3 : 0;
}

int avm_test_main(void)
{
    // Page bytes from the ABC glyphs for Retron 2000 'A' and Monogram Italic ÿ.
    static const uint8_t retron_a[] = {
        0x00, 0xf8, 0xfc, 0xfe, 0x1f, 0x0f, 0x07, 0x07,
        0x07, 0x07, 0x07, 0x0f, 0x1f, 0xfe, 0xfc, 0xf8,
        0x00, 0xff, 0xff, 0xff, 0x0e, 0x0e, 0x0e, 0x0e,
        0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0xff, 0xff, 0xff,
        0x00, 0x1f, 0x1f, 0x1f, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0x1f, 0x1f,
    };
    static const uint8_t monogram_y_diaeresis[] = {
        0x38, 0x44, 0x41, 0xc0, 0x3d, 0x00, 0x01, 0x01, 0x00, 0x00,
    };
    avm_set_text_mode(AVM_TEXT_WHITE_TRANSPARENT);
    int result = check_glyph(AVM_FONT_RETRON2000, "A", 6, 21, 18, 27,
                             16, 3, retron_a);
    if (result)
        return result;
    return check_glyph(AVM_FONT_MONOGRAMITALIC, "\xff", 8, 7, 6, 10,
                       5, 2, monogram_y_diaeresis) * 10;
}
