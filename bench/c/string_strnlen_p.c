#include "string_progmem_bench.h"

static volatile uint16_t string_bench_result;

/* Match the RAM workload while forcing calls to the program-memory entry point. */
static size_t (*volatile call)(const char AVM_PROGMEM*, size_t) = strnlen_P;

int avm_test_main(void)
{
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        for(uint8_t i = 0; i < 4; ++i) {
            const char AVM_PROGMEM* text = string_bench_flash[i];
            result = (uint16_t)(result +
                call(text, 0) +
                call(text, 8) +
                call(text, 32));
        }
    }
    string_bench_result = result;
    __avm_debug_break();
    return 0;
}
