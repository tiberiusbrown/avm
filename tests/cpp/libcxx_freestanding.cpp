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
#include <memory>
#include <ratio>
#include <cstdint>
#include <cstdarg>
#include <initializer_list>
#include <source_location>
#include <new>

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
static_assert(std::numeric_limits<bool>::min() == false);
static_assert(std::numeric_limits<unsigned int>::max() == 65535u);
static_assert(std::numeric_limits<int>::lowest() == -32768);
static_assert(std::numeric_limits<signed char>::min() == SCHAR_MIN);
static_assert(std::numeric_limits<signed char>::max() == SCHAR_MAX);
static_assert(std::numeric_limits<unsigned char>::max() == UCHAR_MAX);
static_assert(std::numeric_limits<char>::min() == CHAR_MIN);
static_assert(std::numeric_limits<char>::max() == CHAR_MAX);
static_assert(std::numeric_limits<short>::min() == SHRT_MIN);
static_assert(std::numeric_limits<short>::max() == SHRT_MAX);
static_assert(std::numeric_limits<unsigned short>::max() == USHRT_MAX);
static_assert(std::numeric_limits<int>::min() == INT_MIN);
static_assert(std::numeric_limits<int>::max() == INT_MAX);
static_assert(std::numeric_limits<unsigned int>::max() == UINT_MAX);
static_assert(std::numeric_limits<long>::min() == LONG_MIN);
static_assert(std::numeric_limits<long>::max() == LONG_MAX);
static_assert(std::numeric_limits<unsigned long long>::max() == ULLONG_MAX);
static_assert(std::numeric_limits<wchar_t>::max() == WCHAR_MAX);
static_assert(std::numeric_limits<char8_t>::max() == 0xff);
static_assert(std::numeric_limits<char16_t>::max() == 0xffff);
static_assert(std::numeric_limits<char32_t>::max() == 0xffffffffu);
static_assert(std::numeric_limits<float>::radix == 2);
static_assert(std::numeric_limits<float>::has_infinity);
static_assert(!std::numeric_limits<void*>::is_specialized);
static_assert(std::numeric_limits<short>::lowest() == SHRT_MIN);
static_assert(std::numeric_limits<unsigned short>::max() == USHRT_MAX);
static_assert(std::numeric_limits<long>::digits == 31);
static_assert(std::numeric_limits<unsigned long>::max() == ULONG_MAX);
static_assert(std::numeric_limits<long long>::digits == 63);
static_assert(std::numeric_limits<unsigned long long>::max() == ULLONG_MAX);
static_assert(std::numeric_limits<float>::min() > 0.0f);
static_assert(std::numeric_limits<float>::lowest() < 0.0f);
static_assert(std::numeric_limits<float>::infinity() > 0.0f);
static_assert(std::numeric_limits<float>::quiet_NaN() !=
              std::numeric_limits<float>::quiet_NaN());
