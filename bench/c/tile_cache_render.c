#include <stdint.h>
#include <avm/pgmspace.h>

enum { TILE = 16, CACHE_WIDTH = 9, CACHE_HEIGHT = 5, TILE_OUTSIDE = 255 };

static const uint8_t SPRITES[] AVM_PROGMEM = {
    16, 16,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa,
    0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa,
    0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55,
    0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55,
};

static uint8_t tile_cache[CACHE_WIDTH * CACHE_HEIGHT];
static uint16_t camera_x;
static uint16_t camera_y;

__attribute__((noinline)) static void render_tile_cache(void)
{
    int16_t left = -(int16_t)(camera_x & (TILE - 1));
    int16_t top = -(int16_t)(camera_y & (TILE - 1));
    const uint8_t* tiles = tile_cache;
    __avm_set_sprite(SPRITES);
    for(int16_t y = top; y < (CACHE_HEIGHT - 1) * TILE; y += TILE) {
        const uint8_t* row_end = tiles + CACHE_WIDTH;
        for(int16_t x = left; tiles != row_end; x += TILE) {
            uint8_t tile = *tiles++;
            if(tile == TILE_OUTSIDE)
                continue;
            __avm_draw_overwrite(x, y, tile);
        }
    }
}

int avm_test_main(void)
{
    for(uint8_t i = 0; i < CACHE_WIDTH * CACHE_HEIGHT; ++i)
        tile_cache[i] = i % 11 == 0 ? TILE_OUTSIDE : i & 1;

    __avm_debug_break();
    for(uint16_t frame = 0; frame < 64; ++frame) {
        camera_x = frame;
        camera_y = frame >> 2;
        render_tile_cache();
    }
    __avm_debug_break();
    return 0;
}
