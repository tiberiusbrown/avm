#!/usr/bin/env python3
"""Measures the emulated AVR cycles of each throw in an EH fixture, from the probe.

Pass 1 snapshots every runtime entry point and reads each landing context, which gives
the return PCs and the landing PCs. Pass 2 repeats the run with those return and landing
PCs added, so each helper's inclusive cycles and each landing have exact stamps. The
emulator is deterministic, so pass 2 must reproduce pass 1's stamps, and the script
checks that. The probe only observes the guest, so the cycle counts are unaffected.

Usage: eh_throw_cycles.py --probe PROBE --interpreter HEX --boundary JSON --nm LLVM_NM
       --elf ELF --image BIN --json OUT.json
The JSON holds one row per throw: the frames searched, the phase times, the entry to
landing time, the time to __cxa_begin_catch and to the end of the catch, and the
inclusive cycles of each helper.
"""

import argparse
import json
import os
import re
import subprocess
import sys
from collections import Counter

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import eh_runtime_layout as layout  # noqa: E402

ENTRY_SYMBOLS = [
    '__cxa_throw', '__avm_eh_throw', 'avm_eh_find_handler', 'avm_eh_prepare_next',
    '__avm_eh_install_context', '__cxa_begin_catch', '__cxa_end_catch', '_Unwind_Resume',
    'find_function', 'find_row', 'find_site', 'find_call', 'unwind_frame', 'match_list',
    'match_class_base', 'list_ok', 'site_ok', 'site_has_call', 'avm_eh_open_exception',
]
# Entries that return to a caller, so a return PC pairs them with their exit.
RETURNING = {
    'avm_eh_find_handler', 'avm_eh_prepare_next', 'find_function', 'find_row', 'find_site',
    'find_call', 'unwind_frame', 'match_list', 'match_class_base', 'list_ok', 'site_ok',
    'site_has_call', 'avm_eh_open_exception', '__cxa_begin_catch', '__cxa_end_catch',
}
SNAP = re.compile(
    r'^snapshot (\S+) pc=0x([0-9a-f]+) sp=0x([0-9a-f]+) cycle=(\d+) '
    r'regs=([0-9a-f]{4}(?:,[0-9a-f]{4}){7}) record=0x([0-9a-f]{6})(?: bytes=([0-9a-f]+))?$',
    re.M)


def present_symbols(nm, elf):
    text = subprocess.run([nm, '-n', elf], capture_output=True, text=True, check=True).stdout
    return {line.split()[-1] for line in text.splitlines() if len(line.split()) >= 3}


def run_probe(args, snapshots, bytes_count):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf, '--cycle-limit', '400000000']
    for name in snapshots:
        command += ['--snapshot', name]
    if bytes_count:
        command += ['--snapshot-bytes', str(bytes_count)]
    result = subprocess.run(command, capture_output=True, text=True)
    events = []
    for m in SNAP.finditer(result.stdout):
        event = {
            'name': m.group(1), 'pc': int(m.group(2), 16), 'sp': int(m.group(3), 16),
            'cycle': int(m.group(4)), 'regs': [int(x, 16) for x in m.group(5).split(',')],
            'record': int(m.group(6), 16),
        }
        if m.group(7):
            event['bytes'] = bytes.fromhex(m.group(7))
        events.append(event)
    status = re.search(r'^status: (.*)$', result.stdout, re.M)
    return events, status.group(1) if status else result.stderr.strip()


