#!/usr/bin/env python3
"""Checks the rethrow lifecycle of an EH image against the emulator.

The probe reports each runtime boundary of the rethrow path. The boundaries that take
the header have it at r4, with its 59 bytes. __cxa_end_catch takes no argument, so its
header is read from caught_exceptions in a window of guest RAM, and the free and the
destructor are matched by their arguments. The check groups the events by header and
confirms that:

  - each exception is allocated once and thrown once, and its header keeps the same
    type descriptor, destructor, and size at every boundary;
  - the state byte has the value that each boundary requires. The rethrow-pending bit
    is set from the rethrow's phase one through the release of the abandoned catch;
  - each exception runs the order throw, then begin, rethrow, release for each linear
    rethrow, then begin, end, destructor, and free. No other lifecycle event appears;
  - the release, the __cxa_end_catch that the abandoned catch runs during a rethrow,
    clears the pending bit and does not destroy or free the exception, so the next
    handler begins only after it;
  - the final end destroys the object once, at the object address, and frees the
    header once;
  - a rethrow's saved context names its own continuation: the PC is the return record
    of the __cxa_rethrow call, the SP is the caller's SP, r0-r3 are the call's registers,
    the header is the exception, and phase one starts at that context.

The state byte values are 0 ALLOCATED, 1 THROWN, 2 CAUGHT, 3 IN_CLEANUP, and 4
ENTERING_CATCH, with 0x80 set while a rethrow propagates.
"""

import argparse
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import eh_metadata_verify as aveh  # noqa: E402

HEADER_SIZE = 59
RAM_WINDOW = 0x100
ADDRESS_MASK = 0xffff

STATE_ALLOCATED = 0
STATE_THROWN = 1
STATE_CAUGHT = 2
STATE_IN_CLEANUP = 3
STATE_ENTERING_CATCH = 4
RETHROW_PENDING = 0x80

# The runtime entries that the probe snapshots. Each one takes its header in r4, except
# __cxa_end_catch and __cxa_rethrow, which take none.
SNAPSHOTS = [
    '__cxa_allocate_exception',
    '__avm_eh_throw',
    '__cxa_begin_catch',
    '__cxa_rethrow',
    '__avm_eh_rethrow',
    'avm_eh_find_handler',
    'avm_eh_prepare_next',
    '__cxa_end_catch',
    '_Unwind_Resume',
    'free',
]

SNAPSHOT_LINE = re.compile(
    r'^snapshot (\S+) pc=0x([0-9a-f]+) sp=0x([0-9a-f]+) cycle=(\d+) '
    r'regs=([0-9a-f,]+) record=0x([0-9a-f]+)'
    r'(?: bytes=([0-9a-f]*))?'
    r'(?: ram_start=([0-9a-f]+) ram=([0-9a-f]*))?$',
    re.MULTILINE)

CALL_RETHROW = re.compile(r'^\s*([0-9a-f]+):\s+call\S*\s+\S+\s+<__cxa_rethrow>\s*$')
INSTRUCTION = re.compile(r'^\s*([0-9a-f]+):\s+\S')


class Event:
    def __init__(self, index, match):
        self.index = index
        self.name = match.group(1)
        self.pc = int(match.group(2), 16)
        self.sp = int(match.group(3), 16)
        self.cycle = int(match.group(4))
        self.regs = [int(v, 16) for v in match.group(5).split(',')]
        self.record = int(match.group(6), 16)
        self.bytes = bytes.fromhex(match.group(7)) if match.group(7) else None
        self.ram_start = int(match.group(8), 16) if match.group(8) else None
        self.ram = bytes.fromhex(match.group(9)) if match.group(9) else None

    def describe(self):
        return '%s at cycle %d (pc 0x%06x)' % (self.name, self.cycle, self.pc)

    def ram_slice(self, address, length):
        if self.ram is None or address < self.ram_start or \
                address + length > self.ram_start + len(self.ram):
            return None
        offset = address - self.ram_start
        return self.ram[offset:offset + length]


def check(condition, message):
    if not condition:
        raise aveh.Failure(message)


def le16(data, offset):
    return data[offset] | data[offset + 1] << 8


def le24(data, offset):
    return data[offset] | data[offset + 1] << 8 | data[offset + 2] << 16


