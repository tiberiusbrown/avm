#include <stdint.h>
#include <avm/pgmspace.h>

static inline void debug_break() { __avm_debug_break(); }

static inline void draw_filled_rect(
    int16_t x, int16_t y, uint8_t w, uint8_t h, uint8_t c)
{
    if(c)
        __avm_draw_filled_rect_white(x, y, w, h);
    else
        __avm_draw_filled_rect_black(x, y, w, h);
}

int avm_test_main()
{
    debug_break();
    
    uint8_t color = 0;
    for(uint8_t y = 0; y < 8; y += 1)
    {
        for(uint8_t x = 0; x < 16; x += 1)
        {
            draw_filled_rect(x, y, 8, 8, color);
            color = !color;
        }
        color = !color;
    }

    debug_break();

    return 0;
}
