// Class-typed throws across the Itanium class hierarchy forms. Each thrown type
// has a distinct flash-resident descriptor: a class with no bases, one nonvirtual
// base, several nonvirtual bases, a polymorphic class, and a class with a virtual
// base. The local object is destroyed by the cleanup during unwinding, the catch
// body runs next, and the exception object is destroyed when the catch ends. Each
// throw therefore logs its tag, then 90, then its tag again. Typed matching and
// base-class adjustment are not implemented, so every case uses catch(...).

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

volatile int log_entries[4];
volatile int log_count;

__attribute__((always_inline)) inline void log_append(int tag) {
    log_entries[log_count] = tag;
    log_count = log_count + 1;
}

struct Plain {
    int tag;
    Plain(int t) : tag(t) {}
    ~Plain() { log_append(tag); }
};

struct BaseA {
    int a;
};

struct BaseB {
    int b;
};

struct Single : BaseA {
    int tag;
    Single(int t) : tag(t) {}
    ~Single() { log_append(tag); }
};

struct Multiple : BaseA, BaseB {
    int tag;
    Multiple(int t) : tag(t) {}
    ~Multiple() { log_append(tag); }
};

struct Polymorphic {
    int tag;
    Polymorphic(int t) : tag(t) {}
    virtual int value() { return tag; }
    ~Polymorphic() { log_append(tag); }
};

struct VirtualBase : virtual BaseA {
    int tag;
    VirtualBase(int t) : tag(t) {}
    ~VirtualBase() { log_append(tag); }
};

template <typename T>
__attribute__((noinline)) int throw_and_catch(int tag) {
    log_count = 0;
    try {
        T value(tag);
        throw value;
    } catch (...) {
        log_append(90);
    }
    return log_count == 3 && log_entries[0] == tag && log_entries[1] == 90 &&
                   log_entries[2] == tag
               ? 1
               : 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(throw_and_catch<Plain>(1) == 1);
    expect(throw_and_catch<Single>(2) == 1);
    expect(throw_and_catch<Multiple>(3) == 1);
    expect(throw_and_catch<Polymorphic>(4) == 1);
    expect(throw_and_catch<VirtualBase>(5) == 1);
    return failures == 0 ? 0 : 1;
}
