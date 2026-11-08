#include <stdlib.h>
#include <limits.h>
#include <stdint.h>

static long inputs[] = {0, 1, -1, 42, -42, LONG_MAX, LONG_MIN + 1, -123456789L};
static long (*volatile call)(long) = labs;
static volatile unsigned long result_sink;

int avm_test_main(void)
{
    unsigned long result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat)
        for(uint8_t i = 0; i < 8; ++i)
            result += (unsigned long)call(inputs[i]);
    result_sink = result;
    __avm_debug_break();
    return 0;
}
