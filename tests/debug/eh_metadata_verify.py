#!/usr/bin/env python3
"""Verify the AVEH4 exception metadata in packed AVM images.

For an image built with the exception runtime, this script checks that:

* the program-space anchor __avm_eh_metadata_ptr is patched to a block whose
  header is AVEH4 and whose size fits in the image;
* each function record's sites_offset and next_offset match the sizes of its
  rows, sites, and calls, and the action pool fills the rest of the record;
* each action pool is a sequence of complete action lists. Every site's action
  names the start of one list, every list is named by a site, every catch entry
  has a nonzero selector and no repeated selector, and a catch-all is last;
* every function record lies in executable code, and every row PC, site endpoint,
  and landing pad is an instruction boundary in the linked ELF, so relaxation did
  not move any metadata address off an instruction;
* every typed catch names a flash-resident RTTI object, which the linked ELF
  places in program space;
* the sites and action lists equal the compiler's .avm.eh_sites records, which the
  linker relocated, and the call records equal .avm.eh_calls;
* packing with --no-crash-info still emits the block;
* the decoder rejects each malformed block in a fixed set of mutations.

For an image built without the exception runtime, it checks that the anchor does
not exist and that the image contains no AVEH4 block.

The layout is documented in docs/arch.md. The decoder below reads the image bytes
directly, and it shares no code with the packer. The ELF is read with llvm-nm,
llvm-readelf, and llvm-objdump.
"""

import argparse
import os
import re
import struct
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import eh_rtti_verify  # noqa: E402  (program-space placement of RTTI objects)

ANCHOR = '__avm_eh_metadata_ptr'
MAGIC = b'AVEH4'
HEADER_SIZE = 10
FUNCTION_HEADER_SIZE = 18
ROW_HEADER_SIZE = 5
ROW_MAX_SIZE = 13
SITE_SIZE = 12
CALL_SIZE = 5
ACTION_HEADER_SIZE = 3
CATCH_SIZE = 5
ARGUMENT_LIMIT = 256
FLAG_R3_BASE = 0x80
FLAG_RESERVED = 0x70
FLAG_SAVED_MASK = 0x0f
# The only action flag. Every other bit is reserved and must be zero.
ACTION_CLEANUP = 0x01
# Compiler .avm.eh_sites records: u24 start, u24 end, u16 count, u24 pool size.
SITES_RECORD_HEADER = 11
# Type descriptors lie above the reserved program header.
TYPE_BASE = 0x100
ADDRESS_LIMIT = 0x1000000


class Failure(Exception):
    pass


def check(condition, message):
    if not condition:
        raise Failure(message)


def u16(data, offset):
    check(offset + 2 <= len(data), 'read past the end of the data')
    return data[offset] | data[offset + 1] << 8


def u24(data, offset):
    check(offset + 3 <= len(data), 'read past the end of the data')
    return data[offset] | data[offset + 1] << 8 | data[offset + 2] << 16


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


def rtti_symbols(nm, elf):
    """Returns {address: name} for each defined _ZTI object in the ELF."""
    found = {}
    for line in run_tool(nm, [elf]).splitlines():
        parts = line.split()
        if len(parts) == 3 and parts[2].startswith('_ZTI'):
            found.setdefault(int(parts[0], 16), parts[2])
    return found


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


def pool_lists(data, start, end):
    """Decodes the action lists that fill [start, end) of data, in order. Returns
    [(offset from start, (has_cleanup, ((selector, type_address), ...)))]. Each list
    must be complete, its selectors must be nonzero and distinct, a catch-all must
    be last, and each typed address must lie in the program image."""
    lists = []
    cursor = start
    while cursor < end:
        check(cursor + ACTION_HEADER_SIZE <= end, 'action list header is truncated')
        flags = data[cursor]
        count = u16(data, cursor + 1)
        check(not flags & ~ACTION_CLEANUP, 'action list sets reserved flag bits')
        check(flags or count, 'action list has neither cleanup nor catch entries')
        check(cursor + ACTION_HEADER_SIZE + CATCH_SIZE * count <= end,
              'action list catch entries are truncated')
        entries = []
        for index in range(count):
            entry = cursor + ACTION_HEADER_SIZE + CATCH_SIZE * index
            selector = u16(data, entry)
            type_address = u24(data, entry + 2)
            check(selector != 0, 'catch entry has selector zero')
            check(all(selector != other for other, _ in entries),
                  'action list repeats selector %d' % selector)
            if type_address == 0:
                check(index == count - 1, 'catch-all entry is not last in its action list')
            else:
                check(TYPE_BASE <= type_address < ADDRESS_LIMIT,
                      'catch type address 0x%06x is outside program space' % type_address)
            entries.append((selector, type_address))
        lists.append((cursor - start, (bool(flags & ACTION_CLEANUP), tuple(entries))))
        cursor += ACTION_HEADER_SIZE + CATCH_SIZE * count
    check(cursor == end, 'action pool does not end at its boundary')
    return lists


