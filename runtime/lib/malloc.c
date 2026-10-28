#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#define HEAP_END 0x0500u
#define HEADER_SIZE 2u
#define ALLOCATED_FLAG 0x8000u
#define BLOCK_SIZE_MASK 0x7fffu
#define MIN_BLOCK_SIZE 3u

extern const unsigned char __avm_heap_start;
static uint16_t heap_top;

static uint16_t heap_start(void)
{
    return (uint16_t)(uintptr_t)&__avm_heap_start;
}

static uint16_t block_size(uint16_t header)
{
    return header & BLOCK_SIZE_MASK;
}

static int block_allocated(uint16_t header)
{
    return (header & ALLOCATED_FLAG) != 0;
}

static uint16_t read_header(uint16_t addr)
{
    const unsigned char *p = (const unsigned char *)(uintptr_t)addr;
    return (uint16_t)p[0] | ((uint16_t)p[1] << 8);
}

static void write_header(uint16_t addr, uint16_t value)
{
    unsigned char *p = (unsigned char *)(uintptr_t)addr;
    p[0] = (unsigned char)value;
    p[1] = (unsigned char)(value >> 8);
}

/* One forward scan merges neighbors and removes the final free block. */
static void coalesce(void)
{
    uint16_t addr = heap_start();
    while (addr < heap_top) {
        uint16_t header = read_header(addr);
        uint16_t total = block_size(header);
        if (!block_allocated(header)) {
            uint16_t next = addr + total;
            while (next < heap_top) {
                header = read_header(next);
                if (block_allocated(header))
                    break;
                total += block_size(header);
                next = addr + total;
            }
            if (next == heap_top) {
                heap_top = addr;
                return;
            }
            write_header(addr, total);
        }
        addr += total;
    }
}

static void allocate_block(uint16_t addr, uint16_t total, uint16_t required)
{
    uint16_t remainder = total - required;
    if (remainder >= MIN_BLOCK_SIZE) {
        write_header(addr, required | ALLOCATED_FLAG);
        write_header(addr + required, remainder);
    } else {
        write_header(addr, total | ALLOCATED_FLAG);
    }
}

void *malloc(size_t size)
{
    uint16_t addr, top, required;
    if (size == 0 || size > 1022u)
        return NULL;
    required = (uint16_t)(size + HEADER_SIZE);
    addr = heap_start();
    top = heap_top ? heap_top : addr;
    while (addr < top) {
        uint16_t header = read_header(addr);
        uint16_t total = block_size(header);
        if (!block_allocated(header) && total >= required) {
            allocate_block(addr, total, required);
            return (void *)(uintptr_t)(addr + HEADER_SIZE);
        }
        addr += total;
    }
    if (required > HEAP_END - top)
        return NULL;
    write_header(top, required | ALLOCATED_FLAG);
    heap_top = top + required;
    return (void *)(uintptr_t)(top + HEADER_SIZE);
}

void free(void *ptr)
{
    uint16_t addr;
    if (!ptr)
        return;
    addr = (uint16_t)(uintptr_t)ptr - HEADER_SIZE;
    write_header(addr, block_size(read_header(addr)));
    coalesce();
}

void *realloc(void *ptr, size_t size)
{
    uint16_t addr, old_total, required, next;
    void *replacement;
    if (!ptr)
        return malloc(size);
    if (size == 0) {
        free(ptr);
        return NULL;
    }
    if (size > 1022u)
        return NULL;
    addr = (uint16_t)(uintptr_t)ptr - HEADER_SIZE;
    old_total = block_size(read_header(addr));
    required = (uint16_t)(size + HEADER_SIZE);
    if (required <= old_total) {
        allocate_block(addr, old_total, required);
        if (old_total - required >= MIN_BLOCK_SIZE)
            coalesce();
        return ptr;
    }
    next = addr + old_total;
    if (next < heap_top) {
        uint16_t header = read_header(next);
        uint16_t combined = old_total + block_size(header);
        if (!block_allocated(header) && combined >= required) {
            allocate_block(addr, combined, required);
            if (combined - required >= MIN_BLOCK_SIZE)
                coalesce();
            return ptr;
        }
    }
    if (next == heap_top && required - old_total <= HEAP_END - heap_top) {
        write_header(addr, required | ALLOCATED_FLAG);
        heap_top += required - old_total;
        return ptr;
    }
    replacement = malloc(size);
    if (!replacement)
        return NULL;
    memcpy(replacement, ptr, old_total - HEADER_SIZE);
    free(ptr);
    return replacement;
}

void *calloc(size_t nmemb, size_t size)
{
    size_t total;
    void *ptr;
    if (size != 0 && nmemb > (size_t)-1 / size)
        return NULL;
    total = nmemb * size;
    ptr = malloc(total);
    if (ptr)
        memset(ptr, 0, total);
    return ptr;
}
