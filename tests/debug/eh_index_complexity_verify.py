#!/usr/bin/env python3
"""Checks that the AVEH5 function lookup is logarithmic in the number of functions.

The script builds synthetic, well-formed AVEH5 blocks of 1, 4, 16, 64, and 256
functions. Each block has one CFI row per function and no sites, so the records are
the minimal valid ones. A host-side reference implements the exact search that
eh_unwind.c runs, and it counts the index entries that the search reads. For each
size, the script checks the first, middle, and last functions, the bytes inside
each, a gap, the bytes before the first function, and the bytes after the last.
Every search must read no more than ceil(log2(N + 1)) index entries, the bound of a
binary search over N entries. Each result must match the function that covers the
PC, or no function when the PC lies in a gap or outside the block.

The runtime's own lookups are checked by eh_index_fixture in the C++ tests, which
throw through many functions of a linked program. This script covers the
complexity bound, which the linked fixtures do not reach.
"""

import sys

SIZES = [1, 4, 16, 64, 256]
HEADER_SIZE = 10
INDEX_ENTRY_SIZE = 6
FUNCTION_HEADER_SIZE = 18
ROW_SIZE = 5
RECORD_SIZE = FUNCTION_HEADER_SIZE + ROW_SIZE
BASE = 0x1000
STRIDE = 0x40
LENGTH = 0x30


class Failure(Exception):
    pass


def check(condition, message):
    if not condition:
        raise Failure(message)


def u24(data, offset):
    return int.from_bytes(data[offset:offset + 3], 'little')


def build_block(count):
    """Returns (block bytes, expected ranges). Function i covers [start, end) and its
    record follows the index in order."""
    records = bytearray()
    index = bytearray()
    ranges = []
    first_record = HEADER_SIZE + INDEX_ENTRY_SIZE * count
    for i in range(count):
        start = BASE + STRIDE * i
        end = start + LENGTH
        offset = first_record + RECORD_SIZE * i
        ranges.append((start, end, offset))
        index += start.to_bytes(3, 'little') + offset.to_bytes(3, 'little')
        # Function header: start, end, one row, no sites, no calls, sites after the row,
        # and next_offset to the following record.
        record = bytearray(start.to_bytes(3, 'little') + end.to_bytes(3, 'little'))
        record += (1).to_bytes(2, 'little') + (0).to_bytes(2, 'little') + (0).to_bytes(2, 'little')
        record += RECORD_SIZE.to_bytes(3, 'little') + RECORD_SIZE.to_bytes(3, 'little')
        # One row: delta 0, no saved registers, CFA offset 2.
        record += (0).to_bytes(2, 'little') + bytes([0]) + (2).to_bytes(2, 'little', signed=True)
        records += record
    size = HEADER_SIZE + len(index) + len(records)
    header = b'AVEH5' + count.to_bytes(2, 'little') + size.to_bytes(3, 'little')
    return bytes(header + index + records), ranges


def search(block, lookup):
    """The exact search of find_function over the index bytes. It returns the record
    offset that covers lookup, or None, and the number of index entries it read."""
    count = int.from_bytes(block[5:7], 'little')
    lo = 0
    hi = count
    reads = 0
    while lo < hi:
        mid = lo + ((hi - lo) >> 1)
        reads += 1
        if u24(block, HEADER_SIZE + INDEX_ENTRY_SIZE * mid) <= lookup:
            lo = mid + 1
        else:
            hi = mid
    if lo == 0:
        return None, reads
    selected = HEADER_SIZE + INDEX_ENTRY_SIZE * (lo - 1)
    start = u24(block, selected)
    offset = u24(block, selected + 3)
    end = u24(block, offset + 3)
    if not start <= lookup < end:
        return None, reads
    limit = len(block)
    next_offset = limit
    if lo < count:
        next_start = u24(block, selected + INDEX_ENTRY_SIZE)
        if next_start < end:
            return None, reads
        next_offset = u24(block, selected + INDEX_ENTRY_SIZE + 3)
    if offset + u24(block, offset + 15) != next_offset:
        return None, reads
    return offset, reads


def expected(ranges, pc):
    for start, end, offset in ranges:
        if start <= pc < end:
            return offset
    return None


def probe_points(ranges):
    points = {0, 0xffffff}
    previous_end = 0
    for start, end, _ in ranges:
        points.update({start - 1, start, start + (end - start) // 2, end - 1, end})
        if start > previous_end:
            points.update({previous_end, (previous_end + start) // 2, start - 1})
        previous_end = end
    points.update({previous_end, previous_end + 1})
    return sorted(p for p in points if 0 <= p <= 0xffffff)


def main():
    for count in SIZES:
        block, ranges = build_block(count)
        bound = count.bit_length()  # ceil(log2(count + 1)) for count >= 1
        worst = 0
        checked = 0
        for pc in probe_points(ranges):
            found, reads = search(block, pc)
            want = expected(ranges, pc)
            check(found == want,
                  'N=%d: lookup of 0x%x found %s, expected %s' % (
                      count, pc, found, want))
            check(reads <= bound,
                  'N=%d: lookup of 0x%x read %d entries, above the bound %d' % (
                      count, pc, reads, bound))
            worst = max(worst, reads)
            checked += 1
        print('N=%-4d lookups=%-4d worst=%d bound=%d' % (count, checked, worst, bound))
    print('index lookup is logarithmic for every size checked')
    return 0


if __name__ == '__main__':
    try:
        sys.exit(main())
    except Failure as error:
        print('FAIL: %s' % error, file=sys.stderr)
        sys.exit(1)