def compiler_sites(objdump, elf):
    """Returns {function_start: (function_end, [site tuples])} from the linked
    .avm.eh_sites section. Each site tuple is (start, end, landing pad, action),
    where action is None or the (has_cleanup, entries) value of its list. The
    compiler wrote the records, and the linker relocated their addresses."""
    data = section_bytes(objdump, elf, '.avm.eh_sites')
    records = {}
    cursor = 0
    while cursor < len(data):
        check(cursor + SITES_RECORD_HEADER <= len(data),
              'compiler .avm.eh_sites record is truncated')
        start = u24(data, cursor)
        end = u24(data, cursor + 3)
        count = u16(data, cursor + 6)
        pool_size = u24(data, cursor + 8)
        cursor += SITES_RECORD_HEADER
        pool_at = cursor + SITE_SIZE * count
        check(pool_at + pool_size <= len(data),
              'compiler .avm.eh_sites sites or action pool are truncated')
        lists = dict(pool_lists(data, pool_at, pool_at + pool_size))
        sites = []
        for index in range(count):
            site = cursor + SITE_SIZE * index
            site_start = u24(data, site)
            site_end = u24(data, site + 3)
            landing = u24(data, site + 6)
            action = u24(data, site + 9)
            if action == 0:
                check(landing == 0, 'compiler site has a landing pad but no action')
                sites.append((site_start, site_end, 0, None))
            else:
                check(action - 1 in lists, 'compiler site names no action list')
                check(landing != 0, 'compiler site has an action but no landing pad')
                sites.append((site_start, site_end, landing, lists[action - 1]))
        cursor = pool_at + pool_size
        check(start not in records, 'duplicate compiler .avm.eh_sites record')
        records[start] = (end, sites)
    return records


def compiler_calls(objdump, elf):
    """Returns {function_start: [(return_pc, outgoing_bytes)]} from the linked
    .avm.eh_calls section. Each record is a start, a count, and one entry per call."""
    data = section_bytes(objdump, elf, '.avm.eh_calls')
    records = {}
    cursor = 0
    while cursor < len(data):
        check(cursor + 5 <= len(data), 'compiler .avm.eh_calls record is truncated')
        start = u24(data, cursor)
        count = u16(data, cursor + 3)
        cursor += 5
        calls = []
        for _ in range(count):
            check(cursor + CALL_SIZE <= len(data), 'compiler .avm.eh_calls entry is truncated')
            calls.append((u24(data, cursor), u16(data, cursor + 3)))
            cursor += CALL_SIZE
        check(start not in records, 'duplicate compiler .avm.eh_calls record')
        records[start] = calls
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
    check(offset + size <= len(image), 'AVEH4 read past the end of the image')
    return int.from_bytes(image[offset:offset + size], 'little')


