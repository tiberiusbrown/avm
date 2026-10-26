/* Exponent-indexed sliding windows of 2/pi, with a single-float result.
 * Normally 32 fractional bits, extended to 48 at cancellation or an ambiguous
 * nearest-quadrant boundary. 24 coefficient guard bits bound truncation error.
 * No full-width product, compensation tail, or general 64-bit guest math.
 */
#include "fdlibm.h"
#include "reduction_table.h"
#ifdef __AVM__
#include <avm/pgmspace.h>
#endif

/* Byte columns keep every multiplication on the native MULU8.W path.
   Empty register dependencies prevent hoisting the whole product into spills. */
static __attribute__((always_inline)) inline void avm_reduce_product(uint32_t m, struct avm_reduce_window w,
                                      uint8_t product[7], int extended)
{
    uint8_t m0=(uint8_t)m, m1=(uint8_t)(m>>8), m2=(uint8_t)(m>>16);
    uint16_t carry=0;
#ifdef __AVM__
#define REDUCE_BARRIER() __asm__("" : "+r"(m0), "+r"(m1), "+r"(m2), "+r"(carry))
#else
#define REDUCE_BARRIER() ((void)0)
#endif
#define COLUMN(i, d0, d1, d2) do { \
    uint16_t a=(uint16_t)m0*(uint8_t)(d0); \
    uint16_t b=(uint16_t)m1*(uint8_t)(d1); \
    uint16_t c=(uint16_t)m2*(uint8_t)(d2); \
    uint16_t lo=carry+(uint16_t)(uint8_t)a+(uint16_t)(uint8_t)b+(uint16_t)(uint8_t)c; \
    if ((i)>=3) product[(i)-3]=(uint8_t)lo; \
    carry=(a>>8)+(b>>8)+(c>>8)+(lo>>8); \
    REDUCE_BARRIER(); \
} while (0)
    COLUMN(0, w.low, 0, 0);
    COLUMN(1, w.low>>8, w.low, 0);
    COLUMN(2, w.low>>16, w.low>>8, w.low);
    COLUMN(3, w.low>>24, w.low>>16, w.low>>8);
    COLUMN(4, w.middle, w.low>>24, w.low>>16);
    COLUMN(5, w.middle>>8, w.middle, w.low>>24);
    COLUMN(6, w.middle>>16, w.middle>>8, w.middle);
    COLUMN(7, w.middle>>24, w.middle>>16, w.middle>>8);
    if (extended) {
        COLUMN(8, w.high, w.middle>>24, w.middle>>16);
        COLUMN(9, w.high>>8, w.high, w.middle>>24);
    }
#undef COLUMN
#undef REDUCE_BARRIER
}

float __kernel_rem_pio2f(float x, int *quadrant)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    unsigned exponent = ((bits>>23)&255)-127;
    uint32_t m = (bits&0x7fffffUL)|0x800000UL;
    struct avm_reduce_window window;
#ifdef __AVM__
    memcpy_P(&window, &avm_reduce_windows[exponent], sizeof(window));
#else
    window = avm_reduce_windows[exponent];
#endif
    uint8_t product[7];
    struct avm_reduce_window narrow;
    narrow.low=(window.low>>16)|(window.middle<<16);
    narrow.middle=(window.middle>>16)|((uint32_t)window.high<<16);
    narrow.high=0;
    avm_reduce_product(m,narrow,product,0);
    uint32_t high=(uint32_t)product[0]|((uint32_t)product[1]<<8)|
                  ((uint32_t)product[2]<<16)|((uint32_t)product[3]<<24);
    int n=product[4]&3;
    int up=(int)(high>>31);
    n+=up;
    uint32_t distance=up ? 0UL-high : high;
    float r;
    /* The table product and fraction truncation together lose <2 units.
       Extend when those omitted bits could carry across a half-integer. */
    int ambiguous=((high+2UL)&0xfffffffcUL)==0x80000000UL;
    if (distance>=65536UL && !ambiguous) {
        /* The omitted fractional bits cost <2^-32 of pi/2. Convert the
           signed fixed-point fraction directly, with one float multiply. */
        r=(float)(int32_t)high*0x1.921fb6p-32f;
        if (bits>>31) r=-r;
        *quadrant=bits>>31 ? -n : n;
        return r;
    }
    /* Near cancellation, extend the local window to 48 fractional bits.
       This also handles an ambiguous carry through zero in the 32-bit path. */
    avm_reduce_product(m,window,product,1);
    uint16_t low=(uint16_t)product[0]|((uint16_t)product[1]<<8);
    high=(uint32_t)product[2]|((uint32_t)product[3]<<8)|
         ((uint32_t)product[4]<<16)|((uint32_t)product[5]<<24);
    n=product[6]&3;
    up=(int)(high>>31);
    if (up) {
        ++n;
        high=~high+(low==0);
        low=(uint16_t)(0U-low);
    }
    float fraction=(float)high*0x1p-32f+(float)low*0x1p-48f;
    r=fraction*0x1.921fb6p0f;
    if (up != (int)(bits>>31)) r=-r;
    *quadrant = bits>>31 ? -n : n;
    return r;
}
