#include <concepts>
#include <functional>

struct Base {};
struct Derived : Base {};
struct PrivateDerived : private Base {};

struct ExplicitInt {
  explicit operator int() const noexcept { return 1; }
};

struct MoveOnly {
  MoveOnly() = default;
  MoveOnly(const MoveOnly&) = delete;
  MoveOnly(MoveOnly&&) = default;
  MoveOnly& operator=(const MoveOnly&) = delete;
  MoveOnly& operator=(MoveOnly&&) = default;
};

struct NoDefault {
  NoDefault() = delete;
};

struct ThrowingDestructor {
  ~ThrowingDestructor() noexcept(false) {}
};

struct EqualityComparable {
  int value;
  friend constexpr bool operator==(EqualityComparable, EqualityComparable) = default;
};

struct Ordered {
  int value;
  friend constexpr bool operator==(Ordered, Ordered) = default;
  friend constexpr auto operator<=>(Ordered, Ordered) = default;
};

struct Predicate {
  constexpr bool operator()(int value) const noexcept { return value != 0; }
};

struct Relation {
  constexpr bool operator()(int lhs, int rhs) const noexcept { return lhs < rhs; }
};

struct VoidCallable {
  constexpr void operator()(int) const noexcept {}
};

using MemberFunction = int (Derived::*)(int) const noexcept;

static_assert(std::same_as<int, int>);
static_assert(std::same_as<int, const int> == false);
static_assert(std::derived_from<Derived, Base>);
static_assert(!std::derived_from<PrivateDerived, Base>);
static_assert(!std::derived_from<Base, Derived>);
static_assert(std::convertible_to<int, double>);
static_assert(!std::convertible_to<ExplicitInt, int>);
static_assert(std::common_reference_with<int&, const int&>);
static_assert(std::common_reference_with<int, const int>);
static_assert(std::common_with<int, double>);
static_assert(!std::common_with<int*, double*>);

static_assert(std::integral<int>);
static_assert(std::integral<char8_t>);
static_assert(std::signed_integral<long>);
static_assert(!std::signed_integral<unsigned int>);
static_assert(std::unsigned_integral<unsigned long long>);
static_assert(!std::unsigned_integral<int>);
static_assert(std::floating_point<float>);
static_assert(!std::floating_point<int>);

static_assert(std::assignable_from<int&, int>);
static_assert(!std::assignable_from<const int&, int>);
static_assert(std::swappable<int>);
static_assert(std::swappable_with<int&, int&>);
static_assert(!std::swappable_with<int&, const int&>);
static_assert(std::destructible<int>);
static_assert(!std::destructible<ThrowingDestructor>);
static_assert(std::constructible_from<int, short>);
static_assert(!std::constructible_from<NoDefault>);
static_assert(std::default_initializable<int>);
static_assert(!std::default_initializable<NoDefault>);
static_assert(std::move_constructible<MoveOnly>);
static_assert(!std::copy_constructible<MoveOnly>);
static_assert(std::copy_constructible<int>);

static_assert(std::equality_comparable<int>);
static_assert(std::equality_comparable_with<int, short>);
static_assert(!std::equality_comparable<MoveOnly>);
static_assert(std::totally_ordered<int>);
static_assert(std::totally_ordered_with<int, short>);
static_assert(std::totally_ordered<Ordered>);
static_assert(!std::totally_ordered<EqualityComparable>);

static_assert(std::movable<int>);
static_assert(std::movable<MoveOnly>);
static_assert(std::copyable<int>);
static_assert(!std::copyable<MoveOnly>);
static_assert(std::semiregular<int>);
static_assert(!std::semiregular<MoveOnly>);
static_assert(std::regular<int>);
static_assert(std::regular<Ordered>);
static_assert(!std::regular<MoveOnly>);

static_assert(std::invocable<Predicate, int>);
static_assert(std::regular_invocable<Predicate, int>);
static_assert(std::predicate<Predicate, int>);
static_assert(!std::predicate<VoidCallable, int>);
static_assert(std::relation<Relation, int, int>);
static_assert(std::equivalence_relation<std::equal_to<>, int, int>);
static_assert(std::strict_weak_order<std::less<>, int, int>);
static_assert(std::invocable<MemberFunction, Derived&, int>);
static_assert(!std::invocable<MemberFunction, int, int>);

template <class T>
concept HasValueType = requires { typename T::value_type; };
template <class F>
concept CallableWithShort = std::invocable<F, short>;

struct HasNestedType {
  using value_type = int;
};
static_assert(HasValueType<HasNestedType>);
static_assert(!HasValueType<int>);
static_assert(CallableWithShort<Predicate>);
static_assert(!CallableWithShort<NoDefault>);

extern "C" int avm_test_main() { return 0; }
