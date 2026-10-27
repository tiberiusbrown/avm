#include "string_bench.h"

static char* (*volatile call)(char*, const char AVM_PROGMEM*) = strtok_P;

int avm_test_main(void)
{
    char buffer[32];
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        for(uint8_t i = 0; i < 4; ++i) {
            /* Match the RAM workload, including the mutable-input reset cost. */
            memcpy(buffer, string_bench_text[i], sizeof(buffer));
            char* token = call(buffer, PSTR("bc"));
            while(token) {
                result = (uint16_t)(result + (unsigned char)*token);
                token = call(NULL, PSTR("ac"));
            }
        }
    }
    string_bench_result = result;
    __avm_debug_break();
    return 0;
}
