#include <time.h>
#include <string.h>
#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)
int avm_test_main(void)
{
    struct tm t={0,34,13,28,9,126,3,300,0};
    char *p=asctime(&t);CHECK(p&&strcmp(p,"Wed Oct 28 13:34:00 2026\n")==0&&strlen(p)==25&&p[25]==0);
    t.tm_mday=1;t.tm_hour=2;t.tm_min=3;t.tm_sec=4;
    CHECK(asctime(&t)==p&&strcmp(p,"Wed Oct  1 02:03:04 2026\n")==0);
    time_t z=0;CHECK(ctime(&z)==p&&strcmp(p,"Thu Jan  1 00:00:00 1970\n")==0);
    CHECK(strcmp(ctime(&z),asctime(localtime(&z)))==0);
    t.tm_year=8100;CHECK(!asctime(&t));t.tm_year=126;
    t.tm_wday=-1;CHECK(!asctime(&t));t.tm_wday=7;CHECK(!asctime(&t));t.tm_wday=0;
    t.tm_mon=-1;CHECK(!asctime(&t));t.tm_mon=12;CHECK(!asctime(&t));t.tm_mon=0;
    t.tm_sec=61;CHECK(!asctime(&t));z=INT64_MAX;CHECK(!ctime(&z));
    return 0;
}
