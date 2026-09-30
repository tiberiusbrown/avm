static volatile int constructed;

struct interface {
    __attribute__((noinline)) interface();
    virtual int value() const = 0;
    virtual ~interface();
};

interface::interface() { ++constructed; }
interface::~interface() = default;

struct implementation : interface {
    int value() const override { return constructed == 1 ? 17 : 0; }
};

__attribute__((noinline)) static int dispatch(interface* base) {
    return base->value();
}

extern "C" int avm_test_main() {
    implementation object;
    interface* base = &object;
    return dispatch(base) == 17 ? 0 : 1;
}
