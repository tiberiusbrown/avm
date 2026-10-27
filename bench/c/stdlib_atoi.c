#include <stdlib.h>
#include <stdint.h>

static const char* inputs[] = {"0", "17", "-123", " \t+42x", "32767", "-32768", "", "nonsense"};
static int (*volatile call)(const char*) = atoi;
static volatile unsigned int result_sink;

int avm_test_main(void)
{
    unsigned int result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 16; ++repeat)
        for(uint8_t i = 0; i < 8; ++i)
            result += (unsigned int)call(inputs[i]);
    result_sink = result;
    __avm_debug_break();
    return 0;
}
