#include "math_test.h"
#include <errno.h>

/* fromfp rounds with a named direction, then accepts the integer only when it
   fits the width. Failures return NaN and set errno to EDOM. */
struct fromfp_case {
    uint32_t x;
    int rnd;
    unsigned int width;
    uint32_t expected;
    uint16_t domain;
};

typedef float (*fromfp_fn)(float, int, unsigned int);

static int check_fromfp(fromfp_fn fn, const AVM_PROGMEM struct fromfp_case *cases,
                        unsigned count)
{
    for (unsigned i = 0; i < count; ++i) {
        union { float f; uint32_t u; } result;
        errno = 0;
        result.f = fn(from_bits(cases[i].x), cases[i].rnd, cases[i].width);
        int domain = errno == EDOM;
        if (domain != !!cases[i].domain) {
            test_line16("case", (uint16_t)i);
            test_line16("errno", (uint16_t)errno);
            return 1;
        }
        if (cases[i].domain) {
            if ((result.u & 0x7fffffffUL) <= 0x7f800000UL) {
                test_line16("case", (uint16_t)i);
                test_line32("actual", result.u);
                return 1;
            }
        } else if (errno != 0 || result.u != cases[i].expected) {
            test_line16("case", (uint16_t)i);
            test_line32("actual", result.u);
            test_line32("expected", cases[i].expected);
            return 1;
        }
    }
    return 0;
}

static const AVM_PROGMEM struct fromfp_case signed_cases[] = {
    {0x40200000UL, FP_INT_TONEAREST, 8, 0x40000000UL, 0},          /* 2.5 -> 2 */
    {0x40200000UL, FP_INT_TONEARESTFROMZERO, 8, 0x40400000UL, 0},  /* 2.5 -> 3 */
    {0xc0200000UL, FP_INT_TONEARESTFROMZERO, 8, 0xc0400000UL, 0},  /* -2.5 -> -3 */
    {0xbe99999aUL, FP_INT_TOWARDZERO, 1, 0x80000000UL, 0},         /* -0.3 -> -0 in [-1,0] */
    {0xb7fa4fd6UL, FP_INT_UPWARD, 1, 0x80000000UL, 0},             /* tiny negative -> -0 */
    {0x3e99999aUL, FP_INT_UPWARD, 1, 0, 1},                        /* 0.3 -> 1 is outside [-1,0] */
    {0x42ff0000UL, FP_INT_TONEAREST, 8, 0, 1},                     /* 127.5 -> 128 is outside */
    {0xc3000000UL, FP_INT_TONEAREST, 8, 0xc3000000UL, 0},          /* -128 is the signed minimum */
    {0x3f800000UL, FP_INT_TONEAREST, 0, 0, 1},                     /* zero width is a domain error */
    {0xbf800000UL, FP_INT_TONEAREST, 1, 0xbf800000UL, 0},          /* -1 fits width 1 */
    {0x3f800000UL, FP_INT_TONEAREST, 1, 0, 1},                     /* 1 does not fit width 1 */
    {0x4b7fffffUL, FP_INT_TOWARDZERO, 25, 0x4b7fffffUL, 0},        /* 2^24-1 fits width 25 */
    {0x4b800000UL, FP_INT_TOWARDZERO, 25, 0, 1},                   /* 2^24 does not */
    {0x71800000UL, FP_INT_TOWARDZERO, 200, 0x71800000UL, 0},       /* 2^100 fits width 200 */
    {0x71800000UL, FP_INT_TOWARDZERO, 64, 0, 1},                   /* 2^100 needs more than 64 */
    {0xdf000000UL, FP_INT_TOWARDZERO, 64, 0xdf000000UL, 0},        /* -2^63 is the minimum */
    {0x7fc00000UL, FP_INT_TONEAREST, 8, 0, 1},                     /* NaN -> domain error */
    {0x7f800000UL, FP_INT_TONEAREST, 8, 0, 1},                     /* +inf -> domain error */
};

static const AVM_PROGMEM struct fromfp_case unsigned_cases[] = {
    {0x437f6666UL, FP_INT_TOWARDZERO, 8, 0x437f0000UL, 0},  /* 255.4 -> 255 */
    {0x43800000UL, FP_INT_TONEAREST, 8, 0, 1},              /* 256 does not fit */
    {0xbf800000UL, FP_INT_TONEAREST, 8, 0, 1},              /* -1 is negative */
    {0xbf000000UL, FP_INT_TONEAREST, 8, 0x80000000UL, 0},   /* -0.5 -> -0 is in range */
    {0x3f800000UL, FP_INT_TONEAREST, 1, 0x3f800000UL, 0},   /* 1 fits width 1 */
    {0x40000000UL, FP_INT_TONEAREST, 1, 0, 1},              /* 2 does not fit width 1 */
    {0x4b7fffffUL, FP_INT_TOWARDZERO, 24, 0x4b7fffffUL, 0}, /* 2^24-1 fits width 24 */
    {0x4b800000UL, FP_INT_TOWARDZERO, 24, 0, 1},            /* 2^24 does not */
};

int avm_test_main(void)
{
    unsigned signed_count = sizeof(signed_cases) / sizeof(signed_cases[0]);
    unsigned unsigned_count = sizeof(unsigned_cases) / sizeof(unsigned_cases[0]);
    if (check_fromfp(fromfpf, signed_cases, signed_count)) return 1;
    if (check_fromfp(fromfpxf, signed_cases, signed_count)) return 2;
    if (check_fromfp(ufromfpf, unsigned_cases, unsigned_count)) return 3;
    if (check_fromfp(ufromfpxf, unsigned_cases, unsigned_count)) return 4;

    /* The wider forms take the same values and domain decisions. */
    errno = 0;
    double d = fromfp((double)from_bits(0x40200000UL), FP_INT_TONEAREST, 8);
    if (errno != 0 || (float)d != from_bits(0x40000000UL)) return 5;
    errno = 0;
    long double ld = ufromfpl((long double)from_bits(0x43800000UL), FP_INT_TONEAREST, 8);
    if (errno != EDOM || ld == ld) return 6;
    return 0;
}
