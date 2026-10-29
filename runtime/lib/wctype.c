#include <wctype.h>
#include <ctype.h>
#include <string.h>

/* wint_t and int share the target ABI; do not truncate WEOF to wchar_t. */
#define WIDE_CLASS(name) int isw##name(wint_t wc) { return is##name(wc); }
WIDE_CLASS(alnum)
WIDE_CLASS(alpha)
WIDE_CLASS(blank)
WIDE_CLASS(cntrl)
WIDE_CLASS(digit)
WIDE_CLASS(graph)
WIDE_CLASS(lower)
WIDE_CLASS(print)
WIDE_CLASS(punct)
WIDE_CLASS(space)
WIDE_CLASS(upper)
WIDE_CLASS(xdigit)
#undef WIDE_CLASS

wctype_t wctype(const char *property) {
#define PROPERTY(name, id) if(strcmp_P(property, AVM_PSTR(#name)) == 0) return id;
    PROPERTY(alnum, 1)
    PROPERTY(alpha, 2)
    PROPERTY(blank, 3)
    PROPERTY(cntrl, 4)
    PROPERTY(digit, 5)
    PROPERTY(graph, 6)
    PROPERTY(lower, 7)
    PROPERTY(print, 8)
    PROPERTY(punct, 9)
    PROPERTY(space, 10)
    PROPERTY(upper, 11)
    PROPERTY(xdigit, 12)
#undef PROPERTY
    return 0;
}

int iswctype(wint_t wc, wctype_t desc) {
    switch(desc) {
    case 1: return iswalnum(wc);
    case 2: return iswalpha(wc);
    case 3: return iswblank(wc);
    case 4: return iswcntrl(wc);
    case 5: return iswdigit(wc);
    case 6: return iswgraph(wc);
    case 7: return iswlower(wc);
    case 8: return iswprint(wc);
    case 9: return iswpunct(wc);
    case 10: return iswspace(wc);
    case 11: return iswupper(wc);
    case 12: return iswxdigit(wc);
    default: return 0;
    }
}

wint_t towlower(wint_t wc) { return tolower(wc); }
wint_t towupper(wint_t wc) { return toupper(wc); }

wctrans_t wctrans(const char *property) {
    if(strcmp_P(property, AVM_PSTR("tolower")) == 0) return 1;
    if(strcmp_P(property, AVM_PSTR("toupper")) == 0) return 2;
    return 0;
}

wint_t towctrans(wint_t wc, wctrans_t desc) {
    switch(desc) {
    case 1: return towlower(wc);
    case 2: return towupper(wc);
    default: return wc;
    }
}
