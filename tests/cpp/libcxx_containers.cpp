#include <array>
#include <cstddef>
#include <deque>
#include <forward_list>
#include <list>
#include <map>
#include <memory>
#include <queue>
#include <set>
#include <stack>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace {

alignas(std::max_align_t) unsigned char allocator_storage[64];
std::size_t allocator_offset;

void reset_allocator() { allocator_offset = 0; }

using standard_unordered_map = std::unordered_map<int, int>;
alignas(standard_unordered_map)
unsigned char standard_unordered_map_storage[sizeof(standard_unordered_map)];
using standard_queue = std::queue<int>;
alignas(standard_queue) unsigned char standard_queue_storage[sizeof(standard_queue)];

template<class T>
struct arena_allocator {
    using value_type = T;

    template<class U>
    struct rebind { using other = arena_allocator<U>; };

    arena_allocator() = default;
    template<class U>
    arena_allocator(const arena_allocator<U>&) noexcept {}

    T* allocate(std::size_t count)
    {
        const std::size_t aligned =
            (allocator_offset + alignof(T) - 1) & ~(alignof(T) - 1);
        const std::size_t bytes = count * sizeof(T);
        if(aligned + bytes > sizeof(allocator_storage))
            __builtin_trap();
        allocator_offset = aligned + bytes;
        return reinterpret_cast<T*>(allocator_storage + aligned);
    }

    void deallocate(T*, std::size_t) noexcept {}

    template<class U>
    bool operator==(const arena_allocator<U>&) const noexcept { return true; }
};

int vector_test()
{
    reset_allocator();
    std::vector<int, arena_allocator<int>> values;
    values.push_back(1);
    values.push_back(2);
    values.push_back(3);
    if(values.size() != 3 || values.front() != 1 || values.back() != 3 ||
       values[1] != 2)
        return 1;
    values.pop_back();
    return values.size() == 2 ? 0 : 2;
}

int adaptor_test()
{
    reset_allocator();
    using storage_type = std::vector<int, arena_allocator<int>>;
    std::stack<int, storage_type> values;
    values.push(21);
    values.push(22);
    if(values.top() != 22)
        return 1;
    values.pop();
    return values.top() == 21 ? 0 : 2;
}

int standard_vector_test()
{
    std::vector<int> values;
    values.push_back(31);
    values.push_back(32);
    values.push_back(values.front());
    return values.size() == 3 && values[0] == 31 && values[1] == 32 &&
        values.back() == 31 ? 0 : 1;
}

int deque_test()
{
    using container_type = std::deque<int>;
    alignas(container_type) static unsigned char storage[sizeof(container_type)];
    auto& values = *std::construct_at(reinterpret_cast<container_type*>(storage));
    values.push_back(42);
    const int result = values.size() == 1 && values.front() == 42 ? 0 : 1;
    std::destroy_at(std::addressof(values));
    return result;
}

int deque_front_test()
{
    using container_type = std::deque<int>;
    alignas(container_type) static unsigned char storage[sizeof(container_type)];
    auto& values = *std::construct_at(reinterpret_cast<container_type*>(storage));
    values.push_front(42);
    values.push_front(41);
    values.push_back(43);
    const int result = values.size() == 3 && values.front() == 41 && values.back() == 43 ? 0 : 1;
    std::destroy_at(std::addressof(values));
    return result;
}

int list_test()
{
    std::list<int> values;
    values.push_back(51);
    values.push_back(52);
    return values.size() == 2 && values.front() == 51 && values.back() == 52 ? 0 : 1;
}

int forward_list_test()
{
    std::forward_list<int> values;
    values.push_front(62);
    values.push_front(61);
    return values.front() == 61 && *values.begin() == 61 ? 0 : 1;
}

int map_test()
{
    using container_type = std::map<int, int>;
    alignas(container_type) static unsigned char storage[sizeof(container_type)];
    auto& values = *std::construct_at(reinterpret_cast<container_type*>(storage));
    values[1] = 71;
    values[2] = 72;
    const int result = values.size() == 2 && values.find(2)->second == 72 ? 0 : 1;
    std::destroy_at(std::addressof(values));
    return result;
}

int set_test()
{
    using container_type = std::set<int>;
    alignas(container_type) static unsigned char storage[sizeof(container_type)];
    auto& values = *std::construct_at(reinterpret_cast<container_type*>(storage));
    values.insert(81);
    values.insert(82);
    const int result = values.size() == 2 && values.find(82) != values.end() ? 0 : 1;
    std::destroy_at(std::addressof(values));
    return result;
}

__attribute__((noinline)) int unordered_map_test()
{
    auto* values = std::construct_at(
        reinterpret_cast<standard_unordered_map*>(standard_unordered_map_storage));
    (*values)[1] = 91;
    (*values)[2] = 92;
    const int result = values->size() == 2 && values->find(2)->second == 92 ? 0 : 1;
    std::destroy_at(values);
    return result;
}

int unordered_set_test()
{
    using container_type = std::unordered_set<int>;
    alignas(container_type) static unsigned char storage[sizeof(container_type)];
    auto& values = *std::construct_at(reinterpret_cast<container_type*>(storage));
    values.insert(101);
    values.insert(102);
    const int result = values.size() == 2 && values.find(102) != values.end() ? 0 : 1;
    std::destroy_at(std::addressof(values));
    return result;
}

int queue_test()
{
    auto* values = std::construct_at(
        reinterpret_cast<standard_queue*>(standard_queue_storage));
    values->push(111);
    int result = values->front() == 111 && values->back() == 111 && values->size() == 1
        ? 0 : 1;
    values->pop();
    if(!values->empty())
        result = 2;
    std::destroy_at(values);
    return result;
}

int priority_queue_test()
{
    using container_type = std::priority_queue<int>;
    alignas(container_type) static unsigned char storage[sizeof(container_type)];
    auto& values = *std::construct_at(reinterpret_cast<container_type*>(storage));
    values.push(121);
    values.push(122);
    const int result = values.top() == 122 ? 0 : 1;
    std::destroy_at(std::addressof(values));
    return result;
}

}

extern "C" int avm_test_main()
{
    static constexpr std::array<int, 3> fixed{1, 2, 3};
    if(fixed.front() != 1 || fixed.back() != 3 || fixed.size() != 3)
        return 1;
    if(vector_test() != 0)
        return 2;
    if(adaptor_test() != 0 || standard_vector_test() != 0 || deque_test() != 0 ||
       deque_front_test() != 0 || list_test() != 0 || forward_list_test() != 0 || map_test() != 0 ||
       set_test() != 0 || unordered_map_test() != 0 || unordered_set_test() != 0 ||
       queue_test() != 0 || priority_queue_test() != 0)
        return 3;
    return 0;
}
