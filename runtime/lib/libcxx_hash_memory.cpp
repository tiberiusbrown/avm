#include <__functional/hash.h>

_LIBCPP_BEGIN_NAMESPACE_STD

_LIBCPP_BEGIN_EXPLICIT_ABI_ANNOTATIONS
[[__gnu__::__pure__]] _LIBCPP_EXPORTED_FROM_ABI size_t
__hash_memory(_LIBCPP_NOESCAPE const void* data, size_t size) _NOEXCEPT {
    const auto* bytes = static_cast<const unsigned char*>(data);
    size_t hash = 5381;
    for (size_t i = 0; i < size; ++i)
        hash = static_cast<size_t>((hash * 33u) ^ bytes[i]);
    return hash;
}
_LIBCPP_END_EXPLICIT_ABI_ANNOTATIONS

_LIBCPP_END_NAMESPACE_STD
