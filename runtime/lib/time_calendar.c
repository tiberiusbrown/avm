#include "time_internal.h"
#include <stdint.h>
int32_t __avm_time_floor(int32_t n, int32_t d)
{
    int32_t q = n / d;
    return q - (n % d < 0);
}
/* March-based 400-year cycles; era division must round toward -infinity. */
int32_t __avm_time_days(int32_t y, int32_t m, int32_t d)
{
    y -= m <= 2;
    int32_t era = __avm_time_floor(y, 400);
    int32_t yoe = y - era * 400;
    int32_t mp = m + (m > 2 ? -3 : 9);
    int32_t doy = (153 * mp + 2) / 5 + d - 1;
    return era * 146097 + yoe * 365 + yoe / 4 - yoe / 100 + doy - 719468;
}
void __avm_time_civil(int32_t z, int32_t *y, int32_t *m, int32_t *d)
{
    z += 719468;
    int32_t era = __avm_time_floor(z, 146097);
    int32_t doe = z - era * 146097;
    int32_t yoe = (doe - doe / 1460 + doe / 36524 - doe / 146096) / 365;
    *y = yoe + era * 400;
    int32_t doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    int32_t mp = (5 * doy + 2) / 153;
    *d = doy - (153 * mp + 2) / 5 + 1;
    *m = mp + (mp < 10 ? 3 : -9);
    *y += *m <= 2;
}
int __avm_time_split(time_t t, struct tm *out)
{
    /* Quotient/remainder avoids overflowing days * 86400 at INT64_MIN. */
    int64_t days = t / 86400;
    int32_t sod = (int32_t)(t % 86400);
    if(sod < 0) { --days; sod += 86400; }
    /* Bound the input before the 32-bit civil conversion and year narrowing. */
    if(days < -20000000L || days > 20000000L) return 0;
    int32_t z = (int32_t)days, y, m, d;
    __avm_time_civil(z, &y, &m, &d);
    if(y - 1900 < INT16_MIN || y - 1900 > INT16_MAX) return 0;
    out->tm_year = (int)(y - 1900);
    out->tm_mon = (int)(m - 1);
    out->tm_mday = (int)d;
    out->tm_hour = (int)(sod / 3600);
    out->tm_min = (int)(sod / 60 % 60);
    out->tm_sec = (int)(sod % 60);
    out->tm_wday = (int)((z + 4) % 7);
    if(out->tm_wday < 0) out->tm_wday += 7;
    out->tm_yday = (int)(z - __avm_time_days(y, 1, 1));
    out->tm_isdst = 0;
    return 1;
}
