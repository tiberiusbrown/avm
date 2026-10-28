#include "time_internal.h"
time_t mktime(struct tm *timeptr)
{
    int32_t y = (int32_t)timeptr->tm_year + 1900;
    int32_t q = __avm_time_floor(timeptr->tm_mon, 12);
    y += q;
    int32_t m = (int32_t)timeptr->tm_mon - q * 12 + 1;
    time_t t = (time_t)__avm_time_days(y, m, 1) * 86400
        + ((time_t)timeptr->tm_mday - 1) * 86400
        + (time_t)timeptr->tm_hour * 3600
        + (time_t)timeptr->tm_min * 60 + timeptr->tm_sec;
    struct tm normalized;
    if(!__avm_time_split(t, &normalized)) return (time_t)-1;
    *timeptr = normalized;
    return t;
}
