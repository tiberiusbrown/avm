/* Runtime dynamic_cast to a class type for polymorphic AVM objects.
 *
 * Clang lowers a dynamic_cast to a class type to __dynamic_cast. The dynamic_cast to void*
 * routine, __avm_dynamic_cast_to_void, is defined in dynamic_cast_void.c. That file is a
 * separate archive member, so a program that casts only to void* never extracts this object.
 *
 * A polymorphic subobject's vptr is three bytes of its own RAM, and it names the
 * vtable address point. The vtable holds the signed offset to the complete object at
 * vptr - 6 and the 24-bit RTTI descriptor at vptr - 3. A class descriptor begins with
 * the address point of one of the runtime's support vtables, which eh_cxa.c defines.
 * Its kind decides the layout of its base list.
 *
 * Each cast starts from the source subobject's own vptr. The active vptr identifies the
 * dynamic RTTI hierarchy and its offset-to-top. The runtime walks that hierarchy from the
 * calculated complete-object address, which is the source plus the offset-to-top. If the
 * actual source subobject is absent, the object representation is inconsistent and the
 * runtime aborts.
 *
 * The hierarchy is walked by a nonrecursive depth-first iterator, whose state lives in
 * the caller's frame. It keeps one byte per level for the next base, and it replays the
 * path from the root to the node it continues from. The walk visits every path from the
 * root, so a subobject reached by several paths is visited several times, and it is
 * identified by its descriptor and AS0 address. A virtual edge reads the vptr of the
 * subobject that contains it, and its displacement is relative to that subobject.
 *
 * Each visit to the source subobject checks the target-type ancestors on its path. Every
 * path from a target to the source is the lower part of some root path, so the ancestors
 * on the visited paths find each target that contains the source. A target publicly
 * contains the source when every edge from the target down to the source is public, and
 * the descent from the ancestor computes that with its public flag starting at one. A
 * second search from each candidate is therefore not needed, and only one iterator is live.
 *
 * The runtime makes no use of the offset hint. Malformed descriptors, vptrs, or edges end
 * the program with abort(). A valid cast that finds no target returns null. The walk is
 * bounded by AVM_DC_MAX_DEPTH and AVM_DC_MAX_EDGES, and it fails with abort() past either
 * bound. The RTTI window, 0x0500 through 0xF9FF, is the range that the linker checks for
 * each vtable's descriptor when this object is linked.
 *
 * The routine never allocates, and it keeps no state between casts. Its stack use is the
 * caller's frame, one iterator, and the nodes of the current replay. */

#include <avm/pgmspace.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>

/* The aliasable RTTI window. A class descriptor starts in the window, and the shortest
 * one, six bytes, ends in it. */
#define AVM_DC_WINDOW_START 0x000500ul
#define AVM_DC_WINDOW_END 0x00fa00ul
#define AVM_DC_CLASS_SIZE 6ul
#define AVM_DC_ADDRESS_LIMIT 0x1000000ul

/* The vptr is three bytes, and the offset-to-top and RTTI slots lie below it. */
#define AVM_DC_VPTR_SIZE 3u
#define AVM_DC_TOP_SLOT 6ul
#define AVM_DC_RTTI_SLOT 3ul
#define AVM_DC_ADDRESS_POINT 6ul

/* Layout of a class descriptor. An SI descriptor holds its one base after the name. A
 * VMI descriptor holds the __flags and __base_count words, and its base entries follow.
 * Each entry is a 24-bit base descriptor, then the offset-and-flags word, whose low byte
 * holds the flags and whose upper 24 bits hold the signed offset. */
#define AVM_DC_SI_BASE 6ul
#define AVM_DC_VMI_FLAGS 6ul
#define AVM_DC_VMI_COUNT 8ul
#define AVM_DC_VMI_HEADER 10ul
#define AVM_DC_VMI_ENTRY 7ul
#define AVM_DC_VMI_FLAG_BITS 0x03u
#define AVM_DC_BASE_VIRTUAL 0x01u
#define AVM_DC_BASE_PUBLIC 0x02u
#define AVM_DC_BASE_RESERVED 0xfcu

/* The walk limits match the exception matcher's limits in eh_unwind.c. */
#define AVM_DC_MAX_DEPTH 8
#define AVM_DC_MAX_BASES 32
#define AVM_DC_MAX_EDGES 512

/* Results of the walk. NODE yields a subobject, and DONE means the walk is complete.
 * INVALID reports malformed metadata, and LIMIT reports a walk past its budget. */
