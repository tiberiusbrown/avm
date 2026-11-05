#ifndef _AVM_RUNTIME_TIME_H
#define _AVM_RUNTIME_TIME_H
#define __STDC_VERSION_TIME_H__ 202311L

#include <stdint.h>
#include <stddef.h>

typedef uint32_t clock_t;
typedef int64_t time_t;
struct tm {
    int tm_sec, tm_min, tm_hour, tm_mday, tm_mon, tm_year;
    int tm_wday, tm_yday, tm_isdst;
};
struct timespec {
    time_t tv_sec;
    long tv_nsec;
};

#define CLOCKS_PER_SEC ((clock_t)1000u)
/* The only calendar base. Calendar time is unavailable, so it always fails. */
#define TIME_UTC 1

#ifdef __cplusplus
extern "C" {
#endif

clock_t clock(void);
time_t time(time_t *timer);
double difftime(time_t time1, time_t time0);
time_t mktime(struct tm *timeptr);
struct tm *gmtime(const time_t *timer);
struct tm *localtime(const time_t *timer);
char *asctime(const struct tm *timeptr);
char *ctime(const time_t *timer);
size_t strftime(char *__restrict s, size_t maxsize,
                const char *__restrict format, const struct tm *__restrict timeptr);
int timespec_get(struct timespec *ts, int base);
int timespec_getres(struct timespec *res, int base);
struct tm *gmtime_r(const time_t *__restrict timer, struct tm *__restrict result);
struct tm *localtime_r(const time_t *__restrict timer, struct tm *__restrict result);
time_t timegm(struct tm *timeptr);

#ifdef __cplusplus
}
#endif

#endif // _AVM_RUNTIME_TIME_H
