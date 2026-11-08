#include <wchar.h>
#include <string.h>

#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)
#define TYPE_IS(expr, type) _Generic((expr), type: 1, default: 0)

static wchar_t text[] = L"ababa";
static const wchar_t ctext[] = L"ababa";

/* The searched pointer's qualification selects the result's qualification. */
_Static_assert(TYPE_IS(wcschr(ctext, L'b'), const wchar_t *), "const wcschr");
_Static_assert(TYPE_IS(wcschr(text, L'b'), wchar_t *), "mutable wcschr");
_Static_assert(TYPE_IS(wcsrchr(ctext, L'b'), const wchar_t *), "const wcsrchr");
_Static_assert(TYPE_IS(wcsrchr(text, L'b'), wchar_t *), "mutable wcsrchr");
_Static_assert(TYPE_IS(wcspbrk(ctext, L"b"), const wchar_t *), "const wcspbrk");
_Static_assert(TYPE_IS(wcspbrk(text, L"b"), wchar_t *), "mutable wcspbrk");
_Static_assert(TYPE_IS(wcsstr(ctext, L"ba"), const wchar_t *), "const wcsstr");
_Static_assert(TYPE_IS(wcsstr(text, L"ba"), wchar_t *), "mutable wcsstr");
_Static_assert(TYPE_IS(wmemchr(ctext, L'b', 5), const wchar_t *), "const wmemchr");
_Static_assert(TYPE_IS(wmemchr(text, L'b', 5), wchar_t *), "mutable wmemchr");

/* Static function pointers take the addressable functions, not the macros. */
static wchar_t *(*volatile find_char)(const wchar_t *, wchar_t) = wcschr;
static wchar_t *(*volatile find_last)(const wchar_t *, wchar_t) = wcsrchr;
static wchar_t *(*volatile find_set)(const wchar_t *, const wchar_t *) = wcspbrk;
static wchar_t *(*volatile find_string)(const wchar_t *, const wchar_t *) = wcsstr;
static wchar_t *(*volatile find_byte)(const wchar_t *, wchar_t, size_t) = wmemchr;

static int test_search(void)
{
    const wchar_t *cp = ctext;
    wchar_t *mp = text;
    CHECK(wcschr(ctext, L'b') == ctext + 1 && wcschr(ctext, L'z') == NULL);
    CHECK(wcschr(text, L'b') == text + 1);
    CHECK(wcsrchr(ctext, L'b') == ctext + 3 && wcsrchr(text, L'a') == text + 4);
    CHECK(wcspbrk(ctext, L"ca") == ctext && wcspbrk(text, L"b") == text + 1);
    CHECK(wcsstr(ctext, L"ba") == ctext + 1 && wcsstr(text, L"aa") == NULL);
    CHECK(wmemchr(ctext, L'a', 1) == ctext && wmemchr(text, L'b', 1) == NULL);
    CHECK(find_char(text, L'a') == text && find_last(ctext, L'a') == ctext + 4);
    CHECK(find_set(ctext, L"b") == ctext + 1 && find_string(text, L"ab") == text);
    CHECK(find_byte(ctext, L'b', 2) == ctext + 1 && find_byte(ctext, L'b', 1) == NULL);
    /* The parenthesized names still denote the addressable functions. */
    CHECK((wcschr)(ctext, L'b') == ctext + 1 && (wmemchr)(text, L'a', 1) == text);
    /* Each searched operand is evaluated exactly once. */
    CHECK(wcschr(cp++, L'b') == ctext + 1 && cp == ctext + 1);
    CHECK(wcsrchr(mp++, L'b') == text + 3 && mp == text + 1);
    return 0;
}

int avm_test_main(void)
{
    return test_search();
}
