#!/usr/bin/env python3
"""Checks the typed catches of an eh_typed image against the emulator.

The probe reports each installation of a landing context. At the installer's
entry, r4 is the header, so the probe's header bytes give the landing state, the
landing pad, the thrown type, and the handler selector that phase one recorded. The
check reads the packed AVEH5 block and the machine code to confirm, for each
installation, that:

  - a handler installation (state ENTERING_CATCH) passes in r5 the selector that
    phase one recorded in the header, and the selector is nonzero;
  - the pad it enters is a landing pad of the packed block, and the pad's action
    list holds that selector;
  - the selected entry is the first matching clause: every earlier entry in the
    list is typed and names another descriptor, and the selected entry names the
    thrown descriptor or is catch-all;
  - a pad that must choose between clauses compares the selector with the LLVM type
    ID of one of its typed clauses, so the landing pad and the action list name the
    same type IDs;
  - a cleanup installation (state IN_CLEANUP) passes selector zero, and its pad is
    a cleanup pad of the packed block;
  - the landing SP strictly increases within one throw, so each cleanup resumes
    toward the caller and no pad runs twice;
  - each handler is begun once, ended once, and its exception object is freed
    once, in that order, before the next throw starts;
  - the run includes a handler whose selector is greater than one, and a cleanup
    installation, so the nonmatching and combined cases are exercised.
"""

import argparse
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import eh_metadata_verify as aveh  # noqa: E402

Failure = aveh.Failure
check = aveh.check

INSTALL = '__avm_eh_install_context'
BEGIN = '__cxa_begin_catch'
END = '__cxa_end_catch'
RESUME = '_Unwind_Resume'
FREE = 'free'

HEADER_SIZE = 51
STATE_IN_CLEANUP = 3
STATE_ENTERING_CATCH = 4

SNAPSHOT = re.compile(
    r'^snapshot (\S+) pc=0x[0-9a-f]+ sp=0x([0-9a-f]+) cycle=\d+ '
    r'regs=([0-9a-f,]+) record=0x[0-9a-f]+(?: bytes=([0-9a-f]+))?',
    re.MULTILINE)
# A selector compare has two shapes. Usually it is cmpi.s8 rN, N. At -O0 the constant is
# loaded into r6 and compared with q2, which holds the selector, by cmp32 q2, q3.
# At -O2 the selector may sit in another register by the time it is compared, so the
# compare names any register.
COMPARE_IMM = re.compile(r'^\s*([0-9a-f]+):\s+cmpi?\S*\s+r\d+,\s*(-?0x[0-9a-f]+|-?\d+)\s*$')
LOAD_R6 = re.compile(r'^\s*([0-9a-f]+):\s+ldi(?:8|16)\s+r6,\s*(-?0x[0-9a-f]+|-?\d+)\s*$')
COMPARE_Q = re.compile(r'^\s*([0-9a-f]+):\s+cmp32\s+q2,\s*q3\s*$')
# The constant load and its compare lie within this many bytes of each other.
COMPARE_WINDOW = 8


def run_probe(args):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf, '--cycle-limit', '400000000',
               '--snapshot-bytes', str(HEADER_SIZE)]
    for name in (INSTALL, BEGIN, END, RESUME, FREE):
        command += ['--snapshot', name]
    result = subprocess.run(command, capture_output=True, text=True)
    check('status: debug_break' in result.stdout,
          'the probe run did not finish cleanly:\n%s' % result.stdout[-800:])
    events = []
    for match in SNAPSHOT.finditer(result.stdout):
        events.append({
            'name': match.group(1),
            'sp': int(match.group(2), 16),
            'regs': [int(v, 16) for v in match.group(3).split(',')],
            'bytes': bytes.fromhex(match.group(4)) if match.group(4) else b'',
        })
    return events


def compare_immediates(objdump, elf):
    """Returns [(address, immediate)] for each compare of the selector with a
    constant, in either shape. The constant is read as the compiler wrote it."""
    compares = []
    loaded = None
    for line in aveh.run_tool(objdump, ['-d', '--no-show-raw-insn', elf]).splitlines():
        match = COMPARE_IMM.match(line)
        if match:
            compares.append((int(match.group(1), 16), int(match.group(2), 0)))
            continue
        match = LOAD_R6.match(line)
        if match:
            loaded = (int(match.group(1), 16), int(match.group(2), 0))
            continue
        match = COMPARE_Q.match(line)
        if match and loaded is not None:
            address = int(match.group(1), 16)
            if address - loaded[0] <= COMPARE_WINDOW:
                compares.append((address, loaded[1]))
    return compares


