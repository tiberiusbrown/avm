// Compile-time validation of every std::numeric_limits specialization against AVM's
// fundamental types. Expected values come from the compiler's predefined type macros
// and the C limits headers, so a mismatch in either library or target shows here.
#include <cfloat>
#include <climits>
#include <cstddef>
#include <cstdint>
#include <limits>
#include <type_traits>

extern "C" int avm_test_main(void);

// bool: one digit, unsigned, and no other numeric bounds beyond false and true.
static_assert(std::numeric_limits<bool>::is_specialized);
static_assert(std::numeric_limits<bool>::is_integer && !std::numeric_limits<bool>::is_signed);
static_assert(std::numeric_limits<bool>::min() == false && std::numeric_limits<bool>::max() == true);
static_assert(std::numeric_limits<bool>::digits == 1 && std::numeric_limits<bool>::digits10 == 0);
static_assert(std::numeric_limits<bool>::is_modulo == false && std::numeric_limits<bool>::is_exact);

// Character types take their widths from the compiler's predefined limits.
static_assert(std::numeric_limits<char>::min() == CHAR_MIN);
static_assert(std::numeric_limits<char>::max() == CHAR_MAX);
static_assert(std::numeric_limits<char>::is_signed == (CHAR_MIN < 0));
static_assert(std::numeric_limits<char>::digits == CHAR_BIT - (CHAR_MIN < 0 ? 1 : 0));
static_assert(std::numeric_limits<signed char>::min() == SCHAR_MIN);
static_assert(std::numeric_limits<signed char>::max() == SCHAR_MAX);
static_assert(std::numeric_limits<signed char>::digits == 7 && std::numeric_limits<signed char>::digits10 == 2);
static_assert(std::numeric_limits<unsigned char>::min() == 0);
static_assert(std::numeric_limits<unsigned char>::max() == UCHAR_MAX);
static_assert(std::numeric_limits<unsigned char>::digits == 8 && std::numeric_limits<unsigned char>::digits10 == 2);
static_assert(!std::numeric_limits<unsigned char>::is_signed && std::numeric_limits<unsigned char>::is_modulo);

// wchar_t signedness is taken from the conversion of -1; AVM does not predefine __WCHAR_MIN__.
static_assert(std::numeric_limits<wchar_t>::is_signed == (static_cast<wchar_t>(-1) < 0));
static_assert(std::numeric_limits<wchar_t>::max() == __WCHAR_MAX__);
static_assert(std::numeric_limits<wchar_t>::min() ==
              (std::numeric_limits<wchar_t>::is_signed ? -__WCHAR_MAX__ - 1 : 0));
static_assert(std::numeric_limits<wchar_t>::digits ==
              __WCHAR_WIDTH__ - (std::numeric_limits<wchar_t>::is_signed ? 1 : 0));

static_assert(std::numeric_limits<char8_t>::max() == UINT8_MAX);
static_assert(std::numeric_limits<char8_t>::digits == 8 && !std::numeric_limits<char8_t>::is_signed);
static_assert(std::numeric_limits<char16_t>::max() == UINT16_MAX);
static_assert(std::numeric_limits<char16_t>::digits == 16 && !std::numeric_limits<char16_t>::is_signed);
static_assert(std::numeric_limits<char32_t>::max() == UINT32_MAX);
static_assert(std::numeric_limits<char32_t>::digits == 32 && !std::numeric_limits<char32_t>::is_signed);

