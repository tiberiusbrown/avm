#include "time_internal.h"

/* The shared conversion writes only on success, so a failed call leaves result
   unchanged. It needs no static storage. */
struct tm *gmtime_r(const time_t *restrict timer, struct tm *restrict result)
{
    return __avm_time_split(*timer, result) ? result : NULL;
}
