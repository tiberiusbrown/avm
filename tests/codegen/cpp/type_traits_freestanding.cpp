#include <avm/pgmspace.h>
#include <cstddef>
#include <cstdint>
#include <type_traits>

struct Empty {};
struct Base {
  int value;
};
struct Derived : Base {};
struct Final final {};
struct Polymorphic {
  virtual ~Polymorphic() = default;
};
struct Abstract {
  virtual void call() = 0;
};
struct Nontrivial {
  Nontrivial() noexcept(false) {}
  ~Nontrivial() noexcept(false) {}
};
struct CopyOnly {
  CopyOnly() = default;
  CopyOnly(const CopyOnly&) = default;
  CopyOnly(CopyOnly&&) = delete;
};
struct Callable {
  int operator()(short) const noexcept { return 1; }
};
struct MayThrowCallable {
  int operator()(short) const noexcept(false) { return 1; }
};
struct CommonA {
  int value;
};
union Union {
  int value;
  unsigned bits;
};
enum PlainEnum : unsigned short { enum_value = 1 };
enum class ScopedEnum : unsigned short { value = 1 };
using Function = int(double);
using DataMember = int Base::*;
using MemberFunction = void (Base::*)();
using FunctionPointer = int (*)(int);

template <class T, class RefType = T&>
struct ConvertsToRef {
  operator RefType() const { return static_cast<RefType>(object); }
  mutable T object = 42;
};

struct ExplicitConversionRvalueRef {
  operator int();
  explicit operator int&&();
};

struct ExplicitConversionRef {
  operator int();
  explicit operator int&();
};

using IntLvalueConversion = ConvertsToRef<int, int&>;
using IntRvalueConversion = ConvertsToRef<int, int&&>;
using IntConstLvalueConversion = ConvertsToRef<int, const int&>;
using LongLvalueConversion = ConvertsToRef<long, long&>;

extern const int AVM_PROGMEM avm_type_traits_flash_object;
using FlashPointer = decltype(&avm_type_traits_flash_object);

