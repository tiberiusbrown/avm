#!/usr/bin/env python3
"""Verify the AVEH3 exception metadata in packed AVM images.

For an image built with the exception runtime, this script checks that:

* the program-space anchor __avm_eh_metadata_ptr is patched to a block whose
  header is AVEH3 and whose size fits in the image;
* each function record's sites_offset and next_offset match the sizes of its
  rows, sites, and calls, which are computed from the record's counts and flags;
* every function record lies in executable code, its rows and sites are
  ordered and in bounds, and its landing pads are executable code;
* every function start, row PC, call-site endpoint, and landing pad is an
  instruction boundary in the linked ELF, so relaxation did not move any
  metadata address off an instruction;
* packing with --no-crash-info still emits the block;
* the decoder rejects each malformed block in a fixed set of mutations.

For an image built without the exception runtime, it checks that the anchor
does not exist and that the image contains no AVEH3 block.

The layout is documented in docs/arch.md, Section 69.3. The script reads the
linked ELF with llvm-nm, llvm-readelf, and llvm-objdump, and the image bytes
directly. It shares no code with the packer.
"""

import argparse
import os
import re
import struct
import subprocess
import sys
import tempfile

ANCHOR = '__avm_eh_metadata_ptr'
MAGIC = b'AVEH3'
HEADER_SIZE = 10
FUNCTION_HEADER_SIZE = 18
ROW_HEADER_SIZE = 5
ROW_MAX_SIZE = 13
SITE_SIZE = 10
CALL_SIZE = 5
ARGUMENT_LIMIT = 256
FLAG_R3_BASE = 0x80
FLAG_RESERVED = 0x70
FLAG_SAVED_MASK = 0x0f
# Site actions are flags. Bit 0 is a catch-all handler and bit 1 is a cleanup, so
# action 3 is a landing pad that cleans up and then catches.
ACTION_NONE = 0
ACTION_CATCH_ALL = 0x01
ACTION_CLEANUP = 0x02
ACTION_MASK = ACTION_CATCH_ALL | ACTION_CLEANUP


class Failure(Exception):
    pass


def check(condition, message):
    if not condition:
        raise Failure(message)


def run_tool(tool, args):
    result = subprocess.run([tool] + args, stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE, check=False)
    if result.returncode != 0:
        raise Failure('%s failed: %s' % (os.path.basename(tool),
                                         result.stderr.decode(errors='replace')))
    return result.stdout.decode(errors='replace')


def symbol_address(nm, elf, name):
    """Returns the address of a symbol, or None when the ELF lacks it."""
    for line in run_tool(nm, [elf]).splitlines():
        parts = line.split()
        if len(parts) == 3 and parts[2] == name:
            return int(parts[0], 16)
    return None


def section_bytes(objdump, elf, name):
    """Returns the linked bytes of a section, or b'' when the ELF lacks it."""
    try:
        text = run_tool(objdump, ['-s', '-j', name, elf])
    except Failure:
        return b''
    data = bytearray()
    pattern = re.compile(r'^\s*[0-9a-f]+\s+((?:[0-9a-f]{2,8}\s+)*[0-9a-f]{2,8})(?:\s{2,}|\s*$)')
    for line in text.splitlines():
        match = pattern.match(line)
        if match:
            data += bytes.fromhex(''.join(match.group(1).split()))
    return bytes(data)


def compiler_calls(objdump, elf):
    """Returns {function_start: [(return_pc, outgoing_bytes)]} from the linked
    .avm.eh_calls section. Each record is a start, a count, and one entry per call."""
    data = section_bytes(objdump, elf, '.avm.eh_calls')
    records = {}
    cursor = 0
    while cursor < len(data):
        check(cursor + 5 <= len(data), 'compiler .avm.eh_calls record is truncated')
        start = int.from_bytes(data[cursor:cursor + 3], 'little')
        count = int.from_bytes(data[cursor + 3:cursor + 5], 'little')
        cursor += 5
        calls = []
        for _ in range(count):
            check(cursor + CALL_SIZE <= len(data), 'compiler .avm.eh_calls entry is truncated')
            calls.append((int.from_bytes(data[cursor:cursor + 3], 'little'),
                          int.from_bytes(data[cursor + 3:cursor + 5], 'little')))
            cursor += CALL_SIZE
        check(start not in records, 'duplicate compiler .avm.eh_calls record')
        records[start] = calls
    return records