def run_probe(args, destructors, active_address):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf, '--cycle-limit', '400000000',
               '--snapshot-bytes', str(HEADER_SIZE),
               '--snapshot-ram-range', '%04x:%x' % (active_address, RAM_WINDOW)]
    names = list(SNAPSHOTS) + ['0x%06x' % address for address in sorted(destructors)]
    for name in names:
        command += ['--snapshot', name]
    result = subprocess.run(command, capture_output=True, text=True)
    check(result.returncode == 0, 'the probe failed:\n%s' % result.stderr[-800:])
    check('status: debug_break' in result.stdout,
          'the probe run did not finish cleanly:\n%s' % result.stdout[-800:])
    return [Event(index, match) for index, match in enumerate(SNAPSHOT_LINE.finditer(result.stdout))]


def rethrow_returns(objdump, elf):
    """The return PCs of the calls to __cxa_rethrow. Each is the instruction after the call."""
    text = aveh.run_tool(objdump, ['-d', '--no-show-raw-insn', elf])
    returns = set()
    after_call = False
    for line in text.splitlines():
        match = INSTRUCTION.match(line)
        if not match:
            continue
        if after_call:
            returns.add(int(match.group(1), 16))
        after_call = bool(CALL_RETHROW.match(line))
    check(returns, 'the image has no call to __cxa_rethrow')
    return returns


