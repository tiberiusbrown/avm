#include <stdint.h>

#define PN __attribute__((preserve_none, noinline))
#define NOINLINE __attribute__((noinline))

static PN uint32_t clobber(uint32_t value) {
    __asm__ volatile("ldi16 r0, 0x1357\n\t"
                     "ldi16 r1, 0x2468\n\t"
                     "ldi16 r2, 0x369a\n\t"
                     "ldi16 r3, 0x47ab"
                     : : : "r0", "r1", "r2", "r3");
    return value ^ 0x5a69c3f0ul;
}

typedef uint32_t (__attribute__((preserve_none)) *callback)(uint32_t);
_Static_assert(sizeof(callback) == 3, "preserve_none keeps 24-bit code pointers");
static callback volatile indirect = clobber;

PN uint16_t sum_five(uint16_t a, uint16_t b, uint16_t c,
                     uint16_t d, uint16_t e) {
    return a + b + c + d + e;
}

static NOINLINE uint32_t call_with_live_values(uint32_t seed, uint8_t count) {
    volatile uint8_t *buffer = __builtin_alloca(count);
    buffer[0] = (uint8_t)seed;
    buffer[count - 1] = (uint8_t)(seed >> 8);
    uint32_t a = seed + 0x1020304ul;
    uint32_t b = seed ^ 0x5060708ul;
    uint16_t c = (uint16_t)seed + 0x1234;
    __asm__ volatile("" : "+q"(a), "+q"(b), "+r"(c));
    uint32_t first = clobber(seed);
    uint32_t second = indirect(seed + 1);
    uint16_t sum = sum_five(1, 2, 3, 4, c);
    __asm__ volatile("" : "+q"(a), "+q"(b), "+r"(c));
    return first + second + a + b + sum + c + buffer[0] + buffer[count - 1];
}

int avm_test_main(void) {
    for (uint16_t seed = 1; seed < 40; seed += 7) {
        uint16_t c = seed + 0x1234;
        uint32_t expected = ((uint32_t)seed ^ 0x5a69c3f0ul) +
                            ((uint32_t)(seed + 1) ^ 0x5a69c3f0ul) +
                            (seed + 0x1020304ul) + (seed ^ 0x5060708ul) +
                            (uint16_t)(10 + c) + c + seed;
        if (call_with_live_values(seed, 9) != expected ||
            call_with_live_values(seed, 17) != expected)
            return 1;
    }
    return 0;
}