static_assert(std::numeric_limits<float>::min() == FLT_MIN);
static_assert(std::numeric_limits<float>::max() == FLT_MAX);
static_assert(std::numeric_limits<float>::epsilon() == FLT_EPSILON);
static_assert(std::numeric_limits<float>::max_exponent == FLT_MAX_EXP);
static_assert(std::numeric_limits<float>::min_exponent == FLT_MIN_EXP);
static_assert(std::numeric_limits<float>::is_iec559);
static_assert(std::numeric_limits<float>::has_quiet_NaN);
static_assert(std::numeric_limits<float>::is_bounded);
static_assert(std::numeric_limits<double>::min() == DBL_MIN);
static_assert(std::numeric_limits<double>::max() == DBL_MAX);
static_assert(std::numeric_limits<double>::epsilon() == DBL_EPSILON);
static_assert(std::numeric_limits<long double>::min() == LDBL_MIN);
static_assert(std::numeric_limits<long double>::max() == LDBL_MAX);
template <class T>
constexpr bool integer_limits_are_consistent() {
    using limits = std::numeric_limits<T>;
    constexpr bool is_signed = static_cast<T>(-1) < static_cast<T>(0);
    return limits::is_specialized && limits::is_signed == is_signed &&
           limits::is_integer && limits::is_exact && limits::is_bounded &&
           limits::radix == 2 &&
           limits::digits == sizeof(T) * CHAR_BIT - (is_signed ? 1 : 0) &&
           limits::digits10 == limits::digits * 3 / 10 && limits::max_digits10 == 0 &&
           limits::is_modulo == !is_signed && limits::min() == limits::lowest() &&
           limits::epsilon() == 0 && limits::round_error() == 0 &&
           limits::min_exponent == 0 && limits::min_exponent10 == 0 &&
           limits::max_exponent == 0 && limits::max_exponent10 == 0 &&
           !limits::has_infinity && !limits::has_quiet_NaN &&
           !limits::has_signaling_NaN && !limits::is_iec559 &&
           limits::is_bounded && !limits::tinyness_before && !limits::traps &&
           limits::round_style == std::round_toward_zero;
}
static_assert(integer_limits_are_consistent<char>());
static_assert(integer_limits_are_consistent<signed char>());
static_assert(integer_limits_are_consistent<unsigned char>());
static_assert(integer_limits_are_consistent<wchar_t>());
static_assert(integer_limits_are_consistent<char8_t>());
static_assert(integer_limits_are_consistent<char16_t>());
static_assert(integer_limits_are_consistent<char32_t>());
static_assert(integer_limits_are_consistent<short>());
static_assert(integer_limits_are_consistent<unsigned short>());
static_assert(integer_limits_are_consistent<int>());
static_assert(integer_limits_are_consistent<unsigned int>());
static_assert(integer_limits_are_consistent<long>());
static_assert(integer_limits_are_consistent<unsigned long>());
static_assert(integer_limits_are_consistent<long long>());
static_assert(integer_limits_are_consistent<unsigned long long>());
static_assert(std::numeric_limits<bool>::is_specialized &&
              !std::numeric_limits<bool>::is_signed &&
              std::numeric_limits<bool>::is_integer &&
              std::numeric_limits<bool>::is_exact &&
              std::numeric_limits<bool>::digits == 1 &&
              std::numeric_limits<bool>::digits10 == 0 &&
              std::numeric_limits<bool>::max() &&
              !std::numeric_limits<bool>::min() &&
              !std::numeric_limits<bool>::is_modulo);
static_assert(std::numeric_limits<const int>::min() == std::numeric_limits<int>::min());
static_assert(std::numeric_limits<volatile unsigned long>::max() ==
              std::numeric_limits<unsigned long>::max());
static_assert(std::numeric_limits<int*>::is_specialized == false);
static_assert(std::numeric_limits<const void*>::is_specialized == false);

