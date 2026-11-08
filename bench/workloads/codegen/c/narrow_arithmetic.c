#include <stdint.h>

static volatile uint8_t input[64];
static volatile uint16_t narrow_arithmetic_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 64; ++i)
        input[i] = (uint8_t)(i * 29u + 11u);

    __avm_debug_break();

    uint8_t byte = 0x5au;
    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        for (uint8_t i = 0; i < 64; ++i) {
            uint8_t value = input[i];
            byte = (uint8_t)(byte + value);
            byte = (uint8_t)(byte * 3u);
            byte = (uint8_t)(byte ^ (uint8_t)(value << 2));
            checksum = (uint16_t)(checksum + byte);
        }
    }
    narrow_arithmetic_result = (uint16_t)(checksum ^ byte);

    __avm_debug_break();
    return 0;
}
