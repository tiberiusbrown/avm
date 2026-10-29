#include <wchar.h>
#include <wctype.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "test_hex_output.h"
#define CHECK(e) do { if(!(e)) { test_line16("LINE", __LINE__); return 1; } } while(0)

#include <time.h>
int avm_test_main(void) {
    static struct tm t={5,4,3,29,1,124,4,59,0};
    static wchar_t wide[64]; static char bytes[64];
    static const char *const formats[]={"","%Y-%m-%d %H:%M:%S","%a %A %b %B","%c","%C %D %e %F %g %G","%h %I %j %n %p %r","%R %t %T %u %U %V %w %W","%x %X %y %z %Z %%"};
    for(unsigned int i=0;i<sizeof(formats)/sizeof(*formats);++i) {
        size_t n=strftime(bytes,sizeof(bytes),formats[i],&t);
        CHECK(wcsftime(wide,sizeof(wide),(const wchar_t *)formats[i],&t)==n);
        CHECK(!memcmp(wide,bytes,n+1));
    }
    CHECK(wcsftime(wide,5,L"%Y",&t)==4 && !wcscmp(wide,L"2024"));
    CHECK(wcsftime(wide,4,L"%Y",&t)==0 && wcsftime(wide,0,L"%Y",&t)==0);
    CHECK(fwide(stdin,0)==0 && fgetc(stdin)==EOF && fwide(stdin,0)<0);
    return 0;
}