template <class T>
constexpr bool floating_limits_are_consistent() {
    using limits = std::numeric_limits<T>;
    return limits::is_specialized && limits::is_signed && !limits::is_integer &&
           !limits::is_exact && limits::is_bounded && !limits::is_modulo &&
           limits::radix == FLT_RADIX && limits::digits == FLT_MANT_DIG &&
           limits::digits10 == FLT_DIG && limits::max_digits10 == FLT_DECIMAL_DIG &&
           limits::min() > T(0) && limits::lowest() == -limits::max() &&
           limits::epsilon() > T(0) && limits::round_error() == T(0.5) &&
           limits::min_exponent == FLT_MIN_EXP &&
           limits::min_exponent10 == FLT_MIN_10_EXP &&
           limits::max_exponent == FLT_MAX_EXP &&
           limits::max_exponent10 == FLT_MAX_10_EXP && limits::has_infinity &&
           limits::has_quiet_NaN && limits::has_signaling_NaN &&
           limits::infinity() > T(0) && limits::quiet_NaN() != limits::quiet_NaN() &&
           limits::denorm_min() > T(0) && limits::is_iec559 &&
           limits::round_style == std::round_to_nearest && !limits::traps;
}
static_assert(floating_limits_are_consistent<float>());
static_assert(floating_limits_are_consistent<double>());
static_assert(floating_limits_are_consistent<long double>());
static_assert(std::numeric_limits<float>::round_style == std::round_to_nearest);
static_assert(std::numeric_limits<float>::max_digits10 == FLT_DECIMAL_DIG);
static_assert(std::numeric_limits<float>::has_signaling_NaN);
static_assert(std::is_same_v<std::int8_t, signed char>);
static_assert(sizeof(std::uint8_t) == 1 && sizeof(std::uint16_t) == 2);
static_assert(sizeof(std::uint32_t) == 4 && sizeof(std::uint64_t) == 8);
static_assert(sizeof(std::int_least16_t) >= 2);
static_assert(sizeof(std::uint_fast32_t) >= 4);
static_assert(sizeof(std::intmax_t) == 8 && sizeof(std::uintmax_t) == 8);
static_assert(INT8_MIN == -128 && UINT8_MAX == 255);
static_assert(INT8_MAX == 127);
static_assert(INT16_MIN == -32768 && UINT16_MAX == 65535);
static_assert(INT16_MAX == 32767);
static_assert(INT32_MAX == 2147483647 && UINT32_MAX == 4294967295u);
static_assert(INT32_MIN == (-2147483647 - 1));
static_assert(INT64_MAX == 9223372036854775807LL);
static_assert(INT64_MIN == (-9223372036854775807LL - 1));
static_assert(UINT64_MAX == 18446744073709551615ULL);
static_assert(INT_LEAST8_MIN == -128 && UINT_LEAST8_MAX == 255);
static_assert(INT_LEAST16_MIN == -32768 && UINT_LEAST16_MAX == 65535);
static_assert(INT_LEAST32_MAX == INT32_MAX && UINT_LEAST32_MAX == UINT32_MAX);
static_assert(INT_LEAST64_MAX == INT64_MAX && UINT_LEAST64_MAX == UINT64_MAX);
static_assert(INT_LEAST32_MIN == INT32_MIN && INT_LEAST64_MIN == INT64_MIN);
static_assert(INT_FAST8_MAX >= INT8_MAX && UINT_FAST8_MAX >= UINT8_MAX);
static_assert(INT_FAST16_MAX >= INT16_MAX && UINT_FAST16_MAX >= UINT16_MAX);
static_assert(INT_FAST32_MAX >= INT32_MAX && UINT_FAST32_MAX >= UINT32_MAX);
static_assert(INT_FAST64_MAX >= INT64_MAX && UINT_FAST64_MAX >= UINT64_MAX);
static_assert(INT_FAST8_MIN <= INT8_MIN && INT_FAST16_MIN <= INT16_MIN);
static_assert(INT_FAST32_MIN <= INT32_MIN && INT_FAST64_MIN <= INT64_MIN);
static_assert(sizeof(std::intptr_t) == 2 && sizeof(std::uintptr_t) == 2);
static_assert(INTMAX_MIN == INT64_MIN && UINTMAX_MAX == UINT64_MAX);
static_assert(INTMAX_MAX == INT64_MAX);
static_assert(PTRDIFF_MAX == 32767 && SIZE_MAX == 65535u);
static_assert(INTPTR_MAX == 32767 && UINTPTR_MAX == 65535u);
static_assert(INTPTR_MIN == (-32767 - 1));
static_assert(INT_LEAST8_MIN == std::numeric_limits<std::int_least8_t>::min());
static_assert(INT_LEAST8_MAX == std::numeric_limits<std::int_least8_t>::max());
static_assert(UINT_LEAST8_MAX == std::numeric_limits<std::uint_least8_t>::max());
static_assert(INT_LEAST16_MIN == std::numeric_limits<std::int_least16_t>::min());
static_assert(INT_LEAST16_MAX == std::numeric_limits<std::int_least16_t>::max());
static_assert(UINT_LEAST16_MAX == std::numeric_limits<std::uint_least16_t>::max());
static_assert(INT_LEAST32_MIN == std::numeric_limits<std::int_least32_t>::min());
static_assert(INT_LEAST32_MAX == std::numeric_limits<std::int_least32_t>::max());
static_assert(UINT_LEAST32_MAX == std::numeric_limits<std::uint_least32_t>::max());
static_assert(INT_LEAST64_MIN == std::numeric_limits<std::int_least64_t>::min());
static_assert(INT_LEAST64_MAX == std::numeric_limits<std::int_least64_t>::max());
static_assert(UINT_LEAST64_MAX == std::numeric_limits<std::uint_least64_t>::max());
static_assert(INT_FAST8_MIN == std::numeric_limits<std::int_fast8_t>::min());
static_assert(INT_FAST8_MAX == std::numeric_limits<std::int_fast8_t>::max());
static_assert(UINT_FAST8_MAX == std::numeric_limits<std::uint_fast8_t>::max());
static_assert(INT_FAST16_MIN == std::numeric_limits<std::int_fast16_t>::min());
static_assert(INT_FAST16_MAX == std::numeric_limits<std::int_fast16_t>::max());
static_assert(UINT_FAST16_MAX == std::numeric_limits<std::uint_fast16_t>::max());
static_assert(INT_FAST32_MIN == std::numeric_limits<std::int_fast32_t>::min());
static_assert(INT_FAST32_MAX == std::numeric_limits<std::int_fast32_t>::max());
static_assert(UINT_FAST32_MAX == std::numeric_limits<std::uint_fast32_t>::max());
static_assert(INT_FAST64_MIN == std::numeric_limits<std::int_fast64_t>::min());
static_assert(INT_FAST64_MAX == std::numeric_limits<std::int_fast64_t>::max());
static_assert(UINT_FAST64_MAX == std::numeric_limits<std::uint_fast64_t>::max());
static_assert(INTMAX_MIN == std::numeric_limits<std::intmax_t>::min());
static_assert(INTMAX_MAX == std::numeric_limits<std::intmax_t>::max());
static_assert(UINTMAX_MAX == std::numeric_limits<std::uintmax_t>::max());
static_assert(INTPTR_MIN == std::numeric_limits<std::intptr_t>::min());
static_assert(INTPTR_MAX == std::numeric_limits<std::intptr_t>::max());
static_assert(UINTPTR_MAX == std::numeric_limits<std::uintptr_t>::max());
static_assert(INT8_MIN == std::numeric_limits<std::int8_t>::min());
static_assert(INT8_MAX == std::numeric_limits<std::int8_t>::max());
static_assert(UINT8_MAX == std::numeric_limits<std::uint8_t>::max());
static_assert(INT16_MIN == std::numeric_limits<std::int16_t>::min());
static_assert(INT16_MAX == std::numeric_limits<std::int16_t>::max());
static_assert(UINT16_MAX == std::numeric_limits<std::uint16_t>::max());
static_assert(INT32_MIN == std::numeric_limits<std::int32_t>::min());
static_assert(INT32_MAX == std::numeric_limits<std::int32_t>::max());
static_assert(UINT32_MAX == std::numeric_limits<std::uint32_t>::max());
static_assert(INT64_MIN == std::numeric_limits<std::int64_t>::min());
static_assert(INT64_MAX == std::numeric_limits<std::int64_t>::max());
static_assert(UINT64_MAX == std::numeric_limits<std::uint64_t>::max());
static_assert(std::is_same_v<std::nullptr_t, decltype(nullptr)>);
static_assert(std::is_same_v<std::remove_cvref_t<const int&>, int>);
static_assert(std::is_same_v<std::conditional_t<true, int, long>, int>);
static_assert(std::is_same_v<std::common_type_t<short, int>, int>);
static_assert(std::is_nothrow_move_constructible_v<int>);
static_assert(std::is_trivially_copyable_v<int>);
static_assert(std::is_signed_v<int> && std::is_unsigned_v<unsigned int>);
static_assert(std::is_constructible_v<long, int>);
static_assert(std::is_convertible_v<int, long>);
static_assert(std::is_invocable_r_v<int, int (*)(int), int>);
static_assert(std::same_as<std::remove_cv_t<const int>, int>);
static_assert(!std::derived_from<int, int>);
static_assert(std::convertible_to<int, long>);
static_assert(std::constructible_from<int, short>);
static_assert(std::regular_invocable<int (*)(int), int>);
static_assert(std::totally_ordered<int>);
static_assert(std::three_way_comparable<int>);
static_assert(std::equality_comparable<int> && std::totally_ordered<int>);
static_assert(std::movable<int> && std::copyable<int> && std::semiregular<int>);
static_assert(std::common_with<short, int>);
static_assert(std::assignable_from<int&, short>);
static_assert(std::default_initializable<int> && std::destructible<int>);
static_assert(std::swappable<int> && std::swappable_with<int&, int&>);
static_assert(std::invocable<int (*)(int), int>);
static_assert(std::predicate<bool (*)(int), int>);
static_assert(std::relation<bool (*)(int, int), int, int>);
static_assert(std::strict_weak_order<bool (*)(int, int), int, int>);
static_assert(std::ratio_add<std::ratio<1, 2>, std::ratio<1, 3>>::num == 5);
static_assert(std::ratio_add<std::ratio<1, 2>, std::ratio<1, 3>>::den == 6);
static_assert(std::ratio_subtract<std::ratio<3, 4>, std::ratio<1, 4>>::num == 1);
static_assert(std::ratio_multiply<std::ratio<2, 3>, std::ratio<3, 4>>::num == 1);
static_assert(std::ratio_divide<std::ratio<3, 4>, std::ratio<1, 2>>::num == 3);
static_assert(std::ratio_equal_v<std::ratio<2, 4>, std::ratio<1, 2>>);
static_assert(std::ratio_less_v<std::ratio<1, 3>, std::ratio<1, 2>>);
static_assert(std::ratio_greater_equal_v<std::ratio<3, 4>, std::ratio<1, 2>>);
static_assert(std::ratio_not_equal_v<std::ratio<1, 3>, std::ratio<1, 2>>);
static_assert(std::ratio_less_equal_v<std::ratio<1, 3>, std::ratio<1, 2>>);
static_assert(std::ratio_greater_v<std::ratio<3, 4>, std::ratio<1, 2>>);
static_assert(std::ratio_multiply<
                  std::ratio<std::numeric_limits<std::intmax_t>::max(), 2>,
                  std::ratio<2, std::numeric_limits<std::intmax_t>::max()>>::num == 1);
