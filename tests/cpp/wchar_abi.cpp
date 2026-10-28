extern "C" int avm_test_main(void);

#include "../c/wchar_abi.c"

template<class A, class B>
struct same_type {
    static constexpr bool value = false;
};

template<class A>
struct same_type<A, A> {
    static constexpr bool value = true;
};

static_assert(sizeof(wchar_t) == 1, "wchar_t size");
static_assert(alignof(wchar_t) == 1, "wchar_t alignment");
static_assert(!same_type<wchar_t, unsigned char>::value,
              "wchar_t must be distinct");

static_assert(sizeof(char16_t) == 2, "char16_t unchanged");
static_assert(sizeof(char32_t) == 4, "char32_t unchanged");
