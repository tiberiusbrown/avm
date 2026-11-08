#include <time.h>
#include <stdint.h>
#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)
int avm_test_main(void)
{
    time_t t=123;CHECK(time(NULL)==-1&&time(&t)==-1&&t==-1);
    CHECK(difftime(4,1)==3&&difftime(1,4)==-3&&difftime(1,1)==0);
    CHECK(difftime(2147483648LL,2147483647LL)==1);
    CHECK(difftime(INT64_MAX,INT64_MAX-1)==1&&difftime(INT64_MIN,INT64_MIN+1)==-1);
    /* Values just below, at, and above a binary32 rounding midpoint. */
    CHECK(difftime(4294967551LL,0)==4294967296.0);
    CHECK(difftime(4294967552LL,0)==4294967296.0);
    CHECK(difftime(4294967553LL,0)==4294967808.0);
    CHECK(difftime(INT64_MAX,INT64_MIN)==(double)UINT64_MAX);
    CHECK(difftime(INT64_MIN,INT64_MAX)==-(double)UINT64_MAX);
    return 0;
}
