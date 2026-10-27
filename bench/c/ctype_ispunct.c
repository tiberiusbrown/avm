#include <ctype.h>
#include <stdint.h>

/* Force calls to the runtime entry point, including for EOF and high bytes. */
static int (*volatile call)(int) = ispunct;
static volatile uint16_t ctype_bench_result;

int avm_test_main(void)
{
    uint16_t result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 8; ++repeat) {
        for(int c = -1; c <= 255; ++c)
            result = (uint16_t)(result + !!call(c));
    }
    ctype_bench_result = result;
    __avm_debug_break();
    return 0;
}
