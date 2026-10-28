#include <time.h>
#include <avm.h>

clock_t clock(void)
{
    return (clock_t)avm_millis32();
}

time_t time(time_t *timer)
{
    if(timer) *timer = (time_t)-1;
    return (time_t)-1;
}
/* The native conversion accepts 32 bits. Reduce with a sticky low bit before
   that conversion, preserving correct binary32 rounding of the full magnitude.
   Scaling by a power of two is exact and needs no 64-bit floating helper. */
static double magnitude_seconds(uint64_t magnitude)
{
    unsigned shift = 0;
    while(magnitude > UINT32_MAX) {
        magnitude = (magnitude >> 1) | (magnitude & 1);
        ++shift;
    }
    union { uint32_t bits; float value; } scale;
    scale.bits = ((uint32_t)127 + shift) << 23;
    return (double)(uint32_t)magnitude * scale.value;
}
double difftime(time_t time1, time_t time0)
{
    if(time1 >= time0) return magnitude_seconds((uint64_t)time1 - (uint64_t)time0);
    return -magnitude_seconds((uint64_t)time0 - (uint64_t)time1);
}
