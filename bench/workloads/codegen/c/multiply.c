#include <stdint.h>

static int8_t signed_bytes[64];
static uint8_t unsigned_bytes[64];
static uint16_t words[64];
static volatile uint16_t multiply_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 64; ++i) {
        signed_bytes[i] = (int8_t)((int16_t)(i % 31u) - 15);
        unsigned_bytes[i] = (uint8_t)(i * 3u + 1u);
        words[i] = (uint16_t)(257u + (uint16_t)i * 19u);
    }

    __avm_debug_break();

    uint16_t acc = 0;
    for (uint8_t repeat = 0; repeat < 8; ++repeat) {
        for (uint8_t i = 0; i < 64; ++i) {
            uint8_t i1 = (uint8_t)((i + 1u) & 63u);
            uint8_t i3 = (uint8_t)((i + 3u) & 63u);
            uint8_t i5 = (uint8_t)((i + 5u) & 63u);

            int16_t ss =
                (int16_t)signed_bytes[i] * (int16_t)signed_bytes[i1];
            int16_t su =
                (int16_t)signed_bytes[i] * (uint16_t)unsigned_bytes[i3];
            uint16_t uu =
                (uint16_t)unsigned_bytes[i] * (uint16_t)unsigned_bytes[i1];
            uint16_t ww = (uint16_t)(words[i] * words[i5]);

            acc = (uint16_t)(acc + (uint16_t)ss + (uint16_t)su + uu + ww);
        }
    }
    multiply_result = acc;

    __avm_debug_break();
    return 0;
}
