#!/usr/bin/env python3
"""Runs corrupted AVEH3 blocks through the production unwinder.

Each mutant is a copy of a valid exception image with one field of the metadata
changed. The guest throws through protected_frame, and the probe reports how the
run ended. A corrupted block must end deterministically, and the probe must see no
native fault, no stack-range violation, and no timeout. A mutant that breaks a
field the throw consumes must end in the halt report, TH. A mutant that changes a
record the throw never reads must still print the valid output, TCP. No mutant may
print U, which would mean the unrelated handler caught the exception.
"""

import argparse
import os
import re
import subprocess
import sys
import tempfile

MAGIC = b'AVEH3'
HEADER_SIZE = 10
FUNCTION_HEADER_SIZE = 18
ROW_HEADER_SIZE = 5
SITE_SIZE = 10
CALL_SIZE = 5
FLAG_R3_BASE = 0x80
FLAG_SAVED_MASK = 0x0f

VALID = 'TCP\\n'
HALT = 'TH\\n'


class Failure(Exception):
    pass


def check(condition, message):
    if not condition:
        raise Failure(message)


def run(tool, args):
    result = subprocess.run([tool] + args, capture_output=True, text=True)
    check(result.returncode == 0, '%s failed: %s' % (tool, result.stderr.strip()))
    return result.stdout


def function_symbols(nm, elf):
    """Returns {name_without_signature: address} for the functions this test names."""
    names = {}
    for line in run(nm, ['-C', elf]).splitlines():
        parts = line.split(None, 2)
        if len(parts) != 3 or parts[1] not in ('t', 'T'):
            continue
        name = parts[2]
        for key in ('protected_frame', 'middle', 'leaf', 'unrelated'):
            if name.startswith('(anonymous namespace)::%s(' % key):
                names[key] = int(parts[0], 16)
    for key in ('protected_frame', 'middle', 'leaf', 'unrelated'):
        check(key in names, 'the ELF lacks the %s symbol' % key)
    return names


def read_u(data, offset, size):
    check(offset + size <= len(data), 'metadata read past the end of the image')
    return int.from_bytes(data[offset:offset + size], 'little')


def row_size(flags):
    return ROW_HEADER_SIZE + 2 * bin(flags & FLAG_SAVED_MASK).count('1')


def parse_block(data, block):
    """Returns the offsets of every function record. Each record's next record comes
    from its own next_offset, so no row is read to skip a record. The rows are read
    only inside a record, for the mutations that name them."""
    count = read_u(data, block + 5, 2)
    size = read_u(data, block + 7, 3)
    limit = block + size
    functions = []
    fh = block + HEADER_SIZE
    for _ in range(count):
        check(fh + FUNCTION_HEADER_SIZE <= limit, 'the function header is truncated')
        start = read_u(data, fh, 3)
        end = read_u(data, fh + 3, 3)
        rows = read_u(data, fh + 6, 2)
        sites = read_u(data, fh + 8, 2)
        calls = read_u(data, fh + 10, 2)
        sites_offset = read_u(data, fh + 12, 3)
        next_offset = read_u(data, fh + 15, 3)
        row_offsets = []
        cursor = fh + FUNCTION_HEADER_SIZE
        for _ in range(rows):
            row_offsets.append(cursor)
            cursor += row_size(data[cursor + 2])
        check(cursor == fh + sites_offset, 'the rows do not end at sites_offset')
        site_offset = fh + sites_offset
        functions.append({'start': start, 'end': end, 'rows': row_offsets,
                          'sites': site_offset, 'site_count': sites,
                          'calls': site_offset + SITE_SIZE * sites, 'call_count': calls,
                          'header': fh, 'next': fh + next_offset})
        fh = fh + next_offset
    check(fh == limit, 'the block does not end at its declared size')
    return functions, limit


def mutate(data, block, functions, limit, names, name):
    """Returns a copy of data with one field changed, or the copy itself for the
    controls. Each mutation names the record it changes."""
    out = bytearray(data)
    protected = next(f for f in functions if f['start'] <= names['protected_frame'] < f['end'])
    middle = next(f for f in functions if f['start'] <= names['middle'] < f['end'])
    unrelated = next(f for f in functions if f['start'] <= names['unrelated'] < f['end'])
    leaf = next(f for f in functions if f['start'] <= names['leaf'] < f['end'])
    # The first record past the throwing chain. A throw stops at leaf's record, so no
    # lookup reads this record.
    after = [f for f in functions if f['start'] >= leaf['end']]
    leaf_pad = middle['start']  # outside protected_frame, inside the block

    def put(offset, value, size):
        out[offset:offset + size] = int(value).to_bytes(size, 'little')

    sites_offset = protected['sites'] - protected['header']
    next_offset = protected['next'] - protected['header']
    if name == 'magic_mismatch':
        out[block] = ord('X')
    elif name == 'declared_length':
        put(block + 7, 0x10, 3)
    elif name == 'function_count':
        put(block + 5, read_u(data, block + 5, 2) + 1, 2)
    elif name == 'row_pc_delta':
        put(protected['rows'][0], 2, 2)
    elif name == 'cfa_base_register':
        # Flip every row of middle, so the row that covers its call is included.
        for row in middle['rows']:
            out[row + 2] ^= FLAG_R3_BASE
    elif name == 'reserved_mask_bit':
        out[protected['rows'][0] + 2] |= 0x10
    elif name == 'saved_slot_offset':
        # middle saves r3 in its prologue, and the rows after that save it too.
        saved = [r for r in middle['rows'] if out[r + 2] & FLAG_SAVED_MASK]
        check(saved, 'the fixture has no row in middle that saves a register')
        for row in saved:
            put(row + ROW_HEADER_SIZE, 0x0100, 2)
    elif name == 'landing_pad':
        put(protected['sites'] + 6, leaf_pad, 3)
    elif name == 'call_range':
        put(protected['sites'] + 3, protected['end'] + 2, 3)
    elif name == 'outgoing_argument_bytes':
        put(protected['calls'] + 3, 0x0100, 2)
    elif name == 'site_count_inconsistent':
        put(protected['header'] + 8, 0xffff, 2)
    elif name == 'call_count_zero':
        put(protected['header'] + 10, 0, 2)
    elif name == 'sites_offset_large':
        put(protected['header'] + 12, sites_offset + 1, 3)
    elif name == 'next_offset_zero':
        put(protected['header'] + 15, 0, 3)
    elif name == 'next_offset_backward':
        put(protected['header'] + 15, sites_offset - 1, 3)
    elif name == 'next_offset_past_block':
        put(protected['header'] + 15, limit - protected['header'] + 1, 3)
    elif name == 'next_offset_inconsistent':
        put(protected['header'] + 15, next_offset + 1, 3)
    elif name == 'control_unrelated_call_bytes':
        check(unrelated['call_count'] > 0, 'unrelated has no call record')
        put(unrelated['calls'] + 3, 2, 2)
        return out
    elif name == 'control_after_throw_next_offset':
        # The throw never reads this record, so the valid output must remain.
        check(after, 'no record follows the throwing chain to use as a control')
        record = after[0]
        put(record['header'] + 15, record['next'] - record['header'] + 1, 3)
        return out
    else:
        raise Failure('unknown mutation %s' % name)
    check(out != data, 'mutation %s changed nothing' % name)
    return out


