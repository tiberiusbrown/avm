#include <wchar.h>
#include <wctype.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "test_hex_output.h"
#define CHECK(e) do { if(!(e)) { test_line16("LINE", __LINE__); return 1; } } while(0)

int avm_test_main(void) {
    mbstate_t state=73;
    wchar_t w=42, dst[4]; char out[4];
    CHECK(mbsinit(NULL) && mbsinit(&state));
    CHECK(btowc(EOF)==WEOF && btowc(-2)==WEOF && btowc(256)==WEOF);
    CHECK(wctob(WEOF)==EOF && wctob(256)==EOF && wctob(255)==255);
    errno=EDOM;
    for(int i=0;i<256;++i) {
        char c=(char)i;
        CHECK(btowc(i)==i && wctob(i)==i);
        CHECK(mbrtowc(&w,&c,1,&state)==(i!=0) && w==i);
        CHECK(mbrlen(&c,1,NULL)==(i!=0));
        CHECK(wcrtomb(out,w,&state)==1 && (unsigned char)out[0]==i);
        CHECK(state==73 && errno==EDOM);
    }
    w=42; CHECK(mbrtowc(&w,"a",0,&state)==(size_t)-2 && w==42);
    CHECK(mbrtowc(&w,NULL,0,NULL)==0 && w==42);
    CHECK(mbrlen(NULL,0,&state)==0 && wcrtomb(NULL,255,NULL)==1);
    const char text[]={'a',(char)255,0}; const wchar_t wide[]={'a',255,0};
    for(size_t n=0;n<5;++n) {
        const char *s=text; const wchar_t *t=wide;
        CHECK(mbsrtowcs(NULL,&s,n,&state)==2 && s==text);
        CHECK(wcsrtombs(NULL,&t,n,NULL)==2 && t==wide);
        for(size_t i=0;i<4;++i) {dst[i]=42;out[i]=42;}
        size_t count=n<2?n:2;
        CHECK(mbsrtowcs(dst,&s,n,NULL)==count);
        CHECK(wcsrtombs(out,&t,n,&state)==count);
        CHECK(s==(n>2?NULL:text+count) && t==(n>2?NULL:wide+count));
        for(size_t i=0;i<4;++i) {
            unsigned int expected=i<n && i<=2?wide[i]:42;
            CHECK(dst[i]==expected && (unsigned char)out[i]==expected);
        }
        CHECK(mbstowcs(NULL,text,n)==2 && wcstombs(NULL,wide,n)==2);
    }
    CHECK(state==73 && errno==EDOM);
    CHECK(fwide(stdin,0)==0 && fscanf(stdin, "")==0 && fwide(stdin,0)<0);
    CHECK(fgetc(stdin)==EOF && fwide(stdin,0)<0);
    CHECK(fwide(stdout,0)==0 && fwrite("",0,1,stdout)==0 && fwide(stdout,0)==0);
    CHECK(fputs("",stdout)>=0 && fwide(stdout,0)<0 && fwide(stdout,1)<0);
    CHECK(fwide(stderr,0)==0 && fputws(L"",stderr)>=0 && fwide(stderr,0)>0);
    return 0;
}
