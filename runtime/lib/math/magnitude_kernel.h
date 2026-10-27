#ifndef AVM_MAGNITUDE_KERNEL_H
#define AVM_MAGNITUDE_KERNEL_H
#include "fdlibm.h"
static __attribute__((always_inline)) inline float
avm_extreme_magnitude(float x, float y, int maximum)
{
    uint32_t ux, uy;
    GET_FLOAT_WORD(ux, x);
    GET_FLOAT_WORD(uy, y);
    uint32_t a = ux & 0x7fffffffUL, b = uy & 0x7fffffffUL;
    if (a > 0x7f800000UL || b > 0x7f800000UL) {
        if (issignalingf_inline(x) || issignalingf_inline(y)) return x+y;
        return a > 0x7f800000UL ? y : x;
    }
    if (a != b) return (a > b) == maximum ? x : y;
    /* Equal magnitudes: ordinary numeric maximum/minimum breaks the tie.
       Bit selection also chooses +0 for max and -0 for min. */
    SET_FLOAT_WORD(x, maximum ? ux & uy : ux | uy);
    return x;
}
#endif
