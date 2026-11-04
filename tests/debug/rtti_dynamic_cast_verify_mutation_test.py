#!/usr/bin/env python3
"""Checks that the dynamic_cast verifier rejects deliberately wrong cast data.

The test captures the probe's entries and returns for one real image, and it confirms that the
unmodified data verifies. It then applies one mutation at a time to a copy of one cast, and it
requires the verifier to fail for every mutation. The guest runtime is never modified. Each
mutation changes only the data that the verifier reads, so the emulator still runs the real image.

The mutations are:

  1. a nonzero result that is not the oracle's address;
  2. a zero result where the oracle expects a nonzero address;
  3. a nonzero result where ambiguity requires null;
  4. a destination descriptor for another class, chosen so that the expected result changes;
  5. stack arguments truncated to four bytes;
  6. a virtual base whose containing subobject's vptr lies outside the captured RAM;
  7. a virtual-base displacement that differs from the packed image;
  8. a return event that names another return address;
  9. a source subobject that the active vptr's hierarchy does not hold at its actual address,
     with a valid vptr, a valid RTTI descriptor, and a valid offset-to-top. The rejection must be
     the absence error, so the retired alternate-root path cannot make the data pass.

Each mutation must raise the verifier's failure. If a mutation is not detected, the test fails.
"""

import argparse
import copy
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_rtti_verify as rtti  # noqa: E402
import rtti_dynamic_cast_verify as rdcv  # noqa: E402


class PatchedImage:
    """A view of the packed image with some bytes replaced. Only the verifier reads the view."""

    def __init__(self, base, patches):
        self.base = base
        self.patches = patches

    def read(self, address, count):
        data = bytearray(self.base.read(address, count))
        for i in range(count):
            if address + i in self.patches:
                data[i] = self.patches[address + i]
        return bytes(data)

    def cstring(self, address):
        return self.base.cstring(address)


def classify(elf, image, entry, ret):
    context = rdcv.Context(elf, image)
    context.ram = entry['ram']
    return rdcv.classify_cast(context, entry, ret)


