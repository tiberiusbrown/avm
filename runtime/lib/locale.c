#include <locale.h>
#include <limits.h>

static char c_locale_name[] = "C";
static char c_decimal_point[] = ".";

static struct lconv c_locale = {
    .decimal_point = c_decimal_point,
    .thousands_sep = c_locale_name + 1,
    .grouping = c_locale_name + 1,
    .mon_decimal_point = c_locale_name + 1,
    .mon_thousands_sep = c_locale_name + 1,
    .mon_grouping = c_locale_name + 1,
    .positive_sign = c_locale_name + 1,
    .negative_sign = c_locale_name + 1,
    .currency_symbol = c_locale_name + 1,
    .int_curr_symbol = c_locale_name + 1,
    .frac_digits = CHAR_MAX,
    .p_cs_precedes = CHAR_MAX,
    .n_cs_precedes = CHAR_MAX,
    .p_sep_by_space = CHAR_MAX,
    .n_sep_by_space = CHAR_MAX,
    .p_sign_posn = CHAR_MAX,
    .n_sign_posn = CHAR_MAX,
    .int_frac_digits = CHAR_MAX,
    .int_p_cs_precedes = CHAR_MAX,
    .int_n_cs_precedes = CHAR_MAX,
    .int_p_sep_by_space = CHAR_MAX,
    .int_n_sep_by_space = CHAR_MAX,
    .int_p_sign_posn = CHAR_MAX,
    .int_n_sign_posn = CHAR_MAX,
};

static int valid_category(int category)
{
    return category >= LC_ALL && category <= LC_TIME;
}

char *setlocale(int category, const char *locale)
{
    if (!valid_category(category))
        return NULL;
    if (locale == NULL || locale[0] == '\0' ||
        (locale[0] == 'C' && locale[1] == '\0'))
        return c_locale_name;
    return NULL;
}

struct lconv *localeconv(void)
{
    return &c_locale;
}