def decode_block(image, block):
    """Decodes AVEH4 and returns (function dicts, block size).

    Each record's sites_offset and next_offset are read from the image bytes. They
    are compared with sizes computed from the record's own counts and rows, so the
    expected values do not come from the decoder's cursor. The action pool is the
    tail of the record, and it is decoded in full, so an action offset must name the
    start of one of its lists."""
    check(block + HEADER_SIZE <= len(image), 'AVEH4 header lies outside the image')
    check(image[block:block + 5] == MAGIC, 'AVEH4 magic is missing')
    count = read_u(image, block + 5, 2)
    size = read_u(image, block + 7, 3)
    check(size >= HEADER_SIZE, 'AVEH4 block size is smaller than its header')
    check(block + size <= len(image), 'AVEH4 block extends past the image')
    end = block + size
    functions = []
    record = block + HEADER_SIZE
    previous_end = 0
    for _ in range(count):
        check(record + FUNCTION_HEADER_SIZE <= end, 'AVEH4 function header is truncated')
        start = read_u(image, record, 3)
        function_end = read_u(image, record + 3, 3)
        row_count = read_u(image, record + 6, 2)
        site_count = read_u(image, record + 8, 2)
        call_count = read_u(image, record + 10, 2)
        sites_offset = read_u(image, record + 12, 3)
        next_offset = read_u(image, record + 15, 3)
        check(start < function_end, 'AVEH4 function range is empty')
        check(start >= previous_end, 'AVEH4 function ranges overlap or are unsorted')
        check(row_count > 0, 'AVEH4 function has no CFI rows')
        check(0 < next_offset <= end - record, 'AVEH4 next_offset does not end inside the block')
        previous_end = function_end

        # Walk the rows to measure them, then compare that size with sites_offset.
        cursor = record + FUNCTION_HEADER_SIZE
        rows = []
        previous_delta = None
        for index in range(row_count):
            check(cursor + ROW_HEADER_SIZE <= end, 'AVEH4 row is truncated')
            delta = read_u(image, cursor, 2)
            flags = image[cursor + 2]
            cfa_offset = struct.unpack_from('<h', image, cursor + 3)[0]
            mask = flags & FLAG_SAVED_MASK
            check(not flags & FLAG_RESERVED, 'AVEH4 row sets reserved flag bits')
            if index == 0:
                check(delta == 0, 'AVEH4 first row is not at the function start')
            else:
                check(delta > previous_delta, 'AVEH4 rows are not strictly increasing')
            check(start + delta < function_end, 'AVEH4 row lies outside its function')
            previous_delta = delta
            saved_count = bin(mask).count('1')
            slots_size = 2 * saved_count
            check(cursor + ROW_HEADER_SIZE + slots_size <= end, 'AVEH4 row slots are truncated')
            rows.append({'pc': start + delta, 'r3': bool(flags & FLAG_R3_BASE),
                         'cfa_offset': cfa_offset, 'mask': mask})
            cursor += ROW_HEADER_SIZE + slots_size
        row_bytes = cursor - (record + FUNCTION_HEADER_SIZE)
        expected_sites_offset = FUNCTION_HEADER_SIZE + row_bytes
        check(sites_offset == expected_sites_offset,
              'AVEH4 sites_offset is %d, but the rows end at %d' % (
                  sites_offset, expected_sites_offset))
        pool_offset = sites_offset + SITE_SIZE * site_count + CALL_SIZE * call_count
        check(pool_offset <= next_offset,
              'AVEH4 sites and calls end at %d, past next_offset %d' % (pool_offset, next_offset))

        sites = []
        check(cursor + site_count * SITE_SIZE <= end, 'AVEH4 sites are truncated')
        previous_site_end = start
        for _ in range(site_count):
            site_start = read_u(image, cursor, 3)
            site_end = read_u(image, cursor + 3, 3)
            landing = read_u(image, cursor + 6, 3)
            action = read_u(image, cursor + 9, 3)
            check(site_start < site_end, 'AVEH4 site range is empty')
            check(site_start >= previous_site_end, 'AVEH4 sites overlap or are unsorted')
            check(site_end <= function_end, 'AVEH4 site extends past its function')
            if action == 0:
                check(landing == 0, 'AVEH4 site with no action has a landing pad')
            else:
                check(start <= landing < function_end,
                      'AVEH4 handler or cleanup landing pad lies outside its function')
                check(pool_offset <= action < next_offset,
                      'AVEH4 site action 0x%x lies outside the action pool' % action)
            sites.append({'start': site_start, 'end': site_end, 'landing': landing,
                          'action_offset': action, 'action': None})
            previous_site_end = site_end
            cursor += SITE_SIZE

        calls = []
        check(cursor + call_count * CALL_SIZE <= end, 'AVEH4 calls are truncated')
        previous_return = start
        for _ in range(call_count):
            return_pc = read_u(image, cursor, 3)
            outgoing = read_u(image, cursor + 3, 2)
            check(start < return_pc <= function_end,
                  'AVEH4 call return PC lies outside its function')
            check(return_pc > previous_return, 'AVEH4 call records are not strictly increasing')
            check(outgoing < ARGUMENT_LIMIT,
                  'AVEH4 call passes more outgoing bytes than the stack holds')
            calls.append((return_pc, outgoing))
            previous_return = return_pc
            cursor += CALL_SIZE
        check(cursor == record + pool_offset,
              'AVEH4 calls do not end where the action pool starts')

        # The pool fills the rest of the record. Each list is decoded in full, and
        # its offset is relative to the function record, as the sites name it.
        pool = pool_lists(image, record + pool_offset, record + next_offset)
        lists = {record_offset: value for record_offset, value in
                 [(offset + pool_offset, value) for offset, value in pool]}
        for site in sites:
            if site['action_offset']:
                check(site['action_offset'] in lists,
                      'AVEH4 site action 0x%x is not the start of an action list'
                      % site['action_offset'])
                site['action'] = lists[site['action_offset']]
                check(any(site['start'] < pc <= site['end'] for pc, _ in calls),
                      'AVEH4 handler or cleanup site at 0x%x has no call record' % site['start'])
        used = {site['action_offset'] for site in sites if site['action_offset']}
        check(used == set(lists), 'AVEH4 action pool holds a list that no site uses')

        functions.append({'start': start, 'end': function_end, 'record': record,
                          'sites_offset': sites_offset, 'next_offset': next_offset,
                          'rows': rows, 'sites': sites, 'calls': calls,
                          'lists': lists})
        record += next_offset
    check(record == end, 'AVEH4 block size does not match its records')
    return functions, size


