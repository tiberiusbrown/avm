#include <wchar.h>
#include <wctype.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "test_hex_output.h"
#define CHECK(e) do { if(!(e)) { test_line16("LINE", __LINE__); return 1; } } while(0)

#include <math.h>
#include <limits.h>
#define PAIR(wfn,nfn,type,extra) do { \
    static wchar_t *we; static char *ne; static int err; static type a,b; errno=EDOM; \
    a=wfn((const wchar_t *)s,&we extra); err=errno; errno=EDOM; \
    b=nfn(s,&ne extra); \
    CHECK((a==b || (isnan(a) && isnan(b))) && err==errno && (char *)we==ne); \
} while(0)
#define IPAIR(wfn,nfn,type) do { \
    static wchar_t *we; static char *ne; static int err; static type a,b; errno=EDOM; \
    a=wfn((const wchar_t *)s,&we,base); err=errno; errno=EDOM; \
    b=nfn(s,&ne,base); \
    CHECK(a==b && err==errno && (char *)we==ne); \
} while(0)
static int integers(const char *s) {
    static const int bases[]={0,2,8,10,16,36,1,37};
    for(unsigned int i=0;i<8;++i) {
        int base=bases[i];
        IPAIR(wcstol,strtol,long); IPAIR(wcstoll,strtoll,long long);
        IPAIR(wcstoul,strtoul,unsigned long); IPAIR(wcstoull,strtoull,unsigned long long);
    }
    return 0;
}
static int floats(const char *s) {
    PAIR(wcstof,strtof,float,); PAIR(wcstod,strtod,double,);
    PAIR(wcstold,strtold,long double,);
    return 0;
}
int avm_test_main(void) {
    static const char *const ints[]={"","  -42z","0xff!","077","10101","xyz","2147483647","-2147483648","4294967295","9223372036854775807","-9223372036854775808","18446744073709551615","9999999999999999999999","-9999999999999999999999"};
    for(unsigned int i=0;i<sizeof(ints)/sizeof(*ints);++i) CHECK(!integers(ints[i]));
    static const char *const fp[]={"","  +1.25z","-0x1.8p2!","inf","-infinity","nan","none","1e99","1e-99"};
    for(unsigned int i=0;i<sizeof(fp)/sizeof(*fp);++i) CHECK(!floats(fp[i]));
    CHECK(wcstof(L"2",NULL)==2 && wcstod(L"2",NULL)==2 && wcstold(L"2",NULL)==2);
    CHECK(wcstol(L"2",NULL,10)==2 && wcstoll(L"2",NULL,10)==2);
    CHECK(wcstoul(L"2",NULL,10)==2 && wcstoull(L"2",NULL,10)==2);
    return 0;
}