def run_mutation(label, call, results):
    try:
        call()
    except rdcv.Failure as error:
        results.append((label, True, str(error)))
        return
    results.append((label, False, 'the verifier accepted the mutated data'))


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    args = parser.parse_args()

    elf = rtti.Elf(args.elf)
    image = rtti.Image(args.image)
    args.elf_symbols = elf.symbols
    args.objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    try:
        helpers, returns, events = rdcv.capture(args)
        pairs = rdcv.pair_entries(events, rdcv.CLASS_CAST, returns)
        records = rdcv.verify_casts(rdcv.Context(elf, image), events, returns)
        check(len(records) == len(pairs) and len(records) > 0,
              'the baseline has no class casts to mutate')

        # The baseline must verify before any mutation is judged.
        indices = {
            'nonzero': next((i for i, r in enumerate(records)
                             if r['expected'] != 0), None),
            'null': next((i for i, r in enumerate(records)
                          if r['expected'] == 0 and not r['ambiguous']), None),
            'ambiguous': next((i for i, r in enumerate(records) if r['ambiguous']), None),
            'virtual': next((i for i, r in enumerate(records)
                             if r['virtual_edge'] is not None), None),
        }
        missing = [name for name, index in indices.items() if index is None]
        if missing:
            raise rdcv.Failure('the image lacks a cast of kind: %s' % ', '.join(missing))

        results = []
        entry, ret = pairs[indices['nonzero']]
        expected = records[indices['nonzero']]['expected']

        def with_result(value, source=ret):
            clone = copy.deepcopy(source)
            clone['regs'][4] = value
            return clone

        run_mutation('1 nonzero result that is not the oracle address',
                     lambda: classify(elf, image, entry, with_result(expected + 2)), results)
        run_mutation('2 zero result for a valid cast',
                     lambda: classify(elf, image, entry, with_result(0)), results)
        amb_entry, amb_ret = pairs[indices['ambiguous']]
        run_mutation('3 nonzero result where ambiguity requires null',
                     lambda: classify(elf, image, amb_entry,
                                      with_result(amb_entry['regs'][4], amb_ret)), results)

        # 4. A destination descriptor for another class, with a different expected result.
        original_dst = records[indices['nonzero']]['dst_type_address']
        wrong_dst = None
        for name in sorted(elf.symbols):
            if not name.startswith('_ZTI'):
                continue
            for symbol in elf.symbols[name]:
                candidate = symbol['value']
                if candidate == original_dst or candidate < rdcv.WINDOW_START:
                    continue
                mutated = copy.deepcopy(entry)
                mutated['stackargs'] = (bytes([candidate & 0xff, (candidate >> 8) & 0xff,
                                               candidate >> 16]) + entry['stackargs'][3:])
                try:
                    classify(elf, image, mutated, ret)
                except rdcv.Failure as error:
                    if 'oracle expects' in str(error):
                        wrong_dst = (name, str(error))
                        break
            if wrong_dst is not None:
                break
        results.append(('4 destination descriptor for another class',
                        wrong_dst is not None,
                        wrong_dst[1] if wrong_dst else 'no class changes the expected result'))

        truncated = copy.deepcopy(entry)
        truncated['stackargs'] = entry['stackargs'][:4]
        run_mutation('5 stack arguments truncated to four bytes',
                     lambda: classify(elf, image, truncated, ret), results)

        virt_entry, virt_ret = pairs[indices['virtual']]
        virt = records[indices['virtual']]
        edge = virt['virtual_edge']
        containing = edge['containing'][1]
        short_ram = virt_entry['ram'][:containing - rdcv.RAM_START]

        def missing_vptr():
            context = rdcv.Context(elf, image)
            context.ram = short_ram
            rdcv.enumerate_graph(context, virt['dynamic_type'], virt['complete'])

        run_mutation('6 virtual-base vptr outside the captured RAM', missing_vptr, results)

        slot = edge['detail']['slot']
        shifted = (edge['detail']['displacement'] + 2) & 0xffffff
        patches = {slot: shifted & 0xff, slot + 1: (shifted >> 8) & 0xff,
                   slot + 2: (shifted >> 16) & 0xff}
        run_mutation('7 virtual-base displacement that differs from the image',
                     lambda: classify(elf, PatchedImage(image, patches), virt_entry, virt_ret),
                     results)

        # 8. The return snapshot of this cast names another address, so the pairing must fail.
        def wrong_return():
            renamed = []
            done = False
            for event in events:
                if not done and event['name'] == '0x%06x' % virt_entry['record']:
                    other = dict(event)
                    other['name'] = '0x%06x' % (virt_entry['record'] + 3)
                    renamed.append(other)
                    done = True
                else:
                    renamed.append(event)
            rdcv.pair_entries(renamed, rdcv.CLASS_CAST, returns | {virt_entry['record'] + 3})

        run_mutation('8 return event that names another address', wrong_return, results)

        # 9. The source's vptr and RTTI decode, and the offset-to-top decodes to a valid address,
        # but the complete object it names does not hold the source at its actual address. The
        # rejection must be the absence error itself, so that no other check rejects the data.
        secondary = next((i for i, r in enumerate(records) if r['secondary']), None)
        check(secondary is not None, 'the image has no cast from a secondary subobject')
        sec_entry, sec_ret = pairs[secondary]
        sec = records[secondary]
        top_slot = sec['vptr'] - rdcv.ADDRESS_POINT
        absent = None
        for delta in (1, -1, 2, -2, 3, -3, 4, -4, 6, -6, 8, -8):
            value = (sec['offset'] + delta) & 0xffffff
            patches = {top_slot + i: (value >> (8 * i)) & 0xff for i in range(3)}
            try:
                classify(elf, PatchedImage(image, patches), sec_entry, sec_ret)
            except rdcv.Failure as error:
                if 'is absent from the hierarchy' in str(error):
                    absent = (delta, str(error))
                    break
        results.append(('9 source absent from the hierarchy of the active vptr',
                        absent is not None,
                        absent[1] if absent else 'no offset change left the source absent'))

        failed = [r for r in results if not r[1]]
        for label, caught, message in results:
            status = 'rejected' if caught else 'NOT DETECTED'
            print('  %s: %s (%s)' % (label, status, message.split('\n')[0][:160]))
        print('rtti_dynamic_cast_verify_mutation_test: %d of %d mutations rejected; the baseline '
              'verified %d class casts' % (len(results) - len(failed), len(results), len(records)))
        return 0 if not failed and len(results) == 9 else 1
    except rdcv.Failure as error:
        print('rtti_dynamic_cast_verify_mutation_test: FAIL: %s' % error, file=sys.stderr)
        return 1


def check(condition, message):
    if not condition:
        raise rdcv.Failure(message)


if __name__ == '__main__':
    sys.exit(main())
