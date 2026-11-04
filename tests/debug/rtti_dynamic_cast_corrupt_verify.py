#!/usr/bin/env python3
"""Checks that malformed dynamic_cast metadata halts the runtime, and that valid casts behave.

The image of rtti_dynamic_cast_corrupt_target runs one cast, which the byte corruption_case
selects. Each valid case prints expected=HHHH result=HHHH, where the expected address is the
compiler's static_cast layout, and the run then reports P. The verifier runs the unchanged image
for every case first, and then patches copies of the packed image. Each mutation has one of three
outcomes:

  - halt: the run ends with the halt report, H, and prints no result line;
  - match: the run prints the expected address as its result, and then P;
  - null: the run prints a null result, and then P, because the cast is valid and has no target.

The mutations patch the RTTI descriptors and vtables that the ELF names. They cover a zero, low,
high, and window-edge RTTI slot, a descriptor of the wrong kind, a valid but unrelated RTTI slot,
an excessive VMI base count, reserved VMI and base flags, an invalid base descriptor, a virtual
base offset that underflows or overflows, and a displacement outside AS0. The runtime-only vptr
cases and the depth and edge limits need no image patch. The verifier never runs the runtime's
own algorithm to compute an expected value.

Case 14 names a source that the active hierarchy lacks. Its premise is checked from the ELF and the
patched bytes, and the image must halt on two runs with identical output.
"""

import argparse
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_metadata_verify as aveh  # noqa: E402
import eh_rtti_verify as rtti  # noqa: E402

Failure = aveh.Failure
check = rtti.check

CASE = 'corruption_case'
DERIVED_TYPE = '_ZTIN12_GLOBAL__N_17DerivedE'
DERIVED_VTABLE = '_ZTVN12_GLOBAL__N_17DerivedE'
UNRELATED_TYPE = '_ZTIN12_GLOBAL__N_19UnrelatedE'
BOTH_TYPE = '_ZTIN12_GLOBAL__N_14BothE'
BOTH_VTABLE = '_ZTVN12_GLOBAL__N_14BothE'
RIGHT_TYPE = '_ZTIN12_GLOBAL__N_15RightE'
VSIDE_TYPE = '_ZTIN12_GLOBAL__N_15VSideE'
VSIDE_VTABLE = '_ZTVN12_GLOBAL__N_15VSideE'
# The RTTI slot lies three bytes past the vtable symbol, and the VMI entries follow the ten-byte
# header. The first base entry holds its descriptor, then its offset-and-flags word.
RTTI_SLOT_OFFSET = 3
VMI_FLAGS = 6
VMI_COUNT = 8
VMI_ENTRY = 10
ENTRY_FLAGS = 3
ENTRY_OFFSET = 4
# Both's vtable holds a primary group, then a secondary group for its Right subobject. Each group
# is a six-byte header and two three-byte destructor entries, so the secondary header is at 12.
BOTH_SECONDARY = 12
# A class with no bases has a descriptor of its vptr and its name only, six bytes in all.
PLAIN_CLASS_SIZE = 6
WINDOW_START = 0x0500
WINDOW_END = 0xfa00
STATUS = 'status: debug_break'
SERIAL = re.compile(r' serial="([^"]*)"')
RESULT = re.compile(r'expected=([0-9A-F]{4}) result=([0-9A-F]{4})')

CASES = {
    'derived': 0,
    'both': 1,
    'cross': 2,
    'virtual_full': 3,
    'depth_limit': 4,
    'depth_ok': 5,
    'edge_limit': 6,
    'edge_ok': 7,
    'nonmatching': 8,
    'vptr_zero': 9,
    'vptr_two': 10,
    'vptr_one': 11,
    'slot_overflow': 12,
    'virtual_base': 13,
    'source_absent': 14,
}


def run(args, image_path):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', image_path, '--elf', args.elf, '--cycle-limit', '400000000']
    result = subprocess.run(command, capture_output=True, text=True)
    check(STATUS in result.stdout,
          'the probe run did not finish cleanly for %s:\n%s'
          % (os.path.basename(image_path), result.stdout[-800:]))
    serial = SERIAL.search(result.stdout)
    check(serial is not None, 'the probe printed no serial output for %s'
          % os.path.basename(image_path))
    return serial.group(1)


