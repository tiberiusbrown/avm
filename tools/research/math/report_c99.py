"""Summarize C99 accuracy/cycles/resources without regenerating documentation.

Run after the documented RelWithDebInfo validation commands. Output stays in
the build directory; copy the reviewed Markdown table into the math README.
"""
import argparse
import json
from pathlib import Path
import re
import subprocess
import os

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--build',type=Path,default=Path('build'))
    p.add_argument('--output',type=Path,default=Path('build/c99-measurements.md'))
    args=p.parse_args()
    root=args.build
    measured=json.loads((root/'tests/c99-accuracy.json').read_text())['functions']
    full=root/'tests/math-accuracy.json'
    additional=json.loads(full.read_text())['functions'] if full.exists() else {}
    host={}
    for line in (root/'c99-reference.log').read_text().splitlines():
        m=re.match(r'(\w+) count=(\d+) abs=(\S+) at (\w+) rel=(\S+) at (\w+) ULP=(\d+) at (\w+)',line)
        if m: host[m[1]]=m.groups()
    if any(s['failures'] for s in [*measured.values(),*additional.values()]) or 'C99 failures=0' not in (root/'c99-reference.log').read_text():
        raise SystemExit('Accuracy failures must be resolved before publishing measurements')
    count=max(int(h[1]) for h in host.values())
    lines=['Measured maxima across the 100-digit deterministic/adaptive corpora and',
           f'the independent dense host sweep ({count:,} inputs per function). Relative',
           'error excludes subnormal results; absolute error includes the full finite range.',
           '', '| Function | Max absolute | Max relative | Max ULP | Worst abs / relative / ULP input bits |',
           '| --- | ---: | ---: | ---: | --- |']
    names=['exp2f','expm1f','log1pf','cbrtf','asinf','acosf']
    for n in names:
        s=measured[n]
        values=[s['max_absolute'],s['max_relative_normal'],s['max_ulp']]
        worst=[s['worst_absolute'][0],s['worst_relative'][0],s['worst_ulp'][0]]
        if n in additional:
            other=additional[n]
            for i,(key,w) in enumerate([('max_absolute','worst_absolute'),('max_relative_normal','worst_relative'),('max_ulp','worst_ulp')]):
                if other[key]>values[i]: values[i]=other[key]; worst[i]=other[w][0]
        h=host[n]
        for i,(v,w) in enumerate([(float(h[2]),h[3]),(float(h[4]),h[5]),(int(h[6]),h[7])]):
            if v>values[i]: values[i]=v; worst[i]=w
        lines += [f'| `{n}` | {values[0]:.6g} | {values[1]:.6g} | {int(values[2])} | '+ ' / '.join(f'`{u}`' for u in worst)+' |']
    cycles={name.removesuffix('.c'):int(c) for c,name in re.findall(r'^\s*(\d+)\s+(\w+\.c)$',(root/'c99-cycles.txt').read_text(),re.M)}
    stack={line.split('\t')[0]:line.split('\t')[1] for line in (root/'c99-stack.tsv').read_text().splitlines()[1:]}
    objects=['ef_exp2','ef_expm1','ef_log1p','ef_cbrt','ef_asin','ef_acos','sf_decompose']
    sizes={}
    nm=root/'llvm-build/bin'/('llvm-nm.exe' if os.name=='nt' else 'llvm-nm')
    for obj in objects:
        output=subprocess.check_output([str(nm),'-S','--defined-only',str(root/'runtime/objects'/f'math_{obj}.o')],text=True)
        sizes.update({name:int(size,16) for size,name in re.findall(r'^\w+\s+(\w+)\s+T\s+(\w+)$',output,re.M)})
    lines+=['', 'O2 callers, O3 runtime kernels, 32 calls per benchmark. Cycles include the',
            'input lookup, loop, and volatile sink; the 35-cycle DEBUG_BREAK baseline',
            'is subtracted. Code bytes are unrelaxed function sections, excluding shared',
            'callees. Stack is the measured guest maximum including the benchmark caller.',
            '', '| Function | Cycles / 32 calls | Function bytes | Guest stack bytes |',
            '| --- | ---: | ---: | ---: |']
    for n in names+['ldexpf','frexpf','modff','nextafterf']:
        bench='math_'+n[:-1]
        lines += [f'| `{n}` | {cycles[bench]:,} | {sizes[n]} | {stack[bench]} |']
    lines += [f'| Classification/comparisons workload | {cycles["math_classify"]:,} | inline | {stack["math_classify"]} |','']
    args.output.write_text('\n'.join(lines),encoding='utf-8')
    print(args.output)

if __name__=='__main__': main()
