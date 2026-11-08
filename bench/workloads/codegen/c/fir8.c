#include <stdint.h>

static int8_t samples[96];
static int8_t coefficients[16];
static volatile uint16_t fir_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 96; ++i)
        samples[i] = (int8_t)((int16_t)((i * 19u + 7u) & 0x7fu) - 64);
    for (uint8_t i = 0; i < 16; ++i)
        coefficients[i] = (int8_t)((int16_t)(i * 9u) - 67);

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 16; ++repeat) {
        for (uint8_t output = 0; output < 64; ++output) {
            int16_t sum = 0;
            const int8_t *sample = samples + output;
            const int8_t *coefficient = coefficients;
            for (uint8_t tap = 0; tap < 16; ++tap)
                sum = (int16_t)(sum +
                    (int16_t)*sample++ * (int16_t)*coefficient++);
            checksum = (uint16_t)(checksum + (uint16_t)sum);
        }
    }
    fir_result = checksum;

    __avm_debug_break();
    return 0;
}
