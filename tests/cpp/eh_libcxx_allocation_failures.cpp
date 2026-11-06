#include <any>
#include <cstdlib>
#include <functional>
#include <memory>
#include <new>

namespace {

bool fail_next_allocation;

struct large_payload {
    unsigned char bytes[24];
};

struct large_callable {
    unsigned char bytes[24];
    int operator()() const { return 41; }
};

int any_assignment_failure()
{
    std::any value = 19;
    large_payload payload{};
    fail_next_allocation = true;
    try {
        value = payload;
    } catch(const std::bad_alloc&) {
        return std::any_cast<int>(value) == 19 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
}

int function_assignment_failure()
{
    std::function<int()> value = [] { return 17; };
    fail_next_allocation = true;
    try {
        value = large_callable{};
    } catch(const std::bad_alloc&) {
        return value() == 17 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
}

int shared_allocation_failure()
{
    fail_next_allocation = true;
    try {
        (void)std::make_shared<int>(23);
    } catch(const std::bad_alloc&) {
        return 0;
    } catch(...) {
        return 1;
    }
    return 2;
}

}

void* operator new(std::size_t size)
{
    if(fail_next_allocation) {
        fail_next_allocation = false;
        throw std::bad_alloc();
    }
    if(void* memory = std::malloc(size))
        return memory;
    throw std::bad_alloc();
}

void operator delete(void* memory) noexcept
{
    std::free(memory);
}

void operator delete(void* memory, std::size_t) noexcept
{
    std::free(memory);
}

extern "C" int avm_test_main()
{
    if(any_assignment_failure() != 0)
        return 1;
    if(function_assignment_failure() != 0)
        return 2;
    return shared_allocation_failure() == 0 ? 0 : 3;
}
