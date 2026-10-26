/* Exponent windows retain 24 fractional bits normally and 48 near a
 * cancellation or an ambiguous quadrant. Each has 24 product guard bits.
 * The table aligns the common window; only the cold helper unpacks it.
 * All products use bounded native byte columns, without wide helpers. */
#include "fdlibm.h"
#include "reduction_table.h"
#ifdef __AVM__
#include <avm/pgmspace.h>
#endif

static __attribute__((always_inline)) inline void avm_reduce_product(uint32_t m, struct avm_reduce_window w,
                                      uint8_t product[7], int extended)
{
    uint8_t m0=(uint8_t)m, m1=(uint8_t)(m>>8), m2=(uint8_t)(m>>16);
    uint16_t carry=0;
    /* Inductively carry<768 and each low sum<1536, also with 16-bit int. */
#define COLUMN(i, d0, d1, d2) do { \
    uint16_t a=(uint16_t)m0*(uint8_t)(d0); \
    uint16_t b=(uint16_t)m1*(uint8_t)(d1); \
    uint16_t c=(uint16_t)m2*(uint8_t)(d2); \
    uint16_t lo=carry+(uint16_t)(uint8_t)a+(uint16_t)(uint8_t)b+(uint16_t)(uint8_t)c; \
    if ((i)>=3) product[(i)-3]=(uint8_t)lo; \
    carry=(a>>8)+(b>>8)+(c>>8)+(lo>>8); \
} while (0)
    COLUMN(0, w.low, 0, 0);
    COLUMN(1, w.low>>8, w.low, 0);
    COLUMN(2, w.low>>16, w.low>>8, w.low);
    COLUMN(3, w.low>>24, w.low>>16, w.low>>8);
    COLUMN(4, w.middle, w.low>>24, w.low>>16);
    COLUMN(5, w.middle>>8, w.middle, w.low>>24);
    COLUMN(6, w.middle>>16, w.middle>>8, w.middle);
    if (extended) {
        COLUMN(7, w.middle>>24, w.middle>>16, w.middle>>8);
        COLUMN(8, w.high, w.middle>>24, w.middle>>16);
        COLUMN(9, w.high>>8, w.high, w.middle>>24);
    }
#undef COLUMN
}

static __attribute__((noinline)) float avm_reduce_extended(float x, int *quadrant)
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
    uint32_t high;
    int n,up;
    float r;
    struct avm_reduce_window full;
    full.low=(window.low<<24)|(window.middle>>18)|((uint32_t)window.high<<14);
    full.middle=(window.low>>8)|(window.middle<<24);
    full.high=(uint16_t)((window.middle>>8)&0x3ffUL);
    avm_reduce_product(m,full,product,1);
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
    narrow.low=window.low;
    narrow.middle=window.middle;
    narrow.high=0;
    avm_reduce_product(m,narrow,product,0);
    uint32_t high=(uint32_t)product[0]|((uint32_t)product[1]<<8)|
                  ((uint32_t)product[2]<<16)|((uint32_t)product[3]<<24);
    int n=product[3]&3;
    high&=0xffffffUL;
    int up=(int)(high>>23);
    n+=up;
    uint32_t distance=up ? ((0UL-high)&0xffffffUL) : high;
    float r;
    /* The table product and fraction truncation together lose <2 units.
       Extend when those omitted bits could carry across a half-integer. */
    int ambiguous=((high+2UL)&0xfffffcUL)==0x800000UL;
    if (distance>=65536UL && !ambiguous) {
        /* The omitted fractional bits cost <2^-23 of pi/2. Convert the
           signed fixed-point fraction directly, with one float multiply. */
        r=(float)(int32_t)(high<<8)*0x1.921fb6p-32f;
        if (bits>>31) r=-r;
        *quadrant=bits>>31 ? -n : n;
        return r;
    }
    /* Identical ABI: release the normal frame before allocating the wider
       product's frame. This also avoids a redundant guest CALL/RET pair. */
    __attribute__((musttail)) return avm_reduce_extended(x,quadrant);
}

/* Header callers have classified 1024 < abs(x) <= 100000. Share the strict
   medium-range reconstruction to keep its live state out of common frames. */
__attribute__((noinline)) float avm_rem_pio2f_medium(float x, int *quadrant)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits,x);
    uint32_t magnitude=bits&0x7fffffffUL;
    float a=__builtin_fabsf(x),r;
    int n;
    uint32_t doubled = (uint32_t)(a*0x1.45f306p0f);
    uint32_t nearest = (doubled+1UL)>>1;
    float fn = (float)nearest;
    r = (a-fn*0x1.92p0f)-fn*0x1.fb5444p-12f;
    n = (int)(nearest & 3UL);
    if (r > 0x1.921fb6p-1f) {
        ++n;
        r = (r-0x1.921fb4p0f)-0x1.4442d2p-24f;
    } else if (r < -0x1.921fb6p-1f) {
        --n;
        r = (r+0x1.921fb4p0f)+0x1.4442d2p-24f;
    }
    uint32_t rb;
    GET_FLOAT_WORD(rb, r);
    /* A relative cancellation guard protects reciprocal tan near poles.
       Compare exponents without another float multiply. */
    if (n&1) {
        if ((rb&0x7fffffffUL)<magnitude-(21UL<<23))
            __attribute__((musttail)) return __kernel_rem_pio2f(x, quadrant);
    } else if (!(rb&0x7fffffffUL)) {
        /* Rare exact cancellation in the rounded low product must not
           lose the side of a multiple for sine/cosine or even tan. */
        __attribute__((musttail)) return __kernel_rem_pio2f(x, quadrant);
    }
    if (bits>>31) { r=-r; n=-n; }
    *quadrant=n;
    return r;
}
