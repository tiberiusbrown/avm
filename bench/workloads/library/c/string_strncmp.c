#include "string_bench.h"

/* Keep the runtime call observable and prevent compiler builtin substitution. */
static int (*volatile call)(const char*, const char*, size_t) = strncmp;

int avm_test_main(void)
{
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        for(uint8_t i = 0; i < 4; ++i) {
            const char* text = string_bench_text[i];
            result = (uint16_t)(result +
                (uint16_t)call(text, string_bench_text[(i + 1u) & 3u], 8) +
                (uint16_t)call(text, text, 32) +
                (uint16_t)call(text, "ababababababababac", 32));
        }
    }
    string_bench_result = result;
    __avm_debug_break();
    return 0;
}
