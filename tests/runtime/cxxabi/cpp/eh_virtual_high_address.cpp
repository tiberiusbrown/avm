// Virtual base catches with the class's vtable and descriptors above program address 0xFFFF.
// The image places .rodata above the 16-bit range, so the vtable that the thrown object's
// vptr names, and the RTTI of each class, need the upper program-address byte. The vptr is
// read from RAM as three bytes, and its slot is read from flash above 0xFFFF. The distractor
// clause comes first, so only the virtual base may match.
extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

void *constructed;

struct Far {
    int a;
    Far(int v) : a(v) {}
};

struct Farther : virtual Far {
    int b;
    Farther(int v) : Far(v), b(v + 1) { constructed = this; }
};

struct Distractor {
    int d;
};

__attribute__((noinline)) void throw_farther() {
    throw Farther(4);
}

__attribute__((noinline)) int catch_far() {
    try {
        throw_farther();
    } catch (Distractor &) {
        return 1;
    } catch (Far &far) {
        expect(&far == static_cast<Far *>(static_cast<Farther *>(constructed)));
        return far.a == 4 ? 2 : 3;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(catch_far() == 2);
    return failures == 0 ? 0 : 1;
}
