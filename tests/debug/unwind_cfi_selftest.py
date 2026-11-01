#!/usr/bin/env python3
"""Check that the unwind CFI verifier rejects corrupted call-frame information.

The verifier is run on each fixture first, which must pass. Then each mutation
edits one parsed .debug_frame row of that fixture, chosen by its properties
rather than by address, and the verifier must report an error. A verifier that
accepts a corrupted row would give no evidence about the real images.
"""

import argparse
import importlib.util
import sys
from pathlib import Path


def load_verifier():
    path = Path(__file__).with_name('unwind_cfi_verify.py')
    spec = importlib.util.spec_from_file_location('unwind_cfi_verify', path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


VERIFY = load_verifier()


def find_row(fdes, allowed, predicate):
    """Return (begin, index) of the first row of a verified function that
    satisfies predicate. Rows outside the verified functions are never checked,
    so a corruption there would show nothing."""
    for begin in sorted(allowed):
        for index, row in enumerate(fdes[begin][1]):
            if index and predicate(row):
                return begin, index
    raise RuntimeError('fixture has no row for this mutation')


def set_row(fdes, begin, index, row):
    end, rows = fdes[begin]
    rows = list(rows)
    rows[index] = row
    fdes[begin] = (end, rows)


def shift_sp_offset(fdes, allowed):
    begin, index = find_row(
        fdes, allowed, lambda row: row.state.base == 'SP' and row.state.offset != 3)
    row = fdes[begin][1][index]
    state = row.state._replace(offset=row.state.offset + 2)
    set_row(fdes, begin, index, row._replace(state=state))


def drop_saved_slot(fdes, allowed):
    begin, index = find_row(
        fdes, allowed, lambda row: any(name != 'PC' for name, _ in row.state.rules))
    row = fdes[begin][1][index]
    rules = tuple(rule for rule in row.state.rules if rule[0] == 'PC')
    set_row(fdes, begin, index,
            row._replace(state=row.state._replace(rules=rules)))


def move_return_slot(fdes, allowed):
    begin, index = find_row(fdes, allowed, lambda row: True)
    row = fdes[begin][1][index]
    rules = tuple(('PC', -5) if name == 'PC' else (name, slot)
                  for name, slot in row.state.rules)
    set_row(fdes, begin, index,
            row._replace(state=row.state._replace(rules=rules)))


def shift_r3_offset(fdes, allowed):
    begin, index = find_row(fdes, allowed,
                           lambda row: row.state.base == 'R3')
    row = fdes[begin][1][index]
    state = row.state._replace(offset=row.state.offset + 2)
    set_row(fdes, begin, index, row._replace(state=state))


def sp_for_r3_rule(fdes, allowed):
    """Describe an r3-based row as SP-based, which the stack cannot satisfy
    inside a dynamic region."""
    begin, index = find_row(fdes, allowed,
                           lambda row: row.state.base == 'R3')
    row = fdes[begin][1][index]
    set_row(fdes, begin, index,
            row._replace(state=row.state._replace(base='SP')))


MUTATIONS = (
    ('SP-based CFA offset', shift_sp_offset),
    ('saved register slot dropped', drop_saved_slot),
    ('return address slot moved', move_return_slot),
    ('r3-based CFA offset', shift_r3_offset),
    ('r3-based row described as SP-based', sp_for_r3_rule),
)


class MutatedVerifier(VERIFY.Verifier):
    """A verifier whose .debug_frame rows pass through one mutation."""

    def __init__(self, tool_paths, mutation):
        super().__init__(tool_paths)
        self.mutation = mutation

    def parse_frame(self, elf):
        cies, fdes = super().parse_frame(elf)
        symbols = self.parse_symbols(elf)
        allowed = {symbols[name][0] for name in VERIFY.FIXTURE_FUNCTIONS
                   if name in symbols}
        if self.mutation is not None:
            self.mutation(fdes, allowed)
        return cies, fdes


def run_case(tool_paths, mutation, case):
    name, elf, frame_style, debug = case
    verifier = MutatedVerifier(tool_paths, mutation)
    verifier.verify_case(name, elf, frame_style, debug)
    return verifier.errors


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for tool in VERIFY.TOOLS:
        parser.add_argument(f'--{tool}', required=True)
    parser.add_argument('--case', action='append', type=VERIFY.parse_case,
                        required=True,
                        help='NAME:ELF:fp|omit:debug|nodebug')
    args = parser.parse_args()
    tool_paths = {tool: getattr(args, tool.replace('-', '_'))
                  for tool in VERIFY.TOOLS}
    failures = []
    for case in args.case:
        errors = run_case(tool_paths, None, case)
        if errors:
            failures.append(f'{case[0]}: pristine fixture rejected: {errors[0]}')
            continue
        for label, mutation in MUTATIONS:
            errors = run_case(tool_paths, mutation, case)
            if not errors:
                failures.append(f'{case[0]}: verifier accepted {label}')
            else:
                print(f'{case[0]}: rejected {label}: {errors[0]}')
    if failures:
        for message in failures:
            print(f'error: {message}', file=sys.stderr)
        return 1
    print('unwind CFI verifier self-test passed')
    return 0


if __name__ == '__main__':
    sys.exit(main())
