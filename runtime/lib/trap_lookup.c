#include <avm/pgmspace.h>
#include <avm/trap.h>
#include <string.h>

/* AVD1 layout written by llvm-avm-image. Section offsets are relative to the
 * first byte of the block. Addresses are 24-bit program addresses. The section
 * directory is validated up front, and each lookup reads only bounded flash:
 * a binary search over one table, then at most 64 source transitions. */
#define AVD1_CRASH_INFO_ADDR 0x0f
#define AVD1_ADDRESS_LIMIT 0x1000000ul
#define AVD1_MAX_LINE 0xfffffful
#define AVD1_HEADER_SIZE 12
#define AVD1_SECTION_COUNT 5
#define AVD1_DIRECTORY_ENTRY_SIZE 7
#define AVD1_PAYLOAD_START \
    (AVD1_HEADER_SIZE + AVD1_SECTION_COUNT * AVD1_DIRECTORY_ENTRY_SIZE)
#define AVD1_FUNCTION_SIZE 9
#define AVD1_FILE_SIZE 3
#define AVD1_CHECKPOINT_SIZE 12
#define AVD1_CHECKPOINT_INTERVAL 64

/* Validated view of the block. Table fields point past their uint16 counts. */
typedef struct {
    uint32_t functions;    /* function records */
    uint32_t files;        /* filename offsets */
    uint32_t checkpoints;  /* checkpoint records */
    uint32_t stream;       /* first transition opcode */
    uint32_t stream_bytes; /* opcode bytes after the transition count */
    uint32_t strings;      /* string pool */
    uint32_t strings_end;
    uint16_t function_count;
    uint16_t file_count;
    uint16_t checkpoint_count;
} avm_crash_block_t;

/* Source state. The stream offset is relative to the first opcode. */
typedef struct {
    uint32_t pc;
    uint32_t offset;
    uint32_t line;
    uint16_t file;
    uint8_t mapped;
} avm_source_state_t;

/* Program-space loads. On AVM, dereferencing an address-space-one pointer lowers
 * to LDP8U and LDP16, and read_flash_u24 issues LDP24 directly. Host builds have
 * no program space, so they read the same bytes through memcpy_P. */
#ifdef __AVM__
static uint8_t read_flash_u8(uint32_t address) {
    return *(uint8_t const AVM_PROGMEM *)address;
}

static uint16_t read_flash_u16(uint32_t address) {
    return *(uint16_t const AVM_PROGMEM *)address;
}

static uint32_t read_flash_u24(uint32_t address) {
    uint32_t value;
    __asm__ volatile("ldp24 %0, [%1]" : "=q"(value) : "q"(address));
    return value;
}
#else
static uint8_t read_flash_u8(uint32_t address) {
    uint8_t value;
    memcpy_P(&value, (uint8_t const AVM_PROGMEM *)address, 1);
    return value;
}

static uint16_t read_flash_u16(uint32_t address) {
    uint8_t bytes[2];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 2);
    return (uint16_t)((uint32_t)bytes[0] | ((uint32_t)bytes[1] << 8));
}

static uint32_t read_flash_u24(uint32_t address) {
    uint8_t bytes[3];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 3);
    return (uint32_t)bytes[0] | ((uint32_t)bytes[1] << 8) |
           ((uint32_t)bytes[2] << 16);
}
#endif

/* Validates one directory entry's section and records its fields in block.
 * The counted tables must have exactly the size their count implies. */
static uint8_t open_section(avm_crash_block_t *block, uint8_t index,
                            uint32_t section, uint32_t length,
                            uint32_t *transitions) {
    uint32_t count;
    uint32_t record;
    if (index == 3) { /* Source transition stream: a uint24 count, then opcodes. */
        if (length < 3)
            return 0;
        *transitions = read_flash_u24(section);
        block->stream = section + 3;
        block->stream_bytes = length - 3;
        return 1;
    }
    if (index == 4) { /* String pool. */
        block->strings = section;
        block->strings_end = section + length;
        return 1;
    }
    /* Function index, filename index, and checkpoints. */
    if (length < 2)
        return 0;
    count = read_flash_u16(section);
    record = index == 0 ? AVD1_FUNCTION_SIZE
             : index == 1 ? AVD1_FILE_SIZE
                          : AVD1_CHECKPOINT_SIZE;
    if (length != 2 + count * record)
        return 0;
    if (index == 0) {
        block->function_count = (uint16_t)count;
        block->functions = section + 2;
    } else if (index == 1) {
        block->file_count = (uint16_t)count;
        block->files = section + 2;
    } else {
        block->checkpoint_count = (uint16_t)count;
        block->checkpoints = section + 2;
    }
    return 1;
}

/* Validates the header, the section directory, and the checkpoint layout.
 * Returns 0 when the block is absent or malformed. Stream contents are checked
 * only as lookups reach them, so opening never scans the whole stream. */
