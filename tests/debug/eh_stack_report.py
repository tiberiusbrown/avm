#!/usr/bin/env python3
"""Reports guest stack high-water marks for the exception fixtures.

For each fixture and optimization level, the probe steps the emulator and records
the lowest guest SP. Two figures are reported and kept separate. The total is the
high-water mark from the start of the program. The runtime figure is the extra
stack used after the first entry into __cxa_throw, which is the cost of the
exception runtime itself.
"""

import argparse
import os
import re
import subprocess
import sys

INITIAL = re.compile(r'^initial_sp: 0x([0-9a-f]+)', re.MULTILINE)
MINIMUM = re.compile(r'^min_sp: 0x([0-9a-f]+) at 0x([0-9a-f]+) \((.*)\)$', re.MULTILINE)
PEAK = re.compile(r'^peak_bytes: (\d+)', re.MULTILINE)
RUNTIME = re.compile(r'^measured_from \S+: entry_sp=0x([0-9a-f]+) min_sp=0x([0-9a-f]+) '
                     r'at 0x([0-9a-f]+) \((.*)\) peak_after_bytes=(\d+)$', re.MULTILINE)
STATUS = re.compile(r'^status: (.*)$', re.MULTILINE)
# The guest stack is 256 bytes, and a fixture whose total peak exceeds it overflows.
STACK_LIMIT = 256

# Fixtures and what each one exercises. eh_catch_all holds the direct, nested,
# relaxed-call, and stack-argument cases, and its first throw is the multi-frame one.
NO_THROW = 'eh_no_throw'

FIXTURES = [
    ('eh_catch_all', 'direct, multi-frame, relaxed, stack-argument, nearest handler'),
    ('eh_dynamic_handler', 'r3 handler with a live dynamic allocation, two call sizes'),
    ('eh_unhandled', 'unhandled exception: halt report'),
    ('eh_allocation_failure', 'exception allocation failure: abort'),
    ('eh_missing_cfi', 'frame without CFI: deterministic halt'),
    ('eh_cleanup', 'cleanup chains, combined pad, partial construction, stack-argument and dynamic-frame cleanups, relaxed calls'),
    ('eh_cleanup_no_handler', 'cleanup frames with no handler: deterministic halt before any destructor'),
    ('eh_cleanup_dtor_throw', 'destructor throws during unwinding: deterministic halt'),
    ('eh_typed', 'exact typed catches: first match, nonmatching cleanups, combined pads'),
    ('eh_typed_high_address', 'exact typed matching with descriptors above 0xFFFF'),
    ('eh_inheritance', 'base catches: direct, chained, eight levels, nested offsets, by reference and value, '
     'ambiguous and inaccessible bases, clause order, cleanups, virtual base'),
    ('eh_inheritance_cross_unit', 'base catches of a descriptor thrown by another translation unit'),
    ('eh_inheritance_high_address', 'base catches with descriptors above 0xFFFF'),
    ('eh_inheritance_corrupt_target', 'base catch that the corruption verifier patches'),
    ('eh_virtual_inheritance', 'virtual base catches: direct, diamond, nested, secondary vptr, '
     'mixed, by value, inaccessible, ambiguous, clause order, cleanups'),
    ('eh_virtual_cross_unit', 'virtual base catch of a VMost thrown by another translation unit'),
    ('eh_virtual_high_address', 'virtual base catch with the vtable and descriptors above 0xFFFF'),
    ('eh_virtual_corrupt_target', 'virtual base catch that the virtual corruption verifier patches'),
    ('eh_virtual_lattice', 'a lattice whose walk visits 363 edges, within the budget'),
    ('eh_virtual_lattice_unhandled', 'a lattice whose walk exceeds the 512-edge budget: halt report'),
    ('eh_pointer_conversion', 'pointer conversions: base, qualification, void, noexcept, nullptr, '
     'exact and converted references, clause order, cleanups, exact pointer regressions'),
    ('eh_pointer_cross_unit', 'a derived pointer thrown by another translation unit, caught as a base, void, '
     'and exact reference'),
    ('eh_pointer_high_address', 'pointer conversions of program pointers, function pointers, and descriptors '
     'above 0xFFFF'),
    ('eh_pointer_corrupt_target', 'malformed pointer descriptors and markers: the conversion and marker paths'),
    ('eh_pointer_depth_unhandled', 'a nine-level pointer chain whose walk reaches the depth limit: halt report'),
    (NO_THROW, 'no-throw control'),
]


def describe(fixture):
    return dict(FIXTURES).get(fixture, '')


def measure(args, fixture, opt):
    image = os.path.join(args.image_dir, opt, fixture + '.bin')
    elf = os.path.join(args.image_dir, opt, fixture + '.elf')
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', image, '--elf', elf, '--cycle-limit', '400000000']
    # A program that never throws has no __cxa_throw to measure from.
    if fixture != NO_THROW:
        command += ['--measure-from', '__cxa_throw']
    result = subprocess.run(command, capture_output=True, text=True)
    text = result.stdout
    status = STATUS.search(text)
    if status is None:
        raise RuntimeError('probe failed for %s %s: %s' % (fixture, opt, result.stderr.strip()))
    initial = INITIAL.search(text)
    minimum = MINIMUM.search(text)
    peak = PEAK.search(text)
    runtime = RUNTIME.search(text)
    row = {
        'status': status.group(1).split(' cycles=')[0],
        'initial': int(initial.group(1), 16) if initial else None,
        'min': int(minimum.group(1), 16) if minimum else None,
        'deepest': minimum.group(3) if minimum else '',
        'peak': int(peak.group(1)) if peak else None,
        'runtime': int(runtime.group(5)) if runtime else None,
        'runtime_deepest': runtime.group(4) if runtime else '',
    }
    return row


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image-dir', required=True,
                        help='directory holding O0/ and O2/ subdirectories of images')
    parser.add_argument('--opt', action='append', default=[])
    parser.add_argument('--fixture', action='append', default=[],
                        help='measure only this fixture, by name')
    args = parser.parse_args()
    opts = args.opt or ['O0', 'O2']
    fixtures = [(name, text) for name, text in FIXTURES
                if not args.fixture or name in args.fixture]

    print('| fixture | opt | initial SP | min SP | total peak | runtime peak | deepest runtime frame | status |')
    print('|---|---|---:|---:|---:|---:|---|---|')
    overflow = False
    for fixture, _ in fixtures:
        for opt in opts:
            try:
                row = measure(args, fixture, opt)
            except RuntimeError as error:
                print('FAIL: %s' % error, file=sys.stderr)
                return 1
            runtime = '-' if row['runtime'] is None else str(row['runtime'])
            print('| %s | %s | 0x%04x | 0x%04x | %s | %s | %s | %s |' % (
                fixture, opt, row['initial'] or 0, row['min'] or 0,
                row['peak'] if row['peak'] is not None else '-', runtime,
                row['runtime_deepest'] or row['deepest'] or '-', row['status']))
            if row['peak'] is None or row['peak'] > STACK_LIMIT:
                print('FAIL: %s %s peaks at %s bytes, the stack is %d bytes'
                      % (fixture, opt, row['peak'], STACK_LIMIT), file=sys.stderr)
                overflow = True
    print()
    for fixture, description in fixtures:
        print('%s: %s' % (fixture, description))
    return 1 if overflow else 0


if __name__ == '__main__':
    sys.exit(main())
