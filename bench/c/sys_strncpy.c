#include <stddef.h>
#include <stdint.h>
#include <string.h>

extern void __avm_debug_break(void);

static char source3[4];
static char source8[9];
static char source32[33];
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
    source3[0] = 'a'; source3[1] = 'b'; source3[2] = 'c'; source3[3] = '\0';
    for (uint8_t i = 0; i < 8; ++i)
        source8[i] = (char)('a' + i);
    source8[8] = '\0';
    for (uint8_t i = 0; i < 32; ++i)
        source32[i] = (char)('A' + (i % 26u));
    source32[32] = '\0';

    __avm_debug_break();

    char *r0 = strncpy(destination0, source32, n0);
    char *r1 = strncpy(destination1, source32, n1);
    char *r2 = strncpy(destination_pad8, source3, n8);
    char *r3 = strncpy(destination_exact8, source8, n8);
    char *r4 = strncpy(destination_trunc8, source32, n8);
    char *r5 = strncpy(destination_pad32, source3, n32);

    benchmark_result =
        (uint16_t)((r0 == destination0) + (r1 == destination1) +
                   (r2 == destination_pad8) + (r3 == destination_exact8) +
                   (r4 == destination_trunc8) + (r5 == destination_pad32) +
                   (uint8_t)destination1[0] + (uint8_t)destination_pad8[7] +
                   (uint8_t)destination_trunc8[7] + (uint8_t)destination_pad32[31]);

    __avm_debug_break();
    return 0;
}