#define AVM_DC_NODE 0
#define AVM_DC_DONE 1
#define AVM_DC_INVALID 2
#define AVM_DC_LIMIT 3

/* The kinds of descriptor that a base walk can cross. Any other kind is malformed. */
enum avm_dc_kind {
    AVM_DC_CLASS,
    AVM_DC_SI,
    AVM_DC_VMI,
    AVM_DC_OTHER
};

/* Support vtables defined by eh_cxa.c. Each one's address point is the first byte that a
 * descriptor of its kind holds in its vptr. */
extern const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv117__class_type_infoE[9];
extern const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv120__si_class_type_infoE[9];
extern const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv121__vmi_class_type_infoE[9];

/* A node is one subobject: its descriptor, its AS0 address, and whether every edge from the
 * walk's starting node to it is public. */
struct avm_dc_node {
    uint32_t type;
    uint16_t address;
    uint8_t public_path;
};

/* The iterator state. It belongs to the caller's frame. next[level] holds one more than the
 * index of the edge taken from the node at that level, so the path is replayed without
 * storing its nodes. The walk ends when the root has no more bases. */
struct avm_dc_walk {
    uint32_t root_type;
    uint16_t root_address;
    uint16_t edges;
    uint8_t next[AVM_DC_MAX_DEPTH];
    uint8_t depth;
    uint8_t started;
    uint8_t finished;
};

/* What a classification of one hierarchy found. A target is a subobject of the requested
 * destination type, and it is counted once per distinct AS0 address. A downcast target is a
 * target that publicly contains the source subobject. */
struct avm_dc_result {
    uint8_t source_found;
    uint8_t source_public;
    uint8_t target_count;
    uint16_t target_address;
    uint8_t target_public;
    uint8_t downcast_count;
    uint16_t downcast_address;
};

/* One classification. The root is the dynamic object to walk, and the source and target are
 * the static types and the source's address. */
struct avm_dc_query {
    uint32_t root_type;
    uint32_t source_type;
    uint32_t target_type;
    uint16_t root_address;
    uint16_t source_address;
    struct avm_dc_result result;
};

/* Flash reads follow rtti_dynamic.c. LDP24 reads a full program address, and the narrower
 * reads are ordinary program-space loads. */
static inline uint8_t read_flash_u8(uint32_t address) {
    return *(uint8_t const AVM_PROGMEM *)address;
}

static inline uint16_t read_flash_u16(uint32_t address) {
    return *(uint16_t const AVM_PROGMEM *)address;
}

static inline uint32_t read_flash_u24(uint32_t address) {
    uint32_t value;
    __asm__ volatile("ldp24 %0, [%1]" : "=q"(value) : "q"(address));
    return value;
}

/* Reads a signed 24-bit program-space value, such as an offset-to-top or a displacement.
 * The result is sign-extended from bit 23, so it is exact in 32 bits. */
static inline int32_t read_flash_i24(uint32_t address) {
    uint32_t raw = read_flash_u24(address);
    if (raw & 0x800000ul)
        return (int32_t)raw - 0x1000000l;
    return (int32_t)raw;
}

/* Reads a 24-bit value from three little-endian bytes of AS0 memory. The caller checks
 * that all three bytes lie below 0x10000. */
static inline uint32_t read_ram_u24(uint16_t address) {
    const uint8_t *bytes = (const uint8_t *)(uintptr_t)address;
    return (uint32_t)bytes[0] | ((uint32_t)bytes[1] << 8) | ((uint32_t)bytes[2] << 16);
}

/* Seven times a count, by shifts and a subtraction. The empty asm keeps the optimizer from
 * turning the subtraction back into a multiply, which calls a runtime helper. */
static inline uint32_t times7(uint32_t count) {
    uint32_t shifted = count << 3;
    __asm__("" : "+q"(count));
    return shifted - count;
}

/* Returns 1 when a class descriptor could start at address. Every descriptor lies in the
 * RTTI window, which is the range that the linker checks. */
static uint8_t descriptor_in_window(uint32_t descriptor) {
    return descriptor >= AVM_DC_WINDOW_START &&
           descriptor <= AVM_DC_WINDOW_END - AVM_DC_CLASS_SIZE;
}

/* Classifies the descriptor at address by its vptr. A descriptor outside the window, or one
 * whose vptr is none of the three class kinds, is OTHER. */
