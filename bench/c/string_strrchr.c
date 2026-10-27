#include "string_bench.h"

/* Keep the runtime call observable and prevent compiler builtin substitution. */
static char* (*volatile call)(const char*, int) = strrchr;

int avm_test_main(void)
{
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        for(uint8_t i = 0; i < 4; ++i) {
            const char* text = string_bench_text[i];
            result = (uint16_t)(result +
                string_bench_offset(call(text, 'a'), text) +
                string_bench_offset(call(text, 'z'), text) +
                string_bench_offset(call(text, 0), text));
        }
    }
    string_bench_result = result;
    __avm_debug_break();
    return 0;
}
