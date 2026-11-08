#include <stdint.h>

static uint8_t source[128];
static uint8_t destination[128];
static volatile uint16_t pointer_walk_result;

int avm_test_main(void)
{
    for (uint16_t i = 0; i < 128; ++i)
        source[i] = (uint8_t)(i * 11u + 7u);

    __avm_debug_break();

    uint16_t checksum = 0;
    uint8_t state = 0x5au;
    for (uint8_t repeat = 0; repeat < 16; ++repeat) {
        const uint8_t *src = source;
        const uint8_t *end = source + 128;
        uint8_t *dst = destination;

        while (src != end) {
            state = (uint8_t)(state + *src);
            *dst = (uint8_t)(*src ^ state);
            checksum = (uint16_t)(checksum + *dst);
            ++src;
            ++dst;
        }
    }
    pointer_walk_result = checksum;

    __avm_debug_break();
    return 0;
}
