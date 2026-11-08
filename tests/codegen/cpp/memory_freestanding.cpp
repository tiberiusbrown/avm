#include <cstddef>
#include <cstdint>
#include <functional>
#include <memory>
#include <tuple>
#include <type_traits>
#include <utility>

template <class T>
struct WrappedPointer {
  using element_type = T;
  using difference_type = std::ptrdiff_t;
  template <class U>
  using rebind = WrappedPointer<U>;

  T* value;

  constexpr T* operator->() const noexcept { return value; }
  static constexpr WrappedPointer pointer_to(T& object) noexcept {
    return {std::addressof(object)};
  }
};

template <class T>
struct BufferAllocator {
  using value_type = T;
  using size_type = std::size_t;
  using difference_type = std::ptrdiff_t;
  template <class U>
  using rebind = BufferAllocator<U>;

  T* storage;
  unsigned* deallocations;

  constexpr T* allocate(size_type) { return storage; }
  constexpr std::allocation_result<T*, size_type> allocate_at_least(size_type count) {
    return {storage, count + 1};
  }
  constexpr void deallocate(T*, size_type) { ++*deallocations; }
};

template <class T>
struct SimpleAllocator {
  using value_type = T;
};

struct AllocatedValue {
  using allocator_type = SimpleAllocator<char>;
  int value;

  constexpr AllocatedValue(std::allocator_arg_t, const allocator_type&, int v) : value(v) {}
};

struct AddressTrap {
  int value;
  AddressTrap* operator&() { return nullptr; }
};

struct Tracked {
  int value;
  constexpr explicit Tracked(int v = 0) : value(v) {}
  constexpr Tracked(const Tracked&) = default;
  constexpr Tracked(Tracked&&) = default;
  constexpr Tracked& operator=(const Tracked&) = default;
  constexpr ~Tracked() = default;
};

struct NonOwningDeleter {
  bool* called;
  constexpr void operator()(int*) const noexcept { *called = true; }
};

static_assert(std::is_same_v<std::pointer_traits<int*>::element_type, int>);
static_assert(std::is_same_v<std::pointer_traits<int*>::difference_type, std::ptrdiff_t>);
static_assert(std::is_same_v<std::pointer_traits<int*>::rebind<const long>, const long*>);
static_assert(std::is_same_v<std::pointer_traits<WrappedPointer<int>>::element_type, int>);
static_assert(std::is_same_v<std::pointer_traits<WrappedPointer<int>>::rebind<const long>,
                             WrappedPointer<const long>>);
static_assert(std::is_same_v<std::allocator_traits<BufferAllocator<int>>::value_type, int>);
static_assert(std::is_same_v<std::allocator_traits<BufferAllocator<int>>::rebind_alloc<long>,
                             BufferAllocator<long>>);
static_assert(std::is_same_v<std::allocator_traits<BufferAllocator<int>>::rebind_traits<long>,
                             std::allocator_traits<BufferAllocator<long>>>);
static_assert(!std::allocator_traits<BufferAllocator<int>>::propagate_on_container_copy_assignment::value);
static_assert(std::allocator_traits<BufferAllocator<int>>::is_always_equal::value == false);
static_assert(std::uses_allocator_v<AllocatedValue, AllocatedValue::allocator_type>);
static_assert(!std::uses_allocator_v<int, AllocatedValue::allocator_type>);
static_assert(std::tuple_size_v<decltype(std::uses_allocator_construction_args<AllocatedValue>(
                  AllocatedValue::allocator_type{}, 5))> == 3);
using PairConstructionArgs = decltype(std::uses_allocator_construction_args<std::pair<int, int>>(
    AllocatedValue::allocator_type{}, std::piecewise_construct,
    std::tuple<int>(1), std::tuple<int>(2)));
static_assert(std::tuple_size_v<PairConstructionArgs> == 3);
static_assert(std::is_same_v<std::tuple_element_t<0, PairConstructionArgs>,
                             std::piecewise_construct_t>);
static_assert(std::is_same_v<std::allocation_result<int*, unsigned>,
                             std::allocation_result<int*, unsigned>>);
static_assert(std::is_same_v<decltype(std::allocator_arg), const std::allocator_arg_t>);

__attribute__((noinline)) static int pointer_tests() {
  int value = 7;
  WrappedPointer<int> wrapped{&value};
  if (std::to_address(wrapped) != &value || std::to_address(&value) != &value)
    return 1;
  if (std::pointer_traits<WrappedPointer<int>>::pointer_to(value).value != &value)
    return 2;

  AddressTrap trapped{9};
  if (std::addressof(trapped) == nullptr || std::addressof(trapped)->value != 9)
    return 3;

  unsigned char aligned_storage[8]{};
  void* aligned_pointer = aligned_storage;
  std::size_t available = sizeof(aligned_storage);
  if (std::align(1, 4, aligned_pointer, available) != aligned_pointer || available != 8)
    return 4;
  int aligned_value = 11;
  if (std::assume_aligned<1>(&aligned_value) != &aligned_value)
    return 5;

  return 0;
}

