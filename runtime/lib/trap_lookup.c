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
/* Record offsets by shifts and adds. A 32-bit multiply is a runtime call. */
#define AVD1_FUNCTION_OFFSET(i) (((i) << 3) + (i))
#define AVD1_CHECKPOINT_OFFSET(i) (((i) << 3) + ((i) << 2))
#define AVD1_FILE_OFFSET(i) (((i) << 1) + (i))

/* Validated view of the block. Table fields hold absolute program addresses
 * that point past their uint16 counts, and the stream and pool bounds are
 * absolute too, so no lookup recomputes them. */
typedef struct {
    uint32_t functions;    /* function records */
    uint32_t files;        /* filename references */
    uint32_t checkpoints;  /* checkpoint records */
    uint32_t stream;       /* first transition opcode */
    uint32_t stream_end;   /* one past the last opcode */
    uint32_t strings;      /* string pool */
    uint32_t strings_end;  /* one past the last pool byte */
    uint16_t function_count;
    uint16_t file_count;
    uint16_t checkpoint_count;
} avm_crash_block_t;

/* Source state. The stream offset is relative to the first opcode. File and
 * line survive an unmapped state, so a later mapped transition can resume
 * from them. Only mapped states answer a lookup. */
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
    uint32_t expected;
    if (index == 3) { /* Source transition stream: a uint24 count, then opcodes. */
        if (length < 3)
            return 0;
        *transitions = read_flash_u24(section);
        block->stream = section + 3;
        block->stream_end = section + length;
        return 1;
    }
    if (index == 4) { /* String pool. */
        block->strings = section;
        block->strings_end = section + length;
        return 1;
    }
    /* Function index, filename index, and checkpoints. The expected size is the
     * count times the record size, written as shifts and adds. */
    if (length < 2)
        return 0;
    count = read_flash_u16(section);
    if (index == 0) {
        expected = AVD1_FUNCTION_OFFSET(count);
    } else if (index == 1) {
        expected = AVD1_FILE_OFFSET(count);
    } else {
        expected = AVD1_CHECKPOINT_OFFSET(count);
    }
    if (length != 2 + expected)
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

/* Reads one canonical ULEB128 value at *cursor, an absolute program address, and
 * advances the cursor past it. The operand ends before end, has at most four
 * bytes, and does not end in a zero byte after its first. Each byte has a fixed
 * shift, so no variable-shift helper runs. */
__attribute__((noinline)) static uint8_t read_uleb128(uint32_t *cursor, uint32_t end,
                                                      uint32_t *value) {
    uint32_t address = *cursor;
    uint32_t result;
    uint8_t byte;
    if (address >= end)
        return 0;
    byte = read_flash_u8(address++);
    result = byte & 0x7f;
    if (byte & 0x80) {
        if (address >= end)
            return 0;
        byte = read_flash_u8(address++);
        result |= (uint32_t)(byte & 0x7f) << 7;
        if (byte & 0x80) {
            if (address >= end)
                return 0;
            byte = read_flash_u8(address++);
            result |= (uint32_t)(byte & 0x7f) << 14;
            if (byte & 0x80) {
                if (address >= end)
                    return 0;
                byte = read_flash_u8(address++);
                if (byte & 0x80)
                    return 0;
                result |= (uint32_t)byte << 21;
            }
        }
        if (byte == 0)
            return 0;
    }
    *cursor = address;
    *value = result;
    return 1;
}

/* Returns the program address of the string named by a pool offset, or 0. The
 * record at offset is a canonical ULEB128 length, the characters, and a NUL.
 * The returned address is the first character, and it is valid only when the
 * length is nonzero and the NUL lies inside the pool. Only the prefix and the
 * terminator are read, and nothing is copied to RAM. */
static char const AVM_PROGMEM *lookup_string(avm_crash_block_t const *block,
                                             uint32_t offset) {
    uint32_t cursor = block->strings + offset;
    uint32_t length;
    if (!read_uleb128(&cursor, block->strings_end, &length))
        return 0;
    if (length == 0 || length >= block->strings_end - cursor)
        return 0;
    if (read_flash_u8(cursor + length) != 0)
        return 0;
    return (char const AVM_PROGMEM *)cursor;
}

/* Inverts ZigZag as 32-bit two's complement: 1 maps to -1, 2 to 1, 3 to -2. */
static uint32_t zigzag_decode(uint32_t value) {
    return (value & 1) ? ~(value >> 1) : (value >> 1);
}

/* Decodes the transition at in->offset into out, which holds the state from
 * out->pc through the next transition. Returns 0 for a truncated or noncanonical
 * operand, an invalid file or line, a zero or overflowing PC delta, or a
 * same-file opcode with no line to resume from. Every opcode is valid, so the
 * opcode byte alone never fails. out is undefined when 0 is returned. */