def header_bytes(event, header):
    """The 55 header bytes that an event holds, from r4 or from the RAM window."""
    if event.bytes is not None and event.regs[4] == header:
        return event.bytes
    return event.ram_slice(header, HEADER_SIZE)


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True,
                        help='directory containing llvm-nm and llvm-objdump')
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--min-rethrows', type=int, default=1,
                        help='require that some exception is rethrown at least this many times')
    args = parser.parse_args()
    nm = os.path.join(args.bin_dir, 'llvm-nm')
    objdump = os.path.join(args.bin_dir, 'llvm-objdump')

    # __cxa_end_catch ends the innermost caught exception, so its identity is the caught stack top.
    active_address = aveh.symbol_address(nm, args.elf, 'caught_exceptions')
    check(active_address is not None, 'the image has no caught_exceptions symbol')
    returns = rethrow_returns(objdump, args.elf)
    calls, with_action, with_cleanup = static_rethrow_sites(args, returns)
    print('static: %d __cxa_rethrow call sites, %d with an action, %d with a cleanup'
          % (calls, with_action, with_cleanup))

    # The first run reads each throw's destructor address. The second run snapshots those
    # destructors, so each destruction of an exception is observed at its object address.
    events = run_probe(args, set(), active_address)
    destructors = set()
    for event in events:
        if event.name == '__avm_eh_throw' and event.bytes is not None:
            destructor = le24(event.bytes, 18)
            if destructor:
                destructors.add(destructor)
    if destructors:
        events = run_probe(args, destructors, active_address)
    dtor_names = {'0x%06x' % address: address for address in destructors}

    # A header address is reused by the allocator after a free, so each exception is one
    # lifetime, from its throw to its free. Events name their lifetime through the live
    # header address.
    lifetimes = []
    live = {}
    allocations = 0
    rethrow_contexts = []  # (__cxa_rethrow event, __avm_eh_rethrow event)
    pending_cxa_rethrow = None

    def live_at(header, event):
        check(header in live, 'exception 0x%04x is not live at %s'
              % (header, event.describe()))
        return live[header]

    def header_of_event(event):
        raw = header_bytes(event, event.regs[4])
        check(raw is not None, 'the header is not in the snapshot at %s' % event.describe())
        return raw

    for event in events:
        name = event.name
        if name == '__cxa_allocate_exception':
            allocations += 1
        elif name == '__cxa_rethrow':
            pending_cxa_rethrow = event
        elif name in dtor_names:
            # The destructor of a thrown type also runs on automatic objects of that type.
            # Only a call on the object of a live exception, through its own destructor, is
            # the exception's destruction. Other calls are the program's own.
            address = dtor_names[name]
            for header, life in live.items():
                if life['destructor'] == address and event.regs[4] == header + HEADER_SIZE:
                    life['entries'].append(('dtor', event))
                    break
        elif name == '__avm_eh_throw':
            header = event.regs[4]
            raw = header_of_event(event)
            check(raw[23] == STATE_ALLOCATED,
                  'throw from state 0x%02x, not ALLOCATED, at %s'
                  % (raw[23], event.describe()))
            check(header not in live, 'exception 0x%04x was thrown while live' % header)
            life = {'header': header, 'destructor': le24(raw, 18), 'entries': [('throw', event)]}
            lifetimes.append(life)
            live[header] = life
        elif name == '__cxa_begin_catch':
            life = live_at(event.regs[4], event)
            raw = header_of_event(event)
            check(raw[23] == STATE_ENTERING_CATCH,
                  'catch began in state 0x%02x, not ENTERING_CATCH, at %s'
                  % (raw[23], event.describe()))
            life['entries'].append(('begin', event))
        elif name == '__avm_eh_rethrow':
            life = live_at(event.regs[4], event)
            raw = header_of_event(event)
            check(raw[23] == STATE_CAUGHT,
                  'rethrow from state 0x%02x, not CAUGHT, at %s'
                  % (raw[23], event.describe()))
            check(pending_cxa_rethrow is not None,
                  '__avm_eh_rethrow without __cxa_rethrow at %s' % event.describe())
            rethrow_contexts.append((pending_cxa_rethrow, event))
            pending_cxa_rethrow = None
            life['entries'].append(('rethrow', event))
        elif name == 'avm_eh_find_handler':
            life = live_at(event.regs[4], event)
            raw = header_of_event(event)
            if life['entries'][-1][0] == 'rethrow':
                check(raw[23] == (RETHROW_PENDING | STATE_THROWN),
                      'rethrow search began in state 0x%02x at %s'
                      % (raw[23], event.describe()))
                context = rethrow_contexts[-1][1].bytes
                check(le16(raw, 24) == le16(context, 0) and le24(raw, 26) == le24(context, 2),
                      'phase one did not start at the rethrow context at %s'
                      % event.describe())
            else:
                check(raw[23] == STATE_THROWN,
                      'throw search began in state 0x%02x at %s' % (raw[23], event.describe()))
        elif name == 'avm_eh_prepare_next':
            live_at(event.regs[4], event)
            raw = header_of_event(event)
            check(raw[23] & 0x7f == STATE_THROWN,
                  'phase two began in state 0x%02x at %s' % (raw[23], event.describe()))
        elif name == '_Unwind_Resume':
            live_at(event.regs[4], event)
            raw = header_of_event(event)
            check(raw[23] & 0x7f == STATE_IN_CLEANUP,
                  '_Unwind_Resume from state 0x%02x at %s' % (raw[23], event.describe()))
        elif name == '__cxa_end_catch':
            header = le16(event.ram_slice(active_address, 2), 0)
            check(header != 0, 'end of catch with no caught exception at %s' % event.describe())
            life = live_at(header, event)
            raw = event.ram_slice(header, HEADER_SIZE)
            check(raw is not None, 'the RAM window does not hold the header at %s'
                  % event.describe())
            if raw[23] & RETHROW_PENDING:
                check(raw[23] & 0x7f in (STATE_IN_CLEANUP, STATE_ENTERING_CATCH),
                      'release from base state 0x%02x at %s' % (raw[23], event.describe()))
                life['entries'].append(('release', event))
            else:
                check(raw[23] == STATE_CAUGHT,
                      'final end from state 0x%02x at %s' % (raw[23], event.describe()))
                life['entries'].append(('end', event))
        elif name == 'free':
            header = event.regs[4]
            if header in live:
                live[header]['entries'].append(('free', event))
                del live[header]

    check(not live, 'exceptions were not freed: %s' % ', '.join('0x%04x' % h for h in live))

    # Every rethrow context names its own continuation and carries the call's registers.
    for cxa_event, rethrow_event in rethrow_contexts:
        raw = rethrow_event.bytes
        check(cxa_event.record in returns,
              'the rethrow record 0x%06x is not the return of a __cxa_rethrow call at %s'
              % (cxa_event.record, cxa_event.describe()))
        check(le24(raw, 2) == cxa_event.record,
              'the saved PC 0x%06x is not the rethrow continuation 0x%06x'
              % (le24(raw, 2), cxa_event.record))
        check(le16(raw, 0) == (cxa_event.sp + 3) & ADDRESS_MASK,
              'the saved SP 0x%04x is not the caller SP 0x%04x'
              % (le16(raw, 0), (cxa_event.sp + 3) & ADDRESS_MASK))
        for register in range(4):
            check(le16(raw, 5 + 2 * register) == cxa_event.regs[register],
                  'saved r%d 0x%04x differs from the call register 0x%04x'
                  % (register, le16(raw, 5 + 2 * register), cxa_event.regs[register]))
        header = rethrow_event.regs[4]
        check(le16(raw, 13) == header, 'the saved exception is not the header at %s'
              % rethrow_event.describe())

    # Each exception's lifecycle must match the grammar, and its identity must not change.
    total_rethrows = 0
    most_rethrows = 0
    for number, life in enumerate(lifetimes):
        entries = life['entries']
        kinds = [kind for kind, _ in entries]
        rethrows = kinds.count('rethrow')
        expected = ['throw']
        for _ in range(rethrows):
            expected += ['begin', 'rethrow', 'release']
        expected += ['begin', 'end']
        if life['destructor']:
            expected += ['dtor']
        expected += ['free']
        check(kinds == expected, 'exception %d at 0x%04x lifecycle %s does not match %s'
              % (number, life['header'], kinds, expected))
        identities = set()
        for kind, event in entries:
            if kind in ('throw', 'begin', 'rethrow', 'release', 'end', 'free'):
                raw = event.bytes if event.regs[4] == life['header'] else None
                if raw is None:
                    raw = event.ram_slice(life['header'], HEADER_SIZE)
                if raw is not None:
                    identities.add((le24(raw, 15), le24(raw, 18), le16(raw, 21)))
        check(len(identities) == 1, 'exception %d changed its type, destructor, or size: %s'
              % (number, sorted(identities)))
        total_rethrows += rethrows
        most_rethrows = max(most_rethrows, rethrows)
        print('exception %d at 0x%04x: one throw, %d rethrow(s), %s, one free'
              % (number, life['header'], rethrows,
                 'one destruction' if life['destructor'] else 'no destructor'))

    check(lifetimes, 'no exception was thrown')
    check(allocations == len(lifetimes),
          'the program allocated %d exceptions for %d throws' % (allocations, len(lifetimes)))
    check(len(rethrow_contexts) == total_rethrows,
          'the program rethrew %d times, and the lifecycle shows %d'
          % (len(rethrow_contexts), total_rethrows))
    check(most_rethrows >= args.min_rethrows,
          'no exception was rethrown %d times' % args.min_rethrows)
    print('rethrow verification passed: %d exceptions, %d rethrows, %d allocations, %d events'
          % (len(lifetimes), total_rethrows, allocations, len(events)))


