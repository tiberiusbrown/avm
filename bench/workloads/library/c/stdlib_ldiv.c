#include <stdlib.h>
#include <limits.h>
#include <stdint.h>

/* All sign combinations, small quotients, full-width inputs, and exact division. */
static long numerators[] = {0, 7, -7, 7, -7, LONG_MAX, LONG_MIN, -123456789L};
static long denominators[] = {1, 3, 3, -3, -3, 12345L, 1, 12345L};
static ldiv_t (*volatile call)(long, long) = ldiv;
static volatile unsigned long result_sink;

int avm_test_main(void)
{
    unsigned long result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 16; ++repeat) {
        for(uint8_t i = 0; i < 8; ++i) {
            ldiv_t value = call(numerators[i], denominators[i]);
            result += (unsigned long)value.quot + (unsigned long)value.rem;
        }
    }
    result_sink = result;
    __avm_debug_break();
    return 0;
}
