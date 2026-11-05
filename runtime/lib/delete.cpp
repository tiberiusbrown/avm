// The replaceable deallocation functions of <new>, backed by the AVM heap in malloc.c.
//
// Each operator delete releases a block that operator new returned. A block for an alignment
// above the default alignment is released through the block address stored just before the
// returned pointer. The deallocation functions never throw and never reference the exception
// classes, so a program that only deletes objects, such as one with a virtual destructor, does
// not link them. Each function is weak, like the allocation functions in new.cpp.
#include <cstddef>
#include <cstdlib>
#include <new>

#include "new_internal.h"

namespace {

using avm_new_internal::stored_block_size;
using avm_new_internal::uses_aligned_block;

// Releases a block from an aligned allocation, or a plain block when the alignment is ordinary.
void deallocate_aligned(void *ptr, std::size_t alignment) {
    if (!ptr)
        return;
    if (!uses_aligned_block(alignment)) {
        std::free(ptr);
        return;
    }
    void *block = *reinterpret_cast<void **>(static_cast<char *>(ptr) - stored_block_size);
    std::free(block);
}

} // namespace

__attribute__((weak)) void operator delete(void *ptr) noexcept {
    std::free(ptr);
}

__attribute__((weak)) void operator delete(void *ptr, const std::nothrow_t &) noexcept {
    ::operator delete(ptr);
}

__attribute__((weak)) void operator delete(void *ptr, std::size_t) noexcept {
    ::operator delete(ptr);
}

__attribute__((weak)) void operator delete[](void *ptr) noexcept {
    ::operator delete(ptr);
}

__attribute__((weak)) void operator delete[](void *ptr, const std::nothrow_t &) noexcept {
    ::operator delete[](ptr);
}

__attribute__((weak)) void operator delete[](void *ptr, std::size_t) noexcept {
    ::operator delete[](ptr);
}

__attribute__((weak)) void operator delete(void *ptr, std::align_val_t alignment) noexcept {
    deallocate_aligned(ptr, static_cast<std::size_t>(alignment));
}

__attribute__((weak)) void operator delete(void *ptr, std::align_val_t alignment,
                                           const std::nothrow_t &) noexcept {
    ::operator delete(ptr, alignment);
}

__attribute__((weak)) void operator delete(void *ptr, std::size_t,
                                           std::align_val_t alignment) noexcept {
    ::operator delete(ptr, alignment);
}

__attribute__((weak)) void operator delete[](void *ptr, std::align_val_t alignment) noexcept {
    ::operator delete(ptr, alignment);
}

__attribute__((weak)) void operator delete[](void *ptr, std::align_val_t alignment,
                                             const std::nothrow_t &) noexcept {
    ::operator delete[](ptr, alignment);
}

__attribute__((weak)) void operator delete[](void *ptr, std::size_t,
                                             std::align_val_t alignment) noexcept {
    ::operator delete[](ptr, alignment);
}
