#!/usr/bin/env python3
"""Checks the landing-pad stack contract against the emulator.

For every throwing call in a named function, the expected landing SP comes from
the machine code. The normal return path releases the outgoing argument bytes
with an adjsp right after the call, so the expected landing SP is the SP at the
call plus that adjsp amount. The probe observes the SP at the call instruction and
at the landing pad, and this check compares them. It also checks that r0-r3 at the
landing pad equal their values at the call, since the frame's callee-saved
registers must come back unchanged. The landing pad address is read from the
packed AVEH3 block, which is what the unwinder uses.
"""

import argparse
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import eh_metadata_verify as aveh  # noqa: E402

SNAPSHOT = re.compile(r'^snapshot (\S+) pc=0x[0-9a-f]+ sp=0x([0-9a-f]+) cycle=\d+ '
                      r'regs=([0-9a-f,]+)', re.MULTILINE)
CALL_LINE = re.compile(r'^\s*([0-9a-f]+):\s+(call\S*)\s+\S+\s+<([^>]+)>')
ANY_LINE = re.compile(r'^\s*([0-9a-f]+):\s+(\S+)\s*(.*)$')
# Encoded lengths of the call forms that the AVM backend emits, in bytes.
CALL_LENGTH = {'call8': 2, 'call16': 3, 'callf': 4, 'callp': 1}


class Failure(Exception):
    pass


def check(condition, message):
    if not condition:
        raise Failure(message)


def run(tool, args):
    result = subprocess.run([tool] + args, capture_output=True, text=True)
    check(result.returncode == 0, '%s failed: %s' % (tool, result.stderr.strip()))
    return result.stdout


def function_listing(objdump, elf, function):
    """Returns the disassembly lines of the function whose name contains function."""
    lines = run(objdump, ['-d', '--no-show-raw-insn', elf]).splitlines()
    header = re.compile(r'^[0-9a-f]+ <([^>]*)>:$')
    body = None
    listing = []
    for line in lines:
        match = header.match(line)
        if match:
            if body is not None:
                break
            if function in match.group(1):
                body = match.group(1)
            continue
        if body is not None:
            listing.append(line)
    check(body is not None, 'no function named %s in the ELF' % function)
    return body, listing


def throwing_calls(listing, callees):
    """Returns (call address, return address, callee) for each call to a callee,
    and the outgoing bytes the normal path releases after it."""
    rows = []
    for index, line in enumerate(listing):
        match = CALL_LINE.match(line)
        if not match:
            continue
        callee = match.group(3)
        if not any(callee.endswith(name) or name in callee for name in callees):
            continue
        address = int(match.group(1), 16)
        # The return PC follows the encoded call. A call that ends its function has
        # no following line, so its length comes from the encoding alone.
        check(match.group(2) in CALL_LENGTH,
              'unsupported call encoding %s at 0x%x' % (match.group(2), address))
        return_pc = address + CALL_LENGTH[match.group(2)]
        next_match = ANY_LINE.match(listing[index + 1]) if index + 1 < len(listing) else None
        outgoing = 0
        if next_match is not None:
            check(int(next_match.group(1), 16) == return_pc,
                  'the instruction after the call at 0x%x is not at its decoded return PC'
                  % address)
            if next_match.group(2) == 'adjsp':
                amount = int(next_match.group(3).strip(), 16)
                check(amount > 0,
                      'the instruction after the call at 0x%x is not a release' % address)
                outgoing = amount
        rows.append((address, return_pc, callee, outgoing))
    return rows


def call_mnemonic(listing, address):
    """Returns the encoding of the call at address, such as call8 or call16."""
    for line in listing:
        match = CALL_LINE.match(line)
        if match and int(match.group(1), 16) == address:
            return match.group(2)
    return None


def probe_events(probe, interpreter, boundary, image, elf, points):
    args = [probe, '--interpreter', interpreter, '--boundary', boundary,
            '--image', image, '--elf', elf, '--cycle-limit', '400000000']
    for point in points:
        args += ['--snapshot', point]
    result = subprocess.run(args, capture_output=True, text=True)
    check('status: debug_break' in result.stdout, 'the probe run did not finish cleanly:\n%s'
          % result.stdout[-800:])
    events = []
    for match in SNAPSHOT.finditer(result.stdout):
        regs = [int(v, 16) for v in match.group(3).split(',')]
        events.append((match.group(1), int(match.group(2), 16), regs))
    return events


