"""Reproduce the measured one-factor-at-a-time math candidate matrix.

Initialize the matching compiler environment first. Save baseline artifacts
before replacing algorithms; this script only compares the new candidates.
The production source is restored even if a trial fails to build.
"""
import subprocess,sys
from pathlib import Path
root=Path(__file__).resolve().parents[2]
def run(*args):
    print('RUN',*args,flush=True)
    subprocess.run([sys.executable,*args],cwd=root,check=True)
run('tests/math/experiment.py','--save','build/math-policy/pre-matrix')
try:
    run('tests/math/experiment.py','--exp-degree','4','--exp-reduction','split','--log-degree','7','--sqrt-intervals','64','--sqrt-degree','2')
    run('tests/math/run_candidate.py','--label','exp4-log7-sqrt64','--sqrt-exhaustive')
    # One factor changes at a time. Every row runs the same real-AVR workloads.
    for n in [3,5,6]:
        run('tests/math/experiment.py','--exp-degree',str(n))
        run('tests/math/run_candidate.py','--label',f'exp{n}-log7-sqrt64')
    run('tests/math/experiment.py','--exp-degree','4','--horner')
    run('tests/math/run_candidate.py','--label','exp4-horner')
    run('tests/math/experiment.py','--exp-degree','4')
    for pieces in [1,2]:
        for degree in range(4,9):
            if pieces==1 and degree==7: continue
            run('tests/math/experiment.py','--log-degree',str(degree),'--log-pieces',str(pieces))
            run('tests/math/run_candidate.py','--label',f'log{degree}-pieces{pieces}')
    run('tests/math/experiment.py','--log-degree','5','--log-pieces','2','--near-one')
    run('tests/math/run_candidate.py','--label','log5-pieces2-near-one')
    run('tests/math/experiment.py','--log-degree','5','--log-pieces','2','--horner')
    run('tests/math/run_candidate.py','--label','log5-pieces2-horner')
    run('tests/math/experiment.py','--log-degree','7')
    for intervals,degree in [(16,2),(32,2),(512,1),(1024,1)]:
        run('tests/math/experiment.py','--sqrt-intervals',str(intervals),'--sqrt-degree',str(degree))
        run('tests/math/run_candidate.py','--label',f'sqrt{intervals}-degree{degree}','--sqrt-exhaustive')

    for n in [3,4,5,6]:
        run('tests/math/experiment.py','--exp-degree',str(n),'--exp-reduction','base2')
        run('tests/math/run_candidate.py','--label',f'exp2poly{n}')
    run('tests/math/experiment.py','--exp-degree','4','--exp-reduction','split')
    # One shared external log2 engine, compared with the inlined engine.
    files=[Path('runtime/lib/math/ef_log.c'),Path('runtime/lib/math/ef_log10.c')]
    saved=[p.read_text(encoding='utf-8') for p in files]
    try:
        files[0].write_text(saved[0].replace('avm_log_kernel(x)','log2f(x)*0x1.62e43p-1f'), encoding='utf-8')
        s=saved[1]; a=s.index('    uint32_t ix;'); files[1].write_text(s[:a]+'    return log2f(x)*0x1.344136p-2f;\n}\n', encoding='utf-8')
        run('tests/math/run_candidate.py','--label','log7-shared-call')
    finally:
        for p,s in zip(files,saved): p.write_text(s, encoding='utf-8')
    run('tests/math/experiment.py','--sqrt-intervals','256','--sqrt-degree','1')
    run('tests/math/run_candidate.py','--label','sqrt256-degree1','--sqrt-exhaustive')
finally:
    run('tests/math/experiment.py','--restore','build/math-policy/pre-matrix')
