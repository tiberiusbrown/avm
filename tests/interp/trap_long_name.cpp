// Source-aware fatal-trap fixture with a long C++ function name. The trapping
// function sits in a namespace, in a class template instance, and takes a
// parameter list, so its complete demangled name is longer than 128 bytes.
// main looks the name up, renders its first 12 bytes with %.12S into RAM, and
// then traps the same way trap_source.c does.
#include <avm.h>
#include <avm/trap.h>
#include <stdio.h>

namespace avm_trap_long_name_fixture {
template <unsigned Columns, unsigned Rows>
struct TiledFramebufferRasterizer {
    /* The body is empty. The invalid SYS encoding is the only action, and the
     * reporter reads the trapped PC from the containing function. */
    __attribute__((noinline)) static void trap_site(
        int const &pixel, unsigned long offset, char const *label,
        unsigned short width) {
        (void)pixel;
        (void)offset;
        (void)label;
        (void)width;
        __asm__ volatile(".byte 0xd7, 0x04");
    }
};
} // namespace avm_trap_long_name_fixture

using Rasterizer = avm_trap_long_name_fixture::TiledFramebufferRasterizer<128, 64>;

extern "C" int main() {
    avm_trap_location_t *location = (avm_trap_location_t *)0x0300;
    char *short_text = (char *)0x0320;
    __avm_trap_lookup((uint32_t)&Rasterizer::trap_site, location);
    snprintf_P(short_text, 16, AVM_PSTR("%.12S"), location->function);
    Rasterizer::trap_site(0, 0, nullptr, 0);
    return 0;
}