def verify(args):
    objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    nm = os.path.join(args.bin_dir, 'llvm-nm')

    with open(args.image, 'rb') as handle:
        image = handle.read()
    anchor = aveh.symbol_address(nm, args.elf, aveh.ANCHOR)
    check(anchor is not None, 'the ELF lacks the metadata anchor')
    block = aveh.read_u(image, anchor, 3)
    functions, _ = aveh.decode_block(image, block)

    # Each landing pad of the packed block, with its function and action list.
    pads = {}
    for fn in functions:
        for site in fn['sites']:
            if site['action']:
                pads.setdefault(site['landing'], (fn, site['action']))
    check(pads, 'the packed block has no landing pads')

    compares = compare_immediates(objdump, args.elf)

    def compared_selectors(fn):
        return {value for address, value in compares
                if fn['start'] <= address < fn['end']}

    events = run_probe(args)
    handler_selectors = []
    cleanup_installs = 0
    throws = 0
    pending_begin = None
    resume_expected = False
    caught = False
    pending_free = False
    last_sp = None
    frees = 0
    handler_header = None

    for event in events:
        name = event['name']
        regs = event['regs']
        data = event['bytes']
        if name == INSTALL:
            check(pending_begin is None and not caught and not resume_expected,
                  'a landing context was installed while another was still running')
            check(len(data) == HEADER_SIZE,
                  'the installer header is %d bytes, not %d' % (len(data), HEADER_SIZE))
            state = data[23]
            sp = data[0] | data[1] << 8
            pad = data[2] | data[3] << 8 | data[4] << 16
            check(last_sp is None or sp > last_sp,
                  'landing SP 0x%04x does not move toward the caller of 0x%04x' % (sp, last_sp or 0))
            last_sp = sp
            check(pad in pads, 'landing pad 0x%06x is not a landing pad of the packed block' % pad)
            fn, (has_cleanup, entries) = pads[pad]
            selector = regs[5]
            if state == STATE_ENTERING_CATCH:
                recorded = data[39] | data[40] << 8
                check(selector != 0 and selector == recorded,
                      'handler installed with selector %d, but phase one recorded %d' % (
                          selector, recorded))
                thrown = data[15] | data[16] << 8 | data[17] << 16
                first = next((i for i, (sel, _) in enumerate(entries) if sel == selector), None)
                check(first is not None,
                      'the pad at 0x%06x has no catch entry for selector %d' % (pad, selector))
                for earlier_selector, earlier_type in entries[:first]:
                    check(earlier_type != 0 and earlier_type != thrown,
                          'selector %d is not the first match: entry %d also matches' % (
                              selector, earlier_selector))
                matched_type = entries[first][1]
                check(matched_type == 0 or matched_type == thrown,
                      'selector %d names descriptor 0x%06x, which does not match 0x%06x' % (
                          selector, matched_type, thrown))
                # A pad that must choose between clauses compares the selector with the
                # type ID of at least one of its typed clauses. The optimizer may leave one
                # clause as the fall-through, and it may drop the compare of a pad with one
                # typed clause and no cleanup, which is entered only for that clause.
                if len(entries) > 1 or has_cleanup:
                    typed_ids = {sel for sel, address in entries if address}
                    check(typed_ids & compared_selectors(fn),
                          'the pad at 0x%06x compares no typed clause ID' % pad)
                handler_selectors.append(selector)
                handler_header = regs[4]
                pending_begin = 'begin'
            elif state == STATE_IN_CLEANUP:
                check(selector == 0, 'cleanup installed with selector %d, not zero' % selector)
                check(has_cleanup, 'cleanup installed at 0x%06x, which has no cleanup flag' % pad)
                cleanup_installs += 1
                resume_expected = True
                handler_header = regs[4]
            else:
                check(False, 'landing context installed in state %d' % state)
        elif name == BEGIN:
            check(pending_begin is not None and regs[4] == handler_header,
                  '__cxa_begin_catch did not follow a handler installation')
            pending_begin = None
            caught = True
        elif name == RESUME:
            check(resume_expected and regs[4] == handler_header,
                  '_Unwind_Resume did not follow a cleanup installation')
            resume_expected = False
        elif name == END:
            check(caught, '__cxa_end_catch without an active catch')
            caught = False
            pending_free = True
        elif name == FREE:
            check(pending_free, 'an exception object was freed before its catch ended')
            pending_free = False
            frees += 1
            throws += 1
            last_sp = None

    check(not resume_expected and pending_begin is None and not caught and not pending_free,
          'the run ended inside a landing context')
    check(frees > 0, 'the run freed no exception object')
    check(frees == len(handler_selectors),
          '%d handlers were entered but %d exception objects were freed' % (
              len(handler_selectors), frees))
    check(max(handler_selectors, default=0) > 1,
          'no handler with a selector above one was entered')
    check(cleanup_installs > 0, 'no cleanup was entered')
    return {'throws': throws, 'handlers': len(handler_selectors),
            'cleanups': cleanup_installs, 'selectors': sorted(set(handler_selectors))}


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
        stats = verify(args)
    except Failure as error:
        print('FAIL: %s: %s' % (args.elf, error), file=sys.stderr)
        return 1
    print('eh_typed_verify: %s: %d throws, %d handlers, %d cleanups, selectors %s' % (
        os.path.basename(args.elf), stats['throws'], stats['handlers'], stats['cleanups'],
        ','.join(str(s) for s in stats['selectors'])))
    return 0


if __name__ == '__main__':
    sys.exit(main())
