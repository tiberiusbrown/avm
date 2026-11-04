// The target of the dynamic_cast corruption verifier. The verifier patches one byte, the case,
// and some bytes of the packed image, then runs the image. Each case runs one cast. Its result is
// printed as expected=HHHH result=HHHH, where the expected address is the compiler's own
// static_cast layout, and the result is the dynamic_cast. A valid cast prints P after the line.
// A malformed descriptor, vptr, or walk limit must end the run with the halt report, H, before
// any line is printed.
#include <avm.h>
#include <avm/runtime.h>
#include <stdint.h>

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

// The case selects the cast, and the verifier patches this byte in each image copy.
extern const uint8_t AVM_PROGMEM corruption_case = 0;

namespace {

uint8_t read_corruption_case() {
    uint8_t const volatile AVM_PROGMEM *value = &corruption_case;
    return *value;
}

void put_text(const char *text) {
    for (const char *c = text; *c; ++c)
        avm_debug_putc(*c);
}

void put_hex16(uint16_t value) {
    for (int shift = 12; shift >= 0; shift -= 4) {
        uint8_t digit = (uint8_t)((value >> shift) & 0x0f);
        avm_debug_putc(digit < 10 ? '0' + digit : 'A' + digit - 10);
    }
}

// Prints the compiler's expected address and the runtime result, then the success marker.
void report(uintptr_t expected, const void *result) {
    put_text("expected=");
    put_hex16((uint16_t)expected);
    put_text(" result=");
    put_hex16((uint16_t)(uintptr_t)result);
    avm_debug_putc('\n');
}

// Reads the object's bytes at vptr, the first three bytes of a polymorphic subobject.
void write_vptr(const void *object, uint32_t vptr) {
    uint8_t *bytes = reinterpret_cast<uint8_t *>(const_cast<void *>(object));
    bytes[0] = static_cast<uint8_t>(vptr);
    bytes[1] = static_cast<uint8_t>(vptr >> 8);
    bytes[2] = static_cast<uint8_t>(vptr >> 16);
}

struct Base {
    virtual ~Base() = default;
};

struct Derived : Base {
    int tag;
};

struct Unrelated : Base {
    int other;
};

struct Left {
    virtual ~Left() = default;
    int l;
};

struct Right {
    virtual ~Right() = default;
    int r;
};

struct Both : Left, Right {
    int b;
};

struct VBase {
    virtual ~VBase() = default;
    int vb;
};

// VSide reaches VBase through a virtual edge, so its descriptor is a VMI with one virtual base.
struct VSide : virtual VBase {
    int vs;
};

struct VFull : VSide, Left {
    int vf;
};

// A chain of nine single-inheritance classes, so the eighth class's walk reaches depth eight.
struct Ch0 {
    virtual ~Ch0() = default;
    int c;
};

struct Ch1 : Ch0 {
    int c1;
};

struct Ch2 : Ch1 {
    int c2;
};

struct Ch3 : Ch2 {
    int c3;
};

struct Ch4 : Ch3 {
    int c4;
};

struct Ch5 : Ch4 {
    int c5;
};

struct Ch6 : Ch5 {
    int c6;
};

struct Ch7 : Ch6 {
    int c7;
};

struct Ch8 : Ch7 {
    int c8;
};

// A lattice of seven levels, three classes at each level, and each class derives virtually from
// the three classes below it. A walk from a level-five root visits 363 edges, which is within the
// budget, and a walk from a level-six root visits 1092, which exceeds it.

struct Lt0_0 {
    virtual ~Lt0_0() = default;
    int v;
};

struct Lt0_1 {
    virtual ~Lt0_1() = default;
    int v;
};

struct Lt0_2 {
    virtual ~Lt0_2() = default;
    int v;
};

struct Lt1_0 : virtual Lt0_0, virtual Lt0_1, virtual Lt0_2 {
    int v;
};

struct Lt1_1 : virtual Lt0_0, virtual Lt0_1, virtual Lt0_2 {
    int v;
};

struct Lt1_2 : virtual Lt0_0, virtual Lt0_1, virtual Lt0_2 {
    int v;
};

struct Lt2_0 : virtual Lt1_0, virtual Lt1_1, virtual Lt1_2 {
    int v;
};

struct Lt2_1 : virtual Lt1_0, virtual Lt1_1, virtual Lt1_2 {
    int v;
};

struct Lt2_2 : virtual Lt1_0, virtual Lt1_1, virtual Lt1_2 {
    int v;
};

struct Lt3_0 : virtual Lt2_0, virtual Lt2_1, virtual Lt2_2 {
    int v;
};

struct Lt3_1 : virtual Lt2_0, virtual Lt2_1, virtual Lt2_2 {
    int v;
};

struct Lt3_2 : virtual Lt2_0, virtual Lt2_1, virtual Lt2_2 {
    int v;
};

struct Lt4_0 : virtual Lt3_0, virtual Lt3_1, virtual Lt3_2 {
    int v;
};

struct Lt4_1 : virtual Lt3_0, virtual Lt3_1, virtual Lt3_2 {
    int v;
};

struct Lt4_2 : virtual Lt3_0, virtual Lt3_1, virtual Lt3_2 {
    int v;
};

struct Lt5_0 : virtual Lt4_0, virtual Lt4_1, virtual Lt4_2 {
    int v;
};

struct Lt5_1 : virtual Lt4_0, virtual Lt4_1, virtual Lt4_2 {
    int v;
};

struct Lt5_2 : virtual Lt4_0, virtual Lt4_1, virtual Lt4_2 {
    int v;
};

struct Lt6_0 : virtual Lt5_0, virtual Lt5_1, virtual Lt5_2 {
    int v;
};

struct Lt6_1 : virtual Lt5_0, virtual Lt5_1, virtual Lt5_2 {
    int v;
};

struct Lt6_2 : virtual Lt5_0, virtual Lt5_1, virtual Lt5_2 {
    int v;
};

Derived derived_object;
Unrelated unrelated_object;
Both both_object;
VFull vfull_object;
VSide vside_object;
Ch7 chain7_object;
Ch8 chain8_object;
Lt5_0 lattice5_object;
Lt6_0 lattice6_object;

// 0. A downcast from a base pointer to the derived class is valid.
__attribute__((noinline)) int case_derived() {
    Base *base = &derived_object;
    Derived *result = dynamic_cast<Derived *>(base);
    report(reinterpret_cast<uintptr_t>(&derived_object), result);
    return 0;
}

// 1. A downcast through a multiple-inheritance object reads the VMI base entries.
__attribute__((noinline)) int case_both() {
    Left *left = &both_object;
    Both *result = dynamic_cast<Both *>(left);
    report(reinterpret_cast<uintptr_t>(&both_object), result);
    return 0;
}

// 2. A cross-cast to the second base reads the adjusted subobject through the VMI entry.
__attribute__((noinline)) int case_cross() {
    Left *left = &both_object;
    Right *result = dynamic_cast<Right *>(left);
    report(reinterpret_cast<uintptr_t>(static_cast<Right *>(&both_object)), result);
    return 0;
}

// 3. A downcast from a virtual base reads a displacement through the VFull object's vptrs.
__attribute__((noinline)) int case_virtual_full() {
    VBase *base = static_cast<VBase *>(&vfull_object);
    VSide *result = dynamic_cast<VSide *>(base);
    report(reinterpret_cast<uintptr_t>(static_cast<VSide *>(&vfull_object)), result);
    return 0;
}

// 4. A walk of nine nested classes exceeds the depth budget, so the cast must halt.
__attribute__((noinline)) int case_depth_limit() {
    Ch0 *base = static_cast<Ch0 *>(&chain8_object);
    Ch8 *result = dynamic_cast<Ch8 *>(base);
    report(reinterpret_cast<uintptr_t>(&chain8_object), result);
    return 0;
}

// 5. A walk of eight nested classes is within the depth budget.
__attribute__((noinline)) int case_depth_ok() {
    Ch0 *base = static_cast<Ch0 *>(&chain7_object);
    Ch7 *result = dynamic_cast<Ch7 *>(base);
    report(reinterpret_cast<uintptr_t>(&chain7_object), result);
    return 0;
}

// 6. A walk of the seven-level lattice from its top class exceeds the edge budget, so it halts.
__attribute__((noinline)) int case_edge_limit() {
    Lt0_0 *base = static_cast<Lt0_0 *>(&lattice6_object);
    Lt6_0 *result = dynamic_cast<Lt6_0 *>(base);
    report(reinterpret_cast<uintptr_t>(&lattice6_object), result);
    return 0;
}

// 7. A walk of the lattice from a level-five root is within the edge budget.
__attribute__((noinline)) int case_edge_ok() {
    Lt0_0 *base = static_cast<Lt0_0 *>(&lattice5_object);
    Lt5_0 *result = dynamic_cast<Lt5_0 *>(base);
    report(reinterpret_cast<uintptr_t>(&lattice5_object), result);
    return 0;
}

// 8. A valid cast to an unrelated class has no target, so its result is null.
__attribute__((noinline)) int case_nonmatching() {
    Base *base = &derived_object;
    Unrelated *result = dynamic_cast<Unrelated *>(base);
    report(0, result);
    return 0;
}

// 9-11. A runtime vptr of zero, two, or one leaves no room for the RTTI slot, so the cast halts.
__attribute__((noinline)) int case_vptr(uint32_t vptr) {
    write_vptr(&derived_object, vptr);
    Base *base = &derived_object;
    Derived *result = dynamic_cast<Derived *>(base);
    report(reinterpret_cast<uintptr_t>(&derived_object), result);
    return 0;
}

// 12. A virtual-base slot that overflows the 24-bit space, with the vptr of the complete VSide.
__attribute__((noinline)) int case_slot_overflow() {
    write_vptr(&vside_object, 0x800001u);
    VBase *base = static_cast<VBase *>(&vside_object);
    VSide *result = dynamic_cast<VSide *>(base);
    report(reinterpret_cast<uintptr_t>(&vside_object), result);
    return 0;
}

// 13. A virtual base of the complete VSide object reads its displacement from the VSide vtable.
__attribute__((noinline)) int case_virtual_base() {
    VBase *base = static_cast<VBase *>(&vside_object);
    VSide *result = dynamic_cast<VSide *>(base);
    report(reinterpret_cast<uintptr_t>(&vside_object), result);
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    switch (read_corruption_case()) {
    case 0: return case_derived();
    case 1: return case_both();
    case 2: return case_cross();
    case 3: return case_virtual_full();
    case 4: return case_depth_limit();
    case 5: return case_depth_ok();
    case 6: return case_edge_limit();
    case 7: return case_edge_ok();
    case 8: return case_nonmatching();
    case 9: return case_vptr(0x000000u);
    case 10: return case_vptr(0x000002u);
    case 11: return case_vptr(0x000001u);
    case 12: return case_slot_overflow();
    case 13: return case_virtual_base();
    default: return 1;
    }
}
