#include <any>
#include <cstdlib>
#include <functional>
#include <memory>
#include <new>
#include <tuple>
#include <utility>

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

unsigned live_members;

struct first_member {
    first_member() noexcept { ++live_members; }
    ~first_member() { --live_members; }
};

struct throwing_member {
    explicit throwing_member(int) { throw 17; }
};

__attribute__((noinline)) int pair_construction_failure()
{
    using value_type = std::pair<first_member, throwing_member>;
    alignas(value_type) static unsigned char storage[sizeof(value_type)];
    std::allocator<value_type> allocator;
    try {
        std::allocator_traits<decltype(allocator)>::construct(allocator,
            reinterpret_cast<value_type*>(storage), std::piecewise_construct,
            std::tuple<>(), std::forward_as_tuple(1));
    } catch(int value) {
        return value == 17 && live_members == 0 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
}

struct throwing_allocator {
    using value_type = int;
    template<class U, class... Args>
    void construct(U*, Args&&...) { throw 23; }
};

__attribute__((noinline)) int allocator_hook_failure()
{
    throwing_allocator allocator;
    alignas(int) static unsigned char storage[sizeof(int)];
    try {
        std::allocator_traits<throwing_allocator>::construct(allocator,
            reinterpret_cast<int*>(storage), 7);
    } catch(int value) {
        return value == 23 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
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
    if(shared_allocation_failure() != 0)
        return 3;
    if(pair_construction_failure() != 0)
        return 4;
    return allocator_hook_failure() == 0 ? 0 : 5;
}
