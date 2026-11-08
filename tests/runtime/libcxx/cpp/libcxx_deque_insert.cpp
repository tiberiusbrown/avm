#include <deque>
#include <iterator>
#include <memory>
#include <type_traits>

namespace {

unsigned old_size;
unsigned position;
unsigned count;
int alias_index;
unsigned operation;
int expected[16];
unsigned live_values;

struct moving_value {
    int value;
    explicit moving_value(int v = 0) noexcept : value(v) { ++live_values; }
    moving_value(const moving_value& other) noexcept : value(other.value) { ++live_values; }
    moving_value(moving_value&& other) noexcept : value(other.value)
    {
        other.value = -1;
        ++live_values;
    }
    moving_value& operator=(const moving_value& other) noexcept { value = other.value; return *this; }
    moving_value& operator=(moving_value&& other) noexcept
    {
        value = other.value;
        other.value = -1;
        return *this;
    }
    ~moving_value() { --live_values; }
};

using function_pointer = int(*)() noexcept;
static_assert(sizeof(function_pointer) == 3);
int fill() noexcept { return 42; }
int f0() noexcept { return 100; }
int f1() noexcept { return 101; }
int f2() noexcept { return 102; }
int f3() noexcept { return 103; }
int f4() noexcept { return 104; }
int f5() noexcept { return 105; }
int f6() noexcept { return 106; }
int f7() noexcept { return 107; }
function_pointer functions[] = {f0, f1, f2, f3, f4, f5, f6, f7};

template<class T> T make_value(int value)
{
    if constexpr(std::is_same_v<T, function_pointer>)
        return value == 42 ? fill : functions[value - 100];
    else
        return T(value);
}

template<class T> int read_value(const T& value)
{
    if constexpr(std::is_same_v<T, function_pointer>)
        return value();
    else if constexpr(std::is_same_v<T, moving_value>)
        return value.value;
    else
        return value;
}

template<class T, class Category> struct cursor {
    using value_type = T;
    using difference_type = std::ptrdiff_t;
    using iterator_category = Category;
    using pointer = T*;
    using reference = T&;
    T* p;
    T& operator*() const { return *p; }
    cursor& operator++() { ++p; return *this; }
    cursor operator++(int) { auto old = *this; ++*this; return old; }
    bool operator==(const cursor&) const = default;
};

template<class Iterator> struct input_range {
    Iterator first;
    Iterator last;
    Iterator begin() const { return first; }
    Iterator end() const { return last; }
};

template<class T> struct fixture {
    using container = std::deque<T>;
    alignas(container) static inline unsigned char storage[sizeof(container)];
    static inline container* values;
    static inline T external = make_value<T>(42);
    static inline T input[] = {make_value<T>(107), make_value<T>(106), make_value<T>(105)};
    static inline std::initializer_list<T> list = {make_value<T>(107), make_value<T>(106), make_value<T>(105)};
    using input_cursor = cursor<T, std::input_iterator_tag>;
    using forward_cursor = cursor<T, std::forward_iterator_tag>;
    static inline input_range<input_cursor> input_source;
    static inline input_range<forward_cursor> forward_source;
    static inline input_range<T*> pointer_source;
    alignas(typename container::iterator)
    static inline unsigned char result_storage[sizeof(typename container::iterator)];

    __attribute__((noinline)) static void setup()
    {
        values = std::construct_at(reinterpret_cast<container*>(storage));
        external = make_value<T>(42);
        input_source = {{input}, {input + count}};
        forward_source = {{input}, {input + count}};
        pointer_source = {input, input + count};
        if(old_size != 0)
            values->push_front(make_value<T>(100));
        for(unsigned i = 1; i < old_size; ++i)
            values->push_back(make_value<T>(100 + i));
        for(unsigned i = 0; i < position; ++i)
            expected[i] = 100 + i;
        for(unsigned i = 0; i < count; ++i)
            expected[position + i] = operation >= 3 && operation != 10 ? 107 - i :
                alias_index < 0 ? 42 : 100 + alias_index;
        for(unsigned i = position; i < old_size; ++i)
            expected[count + i] = 100 + i;
    }

    __attribute__((noinline)) static void perform()
    {
        ::new (static_cast<void*>(result_storage)) typename container::iterator(
            values->insert(values->cbegin() + position, count,
                alias_index < 0 ? external : (*values)[alias_index]));
    }

    __attribute__((noinline)) static void perform_single()
    {
        ::new (static_cast<void*>(result_storage)) typename container::iterator(
            values->insert(values->cbegin() + position,
                alias_index < 0 ? external : (*values)[alias_index]));
    }

    __attribute__((noinline)) static void perform_emplace()
    {
        ::new (static_cast<void*>(result_storage)) typename container::iterator(
            values->emplace(values->cbegin() + position,
                alias_index < 0 ? external : (*values)[alias_index]));
    }

    __attribute__((noinline)) static void perform_range()
    {
        ::new (static_cast<void*>(result_storage)) typename container::iterator(
            values->insert(values->cbegin() + position, input, input + count));
    }

    __attribute__((noinline)) static void perform_input()
    {
        ::new (static_cast<void*>(result_storage)) typename container::iterator(
            values->insert(values->cbegin() + position, input_cursor{input}, input_cursor{input + count}));
    }

    __attribute__((noinline)) static void perform_forward()
    {
        ::new (static_cast<void*>(result_storage)) typename container::iterator(
            values->insert(values->cbegin() + position, forward_cursor{input}, forward_cursor{input + count}));
    }

    template<class Range>
    __attribute__((noinline)) static void perform_insert_range(Range& range)
    {
        ::new (static_cast<void*>(result_storage)) typename container::iterator(
            values->insert_range(values->cbegin() + position, range));
    }

    __attribute__((noinline)) static void perform_list()
    {
        ::new (static_cast<void*>(result_storage)) typename container::iterator(
            values->insert(values->cbegin() + position, count == 0 ? std::initializer_list<T>{} : list));
    }

    template<class Range>
    __attribute__((noinline)) static void perform_prepend_range(Range& range)
    {
        values->prepend_range(range);
    }

    template<class Range>
    __attribute__((noinline)) static void perform_append_range(Range& range)
    {
        values->append_range(range);
    }

    __attribute__((noinline)) static void perform_move()
    {
        ::new (static_cast<void*>(result_storage)) typename container::iterator(
            values->insert(values->cbegin() + position, std::move(external)));
    }

    __attribute__((noinline)) static int check()
    {
        if(operation < 11) {
            auto* result = reinterpret_cast<typename container::iterator*>(result_storage);
            if(*result != values->begin() + position)
                return 3;
            std::destroy_at(result);
        }
        if(values->size() != old_size + count)
            return 1;
        if constexpr(std::is_same_v<T, moving_value>)
            if(operation == 10 && external.value != -1)
                return 4;
        for(unsigned i = 0; i < values->size(); ++i)
            if(read_value((*values)[i]) != expected[i])
                return 2;
        std::destroy_at(values);
        return 0;
    }

    static int run()
    {
        for(operation = 0; operation != 17; ++operation)
          for(old_size = 0; old_size <= 5; ++old_size)
            for(position = 0; position <= old_size; ++position)
                for(count = 0; count <= 3; ++count)
                    for(alias_index = -1; alias_index < int(old_size); ++alias_index) {
                        if((operation == 1 || operation == 2 || operation == 10) && count != 1)
                            continue;
                        if(operation >= 3 && alias_index != -1)
                            continue;
                        if(operation == 9 && count != 0 && count != 3)
                            continue;
                        if(operation >= 11 && operation <= 13 && position != 0)
                            continue;
                        if(operation >= 14 && position != old_size)
                            continue;
                        setup();
                        if(operation == 0)
                            perform();
                        else if(operation == 1)
                            perform_single();
                        else if(operation == 2)
                            perform_emplace();
                        else if(operation == 3)
                            perform_range();
                        else if(operation == 4)
                            perform_input();
                        else if(operation == 5)
                            perform_forward();
                        else if(operation == 6)
                            perform_insert_range(pointer_source);
                        else if(operation == 7)
                            perform_insert_range(input_source);
                        else if(operation == 8)
                            perform_insert_range(forward_source);
                        else if(operation == 9)
                            perform_list();
                        else if(operation == 10)
                            perform_move();
                        else if(operation == 11)
                            perform_prepend_range(pointer_source);
                        else if(operation == 12)
                            perform_prepend_range(input_source);
                        else if(operation == 13)
                            perform_prepend_range(forward_source);
                        else if(operation == 14)
                            perform_append_range(pointer_source);
                        else if(operation == 15)
                            perform_append_range(input_source);
                        else
                            perform_append_range(forward_source);
                        if(check() != 0)
                            return 1;
                    }
        return 0;
    }
};

}

extern "C" int avm_test_main()
{
    if(fixture<int>::run() != 0)
        return 1;
    if(fixture<moving_value>::run() != 0 || live_values != 7)
        return 2;
    return fixture<function_pointer>::run() == 0 ? 0 : 3;
}