def static_rethrow_sites(args, returns):
    """Checks the rethrow call sites of the linked image against its AVEH5 block. Each call
    lies in a site of its function. A site with an action names the cleanup that releases
    the abandoned catch, or the catch that takes over, and at least one rethrow site must
    carry a cleanup. Returns the counts of call sites, sites with an action, and sites with a
    cleanup."""
    with open(args.image, 'rb') as handle:
        image = handle.read()
    nm = os.path.join(args.bin_dir, 'llvm-nm')
    anchor = aveh.symbol_address(nm, args.elf, aveh.ANCHOR)
    check(anchor is not None, 'the image lacks the AVEH5 anchor')
    block = aveh.read_u(image, anchor, 3)
    functions, _ = aveh.decode_block(image, block)
    with_action = 0
    with_cleanup = 0
    for return_pc in sorted(returns):
        function = next((f for f in functions if f['start'] < return_pc <= f['end']), None)
        check(function is not None,
              'a __cxa_rethrow call at 0x%06x lies outside every function' % return_pc)
        site = next((s for s in function['sites'] if s['start'] < return_pc <= s['end']), None)
        if site is None or not site['action_offset']:
            continue
        has_cleanup, entries = function['lists'][site['action_offset']]
        check(has_cleanup or entries,
              'the rethrow site at 0x%06x names neither a cleanup nor a catch' % return_pc)
        check(function['start'] < site['landing'] < function['end'],
              'the rethrow site at 0x%06x lands outside its function' % return_pc)
        with_action += 1
        with_cleanup += 1 if has_cleanup else 0
    check(with_cleanup >= 1, 'no rethrow site has a cleanup that releases the abandoned catch')
    return len(returns), with_action, with_cleanup


if __name__ == '__main__':
    try:
        main()
    except aveh.Failure as error:
        print('eh_rethrow_verify: %s' % error, file=sys.stderr)
        sys.exit(1)
