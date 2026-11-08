#include <time.h>
#include <stdint.h>
#include <string.h>

#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)

/* Static fixtures keep the call tree within the AVM stack bound. */
static struct tm fixed, expected, saved;
static time_t when;
static struct tm *(*volatile reentrant_gm)(const time_t *, struct tm *) = gmtime_r;
static struct tm *(*volatile reentrant_lm)(const time_t *, struct tm *) = localtime_r;
static time_t (*volatile utc_make)(struct tm *) = timegm;

static int same_fields(const struct tm *a, const struct tm *b)
{
    return memcmp(a, b, sizeof *a) == 0;
}

static int test_gmtime_r(void)
{
    when = 951782400LL; /* 2000-02-29 00:00:00 UTC */
    CHECK(gmtime_r(&when, &fixed) == &fixed);
    CHECK(fixed.tm_year == 100 && fixed.tm_mon == 1 && fixed.tm_mday == 29);
    CHECK(fixed.tm_hour == 0 && fixed.tm_min == 0 && fixed.tm_sec == 0);
    CHECK(fixed.tm_wday == 2 && fixed.tm_yday == 59 && fixed.tm_isdst == 0);
    CHECK(gmtime(&when) && same_fields(gmtime(&when), &fixed));

    when = -1; /* 1969-12-31 23:59:59 UTC */
    CHECK(reentrant_gm(&when, &fixed) == &fixed);
    CHECK(fixed.tm_year == 69 && fixed.tm_mon == 11 && fixed.tm_mday == 31);
    CHECK(fixed.tm_hour == 23 && fixed.tm_min == 59 && fixed.tm_sec == 59);
    CHECK(fixed.tm_wday == 3 && fixed.tm_yday == 364);

    /* An unrepresentable time fails and leaves the caller's object unchanged. */
    memcpy(&saved, &fixed, sizeof fixed);
    when = INT64_MAX;
    CHECK(gmtime_r(&when, &fixed) == NULL && same_fields(&fixed, &saved));
    when = INT64_MIN;
    CHECK(reentrant_gm(&when, &fixed) == NULL && same_fields(&fixed, &saved));
    return 0;
}

static int test_localtime_r(void)
{
    when = 951782400LL;
    memset(&expected, 0, sizeof expected);
    CHECK(gmtime_r(&when, &expected) == &expected);
    CHECK(localtime_r(&when, &fixed) == &fixed && same_fields(&fixed, &expected));
    CHECK(reentrant_lm(&when, &fixed) == &fixed && same_fields(&fixed, &expected));

    memcpy(&saved, &fixed, sizeof fixed);
    when = INT64_MAX;
    CHECK(reentrant_lm(&when, &fixed) == NULL && same_fields(&fixed, &saved));
    return 0;
}

static int test_timegm(void)
{
    /* Out-of-range fields normalize to 2024-02-29 00:00:00 UTC. */
    memset(&expected, 0, sizeof expected);
    expected.tm_year = 124;
    expected.tm_mon = 2;
    expected.tm_mday = 0;
    CHECK(utc_make(&expected) == 1709164800LL);
    CHECK(expected.tm_year == 124 && expected.tm_mon == 1 && expected.tm_mday == 29);
    CHECK(expected.tm_yday == 59 && expected.tm_wday == 4 && expected.tm_isdst == 0);

    /* timegm matches mktime, since AVM's calendar has no time zone. */
    memset(&expected, 0, sizeof expected);
    expected.tm_year = 124;
    expected.tm_mon = 2;
    expected.tm_mday = 0;
    expected.tm_hour = 25;
    memcpy(&saved, &expected, sizeof expected);
    CHECK(utc_make(&expected) == mktime(&saved));
    CHECK(same_fields(&expected, &saved));

    /* An unrepresentable year fails and leaves the fields unchanged, as mktime does. */
    memset(&expected, 0, sizeof expected);
    expected.tm_year = INT16_MAX;
    expected.tm_mon = 12;
    expected.tm_mday = 1; /* Jan 1 of year 34668 is beyond tm_year's range. */
    memcpy(&saved, &expected, sizeof expected);
    CHECK(utc_make(&expected) == -1 && same_fields(&expected, &saved));
    return 0;
}

int avm_test_main(void)
{
    int result = test_gmtime_r();
    if(result) return result;
    result = test_localtime_r();
    if(result) return result;
    return test_timegm();
}
