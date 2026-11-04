extern "C" int avm_test_main(void);
#include <cerrno>
#include <cstddef>
#include <cuchar>
#include <avm.h>

#define CHECK(expr) do { if(!(expr)) return __LINE__; } while(0)

/* The std:: names resolve to the C11 conversions. libc++ exposes the C++20
 * char8_t conversions as std:: names only when its C library reports them, so
 * AVM uses the global C declarations for those two. */
int avm_test_main(void) {
    char buffer[4];
    char16_t c16 = 0;
    char32_t c32 = 0;
    char8_t c8 = 0;
    std::mbstate_t state{};
    const std::size_t invalid = static_cast<std::size_t>(-1);
    const std::size_t pending = static_cast<std::size_t>(-3);

    errno = 0;
    CHECK(std::mbrtoc16(&c16, "A", 1, &state) == 1 && c16 == 'A');
    CHECK(std::mbrtoc32(&c32, "\xe9", 1, &state) == 1 && c32 == 0xE9);
    CHECK(::mbrtoc8(&c8, "\xe9", 1, &state) == 1 && c8 == 0xC3);
    CHECK(::mbrtoc8(&c8, "Q", 1, &state) == pending && c8 == 0xA9);
    CHECK(std::c16rtomb(buffer, 0x41, &state) == 1 && buffer[0] == 'A');
    CHECK(std::c16rtomb(buffer, 0x100, &state) == invalid && errno == EILSEQ);
    errno = 0;
    CHECK(::c8rtomb(buffer, 0xC3, &state) == 0);
    CHECK(::c8rtomb(buffer, 0xA9, &state) == 1 && static_cast<unsigned char>(buffer[0]) == 0xE9);
    CHECK(std::c32rtomb(buffer, 0x10000, &state) == invalid && errno == EILSEQ);
    return 0;
}