static enum avm_dc_kind class_kind(uint32_t descriptor) {
    if (!descriptor_in_window(descriptor))
        return AVM_DC_OTHER;
    uint32_t point = read_flash_u24(descriptor);
    if (point == (uint32_t)_ZTVN10__cxxabiv117__class_type_infoE + AVM_DC_ADDRESS_POINT)
        return AVM_DC_CLASS;
    if (point == (uint32_t)_ZTVN10__cxxabiv120__si_class_type_infoE + AVM_DC_ADDRESS_POINT)
        return AVM_DC_SI;
    if (point == (uint32_t)_ZTVN10__cxxabiv121__vmi_class_type_infoE + AVM_DC_ADDRESS_POINT)
        return AVM_DC_VMI;
    return AVM_DC_OTHER;
}

/* Returns 1 and stores the direct base count of a class descriptor. A VMI descriptor is
 * malformed when its flags have a bit that clang never writes, when its count exceeds the
 * limit, or when its entries would run past the 24-bit address space. */
static uint8_t base_count(uint32_t descriptor, enum avm_dc_kind kind, uint8_t *count) {
    if (kind == AVM_DC_CLASS) {
        *count = 0;
        return 1;
    }
    if (kind == AVM_DC_SI) {
        *count = 1;
        return 1;
    }
    if (kind != AVM_DC_VMI)
        return 0;
    if (read_flash_u16(descriptor + AVM_DC_VMI_FLAGS) & ~AVM_DC_VMI_FLAG_BITS)
        return 0;
    uint16_t raw = read_flash_u16(descriptor + AVM_DC_VMI_COUNT);
    if (raw > AVM_DC_MAX_BASES)
        return 0;
    if (descriptor > AVM_DC_ADDRESS_LIMIT - (AVM_DC_VMI_HEADER + times7(raw)))
        return 0;
    *count = (uint8_t)raw;
    return 1;
}

/* Reads base index of the class descriptor at descriptor. The count must already have been
 * validated by base_count. */
static void base_edge(uint32_t descriptor, enum avm_dc_kind kind, uint8_t index, uint32_t *base,
                      int32_t *offset, uint8_t *flags) {
    if (kind == AVM_DC_SI) {
        *base = read_flash_u24(descriptor + AVM_DC_SI_BASE);
        *offset = 0;
        *flags = AVM_DC_BASE_PUBLIC;
        return;
    }
    uint32_t entry = descriptor + AVM_DC_VMI_HEADER + times7(index);
    *base = read_flash_u24(entry);
    *flags = read_flash_u8(entry + 3);
    *offset = read_flash_i24(entry + 4);
}

/* Crosses base index of the node from and stores the node reached in to. The two may be the
 * same node, so every read of from happens before the writes to to. A nonvirtual edge adds its
 * static offset. A virtual edge reads the slot that the subobject's vptr names, and the
 * displacement in that slot is relative to the subobject. Reserved flags, malformed
 * descriptors, a zero vptr, and any address outside the AS0 range are INVALID. */
static uint8_t cross_edge(const struct avm_dc_node *from, uint8_t index, struct avm_dc_node *to) {
    enum avm_dc_kind kind = class_kind(from->type);
    uint8_t count;
    if (!base_count(from->type, kind, &count) || index >= count)
        return AVM_DC_INVALID;

    uint32_t base;
    int32_t offset;
    uint8_t flags;
    base_edge(from->type, kind, index, &base, &offset, &flags);
    if (flags & AVM_DC_BASE_RESERVED)
        return AVM_DC_INVALID;
    if (class_kind(base) == AVM_DC_OTHER)
        return AVM_DC_INVALID;

    int32_t address;
    if (flags & AVM_DC_BASE_VIRTUAL) {
        if (from->address > 0x10000u - AVM_DC_VPTR_SIZE)
            return AVM_DC_INVALID;
        uint32_t vptr = read_ram_u24(from->address);
        if (vptr == 0)
            return AVM_DC_INVALID;
        int32_t slot = (int32_t)vptr + offset;
        if (slot < 0 || slot > (int32_t)(AVM_DC_ADDRESS_LIMIT - AVM_DC_VPTR_SIZE))
            return AVM_DC_INVALID;
        address = (int32_t)from->address + read_flash_i24((uint32_t)slot);
    } else {
        address = (int32_t)from->address + offset;
    }
    if (address < 0 || address > 0xffff)
        return AVM_DC_INVALID;

    uint8_t public_path = (from->public_path && (flags & AVM_DC_BASE_PUBLIC)) ? 1 : 0;
    to->type = base;
    to->address = (uint16_t)address;
    to->public_path = public_path;
    return AVM_DC_NODE;
}

