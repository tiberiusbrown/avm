#include <stdlib.h>
#include <stdint.h>

static const char* inputs[] = {"0", "17", "-123", " \t+42x", "2147483647", "-2147483648", "", "nonsense"};
static long (*volatile call)(const char*) = atol;
static volatile unsigned long result_sink;

int avm_test_main(void)
{
    unsigned long result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 16; ++repeat)
        for(uint8_t i = 0; i < 8; ++i)
            result += (unsigned long)call(inputs[i]);
    result_sink = result;
    __avm_debug_break();
    return 0;
}
