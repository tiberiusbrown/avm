"""Decode the byte layout shared with the target exception runtime."""

from pathlib import Path
import re

_header = Path(__file__).resolve().parents[2] / 'runtime/lib/eh_unwind_layout.h'
for _name, _value in re.findall(r'^#define AVM_EH_(\w+) (0x[0-9a-fA-F]+|\d+)\s*$',
                                _header.read_text(), re.MULTILINE):
    globals()[_name] = int(_value, 0)


def u16(data, offset):
    return int.from_bytes(data[offset:offset + 2], 'little')


def u24(data, offset):
    return int.from_bytes(data[offset:offset + 3], 'little')


def context_sp(data, offset=0):
    return STACK_TOP - data[offset + CONTEXT_SP_OFFSET]


def context_pc(data, offset=0):
    return u24(data, offset + CONTEXT_PC_OFFSET)


def state(data):
    return data[STATE_OFFSET]


def conversion_mode(data):
    return data[CONVERSION_OFFSET]
