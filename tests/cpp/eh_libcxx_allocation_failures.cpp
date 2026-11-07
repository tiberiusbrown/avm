#include <any>
#include <cstdlib>
#include <functional>
#include <memory>
#include <memory_resource>
#include <new>
#include <tuple>
#include <utility>

namespace {

bool fail_next_allocation;
unsigned live_allocations;
bool fail_copy;
unsigned moves_until_failure;

struct large_payload {
    // Larger than the wrapper, so assignment must allocate out of line.
    unsigned char bytes[24];
    int value;
};

struct large_callable {
    unsigned char bytes[24];
    int operator()() const { return 41; }
};

// The failure test checks replacement of an existing target. Its holders need
// no automatic lifetime, so keep them out of the allocation/throw stack path.
std::function<int()> function_value = [] { return 17; };
const large_callable function_target{};

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

int automatic_function_failure()
{
    large_callable target{};
    fail_next_allocation = true;
    try {
        std::function<int()> value = target;
        (void)value;
    } catch(const std::bad_alloc&) {
        return !fail_next_allocation && live_allocations == 0 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
}

int shared_allocation_failure()
{
    fail_next_allocation = true;
    try {
        auto value = std::make_shared<int>();
        (void)value;
    } catch(const std::bad_alloc&) {
        return 0;
    } catch(...) {
        return 1;
    }
    return 2;
}

struct throwing_callable {
    int value = 29;
    throwing_callable() = default;
    throwing_callable(throwing_callable&& other) : value(other.value)
    {
        if(moves_until_failure != 0 && --moves_until_failure == 0)
            throw 43;
    }
    throwing_callable(const throwing_callable& other) : value(other.value)
    {
        if(fail_copy)
            throw 31;
    }
    int operator()() const { return value; }
};

int function_copy_failure()
{
    std::function<int()> source = throwing_callable{};
    const auto before = live_allocations;
    fail_copy = true;
    try {
        auto copy = source;
        (void)copy;
    } catch(int value) {
        fail_copy = false;
        return value == 31 && source() == 29 && live_allocations == before ? 0 : 1;
    } catch(...) {
        fail_copy = false;
        return 2;
    }
    fail_copy = false;
    return 3;
}

int function_move_failure()
{
    throwing_callable target;
    // The by-value public constructor's move succeeds; moving into the
    // allocated target then throws and must reclaim that allocation.
    moves_until_failure = 2;
    try {
        std::function<int()> value = std::move(target);
        (void)value;
    } catch(int value) {
        return value == 43 && moves_until_failure == 0 && live_allocations == 0 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
}

struct throwing_object {
    throwing_object() { throw 37; }
};

int shared_construction_failure()
{
    try {
        auto value = std::make_shared<throwing_object>();
        (void)value;
    } catch(int value) {
        return value == 37 && live_allocations == 0 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
}

int resource_allocation_failure()
{
    fail_next_allocation = true;
    try {
        (void)std::pmr::new_delete_resource()->allocate(3, 1);
    } catch(const std::bad_alloc&) {
        return !fail_next_allocation && live_allocations == 0 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
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
    if(void* memory = std::malloc(size)) {
        ++live_allocations;
        return memory;
    }
    throw std::bad_alloc();
}

void operator delete(void* memory) noexcept
{
    if(memory)
        --live_allocations;
    std::free(memory);
}

void operator delete(void* memory, std::size_t) noexcept
{
    if(memory)
        --live_allocations;
    std::free(memory);
}

// new_delete_resource uses the aligned entry even for AVM's byte alignment.
void* operator new(std::size_t size, std::align_val_t) { return ::operator new(size); }
void operator delete(void* memory, std::align_val_t) noexcept { ::operator delete(memory); }
void operator delete(void* memory, std::size_t, std::align_val_t) noexcept { ::operator delete(memory); }

extern "C" int avm_test_main()
{
    if(any_assignment_failure() != 0)
        return 1;
    if(function_assignment_failure() != 0)
        return 2;
    if(shared_allocation_failure() != 0)
        return 3;
    if(automatic_function_failure() != 0)
        return 6;
    if(function_copy_failure() != 0)
        return 7;
    if(function_move_failure() != 0)
        return 10;
    if(shared_construction_failure() != 0)
        return 8;
    if(resource_allocation_failure() != 0)
        return 9;
    if(pair_construction_failure() != 0)
        return 4;
    return allocator_hook_failure() == 0 && live_allocations == 0 ? 0 : 5;
}
