#!/usr/bin/env python3
"""Checks that malformed dynamic RTTI halts the typeid, and that window boundaries work.

The image of rtti_polymorphic_corrupt_target runs unchanged first. It must print the
alias of Derived's descriptor, computed here from the ELF, and then report success.
Each mutation then patches a copy of the packed image:

  - a vptr that leaves no room for its RTTI slot (zero, one, or two), set through the
    mode byte, which the target stores into the object before the typeid;
  - the RTTI slot of Derived's vtable, set to zero, below the window, past the last
    aliasable descriptor, or at the top of program space. Each must halt the typeid
    before any alias is printed, so no pointer is returned for a malformed slot;
  - the RTTI slot at the first and last aliasable descriptor addresses, 0x0500 and 0xF9FA,
    which must print the alias that the verifier computes, 0x0B00 and 0xFFFA.

A halted run ends with the halt report H, and a successful one ends with P.
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

DERIVED_TYPE = '_ZTIN12_GLOBAL__N_17DerivedE'
DERIVED_VTABLE = '_ZTVN12_GLOBAL__N_17DerivedE'
MODE = '_ZN12_GLOBAL__N_115corruption_modeE'
# The RTTI slot lies three bytes past the vtable symbol, and the address point six bytes past.
RTTI_SLOT_OFFSET = 3
FLASH_DELTA = 0x0600
WINDOW_START = 0x0500
WINDOW_END = 0xfa00
SNAPSHOT_STATUS = 'status: debug_break'
SERIAL = re.compile(r' serial="([^"]*)"')
ALIAS = re.compile(r'alias=([0-9A-F]{4})')


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


def alias_in(serial):
    match = ALIAS.search(serial)
    return int(match.group(1), 16) if match else None


def mutations(mode, slot):
    """Each entry names the mutation, the patch, and the expected outcome. The outcome is
    None for a halt, and otherwise the alias that the run must print."""
    def set_mode(value):
        return lambda d: d.__setitem__(mode, value)

    def set_slot(value):
        return lambda d: put(d, slot, value, 3)

    return [
        ('vptr zero', set_mode(1), None),
        ('vptr two, below the RTTI slot', set_mode(2), None),
        ('vptr one, below the RTTI slot', set_mode(3), None),
        ('RTTI slot zero', set_slot(0x000000), None),
        ('RTTI slot below the flash window', set_slot(0x0004ff), None),
        ('RTTI slot whose six-byte descriptor passes 0xFA00', set_slot(0x00f9fb), None),
        ('RTTI slot at the top of program space', set_slot(0xfffff0), None),
        ('RTTI slot at the first aliasable descriptor', set_slot(WINDOW_START),
         WINDOW_START + FLASH_DELTA),
        ('RTTI slot at the last aliasable descriptor', set_slot(WINDOW_END - 6),
         WINDOW_END - 6 + FLASH_DELTA),
    ]


def verify(args):
    elf = rtti.Elf(args.elf)
    with open(args.image, 'rb') as handle:
        original = bytearray(handle.read())
    descriptor = rtti.defined(elf, DERIVED_TYPE)['value']
    vtable = rtti.defined(elf, DERIVED_VTABLE)['value']
    slot = vtable + RTTI_SLOT_OFFSET
    check(rtti.u24(original[slot:slot + 3]) == descriptor,
          'the RTTI slot at 0x%06x does not name %s' % (slot, DERIVED_TYPE))
    mode = rtti.defined(elf, MODE)['value']
    check(original[mode] == 0, 'the corruption mode is not zero in the unpatched image')

    expected = descriptor + FLASH_DELTA
    serial = run(args, args.image)
    check(serial.endswith('P\\n'), 'the unchanged image did not report success: %r' % serial)
    check(alias_in(serial) == expected,
          'the unchanged image printed %r, not the alias 0x%04x' % (serial, expected))
    print('  unchanged: %s' % serial)

    os.makedirs(args.scratch_dir, exist_ok=True)
    for index, (label, patch, outcome) in enumerate(mutations(mode, slot)):
        data = bytearray(original)
        patch(data)
        # A boundary slot may already hold its value, as the lowest descriptor does at O2.
        # The malformed slots must differ from the image, or they test nothing.
        if outcome is None:
            check(bytes(data) != bytes(original), 'the %s mutation changed nothing' % label)
        path = os.path.join(args.scratch_dir, 'rtti_corrupt_%02d.bin' % index)
        with open(path, 'wb') as handle:
            handle.write(data)
        serial = run(args, path)
        if outcome is None:
            check(serial.endswith('H\\n') and alias_in(serial) is None,
                  '%s: the typeid did not halt, serial %r' % (label, serial))
        else:
            check(serial.endswith('P\\n') and alias_in(serial) == outcome,
                  '%s: expected alias 0x%04x and success, serial %r'
                  % (label, outcome, serial))
        print('  %s: %s' % (label, serial))
    print('rtti_polymorphic_corrupt_verify: %d mutations behaved as expected'
          % len(mutations(mode, slot)))


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
