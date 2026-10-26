#include <math.h>
#include <stdint.h>

/* Exact finite/infinite classification at the final rounding boundary. */
static volatile uint32_t words[8][2]={
    {0x7e541500UL,0x7f7a7301UL},{0x7ecf7bc9UL,0x7f6a09a6UL},
    {0x7f15f6d9UL,0x7f4f7a1fUL},{0x7dfab272UL,0x7f7e1323UL},
    {0x7f5ebe05UL,0x7efc5d26UL},{0x7d16c32bUL,0x7f7fd397UL},
    {0x7f6c835eUL,0x7ec3ef14UL},{0x7ee0924eUL,0x7f660f87UL}
};
static volatile float results[32];
int avm_test_main(void)
{
    __avm_debug_break();
    for (uint8_t i=0;i<32;++i) {
        union {uint32_t u;float f;} a={words[i&7][0]},b={words[i&7][1]};
        results[i]=hypotf(a.f,b.f);
    }
    __avm_debug_break();
    return 0;
}
