#include <any>
#include <expected>
#include <memory>
#include <memory_resource>
#include <variant>

namespace {

int any_bad_cast()
{
    std::any value = 'x';
    try {
        (void)std::any_cast<int>(value);
    } catch(const std::bad_any_cast&) {
        return 0;
    } catch(...) {
        return 1;
    }
    return 2;
}

int variant_bad_access()
{
    std::variant<char, int> value = 'x';
    try {
        (void)std::get<int>(value);
    } catch(const std::bad_variant_access&) {
        return 0;
    } catch(...) {
        return 1;
    }
    return 2;
}

int expected_bad_access()
{
    std::expected<int, int> value = std::unexpected(17);
    try {
        (void)value.value();
    } catch(const std::bad_expected_access<int>& error) {
        return error.error() == 17 ? 0 : 1;
    } catch(...) {
        return 2;
    }
    return 3;
}

int shared_ptr_bad_weak()
{
    std::weak_ptr<int> expired;
    try {
        std::shared_ptr<int> value(expired);
        (void)value;
    } catch(const std::bad_weak_ptr&) {
        return 0;
    } catch(...) {
        return 1;
    }
    return 2;
}

int memory_resource_bad_alloc()
{
    try {
        (void)std::pmr::null_memory_resource()->allocate(1, 1);
    } catch(const std::bad_alloc&) {
        return 0;
    } catch(...) {
        return 1;
    }
    return 2;
}

}

extern "C" int avm_test_main()
{
    if(any_bad_cast() != 0)
        return 1;
    if(variant_bad_access() != 0)
        return 2;
    if(expected_bad_access() != 0)
        return 3;
    if(shared_ptr_bad_weak() != 0)
        return 4;
    return memory_resource_bad_alloc() == 0 ? 0 : 5;
}