#define CHECK_UNARY_TRAIT(Trait, Type, Expected) \
  static_assert(std::Trait<Type>::value == Expected); \
  static_assert(std::Trait##_v<Type> == Expected)
#define CHECK_BINARY_TRAIT(Trait, Type1, Type2, Expected) \
  static_assert(std::Trait<Type1, Type2>::value == Expected); \
  static_assert(std::Trait##_v<Type1, Type2> == Expected)

CHECK_UNARY_TRAIT(is_void, const volatile void, true);
CHECK_UNARY_TRAIT(is_null_pointer, decltype(nullptr), true);
CHECK_UNARY_TRAIT(is_integral, char8_t, true);
CHECK_UNARY_TRAIT(is_integral, char16_t, true);
CHECK_UNARY_TRAIT(is_integral, char32_t, true);
CHECK_UNARY_TRAIT(is_integral, bool, true);
CHECK_UNARY_TRAIT(is_floating_point, long double, true);
CHECK_UNARY_TRAIT(is_array, const int[2][3], true);
CHECK_UNARY_TRAIT(is_pointer, FunctionPointer, true);
CHECK_UNARY_TRAIT(is_pointer, FlashPointer, true);
CHECK_UNARY_TRAIT(is_lvalue_reference, int&, true);
CHECK_UNARY_TRAIT(is_rvalue_reference, int&&, true);
CHECK_UNARY_TRAIT(is_member_object_pointer, DataMember, true);
CHECK_UNARY_TRAIT(is_member_function_pointer, MemberFunction, true);
CHECK_UNARY_TRAIT(is_enum, PlainEnum, true);
CHECK_UNARY_TRAIT(is_enum, ScopedEnum, true);
CHECK_UNARY_TRAIT(is_union, Union, true);
CHECK_UNARY_TRAIT(is_class, Derived, true);
CHECK_UNARY_TRAIT(is_function, Function, true);
CHECK_UNARY_TRAIT(is_reference, const int&&, true);
CHECK_UNARY_TRAIT(is_arithmetic, const unsigned long long, true);
CHECK_UNARY_TRAIT(is_fundamental, void, true);
CHECK_UNARY_TRAIT(is_member_pointer, DataMember, true);
CHECK_UNARY_TRAIT(is_scoped_enum, ScopedEnum, true);
CHECK_UNARY_TRAIT(is_scoped_enum, PlainEnum, false);
CHECK_UNARY_TRAIT(is_scalar, FunctionPointer, true);
CHECK_UNARY_TRAIT(is_object, int[3], true);
CHECK_UNARY_TRAIT(is_compound, Function, true);

CHECK_UNARY_TRAIT(is_const, const int, true);
CHECK_UNARY_TRAIT(is_volatile, volatile int, true);
CHECK_UNARY_TRAIT(is_trivial, Empty, true);
CHECK_UNARY_TRAIT(is_trivially_copyable, Derived, true);
CHECK_UNARY_TRAIT(is_standard_layout, CommonA, true);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
CHECK_UNARY_TRAIT(is_pod, CommonA, true);
#pragma clang diagnostic pop
CHECK_UNARY_TRAIT(is_empty, Empty, true);
CHECK_UNARY_TRAIT(is_polymorphic, Polymorphic, true);
CHECK_UNARY_TRAIT(is_abstract, Abstract, true);
CHECK_UNARY_TRAIT(is_final, Final, true);
CHECK_UNARY_TRAIT(is_aggregate, CommonA, true);
CHECK_UNARY_TRAIT(is_signed, long, true);
CHECK_UNARY_TRAIT(is_unsigned, unsigned long long, true);
CHECK_BINARY_TRAIT(is_constructible, CopyOnly, const CopyOnly&, true);
CHECK_UNARY_TRAIT(is_default_constructible, CopyOnly, true);
CHECK_UNARY_TRAIT(is_copy_constructible, CopyOnly, true);
CHECK_UNARY_TRAIT(is_move_constructible, CopyOnly, false);
CHECK_BINARY_TRAIT(is_assignable, int&, short, true);
CHECK_UNARY_TRAIT(is_copy_assignable, int, true);
CHECK_UNARY_TRAIT(is_move_assignable, int, true);
CHECK_BINARY_TRAIT(is_swappable_with, int&, int&, true);
CHECK_UNARY_TRAIT(is_swappable, int, true);
CHECK_UNARY_TRAIT(is_destructible, const int[2], true);
CHECK_BINARY_TRAIT(is_trivially_constructible, int, short, true);
CHECK_UNARY_TRAIT(is_trivially_default_constructible, int, true);
CHECK_UNARY_TRAIT(is_trivially_copy_constructible, int, true);
CHECK_UNARY_TRAIT(is_trivially_move_constructible, int, true);
CHECK_BINARY_TRAIT(is_trivially_assignable, int&, short, true);
CHECK_UNARY_TRAIT(is_trivially_copy_assignable, int, true);
CHECK_UNARY_TRAIT(is_trivially_move_assignable, int, true);
CHECK_UNARY_TRAIT(is_trivially_destructible, int, true);
CHECK_BINARY_TRAIT(is_nothrow_constructible, int, short, true);
CHECK_UNARY_TRAIT(is_nothrow_default_constructible, int, true);
CHECK_UNARY_TRAIT(is_nothrow_copy_constructible, int, true);
CHECK_UNARY_TRAIT(is_nothrow_move_constructible, int, true);
CHECK_BINARY_TRAIT(is_nothrow_assignable, int&, short, true);
CHECK_UNARY_TRAIT(is_nothrow_copy_assignable, int, true);
CHECK_UNARY_TRAIT(is_nothrow_move_assignable, int, true);
CHECK_BINARY_TRAIT(is_nothrow_swappable_with, int&, int&, true);
CHECK_UNARY_TRAIT(is_nothrow_swappable, int, true);
CHECK_UNARY_TRAIT(is_nothrow_destructible, int, true);
CHECK_UNARY_TRAIT(is_implicit_lifetime, int, true);
CHECK_UNARY_TRAIT(is_implicit_lifetime, Nontrivial, false);
CHECK_UNARY_TRAIT(has_virtual_destructor, Polymorphic, true);
CHECK_UNARY_TRAIT(has_unique_object_representations, unsigned int, true);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, const int&, int, true);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&, int, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&, int&, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&, int&&, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, const int&, int&, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, const int&, const int&, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, const int&, int&&, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&, long&, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, const int&, long&, true);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, const int&, long&&, true);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&&, long&, true);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&, IntLvalueConversion, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&&, IntRvalueConversion, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&&, IntConstLvalueConversion, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, const int&, LongLvalueConversion, true);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int, long, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&&, int, true);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&&, int&&, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, const int&, int&&, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&&, long&&, true);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&&, long, true);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&, ExplicitConversionRef, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, const int&, ExplicitConversionRef, false);
CHECK_BINARY_TRAIT(reference_constructs_from_temporary, int&&,
                   ExplicitConversionRvalueRef, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, const int&, int, true);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&, int, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&, int&, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&, int&&, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, const int&, int&, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, const int&, const int&, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, const int&, int&&, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&, long&, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, const int&, long&, true);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, const int&, long&&, true);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&&, long&, true);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&, IntLvalueConversion, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&&, IntRvalueConversion, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&&, IntConstLvalueConversion, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, const int&, LongLvalueConversion, true);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int, long, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&&, int, true);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&&, int&&, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, const int&, int&&, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&&, long&&, true);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&&, long, true);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&, ExplicitConversionRef, false);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, const int&, ExplicitConversionRef, true);
CHECK_BINARY_TRAIT(reference_converts_from_temporary, int&&,
                   ExplicitConversionRvalueRef, true);

