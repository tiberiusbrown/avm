#!/usr/bin/env python3
"""Verifies the phase-two shortcut of the AVM exception unwinder.

Phase one searches for the handler and leaves the handler's landing state in the
resume context. When no frame before the handler has a cleanup, the unwinder installs
that state directly, and it never enters avm_eh_prepare_next. When a cleanup lies on
the way, phase two runs, and each cleanup runs once. This script runs the probe over an
image and reads each throw's events from the snapshots. It checks that:

* phase two is entered exactly when the throw has a cleanup landing, and never for a
  throw that has none, so the direct and multi-frame catches skip it;
* every cleanup landing is followed by one _Unwind_Resume, and no cleanup pad runs
  twice in one throw;
* the handler's landing pad is a site of the packed block whose action lists the
  selector that was installed, and each handler is entered once;
* a throw with no handler installs nothing, so no destructor runs before the failed
  phase-one search terminates, and phase two never runs.

The packed block is decoded independently by eh_metadata_verify.decode_block, and the
probe's snapshots are the only runtime input.
"""

import argparse
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_runtime_layout as layout  # noqa: E402
import eh_metadata_verify as aveh  # noqa: E402

SNAPSHOTS = [
    '__cxa_throw', '__avm_eh_throw', 'avm_eh_find_handler', 'avm_eh_prepare_next',
    '__avm_eh_install_context', '__cxa_begin_catch', '__cxa_end_catch', '_Unwind_Resume',
]
SNAP = re.compile(
    r'^snapshot (\S+) pc=0x([0-9a-f]+) sp=0x([0-9a-f]+) cycle=(\d+) '
    r'regs=([0-9a-f]{4}(?:,[0-9a-f]{4}){7}) record=0x([0-9a-f]{6})(?: bytes=([0-9a-f]+))?$',
    re.MULTILINE)


class Failure(Exception):
    pass


def check(condition, message):
    if not condition:
        raise Failure(message)


def run_probe(args, names):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf, '--cycle-limit', '400000000']
    for name in names:
        command += ['--snapshot', name]
    command += ['--snapshot-bytes', str(layout.CONTEXT_SIZE)]
    result = subprocess_run(command)
    status = re.search(r'^status: (.*)$', result, re.MULTILINE)
    check(status is not None, 'the probe produced no status')
    events = []
    for m in SNAP.finditer(result):
        event = {'name': m.group(1), 'regs': [int(x, 16) for x in m.group(5).split(',')]}
        if m.group(7):
            b = bytes.fromhex(m.group(7))
            event['landing'] = layout.context_pc(b)
        events.append(event)
    return events, status.group(1)


def subprocess_run(command):
    import subprocess
    return subprocess.run(command, capture_output=True, text=True).stdout


def throws_of(events):
    """Splits the events into throws, each starting at a __cxa_throw snapshot."""
    throws = []
    for e in events:
        if e['name'] == '__cxa_throw':
            throws.append({'prepare_next': 0, 'installs': [], 'resumes': 0, 'begins': 0,
                           'ends': 0, 'entered_throw': False})
            continue
        if not throws:
            continue
        current = throws[-1]
        if e['name'] == 'avm_eh_prepare_next':
            current['prepare_next'] += 1
        elif e['name'] == '__avm_eh_install_context':
            current['installs'].append((e['regs'][5], e['landing']))
        elif e['name'] == '_Unwind_Resume':
            current['resumes'] += 1
        elif e['name'] == '__cxa_begin_catch':
            current['begins'] += 1
        elif e['name'] == '__cxa_end_catch':
            current['ends'] += 1
    return throws


def landing_actions(functions):
    """Maps each handler or cleanup landing pad to its selectors and cleanup flag."""
    actions = {}
    for fn in functions:
        for site in fn['sites']:
            if not site['action_offset']:
                continue
            flags, entries = fn['lists'][site['action_offset']]
            actions[site['landing']] = ({selector for selector, _ in entries},
                                        bool(flags & aveh.ACTION_CLEANUP))
    return actions


def verify(args):
    nm = os.path.join(args.bin_dir, 'llvm-nm')
    with open(args.image, 'rb') as handle:
        image = handle.read()
    anchor = aveh.symbol_address(nm, args.elf, aveh.ANCHOR)
    check(anchor is not None, 'the ELF has no exception anchor')
    block = aveh.read_u(image, anchor, 3)
    functions, _ = aveh.decode_block(image, block)
    actions = landing_actions(functions)

    present = set(re.findall(r'^[0-9a-f]+ [tTdDbB] (\S+)$',
                             subprocess_run([nm, '-n', args.elf]), re.MULTILINE))
    names = [name for name in SNAPSHOTS if name in present]
    events, status = run_probe(args, names)
    throws = throws_of(events)
    check(throws, 'no throw reached __cxa_throw')

    counts = {'direct': 0, 'cleanup': 0, 'unhandled': 0}
    for index, t in enumerate(throws):
        cleanups = [landing for selector, landing in t['installs'] if selector == 0]
        handlers = [(selector, landing) for selector, landing in t['installs'] if selector]
        if not handlers:
            check(t['installs'] == [] and t['prepare_next'] == 0 and t['begins'] == 0,
                  'throw %d has no handler, but it ran a pad or phase two' % index)
            counts['unhandled'] += 1
            continue
        check(len(handlers) == 1, 'throw %d entered %d handlers' % (index, len(handlers)))
        selector, landing = handlers[0]
        check(t['installs'][-1] == (selector, landing),
              'throw %d installed a handler before its last landing' % index)
        check(landing in actions and selector in actions[landing][0],
              'throw %d handler 0x%x selector %d is not in its packed action' % (
                  index, landing, selector))
        check(len(set(cleanups)) == len(cleanups),
              'throw %d ran a cleanup pad twice' % index)
        check(t['resumes'] == len(cleanups),
              'throw %d has %d cleanup pads but %d _Unwind_Resume calls' % (
                  index, len(cleanups), t['resumes']))
        if cleanups:
            check(t['prepare_next'] > 0, 'throw %d ran cleanups without phase two' % index)
            counts['cleanup'] += 1
        else:
            check(t['prepare_next'] == 0,
                  'throw %d entered phase two without a cleanup' % index)
            counts['direct'] += 1
        check(t['begins'] == 1 and t['ends'] == 1,
              'throw %d began %d catches and ended %d' % (index, t['begins'], t['ends']))
    return len(throws), counts, status


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    args = parser.parse_args()
    try:
        total, counts, status = verify(args)
    except Failure as error:
        print('FAIL: %s' % error, file=sys.stderr)
        return 1
    print('%s: %d throws (%d direct, %d with cleanups, %d unhandled); %s' % (
        os.path.basename(args.elf), total, counts['direct'], counts['cleanup'],
        counts['unhandled'], status))
    return 0


if __name__ == '__main__':
    sys.exit(main())