static_assert(std::tuple_size_v<std::tuple<int, long>> == 2);
static_assert(std::is_same_v<std::tuple_element_t<1, std::tuple<int, long>>, long>);
static_assert(std::random_access_iterator<int*>);
static_assert(std::contiguous_iterator<int*>);
static_assert(std::ranges::random_access_range<int[3]>);
static_assert(std::ranges::contiguous_range<int[3]>);
static_assert(std::ranges::sized_range<int[3]>);
using int_array_lvalue = int (&)[3];
static_assert(std::ranges::borrowed_range<int_array_lvalue>);
static_assert(std::has_single_bit(8u));
static_assert(std::bit_width(8u) == 4);
static_assert(std::bit_floor(15u) == 8u);
static_assert(std::bit_ceil(9u) == 16u);
static_assert(std::rotl(std::uint8_t{0x81}, 1) == std::uint8_t{0x03});
static_assert(std::rotr(std::uint8_t{0x81}, 1) == std::uint8_t{0xc0});
static_assert(std::byteswap(std::uint16_t{0x1234}) == std::uint16_t{0x3412});
static_assert(std::byteswap(std::uint32_t{0x12345678}) == std::uint32_t{0x78563412});
static_assert(std::byteswap(std::uint64_t{0x0123456789abcdefULL}) ==
              std::uint64_t{0xefcdab8967452301ULL});
