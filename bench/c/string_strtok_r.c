#include "string_bench.h"

static char* (*volatile call)(char*, const char*, char**) = strtok_r;

int avm_test_main(void)
{
    char buffer[32];
    char* state = 0;
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        for(uint8_t i = 0; i < 4; ++i) {
            /* Tokenization mutates its input; reset cost is part of the workload. */
            memcpy(buffer, string_bench_text[i], sizeof(buffer));
            char* token = call(buffer, "bc", &state);
            while(token) {
                result = (uint16_t)(result + (unsigned char)*token);
                /* Changing delimiters exercises continuation state. */
                token = call(NULL, "ac", &state);
            }
        }
    }
    string_bench_result = result;
    __avm_debug_break();
    return 0;
}
