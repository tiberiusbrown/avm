#include <deque>
#include <memory>

namespace {

using container_type = std::deque<int>;
alignas(container_type) unsigned char storage[sizeof(container_type)];
container_type* values;
constexpr int fill_value = 17;

__attribute__((noinline)) void construct_default()
{
    values = ::new (static_cast<void*>(storage)) container_type(4);
}

__attribute__((noinline)) int check_default()
{
    if(values->size() != 4)
        return 1;
    for(int value : *values)
        if(value != 0)
            return 2;
    return 0;
}

__attribute__((noinline)) void resize_default()
{
    values->front() = 42;
    values->resize(7);
}

__attribute__((noinline)) void resize_alias()
{
    values->resize(9, values->front());
}

__attribute__((noinline)) int check_resize()
{
    if(values->size() != 9 || values->front() != 42 || values->back() != 42)
        return 1;
    for(unsigned i = 1; i < 7; ++i)
        if((*values)[i] != 0)
            return 2;
    values->resize(2);
    return values->size() == 2 && values->back() == 0 ? 0 : 3;
}

__attribute__((noinline)) void construct_fill()
{
    values = ::new (static_cast<void*>(storage)) container_type(4, fill_value);
}

__attribute__((noinline)) int check_fill()
{
    if(values->size() != 4)
        return 1;
    for(int value : *values)
        if(value != fill_value)
            return 2;
    return 0;
}

}

extern "C" int avm_test_main()
{
    construct_default();
    if(check_default() != 0)
        return 1;
    resize_default();
    resize_alias();
    if(check_resize() != 0)
        return 2;
    std::destroy_at(values);
    construct_fill();
    if(check_fill() != 0)
        return 3;
    std::destroy_at(values);
    return 0;
}
