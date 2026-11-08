#include "string_progmem_bench.h"

static volatile uint16_t string_bench_result;

/* Match the RAM workload while forcing calls to the program-memory entry point. */
static const void AVM_PROGMEM* (*volatile call)(const void AVM_PROGMEM*, int, size_t) = memchr_P;

int avm_test_main(void)
{
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        for(uint8_t i = 0; i < 4; ++i) {
            const char AVM_PROGMEM* text = string_bench_flash[i];
            result = (uint16_t)(result +
                string_bench_flash_offset(call(text, 'a', 32), text) +
                string_bench_flash_offset(call(text, 0xff, 32), text) +
                string_bench_flash_offset(call(text, 0, 32), text));
        }
    }
    string_bench_result = result;
    __avm_debug_break();
    return 0;
}
