#include <cstdlib>
#include <deque>
#include <forward_list>
#include <list>
#include <map>
#include <memory>
#include <new>
#include <queue>
#include <set>
#include <stack>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace {

bool fail_next_allocation;

template<class Container, class Operation>
int expect_allocation_failure(Container& container, Operation operation)
{
    fail_next_allocation = true;
    try {
        operation(container);
    } catch(const std::bad_alloc&) {
        return container.empty() ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
}

template<class Container, class Operation>
__attribute__((noinline)) int test_container(Operation operation)
{
    // Each instantiation runs once. Keep its holder off the allocation/throw
    // stack path, but retain construction and destruction around the test.
    alignas(Container) static unsigned char storage[sizeof(Container)];
    auto* container = std::construct_at(reinterpret_cast<Container*>(storage));
    const int result = expect_allocation_failure(*container, operation);
    std::destroy_at(container);
    return result;
}

int sequence_containers()
{
    if(test_container<std::vector<int>>([](auto& c) { c.push_back(1); }) != 0)
        return 1;
    if(test_container<std::deque<int>>([](auto& c) { c.push_back(1); }) != 0)
        return 2;
    if(test_container<std::list<int>>([](auto& c) { c.push_back(1); }) != 0)
        return 3;
    return test_container<std::forward_list<int>>(
        [](auto& c) { c.push_front(1); }) == 0 ? 0 : 4;
}

int associative_containers()
{
    if(test_container<std::map<int, int>>(
           [](auto& c) { c.try_emplace(1, 2); }) != 0)
        return 1;
    if(test_container<std::set<int>>(
           [](auto& c) { c.insert(1); }) != 0)
        return 2;
    if(test_container<std::unordered_map<int, int>>(
           [](auto& c) { c.try_emplace(1, 2); }) != 0)
        return 3;
    return test_container<std::unordered_set<int>>(
        [](auto& c) { c.insert(1); }) == 0 ? 0 : 4;
}

int adaptors()
{
    if(test_container<std::stack<int, std::vector<int>>>(
           [](auto& c) { c.push(1); }) != 0)
        return 1;
    if(test_container<std::queue<int, std::vector<int>>>(
           [](auto& c) { c.push(1); }) != 0)
        return 2;
    return test_container<std::priority_queue<int, std::vector<int>>>(
        [](auto& c) { c.push(1); }) == 0 ? 0 : 3;
}

struct move_value {
    int value;
    explicit move_value(int v) noexcept : value(v) {}
    move_value(const move_value&) = delete;
    move_value(move_value&& other) noexcept : value(other.value) { other.value = -1; }
};

__attribute__((noinline)) int duplicate_key()
{
    using container_type = std::unordered_map<int, move_value>;
    alignas(container_type) static unsigned char storage[sizeof(container_type)];
    auto* container = std::construct_at(reinterpret_cast<container_type*>(storage));
    container->try_emplace(7, 17);
    move_value candidate(23);
    int result = 0;
    fail_next_allocation = true;
    try {
        auto inserted = container->try_emplace(7, std::move(candidate));
        if(inserted.second || inserted.first->second.value != 17 ||
           candidate.value != 23 || !fail_next_allocation)
            result = 1;
    } catch(...) {
        result = 2;
    }
    fail_next_allocation = false;
    std::destroy_at(container);
    return result;
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
    if(sequence_containers() != 0)
        return 1;
    if(associative_containers() != 0)
        return 2;
    if(duplicate_key() != 0)
        return 4;
    return adaptors() == 0 ? 0 : 3;
}
