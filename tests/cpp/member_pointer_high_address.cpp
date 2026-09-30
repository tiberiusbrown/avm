struct First {
    virtual int first();
};

struct Target {
    int bias;
    int run(int value);
    virtual int fallback(int value);
};

struct Derived : First, Target {};

int First::first() { return 1; }
int Target::fallback(int value) { return value + 3; }

// The linker places this function above the 16-bit data-address range.
__attribute__((noinline, section(".high_member_text")))
int Target::run(int value) { return value + bias; }

static_assert(sizeof(int (Target::*)(int)) == 5,
              "member function pointers store a 24-bit code address");

int (Target::*volatile nonvirtual_method)(int) = &Target::run;
int (Target::*volatile virtual_method)(int) = &Target::fallback;

extern "C" int avm_test_main() {
    Derived object;
    object.bias = 17;

    int (Target::*method)(int) = nonvirtual_method;
    if (!method || (object.*method)(5) != 22)
        return 1;

    int (Derived::*adjusted)(int) = method;
    if ((object.*adjusted)(6) != 23)
        return 2;

    method = virtual_method;
    if ((object.*method)(5) != 8)
        return 3;

    if (method == nonvirtual_method)
        return 4;
    return 0;
}