/* Starts an iterator at the root subobject. The first call yields the root. */
static void dc_walk_init(struct avm_dc_walk *walk, uint32_t root_type, uint16_t root_address) {
    walk->root_type = root_type;
    walk->root_address = root_address;
    walk->edges = 0;
    walk->next[0] = 0;
    walk->depth = 0;
    walk->started = 0;
    walk->finished = 0;
}

/* Rebuilds the node at the given level of the saved path, in place. Level zero is the root,
 * and each edge on the path was checked when it was taken, so the replay resolves the same
 * subobjects from the same reads. */
static uint8_t replay_to(const struct avm_dc_walk *walk, uint8_t level, struct avm_dc_node *node) {
    node->type = walk->root_type;
    node->address = walk->root_address;
    node->public_path = 1;
    for (uint8_t edge = 0; edge < level; edge++) {
        if (cross_edge(node, (uint8_t)(walk->next[edge] - 1), node) != AVM_DC_NODE)
            return AVM_DC_INVALID;
    }
    return AVM_DC_NODE;
}

/* Yields the next subobject in depth-first order. A node's bases are taken in declaration
 * order, and the walk backtracks once a node's bases are exhausted. It never recurses, and it
 * keeps no state beyond the iterator. */
static uint8_t dc_walk_next(struct avm_dc_walk *walk, struct avm_dc_node *node) {
    if (walk->finished)
        return AVM_DC_DONE;
    if (!walk->started) {
        walk->started = 1;
        node->type = walk->root_type;
        node->address = walk->root_address;
        node->public_path = 1;
        return AVM_DC_NODE;
    }
    for (;;) {
        uint8_t status = replay_to(walk, walk->depth, node);
        if (status != AVM_DC_NODE)
            return status;

        uint8_t count;
        if (!base_count(node->type, class_kind(node->type), &count))
            return AVM_DC_INVALID;
        if (walk->next[walk->depth] >= count) {
            if (walk->depth == 0) {
                walk->finished = 1;
                return AVM_DC_DONE;
            }
            walk->depth--;
            continue;
        }

        if (++walk->edges > AVM_DC_MAX_EDGES || walk->depth + 1 >= AVM_DC_MAX_DEPTH)
            return AVM_DC_LIMIT;
        uint8_t index = walk->next[walk->depth]++;
        status = cross_edge(node, index, node);
        if (status != AVM_DC_NODE)
            return status;
        walk->depth++;
        walk->next[walk->depth] = 0;
        return AVM_DC_NODE;
    }
}

/* Records one distinct target address. Counts saturate at two, and a second path to the
 * first address leaves the count unchanged. */
static void add_target(struct avm_dc_result *result, const struct avm_dc_node *node) {
    if (result->target_count == 0) {
        result->target_count = 1;
        result->target_address = node->address;
        result->target_public = node->public_path;
    } else if (result->target_count == 1) {
        if (node->address == result->target_address)
            result->target_public |= node->public_path;
        else
            result->target_count = 2;
    }
}

/* Records one downcast target address. Counts saturate at two, as add_target does. */
static void add_downcast(struct avm_dc_result *result, uint16_t address) {
    if (result->downcast_count == 0) {
        result->downcast_count = 1;
        result->downcast_address = address;
    } else if (result->downcast_count == 1 && address != result->downcast_address) {
        result->downcast_count = 2;
    }
}

/* Called when the walk has just yielded the source subobject, so the walk's path ends at it.
 * Each node on the path, including the source itself, that has the target type and publicly
 * contains the source is a downcast target. The node's own public flag is not part of the
 * test, because the containment starts at the node. The descent from the node to the source
 * therefore starts with a public flag of one, and it ends with the AND of the edges below the
 * node. */
static uint8_t add_downcast_targets(const struct avm_dc_walk *walk, uint32_t target_type,
                                    struct avm_dc_result *result) {
    struct avm_dc_node node;
    for (uint8_t level = 0; level <= walk->depth; level++) {
        uint8_t status = replay_to(walk, level, &node);
        if (status != AVM_DC_NODE)
            return status;
        if (node.type != target_type)
            continue;

        uint16_t anchor = node.address;
        node.public_path = 1;
        for (uint8_t edge = level; edge < walk->depth; edge++) {
            status = cross_edge(&node, (uint8_t)(walk->next[edge] - 1), &node);
            if (status != AVM_DC_NODE)
                return status;
        }
        if (node.public_path)
            add_downcast(result, anchor);
    }
    return AVM_DC_NODE;
}

