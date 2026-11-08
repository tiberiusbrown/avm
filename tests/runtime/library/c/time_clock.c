#include <avm.h>
#include <stdint.h>
#include <time.h>

#ifdef __cplusplus
static_assert(sizeof(clock_t) == 4, "clock_t must be 32 bits");
static_assert((clock_t)-1 > 0, "clock_t must be unsigned");
static_assert(CLOCKS_PER_SEC == 1000, "clock scale must be milliseconds");
static_assert(CLOCKS_PER_SEC / 10 == 100, "clock scale is an ICE");
static_assert((clock_t)UINT32_MAX == UINT32_MAX, "clock_t must hold uint32_t");
#else
_Static_assert(sizeof(clock_t) == 4, "clock_t must be 32 bits");
_Static_assert((clock_t)-1 > 0, "clock_t must be unsigned");
_Static_assert(CLOCKS_PER_SEC == 1000, "clock scale must be milliseconds");
_Static_assert(CLOCKS_PER_SEC / 10 == 100, "clock scale is an ICE");
_Static_assert((clock_t)UINT32_MAX == UINT32_MAX, "clock_t must hold uint32_t");
#endif

static clock_t (*volatile clock_ptr)(void) = clock;

static int test_bracket(void)
{
    uint32_t before = avm_millis32();
    clock_t observed = clock();
    uint32_t after = avm_millis32();
    return (uint32_t)(observed - before) > (uint32_t)(after - before);
}

static int test_indirect(void)
{
    uint32_t before = avm_millis32();
    clock_t observed = clock_ptr();
    uint32_t after = avm_millis32();
    return (uint32_t)(observed - before) > (uint32_t)(after - before);
}

static int test_progression(void)
{
    clock_t previous = clock();
    volatile uint32_t work = 0;
    for(uint32_t i = 0; i < 200; ++i) {
        work += i;
        clock_t current = clock();
        if((uint32_t)(current - previous) > 0x7FFFFFFFu) return 1;
        previous = current;
    }
    return work == 0;
}

static int test_scaling(void)
{
    clock_t elapsed = (clock_t)2500;
    double seconds = (double)elapsed / CLOCKS_PER_SEC;
    if(seconds != 2.5) return 1;
    if((clock_t)1000 / CLOCKS_PER_SEC != 1) return 2;
    if((clock_t)10000 / CLOCKS_PER_SEC != 10) return 3;
    return 0;
}

static int test_wrap(void)
{
    clock_t start = (clock_t)0xFFFFFFF0u;
    clock_t end = (clock_t)0x00000010u;
    if(end - start != 32u) return 1;
    if((clock_t)0x0000FFFFu + 1u != (clock_t)0x00010000u) return 2;
    if((clock_t)0x7FFFFFFFu + 1u != (clock_t)0x80000000u) return 3;
    if((clock_t)0xFFFFFFFFu + 1u != 0u) return 4;
    return 0;
}

int avm_test_main(void)
{
    return test_bracket() || test_indirect() || test_progression() ||
        test_scaling() || test_wrap();
}
