#include <time.h>
char *ctime(const time_t *timer)
{
    struct tm *t = localtime(timer);
    return t ? asctime(t) : NULL;
}