def verify(args):
    objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    function, listing = function_listing(objdump, args.elf, args.function)
    calls = throwing_calls(listing, args.callee)
    check(calls, 'no calls to %s in %s' % (', '.join(args.callee), function))
    if args.encoding:
        for call_pc, _, callee, _ in calls:
            encoding = call_mnemonic(listing, call_pc)
            check(encoding == args.encoding,
                  'the call to %s at 0x%x is %s, not %s' % (
                      callee, call_pc, encoding, args.encoding))

    with open(args.image, 'rb') as handle:
        image = handle.read()
    anchor = aveh.symbol_address(os.path.join(args.bin_dir, 'llvm-nm'), args.elf,
                                 aveh.ANCHOR)
    check(anchor is not None, 'the ELF lacks the metadata anchor')
    block = aveh.read_u(image, anchor, 3)
    functions, _ = aveh.decode_block(image, block)
    # The landing pad of each call is the handler or cleanup site whose range covers
    # the call. Cleanup pads and catch-all pads have the same landing contract.
    record = next(f for f in functions if f['start'] <= calls[0][0] < f['end'])

    points = []
    expected = {}
    for call_pc, return_pc, callee, outgoing in calls:
        sites = [s for s in record['sites']
                 if s['action'] != 0 and s['start'] <= return_pc - 1 < s['end']]
        check(len(sites) == 1, 'the call at 0x%x is not covered by one handler or cleanup site'
              % call_pc)
        pad = sites[0]['landing']
        expected[call_pc] = (return_pc, callee, outgoing, pad)
        for point in (call_pc, pad):
            name = '0x%06x' % point
            if name not in points:
                points.append(name)

    events = probe_events(args.probe, args.interpreter, args.boundary, args.image,
                          args.elf, points)
    rows = []
    pending = None
    for name, sp, regs in events:
        address = int(name, 16)
        if address in expected:
            check(pending is None, 'a throwing call was entered again before its landing pad')
            pending = (address, sp, regs)
        elif pending is not None and address == expected[pending[0]][3]:
            call_pc, call_sp, call_regs = pending
            _, callee, outgoing, pad = expected[call_pc]
            want = call_sp + outgoing
            ok_sp = sp == want
            ok_regs = regs[0:4] == call_regs[0:4]
            rows.append((call_pc, callee, outgoing, call_sp, sp, want, ok_sp, ok_regs, regs[3]))
            pending = None
    check(rows, 'the probe saw no throw through the calls')
    check(len(rows) >= len(calls),
          'the probe reached %d landing pads for %d calls' % (len(rows), len(calls)))

    print('%s: %s' % (os.path.basename(args.elf), function))
    print('  %-10s %-34s %4s  %-8s %-8s %-8s %-6s %-6s' % (
        'call', 'callee', 'out', 'call_sp', 'pad_sp', 'expect', 'sp', 'r0-r3'))
    failures = []
    for call_pc, callee, outgoing, call_sp, pad_sp, want, ok_sp, ok_regs, _ in rows:
        print('  0x%06x   %-34s %4d  0x%04x   0x%04x   0x%04x   %-6s %-6s' % (
            call_pc, callee[-34:], outgoing, call_sp, pad_sp, want,
            'ok' if ok_sp else 'BAD', 'ok' if ok_regs else 'BAD'))
        if not ok_sp:
            failures.append('call 0x%x: landing SP 0x%04x, expected 0x%04x' % (
                call_pc, pad_sp, want))
        if not ok_regs:
            failures.append('call 0x%x: r0-r3 changed across the landing' % call_pc)
    if failures:
        raise Failure('; '.join(failures))


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--function', required=True,
                        help='substring of the demangled-symbol name that holds the calls')
    parser.add_argument('--callee', action='append', required=True,
                        help='substring of a throwing callee name')
    parser.add_argument('--encoding', default=None,
                        help='required encoding of each throwing call, such as call8')
    args = parser.parse_args()
    try:
        verify(args)
    except Failure as error:
        print('FAIL: %s' % error, file=sys.stderr)
        return 1
    print('landing-pad SP matches the call-site contract')
    return 0


if __name__ == '__main__':
    sys.exit(main())
