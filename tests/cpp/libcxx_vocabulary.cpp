#include <any>
#include <expected>
#include <functional>
#include <memory>
#include <optional>
#include <tuple>
#include <type_traits>
#include <utility>
#include <variant>

extern "C" int avm_test_main()
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

    int storage = 12;
    std::shared_ptr<int> empty;
    std::shared_ptr<int> alias(empty, &storage);
    if(alias.get() != &storage || !alias || alias.use_count() != 0)
        return 8;

    return 0;
}
