#include <stdlib.h>
#include <errno.h>
#include <stdint.h>

/* Mixed bases, whitespace/signs, limits, overflow, and no conversion. */
static const char* inputs[] = {" \t-12345!", "0777x", "0xff", "Zz!", "9223372036854775807", "9223372036854775808!", "nonsense", "-0x80"};
static int bases[] = {10, 0, 16, 36, 10, 10, 10, 0};
static long long (*volatile call)(const char*, char**, int) = strtoll;
static volatile unsigned long long result_sink;

int avm_test_main(void)
{
    unsigned long long result = 0;
    __avm_debug_break();
    for(uint8_t repeat = 0; repeat < 16; ++repeat) {
        for(uint8_t i = 0; i < 8; ++i) {
            char* end;
            errno = 0;
            result += (unsigned long long)call(inputs[i], &end, bases[i]);
            result += (unsigned long long)(end - inputs[i]) + (unsigned int)errno;
        }
    }
    result_sink = result;
    __avm_debug_break();
    return 0;
}
