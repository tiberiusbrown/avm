#!/usr/bin/env python3
"""Generates seed IR for fuzzing the AVM code generator.

Each module defines one function, `test`, that keeps several values of mixed
width live across calls and passes words of those values as arguments. That is
the shape that exhausts the eight AVM registers: call argument setup occupies
r4-r7 while the live 24- and 32-bit values sit in spilled pairs. The output is
a starting corpus for llvm-isel-fuzzer, and it is also useful on its own:

  fuzz_seed_ir.py 42 > test.ll        straight-line function
  fuzz_seed_ir.py 42 --flow > test.ll adds diamonds and loops
  llc -mtriple=avm -O2 -verify-machineinstrs test.ll -o /dev/null

The same seed always produces the same module.
"""

import argparse
import random
import sys

HEADER = (
    'target datalayout = "e-m:e-p:16:8-p1:24:8-i8:8-i16:8-i32:8-i64:8-f16:8-'
    'f32:8-n8:16-S8-P1-G0-A0"\n'
    'target triple = "avm-unknown-arduboyfx"\n\n'
)
BITS = {"i1": 1, "i8": 8, "i16": 16, "i24": 24, "i32": 32, "i64": 64,
        "float": 32}
INT_TYPES = ["i16", "i24", "i32", "i64"]
VALUE_TYPES = INT_TYPES + ["float"]
PARAM_TYPES = ["i8", "i16", "i16", "i24", "i32", "i32", "i64", "float"]
RETURN_TYPES = ["void", "i16", "i24", "i32", "i64", "float"]
OBJECT_BYTES = {"i16": 2, "i24": 3, "i32": 4, "i64": 8, "float": 4}


