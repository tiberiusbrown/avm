#include <stddef.h>
#include <stdint.h>
#include <string.h>

extern void __avm_debug_break(void);

static char equal_lhs[65];
static char equal_rhs[65];
static char first_diff[65];
static char last_diff[65];
static char prefix[17];
static char empty[1];
static volatile int16_t benchmark_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 64; ++i) {
        char value = (char)('a' + (i % 26u));
        equal_lhs[i] = value;
        equal_rhs[i] = value;
        first_diff[i] = value;
        last_diff[i] = value;
        if (i < 16)
            prefix[i] = value;
    }
    equal_lhs[64] = '\0';
    equal_rhs[64] = '\0';
    first_diff[0] = 'z';
    first_diff[64] = '\0';
    last_diff[63] = 'z';
    last_diff[64] = '\0';
    prefix[16] = '\0';
    empty[0] = '\0';

    __avm_debug_break();

    int16_t result = 0;
    result += (int16_t)strcmp(empty, empty);
    result += (int16_t)strcmp(equal_lhs, equal_rhs);
    result += (int16_t)strcmp(equal_lhs, first_diff);
    result += (int16_t)strcmp(equal_lhs, last_diff);
    result += (int16_t)strcmp(prefix, equal_rhs);
    result += (int16_t)strcmp(equal_lhs, prefix);
    benchmark_result = result;

    __avm_debug_break();
    return 0;
}
