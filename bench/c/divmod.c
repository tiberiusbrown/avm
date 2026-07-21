#include <stdint.h>

static volatile uint16_t unsigned_numerators[16];
static volatile uint16_t unsigned_denominators[16];
static volatile int16_t signed_numerators[16];
static volatile int16_t signed_denominators[16];
static volatile uint32_t wide_numerators[4];
static volatile uint32_t wide_denominators[4];
static volatile uint32_t divmod_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 16; ++i) {
        unsigned_numerators[i] = (uint16_t)(1000u + (uint16_t)i * 137u);
        unsigned_denominators[i] = (uint16_t)(3u + (uint16_t)(i % 11u));
        signed_numerators[i] = (int16_t)(-1200 + (int16_t)i * 113);
        signed_denominators[i] = (int16_t)(3 + (int16_t)(i % 9u));
    }
    for (uint8_t i = 0; i < 4; ++i) {
        wide_numerators[i] = 0x12345678u + (uint32_t)i * 0x10203u;
        wide_denominators[i] = 257u + (uint32_t)i * 18u;
    }

    __avm_debug_break();

    uint32_t acc = 0;
    for (uint8_t repeat = 0; repeat < 4; ++repeat) {
        for (uint8_t i = 0; i < 16; ++i) {
            uint16_t un = unsigned_numerators[i];
            uint16_t ud = unsigned_denominators[i];
            int16_t sn = signed_numerators[i];
            int16_t sd = signed_denominators[i];

            acc += (uint16_t)(un / ud);
            acc ^= (uint16_t)(un % ud);
            acc += (uint16_t)(sn / sd);
            acc ^= (uint16_t)(sn % sd);
        }
        for (uint8_t i = 0; i < 4; ++i) {
            uint32_t n = wide_numerators[i];
            uint32_t d = wide_denominators[i];
            acc += n / d;
            acc ^= n % d;
        }
    }
    divmod_result = acc;

    __avm_debug_break();
    return 0;
}
