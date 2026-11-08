#include "string_bench.h"

/* Keep the runtime call observable and prevent compiler builtin substitution. */
static size_t (*volatile call)(const char*, size_t) = strnlen;

int avm_test_main(void)
{
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        for(uint8_t i = 0; i < 4; ++i) {
            const char* text = string_bench_text[i];
            result = (uint16_t)(result + call(text, 0) + call(text, 8) + call(text, 32));
        }
    }
    string_bench_result = result;
    __avm_debug_break();
    return 0;
}