def compiler_sites(objdump, elf):
    """Returns {function_start: (function_end, [site tuples])} from the linked
    .avm.eh_sites section, which the compiler wrote and the linker relocated.
    A missing section means the program has no call-site records."""
    data = section_bytes(objdump, elf, '.avm.eh_sites')
    records = {}
    cursor = 0
    while cursor < len(data):
        check(cursor + 8 <= len(data), 'compiler .avm.eh_sites record is truncated')
        start = int.from_bytes(data[cursor:cursor + 3], 'little')
        end = int.from_bytes(data[cursor + 3:cursor + 6], 'little')
        count = int.from_bytes(data[cursor + 6:cursor + 8], 'little')
        cursor += 8
        sites = []
        for _ in range(count):
            check(cursor + 10 <= len(data), 'compiler .avm.eh_sites site is truncated')
            sites.append((int.from_bytes(data[cursor:cursor + 3], 'little'),
                          int.from_bytes(data[cursor + 3:cursor + 6], 'little'),
                          int.from_bytes(data[cursor + 6:cursor + 9], 'little'),
                          data[cursor + 9]))
            cursor += 10
        records[start] = (end, sites)
    return records


def instruction_boundaries(objdump, elf):
    boundaries = set()
    pattern = re.compile(r'^\s*([0-9a-f]+):\s')
    for line in run_tool(objdump, ['-d', elf]).splitlines():
        match = pattern.match(line)
        if match:
            boundaries.add(int(match.group(1), 16))
    return boundaries


def executable_ranges(readelf, elf):
    """Returns (address, size) for each allocated executable section."""
    ranges = []
    for line in run_tool(readelf, ['-S', '-W', elf]).splitlines():
        match = re.match(r'^\s*\[\s*\d+\]\s+\S+\s+\S+\s+([0-9a-f]+)\s+\S+\s+([0-9a-f]+)\s+\S+\s+(\S+)', line)
        if match and 'X' in match.group(3) and 'A' in match.group(3):
            ranges.append((int(match.group(1), 16), int(match.group(2), 16)))
    return ranges


def in_executable(ranges, address):
    return any(base <= address < base + size for base, size in ranges)


def read_u(image, offset, size):
    check(offset + size <= len(image), 'AVEH3 read past the end of the image')
    return int.from_bytes(image[offset:offset + size], 'little')


