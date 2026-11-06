#include <cerrno>
#include <cstddef>
#include <cstdlib>
#include <cwchar>
#include <type_traits>

static_assert(std::is_same_v<decltype(std::abs(0L)), long>);
static_assert(std::is_same_v<decltype(std::abs(0LL)), long long>);
static_assert(std::is_same_v<decltype(std::div(1L, 1L)), std::ldiv_t>);
static_assert(std::is_same_v<decltype(std::div(1LL, 1LL)), std::lldiv_t>);
static_assert(std::is_same_v<decltype(&std::mbtowc),
                             int (*)(wchar_t*, const char*, std::size_t)>);
static_assert(std::is_same_v<decltype(&std::wcstombs),
                             std::size_t (*)(char*, const wchar_t*, std::size_t)>);

namespace {

int compare_ints(const void* left, const void* right)
{
    const int a = *static_cast<const int*>(left);
    const int b = *static_cast<const int*>(right);
    return (a > b) - (a < b);
}

}

extern "C" int avm_test_main()
{
    char* end = nullptr;
    if(std::atoi("-42") != -42 || std::atol("123456") != 123456L ||
       std::atoll("123456789012") != 123456789012LL ||
       std::strtol("-0x2a!", &end, 0) != -42 || end[0] != '!')
        return 1;

    errno = 0;
    if(std::strtod("1.5!", &end) != 1.5 || end[0] != '!')
        return 2;

    if(std::abs(-17L) != 17L || std::abs(-19LL) != 19LL ||
       std::labs(-23L) != 23L || std::llabs(-29LL) != 29LL)
        return 3;
    const std::div_t d = std::div(-17, 5);
    const std::ldiv_t ld = std::div(-23L, 5L);
    const std::lldiv_t lld = std::div(-29LL, 5LL);
    if(d.quot != -3 || d.rem != -2 || ld.quot != -4 || ld.rem != -3 ||
       lld.quot != -5 || lld.rem != -4)
        return 4;

    int values[] = {7, -3, 4};
    std::qsort(values, 3, sizeof(values[0]), compare_ints);
    const int key = 4;
    const int* found = static_cast<const int*>(
        std::bsearch(&key, values, 3, sizeof(values[0]), compare_ints));
    if(values[0] != -3 || values[1] != 4 || values[2] != 7 ||
       found != values + 1)
        return 5;

    std::srand(0x1937u);
    const int first = std::rand();
    std::srand(0x1937u);
    if(first != std::rand() || first < 0 || first > RAND_MAX)
        return 6;

    void* memory = std::malloc(4);
    if(!memory)
        return 7;
    std::free(memory);
    memory = std::calloc(4, 1);
    if(!memory)
        return 8;
    memory = std::realloc(memory, 8);
    if(!memory) // realloc preserves the original allocation on failure.
        return 9;
    std::free(memory);
    memory = std::aligned_alloc(1, 4);
    if(!memory)
        return 10;
    std::free(memory);
    if(std::aligned_alloc(2, 4) != nullptr)
        return 11;

    if(std::getenv("AVM_ENVIRONMENT_IS_EMPTY") != nullptr ||
       std::system(nullptr) != 0 || std::system("unsupported") != -1)
        return 12;

    wchar_t wide[4] = {};
    char narrow[4] = {};
    if(std::mbstowcs(wide, "AVM", 4) != 3 || wide[0] != 'A' ||
       wide[1] != 'V' || wide[2] != 'M' || std::wcslen(wide) != 3 ||
       std::wcstombs(narrow, wide, sizeof(narrow)) != 3 ||
       narrow[0] != 'A' || narrow[1] != 'V' || narrow[2] != 'M')
        return 13;

    return 0;
}
