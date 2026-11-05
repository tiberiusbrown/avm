#include <time.h>

/* Calendar time is unavailable: time() reports (time_t)-1. Every base therefore
   fails, which the standard permits when the clock cannot be read. Failure
   leaves the caller's timespec unchanged. */
int timespec_get(struct timespec *ts, int base)
{
    (void)ts;
    (void)base;
    return 0;
}

int timespec_getres(struct timespec *res, int base)
{
    (void)res;
    (void)base;
    return 0;
}
