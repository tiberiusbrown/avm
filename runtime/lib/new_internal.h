// Internal to the allocation functions. new.cpp allocates the blocks, and delete.cpp releases
// them, so both must apply the same alignment test and stored-block layout.
#ifndef AVM_NEW_INTERNAL_H
#define AVM_NEW_INTERNAL_H

#include <cstddef>

namespace avm_new_internal {

// The alignment that ordinary allocation provides, and the size of the block pointer that an
// over-aligned block stores just before its returned address.
constexpr std::size_t default_alignment = __STDCPP_DEFAULT_NEW_ALIGNMENT__;
constexpr std::size_t stored_block_size = sizeof(void *);

// The alignment test shared by allocation and deallocation.
inline bool uses_aligned_block(std::size_t alignment) {
    return alignment > default_alignment;
}

} // namespace avm_new_internal

#endif // AVM_NEW_INTERNAL_H
