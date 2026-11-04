#!/usr/bin/env python3
"""Reports guest stack high-water marks for the dynamic_cast fixtures.

For each image, the probe steps the emulator and records the lowest guest SP. The total peak is
the high-water mark from the start of the program, and it must fit the 256-byte guest stack. The
runtime figure is the extra stack used after the first entry into __dynamic_cast, which is the
cost of the cast itself. The fixtures are measured at each optimization level that the caller
names, and the static analysis of the linked image checks the same bound at link time.
"""

import argparse
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_stack_report as stack  # noqa: E402

STACK_LIMIT = stack.STACK_LIMIT
ENTRY = '__dynamic_cast'


def measure(args, image):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', image, '--elf', image[:-len('.bin')] + '.elf',
               '--cycle-limit', '400000000', '--measure-from', ENTRY]
    result = subprocess.run(command, capture_output=True, text=True)
    status = stack.STATUS.search(result.stdout)
    if status is None:
        raise RuntimeError('probe failed for %s: %s' % (image, result.stderr.strip()))
    peak = stack.PEAK.search(result.stdout)
    runtime = stack.RUNTIME.search(result.stdout)
    return {
        'status': status.group(1),
        'peak': int(peak.group(1)) if peak else None,
        'runtime': int(runtime.group(5)) if runtime else None,
        'deepest': runtime.group(4) if runtime else '-',
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', action='append', required=True,
                        help='a linked .bin image; its .elf sits beside it')
    args = parser.parse_args()

    print('| image | total peak | __dynamic_cast peak | deepest runtime frame | status |')
    print('|---|---:|---:|---|---|')
    failed = False
    for image in args.image:
        row = measure(args, image)
        name = os.path.relpath(image)
        print('| %s | %s | %s | %s | %s |' % (
            name, row['peak'] if row['peak'] is not None else '-',
            row['runtime'] if row['runtime'] is not None else '-', row['deepest'],
            row['status']))
        if row['peak'] is None or row['peak'] > STACK_LIMIT:
            print('FAIL: %s peaks at %s bytes, the stack is %d bytes'
                  % (name, row['peak'], STACK_LIMIT), file=sys.stderr)
            failed = True
    return 1 if failed else 0


if __name__ == '__main__':
    sys.exit(main())
