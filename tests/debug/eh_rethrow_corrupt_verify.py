#!/usr/bin/env python3
"""Checks that malformed rethrow states end deterministically at the expected check.

Each case is a fixture that reaches one invalid state on purpose, and it must end in the
halt report at the runtime check that owns that state. The probe's trace tail gives the
runtime function that was executing when the program halted, and the check reads it:

  - no active exception, and a rethrow from a destructor that runs during propagation,
    end in the getter, which terminates before any exception header is touched;
  - a rethrow whose handler is still inside the abandoned catch ends in __cxa_begin_catch,
    and the header's state there must be ENTERING_CATCH with the pending bit, so the new
    catch never begins before the abandoned catch is released;
  - a second __cxa_end_catch with no active exception ends in __cxa_end_catch;
  - a rethrow with no handler, and a rethrow from a site with no unwind metadata, end in
    __avm_eh_rethrow, which terminates when the search or the context is invalid. An
    unhandled rethrow never releases the catch or frees the exception.

A case that ends elsewhere, or that prints no halt report, fails. The valid outputs are
checked by the test runner, and this verifier checks where each malformed run ended.
"""

import argparse
import os
import re
import subprocess
import sys
import tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import eh_metadata_verify as aveh  # noqa: E402
import eh_rethrow_verify as rv  # noqa: E402

HEADER_SIZE = 59
STATE_ENTERING_CATCH_PENDING = 0x84
STATE_CAUGHT = 2

# Each case names the fixture, the runtime function that must end the run, and whether
# the run must reach the state checks that the case describes.
CASES = [
    ('eh_rethrow_no_active', '__avm_eh_rethrow_header', 'no active exception'),
    ('eh_rethrow_dtor_unwind', '__avm_eh_rethrow_header',
     'rethrow from a destructor during propagation'),
    ('eh_rethrow_nested_handler', '__cxa_begin_catch',
     'handler inside the abandoned catch, with the pending bit'),
    ('eh_rethrow_end_catch_twice', '__cxa_end_catch', 'repeated end of catch'),
    ('eh_rethrow_unhandled', '__avm_eh_rethrow', 'rethrow with no handler'),
    ('eh_rethrow_bad_site', '__avm_eh_rethrow', 'rethrow site with no unwind metadata'),
]

TRACE = re.compile(r'^\s+cycle (\d+) pc=0x([0-9a-f]+) sp=0x([0-9a-f]+) (\S+)$', re.MULTILINE)
SNAPSHOT = re.compile(
    r'^snapshot (\S+) pc=0x([0-9a-f]+) sp=0x([0-9a-f]+) cycle=(\d+) '
    r'regs=([0-9a-f,]+) record=0x([0-9a-f]+)(?: bytes=([0-9a-f]*))?$',
    re.MULTILINE)
# Functions that the halt path runs after the check, so they are not the check itself.
HALT_PATH = {'abort', 'avm_halt'}


def run_probe(args, image, elf, extra):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', image, '--elf', elf, '--cycle-limit', '400000000',
               '--stop-at', 'avm_halt', '--trace-tail', '400']
    # A stopped run exits with status 1, because the probe reports that the program did not
    # finish. The stop line below is the signal that the run reached the halt report.
    result = subprocess.run(command + extra, capture_output=True, text=True)
    aveh.check('stopped at avm_halt' in result.stdout,
               'the run did not reach the halt report:\n%s' % result.stdout[-800:])
    return result.stdout


def terminal_function(output):
    """The last runtime function on the trace that is not on the halt path."""
    names = [match.group(4) for match in TRACE.finditer(output)]
    names = [name.split('+')[0] for name in names]
    for name in reversed(names):
        if name not in HALT_PATH:
            return name
    raise aveh.Failure('the trace names no function before the halt')


def check_case(args, opt, fixture, expected, description):
    image = os.path.join(args.image_dir, opt, fixture + '.bin')
    elf = os.path.join(args.image_dir, opt, fixture + '.elf')
    aveh.check(os.path.exists(image), 'missing image %s' % image)
    output = run_probe(args, image, elf, [])
    terminal = terminal_function(output)
    aveh.check(terminal == expected,
               '%s %s ended in %s, not %s (%s)' % (fixture, opt, terminal, expected, description))
    return terminal


