#include <wctype.h>
#include <ctype.h>
#include <locale.h>

#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)
typedef char wint_has_eof[(WEOF < 0 && sizeof(wint_t) == 2) ? 1 : -1];
static int (*volatile wide[])(wint_t) = {
    iswalnum, iswalpha, iswblank, iswcntrl, iswdigit, iswgraph,
    iswlower, iswprint, iswpunct, iswspace, iswupper, iswxdigit
};
static int (*volatile narrow[])(int) = {
    isalnum, isalpha, isblank, iscntrl, isdigit, isgraph,
    islower, isprint, ispunct, isspace, isupper, isxdigit
};
static wctype_t (*volatile lookup)(const char *) = wctype;
static wctrans_t (*volatile mapping)(const char *) = wctrans;
static int (*volatile classify)(wint_t, wctype_t) = iswctype;
static wint_t (*volatile transform)(wint_t, wctrans_t) = towctrans;
static wint_t (*volatile lower)(wint_t) = towlower;
static wint_t (*volatile upper)(wint_t) = towupper;

int avm_test_main(void) {
    static const char *const names[] = {
        "alnum", "alpha", "blank", "cntrl", "digit", "graph",
        "lower", "print", "punct", "space", "upper", "xdigit"
    };
    wctype_t desc[12];
    CHECK(setlocale(LC_ALL, "C") != 0);
    for(int i = 0; i < 12; ++i) {
        desc[i] = lookup(names[i]);
        CHECK(desc[i] != 0 && desc[i] == wctype(names[i]));
    }
    wctrans_t down = mapping("tolower"), up = mapping("toupper");
    CHECK(down != 0 && up != 0 && down != up);
    CHECK(wctrans("tolower") == down && wctrans("toupper") == up);
    CHECK(!lookup("") && !lookup("Alpha") && !lookup("notaclass"));
    CHECK(!mapping("") && !mapping("TOLOWER") && !mapping("alpha"));
    for(wint_t c = WEOF; c <= 255; ++c) {
        for(int i = 0; i < 12; ++i) {
            CHECK(!!wide[i](c) == !!narrow[i](c));
            CHECK(!!classify(c, desc[i]) == !!narrow[i](c));
        }
        CHECK(lower(c) == tolower(c) && upper(c) == toupper(c));
        CHECK(transform(c, down) == tolower(c));
        CHECK(transform(c, up) == toupper(c));
    }
    wint_t c = 'A';
    CHECK(iswalpha(c++) && c == 'B');
    CHECK(towlower('Z') == 'z' && towupper('z') == 'Z');
    CHECK(!iswctype(WEOF, desc[0]) && towctrans(WEOF, down) == WEOF);
    CHECK(iswblank('\t') && !iswblank('\n') && iswspace('\n'));
    return 0;
}
