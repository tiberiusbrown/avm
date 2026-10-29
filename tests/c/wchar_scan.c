#include <wchar.h>
#include <wctype.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "test_hex_output.h"
#define CHECK(e) do { if(!(e)) { test_line16("LINE", __LINE__); return 1; } } while(0)

static int forward(const wchar_t *s,const wchar_t *fmt,...) {
    va_list args; va_start(args,fmt); int r=vswscanf(s,fmt,args); va_end(args); return r;
}
static int stream(FILE *s,const wchar_t *fmt,...) {
    va_list args; va_start(args,fmt); int r=vfwscanf(s,fmt,args); va_end(args); return r;
}
static int standard(const wchar_t *fmt,...) {
    va_list args; va_start(args,fmt); int r=vwscanf(fmt,args); va_end(args); return r;
}
static int (*volatile indirect)(const wchar_t *,const wchar_t *,...)=swscanf;
int avm_test_main(void) {
    int i=0,n=-1; float f=0; wchar_t w[8]; char b[8];
    CHECK(indirect(L"  -42!",L"%d%n",&i,&n)==1 && i==-42 && n==5);
    CHECK(forward(L"1.25",L"%f",&f)==1 && f==1.25f);
    CHECK(swscanf(L"abc def",L"%3ls%n",w,&n)==1 && !wcscmp(w,L"abc") && n==3);
    CHECK(swscanf(L"xyz",L"%2lc",w)==1 && w[0]=='x' && w[1]=='y');
    CHECK(swscanf(L"abc def",L"%3s",b)==1 && !strcmp(b,"abc"));
    CHECK(swscanf(L"xy",L"%2c",b)==1 && b[0]=='x' && b[1]=='y');
    CHECK(swscanf(L"cabd",L"%3[abc]%n",b,&n)==1 && !strcmp(b,"cab") && n==3);
    CHECK(swscanf(L"cabd",L"%3l[abc]%lc",w,w+4)==2 && !wcscmp(w,L"cab") && w[4]=='d');
    CHECK(swscanf(L"12:34",L"%*d:%d",&i)==1 && i==34);
    CHECK(swscanf(L"x",L"%d",&i)==0 && swscanf(L"",L"%d",&i)==EOF);
    CHECK(swscanf(L"",L"%n",&n)==0 && n==0);
    CHECK(swscanf(L"a \t b%",L"a b%%")==0);
    const wchar_t high[]={255,128,0};
    CHECK(swscanf(high,L"%lc%lc%n",w,w+1,&n)==2 && w[0]==255 && w[1]==128 && n==2);
    CHECK(fwide(stdin,0)==0);
    CHECK(stream(stdin,L"")==0 && fwide(stdin,0)>0);
    CHECK(ungetwc('7',stdin)=='7' && fwscanf(stdin,L"%d",&i)==1 && i==7);
    CHECK(ungetwc('x',stdin)=='x' && stream(stdin,L"%d",&i)==0 && fgetwc(stdin)=='x');
    CHECK(ungetwc(255,stdin)==255 && standard(L"%lc",w)==1 && w[0]==255);
    CHECK(ungetwc('z',stdin)=='z' && wscanf(L"%c",b)==1 && b[0]=='z');
    CHECK(fwscanf(stdin,L"%d",&i)==EOF);
    CHECK(fclose(stdin)==0 && stream(stdin,L"")==EOF && errno==EBADF);
    return 0;
}
