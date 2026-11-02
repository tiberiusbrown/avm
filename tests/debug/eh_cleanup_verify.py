#!/usr/bin/env python3
"""Checks the cleanup chain of one throw against the emulator and the packed block.

The throw crosses the frames named by --frame, innermost first. The first frame
throws into __cxa_throw, and each later frame calls the frame before it. Every
frame but the last must have a cleanup landing pad at its throwing call, and the
last frame must have a catch-all pad. The machine code gives each call and the
bytes it releases. The packed AVEH4 block gives each pad, which the unwinder reads.
The probe observes the calls, the pads, every installation of a landing context,
each _Unwind_Resume, and the catch and exception-object calls. The check requires:

  - the events run in order: each frame's call, the installation of its pad, the
    pad, and after each cleanup one _Unwind_Resume; then the catch, its end, and
    the release of the exception object;
  - each pad is entered once, and each cleanup pad is installed with selector 0
    while the catch pad is installed with selector 1, the header in r4 throughout;
  - each landing SP is the call's SP plus the bytes the call releases;
  - the landing SP strictly increases from pad to pad, so the saved continuation
    moves toward the caller;
  - r0-r3 at each pad equal their values at the call;
  - the exception object is freed once, after the catch ends.
"""

import argparse
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import eh_landing_pad_verify as landing  # noqa: E402
import eh_metadata_verify as aveh  # noqa: E402

Failure = landing.Failure
check = landing.check

# Runtime symbols on the chain. The probe resolves each one from the ELF.
RESUME = '_Unwind_Resume'
INSTALL = '__avm_eh_install_context'
BEGIN = '__cxa_begin_catch'
END = '__cxa_end_catch'
FREE = 'free'
THROW = '__cxa_throw'


def listing_of(objdump, elf, name):
    """Returns the disassembly of the function whose mangled name holds name as a
    whole identifier. The length prefix keeps outer from matching nested_outer."""
    lines = landing.run(objdump, ['-d', '--no-show-raw-insn', elf]).splitlines()
    header = re.compile(r'^[0-9a-f]+ <([^>]*)>:$')
    needle = re.compile(r'%d%s[EIJ]' % (len(name), re.escape(name)))
    body = None
    listing = []
    for line in lines:
        match = header.match(line)
        if match:
            if body is not None:
                break
            if needle.search(match.group(1)):
                body = match.group(1)
            continue
        if body is not None:
            listing.append(line)
    check(body is not None, 'no function named %s in the ELF' % name)
    return listing


def steps_of(objdump, elf, functions, frames):
    """Returns one step per frame, innermost first. Each step holds the throwing
    call, its outgoing bytes, and the pad that the packed block names for it."""
    steps = []
    for index, name in enumerate(frames):
        callee = THROW if index == 0 else frames[index - 1]
        listing = listing_of(objdump, elf, name)
        calls = landing.throwing_calls(listing, [callee])
        check(len(calls) == 1, 'frame %s has %d calls to %s, not one' % (name, len(calls), callee))
        call_pc, return_pc, _, outgoing = calls[0]
        record = next(f for f in functions if f['start'] <= call_pc < f['end'])
        sites = [s for s in record['sites'] if s['start'] <= return_pc - 1 < s['end']]
        check(len(sites) == 1, 'the call in %s at 0x%x is not covered by one site' % (name, call_pc))
        site = sites[0]
        last = index == len(frames) - 1
        check(site['action'] is not None, 'frame %s has no handler or cleanup at its call' % name)
        has_cleanup, entries = site['action']
        catch_all = [selector for selector, address in entries if address == 0]
        if last:
            check(catch_all, 'the outermost frame %s does not catch at its call' % name)
        else:
            check(has_cleanup, 'frame %s has no cleanup flag at its call' % name)
        steps.append({'frame': name, 'call': call_pc, 'outgoing': outgoing,
                      'pad': site['landing'], 'last': last,
                      'action': 'catch-all %d' % catch_all[0] if last else 'cleanup',
                      'selector': catch_all[0] if last else 0})
    return steps


def chain_of(steps):
    """Returns the events the throw must produce, in order, as (name, kind, step).

    The outermost frame calls first, so the calls run from the outside in, and the
    throw is the innermost call. After the throw, each pad is installed from the
    inside out, and each cleanup resumes into the next installation."""
    chain = []
    for index in reversed(range(len(steps))):
        chain.append(('0x%06x' % steps[index]['call'], 'call', index))
    for index, step in enumerate(steps):
        chain.append((INSTALL, 'install', index))
        chain.append(('0x%06x' % step['pad'], 'pad', index))
        if not step['last']:
            chain.append((RESUME, 'resume', index))
    chain += [(BEGIN, 'begin', None), (END, 'end', None), (FREE, 'free', None)]
    return chain


