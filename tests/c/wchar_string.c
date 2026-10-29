#include <wchar.h>
#include <wctype.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "test_hex_output.h"
#define CHECK(e) do { if(!(e)) { test_line16("LINE", __LINE__); return 1; } } while(0)

int avm_test_main(void) {
    wchar_t a[16], b[16], c[16];
    const wchar_t high[] = {127,128,255,0};
    CHECK(wcslen(L"") == 0 && wcslen(high) == 3);
    CHECK(wcscpy(a, high) == a && !wcscmp(a, high));
    CHECK(wcscmp(L"a", L"b") < 0 && wcscmp(high+1, high) > 0);
    CHECK(wcsncmp(L"abc", L"abd", 2) == 0 && wcsncmp(high, L"", 0) == 0);
    CHECK(wcscoll(L"a", L"b") < 0);
    CHECK(wcsncpy(b, L"a", 5) == b && b[0]=='a' && !b[1] && !b[4]);
    b[0]=42; CHECK(wcsncpy(b, a, 0)==b && b[0]==42);
    CHECK(wcscat(wcscpy(b,L"ab"),L"cd")==b && !wcscmp(b,L"abcd"));
    CHECK(wcsncat(b,L"efg",2)==b && !wcscmp(b,L"abcdef"));
    CHECK(wcsncat(b,L"z",0)==b && b[6]==0);
    CHECK(wcschr(a,128)==a+1 && wcsrchr(a,255)==a+2);
    CHECK(wcschr(a,0)==a+3 && wcsrchr(a,0)==a+3 && !wcschr(a,'x'));
    CHECK(wcsstr(b,L"cd")==b+2 && wcsstr(b,L"")==b && !wcsstr(b,L"xz"));
    CHECK(wcsspn(b,L"bac")==3 && wcscspn(b,L"dc")==2);
    CHECK(wcspbrk(b,L"xe")==b+4 && !wcspbrk(b,L"x"));
    CHECK(wmemcpy(c,high,4)==c && !wmemcmp(c,high,4));
    CHECK(wmemcmp(high,high+1,1)<0 && !wmemcmp(high,high+1,0));
    CHECK(wmemchr(c,255,3)==c+2 && !wmemchr(c,255,2) && !wmemchr(c,127,0));
    c[0]=42; CHECK(wmemcpy(c,high,0)==c && c[0]==42);
    CHECK(wmemmove(c,c+1,0)==c && c[0]==42);
    CHECK(wmemset(c,255,3)==c && c[0]==255 && c[2]==255);
    c[0]=42; CHECK(wmemset(c,1,0)==c && c[0]==42);
    wcscpy(c,L"abcd"); CHECK(wmemmove(c+1,c,5)==c+1 && !wcscmp(c,L"aabcd"));
    CHECK(wmemmove(c,c+1,5)==c && !wcscmp(c,L"abcd"));
    CHECK(wcsxfrm(NULL,high,0)==3);
    CHECK(wcsxfrm(c,high,4)==3 && !wcscmp(c,high));
    c[1]=42; CHECK(wcsxfrm(c,L"abc",1)==3 && c[1]==42);
    wchar_t *p, *q;
    wcscpy(a,L",a,,b,"); wcscpy(b,L"x:y");
    CHECK(!wcscmp(wcstok(a,L",",&p),L"a"));
    CHECK(!wcscmp(wcstok(b,L":",&q),L"x"));
    CHECK(!wcscmp(wcstok(NULL,L",",&p),L"b"));
    CHECK(!wcscmp(wcstok(NULL,L":",&q),L"y"));
    CHECK(!wcstok(NULL,L",",&p) && !wcstok(NULL,L":",&q));
    CHECK(!wcstok(L"",L",",&p));
    return 0;
}
