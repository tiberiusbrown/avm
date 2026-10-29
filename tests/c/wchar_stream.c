#include <wchar.h>
#include <wctype.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "test_hex_output.h"
#define CHECK(e) do { if(!(e)) { test_line16("LINE", __LINE__); return 1; } } while(0)

#include "../../runtime/lib/stdio_internal.h"
int avm_test_main(void) {
    wchar_t buf[4]={42,42,42,42};
    CHECK(sizeof(FILE)==2);
    CHECK(fwide(stdin,0)==0 && fwide(stdout,0)==0 && fwide(stderr,0)==0);
    CHECK(fwide(stdout,1)>0 && fwide(stdout,-1)>0);
    CHECK(fwide(stderr,-1)<0 && fwide(stderr,1)<0);
    CHECK(fputws(L"wide",stdout)>=0 && fputwc(':',stdout)==':');
    CHECK(putwc('x',stdout)=='x' && putwchar('\n')=='\n');
    CHECK(fputc('b',stderr)=='b' && fwide(stderr,0)<0);
    CHECK(ungetwc(WEOF,stdin)==WEOF && fwide(stdin,0)==0);
    CHECK(fgetwc(stdin)==WEOF && feof(stdin) && fwide(stdin,0)>0);
    CHECK(ungetwc(255,stdin)==255 && !feof(stdin));
    CHECK(ungetwc('x',stdin)==WEOF && getwc(stdin)==255);
    CHECK(ungetwc('a',stdin)=='a' && getwchar()=='a');
    CHECK(ungetwc('\n',stdin)=='\n' && fgetws(buf,4,stdin)==buf && buf[0]=='\n' && !buf[1]);
    CHECK(ungetwc('z',stdin)=='z' && fgetws(buf,2,stdin)==buf && buf[0]=='z' && !buf[1]);
    CHECK(fgetws(buf,4,stdin)==NULL && feof(stdin));
    CHECK(fgetws(buf,0,stdin)==NULL);
    CHECK(ungetwc('q',stdin)=='q' && fgetws(buf,1,stdin)==buf && !buf[0] && fgetwc(stdin)=='q');
    clearerr(stdin); rewind(stdin); CHECK(fwide(stdin,0)>0);
    CHECK(fflush(stdout)==0 && fwide(stdout,0)>0);
    CHECK(fputc('!',stdout)==EOF && errno==EINVAL && ferror(stdout));
    clearerr(stdout); CHECK(fwide(stdout,0)>0);
    CHECK(fputwc('!',stderr)==WEOF && errno==EINVAL && fwide(stderr,0)<0);
    CHECK(fclose(stdin)==0 && fgetwc(stdin)==WEOF && errno==EBADF);
    CHECK(fclose(stdout)==0 && fputwc('!',stdout)==WEOF && errno==EBADF);
    return 0;
}
