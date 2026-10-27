#include "string_bench.h"

/* Match the RAM workload while forcing calls to the program-memory entry point. */
static char* (*volatile call)(const char*, const char AVM_PROGMEM*) = strpbrk_P;

int avm_test_main(void)
{
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        for(uint8_t i = 0; i < 4; ++i) {
            const char* text = string_bench_text[i];
            result = (uint16_t)(result +
                string_bench_offset(call(text, PSTR("bc")), text) +
                string_bench_offset(call(text, PSTR("xyz")), text) +
                string_bench_offset(call(text, PSTR("")), text));
        }
    }
    string_bench_result = result;
    __avm_debug_break();
    return 0;
}
