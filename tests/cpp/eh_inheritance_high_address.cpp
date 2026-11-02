// Base catches with descriptors above program address 0xFFFF. The image places .rodata
// above the 16-bit range, so the thrown class, both of its bases, and their descriptors
// lie there. A nonzero-offset base catch must find the complete 24-bit descriptor, and
// the handler must receive the subobject two bytes into the object. The distractor
// clause comes first, so a match must be the exact base.
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

struct Farther {
    int b;
    Farther(int v) : b(v) {}
};

struct Both : Far, Farther {
    int c;
    Both(int x, int y, int z) : Far(x), Farther(y), c(z) { constructed = this; }
};

struct Distractor {
    int d;
};

__attribute__((noinline)) void throw_both() {
    throw Both(4, 5, 6);
}

__attribute__((noinline)) int catch_farther() {
    try {
        throw_both();
    } catch (Distractor &) {
        return 1;
    } catch (Farther &f) {
        expect(&f == static_cast<Farther *>(static_cast<Both *>(constructed)));
        return f.b == 5 ? 2 : 3;
    }
    return 0;
}

__attribute__((noinline)) int catch_far() {
    try {
        throw_both();
    } catch (Far &far) {
        expect(&far == static_cast<Far *>(static_cast<Both *>(constructed)));
        return far.a == 4 ? 2 : 3;
    }
    return 0;
}

__attribute__((noinline)) int catch_exact() {
    try {
        throw_both();
    } catch (Distractor &) {
        return 1;
    } catch (const Both &both) {
        return both.c == 6 ? 2 : 3;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(catch_farther() == 2);
    expect(catch_far() == 2);
    expect(catch_exact() == 2);
    return failures == 0 ? 0 : 1;
}