static uint8_t open_crash_block(avm_crash_block_t *block) {
    uint32_t base = read_flash_u24(AVD1_CRASH_INFO_ADDR);
    uint32_t size;
    uint32_t expected = AVD1_PAYLOAD_START;
    uint32_t transitions = 0;
    uint32_t checkpoint;
    uint8_t i;

    if (base == 0 || base > AVD1_ADDRESS_LIMIT - AVD1_PAYLOAD_START)
        return 0;
    if (read_flash_u8(base) != 'A' || read_flash_u8(base + 1) != 'V' ||
        read_flash_u8(base + 2) != 'D' || read_flash_u8(base + 3) != '1')
        return 0;
    size = read_flash_u24(base + 4);
    if (read_flash_u8(base + 7) != AVD1_SECTION_COUNT ||
        read_flash_u8(base + 8) != 0 || read_flash_u24(base + 9) != 0)
        return 0;
    if (size < AVD1_PAYLOAD_START || size > AVD1_ADDRESS_LIMIT - base)
        return 0;

    /* Sections are consecutive in type order. Their sizes sum to at most five
     * 24-bit values, so the running total cannot overflow, and the final check
     * makes every section lie inside the block. */
    for (i = 0; i < AVD1_SECTION_COUNT; ++i) {
        uint32_t entry = base + AVD1_HEADER_SIZE + i * AVD1_DIRECTORY_ENTRY_SIZE;
        uint32_t offset = read_flash_u24(entry + 1);
        uint32_t length = read_flash_u24(entry + 4);
        if (read_flash_u8(entry) != i + 1 || offset != expected)
            return 0;
        expected += length;
        if (!open_section(block, i, base + offset, length, &transitions))
            return 0;
    }
    if (expected != size)
        return 0;

    /* Checkpoint 0 is the state before the first transition. */
    if (block->checkpoint_count != transitions / AVD1_CHECKPOINT_INTERVAL + 1)
        return 0;
    checkpoint = block->checkpoints;
    if (read_flash_u24(checkpoint) != 0 || read_flash_u24(checkpoint + 3) != 0 ||
        read_flash_u8(checkpoint + 11) != 0)
        return 0;
    return 1;
}

/* Copies the NUL-terminated string at address into dst, reading no further
 * than capacity - 1 bytes and never past the string pool. A string cut at the
 * capacity is still valid. Returns 0 when no terminator lies in the pool. */
static uint8_t copy_string(avm_crash_block_t const *block, uint32_t address,
                           char *dst, uint8_t capacity) {
    uint32_t available;
    uint8_t count = capacity - 1;
    uint8_t i;

    if (address < block->strings || address >= block->strings_end)
        return 0;
    available = block->strings_end - address;
    if (available < count)
        count = (uint8_t)available;
    memcpy_P(dst, (uint8_t const AVM_PROGMEM *)address, count);
    for (i = 0; i < count; ++i) {
        if (dst[i] == '\0')
            return 1;
    }
    dst[count] = '\0';
    return count == capacity - 1;
}

/* Reads one canonical ULEB128 operand. It accepts at most four bytes, rejects
 * an operand that ends in a zero byte after the first, and never reads past
 * the stream. */
static uint8_t read_uleb128(avm_crash_block_t const *block, uint32_t *offset,
                            uint32_t *value) {
    uint32_t result = 0;
    uint8_t shift = 0;
    for (;;) {
        uint8_t byte;
        if (*offset >= block->stream_bytes || shift > 21)
            return 0;
        byte = read_flash_u8(block->stream + *offset);
        *offset += 1;
        result |= (uint32_t)(byte & 0x7f) << shift;
        if ((byte & 0x80) == 0) {
            if (byte == 0 && shift != 0)
                return 0;
            *value = result;
            return 1;
        }
        shift += 7;
    }
}

/* Inverts ZigZag as 32-bit two's complement: 1 maps to -1, 2 to 1, 3 to -2. */
static uint32_t zigzag_decode(uint32_t value) {
    return (value & 1) ? ~(value >> 1) : (value >> 1);
}

/* Decodes the transition at in->offset into out. Returns 0 for an unknown
 * opcode, a truncated or noncanonical operand, an invalid file or line, or a
 * PC delta that is zero or overflows. out is undefined when 0 is returned. */
