#include <time.h>

#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)

/* Static fixtures keep the call tree within the AVM stack bound. */
static struct timespec ts;
static int (*volatile get_time)(struct timespec *, int) = timespec_get;
static int (*volatile get_resolution)(struct timespec *, int) = timespec_getres;

_Static_assert(TIME_UTC != 0, "TIME_UTC is nonzero");
_Static_assert(_Generic(((struct timespec *)0)->tv_sec, time_t: 1, default: 0),
               "tv_sec has type time_t");
_Static_assert(_Generic(((struct timespec *)0)->tv_nsec, long: 1, default: 0),
               "tv_nsec has type long");

/* Calendar time is unavailable, so every base fails and leaves ts unchanged. */
int avm_test_main(void)
{
    ts.tv_sec = 7;
    ts.tv_nsec = 9;
    CHECK(timespec_get(&ts, TIME_UTC) == 0);
    CHECK(ts.tv_sec == 7 && ts.tv_nsec == 9);
    CHECK(timespec_get(&ts, 0) == 0);
    CHECK(get_time(&ts, TIME_UTC) == 0 && ts.tv_sec == 7);
    CHECK(timespec_getres(&ts, TIME_UTC) == 0);
    CHECK(get_resolution(&ts, 0) == 0 && ts.tv_nsec == 9);
    return 0;
}
