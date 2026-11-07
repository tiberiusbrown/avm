#include <__split_buffer>
#include <cstddef>
#include <limits>
#include <map>
#include <memory>
#include <unordered_map>
#include <unordered_set>
#include <type_traits>
#include <utility>
#include <vector>

namespace {

constexpr bool constexpr_vector_growth()
{
    std::vector<int> values;
    values.push_back(7);
    values.push_back(values.front());
    return values.size() == 2 && values[0] == 7 && values[1] == 7;
}

static_assert(constexpr_vector_growth());

alignas(std::max_align_t) unsigned char arena[192];
std::size_t arena_offset;
unsigned allocations;
unsigned constructions;
unsigned destructions;

void reset_arena()
{
    if(allocations != 0 || constructions != destructions)
        __builtin_trap();
    arena_offset = 0;
    constructions = destructions = 0;
}

template<class T>
struct checked_allocator {
    using value_type = T;
    checked_allocator() = default;
    template<class U>
    checked_allocator(const checked_allocator<U>&) noexcept {}

    T* allocate(std::size_t n)
    {
        const auto bytes = n * sizeof(T);
        if(arena_offset + sizeof(std::size_t) + bytes > sizeof(arena))
            __builtin_trap();
        auto* header = reinterpret_cast<std::size_t*>(arena + arena_offset);
        *header = n;
        arena_offset += sizeof(std::size_t) + bytes;
        ++allocations;
        return reinterpret_cast<T*>(header + 1);
    }

    std::allocation_result<T*> allocate_at_least(std::size_t n)
    {
        return {allocate(n + 1), n + 1};
    }

    void deallocate(T* p, std::size_t n) noexcept
    {
        auto* header = reinterpret_cast<std::size_t*>(p) - 1;
        if(*header != n || n == 0 || allocations == 0)
            __builtin_trap();
        *header = 0;
        --allocations;
    }

    template<class U, class... Args>
    void construct(U* p, Args&&... args)
    {
        ::new (static_cast<void*>(p)) U(std::forward<Args>(args)...);
        ++constructions;
    }

    template<class U>
    void destroy(U* p) noexcept
    {
        std::destroy_at(p);
        ++destructions;
    }

    template<class U>
    bool operator==(const checked_allocator<U>&) const noexcept { return true; }
};

__attribute__((noinline)) int vector_growth()
{
    reset_arena();
    std::vector<int, checked_allocator<int>> values;
    values.push_back(11);
    values.push_back(12);
    values.push_back(values.front());
    values.push_back(14);
    values.push_back(15);
    values.push_back(values.front());
    return values.size() == 6 && values[0] == 11 && values[2] == 11 &&
        values[5] == 11 && values.capacity() >= 6 ? 0 : 1;
}

using tree_type = std::map<int, int, std::less<int>,
    checked_allocator<std::pair<const int, int>>>;
alignas(tree_type) unsigned char tree_storage[sizeof(tree_type)];
tree_type* tree_values;

__attribute__((noinline)) void tree_setup()
{
    reset_arena();
    tree_values = std::construct_at(reinterpret_cast<tree_type*>(tree_storage));
    tree_values->emplace(1, 11);
    tree_values->emplace(std::pair{2, 22});
}

__attribute__((noinline)) int tree_duplicate()
{
    return tree_values->emplace_hint(tree_values->begin(), 1, 99)->second == 11 &&
        constructions == 2 ? 0 : 1;
}

__attribute__((noinline)) int tree_converted()
{
    return tree_values->emplace_hint(tree_values->end(), 1L, 99)->second == 11 &&
        tree_values->size() == 2 && constructions == 3 && destructions == 1 ? 0 : 1;
}

struct collision_hash {
    std::size_t operator()(int key) const noexcept { return key % 2; }
};

__attribute__((noinline)) int hash_rehash()
{
    reset_arena();
    using allocator = checked_allocator<std::pair<const int, int>>;
    using container_type = std::unordered_map<int, int, collision_hash, std::equal_to<int>, allocator>;
    alignas(container_type) static unsigned char storage[sizeof(container_type)];
    auto& values = *std::construct_at(reinterpret_cast<container_type*>(storage));
    values.max_load_factor(std::numeric_limits<float>::infinity());
    for(int key = 0; key != 4; ++key)
        values.emplace(key, key + 11);
    values.max_load_factor(1.0f);
    values.rehash(11);
    if(values.bucket_count() < 11)
        return 1;
    values.rehash(4);
    values.rehash(0);
    for(int key = 0; key != 4; ++key) {
        if(values.at(key) != key + 11)
            return 2;
    }
    if(values.emplace(1, 99).second || constructions != 4)
        return 3;
    if(values.emplace(1L, 99).second || constructions != 5 || destructions != 1)
        return 4;
    const int result = values.size() == 4 ? 0 : 5;
    std::destroy_at(std::addressof(values));
    return result;
}

struct hidden_value {
    int value;
private:
    explicit hidden_value(int v) noexcept : value(v) {}
    template<class> friend struct checked_allocator;
public:
    hidden_value(const hidden_value&) = default;
    bool operator==(const hidden_value&) const = default;
};

struct hidden_hash {
    std::size_t operator()(const hidden_value& value) const noexcept { return value.value; }
};

__attribute__((noinline)) int private_construction()
{
    reset_arena();
    std::unordered_set<hidden_value, hidden_hash, std::equal_to<hidden_value>,
        checked_allocator<hidden_value>> values;
    auto result = values.emplace(7);
    return result.second && result.first->value == 7 ? 0 : 1;
}

using function_pointer = int(*)() noexcept;
static_assert(sizeof(function_pointer) == 3);
int spare_0() noexcept { return 0; }
int spare_1() noexcept { return 1; }
int spare_2() noexcept { return 2; }
int spare_3() noexcept { return 3; }
int spare_4() noexcept { return 4; }
int spare_5() noexcept { return 5; }
int spare_6() noexcept { return 6; }
function_pointer function_spares[] = {spare_0, spare_1, spare_2, spare_3, spare_4, spare_5, spare_6};
int integer_spares[] = {-1, 0, 1, 2, 3, 4, 5};

template<class T>
__attribute__((noinline)) int split_buffer_spares(T* expected)
{
    reset_arena();
    checked_allocator<T> allocator;
    std::__split_buffer<T, checked_allocator<T>, std::__split_buffer_pointer_layout> values(allocator);
    values.__avm_allocate_empty(6, 3);
    // Seven slots: fill the back, then force an overlapping shift each way.
    for(int value = 1; value != 6; ++value)
        values.__emplace_back_with_spare(expected[value + 1]);
    values.__emplace_front_with_spare(expected[1]);
    values.__emplace_front_with_spare(expected[0]);
    for(int i = 0; i != 7; ++i) {
        if(values.begin()[i] != expected[i])
            return 1;
        if constexpr (std::is_same_v<T, function_pointer>) {
            if(values.begin()[i]() != i)
                return 3;
        }
    }
    return values.size() == 7 && values.capacity() == 7 ? 0 : 2;
}

}

extern "C" int avm_test_main()
{
    if(vector_growth() != 0)
        return 1;
    tree_setup();
    if(tree_duplicate() != 0 || tree_converted() != 0)
        return 2;
    std::destroy_at(tree_values);
    if(hash_rehash() != 0)
        return 3;
    if(split_buffer_spares(integer_spares) != 0)
        return 4;
    if(split_buffer_spares(function_spares) != 0)
        return 4;
    if(private_construction() != 0)
        return 5;
    reset_arena();
    return 0;
}