def decode_block(image, block):
    """Decodes AVEH3 and returns (function dicts, block size).

    Each record's sites_offset and next_offset are read from the image bytes. They
    are compared with sizes computed from the record's own counts, and the row
    bytes are summed from each row's flags, so the expected values do not come from
    the decoder's cursor."""
    check(block + HEADER_SIZE <= len(image), 'AVEH3 header lies outside the image')
    check(image[block:block + 5] == MAGIC, 'AVEH3 magic is missing')
    count = read_u(image, block + 5, 2)
    size = read_u(image, block + 7, 3)
    check(size >= HEADER_SIZE, 'AVEH3 block size is smaller than its header')
    check(block + size <= len(image), 'AVEH3 block extends past the image')
    end = block + size
    functions = []
    record = block + HEADER_SIZE
    previous_end = 0
    for _ in range(count):
        check(record + FUNCTION_HEADER_SIZE <= end, 'AVEH3 function header is truncated')
        start = read_u(image, record, 3)
        function_end = read_u(image, record + 3, 3)
        row_count = read_u(image, record + 6, 2)
        site_count = read_u(image, record + 8, 2)
        call_count = read_u(image, record + 10, 2)
        sites_offset = read_u(image, record + 12, 3)
        next_offset = read_u(image, record + 15, 3)
        check(start < function_end, 'AVEH3 function range is empty')
        check(start >= previous_end, 'AVEH3 function ranges overlap or are unsorted')
        check(row_count > 0, 'AVEH3 function has no CFI rows')
        check(0 < next_offset <= end - record, 'AVEH3 next_offset does not end inside the block')
        previous_end = function_end

        # Walk the rows to measure them, then compare that size with sites_offset.
        cursor = record + FUNCTION_HEADER_SIZE
        rows = []
        previous_delta = None
        for index in range(row_count):
            check(cursor + ROW_HEADER_SIZE <= end, 'AVEH3 row is truncated')
            delta = read_u(image, cursor, 2)
            flags = image[cursor + 2]
            cfa_offset = struct.unpack_from('<h', image, cursor + 3)[0]
            mask = flags & FLAG_SAVED_MASK
            check(not flags & FLAG_RESERVED, 'AVEH3 row sets reserved flag bits')
            if index == 0:
                check(delta == 0, 'AVEH3 first row is not at the function start')
            else:
                check(delta > previous_delta, 'AVEH3 rows are not strictly increasing')
            check(start + delta < function_end, 'AVEH3 row lies outside its function')
            previous_delta = delta
            saved_count = bin(mask).count('1')
            slots_size = 2 * saved_count
            check(cursor + ROW_HEADER_SIZE + slots_size <= end, 'AVEH3 row slots are truncated')
            rows.append({'pc': start + delta, 'r3': bool(flags & FLAG_R3_BASE),
                         'cfa_offset': cfa_offset, 'mask': mask})
            cursor += ROW_HEADER_SIZE + slots_size
        row_bytes = cursor - (record + FUNCTION_HEADER_SIZE)
        expected_sites_offset = FUNCTION_HEADER_SIZE + row_bytes
        check(sites_offset == expected_sites_offset,
              'AVEH3 sites_offset is %d, but the rows end at %d' % (
                  sites_offset, expected_sites_offset))
        expected_next_offset = sites_offset + SITE_SIZE * site_count + CALL_SIZE * call_count
        check(next_offset == expected_next_offset,
              'AVEH3 next_offset is %d, but sites and calls end at %d' % (
                  next_offset, expected_next_offset))

        sites = []
        check(cursor + site_count * SITE_SIZE <= end, 'AVEH3 sites are truncated')
        previous_site_end = start
        for _ in range(site_count):
            site_start = read_u(image, cursor, 3)
            site_end = read_u(image, cursor + 3, 3)
            landing = read_u(image, cursor + 6, 3)
            action = image[cursor + 9]
            check(site_start < site_end, 'AVEH3 site range is empty')
            check(site_start >= previous_site_end, 'AVEH3 sites overlap or are unsorted')
            check(site_end <= function_end, 'AVEH3 site extends past its function')
            check(action & ~ACTION_MASK == 0, 'AVEH3 site has unknown action bits in %d' % action)
            if action == ACTION_NONE:
                check(landing == 0, 'AVEH3 action 0 site has a landing pad')
            else:
                check(start <= landing < function_end,
                      'AVEH3 handler or cleanup landing pad lies outside its function')
            sites.append({'start': site_start, 'end': site_end,
                          'landing': landing, 'action': action})
            previous_site_end = site_end
            cursor += SITE_SIZE
        calls = []
        check(cursor + call_count * CALL_SIZE <= end, 'AVEH3 calls are truncated')
        previous_return = start
        for _ in range(call_count):
            return_pc = read_u(image, cursor, 3)
            outgoing = read_u(image, cursor + 3, 2)
            check(start < return_pc <= function_end,
                  'AVEH3 call return PC lies outside its function')
            check(return_pc > previous_return, 'AVEH3 call records are not strictly increasing')
            check(outgoing < ARGUMENT_LIMIT,
                  'AVEH3 call passes more outgoing bytes than the stack holds')
            calls.append((return_pc, outgoing))
            previous_return = return_pc
            cursor += CALL_SIZE
        check(cursor == record + next_offset, 'AVEH3 record does not end at next_offset')
        for site in sites:
            if site['action'] != ACTION_NONE:
                check(any(site['start'] < pc <= site['end'] for pc, _ in calls),
                      'AVEH3 handler or cleanup site at 0x%x has no call record' % site['start'])
        functions.append({'start': start, 'end': function_end, 'record': record,
                          'rows': rows, 'sites': sites, 'calls': calls})
        record += next_offset
    check(record == end, 'AVEH3 block size does not match its records')
    return functions, size


