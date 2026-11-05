// The replaceable allocation functions of <new>, backed by the AVM heap in malloc.c.
//
// Allocation calls the installed new_handler and retries after each failure. Only a missing
// handler turns a failure into std::bad_alloc, which the throwing forms throw through the AVM
// exception ABI. The nothrow forms catch that exception and return null. A zero-byte request
// still returns a distinct non-null pointer, because AVM's malloc(0) returns NULL.
//
// Alignments above the default new alignment are served from a block that is over-allocated
// by the alignment and a stored pointer. The stored pointer sits just before the returned
// address and names the block that operator delete releases. The default new alignment is one
// byte on AVM, so the ordinary forms never store a header. The deallocation functions are in
// delete.cpp, which shares the alignment test through new_internal.h.
//
// Each function is weak. A program that defines a replacement with the same signature
// replaces the library version, and the nothrow forms call the replaceable throwing forms, so
// a replacement affects them too. This object is compiled with -fexceptions because the
// throwing forms and the nothrow catch need a landing pad.
#include <cstddef>
#include <cstdint>
#include <cstdlib>
#include <new>

#include "new_internal.h"

namespace {

using avm_new_internal::stored_block_size;
using avm_new_internal::uses_aligned_block;

// Allocates size bytes and retries after each new_handler call. A null result means that no
// handler is installed, so the caller decides whether that is an exception or a null return.
void *allocate_bytes(std::size_t size) {
    for (;;) {
        void *block = std::malloc(size);
        if (block)
            return block;
        std::new_handler handler = std::get_new_handler();
        if (!handler)
            return nullptr;
        handler();
    }
}

// Ordinary allocation. The request is at least one byte, so the result is never null
// when memory is available.
void *allocate_ordinary(std::size_t size) {
    return allocate_bytes(size == 0 ? 1 : size);
}

void *allocate_aligned(std::size_t size, std::size_t alignment) {
    if (!uses_aligned_block(alignment))
        return allocate_ordinary(size);
    if ((alignment & (alignment - 1)) != 0)
        return nullptr;

    // The block holds the request, the padding that aligns the address, and the stored block
    // pointer. The stored pointer needs no slack, because the address is aligned to a power of
    // two that is at least two bytes.
    const std::size_t overhead = alignment - 1 + stored_block_size;
    const std::size_t request = size == 0 ? 1 : size;
    if (request > SIZE_MAX - overhead)
        return nullptr;

    void *block = allocate_bytes(request + overhead);
    if (!block)
        return nullptr;
    const std::uintptr_t start = reinterpret_cast<std::uintptr_t>(block);
    const std::uintptr_t aligned =
        (start + stored_block_size + alignment - 1) & ~static_cast<std::uintptr_t>(alignment - 1);
    *reinterpret_cast<void **>(aligned - stored_block_size) = block;
    return reinterpret_cast<void *>(aligned);
}

void *allocate_or_throw(std::size_t size) {
    void *block = allocate_ordinary(size);
    if (!block)
        throw std::bad_alloc();
    return block;
}

void *allocate_aligned_or_throw(std::size_t size, std::size_t alignment) {
    void *block = allocate_aligned(size, alignment);
    if (!block)
        throw std::bad_alloc();
    return block;
}

} // namespace

__attribute__((weak)) void *operator new(std::size_t size) {
    return allocate_or_throw(size);
}

__attribute__((weak)) void *operator new(std::size_t size, const std::nothrow_t &) noexcept {
    try {
        return ::operator new(size);
    } catch (...) {
        return nullptr;
    }
}

__attribute__((weak)) void *operator new[](std::size_t size) {
    return ::operator new(size);
}

__attribute__((weak)) void *operator new[](std::size_t size, const std::nothrow_t &) noexcept {
    try {
        return ::operator new[](size);
    } catch (...) {
        return nullptr;
    }
}

__attribute__((weak)) void *operator new(std::size_t size, std::align_val_t alignment) {
    return allocate_aligned_or_throw(size, static_cast<std::size_t>(alignment));
}

__attribute__((weak)) void *operator new(std::size_t size, std::align_val_t alignment,
                                         const std::nothrow_t &) noexcept {
    try {
        return ::operator new(size, alignment);
    } catch (...) {
        return nullptr;
    }
}

__attribute__((weak)) void *operator new[](std::size_t size, std::align_val_t alignment) {
    return ::operator new(size, alignment);
}

__attribute__((weak)) void *operator new[](std::size_t size, std::align_val_t alignment,
                                           const std::nothrow_t &) noexcept {
    try {
        return ::operator new[](size, alignment);
    } catch (...) {
        return nullptr;
    }
}
