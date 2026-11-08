#include <stdlib.h>
#include <limits.h>
#include <stdint.h>

/* All sign combinations, small quotients, full-width inputs, and exact division. */
static int numerators[] = {0, 7, -7, 7, -7, INT_MAX, INT_MIN, -12345};
static int denominators[] = {1, 3, 3, -3, -3, 123, 1, 123};
static div_t (*volatile call)(int, int) = div;
static volatile unsigned int result_sink;

int avm_test_main(void)
{
    unsigned int result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 16; ++repeat) {
        for(uint8_t i = 0; i < 8; ++i) {
            div_t value = call(numerators[i], denominators[i]);
            result += (unsigned int)value.quot + (unsigned int)value.rem;
        }
    }
    result_sink = result;
    __avm_debug_break();
    return 0;
}