static uint8_t decode_source_transition(avm_crash_block_t const *block,
                                        avm_source_state_t const *in,
                                        avm_source_state_t *out) {
    uint32_t offset = in->offset;
    uint32_t pc_delta = 0;
    uint32_t line = in->line;
    uint32_t operand = 0;
    uint8_t opcode;

    if (offset >= block->stream_bytes)
        return 0;
    opcode = read_flash_u8(block->stream + offset);
    offset += 1;
    out->file = in->file;
    out->mapped = in->mapped;
    if (opcode < 0x80) {
        /* One-byte combined: PC delta 1-16, line delta -4 to +3, same file. */
        if (!in->mapped)
            return 0;
        pc_delta = (uint32_t)(opcode & 0x0f) + 1;
        line = in->line + (uint32_t)((opcode >> 4) & 7) - 4;
    } else if (opcode == 0x80) {
        /* Set mapping: PC delta, file ID, and absolute line. */
        if (!read_uleb128(block, &offset, &pc_delta))
            return 0;
        if (!read_uleb128(block, &offset, &operand) ||
            operand >= block->file_count)
            return 0;
        out->file = (uint16_t)operand;
        if (!read_uleb128(block, &offset, &line))
            return 0;
        out->mapped = 1;
    } else if (opcode == 0x81) {
        /* Large same-file transition: PC delta and ZigZag line delta. */
        if (!in->mapped)
            return 0;
        if (!read_uleb128(block, &offset, &pc_delta) ||
            !read_uleb128(block, &offset, &operand))
            return 0;
        line = in->line + zigzag_decode(operand);
    } else if (opcode == 0x82) {
        /* Enter an unmapped region. The file and line are cleared. */
        if (!read_uleb128(block, &offset, &pc_delta))
            return 0;
        out->mapped = 0;
        out->file = 0;
        line = 0;
    } else {
        return 0;
    }

    /* A mapped line lies in 1..0xFFFFFF, which one unsigned compare checks. A
     * zero PC delta and an overflowing one fail the same way. */
    if (out->mapped && line - 1 >= AVD1_MAX_LINE)
        return 0;
    if (pc_delta - 1 >= AVD1_ADDRESS_LIMIT - 1 - in->pc)
        return 0;
    out->line = line;
    out->pc = in->pc + pc_delta;
    out->offset = offset;
    return 1;
}

/* Restores the state at the last checkpoint whose PC is at most pc. Checkpoint
 * 0 has PC zero and is validated when the block opens, so a match always exists. */
static uint8_t find_checkpoint(avm_crash_block_t const *block, uint32_t pc,
                               avm_source_state_t *state) {
    uint32_t low = 0;
    uint32_t high = block->checkpoint_count;
    uint32_t record;
    while (low < high) {
        uint32_t middle = low + (high - low) / 2;
        if (read_flash_u24(block->checkpoints + middle * AVD1_CHECKPOINT_SIZE) <= pc)
            low = middle + 1;
        else
            high = middle;
    }
    if (low == 0)
        return 0;
    record = block->checkpoints + (low - 1) * AVD1_CHECKPOINT_SIZE;
    state->pc = read_flash_u24(record);
    state->offset = read_flash_u24(record + 3);
    state->file = read_flash_u16(record + 6);
    state->line = read_flash_u24(record + 8);
    state->mapped = read_flash_u8(record + 11) != 0;
    return 1;
}

/* Finds the function record with the largest start at or before pc and accepts
 * it only when pc lies before its end. Names are resolved in the string pool. */
static void lookup_function(avm_crash_block_t const *block, uint32_t pc,
                            avm_trap_location_t *out) {
    uint32_t low = 0;
    uint32_t high = block->function_count;
    uint32_t record;
    uint32_t name;
    while (low < high) {
        uint32_t middle = low + (high - low) / 2;
        if (read_flash_u24(block->functions + middle * AVD1_FUNCTION_SIZE) <= pc)
            low = middle + 1;
        else
            high = middle;
    }
    if (low == 0)
        return;
    record = block->functions + (low - 1) * AVD1_FUNCTION_SIZE;
    if (pc >= read_flash_u24(record + 3))
        return;
    name = block->strings + read_flash_u24(record + 6);
    if (copy_string(block, name, out->function, sizeof(out->function))) {
        out->has_function = 1;
    } else {
        out->function[0] = '?';
        out->function[1] = '\0';
    }
}

/* Applies the transitions at or before pc to the checkpoint state. The first
 * transition after pc is decoded but not applied. A checkpoint is at most 64
 * transitions from the answer, so more decodes mean malformed metadata. */
static void lookup_source(avm_crash_block_t const *block, uint32_t pc,
                          avm_trap_location_t *out) {
    avm_source_state_t state;
    avm_source_state_t next;
    uint32_t entry;
    uint32_t steps;

    if (!find_checkpoint(block, pc, &state))
        return;
    for (steps = 0; state.offset < block->stream_bytes; ++steps) {
        if (steps == AVD1_CHECKPOINT_INTERVAL)
            return;
        if (!decode_source_transition(block, &state, &next))
            return;
        if (next.pc > pc)
            break;
        state = next;
    }
    if (!state.mapped || state.file >= block->file_count)
        return;

    entry = block->files + (uint32_t)state.file * AVD1_FILE_SIZE;
    if (!copy_string(block, block->strings + read_flash_u24(entry),
                     out->file, sizeof(out->file))) {
        out->file[0] = '?';
        out->file[1] = '\0';
        return;
    }
    out->line = state.line;
    out->has_line = 1;
}

void __avm_trap_lookup(uint32_t pc, avm_trap_location_t *out) {
    avm_crash_block_t block;

    out->function[0] = '?';
    out->function[1] = '\0';
    out->file[0] = '?';
    out->file[1] = '\0';
    out->line = 0;
    out->has_function = 0;
    out->has_line = 0;

    if (!open_crash_block(&block))
        return;
    lookup_function(&block, pc, out);
    lookup_source(&block, pc, out);
}
