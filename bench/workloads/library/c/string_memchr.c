#include "string_bench.h"

/* Keep the runtime call observable and prevent compiler builtin substitution. */
static void* (*volatile call)(const void*, int, size_t) = memchr;

int avm_test_main(void)
{
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        for(uint8_t i = 0; i < 4; ++i) {
            const char* text = string_bench_text[i];
            result = (uint16_t)(result +
                string_bench_offset(call(text, 'a', 32), text) +
                string_bench_offset(call(text, 0xff, 32), text) +
                string_bench_offset(call(text, 0, 32), text));
        }
    }
    string_bench_result = result;
    __avm_debug_break();
    return 0;
}
