#include <any>
#include <expected>
#include <functional>
#include <memory>
#include <memory_resource>
#include <optional>
#include <tuple>
#include <type_traits>
#include <utility>
#include <variant>

namespace {

struct large_payload {
    unsigned char bytes[24];
    int value;
};

__attribute__((noinline)) int vocabulary_basics()
{
    std::optional<int> maybe = 7;
    if(!maybe || *maybe != 7 || maybe.value_or(0) != 7)
        return 1;

    std::variant<int, const char*> choice = "variant";
    if(std::visit([](auto value) -> int {
        using type = decltype(value);
        if constexpr(std::is_same_v<type, const char*>)
            return value[0] == 'v' ? 0 : 1;
        else
            return 1;
    }, choice) != 0)
        return 2;

    std::expected<int, int> result = 42;
    if(!result || *result != 42)
        return 3;
    std::expected<int, int> error = std::unexpected(9);
    if(error || error.error() != 9)
        return 4;

    std::any erased = 19;
    if(std::any_cast<int>(erased) != 19)
        return 5;

    if(std::invoke([](int value) { return value + 1; }, 8) != 9)
        return 6;

    const auto tuple = std::make_tuple(3, 4);
    if(std::get<0>(tuple) + std::get<1>(tuple) != 7)
        return 7;

    return 0;
}

__attribute__((noinline)) int allocation_dependent_types()
{
    large_payload payload{};
    payload.value = 19;
    std::any erased = payload;
    const large_payload* stored = std::any_cast<large_payload>(&erased);
    if(!stored || stored->value != 19)
        return 1;

    std::shared_ptr<int> shared = std::make_shared<int>(23);
    std::weak_ptr<int> weak = shared;
    if(!shared || *shared != 23 || shared.use_count() != 1 || weak.expired())
        return 2;
    shared.reset();
    return weak.expired() ? 0 : 3;
}

__attribute__((noinline)) int memory_resource_operations()
{
    std::pmr::memory_resource* resource = std::pmr::new_delete_resource();
    std::pmr::polymorphic_allocator<unsigned char> allocator(resource);
    unsigned char* bytes = allocator.allocate(3);
    bytes[0] = 31;
    bytes[1] = 32;
    bytes[2] = 33;
    if(bytes[0] != 31 || bytes[2] != 33)
        return 1;
    allocator.deallocate(bytes, 3);
    return 0;
}

__attribute__((noinline)) int monotonic_resource_operations()
{
    std::pmr::memory_resource* resource = std::pmr::new_delete_resource();
    alignas(std::max_align_t) unsigned char local_buffer[48];
    std::pmr::monotonic_buffer_resource monotonic(
        local_buffer, sizeof(local_buffer), resource);
    int* value = static_cast<int*>(monotonic.allocate(sizeof(int), alignof(int)));
    *value = 41;
    if(*value != 41)
        return 2;
    return 0;
}

__attribute__((noinline)) int pool_operations()
{
    std::pmr::memory_resource* resource = std::pmr::new_delete_resource();
    std::pmr::pool_options options{};
    options.max_blocks_per_chunk = 16;
    options.largest_required_pool_block = 8;
    std::pmr::unsynchronized_pool_resource pool(options, resource);
    void* pooled = pool.allocate(1, 1);
    pool.deallocate(pooled, 1, 1);
    return 0;
}

__attribute__((noinline)) int synchronized_pool_operations()
{
    std::pmr::memory_resource* resource = std::pmr::new_delete_resource();
    std::pmr::pool_options options{};
    options.max_blocks_per_chunk = 16;
    options.largest_required_pool_block = 8;
    std::pmr::synchronized_pool_resource pool(options, resource);
    void* pooled = pool.allocate(1, 1);
    pool.deallocate(pooled, 1, 1);
    return pool.upstream_resource() == resource ? 0 : 1;
}

__attribute__((noinline)) int shared_ptr_aliasing()
{
    int storage = 12;
    std::shared_ptr<int> empty;
    std::shared_ptr<int> alias(empty, &storage);
    if(alias.get() != &storage || !alias || alias.use_count() != 0)
        return 1;
    return 0;
}

__attribute__((noinline)) int shared_ptr_arrays()
{
    auto dynamic = std::make_shared<int[]>(3);
    auto fixed = std::make_shared<int[3]>(17);
    if(dynamic[0] != 0 || dynamic[2] != 0 || fixed[0] != 17 || fixed[2] != 17 ||
       dynamic.use_count() != 1 || fixed.use_count() != 1)
        return 1;
    dynamic[1] = 23;
    fixed[1] = 29;
    return dynamic[1] == 23 && fixed[1] == 29 ? 0 : 2;
}

}

extern "C" int avm_test_main()
{
    if(vocabulary_basics() != 0)
        return 1;
    if(allocation_dependent_types() != 0)
        return 2;
    if(memory_resource_operations() != 0 || monotonic_resource_operations() != 0 ||
       pool_operations() != 0)
        return 3;
    if(synchronized_pool_operations() != 0)
        return 4;
    if(shared_ptr_aliasing() != 0)
        return 5;
    if(shared_ptr_arrays() != 0)
        return 6;
    return 0;
}
