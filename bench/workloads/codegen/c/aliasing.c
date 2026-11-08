#include <stdint.h>

static uint8_t buffer[65];
static volatile uint16_t aliasing_result;

__attribute__((noinline))
static uint16_t overlap(uint8_t *left, uint8_t *right, uint8_t length)
{
    uint16_t checksum = 0;
    for (uint8_t i = 0; i < length; ++i) {
        uint8_t a = left[i];
        uint8_t b = right[i];
        left[i] = (uint8_t)(a + b);
        right[i] = (uint8_t)(b ^ left[i]);
        checksum = (uint16_t)(checksum + left[i] + right[i]);
    }
    return checksum;
}

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 65; ++i)
        buffer[i] = (uint8_t)(i * 19u + 3u);

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 20; ++repeat) {
        checksum ^= overlap(buffer, buffer + 1, 64);
        checksum += overlap(buffer + 1, buffer, 64);
    }
    aliasing_result = checksum;

    __avm_debug_break();
    return 0;
}
