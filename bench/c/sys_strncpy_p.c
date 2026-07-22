#include <avm/pgmspace.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>

extern void __avm_debug_break(void);

static const char AVM_PROGMEM source3[] = "abc";
static const char AVM_PROGMEM source8[] = "abcdefgh";
static const char AVM_PROGMEM source32[] = "abcdefghijklmnopqrstuvwxyzABCDEF";

static char destination0[1];
static char destination1[2];
static char destination_pad8[8];
static char destination_exact8[8];
static char destination_trunc8[8];
static char destination_pad32[32];

static volatile size_t n0 = 0;
static volatile size_t n1 = 1;
static volatile size_t n8 = 8;
static volatile size_t n32 = 32;
static volatile uint16_t benchmark_result;

int avm_test_main(void)
{
    __avm_debug_break();

    char *r0 = strncpy_P(destination0, source32, n0);
    char *r1 = strncpy_P(destination1, source32, n1);
    char *r2 = strncpy_P(destination_pad8, source3, n8);
    char *r3 = strncpy_P(destination_exact8, source8, n8);
    char *r4 = strncpy_P(destination_trunc8, source32, n8);
    char *r5 = strncpy_P(destination_pad32, source3, n32);

    benchmark_result =
        (uint16_t)((r0 == destination0) + (r1 == destination1) +
                   (r2 == destination_pad8) + (r3 == destination_exact8) +
                   (r4 == destination_trunc8) + (r5 == destination_pad32) +
                   (uint8_t)destination1[0] + (uint8_t)destination_pad8[7] +
                   (uint8_t)destination_trunc8[7] + (uint8_t)destination_pad32[31]);

    __avm_debug_break();
    return 0;
}
