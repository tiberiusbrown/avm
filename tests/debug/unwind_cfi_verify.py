#!/usr/bin/env python3
"""Verify call-frame information in linked AVM fixture images.

The AVM CFI ABI starts every function with CFA = SP + 3, the saved PC at
CFA - 3, and two-byte callee-saved slots. This script checks each final ELF
against that ABI by executing every fixture function symbolically over its
control-flow graph. A state records SP and each register as offsets from
CFA0, the canonical frame address of the current invocation. A dynamic
adjustment makes SP unknown, but a value that was copied from r3 before the
adjustment keeps the frame recoverable. At every reachable instruction boundary,
the .debug_frame row covering the boundary must describe the state: an SP-based
CFA needs a known SP, an r3-based CFA needs a known frame pointer, and every
saved slot must hold the entry value of its register. Returns and tail jumps
must leave the entry frame, with every callee-saved register restored.
"""

import argparse
import bisect
import re
import subprocess
import sys
from collections import namedtuple

FIXTURE_FUNCTIONS = (
    'unwind_leaf',
    'unwind_save_regs',
    'unwind_fixed_frame',
    'unwind_large_frame',
    'unwind_dynamic_frame',
    'unwind_nested_inner',
    'unwind_nested_middle',
    'unwind_nested_outer',
    'unwind_many_args',
    'unwind_stack_args',
    'unwind_multi_exit',
    'unwind_six_args',
    'unwind_many_args_alt',
    'unwind_varied_args',
    'unwind_branch_args',
    'unwind_branch_return_args',
    'unwind_dynamic_twice',
    'unwind_dynamic_args',
    'unwind_return_tails',
    'unwind_tail_direct',
    'unwind_tail_select',
    'unwind_tail_stack_args',
    'unwind_chain_leaf',
    'unwind_chain_args',
    'unwind_chain_dynamic',
    'unwind_chain_top',
    'main',
)

# Functions whose SP moves by a run-time amount. Each must have a boundary
# where SP is unknown and the CFA is still verified through r3.
DYNAMIC_FUNCTIONS = ('unwind_dynamic_frame', 'unwind_dynamic_twice',
                     'unwind_dynamic_args', 'unwind_chain_dynamic')

# SP is CFA0 + ENTRY_SP at entry: the return address occupies three bytes.
ENTRY_SP = -3
CALLEE_SAVED = ('r0', 'r1', 'r2', 'r3')
CALLER_SAVED = ('r4', 'r5', 'r6', 'r7')
# A 32-bit pair name covers two 16-bit registers, as in the disassembly.
PAIRS = {'q0': ('r0', 'r1'), 'q1': ('r2', 'r3'), 'q2': ('r4', 'r5'),
         'q3': ('r6', 'r7')}
REGISTER_OPERAND = re.compile(r'^(r[0-7]|q[0-3])$')
POST_INCREMENT = re.compile(r'\[(r[0-7]|q[0-3])\+\]')
# Stores, compares, branches, calls and stack control write no register.
# Every other instruction writes its first register operand.
NO_REGISTER_WRITE = re.compile(
    r'^(st|cmp|tst|jmp|br|call|ret|push16|adjsp|setsp|sys)')

# base is 'SP' or 'R3'. offset is the CFA offset from base. rules maps each
# saved register to its slot relative to CFA, as sorted (name, slot) pairs.
RowState = namedtuple('RowState', 'base offset rules')
Row = namedtuple('Row', 'address state')
# sp is the offset of SP from CFA0, or None when a dynamic adjustment hides it.
# regs holds ('frame', offset) for a stack address, or ('entry', name) for a
# register that still holds its entry value; missing names are unknown.
# saved maps each pushed register to the offset of the slot holding its entry
# value. All three are canonical tuples so that equal states compare equal.
State = namedtuple('State', 'sp regs saved')

CIE_HEADER = re.compile(r'^[0-9a-f]{8} [0-9a-f]{8} ffffffff CIE$')
FDE_HEADER = re.compile(
    r'^[0-9a-f]{8} [0-9a-f]{8} [0-9a-f]{8} FDE cie=[0-9a-f]+ '
    r'pc=([0-9a-f]+)\.\.\.([0-9a-f]+)$')
