#include <stdlib.h>
#include <errno.h>
#include <stdint.h>

/* Decimal, hexadecimal, range errors, special values, and no conversion. */
static const char* inputs[] = {
    " \t-123.456!", "6.02214076e23", "1e-45", "1e99",
    "0x1.abcdefp-12", "infinity", "nan(payload)", "nonsense"
};
static float (*volatile call)(const char*, char**) = strtof;
static volatile uint32_t result_sink;

int avm_test_main(void)
{
    uint32_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 16; ++repeat) {
        for(uint8_t i = 0; i < 8; ++i) {
            char* end;
            errno = 0;
            union { float f; uint32_t u; } value = {(float)call(inputs[i], &end)};
            result ^= value.u;
            result += (unsigned int)(end - inputs[i]) + (unsigned int)errno;
        }
    }
    result_sink = result;
    __avm_debug_break();
    return 0;
}