class Generator:
    def __init__(self, seed, flow):
        self.rng = random.Random(seed)
        self.flow = flow
        self.counter = 0
        self.labels = 0
        self.calls = 0
        self.lines = []
        self.pool = []  # (name, type) of the values visible at this point
        self.declarations = {}
        self.block = "entry"

    # Names and output ---------------------------------------------------

    def temp(self):
        self.counter += 1
        return "%%t%d" % self.counter

    def label(self, prefix):
        self.labels += 1
        return "%s%d" % (prefix, self.labels)

    def emit(self, text):
        self.lines.append("  " + text)

    def declare_source(self, ty):
        self.declarations["src_" + ty] = (
            "declare %s @src_%s() addrspace(1)" % (ty, ty))

    # Values -------------------------------------------------------------

    def convert(self, name, ty, want):
        """Return `name` converted from `ty` to `want`, shifting a random
        word down first when narrowing so that the high words are used."""
        if ty == want:
            return name
        if ty == "float":
            bits = self.temp()
            self.emit("%s = bitcast float %s to i32" % (bits, name))
            return self.convert(bits, "i32", want)
        if want == "float":
            word = self.convert(name, ty, "i32")
            result = self.temp()
            self.emit("%s = bitcast i32 %s to float" % (result, word))
            return result
        have_bits, want_bits = BITS[ty], BITS[want]
        if have_bits > want_bits:
            spare = have_bits - want_bits
            if self.rng.random() < 0.7 and spare >= 8:
                shift = self.rng.choice(
                    [s for s in (8, 16, 24, 32, 48) if s <= spare] or [8])
                shifted = self.temp()
                self.emit("%s = lshr %s %s, %d" % (shifted, ty, name, shift))
                name = shifted
            result = self.temp()
            self.emit("%s = trunc %s %s to %s" % (result, ty, name, want))
            return result
        result = self.temp()
        kind = "sext" if self.rng.random() < 0.25 else "zext"
        self.emit("%s = %s %s %s to %s" % (result, kind, ty, name, want))
        return result

    def pick(self, types=None):
        candidates = [v for v in self.pool if types is None or v[1] in types]
        if candidates:
            return self.rng.choice(candidates)
        return self.new_value(self.rng.choice(types or INT_TYPES))

    def new_value(self, ty):
        result = self.temp()
        roll = self.rng.random()
        if roll < 0.45 or len(self.pool) < 2:
            self.declare_source(ty)
            self.emit("%s = call addrspace(1) %s @src_%s()" % (result, ty, ty))
        elif roll < 0.6 and ty != "float":
            name, have = self.pick()
            value = self.convert(name, have, ty)
            self.emit("%s = add %s %s, %d"
                      % (result, ty, value, self.rng.randrange(1, 200)))
        elif roll < 0.7:
            # An aggregate read back from a stack object is a three- or
            # four-byte load of the object another call just filled in.
            obj = self.temp()
            self.emit("%s = alloca [%d x i8], align 1"
                      % (obj, OBJECT_BYTES[ty]))
            self.declarations["fill"] = "declare void @fill(ptr) addrspace(1)"
            self.emit("call addrspace(1) void @fill(ptr nonnull %s)" % obj)
            self.emit("%s = load %s, ptr %s, align 1" % (result, ty, obj))
        else:
            a, a_ty = self.pick()
            b, b_ty = self.pick()
            a = self.convert(a, a_ty, ty)
            b = self.convert(b, b_ty, ty)
            if ty == "float":
                op = self.rng.choice(["fadd", "fsub", "fmul"])
            else:
                op = self.rng.choice(["add", "xor", "or", "and", "sub"])
            self.emit("%s = %s %s %s, %s" % (result, op, ty, a, b))
        self.pool.append((result, ty))
        return (result, ty)

    def make_call(self):
        self.calls += 1
        params, args = [], []
        for _ in range(self.rng.choice([0, 1, 1, 2, 3, 4, 5, 6])):
            ty = self.rng.choice(PARAM_TYPES)
            name, have = self.pick()
            params.append(ty)
            args.append((self.convert(name, have, ty), ty))
        ret = self.rng.choice(RETURN_TYPES)
        attrs = self.rng.choice(["", " nounwind", " nounwind memory(none)"])
        callee = "f%d" % self.calls
        param_text = ", ".join("i8 zeroext" if p == "i8" else p
                               for p in params)
        self.declarations[callee] = "declare %s @%s(%s) addrspace(1)%s" % (
            ret, callee, param_text, attrs)
        arg_text = ", ".join(
            ("i8 zeroext %s" if ty == "i8" else ty + " %s") % name
            for name, ty in args)
        if ret == "void":
            self.emit("call addrspace(1) void @%s(%s)" % (callee, arg_text))
        else:
            result = self.temp()
            self.emit("%s = call addrspace(1) %s @%s(%s)"
                      % (result, ret, callee, arg_text))
            self.pool.append((result, ret))

    # Control flow -------------------------------------------------------

    def straight(self):
        for _ in range(self.rng.randrange(1, 4)):
            if self.rng.random() < 0.4:
                self.new_value(self.rng.choice(VALUE_TYPES))
            self.make_call()

    def condition(self):
        name, ty = self.pick(["i16", "i24", "i32"])
        word = self.convert(name, ty, "i16")
        flag = self.temp()
        self.emit("%s = icmp ne i16 %s, 0" % (flag, word))
        return flag

    def diamond(self, depth):
        flag = self.condition()
        left, right, merge = (self.label("a"), self.label("b"),
                              self.label("m"))
        before = list(self.pool)
        self.emit("br i1 %s, label %%%s, label %%%s" % (flag, left, right))
        arms = []
        for label in (left, right):
            self.lines.append("%s:" % label)
            self.block = label
            self.pool = list(before)
            self.segment(depth + 1)
            arms.append((self.block, list(self.pool)))
            self.emit("br label %%%s" % merge)
        self.lines.append("%s:" % merge)
        self.block = merge
        # Only values of a type that both arms defined are merged by a phi.
        self.pool = list(before)
        defined = {}
        for end, pool in arms:
            for name, ty in pool[len(before):]:
                defined.setdefault(ty, {})[end] = name
        for ty, per_arm in defined.items():
            if len(per_arm) == 2:
                (end_a, name_a), (end_b, name_b) = per_arm.items()
                result = self.temp()
                self.emit("%s = phi %s [ %s, %%%s ], [ %s, %%%s ]"
                          % (result, ty, name_a, end_a, name_b, end_b))
                self.pool.append((result, ty))

    def loop(self, depth):
        entry = self.block
        head, body, done = (self.label("lh"), self.label("lb"),
                            self.label("ld"))
        counter_ty = self.rng.choice(["i16", "i24", "i32"])
        carried_ty = self.rng.choice(INT_TYPES)
        start, start_ty = self.pick(INT_TYPES)
        start = self.convert(start, start_ty, carried_ty)
        self.emit("br label %%%s" % head)
        self.lines.append("%s:" % head)
        counter, carried = self.temp(), self.temp()
        next_counter, next_carried = self.temp(), self.temp()
        # The phis refer to values defined later; fill them in afterwards.
        phi_at = len(self.lines)
        self.lines.extend([None, None])
        before = list(self.pool)
        self.pool.append((carried, carried_ty))
        self.block = head
        test = self.temp()
        self.emit("%s = icmp ult %s %s, %d"
                  % (test, counter_ty, counter, self.rng.randrange(2, 9)))
        self.emit("br i1 %s, label %%%s, label %%%s" % (test, body, done))
        self.lines.append("%s:" % body)
        self.block = body
        self.straight()
        name, ty = self.pick()
        update = self.convert(name, ty, carried_ty)
        self.emit("%s = add %s %s, %s"
                  % (next_carried, carried_ty, carried, update))
        self.emit("%s = add %s %s, 1" % (next_counter, counter_ty, counter))
        self.emit("br label %%%s" % head)
        self.lines[phi_at] = "  %s = phi %s [ 0, %%%s ], [ %s, %%%s ]" % (
            counter, counter_ty, entry, next_counter, self.block)
        self.lines[phi_at + 1] = "  %s = phi %s [ %s, %%%s ], [ %s, %%%s ]" % (
            carried, carried_ty, start, entry, next_carried, self.block)
        self.lines.append("%s:" % done)
        self.block = done
        self.pool = before + [(carried, carried_ty)]

    def segment(self, depth):
        for _ in range(self.rng.randrange(1, 3)):
            roll = self.rng.random()
            if self.flow and depth < 2 and roll < 0.25:
                self.diamond(depth)
            elif self.flow and depth < 2 and roll < 0.45:
                self.loop(depth)
            else:
                self.straight()

    # Module -------------------------------------------------------------

    def build(self):
        for _ in range(self.rng.randrange(2, 5)):
            self.new_value(self.rng.choice(VALUE_TYPES))
        self.segment(0)
        # Keep every value live to the end by folding them into the result.
        folded = None
        for name, ty in self.pool:
            word = self.convert(name, ty, "i32")
            if folded is None:
                folded = word
            else:
                mixed = self.temp()
                self.emit("%s = xor i32 %s, %s" % (mixed, folded, word))
                folded = mixed
        flag = self.temp()
        self.emit("%s = icmp ne i32 %s, 0" % (flag, folded))
        self.emit("ret i1 %s" % flag)

    def render(self):
        attrs = self.rng.choice(["", " optsize", " minsize"])
        out = [HEADER]
        out.extend(text + "\n" for text in self.declarations.values())
        out.append("\ndefine i1 @test() addrspace(1) noinline nounwind%s {\n"
                   % attrs)
        out.append("entry:\n")
        out.extend(line + "\n" for line in self.lines)
        out.append("}\n")
        return "".join(out)


def generate(seed, flow=False):
    """Returns the text of a module for `seed`."""
    generator = Generator(seed, flow)
    generator.build()
    return generator.render()


def main():
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("seed", type=int)
    parser.add_argument("--flow", action="store_true",
                        help="add diamonds and loops")
    args = parser.parse_args()
    sys.stdout.write(generate(args.seed, args.flow))


if __name__ == "__main__":
    main()
