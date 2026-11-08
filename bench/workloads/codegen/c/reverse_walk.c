#include <stdint.h>

static uint8_t source[128];
static uint8_t destination[128];
static volatile uint16_t reverse_walk_result;

int avm_test_main(void)
{
    for (uint16_t i = 0; i < 128; ++i)
        source[i] = (uint8_t)(i * 23u + 9u);

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        const uint8_t *src = source + 128;
        uint8_t *dst = destination + 128;
        while (src != source) {
            uint8_t value = *--src;
            *--dst = (uint8_t)(value ^ (uint8_t)checksum);
            checksum = (uint16_t)(checksum + value + *dst);
        }
    }
    reverse_walk_result = checksum;

    __avm_debug_break();
    return 0;
}
