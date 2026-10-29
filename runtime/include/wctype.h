#ifndef _AVM_RUNTIME_WCTYPE_H
#define _AVM_RUNTIME_WCTYPE_H

/* Wide characters use the fixed C locale and the target's byte encoding. */
typedef __WINT_TYPE__ wint_t;
typedef unsigned char wctype_t;
typedef unsigned char wctrans_t;
#define WEOF ((wint_t)-1)

#ifdef __cplusplus
extern "C" {
#endif

int iswalnum(wint_t wc);
int iswalpha(wint_t wc);
int iswblank(wint_t wc);
int iswcntrl(wint_t wc);
int iswdigit(wint_t wc);
int iswgraph(wint_t wc);
int iswlower(wint_t wc);
int iswprint(wint_t wc);
int iswpunct(wint_t wc);
int iswspace(wint_t wc);
int iswupper(wint_t wc);
int iswxdigit(wint_t wc);
int iswctype(wint_t wc, wctype_t desc);
wctype_t wctype(const char *property);
wint_t towlower(wint_t wc);
wint_t towupper(wint_t wc);
wint_t towctrans(wint_t wc, wctrans_t desc);
wctrans_t wctrans(const char *property);

#ifdef __cplusplus
} // extern "C"
#endif
#endif // _AVM_RUNTIME_WCTYPE_H