ROW_LINE = re.compile(r'^\s+0x([0-9a-f]+): (CFA=.*)$')
CFA_TEXT = re.compile(r'^CFA=(SP|R3)([+-]\d+)')
SLOT_TEXT = re.compile(r'(R\d+|PC)=\[CFA([+-]\d+)\]')
INSN_LINE = re.compile(r'^\s*([0-9a-f]+):\s+(\S+)(?:\s+(.*?))?\s*$')
SYMBOL_LINE = re.compile(r'^([0-9a-f]+) ([0-9a-f]+) [A-Za-z] (\S+)$')
SECTION_NAME = re.compile(r'^\s+Name: (\S+) \(')
SECTION_SIZE = re.compile(r'^\s+Size: (\S+)$')
SECTION_FLAGS = re.compile(r'^\s+Flags \[ \(0x([0-9a-f]+)\)')
TARGET_OPERAND = re.compile(r'<([^>]+)>')
TOOLS = ('llvm-dwarfdump', 'llvm-readobj', 'llvm-nm', 'llvm-objdump')
# A join that reaches an address with more distinct states than this has an
# unbounded stack pattern, such as a loop that pushes on every iteration.
MAX_STATES_PER_ADDRESS = 256


def parse_state(text):
    match = CFA_TEXT.match(text)
    if match is None:
        raise ValueError(f'malformed CFI row: {text}')
    rules = tuple(sorted((name, int(slot))
                         for name, slot in SLOT_TEXT.findall(text)))
    return RowState(match.group(1), int(match.group(2)), rules)


def operand_list(text):
    """Return the operands without a trailing <symbol> target."""
    text = TARGET_OPERAND.sub('', text)
    return [part.strip() for part in text.split(',') if part.strip()]


def registers_named(operand):
    """Return the 16-bit registers that an operand names."""
    return PAIRS.get(operand, (operand,))


def defined_registers(mnemonic, args):
    """Return the registers written by an instruction that transfer() does not
    model explicitly: its first register operand and any post-incremented base.
    """
    names = []
    if NO_REGISTER_WRITE.match(mnemonic) is None and args and \
            REGISTER_OPERAND.match(args[0]):
        names.extend(registers_named(args[0]))
    for operand in args:
        match = POST_INCREMENT.fullmatch(operand)
        if match:
            names.append(match.group(1))
    return names


def set_register(regs, name, value):
    """Record a register value, keeping unknown values out of the state."""
    if value is None:
        regs.pop(name, None)
    else:
        regs[name] = value


def describe_value(value):
    if value is None:
        return 'unknown'
    kind, detail = value
    if kind == 'frame':
        return f'CFA0{detail:+d}'
    return f'entry {detail}'


def describe(state):
    sp = 'unknown' if state.sp is None else f'CFA0{state.sp:+d}'
    regs = ' '.join(f'{name}={describe_value(value)}'
                    for name, value in state.regs)
    saved = ' '.join(f'{name}@CFA0{slot:+d}' for name, slot in state.saved)
    return f'SP={sp} {regs} saved[{saved}]'