static_assert(std::rotl(std::uint32_t{0x80000001}, 1) == std::uint32_t{3});
static_assert(std::rotr(std::uint64_t{0x8000000000000001ULL}, 1) ==
              std::uint64_t{0xc000000000000000ULL});
static_assert(std::byteswap(std::uint32_t{0x12345678}) == std::uint32_t{0x78563412});
static_assert(std::byteswap(std::uint64_t{0x0123456789abcdefULL}) ==
              std::uint64_t{0xefcdab8967452301ULL});
static_assert(std::rotl(std::uint32_t{0x80000001}, 1) == std::uint32_t{3});
static_assert(std::rotr(std::uint64_t{0x8000000000000001ULL}, 1) ==
              std::uint64_t{0xc000000000000000ULL});
static_assert(std::endian::native == std::endian::little);
static_assert(std::is_same_v<decltype(std::in_place), const std::in_place_t>);
static_assert(std::is_same_v<decltype(std::in_place_index<1>), const std::in_place_index_t<1>>);
static_assert(std::is_same_v<decltype(std::in_place_type<int>), const std::in_place_type_t<int>>);
static_assert(std::is_same_v<decltype(std::move(std::declval<int&>())), int&&>);
static_assert(std::is_same_v<decltype(std::forward<int&>(std::declval<int&>())), int&>);
static_assert(std::cmp_equal(-1, -1));
static_assert(std::cmp_less(-1, 0u));
static_assert(std::is_same_v<decltype(std::in_place_index<1>), const std::in_place_index_t<1>>);
static_assert(std::is_same_v<decltype(std::in_place_type<int>), const std::in_place_type_t<int>>);
static_assert(std::is_same_v<decltype(std::move(std::declval<int&>())), int&&>);
static_assert(std::is_same_v<decltype(std::forward<int&>(std::declval<int&>())), int&>);
static_assert(std::is_same_v<typename std::iterator_traits<int*>::value_type, int>);
static_assert(std::is_same_v<std::allocator_traits<std::allocator<int>>::value_type, int>);
static_assert(std::to_address(static_cast<int*>(nullptr)) == nullptr);
static_assert(std::in_range<std::int16_t>(32767));
static_assert(!std::in_range<std::int16_t>(32768));
enum class small_enum : unsigned char { value = 7 };
static_assert(std::to_underlying(small_enum::value) == 7);
static_assert(std::same_as<decltype(std::forward_like<const int&>(std::declval<int&>())),
                           const int&>);
