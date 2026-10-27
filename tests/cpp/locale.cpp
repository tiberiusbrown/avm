#include <locale.h>
#include <limits.h>
#include <ctype.h>
#include <stdlib.h>

#define CHECK(x) do { if (!(x)) return __LINE__; } while (0)

static char *(*volatile setlocale_indirect)(int, const char *) = setlocale;
static struct lconv *(*volatile localeconv_indirect)(void) = localeconv;

template <typename A, typename B> struct same_type { static constexpr bool value = false; };
template <typename A> struct same_type<A, A> { static constexpr bool value = true; };
#define CHECK_LCONV_FIELD(field, type) \
    static_assert(same_type<decltype(lconv::field), type>::value, #field " has the C99 type")

static_assert(LC_ALL != LC_COLLATE && LC_ALL != LC_CTYPE &&
              LC_ALL != LC_MONETARY && LC_ALL != LC_NUMERIC &&
              LC_ALL != LC_TIME && LC_COLLATE != LC_CTYPE &&
              LC_COLLATE != LC_MONETARY && LC_COLLATE != LC_NUMERIC &&
              LC_COLLATE != LC_TIME && LC_CTYPE != LC_MONETARY &&
              LC_CTYPE != LC_NUMERIC && LC_CTYPE != LC_TIME &&
              LC_MONETARY != LC_NUMERIC && LC_MONETARY != LC_TIME &&
              LC_NUMERIC != LC_TIME, "locale categories must be distinct");
CHECK_LCONV_FIELD(decimal_point, char *);
CHECK_LCONV_FIELD(thousands_sep, char *);
CHECK_LCONV_FIELD(grouping, char *);
CHECK_LCONV_FIELD(mon_decimal_point, char *);
CHECK_LCONV_FIELD(mon_thousands_sep, char *);
CHECK_LCONV_FIELD(mon_grouping, char *);
CHECK_LCONV_FIELD(positive_sign, char *);
CHECK_LCONV_FIELD(negative_sign, char *);
CHECK_LCONV_FIELD(currency_symbol, char *);
CHECK_LCONV_FIELD(int_curr_symbol, char *);
CHECK_LCONV_FIELD(frac_digits, char);
CHECK_LCONV_FIELD(p_cs_precedes, char);
CHECK_LCONV_FIELD(n_cs_precedes, char);
CHECK_LCONV_FIELD(p_sep_by_space, char);
CHECK_LCONV_FIELD(n_sep_by_space, char);
CHECK_LCONV_FIELD(p_sign_posn, char);
CHECK_LCONV_FIELD(n_sign_posn, char);
CHECK_LCONV_FIELD(int_frac_digits, char);
CHECK_LCONV_FIELD(int_p_cs_precedes, char);
CHECK_LCONV_FIELD(int_n_cs_precedes, char);
CHECK_LCONV_FIELD(int_p_sep_by_space, char);
CHECK_LCONV_FIELD(int_n_sep_by_space, char);
CHECK_LCONV_FIELD(int_p_sign_posn, char);
CHECK_LCONV_FIELD(int_n_sign_posn, char);
#undef CHECK_LCONV_FIELD

extern "C" int avm_test_main(void)
{
    const int categories[] = { LC_ALL, LC_COLLATE, LC_CTYPE, LC_MONETARY,
                               LC_NUMERIC, LC_TIME };
    struct lconv *lc = localeconv();
    char *name = setlocale(LC_ALL, NULL);
    char *empty[] = { lc->thousands_sep, lc->grouping, lc->mon_decimal_point,
        lc->mon_thousands_sep, lc->mon_grouping, lc->positive_sign,
        lc->negative_sign, lc->currency_symbol, lc->int_curr_symbol };
    char monetary[] = { lc->frac_digits, lc->p_cs_precedes, lc->n_cs_precedes,
        lc->p_sep_by_space, lc->n_sep_by_space, lc->p_sign_posn,
        lc->n_sign_posn, lc->int_frac_digits, lc->int_p_cs_precedes,
        lc->int_n_cs_precedes, lc->int_p_sep_by_space, lc->int_n_sep_by_space,
        lc->int_p_sign_posn, lc->int_n_sign_posn };
    static_assert(sizeof(struct lconv) == 34, "AVM lconv layout");
    CHECK((void *)NULL == nullptr);
    CHECK(lc == localeconv_indirect());
    CHECK(name && name[0] == 'C' && name[1] == '\0');
    CHECK(lc->decimal_point[0] == '.' && lc->decimal_point[1] == '\0');
    for (unsigned i = 0; i < sizeof(empty) / sizeof(empty[0]); ++i)
        CHECK(empty[i] == name + 1 && empty[i][0] == '\0');
    for (unsigned i = 0; i < sizeof(monetary); ++i) CHECK(monetary[i] == CHAR_MAX);
    for (unsigned i = 0; i < sizeof(categories) / sizeof(categories[0]); ++i) {
        CHECK(setlocale(categories[i], "C") == name);
        CHECK(setlocale(categories[i], "") == name);
        CHECK(setlocale(categories[i], NULL) == name);
        CHECK(setlocale_indirect(categories[i], "C") == name);
        CHECK(setlocale(categories[i], "en_US") == NULL);
        CHECK(setlocale(categories[i], NULL) == name);
        CHECK(setlocale(LC_ALL, NULL) == name);
    }
    CHECK(setlocale(-1, NULL) == NULL && setlocale(6, "C") == NULL);
    CHECK(setlocale(LC_NUMERIC, name) == name);
    CHECK(localeconv() == lc && lc->decimal_point[0] == '.');
    CHECK(isdigit('7') && isalpha('A') && isspace(' ') && tolower('Q') == 'q');
    CHECK(strtod("12.5", nullptr) == 12.5);
    CHECK(strtof("12.5", nullptr) == 12.5f);
    return 0;
}