__attribute__((noinline)) static int allocator_construction_tests() {
  auto made = std::make_obj_using_allocator<AllocatedValue>(AllocatedValue::allocator_type{}, 31);
  if (made.value != 31)
    return 9;
  alignas(AllocatedValue) unsigned char allocated_storage[sizeof(AllocatedValue)];
  auto* allocated_value = std::uninitialized_construct_using_allocator(
      reinterpret_cast<AllocatedValue*>(allocated_storage), AllocatedValue::allocator_type{}, 32);
  if (allocated_value->value != 32)
    return 10;
  std::destroy_at(allocated_value);
  return 0;
}

__attribute__((noinline)) static int fill_tests() {
  alignas(Tracked) unsigned char objects_storage[sizeof(Tracked) * 4];
  auto* objects = reinterpret_cast<Tracked*>(objects_storage);
  Tracked initial(41);
  auto* filled_end = std::uninitialized_fill_n(objects, 2, initial);
  if (filled_end != objects + 2 || objects[1].value != 41)
    return 12;
  std::destroy_n(objects, 2);

  return 0;
}

__attribute__((noinline)) static int range_basics_tests() {
  alignas(int) unsigned char range_storage[sizeof(int) * 4];
  auto* range_output = reinterpret_cast<int*>(range_storage);
  int input[] = {3, 4};
  auto copied = std::ranges::uninitialized_copy(input, input + 2, range_output, range_output + 4);
  if (copied.in != input + 2 || copied.out != range_output + 2 || range_output[1] != 4)
    return 13;
  std::ranges::destroy(range_output, range_output + 2);

  alignas(int) unsigned char range_fill_storage[sizeof(int) * 3];
  auto* range_fill = reinterpret_cast<int*>(range_fill_storage);
  std::ranges::uninitialized_fill_n(range_fill, 3, 17);
  if (range_fill[0] != 17 || range_fill[2] != 17)
    return 14;
  std::ranges::destroy_n(range_fill, 3);

  alignas(int) unsigned char standard_storage[sizeof(int) * 3];
  auto* standard_values = reinterpret_cast<int*>(standard_storage);
  std::uninitialized_value_construct_n(standard_values, 3);
  if (standard_values[0] != 0 || standard_values[2] != 0)
    return 15;
  std::destroy(standard_values, standard_values + 3);

  return 0;
}

__attribute__((noinline)) static int standard_algorithm_tests() {
  int algorithm_input[] = {5, 6, 7};
  alignas(int) unsigned char algorithm_storage[sizeof(int) * 4];
  auto* algorithm_values = reinterpret_cast<int*>(algorithm_storage);
  std::uninitialized_default_construct(algorithm_values, algorithm_values + 2);
  std::destroy(algorithm_values, algorithm_values + 2);
  auto* algorithm_end = std::uninitialized_default_construct_n(algorithm_values, 2);
  if (algorithm_end != algorithm_values + 2)
    return 39;
  std::destroy(algorithm_values, algorithm_end);
  algorithm_end = std::uninitialized_copy(algorithm_input, algorithm_input + 3, algorithm_values);
  if (algorithm_end != algorithm_values + 3 || algorithm_values[2] != 7)
    return 24;
  std::destroy(algorithm_values, algorithm_end);
  algorithm_end = std::uninitialized_copy_n(algorithm_input, 2, algorithm_values);
  if (algorithm_end != algorithm_values + 2 || algorithm_values[1] != 6)
    return 25;
  std::destroy(algorithm_values, algorithm_end);
  algorithm_end = std::uninitialized_move(algorithm_input, algorithm_input + 3, algorithm_values);
  if (algorithm_end != algorithm_values + 3 || algorithm_values[0] != 5)
    return 26;
  std::destroy(algorithm_values, algorithm_end);
  auto moved = std::uninitialized_move_n(algorithm_input, 2, algorithm_values);
  if (moved.first != algorithm_input + 2 || moved.second != algorithm_values + 2)
    return 27;
  std::destroy(algorithm_values, moved.second);
  std::uninitialized_fill(algorithm_values, algorithm_values + 2, 18);
  if (algorithm_values[1] != 18)
    return 28;
  std::destroy(algorithm_values, algorithm_values + 2);
  algorithm_end = std::uninitialized_fill_n(algorithm_values, 2, 19);
  if (algorithm_end != algorithm_values + 2 || algorithm_values[0] != 19)
    return 29;
  std::destroy(algorithm_values, algorithm_end);
  std::uninitialized_value_construct(algorithm_values, algorithm_values + 2);
  if (algorithm_values[1] != 0)
    return 30;
  std::destroy(algorithm_values, algorithm_values + 2);

  return 0;
}

