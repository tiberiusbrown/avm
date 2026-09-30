#include <stdint.h>

static volatile uint64_t increments[8];
static volatile uint64_t wide_add_sub_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 8; ++i)
        increments[i] = UINT64_C(0x11110000ffff0001) +
                        (uint64_t)i * UINT64_C(0x0102030405060708);

    __avm_debug_break();

    uint64_t value = UINT64_C(0xfffffffffffffff0);
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        for (uint8_t i = 0; i < 8; ++i) {
            value += increments[i];
            value -= increments[(i + 5u) & 7u];
            value ^= (uint64_t)repeat << 33;
        }
    }
    wide_add_sub_result = value;

    __avm_debug_break();
    return 0;
}
