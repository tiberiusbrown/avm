#include <cstdlib>
#include <deque>
#include <forward_list>
#include <list>
#include <map>
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
int test_container(Operation operation)
{
    Container container;
    return expect_allocation_failure(container, operation);
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
    return adaptors() == 0 ? 0 : 3;
}