class Verifier:
    def __init__(self, tool_paths):
        self.tool_paths = tool_paths
        self.errors = []

    def error(self, message):
        if message not in self.errors:
            self.errors.append(message)

    def run(self, tool, *args):
        result = subprocess.run([self.tool_paths[tool], *args],
                                capture_output=True, text=True, check=False)
        if result.returncode != 0:
            raise RuntimeError(f'{tool} {" ".join(args)} failed: '
                               f'{result.stderr}')
        return result.stdout

    def parse_sections(self, elf):
        sections = {}
        name = None
        for line in self.run('llvm-readobj', '--sections', elf).splitlines():
            match = SECTION_NAME.match(line)
            if match:
                name = match.group(1)
                sections[name] = {'size': 0, 'flags': None}
                continue
            if name is None:
                continue
            match = SECTION_SIZE.match(line)
            if match:
                sections[name]['size'] = int(match.group(1), 0)
            match = SECTION_FLAGS.match(line)
            if match:
                sections[name]['flags'] = int(match.group(1), 16)
        return sections

    def parse_symbols(self, elf):
        symbols = {}
        for line in self.run('llvm-nm', '-n', '-S', elf).splitlines():
            match = SYMBOL_LINE.match(line)
            if match:
                symbols[match.group(3)] = (int(match.group(1), 16),
                                           int(match.group(2), 16))
        return symbols

    def parse_instructions(self, elf):
        instructions = {}
        for line in self.run('llvm-objdump', '-d', '--no-show-raw-insn',
                             elf).splitlines():
            match = INSN_LINE.match(line)
            if match:
                instructions[int(match.group(1), 16)] = (
                    match.group(2), match.group(3) or '')
        return instructions

    def parse_frame(self, elf):
        """Return (cies, fdes): fdes maps each begin to (end, rows)."""
        cies = 0
        fdes = {}
        current = None
        for line in self.run('llvm-dwarfdump', '--debug-frame',
                             elf).splitlines():
            if CIE_HEADER.match(line):
                cies += 1
                current = None
                continue
            match = FDE_HEADER.match(line)
            if match:
                current = int(match.group(1), 16)
                fdes[current] = (int(match.group(2), 16), [])
                continue
            match = ROW_LINE.match(line)
            if match and current is not None:
                fdes[current][1].append(
                    Row(int(match.group(1), 16), parse_state(match.group(2))))
        return cies, fdes

    def check_image(self, name, elf, debug):
        sections = self.parse_sections(elf)
        verify = self.run('llvm-dwarfdump', '--verify', elf)
        if 'No errors.' not in verify:
            self.error(f'{name}: llvm-dwarfdump --verify reported errors')
        frame = sections.get('.debug_frame')
        if frame is None or frame['size'] == 0:
            self.error(f'{name}: .debug_frame is missing or empty')
        elif frame['flags'] != 0:
            self.error(f'{name}: .debug_frame is allocated')
        if '.eh_frame' in sections:
            self.error(f'{name}: unexpected allocated .eh_frame')
        if ('.debug_line' in sections) != debug:
            self.error(f'{name}: .debug_line presence does not match -g')
        cie_text = self.run('llvm-dwarfdump', '--debug-frame', elf)
        for pattern in (r'Address size:\s+3$', r'Data alignment factor: -1$',
                        r'Return address column: 9$',
                        r'DW_CFA_def_cfa: SP \+3$', r'DW_CFA_offset: PC -3$'):
            if not re.search(pattern, cie_text, re.MULTILINE):
                self.error(f'{name}: CIE lacks {pattern}')
        return frame['size'] if frame else 0

    def verify_case(self, name, elf, frame_style, debug):
        self.check_image(name, elf, debug)
        cies, fdes = self.parse_frame(elf)
        if cies == 0:
            self.error(f'{name}: no CIE in .debug_frame')
        symbols = self.parse_symbols(elf)
        instructions = self.parse_instructions(elf)

        stats = {'fdes': len(fdes), 'rows': 0, 'verified_rows': 0,
                 'sp_rows': 0, 'r3_rows': 0, 'checks': 0, 'sp_checks': 0,
                 'r3_checks': 0, 'dynamic_checks': 0, 'r3_dynamic_checks': 0,
                 'returns': 0, 'tail_jumps': 0}
        for function in FIXTURE_FUNCTIONS:
            if function not in symbols:
                self.error(f'{name}: fixture function {function} is not live')
                continue
            begin, size = symbols[function]
            end = begin + size
            if begin not in fdes or fdes[begin][0] != end:
                self.error(f'{name}: {function} lacks an FDE for '
                           f'[{begin:#x}, {end:#x})')
                continue
            rows = fdes[begin][1]
            report = self.check_function(
                name, function, begin, end, rows, instructions, symbols)
            for key in ('checks', 'sp_checks', 'r3_checks', 'dynamic_checks',
                        'r3_dynamic_checks', 'sp_rows', 'r3_rows',
                        'verified_rows', 'returns', 'tail_jumps'):
                stats[key] += report[key]
            stats['rows'] += len(rows)
            uses_r3 = any(row.state.base == 'R3' for row in rows)
            if frame_style == 'fp' and not uses_r3:
                self.error(f'{name}: {function} has no r3-based CFA rule')
            if function in DYNAMIC_FUNCTIONS:
                if report['r3_dynamic_checks'] == 0:
                    self.error(f'{name}: {function} verified no boundary '
                               'with SP unknown through r3')
            if function == 'unwind_large_frame':
                if sum(1 for row in rows[1:]
                       if row.state.base == 'SP') < 2:
                    self.error(f'{name}: large frame lacks multiple ADJSP rows')
            if function == 'unwind_multi_exit' and report['returns'] >= 2 \
                    and report['restored'] == 0:
                self.error(f'{name}: multi-exit function lacks a row after '
                           'a return')
        return stats

    def check_function(self, name, function, begin, end, rows, instructions,
                       symbols):
        """Explore every reachable state of one function and check each one.

        Returns counts of the boundaries and rows checked, split by CFA base
        and by whether SP was known."""
        addresses = sorted(a for a in instructions if begin <= a < end)
        following = dict(zip(addresses, addresses[1:]))
        row_addresses = [row.address for row in rows]
        if row_addresses != sorted(set(row_addresses)):
            self.error(f'{name}: {function} rows are not strictly increasing')
        for address in row_addresses:
            if not begin <= address <= end:
                self.error(f'{name}: {function} row {address:#x} is outside '
                           'its FDE')
            elif address != end and address not in instructions:
                self.error(f'{name}: {function} row {address:#x} is not on an '
                           'instruction boundary')
        if rows and rows[0].address != begin:
            self.error(f'{name}: {function} first row is not at its start')

        entry = State(ENTRY_SP,
                      tuple((reg, ('entry', reg)) for reg in CALLEE_SAVED),
                      ())
        # Each address keeps every distinct state that reaches it. Joins are
        # never merged, so a conflict in any path is checked on that path.
        seen = {begin: {entry}}
        pending = [(begin, entry)]
        report = {'returns': 0, 'tail_jumps': 0, 'restored': 0, 'checks': 0,
                  'sp_checks': 0, 'r3_checks': 0, 'dynamic_checks': 0,
                  'r3_dynamic_checks': 0}
        covered = set()
        while pending:
            address, state = pending.pop()
            index = self.covering_row(row_addresses, address)
            if index is None:
                self.error(f'{name}: {function} has no row covering '
                           f'{address:#x}')
                continue
            covered.add(index)
            self.check_row(name, function, address, rows[index], state, report)

            mnemonic, operands = instructions[address]
            target = self.branch_target(name, function, address, mnemonic,
                                        operands, symbols)
            leaves = target is not None and not begin <= target < end
            tail_jump = mnemonic.startswith('jmp') and \
                (target is None or leaves)
            if mnemonic == 'ret' or tail_jump:
                # A return or a tail jump must leave the entry frame intact.
                self.check_exit(name, function, address, state)
                report['returns' if mnemonic == 'ret' else 'tail_jumps'] += 1
                if following.get(address) in row_addresses:
                    report['restored'] += 1
                continue
            if leaves:
                self.error(f'{name}: {function} conditional branch at '
                           f'{address:#x} leaves the function')
                continue
            after = self.transfer(name, function, address, mnemonic, operands,
                                  state)
            for successor in self.successors(address, mnemonic, target,
                                             following):
                known = seen.setdefault(successor, set())
                if after in known:
                    continue
                if len(known) >= MAX_STATES_PER_ADDRESS:
                    self.error(f'{name}: {function} has more than '
                               f'{MAX_STATES_PER_ADDRESS} states at '
                               f'{successor:#x}; the stack is unbounded')
                    continue
                known.add(after)
                pending.append((successor, after))
        unreached = [a for a in addresses if a not in seen]
        if unreached:
            self.error(f'{name}: {function} has {len(unreached)} unreachable '
                       'instructions')
        unseen_rows = [row for index, row in enumerate(rows)
                       if index not in covered]
        for row in unseen_rows:
            self.error(f'{name}: {function} row {row.address:#x} is never '
                       'reached')
        verified = [rows[index] for index in covered]
        report['sp_rows'] = sum(1 for row in verified
                                if row.state.base == 'SP')
        report['r3_rows'] = sum(1 for row in verified
                                if row.state.base == 'R3')
        report['verified_rows'] = len(covered)
        return report

    def covering_row(self, row_addresses, address):
        index = bisect.bisect_right(row_addresses, address) - 1
        return index if index >= 0 else None

    def branch_target(self, name, function, address, mnemonic, operands,
                      symbols):
        """Return the resolved target of a jump or conditional branch.

        An indirect jump has no symbol and returns None."""
        if not mnemonic.startswith(('jmp', 'br')):
            return None
        match = TARGET_OPERAND.search(operands)
        if match is None:
            if mnemonic.startswith('jmp'):
                return None
            self.error(f'{name}: {function} branch at {address:#x} has no '
                       'target')
            return None
        symbol, _, offset = match.group(1).partition('+')
        if symbol not in symbols:
            self.error(f'{name}: {function} branch at {address:#x} targets '
                       f'unknown symbol {symbol}')
            return None
        return symbols[symbol][0] + (int(offset, 16) if offset else 0)

    def successors(self, address, mnemonic, target, following):
        if mnemonic.startswith('jmp'):
            return [] if target is None else [target]
        successors = [following[address]] if address in following else []
        if target is not None:
            successors.append(target)
        return successors

    def transfer(self, name, function, address, mnemonic, operands, state):
        """Return the state after the instruction at address.

        Each stack operation is checked against the symbolic state. Unknown
        results are dropped, so later rows that rely on them are reported."""
        where = f'{name}: {function} at {address:#x}'
        sp = state.sp
        regs = dict(state.regs)
        saved = dict(state.saved)
        args = operand_list(operands)
        if mnemonic == 'push16':
            reg = args[0]
            if regs.get(reg) != ('entry', reg):
                self.error(f'{where} pushes {reg}, which no longer holds its '
                           f'entry value ({describe(state)})')
            elif sp is None:
                self.error(f'{where} saves {reg} while SP is unknown; its '
                           'slot cannot be recorded')
            else:
                sp -= 2
                saved[reg] = sp
        elif mnemonic == 'pop16':
            reg = args[0]
            if sp is None:
                self.error(f'{where} pops {reg} while SP is unknown')
            elif saved.get(reg) != sp:
                self.error(f'{where} pops {reg} from CFA0{sp:+d}, but its '
                           f'saved slot is {saved.get(reg)}')
            else:
                del saved[reg]
                regs[reg] = ('entry', reg)
                sp += 2
        elif mnemonic == 'adjsp':
            if sp is not None:
                sp += int(args[0], 0)
        elif mnemonic == 'getsp':
            set_register(regs, args[0], None if sp is None else ('frame', sp))
        elif mnemonic == 'setsp':
            value = regs.get(args[0])
            sp = value[1] if value is not None and value[0] == 'frame' \
                else None
        elif mnemonic == 'leasp':
            set_register(regs, args[0],
                         None if sp is None else ('frame', sp + int(args[1], 0)))
        elif mnemonic == 'mov' and len(args) == 2 and \
                REGISTER_OPERAND.match(args[1]):
            set_register(regs, args[0], regs.get(args[1]))
        elif mnemonic.startswith('call'):
            # The callee preserves the callee-saved registers and SP.
            for reg in CALLER_SAVED:
                regs.pop(reg, None)
        elif mnemonic == 'sys' and operands.strip() == 'debug_break':
            # debug_break declares no inputs, outputs, or clobbers.
            pass
        elif mnemonic == 'sys':
            # A service writes its declared outputs, which may be any register.
            regs.clear()
        else:
            for reg in defined_registers(mnemonic, args):
                regs.pop(reg, None)
        return State(sp,
                     tuple(sorted(regs.items())),
                     tuple(sorted(saved.items())))

    def check_exit(self, name, function, address, state):
        where = f'{name}: {function} leaves at {address:#x}'
        if state.sp is None:
            self.error(f'{where} with SP unknown ({describe(state)})')
        elif state.sp != ENTRY_SP:
            self.error(f'{where} with SP at CFA0{state.sp:+d}, not CFA0-3 '
                       f'({describe(state)})')
        if state.saved:
            self.error(f'{where} with saved registers still on the stack '
                       f'({describe(state)})')
        regs = dict(state.regs)
        for reg in CALLEE_SAVED:
            if regs.get(reg) != ('entry', reg):
                self.error(f'{where} without restoring {reg} '
                           f'({describe(state)})')

    def check_row(self, name, function, address, row, state, report):
        where = f'{name}: {function} at {address:#x}'
        report['checks'] += 1
        state_row = row.state
        if state_row.base == 'SP':
            report['sp_checks'] += 1
        else:
            report['r3_checks'] += 1
        if state.sp is None:
            report['dynamic_checks'] += 1
            if state_row.base == 'R3':
                report['r3_dynamic_checks'] += 1

        if state_row.base == 'SP':
            if state.sp is None:
                self.error(f'{where} has CFA=SP+{state_row.offset} while SP is '
                           f'unknown ({describe(state)})')
            elif state.sp + state_row.offset != 0:
                self.error(f'{where} has CFA=SP+{state_row.offset}; the stack '
                           f'gives SP+{-state.sp}')
        else:
            value = dict(state.regs).get('r3')
            if value is None or value[0] != 'frame':
                self.error(f'{where} has CFA=R3+{state_row.offset}, but r3 '
                           f'holds no known frame address '
                           f'({describe(state)})')
            elif value[1] + state_row.offset != 0:
                self.error(f'{where} has CFA=R3+{state_row.offset}; r3 gives '
                           f'R3+{-value[1]}')
        expected = {'PC': -3}
        for reg, slot in state.saved:
            expected[reg.upper()] = slot
        expected = tuple(sorted(expected.items()))
        if state_row.rules != expected:
            self.error(f'{where} has saved slots {state_row.rules}; the '
                       f'pushes give {expected}')