def verify_mutations_rejected(image, block, functions):
    """Damages one field of a valid block at a time, and checks that the decoder
    rejects each mutant. The mutations cover the header, the record offsets, and the
    tail of the block. The decoder is the independent one above, so each rejection
    comes from the bytes and not from the production runtime."""
    first = functions[0]['record']
    count = read_u(image, block + 5, 2)
    size = read_u(image, block + 7, 3)
    end = block + size
    sites_offset = read_u(image, first + 12, 3)
    next_offset = read_u(image, first + 15, 3)

    def put(address, value, width):
        out = bytearray(image)
        out[address:address + width] = (value & ((1 << (8 * width)) - 1)).to_bytes(width, 'little')
        return bytes(out)

    mutants = [
        ('magic', put(block, ord('X'), 1)),
        ('function_count_small', put(block + 5, count - 1, 2)),
        ('function_count_large', put(block + 5, count + 1, 2)),
        ('sites_offset_small', put(first + 12, sites_offset - 1, 3)),
        ('sites_offset_large', put(first + 12, sites_offset + 1, 3)),
        ('sites_offset_into_row', put(first + 12, FUNCTION_HEADER_SIZE + 2, 3)),
        ('next_offset_zero', put(first + 15, 0, 3)),
        ('next_offset_backward', put(first + 15, sites_offset - 1, 3)),
        ('next_offset_beyond_block', put(first + 15, end - first + 1, 3)),
        ('next_offset_inconsistent', put(first + 15, next_offset + 1, 3)),
        ('block_truncated_in_last_record', put(block + 7, size - 1, 3)),
    ]
    # The first site that has an action gets a reserved bit, and then every bit.
    site_fn = next((fn for fn in functions if fn['sites']), None)
    if site_fn is not None:
        action_at = site_fn['record'] + read_u(image, site_fn['record'] + 12, 3) + 9
        mutants.append(('site_action_reserved_bit',
                        put(action_at, ACTION_CATCH_ALL | 0x04, 1)))
        mutants.append(('site_action_all_bits', put(action_at, 0xff, 1)))
    for name, mutant in mutants:
        try:
            decode_block(mutant, block)
        except Failure:
            continue
        raise Failure('the decoder accepted the %s mutation' % name)


def verify_eh_image(args, elf, image_path):
    with open(image_path, 'rb') as handle:
        image = handle.read()
    anchor = symbol_address(args.nm, elf, ANCHOR)
    check(anchor is not None, 'exception image lacks the %s anchor' % ANCHOR)
    check(anchor + 3 <= len(image), 'anchor lies outside the image')
    block = read_u(image, anchor, 3)
    check(block != 0, 'anchor is not patched with an AVEH3 address')

    functions, size = decode_block(image, block)
    verify_mutations_rejected(image, block, functions)
    expected = compiler_sites(args.objdump, elf)
    for fn in functions:
        packed = [(s['start'], s['end'], s['landing'], s['action']) for s in fn['sites']]
        if fn['start'] in expected:
            end, sites = expected[fn['start']]
            check(end == fn['end'], 'function 0x%x ends at 0x%x in AVEH3 but 0x%x in the compiler records' % (
                fn['start'], fn['end'], end))
            check(sorted(sites) == sorted(packed),
                  'AVEH3 sites for 0x%x differ from the compiler records' % fn['start'])
        else:
            check(not packed, 'AVEH3 sites for 0x%x have no compiler records' % fn['start'])
    expected_calls = compiler_calls(args.objdump, elf)
    for fn in functions:
        if fn['start'] in expected_calls:
            check(fn['calls'] == expected_calls[fn['start']],
                  'AVEH3 calls for 0x%x differ from the compiler records' % fn['start'])
        else:
            check(not fn['calls'], 'AVEH3 calls for 0x%x have no compiler records' % fn['start'])
    packed_starts = {fn['start'] for fn in functions}
    missing = sorted(start for start in list(expected) + list(expected_calls)
                     if start not in packed_starts)
    if missing:
        raise Failure('compiler records for 0x%x have no AVEH3 function' % missing[0])
    boundaries = instruction_boundaries(args.objdump, elf)
    code = executable_ranges(args.readelf, elf)
    site_count = 0
    row_count = 0
    call_count = 0
    for fn in functions:
        check(in_executable(code, fn['start']), 'function 0x%x is not executable code' % fn['start'])
        check(fn['start'] in boundaries, 'function start 0x%x is not an instruction' % fn['start'])
        for row in fn['rows']:
            row_count += 1
            check(row['pc'] in boundaries, 'row PC 0x%x is not an instruction' % row['pc'])
        for site in fn['sites']:
            site_count += 1
            for address in (site['start'], site['end']):
                check(address in boundaries or address == fn['end'],
                      'site endpoint 0x%x is not an instruction boundary' % address)
            if site['action'] != ACTION_NONE:
                check(site['landing'] in boundaries,
                      'landing pad 0x%x is not an instruction' % site['landing'])
                check(in_executable(code, site['landing']),
                      'landing pad 0x%x is not executable code' % site['landing'])
    for fn in functions:
        for pc, _ in fn['calls']:
            call_count += 1
            check(pc in boundaries, 'call return PC 0x%x is not an instruction boundary' % pc)
    return {'anchor': anchor, 'block': block, 'size': size,
            'functions': len(functions), 'rows': row_count, 'sites': site_count,
            'calls': call_count}


