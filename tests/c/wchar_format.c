#include <wchar.h>
#include <wctype.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "test_hex_output.h"
#define CHECK(e) do { if(!(e)) { test_line16("LINE", __LINE__); return 1; } } while(0)

#include <stdint.h>
static int forward(wchar_t *s,size_t n,const wchar_t *fmt,...) {
    va_list args; va_start(args,fmt); int r=vswprintf(s,n,fmt,args); va_end(args); return r;
}
static int stream(const wchar_t *fmt,...) {
    va_list args; va_start(args,fmt); int r=vfwprintf(stderr,fmt,args); va_end(args); return r;
}
static int standard(const wchar_t *fmt,...) {
    va_list args; va_start(args,fmt); int r=vwprintf(fmt,args); va_end(args); return r;
}
static int (*volatile indirect)(wchar_t *,size_t,const wchar_t *,...)=swprintf;
static int numeric(void) {
    wchar_t b[48];
    CHECK(swprintf(b,48,L"%hhd:%hd:%ld:%lld:%ju:%zu:%td",-3,-4,-5L,-6LL,(uintmax_t)7,(size_t)8,(ptrdiff_t)-9)==18);
    CHECK(!wcscmp(b,L"-3:-4:-5:-6:7:8:-9"));
    CHECK(swprintf(b,48,L"%i:%o:%u:%X",-2,8,9,0xab)==10 && !wcscmp(b,L"-2:10:9:AB"));
    CHECK(swprintf(b,48,L"%6.2f",1.25)==6 && !wcscmp(b,L"  1.25"));
    const wchar_t *fmts[]={L"%F",L"%e",L"%E",L"%g",L"%G",L"%a",L"%A",L"%Lf"};
    for(unsigned int i=0;i<8;++i) {
        char expected[40]; int n=snprintf(expected,40,(const char *)fmts[i],(long double)1.25);
        CHECK(swprintf(b,48,fmts[i],(long double)1.25)==n && !strcmp((char *)b,expected));
    }
    char expected[20]; int n=snprintf(expected,20,"%p",b);
    CHECK(swprintf(b,48,L"%p",b)==n && !strcmp((char *)b,expected));
    return 0;
}
int avm_test_main(void) {
    wchar_t b[32]; int count=-1;
    CHECK(indirect(b,32,L"%lc:%ls",255,L"ok")==4 && b[0]==255 && !wcscmp(b+1,L":ok"));
    CHECK(swprintf(b,32,L"%s:%c","ok",'x')==4 && !wcscmp(b,L"ok:x"));
    CHECK(swprintf(b,32,L"%04x:%d%n",42,-7,&count)==7 && count==7 && !wcscmp(b,L"002a:-7"));
    CHECK(forward(b,32,L"%5.1ls",L"abc")==5 && !wcscmp(b,L"    a"));
    CHECK(forward(b,32,L"%-*.*ls",5,2,L"abc")==5 && !wcscmp(b,L"ab   "));
    CHECK(swprintf(b,32,L"%%")==1 && !wcscmp(b,L"%"));
    CHECK(swprintf(b,4,L"abc")==3 && !wcscmp(b,L"abc"));
    CHECK(swprintf(b,3,L"abc")<0 && !wcscmp(b,L"ab"));
    b[0]=42; CHECK(swprintf(b,0,L"x")<0 && b[0]==42);
    CHECK(swprintf(NULL,0,L"")<0);
    const wchar_t literal[]={128,255,0};
    CHECK(swprintf(b,32,literal)==2 && !wmemcmp(b,literal,3));
    CHECK(!numeric());
    CHECK(fwprintf(stderr,L"%ls",L"a")==1);
    CHECK(stream(L"%lc",'b')==1 && standard(L"%s","c")==1 && wprintf(L"%d\n",4)==2);
    CHECK(fwide(stderr,0)>0 && fwide(stdout,0)>0);
    return 0;
}

