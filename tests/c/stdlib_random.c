#include <avm.h>
#include <stdlib.h>
#include <stdint.h>

#if RAND_MAX < 32767
#error RAND_MAX is not C99 compliant
#endif
typedef char rand_max_is_constant[(RAND_MAX == 32767) ? 1 : -1];

static int (*volatile rand_ptr)(void) = rand;
static void (*volatile srand_ptr)(unsigned int) = srand;
static uint16_t (*volatile random_ptr)(void) = avm_random;
static void (*volatile seed_ptr)(uint16_t) = avm_set_random_seed;

static uint16_t ref_next(uint16_t *state)
{
    uint16_t x = *state;
    x ^= (uint16_t)((unsigned int)x << 7);
    x ^= (uint16_t)((unsigned int)x >> 9);
    x ^= (uint16_t)((unsigned int)x << 8);
    *state = x;
    return x;
}

static int test_default_seed(void)
{
    int before[8];
    for(int i = 0; i < 8; ++i) before[i] = rand();
    srand(1);
    for(int i = 0; i < 8; ++i) if(rand() != before[i]) return 1;
    return 0;
}

static int test_range(void)
{
    srand(0x1937u);
    for(int i = 0; i < 256; ++i) {
        int value = rand();
        if(value < 0 || value > RAND_MAX) return 1;
    }
    return 0;
}

static int test_reseeding(void)
{
    static const unsigned int seeds[] = {0u, 1u, 2u, 1234u, 0x7fffu,
        0x8000u, 0xbabeu, 0xffffu};
    for(unsigned int s = 0; s < sizeof(seeds) / sizeof(seeds[0]); ++s) {
        int values[32];
        unsigned int seed = seeds[s];
        srand(seed);
        for(int i = 0; i < 32; ++i) values[i] = rand();
        srand(seed);
        for(int i = 0; i < 32; ++i) if(rand() != values[i]) return 1;
    }
    return 0;
}

static int test_reference(void)
{
    static const uint16_t seeds[] = {1, 2, 0x1234, 0x8000, 0xffff};
    for(unsigned int s = 0; s < sizeof(seeds) / sizeof(seeds[0]); ++s) {
        uint16_t ref = seeds[s];
        seed_ptr(ref);
        for(int i = 0; i < 40; ++i) {
            uint16_t expected = ref_next(&ref);
            if((i % 3) == 0) {
                if(random_ptr() != expected) return 1;
            } else if(rand_ptr() != (int)(expected >> 1)) return 2;
        }
    }
    return 0;
}

static int test_zero_and_api(void)
{
    int expected[8];
    srand_ptr(0);
    for(int i = 0; i < 8; ++i) expected[i] = rand();
    seed_ptr(0xbabe);
    for(int i = 0; i < 8; ++i) if(rand() != expected[i]) return 1;
    seed_ptr(0);
    for(int i = 0; i < 8; ++i) if(rand() != expected[i]) return 2;

    srand_ptr(0x8000u);
    uint16_t ref = 0x8000;
    return rand_ptr() != (int)(ref_next(&ref) >> 1);
}

int avm_test_main(void)
{
    if(test_default_seed() || test_range() || test_reseeding() ||
       test_reference() || test_zero_and_api()) return 1;
    avm_init_random_seed();
    return 0;
}
