#include <stdint.h>
#include <avm/pgmspace.h>

inline void debug_break() { __avm_debug_break(); }

static const uint8_t SPRITE[] AVM_PROGMEM = {
    8, 8,
    0x3c, 0x7e, 0xdb, 0xbf, 0xbf, 0xdb, 0x7e, 0x3c
};

int offx = 3;
int offy = 2;

int avm_test_main()
{
    debug_break();
    
    for(uint8_t y = 0; y < 8; y = y + 1)
        for(uint8_t x = 0; x < 16; x = x + 1)
            __avm_draw_sprite_overwrite(x * 8 + offx, y * 8 + offy, SPRITE, 0);

    debug_break();

    return 0;
}
