#include <avm/pgmspace.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>

extern void __avm_debug_break(void);

static char lhs[65];
static const char AVM_PROGMEM p_empty[] = "";
static const char AVM_PROGMEM p_equal[] = "abcdefghijklmnopabcdefghijklmnopabcdefghijklmnopabcdefghijklmnop";
static const char AVM_PROGMEM p_first_diff[] = "zbcdefghijklmnopabcdefghijklmnopabcdefghijklmnopabcdefghijklmnop";
static const char AVM_PROGMEM p_last_diff[] = "abcdefghijklmnopabcdefghijklmnopabcdefghijklmnopabcdefghijklmnoz";
static const char AVM_PROGMEM p_prefix[] = "abcdefghijklmnop";
static volatile int16_t benchmark_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 64; ++i)
        lhs[i] = "abcdefghijklmnopabcdefghijklmnopabcdefghijklmnopabcdefghijklmnop"[i];
    lhs[64] = '\0';

    __avm_debug_break();

    int16_t result = 0;
    result += (int16_t)strcmp_P("", p_empty);
    result += (int16_t)strcmp_P(lhs, p_equal);
    result += (int16_t)strcmp_P(lhs, p_first_diff);
    result += (int16_t)strcmp_P(lhs, p_last_diff);
    lhs[16] = '\0';
    result += (int16_t)strcmp_P(lhs, p_equal);
    lhs[16] = "abcdefghijklmnopabcdefghijklmnopabcdefghijklmnopabcdefghijklmnop"[16];
    result += (int16_t)strcmp_P(lhs, p_prefix);
    benchmark_result = result;

    __avm_debug_break();
    return 0;
}
