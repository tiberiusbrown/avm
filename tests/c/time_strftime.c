#include <time.h>
#include <string.h>
#include <avm/pgmspace.h>
#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)
static int match_impl(const struct tm *t,const char AVM_PROGMEM *fmt,const char AVM_PROGMEM *expected)
{
    static char b[96], format[96]; size_t n=strlen_P(expected); strcpy_P(format, fmt);
    memset(b,'!',sizeof b);
    if(strftime(b,n+1,format,t)!=n||strcmp_P(b,expected)||b[n+1]!='!')return 1;
    memset(b,'!',sizeof b);
    if(n && (strftime(b,n,format,t)!=0||b[n]!='!'))return 2;
    return 0;
}
#define match(t,f,e) match_impl(t,AVM_PSTR(f),AVM_PSTR(e))
int avm_test_main(void)
{
    struct tm t={0,34,13,28,9,126,3,300,0};
    CHECK(!match(&t,"%a|%A|%b|%h|%B","Wed|Wednesday|Oct|Oct|October"));
    CHECK(!match(&t,"%c|%x|%X","Wed Oct 28 13:34:00 2026|10/28/26|13:34:00"));
    CHECK(!match(&t,"%C|%d|%D|%e|%F","20|28|10/28/26|28|2026-10-28"));
    CHECK(!match(&t,"%g|%G|%V|%U|%W","26|2026|44|43|43"));
    CHECK(!match(&t,"%H|%I|%j|%m|%M|%p|%r|%R|%S|%T","13|01|301|10|34|PM|01:34:00 PM|13:34|00|13:34:00"));
    CHECK(!match(&t,"%u|%w|%y|%Y|%z|%Z|%%|%n%t","3|3|26|2026|+0000|UTC|%|\n\t"));
    CHECK(!match(&t,"%Ec|%EC|%Ex|%EX|%Ey|%EY","Wed Oct 28 13:34:00 2026|20|10/28/26|13:34:00|26|2026"));
    CHECK(!match(&t,"%Od|%Oe|%OH|%OI|%Om|%OM|%OS|%Ou|%OU|%OV|%Ow|%OW|%Oy","28|28|13|01|10|34|00|3|43|44|3|43|26"));
    t.tm_isdst=-1;CHECK(!match(&t,"%z%Z","UTC"));
    t.tm_hour=0;CHECK(!match(&t,"%I %p %r","12 AM 12:34:00 AM"));
    t.tm_hour=12;CHECK(!match(&t,"%I %p %r","12 PM 12:34:00 PM"));
    t.tm_year=115;t.tm_mon=11;t.tm_mday=31;CHECK(!match(&t,"%G-%V-%g","2015-53-15"));
    t.tm_year=116;t.tm_mon=0;t.tm_mday=1;CHECK(!match(&t,"%G-%V","2015-53"));
    t.tm_year=118;t.tm_mon=11;t.tm_mday=31;CHECK(!match(&t,"%G-%V","2019-01"));
    t.tm_year=121;t.tm_mon=0;t.tm_mday=1;t.tm_wday=5;t.tm_yday=0;
    CHECK(!match(&t,"%G-%V %U %W","2020-53 00 00"));
    t.tm_mday=3;t.tm_wday=0;t.tm_yday=2;CHECK(!match(&t,"%U %W","01 00"));
    t.tm_mday=4;t.tm_wday=1;t.tm_yday=3;CHECK(!match(&t,"%G-%V %U %W","2021-01 01 01"));
    t.tm_year=100;t.tm_mon=1;t.tm_mday=29;t.tm_wday=2;t.tm_yday=59;
    CHECK(!match(&t,"%F %j %G %V","2000-02-29 060 2000 09"));
    t.tm_year=0;t.tm_mon=2;t.tm_mday=1;t.tm_wday=4;t.tm_yday=59;
    CHECK(!match(&t,"%F %j %G %V","1900-03-01 060 1900 09"));
    t.tm_year=8100;CHECK(!match(&t,"%Y","10000"));t.tm_mon=0;t.tm_mday=4;t.tm_year=-1901;CHECK(!match(&t,"%Y %C %y","-001 -1 99"));
    CHECK(!match(&t,"literal","literal")&&!match(&t,"","")&&!match(&t,"%d%m","0401"));
    t.tm_sec=60;CHECK(!match(&t,"%e|%S"," 4|60"));
    char b[4]={'!','!','!','!'};
    CHECK(strftime(NULL,0,"%Y",&t)==0&&strftime(b,0,"x",&t)==0&&b[0]=='!');
    CHECK(strftime(b,1,"x",&t)==0&&b[1]=='!');
    CHECK(strftime(b,1,"",&t)==0&&b[0]==0&&b[1]=='!');
    CHECK(strftime(b,sizeof b,"ok",&t)==2&&strcmp(b,"ok")==0&&b[3]=='!');
    return 0;
}
