#!/usr/bin/env python3
"""Checks that the probe reports every execution of a guest jump that never finishes.

The self-loop fixture repeats one JMP8 to itself, so the run ends at the cycle limit,
not at SYS debug_break. Each execution of that jump begins a guest instruction boundary
with the same guest state (VM_PC, SP, and registers). The probe samples each boundary
whose first native instruction executes, so every execution is reported. A probe that
suppressed repeated guest state would report only one.

The check reads the probe output and confirms that:

  - the run stops at the cycle limit, with status "did not finish" and no native fault;
  - the fixture's two setup instructions and each loop execution are counted once, so
    samples equals the setup count plus the loop snapshots;
  - the snapshot at the loop symbol names that symbol's address and the fixture's SP,
    and every snapshot holds the same registers;
  - there are at least MIN_SNAPSHOTS snapshots, and their cycle counts strictly increase.
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

LOOP = 'loop'
# The fixture sets this SP before its loop.
SP = 0x09c0
# The fixture's ldi16 and setsp are the only boundaries before the loop.
SETUP_BOUNDARIES = 2
MIN_SNAPSHOTS = 3
# The interpreter takes about 6.2 million emulator steps to boot and reach the fixture's
# first boundary. The limit leaves several hundred thousand steps of loop after that.
CYCLE_LIMIT = 6500000

SNAPSHOT = re.compile(
    r'^snapshot (\S+) pc=0x([0-9a-f]+) sp=0x([0-9a-f]+) cycle=(\d+) '
    r'regs=([0-9a-f,]+)',
    re.MULTILINE)
STATUS = re.compile(r'^status: did not finish cycles=(\d+) ', re.MULTILINE)
SAMPLES = re.compile(r'^samples: (\d+)$', re.MULTILINE)


def run_probe(args):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf,
               '--cycle-limit', str(CYCLE_LIMIT), '--snapshot', LOOP]
    result = subprocess.run(command, capture_output=True, text=True)
    return result.returncode, result.stdout


def verify(args):
    nm = os.path.join(args.bin_dir, 'llvm-nm')
    loop_address = aveh.symbol_address(nm, args.elf, LOOP)
    check(loop_address is not None, 'the ELF lacks the %s symbol' % LOOP)

    returncode, output = run_probe(args)
    check('native fault' not in output,
          'the probe reported a native fault:\n%s' % output[-800:])
    status = STATUS.search(output)
    check(returncode == 1 and status is not None,
          'the run did not end at the cycle limit:\n%s' % output[-800:])
    check(int(status.group(1)) == CYCLE_LIMIT,
          'the run stopped after %s steps, not the cycle limit %d' % (
              status.group(1), CYCLE_LIMIT))

    snapshots = []
    for match in SNAPSHOT.finditer(output):
        if match.group(1) != LOOP:
            continue
        pc = int(match.group(2), 16)
        sp = int(match.group(3), 16)
        check(pc == loop_address,
              'the %s snapshot is at 0x%06x, not 0x%06x' % (LOOP, pc, loop_address))
        check(sp == SP, 'the %s snapshot has SP 0x%04x, not 0x%04x' % (LOOP, sp, SP))
        snapshots.append({
            'cycle': int(match.group(4)),
            'regs': [int(v, 16) for v in match.group(5).split(',')],
        })
    check(len(snapshots) >= MIN_SNAPSHOTS,
          'the %s symbol was sampled %d times, fewer than %d' % (
              LOOP, len(snapshots), MIN_SNAPSHOTS))
    regs = snapshots[0]['regs']
    for snapshot in snapshots:
        check(snapshot['regs'] == regs,
              'the %s snapshots do not hold one register set' % LOOP)
    for previous, snapshot in zip(snapshots, snapshots[1:]):
        check(snapshot['cycle'] > previous['cycle'],
              'the %s snapshot at cycle %d does not follow cycle %d' % (
                  LOOP, snapshot['cycle'], previous['cycle']))

    samples = SAMPLES.search(output)
    check(samples is not None, 'the probe printed no samples count')
    samples = int(samples.group(1))
    check(samples > 1, 'the probe counted %d boundaries' % samples)
    check(samples == SETUP_BOUNDARIES + len(snapshots),
          'the probe counted %d boundaries, not %d setup plus %d loop executions' % (
              samples, SETUP_BOUNDARIES, len(snapshots)))
    return {'loop': len(snapshots), 'samples': samples}


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
    print('eh_probe_boundary_verify: %s: %d executions of %s, %d boundaries, %d steps' % (
        os.path.basename(args.elf), stats['loop'], LOOP, stats['samples'], CYCLE_LIMIT))
    return 0


if __name__ == '__main__':
    sys.exit(main())
