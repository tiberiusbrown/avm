#include <stdlib.h>
#include <errno.h>
#include <stdint.h>

/* Mixed bases, whitespace/signs, limits, overflow, and no conversion. */
static const char* inputs[] = {" \t-12345!", "0777x", "0xff", "Zz!", "2147483647", "2147483648!", "nonsense", "-0x80"};
static int bases[] = {10, 0, 16, 36, 10, 10, 10, 0};
static long (*volatile call)(const char*, char**, int) = strtol;
static volatile unsigned long result_sink;

int avm_test_main(void)
{
    unsigned long result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 16; ++repeat) {
        for(uint8_t i = 0; i < 8; ++i) {
            char* end;
            errno = 0;
            result += (unsigned long)call(inputs[i], &end, bases[i]);
            result += (unsigned long)(end - inputs[i]) + (unsigned int)errno;
        }
    }
    result_sink = result;
    __avm_debug_break();
    return 0;
}