# Mutations that break a field the throw consumes must halt cleanly.
MUST_HALT = ['magic_mismatch', 'declared_length', 'row_pc_delta', 'cfa_base_register',
             'reserved_mask_bit', 'saved_slot_offset', 'landing_pad', 'call_range',
             'outgoing_argument_bytes', 'site_count_inconsistent', 'call_count_zero',
             'sites_offset_large', 'next_offset_zero', 'next_offset_backward',
             'next_offset_past_block', 'next_offset_inconsistent']
# These controls change a record that the throw never reads. Their output must
# match the valid run.
MUST_MATCH = ['control_unrelated_call_bytes', 'control_after_throw_next_offset']
# The packer and avm_eh_validate_block check the function count. The throw walks
# to the block end instead, so this mutation may halt or run the valid path.
ANY_CLEAN = ['function_count']


def run_probe(probe, interpreter, boundary, image, elf, cycle_limit):
    result = subprocess.run(
        [probe, '--interpreter', interpreter, '--boundary', boundary,
         '--image', image, '--elf', elf, '--cycle-limit', str(cycle_limit)],
        capture_output=True, text=True)
    text = result.stdout
    status = re.search(r'^status: (.*)$', text, re.MULTILINE)
    check(status is not None, 'probe produced no status: %s' % result.stderr.strip())
    serial = re.search(r'serial="(.*)"$', status.group(1))
    check(serial is not None, 'probe status lacks serial output')
    fault = ('native fault' in text) or ('stack range violation' in text)
    finished = 'status: debug_break' in text
    return serial.group(1), finished, fault


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--nm', required=True)
    parser.add_argument('--cycle-limit', type=int, default=200000000)
    args = parser.parse_args()

    with open(args.image, 'rb') as handle:
        data = handle.read()
    block = data.find(MAGIC)
    check(block >= 0, 'the image has no AVEH3 block')
    check(data.find(MAGIC, block + 1) < 0, 'the image has more than one AVEH3 block')
    functions, limit = parse_block(data, block)
    names = function_symbols(args.nm, args.elf)

    # The valid image must produce the valid output before any mutant means anything.
    serial, finished, fault = run_probe(args.probe, args.interpreter, args.boundary,
                                        args.image, args.elf, args.cycle_limit)
    check(finished and not fault and serial == VALID,
          'the valid image did not print %s (got %r)' % (VALID, serial))

    failures = []
    with tempfile.TemporaryDirectory() as scratch:
        for name in MUST_HALT + MUST_MATCH + ANY_CLEAN:
            mutant = mutate(data, block, functions, limit, names, name)
            path = os.path.join(scratch, name + '.bin')
            with open(path, 'wb') as handle:
                handle.write(mutant)
            serial, finished, fault = run_probe(args.probe, args.interpreter, args.boundary,
                                                path, args.elf, args.cycle_limit)
            if not finished:
                outcome = 'did not reach debug_break (timeout or interpreter fault)'
            elif fault:
                outcome = 'native fault or stack range violation'
            elif 'U' in serial:
                outcome = 'entered the unrelated handler'
            elif name in MUST_HALT and serial != HALT:
                outcome = 'expected %s, got %r' % (HALT, serial)
            elif name in MUST_MATCH and serial != VALID:
                outcome = 'expected %s, got %r' % (VALID, serial)
            elif name in ANY_CLEAN and serial not in (VALID, HALT):
                outcome = 'expected %s or %s, got %r' % (VALID, HALT, serial)
            else:
                outcome = None
            label = 'ok' if outcome is None else 'FAIL'
            print('%-4s %-34s %r %s' % (label, name, serial,
                                         '' if outcome is None else outcome))
            if outcome is not None:
                failures.append((name, outcome))
    if failures:
        raise Failure('%d corrupted-metadata case(s) failed' % len(failures))
    print('all corrupted-metadata cases ended cleanly')


if __name__ == '__main__':
    try:
        main()
    except Failure as error:
        print('FAIL: %s' % error, file=sys.stderr)
        sys.exit(1)
