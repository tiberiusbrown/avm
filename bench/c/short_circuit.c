#include <stdint.h>

static uint8_t first[64];
static uint8_t second[64];
static volatile uint16_t short_circuit_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 64; ++i) {
        first[i] = (uint8_t)(i * 17u + 3u);
        second[i] = (uint8_t)(i * 11u + 7u);
    }

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 24; ++repeat) {
        for (uint8_t i = 0; i < 64; ++i) {
            uint8_t a = first[i];
            if ((a & 7u) != 0 && second[i] > 128u)
                checksum = (uint16_t)(checksum + a);
            if (a == 0 || (second[i] & 3u) == 0 ||
                first[(i + 1u) & 63u] == a)
                checksum ^= (uint16_t)(a << 3);
        }
    }
    short_circuit_result = checksum;

    __avm_debug_break();
    return 0;
}
