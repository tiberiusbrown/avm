#include <stdint.h>

static volatile uint8_t requested_length = 23;
static volatile uint16_t result;

__attribute__((noinline))
static uint16_t local_buffer(uint8_t length, uint16_t seed)
{
    uint8_t bytes[length];
    uint16_t checksum = seed;
    for (uint8_t i = 0; i < length; ++i)
        bytes[i] = (uint8_t)(seed + (uint16_t)i * 13u);
    for (uint8_t i = length; i != 0; --i)
        checksum = (uint16_t)((checksum << 1) ^ bytes[i - 1]);
    return checksum;
}

int avm_test_main(void)
{
    __avm_debug_break();

    uint8_t length = requested_length;
    uint16_t checksum = 0x1234u;
    for (uint8_t i = 0; i < 48; ++i)
        checksum ^= local_buffer((uint8_t)(length - (i & 7u)), checksum);
    result = checksum;

    __avm_debug_break();
    return 0;
}
