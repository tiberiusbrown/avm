#include "string_bench.h"
#include "string_progmem_bench.h"

/* Match the RAM workload while forcing calls to the program-memory entry point. */
static int (*volatile call)(const char*, const char AVM_PROGMEM*, size_t) = strncmp_P;

int avm_test_main(void)
{
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        for(uint8_t i = 0; i < 4; ++i) {
            const char* text = string_bench_text[i];
            result = (uint16_t)(result +
                (uint16_t)call(text, string_bench_flash[(i + 1u) & 3u], 8) +
                (uint16_t)call(text, string_bench_flash[i], 32) +
                (uint16_t)call(text, PSTR("ababababababababac"), 32));
        }
    }
    string_bench_result = result;
    __avm_debug_break();
    return 0;
}
