#include <avm/framebuffer.h>
#include <cstdlib>
#include <deque>
#include <iterator>
#include <memory>
#include <type_traits>
#include <utility>

namespace {

bool blocks[2];
unsigned allocations;
unsigned constructions;
unsigned destructions;
struct secret_value;

template<class T> struct checked_allocator {
    using value_type = T;
    int identity;
    explicit checked_allocator(int value = 23) noexcept : identity(value) {}
    template<class U>
    checked_allocator(const checked_allocator<U>& other) noexcept : identity(other.identity) {}

    T* allocate(std::size_t count)
    {
        if(identity != 23)
            __builtin_trap();
        const auto bytes = count * sizeof(T);
        // Borrow the display only in this standalone fixture. Two real blocks
        // cannot coexist in the ordinary static-RAM heap for deque<int>.
        if(bytes == 512) {
            for(unsigned i = 0; i != 2; ++i)
                if(!blocks[i]) {
                    blocks[i] = true;
                    ++allocations;
                    return reinterpret_cast<T*>(__avm_framebuffer + i * 512);
                }
            __builtin_trap();
        }
        auto* header = static_cast<std::size_t*>(std::malloc(bytes + sizeof(std::size_t)));
        if(!header)
            __builtin_trap();
        *header = count;
        ++allocations;
        return reinterpret_cast<T*>(header + 1);
    }

    std::allocation_result<T*> allocate_at_least(std::size_t count)
    {
        return {allocate(count + 1), count + 1};
    }

    void deallocate(T* value, std::size_t count) noexcept
    {
        if(identity != 23 || allocations == 0)
            __builtin_trap();
        for(unsigned i = 0; i != 2; ++i)
            if(static_cast<void*>(value) == __avm_framebuffer + i * 512) {
                if(!blocks[i] || count * sizeof(T) != 512)
                    __builtin_trap();
                blocks[i] = false;
                --allocations;
                return;
            }
        auto* header = reinterpret_cast<std::size_t*>(value) - 1;
        if(*header != count || count == 0)
            __builtin_trap();
        *header = 0;
        std::free(header);
        --allocations;
    }

    template<class U, class... Args> void construct(U* value, Args&&... args)
    {
        if(identity != 23)
            __builtin_trap();
        ::new (static_cast<void*>(value)) U(std::forward<Args>(args)...);
        if constexpr(std::is_same_v<U, int> || std::is_same_v<U, secret_value>)
            ++constructions;
    }

    template<class U> void destroy(U* value) noexcept
    {
        if(identity != 23)
            __builtin_trap();
        std::destroy_at(value);
        if constexpr(std::is_same_v<U, int> || std::is_same_v<U, secret_value>)
            ++destructions;
    }

    template<class U> bool operator==(const checked_allocator<U>& other) const noexcept
    {
        return identity == other.identity;
    }
};

using container = std::deque<int, checked_allocator<int>>;
alignas(container) unsigned char storage[sizeof(container)];
container* values;
const int input[] = {700, 701, 702};

struct input_iterator {
    using value_type = int;
    using difference_type = std::ptrdiff_t;
    using iterator_category = std::input_iterator_tag;
    const int* pointer;
    const int& operator*() const { return *pointer; }
    input_iterator& operator++() { ++pointer; return *this; }
    input_iterator operator++(int) { auto old = *this; ++*this; return old; }
    bool operator==(const input_iterator&) const = default;
};

__attribute__((noinline)) void setup()
{
    values = ::new (static_cast<void*>(storage)) container(checked_allocator<int>(23));
    for(int i = 0; i != 254; ++i)
        values->push_back(i);
}

__attribute__((noinline)) void insert_front()
{
    values->insert(values->cbegin() + 1, 3, values->back());
}

__attribute__((noinline)) int check_front()
{
    if(values->size() != 257 || !blocks[0] || !blocks[1])
        return 1;
    for(unsigned i = 0; i != 257; ++i)
        if((*values)[i] != (i == 0 ? 0 : i <= 3 ? 253 : int(i - 3)))
            return 2;
    for(unsigned i = 0; i != 4; ++i)
        values->pop_back();
    return 0;
}

__attribute__((noinline)) void insert_back()
{
    values->insert(values->cend() - 1, 2, values->front());
}

__attribute__((noinline)) void insert_across_block()
{
    values->insert(values->cbegin() + 4, input, input + 3);
}

__attribute__((noinline)) void insert_input()
{
    values->insert(values->cend(), input_iterator{input}, input_iterator{input + 3});
}

int before_range(unsigned i)
{
    return i < 252 ? (i == 0 ? 0 : i <= 3 ? 253 : int(i - 3)) : i < 254 ? 0 : 249;
}

__attribute__((noinline)) int finish()
{
    if(values->size() != 261)
        return 1;
    for(unsigned i = 0; i != 258; ++i)
        if((*values)[i] != (i < 4 ? before_range(i) : i < 7 ? int(700 + i - 4) : before_range(i - 3)))
            return 2;
    for(unsigned i = 258; i != 261; ++i)
        if((*values)[i] != int(700 + i - 258))
            return 2;
    std::destroy_at(values);
    return allocations == 0 && constructions == destructions && !blocks[0] && !blocks[1] ? 0 : 3;
}

struct secret_value {
    int value;
private:
    explicit secret_value(int v) noexcept : value(v) {}
    template<class> friend struct checked_allocator;
public:
    secret_value(const secret_value&) = default;
    secret_value(secret_value&&) = default;
    secret_value& operator=(const secret_value&) = default;
    secret_value& operator=(secret_value&&) = default;
};

__attribute__((noinline)) int private_constructor()
{
    using secret_container = std::deque<secret_value, checked_allocator<secret_value>>;
    alignas(secret_container) static unsigned char data[sizeof(secret_container)];
    auto& sequence = *::new (static_cast<void*>(data)) secret_container(checked_allocator<secret_value>(23));
    sequence.emplace_back(1);
    sequence.emplace_front(2);
    sequence.emplace(sequence.cbegin() + 1, 3);
    sequence.insert(sequence.cbegin() + 1, 2, sequence.back());
    const int result = sequence.size() == 5 && sequence[0].value == 2 && sequence[1].value == 1 &&
        sequence[2].value == 1 && sequence[3].value == 3 && sequence[4].value == 1 ? 0 : 1;
    std::destroy_at(std::addressof(sequence));
    return result;
}

}

extern "C" int avm_test_main()
{
    setup();
    insert_front();
    if(check_front() != 0)
        return 1;
    insert_back();
    insert_across_block();
    insert_input();
    if(finish() != 0)
        return 2;
    if(private_constructor() != 0)
        return 3;
    return allocations == 0 && constructions == destructions && !blocks[0] && !blocks[1] ? 0 : 4;
}
