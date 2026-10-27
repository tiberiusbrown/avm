#include <stdlib.h>
#include <limits.h>
#include <stdint.h>

/* All sign combinations, small quotients, full-width inputs, and exact division. */
static long long numerators[] = {0, 7, -7, 7, -7, LLONG_MAX, LLONG_MIN, -123456789012345LL};
static long long denominators[] = {1, 3, 3, -3, -3, 1234567LL, 1, 1234567LL};
static lldiv_t (*volatile call)(long long, long long) = lldiv;
static volatile unsigned long long result_sink;

int avm_test_main(void)
{
    unsigned long long result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 16; ++repeat) {
        for(uint8_t i = 0; i < 8; ++i) {
            lldiv_t value = call(numerators[i], denominators[i]);
            result += (unsigned long long)value.quot + (unsigned long long)value.rem;
        }
    }
    result_sink = result;
    __avm_debug_break();
    return 0;
}