static uint8_t decode_source_transition(avm_crash_block_t const *block,
                                        avm_source_state_t const *in,
                                        avm_source_state_t *out) {
    uint32_t cursor = block->stream + in->offset;
    uint32_t pc_delta = 0;
    uint32_t line = in->line;
    uint32_t file = in->file;
    uint32_t operand = 0;
    uint8_t mapped = 1;
    uint8_t opcode;

    if (cursor >= block->stream_end)
        return 0;
    opcode = read_flash_u8(cursor++);
    if (opcode < 0x80) {
        /* Combined: PC delta 1-16 and line delta -4 to +3, same file. */
        if (in->line == 0)
            return 0;
        pc_delta = (uint32_t)(opcode & 0x0f) + 1;
        line = in->line + (uint32_t)((opcode >> 4) & 7) - 4;
    } else if (opcode == 0x80) {
        /* Absolute mapping: PC delta, file ID, and line. */
        if (!read_uleb128(&cursor, block->stream_end, &pc_delta) ||
            !read_uleb128(&cursor, block->stream_end, &operand) ||
            operand >= block->file_count)
            return 0;
        file = operand;
        if (!read_uleb128(&cursor, block->stream_end, &line))
            return 0;
    } else if (opcode >= 0x93) {
        /* Short unmapped: PC advance 1-109 with no operand. */
        pc_delta = (uint32_t)opcode - 0x92u;
        mapped = 0;
    } else {
        /* 0x81 and 0x82 carry a ULEB128 PC delta, and 0x83-0x92 carry it in the
         * opcode. 0x82 is unmapped and has no line operand. The others read a
         * ZigZag line delta from the same file. */
        if (opcode == 0x81 || opcode == 0x82) {
            if (!read_uleb128(&cursor, block->stream_end, &pc_delta))
                return 0;
        } else {
            pc_delta = (uint32_t)opcode - 0x82u;
        }
        mapped = opcode != 0x82;
        if (mapped) {
            if (in->line == 0 ||
                !read_uleb128(&cursor, block->stream_end, &operand))
                return 0;
            line = in->line + zigzag_decode(operand);
        }
    }

    /* A mapped line lies in 1..0xFFFFFF, which one unsigned compare checks, and
     * an unsigned line delta wraps to a value that fails the same compare. A zero
     * PC delta and an overflowing one fail the second compare. */
    if (mapped && line - 1 >= AVD1_MAX_LINE)
        return 0;
    if (pc_delta - 1 >= AVD1_ADDRESS_LIMIT - 1 - in->pc)
        return 0;
    out->pc = in->pc + pc_delta;
    out->offset = cursor - block->stream;
    out->line = line;
    out->file = (uint16_t)file;
    out->mapped = mapped;
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
        if (read_flash_u24(block->checkpoints + AVD1_CHECKPOINT_OFFSET(middle)) <= pc)
            low = middle + 1;
        else
            high = middle;
    }
    if (low == 0)
        return 0;
    record = block->checkpoints + AVD1_CHECKPOINT_OFFSET(low - 1);
    state->pc = read_flash_u24(record);
    state->offset = read_flash_u24(record + 3);
    state->file = read_flash_u16(record + 6);
    state->line = read_flash_u24(record + 8);
    state->mapped = read_flash_u8(record + 11) != 0;
    return 1;
}

/* Finds the function record with the largest start at or before pc and accepts
 * it only when pc lies before its end. The name is a flash pointer, or null when
 * its string record is malformed. */
static void lookup_function(avm_crash_block_t const *block, uint32_t pc,
                            avm_trap_location_t *out) {
    uint32_t low = 0;
    uint32_t high = block->function_count;
    uint32_t record;
    while (low < high) {
        uint32_t middle = low + (high - low) / 2;
        if (read_flash_u24(block->functions + AVD1_FUNCTION_OFFSET(middle)) <= pc)
            low = middle + 1;
        else
            high = middle;
    }
    if (low == 0)
        return;
    record = block->functions + AVD1_FUNCTION_OFFSET(low - 1);
    if (pc >= read_flash_u24(record + 3))
        return;
    out->function = lookup_string(block, read_flash_u24(record + 6));
}

/* Applies the transitions at or before pc to the checkpoint state. The first
 * transition after pc is not applied. A checkpoint is at most 64 transitions from
 * the answer, so more decodes mean malformed metadata. */
static void lookup_source(avm_crash_block_t const *block, uint32_t pc,
                          avm_trap_location_t *out) {
    avm_source_state_t state;
    avm_source_state_t next;
    uint32_t steps;
    uint32_t entry;

    if (!find_checkpoint(block, pc, &state))
        return;
    for (steps = 0; block->stream + state.offset < block->stream_end; ++steps) {
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
    entry = block->files + AVD1_FILE_OFFSET((uint32_t)state.file);
    out->file = lookup_string(block, read_flash_u24(entry));
    if (out->file)
        out->line = state.line;
}

void __avm_trap_lookup(uint32_t pc, avm_trap_location_t *out) {
    avm_crash_block_t block;

    out->function = 0;
    out->file = 0;
    out->line = 0;
    if (!open_crash_block(&block))
        return;
    lookup_function(&block, pc, out);
    lookup_source(&block, pc, out);
}
