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
int case_result;
constexpr int one = 1;
constexpr int two = 2;
constexpr int duplicate = 7;
constexpr int initial_value = 17;
constexpr int new_key = 11;
constexpr int new_value = 23;

using int_map = std::map<int, int>;
using int_hash_map = std::unordered_map<int, int>;
using vector_stack = std::stack<int, std::vector<int>>;
using vector_queue = std::queue<int, std::vector<int>>;

// Keep the operation and its catch in the same small frame. Each holder is
// constructed and destroyed around the test; no forwarding callbacks stay on
// the allocation/throw path. Scalar arguments also need no automatic lifetime.
#define ALLOCATION_FAILURE_AT(Name, Container, Operation, Count)                \
__attribute__((noinline)) void Name()                                            \
{                                                                              \
    alignas(Container) static unsigned char storage[sizeof(Container)];          \
    static Container* container;                                               \
    container = std::construct_at(reinterpret_cast<Container*>(storage));        \
    case_result = 3;                                                           \
    allocations_until_failure = Count;                                         \
    try {                                                                     \
        Operation;                                                            \
    } catch(const std::bad_alloc&) {                                           \
        case_result = container->empty() ? 0 : 1;                              \
    } catch(...) {                                                            \
        case_result = 2;                                                       \
    }                                                                         \
    allocations_until_failure = 0;                                             \
    std::destroy_at(container);                                                \
}

#define ALLOCATION_FAILURE_CASE(Name, Container, Operation) \
    ALLOCATION_FAILURE_AT(Name, Container, Operation, 1)

ALLOCATION_FAILURE_CASE(fail_vector, std::vector<int>, container->push_back(one))
ALLOCATION_FAILURE_CASE(fail_deque, std::deque<int>, container->push_back(one))
ALLOCATION_FAILURE_CASE(fail_deque_front, std::deque<int>, container->push_front(one))
ALLOCATION_FAILURE_CASE(fail_list, std::list<int>, container->push_back(one))
ALLOCATION_FAILURE_CASE(fail_forward_list, std::forward_list<int>, container->push_front(one))
ALLOCATION_FAILURE_CASE(fail_map, int_map, container->try_emplace(one, two))
ALLOCATION_FAILURE_CASE(fail_set, std::set<int>, container->insert(one))
ALLOCATION_FAILURE_CASE(fail_hash_map, int_hash_map, container->try_emplace(one, two))
ALLOCATION_FAILURE_CASE(fail_hash_set, std::unordered_set<int>, container->insert(one))
ALLOCATION_FAILURE_CASE(fail_vector_stack, vector_stack, container->push(one))
ALLOCATION_FAILURE_CASE(fail_vector_queue, vector_queue, container->push(one))
ALLOCATION_FAILURE_CASE(fail_priority_queue, std::priority_queue<int>, container->push(one))
ALLOCATION_FAILURE_CASE(fail_default_stack, std::stack<int>, container->push(one))
ALLOCATION_FAILURE_CASE(fail_default_queue, std::queue<int>, container->push(one))
// The map allocation succeeds, then block allocation fails. Its temporary map
// must be reclaimed, including on the front-growth path.
ALLOCATION_FAILURE_AT(fail_deque_block, std::deque<int>, container->push_back(one), 2)
ALLOCATION_FAILURE_AT(fail_deque_front_block, std::deque<int>, container->push_front(one), 2)
#undef ALLOCATION_FAILURE_CASE
#undef ALLOCATION_FAILURE_AT

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
using move_pair = std::pair<const int, move_value>;
alignas(move_map) unsigned char map_storage[sizeof(move_map)];
alignas(move_value) unsigned char candidate_storage[sizeof(move_value)];
alignas(move_pair) unsigned char pair_storage[sizeof(move_pair)];
move_map* values;
move_value* candidate;
move_pair* pair_candidate;

__attribute__((noinline)) void prepare_map()
{
    values = std::construct_at(reinterpret_cast<move_map*>(map_storage));
    values->try_emplace(duplicate, initial_value);
}

__attribute__((noinline)) void prepare_candidates()
{
    candidate = std::construct_at(reinterpret_cast<move_value*>(candidate_storage), new_value);
    pair_candidate = std::construct_at(reinterpret_cast<move_pair*>(pair_storage), duplicate, 29);
    allocations_until_failure = 1;
    case_result = 0;
}

// These operations must not throw. An unexpected allocation throws through the
// scalar-only fixture and fails the image, without adding another catch frame.
__attribute__((noinline)) void duplicate_try_emplace()
{
    if(values->try_emplace(duplicate, std::move(*candidate)).second)
        case_result = 1;
}

__attribute__((noinline)) void duplicate_two_arguments()
{
    if(values->emplace(duplicate, std::move(*candidate)).second)
        case_result = 1;
}

__attribute__((noinline)) void duplicate_pair()
{
    if(values->emplace(std::move(*pair_candidate)).second)
        case_result = 1;
}

__attribute__((noinline)) void duplicate_piecewise()
{
    if(values->emplace(std::piecewise_construct,
            std::forward_as_tuple(duplicate),
            std::forward_as_tuple(std::move(*candidate))).second)
        case_result = 1;
}

__attribute__((noinline)) void finish_duplicate()
{
    if(candidate->value != new_value || pair_candidate->second.value != 29 ||
       values->size() != 1 || values->at(duplicate).value != initial_value ||
       allocations_until_failure != 1)
        case_result = 1;
    allocations_until_failure = 0;
    std::destroy_at(candidate);
    std::destroy_at(pair_candidate);
    std::destroy_at(values);
}

