#include <new>

static char destruction_order[4];
static int destruction_count;

static void record(char value) {
    destruction_order[destruction_count++] = value;
}

struct First {
    virtual ~First();
};

struct Second {
    virtual ~Second();
};

struct Member {
    ~Member();
};

struct Derived : First, Second {
    ~Derived() override;
    Member member;
};

First::~First() { record('F'); }
Second::~Second() { record('S'); }
Member::~Member() { record('M'); }
Derived::~Derived() { record('D'); }

__attribute__((noinline)) static void destroy_second(Second* object) {
    object->~Second();
}

extern "C" int avm_test_main() {
    alignas(Derived) unsigned char storage[sizeof(Derived)];
    Derived* object = ::new (storage) Derived;
    Second* secondary_base = object;
    if (reinterpret_cast<void*>(secondary_base) ==
        reinterpret_cast<void*>(object))
        return 1;
    destroy_second(secondary_base);
    if (destruction_count != 4)
        return 2;
    if (destruction_order[0] != 'D' || destruction_order[1] != 'M' ||
        destruction_order[2] != 'S' || destruction_order[3] != 'F')
        return 3;
    return 0;
}
