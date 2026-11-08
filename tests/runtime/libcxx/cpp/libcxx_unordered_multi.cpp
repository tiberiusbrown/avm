#include <limits>
#include <memory>
#include <unordered_map>
#include <unordered_set>

namespace {

struct collision_hash {
    std::size_t operator()(int key) const noexcept { return key % 2; }
};

using map_type = std::unordered_multimap<int, int, collision_hash>;
using set_type = std::unordered_multiset<int, collision_hash>;
alignas(map_type) unsigned char map_storage[sizeof(map_type)];
map_type* values;
alignas(set_type) unsigned char set_storage[sizeof(set_type)];
set_type* set;

__attribute__((noinline)) void setup()
{
    values = std::construct_at(reinterpret_cast<map_type*>(map_storage));
    values->max_load_factor(std::numeric_limits<float>::infinity());
    values->emplace(1, 17);
    values->emplace(3, 31);
    values->emplace(1, 18);
    values->emplace(5, 51);
}

__attribute__((noinline)) void hinted_insert()
{
    values->emplace_hint(values->find(1), 1, 19);
    values->max_load_factor(1.0f);
}

__attribute__((noinline)) int check_map()
{
    if(values->size() != 5 || values->count(1) != 3 || values->count(3) != 1)
        return 1;
    int sum = 0;
    unsigned visited = 0;
    for(auto it = values->begin(values->bucket(1));
        it != values->end(values->bucket(1)); ++it) {
        if(it->first == 1)
            sum += it->second;
        ++visited;
    }
    return sum == 54 && visited == 5 ? 0 : 2;
}

__attribute__((noinline)) int rehash()
{
    // Rehash must preserve the order of existing equivalent elements.
    int old_order[3];
    unsigned index = 0;
    for(auto& entry : *values)
        if(entry.first == 1)
            old_order[index++] = entry.second;
    values->rehash(11);
    values->max_load_factor(1.0f);
    values->rehash(0);
    index = 0;
    for(auto& entry : *values)
        if(entry.first == 1 && old_order[index++] != entry.second)
            return 1;
    return values->bucket_count() >= 5 && index == 3 ? 0 : 2;
}

__attribute__((noinline)) void multiset_setup()
{
    set = std::construct_at(reinterpret_cast<set_type*>(set_storage));
    set->emplace(1);
    set->emplace(3);
}

__attribute__((noinline)) void multiset_hint()
{
    set->emplace_hint(set->find(1), 1);
}

__attribute__((noinline)) int multiset_check()
{
    const int result = set->size() == 3 && set->count(1) == 2 ? 0 : 1;
    std::destroy_at(set);
    return result;
}

}

extern "C" int avm_test_main()
{
    setup();
    hinted_insert();
    if(check_map() != 0 || rehash() != 0 || check_map() != 0)
        return 1;
    std::destroy_at(values);
    multiset_setup();
    multiset_hint();
    return multiset_check() == 0 ? 0 : 2;
}