__attribute__((noinline)) static int range_algorithm_tests() {
  int algorithm_input[] = {5, 6, 7};
  alignas(int) unsigned char algorithm_storage[sizeof(int) * 4];
  auto* algorithm_values = reinterpret_cast<int*>(algorithm_storage);
  int* algorithm_end;
  algorithm_end = std::ranges::uninitialized_default_construct(algorithm_values, algorithm_values + 2);
  if (algorithm_end != algorithm_values + 2)
    return 31;
  std::ranges::destroy(algorithm_values, algorithm_end);
  algorithm_end = std::ranges::uninitialized_default_construct_n(algorithm_values, 2);
  if (algorithm_end != algorithm_values + 2)
    return 40;
  std::ranges::destroy(algorithm_values, algorithm_end);
  auto range_copy = std::ranges::uninitialized_copy_n(algorithm_input, 2, algorithm_values,
                                                       algorithm_values + 4);
  if (range_copy.in != algorithm_input + 2 || range_copy.out != algorithm_values + 2)
    return 32;
  std::ranges::destroy(algorithm_values, range_copy.out);
  auto range_move = std::ranges::uninitialized_move(algorithm_input, algorithm_input + 3,
                                                    algorithm_values, algorithm_values + 4);
  if (range_move.in != algorithm_input + 3 || range_move.out != algorithm_values + 3)
    return 33;
  std::ranges::destroy(algorithm_values, range_move.out);
  auto range_move_n = std::ranges::uninitialized_move_n(algorithm_input, 2, algorithm_values,
                                                         algorithm_values + 4);
  if (range_move_n.in != algorithm_input + 2 || range_move_n.out != algorithm_values + 2)
    return 34;
  std::ranges::destroy(algorithm_values, range_move_n.out);
  algorithm_end = std::ranges::uninitialized_fill(algorithm_values, algorithm_values + 2, 20);
  if (algorithm_end != algorithm_values + 2 || algorithm_values[1] != 20)
    return 35;
  std::ranges::destroy(algorithm_values, algorithm_end);
  algorithm_end = std::ranges::uninitialized_fill_n(algorithm_values, 2, 21);
  if (algorithm_end != algorithm_values + 2 || algorithm_values[0] != 21)
    return 41;
  std::ranges::destroy(algorithm_values, algorithm_end);
  algorithm_end = std::ranges::uninitialized_value_construct(algorithm_values, algorithm_values + 2);
  if (algorithm_end != algorithm_values + 2 || algorithm_values[0] != 0)
    return 36;
  std::ranges::destroy_n(algorithm_values, 2);
  algorithm_end = std::ranges::uninitialized_value_construct_n(algorithm_values, 2);
  if (algorithm_end != algorithm_values + 2 || algorithm_values[1] != 0)
    return 37;
  std::ranges::destroy_n(algorithm_values, 2);
  std::ranges::construct_at(algorithm_values, 55);
  if (*algorithm_values != 55)
    return 38;
  std::ranges::destroy_at(algorithm_values);

  return 0;
}

__attribute__((noinline)) static int unique_ptr_tests() {
  bool deleter_called = false;
  int owned_value = 56;
  {
    std::unique_ptr<int, NonOwningDeleter> owner(&owned_value, NonOwningDeleter{&deleter_called});
    if (!owner || *owner != 56 || owner == nullptr || !(owner >= nullptr) || !(nullptr <= owner))
      return 16;
    if (std::hash<decltype(owner)>{}(owner) != std::hash<int*>{}(&owned_value))
      return 17;
    std::unique_ptr<int, NonOwningDeleter> empty(nullptr, NonOwningDeleter{&deleter_called});
    std::swap(owner, empty);
    if (empty.get() != &owned_value || owner)
      return 18;
  }
  if (!deleter_called)
    return 19;

  return 0;
}

__attribute__((noinline)) static int allocator_traits_tests() {
  alignas(int) unsigned char allocator_storage[sizeof(int) * 2];
  auto* allocator_values = reinterpret_cast<int*>(allocator_storage);
  unsigned deallocation_count = 0;
  BufferAllocator<int> allocator{allocator_values, &deallocation_count};
  using Traits = std::allocator_traits<BufferAllocator<int>>;
  auto allocation = Traits::allocate_at_least(allocator, 1);
  if (allocation.ptr != allocator_values || allocation.count != 2)
    return 20;
  Traits::construct(allocator, allocation.ptr, 63);
  if (*allocation.ptr != 63 || Traits::max_size(allocator) < 2)
    return 21;
  Traits::destroy(allocator, allocation.ptr);
  Traits::deallocate(allocator, allocation.ptr, allocation.count);
  if (deallocation_count != 1 || Traits::select_on_container_copy_construction(allocator).storage != allocator_values)
    return 22;

  return 0;
}

extern "C" int avm_test_main() {
  if (int result = pointer_tests())
    return result;
  if (int result = allocator_construction_tests())
    return result;
  if (int result = fill_tests())
    return result;
  if (int result = range_basics_tests())
    return result;
  if (int result = standard_algorithm_tests())
    return result;
  if (int result = range_algorithm_tests())
    return result;
  if (int result = unique_ptr_tests())
    return result;
  if (int result = allocator_traits_tests())
    return result;
  return 0;
}
