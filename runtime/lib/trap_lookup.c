#include <avm/pgmspace.h>
#include <avm/trap.h>
#include <string.h>

/* AVD1 layout written by llvm-avm-image. Offsets inside the block
 * are relative to its first byte. Addresses are 24-bit program addresses. */
#define AVD1_CRASH_INFO_ADDR 0x0f
#define AVD1_ADDRESS_LIMIT 0x1000000ul
#define AVD1_HEADER_SIZE 24
#define AVD1_FUNCTION_SIZE 9
#define AVD1_LINE_SIZE 12

typedef struct {
    uint32_t base;         /* first byte of the AVD1 block */
    uint32_t end;          /* one past the last byte of the block */
    uint32_t functions;    /* function record count */
    uint32_t lines;        /* line record count */
    uint32_t function_table;
    uint32_t line_table;
    uint32_t string_table;
} avm_crash_block_t;

/* Reads a little-endian uint24 from program memory. */
static uint32_t read_u24(uint32_t address) {
    uint8_t bytes[3];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 3);
    return (uint32_t)bytes[0] | ((uint32_t)bytes[1] << 8) |
           ((uint32_t)bytes[2] << 16);
}

static uint32_t read_u16(uint32_t address) {
    uint8_t bytes[2];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 2);
    return (uint32_t)bytes[0] | ((uint32_t)bytes[1] << 8);
}

/* Validates the header and the table layout. Returns 0 when the block is
 * absent or malformed. Records are read later, so only the header is copied. */
static uint8_t open_crash_block(avm_crash_block_t *block) {
    uint8_t header[AVD1_HEADER_SIZE];
    uint32_t base = read_u24(AVD1_CRASH_INFO_ADDR);
    uint32_t size;
    uint32_t functions;
    uint32_t lines;
    uint32_t function_table;
    uint32_t line_table;
    uint32_t string_table;

    if (base == 0 || base > AVD1_ADDRESS_LIMIT - AVD1_HEADER_SIZE)
        return 0;
    memcpy_P(header, (uint8_t const AVM_PROGMEM *)base, AVD1_HEADER_SIZE);
    if (header[0] != 'A' || header[1] != 'V' || header[2] != 'D' ||
        header[3] != '1')
        return 0;
    if (header[7] != 0 || read_u24(base + 21) != 0)
        return 0;

    size = read_u24(base + 4);
    functions = read_u16(base + 8);
    lines = read_u16(base + 10);
    function_table = read_u24(base + 12);
    line_table = read_u24(base + 15);
    string_table = read_u24(base + 18);

    /* Tables are consecutive, so every boundary is fixed by the counts. The
     * 24-bit offsets and 16-bit counts cannot overflow 32-bit arithmetic. */
    if (function_table != AVD1_HEADER_SIZE)
        return 0;
    if (line_table != function_table + functions * AVD1_FUNCTION_SIZE)
        return 0;
    if (string_table != line_table + lines * AVD1_LINE_SIZE)
        return 0;
    if (size < string_table || size > AVD1_ADDRESS_LIMIT - base)
        return 0;

    block->base = base;
    block->end = base + size;
    block->functions = functions;
    block->lines = lines;
    block->function_table = base + function_table;
    block->line_table = base + line_table;
    block->string_table = base + string_table;
    return 1;
}

/* Finds the record with the largest start <= pc and accepts it only when
 * pc < end. Records are fixed-size, sorted, and non-overlapping. */
static uint8_t find_record(uint32_t table, uint32_t count, uint32_t record_size,
                           uint32_t pc, uint32_t *record) {
    uint32_t low = 0;
    uint32_t high = count;
    while (low < high) {
        uint32_t middle = low + (high - low) / 2;
        if (read_u24(table + middle * record_size) <= pc)
            low = middle + 1;
        else
            high = middle;
    }
    if (low == 0)
        return 0;
    *record = table + (low - 1) * record_size;
    return pc < read_u24(*record + 3);
}

/* Copies the string at program address address into dst, reading no more than
 * capacity - 1 bytes and never past the block. A string that is cut at capacity
 * is still valid. Returns 0 for an address outside the string table or a string
 * with no terminator before the end of the block. */
static uint8_t copy_string(avm_crash_block_t const *block, uint32_t address,
                           char *dst, uint8_t capacity) {
    uint32_t available;
    uint8_t count;
    uint8_t i;

    if (address < block->string_table || address >= block->end)
        return 0;
    available = block->end - address;
    count = capacity - 1;
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

void __avm_trap_lookup(uint32_t pc, avm_trap_location_t *out) {
    avm_crash_block_t block;
    uint32_t record;

    out->function[0] = '?';
    out->function[1] = '\0';
    out->file[0] = '?';
    out->file[1] = '\0';
    out->line = 0;
    out->has_function = 0;
    out->has_line = 0;

    if (!open_crash_block(&block))
        return;

    if (find_record(block.function_table, block.functions,
                    AVD1_FUNCTION_SIZE, pc, &record)) {
        /* String offsets are relative to the start of the AVD1 block. */
        uint32_t name = block.base + read_u24(record + 6);
        if (copy_string(&block, name, out->function, sizeof(out->function))) {
            out->has_function = 1;
        } else {
            out->function[0] = '?';
            out->function[1] = '\0';
        }
    }

    if (find_record(block.line_table, block.lines, AVD1_LINE_SIZE,
                    pc, &record)) {
        uint32_t file = block.base + read_u24(record + 6);
        if (copy_string(&block, file, out->file, sizeof(out->file))) {
            out->line = read_u24(record + 9);
            out->has_line = 1;
        } else {
            out->file[0] = '?';
            out->file[1] = '\0';
        }
    }
}