static_assert(std::integer_sequence<int, 1, 2, 3>::size() == 3);
static_assert(std::bit_cast<std::uint32_t>(1.0f) == 0x3f800000u);
static_assert(static_cast<size_t>(std::align_val_t{16}) == 16);
static_assert(std::is_same_v<decltype(std::destroying_delete),
                             const std::destroying_delete_t>);
static_assert(std::hardware_destructive_interference_size > 0);
static_assert(std::hardware_constructive_interference_size > 0);
static_assert(std::to_integer<unsigned>(std::byte{0x2a}) == 0x2a);
static_assert((std::byte{0x0f} | std::byte{0xf0}) == std::byte{0xff});
static_assert((2 <=> 3) == std::strong_ordering::less);
static_assert((3 <=> 3) == std::strong_ordering::equal);
static_assert(std::strong_ordering::less < 0);
static_assert(std::compare_three_way{}(2, 3) == std::strong_ordering::less);
static_assert(std::same_as<std::common_comparison_category_t<
                               std::strong_ordering, std::weak_ordering>,
                           std::weak_ordering>);
static_assert(std::weak_ordering::equivalent == 0);
static_assert(std::partial_ordering::unordered != 0);
static_assert(std::compare_strong_order_fallback(2, 3) == std::strong_ordering::less);
static_assert(std::compare_weak_order_fallback(2, 3) == std::weak_ordering::less);
static_assert(std::compare_partial_order_fallback(2, 3) == std::partial_ordering::less);
static_assert(std::same_as<std::compare_three_way_result_t<int>, std::strong_ordering>);
static_assert(std::countr_zero(std::uint8_t{0}) == 8);
static_assert(std::countl_zero(std::uint16_t{0}) == 16);
static_assert(std::countr_zero(std::uint32_t{0x100}) == 8);
static_assert(std::countl_zero(std::uint32_t{1}) == 31);