def verify_mutations_rejected(image, block, functions):
    """Damages one field of a valid block at a time, and checks that the decoder
    rejects each mutant. The mutations cover the header, the record offsets, the
    site actions, and the catch entries. The decoder is the independent one above,
    so each rejection comes from the bytes and not from the production runtime."""
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
        ('next_offset_inside_list', put(first + 15, next_offset - 1, 3)),
        ('block_truncated_in_last_record', put(block + 7, size - 1, 3)),
    ]
    site_fn = next((fn for fn in functions if any(s['action_offset'] for s in fn['sites'])), None)
    if site_fn is not None:
        site_index = next(i for i, s in enumerate(site_fn['sites']) if s['action_offset'])
        site = site_fn['sites'][site_index]
        site_at = site_fn['record'] + site_fn['sites_offset'] + SITE_SIZE * site_index
        list_at = site_fn['record'] + site['action_offset']
        mutants.append(('site_action_reserved_bit', put(list_at, ACTION_CLEANUP | 0x02, 1)))
        mutants.append(('site_action_all_bits', put(list_at, 0xff, 1)))
        mutants.append(('site_action_interior', put(site_at + 9, site['action_offset'] + 1, 3)))
        mutants.append(('site_action_past_pool', put(site_at + 9, site_fn['next_offset'] + 4, 3)))
        mutants.append(('site_action_no_pad', put(site_at + 6, 0, 3)))
        mutants.append(('list_count_large', put(list_at + 1, 0x0100, 2)))
        listed = [(offset, value[1]) for offset, value in sorted(site_fn['lists'].items())
                  if value[1]]
        if listed:
            offset, entries = listed[0]
            entry_at = site_fn['record'] + offset + 3
            mutants.append(('zero_selector', put(entry_at, 0, 2)))
            if len(entries) >= 2:
                mutants.append(('duplicate_selector', put(entry_at + CATCH_SIZE, entries[0][0], 2)))
                mutants.append(('catch_all_not_last', put(
                    entry_at + CATCH_SIZE * (len(entries) - 1) - CATCH_SIZE + 2, 0, 3)))
            typed = [i for i, (_, address) in enumerate(entries) if address]
            if typed:
                mutants.append(('type_outside_program', put(
                    entry_at + CATCH_SIZE * typed[0] + 2, 0x0050, 3)))
    for name, mutant in mutants:
        try:
            decode_block(mutant, block)
        except Failure:
            continue
        raise Failure('the decoder accepted the %s mutation' % name)


