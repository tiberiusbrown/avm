#include <assert.h>
#include <stdarg.h>
#include <stdlib.h>
#include "../../../codegen/c/test_hex_output.h"

#define CHECK(expr) do { if(!(expr)) { test_line16("LINE", __LINE__); return 1; } } while(0)
#define IS_TYPE(expr, type) _Generic((expr), type: 1, default: 0)

static int compare_ints(const void *a, const void *b) {
    int x = *(const int *)a;
    int y = *(const int *)b;
    return (x > y) - (x < y);
}

static const int table[] = {1, 3, 5, 7, 9};
static int mutable_table[] = {2, 4, 6};

/* The qualification of the array selects the result's qualification. */
_Static_assert(IS_TYPE(bsearch(&table[0], table, 5, sizeof table[0], compare_ints), const void *),
               "const base gives const result");
_Static_assert(IS_TYPE(bsearch(&mutable_table[0], mutable_table, 3, sizeof(int), compare_ints),
                       void *),
               "mutable base gives mutable result");

/* An enabled assertion takes one expression. A parenthesized comma expression
 * is one expression. */
static int checked_value(int value) {
    assert((value += 1, value > 0));
    return value;
}

/* NDEBUG is defined after the enabled form has been used. Re-including the
 * header then selects the disabled form, which does not evaluate arguments. */
#define NDEBUG
#include <assert.h>

static int disabled_assertions(int *counter) {
    assert(++*counter == 99);
    assert(++*counter, ++*counter);
    return *counter;
}

static void *(*volatile search_call)(const void *, const void *, size_t, size_t,
                                     int (*)(const void *, const void *)) = bsearch;

/* C23 accepts va_start with only the va_list argument; the two-argument form
 * remains valid for compatibility. */
static int sum_without_last(int count, ...) {
    va_list args;
    int total = 0;
    va_start(args);
    for (int i = 0; i < count; ++i) total += va_arg(args, int);
    va_end(args);
    return total;
}

static int sum_with_last(int count, ...) {
    va_list args;
    int total = 0;
    va_start(args, count);
    for (int i = 0; i < count; ++i) total += va_arg(args, int);
    va_end(args);
    return total;
}

int avm_test_main(void) {
    int key = 5;
    const int *found;
    int *mutable_found;
    int counter = 0;

    found = bsearch(&key, table, 5, sizeof table[0], compare_ints);
    CHECK(found == &table[2]);
    key = 4;
    CHECK(bsearch(&key, table, 5, sizeof table[0], compare_ints) == NULL);
    CHECK(IS_TYPE(bsearch(&key, table, 5, sizeof table[0], compare_ints), const void *));
    CHECK(search_call(&key, table, 5, sizeof table[0], compare_ints) == NULL);

    key = 6;
    mutable_found = bsearch(&key, mutable_table, 3, sizeof(int), compare_ints);
    CHECK(mutable_found == &mutable_table[2]);
    CHECK(IS_TYPE(bsearch(&key, mutable_table, 3, sizeof(int), compare_ints), void *));

    CHECK(checked_value(4) == 5);
    CHECK(checked_value(0) == 1);
    CHECK(sum_without_last(3, 1, 2, 3) == 6);
    CHECK(sum_with_last(2, 10, 20) == 30);
    CHECK(disabled_assertions(&counter) == 0);
    CHECK(counter == 0);
    return 0;
}