struct placed_value {
    int value;
    int add(int x) const { return value + x; }
};

static int sum_initializer_list(std::initializer_list<int> values) {
    int sum = 0;
    for (int value : values)
        sum += value;
    return sum;
}

static int sum_variadic(int count, ...) {
    std::va_list args;
    va_start(args, count);
    std::va_list copy;
    va_copy(copy, args);
    int sum = 0;
    for (int i = 0; i < count; ++i)
        sum += va_arg(copy, int);
    va_end(copy);
    va_end(args);
    return sum;
}

#define AVM_TEST_NOINLINE __attribute__((noinline))
extern "C" void libcxx_freestanding_ranges_sort(int*, int*);

static AVM_TEST_NOINLINE int check_bit_operations() {
    if (std::countr_zero(0ULL) != 64 || std::countr_zero(1ULL) != 0 ||
        std::countr_zero(1ULL << 32) != 32 ||
        std::countr_zero(1ULL << 63) != 63 ||
        std::countl_zero(0ULL) != 64 || std::countl_zero(1ULL) != 63 ||
        std::countl_zero(1ULL << 63) != 0)
        return 11;
    return 0;
}

static AVM_TEST_NOINLINE int check_algorithms() {
    int values[] = {5, 1, 3};
    std::sort(values, values + 3);
    if (values[0] != 1 || values[2] != 5 ||
        std::lower_bound(values, values + 3, 3) != values + 1 ||
        !std::binary_search(values, values + 3, 5))
        return 1;

    libcxx_freestanding_ranges_sort(values, values + 3);
    if (values[0] != 5 || values[2] != 1 ||
        std::ranges::find(values, 3) != values + 1 ||
        std::ranges::size(values) != 3)
        return 2;
    int copied[3] = {};
    std::ranges::copy(values, copied);
    std::fill(copied + 1, copied + 3, 0);
    if (std::find(copied, copied + 1, 5) != copied ||
        std::min(copied[0], copied[1]) != 0 ||
        std::max(copied[0], copied[1]) != 5)
        return 4;
    return 0;
}

static AVM_TEST_NOINLINE int check_tuple_and_functional() {
    auto pair = std::make_pair(4, 8);
    auto tuple = std::make_tuple(pair.first, pair.second, 12);
    int exchanged = 4;
    if (std::get<0>(tuple) != 4 || std::get<2>(tuple) != 12)
        return 5;
    auto tied = std::tie(exchanged, pair.first);
    std::get<0>(tied) = 6;
    auto concatenated = std::tuple_cat(pair, std::make_tuple(12));
    if (std::get<0>(concatenated) != 4 || exchanged != 6 ||
        std::apply([](int a, int b, int c) { return a + b + c; }, concatenated) != 24)
        return 16;
    if (std::invoke([](int a, int b) { return a + b; }, 4, 8) != 12)
        return 12;
    int referenced = 3;
    auto reference = std::ref(referenced);
    auto member_add = std::mem_fn(&placed_value::add);
    placed_value member_object{4};
    if (reference.get() != 3 || std::less<>{}(3, 8) != true ||
        std::identity{}(referenced) != 3 || member_add(member_object, 5) != 9 ||
        std::plus<>{}(2, 3) != 5 || !std::equal_to<>{}(4, 4) ||
        !std::logical_not<>{}(false) || std::bit_and<>{}(7, 3) != 3)
        return 17;
    if (std::exchange(exchanged, 8) != 6 || exchanged != 8)
        return 14;
    return 0;
}

static AVM_TEST_NOINLINE int check_varargs_and_initializer_list() {
    if (sum_initializer_list({1, 2, 3, 4}) != 10 ||
        sum_variadic(3, 2, 3, 5) != 10)
        return 14;
    return 0;
}

