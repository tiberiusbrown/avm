#include <avm/pgmspace.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>

extern void __avm_debug_break(void);

#define BLOCK16 "abcdefghijklmnop"
static const char AVM_PROGMEM length0[] = "";
static const char AVM_PROGMEM length1[] = "x";
static const char AVM_PROGMEM length8[] = "abcdefgh";
static const char AVM_PROGMEM length32[] = BLOCK16 BLOCK16;
static const char AVM_PROGMEM length256[] =
    BLOCK16 BLOCK16 BLOCK16 BLOCK16
    BLOCK16 BLOCK16 BLOCK16 BLOCK16
    BLOCK16 BLOCK16 BLOCK16 BLOCK16
    BLOCK16 BLOCK16 BLOCK16 BLOCK16;
#undef BLOCK16

static volatile uint16_t benchmark_result;

int avm_test_main(void)
{
    __avm_debug_break();

    uint16_t result = 0;
    result = (uint16_t)(result + strlen_P(length0));
    result = (uint16_t)(result + strlen_P(length1));
    result = (uint16_t)(result + strlen_P(length8));
    result = (uint16_t)(result + strlen_P(length32));
    result = (uint16_t)(result + strlen_P(length256));
    benchmark_result = result;

    __avm_debug_break();
    return 0;
}