def put(data, address, value, size):
    for i in range(size):
        data[address + i] = (value >> (8 * i)) & 0xff


def outcome_of(serial):
    """Returns ('halt', None), or ('value', (expected, result)) for a run that reports P."""
    if serial.endswith('H\\n') and RESULT.search(serial) is None:
        return ('halt', None)
    match = RESULT.search(serial)
    check(match is not None and serial.endswith('P\\n'),
          'the run neither halted nor reported a result: %r' % serial)
    return ('value', (int(match.group(1), 16), int(match.group(2), 16)))


def expect(serial, outcome, label):
    kind, value = outcome_of(serial)
    if outcome == 'halt':
        check(kind == 'halt', '%s: the cast did not halt, serial %r' % (label, serial))
    elif outcome == 'match':
        check(kind == 'value' and value[0] == value[1] and value[1] != 0,
              '%s: the result did not match the expected address, serial %r' % (label, serial))
    elif outcome == 'null':
        check(kind == 'value' and value[1] == 0,
              '%s: a valid nonmatching cast did not return null, serial %r' % (label, serial))
    print('  %s: %s' % (label, serial.replace('\\n', ' | ')))


def mutations(elf):
    """Each entry names the case, the patch, and the expected outcome."""
    def sym(name):
        return rtti.defined(elf, name)['value']

    derived_type = sym(DERIVED_TYPE)
    derived_slot = sym(DERIVED_VTABLE) + RTTI_SLOT_OFFSET
    unrelated_type = sym(UNRELATED_TYPE)
    both_type = sym(BOTH_TYPE)
    vside_type = sym(VSIDE_TYPE)
    vside_vtable = sym(VSIDE_VTABLE)
    vside_entry = vside_type + VMI_ENTRY

    def slot(value):
        return lambda d: put(d, derived_slot, value, 3)

    def at(address, value, size):
        return lambda d: put(d, address, value, size)

    return [
        ('derived RTTI slot zero', 'derived', slot(0x000000), 'halt'),
        ('derived RTTI slot below the flash window', 'derived', slot(0x0004ff), 'halt'),
        ('derived RTTI slot passing 0xFA00', 'derived', slot(0x00f9fb), 'halt'),
        ('derived RTTI slot at the top of program space', 'derived', slot(0xfffff0), 'halt'),
        ('derived descriptor of a nonclass kind', 'derived', at(derived_type, 0x000500, 3),
         'halt'),
        ('derived RTTI slot naming an unrelated class', 'derived', slot(unrelated_type), 'null'),
        ('both VMI base count of 33', 'both', at(both_type + VMI_COUNT, 33, 2), 'halt'),
        ('both reserved VMI flags', 'both', at(both_type + VMI_FLAGS, 0x0004, 2), 'halt'),
        ('both reserved base flags', 'both', at(both_type + VMI_ENTRY + ENTRY_FLAGS, 0x04, 1),
         'halt'),
        ('both invalid base descriptor', 'both', at(both_type + VMI_ENTRY, 0x000000, 3), 'halt'),
        ('virtual base offset underflow', 'virtual_base', at(vside_entry + ENTRY_OFFSET,
                                                              0x800000, 3), 'halt'),
        ('virtual base offset overflow', 'slot_overflow', at(vside_entry + ENTRY_OFFSET,
                                                             0x7fffff, 3), 'halt'),
        ('virtual base displacement outside AS0', 'virtual_base', at(vside_vtable, 0x010000, 3),
         'halt'),
    ]


def runtime_cases():
    return [
        ('depth limit of nine classes', 'depth_limit', 'halt'),
        ('edge limit of the seven-level lattice', 'edge_limit', 'halt'),
        ('zero vptr', 'vptr_zero', 'halt'),
        ('vptr two, below six', 'vptr_two', 'halt'),
        ('vptr one, below six', 'vptr_one', 'halt'),
    ]


