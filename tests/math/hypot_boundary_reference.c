/* Compare production native-word boundary arithmetic with an independent
   uint64_t oracle. The wide arithmetic exists only in this host test. */
#include <stdio.h>
#include <math.h>
#define hypotf avm_boundary_test_hypotf
#include "../../runtime/lib/math/ef_hypot.c"

static int check(uint32_t ha,uint32_t hb)
{
    uint64_t a=(ha&0x7fffffU)|0x800000U, b=(hb&0x7fffffU)|0x800000U;
    unsigned shift=2*(254-(unsigned)(hb>>23));
    uint64_t threshold=(UINT64_C(0x1ffffff)*UINT64_C(0x1ffffff));
    int expected=4*a*a+((4*b*b)>>shift)>=threshold;
    int actual=avm_hypot_overflows(ha,hb);
    if (actual==expected) return 0;
    printf("hypot boundary %08lx,%08lx actual %d expected %d\n",
        (unsigned long)ha,(unsigned long)hb,actual,expected);
    return 1;
}

int main(void)
{
    uint32_t state=0x41564d26U;
    unsigned count=0;
    for (unsigned gap=0;gap<=14;++gap) {
        for (unsigned i=0;i<65536;++i) {
            state=state*1664525U+1013904223U;
            uint32_t a=0x7f000000U|(state&0x7fffffU);
            state=state*1664525U+1013904223U;
            uint32_t b=((uint32_t)(254-gap)<<23)|(state&0x7fffffU);
            if (check(a,b)) return 1;
            ++count;
        }
        /* Find the exact crossing for every one of the top 1024 mantissas,
           then check the adjacent inputs on each side, at every gap. */
        for (unsigned i=0;i<1024;++i) {
            uint32_t a=0x7f7fffffU-i;
            uint32_t low=0x800000U, high=0x1000000U;
            uint64_t aa=(uint64_t)(a&0x7fffffU)|0x800000U;
            uint64_t target=UINT64_C(0x1ffffff)*UINT64_C(0x1ffffff)-4*aa*aa;
            while (low<high) {
                uint32_t mid=low+(high-low)/2;
                if (((4*(uint64_t)mid*mid)>>(2*gap))>=target) high=mid;
                else low=mid+1;
            }
            for (int d=-2;d<=2;++d) {
                uint32_t m=low+d;
                if (m<0x800000U || m>=0x1000000U) continue;
                uint32_t b=((uint32_t)(254-gap)<<23)|(m&0x7fffffU);
                if (check(a,b)) return 1;
                ++count;
            }
        }
    }
    printf("Exact hypot boundary arithmetic: %u cases passed\n",count);
    return 0;
}
