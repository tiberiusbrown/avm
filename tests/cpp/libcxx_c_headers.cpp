#include <cassert>
#include <ccomplex>
#include <cctype>
#include <cerrno>
#include <cfenv>
#include <cfloat>
#include <cinttypes>
#include <ciso646>
#include <climits>
#include <clocale>
#include <cmath>
#include <csetjmp>
#include <csignal>
#include <cstdarg>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <cuchar>
#include <cwchar>
#include <cwctype>
#include <version>
#include <type_traits>

static_assert(std::is_same_v<decltype(&std::isalpha), int (*)(int)>);
static_assert(std::is_same_v<decltype(&std::fesetround), int (*)(int)>);
static_assert(std::is_same_v<decltype(&std::snprintf),
                             int (*)(char*, std::size_t, const char*, ...)>);
static_assert(std::is_same_v<decltype(&std::memcpy),
                             void* (*)(void*, const void*, std::size_t)>);
static_assert(std::is_same_v<decltype(&std::strcmp),
                             int (*)(const char*, const char*)>);
static_assert(std::is_same_v<decltype(&std::strlen),
                             std::size_t (*)(const char*)>);
static_assert(std::is_same_v<decltype(&std::mbrtoc16),
                             std::size_t (*)(char16_t*, const char*,
                                             std::size_t, std::mbstate_t*)>);
static_assert(std::is_same_v<std::size_t, decltype(sizeof(0))>);
static_assert(std::is_same_v<std::mbstate_t, ::mbstate_t>);
static_assert(std::is_same_v<std::fenv_t, ::fenv_t>);
static_assert(std::is_same_v<std::sig_atomic_t, ::sig_atomic_t>);
static_assert(std::is_same_v<std::imaxdiv_t, ::imaxdiv_t>);
static_assert(std::is_same_v<decltype(&std::wcscmp),
                             int (*)(const wchar_t*, const wchar_t*)>);
static_assert(std::is_same_v<decltype(&std::strtoimax),
                             std::intmax_t (*)(const char*, char**, int)>);
static_assert(std::is_same_v<decltype(&std::gmtime),
                             std::tm* (*)(const std::time_t*)>);

const char AVM_PROGMEM flash_text[] = "avm:23";

namespace {

int jump_round_trip()
{
    std::jmp_buf env;
    if(setjmp(env) == 0)
        std::longjmp(env, 1);
    return 0;
}

}

extern "C" int avm_test_main()
{
    assert(std::isalpha('A'));
    if(std::isfinite(std::sqrt(4.0)) == false || std::sqrt(4.0) != 2.0)
        return 1;

    const int old_rounding = std::fegetround();
    if(std::fesetround(FE_TONEAREST) != 0 ||
       std::fegetround() != FE_TONEAREST ||
       std::fesetround(old_rounding) != 0)
        return 2;

    char buffer[16] = {};
    char format[] = "%s:%d";
    if(std::snprintf(buffer, sizeof(buffer), format, "avm", 23) != 6 ||
       strcmp_P(buffer, flash_text) != 0 || std::strlen(buffer) != 6 ||
       strlen_P(flash_text) != 6)
        return 3;

    char* end = nullptr;
    if(std::strtoimax("-123!", &end, 10) != -123 || end[0] != '!')
        return 4;

    std::mbstate_t state{};
    char16_t character = 0;
    if(std::mbrtoc16(&character, "A", 1, &state) != 1 || character != 'A')
        return 5;
    if(std::setlocale(LC_ALL, "C") == nullptr)
        return 6;

    const wchar_t wide[] = {'A', 'V', 'M', 0};
    if(std::wcscmp(wide, L"AVM") != 0 || !std::iswalpha(wide[0]) ||
       std::wcslen(wide) != 3)
        return 7;

    const std::time_t zero = 0;
    const std::tm* calendar = std::gmtime(&zero);
    if(!calendar || calendar->tm_year != 70 || calendar->tm_mday != 1)
        return 8;

    const std::complex<float> value(3.0f, 4.0f);
    if(std::abs(value) != 5.0f || jump_round_trip() != 0)
        return 9;

    return 0;
}
