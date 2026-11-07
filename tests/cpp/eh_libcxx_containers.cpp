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
#include <tuple>
#include <unordered_map>
#include <unordered_set>
#include <utility>
#include <vector>

namespace {

unsigned allocations_until_failure;
unsigned live_allocations;
unsigned live_values;

template<class Container, class Operation>
int expect_allocation_failure(Container& container, Operation operation)
{
    allocations_until_failure = 1;
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
    explicit move_value(int v) noexcept : value(v) { ++live_values; }
    move_value(const move_value&) = delete;
    move_value(move_value&& other) noexcept : value(other.value)
    {
        ++live_values;
        other.value = -1;
    }
    ~move_value() { --live_values; }
};

using move_map = std::unordered_map<int, move_value>;
// Reuse the holder across the sequential duplicate-insertion cases.
alignas(move_map) unsigned char duplicate_key_storage[sizeof(move_map)];

template<class Operation>
__attribute__((noinline)) int duplicate_key(Operation operation)
{
    auto* container = std::construct_at(reinterpret_cast<move_map*>(duplicate_key_storage));
    container->try_emplace(7, 17);
    move_value candidate(23);
    int result = 0;
    allocations_until_failure = 1;
    try {
        if(operation(*container, candidate) || candidate.value != 23 ||
           container->size() != 1 || container->at(7).value != 17 ||
           allocations_until_failure != 1)
            result = 1;
    } catch(...) {
        result = 2;
    }
    allocations_until_failure = 0;
    std::destroy_at(container);
    return result;
}

int duplicate_keys()
{
    if(duplicate_key([](auto& c, auto& v) {
           return c.try_emplace(7, std::move(v)).second;
       }) != 0)
        return 1;
    if(duplicate_key([](auto& c, auto& v) {
           return c.emplace(7, std::move(v)).second;
       }) != 0)
        return 2;
    if(duplicate_key([](auto& c, auto&) {
           std::pair<const int, move_value> pair{7, move_value{29}};
           return c.emplace(std::move(pair)).second || pair.second.value != 29;
       }) != 0)
        return 3;
    return duplicate_key([](auto& c, auto& v) {
        return c.emplace(std::piecewise_construct,
            std::forward_as_tuple(7), std::forward_as_tuple(std::move(v))).second;
    }) == 0 ? 0 : 4;
}

__attribute__((noinline)) int duplicate_set_key()
{
    std::unordered_set<int> container;
    container.emplace(7);
    allocations_until_failure = 1;
    int result = 0;
    try {
        if(container.emplace(7).second || allocations_until_failure != 1)
            result = 1;
    } catch(...) {
        result = 2;
    }
    allocations_until_failure = 0;
    return result;
}

__attribute__((noinline)) int converted_key()
{
    // A convertible key must be constructed before comparing it: extraction
    // only bypasses construction when the argument has the exact key type.
    std::unordered_map<int, int> container;
    container.emplace(7, 17);
    allocations_until_failure = 1;
    try {
        container.emplace(7L, 23);
    } catch(const std::bad_alloc&) {
        return container.size() == 1 && container.at(7) == 17 &&
            allocations_until_failure == 0 ? 0 : 1;
    } catch(...) {
        allocations_until_failure = 0;
        return 2;
    }
    allocations_until_failure = 0;
    return 3;
}

__attribute__((noinline)) int rehash_failure()
{
    using container_type = std::unordered_map<int, move_value>;
    alignas(container_type) static unsigned char storage[sizeof(container_type)];
    auto* container = std::construct_at(reinterpret_cast<container_type*>(storage));
    container->try_emplace(7, 17);
    const auto buckets = container->bucket_count();
    const auto allocations = live_allocations;
    container->max_load_factor(0.5f);
    int result = 0;
    // Allocate and construct the new node, then fail bucket allocation. Both
    // the old buckets and the old element must survive; the new node must not.
    allocations_until_failure = 2;
    try {
        container->try_emplace(11, 23);
        result = 1;
    } catch(const std::bad_alloc&) {
        if(allocations_until_failure != 0 || container->size() != 1 ||
           container->bucket_count() != buckets || container->at(7).value != 17 ||
           container->contains(11) || live_allocations != allocations || live_values != 1)
            result = 2;
    } catch(...) {
        result = 3;
    }
    allocations_until_failure = 0;
    // Also exercise successful growth after the failed attempt.
    container->try_emplace(11, 23);
    if(container->size() != 2 || container->at(11).value != 23 ||
       container->bucket_count() <= buckets || live_values != 2)
        result = 4;
    std::destroy_at(container);
    return result;
}

}

void* operator new(std::size_t size)
{
    if(allocations_until_failure != 0 && --allocations_until_failure == 0) {
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

extern "C" int avm_test_main()
{
    if(sequence_containers() != 0)
        return 1;
    if(associative_containers() != 0)
        return 2;
    if(duplicate_keys() != 0 || duplicate_set_key() != 0 || converted_key() != 0)
        return 4;
    if(rehash_failure() != 0 || live_allocations != 0 || live_values != 0)
        return 5;
    return adaptors() == 0 ? 0 : 3;
}