def check_malformed_action(args, opt):
    """A rethrow whose action list is malformed must end in the rethrow path. The entry count
    of the list at the rethrow site is set beyond the list, so the runtime's list check
    rejects it, and phase one fails before any handler or cleanup of that rethrow runs."""
    fixture = 'eh_rethrow'
    elf = os.path.join(args.image_dir, opt, fixture + '.elf')
    with open(os.path.join(args.image_dir, opt, fixture + '.bin'), 'rb') as handle:
        image = bytearray(handle.read())
    nm = os.path.join(args.bin_dir, 'llvm-nm')
    objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    anchor = aveh.symbol_address(nm, elf, aveh.ANCHOR)
    aveh.check(anchor is not None, 'the image lacks the AVEH5 anchor')
    block = aveh.read_u(bytes(image), anchor, 3)
    functions, _ = aveh.decode_block(bytes(image), block)
    target = min(rv.rethrow_returns(objdump, elf))
    function = next(f for f in functions if f['start'] < target <= f['end'])
    site = next(s for s in function['sites'] if s['start'] < target <= s['end'])
    aveh.check(site['action_offset'], 'the rethrow site has no action list to corrupt')
    list_address = function['record'] + site['action_offset']
    # The entry count is the 16-bit field at +1 of the list, and 0x7fff entries cannot fit.
    image[list_address + 1] = 0xff
    image[list_address + 2] = 0x7f
    with tempfile.TemporaryDirectory() as scratch:
        mutant = os.path.join(scratch, fixture + '_malformed.bin')
        with open(mutant, 'wb') as handle:
            handle.write(image)
        output = run_probe(args, mutant, elf, ['--trace-tail', '6000'])
    names = [name.split('+')[0] for name in (m.group(4) for m in TRACE.finditer(output))]
    aveh.check('__cxa_rethrow' in names, 'the malformed rethrow never reached __cxa_rethrow')
    terminal = terminal_function(output)
    aveh.check(terminal == '__avm_eh_rethrow',
               '%s %s with a malformed action list ended in %s, not __avm_eh_rethrow'
               % (fixture, opt, terminal))
    return terminal


def check_nested_pending(args, opt):
    """The new catch of the nested handler must see the pending bit set, not cleared."""
    fixture = 'eh_rethrow_nested_handler'
    image = os.path.join(args.image_dir, opt, fixture + '.bin')
    elf = os.path.join(args.image_dir, opt, fixture + '.elf')
    output = run_probe(args, image, elf,
                       ['--snapshot-bytes', str(HEADER_SIZE), '--snapshot', '__cxa_begin_catch'])
    begins = [match for match in SNAPSHOT.finditer(output) if match.group(1) == '__cxa_begin_catch']
    aveh.check(begins, 'the nested handler never reached __cxa_begin_catch')
    last = begins[-1]
    aveh.check(last.group(7) is not None and len(last.group(7)) == 2 * HEADER_SIZE,
               'no header at the nested __cxa_begin_catch')
    state = int(last.group(7)[2 * 23:2 * 23 + 2], 16)
    aveh.check(state == STATE_ENTERING_CATCH_PENDING,
               'the nested catch began in state 0x%02x, not 0x%02x'
               % (state, STATE_ENTERING_CATCH_PENDING))


def check_unhandled_keeps_exception(args, opt):
    """An unhandled rethrow must not release, destroy, or free the exception."""
    fixture = 'eh_rethrow_unhandled'
    image = os.path.join(args.image_dir, opt, fixture + '.bin')
    elf = os.path.join(args.image_dir, opt, fixture + '.elf')
    output = run_probe(args, image, elf, ['--snapshot-bytes', str(HEADER_SIZE),
                                          '--snapshot', '__avm_eh_rethrow',
                                          '--snapshot', '__cxa_end_catch',
                                          '--snapshot', 'free'])
    names = [match.group(1) for match in SNAPSHOT.finditer(output)]
    aveh.check('__avm_eh_rethrow' in names, 'the unhandled rethrow never reached the runtime')
    after = names[names.index('__avm_eh_rethrow') + 1:]
    aveh.check('__cxa_end_catch' not in after and 'free' not in after,
               'an unhandled rethrow released or freed the exception: %s' % after)
    rethrow = [m for m in SNAPSHOT.finditer(output) if m.group(1) == '__avm_eh_rethrow'][-1]
    raw = bytes.fromhex(rethrow.group(7))
    aveh.check(raw[23] == STATE_CAUGHT, 'the unhandled rethrow began in state 0x%02x, not CAUGHT'
               % raw[23])


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image-dir', required=True,
                        help='directory holding O0/ and O2/ subdirectories of images')
    parser.add_argument('--opt', action='append', default=[])
    args = parser.parse_args()
    for opt in args.opt or ['O0', 'O2']:
        for fixture, expected, description in CASES:
            terminal = check_case(args, opt, fixture, expected, description)
            print('%s %s: halted in %s (%s)' % (fixture, opt, terminal, description))
        terminal = check_malformed_action(args, opt)
        print('%s %s: malformed rethrow action halted in %s' % ('eh_rethrow', opt, terminal))
        check_nested_pending(args, opt)
        check_unhandled_keeps_exception(args, opt)
        print('%s: pending catch and unhandled rethrow states verified' % opt)
    print('rethrow corruption verification passed')


if __name__ == '__main__':
    try:
        main()
    except aveh.Failure as error:
        print('eh_rethrow_corrupt_verify: %s' % error, file=sys.stderr)
        sys.exit(1)
