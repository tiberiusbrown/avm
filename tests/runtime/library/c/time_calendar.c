#include <time.h>
#include <stdint.h>
#include <string.h>
#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)
/* Fixtures stay in test-owned RAM; split phases also bound -O0 C++ temporaries. */
static struct tm t, saved;
static time_t z;
static time_t exact_value;
static int exact_check(void)
{
    CHECK(mktime(&t)==exact_value);
    struct tm *p=gmtime(&exact_value);
    CHECK(p && memcmp(&t,p,sizeof t)==0 && t.tm_isdst==0);
    CHECK(localtime(&exact_value)==p);
    return 0;
}
#define exact(y,m,d,h,n,s,v) (t.tm_year=(y)-1900,t.tm_mon=(m)-1,t.tm_mday=(d), \
    t.tm_hour=(h),t.tm_min=(n),t.tm_sec=(s),t.tm_wday=6,t.tm_yday=300, \
    t.tm_isdst=1,exact_value=(v),exact_check())
static int test_exact(void)
{
    CHECK(!exact(1969,12,31,23,59,59,-1)); CHECK(!exact(1970,1,1,0,0,0,0));
    CHECK(!exact(1970,1,1,0,0,1,1)); CHECK(!exact(2000,1,1,0,0,0,946684800LL));
    CHECK(!exact(2000,2,29,0,0,0,951782400LL));
    CHECK(!exact(2038,1,19,3,14,7,2147483647LL)); CHECK(!exact(2038,1,19,3,14,8,2147483648LL));
    return 0;
}
static int test_dates(void)
{
    z=0; CHECK(gmtime(&z)->tm_wday==4 && gmtime(&z)->tm_yday==0);
    z=951782400LL; CHECK(gmtime(&z)->tm_yday==59);
    for(int i=0;i<4;++i) {
        int y=1900+i*100; if(i==3)y=2400;
        memset(&t,0,sizeof t);t.tm_year=y-1900;t.tm_mon=1;t.tm_mday=29;t.tm_isdst=-1;
        mktime(&t); CHECK(t.tm_mon==((y==2000||y==2400)?1:2));
        t.tm_mon=11;t.tm_mday=31;mktime(&t);
        CHECK(t.tm_yday==((y==2000||y==2400)?365:364));
    }
    return 0;
}
static int test_normalize(void)
{
    memset(&t,0,sizeof t);t.tm_mday=32;t.tm_mon=12;t.tm_year=126;mktime(&t);
    CHECK(t.tm_year==127&&t.tm_mon==1&&t.tm_mday==1);
    t.tm_year=124;t.tm_mon=2;t.tm_mday=0;mktime(&t);CHECK(t.tm_mon==1&&t.tm_mday==29);
    t.tm_mon=0;t.tm_mday=1;t.tm_hour=-1;mktime(&t);CHECK(t.tm_year==123&&t.tm_mon==11&&t.tm_hour==23);
    t.tm_year=124;t.tm_mon=11;t.tm_mday=31;t.tm_hour=23;t.tm_min=59;t.tm_sec=60;
    mktime(&t);CHECK(t.tm_year==125&&t.tm_mon==0&&t.tm_mday==1&&t.tm_sec==0);
    t.tm_year=70;t.tm_mon=0;t.tm_mday=1;t.tm_hour=0;t.tm_min=0;t.tm_sec=-1;
    CHECK(mktime(&t)==-1&&t.tm_year==69&&t.tm_sec==59);
    t.tm_year=124;t.tm_mon=-12;t.tm_mday=1;t.tm_hour=48;t.tm_min=-60;t.tm_sec=120;
    mktime(&t);CHECK(t.tm_year==123&&t.tm_mon==0&&t.tm_mday==2&&t.tm_hour==23&&t.tm_min==2);
    memset(&t,0,sizeof t);t.tm_year=124;t.tm_mon=2;t.tm_mday=-1;t.tm_min=120;
    mktime(&t);CHECK(t.tm_mon==1&&t.tm_mday==28&&t.tm_hour==2&&t.tm_min==0);
    return 0;
}
static int test_limits(void)
{
    for(int i=0;i<2;++i) {
        memset(&t,0,sizeof t);t.tm_year=i?INT16_MAX:INT16_MIN;t.tm_mday=1;
        z=mktime(&t);CHECK(gmtime(&z)&&gmtime(&z)->tm_year==t.tm_year);
        if(!i){--z;CHECK(!gmtime(&z));}
    }
    t.tm_year=INT16_MAX;t.tm_mon=12;memcpy(&saved,&t,sizeof t);
    CHECK(mktime(&t)==-1&&memcmp(&t,&saved,sizeof t)==0);
    t.tm_year=INT16_MIN;t.tm_mon=-1;memcpy(&saved,&t,sizeof t);
    CHECK(mktime(&t)==-1&&memcmp(&t,&saved,sizeof t)==0);
    t.tm_year=INT16_MAX;t.tm_mon=11;t.tm_mday=31;t.tm_hour=23;t.tm_min=59;t.tm_sec=59;
    z=mktime(&t);CHECK(gmtime(&z)&&gmtime(&z)->tm_year==INT16_MAX);++z;CHECK(!gmtime(&z));
    z=INT64_MIN;CHECK(!gmtime(&z));z=INT64_MAX;CHECK(!gmtime(&z));
    return 0;
}
static int test_roundtrip(void)
{
    for(int i=-10;i<=10;++i) {
        z=(time_t)i*123456789LL;memcpy(&t,gmtime(&z),sizeof t);CHECK(mktime(&t)==z);
    }
    return 0;
}
int avm_test_main(void)
{
    return test_exact() || test_dates() || test_normalize() || test_limits() || test_roundtrip();
}
