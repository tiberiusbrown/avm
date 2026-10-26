"""Build and measure one generated math candidate with the existing tools.

Run from an initialized matching compiler environment. This never invokes a
build backend directly. Results and generated disassemblies are retained under
--output; source coefficients are saved for A/B comparisons.
"""
import argparse
import hashlib
import json
import os
import re
from collections import Counter
from pathlib import Path
import shutil
import subprocess
import sys

ROOT=Path(__file__).resolve().parents[2]

def executable(path):
    return str(path)+('.exe' if os.name=='nt' else '')

def call(command,log, allow_rejection=False):
    with log.open('w') as f:
        p=subprocess.run([str(x) for x in command],cwd=ROOT,stdout=f,stderr=subprocess.STDOUT)
    if p.returncode and not (allow_rejection and p.returncode==1): raise RuntimeError(f'{command[0]} failed; see {log}')

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--build',type=Path,default=Path('build'))
    p.add_argument('--label',required=True); p.add_argument('--output',type=Path,default=Path('build/math-policy'))
    p.add_argument('--sqrt-exhaustive',action='store_true'); p.add_argument('--stack',action='store_true')
    p.add_argument('--functions',nargs='+',default=['sqrtf','expf','logf','log2f','log10f','hypotf','powf'])
    args=p.parse_args()
    build=(ROOT/args.build).resolve(); dest=(ROOT/args.output/args.label).resolve()
    dest.mkdir(parents=True,exist_ok=True)
    call(['cmake','--build',build,'--config','RelWithDebInfo','--target','avm_math_bench_images','avm_math_accuracy_probe','avm_math_reference_tests','--parallel','8'],dest/'build.log')
    sources=dest/'sources'; sources.mkdir(exist_ok=True)
    for f in (ROOT/'bench/c').glob('math_*.c'): shutil.copyfile(f,sources/f.name)
    command=[executable(build/'avm_bench'),'--c-only','--c-source-dir',sources,'--c-output',dest/'cycles.txt']
    if args.stack: command+=['--stack-output',dest/'stack.tsv']
    call(command,dest/'bench.log')
    functions=args.functions
    call([sys.executable,ROOT/'tests/math/accuracy_reference.py','--probe',executable(build/'tests/avm_math_accuracy_probe'),'--output',dest/'accuracy.json','--samples','1000','--functions',*functions],dest/'accuracy.log',allow_rejection=True)
    if args.sqrt_exhaustive: call([executable(build/'tests/avm_math_reference_tests')],dest/'sqrt.txt',allow_rejection=True)
    for f in ['exp_poly.h','log_poly.h','sqrt_table.h','trig_poly.h','atan_poly.h','pow_log_poly.h','pow_boundary.h','exp2_kernel.h']:
        if (ROOT/'runtime/lib/math'/f).exists(): shutil.copyfile(ROOT/'runtime/lib/math'/f,dest/f)
    for f in ['ef_exp.c','ef_sqrt.c','log_kernel.h','ef_log.c','ef_log10.c','ef_pow.c','ef_hypot.c',
              'sin_kernel.h','cos_kernel.h','tan_kernel.h','atan_kernel.h','ef_atan2.c','sf_sincos.c']:
        if (ROOT/'runtime/lib/math'/f).exists(): shutil.copyfile(ROOT/'runtime/lib/math'/f,dest/f)
    shutil.copyfile(ROOT/'runtime/lib/math.c',dest/'math.c')
    disasm=dest/'asm'; disasm.mkdir(exist_ok=True)
    for f in (ROOT/'bench/c/asm').glob('math_*.asm'): shutil.copyfile(f,disasm/f.name)
    sizes={f.stem: f.stat().st_size for f in (build/'bench/c').glob('math_*.bin')}
    objects=['math_ef_sqrt','math_ef_exp','math_ef_log','math','math_ef_log10','math_ef_hypot','math_ef_pow',
             'math_sf_sin','math_sf_cos','math_sf_tan','math_sf_atan','math_ef_atan2']
    if (build/'runtime/objects/math_sf_sincos.o').exists(): objects.append('math_sf_sincos')
    nm=executable(build/'llvm-build/bin/llvm-nm')
    symbols={}
    instruction_counts={}
    for o in objects:
        obj=build/'runtime/objects'/f'{o}.o'
        symbols[o]=dict(defined=subprocess.check_output([str(nm),'-S','--defined-only',str(obj)],text=True),
                        undefined=subprocess.check_output([str(nm),'-u',str(obj)],text=True))
        asm=subprocess.check_output([executable(build/'llvm-build/bin/llvm-objdump'),'-dr',str(obj)],text=True)
        instruction_counts[o]=dict(Counter(re.findall(r'\b(fdiv|fmul|fadd|fsub|fpoly|ldsp16|stsp16|call8|call16)\s',asm)))
    interp=ROOT/'interp/build/interp.hex'
    resources=dict(image_bytes=sizes,symbols=symbols,instruction_counts=instruction_counts,interpreter_sha256=hashlib.sha256(interp.read_bytes()).hexdigest())
    (dest/'resources.json').write_text(json.dumps(resources,indent=2)+'\n', encoding='utf-8')
    print(args.label, 'completed',flush=True)

if __name__=='__main__': main()