CHECK_BINARY_TRAIT(is_same, const int, int const, true);
CHECK_BINARY_TRAIT(is_base_of, Base, Derived, true);
CHECK_BINARY_TRAIT(is_convertible, Derived*, Base*, true);
CHECK_BINARY_TRAIT(is_nothrow_convertible, int, double, true);
static_assert(std::is_invocable_v<Callable, short>);
static_assert(std::is_invocable_r_v<long, Callable, short>);
static_assert(std::is_nothrow_invocable_v<Callable, short>);
static_assert(std::is_nothrow_invocable_r_v<long, Callable, short>);
static_assert(!std::is_nothrow_invocable_v<MayThrowCallable, short>);
static_assert(!std::is_nothrow_invocable_r_v<long, MayThrowCallable, short>);
static_assert(std::is_invocable_v<MemberFunction, Base&>);
static_assert(std::is_same_v<std::invoke_result_t<MemberFunction, Base&>, void>);

static_assert(std::is_same_v<std::remove_const_t<const int>, int>);
static_assert(std::is_same_v<std::remove_volatile_t<volatile int>, int>);
static_assert(std::is_same_v<std::remove_cv_t<const volatile int>, int>);
static_assert(std::is_same_v<std::add_const_t<int>, const int>);
static_assert(std::is_same_v<std::add_volatile_t<int>, volatile int>);
static_assert(std::is_same_v<std::add_cv_t<int>, const volatile int>);
static_assert(std::is_same_v<std::remove_reference_t<int&&>, int>);
static_assert(std::is_same_v<std::add_lvalue_reference_t<void>, void>);
static_assert(std::is_same_v<std::add_rvalue_reference_t<void>, void>);
static_assert(std::is_same_v<std::remove_pointer_t<const int*>, const int>);
static_assert(std::is_same_v<std::add_pointer_t<Function>, Function*>);
static_assert(std::is_same_v<std::type_identity_t<CommonA>, CommonA>);
static_assert(std::is_same_v<std::make_signed_t<unsigned int>, int>);
static_assert(std::is_same_v<std::make_unsigned_t<int>, unsigned int>);
static_assert(std::is_same_v<std::remove_extent_t<const int[2][3]>, const int[3]>);
static_assert(std::is_same_v<std::remove_all_extents_t<const int[2][3]>, const int>);
CHECK_UNARY_TRAIT(is_bounded_array, int[2], true);
CHECK_UNARY_TRAIT(is_unbounded_array, int[], true);
static_assert(std::is_same_v<std::remove_cvref_t<const int&>, int>);
static_assert(std::is_same_v<std::decay_t<const int(&)[2]>, const int*>);
static_assert(std::is_same_v<std::enable_if_t<true, int>, int>);
static_assert(std::is_same_v<std::conditional_t<true, int, long>, int>);
static_assert(std::is_same_v<std::common_type_t<short, int>, int>);
static_assert(std::is_same_v<std::common_reference_t<int&, const int&>, const int&>);
static_assert(std::is_same_v<std::underlying_type_t<ScopedEnum>, unsigned short>);
static_assert(std::is_same_v<std::invoke_result_t<Callable, short>, int>);
static_assert(std::is_same_v<std::void_t<int, long>, void>);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
static_assert(std::is_same_v<std::aligned_storage_t<4>, std::aligned_storage<4>::type>);
static_assert(std::is_same_v<std::aligned_union_t<4, int, long>,
                             std::aligned_union<4, int, long>::type>);
#pragma clang diagnostic pop

static_assert(std::alignment_of_v<int> == 1);
static_assert(std::rank_v<const int[2][3]> == 2);
static_assert(std::extent_v<const int[2][3], 0> == 2);
static_assert(std::extent_v<const int[2][3], 1> == 3);
static_assert(std::conjunction_v<std::true_type, std::is_integral<int>>);
static_assert(!std::conjunction_v<std::true_type, std::is_floating_point<int>>);
static_assert(std::disjunction_v<std::false_type, std::is_integral<int>>);
static_assert(std::negation_v<std::is_floating_point<int>>);
constexpr bool checked_constant_evaluation() { return std::is_constant_evaluated(); }
static_assert(checked_constant_evaluation());
static_assert(sizeof(int*) == 2);
static_assert(sizeof(FunctionPointer) == 3);
static_assert(sizeof(FlashPointer) == 3);
static_assert(alignof(long long) == 1);
static_assert(alignof(double) == 1);

template <class T, class = void>
struct has_type : std::false_type {};
template <class T>
struct has_type<T, std::void_t<typename T::type>> : std::true_type {};

template <class T>
using integral_only_t = std::enable_if_t<std::is_integral_v<T>, T>;
template <class T, class = void>
struct accepts_integral : std::false_type {};
template <class T>
struct accepts_integral<T, std::void_t<integral_only_t<T>>> : std::true_type {};

static_assert(has_type<std::type_identity<int>>::value);
static_assert(!has_type<int>::value);
static_assert(accepts_integral<unsigned long>::value);
static_assert(!accepts_integral<float>::value);

extern "C" int avm_test_main() {
  return std::is_constant_evaluated() ? 1 : 0;
}

#undef CHECK_UNARY_TRAIT
#undef CHECK_BINARY_TRAIT
