#include <avm/pgmspace.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>

extern void __avm_debug_break(void);

static const char AVM_PROGMEM source_empty[] = "";
static const char AVM_PROGMEM source_short[] = "abc";
static const char AVM_PROGMEM source_long[] = "abcdefghijklmnopqrstuvwxyzABCDEF";

static char destination_n0[16] = "abcdefgh";
static char destination_empty_empty[8] = "";
static char destination_empty_short[16] = "";
static char destination_short_short[24] = "abcdefgh";
static char destination_truncate[24] = "abcdefgh";
static char destination_long_scan[48] = "abcdefghijklmnopqrstuvwxyzABCDEF";

static volatile size_t n0 = 0;
static volatile size_t n4 = 4;
static volatile size_t n8 = 8;
static volatile uint16_t benchmark_result;

int avm_test_main(void)
{
    __avm_debug_break();

    char *r0 = strncat_P(destination_n0, source_short, n0);
    char *r1 = strncat_P(destination_empty_empty, source_empty, n8);
    char *r2 = strncat_P(destination_empty_short, source_short, n8);
    char *r3 = strncat_P(destination_short_short, source_short, n8);
    char *r4 = strncat_P(destination_truncate, source_long, n4);
    char *r5 = strncat_P(destination_long_scan, source_short, n8);

    benchmark_result =
        (uint16_t)((r0 == destination_n0) + (r1 == destination_empty_empty) +
                   (r2 == destination_empty_short) + (r3 == destination_short_short) +
                   (r4 == destination_truncate) + (r5 == destination_long_scan) +
                   (uint8_t)destination_empty_short[2] +
                   (uint8_t)destination_short_short[10] +
                   (uint8_t)destination_truncate[11] +
                   (uint8_t)destination_long_scan[34]);

    __avm_debug_break();
    return 0;
}
