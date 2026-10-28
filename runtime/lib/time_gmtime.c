#include "time_internal.h"
struct tm *gmtime(const time_t *timer)
{
    static struct tm result;
    return __avm_time_split(*timer, &result) ? &result : NULL;
}
