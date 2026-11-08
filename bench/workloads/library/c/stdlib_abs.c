#include <stdlib.h>
#include <limits.h>
#include <stdint.h>

static int inputs[] = {0, 1, -1, 42, -42, INT_MAX, INT_MIN + 1, -12345};
static int (*volatile call)(int) = abs;
static volatile unsigned int result_sink;

int avm_test_main(void)
{
    unsigned int result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat)
        for(uint8_t i = 0; i < 8; ++i)
            result += (unsigned int)call(inputs[i]);
    result_sink = result;
    __avm_debug_break();
    return 0;
}
