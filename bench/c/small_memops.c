#include <stdint.h>
#include <string.h>

static uint8_t source[32];
static uint8_t destination[32];
static volatile uint16_t small_memops_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i)
        source[i] = (uint8_t)(i * 17u + 3u);

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 64; ++repeat) {
        __builtin_memset(destination, 0, sizeof(destination));
        __builtin_memcpy(destination + 1, source + 3, 1);
        __builtin_memcpy(destination + 2, source + 5, 2);
        __builtin_memcpy(destination + 4, source + 7, 3);
        __builtin_memcpy(destination + 8, source + 9, 4);
        __builtin_memcpy(destination + 12, source + 11, 5);
        __builtin_memset(destination + 18, 0x5a, 8);
        __builtin_memmove(destination + 7, destination + 4, 7);
        __builtin_memmove(destination + 20, destination + 18, 12);

        for (uint8_t i = 0; i < 32; ++i)
            checksum = (uint16_t)(checksum + destination[i]);
    }
    small_memops_result = checksum;

    __avm_debug_break();
    return 0;
}
