#include <avm.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <cfloat>
#include <climits>
#include <version>
#include <type_traits>
#include <concepts>
#include <compare>
#include <bit>
#include <cstddef>
#include <limits>
#include <new>
#include <utility>
#include <functional>
#include <cstring>
#include <tuple>
#include <iterator>
#include <ranges>
#include <algorithm>
#include <array>

static const char AVM_PROGMEM libcxx_progmem_text[] = "flash";

#if !defined(__cpp_lib_ranges) || __cpp_lib_ranges < 201911L
#error "libc++ ranges support is required"
#endif

static_assert(std::is_integral_v<int>);
static_assert(std::is_same_v<int, int>);
static_assert(std::is_pointer_v<int*>);
static_assert(std::same_as<int, int>);
static_assert(std::integral<unsigned int>);
static_assert(std::is_const_v<std::add_const_t<int>>);
static_assert(sizeof(void*) == 2);
static_assert(sizeof(std::size_t) == 2);
static_assert(sizeof(std::ptrdiff_t) == 2);
static_assert(sizeof(int) == 2);
static_assert(sizeof(long) == 4);
static_assert(sizeof(long long) == 8);
static_assert(sizeof(float) == 4 && sizeof(double) == 4 && sizeof(long double) == 4);
static_assert(CHAR_BIT == 8);
static_assert(sizeof(wchar_t) == 1);
static_assert(sizeof(char8_t) == 1 && sizeof(char16_t) == 2 && sizeof(char32_t) == 4);
static_assert(std::numeric_limits<unsigned int>::digits == 16);
static_assert(std::numeric_limits<unsigned long>::digits == 32);
static_assert(std::numeric_limits<unsigned long long>::digits == 64);
static_assert(std::numeric_limits<char>::is_signed == ((char)-1 < 0));
static_assert(std::numeric_limits<bool>::digits == 1);
static_assert(std::numeric_limits<wchar_t>::digits == 8);
static_assert(std::numeric_limits<char8_t>::digits == 8);
static_assert(std::numeric_limits<char16_t>::digits == 16);
static_assert(std::numeric_limits<char32_t>::digits == 32);
static_assert(FLT_RADIX == 2 && FLT_MANT_DIG == 24 && DBL_MANT_DIG == 24);
static_assert(LDBL_MANT_DIG == 24);
static_assert(std::numeric_limits<float>::digits == FLT_MANT_DIG);
static_assert(std::numeric_limits<double>::digits == std::numeric_limits<float>::digits);
static_assert(std::is_same_v<std::nullptr_t, decltype(nullptr)>);
static_assert(std::to_integer<unsigned>(std::byte{0x2a}) == 0x2a);
static_assert((std::byte{0x0f} | std::byte{0xf0}) == std::byte{0xff});

struct placed_value {
    int value;
};

extern "C" int avm_test_main() {
    if (std::countr_zero(0ULL) != 64 || std::countr_zero(1ULL) != 0 ||
        std::countr_zero(1ULL << 32) != 32 ||
        std::countr_zero(1ULL << 63) != 63 ||
        std::countl_zero(0ULL) != 64 || std::countl_zero(1ULL) != 63 ||
        std::countl_zero(1ULL << 63) != 0)
        return 11;

    int values[] = {
#if defined(AVM_TEST_O0)
        9, 7, 5, 3, 2, 1
#else
        7, 1, 5, 2, 9, 3
#endif
    };
#if !defined(AVM_TEST_O0)
    std::sort(values, values + 6);
    if (values[0] != 1 || values[5] != 9 ||
        std::lower_bound(values, values + 6, 5) != values + 3 ||
        !std::binary_search(values, values + 6, 7))
        return 1;

    std::ranges::sort(values, std::greater<>{});
    if (values[0] != 9 || values[5] != 1 ||
        std::ranges::find(values, 5) != values + 2 ||
        std::ranges::size(values) != 6)
        return 2;
#endif

    int copied[6] = {};
    std::ranges::copy(values, copied);
    std::fill(copied + 3, copied + 6, 0);
    if (std::find(copied, copied + 3, 5) == copied + 3 ||
        std::min(copied[0], copied[1]) != 7 ||
        std::max(copied[0], copied[1]) != 9)
        return 4;

    auto pair = std::make_pair(4, 8);
    auto tuple = std::make_tuple(pair.first, pair.second, 12);
    if (std::get<0>(tuple) != 4 || std::get<2>(tuple) != 12)
        return 5;
    auto first = std::ranges::begin(values);
    auto last = std::ranges::end(values);
    if (std::distance(first, last) != 6 || *std::next(first, 1) != 7)
        return 6;
    std::advance(first, 2);
    if (*std::prev(first) != 7)
        return 7;

    alignas(placed_value) unsigned char storage[sizeof(placed_value)];
    auto* object = ::new (storage) placed_value{23};
    if (object->value != 23)
        return 8;
    object->~placed_value();

    char text[] = "avm";
    if (strlen(text) != 3 || text[0] != 'a')
        return 9;
    char copy[6] = {};
    if (std::memcpy(copy, libcxx_progmem_text, 6) != copy ||
        copy[0] != 'f' || copy[4] != 'h' || copy[5] != '\0')
        return 10;
    return 0;
}
