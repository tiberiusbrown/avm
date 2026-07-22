#include <stddef.h>
#include <stdint.h>
#include <string.h>

extern void __avm_debug_break(void);

static char length0[1];
static char length1[2];
static char length8[9];
static char length32[33];
static char length256[257];
static volatile uint16_t benchmark_result;

static void fill_string(char *dst, uint16_t length, char value)
{
    for (uint16_t i = 0; i < length; ++i)
        dst[i] = value;
    dst[length] = '\0';
}

int avm_test_main(void)
{
    fill_string(length0, 0, 'a');
    fill_string(length1, 1, 'b');
    fill_string(length8, 8, 'c');
    fill_string(length32, 32, 'd');
    fill_string(length256, 256, 'e');

    __avm_debug_break();

    uint16_t result = 0;
    result = (uint16_t)(result + strlen(length0));
    result = (uint16_t)(result + strlen(length1));
    result = (uint16_t)(result + strlen(length8));
    result = (uint16_t)(result + strlen(length32));
    result = (uint16_t)(result + strlen(length256));
    benchmark_result = result;

    __avm_debug_break();
    return 0;
}