def analyze(events):
    """Groups the events into throws, pairs each call with its return, and sums."""
    throws = []
    current = None
    open_calls = []      # (name, entry cycle, return PC, frame index)
    pending_landing = None
    resumes = []
    for e in events:
        name, cycle = e['name'], e['cycle']
        if not name.startswith('0x'):
            if name == '__cxa_throw':
                current = {'start': cycle, 'calls': Counter(), 'inclusive': Counter(),
                           'phase2_entries': [], 'installs': [], 'landings': [],
                           'begin': None, 'end_done': None, 'resumes': [],
                           'selector': e['regs'][5]}
                throws.append(current)
                open_calls = []
                pending_landing = None
                continue
            if current is None:
                continue
            if name in RETURNING:
                current['calls'][name] += 1
                open_calls.append((name, cycle, e['record']))
            if name == 'avm_eh_prepare_next':
                current['phase2_entries'].append(cycle)
            if name == '__avm_eh_throw':
                current['eh_throw'] = cycle
            if name == '__avm_eh_install_context':
                b = e['bytes']
                landing = layout.context_pc(b)
                current['installs'].append({'cycle': cycle, 'selector': e['regs'][5],
                                            'landing': landing})
                pending_landing = landing
            if name == '_Unwind_Resume':
                current.setdefault('resume_cycles', []).append(cycle)
            if name == '__cxa_begin_catch' and current['begin'] is None:
                current['begin'] = cycle
            continue
        # Raw address: a return PC or a landing PC.
        pc = e['pc']
        if current is None:
            continue
        for i in range(len(open_calls) - 1, -1, -1):
            callee, entry, ret = open_calls[i]
            if ret == pc:
                current['inclusive'][callee] += cycle - entry
                del open_calls[i]
                if callee == '__cxa_end_catch' and current['end_done'] is None:
                    current['end_done'] = cycle
                if callee == 'avm_eh_find_handler':
                    current['phase1_end'] = cycle
                break
        if pending_landing is not None and pc == pending_landing:
            current['landings'].append(cycle)
            pending_landing = None
    return throws


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--nm', required=True)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--json', required=True)
    args = parser.parse_args()

    present = present_symbols(args.nm, args.elf)
    names = [s for s in ENTRY_SYMBOLS if s in present]
    pass1, status1 = run_probe(args, names, layout.CONTEXT_SIZE)
    # Only the call sites' return PCs and the landing PCs are added in pass 2.
    raw = set()
    for e in pass1:
        if e['name'] in RETURNING or e['name'] in ('__avm_eh_throw', '_Unwind_Resume'):
            raw.add(e['record'])
        if e['name'] == '__avm_eh_install_context':
            b = e['bytes']
            raw.add(layout.context_pc(b))
    pass2, status2 = run_probe(args, names + ['0x%06x' % a for a in sorted(raw)], layout.CONTEXT_SIZE)

    # Pass 2 keeps every stamp of pass 1, which the check below confirms.
    stamps1 = [(e['name'], e['cycle']) for e in pass1]
    stamps2 = [(e['name'], e['cycle']) for e in pass2 if not e['name'].startswith('0x')]
    if stamps1 != stamps2:
        print('pass 2 stamps differ from pass 1', file=sys.stderr)
        return 1
    throws = analyze(sorted(pass2, key=lambda e: e['cycle']))
    result = {'status': status2, 'throws': []}
    for index, t in enumerate(throws):
        landing_final = next((c for c, i in zip(t['landings'], t['installs'])
                              if i['selector'] != 0), None)
        final_install = next((i for i in t['installs'] if i['selector'] != 0), None)
        first_pn = t['phase2_entries'][0] if t['phase2_entries'] else None
        row = {
            'index': index,
            'selector': final_install['selector'] if final_install else 0,
            'shim': t.get('eh_throw', t['start']) - t['start'],
            'phase1_from_eh_throw': t['phase1_end'] - t['eh_throw'] if 'phase1_end' in t else None,
            'phase2_calls': t['calls']['avm_eh_prepare_next'],
            'find_function_calls': t['calls']['find_function'],
            'find_row_calls': t['calls']['find_row'],
            'find_site_calls': t['calls']['find_site'],
            'find_call_calls': t['calls']['find_call'],
            'unwind_frame_calls': t['calls']['unwind_frame'],
            'match_list_calls': t['calls']['match_list'],
            'entry_to_final_landing': (final_install and landing_final) and landing_final - t['start'],
            'throw_to_begin_catch': t['begin'] - t['start'] if t['begin'] else None,
            'throw_to_completion': t['end_done'] - t['start'] if t['end_done'] else None,
            'phase2_dispatch_to_landing': (landing_final - first_pn) if (first_pn and landing_final) else None,
            'inclusive': dict(t['inclusive']),
            'installs': [(i['cycle'], i['selector'], i['landing']) for i in t['installs']],
            'resume_cycles': t.get('resume_cycles', []),
        }
        result['throws'].append(row)
    with open(args.json, 'w') as f:
        json.dump(result, f, indent=1)
    print('status: %s (pass1: %s)' % (status2, status1))
    print('throws: %d' % len(result['throws']))
    for row in result['throws']:
        print('throw %2d sel=%5d shim=%6s find_fn=%3d p2=%d entry->landing=%s throw->begin=%s '
              'throw->done=%s p2dispatch->landing=%s' % (
                  row['index'], row['selector'], row['shim'], row['find_function_calls'],
                  row['phase2_calls'], row['entry_to_final_landing'],
                  row['throw_to_begin_catch'], row['throw_to_completion'],
                  row['phase2_dispatch_to_landing']))
    return 0


if __name__ == '__main__':
    sys.exit(main())
