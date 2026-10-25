#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
float avm_reference_sqrtf(float);
static int check(uint32_t u) {
    float x, a, b; uint32_t aa,bb;
    memcpy(&x,&u,4);
    a=avm_reference_sqrtf(x); b=(float)sqrt((double)x);
    memcpy(&aa,&a,4);memcpy(&bb,&b,4);
    if(aa!=bb) { printf("input %08lx actual %08lx expected %08lx\n",(unsigned long)u,(unsigned long)aa,(unsigned long)bb);return 1; }
    return 0;
}
int main(void) {
    for(uint32_t u=0x3f800000;u<0x40800000;++u) if(check(u)) return 1;
    uint32_t u=0x12345678;
    for(unsigned i=0;i<1000000;++i) {
        u=u*1664525u+1013904223u;
        uint32_t v=u&0x7fffffff;
        if(v<0x7f800000 && check(v)) return 1;
    }
    for(uint32_t u=1;u<0x00800000;u+=13) if(check(u)) return 1;
    puts("Every normalized mantissa/parity, 1,000,000 random inputs, and 645,278 subnormal inputs matched double sqrt rounded to float.");
    return 0;
}
