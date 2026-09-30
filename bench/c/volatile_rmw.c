#include <stdint.h>

static volatile uint8_t device_bytes[16];
static volatile uint16_t device_words[16];
static volatile uint16_t volatile_rmw_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 16; ++i) {
        device_bytes[i] = (uint8_t)(i * 17u + 3u);
        device_words[i] = (uint16_t)(i * 257u + 0x1234u);
    }

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 24; ++repeat) {
        for (uint8_t i = 0; i < 16; ++i) {
            device_bytes[i] |= 0x40u;
            device_bytes[i] &= (uint8_t)~0x08u;
            device_bytes[i] ^= (uint8_t)(repeat | i);
            device_words[i] += (uint16_t)(i * 3u + 1u);
            device_words[i] ^= 0x8080u;
            checksum = (uint16_t)(checksum + device_bytes[i] +
                                  device_words[i]);
        }
    }
    volatile_rmw_result = checksum;

    __avm_debug_break();
    return 0;
}