def parse_case(text):
    parts = text.split(':')
    if len(parts) != 4 or parts[2] not in ('fp', 'omit') or \
            parts[3] not in ('debug', 'nodebug'):
        raise argparse.ArgumentTypeError(
            'case must be NAME:ELF:fp|omit:debug|nodebug')
    return parts[0], parts[1], parts[2], parts[3] == 'debug'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for tool in TOOLS:
        parser.add_argument(f'--{tool}', required=True)
    parser.add_argument('--case', action='append', type=parse_case,
                        required=True,
                        help='NAME:ELF:fp|omit:debug|nodebug')
    args = parser.parse_args()
    verifier = Verifier({tool: getattr(args, tool.replace('-', '_'))
                         for tool in TOOLS})
    for name, elf, frame_style, debug in args.case:
        stats = verifier.verify_case(name, elf, frame_style, debug)
        print(f'{name}: FDEs={stats["fdes"]} rows={stats["rows"]} '
              f'verified_rows={stats["verified_rows"]} '
              f'sp_rows={stats["sp_rows"]} r3_rows={stats["r3_rows"]} '
              f'checks={stats["checks"]} sp_checks={stats["sp_checks"]} '
              f'r3_checks={stats["r3_checks"]} '
              f'dynamic_checks={stats["dynamic_checks"]} '
              f'r3_dynamic_checks={stats["r3_dynamic_checks"]} '
              f'returns={stats["returns"]} tail_jumps={stats["tail_jumps"]}')
    if verifier.errors:
        for message in verifier.errors:
            print(f'error: {message}', file=sys.stderr)
        return 1
    print('unwind CFI verification passed')
    return 0


if __name__ == '__main__':
    sys.exit(main())
