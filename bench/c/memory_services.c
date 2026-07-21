#include <stdint.h>

static uint8_t source[96];
static uint8_t destination[96];
static volatile uint16_t memory_length = 64;
static volatile uint16_t memory_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 96; ++i)
        source[i] = (uint8_t)(i * 13u + 9u);

    __avm_debug_break();

    uint16_t length = memory_length;
    __builtin_memset(destination, 0x5a, length);
    __builtin_memcpy(destination, source, length);
    __builtin_memmove(destination + 5, destination, length - 5u);

    uint16_t checksum = 0;
    for (uint16_t i = 0; i < length; ++i)
        checksum = (uint16_t)(checksum + destination[i]);
    memory_result = checksum;

    __avm_debug_break();
    return 0;
}
