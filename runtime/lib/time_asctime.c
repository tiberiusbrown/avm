#include "time_internal.h"
static void pair(char *p, int n) { p[0] = '0' + n / 10; p[1] = '0' + n % 10; }
char *asctime(const struct tm *t)
{
    static char result[26];
    int32_t y = (int32_t)t->tm_year + 1900;
    if(t->tm_wday < 0 || t->tm_wday > 6 || t->tm_mon < 0 || t->tm_mon > 11 ||
       t->tm_mday < 1 || t->tm_mday > 31 || t->tm_hour < 0 || t->tm_hour > 23 ||
       t->tm_min < 0 || t->tm_min > 59 || t->tm_sec < 0 || t->tm_sec > 60 ||
       t->tm_yday < 0 || t->tm_yday > 365 || y < 1000 || y > 9999) return NULL;
    for(int i = 0; i < 3; ++i) {
        result[i] = __avm_time_weekdays[t->tm_wday][i];
        result[i + 4] = __avm_time_months[t->tm_mon][i];
    }
    result[3] = result[7] = result[10] = result[19] = ' ';
    pair(result + 8, t->tm_mday);
    if(t->tm_mday < 10) result[8] = ' ';
    pair(result + 11, t->tm_hour); pair(result + 14, t->tm_min); pair(result + 17, t->tm_sec);
    result[13] = result[16] = ':';
    pair(result + 20, (int)(y / 100)); pair(result + 22, (int)(y % 100));
    result[24] = '\n'; result[25] = 0;
    return result;
}
