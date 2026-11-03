// The target of the dynamic RTTI corruption verifier. The image runs unchanged and prints
// the alias that typeid returns for an object of type Derived, followed by P. The verifier
// patches copies of the image. A nonzero mode byte replaces the object's vptr with a value
// that has no RTTI slot in program space, and the verifier can also patch the RTTI slot
// of Derived's vtable. A malformed vptr or slot must end the query with the halt report, H,
// before any alias is printed. The valid boundary slots must print the alias that the
// verifier computes from the patched slot.
#include <avm.h>
#include <avm/runtime.h>
#include <stdint.h>
#include <typeinfo>

extern "C" int avm_test_main(void);

// The runtime's halt spins, so the harness would wait for its time limit. Report the
// termination, then break, as the other corruption targets do.
extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

namespace {

struct Base {
    virtual ~Base() = default;
};

struct Derived : Base {
    int tag;
};

// The verifier patches this byte. Zero keeps the vptr, and the other values replace it.
const uint8_t AVM_PROGMEM corruption_mode = 0;

// A volatile read keeps the compiler from folding the constant, so the patched byte is read.
uint8_t read_corruption_mode() {
    uint8_t const volatile AVM_PROGMEM *mode = &corruption_mode;
    return *mode;
}

void put_hex_digit(uint8_t value) {
    value &= 0x0f;
    avm_debug_putc(value < 10 ? '0' + value : 'A' + value - 10);
}

void put_line(const char *label, uint16_t value) {
    for (const char *c = label; *c; ++c)
        avm_debug_putc(*c);
    avm_debug_putc('=');
    for (int shift = 12; shift >= 0; shift -= 4)
        put_hex_digit(static_cast<uint8_t>(value >> shift));
    avm_debug_putc('\n');
}

__attribute__((noinline)) const std::type_info &dynamic_type(Base *value) {
    return typeid(*value);
}

} // namespace

extern "C" int avm_test_main(void) {
    Derived derived;
    derived.tag = 1;

    // Modes 1 to 3 store a vptr of zero, two, and one. Each is below the three bytes of the
    // RTTI slot that the vptr must leave room for, so the lookup has no slot to read.
    const uint8_t mode = read_corruption_mode();
    if (mode != 0) {
        const uint32_t vptr = mode == 1 ? 0x000000u : mode == 2 ? 0x000002u : 0x000001u;
        uint8_t *bytes = reinterpret_cast<uint8_t *>(&derived);
        bytes[0] = static_cast<uint8_t>(vptr);
        bytes[1] = static_cast<uint8_t>(vptr >> 8);
        bytes[2] = static_cast<uint8_t>(vptr >> 16);
    }

    const std::type_info &type = dynamic_type(&derived);
    put_line("alias", static_cast<uint16_t>(reinterpret_cast<uintptr_t>(&type)));
    return 0;
}