/* Walks the whole hierarchy under the query's root and records what it found about the source
 * and the destination type. Two paths to one subobject count once, because targets are counted
 * by address. Returns DONE when the walk completes, or the walk's error. */
static uint8_t classify(struct avm_dc_query *query) {
    struct avm_dc_walk walk;
    struct avm_dc_node node;
    struct avm_dc_result *result = &query->result;

    result->source_found = 0;
    result->source_public = 0;
    result->target_count = 0;
    result->target_address = 0;
    result->target_public = 0;
    result->downcast_count = 0;
    result->downcast_address = 0;

    dc_walk_init(&walk, query->root_type, query->root_address);
    for (;;) {
        uint8_t status = dc_walk_next(&walk, &node);
        if (status == AVM_DC_DONE)
            return AVM_DC_DONE;
        if (status != AVM_DC_NODE)
            return status;

        if (node.type == query->target_type)
            add_target(result, &node);
        if (node.type == query->source_type && node.address == query->source_address) {
            result->source_found = 1;
            result->source_public |= node.public_path;
            status = add_downcast_targets(&walk, query->target_type, result);
            if (status != AVM_DC_NODE)
                return status;
        }
    }
}

/* Reads the vptr of the subobject at address and the complete-object address it names. The
 * offset-to-top is signed, so the complete object may lie below the subobject. */
static uint8_t read_complete(uint16_t address, uint32_t *vptr, uint16_t *complete) {
    if (address > 0x10000u - AVM_DC_VPTR_SIZE)
        return 0;
    *vptr = read_ram_u24(address);
    if (*vptr < AVM_DC_TOP_SLOT)
        return 0;
    int32_t top = read_flash_i24(*vptr - AVM_DC_TOP_SLOT);
    int32_t where = (int32_t)address + top;
    if (where < 0 || where > 0xffff)
        return 0;
    *complete = (uint16_t)where;
    return 1;
}

/* Establishes the dynamic object of a nonnull source subobject. The dynamic type is the RTTI
 * descriptor that the source's vptr names, and it must lie in the RTTI window. The complete
 * object is the source plus the offset-to-top, which must fit in 16 bits. */
static uint8_t dynamic_root(uint16_t source, uint16_t *complete_address, uint32_t *dynamic_type) {
    uint32_t vptr;
    uint16_t complete;
    if (!read_complete(source, &vptr, &complete))
        return 0;
    uint32_t rtti = read_flash_u24(vptr - AVM_DC_RTTI_SLOT);
    if (rtti == 0 || !descriptor_in_window(rtti))
        return 0;
    *complete_address = complete;
    *dynamic_type = rtti;
    return 1;
}

/* dynamic_cast to a class pointer or reference. A null source yields null, and a valid cast
 * that has no target yields null. An active hierarchy that lacks the source subobject aborts.
 * The result for a reference is checked by the caller, which calls __cxa_bad_cast on null.
 * The src2dst hint is not used. */
void *__dynamic_cast(const void *sub, const void AVM_PROGMEM *src_type,
                     const void AVM_PROGMEM *dst_type, ptrdiff_t src2dst_offset) {
    (void)src2dst_offset;
    if (!sub)
        return NULL;

    struct avm_dc_query query;
    query.source_type = (uint32_t)src_type;
    query.target_type = (uint32_t)dst_type;
    if (class_kind(query.source_type) == AVM_DC_OTHER ||
        class_kind(query.target_type) == AVM_DC_OTHER)
        abort();

    uint16_t source = (uint16_t)(uintptr_t)sub;
    query.source_address = source;
    uint16_t complete;
    if (!dynamic_root(source, &complete, &query.root_type))
        abort();
    query.root_address = complete;
    if (classify(&query) != AVM_DC_DONE)
        abort();
    /* The hierarchy of the active vptr must contain the source subobject. If it does not, the
     * object representation is inconsistent, so the cast ends here. */
    if (!query.result.source_found)
        abort();

    const struct avm_dc_result *result = &query.result;
    if (result->downcast_count == 1)
        return (void *)(uintptr_t)result->downcast_address;
    if (result->source_public && result->target_count == 1 && result->target_public)
        return (void *)(uintptr_t)result->target_address;
    return NULL;
}
