#include "math_test.h"
#include <limits.h>

static uint32_t word(float x) { union { float f; uint32_t u; } v={x}; return v.u; }

static __attribute__((noinline)) int exponent_classes(void)
{
    /* All normal exponent classes, both signs and significand extremes. */
    for (unsigned e=1; e<255; ++e) for (unsigned s=0; s<2; ++s) {
        uint32_t u=((uint32_t)e<<23)|((uint32_t)s<<31)|0x007fffffUL;
        float x=from_bits(u);
        int exponent=123;
        float m=frexpf(x,&exponent);
        if (exponent!=(int)e-126 || word(m)!=((u&0x807fffffUL)|0x3f000000UL) ||
            word(ldexpf(m,exponent))!=u) return 1;
        float toward=s ? -from_bits(0x7f800000UL) : from_bits(0x7f800000UL);
        if (word(nextafterf(x,toward))!=u+1 || word(nextafterf(x,0.0f))!=u-1) return 2;
    }
    for (unsigned e=0; e<23; ++e) for (unsigned s=0; s<2; ++s) {
        uint32_t sign=(uint32_t)s<<31, u=(1UL<<e)|sign;
        int exponent=123;
        float m=frexpf(from_bits(u),&exponent);
        if (exponent!=(int)e-148 || word(m)!=(sign|0x3f000000UL) ||
            word(ldexpf(m,exponent))!=u) return 3;
    }
    return 0;
}

static __attribute__((noinline)) int exceptions(void)
{
    static const AVM_PROGMEM uint32_t specials[]={0,0x80000000UL,0x7f800000UL,
        0xff800000UL,0x7fc12345UL,0xff812345UL};
    for (unsigned i=0; i<6; ++i) {
        float x=from_bits(specials[i]); int e=99;
        if (word(frexpf(x,&e))!=specials[i] || e!=0) return 4;
        if (check_result(ldexpf(x,INT_MAX),specials[i],0,i) ||
            check_result(ldexpf(x,INT_MIN),specials[i],0,i)) return 4;
    }
    return 0;
}

static __attribute__((noinline)) int decomposition(void)
{
    static const AVM_PROGMEM struct {uint32_t x, integer, fraction;} parts[]={
        {0,0,0},{0x80000000UL,0x80000000UL,0x80000000UL},
        {1,0,1},{0x807fffffUL,0x80000000UL,0x807fffffUL},
        {0x3f000000UL,0,0x3f000000UL},{0xbf000000UL,0x80000000UL,0xbf000000UL},
        {0x3fc00000UL,0x3f800000UL,0x3f000000UL},
        {0xbfc00000UL,0xbf800000UL,0xbf000000UL},
        {0x3f7fffffUL,0,0x3f7fffffUL},{0x3f800001UL,0x3f800000UL,0x34000000UL},
        {0x4affffffUL,0x4afffffeUL,0x3f000000UL},
        {0x4b000000UL,0x4b000000UL,0},{0xff7fffffUL,0xff7fffffUL,0x80000000UL},
        {0x7f800000UL,0x7f800000UL,0},{0xff800000UL,0xff800000UL,0x80000000UL},
        {0x7fc12345UL,0x7fc12345UL,0x7fc12345UL}};
    for (unsigned i=0; i<sizeof(parts)/sizeof(parts[0]); ++i) {
        float ip, f=modff(from_bits(parts[i].x),&ip);
        if (check_result(ip,parts[i].integer,0,i) || check_result(f,parts[i].fraction,0,i)) return 5;
    }
    return 0;
}

static __attribute__((noinline)) int adjacency(void)
{
    static const AVM_PROGMEM struct math_case adjacent[]={
        {0,0x80000000UL,0x80000000UL,0},{0x80000000UL,0,0,0},
        {0,0xbf800000UL,0x80000001UL,0},{0x80000000UL,0x3f800000UL,1,0},
        {1,0x80000000UL,0,0},{0x80000001UL,0,0x80000000UL,0},
        {0x007fffffUL,0x3f800000UL,0x00800000UL,0},
        {0x00800000UL,0,0x007fffffUL,0},{0x80800000UL,0,0x807fffffUL,0},
        {0x7f7fffffUL,0x7f800000UL,0x7f800000UL,0},
        {0x7f800000UL,0,0x7f7fffffUL,0},{0xff800000UL,0,0xff7fffffUL,0},
        {0x7fc12345UL,0,0x7fc00000UL,0},{0,0x7f812345UL,0x7fc00000UL,0}};
    if (check_binary(nextafterf,adjacent,sizeof(adjacent)/sizeof(adjacent[0]))) return 6;
    return 0;
}

static __attribute__((noinline)) int scaling(void)
{
    /* Underflow midpoint, ties-to-even on each side, signed overflow, extremes. */
    if (word(ldexpf(1.0f,-150))!=0 || word(ldexpf(1.5f,-149))!=2 ||
        word(ldexpf(2.5f,-149))!=2 || word(ldexpf(-1.0f,-150))!=0x80000000UL ||
        word(ldexpf(from_bits(0x3f800001UL),-150))!=1 ||
        word(ldexpf(1.0f,INT_MIN))!=0 || word(ldexpf(-1.0f,INT_MAX))!=0xff800000UL) return 7;
    if (word(ldexpf(from_bits(0x007fffffUL),-23))!=1 ||
        word(ldexpf(from_bits(0x3fffffffUL),-150))!=1) return 7;
    return 0;
}

static __attribute__((noinline)) int randomized(void)
{
    uint32_t state=0x41564d26UL;
    for (unsigned i=0; i<128; ++i) {
        state=state*1664525UL+1013904223UL;
        uint32_t u=state;
        if ((u&0x7f800000UL)==0x7f800000UL) continue;
        float x=from_bits(u), ip, fraction=modff(x,&ip);
        int e;
        float m=frexpf(x,&e);
        if (word(ldexpf(m,e))!=u || (x!=0 && word(ip+fraction)!=u) ||
            (fraction!=0 && (word(fraction)>>31)!=(u>>31)) ||
            word(nextafterf(nextafterf(x,from_bits(0x7f800000UL)),
                -from_bits(0x7f800000UL)))!=u) return 8;
    }
    return 0;
}

#ifdef __cplusplus
extern "C"
#endif
int avm_test_main(void)
{
    return exponent_classes() || exceptions() || decomposition() || adjacency() || scaling() || randomized();
}