def verify_packer_rejects(packer, elf, scratch):
    """Hiding a record section that a catch-all site needs must fail the pack. The
    section is renamed in the ELF section-name table to a name of the same length,
    which the packer does not recognize. The packer must name the missing record."""
    cases = [(b'.avm.eh_calls\0', b'.avm.eh_xalls\0', 'has no call record'),
             (b'.debug_frame\0', b'.debug_xrame\0', 'no .debug_frame unwind information')]
    with open(elf, 'rb') as handle:
        original = handle.read()
    for name, renamed, diagnostic in cases:
        check(original.count(name) == 1, 'the ELF section name %r is not unique' % name)
        damaged = os.path.join(scratch, name.strip(b'.\0').decode() + '-hidden.elf')
        with open(damaged, 'wb') as handle:
            handle.write(original.replace(name, renamed))
        result = subprocess.run(
            [packer, '--development', '--no-crash-info', damaged,
             '-o', os.path.join(scratch, 'rejected.bin')],
            capture_output=True, text=True)
        check(result.returncode != 0 and diagnostic in result.stderr,
              'packer accepted an image hiding %s (stderr: %s)' % (
                  name.decode(), result.stderr.strip()))


def verify_no_eh_image(args, elf, image_path):
    check(symbol_address(args.nm, elf, ANCHOR) is None,
          'image without the exception runtime defines %s' % ANCHOR)
    with open(image_path, 'rb') as handle:
        image = handle.read()
    check(MAGIC not in image, 'image without the exception runtime contains AVEH3')


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True,
                        help='directory containing llvm-nm, llvm-readelf, llvm-objdump, llvm-avm-image')
    parser.add_argument('--eh-elf', action='append', default=[],
                        help='linked ELF of an exception-enabled program')
    parser.add_argument('--eh-image', action='append', default=[],
                        help='packed image for each --eh-elf')
    parser.add_argument('--no-eh-elf', action='append', default=[],
                        help='linked ELF of a program without exception support')
    parser.add_argument('--no-eh-image', action='append', default=[],
                        help='packed image for each --no-eh-elf')
    args = parser.parse_args()
    args.nm = os.path.join(args.bin_dir, 'llvm-nm')
    args.readelf = os.path.join(args.bin_dir, 'llvm-readelf')
    args.objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    packer = os.path.join(args.bin_dir, 'llvm-avm-image')
    check(len(args.eh_elf) == len(args.eh_image) and len(args.no_eh_elf) == len(args.no_eh_image),
          'each ELF needs one image')

    failures = []
    for elf, image in zip(args.eh_elf, args.eh_image):
        try:
            stats = verify_eh_image(args, elf, image)
            print('%s: AVEH3 at 0x%06x, %d bytes, %d functions, %d rows, %d sites, %d calls' % (
                os.path.basename(elf), stats['block'], stats['size'],
                stats['functions'], stats['rows'], stats['sites'], stats['calls']))
            with tempfile.TemporaryDirectory() as scratch:
                plain = os.path.join(scratch, 'plain.bin')
                run_tool(packer, ['--development', '--no-crash-info', elf, '-o', plain])
                with open(plain, 'rb') as handle:
                    no_crash = handle.read()
                check(MAGIC in no_crash, '--no-crash-info removed the AVEH3 block')
                verify_eh_image(args, elf, plain)
                verify_packer_rejects(packer, elf, scratch)
        except Failure as error:
            failures.append('%s: %s' % (elf, error))

    for elf, image in zip(args.no_eh_elf, args.no_eh_image):
        try:
            verify_no_eh_image(args, elf, image)
            print('%s: no exception metadata' % os.path.basename(elf))
        except Failure as error:
            failures.append('%s: %s' % (elf, error))

    for failure in failures:
        print('FAIL: ' + failure, file=sys.stderr)
    return 1 if failures else 0


if __name__ == '__main__':
    sys.exit(main())