static AVM_TEST_NOINLINE int check_source_location() {
    int expected_location_line = __LINE__ + 1;
    auto location = std::source_location::current();
    bool function_name_matches = location.function_name()[0] != '\0';
    constexpr char expected_file_suffix[] = "libcxx_freestanding.cpp";
    size_t file_name_length = strlen(location.file_name());
    bool file_name_matches = false;
    for (size_t start = 0; start + sizeof(expected_file_suffix) - 1 <= file_name_length; ++start) {
        bool matches = true;
        for (size_t i = 0; i < sizeof(expected_file_suffix) - 1; ++i)
            matches &= location.file_name()[start + i] == expected_file_suffix[i];
        file_name_matches |= matches;
    }
    if (location.line() != static_cast<unsigned>(expected_location_line))
        return 15;
    if (location.column() == 0)
        return 15;
    if (!file_name_matches)
        return 15;
    if (!function_name_matches)
        return 15;
    return 0;
}

static AVM_TEST_NOINLINE int check_iterators_and_ranges() {
    int values[] = {1, 2, 3, 4, 5, 6};
    auto first = std::ranges::begin(values);
    auto last = std::ranges::end(values);
    if (std::distance(first, last) != 6 || *std::next(first, 1) != 2)
        return 6;
    std::advance(first, 2);
    if (*std::prev(first) != 2)
        return 7;
    std::reverse_iterator<int*> reverse(values + 6);
    if (*reverse != 6)
        return 18;
    std::counted_iterator<int*> counted(values, 2);
    if (*counted != values[0] || counted == std::default_sentinel)
        return 20;
    ++counted;
    ++counted;
    if (counted != std::default_sentinel)
        return 21;
    auto range = std::ranges::subrange(values, values + 6);
    if (range.size() != 6 || *std::ranges::next(range.begin()) != values[1] ||
        std::ranges::empty(range) || std::ranges::data(range) != values ||
        *std::ranges::rbegin(range) != values[5])
        return 19;
    auto moved = std::make_move_iterator(values);
    if (*moved != values[0] || std::ranges::iter_move(values) != values[0])
        return 22;
    std::iter_swap(values, values + 1);
    std::iter_swap(values, values + 1);
    return 0;
}

static AVM_TEST_NOINLINE int check_memory() {
    alignas(placed_value) unsigned char storage[sizeof(placed_value)];
    auto* object = std::construct_at(
        reinterpret_cast<placed_value*>(storage), placed_value{23});
    if (object->value != 23 || std::addressof(*object) != object ||
        std::launder(object) != object ||
        static_cast<size_t>(std::align_val_t{alignof(placed_value)}) !=
            alignof(placed_value) ||
        sizeof(std::destroying_delete) != sizeof(std::destroying_delete_t))
        return 8;
    std::destroy_at(object);
    int memory_source[] = {31, 37};
    alignas(int) unsigned char memory_storage[sizeof(memory_source)];
    auto* memory_begin = reinterpret_cast<int*>(memory_storage);
    auto* memory_end = std::uninitialized_copy(
        memory_source, memory_source + 2, memory_begin);
    if (memory_end != memory_begin + 2 || memory_begin[0] != 31 ||
        memory_begin[1] != 37)
        return 23;
    std::destroy(memory_begin, memory_end);
    return 0;
}

static AVM_TEST_NOINLINE int check_c_runtime_interop() {
    char text[] = "avm";
    if (strlen(text) != 3 || text[0] != 'a')
        return 9;
    char copy[6] = {};
    if (std::memcpy(copy, libcxx_progmem_text, 6) != copy ||
        copy[0] != 'f' || copy[4] != 'h' || copy[5] != '\0')
        return 10;
    return 0;
}

extern "C" int avm_test_main() {
    int result = check_bit_operations();
    if (result) return result;
    result = check_algorithms();
    if (result) return result;
    result = check_tuple_and_functional();
    if (result) return result;
    result = check_varargs_and_initializer_list();
    if (result) return result;
    result = check_source_location();
    if (result) return result;
    result = check_iterators_and_ranges();
    if (result) return result;
    result = check_memory();
    if (result) return result;
    return check_c_runtime_interop();
}
