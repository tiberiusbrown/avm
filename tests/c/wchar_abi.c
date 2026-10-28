#include <stddef.h>
#include <stdlib.h>

#define CHECK(x) do { if (!(x)) return __LINE__; } while (0)

typedef char check_wchar_size[
    sizeof(wchar_t) == 1 ? 1 : -1
];

typedef char check_wchar_unsigned[
    (wchar_t)-1 == 255 ? 1 : -1
];

typedef char check_wint_size[
    sizeof(__WINT_TYPE__) == 2 ? 1 : -1
];

typedef char check_wint_signed[
    ((__WINT_TYPE__)-1 < 0) ? 1 : -1
];

typedef char check_wchar_max[
    __WCHAR_MAX__ == 255 ? 1 : -1
];

typedef char check_literal_size[
    sizeof(L"AVM") == 4 ? 1 : -1
];

struct wchar_layout {
    unsigned char first;
    wchar_t middle;
    unsigned char last;
};

typedef char check_struct_size[
    sizeof(struct wchar_layout) == 3 ? 1 : -1
];

typedef char check_struct_offset[
    offsetof(struct wchar_layout, last) == 2 ? 1 : -1
];

static const wchar_t wide_text[] = L"AVM";

static __attribute__((noinline))
wchar_t roundtrip(wchar_t value) {
    return value;
}

static wchar_t (*volatile indirect_roundtrip)(wchar_t) = roundtrip;

int avm_test_main(void) {
    volatile wchar_t maximum = 255;
    wchar_t local[] = { L'A', L'Z', 0 };

    CHECK(MB_CUR_MAX == 1);

    CHECK(wide_text[0] == L'A');
    CHECK(wide_text[1] == L'V');
    CHECK(wide_text[2] == L'M');
    CHECK(wide_text[3] == 0);

    CHECK(local[0] == L'A');
    CHECK(local[1] == L'Z');
    CHECK(local[2] == 0);

    CHECK((const unsigned char *)&local[1] -
          (const unsigned char *)&local[0] == 1);

    CHECK(maximum == 255);
    CHECK(indirect_roundtrip(maximum) == 255);
    CHECK(indirect_roundtrip(L'A') == L'A');

    return 0;
}