def compare_compiler(functions, objdump, elf):
    """Checks that the packed sites and action lists equal the compiler records,
    which name the same sites with the same selectors and descriptor addresses."""
    expected = compiler_sites(objdump, elf)
    for fn in functions:
        packed = [(s['start'], s['end'], s['landing'], s['action']) for s in fn['sites']]
        if fn['start'] in expected:
            end, sites = expected[fn['start']]
            check(end == fn['end'], 'function 0x%x ends at 0x%x in AVEH4 but 0x%x in the compiler records' % (
                fn['start'], fn['end'], end))
            check(sorted(sites, key=lambda t: t[0]) == sorted(packed, key=lambda t: t[0]),
                  'AVEH4 sites for 0x%x differ from the compiler records' % fn['start'])
        else:
            check(not packed, 'AVEH4 sites for 0x%x have no compiler records' % fn['start'])
    expected_calls = compiler_calls(objdump, elf)
    for fn in functions:
        if fn['start'] in expected_calls:
            check(fn['calls'] == expected_calls[fn['start']],
                  'AVEH4 calls for 0x%x differ from the compiler records' % fn['start'])
        else:
            check(not fn['calls'], 'AVEH4 calls for 0x%x have no compiler records' % fn['start'])
    packed_starts = {fn['start'] for fn in functions}
    missing = sorted(start for start in list(expected) + list(expected_calls)
                     if start not in packed_starts)
    if missing:
        raise Failure('compiler records for 0x%x have no AVEH4 function' % missing[0])


def verify_eh_image(args, elf, image_path):
    with open(image_path, 'rb') as handle:
        image = handle.read()
    anchor = symbol_address(args.nm, elf, ANCHOR)
    check(anchor is not None, 'exception image lacks the %s anchor' % ANCHOR)
    check(anchor + 3 <= len(image), 'anchor lies outside the image')
    block = read_u(image, anchor, 3)
    check(block != 0, 'anchor is not patched with an AVEH4 address')

    functions, size = decode_block(image, block)
    verify_mutations_rejected(image, block, functions)
    compare_compiler(functions, args.objdump, elf)

    # Every typed catch names a _ZTI object, and every such object is program data.
    rtti = rtti_symbols(args.nm, elf)
    typed_addresses = set()
    for fn in functions:
        for _, entries in fn['lists'].values():
            typed_addresses.update(address for _, address in entries if address)
    for address in sorted(typed_addresses):
        check(address in rtti, 'catch type 0x%06x names no _ZTI object in the ELF' % address)
    try:
        eh_rtti_verify.check_program_space(eh_rtti_verify.Elf(elf))
    except Exception as error:
        raise Failure('RTTI placement: %s' % error)

    boundaries = instruction_boundaries(args.objdump, elf)
    code = executable_ranges(args.readelf, elf)
    site_count = 0
    row_count = 0
    call_count = 0
    list_count = 0
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
            if site['action_offset']:
                check(site['landing'] in boundaries,
                      'landing pad 0x%x is not an instruction' % site['landing'])
                check(in_executable(code, site['landing']),
                      'landing pad 0x%x is not executable code' % site['landing'])
        list_count += len(fn['lists'])
    for fn in functions:
        for pc, _ in fn['calls']:
            call_count += 1
            check(pc in boundaries, 'call return PC 0x%x is not an instruction boundary' % pc)
    return {'anchor': anchor, 'block': block, 'size': size,
            'functions': len(functions), 'rows': row_count, 'sites': site_count,
            'calls': call_count, 'lists': list_count}


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
    check(MAGIC not in image, 'image without the exception runtime contains AVEH4')


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
            print('%s: AVEH4 at 0x%06x, %d bytes, %d functions, %d rows, %d sites, %d lists, %d calls' % (
                os.path.basename(elf), stats['block'], stats['size'],
                stats['functions'], stats['rows'], stats['sites'], stats['lists'],
                stats['calls']))
            with tempfile.TemporaryDirectory() as scratch:
                plain = os.path.join(scratch, 'plain.bin')
                run_tool(packer, ['--development', '--no-crash-info', elf, '-o', plain])
                with open(plain, 'rb') as handle:
                    no_crash = handle.read()
                check(MAGIC in no_crash, '--no-crash-info removed the AVEH4 block')
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
