#include <stdint.h>

static volatile uint64_t unsigned_values[8];
static volatile int64_t signed_values[8];
static volatile uint16_t wide_compare_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 8; ++i) {
        unsigned_values[i] = UINT64_C(0xfedcba9876543210) ^
                             ((uint64_t)i << (i + 4u));
        signed_values[i] = ((int64_t)i - 4) * INT64_C(0x123456789abcd);
    }

    __avm_debug_break();

    uint16_t count = 0;
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        for (uint8_t i = 0; i < 8; ++i) {
            uint64_t u = unsigned_values[i];
            uint64_t next_u = unsigned_values[(i + 1u) & 7u];
            int64_t s = signed_values[i];
            int64_t next_s = signed_values[(i + 3u) & 7u];
            count += u < next_u;
            count += u >= UINT64_C(0x8000000000000000);
            count += s > next_s;
            count += s == next_s;
        }
    }
    wide_compare_result = count;

    __avm_debug_break();
    return 0;
}