def verify(args):
    elf = rtti.Elf(args.elf)
    with open(args.image, 'rb') as handle:
        original = bytearray(handle.read())
    case_address = rtti.defined(elf, CASE)['value']
    check(original[case_address] == 0, 'the case byte is not zero in the unpatched image')
    check(rtti.u24(original[sym_offset(elf, DERIVED_VTABLE) + RTTI_SLOT_OFFSET:][:3])
          == rtti.defined(elf, DERIVED_TYPE)['value'],
          'the derived RTTI slot does not name %s' % DERIVED_TYPE)

    os.makedirs(args.scratch_dir, exist_ok=True)
    counter = [0]

    def image_for(case_name, patch):
        data = bytearray(original)
        data[case_address] = CASES[case_name]
        if patch is not None:
            patch(data)
        counter[0] += 1
        path = os.path.join(args.scratch_dir, 'rtti_dc_corrupt_%02d.bin' % counter[0])
        with open(path, 'wb') as handle:
            handle.write(data)
        return path

    # The unchanged image runs each case. Valid casts must match or return null.
    baseline = [
        ('derived', 'match'), ('both', 'match'), ('cross', 'match'), ('virtual_full', 'match'),
        ('depth_ok', 'match'), ('edge_ok', 'match'), ('nonmatching', 'null'),
        ('virtual_base', 'match'), ('source_absent', 'match'),
    ]
    for case_name, outcome in baseline:
        serial = run(args, image_for(case_name, None))
        expect(serial, outcome, 'unchanged %s' % case_name)

    for label, case_name, outcome in runtime_cases():
        serial = run(args, image_for(case_name, None))
        expect(serial, outcome, label)

    patched = mutations(elf)
    for label, case_name, patch, outcome in patched:
        data_path = image_for(case_name, patch)
        serial = run(args, data_path)
        expect(serial, outcome, label)

    # Case 14 must halt. Its premise comes from the ELF and the patched bytes, and a second run of
    # the same image must halt with the same output, so the halt does not depend on earlier runs.
    source_absent_premise(elf, original)
    absent = source_absent_patch(elf)
    first = run(args, image_for('source_absent', absent))
    expect(first, 'halt', 'source absent from the active hierarchy')
    second = run(args, image_for('source_absent', absent))
    check(second == first, 'the source-absent halt differs between runs: %r and %r'
          % (first, second))
    print('  source absent, second run: identical')

    total = len(baseline) + len(runtime_cases()) + len(patched) + 2
    print('rtti_dynamic_cast_corrupt_verify: %d runs behaved as expected' % total)


def sym_offset(elf, name):
    return rtti.defined(elf, name)['value']


def source_absent_patch(elf):
    """Points the secondary RTTI slot of Both's vtable at the descriptor of Right."""
    slot = sym_offset(elf, BOTH_VTABLE) + BOTH_SECONDARY + RTTI_SLOT_OFFSET
    right = sym_offset(elf, RIGHT_TYPE)
    return lambda d: put(d, slot, right, 3)


def source_absent_premise(elf, original):
    """Checks from the ELF and the patched bytes that case 14's source is absent from its hierarchy.

    The patched secondary group names Right, and Right's descriptor is a plain class with no bases.
    Rooted at the complete object, the active hierarchy of Right therefore holds only that root.
    The offset-to-top is negative, so the source lies at a nonzero distance above the root and is
    absent. A retry rooted at the source would hold the source at distance zero, so the retired
    retry would have classified it and returned a value rather than halting.
    """
    data = bytearray(original)
    source_absent_patch(elf)(data)
    group = sym_offset(elf, BOTH_VTABLE) + BOTH_SECONDARY
    check(rtti.u24(data[group + RTTI_SLOT_OFFSET:][:3]) == sym_offset(elf, RIGHT_TYPE),
          'the patched secondary RTTI slot does not name %s' % RIGHT_TYPE)
    check(rtti.defined(elf, RIGHT_TYPE)['size'] == PLAIN_CLASS_SIZE,
          '%s is not a plain class descriptor, so it may have bases' % RIGHT_TYPE)
    top = rtti.u24(data[group:][:3])
    if top & 0x800000:
        top -= 1 << 24
    check(top < 0, 'the secondary offset-to-top %d does not place the source above the root' % top)


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
    try:
        main()
    except Failure as error:
        print('rtti_dynamic_cast_corrupt_verify: %s' % error, file=sys.stderr)
        sys.exit(1)
