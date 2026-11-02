#!/usr/bin/env python3
"""Checks that malformed RTTI fails a throw instead of selecting a handler.

The image of eh_inheritance_corrupt_target runs unchanged first, and it must report
success. Then each mutation patches one RTTI field in a copy of the packed image. Every
mutation must end the run with the failure report, which means the throw was not
caught, and the handler never ran. The mutations cover an unknown vtable address point
on the thrown class and on a base, an out-of-range base address, an excessive base
count, a reserved flag bit, an offset that is negative or past the object, a cycle,
and a virtual edge, which matches nothing and so ends the throw as unhandled.
"""

import argparse
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_rtti_verify as rtti  # noqa: E402

check = rtti.check

PAIR = '_ZTIN12_GLOBAL__N_14PairE'
LEFT = '_ZTIN12_GLOBAL__N_14LeftE'
RIGHT = '_ZTIN12_GLOBAL__N_15RightE'

# The VMI descriptor of Pair: a 10-byte header, then two 7-byte base entries. Each entry
# is a 3-byte descriptor address and a 4-byte offset-and-flags word.
COUNT = 8
LEFT_ENTRY = 10
RIGHT_ENTRY = 17
FLAGS = 3
OFFSET = 4

SNAPSHOT_STATUS = 'status: debug_break'
SERIAL = re.compile(r' serial="([^"]*)"')


def run(args, image_path):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', image_path, '--elf', args.elf, '--cycle-limit', '400000000']
    result = subprocess.run(command, capture_output=True, text=True)
    check(SNAPSHOT_STATUS in result.stdout,
          'the probe run did not finish cleanly for %s:\n%s'
          % (os.path.basename(image_path), result.stdout[-800:]))
    serial = SERIAL.search(result.stdout)
    check(serial is not None, 'the probe printed no serial output for %s'
          % os.path.basename(image_path))
    return serial.group(1)


def put(data, address, value, size):
    for i in range(size):
        data[address + i] = (value >> (8 * i)) & 0xff


def mutations(pair, left, right):
    """Each mutation names its effect and patches a copy of the image."""
    right_entry = pair + RIGHT_ENTRY
    right_flags = right_entry + FLAGS
    right_offset = right_entry + OFFSET
    left_base = pair + LEFT_ENTRY
    return [
        ('unknown vtable address point on the thrown class',
         lambda d: put(d, pair, 0x000123, 3)),
        ('unknown vtable address point on a base',
         lambda d: put(d, right, 0x000123, 3)),
        ('base address below the reserved header',
         lambda d: put(d, right_entry, 0x000010, 3)),
        ('excessive base count',
         lambda d: put(d, pair + COUNT, 0x0100, 2)),
        ('reserved flag bit set on a base',
         lambda d: d.__setitem__(right_flags, d[right_flags] | 0x04)),
        ('virtual base edge',
         lambda d: d.__setitem__(right_flags, d[right_flags] | 0x01)),
        ('offset below the start of the object',
         lambda d: put(d, right_offset, 0x800000, 3)),
        ('offset past the end of the object',
         lambda d: put(d, right_offset, 0x000100, 3)),
        ('cycle back to the thrown class',
         lambda d: put(d, left_base, pair, 3)),
    ]


def verify(args):
    elf = rtti.Elf(args.elf)
    with open(args.image, 'rb') as handle:
        original = bytearray(handle.read())
    decoded = rtti.decode_descriptor(elf, rtti.Image(args.image), PAIR)
    check([edge['offset'] for edge in decoded['edges']] == [0, 2],
          'Pair does not have the expected base offsets')
    pair = rtti.defined(elf, PAIR)['value']
    left = rtti.defined(elf, LEFT)['value']
    right = rtti.defined(elf, RIGHT)['value']
    check(decoded['bases'] == [left, right], 'Pair does not name Left and Right in order')

    serial = run(args, args.image)
    check(serial.endswith('P\\n'), 'the unchanged image did not report success: %r' % serial)
    print('  unchanged: %s' % serial)

    os.makedirs(args.scratch_dir, exist_ok=True)
    count = 0
    for index, (label, patch) in enumerate(mutations(pair, left, right)):
        data = bytearray(original)
        patch(data)
        check(bytes(data) != bytes(original), 'the %s mutation changed nothing' % label)
        path = os.path.join(args.scratch_dir, 'corrupt_%02d.bin' % index)
        with open(path, 'wb') as handle:
            handle.write(data)
        serial = run(args, path)
        check(serial.endswith('H\\n') and 'P' not in serial,
              '%s: the throw did not fail, serial %r' % (label, serial))
        print('  %s: %s' % (label, serial))
        count += 1
    print('eh_inheritance_corrupt_verify: %s: %d malformed RTTI fields fail the throw'
          % (os.path.basename(args.elf), count))


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--scratch-dir', required=True)
    args = parser.parse_args()
    verify(args)


if __name__ == '__main__':
    main()
