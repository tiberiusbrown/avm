// The target of the pointer RTTI and marker corruption verifier. Four throws share the image.
// Path zero throws a pointer to a class with a virtual base and catches it as a base pointer,
// so the conversion reads the descriptors of the thrown pointer, the class, and the base
// pointer, and the vptr of the object. Path one throws a plain base pointer and catches it by
// a mutable reference, which the reference marker must match exactly. Path two throws a pointer
// to a noexcept function and catches it as a pointer to a function that may throw, so the
// conversion reads the 24-bit representation of two function pointer descriptors. Path three
// throws a pointer to a pointer and catches it as a pointer to a const pointer, so the nested
// qualification reads the inner pointer descriptor. The verifier selects a path with the path
// byte, and it patches one descriptor or the vptr byte of a copy of the image. The unchanged image
// reports P on every path. A patched image must fail its throw without running the handler. A
// failed throw reports H, so the override below prints it and breaks.
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

// Index zero is the vptr corruption mode, and index one selects the throw path. The verifier
// patches these bytes. A volatile read keeps the compiler from folding the constants.
const uint8_t AVM_PROGMEM pointer_corruption[2] = {0, 0};

uint8_t read_pointer_corruption(unsigned index) {
    uint8_t const volatile AVM_PROGMEM *bytes = pointer_corruption;
    return bytes[index];
}

struct PBase {
    int value;
    PBase(int v) : value(v) {}
};

struct PVirtual : virtual PBase {
    int extra;
    PVirtual(int v);
};

// The vptr is the first three bytes of the object, and the constructor has just stored it.
// Mode 1 stores zero, and mode 2 stores a vptr so small that its vbase slot lies below program
// address zero.
PVirtual::PVirtual(int v) : PBase(v), extra(v + 1) {
    uint8_t mode = read_pointer_corruption(0);
    if (mode == 0)
        return;
    uint32_t value = mode == 1 ? 0x000000u : 0x000004u;
    uint8_t *vptr = reinterpret_cast<uint8_t *>(this);
    vptr[0] = static_cast<uint8_t>(value);
    vptr[1] = static_cast<uint8_t>(value >> 8);
    vptr[2] = static_cast<uint8_t>(value >> 16);
}

__attribute__((noinline)) void throw_virtual_pointer(PVirtual *p) {
    throw p;
}

__attribute__((noinline)) int convert_to_base(PVirtual *p) {
    try {
        throw_virtual_pointer(p);
    } catch (PBase *b) {
        return b->value == 5 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) void throw_base_pointer(PBase *p) {
    throw p;
}

__attribute__((noinline)) int catch_by_mutable_reference(PBase *p) {
    try {
        throw_base_pointer(p);
    } catch (PBase *&r) {
        return r == nullptr ? 0 : r->value == 7 ? 1 : 0;
    }
    return 0;
}

// Path two throws a pointer to a noexcept function, caught as a pointer to the potentially
// throwing type. The conversion drops noexcept, so the descriptors must agree on the 24-bit
// representation, which the verifier clears in one descriptor at a time.
__attribute__((noinline)) void nothrow_function() noexcept {}

__attribute__((noinline)) void throw_noexcept_function(void (*fp)() noexcept) {
    throw fp;
}

__attribute__((noinline)) int convert_noexcept_function() {
    try {
        throw_noexcept_function(&nothrow_function);
    } catch (void (*f)()) {
        return f == &nothrow_function ? 1 : 0;
    }
    return 0;
}

// Path three throws a pointer to a pointer to an int, caught as a pointer to a const pointer.
// The inner pointer descriptor is shared by both chain levels, and the verifier patches its pointee.
__attribute__((noinline)) void throw_nested_pointer(int **p) {
    throw p;
}

__attribute__((noinline)) int convert_nested_pointer() {
    int value = 5;
    int *inner = &value;
    int **outer = &inner;
    try {
        throw_nested_pointer(outer);
    } catch (int *const *q) {
        return **q == 5 ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    switch (read_pointer_corruption(1)) {
    case 1: {
        PBase object(7);
        return catch_by_mutable_reference(&object) == 1 ? 0 : 1;
    }
    case 2:
        return convert_noexcept_function() == 1 ? 0 : 1;
    case 3:
        return convert_nested_pointer() == 1 ? 0 : 1;
    default: {
        PVirtual object(5);
        return convert_to_base(&object) == 1 ? 0 : 1;
    }
    }
}
