#include <stdint.h>

static volatile int8_t signed_a[32];
static volatile int8_t signed_b[32];
static volatile uint8_t unsigned_a[32];
static volatile uint8_t unsigned_b[32];
static volatile uint16_t byte_comparisons_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i) {
        signed_a[i] = (int8_t)((uint8_t)(i * 17u) ^ 0x80u);
        signed_b[i] = (int8_t)((uint8_t)(i * 29u) ^ 0x40u);
        unsigned_a[i] = (uint8_t)(i * 17u);
        unsigned_b[i] = (uint8_t)(i * 29u);
    }

    __avm_debug_break();

    uint16_t matches = 0;
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i) {
            int8_t sa = signed_a[i];
            int8_t sb = signed_b[i];
            uint8_t ua = unsigned_a[i];
            uint8_t ub = unsigned_b[i];
            matches += sa < sb;
            matches += sa >= 0;
            matches += ua <= ub;
            matches += ua == ub;
            matches += sa != (int8_t)ub;
        }
    }
    byte_comparisons_result = matches;

    __avm_debug_break();
    return 0;
}
