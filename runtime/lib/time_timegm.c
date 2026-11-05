#include <time.h>

/* With no time zone and no DST, mktime already interprets the fields as UTC.
   It normalizes them on success and leaves them unchanged on failure. */
time_t timegm(struct tm *timeptr)
{
    return mktime(timeptr);
}
