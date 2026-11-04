#!/usr/bin/env python3
"""Tests the opt-in snapshot fields of avm_eh_stack_probe: stack arguments and a RAM range.

The fixture's image is run twice at each named snapshot: once without the new options, and once
with --snapshot-stack-args and --snapshot-ram-range. The test checks that:

  1. stackargs= has exactly the requested number of bytes, in ascending address order;
  2. ram= has exactly the requested number of bytes, and ram_start= names its first address;
  3. the new bytes agree with the guest memory that the existing fields already report: the three
     bytes at r4 are the snapshot's bytes= field, the three bytes at SP are its record=, and the
     stack arguments are the RAM bytes at SP + 3;
  4. the existing fields are unchanged by the options, so the line without them is the line with
     them minus the new fields;
  5. invalid counts and ranges, including an overflowing range, are rejected before any run;
  6. the image file is not modified by the probe.

The probe is host-side only. It never writes guest memory or registers, and the test never runs a
guest service.
"""

import argparse
import hashlib
import os
import re
import subprocess
import sys

STATUS = 'status: debug_break'
RAM_BASE = 0x0100
RAM_LENGTH = 0x0a00
STACK_ARGS = 5
RECORD = re.compile(r'record=0x([0-9a-f]{6})')
SNAPSHOT_LINE = re.compile(r'^snapshot __dynamic_cast ')
NEW_FIELDS = re.compile(r' (stackargs=[0-9a-f]+|ram_start=[0-9a-f]{4} ram=[0-9a-f]+)')
INVALID = [
    ['--snapshot-stack-args', '0'],
    ['--snapshot-stack-args', '17'],
    ['--snapshot-stack-args', 'x'],
    ['--snapshot-stack-args', '100'],
    ['--snapshot-ram-range', '0B00:1'],
    ['--snapshot-ram-range', '0A00:0'],
    ['--snapshot-ram-range', 'FFF0:0020'],
    ['--snapshot-ram-range', 'zz:1'],
    ['--snapshot-ram-range', '0100'],
    ['--snapshot-ram-range', '0x100000000:1'],
    ['--snapshot-ram-range', '0100:0B00'],
]


class Failure(Exception):
    pass


def check(condition, message):
    if not condition:
        raise Failure(message)


def run(args, options):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf, '--cycle-limit', '600000000',
               '--snapshot', '__dynamic_cast', '--snapshot-bytes', '3'] + options
    result = subprocess.run(command, capture_output=True, text=True)
    return result


def digest(path):
    with open(path, 'rb') as f:
        return hashlib.sha256(f.read()).hexdigest()


def fields(line):
    """The new fields of a snapshot line, as bytes, and the line without them."""
    found = {}
    for name, pattern in [('stackargs', r' stackargs=([0-9a-f]+)'),
                          ('ram', r' ram=([0-9a-f]+)'),
                          ('ram_start', r' ram_start=([0-9a-f]{4})')]:
        match = re.search(pattern, line)
        if match:
            found[name] = match.group(1)
    return found


def check_matched_lines(with_options, without_options):
    entries = [l for l in with_options.splitlines() if SNAPSHOT_LINE.match(l)]
    plain = [l for l in without_options.splitlines() if SNAPSHOT_LINE.match(l)]
    check(entries, 'the probe with the new options printed no __dynamic_cast snapshot')
    check(len(entries) == len(plain),
          'the new options changed the number of snapshots: %d and %d'
          % (len(plain), len(entries)))
    checked = 0
    for line, base in zip(entries, plain):
        # 4. the existing fields are unchanged.
        check(NEW_FIELDS.sub('', line) == base,
              'a snapshot line changed beyond its new fields:\n%s\n%s' % (base, line))
        found = fields(line)
        check(len(found.get('stackargs', '')) == 2 * STACK_ARGS,
              'stackargs= has %d bytes, not %d' % (len(found.get('stackargs', '')) // 2, STACK_ARGS))
        check(found.get('ram_start') == '%04x' % RAM_BASE,
              'ram_start= is %s, not %04x' % (found.get('ram_start'), RAM_BASE))
        check(len(found.get('ram', '')) == 2 * RAM_LENGTH,
              'ram= has %d bytes, not %d' % (len(found.get('ram', '')) // 2, RAM_LENGTH))
        ram = bytes.fromhex(found['ram'])
        stack = bytes.fromhex(found['stackargs'])

        def at(address, count):
            check(RAM_BASE <= address and address + count <= RAM_BASE + RAM_LENGTH,
                  'address 0x%04x lies outside the captured RAM' % address)
            return ram[address - RAM_BASE:address - RAM_BASE + count]

        # 3. the new bytes agree with the existing fields and with each other.
        source = int(line.split(' regs=')[1].split(',')[4][:4], 16)
        vptr_bytes = bytes.fromhex(re.search(r' bytes=([0-9a-f]{6})', line).group(1))
        check(at(source, 3) == vptr_bytes,
              'the RAM at r4 0x%04x is %s, but bytes= is %s'
              % (source, at(source, 3).hex(), vptr_bytes.hex()))
        sp = int(re.search(r' sp=0x([0-9a-f]{4})', line).group(1), 16)
        record = int(RECORD.search(line).group(1), 16)
        expected_record = bytes([record & 0xff, (record >> 8) & 0xff, record >> 16])
        check(at(sp, 3) == expected_record,
              'the RAM at SP 0x%04x is %s, but record= is 0x%06x'
              % (sp, at(sp, 3).hex(), record))
        check(stack == at(sp + 3, STACK_ARGS),
              'stackargs= %s is not the RAM at SP + 3 (%s)'
              % (stack.hex(), at(sp + 3, STACK_ARGS).hex()))
        checked += 1
    return checked


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    args = parser.parse_args()

    try:
        before = digest(args.image)
        plain = run(args, [])
        check(STATUS in plain.stdout, 'the plain probe run did not finish:\n%s' % plain.stdout[-600:])
        with_options = run(args, ['--snapshot-stack-args', str(STACK_ARGS),
                                  '--snapshot-ram-range', '%04X:%04X' % (RAM_BASE, RAM_LENGTH)])
        check(STATUS in with_options.stdout,
              'the probe run with the new options did not finish:\n%s'
              % with_options.stdout[-600:])
        checked = check_matched_lines(with_options.stdout, plain.stdout)
        check(' stackargs=' not in plain.stdout and ' ram=' not in plain.stdout,
              'the plain run printed a new field')

        for options in INVALID:
            result = run(args, options)
            check(result.returncode == 2 and STATUS not in result.stdout,
                  'invalid %s was accepted (exit %d)' % (' '.join(options), result.returncode))
            check(result.stderr.strip().startswith('--snapshot-'),
                  'invalid %s gave no host error: %r' % (' '.join(options), result.stderr))

        # The largest count and a one-byte range at the end of RAM are valid.
        edge = run(args, ['--snapshot-stack-args', '16', '--snapshot-ram-range', '0AFF:1'])
        check(STATUS in edge.stdout and ' ram=' in edge.stdout and
              len(re.search(r' stackargs=([0-9a-f]+)', edge.stdout).group(1)) == 32,
              'the largest stack-argument count or the last RAM byte was rejected')

        after = digest(args.image)
        check(before == after, 'the probe changed the image file')
    except Failure as error:
        print('avm_eh_stack_probe_snapshot_test: FAIL: %s' % error, file=sys.stderr)
        return 1
    print('avm_eh_stack_probe_snapshot_test: %d snapshots matched their memory, %d invalid '
          'requests rejected, image unchanged' % (checked, len(INVALID)))
    return 0


if __name__ == '__main__':
    sys.exit(main())