// Standard integers match the sizes in the AVM data model, and each limit equals its C macro.
static_assert(std::numeric_limits<short>::min() == SHRT_MIN);
static_assert(std::numeric_limits<short>::max() == SHRT_MAX);
static_assert(std::numeric_limits<short>::digits == 15 && std::numeric_limits<short>::digits10 == 4);
static_assert(std::numeric_limits<unsigned short>::max() == USHRT_MAX);
static_assert(std::numeric_limits<unsigned short>::digits == 16);
static_assert(std::numeric_limits<int>::min() == INT_MIN);
static_assert(std::numeric_limits<int>::max() == INT_MAX);
static_assert(std::numeric_limits<int>::digits == 15 && std::numeric_limits<int>::digits10 == 4);
static_assert(std::numeric_limits<unsigned>::max() == UINT_MAX);
static_assert(std::numeric_limits<unsigned>::digits == 16 && std::numeric_limits<unsigned>::digits10 == 4);
static_assert(std::numeric_limits<long>::min() == LONG_MIN);
static_assert(std::numeric_limits<long>::max() == LONG_MAX);
static_assert(std::numeric_limits<long>::digits == 31 && std::numeric_limits<long>::digits10 == 9);
static_assert(std::numeric_limits<unsigned long>::max() == ULONG_MAX);
static_assert(std::numeric_limits<unsigned long>::digits == 32);
static_assert(std::numeric_limits<long long>::min() == LLONG_MIN);
static_assert(std::numeric_limits<long long>::max() == LLONG_MAX);
static_assert(std::numeric_limits<long long>::digits == 63 && std::numeric_limits<long long>::digits10 == 18);
static_assert(std::numeric_limits<unsigned long long>::max() == ULLONG_MAX);
static_assert(std::numeric_limits<unsigned long long>::digits == 64);
static_assert(std::numeric_limits<long long>::max_digits10 == 0);

// Pointer-related integer types take their width from the AVM pointer representation.
static_assert(sizeof(std::size_t) == 2 && sizeof(std::ptrdiff_t) == 2);
static_assert(sizeof(std::uintptr_t) == sizeof(void *) && sizeof(std::intptr_t) == sizeof(void *));
static_assert(std::numeric_limits<std::size_t>::max() == SIZE_MAX);
static_assert(std::numeric_limits<std::size_t>::digits == __SIZE_WIDTH__);
static_assert(std::numeric_limits<std::ptrdiff_t>::min() == PTRDIFF_MIN);
static_assert(std::numeric_limits<std::ptrdiff_t>::max() == PTRDIFF_MAX);
static_assert(std::numeric_limits<std::ptrdiff_t>::digits == __PTRDIFF_WIDTH__ - 1);
static_assert(std::numeric_limits<std::uintptr_t>::max() == UINTPTR_MAX);
static_assert(std::numeric_limits<std::uintptr_t>::digits == __INTPTR_WIDTH__);
static_assert(std::numeric_limits<std::intptr_t>::min() == INTPTR_MIN);
static_assert(std::numeric_limits<std::intptr_t>::max() == INTPTR_MAX);
static_assert(std::numeric_limits<std::intptr_t>::digits == __INTPTR_WIDTH__ - 1);

// Pointer types themselves and std::nullptr_t have no specialization.
static_assert(!std::numeric_limits<std::nullptr_t>::is_specialized);
static_assert(!std::numeric_limits<void *>::is_specialized);
static_assert(!std::numeric_limits<int *>::is_specialized);
static_assert(!std::numeric_limits<void (*)()>::is_specialized);

// Every specialization ignores cv-qualifiers.
static_assert(std::numeric_limits<const int>::max() == std::numeric_limits<int>::max());
static_assert(std::numeric_limits<volatile unsigned>::digits == std::numeric_limits<unsigned>::digits);
static_assert(std::numeric_limits<const volatile float>::digits == std::numeric_limits<float>::digits);
static_assert(std::numeric_limits<const double>::digits == std::numeric_limits<double>::digits);
static_assert(std::numeric_limits<const long double>::digits == std::numeric_limits<long double>::digits);