def verify(args):
    objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    nm = os.path.join(args.bin_dir, 'llvm-nm')
    check(len(args.frame) >= 2, 'a chain needs at least two frames')

    with open(args.image, 'rb') as handle:
        image = handle.read()
    anchor = aveh.symbol_address(nm, args.elf, aveh.ANCHOR)
    check(anchor is not None, 'the ELF lacks the metadata anchor')
    block = aveh.read_u(image, anchor, 3)
    functions, _ = aveh.decode_block(image, block)

    steps = steps_of(objdump, args.elf, functions, args.frame)
    chain = chain_of(steps)

    points = []
    for name, _, _ in chain:
        if name not in points and not name.startswith('0x'):
            points.append(name)
    for step in steps:
        for name in ('0x%06x' % step['call'], '0x%06x' % step['pad']):
            if name not in points:
                points.append(name)

    observed = landing.probe_events(args.probe, args.interpreter, args.boundary,
                                    args.image, args.elf, points)
    # The program may throw again after this chain. The chain is the first throw,
    # and it ends when its exception object is freed, so later events are not
    # counted.
    freed = next((i for i, (name, _, _) in enumerate(observed) if name == FREE), None)
    check(freed is not None, 'the chain never freed its exception object')
    observed = observed[:freed + 1]

    # Walk the observed events once. Every chain entry must appear, in order.
    matched = []
    cursor = 0
    for name, kind, index in chain:
        while cursor < len(observed) and observed[cursor][0] != name:
            cursor += 1
        check(cursor < len(observed),
              'the chain did not reach %s after %d of %d events' % (
                  name, len(matched), len(chain)))
        event_name, sp, regs = observed[cursor]
        cursor += 1
        matched.append((kind, index, sp, regs))

    failures = []
    install_headers = set()
    pad_sps = []
    for kind, index, sp, regs in matched:
        if kind == 'call':
            steps[index]['call_sp'] = sp
            steps[index]['call_regs'] = regs
        elif kind == 'install':
            steps[index]['install_sp'] = sp
            steps[index]['install_r5'] = regs[5]
            install_headers.add(regs[4])
        elif kind == 'pad':
            steps[index]['pad_sp'] = sp
            steps[index]['pad_regs'] = regs
            pad_sps.append(sp)
        elif kind in ('begin', 'end', 'free'):
            if kind == 'begin':
                install_headers.add(regs[4])

    for step in steps:
        want = step['call_sp'] + step['outgoing']
        if step['pad_sp'] != want:
            failures.append('%s: landing SP 0x%04x, expected 0x%04x' % (
                step['frame'], step['pad_sp'], want))
        if step['install_r5'] != step['selector']:
            failures.append('%s: installed with selector %d, expected %d' % (
                step['frame'], step['install_r5'], step['selector']))
        if step['pad_regs'][5] != step['selector']:
            failures.append('%s: pad saw r5 %d, expected %d' % (
                step['frame'], step['pad_regs'][5], step['selector']))
        if step['pad_regs'][0:4] != step['call_regs'][0:4]:
            failures.append('%s: r0-r3 changed across the landing' % step['frame'])
    for earlier, later in zip(pad_sps, pad_sps[1:]):
        if not earlier < later:
            failures.append('landing SP did not move toward the caller: 0x%04x then 0x%04x'
                            % (earlier, later))
    if len(install_headers) != 1:
        failures.append('the chain named %d exception headers, not one' % len(install_headers))

    counts = {}
    for name, _, _ in observed:
        counts[name] = counts.get(name, 0) + 1
    for step in steps:
        pad = '0x%06x' % step['pad']
        if counts.get(pad, 0) != 1:
            failures.append('pad %s of %s was entered %d times' % (pad, step['frame'],
                                                                  counts.get(pad, 0)))
    installs = counts.get(INSTALL, 0)
    if installs != len(steps):
        failures.append('%d installations for %d pads' % (installs, len(steps)))
    resumes = counts.get(RESUME, 0)
    if resumes != len(steps) - 1:
        failures.append('_Unwind_Resume ran %d times, expected %d' % (resumes, len(steps) - 1))
    for name, want in ((BEGIN, 1), (END, 1), (FREE, 1)):
        if counts.get(name, 0) != want:
            failures.append('%s ran %d times, expected %d' % (name, counts.get(name, 0), want))

    print('%s: %s' % (os.path.basename(args.elf), ' -> '.join(args.frame)))
    print('  %-14s %-14s %-4s %-8s %-8s %-8s %-4s' % (
        'frame', 'action', 'out', 'call_sp', 'pad_sp', 'expect', 'sel'))
    for step in steps:
        print('  %-14s %-14s %-4d 0x%04x   0x%04x   0x%04x   %-4d' % (
            step['frame'], step['action'], step['outgoing'], step['call_sp'],
            step['pad_sp'], step['call_sp'] + step['outgoing'], step['install_r5']))
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
    parser.add_argument('--frame', action='append', required=True,
                        help='substring of a frame name, innermost first')
    args = parser.parse_args()
    try:
        verify(args)
    except Failure as error:
        print('FAIL: %s' % error, file=sys.stderr)
        return 1
    print('cleanup chain matches the packed metadata and the machine code')
    return 0


if __name__ == '__main__':
    sys.exit(main())
