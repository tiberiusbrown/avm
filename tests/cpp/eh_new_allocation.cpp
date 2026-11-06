// The allocation functions of <new>: scalar, array, nothrow, sized, and aligned forms,
// zero-size and over-aligned requests, the new_handler protocol, and bad_alloc from the
// throwing forms. The throwing paths need the exception runtime, so the fixture is built
// with -fexceptions.
#include <cstddef>
#include <cstdint>
#include <new>

extern "C" int avm_test_main(void);

namespace {

int handler_calls;

// Clears itself without freeing memory, so the retry fails and the request reports failure.
void clearing_handler() {
    ++handler_calls;
    std::set_new_handler(nullptr);
}

void throwing_handler() {
    throw std::bad_alloc();
}

struct Base {
    virtual ~Base() {}
    int value = 7;
};

struct Derived : Base {
    int extra = 11;
};

// Keeps each allocation live, so the heap fills and the throwing form has to fail.
volatile void *sink[64];

int test_basic_allocations() {
    int *one = new int(5);
    if (*one != 5)
        return 1;
    delete one;

    int *array = new int[3]{1, 2, 3};
    if (array[2] != 3)
        return 2;
    delete[] array;

    // A zero-size request returns a distinct non-null pointer, including the sized form.
    void *zero = ::operator new(0);
    void *zero_again = ::operator new(0);
    if (!zero || zero == zero_again)
        return 3;
    ::operator delete(zero);
    ::operator delete(zero_again, std::size_t(0));

    // Nothrow forms return a block on success, and the matching nothrow delete releases it.
    void *nothrow_block = ::operator new(16, std::nothrow);
    if (!nothrow_block)
        return 4;
    ::operator delete(nothrow_block, std::nothrow);
    void *nothrow_array = ::operator new[](16, std::nothrow);
    if (!nothrow_array)
        return 5;
    ::operator delete[](nothrow_array, std::nothrow);
    return 0;
}

int test_aligned_allocations() {
    // Over-aligned blocks are aligned, and a one-byte alignment uses the ordinary block.
    void *aligned = ::operator new(10, std::align_val_t(8));
    if (reinterpret_cast<std::uintptr_t>(aligned) % 8 != 0)
        return 6;
    ::operator delete(aligned, std::align_val_t(8));
    void *aligned_array = ::operator new[](3, std::align_val_t(4));
    if (reinterpret_cast<std::uintptr_t>(aligned_array) % 4 != 0)
        return 7;
    ::operator delete[](aligned_array, 3, std::align_val_t(4));
    void *aligned_nothrow = ::operator new(3, std::align_val_t(4), std::nothrow);
    if (!aligned_nothrow || reinterpret_cast<std::uintptr_t>(aligned_nothrow) % 4 != 0)
        return 8;
    ::operator delete(aligned_nothrow, std::align_val_t(4), std::nothrow);
    void *unit_aligned = ::operator new(5, std::align_val_t(1));
    if (!unit_aligned)
        return 9;
    ::operator delete(unit_aligned, std::align_val_t(1));

    // A deleting destructor reaches operator delete(void *, size_t) through a base pointer.
    Base *polymorphic = new Derived;
    if (polymorphic->value != 7)
        return 10;
    delete polymorphic;
    return 0;
}

int test_allocation_failures() {
    // With no handler installed, a failed nothrow request returns null.
    if (std::get_new_handler() != nullptr)
        return 11;
    void *too_big = ::operator new(60000, std::nothrow);
    if (too_big != nullptr)
        return 12;

    // A handler runs on each failure, and the retry follows it.
    std::new_handler previous = std::set_new_handler(clearing_handler);
    if (previous != nullptr || std::get_new_handler() != clearing_handler)
        return 13;
    too_big = ::operator new(60000, std::nothrow);
    if (too_big != nullptr || handler_calls != 1 || std::get_new_handler() != nullptr)
        return 14;

    // A handler that throws propagates bad_alloc out of the throwing form.
    std::set_new_handler(throwing_handler);
    try {
        void *big = ::operator new(60000);
        sink[0] = big;
        return 15;
    } catch (const std::bad_alloc &failure) {
        if (!failure.what() || failure.what()[0] != 's')
            return 16;
    }
    std::set_new_handler(nullptr);

    // Without a handler, the throwing form fills the heap, then throws bad_alloc.
    std::size_t blocks = 0;
    try {
        for (;;) {
            sink[blocks % 64] = ::operator new(512);
            ++blocks;
            if (blocks > 64)
                return 17;
        }
    } catch (const std::bad_alloc &) {
        if (blocks == 0)
            return 18;
    }

    // bad_array_new_length is a bad_alloc, and it reports its own description.
    try {
        throw std::bad_array_new_length();
    } catch (const std::bad_alloc &failure) {
        if (!failure.what() || failure.what()[0] != 's')
            return 19;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    int result = test_basic_allocations();
    if (result)
        return result;
    result = test_aligned_allocations();
    if (result)
        return result;
    return test_allocation_failures();
}