using int_set = std::unordered_set<int>;
alignas(int_set) unsigned char set_storage[sizeof(int_set)];
int_set* set_values;

__attribute__((noinline)) void prepare_set()
{
    set_values = std::construct_at(reinterpret_cast<int_set*>(set_storage));
    set_values->emplace(duplicate);
    allocations_until_failure = 1;
}

__attribute__((noinline)) int duplicate_set_key()
{
    case_result = set_values->emplace(duplicate).second || allocations_until_failure != 1;
    allocations_until_failure = 0;
    std::destroy_at(set_values);
    return case_result;
}

alignas(int_hash_map) unsigned char converted_storage[sizeof(int_hash_map)];
int_hash_map* converted_values;
constexpr long converted_key = duplicate;

__attribute__((noinline)) void prepare_converted()
{
    converted_values = std::construct_at(reinterpret_cast<int_hash_map*>(converted_storage));
    converted_values->emplace(duplicate, initial_value);
    allocations_until_failure = 1;
}

__attribute__((noinline)) void converted_key_failure()
{
    // Convertible keys retain the construction path, including allocation for
    // an eventual duplicate. Exact-key extraction must not take this branch.
    case_result = 3;
    try {
        converted_values->emplace(converted_key, new_value);
    } catch(const std::bad_alloc&) {
        case_result = converted_values->size() == 1 &&
            converted_values->at(duplicate) == initial_value &&
            allocations_until_failure == 0 ? 0 : 1;
    } catch(...) {
        case_result = 2;
    }
    allocations_until_failure = 0;
    std::destroy_at(converted_values);
}

std::size_t old_buckets;
unsigned old_allocations;
unsigned remaining_failures;

__attribute__((noinline)) void prepare_rehash()
{
    old_buckets = values->bucket_count();
    old_allocations = live_allocations;
    remaining_failures = 2;
    values->max_load_factor(0.5f);
}

__attribute__((noinline)) void rehash_failure()
{
    case_result = 0;
    // Fail bucket allocation after allocating the node. Keep the old element
    // and buckets, reclaim the node, then retry successfully in a later phase.
    allocations_until_failure = 2;
    try {
        values->try_emplace(new_key, new_value);
        case_result = 1;
    } catch(const std::bad_alloc&) {
        remaining_failures = allocations_until_failure;
        case_result = 0;
    } catch(...) {
        case_result = 3;
    }
    allocations_until_failure = 0;
}

__attribute__((noinline)) void check_rehash_failure()
{
    if(remaining_failures != 0 || values->size() != 1 ||
       values->bucket_count() != old_buckets || values->at(duplicate).value != initial_value ||
       values->contains(new_key) || live_allocations != old_allocations || live_values != 1)
        case_result = 2;
}

__attribute__((noinline)) void rehash_retry()
{
    values->try_emplace(new_key, new_value);
}

__attribute__((noinline)) void finish_rehash()
{
    if(values->size() != 2 || values->at(new_key).value != new_value ||
       values->bucket_count() <= old_buckets || live_values != 2)
        case_result = 4;
    std::destroy_at(values);
}

}

void* operator new(std::size_t size)
{
    if(allocations_until_failure != 0 && --allocations_until_failure == 0)
        throw std::bad_alloc();
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
#define CHECK_FAILURE(Name, Code) do { Name(); if(case_result != 0) return Code; } while(false)
    CHECK_FAILURE(fail_vector, 1);
    CHECK_FAILURE(fail_deque, 1);
    CHECK_FAILURE(fail_deque_front, 1);
    CHECK_FAILURE(fail_deque_block, 1);
    CHECK_FAILURE(fail_deque_front_block, 1);
    CHECK_FAILURE(fail_list, 1);
    CHECK_FAILURE(fail_forward_list, 1);
    CHECK_FAILURE(fail_map, 2);
    CHECK_FAILURE(fail_set, 2);
    CHECK_FAILURE(fail_hash_map, 2);
    CHECK_FAILURE(fail_hash_set, 2);
    CHECK_FAILURE(fail_vector_stack, 3);
    CHECK_FAILURE(fail_vector_queue, 3);
    CHECK_FAILURE(fail_priority_queue, 3);
    CHECK_FAILURE(fail_default_stack, 3);
    CHECK_FAILURE(fail_default_queue, 3);
#undef CHECK_FAILURE

#define CHECK_DUPLICATE(Operation) do {                                         \
    prepare_map();                                                             \
    prepare_candidates();                                                      \
    Operation();                                                               \
    finish_duplicate();                                                        \
    if(case_result != 0) return 4;                                              \
} while(false)
    CHECK_DUPLICATE(duplicate_try_emplace);
    CHECK_DUPLICATE(duplicate_two_arguments);
    CHECK_DUPLICATE(duplicate_pair);
    CHECK_DUPLICATE(duplicate_piecewise);
#undef CHECK_DUPLICATE

    prepare_set();
    if(duplicate_set_key() != 0)
        return 4;
    prepare_converted();
    converted_key_failure();
    if(case_result != 0)
        return 4;
    prepare_map();
    prepare_rehash();
    rehash_failure();
    check_rehash_failure();
    if(case_result != 0)
        return 5;
    rehash_retry();
    finish_rehash();
    if(case_result != 0 || live_allocations != 0 || live_values != 0)
        return 5;
    return 0;
}
