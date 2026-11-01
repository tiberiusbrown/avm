#!/usr/bin/env python3
"""Checks the initial throw context against the machine code and the emulator.

The check uses one deterministic throw. For the call to __cxa_throw it finds the
call instruction in the linked ELF, decodes its length, and takes the return PC
that follows it. The emulator then gives the return record that __cxa_throw
captured, and the SP before the call. Those must agree. The thrower's CFA comes from
the packed CFI row at the call. It must equal the SP at the call that entered the
thrower, which the probe observes at that caller's call instruction. The check
also reports whether the throw call lies in a catch-all site.
"""

import argparse
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import eh_landing_pad_verify as landing  # noqa: E402
import eh_metadata_verify as aveh  # noqa: E402

SNAPSHOT = re.compile(r'^snapshot (\S+) pc=0x[0-9a-f]+ sp=0x([0-9a-f]+) cycle=\d+ '
                      r'regs=([0-9a-f,]+) record=0x([0-9a-f]+)', re.MULTILINE)


def run_probe(args, points):
    cmd = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
           '--image', args.image, '--elf', args.elf, '--cycle-limit', '400000000']
    for point in points:
        cmd += ['--snapshot', point]
    result = subprocess.run(cmd, capture_output=True, text=True)
    landing.check('status: debug_break' in result.stdout,
                  'the probe run did not finish cleanly')
    events = {}
    for match in SNAPSHOT.finditer(result.stdout):
        regs = [int(v, 16) for v in match.group(3).split(',')]
        events.setdefault(match.group(1), []).append(
            {'sp': int(match.group(2), 16), 'regs': regs, 'record': int(match.group(4), 16)})
    return events


def verify(args):
    objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    nm = os.path.join(args.bin_dir, 'llvm-nm')
    thrower, listing = landing.function_listing(objdump, args.elf, args.thrower)
    throws = landing.throwing_calls(listing, ['__cxa_throw'])
    landing.check(len(throws) == 1, 'expected one __cxa_throw call in %s' % args.thrower)
    throw_pc, return_pc, _, outgoing = throws[0]
    # The type descriptor travels in r6:r7, and the destructor is the only stack
    # argument, a three-byte program address that is null for a trivial type.
    landing.check(outgoing == 3,
                  'the throw call passes %d stack bytes, expected the 3-byte destructor'
                  % outgoing)
    mnemonic = next(line.split()[1] for line in listing
                    if line.lstrip().startswith('%x:' % throw_pc))

    # The call that starts the frame chain. Its SP is the CFA of the thrower, and a
    # tail jump between the entry and the thrower adds no frame, so the entry can
    # be a function further up the chain.
    _, caller_listing = landing.function_listing(objdump, args.elf, args.caller)
    entries = landing.throwing_calls(caller_listing, [args.entry])
    landing.check(entries, 'no call to %s in %s' % (args.entry, args.caller))
    entry_pc = entries[0][0]

    with open(args.image, 'rb') as handle:
        image = handle.read()
    anchor = aveh.symbol_address(nm, args.elf, aveh.ANCHOR)
    block = aveh.read_u(image, anchor, 3)
    functions, _ = aveh.decode_block(image, block)
    fn = next(f for f in functions if f['start'] <= throw_pc < f['end'])
    row = [r for r in fn['rows'] if r['pc'] <= throw_pc][-1]
    in_site = [s for s in fn['sites'] if s['action'] == 1 and s['start'] <= return_pc - 1 < s['end']]

    throw_name = '0x%06x' % throw_pc
    caller_name = '0x%06x' % entry_pc
    events = run_probe(args, [throw_name, caller_name, '__cxa_throw'])
    throw_call = events.get(throw_name, [{}])[0]
    entry = events.get('__cxa_throw', [None])[0]
    landing.check(throw_call and entry, 'the throw path was not observed')
    landing.check(entry['record'] == return_pc,
                  'captured return PC 0x%06x, expected 0x%06x from the call instruction' % (
                      entry['record'], return_pc))
    landing.check(entry['sp'] + 3 == throw_call['sp'],
                  'captured caller SP 0x%04x, expected 0x%04x before the call' % (
                      entry['sp'] + 3, throw_call['sp']))

    # An r3-based row takes its CFA from r3, which the probe saw at the call.
    base = throw_call['regs'][3] if row['r3'] else throw_call['sp']
    cfa = (base + row['cfa_offset']) & 0xffff
    caller = events.get(caller_name, [{}])[0]
    landing.check(caller, 'the call that entered the thrower was not observed')
    landing.check(caller['sp'] == cfa,
                  'thrower CFA 0x%04x from the row, but the caller SP is 0x%04x' % (
                      cfa, caller['sp']))

    print('%s: throw from %s' % (os.path.basename(args.elf), args.thrower))
    print('  call __cxa_throw at 0x%06x (%s), return PC 0x%06x' % (
        throw_pc, mnemonic, return_pc))
    print('  captured return PC 0x%06x == decoded return PC: ok' % entry['record'])
    print('  captured caller SP 0x%04x == SP before the call: ok' % (entry['sp'] + 3))
    print('  thrower CFA 0x%04x (%s %+d) == caller SP 0x%04x: ok' % (
        cfa, 'r3' if row['r3'] else 'SP', row['cfa_offset'], caller['sp']))
    print('  throw call inside a catch-all site: %s' % ('yes' if in_site else 'no'))


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--thrower', required=True,
                        help='substring of the function that calls __cxa_throw')
    parser.add_argument('--caller', required=True,
                        help='substring of the function that makes the entry call')
    parser.add_argument('--entry', required=True,
                        help='substring of the function that the caller calls to reach the thrower')
    args = parser.parse_args()
    try:
        verify(args)
    except landing.Failure as error:
        print('FAIL: %s' % error, file=sys.stderr)
        return 1
    print('throw context matches the machine code and the CFI row')
    return 0


if __name__ == '__main__':
    sys.exit(main())
