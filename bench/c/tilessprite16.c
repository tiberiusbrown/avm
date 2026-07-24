#include <stdint.h>
#include <avm/pgmspace.h>

inline void debug_break() { __avm_debug_break(); }

static const uint8_t SPRITE[] AVM_PROGMEM = {
    16, 16,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};

int offx = 3;
int offy = 2;

int avm_test_main()
{
    debug_break();
    
    for(uint8_t y = 0; y < 4; y = y + 1)
        for(uint8_t x = 0; x < 8; x = x + 1)
            __avm_draw_sprite_overwrite(x * 16 + offx, y * 16 + offy, SPRITE, 0);

    debug_break();

    return 0;
}
