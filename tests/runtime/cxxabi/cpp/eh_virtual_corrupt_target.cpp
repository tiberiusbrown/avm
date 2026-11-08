// The target of the virtual RTTI and vtable corruption verifier. The image runs unchanged
// and reports success. The verifier then patches one field of a copy of the image. Some
// patches change the RTTI or the vtable, and others change the mode byte below, which makes
// the constructor corrupt the vptr of the thrown object. Every patched image must fail the
// throw without running the handler. A failed throw reports H, as the other unhandled
// fixtures do, so the override below prints it and breaks.
#include <avm.h>
#include <avm/pgmspace.h>
#include <avm/runtime.h>

extern "C" int avm_test_main(void);

extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

namespace {

// The verifier patches this byte. Zero keeps the vptr, and the other values replace the
// vptr of the thrown object, as described in corrupt_vptr.
const uint8_t AVM_PROGMEM corruption_mode = 0;

// A volatile read keeps the compiler from folding the constant, so the patched byte is read.
uint8_t read_corruption_mode() {
    uint8_t const volatile AVM_PROGMEM *mode = &corruption_mode;
    return *mode;
}

struct CorruptBase {
    int value;
    CorruptBase(int v) : value(v) {}
};

struct CorruptVirtual : virtual CorruptBase {
    int extra;
    CorruptVirtual(int v);
};

// The vptr is the first three bytes of the object, and the constructor has just stored it.
// Mode 1 stores zero, mode 2 stores a vptr at the top of the 24-bit range, and mode 3 stores
// a vptr so small that its vtable slot lies below program address zero.
void corrupt_vptr(uint8_t *vptr) {
    uint8_t mode = read_corruption_mode();
    uint32_t value = mode == 1 ? 0x000000u : mode == 2 ? 0xfffffeu : mode == 3 ? 0x000004u
                                                                           : 0;
    if (mode == 0)
        return;
    vptr[0] = static_cast<uint8_t>(value);
    vptr[1] = static_cast<uint8_t>(value >> 8);
    vptr[2] = static_cast<uint8_t>(value >> 16);
}

CorruptVirtual::CorruptVirtual(int v) : CorruptBase(v), extra(v + 1) {
    corrupt_vptr(reinterpret_cast<uint8_t *>(this));
}

__attribute__((noinline)) void throw_corrupt() {
    throw CorruptVirtual(5);
}

__attribute__((noinline)) int catch_corrupt_base() {
    try {
        throw_corrupt();
    } catch (CorruptBase &base) {
        return base.value == 5 ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    return catch_corrupt_base() == 1 ? 0 : 1;
}
