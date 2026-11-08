#include <stdint.h>

static volatile uint16_t stack_seed = 0x2345u;
static volatile uint16_t stack_frames_result;

__attribute__((noinline))
static uint16_t leaf(const uint8_t *bytes, uint8_t length, uint16_t seed)
{
    uint16_t checksum = seed;
    for (uint8_t i = 0; i < length; ++i)
        checksum = (uint16_t)((checksum << 1) ^ bytes[i]);
    return checksum;
}

__attribute__((noinline))
static uint16_t middle(uint16_t seed)
{
    uint8_t bytes[23];
    for (uint8_t i = 0; i < 23; ++i)
        bytes[i] = (uint8_t)(seed + (uint16_t)i * 13u);
    return (uint16_t)(leaf(bytes, 23, seed) ^ leaf(bytes + 3, 17, seed));
}

__attribute__((noinline))
static uint16_t outer(uint16_t seed)
{
    uint16_t words[7];
    for (uint8_t i = 0; i < 7; ++i)
        words[i] = middle((uint16_t)(seed + i * 31u));
    uint16_t checksum = seed;
    for (uint8_t i = 7; i != 0; --i)
        checksum ^= words[i - 1];
    return checksum;
}

int avm_test_main(void)
{
    __avm_debug_break();

    uint16_t checksum = stack_seed;
    for (uint8_t i = 0; i < 24; ++i)
        checksum = (uint16_t)(checksum + outer((uint16_t)(checksum + i)));
    stack_frames_result = checksum;

    __avm_debug_break();
    return 0;
}
