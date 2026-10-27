#include <stdlib.h>
#include <stdint.h>

static const char* inputs[] = {"0", "17", "-123", " \t+42x", "9223372036854775807", "-9223372036854775808", "", "nonsense"};
static long long (*volatile call)(const char*) = atoll;
static volatile unsigned long long result_sink;

int avm_test_main(void)
{
    unsigned long long result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 16; ++repeat)
        for(uint8_t i = 0; i < 8; ++i)
            result += (unsigned long long)call(inputs[i]);
    result_sink = result;
    __avm_debug_break();
    return 0;
}
