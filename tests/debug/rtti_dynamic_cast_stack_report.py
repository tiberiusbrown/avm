#!/usr/bin/env python3
"""Reports guest stack high-water marks for the dynamic_cast fixtures.

For each image, the probe steps the emulator and records the lowest guest SP. Each row gives:

  initial SP      the SP at the program entry;
  minimum SP      the lowest SP the run reached, and the PC that reached it;
  total peak      the high-water mark from the entry, which must fit the 256-byte guest stack;
  runtime peak    the stack used after the first entry into the cast helper, which is the cost
                  of the cast itself, and the deepest runtime frame at that point;
  status          the probe's status line, which must be a completed run.

A class-cast image is measured from __dynamic_cast, and a --void image from
__avm_dynamic_cast_to_void, so a void-only image needs no class-cast helper. An image that ends
in an unhandled exception is named with --unhandled, and it must end in the probe's
unfinished status, not in a completed run. A missing peak is a failure, never a zero.
"""

import argparse
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_stack_report as stack  # noqa: E402

STACK_LIMIT = stack.STACK_LIMIT
CLASS_ENTRY = '__dynamic_cast'
VOID_ENTRY = '__avm_dynamic_cast_to_void'
INITIAL = stack.INITIAL
MINIMUM = stack.MINIMUM
PEAK = stack.PEAK
RUNTIME = stack.RUNTIME
STATUS = stack.STATUS


def measure(args, image, entry):
    elf = image[:-len('.bin')] + '.elf'
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', image, '--elf', elf, '--cycle-limit', '400000000',
               '--measure-from', entry]
    result = subprocess.run(command, capture_output=True, text=True)
    text = result.stdout
    status = STATUS.search(text)
    if status is None:
        raise RuntimeError('probe failed for %s: %s' % (image, result.stderr.strip()))
    initial = INITIAL.search(text)
    minimum = MINIMUM.search(text)
    peak = PEAK.search(text)
    runtime = RUNTIME.search(text)
    return {
        'status': status.group(1),
        'initial': int(initial.group(1), 16) if initial else None,
        'minimum': int(minimum.group(1), 16) if minimum else None,
        'minimum_at': minimum.group(3) if minimum else '-',
        'peak': int(peak.group(1)) if peak else None,
        'runtime': int(runtime.group(5)) if runtime else None,
        'deepest': runtime.group(4) if runtime else '-',
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', action='append', default=[],
                        help='a linked class-cast .bin image; its .elf sits beside it')
    parser.add_argument('--void', action='append', default=[],
                        help='a linked image measured from __avm_dynamic_cast_to_void')
    parser.add_argument('--unhandled', action='append', default=[],
                        help='an image that ends in an unhandled exception')
    args = parser.parse_args()

    cases = [(image, CLASS_ENTRY, False) for image in args.image] + \
            [(image, VOID_ENTRY, False) for image in args.void] + \
            [(image, CLASS_ENTRY, True) for image in args.unhandled]
    print('| image | entry | initial SP | minimum SP | total peak | runtime peak | '
          'deepest runtime frame | status |')
    print('|---|---|---:|---:|---:|---:|---|---|')
    failed = False
    for image, entry, unhandled in cases:
        row = measure(args, image, entry)
        name = os.path.relpath(image)
        initial = '0x%04x' % row['initial'] if row['initial'] is not None else '-'
        minimum = '0x%04x' % row['minimum'] if row['minimum'] is not None else '-'
        print('| %s | %s | %s | %s at %s | %s | %s | %s | %s |' % (
            name, entry, initial, minimum, row['minimum_at'],
            row['peak'] if row['peak'] is not None else '-',
            row['runtime'] if row['runtime'] is not None else '-', row['deepest'],
            row['status']))
        problems = []
        if row['peak'] is None:
            problems.append('no total peak was measured')
        elif row['peak'] > STACK_LIMIT:
            problems.append('peaks at %d bytes, the stack is %d bytes' % (row['peak'], STACK_LIMIT))
        if row['runtime'] is None:
            problems.append('no runtime peak was measured from %s' % entry)
        if unhandled:
            # The unhandled path prints its U marker, then halts at the fixture's own break.
            if 'serial="UH' not in row['status']:
                problems.append('the unhandled exception did not reach its termination marker: %s'
                                % row['status'])
        elif 'debug_break' not in row['status']:
            problems.append('the run did not complete: %s' % row['status'])
        for problem in problems:
            print('FAIL: %s %s' % (name, problem), file=sys.stderr)
            failed = True
    return 1 if failed else 0


if __name__ == '__main__':
    sys.exit(main())
