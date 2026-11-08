#include <stddef.h>
#include <stdint.h>
#include <string.h>

extern void __avm_debug_break(void);

static uint8_t lhs[64];
static uint8_t equal[64];
static uint8_t first_diff[64];
static uint8_t last_diff[64];

static volatile size_t n0 = 0;
static volatile size_t n1 = 1;
static volatile size_t n16 = 16;
static volatile size_t n64 = 64;
static volatile int16_t benchmark_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 64; ++i) {
        uint8_t value = (uint8_t)(i * 13u + 7u);
        lhs[i] = value;
        equal[i] = value;
        first_diff[i] = value;
        last_diff[i] = value;
    }
    first_diff[0] ^= 0x80u;
    last_diff[63] ^= 0x01u;

    __avm_debug_break();

    int16_t result = 0;
    result += (int16_t)memcmp(lhs, equal, n0);
    result += (int16_t)memcmp(lhs, equal, n1);
    result += (int16_t)memcmp(lhs, equal, n64);
    result += (int16_t)memcmp(lhs, first_diff, n64);
    result += (int16_t)memcmp(lhs, last_diff, n64);
    result += (int16_t)memcmp(lhs, last_diff, n16);
    benchmark_result = result;

    __avm_debug_break();
    return 0;
}
