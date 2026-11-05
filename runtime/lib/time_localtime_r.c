#include <time.h>

/* The local time zone is UTC, so localtime_r shares the fixed-UTC conversion. */
struct tm *localtime_r(const time_t *restrict timer, struct tm *restrict result)
{
    return gmtime_r(timer, result);
}
