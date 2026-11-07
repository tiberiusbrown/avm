#include <any>
#include <cstdlib>
#include <functional>
#include <memory>
#include <new>

namespace {

bool fail_next_allocation;

struct large_payload {
    // Larger than the wrapper, so assignment must allocate out of line.
    unsigned char bytes[sizeof(std::any) + 1];
};

struct large_callable {
    // Force allocation without unnecessarily large by-value copies at O0.
    unsigned char bytes[sizeof(std::function<int()>) + 1];
    int operator()() const { return 41; }
};

// The failure test checks replacement of an existing target. Its holders need
// no automatic lifetime, so keep them out of the allocation/throw stack path.
std::function<int()> function_value = [] { return 17; };
const large_callable function_target{};
alignas(std::shared_ptr<int>)
unsigned char shared_storage[sizeof(std::shared_ptr<int>)];

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
    fail_next_allocation = true;
    try {
        function_value = function_target;
    } catch(const std::bad_alloc&) {
        return function_value() == 17 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
}

int shared_allocation_failure()
{
    fail_next_allocation = true;
    try {
        // Construct the returned holder directly in static storage, keeping
        // the allocation-failure path free of a temporary shared_ptr frame.
        ::new (static_cast<void*>(shared_storage))
            std::shared_ptr<int>(std::make_shared<int>());
        std::destroy_at(reinterpret_cast<std::shared_ptr<int>*>(shared_storage));
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