// Floating-point specializations describe AVM's binary32 representation of float, double,
// and long double, with the properties and constants taken from the compiler's macros.
static_assert(std::numeric_limits<float>::is_specialized && std::numeric_limits<float>::is_iec559);
static_assert(std::numeric_limits<float>::radix == __FLT_RADIX__ && std::numeric_limits<float>::radix == 2);
static_assert(std::numeric_limits<float>::digits == __FLT_MANT_DIG__);
static_assert(std::numeric_limits<float>::digits10 == __FLT_DIG__);
static_assert(std::numeric_limits<float>::max_digits10 == 9);
static_assert(std::numeric_limits<float>::min_exponent == __FLT_MIN_EXP__);
static_assert(std::numeric_limits<float>::min_exponent10 == __FLT_MIN_10_EXP__);
static_assert(std::numeric_limits<float>::max_exponent == __FLT_MAX_EXP__);
static_assert(std::numeric_limits<float>::max_exponent10 == __FLT_MAX_10_EXP__);
static_assert(std::numeric_limits<float>::min() == __FLT_MIN__);
static_assert(std::numeric_limits<float>::max() == __FLT_MAX__);
static_assert(std::numeric_limits<float>::lowest() == -__FLT_MAX__);
static_assert(std::numeric_limits<float>::epsilon() == __FLT_EPSILON__);
static_assert(std::numeric_limits<float>::round_error() == 0.5f);
static_assert(std::numeric_limits<float>::denorm_min() == __FLT_DENORM_MIN__);
// has_denorm and has_denorm_loss are deprecated in C++23, but they still describe the type.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
static_assert(std::numeric_limits<float>::has_denorm == std::denorm_present);
static_assert(std::numeric_limits<float>::has_denorm_loss == false);
#pragma clang diagnostic pop
static_assert(std::numeric_limits<float>::has_infinity && std::numeric_limits<float>::has_quiet_NaN);
static_assert(std::numeric_limits<float>::has_signaling_NaN);
static_assert(std::numeric_limits<float>::infinity() > std::numeric_limits<float>::max());
static_assert(std::numeric_limits<float>::quiet_NaN() != std::numeric_limits<float>::quiet_NaN());
static_assert(std::numeric_limits<float>::signaling_NaN() != std::numeric_limits<float>::signaling_NaN());
static_assert(std::numeric_limits<float>::is_bounded);
static_assert(!std::numeric_limits<float>::is_integer && !std::numeric_limits<float>::is_exact);
static_assert(std::numeric_limits<float>::round_style == std::round_to_nearest);

// double and long double are binary32 on AVM today, so their specializations must report
// the same representation that their C macros report.
static_assert(std::numeric_limits<double>::digits == __DBL_MANT_DIG__);
static_assert(std::numeric_limits<double>::digits10 == __DBL_DIG__);
static_assert(std::numeric_limits<double>::min_exponent == __DBL_MIN_EXP__);
static_assert(std::numeric_limits<double>::max_exponent == __DBL_MAX_EXP__);
static_assert(std::numeric_limits<double>::max() == __DBL_MAX__);
static_assert(std::numeric_limits<double>::min() == __DBL_MIN__);
static_assert(std::numeric_limits<double>::epsilon() == __DBL_EPSILON__);
static_assert(std::numeric_limits<double>::denorm_min() == __DBL_DENORM_MIN__);
static_assert(std::numeric_limits<double>::is_iec559 == (__DBL_MANT_DIG__ == __FLT_MANT_DIG__));
static_assert(std::numeric_limits<long double>::digits == __LDBL_MANT_DIG__);
static_assert(std::numeric_limits<long double>::digits10 == __LDBL_DIG__);
static_assert(std::numeric_limits<long double>::min_exponent == __LDBL_MIN_EXP__);
static_assert(std::numeric_limits<long double>::max_exponent == __LDBL_MAX_EXP__);
static_assert(std::numeric_limits<long double>::max() == __LDBL_MAX__);
static_assert(std::numeric_limits<long double>::min() == __LDBL_MIN__);
static_assert(std::numeric_limits<long double>::epsilon() == __LDBL_EPSILON__);
static_assert(std::numeric_limits<long double>::denorm_min() == __LDBL_DENORM_MIN__);

// Floating-point limits agree with the <cfloat> macros the C library exposes.
static_assert(std::numeric_limits<float>::digits == FLT_MANT_DIG);
static_assert(std::numeric_limits<float>::max_exponent == FLT_MAX_EXP);
static_assert(std::numeric_limits<double>::digits == DBL_MANT_DIG);
static_assert(std::numeric_limits<long double>::digits == LDBL_MANT_DIG);

extern "C" int avm_test_main(void) {
    return 0;
}
